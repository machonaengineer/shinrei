import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { MapClient } from './MapClient';
import { buildMetadata } from '@/lib/seo';
import type { SpotPin } from '@/types/spot';

export const revalidate = 60;

export const metadata: Metadata = buildMetadata({
  title: '地図で探す',
  description: '日本全国・世界各国の心霊スポット、怪談、都市伝説の口コミを地図で探せます。',
  path: '/map',
});

type FlaggedPin = SpotPin & { has_image: boolean; has_video: boolean };

export default async function MapPage() {
  const supabase = supabaseServer();
  const { data } = await supabase
    .from('spots')
    .select(
      'id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, scary_score, review_count, is_entry_prohibited, is_private_property',
    )
    .eq('status', 'published')
    .limit(2000);

  const baseSpots: SpotPin[] = (data ?? []) as SpotPin[];

  // Bulk lookup of which spots have any published image / video
  const ids = baseSpots.map((s) => s.id);
  const [imgRes, vidRes] = ids.length
    ? await Promise.all([
        supabase.from('spot_images').select('spot_id').eq('status', 'published').in('spot_id', ids),
        supabase.from('spot_videos').select('spot_id').eq('status', 'published').in('spot_id', ids),
      ])
    : [{ data: [] as { spot_id: string | null }[] }, { data: [] as { spot_id: string | null }[] }];

  const imgSet = new Set((imgRes.data ?? []).map((r) => r.spot_id ?? ''));
  const vidSet = new Set((vidRes.data ?? []).map((r) => r.spot_id ?? ''));

  const spots: FlaggedPin[] = baseSpots.map((s) => ({
    ...s,
    has_image: imgSet.has(s.id),
    has_video: vidSet.has(s.id),
  }));

  return (
    <div className="mx-auto max-w-6xl px-4 py-6">
      <header className="mb-4">
        <h1 className="text-2xl font-bold text-ink">地図で心霊スポットを探す</h1>
        <p className="text-sm text-ink-dim mt-1">
          ピンをクリックするとスポット概要を表示します。掲載情報はユーザー投稿・公開情報に基づきます。
        </p>
      </header>
      <MapClient spots={spots} />
    </div>
  );
}
