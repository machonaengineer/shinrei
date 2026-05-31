import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { ShareButtons } from '@/components/ShareButtons';
import { RankingList, type RankingSpot } from '@/components/RankingList';
import { buildMetadata, siteUrl } from '@/lib/seo';

export const revalidate = 600;

export const metadata: Metadata = buildMetadata({
  title: '怖さ評価ランキング',
  description: '全国の心霊スポットを、ユーザー投稿の怖さスコアで集計したランキング。安全・合法に楽しむための情報を掲載しています。',
  path: '/ranking/scary',
});

const SELECT =
  'id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property';

export default async function ScaryRankingPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select(SELECT)
    .eq('status', 'published')
    .order('scary_score', { ascending: false })
    .order('review_count', { ascending: false })
    .limit(60);

  const url = new URL('/ranking/scary', siteUrl()).toString();
  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header className="space-y-1">
        <nav className="text-xs text-ink-muted">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <Link href="/ranking" className="hover:text-ink">ランキング</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">怖さ評価</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">🔥 怖さ評価ランキング TOP60</h1>
        <p className="text-sm text-ink-dim">ユーザー投稿の怖さスコアの高い順。スコアは口コミの怖さ評価（1〜5）の平均です。</p>
      </header>
      <RankingList spots={(data ?? []) as RankingSpot[]} empty="該当スポットがまだありません。" />
      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">このランキングをシェア</h3>
        <ShareButtons title="怖さ評価ランキング｜心霊マップ" url={url} />
      </section>
      <DisclaimerBox compact />
    </div>
  );
}
