'use client';

import { useEffect, useMemo, useState } from 'react';
import Link from 'next/link';
import { MapViewDynamic } from '@/components/MapViewDynamic';
import { CategoryBadge } from '@/components/CategoryBadge';
import { ScaryScore } from '@/components/ScaryScore';
import { FavoriteHeart } from '@/components/FavoriteButton';
import { CATEGORIES, COUNTRIES, PREFECTURES } from '@/lib/constants';
import { trackEvent, Events } from '@/lib/analytics';
import type { SpotPin } from '@/types/spot';

type FlaggedPin = SpotPin & { has_image: boolean; has_video: boolean };

function haversineKm(lat1: number, lon1: number, lat2: number, lon2: number): number {
  const R = 6371;
  const toRad = (x: number) => (x * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return 2 * R * Math.asin(Math.sqrt(a));
}

type Coord = { lat: number; lng: number };

export function MapClient({ spots, initialNear = false }: { spots: FlaggedPin[]; initialNear?: boolean }) {
  const [scope, setScope] = useState<'japan' | 'world' | 'all'>('all');
  const [country, setCountry] = useState('');
  const [category, setCategory] = useState('');
  const [prefecture, setPrefecture] = useState('');
  const [minScary, setMinScary] = useState(0);
  const [withImage, setWithImage] = useState(false);
  const [withVideo, setWithVideo] = useState(false);
  const [query, setQuery] = useState('');
  const [origin, setOrigin] = useState<Coord | null>(null);
  const [locating, setLocating] = useState(false);
  const [locateError, setLocateError] = useState<string | null>(null);
  const [maxKm, setMaxKm] = useState<number>(0); // 0 = no limit

  // auto-trigger geolocation when ?near=1
  useEffect(() => {
    if (initialNear) requestLocation();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function requestLocation() {
    trackEvent(Events.NearbySearchClick);
    if (!navigator.geolocation) {
      setLocateError('このブラウザは現在地取得に対応していません。');
      return;
    }
    setLocating(true);
    setLocateError(null);
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setOrigin({ lat: pos.coords.latitude, lng: pos.coords.longitude });
        setLocating(false);
        if (maxKm === 0) setMaxKm(50);
        setTimeout(() => {
          document.getElementById('map-spot-list')?.scrollIntoView({ behavior: 'smooth' });
        }, 200);
      },
      (err) => {
        setLocateError(
          err.code === err.PERMISSION_DENIED
            ? '位置情報の許可が必要です（ブラウザの設定をご確認ください）。'
            : '現在地が取得できませんでした。',
        );
        setLocating(false);
      },
      { timeout: 10000, maximumAge: 60000 },
    );
  }

  function clearLocation() {
    setOrigin(null);
    setMaxKm(0);
    setLocateError(null);
  }

  function onFilter(name: string, value: string | number | boolean) {
    trackEvent(Events.MapFilterClick, { filter: name, value: String(value) });
  }

  const filtered = useMemo(() => {
    let arr = spots.filter((s) => {
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

    if (origin) {
      const withDist = arr.map((s) => ({
        spot: s,
        distKm: haversineKm(origin.lat, origin.lng, s.lat, s.lng),
      }));
      const limited = maxKm > 0 ? withDist.filter((x) => x.distKm <= maxKm) : withDist;
      limited.sort((a, b) => a.distKm - b.distKm);
      return limited.map((x) => ({ ...x.spot, _distKm: x.distKm }));
    }

    return arr.map((s) => ({ ...s, _distKm: undefined as number | undefined }));
  }, [spots, scope, country, category, prefecture, minScary, withImage, withVideo, query, origin, maxKm]);

  return (
    <div className="space-y-4">
      {/* near-me bar */}
      <div className="surface-card p-3 flex flex-wrap items-center gap-3">
        <button
          type="button"
          onClick={origin ? clearLocation : requestLocation}
          disabled={locating}
          className={`btn text-sm ${origin ? 'btn-secondary' : 'btn-primary'}`}
        >
          {locating ? '取得中…' : origin ? '✕ 現在地モード解除' : '📍 現在地から探す'}
        </button>
        {origin && (
          <>
            <label className="flex items-center gap-2 text-sm text-ink-dim">
              半径
              <select
                value={maxKm}
                onChange={(e) => setMaxKm(Number(e.target.value))}
                className="input py-1 text-sm"
              >
                <option value={5}>5 km 以内</option>
                <option value={10}>10 km 以内</option>
                <option value={30}>30 km 以内</option>
                <option value={50}>50 km 以内</option>
                <option value={100}>100 km 以内</option>
                <option value={0}>制限なし</option>
              </select>
            </label>
            <span className="text-xs text-ink-muted">
              現在地: {origin.lat.toFixed(3)}, {origin.lng.toFixed(3)}
            </span>
          </>
        )}
        {locateError && <span className="text-xs text-accent-red">{locateError}</span>}
      </div>

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

      <MapViewDynamic
        spots={filtered}
        height="60vh"
        center={origin ? [origin.lat, origin.lng] : scope === 'world' ? [20, 0] : undefined}
        zoom={origin ? 11 : scope === 'world' ? 2 : undefined}
      />

      <div id="map-spot-list">
        <h2 className="text-lg font-semibold text-ink mt-6 mb-2">
          {origin ? '現在地から近い順' : '表示中のスポット'}（{filtered.length}件）
        </h2>
        {filtered.length === 0 ? (
          <p className="surface-card p-4 text-center text-ink-dim">
            条件に合うスポットが見つかりません。
          </p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {filtered.slice(0, 60).map((s) => (
              <li key={s.id}>
                <div className="surface-card hover:border-accent p-3 flex flex-col h-full">
                  <Link
                    href={`/spots/${s.slug}`}
                    className="flex-1 block"
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
                      {s._distKm !== undefined && (
                        <span className="ml-2 text-accent">
                          📍 {s._distKm < 10 ? s._distKm.toFixed(1) : Math.round(s._distKm)} km
                        </span>
                      )}
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
                  <div className="mt-2 pt-2 border-t border-bg-border flex justify-end">
                    <FavoriteHeart spot={{
                      slug: s.slug, name: s.name, prefecture: s.prefecture, city: null,
                      category_slug: s.category_slug, description: null,
                      scary_score: s.scary_score, review_count: s.review_count,
                      is_entry_prohibited: s.is_entry_prohibited, is_private_property: s.is_private_property,
                    }} />
                  </div>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}
