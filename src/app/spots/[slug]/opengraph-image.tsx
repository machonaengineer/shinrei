import { supabaseServer } from '@/lib/supabase';
import { decodeSlug } from '@/lib/utils';
import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = 'スポット詳細 — 心霊マップ';

export default async function Image({ params }: { params: { slug: string } }) {
  let name = '心霊マップ';
  let prefecture = '';
  let category = '';
  try {
    const supabase = supabaseServer();
    const { data } = await supabase
      .from('spots')
      .select('name, prefecture, category, status')
      .eq('slug', decodeSlug(params.slug))
      .single();
    if (data && data.status === 'published') {
      name = data.name;
      prefecture = data.prefecture;
      category = data.category;
    }
  } catch {
    // ignore
  }
  return new ImageResponse(
    ogTemplate({
      title: name,
      subtitle: prefecture
        ? `${prefecture}の${category ? category + '系' : ''}心霊スポット`
        : '心霊マップ',
      tag: '噂・怪談・都市伝説',
      emoji: '📍',
    }) as never,
    size,
  );
}
