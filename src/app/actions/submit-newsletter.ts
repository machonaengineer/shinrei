'use server';

import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeString } from '@/lib/utils';

const schema = z.object({
  email: z.string().email('メール形式で入力してください'),
});

export type SubmitNewsletterResult =
  | { ok: true }
  | { ok: false; error: string };

export async function submitNewsletterAction(formData: FormData): Promise<SubmitNewsletterResult> {
  const parsed = schema.safeParse({
    email: safeString(formData.get('email')),
  });
  if (!parsed.success) {
    return { ok: false, error: parsed.error.errors[0]?.message ?? '入力内容を確認してください' };
  }

  // We use the existing contact_messages table to avoid a new migration.
  // source='newsletter' makes filtering trivial in /admin/contact.
  const { error } = await supabaseAdmin().from('contact_messages').insert({
    name: null,
    email: parsed.data.email,
    subject: 'ニュースレター登録',
    body: '心霊マップのニュースレター登録希望',
    source: 'newsletter',
    status: 'open',
  });
  if (error) return { ok: false, error: `登録に失敗しました: ${error.message}` };
  return { ok: true };
}
