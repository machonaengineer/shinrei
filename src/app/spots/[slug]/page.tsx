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
import { PhotoGallery } from '@/components/PhotoGallery';
import { VideoEmbed, VideoSearchLinks } from '@/components/VideoEmbed';
import { VideoSubmitForm } from '@/components/VideoSubmitForm';
import { ShareButtons } from '@/components/ShareButtons';
import { SpotCard } from '@/components/SpotCard';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { decodeSlug } from '@/lib/utils';
import { SITE_NAME, COUNTRY_BY_SLUG, PREFECTURE_BY_SLUG, CATEGORY_BY_SLUG } from '@/lib/constants';
import type { SpotPin } from '@/types/spot';

export const revalidate = 60;

type Params = { slug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const supabase = supabaseServer();
  const slug = decodeSlug(params.slug);
  const { data } = await supabase
    .from('spots')
    .select('name, description, country, prefecture, category, slug, status')
    .eq('slug', slug)
    .single();

  if (!data || data.status !== 'published') {
    return buildMetadata({ title: 'スポットが見つかりません', path: `/spots/${params.slug}`, noindex: true });
  }
  const where = data.country && data.country !== '日本' ? `${data.country} ${data.prefecture}` : data.prefecture;
  const title = `${data.name}｜${where}の心霊スポット`;
  const description = `${data.name}は${where}にある心霊・怪談スポットです。噂や口コミ、写真、動画、周辺スポットを確認できます。無断侵入や迷惑行為は行わず、安全に閲覧してください。`;
  return buildMetadata({
    title,
    description,
    path: `/spots/${data.slug}`,
  });
}

export default async function SpotDetailPage({ params }: { params: Params }) {
  const supabase = supabaseServer();
  const slug = decodeSlug(params.slug);

  const { data: spot } = await supabase
    .from('spots')
    .select('*')
    .eq('slug', slug)
    .eq('status', 'published')
    .single();

  if (!spot) notFound();

  const [{ data: reviewsData }, { data: imagesData }, { data: videosData }, { data: relatedPref }, { data: relatedCat }] = await Promise.all([
    supabase
      .from('reviews')
      .select('*')
      .eq('spot_id', spot.id)
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(50),
    supabase
      .from('spot_images')
      .select('*')
      .eq('spot_id', spot.id)
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(24),
    supabase
      .from('spot_videos')
      .select('*')
      .eq('spot_id', spot.id)
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(6),
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .eq('prefecture_slug', spot.prefecture_slug)
      .neq('id', spot.id)
      .order('scary_score', { ascending: false })
      .limit(6),
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .eq('category_slug', spot.category_slug)
      .neq('id', spot.id)
      .order('scary_score', { ascending: false })
      .limit(6),
  ]);

  const reviews = reviewsData ?? [];
  const images = imagesData ?? [];
  const videos = videosData ?? [];
  const relatedByPref = relatedPref ?? [];
  const relatedByCat = relatedCat ?? [];

  const pin: SpotPin = {
    id: spot.id,
    slug: spot.slug,
    name: spot.name,
    lat: spot.lat,
    lng: spot.lng,
    category: spot.category,
    category_slug: spot.category_slug,
    country: spot.country,
    country_slug: spot.country_slug,
    prefecture: spot.prefecture,
    prefecture_slug: spot.prefecture_slug,
    scary_score: spot.scary_score,
    review_count: spot.review_count,
    is_entry_prohibited: spot.is_entry_prohibited,
    is_private_property: spot.is_private_property,
  };

  const isForeign = spot.country_slug && spot.country_slug !== 'japan';
  const countryEmoji = COUNTRY_BY_SLUG[spot.country_slug]?.emoji ?? '🌐';

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Place',
    name: spot.name,
    description: spot.description ?? undefined,
    address: {
      '@type': 'PostalAddress',
      addressRegion: spot.prefecture,
      addressLocality: spot.city ?? undefined,
      addressCountry: spot.country_slug === 'japan' ? 'JP' : spot.country,
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
        {isForeign ? (
          <>
            <Link href={`/country/${spot.country_slug}`} className="hover:text-ink">{spot.country}</Link>
            <span className="mx-1">/</span>
            <span className="text-ink-dim">{spot.prefecture}</span>
          </>
        ) : (
          <Link href={`/area/${spot.prefecture_slug}`} className="hover:text-ink">{spot.prefecture}</Link>
        )}
        <span className="mx-1">/</span>
        <Link href={`/category/${spot.category_slug}`} className="hover:text-ink">{spot.category}</Link>
        <span className="mx-1">/</span>
        <span className="text-ink-dim">{spot.name}</span>
      </nav>

      <header className="space-y-2">
        <div className="flex items-center gap-2 flex-wrap">
          <CategoryBadge slug={spot.category_slug} />
          {isForeign && (
            <span className="inline-flex items-center gap-1 rounded-full border border-accent/40 bg-accent/10 px-2 py-0.5 text-xs text-ink">
              {countryEmoji} {spot.country}
            </span>
          )}
          <span className="text-xs text-ink-muted">{spot.prefecture}{spot.city ? ` / ${spot.city}` : ''}</span>
        </div>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">{spot.name}</h1>
        <div className="flex items-center gap-4 flex-wrap">
          <ScaryScore value={spot.scary_score} size="md" />
          <span className="text-sm text-ink-dim">口コミ {spot.review_count}件</span>
          <span className="text-sm text-ink-dim">危険度 {spot.danger_level}/5</span>
        </div>
      </header>

      {/* 1. 地図 */}
      <MapViewDynamic
        spots={[pin]}
        height="40vh"
        center={[spot.lat, spot.lng]}
        zoom={13}
        singleSpotName={spot.name}
      />

      {/* 2. 概要 */}
      <section className="space-y-2">
        <h2 className="text-lg font-semibold text-ink">概要</h2>
        {spot.address_public && (
          <p className="text-sm text-ink-dim">公開用住所：{spot.address_public}</p>
        )}
        <p className="text-ink-dim whitespace-pre-wrap leading-relaxed">{spot.description}</p>
      </section>

      {/* 3. 現地写真・投稿写真 */}
      <section className="space-y-3">
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-semibold text-ink">現地写真・投稿写真</h2>
          <Link href={`/spots/${spot.slug}/photo`} className="btn-secondary text-sm">写真を投稿</Link>
        </div>
        <PhotoGallery images={images} spotSlug={spot.slug} />
      </section>

      {/* 4. 現地動画・関連動画 */}
      <section className="space-y-3">
        <div className="flex items-center justify-between">
          <h2 className="text-lg font-semibold text-ink">現地動画・関連動画</h2>
        </div>
        {videos.length > 0 ? (
          <div className="grid gap-3 md:grid-cols-2">
            {videos.map((v) => (
              <VideoEmbed key={v.id} video={v} />
            ))}
          </div>
        ) : (
          <div className="surface-card p-4 text-center text-sm text-ink-dim">
            まだ承認済みの関連動画はありません。
          </div>
        )}
        <VideoSearchLinks spotName={spot.name} />
        <details className="surface-soft p-3 text-sm">
          <summary className="cursor-pointer text-ink-dim">関連動画URLを投稿する</summary>
          <div className="mt-3">
            <VideoSubmitForm spotSlug={spot.slug} />
          </div>
        </details>
      </section>

      {/* 5. 口コミ */}
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

      {/* 6. 注意喚起 */}
      <WarningBox>
        私有地、立入禁止区域、危険区域への侵入は絶対に行わないでください。本サイトは現地訪問や探索を推奨するものではありません。
        {spot.is_entry_prohibited && <strong className="block mt-1 text-accent-gold">このスポットは立入禁止区域とされています。</strong>}
        {spot.is_private_property && <strong className="block mt-1 text-accent-gold">このスポットは私有地とされています。</strong>}
      </WarningBox>

      <DisclaimerBox />

      {/* 関連スポット（内部リンク強化） */}
      {relatedByPref.length > 0 && (
        <section className="space-y-3">
          <div className="flex items-center justify-between">
            <h2 className="text-lg font-semibold text-ink">
              {PREFECTURE_BY_SLUG[spot.prefecture_slug]?.name ?? spot.prefecture}の他のスポット
            </h2>
            <Link href={isForeign ? `/country/${spot.country_slug}` : `/area/${spot.prefecture_slug}`} className="text-sm text-accent hover:underline">
              すべて見る →
            </Link>
          </div>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {relatedByPref.map((s) => (
              <li key={s.id}><SpotCard spot={s} /></li>
            ))}
          </ul>
        </section>
      )}

      {relatedByCat.length > 0 && (
        <section className="space-y-3">
          <div className="flex items-center justify-between">
            <h2 className="text-lg font-semibold text-ink">
              {CATEGORY_BY_SLUG[spot.category_slug]?.name ?? spot.category}カテゴリの他のスポット
            </h2>
            <Link href={`/category/${spot.category_slug}`} className="text-sm text-accent hover:underline">
              すべて見る →
            </Link>
          </div>
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {relatedByCat.map((s) => (
              <li key={s.id}><SpotCard spot={s} /></li>
            ))}
          </ul>
        </section>
      )}

      {/* シェア */}
      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">このスポットをシェア</h3>
        <ShareButtons
          title={`${spot.name}｜心霊マップ`}
          url={new URL(`/spots/${spot.slug}`, siteUrl()).toString()}
        />
      </section>

      {/* 8. 通報・削除依頼 */}
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
