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

const PAGE_SIZE = 1000;
const MAX_PAGES = 10; // 最大 10,000 件まで対応

export default async function MapPage() {
  const supabase = supabaseServer();

  // チャンク取得（Supabase のデフォルト max-rows=1000 を range で回避）
  const baseSpots: SpotPin[] = [];
  for (let page = 0; page < MAX_PAGES; page++) {
    const from = page * PAGE_SIZE;
    const to = from + PAGE_SIZE - 1;
    const { data, error } = await supabase
      .from('spots')
      .select(
        'id, slug, name, lat, lng, category, category_slug, country, country_slug, prefecture, prefecture_slug, scary_score, review_count, is_entry_prohibited, is_private_property',
      )
      .eq('status', 'published')
      .range(from, to);
    if (error || !data || data.length === 0) break;
    baseSpots.push(...(data as SpotPin[]));
    if (data.length < PAGE_SIZE) break;
  }

  // 画像/動画の存在チェック
  const ids = baseSpots.map((s) => s.id);
  const imgSet = new Set<string>();
  const vidSet = new Set<string>();

  if (ids.length > 0) {
    // ids も同様にチャンク化
    for (let i = 0; i < ids.length; i += PAGE_SIZE) {
      const chunk = ids.slice(i, i + PAGE_SIZE);
      const [imgRes, vidRes] = await Promise.all([
        supabase.from('spot_images').select('spot_id').eq('status', 'published').in('spot_id', chunk),
        supabase.from('spot_videos').select('spot_id').eq('status', 'published').in('spot_id', chunk),
      ]);
      (imgRes.data ?? []).forEach((r) => { if (r.spot_id) imgSet.add(r.spot_id); });
      (vidRes.data ?? []).forEach((r) => { if (r.spot_id) vidSet.add(r.spot_id); });
    }
  }

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
          全 <strong className="text-ink">{spots.length.toLocaleString()}</strong> 件のスポット。ピンをクリックするとスポット概要を表示します。
        </p>
      </header>
      <MapClient spots={spots} />
    </div>
  );
}
