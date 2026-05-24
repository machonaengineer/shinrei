'use client';

import { useState } from 'react';

export function ShareButtons({ title, url }: { title: string; url: string }) {
  const [copied, setCopied] = useState(false);

  const enc = (s: string) => encodeURIComponent(s);
  const xUrl = `https://x.com/intent/tweet?text=${enc(title)}&url=${enc(url)}`;
  const fbUrl = `https://www.facebook.com/sharer/sharer.php?u=${enc(url)}`;
  const lineUrl = `https://line.me/R/share?text=${enc(title + ' ' + url)}`;

  async function copyLink() {
    try {
      await navigator.clipboard.writeText(url);
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    } catch {
      // no-op
    }
  }

  return (
    <div className="flex flex-wrap items-center gap-2 text-xs">
      <a
        href={xUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex items-center gap-1 rounded border border-bg-border bg-bg-card px-2.5 py-1 text-ink-dim hover:text-ink hover:border-accent"
      >
        𝕏 でシェア
      </a>
      <a
        href={fbUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex items-center gap-1 rounded border border-bg-border bg-bg-card px-2.5 py-1 text-ink-dim hover:text-ink hover:border-accent"
      >
        Facebook
      </a>
      <a
        href={lineUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex items-center gap-1 rounded border border-bg-border bg-bg-card px-2.5 py-1 text-ink-dim hover:text-ink hover:border-accent"
      >
        LINE
      </a>
      <button
        type="button"
        onClick={copyLink}
        className="inline-flex items-center gap-1 rounded border border-bg-border bg-bg-card px-2.5 py-1 text-ink-dim hover:text-ink hover:border-accent"
      >
        {copied ? '✓ コピー済' : '🔗 URLコピー'}
      </button>
    </div>
  );
}
