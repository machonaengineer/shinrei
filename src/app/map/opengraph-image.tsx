import { supabaseServer } from '@/lib/supabase';
import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '地図で探す — 心霊マップ';

export default async function Image() {
  let total = 0;
  try {
    const supabase = supabaseServer();
    const { count } = await supabase
      .from('spots')
      .select('id', { count: 'exact', head: true })
      .eq('status', 'published');
    total = count ?? 0;
  } catch {
    total = 0;
  }
  return new ImageResponse(
    ogTemplate({
      title: '心霊スポットを地図で探す',
      subtitle: '都道府県・カテゴリ・現在地から検索できます',
      tag: total > 0 ? `${total.toLocaleString()} 件の地図ピン` : 'MAP',
      emoji: '🗺',
    }) as never,
    size,
  );
}
