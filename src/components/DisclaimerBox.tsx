import { DISCLAIMER_TEXT } from '@/lib/constants';

export function DisclaimerBox({ compact = false }: { compact?: boolean }) {
  return (
    <aside className="surface-soft p-4 text-sm text-ink-dim leading-relaxed">
      <h3 className="text-ink font-semibold mb-2">掲載内容について</h3>
      <p className={compact ? 'line-clamp-3' : ''}>{DISCLAIMER_TEXT}</p>
    </aside>
  );
}
