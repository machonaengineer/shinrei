import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '怖さ評価ランキング — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '怖さ評価ランキング',
      subtitle: 'ユーザー投稿スコアが高いスポット上位 60',
      tag: 'RANKING',
      emoji: '🔥',
    }) as never,
    size,
  );
}
