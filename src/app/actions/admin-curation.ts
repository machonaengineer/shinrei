'use server';

import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { requireAdmin, supabaseAdmin } from '@/lib/supabase';

async function ensureAdmin() {
  const res = await requireAdmin();
  if (!res.ok) redirect('/login?error=' + res.reason);
}

/**
 * Adds a "編集部より" editorial review to a spot. Counts as UGC for the
 * AdSense index-worthy check, so the spot detail page transitions from
 * noindex to index immediately.
 */
export async function addEditorialReviewAction(formData: FormData) {
  await ensureAdmin();
  const spotId = String(formData.get('spotId') ?? '');
  const body = String(formData.get('body') ?? '').trim();
  const scary = Math.max(1, Math.min(5, Number(formData.get('scary') ?? 3)));

  if (!spotId || body.length < 20) return;

  await supabaseAdmin().from('reviews').insert({
    spot_id: spotId,
    user_name: '編集部',
    body,
    scary_score: scary,
    status: 'published', // bypass review queue — operator vetted
  });

  revalidatePath('/admin/curate');
  revalidatePath('/sitemap.xml');
}
