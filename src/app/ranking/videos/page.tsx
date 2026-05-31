import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { ShareButtons } from '@/components/ShareButtons';
import { RankingList, type RankingSpot } from '@/components/RankingList';
import { buildMetadata, siteUrl } from '@/lib/seo';

export const revalidate = 600;

export const metadata: Metadata = buildMetadata({
  title: '動画ありスポット',
  description: 'YouTube・TikTok 等の関連動画が登録された心霊スポット一覧。',
  path: '/ranking/videos',
});

export default async function VideosRankingPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spot_videos')
    .select(
      'spot_id, spots!inner(id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property, status)',
    )
    .eq('status', 'published')
    .eq('spots.status', 'published')
    .limit(200);

  type Row = { spots: unknown };
  const seen = new Set<string>();
  const spots: RankingSpot[] = (((data ?? []) as Row[]).map((r) => (Array.isArray(r.spots) ? r.spots[0] : r.spots)) as RankingSpot[])
    .filter((s): s is RankingSpot => Boolean(s) && !seen.has(s.id) && (seen.add(s.id), true))
    .sort((a, b) => b.scary_score - a.scary_score || b.review_count - a.review_count)
    .slice(0, 60);

  const url = new URL('/ranking/videos', siteUrl()).toString();
  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header className="space-y-1">
        <nav className="text-xs text-ink-muted">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <Link href="/ranking" className="hover:text-ink">ランキング</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">動画あり</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">🎬 動画ありスポット</h1>
        <p className="text-sm text-ink-dim">YouTube・TikTok などの関連動画が登録されているスポットを上位60件。</p>
      </header>
      <RankingList spots={spots} empty="現在、動画ありスポットはまだありません。" />
      <section className="surface-soft p-4 space-y-2">
        <h3 className="text-ink font-semibold text-sm">シェア</h3>
        <ShareButtons title="動画あり心霊スポット一覧｜心霊マップ" url={url} />
      </section>
      <DisclaimerBox compact />
    </div>
  );
}
