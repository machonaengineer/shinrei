import Link from 'next/link';
import type { Spot } from '@/types/spot';
import { CategoryBadge } from './CategoryBadge';
import { ScaryScore } from './ScaryScore';
import { truncate } from '@/lib/utils';

export function SpotCard({ spot }: { spot: Pick<Spot, 'slug' | 'name' | 'prefecture' | 'city' | 'category_slug' | 'description' | 'scary_score' | 'review_count' | 'is_entry_prohibited' | 'is_private_property'> }) {
  return (
    <Link
      href={`/spots/${spot.slug}`}
      className="surface-card block p-4 hover:border-accent transition-colors"
    >
      <div className="flex items-start justify-between gap-3">
        <h3 className="text-ink font-semibold leading-snug">{spot.name}</h3>
        <CategoryBadge slug={spot.category_slug} />
      </div>
      <div className="mt-1 text-xs text-ink-dim">
        {spot.prefecture}{spot.city ? ` ・ ${spot.city}` : ''}
      </div>
      {spot.description ? (
        <p className="mt-2 text-sm text-ink-dim leading-relaxed">
          {truncate(spot.description, 90)}
        </p>
      ) : null}
      <div className="mt-3 flex items-center justify-between">
        <ScaryScore value={spot.scary_score} />
        <span className="text-xs text-ink-muted">口コミ {spot.review_count}</span>
      </div>
      {(spot.is_entry_prohibited || spot.is_private_property) && (
        <div className="mt-2 text-xs text-accent-gold">
          ⚠ {spot.is_entry_prohibited ? '立入禁止区域' : ''}
          {spot.is_private_property ? ' / 私有地' : ''}
        </div>
      )}
    </Link>
  );
}
