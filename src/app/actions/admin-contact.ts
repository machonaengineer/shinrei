'use server';

import { revalidatePath } from 'next/cache';
import { redirect } from 'next/navigation';
import { requireAdmin, supabaseAdmin } from '@/lib/supabase';
import type { ReportStatus } from '@/types/database';

async function ensureAdmin() {
  const res = await requireAdmin();
  if (!res.ok) redirect('/login?error=' + res.reason);
}

export async function updateContactStatusAction(formData: FormData) {
  await ensureAdmin();
  const id = String(formData.get('id') ?? '');
  const status = String(formData.get('status') ?? '') as ReportStatus;
  if (!id || !status) return;
  await supabaseAdmin().from('contact_messages').update({ status }).eq('id', id);
  revalidatePath('/admin/contact');
}
