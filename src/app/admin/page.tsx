import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { formatDateTime } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminHome() {
  const admin = supabaseAdmin();

  const [pendingSpots, pendingReviews, openReports, openRemovals, latestSpots] = await Promise.all([
    admin.from('spots').select('id', { count: 'exact', head: true }).eq('status', 'pending_review'),
    admin.from('reviews').select('id', { count: 'exact', head: true }).eq('status', 'pending_review'),
    admin.from('reports').select('id', { count: 'exact', head: true }).eq('status', 'open'),
    admin.from('removal_requests').select('id', { count: 'exact', head: true }).eq('status', 'open'),
    admin
      .from('spots')
      .select('id, slug, name, status, prefecture, category, created_at')
      .order('created_at', { ascending: false })
      .limit(10),
  ]);

  const stats = [
    { label: '承認待ちスポット', value: pendingSpots.count ?? 0, href: '/admin/spots?status=pending_review' },
    { label: '承認待ち口コミ', value: pendingReviews.count ?? 0, href: '/admin/reviews?status=pending_review' },
    { label: '未対応通報', value: openReports.count ?? 0, href: '/admin/reports?status=open' },
    { label: '未対応削除依頼', value: openRemovals.count ?? 0, href: '/admin/removal-requests?status=open' },
  ];

  return (
    <div className="space-y-6">
      <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
        {stats.map((s) => (
          <Link
            key={s.label}
            href={s.href}
            className="surface-card p-4 hover:border-accent"
          >
            <div className="text-xs text-ink-dim">{s.label}</div>
            <div className="text-3xl font-bold text-ink mt-1">{s.value}</div>
          </Link>
        ))}
      </section>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-3">最新の投稿</h2>
        <div className="surface-card overflow-x-auto">
          <table className="min-w-full text-sm">
            <thead className="bg-bg-soft text-ink-dim text-xs uppercase">
              <tr>
                <th className="px-3 py-2 text-left">スポット名</th>
                <th className="px-3 py-2 text-left">都道府県</th>
                <th className="px-3 py-2 text-left">カテゴリ</th>
                <th className="px-3 py-2 text-left">ステータス</th>
                <th className="px-3 py-2 text-left">作成</th>
              </tr>
            </thead>
            <tbody>
              {(latestSpots.data ?? []).map((s) => (
                <tr key={s.id} className="border-t border-bg-border">
                  <td className="px-3 py-2">
                    <Link href={`/admin/spots`} className="hover:text-accent">{s.name}</Link>
                  </td>
                  <td className="px-3 py-2 text-ink-dim">{s.prefecture}</td>
                  <td className="px-3 py-2 text-ink-dim">{s.category}</td>
                  <td className="px-3 py-2"><AdminStatusBadge status={s.status} /></td>
                  <td className="px-3 py-2 text-ink-muted text-xs">{formatDateTime(s.created_at)}</td>
                </tr>
              ))}
              {(latestSpots.data ?? []).length === 0 && (
                <tr><td colSpan={5} className="px-3 py-6 text-center text-ink-dim">投稿はまだありません。</td></tr>
              )}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  );
}
