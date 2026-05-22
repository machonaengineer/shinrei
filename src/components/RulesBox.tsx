import { POSTING_RULES_ALLOWED, POSTING_RULES_PROHIBITED } from '@/lib/constants';

export function RulesBox() {
  return (
    <details className="surface-soft p-4 text-sm">
      <summary className="cursor-pointer text-ink font-semibold">
        投稿前に必ずお読みください（禁止事項・許可される表現）
      </summary>
      <div className="mt-3 grid gap-4 md:grid-cols-2">
        <div>
          <h4 className="text-accent-red font-semibold mb-1">禁止される投稿</h4>
          <ul className="list-disc pl-5 text-ink-dim space-y-0.5">
            {POSTING_RULES_PROHIBITED.map((r) => (
              <li key={r}>{r}</li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className="text-status-published font-semibold mb-1">許可される表現</h4>
          <ul className="list-disc pl-5 text-ink-dim space-y-0.5">
            {POSTING_RULES_ALLOWED.map((r) => (
              <li key={r}>{r}</li>
            ))}
          </ul>
        </div>
      </div>
      <p className="mt-3 text-xs text-ink-muted">
        投稿は即時公開されません。管理者の承認後に公開されます。
      </p>
    </details>
  );
}
