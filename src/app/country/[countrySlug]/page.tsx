import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { COUNTRIES, COUNTRY_BY_SLUG } from '@/lib/constants';
import { buildMetadata } from '@/lib/seo';
import type { SpotPin } from '@/types/spot';

export const revalidate = 300;
export const dynamicParams = true;

export function generateStaticParams() {
  return COUNTRIES.map((c) => ({ countrySlug: c.slug }));
}

type Params = { countrySlug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const country = COUNTRY_BY_SLUG[params.countrySlug];
  if (!country) return buildMetadata({ title: 'ページが見つかりません', noindex: true });
  return buildMetadata({
    title: `${country.name}の心霊スポット一覧`,
    description: `${country.name}で語られる心霊スポット、怪談、都市伝説の口コミを地図で探せます。掲載内容はユーザー投稿・公開情報をもとにした体験談・伝承であり、真偽を保証するものではありません。`,
    path: `/country/${country.slug}`,
  });
}

export default async function CountryPage({ params }: { params: Params }) {
  const country = COUNTRY_BY_SLUG[params.countrySlug];
  if (!country) notFound();

  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select('id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, city, description, scary_score, review_count, is_entry_prohibited, is_private_property')
    .eq('status', 'published')
    .eq('country_slug', country.slug)
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false })
    .limit(200);

  const spots = data ?? [];
  const pins: SpotPin[] = spots.map((s) => ({
    id: s.id, slug: s.slug, name: s.name, lat: s.lat, lng: s.lng,
    category: s.category, category_slug: s.category_slug,
    country: s.country, country_slug: s.country_slug,
    prefecture: s.prefecture, prefecture_slug: s.prefecture_slug,
    scary_score: s.scary_score, review_count: s.review_count,
    is_entry_prohibited: s.is_entry_prohibited, is_private_property: s.is_private_property,
  }));

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">
          {country.emoji} {country.name}の心霊スポット一覧
        </h1>
        <p className="text-sm text-ink-dim mt-1">
          {country.name}で語られる心霊スポット・怪談・都市伝説。掲載内容はユーザー投稿・公開情報に基づく体験談・伝承です。
        </p>
      </header>

      {pins.length > 0 && <MapViewDynamic spots={pins} height="40vh" />}

      {spots.length === 0 ? (
        <p className="surface-card p-6 text-center text-ink-dim">
          {country.name}の公開中スポットはまだありません。
        </p>
      ) : (
        <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {spots.map((s) => (
            <li key={s.id}><SpotCard spot={s} /></li>
          ))}
        </ul>
      )}

      <DisclaimerBox compact />
    </div>
  );
}
