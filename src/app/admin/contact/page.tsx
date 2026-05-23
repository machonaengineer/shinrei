import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { AdminTable } from '@/components/AdminTable';
import { updateContactStatusAction } from '@/app/actions/admin-contact';
import { REPORT_STATUSES, STATUS_LABEL } from '@/lib/constants';
import { formatDateTime, truncate } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminContactPage({
  searchParams,
}: {
  searchParams: { status?: string };
}) {
  const admin = supabaseAdmin();
  let query = admin
    .from('contact_messages')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(200);
  if (searchParams.status && REPORT_STATUSES.includes(searchParams.status as typeof REPORT_STATUSES[number])) {
    query = query.eq('status', searchParams.status);
  }
  const { data } = await query;

  return (
    <div className="space-y-4">
      <header className="flex items-center justify-between">
        <h2 className="text-xl font-bold text-ink">お問い合わせ管理</h2>
        <div className="flex flex-wrap gap-2 text-xs">
          <FilterLink href="/admin/contact" active={!searchParams.status}>すべて</FilterLink>
          {REPORT_STATUSES.map((s) => (
            <FilterLink key={s} href={`/admin/contact?status=${s}`} active={searchParams.status === s}>
              {STATUS_LABEL[s] ?? s}
            </FilterLink>
          ))}
        </div>
      </header>

      <AdminTable
        rows={data ?? []}
        empty="お問い合わせはありません。"
        columns={[
          { key: 'name', header: '名前', render: (r) => <span className="text-ink-dim text-xs">{r.name ?? '匿名'}</span> },
          { key: 'email', header: 'メール', render: (r) => <span className="text-ink-dim text-xs break-all">{r.email ?? '-'}</span> },
          { key: 'subject', header: '件名', render: (r) => <span className="text-ink text-xs">{r.subject ?? '-'}</span> },
          {
            key: 'body',
            header: '本文',
            render: (r) => (
              <div className="max-w-[28rem] text-ink-dim text-xs whitespace-pre-wrap">{truncate(r.body, 200)}</div>
            ),
          },
          { key: 'status', header: '状態', render: (r) => <AdminStatusBadge status={r.status} /> },
          { key: 'created', header: '受信', render: (r) => <span className="text-xs text-ink-muted">{formatDateTime(r.created_at)}</span> },
          {
            key: 'actions',
            header: '操作',
            render: (r) => (
              <div className="flex flex-wrap gap-1">
                <ActionForm id={r.id} status="reviewing" label="対応中" disabled={r.status === 'reviewing'} />
                <ActionForm id={r.id} status="resolved" label="解決" variant="primary" disabled={r.status === 'resolved'} />
                <ActionForm id={r.id} status="rejected" label="却下" disabled={r.status === 'rejected'} />
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

function ActionForm({
  id, status, label, variant = 'secondary', disabled = false,
}: {
  id: string; status: string; label: string; variant?: 'primary' | 'secondary'; disabled?: boolean;
}) {
  return (
    <form action={updateContactStatusAction}>
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
