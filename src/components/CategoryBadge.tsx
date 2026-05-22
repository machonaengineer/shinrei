import { CATEGORY_BY_SLUG } from '@/lib/constants';

export function CategoryBadge({ slug }: { slug: string }) {
  const cat = CATEGORY_BY_SLUG[slug];
  if (!cat) {
    return (
      <span className="inline-flex items-center gap-1 rounded-full bg-bg-soft px-2 py-0.5 text-xs text-ink-dim">
        {slug}
      </span>
    );
  }
  return (
    <span
      className="inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-xs"
      style={{ background: `${cat.color}22`, color: '#fff', border: `1px solid ${cat.color}55` }}
    >
      <span aria-hidden>{cat.emoji}</span>
      {cat.name}
    </span>
  );
}
