import type { Metadata } from 'next';
import { SubmitSpotForm } from '@/components/SubmitSpotForm';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: 'スポット投稿',
  description: '心霊スポット、怪談、都市伝説のスポットを投稿できます。投稿は管理者の承認後に公開されます。',
  path: '/submit/spot',
});

export default function SubmitSpotPage() {
  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink">心霊スポットを投稿する</h1>
      <p className="text-sm text-ink-dim mt-1 mb-6">
        投稿内容は管理者の承認後に公開されます。個人情報や事件事故の断定表現は含めないでください。
      </p>
      <SubmitSpotForm />
    </div>
  );
}
