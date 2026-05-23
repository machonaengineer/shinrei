import Link from 'next/link';
import { SITE_NAME } from '@/lib/constants';

export function Header() {
  return (
    <header className="sticky top-0 z-50 border-b border-bg-border bg-bg/80 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
        <Link href="/" className="flex items-center gap-2 font-bold tracking-wide">
          <span className="text-accent text-xl">👻</span>
          <span className="text-ink">{SITE_NAME}</span>
        </Link>
        <nav className="hidden md:flex items-center gap-5 text-sm text-ink-dim">
          <Link href="/map" className="hover:text-ink">地図で探す</Link>
          <Link href="/world" className="hover:text-ink">🌐 世界</Link>
          <Link href="/submit/spot" className="hover:text-ink">スポット投稿</Link>
          <Link href="/report" className="hover:text-ink">通報</Link>
          <Link href="/removal-request" className="hover:text-ink">削除依頼</Link>
        </nav>
        <Link
          href="/map"
          className="md:hidden btn-secondary text-sm px-3 py-1.5"
        >
          地図
        </Link>
      </div>
    </header>
  );
}
