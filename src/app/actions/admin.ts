'use server';

import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { requireAdmin, supabaseAdmin } from '@/lib/supabase';
import type { ReportStatus, ReviewStatus, SpotStatus } from '@/types/database';

async function ensureAdmin() {
  const res = await requireAdmin();
  if (!res.ok) {
    redirect('/login?error=' + res.reason);
  }
}

export async function updateSpotStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as SpotStatus;
  if (!id || !status) return;
  const admin = supabaseAdmin();
  await admin.from('spots').update({ status }).eq('id', id);
  revalidatePath('/admin');
  revalidatePath('/admin/spots');
  revalidatePath('/map');
  revalidatePath('/');
}

export async function deleteSpotAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  if (!id) return;
  const admin = supabaseAdmin();
  await admin.from('spots').update({ status: 'deleted' }).eq('id', id);
  revalidatePath('/admin/spots');
}

export async function updateReviewStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReviewStatus;
  if (!id || !status) return;
  const admin = supabaseAdmin();
  await admin.from('reviews').update({ status }).eq('id', id);
  revalidatePath('/admin');
  revalidatePath('/admin/reviews');
}

export async function deleteReviewAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  if (!id) return;
  const admin = supabaseAdmin();
  await admin.from('reviews').update({ status: 'deleted' }).eq('id', id);
  revalidatePath('/admin/reviews');
}

export async function updateReportStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReportStatus;
  if (!id || !status) return;
  const admin = supabaseAdmin();
  await admin.from('reports').update({ status }).eq('id', id);
  revalidatePath('/admin/reports');
}

export async function updateRemovalStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReportStatus;
  if (!id || !status) return;
  const admin = supabaseAdmin();
  await admin.from('removal_requests').update({ status }).eq('id', id);
  revalidatePath('/admin/removal-requests');
}
