import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { ShareButtons } from '@/components/ShareButtons';
import { CATEGORIES, CATEGORY_BY_SLUG, PREFECTURES, PREFECTURE_BY_SLUG } from '@/lib/constants';
import { buildMetadata, siteUrl } from '@/lib/seo';

export const revalidate = 300;
export const dynamicParams = true;

export function generateStaticParams() {
  return CATEGORIES.map((c) => ({ categorySlug: c.slug }));
}

type Params = { categorySlug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const cat = CATEGORY_BY_SLUG[params.categorySlug];
  if (!cat) return buildMetadata({ title: 'ページが見つかりません', noindex: true });
  return buildMetadata({
    title: `${cat.name}の心霊スポット一覧`,
    description: `全国の${cat.name}に関する心霊スポット、怪談、都市伝説を地図で探せます。噂の場所を安全・合法に楽しむための情報を掲載しています。`,
    path: `/category/${cat.slug}`,
  });
}

export default async function CategoryPage({
  params,
  searchParams,
}: {
  params: Params;
  searchParams: { pref?: string };
}) {
  const cat = CATEGORY_BY_SLUG[params.categorySlug];
  if (!cat) notFound();

  const supabase = supabaseServer();

  let mainQuery = supabase
    .from('spots')
    .select(
      'id, slug, name, prefecture, prefecture_slug, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property',
      { count: 'exact' },
    )
    .eq('status', 'published')
    .eq('category_slug', cat.slug)
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false })
    .range(0, 199);
  if (searchParams.pref) mainQuery = mainQuery.eq('prefecture_slug', searchParams.pref);

  let popularQuery = supabase
    .from('spots')
    .select(
      'id, slug, name, prefecture, prefecture_slug, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property',
    )
    .eq('status', 'published')
    .eq('category_slug', cat.slug)
    .order('review_count', { ascending: false })
    .order('scary_score', { ascending: false })
    .limit(6);
  if (searchParams.pref) popularQuery = popularQuery.eq('prefecture_slug', searchParams.pref);

  const [{ data, count: totalCount }, { data: popular }, prefCountsRes] = await Promise.all([
    mainQuery,
    popularQuery,
    supabase
      .from('spots')
      .select('prefecture_slug')
      .eq('status', 'published')
      .eq('category_slug', cat.slug),
  ]);

  const spots = data ?? [];
  const popularSpots = popular ?? [];
  const total = totalCount ?? 0;

  // prefecture counts
  const prefCounts = new Map<string, number>();
  ((prefCountsRes.data ?? []) as Array<{ prefecture_slug: string }>).forEach((r) => {
    prefCounts.set(r.prefecture_slug, (prefCounts.get(r.prefecture_slug) ?? 0) + 1);
  });

  const url = new URL(`/category/${cat.slug}`, siteUrl()).toString();
  const selectedPref = searchParams.pref ? PREFECTURE_BY_SLUG[searchParams.pref] : null;

  const jsonLd = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'BreadcrumbList',
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'ホーム', item: siteUrl() },
          { '@type': 'ListItem', position: 2, name: `${cat.name}の心霊スポット一覧`, item: url },
        ],
      },
      {
        '@type': 'CollectionPage',
        name: `${cat.name}の心霊スポット一覧`,
        url,
        about: cat.name,
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
          <span className="text-ink-dim">{cat.name}</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">
          {cat.emoji} {cat.name}の心霊スポット一覧
          {selectedPref ? <span className="text-ink-dim text-base ml-2">／ {selectedPref.name}</span> : null}
        </h1>
        <div className="flex flex-wrap items-center gap-x-5 gap-y-1 text-sm text-ink-dim">
          <span>📍 掲載 <strong className="text-ink">{total.toLocaleString()}</strong> 件</span>
        </div>
        <p className="text-sm text-ink-dim leading-relaxed pt-2">
          全国の{cat.name}に関する心霊スポット、怪談、都市伝説を地図で探せます。
          掲載情報は噂・体験談・都市伝説を含むため、真偽を保証するものではありません。
          現地を訪れる場合は、立入禁止区域への侵入や近隣迷惑となる行為を絶対に避けてください。
        </p>
      </header>

      <section className="surface-soft p-4 flex flex-wrap items-center justify-between gap-3">
        <div className="text-sm text-ink-dim">
          {cat.name}の噂をご存じですか？投稿は<strong className="text-ink">承認制 / 無料</strong>です。
        </div>
        <Link href="/submit/spot" className="btn-primary text-sm">情報を投稿する</Link>
      </section>

      <section className="surface-card p-3 flex flex-wrap items-center gap-2 text-sm">
        <span className="text-ink-dim">都道府県フィルター:</span>
        <Link
          href={`/category/${cat.slug}`}
          className={`rounded px-2 py-1 border ${!searchParams.pref ? 'border-accent text-ink' : 'border-bg-border text-ink-dim hover:text-ink'}`}
        >
          すべて
        </Link>
        {PREFECTURES.map((p) => {
          const n = prefCounts.get(p.slug) ?? 0;
          if (n === 0) return null;
          return (
            <Link
              key={p.slug}
              href={`/category/${cat.slug}?pref=${p.slug}`}
              className={`rounded px-2 py-1 border text-xs ${
                searchParams.pref === p.slug
                  ? 'border-accent text-ink'
                  : 'border-bg-border text-ink-dim hover:text-ink'
              }`}
            >
              {p.name}
              <span className="ml-1 text-ink-muted">{n}</span>
            </Link>
          );
        })}
      </section>

      {popularSpots.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">人気の{cat.name}スポット</h2>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {popularSpots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        </section>
      )}

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">怖さランキング</h2>
        {spots.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim">
            該当する公開中スポットはまだありません。
          </p>
        ) : (
          <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {spots.map((s) => <li key={s.id}><SpotCard spot={s} /></li>)}
          </ul>
        )}
      </section>

      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">このページをシェア</h3>
        <ShareButtons
          title={`${cat.name}の心霊スポットを地図で探せる｜心霊マップ`}
          url={url}
        />
      </section>

      <DisclaimerBox compact />
    </div>
  );
}
