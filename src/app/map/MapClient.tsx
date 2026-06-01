'use client';

import { useMemo, useState } from 'react';
import Link from 'next/link';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { CategoryBadge } from '@/components/CategoryBadge';
import { ScaryScore } from '@/components/ScaryScore';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { trackEvent, Events } from '@/lib/analytics';
import type { SpotPin } from '@/types/spot';

type FlaggedPin = SpotPin & { has_image: boolean; has_video: boolean };

export function MapClient({ spots }: { spots: FlaggedPin[] }) {
  const [scope, setScope] = useState<'japan' | 'world' | 'all'>('all');
  const [country, setCountry] = useState('');
  const [category, setCategory] = useState('');
  const [prefecture, setPrefecture] = useState('');
  const [minScary, setMinScary] = useState(0);
  const [withImage, setWithImage] = useState(false);
  const [withVideo, setWithVideo] = useState(false);
  const [query, setQuery] = useState('');

  const filtered = useMemo(() => {
    return spots.filter((s) => {
      if (scope === 'japan' && s.country_slug !== 'japan') return false;
      if (scope === 'world' && s.country_slug === 'japan') return false;
      if (country && s.country_slug !== country) return false;
      if (category && s.category_slug !== category) return false;
      if (prefecture && s.prefecture_slug !== prefecture) return false;
      if (minScary && Number(s.scary_score) < minScary) return false;
      if (withImage && !s.has_image) return false;
      if (withVideo && !s.has_video) return false;
      if (query && !s.name.toLowerCase().includes(query.toLowerCase())) return false;
      return true;
    });
  }, [spots, scope, country, category, prefecture, minScary, withImage, withVideo, query]);

  function findNearMe() {
    trackEvent(Events.NearbySearchClick);
    if (!navigator.geolocation) return;
    navigator.geolocation.getCurrentPosition(() => {
      const el = document.getElementById('map-spot-list');
      el?.scrollIntoView({ behavior: 'smooth' });
    });
  }

  function onFilter(name: string, value: string | number | boolean) {
    trackEvent(Events.MapFilterClick, { filter: name, value: String(value) });
  }

  return (
    <div className="space-y-4">
      <div className="surface-card p-3 grid gap-2 md:grid-cols-6">
        <div className="md:col-span-2 flex items-center gap-1 text-xs">
          {(['all', 'japan', 'world'] as const).map((s) => (
            <button
              key={s}
              onClick={() => { onFilter('scope', s); setScope(s); }}
              className={`rounded-full px-3 py-1 border ${scope === s ? 'border-accent text-ink' : 'border-bg-border text-ink-dim hover:text-ink'}`}
            >
              {s === 'all' ? 'すべて' : s === 'japan' ? '🇯🇵 日本' : '🌐 海外'}
            </button>
          ))}
        </div>
        <input
          className="input md:col-span-2"
          placeholder="スポット名で検索"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <select className="input" value={category} onChange={(e) => { onFilter('category', e.target.value); setCategory(e.target.value); }}>
          <option value="">カテゴリ：すべて</option>
          {CATEGORIES.map((c) => (
            <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
          ))}
        </select>
        <select className="input" value={minScary} onChange={(e) => { onFilter('minScary', Number(e.target.value)); setMinScary(Number(e.target.value)); }}>
          <option value={0}>怖さ：すべて</option>
          <option value={2}>★2以上</option>
          <option value={3}>★3以上</option>
          <option value={4}>★4以上</option>
        </select>
      </div>

      <div className="surface-card p-3 grid gap-2 md:grid-cols-4">
        <select className="input" value={country} onChange={(e) => setCountry(e.target.value)} disabled={scope === 'japan'}>
          <option value="">国：すべて</option>
          {COUNTRIES.map((c) => (
            <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
          ))}
        </select>
        <select className="input" value={prefecture} onChange={(e) => { onFilter('prefecture', e.target.value); setPrefecture(e.target.value); }} disabled={scope === 'world'}>
          <option value="">都道府県：すべて</option>
          {PREFECTURES.map((p) => (
            <option key={p.slug} value={p.slug}>{p.name}</option>
          ))}
        </select>
        <label className="flex items-center gap-2 text-sm text-ink-dim px-2">
          <input type="checkbox" checked={withImage} onChange={(e) => setWithImage(e.target.checked)} />
          写真あり
        </label>
        <label className="flex items-center gap-2 text-sm text-ink-dim px-2">
          <input type="checkbox" checked={withVideo} onChange={(e) => setWithVideo(e.target.checked)} />
          動画あり
        </label>
      </div>

      <div className="flex justify-end">
        <button onClick={findNearMe} className="btn-secondary text-sm">
          📍 現在地周辺を探す
        </button>
      </div>

      <MapViewDynamic
        spots={filtered}
        height="60vh"
        center={scope === 'world' ? [20, 0] : undefined}
        zoom={scope === 'world' ? 2 : undefined}
      />

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
            {filtered.slice(0, 60).map((s) => (
              <li key={s.id}>
                <Link
                  href={`/spots/${s.slug}`}
                  className="surface-card block p-3 hover:border-accent"
                >
                  <div className="flex items-start justify-between gap-2">
                    <span className="font-medium text-ink">{s.name}</span>
                    <CategoryBadge slug={s.category_slug} />
                  </div>
                  <div className="text-xs text-ink-dim mt-1">
                    {s.country_slug !== 'japan' && (
                      <span className="mr-1">🌐 {s.country}</span>
                    )}
                    {s.prefecture}
                  </div>
                  <div className="mt-2 flex justify-between items-center">
                    <ScaryScore value={s.scary_score} />
                    <div className="flex items-center gap-2 text-[10px] text-ink-muted">
                      {s.has_image && <span className="rounded bg-accent/15 px-1.5 py-0.5">📷</span>}
                      {s.has_video && <span className="rounded bg-accent/15 px-1.5 py-0.5">🎬</span>}
                      <span>口コミ {s.review_count}</span>
                    </div>
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
