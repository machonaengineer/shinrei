import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';
import { SITE_NAME } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: 'プライバシーポリシー',
  description: `${SITE_NAME}のプライバシーポリシー。`,
  path: '/privacy',
});

export default function PrivacyPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 prose prose-invert text-ink-dim leading-relaxed">
      <h1 className="text-ink text-2xl font-bold">プライバシーポリシー</h1>
      <p>本サービス（{SITE_NAME}）は、ユーザーのプライバシーを尊重し、個人情報の適切な取り扱いに努めます。</p>

      <h2 className="text-ink mt-6 font-semibold">取得する情報</h2>
      <ul className="list-disc pl-5">
        <li>投稿時に任意で入力されたメールアドレス、表示名</li>
        <li>不正利用防止のためのアクセスIPのハッシュ値（個人特定不可）</li>
        <li>Cookie等を用いたアクセス解析情報（将来導入時）</li>
      </ul>

      <h2 className="text-ink mt-6 font-semibold">利用目的</h2>
      <ul className="list-disc pl-5">
        <li>本サービスの提供、運営、改善</li>
        <li>投稿の管理、不正利用の防止</li>
        <li>削除依頼、通報への対応</li>
      </ul>

      <h2 className="text-ink mt-6 font-semibold">アクセス解析ツールについて</h2>
      <p>本サービスは、サービスの利用状況を把握するため、Google Analytics 4 および Vercel Analytics を使用しています。これらのツールはトラフィックデータを Cookie または同等の技術により収集します。収集される情報は IP アドレスを匿名化した状態で扱われ、個人を特定する目的では使用されません。</p>
      <p>Google Analytics の詳細は <a className="text-accent hover:underline" href="https://policies.google.com/technologies/partner-sites" target="_blank" rel="noopener noreferrer">Google のパートナーサイトでのデータ使用</a> をご参照ください。Google Analytics を無効化したい場合は、<a className="text-accent hover:underline" href="https://tools.google.com/dlpage/gaoptout?hl=ja" target="_blank" rel="noopener noreferrer">Google Analytics オプトアウトアドオン</a> をご利用ください。</p>

      <h2 className="text-ink mt-6 font-semibold">第三者配信の広告サービスについて</h2>
      <p>本サービスは、第三者配信の広告サービス（Google AdSense 等）を利用することがあります。広告配信事業者は、ユーザーの興味に応じた広告を表示するため、当サイトや他サイトへのアクセスに関する情報「Cookie」（氏名・住所・メール・電話番号は含まれません）を使用することがあります。</p>
      <p>Google による広告 Cookie の使用については <a className="text-accent hover:underline" href="https://policies.google.com/technologies/ads" target="_blank" rel="noopener noreferrer">広告ポリシー</a> をご参照ください。広告 Cookie を無効化したい場合は、<a className="text-accent hover:underline" href="https://www.google.com/settings/ads" target="_blank" rel="noopener noreferrer">広告設定</a> から設定できます。</p>

      <h2 className="text-ink mt-6 font-semibold">第三者提供</h2>
      <p>法令に基づく場合を除き、ユーザーの同意なく個人情報を第三者に提供することはありません。</p>

      <h2 className="text-ink mt-6 font-semibold">開示・訂正・削除</h2>
      <p>ユーザーは、運営者に対し、自身の個人情報の開示、訂正、削除を請求することができます。請求は削除依頼フォームよりお問い合わせください。</p>

      <h2 className="text-ink mt-6 font-semibold">変更</h2>
      <p>本ポリシーは、必要に応じて変更されることがあります。</p>

      <p className="mt-6 text-xs">最終更新日: {new Date().toISOString().slice(0, 10)}</p>
    </article>
  );
}
