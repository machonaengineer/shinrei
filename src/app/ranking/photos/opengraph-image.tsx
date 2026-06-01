import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '写真ありスポット — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '写真ありスポット',
      subtitle: 'ユーザー投稿の写真が登録されたスポット',
      tag: 'PHOTOS',
      emoji: '📸',
    }) as never,
    size,
  );
}
