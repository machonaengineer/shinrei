'use server';

import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeString } from '@/lib/utils';
import { REPORT_REASONS } from '@/lib/constants';

const schema = z.object({
  targetType: z.enum(['spot', 'review', 'image', 'other']),
  targetId: z.string().uuid().optional().or(z.literal('')),
  reason: z.enum(REPORT_REASONS),
  body: z.string().max(2000).optional(),
  email: z.string().email().optional().or(z.literal('')),
});

export type SubmitReportResult =
  | { ok: true }
  | { ok: false; error: string; fieldErrors?: Record<string, string> };

export async function submitReportAction(formData: FormData): Promise<SubmitReportResult> {
  const parsed = schema.safeParse({
    targetType: safeString(formData.get('targetType')) || 'other',
    targetId: safeString(formData.get('targetId')) || undefined,
    reason: safeString(formData.get('reason')),
    body: safeString(formData.get('body')) || undefined,
    email: safeString(formData.get('email')) || undefined,
  });

  if (!parsed.success) {
    const fieldErrors: Record<string, string> = {};
    parsed.error.errors.forEach((e) => {
      const path = e.path.join('.');
      if (path) fieldErrors[path] = e.message;
    });
    return { ok: false, error: '入力内容を確認してください', fieldErrors };
  }

  const admin = supabaseAdmin();
  const { error } = await admin.from('reports').insert({
    target_type: parsed.data.targetType,
    target_id: parsed.data.targetId || null,
    reason: parsed.data.reason,
    body: parsed.data.body ?? null,
    email: parsed.data.email || null,
    status: 'open',
  });

  if (error) {
    return { ok: false, error: `送信に失敗しました: ${error.message}` };
  }
  return { ok: true };
}
