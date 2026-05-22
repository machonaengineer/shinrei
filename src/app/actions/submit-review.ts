'use server';

import { z } from 'zod';
import { headers } from 'next/headers';
import { supabaseAdmin } from '@/lib/supabase';
import { hashIp, safeBoolean, safeNumber, safeString } from '@/lib/utils';

const schema = z.object({
  spotSlug: z.string().min(1),
  userName: z.string().max(60).optional(),
  body: z.string().min(20, '本文は20文字以上で入力してください').max(2000),
  scaryScore: z.number().min(1).max(5),
  visitedAt: z.string().max(60).optional(),
  imageUrl: z.string().url().optional().or(z.literal('')),
  agreed: z.literal(true, { errorMap: () => ({ message: '注意事項への同意は必須です' }) }),
});

export type SubmitReviewResult =
  | { ok: true }
  | { ok: false; error: string; fieldErrors?: Record<string, string> };

export async function submitReviewAction(formData: FormData): Promise<SubmitReviewResult> {
  const parsed = schema.safeParse({
    spotSlug: safeString(formData.get('spotSlug')),
    userName: safeString(formData.get('userName')) || undefined,
    body: safeString(formData.get('body')),
    scaryScore: safeNumber(formData.get('scaryScore'), 3),
    visitedAt: safeString(formData.get('visitedAt')) || undefined,
    imageUrl: safeString(formData.get('imageUrl')) || undefined,
    agreed: safeBoolean(formData.get('agreed')) as true,
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

  const { data: spot, error: spotErr } = await admin
    .from('spots')
    .select('id')
    .eq('slug', parsed.data.spotSlug)
    .single();

  if (spotErr || !spot) {
    return { ok: false, error: '対象スポットが見つかりません' };
  }

  const h = headers();
  const ip =
    h.get('x-forwarded-for')?.split(',')[0]?.trim() ?? h.get('x-real-ip') ?? null;

  const { error } = await admin.from('reviews').insert({
    spot_id: spot.id,
    user_name: parsed.data.userName ?? null,
    body: parsed.data.body,
    scary_score: parsed.data.scaryScore,
    visited_at: parsed.data.visitedAt ?? null,
    image_url: parsed.data.imageUrl || null,
    status: 'pending_review',
    ip_hash: hashIp(ip),
  });

  if (error) {
    return { ok: false, error: `投稿に失敗しました: ${error.message}` };
  }

  return { ok: true };
}
