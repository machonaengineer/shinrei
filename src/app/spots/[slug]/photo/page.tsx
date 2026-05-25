import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { PhotoUploadForm } from '@/components/PhotoUploadForm';
import { buildMetadata } from '@/lib/seo';
import { decodeSlug } from '@/lib/utils';

type Params = { slug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  return buildMetadata({
    title: '写真を投稿',
    description: 'スポットの現地写真・雰囲気写真を投稿できます。',
    path: `/spots/${params.slug}/photo`,
    noindex: true,
  });
}

export default async function PhotoSubmitPage({ params }: { params: Params }) {
  const supabase = supabaseServer();
  const { data: spot } = await supabase
    .from('spots')
    .select('name, slug')
    .eq('slug', decodeSlug(params.slug))
    .eq('status', 'published')
    .single();

  if (!spot) notFound();

  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink mb-1">写真を投稿する</h1>
      <p className="text-sm text-ink-dim mb-6">対象スポット: {spot.name}</p>
      <PhotoUploadForm spotSlug={spot.slug} />
    </div>
  );
}
