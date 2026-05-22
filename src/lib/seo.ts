import type { Metadata } from 'next';
import { SITE_NAME, SITE_DESCRIPTION } from './constants';

export function siteUrl(): string {
  return process.env.NEXT_PUBLIC_SITE_URL ?? 'http://localhost:3000';
}

export function buildMetadata(opts: {
  title?: string;
  description?: string;
  path?: string;
  ogImage?: string;
  noindex?: boolean;
}): Metadata {
  const base = siteUrl();
  const path = opts.path ?? '/';
  const url = new URL(path, base).toString();
  const title = opts.title ? `${opts.title}｜${SITE_NAME}` : SITE_NAME;
  const description = opts.description ?? SITE_DESCRIPTION;
  return {
    title,
    description,
    alternates: { canonical: url },
    robots: opts.noindex ? { index: false, follow: false } : undefined,
    openGraph: {
      title,
      description,
      url,
      siteName: SITE_NAME,
      type: 'website',
      images: opts.ogImage ? [{ url: opts.ogImage }] : undefined,
      locale: 'ja_JP',
    },
    twitter: {
      card: 'summary_large_image',
      title,
      description,
      images: opts.ogImage ? [opts.ogImage] : undefined,
    },
  };
}
