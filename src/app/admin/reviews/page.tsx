import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { AdminTable } from '@/components/AdminTable';
import { deleteReviewAction, updateReviewStatusAction } from '@/app/actions/admin';
import { REVIEW_STATUSES, STATUS_LABEL } from '@/lib/constants';
import { formatDateTime, truncate } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminReviewsPage({
  searchParams,
}: {
  searchParams: { status?: string };
}) {
  const admin = supabaseAdmin();
  let query = admin
    .from('reviews')
    .select('id, spot_id, user_name, body, scary_score, status, created_at, spots(slug, name)')
    .order('created_at', { ascending: false })
    .limit(200);
  if (searchParams.status && REVIEW_STATUSES.includes(searchParams.status as typeof REVIEW_STATUSES[number])) {
    query = query.eq('status', searchParams.status);
  }
  const { data } = await query;
  type Row = {
    id: string;
    spot_id: string;
    user_name: string | null;
    body: string;
    scary_score: number;
    status: string;
    created_at: string;
    spots: { slug: string; name: string } | { slug: string; name: string }[] | null;
  };
  const rows = (data ?? []) as unknown as Row[];

  return (
    <div className="space-y-4">
      <header className="flex items-center justify-between">
        <h2 className="text-xl font-bold text-ink">口コミ管理</h2>
        <div className="flex flex-wrap gap-2 text-xs">
          <FilterLink href="/admin/reviews" active={!searchParams.status}>すべて</FilterLink>
          {REVIEW_STATUSES.map((s) => (
            <FilterLink key={s} href={`/admin/reviews?status=${s}`} active={searchParams.status === s}>
              {STATUS_LABEL[s] ?? s}
            </FilterLink>
          ))}
        </div>
      </header>

      <AdminTable
        rows={rows}
        empty="該当する口コミはありません。"
        columns={[
          {
            key: 'spot',
            header: 'スポット',
            render: (r) => {
              const spot = Array.isArray(r.spots) ? r.spots[0] : r.spots;
              if (!spot) return <span className="text-ink-muted">削除済み</span>;
              return (
                <Link href={`/spots/${spot.slug}`} className="text-ink hover:text-accent">
                  {spot.name}
                </Link>
              );
            },
          },
          { key: 'user', header: '投稿者', render: (r) => <span className="text-ink-dim text-xs">{r.user_name || '匿名'}</span> },
          {
            key: 'body',
            header: '本文',
            render: (r) => (
              <div className="max-w-[28rem] text-ink-dim text-xs whitespace-pre-wrap">{truncate(r.body, 200)}</div>
            ),
          },
          { key: 'score', header: '怖さ', render: (r) => <span className="text-ink-dim">{r.scary_score}</span> },
          { key: 'status', header: 'ステータス', render: (r) => <AdminStatusBadge status={r.status} /> },
          { key: 'created', header: '作成', render: (r) => <span className="text-xs text-ink-muted">{formatDateTime(r.created_at)}</span> },
          {
            key: 'actions',
            header: '操作',
            render: (r) => (
              <div className="flex flex-wrap gap-1">
                <ActionButton id={r.id} status="published" label="承認" variant="primary" disabled={r.status === 'published'} />
                <ActionButton id={r.id} status="rejected" label="却下" disabled={r.status === 'rejected'} />
                <ActionButton id={r.id} status="hidden" label="非公開" disabled={r.status === 'hidden'} />
                <form action={deleteReviewAction}>
                  <input type="hidden" name="id" value={r.id} />
                  <button className="rounded px-2 py-1 text-xs text-accent-red hover:bg-accent-red/10">削除</button>
                </form>
              </div>
            ),
          },
        ]}
      />
    </div>
  );
}

function FilterLink({ href, active, children }: { href: string; active: boolean; children: React.ReactNode }) {
  return (
    <Link
      href={href}
      className={`rounded-full border px-2 py-0.5 ${active ? 'border-accent text-ink' : 'border-bg-border text-ink-dim hover:text-ink'}`}
    >
      {children}
    </Link>
  );
}

function ActionButton({
  id,
  status,
  label,
  variant = 'secondary',
  disabled = false,
}: {
  id: string;
  status: string;
  label: string;
  variant?: 'primary' | 'secondary';
  disabled?: boolean;
}) {
  return (
    <form action={updateReviewStatusAction}>
      <input type="hidden" name="id" value={id} />
      <input type="hidden" name="status" value={status} />
      <button
        disabled={disabled}
        className={`rounded px-2 py-1 text-xs disabled:opacity-30 ${
          variant === 'primary'
            ? 'bg-accent text-white hover:bg-accent-soft'
            : 'border border-bg-border text-ink-dim hover:text-ink hover:border-accent'
        }`}
      >
        {label}
      </button>
    </form>
  );
}
