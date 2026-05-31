import type { MetadataRoute } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { siteUrl } from '@/lib/seo';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { ARTICLES } from '@/content/articles';
import { YOKAI_LIST } from '@/content/yokai';

export const revalidate = 3600;

const SPOTS_PER_SITEMAP = 2000;

export async function generateSitemaps() {
  // we publish: index 0 = static pages + taxonomy + articles + yokai
  //              index 1..N = spots in chunks of 2000
  let spotPages = 0;
  try {
    const supabase = supabaseServer();
    const { count } = await supabase
      .from('spots')
      .select('id', { count: 'exact', head: true })
      .eq('status', 'published');
    spotPages = Math.max(1, Math.ceil((count ?? 0) / SPOTS_PER_SITEMAP));
  } catch {
    spotPages = 1;
  }
  // 0 = main, 1..spotPages = spot chunks
  return Array.from({ length: 1 + spotPages }, (_, id) => ({ id }));
}

export default async function sitemap({ id }: { id: number }): Promise<MetadataRoute.Sitemap> {
  const base = siteUrl().replace(/\/$/, '');
  const now = new Date();

  if (id === 0) {
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
      changeFrequency: 'weekly',
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

    return [...staticUrls, ...yokaiUrls, ...articleUrls, ...countryUrls, ...prefUrls, ...catUrls];
  }

  // id >= 1 — spot chunk
  const chunkIndex = id - 1;
  const from = chunkIndex * SPOTS_PER_SITEMAP;
  const to = from + SPOTS_PER_SITEMAP - 1;

  try {
    const supabase = supabaseServer();
    const { data } = await supabase
      .from('spots')
      .select('slug, updated_at')
      .eq('status', 'published')
      .order('id', { ascending: true })
      .range(from, to);
    return (data ?? []).map((s) => ({
      url: `${base}/spots/${encodeURIComponent(s.slug)}`,
      lastModified: new Date(s.updated_at),
      changeFrequency: 'weekly',
      priority: 0.7,
    }));
  } catch {
    return [];
  }
}
