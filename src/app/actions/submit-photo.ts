'use server';

import { randomUUID } from 'node:crypto';
import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeBoolean, safeString } from '@/lib/utils';

const MAX_BYTES = 10 * 1024 * 1024;
const ALLOWED_MIME = new Set(['image/jpeg', 'image/jpg', 'image/png', 'image/webp']);
const ALLOWED_EXT = new Set(['jpg', 'jpeg', 'png', 'webp']);
const BUCKET = 'spot-photos';

const schema = z.object({
  spotSlug: z.string().min(1),
  caption: z.string().max(200).optional(),
  uploadedBy: z.string().max(60).optional(),
  agreed: z.literal(true, { errorMap: () => ({ message: '注意事項への同意は必須です' }) }),
});

export type SubmitPhotoResult =
  | { ok: true }
  | { ok: false; error: string };

export async function submitPhotoAction(formData: FormData): Promise<SubmitPhotoResult> {
  const parsed = schema.safeParse({
    spotSlug: safeString(formData.get('spotSlug')),
    caption: safeString(formData.get('caption')) || undefined,
    uploadedBy: safeString(formData.get('uploadedBy')) || undefined,
    agreed: safeBoolean(formData.get('agreed')) as true,
  });
  if (!parsed.success) {
    const first = parsed.error.errors[0];
    return { ok: false, error: first?.message ?? '入力内容を確認してください' };
  }

  const file = formData.get('photo');
  if (!(file instanceof File) || file.size === 0) {
    return { ok: false, error: '画像ファイルを選択してください' };
  }
  if (file.size > MAX_BYTES) {
    return { ok: false, error: `ファイルサイズは ${(MAX_BYTES / 1024 / 1024).toFixed(0)}MB 以下にしてください` };
  }
  if (!ALLOWED_MIME.has(file.type)) {
    return { ok: false, error: 'jpg / png / webp のみアップロードできます' };
  }
  const ext = (file.name.split('.').pop() ?? '').toLowerCase();
  if (!ALLOWED_EXT.has(ext)) {
    return { ok: false, error: '拡張子は jpg / jpeg / png / webp のみです' };
  }

  const admin = supabaseAdmin();

  const { data: spot, error: spotErr } = await admin
    .from('spots')
    .select('id')
    .eq('slug', parsed.data.spotSlug)
    .single();
  if (spotErr || !spot) return { ok: false, error: '対象スポットが見つかりません' };

  const objectKey = `pending/${spot.id}/${randomUUID()}.${ext}`;
  const buffer = Buffer.from(await file.arrayBuffer());

  const { error: upErr } = await admin.storage.from(BUCKET).upload(objectKey, buffer, {
    contentType: file.type,
    upsert: false,
  });
  if (upErr) {
    return {
      ok: false,
      error: `アップロードに失敗しました（バケット ${BUCKET} がSupabaseで作成されているか確認してください）: ${upErr.message}`,
    };
  }

  const { data: pub } = admin.storage.from(BUCKET).getPublicUrl(objectKey);
  const publicUrl = pub.publicUrl;

  const { error: insertErr } = await admin.from('spot_images').insert({
    spot_id: spot.id,
    image_url: publicUrl,
    status: 'pending_review',
    caption: parsed.data.caption ?? null,
    uploaded_by_name: parsed.data.uploadedBy ?? null,
    source_type: 'user_upload',
  });
  if (insertErr) {
    // best-effort cleanup
    await admin.storage.from(BUCKET).remove([objectKey]);
    return { ok: false, error: `保存に失敗しました: ${insertErr.message}` };
  }

  return { ok: true };
}
