import Link from 'next/link';

export default function NotFound() {
  return (
    <div className="mx-auto max-w-md px-4 py-20 text-center">
      <div className="text-5xl mb-4">👻</div>
      <h1 className="text-2xl font-bold text-ink mb-2">ページが見つかりません</h1>
      <p className="text-ink-dim mb-6">指定されたページは存在しないか、削除された可能性があります。</p>
      <Link href="/" className="btn-primary">トップへ戻る</Link>
    </div>
  );
}
