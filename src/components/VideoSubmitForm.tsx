'use client';

import { useState, useTransition } from 'react';
import { submitVideoAction, type SubmitVideoResult } from '@/app/actions/submit-video';

export function VideoSubmitForm({ spotSlug }: { spotSlug: string }) {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitVideoResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    fd.set('spotSlug', spotSlug);
    startTransition(async () => {
      const res = await submitVideoAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-4 text-center">
        <h2 className="text-ink font-semibold">動画URLを受け付けました</h2>
        <p className="mt-1 text-ink-dim text-sm">承認後に公開されます。</p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;

  return (
    <form className="space-y-3" onSubmit={onSubmit}>
      <div>
        <label htmlFor="videoUrl" className="label">動画URL（YouTube / TikTok）<span className="required-mark">*</span></label>
        <input id="videoUrl" name="videoUrl" type="url" required className="input" placeholder="https://www.youtube.com/watch?v=..." />
      </div>
      <div>
        <label htmlFor="title" className="label">タイトル（任意）</label>
        <input id="title" name="title" maxLength={120} className="input" />
      </div>
      <div>
        <label htmlFor="submittedBy" className="label">投稿者名（任意）</label>
        <input id="submittedBy" name="submittedBy" maxLength={60} className="input" />
      </div>
      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="agreed" required className="mt-0.5" />
        <span>第三者の権利を侵害しない動画であること、無断侵入で撮影されていないことを確認しました。</span>
      </label>
      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">{err.error}</div>
      )}
      <button type="submit" disabled={pending} className="btn-primary text-sm">
        {pending ? '送信中…' : '関連動画URLを送信'}
      </button>
    </form>
  );
}
