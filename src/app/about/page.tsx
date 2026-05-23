import Link from 'next/link';
import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';
import { SITE_NAME, SITE_TAGLINE } from '@/lib/constants';

export const metadata: Metadata = buildMetadata({
  title: 'このサイトについて',
  description: `${SITE_NAME}の運営方針、サイトの目的、運営者情報、編集体制についてご紹介します。`,
  path: '/about',
});

export default function AboutPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 space-y-8 text-ink-dim leading-relaxed">
      <header>
        <h1 className="text-2xl font-bold text-ink">このサイトについて</h1>
        <p className="mt-1 text-sm">{SITE_TAGLINE}</p>
      </header>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">サービス概要</h2>
        <p>
          {SITE_NAME}は、日本全国および世界各地で語られる心霊スポット・怪談・都市伝説・民俗伝承を、地図上で探せる口コミ投稿型のWebサービスです。
          地域に伝わる物語・体験談を文化資源として共有することを目的としています。
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">本サイトの基本方針</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>本サイトは事件・事故・死亡事実を断定・記録するものではありません</li>
          <li>掲載情報は怪談・伝承・体験談として共有しており、真偽を保証しません</li>
          <li>個人情報・名誉毀損・私有地への侵入助長となる表現は禁止しています</li>
          <li>現地訪問・探索を推奨するものではありません</li>
          <li>すべての投稿は管理者の承認を経て公開されます</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">何ができるか</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>地図上で全国・世界の怪談スポットを探す（<Link href="/map" className="text-accent hover:underline">/map</Link>）</li>
          <li>都道府県別・カテゴリ別・国別に絞り込む</li>
          <li>独自編集の<Link href="/articles" className="text-accent hover:underline">怪談・民俗・安全ガイド記事</Link>を読む</li>
          <li>新しいスポットを<Link href="/submit/spot" className="text-accent hover:underline">投稿</Link>する（承認制）</li>
          <li>体験談・口コミを投稿する（承認制）</li>
          <li>写真・関連動画URLを投稿する（承認制）</li>
          <li>不適切な投稿の<Link href="/report" className="text-accent hover:underline">通報</Link>、<Link href="/removal-request" className="text-accent hover:underline">削除依頼</Link>を送る</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">編集体制と初期データについて</h2>
        <p>
          サービス開始時の初期データは、運営側が公開情報（民俗誌・地名情報・Wikipedia等のCCライセンスソース）から
          <strong>事実情報のみ</strong>を収集し、独自テンプレートで本文を生成しています。他サイトの本文・口コミ・写真は転載していません。
          出典URLは内部管理用に保存し、公開画面には表示していません。
        </p>
        <p className="mt-3">
          編集方針の詳細は <Link href="/editorial-policy" className="text-accent hover:underline">編集ポリシー</Link> をご覧ください。
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">運営者情報</h2>
        <p>
          本サイトは個人運営によるエンタメ・地域文化メディアです。掲載・運営方針に関するご意見、誤情報のご指摘、
          削除依頼、その他のお問い合わせは、以下のフォームよりお願いいたします。
        </p>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li><Link href="/contact" className="text-accent hover:underline">お問い合わせフォーム</Link>（一般のご連絡）</li>
          <li><Link href="/removal-request" className="text-accent hover:underline">削除依頼フォーム</Link>（権利侵害・個人情報等）</li>
          <li><Link href="/report" className="text-accent hover:underline">通報フォーム</Link>（不適切な投稿）</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">技術スタック</h2>
        <p className="text-sm text-ink-muted">
          Next.js（App Router）/ TypeScript / React / Tailwind CSS / Supabase（PostgreSQL + Auth + Storage）/ Leaflet（OpenStreetMap）/ Vercel
        </p>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">関連ページ</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li><Link href="/editorial-policy" className="text-accent hover:underline">編集ポリシー</Link></li>
          <li><Link href="/faq" className="text-accent hover:underline">よくある質問</Link></li>
          <li><Link href="/terms" className="text-accent hover:underline">利用規約</Link></li>
          <li><Link href="/privacy" className="text-accent hover:underline">プライバシーポリシー</Link></li>
          <li><Link href="/disclaimer" className="text-accent hover:underline">免責事項</Link></li>
        </ul>
      </section>
    </article>
  );
}
