import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '新着スポット — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '新着スポット',
      subtitle: '最近追加された心霊・怪談スポット',
      tag: 'NEW',
      emoji: '🆕',
    }) as never,
    size,
  );
}
