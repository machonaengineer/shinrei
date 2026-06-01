import Link from 'next/link';
import Image from 'next/image';
import type { Database } from '@/types/database';

type SpotImage = Database['public']['Tables']['spot_images']['Row'];

export function PhotoGallery({
  images,
  spotSlug,
}: {
  images: SpotImage[];
  spotSlug: string;
}) {
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

  return (
    <div className="grid grid-cols-2 gap-2 sm:grid-cols-3">
      {images.map((img) => (
        <figure key={img.id} className="surface-card overflow-hidden">
          <div className="relative aspect-square w-full bg-bg-soft">
            <Image
              src={img.image_url}
              alt={img.caption ?? '投稿写真'}
              fill
              sizes="(max-width: 640px) 50vw, (max-width: 1024px) 33vw, 250px"
              className="object-cover"
              unoptimized={false}
            />
          </div>
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
  );
}
