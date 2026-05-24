'use client';

import { useEffect, useRef, useState } from 'react';
import type { Map as LeafletMap, Marker } from 'leaflet';
import { getMapConfig } from '@/lib/map';

const DEFAULT_CENTER: [number, number] = [35.6895, 139.6917]; // Tokyo
const DEFAULT_ZOOM = 5;
const NOMINATIM = 'https://nominatim.openstreetmap.org/search';

type Props = {
  /** Hidden form field names. Submitting form will include lat/lng */
  latName?: string;
  lngName?: string;
  initialLat?: number;
  initialLng?: number;
  height?: string;
};

export function SpotLocationPicker({
  latName = 'lat',
  lngName = 'lng',
  initialLat,
  initialLng,
  height = '50vh',
}: Props) {
  const containerRef = useRef<HTMLDivElement | null>(null);
  const mapRef = useRef<LeafletMap | null>(null);
  const markerRef = useRef<Marker | null>(null);

  const [lat, setLat] = useState<number | null>(initialLat ?? null);
  const [lng, setLng] = useState<number | null>(initialLng ?? null);
  const [query, setQuery] = useState('');
  const [searching, setSearching] = useState(false);
  const [searchError, setSearchError] = useState<string | null>(null);
  const [locating, setLocating] = useState(false);

  useEffect(() => {
    let cancelled = false;
    if (!containerRef.current) return;

    (async () => {
      const L = await import('leaflet');
      if (cancelled || !containerRef.current) return;

      if (!mapRef.current) {
        const start: [number, number] =
          initialLat != null && initialLng != null
            ? [initialLat, initialLng]
            : DEFAULT_CENTER;
        const cfg = getMapConfig();
        mapRef.current = L.map(containerRef.current, {
          center: start,
          zoom: initialLat != null ? 14 : DEFAULT_ZOOM,
        });
        L.tileLayer(cfg.tileUrl, { attribution: cfg.attribution, maxZoom: 18 }).addTo(
          mapRef.current,
        );

        mapRef.current.on('click', (ev) => {
          const { lat: la, lng: ln } = ev.latlng;
          setPin(la, ln);
        });
      }

      if (initialLat != null && initialLng != null) {
        setPin(initialLat, initialLng);
      }
    })();

    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    return () => {
      mapRef.current?.remove();
      mapRef.current = null;
      markerRef.current = null;
    };
  }, []);

  async function setPin(la: number, ln: number, animate = true) {
    const L = await import('leaflet');
    if (!mapRef.current) return;
    const icon = L.divIcon({
      html: `<div style="
        width:28px;height:28px;border-radius:50% 50% 50% 0;
        transform:rotate(-45deg);
        background:#9d4edd;border:2px solid #fff;
        box-shadow:0 0 0 2px rgba(157,78,221,0.4),0 4px 12px rgba(0,0,0,0.6);
        display:flex;align-items:center;justify-content:center;
      "><span style="transform:rotate(45deg);color:#fff;font-size:12px;">📍</span></div>`,
      className: 'shinrei-pick-pin',
      iconSize: [28, 28],
      iconAnchor: [14, 28],
    });
    if (markerRef.current) {
      markerRef.current.setLatLng([la, ln]);
    } else {
      markerRef.current = L.marker([la, ln], { icon, draggable: true }).addTo(mapRef.current);
      markerRef.current.on('dragend', () => {
        const p = markerRef.current!.getLatLng();
        setLat(p.lat);
        setLng(p.lng);
      });
    }
    if (animate) {
      mapRef.current.setView([la, ln], Math.max(mapRef.current.getZoom(), 13));
    }
    setLat(la);
    setLng(ln);
  }

  async function geocode() {
    if (!query.trim()) return;
    setSearching(true);
    setSearchError(null);
    try {
      const res = await fetch(
        `${NOMINATIM}?q=${encodeURIComponent(query)}&format=json&limit=1&accept-language=ja`,
        { headers: { Accept: 'application/json' } },
      );
      const data = (await res.json()) as Array<{ lat: string; lon: string; display_name: string }>;
      if (!Array.isArray(data) || data.length === 0) {
        setSearchError('該当する場所が見つかりませんでした。別の言葉でお試しください。');
      } else {
        const la = parseFloat(data[0].lat);
        const ln = parseFloat(data[0].lon);
        setPin(la, ln);
      }
    } catch {
      setSearchError('住所検索に失敗しました。時間を置いて再度お試しください。');
    } finally {
      setSearching(false);
    }
  }

  function useCurrentLocation() {
    if (!navigator.geolocation) {
      setSearchError('このブラウザは現在地取得に対応していません。');
      return;
    }
    setLocating(true);
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setPin(pos.coords.latitude, pos.coords.longitude);
        setLocating(false);
      },
      () => {
        setSearchError('現在地が取得できませんでした。');
        setLocating(false);
      },
      { timeout: 8000, maximumAge: 60000 },
    );
  }

  return (
    <div className="space-y-3">
      <div className="surface-soft p-3 space-y-2">
        <div className="flex flex-wrap gap-2">
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === 'Enter') {
                e.preventDefault();
                geocode();
              }
            }}
            placeholder="住所・地名で検索（例：青梅市 成木、犬鳴峠、Salem Massachusetts）"
            className="input flex-1 min-w-[200px]"
          />
          <button
            type="button"
            onClick={geocode}
            disabled={searching}
            className="btn-secondary text-sm"
          >
            {searching ? '検索中…' : '🔍 住所検索'}
          </button>
          <button
            type="button"
            onClick={useCurrentLocation}
            disabled={locating}
            className="btn-secondary text-sm"
          >
            {locating ? '取得中…' : '📍 現在地'}
          </button>
        </div>
        <p className="text-xs text-ink-muted">
          地図を<strong className="text-ink-dim">クリック</strong>するとピンが立ちます。ピンは<strong className="text-ink-dim">ドラッグ</strong>して微調整できます。
        </p>
        {searchError && (
          <p className="text-xs text-accent-red">{searchError}</p>
        )}
      </div>

      <div
        ref={containerRef}
        style={{ height }}
        className="w-full rounded-xl overflow-hidden border border-bg-border"
      />

      <div className="surface-soft p-3 text-sm flex items-center justify-between flex-wrap gap-2">
        <div>
          選択中の座標:{' '}
          {lat != null && lng != null ? (
            <span className="text-ink font-mono">
              {lat.toFixed(5)}, {lng.toFixed(5)}
            </span>
          ) : (
            <span className="text-ink-muted">未選択（地図をクリックしてください）</span>
          )}
        </div>
        <a
          href={lat != null && lng != null ? `https://www.google.com/maps?q=${lat},${lng}` : '#'}
          target="_blank"
          rel="noopener noreferrer"
          className={`text-xs ${lat != null ? 'text-accent hover:underline' : 'text-ink-muted pointer-events-none'}`}
        >
          📌 Google Maps で確認
        </a>
      </div>

      {/* hidden inputs for form submit */}
      <input type="hidden" name={latName} value={lat ?? ''} required />
      <input type="hidden" name={lngName} value={lng ?? ''} required />
    </div>
  );
}
