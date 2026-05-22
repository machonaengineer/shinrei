import type { Metadata } from 'next';
import { ReportForm } from '@/components/ReportForm';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: '通報フォーム',
  description: '不適切な投稿の通報を受け付けています。',
  path: '/report',
  noindex: true,
});

export default function ReportPage({
  searchParams,
}: {
  searchParams: { targetType?: string; targetId?: string };
}) {
  const targetType =
    searchParams.targetType === 'review' ||
    searchParams.targetType === 'image' ||
    searchParams.targetType === 'other'
      ? searchParams.targetType
      : 'spot';
  return (
    <div className="mx-auto max-w-2xl px-4 py-8">
      <h1 className="text-2xl font-bold text-ink mb-2">通報フォーム</h1>
      <p className="text-sm text-ink-dim mb-6">
        不適切な投稿、個人情報、事件事故の断定表現等を含む投稿を見つけた場合は、こちらから通報してください。
      </p>
      <ReportForm defaultTargetType={targetType} defaultTargetId={searchParams.targetId} />
    </div>
  );
}
