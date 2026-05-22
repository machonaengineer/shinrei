import { VISIT_WARNING } from '@/lib/constants';

export function WarningBox({ children }: { children?: React.ReactNode }) {
  return (
    <aside className="rounded-xl border border-accent-gold/40 bg-accent-gold/5 p-4 text-sm leading-relaxed">
      <h3 className="text-accent-gold font-semibold mb-2 flex items-center gap-2">
        <span aria-hidden>⚠️</span> 訪問時の注意
      </h3>
      <p className="text-ink-dim">{children ?? VISIT_WARNING}</p>
    </aside>
  );
}
