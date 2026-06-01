import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 86400;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '安全に楽しむためのガイドライン — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '安全に楽しむためのガイドライン',
      subtitle: '無断侵入・近隣迷惑・危険行為は絶対NG',
      tag: 'SAFETY',
      emoji: '⚠️',
    }) as never,
    size,
  );
}
