import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { AdminTable } from '@/components/AdminTable';
import { updateRemovalStatusAction } from '@/app/actions/admin';
import { REPORT_STATUSES, STATUS_LABEL } from '@/lib/constants';
import { formatDateTime, truncate } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminRemovalRequestsPage({
  searchParams,
}: {
  searchParams: { status?: string };
}) {
  const admin = supabaseAdmin();
  let query = admin
    .from('removal_requests')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(200);
  if (searchParams.status && REPORT_STATUSES.includes(searchParams.status as typeof REPORT_STATUSES[number])) {
    query = query.eq('status', searchParams.status);
  }
  const { data } = await query;
  const rows = data ?? [];

  return (
    <div className="space-y-4">
      <header className="flex items-center justify-between">
        <h2 className="text-xl font-bold text-ink">削除依頼管理</h2>
        <div className="flex flex-wrap gap-2 text-xs">
          <FilterLink href="/admin/removal-requests" active={!searchParams.status}>すべて</FilterLink>
          {REPORT_STATUSES.map((s) => (
            <FilterLink key={s} href={`/admin/removal-requests?status=${s}`} active={searchParams.status === s}>
              {STATUS_LABEL[s] ?? s}
            </FilterLink>
          ))}
        </div>
      </header>

      <AdminTable
        rows={rows}
        empty="削除依頼はありません。"
        columns={[
          {
            key: 'url',
            header: '対象URL',
            render: (r) => (
              <a href={r.target_url} target="_blank" rel="noopener noreferrer" className="text-accent break-all hover:underline text-xs">
                {r.target_url}
              </a>
            ),
          },
          { key: 'reason', header: '理由', render: (r) => <span className="text-ink-dim text-xs">{r.reason}</span> },
          { key: 'rights', header: '権利者', render: (r) => <span className="text-ink-dim text-xs">{r.is_rights_holder ? 'はい' : 'いいえ'}</span> },
          {
            key: 'body',
            header: '本文',
            render: (r) => (
              <div className="max-w-[22rem] text-ink-dim text-xs whitespace-pre-wrap">{truncate(r.body, 200)}</div>
            ),
          },
          { key: 'email', header: '連絡先', render: (r) => <span className="text-ink-muted text-xs">{r.email}</span> },
          { key: 'status', header: '状態', render: (r) => <AdminStatusBadge status={r.status} /> },
          { key: 'created', header: '受信', render: (r) => <span className="text-xs text-ink-muted">{formatDateTime(r.created_at)}</span> },
          {
            key: 'actions',
            header: '操作',
            render: (r) => (
              <div className="flex flex-wrap gap-1">
                <StatusForm id={r.id} status="reviewing" label="対応中" disabled={r.status === 'reviewing'} />
                <StatusForm id={r.id} status="resolved" label="解決" variant="primary" disabled={r.status === 'resolved'} />
                <StatusForm id={r.id} status="rejected" label="却下" disabled={r.status === 'rejected'} />
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

function StatusForm({
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
    <form action={updateRemovalStatusAction}>
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
