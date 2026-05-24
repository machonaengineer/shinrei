import Link from 'next/link';
import type { Metadata } from 'next';
import { siteUrl } from '@/lib/seo';

export const metadata: Metadata = {
  title: 'About — Shinrei Map',
  description: 'About Shinrei Map: editorial policy, content guidelines, and how this site works.',
  alternates: { canonical: new URL('/en/about', siteUrl()).toString() },
};

export default function AboutEnPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 space-y-8 text-ink-dim leading-relaxed">
      <header>
        <h1 className="text-2xl font-bold text-ink">About Shinrei Map</h1>
        <p className="mt-1 text-sm">A folklore-first community map of haunted places.</p>
      </header>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">What this site is</h2>
        <p>
          Shinrei Map (心霊マップ) is a Japan-based community map of places associated with
          ghost stories, urban legends, folklore, and personal eerie experiences.
          Most entries are in Japan, but we welcome submissions from around the world.
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">What this site is not</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>We do <strong>not</strong> assert that real crimes, deaths, or accidents occurred at any listed location.</li>
          <li>We do <strong>not</strong> publish personal information, victim names, or identifying details.</li>
          <li>We do <strong>not</strong> encourage visiting any of the places listed. Trespassing is illegal.</li>
          <li>We do <strong>not</strong> guarantee the truthfulness of any submission — every entry is hearsay or folklore.</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">Editorial principles</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Every submission is reviewed by an admin before going public.</li>
          <li>Descriptions are generated from independent templates — we never copy body text from other sites.</li>
          <li>Source URLs (where applicable) are kept internal for moderation and never displayed publicly.</li>
          <li>Names containing terms like &ldquo;incident&rdquo;, &ldquo;suicide&rdquo;, &ldquo;death&rdquo;, &ldquo;victim&rdquo;, or specific private-residence patterns are automatically rejected.</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">Contribute</h2>
        <p>
          If you know a folklore-related place not yet on our map, please <Link href="/en/submit" className="text-accent hover:underline">submit it</Link>.
          Use the folklore / hearsay / personal-experience framing — we do not accept incident assertions.
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">Removal requests</h2>
        <p>
          If a listing infringes your rights, contains personal information, or has factual errors,
          submit a <Link href="/removal-request" className="text-accent hover:underline">removal request</Link>.
          We aim to respond within five business days.
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">Other languages</h2>
        <p>
          Japanese (default): <Link href="/" className="text-accent hover:underline">/</Link>
        </p>
      </section>
    </article>
  );
}
