import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { ARTICLES, ARTICLE_BY_SLUG, ARTICLE_CATEGORIES } from '@/content/articles';
import { ArticleRenderer } from '@/components/ArticleRenderer';
import { AdSlot } from '@/components/AdSlot';
import { DisclaimerBox } from '@/components/DisclaimerBox';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';
import { formatDate } from '@/lib/utils';

type Params = { slug: string };

export function generateStaticParams() {
  return ARTICLES.map((a) => ({ slug: a.slug }));
}

export async function generateMetadata({ params }: { params: Params }): Promise<Metadata> {
  const a = ARTICLE_BY_SLUG[params.slug];
  if (!a) return buildMetadata({ title: 'ページが見つかりません', noindex: true });
  return buildMetadata({
    title: a.title,
    description: a.description,
    path: `/articles/${a.slug}`,
  });
}

export default function ArticlePage({ params }: { params: Params }) {
  const a = ARTICLE_BY_SLUG[params.slug];
  if (!a) notFound();

  const cat = ARTICLE_CATEGORIES.find((c) => c.slug === a.category);

  const jsonLd = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'Article',
        headline: a.title,
        description: a.description,
        datePublished: a.publishedAt,
        dateModified: a.updatedAt ?? a.publishedAt,
        url: new URL(`/articles/${a.slug}`, siteUrl()).toString(),
        publisher: { '@type': 'Organization', name: SITE_NAME },
        author: { '@type': 'Organization', name: SITE_NAME },
      },
      {
        '@type': 'BreadcrumbList',
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'ホーム', item: siteUrl() },
          { '@type': 'ListItem', position: 2, name: '記事', item: new URL('/articles', siteUrl()).toString() },
          { '@type': 'ListItem', position: 3, name: a.title, item: new URL(`/articles/${a.slug}`, siteUrl()).toString() },
        ],
      },
    ],
  };

  const related = (a.related ?? [])
    .map((slug) => ARTICLE_BY_SLUG[slug])
    .filter((x): x is NonNullable<typeof x> => Boolean(x));

  return (
    <article className="mx-auto max-w-3xl px-4 py-8 space-y-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <nav className="text-xs text-ink-muted">
        <Link href="/" className="hover:text-ink">ホーム</Link>
        <span className="mx-1">/</span>
        <Link href="/articles" className="hover:text-ink">記事</Link>
        <span className="mx-1">/</span>
        <span className="text-ink-dim">{a.title}</span>
      </nav>

      <header className="space-y-3 pb-4 border-b border-bg-border">
        {cat && (
          <span className="inline-flex items-center gap-1 rounded-full border border-accent/40 bg-accent/10 px-2 py-0.5 text-xs text-ink-dim">
            {cat.emoji} {cat.name}
          </span>
        )}
        <h1 className="text-2xl md:text-3xl font-bold text-ink leading-tight">{a.title}</h1>
        <p className="text-sm text-ink-dim leading-relaxed">{a.lead}</p>
        <div className="flex flex-wrap items-center gap-3 text-xs text-ink-muted">
          <span>公開: {formatDate(a.publishedAt)}</span>
          <span>約{a.readingMinutes}分で読了</span>
          <span>{a.tags.map((t) => `#${t}`).join(' ')}</span>
        </div>
      </header>

      <ArticleRenderer sections={a.sections} />

      <AdSlot slot={process.env.NEXT_PUBLIC_ADSENSE_SLOT_ARTICLE} format="auto" />

      {related.length > 0 && (
        <section className="mt-10">
          <h2 className="text-lg font-semibold text-ink mb-3">関連記事</h2>
          <ul className="grid gap-3 sm:grid-cols-2">
            {related.map((r) => (
              <li key={r.slug}>
                <Link
                  href={`/articles/${r.slug}`}
                  className="surface-card block p-3 hover:border-accent text-sm"
                >
                  <div className="text-ink font-medium leading-snug">{r.title}</div>
                  <div className="text-xs text-ink-dim mt-1 line-clamp-2">{r.description}</div>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <DisclaimerBox compact />

      <div className="flex flex-wrap gap-3 text-sm">
        <Link href="/articles" className="btn-secondary">← 記事一覧へ</Link>
        <Link href="/map" className="btn-secondary">地図で探す</Link>
        <Link href="/contact" className="btn-secondary">記事へのご意見・誤りのご指摘</Link>
      </div>
    </article>
  );
}
