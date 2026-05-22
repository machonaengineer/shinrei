import type { Review } from '@/types/review';
import { ScaryScore } from './ScaryScore';
import { formatDate } from '@/lib/utils';

export function ReviewCard({ review }: { review: Review }) {
  return (
    <article className="surface-card p-4">
      <header className="flex items-center justify-between">
        <div className="text-sm text-ink">
          {review.user_name?.trim() || '匿名'}
          {review.visited_at ? (
            <span className="text-ink-muted ml-2 text-xs">訪問: {review.visited_at}</span>
          ) : null}
        </div>
        <ScaryScore value={review.scary_score} />
      </header>
      <p className="mt-2 whitespace-pre-wrap text-sm leading-relaxed text-ink-dim">
        {review.body}
      </p>
      <footer className="mt-3 flex items-center justify-between text-xs text-ink-muted">
        <span>{formatDate(review.created_at)}</span>
      </footer>
    </article>
  );
}
