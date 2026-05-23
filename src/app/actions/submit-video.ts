'use server';

import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeBoolean, safeString } from '@/lib/utils';
import { detectPlatform, toEmbedUrl } from '@/lib/video';

const schema = z.object({
  spotSlug: z.string().min(1),
  videoUrl: z.string().url('URL形式で入力してください'),
  title: z.string().max(120).optional(),
  submittedBy: z.string().max(60).optional(),
  agreed: z.literal(true, { errorMap: () => ({ message: '注意事項への同意は必須です' }) }),
});

export type SubmitVideoResult =
  | { ok: true }
  | { ok: false; error: string };

export async function submitVideoAction(formData: FormData): Promise<SubmitVideoResult> {
  const parsed = schema.safeParse({
    spotSlug: safeString(formData.get('spotSlug')),
    videoUrl: safeString(formData.get('videoUrl')),
    title: safeString(formData.get('title')) || undefined,
    submittedBy: safeString(formData.get('submittedBy')) || undefined,
    agreed: safeBoolean(formData.get('agreed')) as true,
  });
  if (!parsed.success) {
    const first = parsed.error.errors[0];
    return { ok: false, error: first?.message ?? '入力内容を確認してください' };
  }

  const admin = supabaseAdmin();
  const { data: spot } = await admin
    .from('spots')
    .select('id')
    .eq('slug', parsed.data.spotSlug)
    .single();
  if (!spot) return { ok: false, error: '対象スポットが見つかりません' };

  const platform = detectPlatform(parsed.data.videoUrl);
  const embed = toEmbedUrl(parsed.data.videoUrl, platform);

  const { error } = await admin.from('spot_videos').insert({
    spot_id: spot.id,
    platform,
    video_url: parsed.data.videoUrl,
    embed_url: embed ?? null,
    title: parsed.data.title ?? null,
    status: 'pending_review',
    source_type: 'user_submission',
    submitted_by_name: parsed.data.submittedBy ?? null,
  });
  if (error) return { ok: false, error: `投稿に失敗しました: ${error.message}` };
  return { ok: true };
}
