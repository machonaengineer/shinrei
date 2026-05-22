'use client';

import { useState, useTransition } from 'react';
import { submitRemovalAction, type SubmitRemovalResult } from '@/app/actions/submit-removal';

export function RemovalRequestForm() {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitRemovalResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    startTransition(async () => {
      const res = await submitRemovalAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold">削除依頼を受け付けました</h2>
        <p className="mt-2 text-ink-dim text-sm">対応までしばらくお待ちください。</p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-5" onSubmit={onSubmit}>
      <div>
        <label htmlFor="targetUrl" className="label">対象URL<span className="required-mark">*</span></label>
        <input id="targetUrl" name="targetUrl" type="url" required className="input" placeholder="https://example.com/spots/..." />
        {fieldErrors.targetUrl && <p className="mt-1 text-xs text-accent-red">{fieldErrors.targetUrl}</p>}
      </div>
      <div>
        <label htmlFor="reason" className="label">削除依頼理由<span className="required-mark">*</span></label>
        <input id="reason" name="reason" required maxLength={200} className="input" placeholder="例：個人情報が含まれているため" />
        {fieldErrors.reason && <p className="mt-1 text-xs text-accent-red">{fieldErrors.reason}</p>}
      </div>
      <label className="flex items-center gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="isRightsHolder" />
        権利者本人または関係者です
      </label>
      <div>
        <label htmlFor="body" className="label">詳細本文<span className="required-mark">*</span></label>
        <textarea id="body" name="body" required maxLength={2000} rows={5} className="input" placeholder="該当箇所、根拠、ご事情をご記載ください。" />
        {fieldErrors.body && <p className="mt-1 text-xs text-accent-red">{fieldErrors.body}</p>}
      </div>
      <div>
        <label htmlFor="email" className="label">連絡先メール<span className="required-mark">*</span></label>
        <input id="email" name="email" type="email" required maxLength={120} className="input" />
        {fieldErrors.email && <p className="mt-1 text-xs text-accent-red">{fieldErrors.email}</p>}
      </div>
      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="confirmed" required className="mt-0.5" />
        <span>記載内容に虚偽がないことを確認しました。</span>
      </label>
      {fieldErrors.confirmed && <p className="text-xs text-accent-red">{fieldErrors.confirmed}</p>}

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? '送信中…' : '削除依頼を送信する'}
      </button>
    </form>
  );
}
