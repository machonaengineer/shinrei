import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { COUNTRIES } from '@/lib/constants';
import { buildMetadata } from '@/lib/seo';
import type { SpotPin } from '@/types/spot';

export const revalidate = 300;

export const metadata: Metadata = buildMetadata({
  title: '世界の心霊スポット一覧',
  description: '世界各国で語られる心霊スポット、怪談、都市伝説、伝承を地図で探せます。掲載内容はユーザー投稿・公開情報をもとにした体験談・伝承であり、真偽を保証するものではありません。',
  path: '/world',
});

export default async function WorldPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select('id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, city, description, scary_score, review_count, is_entry_prohibited, is_private_property')
    .eq('status', 'published')
    .neq('country_slug', 'japan')
    .order('scary_score', { ascending: false })
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
        <h1 className="text-2xl md:text-3xl font-bold text-ink">🌐 世界の心霊スポット一覧</h1>
        <p className="text-sm text-ink-dim mt-1">
          世界各国で語られる心霊スポット・怪談・都市伝説・伝承。掲載内容はユーザー投稿・公開情報に基づく体験談・伝承です。
        </p>
      </header>

      {pins.length > 0 && <MapViewDynamic spots={pins} height="50vh" zoom={2} center={[20, 0]} />}

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">国から探す</h2>
        <div className="flex flex-wrap gap-2">
          {COUNTRIES.filter((c) => c.slug !== 'japan').map((c) => (
            <Link
              key={c.slug}
              href={`/country/${c.slug}`}
              className="rounded-full border border-bg-border bg-bg-card px-3 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
            >
              <span className="mr-1" aria-hidden>{c.emoji}</span>{c.name}
            </Link>
          ))}
        </div>
      </section>

      {spots.length === 0 ? (
        <p className="surface-card p-6 text-center text-ink-dim">公開中の海外スポットはまだありません。</p>
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
