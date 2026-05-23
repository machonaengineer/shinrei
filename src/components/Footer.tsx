import Link from 'next/link';
import { SITE_NAME, SITE_DESCRIPTION } from '@/lib/constants';

export function Footer() {
  return (
    <footer className="mt-12 border-t border-bg-border bg-bg-soft">
      <div className="mx-auto max-w-6xl px-4 py-8 text-sm text-ink-dim">
        <div className="grid gap-6 sm:grid-cols-2 md:grid-cols-4">
          <div className="md:col-span-1">
            <h3 className="text-ink font-semibold mb-2">{SITE_NAME}</h3>
            <p className="leading-relaxed text-xs">{SITE_DESCRIPTION}</p>
          </div>
          <div>
            <h3 className="text-ink font-semibold mb-2">サービス</h3>
            <ul className="space-y-1">
              <li><Link href="/map" className="hover:text-ink">地図で探す</Link></li>
              <li><Link href="/world" className="hover:text-ink">世界の心霊スポット</Link></li>
              <li><Link href="/yokai" className="hover:text-ink">妖怪図鑑</Link></li>
              <li><Link href="/articles" className="hover:text-ink">怪談・民俗ガイド</Link></li>
              <li><Link href="/submit/spot" className="hover:text-ink">スポットを投稿する</Link></li>
              <li><Link href="/report" className="hover:text-ink">投稿を通報する</Link></li>
              <li><Link href="/removal-request" className="hover:text-ink">削除依頼を送る</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-ink font-semibold mb-2">サイト情報</h3>
            <ul className="space-y-1">
              <li><Link href="/about" className="hover:text-ink">このサイトについて</Link></li>
              <li><Link href="/editorial-policy" className="hover:text-ink">編集ポリシー</Link></li>
              <li><Link href="/faq" className="hover:text-ink">よくある質問</Link></li>
              <li><Link href="/contact" className="hover:text-ink">お問い合わせ</Link></li>
            </ul>
          </div>
          <div>
            <h3 className="text-ink font-semibold mb-2">規約・免責</h3>
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
