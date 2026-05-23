'use server';

import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeString } from '@/lib/utils';

const schema = z.object({
  name: z.string().max(60).optional(),
  email: z.string().email().optional().or(z.literal('')),
  subject: z.string().max(120).optional(),
  body: z.string().min(10, '本文は10文字以上で入力してください').max(3000),
  source: z.string().max(60).optional(),
});

export type SubmitContactResult =
  | { ok: true }
  | { ok: false; error: string; fieldErrors?: Record<string, string> };

export async function submitContactAction(formData: FormData): Promise<SubmitContactResult> {
  const parsed = schema.safeParse({
    name: safeString(formData.get('name')) || undefined,
    email: safeString(formData.get('email')) || undefined,
    subject: safeString(formData.get('subject')) || undefined,
    body: safeString(formData.get('body')),
    source: safeString(formData.get('source')) || 'contact-form',
  });
  if (!parsed.success) {
    const fieldErrors: Record<string, string> = {};
    parsed.error.errors.forEach((e) => {
      const path = e.path.join('.');
      if (path) fieldErrors[path] = e.message;
    });
    return { ok: false, error: '入力内容を確認してください', fieldErrors };
  }

  const { error } = await supabaseAdmin().from('contact_messages').insert({
    name: parsed.data.name ?? null,
    email: parsed.data.email || null,
    subject: parsed.data.subject ?? null,
    body: parsed.data.body,
    source: parsed.data.source ?? 'contact-form',
    status: 'open',
  });
  if (error) return { ok: false, error: `送信に失敗しました: ${error.message}` };
  return { ok: true };
}
