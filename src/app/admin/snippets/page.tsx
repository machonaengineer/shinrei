import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { PREFECTURES, CATEGORIES } from '@/lib/constants';
import { siteUrl } from '@/lib/seo';

export const dynamic = 'force-dynamic';

const SELECT =
  'id, slug, name, prefecture, prefecture_slug, category_slug, scary_score, review_count';

type Spot = {
  id: string;
  slug: string;
  name: string;
  prefecture: string;
  prefecture_slug: string;
  category_slug: string;
  scary_score: number;
  review_count: number;
};

function snsPostForPref(name: string, n: number) {
  const base = siteUrl().replace(/\/$/, '');
  return (
    `${name}の心霊スポット、地図で見ると意外と多い。
心霊マップでは、${name}の噂・怪談・都市伝説スポットを地図で探せます（掲載 ${n} 件）。
無断侵入や迷惑行為は絶対NG。
地元の噂も投稿できます。

${base}/area/${PREFECTURES.find((p) => p.name === name)?.slug ?? ''}

#心霊スポット #怪談 #都市伝説 #心霊マップ #${name}`
  );
}

function snsPostForCategory(name: string, slug: string, n: number) {
  const base = siteUrl().replace(/\/$/, '');
  return (
    `${name}にまつわる心霊スポット、全国で ${n} 件。
心霊マップでは、${name}カテゴリのスポットを地図で一気に探せます。
噂・怪談・体験談として共有しています。

${base}/category/${slug}

#心霊スポット #${name} #怪談 #都市伝説 #心霊マップ`
  );
}

function snsPostForSpot(s: Spot) {
  const base = siteUrl().replace(/\/$/, '');
  return (
    `${s.name}（${s.prefecture}）を心霊マップで見つけた。
真偽不明の噂や怪談を安全に楽しむためのマップ。

${base}/spots/${encodeURIComponent(s.slug)}

#心霊スポット #${s.prefecture} #心霊マップ`
  );
}

export default async function SnippetsPage() {
  const admin = supabaseAdmin();

  const [prefCountsRes, catCountsRes, popularRes, photoRes, videoRes, recentRes] = await Promise.all([
    admin.from('spots').select('prefecture_slug, prefecture').eq('status', 'published'),
    admin.from('spots').select('category_slug').eq('status', 'published'),
    admin.from('spots').select(SELECT).eq('status', 'published')
      .order('review_count', { ascending: false })
      .order('scary_score', { ascending: false })
      .limit(20),
    admin.from('spot_images')
      .select('spot_id, spots!inner(id, slug, name, prefecture, prefecture_slug, category_slug, scary_score, review_count, status)')
      .eq('status', 'published').eq('spots.status', 'published').limit(50),
    admin.from('spot_videos')
      .select('spot_id, spots!inner(id, slug, name, prefecture, prefecture_slug, category_slug, scary_score, review_count, status)')
      .eq('status', 'published').eq('spots.status', 'published').limit(50),
    admin.from('spots')
      .select('id, slug, name, prefecture, prefecture_slug, category_slug, scary_score, review_count, created_at')
      .eq('status', 'published')
      .order('created_at', { ascending: false }).limit(20),
  ]);

  const prefMap = new Map<string, { name: string; count: number }>();
  ((prefCountsRes.data ?? []) as Array<{ prefecture_slug: string; prefecture: string }>).forEach((r) => {
    const cur = prefMap.get(r.prefecture_slug) ?? { name: r.prefecture, count: 0 };
    cur.count += 1;
    prefMap.set(r.prefecture_slug, cur);
  });
  const prefSorted = Array.from(prefMap.entries())
    .map(([slug, v]) => ({ slug, ...v }))
    .sort((a, b) => b.count - a.count);

  const catMap = new Map<string, number>();
  ((catCountsRes.data ?? []) as Array<{ category_slug: string }>).forEach((r) => {
    catMap.set(r.category_slug, (catMap.get(r.category_slug) ?? 0) + 1);
  });
  const catSorted = CATEGORIES.map((c) => ({ ...c, count: catMap.get(c.slug) ?? 0 }))
    .sort((a, b) => b.count - a.count);

  const popular = (popularRes.data ?? []) as Spot[];
  const recent = (recentRes.data ?? []) as Spot[];

  type Row = { spots: unknown };
  const dedup = (rows: Row[]): Spot[] => {
    const seen = new Set<string>();
    const out: Spot[] = [];
    rows.forEach((r) => {
      const s = (Array.isArray(r.spots) ? r.spots[0] : r.spots) as Spot | null | undefined;
      if (s && !seen.has(s.id)) {
        seen.add(s.id);
        out.push(s);
      }
    });
    return out;
  };
  const withPhotos = dedup((photoRes.data ?? []) as Row[]);
  const withVideos = dedup((videoRes.data ?? []) as Row[]);

  return (
    <div className="space-y-8">
      <header>
        <h2 className="text-xl font-bold text-ink">📣 SNS投稿ネタ生成</h2>
        <p className="text-xs text-ink-muted mt-1">
          ブラウザのコピペで X / Facebook / LINE に流せる投稿文テンプレートと、ネタ一覧。
        </p>
      </header>

      <section>
        <h3 className="text-ink font-semibold mb-2">都道府県別 件数（多い順）</h3>
        <div className="grid gap-2 md:grid-cols-2 lg:grid-cols-3 text-sm">
          {prefSorted.slice(0, 30).map((p) => (
            <div key={p.slug} className="surface-card p-3 space-y-2">
              <div className="flex items-center justify-between">
                <Link href={`/area/${p.slug}`} className="text-ink hover:text-accent">{p.name}</Link>
                <span className="text-xs text-ink-muted">{p.count}件</span>
              </div>
              <CopyBlock label="投稿文" text={snsPostForPref(p.name, p.count)} />
            </div>
          ))}
        </div>
      </section>

      <section>
        <h3 className="text-ink font-semibold mb-2">カテゴリ別 件数</h3>
        <div className="grid gap-2 md:grid-cols-2 lg:grid-cols-3 text-sm">
          {catSorted.map((c) => (
            <div key={c.slug} className="surface-card p-3 space-y-2">
              <div className="flex items-center justify-between">
                <Link href={`/category/${c.slug}`} className="text-ink hover:text-accent">
                  {c.emoji} {c.name}
                </Link>
                <span className="text-xs text-ink-muted">{c.count}件</span>
              </div>
              <CopyBlock label="投稿文" text={snsPostForCategory(c.name, c.slug, c.count)} />
            </div>
          ))}
        </div>
      </section>

      <section>
        <h3 className="text-ink font-semibold mb-2">人気スポット（口コミ多い順）</h3>
        <SpotList spots={popular} />
      </section>

      <section>
        <h3 className="text-ink font-semibold mb-2">写真ありスポット</h3>
        <SpotList spots={withPhotos.slice(0, 20)} />
      </section>

      <section>
        <h3 className="text-ink font-semibold mb-2">動画ありスポット</h3>
        <SpotList spots={withVideos.slice(0, 20)} />
      </section>

      <section>
        <h3 className="text-ink font-semibold mb-2">新着スポット</h3>
        <SpotList spots={recent} />
      </section>
    </div>
  );
}

function SpotList({ spots }: { spots: Spot[] }) {
  if (!spots.length) return <p className="text-ink-muted text-sm">該当なし。</p>;
  return (
    <div className="grid gap-2 md:grid-cols-2 lg:grid-cols-3 text-sm">
      {spots.map((s) => (
        <div key={s.id} className="surface-card p-3 space-y-2">
          <div className="flex items-center justify-between">
            <Link href={`/spots/${encodeURIComponent(s.slug)}`} className="text-ink hover:text-accent line-clamp-1">
              {s.name}
            </Link>
            <span className="text-xs text-ink-muted">{s.prefecture}</span>
          </div>
          <CopyBlock label="投稿文" text={snsPostForSpot(s)} />
        </div>
      ))}
    </div>
  );
}

function CopyBlock({ label, text }: { label: string; text: string }) {
  return (
    <details>
      <summary className="cursor-pointer text-xs text-accent">📋 {label}を表示</summary>
      <pre className="mt-1 whitespace-pre-wrap text-[11px] bg-bg-soft border border-bg-border rounded p-2 text-ink-dim">{text}</pre>
    </details>
  );
}
