import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { supabaseServer } from '@/lib/supabase';
import { ReviewForm } from '@/components/ReviewForm';
import { buildMetadata } from '@/lib/seo';

type Params = { slug: string };

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  return buildMetadata({
    title: `口コミを投稿`,
    description: `スポットの心霊体験談・噂・都市伝説の口コミを投稿できます。`,
    path: `/spots/${params.slug}/review`,
    noindex: true,
  });
}

export default async function ReviewSubmitPage({ params }: { params: Params }) {
  const supabase = supabaseServer();
  const { data: spot } = await supabase
    .from('spots')
    .select('name, slug')
    .eq('slug', params.slug)
    .eq('status', 'published')
    .single();

  if (!spot) notFound();

  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink mb-1">体験談を投稿する</h1>
      <p className="text-sm text-ink-dim mb-6">対象スポット: {spot.name}</p>
      <ReviewForm spotSlug={spot.slug} />
    </div>
  );
}
