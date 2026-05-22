'use client';

import { useEffect, useMemo, useRef } from 'react';
import type { Map as LeafletMap, Marker } from 'leaflet';
import Link from 'next/link';
import { getMapConfig, buildDivIconHtml } from '@/lib/map';
import { CATEGORY_BY_SLUG, DEFAULT_MAP_CENTER, DEFAULT_MAP_ZOOM } from '@/lib/constants';
import type { SpotPin } from '@/types/spot';

type Props = {
  spots: SpotPin[];
  center?: [number, number];
  zoom?: number;
  height?: string;
  interactive?: boolean;
  /** show only one marker (used in detail pages) */
  singleSpotName?: string;
};

export function MapView({
  spots,
  center = DEFAULT_MAP_CENTER,
  zoom = DEFAULT_MAP_ZOOM,
  height = '70vh',
  interactive = true,
  singleSpotName,
}: Props) {
  const containerRef = useRef<HTMLDivElement | null>(null);
  const mapRef = useRef<LeafletMap | null>(null);
  const markersRef = useRef<Marker[]>([]);
  const config = useMemo(getMapConfig, []);

  useEffect(() => {
    let cancelled = false;
    if (!containerRef.current) return;

    (async () => {
      const L = await import('leaflet');
      if (cancelled || !containerRef.current) return;

      if (!mapRef.current) {
        mapRef.current = L.map(containerRef.current, {
          center,
          zoom,
          zoomControl: interactive,
          dragging: interactive,
          scrollWheelZoom: interactive,
          doubleClickZoom: interactive,
          touchZoom: interactive,
          boxZoom: interactive,
          keyboard: interactive,
        });
        L.tileLayer(config.tileUrl, {
          attribution: config.attribution,
          maxZoom: 18,
        }).addTo(mapRef.current);
      }

      const map = mapRef.current;

      // clear old markers
      markersRef.current.forEach((m) => m.remove());
      markersRef.current = [];

      spots.forEach((s) => {
        const cat = CATEGORY_BY_SLUG[s.category_slug] ?? {
          slug: 'other',
          name: 'その他',
          color: '#9d4edd',
          emoji: '❓',
        };
        const icon = L.divIcon({
          html: buildDivIconHtml(cat),
          className: 'shinrei-pin',
          iconSize: [30, 30],
          iconAnchor: [15, 15],
          popupAnchor: [0, -15],
        });
        const marker = L.marker([s.lat, s.lng], { icon }).addTo(map);
        const safeName = escapeHtml(s.name);
        const safePref = escapeHtml(s.prefecture ?? '');
        const url = `/spots/${encodeURIComponent(s.slug)}`;
        marker.bindPopup(`
          <div style="min-width:180px">
            <div style="font-weight:600;color:#fff;margin-bottom:4px;">${safeName}</div>
            <div style="font-size:12px;color:#a0a0b5;margin-bottom:6px;">${safePref}</div>
            <a href="${url}" style="color:#c8a4ff;font-size:13px;text-decoration:underline;">詳細を見る</a>
          </div>
        `);
        markersRef.current.push(marker);
      });

      if (singleSpotName) {
        // do not autofit, keep configured center/zoom
      } else if (spots.length > 1) {
        const bounds = L.latLngBounds(spots.map((s) => [s.lat, s.lng] as [number, number]));
        if (bounds.isValid()) {
          map.fitBounds(bounds.pad(0.2), { maxZoom: 13 });
        }
      } else if (spots.length === 1) {
        map.setView([spots[0].lat, spots[0].lng], Math.max(zoom, 12));
      }
    })();

    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [spots]);

  useEffect(() => {
    return () => {
      mapRef.current?.remove();
      mapRef.current = null;
    };
  }, []);

  return (
    <div className="relative">
      <div
        ref={containerRef}
        style={{ height }}
        className="w-full rounded-xl overflow-hidden border border-bg-border"
      />
      {/* invisible Link kept for prefetching first spot detail */}
      {spots.length > 0 && (
        <Link href={`/spots/${spots[0].slug}`} prefetch className="sr-only">
          {spots[0].name}
        </Link>
      )}
    </div>
  );
}

function escapeHtml(s: string): string {
  return s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');
}
