import { supabaseServer } from '@/lib/supabase';
import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '世界の心霊スポット — 心霊マップ';

export default async function Image() {
  let total = 0;
  try {
    const supabase = supabaseServer();
    const { count } = await supabase
      .from('spots')
      .select('id', { count: 'exact', head: true })
      .eq('status', 'published')
      .neq('country_slug', 'japan');
    total = count ?? 0;
  } catch {
    total = 0;
  }
  return new ImageResponse(
    ogTemplate({
      title: '世界の心霊スポット',
      subtitle: '20カ国の怪談・伝承を地図で探す',
      tag: total > 0 ? `${total.toLocaleString()} 件` : 'WORLD',
      emoji: '🌐',
    }) as never,
    size,
  );
}
