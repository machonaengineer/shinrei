import { supabaseServer } from '@/lib/supabase';

/**
 * Decide whether a spot detail page is "index-worthy" for search engines.
 *
 * Why: ~5,500 imported spots share the same description template with only
 * the place name swapped. Google flags those as "low value / scaled
 * content" (this is what got AdSense rejected). We keep them on the map &
 * lists (good UX) but mark the thin ones `noindex` so search engines and
 * AdSense only evaluate genuinely valuable pages.
 *
 * A spot is index-worthy if ANY of:
 *  - it has at least one published review, OR
 *  - it has at least one published photo, OR
 *  - it has at least one published video, OR
 *  - it is hand-curated (no community-site/wikipedia source row), i.e. the
 *    description was written by the operator, not generated from a template.
 */
export async function isIndexWorthySpot(spotId: string): Promise<boolean> {
  const supabase = supabaseServer();

  const [reviews, images, videos, importedSources] = await Promise.all([
    supabase.from('reviews').select('id', { count: 'exact', head: true })
      .eq('spot_id', spotId).eq('status', 'published'),
    supabase.from('spot_images').select('id', { count: 'exact', head: true })
      .eq('spot_id', spotId).eq('status', 'published'),
    supabase.from('spot_videos').select('id', { count: 'exact', head: true })
      .eq('spot_id', spotId).eq('status', 'published'),
    supabase.from('sources').select('id', { count: 'exact', head: true })
      .eq('spot_id', spotId).in('source_type', ['wikipedia', 'community-site']),
  ]);

  const hasUgc =
    (reviews.count ?? 0) > 0 || (images.count ?? 0) > 0 || (videos.count ?? 0) > 0;
  const isImported = (importedSources.count ?? 0) > 0;

  // hand-curated (not imported) => index-worthy regardless of UGC
  // imported => only if it now has user-generated value
  return hasUgc || !isImported;
}

export type IndexWorthyRow = { slug: string; updated_at: string };

/**
 * Bulk version for the sitemap. Computes the set of index-worthy spots
 * entirely with the anon client — NO database view required, so the
 * operator does not have to run any SQL.
 *
 * Strategy: pull the id-bearing rows from the small tables (UGC +
 * imported sources) to build sets, then stream published spots in
 * chunks and keep the ones that qualify.
 */
export async function getIndexWorthySpots(): Promise<IndexWorthyRow[]> {
  const supabase = supabaseServer();
  const PAGE = 1000;

  async function collectSpotIds(
    table: 'reviews' | 'spot_images' | 'spot_videos',
  ): Promise<Set<string>> {
    const set = new Set<string>();
    for (let page = 0; page < 50; page++) {
      const { data, error } = await supabase
        .from(table)
        .select('spot_id')
        .eq('status', 'published')
        .range(page * PAGE, page * PAGE + PAGE - 1);
      if (error || !data || data.length === 0) break;
      for (const r of data as { spot_id: string | null }[]) {
        if (r.spot_id) set.add(r.spot_id);
      }
      if (data.length < PAGE) break;
    }
    return set;
  }

  async function collectImportedIds(): Promise<Set<string>> {
    const set = new Set<string>();
    for (let page = 0; page < 50; page++) {
      const { data, error } = await supabase
        .from('sources')
        .select('spot_id')
        .in('source_type', ['wikipedia', 'community-site'])
        .range(page * PAGE, page * PAGE + PAGE - 1);
      if (error || !data || data.length === 0) break;
      for (const r of data as { spot_id: string | null }[]) {
        if (r.spot_id) set.add(r.spot_id);
      }
      if (data.length < PAGE) break;
    }
    return set;
  }

  const [reviewIds, imageIds, videoIds, importedIds] = await Promise.all([
    collectSpotIds('reviews'),
    collectSpotIds('spot_images'),
    collectSpotIds('spot_videos'),
    collectImportedIds(),
  ]);

  const hasUgc = (id: string) =>
    reviewIds.has(id) || imageIds.has(id) || videoIds.has(id);

  const out: IndexWorthyRow[] = [];
  for (let page = 0; page < 50; page++) {
    const { data, error } = await supabase
      .from('spots')
      .select('id, slug, updated_at')
      .eq('status', 'published')
      .order('id', { ascending: true })
      .range(page * PAGE, page * PAGE + PAGE - 1);
    if (error || !data || data.length === 0) break;
    for (const s of data as { id: string; slug: string; updated_at: string }[]) {
      const indexWorthy = !importedIds.has(s.id) || hasUgc(s.id);
      if (indexWorthy) out.push({ slug: s.slug, updated_at: s.updated_at });
    }
    if (data.length < PAGE) break;
  }
  return out;
}
