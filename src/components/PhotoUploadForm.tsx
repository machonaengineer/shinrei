'use client';

import { useState, useTransition } from 'react';
import { submitPhotoAction, type SubmitPhotoResult } from '@/app/actions/submit-photo';

export function PhotoUploadForm({ spotSlug }: { spotSlug: string }) {
  const [pending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitPhotoResult | null>(null);

  function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    fd.set('spotSlug', spotSlug);
    startTransition(async () => {
      const res = await submitPhotoAction(fd);
      setResult(res);
      if (res.ok) (e.target as HTMLFormElement).reset();
    });
  }

  if (result?.ok) {
    return (
      <div className="surface-card p-6 text-center">
        <h2 className="text-ink font-semibold">
          写真 {result.count} 枚を受け付けました
        </h2>
        <p className="mt-2 text-ink-dim text-sm">管理者の承認後に公開されます。</p>
      </div>
    );
  }
  const err = result && !result.ok ? result : null;

  return (
    <form className="space-y-4" onSubmit={onSubmit}>
      <div className="surface-soft p-3 text-xs text-ink-dim leading-relaxed">
        投稿写真はユーザーから提供されたものであり、内容の真偽や心霊現象の有無を保証するものではありません。
        私有地・立入禁止区域・危険区域への侵入、近隣住民への迷惑行為、無断撮影を推奨するものではありません。
        個人情報・権利侵害・不適切な写真を見つけた場合は通報してください。
        <ul className="list-disc pl-5 mt-2 space-y-0.5">
          <li>顔、車のナンバー、表札、部屋番号などが写らないよう注意してください</li>
          <li>墓石の個人名などが識別可能な写真は投稿しないでください</li>
          <li>投稿はすべて管理者の承認後に公開されます</li>
        </ul>
      </div>

      <div>
        <label htmlFor="photos" className="label">画像ファイル（最大5枚）<span className="required-mark">*</span></label>
        <input
          id="photos"
          name="photos"
          type="file"
          accept="image/jpeg,image/png,image/webp"
          multiple
          required
          className="input file:mr-3 file:rounded file:border-0 file:bg-accent file:text-white file:px-3 file:py-1"
        />
        <p className="mt-1 text-xs text-ink-muted">jpg / png / webp、各 10MB 以下、最大 5 枚</p>
      </div>

      <div>
        <label htmlFor="caption" className="label">キャプション（任意）</label>
        <input id="caption" name="caption" maxLength={200} className="input" placeholder="例：入口付近、夕方撮影" />
      </div>

      <div>
        <label htmlFor="uploadedBy" className="label">投稿者名（任意）</label>
        <input id="uploadedBy" name="uploadedBy" maxLength={60} className="input" placeholder="匿名" />
      </div>

      <label className="flex items-start gap-2 text-sm text-ink-dim">
        <input type="checkbox" name="agreed" required className="mt-0.5" />
        <span>禁止事項を理解し、これに同意します。承認後に公開されます。</span>
      </label>

      {err && (
        <div className="rounded-md border border-accent-red/40 bg-accent-red/10 px-3 py-2 text-sm text-accent-red">
          {err.error}
        </div>
      )}

      <button type="submit" disabled={pending} className="btn-primary w-full md:w-auto">
        {pending ? 'アップロード中…' : '写真を投稿する'}
      </button>
    </form>
  );
}
