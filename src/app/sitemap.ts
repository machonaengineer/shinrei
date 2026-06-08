import type { MetadataRoute } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { siteUrl } from '@/lib/seo';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { ARTICLES } from '@/content/articles';
import { YOKAI_LIST } from '@/content/yokai';

export const revalidate = 3600;

const SPOTS_PER_SITEMAP = 2000;

/**
 * Count only index-worthy spots. Prefer the `index_worthy_spots` view
 * (created by supabase/adsense_quality_view.sql); fall back to all
 * published spots if the view doesn't exist yet.
 */
async function countIndexWorthy(): Promise<number> {
  const supabase = supabaseServer();
  // try the quality view first
  const viewRes = await supabase
    .from('index_worthy_spots' as never)
    .select('id', { count: 'exact', head: true });
  if (!viewRes.error) return viewRes.count ?? 0;
  // fallback: all published
  const { count } = await supabase
    .from('spots')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'published');
  return count ?? 0;
}

export async function generateSitemaps() {
  let spotPages = 1;
  try {
    const total = await countIndexWorthy();
    spotPages = Math.max(1, Math.ceil(total / SPOTS_PER_SITEMAP));
  } catch {
    spotPages = 1;
  }
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

  // id >= 1 — spot chunk (index-worthy only)
  const chunkIndex = id - 1;
  const from = chunkIndex * SPOTS_PER_SITEMAP;
  const to = from + SPOTS_PER_SITEMAP - 1;

  try {
    const supabase = supabaseServer();
    // prefer the quality view
    const viewRes = await supabase
      .from('index_worthy_spots' as never)
      .select('slug, updated_at')
      .order('slug', { ascending: true })
      .range(from, to);
    const rows = (viewRes.error
      ? (
          await supabase
            .from('spots')
            .select('slug, updated_at')
            .eq('status', 'published')
            .order('id', { ascending: true })
            .range(from, to)
        ).data
      : viewRes.data) as Array<{ slug: string; updated_at: string }> | null;
    return (rows ?? []).map((s) => ({
      url: `${base}/spots/${encodeURIComponent(s.slug)}`,
      lastModified: new Date(s.updated_at),
      changeFrequency: 'weekly',
      priority: 0.7,
    }));
  } catch {
    return [];
  }
}
