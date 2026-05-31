import Link from 'next/link';
import type { Metadata } from 'next';
import { buildMetadata } from '@/lib/seo';

export const metadata: Metadata = buildMetadata({
  title: '安全に楽しむためのガイドライン',
  description:
    '心霊マップの利用にあたって、無断侵入や近隣迷惑を避け、安全・合法に楽しむためのガイドラインです。',
  path: '/safety-guidelines',
});

export default function SafetyGuidelinesPage() {
  return (
    <article className="mx-auto max-w-3xl px-4 py-10 space-y-8 text-ink-dim leading-relaxed">
      <header>
        <nav className="text-xs text-ink-muted mb-2">
          <Link href="/" className="hover:text-ink">ホーム</Link>
          <span className="mx-1">/</span>
          <span className="text-ink-dim">安全に楽しむためのガイドライン</span>
        </nav>
        <h1 className="text-2xl font-bold text-ink">安全に楽しむためのガイドライン</h1>
        <p className="text-sm mt-1">
          心霊マップは噂・怪談・都市伝説を地図で楽しむ情報サイトです。現地への訪問を推奨するものではありません。
          訪問を検討される場合は、必ず以下のガイドラインをお守りください。
        </p>
      </header>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">必ず守ること</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li><strong className="text-ink">無断侵入は絶対にしない</strong>。住居・廃墟・工場跡など、見た目が放棄されていても所有者が存在します。住居侵入罪（刑法130条、3年以下の懲役または10万円以下の罰金）にあたります。</li>
          <li><strong className="text-ink">立入禁止区域には入らない</strong>。フェンス、ロープ、看板、警告で示された区域への侵入は犯罪です。</li>
          <li><strong className="text-ink">近隣住民に迷惑をかけない</strong>。深夜の騒音、車のアイドリング、大声、ライトの照射などは生活妨害です。</li>
          <li><strong className="text-ink">深夜の騒音を出さない</strong>。住宅街での深夜帯のグループ行動は、騒音条例違反となる可能性があります。</li>
          <li><strong className="text-ink">危険な場所へ行かない</strong>。崖、廃墟、トンネル、廃線、ダム、川岸は転落・崩落・水難リスクが極めて高いです。</li>
          <li><strong className="text-ink">未成年だけで行かない</strong>。事故・事件のリスクが極端に高まります。</li>
          <li><strong className="text-ink">投稿で事件事故を断定しない</strong>。「ここで人が死んだ」「殺人事件があった」などの未確認断定は名誉毀損になります。</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">投稿について</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>すべての投稿は<strong className="text-ink">管理者の承認後に公開</strong>されます。</li>
          <li>個人情報、被害者名、所有者名、現住物件番号などは投稿できません。</li>
          <li>事件・事故・自殺・殺人などの断定表現は掲載できません。「噂がある」「目撃談がある」「都市伝説として語られる」など、伝聞・体験談として記載してください。</li>
          <li>無断侵入で撮影した写真は投稿できません。</li>
          <li>差別的表現、脅迫、嫌がらせは禁止です。</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">削除依頼・通報の窓口</h2>
        <p>
          掲載内容に権利侵害、個人情報、誤情報、現住物件への迷惑となる記載がある場合は、以下の窓口からご連絡ください。
          原則として5営業日以内に対応します。
        </p>
        <ul className="list-disc pl-5 mt-2 space-y-1">
          <li><Link href="/removal-request" className="text-accent hover:underline">削除依頼フォーム</Link> — 権利者・関係者の方</li>
          <li><Link href="/report" className="text-accent hover:underline">通報フォーム</Link> — 不適切な投稿の通報</li>
          <li><Link href="/contact" className="text-accent hover:underline">お問い合わせ</Link> — その他の連絡</li>
        </ul>
      </section>

      <section>
        <h2 className="text-ink text-lg font-semibold mb-2">関連ページ</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li><Link href="/editorial-policy" className="text-accent hover:underline">編集ポリシー</Link></li>
          <li><Link href="/disclaimer" className="text-accent hover:underline">免責事項</Link></li>
          <li><Link href="/terms" className="text-accent hover:underline">利用規約</Link></li>
          <li><Link href="/privacy" className="text-accent hover:underline">プライバシーポリシー</Link></li>
          <li><Link href="/articles/haunted-spots-legal-safety-guide" className="text-accent hover:underline">訪問時の法的・倫理的注意点（記事）</Link></li>
        </ul>
      </section>

      <p className="text-xs text-ink-muted">最終更新日: {new Date().toISOString().slice(0, 10)}</p>
    </article>
  );
}
