'use server';

import { randomUUID } from 'node:crypto';
import { z } from 'zod';
import { supabaseAdmin } from '@/lib/supabase';
import { safeBoolean, safeString } from '@/lib/utils';

const MAX_BYTES = 10 * 1024 * 1024;
const MAX_PHOTOS = 5;
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
  | { ok: true; count: number }
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

  // accept both 'photo' (legacy single) and 'photos' (new multi)
  const rawFiles: File[] = [];
  const legacy = formData.get('photo');
  if (legacy instanceof File && legacy.size > 0) rawFiles.push(legacy);
  for (const f of formData.getAll('photos')) {
    if (f instanceof File && f.size > 0) rawFiles.push(f);
  }
  if (rawFiles.length === 0) {
    return { ok: false, error: '画像ファイルを選択してください' };
  }
  if (rawFiles.length > MAX_PHOTOS) {
    return { ok: false, error: `一度に投稿できるのは最大 ${MAX_PHOTOS} 枚です` };
  }

  for (const f of rawFiles) {
    if (f.size > MAX_BYTES) {
      return { ok: false, error: `各ファイルは ${(MAX_BYTES / 1024 / 1024).toFixed(0)}MB 以下にしてください` };
    }
    if (!ALLOWED_MIME.has(f.type)) {
      return { ok: false, error: 'jpg / png / webp のみアップロードできます' };
    }
    const ext = (f.name.split('.').pop() ?? '').toLowerCase();
    if (!ALLOWED_EXT.has(ext)) {
      return { ok: false, error: '拡張子は jpg / jpeg / png / webp のみです' };
    }
  }

  const admin = supabaseAdmin();
  const { data: spot, error: spotErr } = await admin
    .from('spots')
    .select('id')
    .eq('slug', parsed.data.spotSlug)
    .single();
  if (spotErr || !spot) return { ok: false, error: '対象スポットが見つかりません' };

  const uploadedKeys: string[] = [];

  for (const file of rawFiles) {
    const ext = (file.name.split('.').pop() ?? '').toLowerCase();
    const objectKey = `pending/${spot.id}/${randomUUID()}.${ext}`;
    const buffer = Buffer.from(await file.arrayBuffer());

    const { error: upErr } = await admin.storage.from(BUCKET).upload(objectKey, buffer, {
      contentType: file.type,
      upsert: false,
    });
    if (upErr) {
      // best-effort cleanup of anything already uploaded
      if (uploadedKeys.length) await admin.storage.from(BUCKET).remove(uploadedKeys);
      return {
        ok: false,
        error: `アップロードに失敗しました（バケット ${BUCKET} が Supabase で作成されているか確認してください）: ${upErr.message}`,
      };
    }
    uploadedKeys.push(objectKey);

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
      await admin.storage.from(BUCKET).remove(uploadedKeys);
      return { ok: false, error: `保存に失敗しました: ${insertErr.message}` };
    }
  }

  return { ok: true, count: rawFiles.length };
}
