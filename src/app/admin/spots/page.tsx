import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { AdminTable } from '@/components/AdminTable';
import { deleteSpotAction, updateSpotStatusAction } from '@/app/actions/admin';
import { SPOT_STATUSES, STATUS_LABEL } from '@/lib/constants';
import { formatDateTime, truncate } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminSpotsPage({
  searchParams,
}: {
  searchParams: { status?: string };
}) {
  const admin = supabaseAdmin();
  let query = admin
    .from('spots')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(200);
  if (searchParams.status && SPOT_STATUSES.includes(searchParams.status as typeof SPOT_STATUSES[number])) {
    query = query.eq('status', searchParams.status);
  }
  const { data: rows } = await query;

  return (
    <div className="space-y-4">
      <header className="flex items-center justify-between">
        <h2 className="text-xl font-bold text-ink">スポット管理</h2>
        <div className="flex flex-wrap gap-2 text-xs">
          <FilterLink href="/admin/spots" active={!searchParams.status}>すべて</FilterLink>
          {SPOT_STATUSES.map((s) => (
            <FilterLink key={s} href={`/admin/spots?status=${s}`} active={searchParams.status === s}>
              {STATUS_LABEL[s] ?? s}
            </FilterLink>
          ))}
        </div>
      </header>

      <AdminTable
        rows={rows ?? []}
        empty="該当するスポットはありません。"
        columns={[
          {
            key: 'name',
            header: 'スポット',
            render: (r) => (
              <div>
                <Link href={`/spots/${r.slug}`} className="text-ink hover:text-accent font-medium">
                  {r.name}
                </Link>
                <div className="text-xs text-ink-muted">/{r.slug}</div>
                <div className="text-xs text-ink-dim mt-1 max-w-[28rem]">{truncate(r.description ?? '', 80)}</div>
              </div>
            ),
          },
          { key: 'pref', header: '都道府県', render: (r) => <span className="text-ink-dim">{r.prefecture}</span> },
          { key: 'cat', header: 'カテゴリ', render: (r) => <span className="text-ink-dim">{r.category}</span> },
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
                <ActionButton id={r.id} status="pending_review" label="再審査" disabled={r.status === 'pending_review'} />
                <form action={deleteSpotAction}>
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
    <form action={updateSpotStatusAction}>
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
