'use client';

import { useState, useTransition } from 'react';
import { submitSpotAction, type SubmitSpotResult } from '@/app/actions/submit-spot';
import { CATEGORIES, PREFECTURES } from '@/lib/constants';
import { RulesBox } from './RulesBox';
import { DisclaimerBox } from './DisclaimerBox';

export function SubmitSpotForm() {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitSpotResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    startTransition(async () => {
      const res = await submitSpotAction(fd);
      setResult(res);
      if (res.ok) {
        (e.target as HTMLFormElement).reset();
      }
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold text-lg">投稿を受け付けました</h2>
        <p className="mt-2 text-ink-dim text-sm">
          投稿は管理者の承認後に公開されます。ご協力ありがとうございました。
        </p>
      </div>
    );
  }

  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-5" onSubmit={onSubmit}>
      <RulesBox />

      <div>
        <label htmlFor="name" className="label">スポット名<span className="required-mark">*</span></label>
        <input id="name" name="name" required maxLength={120} className="input" placeholder="例：旧月影トンネル" />
        {fieldErrors.name && <p className="mt-1 text-xs text-accent-red">{fieldErrors.name}</p>}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="prefectureSlug" className="label">都道府県<span className="required-mark">*</span></label>
          <select id="prefectureSlug" name="prefectureSlug" required className="input" defaultValue="">
            <option value="" disabled>選択してください</option>
            {PREFECTURES.map((p) => (
              <option key={p.slug} value={p.slug}>{p.name}</option>
            ))}
          </select>
          {fieldErrors.prefectureSlug && <p className="mt-1 text-xs text-accent-red">{fieldErrors.prefectureSlug}</p>}
        </div>
        <div>
          <label htmlFor="city" className="label">市区町村</label>
          <input id="city" name="city" maxLength={120} className="input" placeholder="例：横浜市青葉区" />
        </div>
      </div>

      <div>
        <label htmlFor="addressPublic" className="label">公開用住所</label>
        <input id="addressPublic" name="addressPublic" maxLength={200} className="input" placeholder="例：〇〇市〇〇周辺（番地は伏せる）" />
        <p className="mt-1 text-xs text-ink-muted">番地などの詳細は伏せ字にしてください。</p>
      </div>

      <div>
        <label htmlFor="categorySlug" className="label">カテゴリ<span className="required-mark">*</span></label>
        <select id="categorySlug" name="categorySlug" required className="input" defaultValue="">
          <option value="" disabled>選択してください</option>
          {CATEGORIES.map((c) => (
            <option key={c.slug} value={c.slug}>{c.emoji} {c.name}</option>
          ))}
        </select>
        {fieldErrors.categorySlug && <p className="mt-1 text-xs text-accent-red">{fieldErrors.categorySlug}</p>}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="lat" className="label">緯度<span className="required-mark">*</span></label>
          <input id="lat" name="lat" type="number" step="any" required className="input" placeholder="35.681236" />
          {fieldErrors.lat && <p className="mt-1 text-xs text-accent-red">{fieldErrors.lat}</p>}
        </div>
        <div>
          <label htmlFor="lng" className="label">経度<span className="required-mark">*</span></label>
          <input id="lng" name="lng" type="number" step="any" required className="input" placeholder="139.767125" />
          {fieldErrors.lng && <p className="mt-1 text-xs text-accent-red">{fieldErrors.lng}</p>}
        </div>
      </div>

      <div>
        <label htmlFor="description" className="label">概要（20文字以上）<span className="required-mark">*</span></label>
        <textarea id="description" name="description" required minLength={20} maxLength={2000} rows={5} className="input" placeholder="例：地元で語られる怪談として、夜間に人影を見たという目撃談があるとされています。真偽は不明です。" />
        {fieldErrors.description && <p className="mt-1 text-xs text-accent-red">{fieldErrors.description}</p>}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="scaryScore" className="label">怖さスコア（1〜5）</label>
          <input id="scaryScore" name="scaryScore" type="number" min={1} max={5} defaultValue={3} className="input" />
        </div>
        <div>
          <label htmlFor="dangerLevel" className="label">危険度（1〜5）</label>
          <input id="dangerLevel" name="dangerLevel" type="number" min={1} max={5} defaultValue={1} className="input" />
        </div>
      </div>

      <div className="grid gap-2 md:grid-cols-2">
        <label className="flex items-center gap-2 text-sm text-ink-dim">
          <input type="checkbox" name="isPrivateProperty" />
          私有地である
        </label>
        <label className="flex items-center gap-2 text-sm text-ink-dim">
          <input type="checkbox" name="isEntryProhibited" />
          立入禁止区域である
        </label>
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="submitterName" className="label">投稿者名（任意）</label>
          <input id="submitterName" name="submitterName" maxLength={60} className="input" />
        </div>
        <div>
          <label htmlFor="submitterEmail" className="label">投稿者メール（任意）</label>
          <input id="submitterEmail" name="submitterEmail" type="email" maxLength={120} className="input" />
        </div>
      </div>

      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="agreed" required className="mt-0.5" />
        <span>
          禁止事項・注意事項を理解し、これに同意します。投稿は管理者の承認後に公開されます。
        </span>
      </label>
      {fieldErrors.agreed && <p className="text-xs text-accent-red">{fieldErrors.agreed}</p>}

      <DisclaimerBox compact />

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? '送信中…' : 'スポットを投稿する'}
      </button>
    </form>
  );
}
