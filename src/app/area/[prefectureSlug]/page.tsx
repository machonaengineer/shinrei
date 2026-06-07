import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { ShareButtons } from '@/components/ShareButtons';
import { AdSlot } from '@/components/AdSlot';
import { PREFECTURE_BY_SLUG, PREFECTURES, CATEGORIES, CATEGORY_BY_SLUG } from '@/lib/constants';
import { buildMetadata, siteUrl } from '@/lib/seo';
import type { SpotPin } from '@/types/spot';

export const revalidate = 300;
export const dynamicParams = true;

export function generateStaticParams() {
  return PREFECTURES.map((p) => ({ prefectureSlug: p.slug }));
}

type Params = { prefectureSlug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const pref = PREFECTURE_BY_SLUG[params.prefectureSlug];
  if (!pref) return buildMetadata({ title: 'ページが見つかりません', noindex: true });
  return buildMetadata({
    title: `${pref.name}の心霊スポット一覧`,
    description: `${pref.name}にある心霊スポット、怪談、都市伝説を地図で探せます。トンネル、廃墟、公園、橋、山道など、噂の場所を安全・合法に楽しむための情報を掲載しています。`,
    path: `/area/${pref.slug}`,
  });
}

export default async function AreaPage({ params }: { params: Params }) {
  const pref = PREFECTURE_BY_SLUG[params.prefectureSlug];
  if (!pref) notFound();

  const supabase = supabaseServer();

  // メインリスト + 派生クエリを並列実行
  const [{ data: spotsData, count: totalCount }, { data: popular }, withImageRes, withVideoRes, categoryCountsRes] =
    await Promise.all([
      supabase
        .from('spots')
        .select(
          'id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, city, description, scary_score, review_count, is_entry_prohibited, is_private_property',
          { count: 'exact' },
        )
        .eq('status', 'published')
        .eq('prefecture_slug', pref.slug)
        .order('scary_score', { ascending: false })
        .order('review_count', { ascending: false })
        .range(0, 199),
      supabase
        .from('spots')
        .select(
          'id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property',
        )
        .eq('status', 'published')
        .eq('prefecture_slug', pref.slug)
        .order('review_count', { ascending: false })
        .order('scary_score', { ascending: false })
        .limit(6),
      // spots with at least one published image
      supabase
        .from('spot_images')
        .select('spot_id, spots!inner(id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, prefecture_slug, status, is_entry_prohibited, is_private_property)')
        .eq('status', 'published')
        .eq('spots.status', 'published')
        .eq('spots.prefecture_slug', pref.slug)
        .limit(6),
      supabase
        .from('spot_videos')
        .select('spot_id, spots!inner(id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, prefecture_slug, status, is_entry_prohibited, is_private_property)')
        .eq('status', 'published')
        .eq('spots.status', 'published')
        .eq('spots.prefecture_slug', pref.slug)
        .limit(6),
      supabase
        .from('spots')
        .select('category_slug')
        .eq('status', 'published')
        .eq('prefecture_slug', pref.slug),
    ]);

  const spots = spotsData ?? [];
  const popularSpots = popular ?? [];

  type WithSpot = { spots: unknown };
  const dedupBySpotId = <T extends { id: string }>(arr: T[]) => {
    const seen = new Set<string>();
    return arr.filter((s) => (seen.has(s.id) ? false : seen.add(s.id)));
  };
  const photoSpots = dedupBySpotId(
    ((withImageRes.data ?? []) as WithSpot[])
      .map((r) => (Array.isArray(r.spots) ? r.spots[0] : r.spots))
      .filter((x): x is NonNullable<typeof x> => Boolean(x)) as Array<{
        id: string; slug: string; name: string; prefecture: string; city: string | null;
        category_slug: string; description: string | null; scary_score: number; review_count: number;
        is_entry_prohibited: boolean; is_private_property: boolean;
      }>,
  );
  const videoSpots = dedupBySpotId(
    ((withVideoRes.data ?? []) as WithSpot[])
      .map((r) => (Array.isArray(r.spots) ? r.spots[0] : r.spots))
      .filter((x): x is NonNullable<typeof x> => Boolean(x)) as Array<{
        id: string; slug: string; name: string; prefecture: string; city: string | null;
        category_slug: string; description: string | null; scary_score: number; review_count: number;
        is_entry_prohibited: boolean; is_private_property: boolean;
      }>,
  );

  // category counts
  const catCounts = new Map<string, number>();
  ((categoryCountsRes.data ?? []) as Array<{ category_slug: string }>).forEach((r) => {
    catCounts.set(r.category_slug, (catCounts.get(r.category_slug) ?? 0) + 1);
  });

  const pins: SpotPin[] = spots.map((s) => ({
    id: s.id, slug: s.slug, name: s.name, lat: s.lat, lng: s.lng,
    category: s.category, category_slug: s.category_slug,
    country: s.country, country_slug: s.country_slug,
    prefecture: s.prefecture, prefecture_slug: s.prefecture_slug,
    scary_score: s.scary_score, review_count: s.review_count,
    is_entry_prohibited: s.is_entry_prohibited, is_private_property: s.is_private_property,
  }));

  const total = totalCount ?? 0;
  const url = new URL(`/area/${pref.slug}`, siteUrl()).toString();

  // JSON-LD: BreadcrumbList + CollectionPage
  const jsonLd = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'BreadcrumbList',
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'ホーム', item: siteUrl() },
          { '@type': 'ListItem', position: 2, name: `${pref.name}の心霊スポット一覧`, item: url },
        ],
      },
      {
        '@type': 'CollectionPage',
        name: `${pref.name}の心霊スポット一覧`,
        url,
        about: pref.name,
      },
    ],
  };

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <header className="space-y-2">
        <nav className="text-xs text-ink-muted">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">{pref.name}</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">{pref.name}の心霊スポット一覧</h1>
        <div className="flex flex-wrap items-center gap-x-5 gap-y-1 text-sm text-ink-dim">
          <span>📍 掲載 <strong className="text-ink">{total.toLocaleString()}</strong> 件</span>
          <span>📸 写真あり <strong className="text-ink">{photoSpots.length}</strong> 件</span>
          <span>🎬 動画あり <strong className="text-ink">{videoSpots.length}</strong> 件</span>
        </div>
        <p className="text-sm text-ink-dim leading-relaxed pt-2">
          {pref.name}には、トンネル、廃墟、公園、橋、山道など、さまざまな噂や怪談が語られるスポットがあります。
          心霊マップでは、{pref.name}の心霊スポットを地図やカテゴリから探せます。
          掲載情報は噂・体験談・都市伝説を含むため、真偽を保証するものではありません。
          現地を訪れる場合は、立入禁止区域への侵入や近隣迷惑となる行為を絶対に避けてください。
        </p>
      </header>

      {pins.length > 0 && <MapViewDynamic spots={pins} height="40vh" />}

      <section className="surface-soft p-4 flex flex-wrap items-center justify-between gap-3">
        <div className="text-sm text-ink-dim">
          {pref.name}の噂をご存じですか？口コミ・写真の投稿は<strong className="text-ink">承認制 / 無料</strong>です。
        </div>
        <div className="flex gap-2">
          <Link href="/submit/spot" className="btn-primary text-sm">地元の噂を投稿する</Link>
        </div>
      </section>

      <AdSlot slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_AREA} format="auto" />

      {popularSpots.length > 0 && (
        <section>
          <div className="flex items-end justify-between mb-3">
            <h2 className="text-lg font-semibold text-ink">{pref.name}の人気スポット</h2>
            <Link href="/ranking" className="text-sm text-accent hover:underline">ランキング全体 →</Link>
          </div>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {popularSpots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        </section>
      )}

      <section>
        <h2 className="text-lg font-semibold text-ink mb-3">カテゴリ別の件数</h2>
        <div className="flex flex-wrap gap-2">
          {CATEGORIES.map((c) => {
            const n = catCounts.get(c.slug) ?? 0;
            return (
              <Link
                key={c.slug}
                href={`/category/${c.slug}?pref=${pref.slug}`}
                className={`rounded-full border px-3 py-1 text-sm ${
                  n > 0
                    ? 'border-bg-border bg-bg-card text-ink-dim hover:border-accent hover:text-ink'
                    : 'border-bg-border bg-bg-soft text-ink-muted'
                }`}
              >
                <span className="mr-1" aria-hidden>{c.emoji}</span>
                {c.name}
                <span className="ml-1.5 text-xs text-ink-muted">{n}</span>
              </Link>
            );
          })}
        </div>
      </section>

      {photoSpots.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">📸 写真ありスポット</h2>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {photoSpots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        </section>
      )}

      {videoSpots.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">🎬 動画ありスポット</h2>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {videoSpots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        </section>
      )}

      {spots.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">すべてのスポット（上位200件）</h2>
          <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {spots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        </section>
      )}

      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">{pref.name}のページをシェア</h3>
        <ShareButtons
          title={`${pref.name}の心霊スポットを地図で探せるページ｜心霊マップ`}
          url={url}
        />
      </section>

      <DisclaimerBox compact />
    </div>
  );
}
