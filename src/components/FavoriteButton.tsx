'use client';

import { useEffect, useState } from 'react';
import {
  type FavoriteSnapshot,
  type VisitState,
  isFavorite,
  toggleFavorite,
  getVisitState,
  setVisitState,
  FAVORITES_CHANGED,
} from '@/lib/favorites';

type Spot = Omit<FavoriteSnapshot, 'ts'>;

/** Compact heart toggle for use on cards. */
export function FavoriteHeart({ spot }: { spot: Spot }) {
  const [fav, setFav] = useState(false);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    setFav(isFavorite(spot.slug));
    const onChange = () => setFav(isFavorite(spot.slug));
    window.addEventListener(FAVORITES_CHANGED, onChange);
    return () => window.removeEventListener(FAVORITES_CHANGED, onChange);
  }, [spot.slug]);

  if (!mounted) {
    return <span className="inline-block w-6 h-6" aria-hidden />;
  }

  return (
    <button
      type="button"
      aria-label={fav ? 'お気に入りから外す' : 'お気に入りに追加'}
      onClick={(e) => {
        e.preventDefault();
        e.stopPropagation();
        setFav(toggleFavorite(spot));
      }}
      className={`inline-flex items-center justify-center w-7 h-7 rounded-full transition-colors ${
        fav ? 'text-accent-red' : 'text-ink-muted hover:text-accent-red'
      }`}
    >
      <span className="text-lg leading-none">{fav ? '♥' : '♡'}</span>
    </button>
  );
}

/** Full control panel for the spot detail page. */
export function FavoriteControls({ spot }: { spot: Spot }) {
  const [fav, setFav] = useState(false);
  const [visit, setVisit] = useState<VisitState>('none');
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    setFav(isFavorite(spot.slug));
    setVisit(getVisitState(spot.slug));
    const onChange = () => {
      setFav(isFavorite(spot.slug));
      setVisit(getVisitState(spot.slug));
    };
    window.addEventListener(FAVORITES_CHANGED, onChange);
    return () => window.removeEventListener(FAVORITES_CHANGED, onChange);
  }, [spot.slug]);

  if (!mounted) {
    return <div className="h-10" aria-hidden />;
  }

  function pickVisit(next: VisitState) {
    const value = visit === next ? 'none' : next;
    setVisit(value);
    setVisitState(spot.slug, value);
  }

  return (
    <div className="flex flex-wrap items-center gap-2">
      <button
        type="button"
        onClick={() => setFav(toggleFavorite(spot))}
        className={`btn ${fav ? 'bg-accent-red text-white' : 'btn-secondary'} text-sm`}
      >
        {fav ? '♥ お気に入り済み' : '♡ お気に入り'}
      </button>
      <button
        type="button"
        onClick={() => pickVisit('want')}
        className={`btn text-sm ${
          visit === 'want'
            ? 'bg-accent text-white'
            : 'btn-secondary'
        }`}
      >
        🚩 行きたい
      </button>
      <button
        type="button"
        onClick={() => pickVisit('visited')}
        className={`btn text-sm ${
          visit === 'visited'
            ? 'bg-status-published text-white'
            : 'btn-secondary'
        }`}
      >
        ✓ 行った
      </button>
      <span className="text-xs text-ink-muted">
        ※ お気に入り・チェックはこの端末内に保存されます
      </span>
    </div>
  );
}
