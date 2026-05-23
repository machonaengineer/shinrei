#!/usr/bin/env tsx
/**
 * import-spots.ts
 *
 * 心霊マップの初期データ投入用スクリプト。
 *
 * 重要方針:
 * - 収集対象は事実情報のみ：スポット名・国・地域・カテゴリ・緯度経度・関連動画URL
 * - 本文・口コミ・写真は他サイトから取り込まない
 * - 出典URLは内部管理のみ（sources.is_public = false）。公開画面には出さない
 * - 公開用 description は独自テンプレートで生成
 * - 取得は robots.txt を確認した上で、レート制御し、最小限のリクエストに留める
 * - DRY_RUN=true で DB に書かず、変換結果のみ出力
 *
 * 使い方:
 *   DRY_RUN=true npm run import:spots
 *   DRY_RUN=false IMPORT_LIMIT_PER_SOURCE=20 npm run import:spots
 */

import { config as loadEnv } from 'node:process';
import { existsSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

// 簡易 dotenv（.env.local が存在すれば読み込む）
function readEnvFile(path: string) {
  if (!existsSync(path)) return;
  const lines = readFileSync(path, 'utf-8').split('\n');
  for (const line of lines) {
    const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/i);
    if (!m) continue;
    if (process.env[m[1]] === undefined) {
      process.env[m[1]] = m[2].replace(/^['"]|['"]$/g, '');
    }
  }
}
readEnvFile(join(process.cwd(), '.env.local'));
readEnvFile(join(process.cwd(), '.env'));

import { createClient } from '@supabase/supabase-js';
import type { Database } from '../src/types/database';
import {
  CATEGORIES,
  CATEGORY_BY_SLUG,
  COUNTRIES,
  COUNTRY_BY_SLUG,
  PREFECTURES,
  PREFECTURE_BY_SLUG,
} from '../src/lib/constants';

// =====================================================================
// Types
// =====================================================================

type RawCandidate = {
  name: string;
  country_slug?: string;
  prefecture_slug?: string;
  prefecture_name?: string;
  city?: string;
  category_slug?: string;
  lat?: number;
  lng?: number;
  location_precision?: 'exact' | 'approximate' | 'area_only';
  source_url: string;
  source_name: string;
  source_type?: string;
  raw_title?: string;
  is_private_property?: boolean;
  is_entry_prohibited?: boolean;
  related_video_urls?: string[];
};

type AdapterResult =
  | { status: 'ok'; candidates: RawCandidate[] }
  | { status: 'skipped'; reason: string };

interface SourceAdapter {
  id: string;
  label: string;
  /** Returns candidates or a skip reason. */
  fetch(opts: { limit: number; dryRun: boolean }): Promise<AdapterResult>;
}

// =====================================================================
// Helpers
// =====================================================================

const USER_AGENT =
  'shinrei-map/0.1 (+https://shinrei.vercel.app/; respectful crawler; contact via /removal-request)';

async function pause(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function fetchText(url: string): Promise<string> {
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT, Accept: 'text/html,*/*' } });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  return res.text();
}

async function fetchJson<T>(url: string): Promise<T> {
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT, Accept: 'application/json' } });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  return res.json() as Promise<T>;
}

/** robots.txt を緩く確認する（User-Agent: * の Disallow を見る） */
async function isAllowedByRobots(targetUrl: string): Promise<{ allowed: boolean; reason: string }> {
  try {
    const u = new URL(targetUrl);
    const robotsUrl = `${u.origin}/robots.txt`;
    const res = await fetch(robotsUrl, { headers: { 'User-Agent': USER_AGENT } });
    if (!res.ok) {
      return { allowed: true, reason: `robots.txt missing or ${res.status}; proceeding cautiously` };
    }
    const text = await res.text();
    const path = u.pathname;
    // Parse only the User-Agent: * block
    const lines = text.split('\n').map((l) => l.split('#')[0].trim());
    let inWildcard = false;
    for (const line of lines) {
      const ua = /^User-agent:\s*(.+)$/i.exec(line);
      if (ua) {
        inWildcard = ua[1].trim() === '*';
        continue;
      }
      if (!inWildcard) continue;
      const dis = /^Disallow:\s*(.*)$/i.exec(line);
      if (dis) {
        const rule = dis[1].trim();
        if (rule === '') continue; // empty Disallow allows all
        if (rule === '/') return { allowed: false, reason: `robots.txt disallows / for *` };
        if (path.startsWith(rule)) return { allowed: false, reason: `robots.txt disallows ${rule} for *` };
      }
    }
    return { allowed: true, reason: 'robots.txt allows' };
  } catch (e) {
    return { allowed: true, reason: `robots check failed (${(e as Error).message}); proceeding cautiously` };
  }
}

/** 日本のおおよその県中心座標（緯度経度） — 粗い位置決定用 */
const PREF_CENTROIDS: Record<string, [number, number]> = {
  hokkaido: [43.0642, 141.3469],
  aomori: [40.8244, 140.7400],
  iwate: [39.7036, 141.1527],
  miyagi: [38.2688, 140.8721],
  akita: [39.7186, 140.1024],
  yamagata: [38.2404, 140.3633],
  fukushima: [37.7503, 140.4676],
  ibaraki: [36.3418, 140.4468],
  tochigi: [36.5658, 139.8836],
  gunma: [36.3911, 139.0608],
  saitama: [35.8569, 139.6489],
  chiba: [35.6051, 140.1233],
  tokyo: [35.6895, 139.6917],
  kanagawa: [35.4478, 139.6425],
  niigata: [37.9026, 139.0232],
  toyama: [36.6953, 137.2113],
  ishikawa: [36.5946, 136.6256],
  fukui: [36.0652, 136.2216],
  yamanashi: [35.6638, 138.5683],
  nagano: [36.6513, 138.1812],
  gifu: [35.3912, 136.7223],
  shizuoka: [34.9769, 138.3831],
  aichi: [35.1802, 136.9066],
  mie: [34.7303, 136.5086],
  shiga: [35.0045, 135.8686],
  kyoto: [35.0211, 135.7556],
  osaka: [34.6863, 135.5200],
  hyogo: [34.6913, 135.1830],
  nara: [34.6852, 135.8328],
  wakayama: [34.2261, 135.1675],
  tottori: [35.5036, 134.2383],
  shimane: [35.4723, 133.0505],
  okayama: [34.6618, 133.9344],
  hiroshima: [34.3966, 132.4596],
  yamaguchi: [34.1859, 131.4706],
  tokushima: [34.0658, 134.5594],
  kagawa: [34.3401, 134.0434],
  ehime: [33.8416, 132.7657],
  kochi: [33.5597, 133.5311],
  fukuoka: [33.6064, 130.4181],
  saga: [33.2494, 130.2989],
  nagasaki: [32.7448, 129.8737],
  kumamoto: [32.7898, 130.7417],
  oita: [33.2382, 131.6126],
  miyazaki: [31.9111, 131.4239],
  kagoshima: [31.5602, 130.5581],
  okinawa: [26.2124, 127.6809],
};

function classifyCategoryFromName(name: string): string {
  const n = name.toLowerCase();
  if (/トンネル|tunnel/i.test(name)) return 'tunnel';
  if (/橋|bridge/i.test(name)) return 'bridge';
  if (/ホテル|hotel|inn/i.test(name)) return 'hotel';
  if (/病院|hospital|sanatorium|sanitarium/i.test(name)) return 'hospital';
  if (/学校|school|university|college/i.test(name)) return 'school';
  if (/公園|park|garden/i.test(name)) return 'park';
  if (/神社|寺|temple|church|chapel|abbey|cathedral|shrine|ossuary/i.test(name)) return 'shrine-temple';
  if (/山|峠|forest|mountain|pass|woods/i.test(name)) return 'mountain-pass';
  if (/ダム|湖|沼|海|river|lake|dam|sea|ocean|falls|waterfall|pond/i.test(name)) return 'water';
  if (/道|道路|road|highway|street/i.test(name)) return 'road';
  if (/駅|線|station|railway|rail/i.test(name)) return 'station';
  if (/廃|跡|ruin|abandon|castle|fort|prison|mansion|asylum|catacomb|vault/i.test(name)) return 'haikyo';
  if (n.includes('haunted') || n.includes('ghost')) return 'urban-legend';
  return 'other';
}

function buildDescription(c: RawCandidate, locationLabel: string): string {
  return [
    `${c.name}は、${locationLabel}周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。`,
    '',
    '本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。',
    '',
    '訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
  ].join('\n');
}

function slugify(input: string): string {
  return input
    .toLowerCase()
    .normalize('NFKD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9぀-ヿ一-鿿\-\s]/g, '')
    .trim()
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-');
}

function randomSuffix(len = 6): string {
  return Math.random().toString(36).slice(2, 2 + len);
}

// =====================================================================
// Adapter: Wikipedia (List of reportedly haunted locations in Japan)
//
// 著作権: Wikipedia 本文は CC BY-SA。
// このアダプタは本文を取得・保存しません。
// 取得するのは：見出しに含まれるスポット名・国名・地域名のリンクテキスト（事実情報）と
// 該当 Wikipedia ページのURL（内部 sources のみ）です。
// 公開用 description は独自テンプレートで生成します。
// =====================================================================

type WikiSummary = {
  type?: string;
  title?: string;
  description?: string;
  coordinates?: { lat: number; lon: number };
};

const wikiAdapter: SourceAdapter = {
  id: 'wikipedia-jp-haunted',
  label: 'Wikipedia: 心霊スポット一覧（日本）/ List of reportedly haunted locations',

  async fetch({ limit, dryRun }) {
    const targetUrl = 'https://ja.wikipedia.org/wiki/%E5%BF%83%E9%9C%8A%E3%82%B9%E3%83%9D%E3%83%83%E3%83%88%E4%B8%80%E8%A6%A7';
    const robots = await isAllowedByRobots(targetUrl);
    if (!robots.allowed) {
      return { status: 'skipped', reason: robots.reason };
    }

    // Use the Wikipedia REST API to fetch outgoing links from the article
    // — far gentler than HTML scraping. We only collect link titles.
    const apiUrl =
      'https://ja.wikipedia.org/w/api.php?action=parse&page=%E5%BF%83%E9%9C%8A%E3%82%B9%E3%83%9D%E3%83%83%E3%83%88%E4%B8%80%E8%A6%A7&prop=links&format=json&origin=*';
    type ParseResp = {
      parse?: {
        links?: Array<{ ns: number; '*': string; exists?: string }>;
      };
    };
    let resp: ParseResp;
    try {
      resp = await fetchJson<ParseResp>(apiUrl);
    } catch (e) {
      return { status: 'skipped', reason: `Wikipedia API fetch failed: ${(e as Error).message}` };
    }
    const links = (resp.parse?.links ?? []).filter((l) => l.ns === 0).map((l) => l['*']);
    // Limit candidates and exclude obvious meta pages
    const titles = links
      .filter((t) => !/^(プロジェクト|Wikipedia|Help|画像|Template|カテゴリ)/.test(t))
      .filter((t) => t.length >= 2 && t.length <= 40)
      .slice(0, Math.max(0, limit));

    const candidates: RawCandidate[] = [];
    for (const title of titles) {
      // Polite rate: 1 req / sec (Wikipedia REST is generous but we keep it slow)
      await pause(1100);
      const summaryUrl = `https://ja.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title)}`;
      let summary: WikiSummary;
      try {
        summary = await fetchJson<WikiSummary>(summaryUrl);
      } catch {
        continue;
      }
      if (summary.type === 'disambiguation') continue;
      const coords = summary.coordinates;
      if (!coords) continue; // 緯度経度がないものはスキップ（Map サイトなので必須）
      candidates.push({
        name: summary.title ?? title,
        country_slug: 'japan',
        lat: coords.lat,
        lng: coords.lon,
        location_precision: 'approximate',
        category_slug: classifyCategoryFromName(summary.title ?? title),
        source_url: `https://ja.wikipedia.org/wiki/${encodeURIComponent(title)}`,
        source_name: 'Wikipedia (ja)',
        source_type: 'wikipedia',
        raw_title: title,
      });
    }

    if (dryRun) {
      console.log(`  [dry-run] would import ${candidates.length} candidates from Wikipedia`);
    }
    return { status: 'ok', candidates };
  },
};

// =====================================================================
// Adapter stubs for the other reference sites
// 重要：実装方針として、これらのサイトは
//   1. robots.txt または利用規約でスクレイピングが許諾されているか不明確、
//   2. 本文・口コミ・写真の取得が必要になる構造のため事実情報だけの抽出が難しい、
//   3. データ密度が低く効率が悪い（Wikipedia の方が事実情報として整っている）
// 以上の理由で **本スクリプトでは実取得を行わず、明示的にスキップ** します。
// 必要な場合は各サイト運営者に連絡し、適切なライセンス・データ提供方法を取得した上で
// 別途実装してください。
// =====================================================================

function manualSkipAdapter(id: string, label: string, reason: string): SourceAdapter {
  return {
    id,
    label,
    async fetch() {
      return { status: 'skipped', reason };
    },
  };
}

const adapters: SourceAdapter[] = [
  wikiAdapter,
  manualSkipAdapter(
    'ghostmap-jp',
    'ghostmap.jp',
    '個人運営のキュレーションサイト。利用規約でのスクレイピング許諾が確認できないためスキップ。事実情報の自動取得には別途運営者と要相談。',
  ),
  manualSkipAdapter(
    'haunted-spots-map-gh',
    'sunzhijijin-commits.github.io/haunted-spots-map',
    'GitHub Pages 上の個人プロジェクト。原データへの構造化アクセス手段が不明確なためスキップ。fork してデータ部分のみ参照する方が適切。',
  ),
  manualSkipAdapter(
    'mogeringo',
    'pc.mogeringo.com',
    '個別記事 URL。本文の引用なしには事実情報の抽出が難しく、ブログ著作権との関係でスキップ。',
  ),
  manualSkipAdapter(
    'dotsonmaps',
    'dotsonmaps.com',
    'インタラクティブマップサービス。データAPIが公開されておらずスキップ。',
  ),
  manualSkipAdapter(
    'haunt-map',
    'haunt-map.com',
    '商用サービス。ToS でスクレイピングが許諾されていないためスキップ。',
  ),
  manualSkipAdapter(
    'paranormal-database',
    'paranormaldatabase.com',
    '個人運営DB。ToS要確認のためスキップ。',
  ),
  manualSkipAdapter(
    'ghostquest',
    'ghostquest.net',
    'ToS要確認のためスキップ。',
  ),
  manualSkipAdapter(
    'hauntedus',
    'hauntedus.com',
    'メディアサイト。ToS要確認のためスキップ。',
  ),
  manualSkipAdapter(
    'wikipedia-en-haunted',
    'en.wikipedia.org: List of reportedly haunted locations',
    'Wikipedia EN は本来許諾されるが、まずは日本版で試験運用するため第二段階に持ち越し（手動有効化が必要）。',
  ),
  manualSkipAdapter(
    'morbid-tourist',
    'themorbidtourist.com',
    '有料サービスのためスキップ。',
  ),
];

// =====================================================================
// Main
// =====================================================================

async function main() {
  const DRY_RUN = (process.env.DRY_RUN ?? 'true').toLowerCase() !== 'false';
  const IMPORT_LIMIT_PER_SOURCE = Number(process.env.IMPORT_LIMIT_PER_SOURCE ?? 30);
  const IMPORT_TOTAL_LIMIT = Number(process.env.IMPORT_TOTAL_LIMIT ?? 300);
  const IMPORT_STATUS = (process.env.IMPORT_STATUS ?? 'pending_review') as
    | 'pending_review'
    | 'published';

  console.log(`= shinrei import-spots =`);
  console.log(`  DRY_RUN=${DRY_RUN}`);
  console.log(`  IMPORT_LIMIT_PER_SOURCE=${IMPORT_LIMIT_PER_SOURCE}`);
  console.log(`  IMPORT_TOTAL_LIMIT=${IMPORT_TOTAL_LIMIT}`);
  console.log(`  IMPORT_STATUS=${IMPORT_STATUS}`);
  console.log('');

  if (!DRY_RUN) {
    if (!process.env.NEXT_PUBLIC_SUPABASE_URL || !process.env.SUPABASE_SERVICE_ROLE_KEY) {
      console.error('NEXT_PUBLIC_SUPABASE_URL と SUPABASE_SERVICE_ROLE_KEY が必要です');
      process.exit(1);
    }
  }

  const allCandidates: RawCandidate[] = [];
  for (const adapter of adapters) {
    if (allCandidates.length >= IMPORT_TOTAL_LIMIT) break;
    console.log(`[${adapter.id}] ${adapter.label}`);
    const remaining = IMPORT_TOTAL_LIMIT - allCandidates.length;
    const limit = Math.min(IMPORT_LIMIT_PER_SOURCE, remaining);
    const result = await adapter.fetch({ limit, dryRun: DRY_RUN });
    if (result.status === 'skipped') {
      console.log(`  ⊘ skipped: ${result.reason}`);
      continue;
    }
    console.log(`  ✓ ${result.candidates.length} candidates`);
    allCandidates.push(...result.candidates);
  }

  console.log('');
  console.log(`総候補数: ${allCandidates.length}`);

  if (DRY_RUN) {
    console.log('--- DRY_RUN: DBには書き込みません ---');
    const sample = allCandidates.slice(0, 10).map((c) => ({
      name: c.name,
      country: c.country_slug,
      pref: c.prefecture_slug,
      cat: c.category_slug,
      lat: c.lat?.toFixed(3),
      lng: c.lng?.toFixed(3),
      source: c.source_name,
    }));
    console.table(sample);
    return;
  }

  // ---- Insert into Supabase ----
  const supabase = createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } },
  );

  let inserted = 0;
  let dedup = 0;

  for (const c of allCandidates) {
    const country = COUNTRY_BY_SLUG[c.country_slug ?? 'japan'] ?? COUNTRY_BY_SLUG.japan;
    const cat = CATEGORY_BY_SLUG[c.category_slug ?? 'other'] ?? CATEGORY_BY_SLUG.other;

    // 緯度経度がなく、prefecture がある場合は県中心へ
    let lat = c.lat;
    let lng = c.lng;
    let precision: 'exact' | 'approximate' | 'area_only' = c.location_precision ?? 'approximate';
    if (!lat || !lng) {
      const cent = c.prefecture_slug ? PREF_CENTROIDS[c.prefecture_slug] : undefined;
      if (cent) {
        [lat, lng] = cent;
        precision = 'area_only';
      }
    }
    if (!lat || !lng) continue; // skip if still unknown

    // 既存スポットとの重複チェック（sources.source_url 完全一致）
    const { data: existing } = await supabase
      .from('sources')
      .select('spot_id')
      .eq('source_url', c.source_url)
      .limit(1);
    if (existing && existing.length > 0) {
      dedup++;
      continue;
    }

    const prefName = c.prefecture_name ?? (PREFECTURE_BY_SLUG[c.prefecture_slug ?? '']?.name ?? '不明');
    const prefSlug = c.prefecture_slug ?? 'tokyo';
    const locationLabel =
      country.slug === 'japan' ? prefName : `${country.name}${prefName !== '不明' ? ' ' + prefName : ''}`;

    const slug = `${slugify(c.name) || 'spot'}-${randomSuffix(6)}`;

    const { data: newSpot, error: insertErr } = await supabase
      .from('spots')
      .insert({
        name: c.name,
        slug,
        description: buildDescription(c, locationLabel),
        country: country.name,
        country_slug: country.slug,
        prefecture: prefName,
        prefecture_slug: prefSlug,
        city: c.city ?? null,
        lat,
        lng,
        location_precision: precision,
        category: cat.name,
        category_slug: cat.slug,
        is_private_property: c.is_private_property ?? false,
        is_entry_prohibited: c.is_entry_prohibited ?? false,
        status: IMPORT_STATUS,
      })
      .select('id')
      .single();

    if (insertErr || !newSpot) {
      console.error(`  ✗ failed: ${c.name}: ${insertErr?.message}`);
      continue;
    }

    // Save source (internal only)
    await supabase.from('sources').insert({
      spot_id: newSpot.id,
      source_url: c.source_url,
      source_name: c.source_name,
      source_type: c.source_type ?? null,
      raw_title: c.raw_title ?? null,
      retrieved_at: new Date().toISOString(),
      is_public: false,
      memo: 'imported via scripts/import-spots.ts',
    });

    // Save related videos if any (pending_review)
    for (const url of c.related_video_urls ?? []) {
      const { detectPlatform, toEmbedUrl } = await import('../src/lib/video');
      const platform = detectPlatform(url);
      await supabase.from('spot_videos').insert({
        spot_id: newSpot.id,
        platform,
        video_url: url,
        embed_url: toEmbedUrl(url, platform) ?? null,
        title: null,
        status: 'pending_review',
        source_type: 'imported',
      });
    }

    inserted++;
  }

  console.log(`\nInserted: ${inserted} / Dedup-skipped: ${dedup}`);
  console.log('All inserted spots are set to status="' + IMPORT_STATUS + '". Approve from /admin/spots.');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});

// silence unused-import lint
void [CATEGORIES, COUNTRIES, PREFECTURES, loadEnv];
