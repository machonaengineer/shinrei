'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import { SpotCard } from '@/components/SpotCard';
import {
  type FavoriteSnapshot,
  getFavorites,
  getVisited,
  FAVORITES_CHANGED,
} from '@/lib/favorites';

type VisitRecord = { slug: string; state: 'want' | 'visited'; ts: number };

export function FavoritesClient() {
  const [favorites, setFavorites] = useState<FavoriteSnapshot[]>([]);
  const [visited, setVisited] = useState<VisitRecord[]>([]);
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
    const refresh = () => {
      setFavorites(getFavorites());
      setVisited(getVisited());
    };
    refresh();
    window.addEventListener(FAVORITES_CHANGED, refresh);
    return () => window.removeEventListener(FAVORITES_CHANGED, refresh);
  }, []);

  if (!mounted) {
    return <div className="surface-card p-8 text-center text-ink-dim">読み込み中…</div>;
  }

  const favSlugs = new Set(favorites.map((f) => f.slug));
  const wantSlugs = visited.filter((v) => v.state === 'want');
  const visitedSlugs = visited.filter((v) => v.state === 'visited');

  if (favorites.length === 0 && visited.length === 0) {
    return (
      <div className="surface-card p-8 text-center space-y-3">
        <div className="text-3xl">♡</div>
        <p className="text-ink-dim text-sm">
          まだお気に入りや訪問チェックがありません。
        </p>
        <p className="text-ink-muted text-xs">
          各スポットの ♡ ボタンでお気に入りに追加できます（この端末内に保存されます）。
        </p>
        <div className="pt-2">
          <Link href="/map" className="btn-primary text-sm">地図でスポットを探す</Link>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-10">
      <section>
        <h2 className="text-lg font-semibold text-ink mb-3">
          ♥ お気に入り
          <span className="ml-2 text-xs text-ink-muted">{favorites.length}件</span>
        </h2>
        {favorites.length === 0 ? (
          <p className="surface-card p-6 text-center text-ink-dim text-sm">お気に入りはまだありません。</p>
        ) : (
          <ul className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {favorites.map((f) => (
              <li key={f.slug}>
                <SpotCard spot={f} />
              </li>
            ))}
          </ul>
        )}
      </section>

      {wantSlugs.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">
            🚩 行きたい
            <span className="ml-2 text-xs text-ink-muted">{wantSlugs.length}件</span>
          </h2>
          <ul className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
            {wantSlugs.map((v) => {
              const snap = favorites.find((f) => f.slug === v.slug);
              return (
                <li key={v.slug}>
                  {snap ? (
                    <SpotCard spot={snap} />
                  ) : (
                    <Link href={`/spots/${v.slug}`} className="surface-card block p-3 text-ink hover:border-accent">
                      {v.slug}
                    </Link>
                  )}
                </li>
              );
            })}
          </ul>
          {wantSlugs.some((v) => !favSlugs.has(v.slug)) && (
            <p className="text-xs text-ink-muted mt-2">
              ※ お気に入りに入れていない「行きたい」はスポット名のみ表示されます。
            </p>
          )}
        </section>
      )}

      {visitedSlugs.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-3">
            ✓ 行った
            <span className="ml-2 text-xs text-ink-muted">{visitedSlugs.length}件</span>
          </h2>
          <ul className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
            {visitedSlugs.map((v) => {
              const snap = favorites.find((f) => f.slug === v.slug);
              return (
                <li key={v.slug}>
                  {snap ? (
                    <SpotCard spot={snap} />
                  ) : (
                    <Link href={`/spots/${v.slug}`} className="surface-card block p-3 text-ink hover:border-accent">
                      {v.slug}
                    </Link>
                  )}
                </li>
              );
            })}
          </ul>
        </section>
      )}
    </div>
  );
}
