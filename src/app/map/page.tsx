import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { MapClient } from './MapClient';
import { buildMetadata } from '@/lib/seo';
import type { SpotPin } from '@/types/spot';

export const revalidate = 60;

export const metadata: Metadata = buildMetadata({
  title: '地図で探す',
  description: '全国の心霊スポット、怪談、都市伝説の口コミを地図で探せます。',
  path: '/map',
});

export default async function MapPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select(
      'id, slug, name, lat, lng, category, category_slug, prefecture, prefecture_slug, scary_score, review_count, is_entry_prohibited, is_private_property',
    )
    .eq('status', 'published')
    .limit(1000);

  const spots: SpotPin[] = (data ?? []) as SpotPin[];

  return (
    <div className="mx-auto max-w-6xl px-4 py-6">
      <header className="mb-4">
        <h1 className="text-2xl font-bold text-ink">地図で心霊スポットを探す</h1>
        <p className="text-sm text-ink-dim mt-1">
          ピンをクリックするとスポット概要を表示します。掲載情報はユーザー投稿に基づきます。
        </p>
      </header>
      <MapClient spots={spots} />
    </div>
  );
}
