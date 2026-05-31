import { supabaseServer } from '@/lib/supabase';
import { CATEGORY_BY_SLUG } from '@/lib/constants';
import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = 'カテゴリ別 心霊スポット一覧 — 心霊マップ';

export default async function Image({ params }: { params: { categorySlug: string } }) {
  const cat = CATEGORY_BY_SLUG[params.categorySlug];
  if (!cat) {
    return new ImageResponse(
      ogTemplate({ title: '心霊マップ', subtitle: '全国の心霊・怪談・都市伝説' }) as never,
      size,
    );
  }
  let count = 0;
  try {
    const supabase = supabaseServer();
    const { count: c } = await supabase
      .from('spots')
      .select('id', { count: 'exact', head: true })
      .eq('status', 'published')
      .eq('category_slug', cat.slug);
    count = c ?? 0;
  } catch {
    count = 0;
  }
  return new ImageResponse(
    ogTemplate({
      title: `${cat.name}の心霊スポット`,
      subtitle: '全国の噂・怪談・都市伝説を地図で探す',
      tag: count > 0 ? `${count.toLocaleString()} 件掲載` : undefined,
      emoji: cat.emoji,
    }) as never,
    size,
  );
}
