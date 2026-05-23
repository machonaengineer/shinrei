import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { PREFECTURE_BY_SLUG, PREFECTURES, CATEGORIES } from '@/lib/constants';
import { buildMetadata } from '@/lib/seo';
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
    description: `${pref.name}で噂される心霊スポット、怪談、都市伝説の口コミを地図で探せます。掲載内容はユーザー投稿に基づく体験談であり、真偽を保証するものではありません。`,
    path: `/area/${pref.slug}`,
  });
}

export default async function AreaPage({ params }: { params: Params }) {
  const pref = PREFECTURE_BY_SLUG[params.prefectureSlug];
  if (!pref) notFound();

  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select('id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, city, description, scary_score, review_count, is_entry_prohibited, is_private_property')
    .eq('status', 'published')
    .eq('prefecture_slug', pref.slug)
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false })
    .limit(200);

  const spots = data ?? [];
  const pins: SpotPin[] = spots.map((s) => ({
    id: s.id,
    slug: s.slug,
    name: s.name,
    lat: s.lat,
    lng: s.lng,
    category: s.category,
    category_slug: s.category_slug,
    country: s.country,
    country_slug: s.country_slug,
    prefecture: s.prefecture,
    prefecture_slug: s.prefecture_slug,
    scary_score: s.scary_score,
    review_count: s.review_count,
    is_entry_prohibited: s.is_entry_prohibited,
    is_private_property: s.is_private_property,
  }));

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">{pref.name}の心霊スポット一覧</h1>
        <p className="text-sm text-ink-dim mt-1">
          {pref.name}で噂される心霊スポット・怪談・都市伝説の口コミ。掲載内容はユーザー投稿に基づく体験談です。
        </p>
      </header>

      {pins.length > 0 && <MapViewDynamic spots={pins} height="40vh" />}

      {spots.length === 0 ? (
        <p className="surface-card p-6 text-center text-ink-dim">
          {pref.name}の公開中スポットはまだありません。
        </p>
      ) : (
        <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {spots.map((s) => (
            <li key={s.id}><SpotCard spot={s} /></li>
          ))}
        </ul>
      )}

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">カテゴリから探す</h2>
        <div className="flex flex-wrap gap-2">
          {CATEGORIES.map((c) => (
            <Link
              key={c.slug}
              href={`/category/${c.slug}`}
              className="rounded-full border border-bg-border bg-bg-card px-3 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
            >
              <span className="mr-1" aria-hidden>{c.emoji}</span>{c.name}
            </Link>
          ))}
        </div>
      </section>

      <DisclaimerBox compact />
    </div>
  );
}
