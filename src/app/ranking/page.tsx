import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { buildMetadata } from '@/lib/seo';
import { CATEGORIES } from '@/lib/constants';

export const revalidate = 600;

export const metadata: Metadata = buildMetadata({
  title: '怖さ・人気ランキング',
  description: '心霊スポットの怖さスコア・口コミ数によるランキング。カテゴリ別・国内/海外別の上位スポットを一覧します。',
  path: '/ranking',
});

export default async function RankingPage() {
  const supabase = supabaseServer();

  const [topScary, topReview, japanScary, worldScary] = await Promise.all([
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .order('scary_score', { ascending: false })
      .order('review_count', { ascending: false })
      .limit(12),
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .order('review_count', { ascending: false })
      .order('scary_score', { ascending: false })
      .limit(12),
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .eq('country_slug', 'japan')
      .order('scary_score', { ascending: false })
      .limit(12),
    supabase
      .from('spots')
      .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property')
      .eq('status', 'published')
      .neq('country_slug', 'japan')
      .order('scary_score', { ascending: false })
      .limit(12),
  ]);

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-10">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">⭐ 怖さ・人気ランキング</h1>
        <p className="text-sm text-ink-dim mt-1">
          ユーザー投稿による怖さスコアと口コミ件数に基づくランキングです。ランキングは伝承・娯楽コンテンツとしての参考情報であり、実際の危険度や事実性を示すものではありません。
        </p>
      </header>

      <Section title="🔥 怖さスコア TOP12（全国・海外）" spots={topScary.data ?? []} />
      <Section title="💬 口コミ数 TOP12" spots={topReview.data ?? []} />
      <Section title="🇯🇵 国内 怖さ TOP12" spots={japanScary.data ?? []} />
      <Section title="🌐 海外 怖さ TOP12" spots={worldScary.data ?? []} />

      <section>
        <h2 className="text-lg font-semibold text-ink mb-3">カテゴリ別ランキング</h2>
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

type Spot = {
  id: string;
  slug: string;
  name: string;
  prefecture: string;
  city: string | null;
  category_slug: string;
  description: string | null;
  scary_score: number;
  review_count: number;
  is_entry_prohibited: boolean;
  is_private_property: boolean;
};

function Section({ title, spots }: { title: string; spots: Spot[] }) {
  if (!spots.length) return null;
  return (
    <section>
      <h2 className="text-lg font-semibold text-ink mb-3">{title}</h2>
      <ol className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {spots.map((s, i) => (
          <li key={s.id} className="relative">
            <span className="absolute -left-2 -top-2 z-10 inline-flex h-7 w-7 items-center justify-center rounded-full bg-accent text-white text-xs font-bold border-2 border-bg">
              {i + 1}
            </span>
            <SpotCard spot={s} />
          </li>
        ))}
      </ol>
    </section>
  );
}
