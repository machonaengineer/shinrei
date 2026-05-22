import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { CATEGORIES, CATEGORY_BY_SLUG, PREFECTURES } from '@/lib/constants';
import { buildMetadata } from '@/lib/seo';

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
    title: `全国の${cat.name}系心霊スポット一覧`,
    description: `${cat.name}カテゴリの心霊スポット、怪談、都市伝説の口コミを地図で探せます。掲載内容はユーザー投稿に基づく体験談であり、真偽を保証するものではありません。`,
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
  let query = supabase
    .from('spots')
    .select('id, slug, name, prefecture, prefecture_slug, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
    .eq('status', 'published')
    .eq('category_slug', cat.slug)
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false })
    .limit(200);

  if (searchParams.pref) {
    query = query.eq('prefecture_slug', searchParams.pref);
  }

  const { data } = await query;
  const spots = data ?? [];

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">
          {cat.emoji} {cat.name}系の心霊スポット一覧
        </h1>
        <p className="text-sm text-ink-dim mt-1">
          {cat.name}カテゴリの心霊スポット・怪談・都市伝説の口コミ。掲載内容はユーザー投稿に基づく体験談です。
        </p>
      </header>

      <div className="surface-card p-3 flex flex-wrap items-center gap-2 text-sm">
        <span className="text-ink-dim">都道府県フィルター:</span>
        <Link
          href={`/category/${cat.slug}`}
          className={`rounded px-2 py-1 border ${!searchParams.pref ? 'border-accent text-ink' : 'border-bg-border text-ink-dim hover:text-ink'}`}
        >
          すべて
        </Link>
        {PREFECTURES.map((p) => (
          <Link
            key={p.slug}
            href={`/category/${cat.slug}?pref=${p.slug}`}
            className={`rounded px-2 py-1 border ${searchParams.pref === p.slug ? 'border-accent text-ink' : 'border-bg-border text-ink-dim hover:text-ink'}`}
          >
            {p.name}
          </Link>
        ))}
      </div>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">怖さランキング</h2>
        {spots.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim">
            該当する公開中スポットはまだありません。
          </p>
        ) : (
          <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {spots.map((s) => (
              <li key={s.id}><SpotCard spot={s} /></li>
            ))}
          </ul>
        )}
      </section>

      <DisclaimerBox compact />
    </div>
  );
}
