import Link from 'next/link';
import type { Metadata } from 'next';
import { FavoritesClient } from './FavoritesClient';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: 'お気に入り・訪問チェック',
  description: 'お気に入りに登録した心霊スポットと、行きたい/行ったの訪問チェックを管理できます。',
  path: '/favorites',
  noindex: true,
});

export default function FavoritesPage() {
  return (
    <div className="mx-auto max-w-6xl px-4 py-8 space-y-6">
      <header>
        <nav className="text-xs text-ink-muted mb-2">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">お気に入り</span>
        </nav>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">♥ お気に入り・訪問チェック</h1>
        <p className="text-sm text-ink-dim mt-1">
          保存内容はこの端末（ブラウザ）にのみ記録されます。アカウント登録は不要です。
        </p>
      </header>

      <FavoritesClient />
    </div>
  );
}
