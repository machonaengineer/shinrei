import type { MetadataRoute } from 'next';
import { siteUrl } from '@/lib/seo';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { ARTICLES } from '@/content/articles';
import { YOKAI_LIST } from '@/content/yokai';
import { getIndexWorthySpots } from '@/lib/spot-quality';

export const revalidate = 3600;

// Single /sitemap.xml. After noindex filtering the index-worthy spot
// set is in the hundreds, well within the 50,000-URL sitemap limit, so
// we don't need split sitemaps (which also avoids the missing
// sitemap-index 404 that generateSitemaps produces).
export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const base = siteUrl().replace(/\/$/, '');
  const now = new Date();

  const staticUrls: MetadataRoute.Sitemap = [
    '',
    '/map',
    '/world',
    '/ranking',
    '/ranking/reviews',
    '/ranking/photos',
    '/ranking/videos',
    '/ranking/scary',
    '/recent',
    '/yokai',
    '/articles',
    '/about',
    '/editorial-policy',
    '/faq',
    '/contact',
    '/submit/spot',
    '/safety-guidelines',
    '/terms',
    '/privacy',
    '/disclaimer',
    '/en',
    '/en/submit',
    '/en/about',
  ].map((p) => ({
    url: `${base}${p}`,
    lastModified: now,
    changeFrequency: 'weekly' as const,
    priority: p === '' ? 1 : 0.7,
  }));

  const yokaiUrls: MetadataRoute.Sitemap = YOKAI_LIST.map((y) => ({
    url: `${base}/yokai/${y.slug}`,
    lastModified: now,
    changeFrequency: 'monthly',
    priority: 0.6,
  }));

  const articleUrls: MetadataRoute.Sitemap = ARTICLES.map((a) => ({
    url: `${base}/articles/${a.slug}`,
    lastModified: new Date(a.updatedAt ?? a.publishedAt),
    changeFrequency: 'monthly',
    priority: 0.7,
  }));

  const countryUrls: MetadataRoute.Sitemap = COUNTRIES.map((c) => ({
    url: `${base}/country/${c.slug}`,
    lastModified: now,
    changeFrequency: 'weekly',
    priority: 0.6,
  }));

  const prefUrls: MetadataRoute.Sitemap = PREFECTURES.map((p) => ({
    url: `${base}/area/${p.slug}`,
    lastModified: now,
    changeFrequency: 'weekly',
    priority: 0.7,
  }));

  const catUrls: MetadataRoute.Sitemap = CATEGORIES.map((c) => ({
    url: `${base}/category/${c.slug}`,
    lastModified: now,
    changeFrequency: 'weekly',
    priority: 0.7,
  }));

  let spotUrls: MetadataRoute.Sitemap = [];
  try {
    const rows = await getIndexWorthySpots();
    spotUrls = rows.map((s) => ({
      url: `${base}/spots/${encodeURIComponent(s.slug)}`,
      lastModified: new Date(s.updated_at),
      changeFrequency: 'weekly',
      priority: 0.7,
    }));
  } catch {
    spotUrls = [];
  }

  return [
    ...staticUrls,
    ...yokaiUrls,
    ...articleUrls,
    ...countryUrls,
    ...prefUrls,
    ...catUrls,
    ...spotUrls,
  ];
}
