# AdSense 再申請準備 — 無料・最小版 Browser Claude プロンプト

完全無料で完結する版です。独自ドメイン取得はスキップし、AdSense 通過に直結する施策だけに絞っています。

## プロンプト本体（全コピーして Browser Claude に貼る）

```
あなたはユーザーのブラウザを操作できる Claude です。
ユーザー (imai.ryunosuke80@gmail.com) は Supabase / Vercel / Google アカウントにログイン済み。
費用はかけたくないので、有料サービス（独自ドメイン購入等）は提案しないでください。

心霊マップの AdSense 不承認（「有用性の低いコンテンツ」）への再申請準備を完了させてください。
所要時間は約 5 分です。

# ステップ 1: Supabase に index_worthy_spots ビュー作成（30秒）

これが本日の最重要作業です。

1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new を開く
2. 別タブで以下 URL を開き、内容を全文コピー:
   https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/adsense_quality_view.sql
3. SQL Editor に貼り付けて「Run」（青ボタン）
4. 最後に表示される index_worthy_count（数値）を記録
   ※ 110〜数百件が期待値。5,000件なら何かが間違っているので報告

# ステップ 2: 動作確認（2 分）

ブラウザで以下を順に開き、結果を OK/NG で報告:

A. 手書きキュレーション（インデックス対象であるべき）:
   https://shinrei.vercel.app/spots/kyu-tsukikage-tunnel
   → ページソースに content="noindex" が ない ことを確認

B. インポート由来でUGCなし（noindex 対象であるべき）:
   https://shinrei.vercel.app/area/tokyo を開く
   → スポット一覧から「○○橋-xxxxxx」のような日本語+ランダム文字列の slug を持つスポットを1つクリック
   → ページソースに <meta name="robots" content="noindex,nofollow" /> があることを確認

C. sitemap が厳選されているか:
   https://shinrei.vercel.app/sitemap.xml
   → <loc> の数を数える。ビュー適用前は約 1,165、適用後はかなり少ない（数百〜千件）

# ステップ 3: Search Console のサイトマップ再送信（1 分）

1. https://search.google.com/search-console を開く
2. shinrei.vercel.app プロパティを選択
3. 左メニュー「サイトマップ」
4. 既存の sitemap.xml の右の「⋮」→ 「削除」
5. 「新しいサイトマップの追加」に sitemap.xml と入力 → 送信
6. ステータスが「成功しました」に変わるのを確認（数分かかる場合あり）

# ステップ 4: 主要 URL のインデックス促進（2 分）

価値のあるページを Google に手動でクロールしてもらいます。

Search Console の上部の URL 検査窓に以下を順に貼って、「インデックス登録をリクエスト」を押す:

1. https://shinrei.vercel.app/
2. https://shinrei.vercel.app/articles
3. https://shinrei.vercel.app/articles/haunted-spots-legal-safety-guide
4. https://shinrei.vercel.app/articles/photographing-old-roads-and-stations
5. https://shinrei.vercel.app/articles/sound-and-fear-acoustic-anomalies
6. https://shinrei.vercel.app/spots/kyu-tsukikage-tunnel
7. https://shinrei.vercel.app/yokai
8. https://shinrei.vercel.app/safety-guidelines

各 URL ごとに「インデックス登録をリクエスト」をクリック。
1 日に登録できる URL 数には上限があるため、エラーが出たらそこで止める。

# ステップ 5: AdSense 再申請はまだ押さない

このステップでは AdSense 画面は触らないでください。
2 週間運用してから再申請する必要があるため、押したら今押しても落ちます。

ユーザーに「2週間後（YYYY-MM-DD）以降に AdSense 画面で再申請を押してください」と日付付きで伝えること。

# 最終報告

完了したら一括で報告:
- index_worthy_count（ステップ1）
- ステップ2 A/B/C の OK/NG
- Search Console のサイトマップ「成功しました」表示の有無
- URL 検査でリクエストできた URL 数
- 再申請日（実行日 + 14 日）

# 注意

- 有料サービス（独自ドメイン、Cloudflare Pro 等）は提案しない
- AdSense の「再申請」ボタンは絶対に押さない
- 各ステップでエラーが出たらスクリーンショット＋エラー文言を残す
```

---

## 補足：2週間の待機中にやれる無料施策

ユーザー（あなた）が手動で時間がある時にやると AdSense 通過確率が上がる作業:

### A. UGC を自分で増やす（30 分）
- 自分が興味あるスポットを 5 件選び、口コミ・写真を投稿
- 投稿は管理者（あなた）で即承認
- UGC が付いたスポットは自動で「index 対象」に昇格 → 検索インデックスされる「価値あるページ」が増える

### B. X (Twitter) で記事をシェア（5 分 × 週1）
- `/admin/snippets` で生成済みの投稿文をコピペするだけ
- 公式 X アカウントが無ければ作成（無料）
- 自然な被リンク・流入が生まれ、AdSense 評価に好影響

### C. はてなブックマーク / Reddit で言及（5 分）
- 自分の記事のうち面白いものを 1〜2 本、はてなブックマークに追加
- Reddit の r/Japan で関連トピックの議論があれば自然に言及

これらは全て無料で、AdSense 再申請時の「実際に運用されているサイト」のシグナルになります。
