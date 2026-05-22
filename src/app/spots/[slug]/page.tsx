import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { ReviewCard } from '@/components/ReviewCard';
import { CategoryBadge } from '@/components/CategoryBadge';
import { ScaryScore } from '@/components/ScaryScore';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { WarningBox } from '@/components/WarningBox';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';
import type { SpotPin } from '@/types/spot';

export const revalidate = 60;

type Params = { slug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select('name, description, prefecture, category, slug, status')
    .eq('slug', params.slug)
    .single();

  if (!data || data.status !== 'published') {
    return buildMetadata({ title: 'スポットが見つかりません', path: `/spots/${params.slug}`, noindex: true });
  }
  const title = `${data.name}の口コミ・心霊体験談`;
  const description = `${data.prefecture}の心霊スポット「${data.name}」（カテゴリ:${data.category}）の口コミ、怪談、都市伝説。掲載内容はユーザー投稿に基づく体験談であり、真偽を保証するものではありません。`;
  return buildMetadata({
    title,
    description,
    path: `/spots/${data.slug}`,
  });
}

export default async function SpotDetailPage({ params }: { params: Params }) {
  const supabase = supabaseServer();

  const { data: spot } = await supabase
    .from('spots')
    .select('*')
    .eq('slug', params.slug)
    .eq('status', 'published')
    .single();

  if (!spot) notFound();

  const { data: reviewsData } = await supabase
    .from('reviews')
    .select('*')
    .eq('spot_id', spot.id)
    .eq('status', 'published')
    .order('created_at', { ascending: false })
    .limit(50);

  const reviews = reviewsData ?? [];

  const pin: SpotPin = {
    id: spot.id,
    slug: spot.slug,
    name: spot.name,
    lat: spot.lat,
    lng: spot.lng,
    category: spot.category,
    category_slug: spot.category_slug,
    prefecture: spot.prefecture,
    prefecture_slug: spot.prefecture_slug,
    scary_score: spot.scary_score,
    review_count: spot.review_count,
    is_entry_prohibited: spot.is_entry_prohibited,
    is_private_property: spot.is_private_property,
  };

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Place',
    name: spot.name,
    description: spot.description ?? undefined,
    address: {
      '@type': 'PostalAddress',
      addressRegion: spot.prefecture,
      addressLocality: spot.city ?? undefined,
      addressCountry: 'JP',
    },
    geo: {
      '@type': 'GeoCoordinates',
      latitude: spot.lat,
      longitude: spot.lng,
    },
    url: new URL(`/spots/${spot.slug}`, siteUrl()).toString(),
    aggregateRating: spot.review_count > 0 ? {
      '@type': 'AggregateRating',
      ratingValue: Number(spot.scary_score),
      reviewCount: spot.review_count,
      bestRating: 5,
      worstRating: 1,
    } : undefined,
    isAccessibleForFree: true,
    publisher: { '@type': 'Organization', name: SITE_NAME },
  };

  return (
    <div className="mx-auto max-w-4xl px-4 py-8 space-y-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <nav className="text-xs text-ink-muted">
        <Link href="/" className="hover:text-ink">ホーム</Link>
        <span className="mx-1">/</span>
        <Link href={`/area/${spot.prefecture_slug}`} className="hover:text-ink">{spot.prefecture}</Link>
        <span className="mx-1">/</span>
        <Link href={`/category/${spot.category_slug}`} className="hover:text-ink">{spot.category}</Link>
        <span className="mx-1">/</span>
        <span className="text-ink-dim">{spot.name}</span>
      </nav>

      <header className="space-y-2">
        <div className="flex items-center gap-2">
          <CategoryBadge slug={spot.category_slug} />
          <span className="text-xs text-ink-muted">{spot.prefecture}{spot.city ? ` / ${spot.city}` : ''}</span>
        </div>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">{spot.name}</h1>
        <div className="flex items-center gap-4 flex-wrap">
          <ScaryScore value={spot.scary_score} size="md" />
          <span className="text-sm text-ink-dim">口コミ {spot.review_count}件</span>
          <span className="text-sm text-ink-dim">危険度 {spot.danger_level}/5</span>
        </div>
      </header>

      <MapViewDynamic
        spots={[pin]}
        height="40vh"
        center={[spot.lat, spot.lng]}
        zoom={13}
        singleSpotName={spot.name}
      />

      <section className="space-y-2">
        <h2 className="text-lg font-semibold text-ink">概要</h2>
        {spot.address_public && (
          <p className="text-sm text-ink-dim">公開用住所：{spot.address_public}</p>
        )}
        <p className="text-ink-dim whitespace-pre-wrap leading-relaxed">{spot.description}</p>
      </section>

      <WarningBox>
        私有地、立入禁止区域、危険区域への侵入は絶対に行わないでください。本サイトは現地訪問や探索を推奨するものではありません。
        {spot.is_entry_prohibited && <strong className="block mt-1 text-accent-gold">このスポットは立入禁止区域とされています。</strong>}
        {spot.is_private_property && <strong className="block mt-1 text-accent-gold">このスポットは私有地とされています。</strong>}
      </WarningBox>

      <section className="space-y-3">
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-semibold text-ink">投稿された口コミ</h2>
          <Link href={`/spots/${spot.slug}/review`} className="btn-primary text-sm">体験談を投稿する</Link>
        </div>
        {reviews.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim">まだ口コミはありません。</p>
        ) : (
          <div className="grid gap-3">
            {reviews.map((r) => (
              <ReviewCard key={r.id} review={r} />
            ))}
          </div>
        )}
      </section>

      <DisclaimerBox />

      <div className="flex flex-wrap gap-3 text-sm">
        <Link href={`/report?targetType=spot&targetId=${spot.id}`} className="btn-secondary">
          この投稿を通報する
        </Link>
        <Link
          href={`/removal-request?targetUrl=${encodeURIComponent(new URL(`/spots/${spot.slug}`, siteUrl()).toString())}`}
          className="btn-secondary"
        >
          削除依頼を送る
        </Link>
      </div>
    </div>
  );
}
