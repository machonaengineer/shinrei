import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { YOKAI_LIST, YOKAI_BY_SLUG, YOKAI_CLASSIFICATIONS } from '@/content/yokai';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';

type Params = { slug: string };

export function generateStaticParams() {
  return YOKAI_LIST.map((y) => ({ slug: y.slug }));
}

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const y = YOKAI_BY_SLUG[params.slug];
  if (!y) return buildMetadata({ title: '妖怪が見つかりません', noindex: true });
  return buildMetadata({
    title: `${y.name}（${y.reading}）— 妖怪図鑑`,
    description: `${y.name}（${y.reading}）の姿、伝承、地域分布、文献など。${y.appearance.slice(0, 80)}`,
    path: `/yokai/${y.slug}`,
  });
}

export default function YokaiDetailPage({ params }: { params: Params }) {
  const y = YOKAI_BY_SLUG[params.slug];
  if (!y) notFound();

  const cls = YOKAI_CLASSIFICATIONS.find((c) => c.slug === y.classification);
  const related = (y.related ?? [])
    .map((s) => YOKAI_BY_SLUG[s])
    .filter((x): x is NonNullable<typeof x> => Boolean(x));

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: `${y.name}（${y.reading}）`,
    description: y.appearance,
    url: new URL(`/yokai/${y.slug}`, siteUrl()).toString(),
    publisher: { '@type': 'Organization', name: SITE_NAME },
  };

  return (
    <article className="mx-auto max-w-3xl px-4 py-8 space-y-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <nav className="text-xs text-ink-muted">
        <Link href="/" className="hover:text-ink">ホーム</Link>
        <span className="mx-1">/</span>
        <Link href="/yokai" className="hover:text-ink">妖怪図鑑</Link>
        <span className="mx-1">/</span>
        <span className="text-ink-dim">{y.name}</span>
      </nav>

      <header className="space-y-2 pb-4 border-b border-bg-border">
        {cls && (
          <span className="inline-flex items-center gap-1 rounded-full border border-accent/40 bg-accent/10 px-2 py-0.5 text-xs text-ink-dim">
            {cls.emoji} {cls.name}
          </span>
        )}
        <h1 className="text-3xl font-bold text-ink leading-tight">{y.name}</h1>
        <div className="text-sm text-ink-dim">{y.reading}</div>
        <div className="flex flex-wrap items-center gap-2 text-xs text-ink-muted pt-2">
          <span>📍 {y.region.join(' / ')}</span>
          <span>🕰 {eraLabel(y.era)}</span>
        </div>
      </header>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">姿・特徴</h2>
        <p className="text-ink-dim leading-relaxed">{y.appearance}</p>
      </section>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">伝承・歴史</h2>
        <p className="text-ink-dim leading-relaxed whitespace-pre-wrap">{y.legend}</p>
      </section>

      <section>
        <h2 className="text-lg font-semibold text-ink mb-2">主な文献・出典</h2>
        <ul className="list-disc pl-5 text-ink-dim text-sm space-y-1">
          {y.sources.map((s) => <li key={s}>{s}</li>)}
        </ul>
      </section>

      {related.length > 0 && (
        <section>
          <h2 className="text-lg font-semibold text-ink mb-2">関連する妖怪</h2>
          <ul className="grid gap-2 sm:grid-cols-2">
            {related.map((r) => (
              <li key={r.slug}>
                <Link href={`/yokai/${r.slug}`} className="surface-card block p-3 hover:border-accent">
                  <div className="text-ink">{r.name}</div>
                  <div className="text-xs text-ink-muted">{r.reading}</div>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <DisclaimerBox compact />

      <div className="flex flex-wrap gap-3 text-sm">
        <Link href="/yokai" className="btn-secondary">← 妖怪図鑑へ戻る</Link>
        <Link href="/articles/yokai-encyclopedia-basics" className="btn-secondary">妖怪学入門記事を読む</Link>
      </div>
    </article>
  );
}

function eraLabel(era: string): string {
  switch (era) {
    case 'ancient': return '古代〜奈良時代';
    case 'medieval': return '中世';
    case 'edo': return '江戸時代';
    case 'modern': return '近代';
    case 'contemporary': return '現代';
    default: return era;
  }
}
