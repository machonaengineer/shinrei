import { ogTemplate, size as ogSize, contentType as ogContentType } from '@/lib/og';
import { ARTICLE_BY_SLUG } from '@/content/articles';
import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const revalidate = 3600;
export const size = ogSize;
export const contentType = ogContentType;
export const alt = '記事 — 心霊マップ';

export default async function Image({ params }: { params: { slug: string } }) {
  const a = ARTICLE_BY_SLUG[params.slug];
  if (!a) {
    return new ImageResponse(
      ogTemplate({ title: '記事', subtitle: '心霊マップ' }) as never,
      size,
    );
  }
  return new ImageResponse(
    ogTemplate({
      title: a.title,
      subtitle: a.description.length > 60 ? a.description.slice(0, 58) + '…' : a.description,
      tag: 'ARTICLE',
      emoji: '📖',
    }) as never,
    size,
  );
}
