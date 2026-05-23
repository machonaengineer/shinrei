import Link from 'next/link';
import type { Metadata } from 'next';
import { buildMetadata, siteUrl } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: 'よくある質問（FAQ）',
  description: `${SITE_NAME}の使い方、投稿方法、削除依頼、掲載方針などに関するよくある質問への回答です。`,
  path: '/faq',
});

type QA = { q: string; a: React.ReactNode };

const faqs: QA[] = [
  {
    q: 'このサイトは何のためのサイトですか？',
    a: <>地域に伝わる怪談・都市伝説・心霊体験談・民俗伝承を、地図上で探せる<strong>口コミ投稿型の地域文化メディア</strong>です。事件・事故・死亡事実を記録するサイトではありません。詳しくは<Link href="/about" className="text-accent hover:underline">「このサイトについて」</Link>をご覧ください。</>,
  },
  {
    q: '掲載情報は本当に起きたことですか？',
    a: <>掲載情報はユーザー投稿・公開情報に基づく<strong>伝承・体験談・噂</strong>です。真偽は保証していません。怪談・都市伝説として共有することが目的のため、事実確認は行っていません。</>,
  },
  {
    q: '心霊スポットを投稿したいです',
    a: <><Link href="/submit/spot" className="text-accent hover:underline">スポット投稿フォーム</Link>から投稿できます。投稿は即時公開されず、管理者承認後に公開されます。投稿時の禁止事項は<Link href="/editorial-policy" className="text-accent hover:underline">編集ポリシー</Link>をご確認ください。</>,
  },
  {
    q: '体験談・口コミを投稿したいです',
    a: <>各スポットの詳細ページから「体験談を投稿する」ボタンで投稿できます。本文20文字以上で、禁止事項に該当しない内容をお願いします。承認後に公開されます。</>,
  },
  {
    q: '写真を投稿したいです',
    a: <>各スポットの詳細ページから「写真を投稿」ボタンで投稿できます。jpg / png / webp、10MB以下。<strong>顔・車のナンバー・表札・部屋番号などが映る写真は投稿しないでください</strong>。承認後に公開されます。</>,
  },
  {
    q: '関連動画URLを投稿したいです',
    a: <>各スポットの詳細ページの「関連動画URLを投稿する」から、YouTube / TikTok のURLを送信できます。承認後に詳細ページに埋め込み表示されます。</>,
  },
  {
    q: '自分の家や所有地が掲載されています。削除してほしい',
    a: <><Link href="/removal-request" className="text-accent hover:underline">削除依頼フォーム</Link>よりご連絡ください。権利者・関係者からの依頼は最優先で対応します。原則として5営業日以内に対応いたします。</>,
  },
  {
    q: '不適切な投稿を見つけました',
    a: <><Link href="/report" className="text-accent hover:underline">通報フォーム</Link>または各投稿の「この投稿を通報する」ボタンから通報できます。確認次第、運営者が対応します。</>,
  },
  {
    q: '心霊スポットを訪問することを推奨していますか？',
    a: <><strong>推奨していません</strong>。掲載スポットの多くは私有地・立入禁止区域・宗教施設などに該当します。許可のない侵入は犯罪であり、また物理的危険も伴います。詳しくは<Link href="/articles/haunted-spots-legal-safety-guide" className="text-accent hover:underline">訪問時の法的・倫理的注意点</Link>をご覧ください。</>,
  },
  {
    q: '海外スポットは扱っていますか？',
    a: <>はい。<Link href="/world" className="text-accent hover:underline">世界の心霊スポット</Link>セクションから、米国・英国・欧州・アジア各地の有名な伝承スポットを地図で探せます。</>,
  },
  {
    q: '初期データはどこから取得していますか？',
    a: <>運営側が公開情報（民俗誌・著名な伝承名・地名情報・WikipediaなどのCCライセンスソース）から<strong>事実情報のみ</strong>を収集し、独自テンプレートで本文を生成しています。他サイトの本文・口コミ・写真は転載していません。</>,
  },
  {
    q: 'なぜ「事故物件」を扱わないのですか？',
    a: <>本サイトは事件・事故・死亡事実を記録する目的のサイトではありません。事故物件情報は別途、公的な情報源（不動産業者の告知義務制度等）を参照してください。</>,
  },
  {
    q: '広告は表示されますか？',
    a: <>将来的にディスプレイ広告（Google AdSense等）の掲載を予定していますが、ユーザー体験を最優先とし、過度な広告挿入は行いません。</>,
  },
  {
    q: 'アプリ版はありますか？',
    a: <>現時点ではWeb版のみです。スマートフォンのブラウザからご利用いただけます。ホーム画面に追加することで、アプリのように使えます。</>,
  },
];

export default function FaqPage() {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: faqs.map((qa) => ({
      '@type': 'Question',
      name: qa.q,
      acceptedAnswer: {
        '@type': 'Answer',
        text: typeof qa.a === 'string' ? qa.a : qa.q,
      },
    })),
    url: new URL('/faq', siteUrl()).toString(),
  };

  return (
    <div className="mx-auto max-w-3xl px-4 py-10 space-y-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <h1 className="text-2xl font-bold text-ink">よくある質問（FAQ）</h1>
      <p className="text-sm text-ink-dim">サイトのご利用に関するよくある質問への回答をまとめました。</p>

      <div className="space-y-3">
        {faqs.map((qa, i) => (
          <details key={i} className="surface-card p-4 group">
            <summary className="cursor-pointer text-ink font-medium leading-relaxed list-none flex items-start gap-2">
              <span className="text-accent">Q.</span>
              <span>{qa.q}</span>
            </summary>
            <div className="mt-3 pt-3 border-t border-bg-border text-sm text-ink-dim leading-relaxed flex gap-2">
              <span className="text-accent-gold">A.</span>
              <div>{qa.a}</div>
            </div>
          </details>
        ))}
      </div>

      <aside className="surface-soft p-4 text-sm text-ink-dim">
        ここに掲載されていない質問は <Link href="/contact" className="text-accent hover:underline">お問い合わせフォーム</Link> よりご連絡ください。
      </aside>
    </div>
  );
}
