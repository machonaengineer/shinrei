import Link from 'next/link';
import type { Metadata } from 'next';
import { ARTICLES, ARTICLE_CATEGORIES, articlesByCategory } from '@/content/articles';
import { buildMetadata } from '@/lib/seo';
import { formatDate } from '@/lib/utils';

export const metadata: Metadata = buildMetadata({
  title: '怪談・民俗・安全ガイド一覧',
  description: '心霊スポット・怪談・都市伝説・民俗伝承・安全ガイドに関する独自記事の一覧です。',
  path: '/articles',
});

export default function ArticlesIndexPage() {
  return (
    <div className="mx-auto max-w-4xl px-4 py-8 space-y-8">
      <header>
        <h1 className="text-2xl md:text-3xl font-bold text-ink">怪談・民俗・安全ガイド</h1>
        <p className="text-sm text-ink-dim mt-1">
          心霊スポットを取り巻く文化・歴史・科学・安全配慮について、独自に編集した記事です。
        </p>
      </header>

      {ARTICLE_CATEGORIES.map((cat) => {
        const items = articlesByCategory(cat.slug);
        if (items.length === 0) return null;
        return (
          <section key={cat.slug}>
            <h2 className="text-lg font-semibold text-ink mb-3">
              {cat.emoji} {cat.name}
              <span className="ml-2 text-xs text-ink-muted">{items.length}件</span>
            </h2>
            <ul className="grid gap-3 sm:grid-cols-2">
              {items.map((a) => (
                <li key={a.slug}>
                  <Link
                    href={`/articles/${a.slug}`}
                    className="surface-card block p-4 hover:border-accent transition-colors"
                  >
                    <h3 className="text-ink font-medium leading-snug">{a.title}</h3>
                    <p className="mt-1 text-xs text-ink-dim leading-relaxed line-clamp-3">{a.description}</p>
                    <div className="mt-2 flex items-center justify-between text-[11px] text-ink-muted">
                      <span>{formatDate(a.publishedAt)}</span>
                      <span>約{a.readingMinutes}分で読了</span>
                    </div>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        );
      })}

      <aside className="surface-soft p-4 text-sm text-ink-dim">
        本サイトの全記事は運営側で独自に編集したものであり、他サイトの本文の転載はありません。記事への質問・誤りのご指摘は <Link href="/contact" className="text-accent hover:underline">お問い合わせ</Link> よりご連絡ください。
      </aside>
    </div>
  );
}

export const dynamic = 'force-static';
