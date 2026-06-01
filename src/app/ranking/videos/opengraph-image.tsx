import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '動画ありスポット — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '動画ありスポット',
      subtitle: 'YouTube・TikTok の関連動画があるスポット',
      tag: 'VIDEOS',
      emoji: '🎬',
    }) as never,
    size,
  );
}
