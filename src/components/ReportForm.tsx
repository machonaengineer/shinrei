'use client';

import { useState, useTransition } from 'react';
import { submitReportAction, type SubmitReportResult } from '@/app/actions/submit-report';
import { REPORT_REASONS } from '@/lib/constants';

export function ReportForm({
  defaultTargetType,
  defaultTargetId,
}: {
  defaultTargetType?: 'spot' | 'review' | 'image' | 'other';
  defaultTargetId?: string;
}) {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitReportResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    startTransition(async () => {
      const res = await submitReportAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold">通報を受け付けました</h2>
        <p className="mt-2 text-ink-dim text-sm">対応までしばらくお待ちください。</p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;
  const fieldErrors = err?.fieldErrors ?? {};

  return (
    <form className="space-y-5" onSubmit={onSubmit}>
      <div>
        <label htmlFor="targetType" className="label">対象タイプ<span className="required-mark">*</span></label>
        <select id="targetType" name="targetType" required defaultValue={defaultTargetType ?? 'spot'} className="input">
          <option value="spot">スポット</option>
          <option value="review">口コミ</option>
          <option value="image">画像</option>
          <option value="other">その他</option>
        </select>
      </div>
      <div>
        <label htmlFor="targetId" className="label">対象ID（任意・スポットIDや口コミIDがあれば）</label>
        <input id="targetId" name="targetId" defaultValue={defaultTargetId} className="input" placeholder="UUID" />
      </div>
      <div>
        <label htmlFor="reason" className="label">通報理由<span className="required-mark">*</span></label>
        <select id="reason" name="reason" required className="input" defaultValue="">
          <option value="" disabled>選択してください</option>
          {REPORT_REASONS.map((r) => (
            <option key={r} value={r}>{r}</option>
          ))}
        </select>
        {fieldErrors.reason && <p className="mt-1 text-xs text-accent-red">{fieldErrors.reason}</p>}
      </div>
      <div>
        <label htmlFor="body" className="label">詳細本文</label>
        <textarea id="body" name="body" rows={5} maxLength={2000} className="input" placeholder="どの記述が問題と感じたかを具体的に記載してください。" />
      </div>
      <div>
        <label htmlFor="email" className="label">連絡先メール（任意）</label>
        <input id="email" name="email" type="email" maxLength={120} className="input" />
      </div>

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? '送信中…' : '通報を送信する'}
      </button>
    </form>
  );
}
