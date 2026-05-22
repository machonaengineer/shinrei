import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';
import { DISCLAIMER_TEXT, VISIT_WARNING, SITE_NAME, POSTING_RULES_PROHIBITED, POSTING_RULES_ALLOWED } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: '免責事項',
  description: `${SITE_NAME}の免責事項。掲載内容はユーザー投稿に基づく体験談であり、真偽を保証するものではありません。`,
  path: '/disclaimer',
});

export default function DisclaimerPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 space-y-6 text-ink-dim leading-relaxed">
      <h1 className="text-ink text-2xl font-bold">免責事項</h1>

      <section className="surface-soft p-4">
        <h2 className="text-ink font-semibold mb-2">本サイトについて</h2>
        <p>{DISCLAIMER_TEXT}</p>
      </section>

      <section className="rounded-xl border border-accent-gold/40 bg-accent-gold/5 p-4">
        <h2 className="text-accent-gold font-semibold mb-2">訪問時の注意</h2>
        <p>{VISIT_WARNING}</p>
      </section>

      <section>
        <h2 className="text-ink font-semibold mb-2">禁止される投稿</h2>
        <ul className="list-disc pl-5">
          {POSTING_RULES_PROHIBITED.map((r) => (
            <li key={r}>{r}</li>
          ))}
        </ul>
      </section>

      <section>
        <h2 className="text-ink font-semibold mb-2">許可される表現</h2>
        <ul className="list-disc pl-5">
          {POSTING_RULES_ALLOWED.map((r) => (
            <li key={r}>{r}</li>
          ))}
        </ul>
      </section>
    </article>
  );
}
