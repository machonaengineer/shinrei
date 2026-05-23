import Link from 'next/link';
import type { Metadata } from 'next';
import { ContactForm } from '@/components/ContactForm';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: 'お問い合わせ',
  description: '心霊マップの運営者へのお問い合わせ・ご意見・ご指摘はこちらから。',
  path: '/contact',
});

export default function ContactPage() {
  return (
    <div className="mx-auto max-w-2xl px-4 py-8 space-y-6">
      <h1 className="text-2xl font-bold text-ink">お問い合わせ</h1>
      <p className="text-sm text-ink-dim leading-relaxed">
        本サイトへのご意見・ご質問・記事の誤りのご指摘・取材依頼・その他のお問い合わせを受け付けています。
      </p>

      <div className="surface-soft p-4 text-sm text-ink-dim leading-relaxed">
        <strong className="text-ink">用途別の窓口があります</strong>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li>不適切な投稿の通報 → <Link href="/report" className="text-accent hover:underline">通報フォーム</Link></li>
          <li>掲載コンテンツの削除依頼（権利侵害・個人情報等）→ <Link href="/removal-request" className="text-accent hover:underline">削除依頼フォーム</Link></li>
          <li>その他のご連絡 → このフォーム</li>
        </ul>
      </div>

      <ContactForm />

      <aside className="text-xs text-ink-muted">
        ※ お問い合わせ内容は管理画面に保存され、運営者のみが閲覧します。返信はメールアドレスをいただいた場合のみ可能です。
      </aside>
    </div>
  );
}
