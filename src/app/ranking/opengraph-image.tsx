import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '心霊スポット人気ランキング — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '心霊スポット人気ランキング',
      subtitle: '怖さ・口コミ・写真・動画の各部門で上位を集計',
      tag: 'RANKING',
      emoji: '⭐',
    }) as never,
    size,
  );
}
