import Link from 'next/link';
import { logoutAction } from '@/app/actions/auth';
import { requireAdmin, getCurrentProfile } from '@/lib/supabase';
import { redirect } from 'next/navigation';

export const dynamic = 'force-dynamic';

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const auth = await requireAdmin();
  if (!auth.ok) {
    redirect('/login?error=' + auth.reason);
  }
  const profile = await getCurrentProfile();

  return (
    <div className="mx-auto max-w-6xl px-4 py-6">
      <header className="mb-6 flex items-center justify-between border-b border-bg-border pb-3">
        <div>
          <h1 className="text-lg font-bold text-ink">🛠 管理画面</h1>
          <p className="text-xs text-ink-muted">{profile?.display_name ?? 'admin'} としてログイン中</p>
        </div>
        <form action={logoutAction}>
          <button className="btn-secondary text-sm">ログアウト</button>
        </form>
      </header>
      <nav className="mb-6 flex flex-wrap gap-2 text-sm">
        <AdminNavLink href="/admin">トップ</AdminNavLink>
        <AdminNavLink href="/admin/spots">スポット</AdminNavLink>
        <AdminNavLink href="/admin/reviews">口コミ</AdminNavLink>
        <AdminNavLink href="/admin/photos">写真</AdminNavLink>
        <AdminNavLink href="/admin/videos">動画</AdminNavLink>
        <AdminNavLink href="/admin/reports">通報</AdminNavLink>
        <AdminNavLink href="/admin/removal-requests">削除依頼</AdminNavLink>
        <AdminNavLink href="/admin/contact">お問合せ</AdminNavLink>
        <AdminNavLink href="/admin/snippets">📣 SNSネタ</AdminNavLink>
      </nav>
      {children}
    </div>
  );
}

function AdminNavLink({ href, children }: { href: string; children: React.ReactNode }) {
  return (
    <Link
      href={href}
      className="rounded-md border border-bg-border bg-bg-card px-3 py-1.5 text-ink-dim hover:border-accent hover:text-ink"
    >
      {children}
    </Link>
  );
}
