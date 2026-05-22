import type { Metadata } from 'next';
import { RemovalRequestForm } from '@/components/RemovalRequestForm';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: '削除依頼フォーム',
  description: '権利侵害、個人情報、誤情報などの理由による削除依頼を受け付けています。',
  path: '/removal-request',
  noindex: true,
});

export default function RemovalRequestPage() {
  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink mb-2">削除依頼フォーム</h1>
      <p className="text-sm text-ink-dim mb-6">
        ご本人、関係者、権利者、その他正当な理由がある方からの削除依頼を受け付けています。
      </p>
      <RemovalRequestForm />
    </div>
  );
}
