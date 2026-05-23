import type { ArticleSection } from '@/content/articles';

export function ArticleRenderer({ sections }: { sections: ArticleSection[] }) {
  return (
    <div className="prose prose-invert max-w-none">
      {sections.map((s, i) => {
        if (s.type === 'p') {
          return (
            <p key={i} className="text-ink-dim leading-relaxed mb-4">
              {s.text}
            </p>
          );
        }
        if (s.type === 'h2') {
          return (
            <h2 key={i} className="text-xl font-bold text-ink mt-8 mb-3 border-b border-bg-border pb-2">
              {s.text}
            </h2>
          );
        }
        if (s.type === 'h3') {
          return (
            <h3 key={i} className="text-lg font-semibold text-ink mt-6 mb-2">
              {s.text}
            </h3>
          );
        }
        if (s.type === 'ul') {
          return (
            <ul key={i} className="list-disc pl-6 text-ink-dim space-y-1 mb-4">
              {s.items.map((item, j) => (
                <li key={j}>{item}</li>
              ))}
            </ul>
          );
        }
        if (s.type === 'quote') {
          return (
            <blockquote key={i} className="border-l-4 border-accent bg-bg-soft px-4 py-2 my-4 text-ink-dim italic">
              {s.text}
            </blockquote>
          );
        }
        if (s.type === 'note') {
          return (
            <aside key={i} className="rounded-xl border border-accent-gold/40 bg-accent-gold/5 p-4 my-6 text-sm text-ink-dim">
              {s.text}
            </aside>
          );
        }
        return null;
      })}
    </div>
  );
}
