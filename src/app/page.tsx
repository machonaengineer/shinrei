import Link from 'next/link';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { ReviewCard } from '@/components/ReviewCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { CATEGORIES, PREFECTURES, REGIONS, SITE_NAME, SITE_TAGLINE, SITE_DESCRIPTION } from '@/lib/constants';
import { buildMetadata } from '@/lib/seo';
import type { Metadata } from 'next';

export const revalidate = 300;

export const metadata: Metadata = buildMetadata({
  title: undefined,
  description: `${SITE_TAGLINE}。${SITE_DESCRIPTION}`,
  path: '/',
});

export default async function HomePage() {
  const supabase = supabaseServer();

  const [{ data: popularSpots }, { data: latestReviews }] = await Promise.all([
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
  ]);

  const spots = popularSpots ?? [];
  const reviews = latestReviews ?? [];

  return (
    <div className="mx-auto max-w-6xl px-4 py-10 space-y-12">
      <section className="text-center space-y-5">
        <p className="text-accent text-sm tracking-widest">👻 SHINREI MAP 👻</p>
        <h1 className="text-3xl md:text-5xl font-bold text-ink leading-tight">
          {SITE_TAGLINE}
        </h1>
        <p className="text-ink-dim max-w-2xl mx-auto">{SITE_DESCRIPTION}</p>
        <div className="flex flex-wrap items-center justify-center gap-3 pt-2">
          <Link href="/map" className="btn-primary">全国の心霊スポットを地図で探す</Link>
          <Link href="/submit/spot" className="btn-secondary">心霊スポットを投稿する</Link>
        </div>
      </section>

      <DisclaimerBox compact />

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

      <section>
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
