import { SpotCard } from './SpotCard';

export type RankingSpot = {
  id: string;
  slug: string;
  name: string;
  prefecture: string;
  city: string | null;
  category_slug: string;
  description: string | null;
  scary_score: number;
  review_count: number;
  is_entry_prohibited: boolean;
  is_private_property: boolean;
};

export function RankingList({
  spots,
  title,
  headingLevel = 'h2',
  empty,
}: {
  spots: RankingSpot[];
  title?: string;
  headingLevel?: 'h1' | 'h2' | 'h3';
  empty?: string;
}) {
  if (!spots.length) {
    return empty ? <p className="surface-card p-6 text-center text-ink-dim">{empty}</p> : null;
  }
  const H = headingLevel;
  return (
    <section>
      {title ? <H className="text-lg font-semibold text-ink mb-3">{title}</H> : null}
      <ol className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {spots.map((s, i) => (
          <li key={s.id} className="relative">
            <span className="absolute -left-2 -top-2 z-10 inline-flex h-7 w-7 items-center justify-center rounded-full bg-accent text-white text-xs font-bold border-2 border-bg">
              {i + 1}
            </span>
            <SpotCard spot={s} />
          </li>
        ))}
      </ol>
    </section>
  );
}
