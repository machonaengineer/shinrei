'use server';

import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeBoolean, safeString } from '@/lib/utils';

const schema = z.object({
  targetUrl: z.string().url('URL形式で入力してください'),
  reason: z.string().min(1, '理由は必須です').max(200),
  isRightsHolder: z.boolean(),
  body: z.string().min(1, '詳細本文は必須です').max(2000),
  email: z.string().email('メール形式で入力してください'),
  confirmed: z.literal(true, { errorMap: () => ({ message: '確認チェックは必須です' }) }),
});

export type SubmitRemovalResult =
  | { ok: true }
  | { ok: false; error: string; fieldErrors?: Record<string, string> };

export async function submitRemovalAction(formData: FormData): Promise<SubmitRemovalResult> {
  const parsed = schema.safeParse({
    targetUrl: safeString(formData.get('targetUrl')),
    reason: safeString(formData.get('reason')),
    isRightsHolder: safeBoolean(formData.get('isRightsHolder')),
    body: safeString(formData.get('body')),
    email: safeString(formData.get('email')),
    confirmed: safeBoolean(formData.get('confirmed')) as true,
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
  const { error } = await admin.from('removal_requests').insert({
    target_url: parsed.data.targetUrl,
    reason: parsed.data.reason,
    is_rights_holder: parsed.data.isRightsHolder,
    body: parsed.data.body,
    email: parsed.data.email,
    status: 'open',
  });

  if (error) {
    return { ok: false, error: `送信に失敗しました: ${error.message}` };
  }
  return { ok: true };
}
