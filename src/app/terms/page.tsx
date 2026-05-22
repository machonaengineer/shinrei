import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: '利用規約',
  description: `${SITE_NAME}の利用規約。`,
  path: '/terms',
});

export default function TermsPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 prose prose-invert text-ink-dim leading-relaxed">
      <h1 className="text-ink text-2xl font-bold">利用規約</h1>
      <p>本利用規約（以下「本規約」）は、{SITE_NAME}（以下「本サービス」）の利用条件を定めるものです。ユーザーは、本規約に同意の上、本サービスをご利用いただくものとします。</p>

      <h2 className="text-ink mt-6 font-semibold">第1条 適用</h2>
      <p>本規約は、ユーザーと本サービス運営者との間の本サービスの利用に関わる一切の関係に適用されます。</p>

      <h2 className="text-ink mt-6 font-semibold">第2条 投稿コンテンツ</h2>
      <ol className="list-decimal pl-5">
        <li>ユーザーが投稿したコンテンツは、管理者の承認後に公開されます。</li>
        <li>個人情報、事件事故の断定表現、私有地や立入禁止区域への侵入を促す表現を含む投稿は禁止します。</li>
        <li>運営者は、本規約に違反する投稿を非公開・削除する権利を有します。</li>
        <li>ユーザーは、投稿コンテンツについて、本サービスの運営、宣伝、改善のために運営者が無償で利用することを許諾するものとします。</li>
      </ol>

      <h2 className="text-ink mt-6 font-semibold">第3条 禁止事項</h2>
      <ul className="list-disc pl-5">
        <li>法令または公序良俗に違反する行為</li>
        <li>犯罪行為に関連する行為</li>
        <li>他者の権利を侵害する行為</li>
        <li>運営を妨害する行為</li>
        <li>不正アクセス・スクレイピング・スパム行為</li>
      </ul>

      <h2 className="text-ink mt-6 font-semibold">第4条 免責事項</h2>
      <p>本サービスに掲載される情報はユーザー投稿に基づくものであり、運営者はその真偽、正確性、安全性、適法性、有用性等について一切の保証をしません。本サービスの利用により生じた損害について、運営者は責任を負いません。</p>

      <h2 className="text-ink mt-6 font-semibold">第5条 規約の変更</h2>
      <p>運営者は、必要と判断した場合には、ユーザーへの個別の通知なく本規約を変更することができます。</p>

      <p className="mt-6 text-xs">最終更新日: {new Date().toISOString().slice(0, 10)}</p>
    </article>
  );
}
