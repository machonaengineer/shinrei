export function ScaryScore({
  value,
  max = 5,
  size = 'sm',
}: {
  value: number;
  max?: number;
  size?: 'sm' | 'md' | 'lg';
}) {
  const rounded = Math.round((Number(value) || 0) * 10) / 10;
  const filled = Math.round(rounded);
  const sizeClass = size === 'lg' ? 'text-2xl' : size === 'md' ? 'text-lg' : 'text-sm';
  return (
    <span className={`inline-flex items-center gap-1 ${sizeClass}`} aria-label={`怖さスコア ${rounded} / ${max}`}>
      <span className="text-accent-red">
        {'★'.repeat(filled)}
        <span className="text-ink-muted">{'☆'.repeat(Math.max(0, max - filled))}</span>
      </span>
      <span className="text-ink-dim text-xs">{rounded.toFixed(1)}</span>
    </span>
  );
}
