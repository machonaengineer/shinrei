'use client';

import { useEffect, useState } from 'react';

function formatCount(n: number): string {
  return n.toLocaleString();
}

export function VisitorCounter() {
  const [count, setCount] = useState<number | null>(null);
  const [animating, setAnimating] = useState(false);

  useEffect(() => {
    // Avoid double-count from React strict mode in dev
    const key = 'shinrei-visited-at';
    const last = typeof window !== 'undefined' ? sessionStorage.getItem(key) : null;
    const shouldIncrement = !last;
    sessionStorage.setItem(key, String(Date.now()));

    const url = '/api/visit';
    const fetcher = shouldIncrement
      ? fetch(url, { method: 'POST' })
      : fetch(url, { method: 'GET', cache: 'no-store' });

    fetcher
      .then((r) => r.json())
      .then((data) => {
        if (data?.ok) {
          setCount(Number(data.count) || 0);
          if (shouldIncrement) {
            setAnimating(true);
            setTimeout(() => setAnimating(false), 1800);
          }
        }
      })
      .catch(() => {
        // silently ignore — counter is decorative
      });
  }, []);

  if (count === null) {
    return (
      <div className="inline-flex items-center gap-2 rounded-full border border-bg-border bg-bg-soft px-4 py-2 text-sm text-ink-muted">
        <span aria-hidden>👻</span>
        <span>あなたは <span className="text-ink font-mono">…</span> 人目の訪問者です</span>
      </div>
    );
  }

  return (
    <div
      className={`inline-flex items-center gap-2 rounded-full border px-4 py-2 text-sm transition-all ${
        animating
          ? 'border-accent shadow-glow bg-accent/10 text-ink'
          : 'border-bg-border bg-bg-soft text-ink-dim'
      }`}
      title="累計訪問者数"
    >
      <span aria-hidden className={animating ? 'animate-pulse' : ''}>👻</span>
      <span>
        あなたは{' '}
        <span className="text-accent font-mono font-bold tabular-nums">
          {formatCount(count)}
        </span>{' '}
        人目の訪問者です
      </span>
    </div>
  );
}
