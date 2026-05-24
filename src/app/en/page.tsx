import Link from 'next/link';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { CATEGORIES, COUNTRIES, SITE_NAME } from '@/lib/constants';
import { siteUrl } from '@/lib/seo';

export const revalidate = 600;

export const metadata: Metadata = {
  title: 'Shinrei Map — Haunted Places Around the World',
  description:
    'A community map of haunted places, ghost stories, and urban legends from Japan and around the world. Browse user-submitted spots, photos, and YouTube/TikTok videos. Content is folklore-based — not assertion of incidents.',
  alternates: {
    canonical: new URL('/en', siteUrl()).toString(),
    languages: {
      ja: new URL('/', siteUrl()).toString(),
      en: new URL('/en', siteUrl()).toString(),
    },
  },
  openGraph: {
    title: 'Shinrei Map — Haunted Places Around the World',
    description:
      'A community map of haunted places, ghost stories, and urban legends from Japan and around the world.',
    type: 'website',
    locale: 'en_US',
  },
};

export default async function HomeEnPage() {
  const supabase = supabaseServer();

  const [{ count: total }, { count: foreign }] = await Promise.all([
    supabase.from('spots').select('id', { count: 'exact', head: true }).eq('status', 'published'),
    supabase.from('spots').select('id', { count: 'exact', head: true }).eq('status', 'published').neq('country_slug', 'japan'),
  ]);
  const totalCount = total ?? 0;
  const foreignCount = foreign ?? 0;

  return (
    <div className="mx-auto max-w-5xl px-4 py-10 space-y-12">
      <section className="text-center space-y-5">
        <p className="text-accent text-sm tracking-widest">👻 SHINREI MAP 👻</p>
        <h1 className="text-3xl md:text-5xl font-bold text-ink leading-tight">
          Haunted places, ghost stories &amp; urban legends — mapped.
        </h1>
        <p className="text-ink-dim max-w-2xl mx-auto">
          {SITE_NAME} is a Japan-based community map of folklore-related places.
          We do <strong>not</strong> assert incidents or report deaths — every entry is shared as
          folklore, hearsay, or personal experience, not as fact.
        </p>
        <div className="flex flex-wrap items-center justify-center gap-3 pt-2">
          <Link href="/map" className="btn-primary">Browse the map</Link>
          <Link href="/en/submit" className="btn-secondary">Submit a place</Link>
        </div>
        {totalCount > 0 && (
          <div className="flex flex-wrap items-center justify-center gap-x-6 gap-y-2 pt-4 text-sm text-ink-dim">
            <span>📍 <strong className="text-ink">{totalCount.toLocaleString()}</strong> places listed</span>
            <span>🌐 <strong className="text-ink">{foreignCount.toLocaleString()}</strong> outside Japan</span>
          </div>
        )}
      </section>

      <section className="surface-soft p-4 text-sm text-ink-dim leading-relaxed">
        <h2 className="text-ink font-semibold mb-2">What this site is — and isn&apos;t</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>A collection of <strong>folklore, hearsay, and user-submitted experiences</strong> tied to specific locations.</li>
          <li><strong>Not</strong> a record of crimes, deaths, accidents, or anything we claim to be factual.</li>
          <li>Personal information, named victims, and assertions about real events are <strong>prohibited</strong>.</li>
          <li>We do not encourage visiting any of the places listed. Trespassing on private property is illegal.</li>
          <li>If a listing should be removed (privacy, error, rights), use our <Link href="/removal-request" className="text-accent hover:underline">removal request form</Link>.</li>
        </ul>
      </section>

      <section>
        <h2 className="text-xl font-bold text-ink mb-4">Browse by country</h2>
        <div className="flex flex-wrap gap-2">
          {COUNTRIES.filter((c) => c.slug !== 'other').map((c) => (
            <Link
              key={c.slug}
              href={c.slug === 'japan' ? '/map' : `/country/${c.slug}`}
              className="rounded-full border border-bg-border bg-bg-card px-3 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
            >
              <span className="mr-1" aria-hidden>{c.emoji}</span>{c.slug === 'japan' ? 'Japan' : englishCountry(c.slug)}
            </Link>
          ))}
        </div>
      </section>

      <section>
        <h2 className="text-xl font-bold text-ink mb-4">Browse by category</h2>
        <div className="flex flex-wrap gap-2">
          {CATEGORIES.map((c) => (
            <Link
              key={c.slug}
              href={`/category/${c.slug}`}
              className="rounded-full border border-bg-border bg-bg-card px-3 py-1 text-sm text-ink-dim hover:border-accent hover:text-ink"
            >
              <span className="mr-1" aria-hidden>{c.emoji}</span>{englishCategory(c.slug)}
            </Link>
          ))}
        </div>
      </section>

      <section className="surface-card p-6 text-center">
        <h2 className="text-ink text-xl font-bold mb-2">Contribute from anywhere in the world</h2>
        <p className="text-ink-dim text-sm mb-4">
          Know a haunted place not yet listed? Submit it. All submissions are reviewed before going public.
        </p>
        <Link href="/en/submit" className="btn-primary">Submit a place →</Link>
      </section>

      <aside className="text-xs text-ink-muted text-center">
        日本語版トップは <Link href="/" className="text-accent hover:underline">こちら</Link>。
      </aside>
    </div>
  );
}

function englishCountry(slug: string): string {
  return ({
    usa: 'United States',
    uk: 'United Kingdom',
    ireland: 'Ireland',
    romania: 'Romania',
    italy: 'Italy',
    france: 'France',
    germany: 'Germany',
    czech: 'Czech Republic',
    mexico: 'Mexico',
    india: 'India',
    thailand: 'Thailand',
    taiwan: 'Taiwan',
    korea: 'South Korea',
    china: 'China',
    philippines: 'Philippines',
    indonesia: 'Indonesia',
    australia: 'Australia',
    canada: 'Canada',
    japan: 'Japan',
  } as Record<string, string>)[slug] ?? slug;
}

function englishCategory(slug: string): string {
  return ({
    tunnel: 'Tunnel',
    bridge: 'Bridge',
    haikyo: 'Ruins',
    hotel: 'Hotel',
    hospital: 'Hospital',
    school: 'School',
    park: 'Park',
    'shrine-temple': 'Shrine / Temple',
    'mountain-pass': 'Mountain / Pass',
    water: 'Water / Dam',
    road: 'Road',
    station: 'Station / Rails',
    'urban-legend': 'Urban Legend',
    other: 'Other',
  } as Record<string, string>)[slug] ?? slug;
}
