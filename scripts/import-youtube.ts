#!/usr/bin/env tsx
/**
 * import-youtube.ts
 *
 * Discover YouTube videos for spots that don't yet have a related
 * video, using YouTube Data API v3.
 *
 * Cost model (YouTube quota):
 * - search.list = 100 units per call
 * - Default daily quota = 10,000 units => max 100 spots per day
 *
 * The script:
 * - Picks N published spots that have ZERO published videos
 * - For each, calls search.list with q = "<spot name> 心霊"
 * - Takes the top R results, filters by editorial safety list
 *   (no titles claiming incidents / personal info)
 * - Inserts them into spot_videos with status=pending_review and
 *   source_type='youtube-data-api' (admin must approve before they
 *   show on the public site).
 *
 * Required env:
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY
 *   YOUTUBE_API_KEY
 *
 * Optional env:
 *   YT_SPOT_LIMIT       (default 30)   how many spots to process
 *   YT_RESULTS_PER_SPOT (default 3)    how many videos per spot
 *   YT_DRY_RUN          (default true) when true, only logs
 */

import { existsSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

function loadEnv(path: string) {
  if (!existsSync(path)) return;
  for (const line of readFileSync(path, 'utf-8').split('\n')) {
    const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/i);
    if (!m) continue;
    if (process.env[m[1]] === undefined) {
      process.env[m[1]] = m[2].replace(/^['"]|['"]$/g, '');
    }
  }
}
loadEnv(join(process.cwd(), '.env.local'));
loadEnv(join(process.cwd(), '.env'));

import { createClient } from '@supabase/supabase-js';
import type { Database } from '../src/types/database';

const TITLE_BLACKLIST: RegExp[] = [
  /殺人|殺害|自殺|他殺|心中|焼死|轢死|溺死|餓死|縊死|絞殺/,
  /遺体|死体|死亡|死者/,
  /投身|飛び?降り|身投げ/,
  /虐待|誘拐|拉致|監禁/,
  /被害者|加害者|容疑者/,
  /号室|バラバラ/,
  /AV|アダルト|エロ|性的/i,
];

function isSafeTitle(t: string): boolean {
  for (const p of TITLE_BLACKLIST) if (p.test(t)) return false;
  return true;
}

type YtSearchItem = {
  id?: { kind?: string; videoId?: string };
  snippet?: { title?: string; channelTitle?: string };
};
type YtSearchResp = { items?: YtSearchItem[] };

async function ytSearch(query: string, apiKey: string, max = 3): Promise<YtSearchItem[]> {
  const u = new URL('https://www.googleapis.com/youtube/v3/search');
  u.searchParams.set('part', 'snippet');
  u.searchParams.set('q', query);
  u.searchParams.set('type', 'video');
  u.searchParams.set('maxResults', String(Math.max(1, Math.min(10, max))));
  u.searchParams.set('relevanceLanguage', 'ja');
  u.searchParams.set('safeSearch', 'moderate');
  u.searchParams.set('videoEmbeddable', 'true');
  u.searchParams.set('key', apiKey);
  const res = await fetch(u.toString());
  if (!res.ok) {
    const body = await res.text().catch(() => '');
    throw new Error(`YouTube ${res.status}: ${body.slice(0, 200)}`);
  }
  const json = (await res.json()) as YtSearchResp;
  return json.items ?? [];
}

async function main() {
  const DRY_RUN = (process.env.YT_DRY_RUN ?? 'true').toLowerCase() !== 'false';
  const SPOT_LIMIT = Number(process.env.YT_SPOT_LIMIT ?? '30');
  const PER_SPOT = Number(process.env.YT_RESULTS_PER_SPOT ?? '3');

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const apiKey = process.env.YOUTUBE_API_KEY;

  console.log('= shinrei import-youtube =');
  console.log(`  DRY_RUN=${DRY_RUN}`);
  console.log(`  YT_SPOT_LIMIT=${SPOT_LIMIT}`);
  console.log(`  YT_RESULTS_PER_SPOT=${PER_SPOT}`);

  if (!url || !serviceKey || !apiKey) {
    console.error(
      'Missing env. Need NEXT_PUBLIC_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, YOUTUBE_API_KEY.',
    );
    process.exit(1);
  }

  const supabase = createClient<Database>(url, serviceKey, {
    auth: { persistSession: false },
  });

  const { data: vids } = await supabase
    .from('spot_videos')
    .select('spot_id')
    .limit(50000);
  const skipIds = new Set((vids ?? []).map((v) => v.spot_id));

  const { data: spots } = await supabase
    .from('spots')
    .select('id, name, prefecture, slug')
    .eq('status', 'published')
    .eq('country_slug', 'japan')
    .order('review_count', { ascending: false })
    .order('scary_score', { ascending: false })
    .limit(Math.max(SPOT_LIMIT * 4, 100));

  const targets = (spots ?? [])
    .filter((s) => !skipIds.has(s.id))
    .slice(0, SPOT_LIMIT);
  console.log(`  candidates: ${targets.length}\n`);

  let inserted = 0;
  let skipped = 0;
  let apiCalls = 0;

  for (const spot of targets) {
    apiCalls++;
    const query = `${spot.name} 心霊`;
    let items: YtSearchItem[];
    try {
      items = await ytSearch(query, apiKey, PER_SPOT);
    } catch (e) {
      console.error(`  ! ${spot.name}: ${(e as Error).message}`);
      if (/quota|rate/i.test((e as Error).message)) break;
      continue;
    }
    const usable = items.filter((it) => {
      const id = it.id?.videoId;
      const title = it.snippet?.title ?? '';
      if (!id) return false;
      if (!isSafeTitle(title)) return false;
      return true;
    });
    if (usable.length === 0) {
      console.log(`  · ${spot.name}: no safe results`);
      skipped++;
      await new Promise((r) => setTimeout(r, 200));
      continue;
    }
    if (DRY_RUN) {
      console.log(`  [dry] ${spot.name}`);
      usable.forEach((it) => {
        console.log(`        → ${it.id?.videoId} :: ${it.snippet?.title}`);
      });
    } else {
      for (const it of usable) {
        const videoId = it.id!.videoId!;
        const title = it.snippet?.title ?? null;
        const videoUrl = `https://www.youtube.com/watch?v=${videoId}`;
        const embedUrl = `https://www.youtube-nocookie.com/embed/${videoId}`;
        const { error } = await supabase.from('spot_videos').insert({
          spot_id: spot.id,
          platform: 'youtube',
          video_url: videoUrl,
          embed_url: embedUrl,
          title,
          status: 'pending_review',
          source_type: 'youtube-data-api',
          moderation_note: `auto-discovered for "${query}"`,
        });
        if (error) {
          console.error(`    ✗ insert failed for ${videoId}: ${error.message}`);
          continue;
        }
        inserted++;
      }
      console.log(`  ✓ ${spot.name}: +${usable.length}`);
    }
    await new Promise((r) => setTimeout(r, 250));
  }

  console.log('');
  console.log(`API calls: ${apiCalls} (≈${apiCalls * 100} quota units)`);
  console.log(`Inserted:  ${inserted}  Skipped: ${skipped}`);
  console.log(
    DRY_RUN
      ? 'DRY_RUN was true. Set YT_DRY_RUN=false to write to Supabase.'
      : 'Approve videos in /admin/videos.',
  );
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
