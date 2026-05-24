'use client';

import { useEffect, useMemo, useRef } from 'react';
import type { Map as LeafletMap, Marker, MarkerClusterGroup } from 'leaflet';
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
  const clusterRef = useRef<MarkerClusterGroup | null>(null);
  const markersRef = useRef<Marker[]>([]);
  const config = useMemo(getMapConfig, []);

  useEffect(() => {
    let cancelled = false;
    if (!containerRef.current) return;

    (async () => {
      const L = await import('leaflet');
      await import('leaflet.markercluster');
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
          preferCanvas: true,
        });
        L.tileLayer(config.tileUrl, {
          attribution: config.attribution,
          maxZoom: 18,
        }).addTo(mapRef.current);
      }

      const map = mapRef.current;

      // 既存マーカー/クラスタをクリア
      if (clusterRef.current) {
        clusterRef.current.clearLayers();
        map.removeLayer(clusterRef.current);
        clusterRef.current = null;
      }
      markersRef.current.forEach((m) => m.remove());
      markersRef.current = [];

      const useCluster = typeof L.markerClusterGroup === 'function' && spots.length > 1;

      if (useCluster) {
        clusterRef.current = L.markerClusterGroup({
          chunkedLoading: true,
          chunkInterval: 80,
          chunkDelay: 30,
          showCoverageOnHover: false,
          spiderfyOnMaxZoom: true,
          maxClusterRadius: 50,
          iconCreateFunction: (cluster) => {
            const count = cluster.getChildCount();
            const size = count < 10 ? 32 : count < 100 ? 40 : 48;
            return L.divIcon({
              html: `<div style="
                background:#9d4edd;
                color:#fff;
                width:${size}px;height:${size}px;border-radius:50%;
                display:flex;align-items:center;justify-content:center;
                font-weight:bold;font-size:${size <= 32 ? 12 : 14}px;
                border:2px solid #11121a;
                box-shadow:0 0 0 3px rgba(157,78,221,0.35), 0 4px 12px rgba(0,0,0,0.6);
              ">${count}</div>`,
              className: 'shinrei-cluster',
              iconSize: [size, size],
              iconAnchor: [size / 2, size / 2],
            });
          },
        });
        spots.forEach((s) => {
          const m = buildMarker(L, s);
          clusterRef.current!.addLayer(m);
        });
        map.addLayer(clusterRef.current);
      } else {
        spots.forEach((s) => {
          const m = buildMarker(L, s);
          m.addTo(map);
          markersRef.current.push(m);
        });
      }

      if (singleSpotName) {
        // keep current view
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
      <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet.markercluster@1.5.3/dist/MarkerCluster.css"
      />
      <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet.markercluster@1.5.3/dist/MarkerCluster.Default.css"
      />
      <div
        ref={containerRef}
        style={{ height }}
        className="w-full rounded-xl overflow-hidden border border-bg-border"
      />
      {spots.length > 0 && (
        <Link href={`/spots/${spots[0].slug}`} prefetch className="sr-only">
          {spots[0].name}
        </Link>
      )}
    </div>
  );
}

function buildMarker(L: typeof import('leaflet'), s: SpotPin): Marker {
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
  const marker = L.marker([s.lat, s.lng], { icon });
  const safeName = escapeHtml(s.name);
  const safePref = escapeHtml(s.prefecture ?? '');
  const url = `/spots/${encodeURIComponent(s.slug)}`;
  const yt = `https://www.youtube.com/results?search_query=${encodeURIComponent(s.name + ' 心霊')}`;
  marker.bindPopup(`
    <div style="min-width:200px">
      <div style="font-weight:600;color:#fff;margin-bottom:4px;">${safeName}</div>
      <div style="font-size:12px;color:#a0a0b5;margin-bottom:8px;">${safePref}</div>
      <div style="display:flex;gap:8px;font-size:12px;">
        <a href="${url}" style="color:#c8a4ff;text-decoration:underline;">詳細</a>
        <a href="${yt}" target="_blank" rel="noopener noreferrer" style="color:#ff6b6b;text-decoration:underline;">▶ YouTube</a>
      </div>
    </div>
  `);
  return marker;
}

function escapeHtml(s: string): string {
  return s
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#39;');
}
