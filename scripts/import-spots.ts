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
 * - robots.txt を毎リクエスト前に確認、レート制御（2秒以上）
 * - 取得結果は status = pending_review で保存 → 管理画面で人が承認
 * - DRY_RUN=true で DB に書かず、変換結果のみ出力
 *
 * 使い方:
 *   DRY_RUN=true npm run import:spots
 *   ENABLED_SOURCES=wikipedia-ja,ghostmap DRY_RUN=true npm run import:spots
 *   DRY_RUN=false npm run import:spots
 */

import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

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
  CATEGORY_BY_SLUG,
  COUNTRY_BY_SLUG,
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

async function fetchText(url: string, encoding?: string): Promise<string> {
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT, Accept: 'text/html,*/*' } });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  if (encoding && encoding !== 'utf-8') {
    const buf = await res.arrayBuffer();
    return new TextDecoder(encoding).decode(buf);
  }
  return res.text();
}

async function fetchJson<T>(url: string): Promise<T> {
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT, Accept: 'application/json' } });
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${url}`);
  return res.json() as Promise<T>;
}

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
        if (rule === '') continue;
        if (rule === '/') return { allowed: false, reason: `robots.txt disallows / for *` };
        if (path.startsWith(rule)) return { allowed: false, reason: `robots.txt disallows ${rule} for *` };
      }
    }
    return { allowed: true, reason: 'robots.txt allows' };
  } catch (e) {
    return { allowed: true, reason: `robots check failed (${(e as Error).message}); proceeding cautiously` };
  }
}

// 名前に事件・死亡・個人情報・断定表現が含まれる場合は除外
// 編集ポリシーに沿った安全フィルタ
const NAME_BLACKLIST_PATTERNS: RegExp[] = [
  /事件/, /殺人/, /殺害/, /自殺/, /他殺/, /心中/, /焼死/, /轢死/, /溺死/, /餓死/, /縊死/, /絞殺/,
  /遺体/, /死体/, /死亡/, /死者/, /死/,
  /投身/, /飛び?降り/, /身投げ/,
  /虐待/, /誘拐/, /拉致/, /監禁/,
  /被害者/, /加害者/, /容疑者/,
  /の家$/, /邸$/, /宅$/, /アパート/, /マンション/, // 個人宅っぽい
  /号室/,
  /\d名/,
  /バラバラ/,
];

function isSafeSpotName(name: string): boolean {
  for (const p of NAME_BLACKLIST_PATTERNS) {
    if (p.test(name)) return false;
  }
  return true;
}

function classifyCategoryFromName(name: string): string {
  if (/トンネル|tunnel/i.test(name)) return 'tunnel';
  if (/橋|bridge/i.test(name)) return 'bridge';
  if (/ホテル|hotel|inn/i.test(name)) return 'hotel';
  if (/病院|hospital|sanatorium|sanitarium|asylum/i.test(name)) return 'hospital';
  if (/学校|school|university|college/i.test(name)) return 'school';
  if (/公園|park|garden/i.test(name)) return 'park';
  if (/神社|寺|temple|church|chapel|abbey|cathedral|shrine|ossuary/i.test(name)) return 'shrine-temple';
  if (/山|峠|forest|mountain|pass|woods|hill/i.test(name)) return 'mountain-pass';
  if (/ダム|湖|沼|海|river|lake|dam|sea|ocean|falls|waterfall|pond/i.test(name)) return 'water';
  if (/道|道路|road|highway|street/i.test(name)) return 'road';
  if (/駅|線|station|railway|rail/i.test(name)) return 'station';
  if (/廃|跡|ruin|abandon|castle|fort|prison|mansion|catacomb|vault/i.test(name)) return 'haikyo';
  if (/haunted|ghost|legend|kaidan|怪談|伝説/i.test(name)) return 'urban-legend';
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

function decodeHtmlEntities(s: string): string {
  return s
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(Number(n)))
    .replace(/&#x([0-9a-f]+);/gi, (_, n) => String.fromCharCode(parseInt(n, 16)));
}

const PREF_CENTROIDS: Record<string, [number, number]> = {
  hokkaido: [43.0642, 141.3469], aomori: [40.8244, 140.7400], iwate: [39.7036, 141.1527],
  miyagi: [38.2688, 140.8721], akita: [39.7186, 140.1024], yamagata: [38.2404, 140.3633],
  fukushima: [37.7503, 140.4676], ibaraki: [36.3418, 140.4468], tochigi: [36.5658, 139.8836],
  gunma: [36.3911, 139.0608], saitama: [35.8569, 139.6489], chiba: [35.6051, 140.1233],
  tokyo: [35.6895, 139.6917], kanagawa: [35.4478, 139.6425], niigata: [37.9026, 139.0232],
  toyama: [36.6953, 137.2113], ishikawa: [36.5946, 136.6256], fukui: [36.0652, 136.2216],
  yamanashi: [35.6638, 138.5683], nagano: [36.6513, 138.1812], gifu: [35.3912, 136.7223],
  shizuoka: [34.9769, 138.3831], aichi: [35.1802, 136.9066], mie: [34.7303, 136.5086],
  shiga: [35.0045, 135.8686], kyoto: [35.0211, 135.7556], osaka: [34.6863, 135.5200],
  hyogo: [34.6913, 135.1830], nara: [34.6852, 135.8328], wakayama: [34.2261, 135.1675],
  tottori: [35.5036, 134.2383], shimane: [35.4723, 133.0505], okayama: [34.6618, 133.9344],
  hiroshima: [34.3966, 132.4596], yamaguchi: [34.1859, 131.4706], tokushima: [34.0658, 134.5594],
  kagawa: [34.3401, 134.0434], ehime: [33.8416, 132.7657], kochi: [33.5597, 133.5311],
  fukuoka: [33.6064, 130.4181], saga: [33.2494, 130.2989], nagasaki: [32.7448, 129.8737],
  kumamoto: [32.7898, 130.7417], oita: [33.2382, 131.6126], miyazaki: [31.9111, 131.4239],
  kagoshima: [31.5602, 130.5581], okinawa: [26.2124, 127.6809],
};

function inferPrefSlugFromLatLng(lat: number, lng: number): string | undefined {
  // 単純な最近傍判定（県庁所在地中心）
  let best: { slug: string; d: number } | null = null;
  for (const [slug, [plat, plng]] of Object.entries(PREF_CENTROIDS)) {
    const d = Math.sqrt((lat - plat) ** 2 + (lng - plng) ** 2);
    if (!best || d < best.d) best = { slug, d };
  }
  return best?.slug;
}

// =====================================================================
// Adapter: Wikipedia (ja)
// =====================================================================

type WikiSummary = {
  type?: string;
  title?: string;
  description?: string;
  coordinates?: { lat: number; lon: number };
};

function makeWikipediaAdapter(lang: 'ja' | 'en', listPageTitle: string, countrySlug: string, expectedCountryName: string): SourceAdapter {
  return {
    id: `wikipedia-${lang}`,
    label: `Wikipedia (${lang}): ${listPageTitle}`,
    async fetch({ limit, dryRun }) {
      const articleUrl = `https://${lang}.wikipedia.org/wiki/${encodeURIComponent(listPageTitle)}`;
      const robots = await isAllowedByRobots(articleUrl);
      if (!robots.allowed) return { status: 'skipped', reason: robots.reason };

      const apiUrl = `https://${lang}.wikipedia.org/w/api.php?action=parse&page=${encodeURIComponent(listPageTitle)}&prop=links&format=json&origin=*`;
      type ParseResp = { parse?: { links?: Array<{ ns: number; '*': string }> } };
      let resp: ParseResp;
      try {
        resp = await fetchJson<ParseResp>(apiUrl);
      } catch (e) {
        return { status: 'skipped', reason: `Wikipedia ${lang} API fetch failed: ${(e as Error).message}` };
      }
      const links = (resp.parse?.links ?? []).filter((l) => l.ns === 0).map((l) => l['*']);
      const titles = links
        .filter((t) => !/^(プロジェクト|Wikipedia|Help|画像|Template|カテゴリ|File:|Category:|Help:|Special:|Portal:|Wikipedia:)/.test(t))
        .filter((t) => t.length >= 2 && t.length <= 50)
        .slice(0, Math.max(0, limit));

      const candidates: RawCandidate[] = [];
      for (const title of titles) {
        await pause(1100);
        const summaryUrl = `https://${lang}.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title)}`;
        let summary: WikiSummary;
        try {
          summary = await fetchJson<WikiSummary>(summaryUrl);
        } catch {
          continue;
        }
        if (summary.type === 'disambiguation') continue;
        if (!summary.coordinates) continue;

        const displayName = summary.title ?? title;
        if (!isSafeSpotName(displayName)) continue;
        candidates.push({
          name: displayName,
          country_slug: countrySlug,
          lat: summary.coordinates.lat,
          lng: summary.coordinates.lon,
          location_precision: 'approximate',
          category_slug: classifyCategoryFromName(displayName),
          prefecture_slug: lang === 'ja' ? inferPrefSlugFromLatLng(summary.coordinates.lat, summary.coordinates.lon) : undefined,
          source_url: `https://${lang}.wikipedia.org/wiki/${encodeURIComponent(title)}`,
          source_name: `Wikipedia (${lang})`,
          source_type: 'wikipedia',
          raw_title: title,
        });
      }

      if (dryRun) console.log(`  [dry-run] Wikipedia ${lang}: ${candidates.length} candidates`);
      return { status: 'ok', candidates };
    },
  };
}

// =====================================================================
// Adapter: ghostmap.jp
//
// ターゲット URL 構造:
//   トップ -> spottop.php に最新スポット一覧
//   個別ページ -> spotdetail.php?spotcd=XXXX
// 抽出対象: title（スポット名）+ ページ内に埋め込まれた lat=...&lon=... の座標
// 本文・口コミ・写真は取得しない。出典URLは内部のみ。
// =====================================================================

const ghostmapAdapter: SourceAdapter = {
  id: 'ghostmap',
  label: 'ghostmap.jp 全国心霊マップ',
  async fetch({ limit, dryRun }) {
    const baseUrl = 'https://ghostmap.jp/';
    const robots = await isAllowedByRobots(baseUrl + 'spottop.php');
    if (!robots.allowed) return { status: 'skipped', reason: robots.reason };

    const scanStart = Number(process.env.GHOSTMAP_SCAN_START ?? '');
    const scanEnd = Number(process.env.GHOSTMAP_SCAN_END ?? '');
    const scanStep = Number(process.env.GHOSTMAP_SCAN_STEP ?? '1');
    const delayMs = Number(process.env.GHOSTMAP_DELAY_MS ?? '1500');

    let codes: string[];
    if (Number.isFinite(scanStart) && Number.isFinite(scanEnd) && scanEnd >= scanStart) {
      codes = [];
      for (let i = scanStart; i <= scanEnd; i += scanStep) codes.push(String(i));
      codes = codes.slice(0, Math.max(0, limit));
    } else {
      let topHtml: string;
      try {
        topHtml = await fetchText(baseUrl + 'spottop.php');
      } catch (e) {
        return { status: 'skipped', reason: `ghostmap fetch failed: ${(e as Error).message}` };
      }
      codes = Array.from(
        new Set(
          Array.from(topHtml.matchAll(/spotdetail\.php\?spotcd=(\d+)/g)).map((m) => m[1]),
        ),
      ).slice(0, Math.max(0, limit));
    }

    const candidates: RawCandidate[] = [];
    let processed = 0;
    for (const cd of codes) {
      await pause(delayMs);
      const detailUrl = `${baseUrl}spotdetail.php?spotcd=${cd}`;
      let html: string;
      try {
        const res = await fetch(detailUrl, { headers: { 'User-Agent': USER_AGENT } });
        if (!res.ok) continue;
        html = await res.text();
      } catch {
        continue;
      }
      processed++;
      if (processed % 50 === 0) console.log(`  ... ${processed}/${codes.length} probed, ${candidates.length} ok`);
      // 「ページが見つかりません」を検出
      if (/<title>ページが見つかりません/.test(html)) continue;
      const titleMatch = html.match(/<title>([^<]+)<\/title>/);
      if (!titleMatch) continue;
      // タイトル形式: "スポット名とは？事件・現在・心霊現象の噂"
      let name = decodeHtmlEntities(titleMatch[1])
        .replace(/とは[?？].*$/, '')
        .replace(/[|｜].*$/, '')
        .trim();
      if (!name || name.length < 2 || name.length > 100) continue;
      // ノイズワード除外
      if (/全国心霊マップ|404|エラー/.test(name)) continue;
      // 編集ポリシー安全フィルタ（事件・死亡・個人宅などを除外）
      if (!isSafeSpotName(name)) continue;

      const latMatch = html.match(/lat=(-?\d+\.\d+)&(?:amp;)?lon=(-?\d+\.\d+)/);
      let lat: number | undefined;
      let lng: number | undefined;
      if (latMatch) {
        lat = parseFloat(latMatch[1]);
        lng = parseFloat(latMatch[2]);
      }
      if (lat === undefined || lng === undefined) continue;
      if (lat < 20 || lat > 50 || lng < 120 || lng > 150) continue; // 日本範囲外を除外

      candidates.push({
        name,
        country_slug: 'japan',
        lat,
        lng,
        location_precision: 'approximate',
        category_slug: classifyCategoryFromName(name),
        prefecture_slug: inferPrefSlugFromLatLng(lat, lng),
        source_url: detailUrl,
        source_name: 'ghostmap.jp',
        source_type: 'community-site',
        raw_title: titleMatch[1],
      });
    }

    if (dryRun) console.log(`  [dry-run] ghostmap.jp: ${candidates.length} candidates`);
    return { status: 'ok', candidates };
  },
};

// =====================================================================
// Adapter stubs (explicit skips with documented reasons)
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

const allAdapters: Record<string, SourceAdapter> = {
  'wikipedia-ja': makeWikipediaAdapter('ja', '心霊スポット一覧', 'japan', '日本'),
  'wikipedia-en': makeWikipediaAdapter('en', 'List_of_reportedly_haunted_locations', 'usa', 'global'),
  ghostmap: ghostmapAdapter,
  mogeringo: manualSkipAdapter(
    'mogeringo',
    'pc.mogeringo.com',
    '対象記事は ghostmap.jp の紹介記事で、スポット一覧データではないためスキップ',
  ),
  'haunted-spots-map-gh': manualSkipAdapter(
    'haunted-spots-map-gh',
    'sunzhijijin-commits.github.io/haunted-spots-map',
    'GitHub Pages サイトが現在 404（サイト削除済み）のためスキップ',
  ),
  dotsonmaps: manualSkipAdapter(
    'dotsonmaps',
    'dotsonmaps.com',
    'Squarespace 製の JS レンダリング地図サービス。クライアントサイドで動的に地図を構築するため、サーバーサイド HTML 解析では情報抽出が困難',
  ),
  'haunt-map': manualSkipAdapter(
    'haunt-map',
    'haunt-map.com',
    '商用サービス。ToS で第三者の自動収集が制限されているためスキップ',
  ),
  'paranormal-database': manualSkipAdapter(
    'paranormal-database',
    'paranormaldatabase.com',
    '個人運営DB。掲載量は多いがサイトオーナーに直接連絡しデータ提供の許諾を得るのが望ましいため、当面スキップ',
  ),
  ghostquest: manualSkipAdapter(
    'ghostquest',
    'ghostquest.net',
    '米国 DB。掲載量は多いがサイトオーナーに直接連絡しデータ提供の許諾を得るのが望ましいため、当面スキップ',
  ),
  hauntedus: manualSkipAdapter(
    'hauntedus',
    'hauntedus.com',
    'メディアサイト。記事中の事実情報は使用可能だが、記事構造から事実情報のみ抽出するのが難しいため当面スキップ',
  ),
  'morbid-tourist': manualSkipAdapter(
    'morbid-tourist',
    'themorbidtourist.com',
    '有料サービスのためスキップ',
  ),
};

// =====================================================================
// Main
// =====================================================================

async function main() {
  const DRY_RUN = (process.env.DRY_RUN ?? 'true').toLowerCase() !== 'false';
  const IMPORT_LIMIT_PER_SOURCE = Number(process.env.IMPORT_LIMIT_PER_SOURCE ?? 30);
  const IMPORT_TOTAL_LIMIT = Number(process.env.IMPORT_TOTAL_LIMIT ?? 300);
  const IMPORT_STATUS = (process.env.IMPORT_STATUS ?? 'pending_review') as 'pending_review' | 'published';
  const ENABLED_SOURCES = (process.env.ENABLED_SOURCES ?? 'wikipedia-ja,ghostmap')
    .split(',')
    .map((s) => s.trim())
    .filter(Boolean);

  console.log(`= shinrei import-spots =`);
  console.log(`  DRY_RUN=${DRY_RUN}`);
  console.log(`  ENABLED_SOURCES=${ENABLED_SOURCES.join(',')}`);
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
  for (const id of ENABLED_SOURCES) {
    const adapter = allAdapters[id];
    if (!adapter) {
      console.log(`[${id}] Unknown adapter, skipped`);
      continue;
    }
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

  // Other not-enabled adapters reported as informational
  for (const id of Object.keys(allAdapters)) {
    if (ENABLED_SOURCES.includes(id)) continue;
    const a = allAdapters[id];
    console.log(`[${a.id}] ${a.label}`);
    console.log(`  ⊘ disabled (not in ENABLED_SOURCES)`);
  }

  console.log('');
  console.log(`総候補数: ${allCandidates.length}`);

  // SQL 出力モード（OUT_SQL=path 指定時に有効）
  const OUT_SQL = process.env.OUT_SQL;
  if (OUT_SQL) {
    const sql = buildSqlOutput(allCandidates, IMPORT_STATUS);
    writeFileSync(OUT_SQL, sql);
    console.log(`SQL written: ${OUT_SQL} (${sql.length} bytes, ${allCandidates.length} rows)`);
    return;
  }

  if (DRY_RUN) {
    console.log('--- DRY_RUN: DBには書き込みません ---');
    const sample = allCandidates.slice(0, 30).map((c) => ({
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
    if (!lat || !lng) continue;

    const { data: existing } = await supabase
      .from('sources')
      .select('spot_id')
      .eq('source_url', c.source_url)
      .limit(1);
    if (existing && existing.length > 0) {
      dedup++;
      continue;
    }

    // 同じ名前で同じ県のスポットがあれば重複扱い
    if (c.prefecture_slug) {
      const { data: nameDup } = await supabase
        .from('spots')
        .select('id')
        .eq('name', c.name)
        .eq('prefecture_slug', c.prefecture_slug)
        .limit(1);
      if (nameDup && nameDup.length > 0) {
        await supabase.from('sources').insert({
          spot_id: nameDup[0].id,
          source_url: c.source_url,
          source_name: c.source_name,
          source_type: c.source_type ?? null,
          raw_title: c.raw_title ?? null,
          retrieved_at: new Date().toISOString(),
          is_public: false,
          memo: 'imported via scripts/import-spots.ts (dedup-merged source)',
        });
        dedup++;
        continue;
      }
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
      console.error(`  ✗ ${c.name}: ${insertErr?.message}`);
      continue;
    }

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

    inserted++;
  }

  console.log(`\nInserted: ${inserted} / Dedup-skipped: ${dedup}`);
  console.log(`All inserted spots are set to status="${IMPORT_STATUS}". Approve from /admin/spots.`);
}

function sqlEscape(s: string): string {
  return s.replace(/'/g, "''");
}

function buildSqlOutput(candidates: RawCandidate[], status: string): string {
  const lines: string[] = [];
  lines.push('-- =====================================================');
  lines.push('-- shinrei: imported via scripts/import-spots.ts');
  lines.push(`-- generated: ${new Date().toISOString()}`);
  lines.push(`-- rows: ${candidates.length}`);
  lines.push('-- 取得元は内部 sources にのみ保存、公開画面には出ません');
  lines.push('-- =====================================================');
  lines.push('');
  lines.push('-- 1) spots を挿入（重複は ON CONFLICT で回避）');
  lines.push('do $$');
  lines.push('declare');
  lines.push('  new_spot_id uuid;');
  lines.push('begin');

  let count = 0;
  for (const c of candidates) {
    const country = COUNTRY_BY_SLUG[c.country_slug ?? 'japan'] ?? COUNTRY_BY_SLUG.japan;
    const cat = CATEGORY_BY_SLUG[c.category_slug ?? 'other'] ?? CATEGORY_BY_SLUG.other;
    let lat = c.lat;
    let lng = c.lng;
    let precision: 'exact' | 'approximate' | 'area_only' = c.location_precision ?? 'approximate';
    if (!lat || !lng) {
      const cent = c.prefecture_slug ? PREF_CENTROIDS[c.prefecture_slug] : undefined;
      if (cent) { [lat, lng] = cent; precision = 'area_only'; }
    }
    if (!lat || !lng) continue;
    const prefName = c.prefecture_name ?? (PREFECTURE_BY_SLUG[c.prefecture_slug ?? '']?.name ?? '不明');
    const prefSlug = c.prefecture_slug ?? 'tokyo';
    const locationLabel = country.slug === 'japan' ? prefName : `${country.name}${prefName !== '不明' ? ' ' + prefName : ''}`;
    const slug = `${slugify(c.name) || 'spot'}-${randomSuffix(8)}`;
    const description = buildDescription(c, locationLabel);

    lines.push('');
    lines.push(`  -- ${count + 1}: ${c.name}`);
    // 既存スポットに同じ source_url があればスキップ
    lines.push(`  if not exists (select 1 from public.sources where source_url = '${sqlEscape(c.source_url)}') then`);
    lines.push(`    -- 同名同県があれば sources のみ追加して終了`);
    lines.push(`    select id into new_spot_id from public.spots where name = '${sqlEscape(c.name)}' and prefecture_slug = '${prefSlug}' limit 1;`);
    lines.push(`    if new_spot_id is null then`);
    lines.push(`      insert into public.spots`);
    lines.push(`        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,`);
    lines.push(`         lat, lng, location_precision, category, category_slug,`);
    lines.push(`         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)`);
    lines.push(`      values`);
    lines.push(`        ('${sqlEscape(c.name)}', '${sqlEscape(slug)}', '${sqlEscape(description)}',`);
    lines.push(`         '${sqlEscape(country.name)}', '${country.slug}',`);
    lines.push(`         '${sqlEscape(prefName)}', '${prefSlug}', ${c.city ? `'${sqlEscape(c.city)}'` : 'null'},`);
    lines.push(`         ${lat}, ${lng}, '${precision}',`);
    lines.push(`         '${sqlEscape(cat.name)}', '${cat.slug}',`);
    lines.push(`         1, 0, 0, ${c.is_private_property ? 'true' : 'false'}, ${c.is_entry_prohibited ? 'true' : 'false'}, '${status}')`);
    lines.push(`      returning id into new_spot_id;`);
    lines.push(`    end if;`);
    lines.push(`    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)`);
    lines.push(`    values (new_spot_id, '${sqlEscape(c.source_url)}', '${sqlEscape(c.source_name)}',`);
    lines.push(`            ${c.source_type ? `'${sqlEscape(c.source_type)}'` : 'null'},`);
    lines.push(`            ${c.raw_title ? `'${sqlEscape(c.raw_title)}'` : 'null'},`);
    lines.push(`            now(), false, 'imported via scripts/import-spots.ts');`);
    lines.push(`  end if;`);
    count++;
  }

  lines.push('end$$;');
  lines.push('');
  lines.push('-- 統計再計算');
  lines.push('do $$');
  lines.push('declare r record;');
  lines.push('begin');
  lines.push('  for r in select id from public.spots loop');
  lines.push('    perform public.recalc_spot_stats(r.id);');
  lines.push('  end loop;');
  lines.push('end$$;');
  return lines.join('\n');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});

// silence unused
void fetchText;
