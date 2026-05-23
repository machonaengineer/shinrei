import Link from 'next/link';
import { supabaseAdmin } from '@/lib/supabase';
import { AdminStatusBadge } from '@/components/AdminStatusBadge';
import { AdminTable } from '@/components/AdminTable';
import { deleteVideoAction, updateVideoStatusAction } from '@/app/actions/admin-videos';
import { REVIEW_STATUSES, STATUS_LABEL } from '@/lib/constants';
import { formatDateTime, truncate } from '@/lib/utils';

export const dynamic = 'force-dynamic';

export default async function AdminVideosPage({
  searchParams,
}: {
  searchParams: { status?: string };
}) {
  const admin = supabaseAdmin();
  let query = admin
    .from('spot_videos')
    .select('id, spot_id, platform, video_url, title, status, source_type, created_at, spots(slug, name)')
    .order('created_at', { ascending: false })
    .limit(200);
  if (searchParams.status && REVIEW_STATUSES.includes(searchParams.status as typeof REVIEW_STATUSES[number])) {
    query = query.eq('status', searchParams.status);
  }
  const { data } = await query;

  type Row = {
    id: string;
    spot_id: string;
    platform: string;
    video_url: string;
    title: string | null;
    status: string;
    source_type: string | null;
    created_at: string;
    spots: { slug: string; name: string } | { slug: string; name: string }[] | null;
  };
  const rows = (data ?? []) as unknown as Row[];

  return (
    <div className="space-y-4">
      <header className="flex items-center justify-between">
        <h2 className="text-xl font-bold text-ink">動画管理</h2>
        <div className="flex flex-wrap gap-2 text-xs">
          <FilterLink href="/admin/videos" active={!searchParams.status}>すべて</FilterLink>
          {REVIEW_STATUSES.map((s) => (
            <FilterLink key={s} href={`/admin/videos?status=${s}`} active={searchParams.status === s}>
              {STATUS_LABEL[s] ?? s}
            </FilterLink>
          ))}
        </div>
      </header>

      <AdminTable
        rows={rows}
        empty="動画はありません。"
        columns={[
          {
            key: 'spot',
            header: 'スポット',
            render: (r) => {
              const spot = Array.isArray(r.spots) ? r.spots[0] : r.spots;
              if (!spot) return <span className="text-ink-muted">削除済み</span>;
              return (
                <Link href={`/spots/${spot.slug}`} className="text-ink hover:text-accent">{spot.name}</Link>
              );
            },
          },
          { key: 'platform', header: 'P', render: (r) => <span className="text-xs uppercase text-ink-dim">{r.platform}</span> },
          {
            key: 'video',
            header: '動画',
            render: (r) => (
              <div className="max-w-[24rem]">
                <a href={r.video_url} target="_blank" rel="noopener noreferrer" className="text-accent break-all text-xs hover:underline">{truncate(r.video_url, 80)}</a>
                {r.title && <div className="text-ink-dim text-xs mt-0.5">{truncate(r.title, 80)}</div>}
              </div>
            ),
          },
          { key: 'source', header: '出所', render: (r) => <span className="text-ink-dim text-xs">{r.source_type ?? '-'}</span> },
          { key: 'status', header: 'ステータス', render: (r) => <AdminStatusBadge status={r.status} /> },
          { key: 'created', header: '作成', render: (r) => <span className="text-xs text-ink-muted">{formatDateTime(r.created_at)}</span> },
          {
            key: 'actions',
            header: '操作',
            render: (r) => (
              <div className="flex flex-wrap gap-1">
                <ActionForm id={r.id} status="published" label="承認" variant="primary" disabled={r.status === 'published'} />
                <ActionForm id={r.id} status="rejected" label="却下" disabled={r.status === 'rejected'} />
                <ActionForm id={r.id} status="hidden" label="非公開" disabled={r.status === 'hidden'} />
                <form action={deleteVideoAction}>
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

function ActionForm({
  id, status, label, variant = 'secondary', disabled = false,
}: {
  id: string; status: string; label: string; variant?: 'primary' | 'secondary'; disabled?: boolean;
}) {
  return (
    <form action={updateVideoStatusAction}>
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
