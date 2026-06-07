import type { Database } from '@/types/database';
import { PhotoLightboxGrid, type LightboxImage } from './PhotoLightboxGrid';

type SpotImage = Database['public']['Tables']['spot_images']['Row'];

export function PhotoGallery({
  images,
  spotSlug,
}: {
  images: SpotImage[];
  spotSlug: string;
}) {
  const lightboxImages: LightboxImage[] = images.map((img) => ({
    id: img.id,
    image_url: img.image_url,
    caption: img.caption,
    uploaded_by_name: img.uploaded_by_name,
  }));
  return <PhotoLightboxGrid images={lightboxImages} spotSlug={spotSlug} />;
}
