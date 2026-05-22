'use client';

import { useState, useTransition } from 'react';
import { submitReviewAction, type SubmitReviewResult } from '@/app/actions/submit-review';
import { RulesBox } from './RulesBox';

export function ReviewForm({ spotSlug }: { spotSlug: string }) {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitReviewResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    fd.set('spotSlug', spotSlug);
    startTransition(async () => {
      const res = await submitReviewAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold">口コミの投稿を受け付けました</h2>
        <p className="mt-2 text-ink-dim text-sm">管理者の承認後に公開されます。</p>
      </div>
    );
  }

  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-5" onSubmit={onSubmit}>
      <RulesBox />

      <div>
        <label htmlFor="userName" className="label">投稿者名（任意）</label>
        <input id="userName" name="userName" maxLength={60} className="input" placeholder="匿名" />
      </div>

      <div>
        <label htmlFor="body" className="label">口コミ本文（20文字以上）<span className="required-mark">*</span></label>
        <textarea id="body" name="body" required minLength={20} maxLength={2000} rows={6} className="input" placeholder="例：夜に通ったとき、後ろから足音のような音が聞こえた気がしました。真偽は不明です。" />
        {fieldErrors.body && <p className="mt-1 text-xs text-accent-red">{fieldErrors.body}</p>}
      </div>

      <div className="grid gap-4 md:grid-cols-2">
        <div>
          <label htmlFor="scaryScore" className="label">怖さスコア（1〜5）</label>
          <input id="scaryScore" name="scaryScore" type="number" min={1} max={5} defaultValue={3} className="input" />
        </div>
        <div>
          <label htmlFor="visitedAt" className="label">訪問時期（任意）</label>
          <input id="visitedAt" name="visitedAt" maxLength={60} className="input" placeholder="例：2024年秋" />
        </div>
      </div>

      <div>
        <label htmlFor="imageUrl" className="label">画像URL（任意）</label>
        <input id="imageUrl" name="imageUrl" type="url" maxLength={500} className="input" placeholder="https://..." />
        <p className="mt-1 text-xs text-ink-muted">
          無断侵入で撮影した写真や個人を特定できる写真は投稿しないでください。
        </p>
      </div>

      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="agreed" required className="mt-0.5" />
        <span>
          禁止事項・注意事項を理解し、これに同意します。投稿は管理者の承認後に公開されます。
        </span>
      </label>
      {fieldErrors.agreed && <p className="text-xs text-accent-red">{fieldErrors.agreed}</p>}

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? '送信中…' : '口コミを投稿する'}
      </button>
    </form>
  );
}
