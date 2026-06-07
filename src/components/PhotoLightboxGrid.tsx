'use client';

import { useEffect, useState } from 'react';
import Image from 'next/image';
import Link from 'next/link';

export type LightboxImage = {
  id: string;
  image_url: string;
  caption: string | null;
  uploaded_by_name: string | null;
};

export function PhotoLightboxGrid({
  images,
  spotSlug,
}: {
  images: LightboxImage[];
  spotSlug: string;
}) {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  useEffect(() => {
    if (openIndex === null) return;
    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') setOpenIndex(null);
      if (e.key === 'ArrowRight') setOpenIndex((i) => (i === null ? 0 : (i + 1) % images.length));
      if (e.key === 'ArrowLeft') setOpenIndex((i) => (i === null ? 0 : (i - 1 + images.length) % images.length));
    }
    window.addEventListener('keydown', onKey);
    document.body.style.overflow = 'hidden';
    return () => {
      window.removeEventListener('keydown', onKey);
      document.body.style.overflow = '';
    };
  }, [openIndex, images.length]);

  if (!images.length) {
    return (
      <div className="surface-card p-6 text-center text-sm text-ink-dim">
        まだ承認済みの写真はありません。
        <div className="mt-2">
          <Link href={`/spots/${spotSlug}/photo`} className="text-accent hover:underline">
            写真を投稿する
          </Link>
        </div>
      </div>
    );
  }

  const active = openIndex !== null ? images[openIndex] : null;

  return (
    <>
      <div className="grid grid-cols-2 gap-2 sm:grid-cols-3">
        {images.map((img, i) => (
          <figure key={img.id} className="surface-card overflow-hidden">
            <button
              type="button"
              onClick={() => setOpenIndex(i)}
              className="block relative aspect-square w-full bg-bg-soft cursor-zoom-in"
              aria-label="写真を拡大表示"
            >
              <Image
                src={img.image_url}
                alt={img.caption ?? '投稿写真'}
                fill
                sizes="(max-width: 640px) 50vw, (max-width: 1024px) 33vw, 250px"
                className="object-cover"
              />
            </button>
            <figcaption className="px-2 py-1 text-[11px] text-ink-muted leading-tight">
              {img.caption && <div className="text-ink-dim line-clamp-2">{img.caption}</div>}
              <div className="flex items-center justify-between mt-0.5">
                <span>by {img.uploaded_by_name || '匿名'}</span>
                <Link
                  href={`/report?targetType=image&targetId=${img.id}`}
                  className="text-accent-red hover:underline"
                >
                  通報
                </Link>
              </div>
            </figcaption>
          </figure>
        ))}
      </div>

      {active && openIndex !== null && (
        <div
          role="dialog"
          aria-modal="true"
          className="fixed inset-0 z-50 bg-black/85 flex items-center justify-center p-4"
          onClick={() => setOpenIndex(null)}
        >
          <button
            type="button"
            aria-label="閉じる"
            className="absolute top-4 right-4 text-white text-3xl leading-none w-10 h-10 rounded-full bg-white/10 hover:bg-white/20"
            onClick={(e) => { e.stopPropagation(); setOpenIndex(null); }}
          >
            ×
          </button>
          {images.length > 1 && (
            <>
              <button
                type="button"
                aria-label="前へ"
                className="absolute left-4 text-white text-3xl w-10 h-10 rounded-full bg-white/10 hover:bg-white/20"
                onClick={(e) => { e.stopPropagation(); setOpenIndex((openIndex - 1 + images.length) % images.length); }}
              >
                ‹
              </button>
              <button
                type="button"
                aria-label="次へ"
                className="absolute right-4 text-white text-3xl w-10 h-10 rounded-full bg-white/10 hover:bg-white/20"
                onClick={(e) => { e.stopPropagation(); setOpenIndex((openIndex + 1) % images.length); }}
              >
                ›
              </button>
            </>
          )}
          <figure
            className="relative max-w-5xl w-full max-h-[85vh] flex flex-col items-center"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="relative w-full" style={{ height: '70vh' }}>
              <Image
                src={active.image_url}
                alt={active.caption ?? '投稿写真'}
                fill
                sizes="90vw"
                className="object-contain"
                priority
              />
            </div>
            <figcaption className="mt-3 text-sm text-white/80 text-center max-w-2xl">
              {active.caption && <div>{active.caption}</div>}
              <div className="text-xs text-white/50 mt-1">
                {openIndex + 1} / {images.length} ・ by {active.uploaded_by_name || '匿名'}
              </div>
            </figcaption>
          </figure>
        </div>
      )}
    </>
  );
}
