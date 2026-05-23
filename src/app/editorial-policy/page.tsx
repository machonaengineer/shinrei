import Link from 'next/link';
import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';
import { POSTING_RULES_ALLOWED, POSTING_RULES_PROHIBITED, SITE_NAME } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: '編集ポリシー',
  description: `${SITE_NAME}の編集方針・モデレーション基準・コンテンツ作成プロセスについて明示します。`,
  path: '/editorial-policy',
});

export default function EditorialPolicyPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 space-y-8 text-ink-dim leading-relaxed">
      <header>
        <h1 className="text-2xl font-bold text-ink">編集ポリシー</h1>
        <p className="mt-1 text-sm">本サイトの編集方針とモデレーション基準を明示します。</p>
      </header>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">1. サイトの目的</h2>
        <p>{SITE_NAME}は、地域に伝わる怪談・都市伝説・心霊体験談・民俗伝承を、地図上で共有することで地域文化資源として可視化する目的のサービスです。</p>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li><strong className="text-ink">本サイトが扱うもの</strong>：噂・伝承・体験談・都市伝説・民俗・娯楽コンテンツ</li>
          <li><strong className="text-ink">本サイトが扱わないもの</strong>：事件・事故・死亡事実の記録、個人情報、犯罪報道</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">2. コンテンツ作成プロセス</h2>
        <h3 className="text-ink font-medium mt-3">2.1 初期データ</h3>
        <p>サービス開始時に運営側が投入した初期スポットデータは、以下の方針で作成しています：</p>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li>公開情報（民俗誌・著名な伝承名・地名情報・Wikipedia等のCCライセンスソース）から<strong>事実情報のみ</strong>を収集</li>
          <li>収集対象は：スポット名・国・地域・カテゴリ・緯度経度・関連動画URL</li>
          <li>本文・口コミ・写真は他サイトから一切取り込まない</li>
          <li>公開用説明文は<strong>独自テンプレート</strong>で生成し、断定表現を避ける</li>
          <li>出典URLは内部管理用に保存し、公開画面には表示しない</li>
        </ul>

        <h3 className="text-ink font-medium mt-4">2.2 独自記事</h3>
        <p>本サイトの「記事」セクション（<Link href="/articles" className="text-accent hover:underline">/articles</Link>）は、すべて運営者による独自編集です。他サイトの本文転載・無断引用はありません。</p>

        <h3 className="text-ink font-medium mt-4">2.3 ユーザー投稿</h3>
        <p>ユーザーからの投稿（スポット・口コミ・写真・動画URL）はすべて即時公開せず、管理者の承認後に公開します。承認には数日かかる場合があります。</p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">3. 表現方針</h2>
        <h3 className="text-ink font-medium mt-3">使う表現</h3>
        <ul className="list-disc pl-5 space-y-1">
          {POSTING_RULES_ALLOWED.map((r) => <li key={r}>{r}</li>)}
        </ul>
        <h3 className="text-ink font-medium mt-4">禁止する表現</h3>
        <ul className="list-disc pl-5 space-y-1">
          {POSTING_RULES_PROHIBITED.map((r) => <li key={r}>{r}</li>)}
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">4. モデレーション基準</h2>
        <p>以下に該当する投稿は却下・非公開とします。</p>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li>個人情報を含む投稿</li>
          <li>事件・事故・死亡事実を断定する投稿</li>
          <li>第三者の名誉を傷つける投稿</li>
          <li>差別的・脅迫的・嫌がらせとなる投稿</li>
          <li>明らかな虚偽情報</li>
          <li>商業宣伝・スパム</li>
          <li>無断侵入で撮影された写真・動画</li>
          <li>権利侵害となる転載コンテンツ</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">5. 削除依頼への対応</h2>
        <p>掲載済みコンテンツについて、権利侵害・個人情報・誤情報を見つけた場合は、<Link href="/removal-request" className="text-accent hover:underline">削除依頼フォーム</Link>よりご連絡ください。運営者が確認次第、原則として5営業日以内に対応します。</p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">6. 訪問・探索の非推奨</h2>
        <p>本サイトは現地への訪問・探索を推奨するものではありません。私有地・立入禁止区域・危険区域への侵入は法的責任を伴うとともに、生命の危険が伴います。掲載情報は娯楽・地域文化資源としての参照のみを目的としてください。</p>
      </section>

      <p className="text-xs text-ink-muted">最終更新日: {new Date().toISOString().slice(0, 10)}</p>
    </article>
  );
}
