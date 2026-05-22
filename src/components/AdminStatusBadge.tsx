import { STATUS_LABEL } from '@/lib/constants';

export function AdminStatusBadge({ status }: { status: string }) {
  const styles: Record<string, string> = {
    published: 'bg-status-published/15 text-status-published border-status-published/40',
    pending_review: 'bg-status-pending/15 text-status-pending border-status-pending/40',
    rejected: 'bg-status-rejected/15 text-status-rejected border-status-rejected/40',
    hidden: 'bg-status-hidden/15 text-ink-dim border-status-hidden/40',
    draft: 'bg-status-draft/15 text-ink-dim border-status-draft/40',
    deleted: 'bg-status-rejected/15 text-status-rejected border-status-rejected/40',
    open: 'bg-status-pending/15 text-status-pending border-status-pending/40',
    reviewing: 'bg-accent/15 text-accent border-accent/40',
    resolved: 'bg-status-published/15 text-status-published border-status-published/40',
  };
  const cls = styles[status] ?? 'bg-bg-soft text-ink-dim border-bg-border';
  return (
    <span className={`inline-flex items-center rounded-full border px-2 py-0.5 text-xs ${cls}`}>
      {STATUS_LABEL[status] ?? status}
    </span>
  );
}
