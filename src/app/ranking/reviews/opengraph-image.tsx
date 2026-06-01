import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '口コミ数ランキング — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '口コミ数ランキング',
      subtitle: 'ユーザー投稿の口コミが多いスポット上位 60',
      tag: 'REVIEWS',
      emoji: '💬',
    }) as never,
    size,
  );
}
