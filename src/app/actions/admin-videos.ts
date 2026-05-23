'use server';

import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { requireAdmin, supabaseAdmin } from '@/lib/supabase';
import type { ReviewStatus } from '@/types/database';

async function ensureAdmin() {
  const res = await requireAdmin();
  if (!res.ok) redirect('/login?error=' + res.reason);
}

export async function updateVideoStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReviewStatus;
  if (!id || !status) return;
  await supabaseAdmin().from('spot_videos').update({ status }).eq('id', id);
  revalidatePath('/admin/videos');
}

export async function deleteVideoAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  if (!id) return;
  await supabaseAdmin().from('spot_videos').update({ status: 'deleted' }).eq('id', id);
  revalidatePath('/admin/videos');
}

export async function updateImageStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReviewStatus;
  if (!id || !status) return;
  await supabaseAdmin().from('spot_images').update({ status }).eq('id', id);
  revalidatePath('/admin/photos');
}

export async function deleteImageAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  if (!id) return;
  await supabaseAdmin().from('spot_images').update({ status: 'deleted' }).eq('id', id);
  revalidatePath('/admin/photos');
}
