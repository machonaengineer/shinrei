import { supabaseServer } from '@/lib/supabase';
import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '心霊マップ — 全国の心霊・怪談・都市伝説スポットを地図で探す';

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
      title: '全国の心霊・怪談スポットを地図で探す',
      subtitle: '近くの"噂の場所"を、安全・合法に楽しむ心霊マップ',
      tag: total > 0 ? `掲載 ${total.toLocaleString()} 件` : undefined,
    }) as never,
    size,
  );
}
