'use client';

import dynamic from 'next/dynamic';

export const MapViewDynamic = dynamic(
  () => import('./MapView').then((m) => m.MapView),
  {
    ssr: false,
    loading: () => (
      <div className="w-full rounded-xl border border-bg-border bg-bg-soft flex items-center justify-center text-ink-dim text-sm" style={{ height: '60vh' }}>
        地図を読み込み中…
      </div>
    ),
  },
);
