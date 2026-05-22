import Link from 'next/link';
import { SITE_NAME, SITE_DESCRIPTION } from '@/lib/constants';

export function Footer() {
  return (
    <footer className="mt-12 border-t border-bg-border bg-bg-soft">
      <div className="mx-auto max-w-6xl px-4 py-8 text-sm text-ink-dim">
        <div className="grid gap-6 sm:grid-cols-2 md:grid-cols-3">
          <div>
            <h3 className="text-ink font-semibold mb-2">{SITE_NAME}</h3>
            <p className="leading-relaxed">{SITE_DESCRIPTION}</p>
          </div>
          <div>
            <h3 className="text-ink font-semibold mb-2">サービス</h3>
            <ul className="space-y-1">
              <li><Link href="/map" className="hover:text-ink">地図で探す</Link></li>
              <li><Link href="/submit/spot" className="hover:text-ink">スポットを投稿する</Link></li>
              <li><Link href="/report" className="hover:text-ink">投稿を通報する</Link></li>
              <li><Link href="/removal-request" className="hover:text-ink">削除依頼を送る</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-ink font-semibold mb-2">情報</h3>
            <ul className="space-y-1">
              <li><Link href="/disclaimer" className="hover:text-ink">免責事項</Link></li>
              <li><Link href="/terms" className="hover:text-ink">利用規約</Link></li>
              <li><Link href="/privacy" className="hover:text-ink">プライバシーポリシー</Link></li>
            </ul>
          </div>
        </div>
        <div className="mt-8 pt-4 border-t border-bg-border text-xs text-ink-muted">
          © {new Date().getFullYear()} {SITE_NAME}. 掲載情報はユーザー投稿に基づきます。真偽を保証するものではありません。
        </div>
      </div>
    </footer>
  );
}
