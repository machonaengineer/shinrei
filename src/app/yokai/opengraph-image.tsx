import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { YOKAI_LIST } from '@/content/yokai';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '妖怪図鑑 — 心霊マップ';

export default function Image() {
  return new ImageResponse(
    ogTemplate({
      title: '妖怪図鑑',
      subtitle: '日本と世界の妖怪・怪異・伝承を分類別に解説',
      tag: `${YOKAI_LIST.length} 件収録`,
      emoji: '👹',
    }) as never,
    size,
  );
}
