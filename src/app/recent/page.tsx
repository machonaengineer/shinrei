import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { SpotCard } from '@/components/SpotCard';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { buildMetadata } from '@/lib/seo';

export const revalidate = 120;

export const metadata: Metadata = buildMetadata({
  title: '新着スポット',
  description: '心霊マップに最近追加されたスポットの一覧。最新の怪談・伝承・噂を発見できます。',
  path: '/recent',
});

export default async function RecentPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select('id, slug, name, prefecture, city, category_slug, description, scary_score, review_count, is_entry_prohibited, is_private_property, created_at')
    .eq('status', 'published')
    .order('created_at', { ascending: false })
    .limit(60);

  const spots = data ?? [];

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">🆕 新着スポット</h1>
        <p className="text-sm text-ink-dim mt-1">
          最近追加されたスポット 60 件。心霊マップは継続的に新しい怪談・伝承を収集しています。
        </p>
      </header>

      {spots.length === 0 ? (
        <p className="surface-card p-6 text-center text-ink-dim">公開中のスポットはまだありません。</p>
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
