# Phase 4 残作業 — Browser Claude 統合プロンプト

このファイルの「プロンプト本体」をブラウザ操作可能な Claude に貼り付けると、
（A）Supabase Storage バケット作成、（B）AdSense 個別ユニット作成、
（C）YouTube Data API キー発行、（D）Amazon Associates タグ取得、
（E）すべてを Vercel に反映 → 再デプロイ、まで一気にやってくれます。

---

## プロンプト本体

```
あなたはユーザーのブラウザを操作できる Claude です。
ユーザーは以下のサービスに imai.ryunosuke80@gmail.com でログイン済みです:
- GitHub (machonaengineer)
- Vercel
- Supabase (project ref: veitlcibjkxtebcmmwml)
- Google (Cloud / AdSense / Amazon Associates も含む)

心霊マップ Phase 4 の残設定を完了してください。
service_role / API キーは絶対にチャットに表示せず、コピー → Vercel に直接貼ること。

# ステップ A: Supabase Storage バケット（写真投稿に必須・3分）

1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/storage/buckets を開く
2. 既存に `spot-photos` バケットがなければ「New bucket」
   - Name: spot-photos
   - Public bucket: ON
   - File size limit: 10 MB
   - Allowed MIME: image/jpeg, image/png, image/webp
3. Save

# ステップ B: AdSense 個別広告ユニット作成（5分）

AdSense 申請が通っている前提（ca-pub-3426988731032283）。
広告ユニットを作って、それぞれの ID を Vercel の env に貼る。

1. https://www.google.com/adsense/new/u/0/pub-3426988731032283/myads/units を開く
2. 「広告ユニットを追加」→「ディスプレイ広告」で以下 6 個を作成:
   - article (記事中)
   - spot_top (スポット詳細・上部)
   - spot_bottom (スポット詳細・下部)
   - area (都道府県ページ)
   - category (カテゴリページ)
   - ranking (ランキングページ中央)
   - すべて「レスポンシブ」を選択
3. 各ユニットの「広告コード」から `data-ad-slot="XXXX"` の数値だけ取得
4. https://vercel.com/dashboard で shinrei → Settings → Environment Variables
5. 以下を追加（Production / Preview / Development、Sensitive 不要）:
   - NEXT_PUBLIC_ADSENSE_SLOT_ARTICLE      = <article の slot>
   - NEXT_PUBLIC_ADSENSE_SLOT_SPOT_TOP     = <spot_top の slot>
   - NEXT_PUBLIC_ADSENSE_SLOT_SPOT_BOTTOM  = <spot_bottom の slot>
   - NEXT_PUBLIC_ADSENSE_SLOT_AREA         = <area の slot>
   - NEXT_PUBLIC_ADSENSE_SLOT_CATEGORY     = <category の slot>
   - NEXT_PUBLIC_ADSENSE_SLOT_RANKING      = <ranking の slot>

# ステップ C: YouTube Data API v3 キー（3分）

1. https://console.cloud.google.com/ を開く
2. 既存プロジェクト「shinrei-map」を使うか、新規作成（名前: shinrei-map）
3. 左上のプロジェクト選択でそれを選ぶ
4. 左メニュー「APIs & Services → Library」→ "YouTube Data API v3" を検索 → Enable
5. 左メニュー「APIs & Services → Credentials」→ "Create credentials" → "API key"
6. 発行された API キー（チャットに出さない）を Vercel に貼る:
   - 名前 YOUTUBE_API_KEY、Sensitive チェック、全環境
7. キーの "Edit API key" → "API restrictions" で
   "Restrict key" → "YouTube Data API v3" のみ選択 → Save

# ステップ D: Amazon Associates タグ（3分）

ユーザーが Amazon Associates 既に登録済みかどうか確認。未登録なら：
1. https://affiliate.amazon.co.jp/ で申し込み（個人で OK）
2. 既存ストア ID を確認（"my-store-id-22" のような形式、22 は日本サフィックス）

登録済みなら：
1. https://affiliate.amazon.co.jp/home の右上に表示されるアソシエイトID を取得
2. Vercel に追加:
   - NEXT_PUBLIC_AMAZON_ASSOCIATE_TAG = <あなたのID>

# ステップ E: 再デプロイ（1分）

1. https://vercel.com/dashboard で shinrei → Deployments
2. 最新の「...」→ Redeploy
3. "Use existing Build Cache" を OFF にして Redeploy
4. ステータスが Ready になるまで待つ

# ステップ F: 動作確認（3分）

ブラウザで以下を順に開き、結果を報告:

1. https://shinrei.vercel.app/spots/kirigaoka-tenboudai
   - 概要セクションの下に広告枠が表示されているか（AdSense 審査中はサイト所有確認の空枠でも可）
   - 写真ギャラリーのサムネをクリック → 拡大表示 ＋ 矢印キーで前後移動 → ESC で閉じる
   - ♥ お気に入りボタン、行きたい/行ったボタンが動作するか

2. https://shinrei.vercel.app/area/tokyo
   - 投稿 CTA バナーの下に広告枠

3. https://shinrei.vercel.app/category/tunnel
   - 都道府県別件数チップの後に広告枠

4. https://shinrei.vercel.app/ranking
   - 怖さ TOP12 の後に広告枠

5. https://shinrei.vercel.app/articles/haunted-spots-legal-safety-guide
   - 本文の下に広告枠 + 「📚 関連書籍」（Associates 未設定なら出ない）

6. https://shinrei.vercel.app/map?near=1
   - ブラウザの位置情報許可ダイアログが出るか
   - 許可後、現在地中心の地図 + 距離付きスポットリスト

7. https://shinrei.vercel.app/favorites
   - お気に入りに入れたスポットが表示されるか

8. Footer のニュースレター登録欄に test+ts@example.com を入力 → 登録
   - https://shinrei.vercel.app/admin/contact で source=newsletter で保存されているか

# 最終報告

完了したら以下を報告:
- spot-photos バケット作成完了 / 既存だったか
- 作成した AdSense ユニット ID（種別だけ列挙、ID は実値を出さなくてよい）
- YOUTUBE_API_KEY 設定済みか
- AMAZON_ASSOCIATE_TAG 設定済みか / 未登録なら今後の手順
- 再デプロイ Ready のスクショ
- 動作確認 1〜8 の各項目 OK/NG
```

---

## 補足

- 上記をすべて完了すると、サイト側の Phase 4「収益化準備」は全て終了します
- AdSense 審査中の場合、広告ユニットは「ブランク広告」が表示されるか、承認後にライブ広告が入ります
- YouTube バッチ実行はあなたのローカル環境で `npm run import:youtube`（dry-run 推奨）から
