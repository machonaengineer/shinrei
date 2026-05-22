'use client';

import { useMemo, useState } from 'react';
import Link from 'next/link';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { CategoryBadge } from '@/components/CategoryBadge';
import { ScaryScore } from '@/components/ScaryScore';
import { CATEGORIES, PREFECTURES } from '@/lib/constants';
import type { SpotPin } from '@/types/spot';

export function MapClient({ spots }: { spots: SpotPin[] }) {
  const [category, setCategory] = useState('');
  const [prefecture, setPrefecture] = useState('');
  const [minScary, setMinScary] = useState(0);
  const [query, setQuery] = useState('');

  const filtered = useMemo(() => {
    return spots.filter((s) => {
      if (category && s.category_slug !== category) return false;
      if (prefecture && s.prefecture_slug !== prefecture) return false;
      if (minScary && Number(s.scary_score) < minScary) return false;
      if (query && !s.name.toLowerCase().includes(query.toLowerCase())) return false;
      return true;
    });
  }, [spots, category, prefecture, minScary, query]);

  function findNearMe() {
    if (!navigator.geolocation) return;
    navigator.geolocation.getCurrentPosition((pos) => {
      // soft-filter: keep only spots within ~50km
      const { latitude, longitude } = pos.coords;
      const km = 50;
      const filteredNear = spots
        .map((s) => ({
          s,
          d: haversine(latitude, longitude, s.lat, s.lng),
        }))
        .filter((x) => x.d <= km)
        .sort((a, b) => a.d - b.d)
        .map((x) => x.s.slug);

      if (filteredNear.length > 0) {
        setQuery('');
        setCategory('');
        setPrefecture('');
        // simple way: focus list scroll
        const el = document.getElementById('map-spot-list');
        el?.scrollIntoView({ behavior: 'smooth' });
      } else {
        alert('近くに公開中のスポットが見つかりませんでした。');
      }
    });
  }

  return (
    <div className="space-y-4">
      <div className="surface-card p-3 grid gap-2 md:grid-cols-5">
        <input
          className="input md:col-span-2"
          placeholder="スポット名で検索"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <select className="input" value={category} onChange={(e) => setCategory(e.target.value)}>
          <option value="">カテゴリ：すべて</option>
          {CATEGORIES.map((c) => (
            <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
          ))}
        </select>
        <select className="input" value={prefecture} onChange={(e) => setPrefecture(e.target.value)}>
          <option value="">都道府県：すべて</option>
          {PREFECTURES.map((p) => (
            <option key={p.slug} value={p.slug}>{p.name}</option>
          ))}
        </select>
        <select
          className="input"
          value={minScary}
          onChange={(e) => setMinScary(Number(e.target.value))}
        >
          <option value={0}>怖さ：すべて</option>
          <option value={2}>★2以上</option>
          <option value={3}>★3以上</option>
          <option value={4}>★4以上</option>
        </select>
      </div>

      <div className="flex justify-end">
        <button onClick={findNearMe} className="btn-secondary text-sm">
          📍 現在地周辺を探す
        </button>
      </div>

      <MapViewDynamic spots={filtered} height="60vh" />

      <div id="map-spot-list">
        <h2 className="text-lg font-semibold text-ink mt-6 mb-2">
          表示中のスポット（{filtered.length}件）
        </h2>
        {filtered.length === 0 ? (
          <p className="surface-card p-4 text-center text-ink-dim">
            条件に合うスポットが見つかりません。
          </p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {filtered.map((s) => (
              <li key={s.id}>
                <Link
                  href={`/spots/${s.slug}`}
                  className="surface-card block p-3 hover:border-accent"
                >
                  <div className="flex items-start justify-between gap-2">
                    <span className="font-medium text-ink">{s.name}</span>
                    <CategoryBadge slug={s.category_slug} />
                  </div>
                  <div className="text-xs text-ink-dim mt-1">{s.prefecture}</div>
                  <div className="mt-2 flex justify-between">
                    <ScaryScore value={s.scary_score} />
                    <span className="text-xs text-ink-muted">口コミ {s.review_count}</span>
                  </div>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}

function haversine(lat1: number, lon1: number, lat2: number, lon2: number) {
  const R = 6371;
  const toRad = (x: number) => (x * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return 2 * R * Math.asin(Math.sqrt(a));
}
