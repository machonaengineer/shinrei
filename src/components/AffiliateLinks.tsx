/**
 * Amazon Associates affiliate links.
 *
 * Renders nothing if NEXT_PUBLIC_AMAZON_ASSOCIATE_TAG is unset, so the
 * site stays clean during AdSense review (no monetization clutter that
 * could trip "site under construction").
 *
 * Books picked here are widely available titles in the民俗・怪談 genre.
 * Add or replace by editing PICKS below.
 */
type Pick = {
  title: string;
  asin: string;
  byline: string;
  blurb: string;
};

const PICKS: Pick[] = [
  {
    title: '遠野物語・山の人生',
    asin: '4003311817',
    byline: '柳田國男',
    blurb: '岩手・遠野に伝わる怪異・神隠し・河童譚を体系的に記録した、近代民俗学の出発点。',
  },
  {
    title: '怪談',
    asin: '4003124111',
    byline: '小泉八雲（ラフカディオ・ハーン）',
    blurb: '雪女・むじな・ろくろ首など、英語圏に日本怪談を紹介した不朽の作品集。',
  },
  {
    title: '画図百鬼夜行全画集',
    asin: '4044072744',
    byline: '鳥山石燕',
    blurb: '江戸期の妖怪絵巻の代表作。妖怪のビジュアル像が現代に至るまで参照される定本。',
  },
];

export function AffiliateLinks({ title = '関連書籍', max = 3 }: { title?: string; max?: number }) {
  const tag = process.env.NEXT_PUBLIC_AMAZON_ASSOCIATE_TAG;
  if (!tag) return null;

  return (
    <aside className="surface-soft p-4 not-prose">
      <h3 className="text-ink font-semibold text-sm mb-3">
        📚 {title}
        <span className="ml-2 text-[10px] text-ink-muted tracking-widest">PR</span>
      </h3>
      <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {PICKS.slice(0, max).map((p) => {
          const href = `https://www.amazon.co.jp/dp/${p.asin}?tag=${encodeURIComponent(tag)}`;
          return (
            <li key={p.asin}>
              <a
                href={href}
                target="_blank"
                rel="sponsored noopener noreferrer"
                className="surface-card hover:border-accent block p-3 text-sm"
              >
                <div className="font-medium text-ink">{p.title}</div>
                <div className="text-xs text-ink-muted mt-0.5">{p.byline}</div>
                <p className="text-xs text-ink-dim mt-1 leading-relaxed">{p.blurb}</p>
                <div className="mt-2 text-[11px] text-accent">Amazon で見る →</div>
              </a>
            </li>
          );
        })}
      </ul>
      <p className="text-[10px] text-ink-muted mt-2">
        ※ Amazon.co.jp および Amazon.co.jp の関連サイトでの購入により、運営者がアフィリエイト報酬を得ることがあります。
      </p>
    </aside>
  );
}
