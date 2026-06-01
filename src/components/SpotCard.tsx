'use client';

import Link from 'next/link';
import type { Spot } from '@/types/spot';
import { CategoryBadge } from './CategoryBadge';
import { ScaryScore } from './ScaryScore';
import { truncate } from '@/lib/utils';
import { trackEvent, Events } from '@/lib/analytics';

type SpotCardSpot = Pick<
  Spot,
  | 'slug'
  | 'name'
  | 'prefecture'
  | 'city'
  | 'category_slug'
  | 'description'
  | 'scary_score'
  | 'review_count'
  | 'is_entry_prohibited'
  | 'is_private_property'
>;

export function SpotCard({ spot }: { spot: SpotCardSpot }) {
  const youtubeUrl = `https://www.youtube.com/results?search_query=${encodeURIComponent(spot.name + ' 心霊')}`;
  const tiktokUrl = `https://www.tiktok.com/search?q=${encodeURIComponent(spot.name + ' 心霊')}`;

  function onCardClick() {
    trackEvent(Events.SpotView, {
      slug: spot.slug,
      prefecture: spot.prefecture,
      category: spot.category_slug,
      source: 'spot_card',
    });
  }

  return (
    <div className="surface-card p-4 hover:border-accent transition-colors flex flex-col h-full">
      <Link
        href={`/spots/${spot.slug}`}
        className="flex-1 block"
        onClick={onCardClick}
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
      <div className="mt-3 pt-3 border-t border-bg-border flex items-center gap-2 text-[11px]">
        <a
          href={youtubeUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-1 rounded bg-red-600/15 text-red-300 px-2 py-1 hover:bg-red-600/30"
        >
          ▶ YouTube
        </a>
        <a
          href={tiktokUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-1 rounded bg-pink-500/15 text-pink-300 px-2 py-1 hover:bg-pink-500/30"
        >
          🎵 TikTok
        </a>
        <Link
          href={`/spots/${spot.slug}`}
          className="ml-auto text-accent hover:underline"
          onClick={onCardClick}
        >
          詳細 →
        </Link>
      </div>
    </div>
  );
}
