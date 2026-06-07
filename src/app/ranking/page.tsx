import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { ShareButtons } from '@/components/ShareButtons';
import { AdSlot } from '@/components/AdSlot';
import { RankingList, type RankingSpot } from '@/components/RankingList';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { CATEGORIES } from '@/lib/constants';

export const revalidate = 600;

export const metadata: Metadata = buildMetadata({
  title: '心霊スポット人気ランキング',
  description:
    '全国の心霊スポット人気ランキング。怖さ評価・口コミ数・写真あり・動画あり・新着の各部門で上位を集計。安全・合法に楽しむための情報を掲載しています。',
  path: '/ranking',
});

const SELECT =
  'id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property';

export default async function RankingPage() {
  const supabase = supabaseServer();

  const [topScary, topReview, japanScary, worldScary] = await Promise.all([
    supabase.from('spots').select(SELECT).eq('status', 'published')
      .order('scary_score', { ascending: false }).order('review_count', { ascending: false }).limit(12),
    supabase.from('spots').select(SELECT).eq('status', 'published')
      .order('review_count', { ascending: false }).order('scary_score', { ascending: false }).limit(12),
    supabase.from('spots').select(SELECT).eq('status', 'published').eq('country_slug', 'japan')
      .order('scary_score', { ascending: false }).limit(12),
    supabase.from('spots').select(SELECT).eq('status', 'published').neq('country_slug', 'japan')
      .order('scary_score', { ascending: false }).limit(12),
  ]);

  const url = new URL('/ranking', siteUrl()).toString();

  const variants = [
    { href: '/ranking/scary', emoji: '🔥', name: '怖さ評価ランキング', desc: '怖さスコア上位' },
    { href: '/ranking/reviews', emoji: '💬', name: '口コミ数ランキング', desc: '口コミが多い順' },
    { href: '/ranking/photos', emoji: '📸', name: '写真ありスポット', desc: '写真が投稿されたスポット' },
    { href: '/ranking/videos', emoji: '🎬', name: '動画ありスポット', desc: '動画が登録されたスポット' },
    { href: '/recent', emoji: '🆕', name: '新着スポット', desc: '最近追加されたスポット' },
  ];

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-10">
      <header className="space-y-2">
        <nav className="text-xs text-ink-muted">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">ランキング</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">⭐ 心霊スポット人気ランキング</h1>
        <p className="text-sm text-ink-dim leading-relaxed">
          ユーザー投稿による怖さ評価・口コミ数・写真投稿数・動画投稿数を集計した参考ランキングです。
          ランキングは伝承・娯楽コンテンツとしての参考情報であり、実際の危険度や事実性を示すものではありません。
        </p>
        <details className="text-xs text-ink-muted">
          <summary className="cursor-pointer">📐 ランキングロジックの説明</summary>
          <div className="mt-2 surface-soft p-3">
            <ul className="list-disc pl-5 space-y-0.5">
              <li>怖さ評価：ユーザー投稿の怖さスコア（口コミの平均、1〜5）の高い順</li>
              <li>口コミ数：承認済みの口コミ件数の多い順</li>
              <li>写真あり：承認済みの写真がアップロードされたスポット</li>
              <li>動画あり：承認済みの関連動画が登録されたスポット</li>
              <li>新着：公開日時の新しい順（/recent と同じ）</li>
              <li>閲覧数は現在未集計のため、人気は口コミ・写真・動画数で代用しています</li>
            </ul>
          </div>
        </details>
      </header>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-3">部門別ランキング</h2>
        <ul className="grid gap-3 sm:grid-cols-2 md:grid-cols-3">
          {variants.map((v) => (
            <li key={v.href}>
              <Link
                href={v.href}
                className="surface-card hover:border-accent block p-4 h-full"
              >
                <div className="text-2xl">{v.emoji}</div>
                <div className="text-ink font-semibold mt-1">{v.name}</div>
                <div className="text-xs text-ink-dim mt-1">{v.desc}</div>
              </Link>
            </li>
          ))}
        </ul>
      </section>

      <RankingList title="🔥 怖さスコア TOP12（全国・海外）" spots={(topScary.data ?? []) as RankingSpot[]} />

      <AdSlot slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_RANKING} format="auto" />

      <RankingList title="💬 口コミ数 TOP12" spots={(topReview.data ?? []) as RankingSpot[]} />
      <RankingList title="🇯🇵 国内 怖さ TOP12" spots={(japanScary.data ?? []) as RankingSpot[]} />
      <RankingList title="🌐 海外 怖さ TOP12" spots={(worldScary.data ?? []) as RankingSpot[]} />

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

      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">ランキングをシェア</h3>
        <ShareButtons title="心霊スポット人気ランキング｜心霊マップ" url={url} />
      </section>

      <DisclaimerBox compact />
    </div>
  );
}
