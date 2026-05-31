import Link from 'next/link';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { ReviewCard } from '@/components/ReviewCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { VisitorCounter } from '@/components/VisitorCounter';
import { CATEGORIES, COUNTRIES, PREFECTURES, REGIONS, SITE_NAME, SITE_TAGLINE, SITE_DESCRIPTION } from '@/lib/constants';
import { ARTICLES } from '@/content/articles';
import { buildMetadata } from '@/lib/seo';
import { formatDate } from '@/lib/utils';
import type { Metadata } from 'next';

export const revalidate = 300;

const TOP_TITLE = '心霊マップ｜全国の心霊スポット・怪談・都市伝説を地図で検索';
const TOP_DESC =
  '全国の心霊スポット、怪談、都市伝説を地図で探せる心霊マップ。都道府県別、カテゴリ別、現在地周辺から検索可能。安全・合法に噂の場所を楽しむための情報サイトです。';

export const metadata: Metadata = {
  title: TOP_TITLE,
  description: TOP_DESC,
  alternates: {
    canonical: '/',
    languages: { ja: '/', en: '/en' },
  },
  openGraph: {
    title: TOP_TITLE,
    description: TOP_DESC,
    type: 'website',
    locale: 'ja_JP',
  },
  twitter: {
    card: 'summary_large_image',
    title: TOP_TITLE,
    description: TOP_DESC,
  },
};

export default async function HomePage() {
  const supabase = supabaseServer();

  const [{ data: popularSpots }, { data: latestReviews }, { count: totalSpots }, { count: foreignSpots }] = await Promise.all([
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .order('review_count', { ascending: false })
      .order('scary_score', { ascending: false })
      .limit(6),
    supabase
      .from('reviews')
      .select('*')
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(5),
    supabase.from('spots').select('id', { count: 'exact', head: true }).eq('status', 'published'),
    supabase.from('spots').select('id', { count: 'exact', head: true }).eq('status', 'published').neq('country_slug', 'japan'),
  ]);

  const spots = popularSpots ?? [];
  const reviews = latestReviews ?? [];
  const totalSpotCount = totalSpots ?? 0;
  const foreignSpotCount = foreignSpots ?? 0;
  const domesticSpotCount = totalSpotCount - foreignSpotCount;

  return (
    <div className="mx-auto max-w-6xl px-4 py-10 space-y-12">
      <section className="text-center space-y-5">
        <p className="text-accent text-sm tracking-widest">👻 SHINREI MAP 👻</p>
        <h1 className="text-3xl md:text-5xl font-bold text-ink leading-tight">
          全国の心霊・怪談スポットを地図で探す
        </h1>
        <p className="text-ink-dim max-w-2xl mx-auto">
          近くの&ldquo;噂の場所&rdquo;を、安全・合法に楽しむ心霊マップ。
        </p>
        {totalSpotCount > 0 && (
          <div className="flex flex-wrap items-center justify-center gap-x-6 gap-y-2 text-sm text-ink-dim">
            <span>📍 掲載スポット <strong className="text-ink text-base">{totalSpotCount.toLocaleString()}</strong>件</span>
            <span>🇯🇵 国内 <strong className="text-ink">{domesticSpotCount.toLocaleString()}</strong>件</span>
            <span>🌐 海外 <strong className="text-ink">{foreignSpotCount.toLocaleString()}</strong>件</span>
          </div>
        )}
        <div className="grid gap-3 sm:grid-cols-2 md:grid-cols-3 max-w-3xl mx-auto pt-2">
          <Link
            href="/map?near=1"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">📍</div>
            <div className="font-semibold text-ink">近くの心霊スポットを探す</div>
            <div className="text-xs text-ink-dim mt-1">現在地の周辺を地図で表示</div>
          </Link>
          <Link
            href="#area"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">🗾</div>
            <div className="font-semibold text-ink">都道府県から探す</div>
            <div className="text-xs text-ink-dim mt-1">47 都道府県を一覧表示</div>
          </Link>
          <Link
            href="#category"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">🏷</div>
            <div className="font-semibold text-ink">カテゴリから探す</div>
            <div className="text-xs text-ink-dim mt-1">トンネル / 廃墟 / 公園 ほか</div>
          </Link>
          <Link
            href="/ranking"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">⭐</div>
            <div className="font-semibold text-ink">人気ランキングを見る</div>
            <div className="text-xs text-ink-dim mt-1">怖さ / 口コミ / 写真 / 動画</div>
          </Link>
          <Link
            href="/submit/spot"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">✍️</div>
            <div className="font-semibold text-ink">地元の噂を投稿する</div>
            <div className="text-xs text-ink-dim mt-1">承認制 / 無料</div>
          </Link>
          <Link
            href="/world"
            className="surface-card hover:border-accent block px-4 py-5 text-left"
          >
            <div className="text-2xl mb-1">🌐</div>
            <div className="font-semibold text-ink">海外のスポットを見る</div>
            <div className="text-xs text-ink-dim mt-1">20 カ国の怪談・伝承</div>
          </Link>
        </div>
        <div className="pt-3 flex justify-center">
          <VisitorCounter />
        </div>
      </section>

      <aside className="surface-soft px-4 py-3 text-xs text-ink-dim text-center leading-relaxed">
        本サイトは噂・怪談・都市伝説を楽しむための情報サイトです。
        <strong className="text-ink-dim">無断侵入、近隣迷惑、危険行為は絶対に行わないでください。</strong>
        詳しくは <Link href="/safety-guidelines" className="text-accent hover:underline">安全に楽しむためのガイドライン</Link> をご覧ください。
      </aside>

      <section>
        <div className="flex items-end justify-between mb-4">
          <h2 className="text-xl font-bold text-ink">人気スポット</h2>
          <Link href="/map" className="text-sm text-accent hover:underline">地図で見る →</Link>
        </div>
        {spots.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim">
            公開中のスポットはまだありません。
          </p>
        ) : (
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {spots.map((s) => (
              <SpotCard key={s.id} spot={s} />
            ))}
          </div>
        )}
      </section>

      <section>
        <h2 className="text-xl font-bold text-ink mb-4">最新の口コミ</h2>
        {reviews.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim">
            公開中の口コミはまだありません。
          </p>
        ) : (
          <div className="grid gap-3 md:grid-cols-2">
            {reviews.map((r) => (
              <ReviewCard key={r.id} review={r} />
            ))}
          </div>
        )}
      </section>

      <section>
        <div className="flex items-end justify-between mb-4">
          <h2 className="text-xl font-bold text-ink">怪談・民俗・安全ガイド</h2>
          <Link href="/articles" className="text-sm text-accent hover:underline">すべての記事 →</Link>
        </div>
        <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {ARTICLES.slice(0, 6).map((a) => (
            <li key={a.slug}>
              <Link
                href={`/articles/${a.slug}`}
                className="surface-card block p-4 hover:border-accent transition-colors h-full"
              >
                <h3 className="text-ink font-medium leading-snug">{a.title}</h3>
                <p className="mt-1 text-xs text-ink-dim line-clamp-3">{a.description}</p>
                <div className="mt-2 text-[11px] text-ink-muted">{formatDate(a.publishedAt)} ・ 約{a.readingMinutes}分</div>
              </Link>
            </li>
          ))}
        </ul>
      </section>

      <section>
        <h2 className="text-xl font-bold text-ink mb-4">国から探す</h2>
        <div className="flex flex-wrap gap-2">
          {COUNTRIES.filter((c) => c.slug !== 'other').map((c) => (
            <Link
              key={c.slug}
              href={c.slug === 'japan' ? '/map' : `/country/${c.slug}`}
              className="rounded-full border border-bg-border bg-bg-card px-3 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
            >
              <span className="mr-1" aria-hidden>{c.emoji}</span>{c.name}
            </Link>
          ))}
        </div>
      </section>

      <section id="category">
        <h2 className="text-xl font-bold text-ink mb-4">カテゴリから探す</h2>
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

      <section id="area">
        <h2 className="text-xl font-bold text-ink mb-4">都道府県から探す</h2>
        <div className="space-y-4">
          {REGIONS.map((region) => (
            <div key={region}>
              <h3 className="text-sm text-ink-dim mb-2">{region}</h3>
              <div className="flex flex-wrap gap-2">
                {PREFECTURES.filter((p) => p.region === region).map((p) => (
                  <Link
                    key={p.slug}
                    href={`/area/${p.slug}`}
                    className="rounded border border-bg-border bg-bg-card px-2 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
                  >
                    {p.name}
                  </Link>
                ))}
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
}
