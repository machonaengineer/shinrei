'use client';

import { useState, useTransition } from 'react';
import { submitNewsletterAction } from '@/app/actions/submit-newsletter';

export function NewsletterSignup({ compact = false }: { compact?: boolean }) {
  const [pending, startTransition] = useTransition();
  const [ok, setOk] = useState(false);
  const [err, setErr] = useState<string | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    setErr(null);
    startTransition(async () => {
      const res = await submitNewsletterAction(fd);
      if (res.ok) setOk(true);
      else setErr(res.error);
    });
  }

  if (ok) {
    return (
      <div className={compact ? 'text-sm text-ink-dim' : 'surface-card p-4 text-center text-ink-dim text-sm'}>
        ✓ 登録ありがとうございました。配信開始時にお知らせします。
      </div>
    );
  }

  const wrap = compact
    ? 'flex flex-wrap items-center gap-2'
    : 'surface-card p-4 space-y-2';

  return (
    <form className={wrap} onSubmit={onSubmit}>
      {!compact && (
        <>
          <h3 className="text-ink font-semibold text-sm">📨 月1のメール購読</h3>
          <p className="text-xs text-ink-dim leading-relaxed">
            新しいスポット、人気のランキング、安全に楽しむためのコラムを月1回だけお届けします。いつでも解除できます。
          </p>
        </>
      )}
      <div className={compact ? 'flex flex-1 min-w-[200px] gap-2' : 'flex gap-2'}>
        <input
          name="email"
          type="email"
          required
          placeholder="you@example.com"
          className="input flex-1"
        />
        <button type="submit" disabled={pending} className="btn-primary text-sm">
          {pending ? '送信中…' : '登録'}
        </button>
      </div>
      {err && <p className="text-xs text-accent-red">{err}</p>}
      {!compact && (
        <p className="text-[10px] text-ink-muted">
          ※ メールアドレスは月1のニュースレター送信および統計目的にのみ使用します。
        </p>
      )}
    </form>
  );
}
