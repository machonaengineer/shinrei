'use server';

import { z } from 'zod';
import { headers } from 'next/headers';
import { supabaseAdmin } from '@/lib/supabase';
import { buildSpotSlug, hashIp, safeBoolean, safeNumber, safeString } from '@/lib/utils';
import { CATEGORY_BY_SLUG, PREFECTURE_BY_SLUG } from '@/lib/constants';

const schema = z.object({
  name: z.string().min(1, 'スポット名は必須です').max(120),
  prefectureSlug: z.string().min(1, '都道府県は必須です'),
  city: z.string().max(120).optional(),
  addressPublic: z.string().max(200).optional(),
  lat: z.number().min(-90).max(90),
  lng: z.number().min(-180).max(180),
  categorySlug: z.string().min(1, 'カテゴリは必須です'),
  description: z.string().min(20, '概要は20文字以上で入力してください').max(2000),
  scaryScore: z.number().min(1).max(5),
  dangerLevel: z.number().min(1).max(5),
  isPrivateProperty: z.boolean(),
  isEntryProhibited: z.boolean(),
  submitterName: z.string().max(60).optional(),
  submitterEmail: z.string().email().optional().or(z.literal('')),
  agreed: z.literal(true, { errorMap: () => ({ message: '注意事項への同意は必須です' }) }),
});

export type SubmitSpotResult =
  | { ok: true }
  | { ok: false; error: string; fieldErrors?: Record<string, string> };

export async function submitSpotAction(formData: FormData): Promise<SubmitSpotResult> {
  const parsed = schema.safeParse({
    name: safeString(formData.get('name')),
    prefectureSlug: safeString(formData.get('prefectureSlug')),
    city: safeString(formData.get('city')) || undefined,
    addressPublic: safeString(formData.get('addressPublic')) || undefined,
    lat: safeNumber(formData.get('lat'), Number.NaN),
    lng: safeNumber(formData.get('lng'), Number.NaN),
    categorySlug: safeString(formData.get('categorySlug')),
    description: safeString(formData.get('description')),
    scaryScore: safeNumber(formData.get('scaryScore'), 3),
    dangerLevel: safeNumber(formData.get('dangerLevel'), 1),
    isPrivateProperty: safeBoolean(formData.get('isPrivateProperty')),
    isEntryProhibited: safeBoolean(formData.get('isEntryProhibited')),
    submitterName: safeString(formData.get('submitterName')) || undefined,
    submitterEmail: safeString(formData.get('submitterEmail')) || undefined,
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

  const data = parsed.data;
  const pref = PREFECTURE_BY_SLUG[data.prefectureSlug];
  const cat = CATEGORY_BY_SLUG[data.categorySlug];
  if (!pref) return { ok: false, error: '都道府県の値が不正です' };
  if (!cat) return { ok: false, error: 'カテゴリの値が不正です' };

  const slug = buildSpotSlug(data.name);
  const h = headers();
  const ip =
    h.get('x-forwarded-for')?.split(',')[0]?.trim() ?? h.get('x-real-ip') ?? null;
  // ip_hash is stored on reviews; for spots we just generate slug.
  void hashIp(ip);

  const admin = supabaseAdmin();
  const { error } = await admin.from('spots').insert({
    name: data.name,
    slug,
    description: data.description,
    prefecture: pref.name,
    prefecture_slug: pref.slug,
    city: data.city ?? null,
    address_public: data.addressPublic ?? null,
    lat: data.lat,
    lng: data.lng,
    location_precision: 'approximate',
    category: cat.name,
    category_slug: cat.slug,
    danger_level: data.dangerLevel,
    scary_score: 0,
    review_count: 0,
    is_private_property: data.isPrivateProperty,
    is_entry_prohibited: data.isEntryProhibited,
    status: 'pending_review',
  });

  if (error) {
    return { ok: false, error: `投稿に失敗しました: ${error.message}` };
  }

  return { ok: true };
}
