import { siteUrl } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';

/**
 * Renders a single application/ld+json <script> tag.
 *
 * Notes:
 * - We do NOT emit schema types that would imply factual assertion of
 *   incidents, deaths, or crimes for any spot. Schema.org `Place`,
 *   `CollectionPage`, `Article`, `FAQPage`, `BreadcrumbList`,
 *   `WebSite` are all fine — none of them require event/incident
 *   semantics.
 * - Pass `data` as a serializable object.
 */
export function JsonLd({ data }: { data: unknown }) {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data) }}
    />
  );
}

export type Crumb = { name: string; href?: string };

export function breadcrumbList(crumbs: Crumb[]) {
  const base = siteUrl().replace(/\/$/, '');
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: crumbs.map((c, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: c.name,
      item: c.href ? new URL(c.href, base).toString() : undefined,
    })),
  };
}

export function websiteJsonLd() {
  const base = siteUrl().replace(/\/$/, '');
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: SITE_NAME,
    url: base,
    inLanguage: 'ja-JP',
    potentialAction: {
      '@type': 'SearchAction',
      target: `${base}/map?q={search_term_string}`,
      'query-input': 'required name=search_term_string',
    },
  };
}

export function organizationJsonLd() {
  const base = siteUrl().replace(/\/$/, '');
  return {
    '@context': 'https://schema.org',
    '@type': 'Organization',
    name: SITE_NAME,
    url: base,
    logo: `${base}/opengraph-image`,
  };
}
