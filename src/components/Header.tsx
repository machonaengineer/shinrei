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
        <nav className="hidden md:flex items-center gap-4 text-sm text-ink-dim">
          <Link href="/map" className="hover:text-ink">地図</Link>
          <Link href="/ranking" className="hover:text-ink">ランキング</Link>
          <Link href="/world" className="hover:text-ink">世界</Link>
          <Link href="/yokai" className="hover:text-ink">妖怪</Link>
          <Link href="/articles" className="hover:text-ink">記事</Link>
          <Link href="/about" className="hover:text-ink">About</Link>
          <Link href="/en" className="text-ink-muted hover:text-ink border border-bg-border rounded px-2 py-0.5 text-xs">EN</Link>
          <Link
            href="/submit/spot"
            className="ml-1 rounded-md bg-accent text-white px-3 py-1.5 hover:bg-accent-soft text-sm"
          >
            ✍️ 投稿
          </Link>
        </nav>
        <div className="md:hidden flex items-center gap-2">
          <Link href="/map" className="btn-secondary text-sm px-3 py-1.5">地図</Link>
          <Link href="/submit/spot" className="rounded-md bg-accent text-white px-3 py-1.5 text-sm">✍️</Link>
        </div>
      </div>
    </header>
  );
}
