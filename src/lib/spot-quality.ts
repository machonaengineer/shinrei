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
