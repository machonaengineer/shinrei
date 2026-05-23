'use client';

import { useState, useTransition } from 'react';
import { submitContactAction, type SubmitContactResult } from '@/app/actions/submit-contact';

export function ContactForm() {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitContactResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    startTransition(async () => {
      const res = await submitContactAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold">お問い合わせを受け付けました</h2>
        <p className="mt-2 text-ink-dim text-sm">確認次第、運営者より対応いたします。</p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-4" onSubmit={onSubmit}>
      <div>
        <label htmlFor="name" className="label">お名前（任意）</label>
        <input id="name" name="name" maxLength={60} className="input" />
      </div>
      <div>
        <label htmlFor="email" className="label">メールアドレス（任意・返信が必要な場合）</label>
        <input id="email" name="email" type="email" maxLength={120} className="input" />
      </div>
      <div>
        <label htmlFor="subject" className="label">件名（任意）</label>
        <input id="subject" name="subject" maxLength={120} className="input" placeholder="例：記事の誤りについて" />
      </div>
      <div>
        <label htmlFor="body" className="label">お問い合わせ内容<span className="required-mark">*</span></label>
        <textarea id="body" name="body" required minLength={10} maxLength={3000} rows={6} className="input" />
        {fieldErrors.body && <p className="mt-1 text-xs text-accent-red">{fieldErrors.body}</p>}
      </div>

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? '送信中…' : '送信する'}
      </button>
    </form>
  );
}
