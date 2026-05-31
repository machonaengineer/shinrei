/**
 * Lightweight GA4 event helper.
 * No-op if GA isn't loaded (no env, ad blocker, etc).
 *
 * Event names match the spec:
 *   spot_view, prefecture_page_view, category_page_view,
 *   share_click, submit_cta_click, nearby_search_click,
 *   map_filter_click, copy_url_click
 */
type GTagArgs =
  | ['event', string, Record<string, unknown>?]
  | ['config', string, Record<string, unknown>?]
  | ['js', Date];

declare global {
  interface Window {
    gtag?: (...args: GTagArgs) => void;
    dataLayer?: unknown[];
  }
}

export function trackEvent(name: string, params?: Record<string, unknown>): void {
  if (typeof window === 'undefined') return;
  try {
    if (typeof window.gtag === 'function') {
      window.gtag('event', name, params ?? {});
    } else if (Array.isArray(window.dataLayer)) {
      window.dataLayer.push({ event: name, ...(params ?? {}) });
    }
  } catch {
    // analytics must never throw
  }
}

export const Events = {
  SpotView: 'spot_view',
  PrefectureView: 'prefecture_page_view',
  CategoryView: 'category_page_view',
  ShareClick: 'share_click',
  SubmitCtaClick: 'submit_cta_click',
  NearbySearchClick: 'nearby_search_click',
  MapFilterClick: 'map_filter_click',
  CopyUrlClick: 'copy_url_click',
} as const;
