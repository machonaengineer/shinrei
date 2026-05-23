import type { MetadataRoute } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { siteUrl } from '@/lib/seo';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { ARTICLES } from '@/content/articles';
import { YOKAI_LIST } from '@/content/yokai';

export const revalidate = 3600;

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const base = siteUrl().replace(/\/$/, '');
  const now = new Date();

  const staticUrls: MetadataRoute.Sitemap = [
    '',
    '/map',
    '/world',
    '/ranking',
    '/yokai',
    '/articles',
    '/about',
    '/editorial-policy',
    '/faq',
    '/contact',
    '/submit/spot',
    '/terms',
    '/privacy',
    '/disclaimer',
  ].map((p) => ({ url: `${base}${p}`, lastModified: now, changeFrequency: 'weekly', priority: p === '' ? 1 : 0.7 }));

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
    priority: 0.6,
  }));

  const catUrls: MetadataRoute.Sitemap = CATEGORIES.map((c) => ({
    url: `${base}/category/${c.slug}`,
    lastModified: now,
    changeFrequency: 'weekly',
    priority: 0.6,
  }));

  let spotUrls: MetadataRoute.Sitemap = [];
  try {
    const supabase = supabaseServer();
    const { data } = await supabase
      .from('spots')
      .select('slug, updated_at')
      .eq('status', 'published')
      .limit(5000);
    spotUrls = (data ?? []).map((s) => ({
      url: `${base}/spots/${s.slug}`,
      lastModified: new Date(s.updated_at),
      changeFrequency: 'weekly',
      priority: 0.8,
    }));
  } catch {
    // Supabase未設定時はスキップ
  }

  return [...staticUrls, ...yokaiUrls, ...articleUrls, ...countryUrls, ...prefUrls, ...catUrls, ...spotUrls];
}
