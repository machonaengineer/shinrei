import type { Metadata } from 'next';
import { SubmitSpotFormEn } from '@/components/SubmitSpotFormEn';
import { siteUrl } from '@/lib/seo';

export const metadata: Metadata = {
  title: 'Submit a haunted place — Shinrei Map',
  description:
    'Submit a haunted place, folklore spot, or urban legend location. Submissions are reviewed before going public.',
  alternates: {
    canonical: new URL('/en/submit', siteUrl()).toString(),
  },
  robots: { index: true, follow: true },
};

export default function SubmitEnPage() {
  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink">Submit a haunted place</h1>
      <p className="text-sm text-ink-dim mt-1 mb-6">
        Add a folklore-related place to the map. Submissions are reviewed before going public.
        Please read the editorial rules — assertions about real crimes / deaths / personal information are not allowed.
      </p>
      <SubmitSpotFormEn />
    </div>
  );
}
