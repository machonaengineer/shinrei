import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ARTICLES } from '@/content/articles';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '怪談・民俗・安全ガイド 記事一覧 — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '怪談・民俗・安全ガイド',
      subtitle: '心霊スポット文化を文化資源として解説する独自記事',
      tag: `${ARTICLES.length} 本掲載`,
      emoji: '📚',
    }) as never,
    size,
  );
}
