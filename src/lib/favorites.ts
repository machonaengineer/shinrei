'use client';

import { trackEvent } from './analytics';

/**
 * Client-side favorites / visited tracking via localStorage.
 * No auth required — fully anonymous, instant, works offline.
 *
 * We store a small snapshot of each spot so the /favorites page can
 * render cards without a DB round-trip.
 */

export type FavoriteSnapshot = {
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
  ts: number;
};

export type VisitState = 'none' | 'want' | 'visited';

const FAV_KEY = 'shinrei-favorites';
const VISIT_KEY = 'shinrei-visited';
export const FAVORITES_CHANGED = 'shinrei:favorites-changed';

function read<T>(key: string): T[] {
  if (typeof window === 'undefined') return [];
  try {
    const raw = window.localStorage.getItem(key);
    return raw ? (JSON.parse(raw) as T[]) : [];
  } catch {
    return [];
  }
}

function write<T>(key: string, value: T[]): void {
  if (typeof window === 'undefined') return;
  try {
    window.localStorage.setItem(key, JSON.stringify(value));
    window.dispatchEvent(new CustomEvent(FAVORITES_CHANGED));
  } catch {
    // storage full / disabled — ignore
  }
}

// ---- favorites ----

export function getFavorites(): FavoriteSnapshot[] {
  return read<FavoriteSnapshot>(FAV_KEY).sort((a, b) => b.ts - a.ts);
}

export function isFavorite(slug: string): boolean {
  return read<FavoriteSnapshot>(FAV_KEY).some((f) => f.slug === slug);
}

export function toggleFavorite(spot: Omit<FavoriteSnapshot, 'ts'>): boolean {
  const list = read<FavoriteSnapshot>(FAV_KEY);
  const idx = list.findIndex((f) => f.slug === spot.slug);
  if (idx >= 0) {
    list.splice(idx, 1);
    write(FAV_KEY, list);
    trackEvent('favorite_remove', { slug: spot.slug });
    return false;
  }
  list.push({ ...spot, ts: Date.now() });
  write(FAV_KEY, list);
  trackEvent('favorite_add', { slug: spot.slug, prefecture: spot.prefecture });
  return true;
}

export function favoritesCount(): number {
  return read<FavoriteSnapshot>(FAV_KEY).length;
}

// ---- visited / want-to-go ----

type VisitRecord = { slug: string; state: Exclude<VisitState, 'none'>; ts: number };

export function getVisitState(slug: string): VisitState {
  const rec = read<VisitRecord>(VISIT_KEY).find((v) => v.slug === slug);
  return rec?.state ?? 'none';
}

export function setVisitState(slug: string, state: VisitState): void {
  const list = read<VisitRecord>(VISIT_KEY).filter((v) => v.slug !== slug);
  if (state !== 'none') {
    list.push({ slug, state, ts: Date.now() });
  }
  write(VISIT_KEY, list);
  trackEvent('visit_toggle', { slug, state });
}

export function getVisited(): VisitRecord[] {
  return read<VisitRecord>(VISIT_KEY).sort((a, b) => b.ts - a.ts);
}

export function countByState(state: Exclude<VisitState, 'none'>): number {
  return read<VisitRecord>(VISIT_KEY).filter((v) => v.state === state).length;
}
