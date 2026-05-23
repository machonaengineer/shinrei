# ブラウザ Claude 用：心霊マップ拡張デプロイ手順

このファイルは、ブラウザ操作可能な Claude（Claude Computer Use 等）に貼り付けて使うためのプロンプトです。

---

## プロンプト本体（ここから下を全部コピーして貼り付け）

```
あなたはユーザーのブラウザを操作できる Claude です。以下のタスクを完遂してください。
ユーザーは Supabase / Vercel / GitHub / Google Search Console / Google AdSense / Google Analytics にログイン済み、もしくはログインできる状態です。

# 目的
心霊マップ（https://shinrei.vercel.app/）を以下の状態に仕上げる：
1. スポット数の大幅増加（数百件規模）
2. Google Analytics 4 で訪問数を計測できる
3. Google Search Console に登録され、sitemap が送信されている
4. Google AdSense 申請を提出した状態

# 既知の情報
- 本番URL: https://shinrei.vercel.app/
- GitHubリポジトリ: machonaengineer/shinrei
- Production branch: claude/haunted-spots-map-app-bFlGP
- Supabase プロジェクト URL: https://veitlcibjkxtebcmmwml.supabase.co
- Supabase Project Ref: veitlcibjkxtebcmmwml
- 管理者メール: imai.ryunosuke80@gmail.com

# タスク1: 追加スキーマ＆スポットデータ投入（5分）

1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new を開く
2. 以下の URL の SQL を順番に貼り付けて Run する（全て冪等）:

   2-1. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/migrations/0001_world_videos_images.sql
   2-2. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/migrations/0002_contact_messages.sql
   2-3. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/seed_world.sql
   2-4. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/seed_v2.sql
   2-5. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/imported_part1.sql
   2-6. もし supabase/imported_part2.sql 〜 part5.sql が同リポジトリに存在すれば、それぞれを順番に貼り付けて Run する
       （存在チェック: https://github.com/machonaengineer/shinrei/tree/claude/haunted-spots-map-app-bFlGP/supabase）

3. 各 SQL の実行後「Success」が表示されることを確認

4. Supabase **Table Editor → spots** で、行数が 100 件以上になっていることを確認

# タスク2: Storage バケット作成（写真投稿用、2分）

1. Supabase ダッシュボードで **Storage → New bucket** を開く
2. Name: `spot-photos`
3. **Public bucket** を ON
4. Create

# タスク3: Google Analytics 4 セットアップ（5分）

1. https://analytics.google.com にログイン
2. 新規プロパティを作成（既存にこのサイトがなければ）
   - プロパティ名: 心霊マップ
   - レポートのタイムゾーン: 日本
   - 通貨: 日本円
3. 「データストリーム」→「ウェブ」を選択
   - ウェブサイトの URL: https://shinrei.vercel.app
   - ストリーム名: 心霊マップ Web
4. 作成後表示される「測定 ID」（`G-XXXXXXXXXX` 形式）をコピー
5. https://vercel.com/dashboard で shinrei プロジェクトを開き、Settings → Environment Variables
6. 以下を追加（全環境）:
   - Name: `NEXT_PUBLIC_GA_MEASUREMENT_ID`
   - Value: 上記の `G-XXXXXXXXXX`
7. Deployments → 最新デプロイの ... → Redeploy（Use existing Build Cache はオフ）

# タスク4: Google Search Console 登録（5分）

1. https://search.google.com/search-console を開く
2. 「プロパティを追加」→「URL プレフィックス」
3. URL: `https://shinrei.vercel.app/`
4. 「所有権の確認」画面で「HTMLタグ」を選択
5. 表示される `<meta name="google-site-verification" content="XXXXXXXX">` の `XXXXXXXX` 部分（content値）をコピー
6. Vercel の Environment Variables に追加:
   - Name: `NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION`
   - Value: 上記の content 値
7. Vercel で Redeploy
8. デプロイ完了後、Search Console で「確認」をクリック
9. 所有権確認に成功したら、左メニュー「サイトマップ」→「新しいサイトマップの追加」
10. `https://shinrei.vercel.app/sitemap.xml` を入力 → 送信
11. ステータスが「成功しました」になることを確認

# タスク5: Google AdSense 申請（3分）

注：審査には数日〜数週間かかります。申請を提出するところまでが今回の目標です。

1. https://www.google.com/adsense にログイン
2. 「お申し込み」または「ご利用開始」
3. サイト URL: https://shinrei.vercel.app
4. 支払先住所等を入力
5. 「サイトを AdSense にリンクする」画面で表示される `ca-pub-XXXXXXXXXXXXXXXX` 形式の Publisher ID をコピー
6. Vercel の Environment Variables に追加:
   - Name: `NEXT_PUBLIC_ADSENSE_CLIENT_ID`
   - Value: 上記の `ca-pub-XXXXXXXXXXXXXXXX`（ca- プレフィックス含む）
7. Vercel で Redeploy
8. 数分後、https://shinrei.vercel.app/ads.txt にアクセスして、以下のような内容が表示されることを確認:
   `google.com, pub-XXXXXXXXXXXXXXXX, DIRECT, f08c47fec0942fa0`
9. AdSense 画面で「サイトを確認」をクリック
10. 確認完了後、AdSense 申請を提出（自動的に審査に進む）

# タスク6: 動作確認

1. https://shinrei.vercel.app/ を開いて、以下が表示されていることを確認:
   - トップに「人気スポット」が複数件
   - 「最新の口コミ」または何件かの記事カード
   - 「妖怪図鑑」「記事」「世界」リンクがヘッダーに存在

2. https://shinrei.vercel.app/map で地図に多数（100件以上）のピンが表示される

3. https://shinrei.vercel.app/yokai で妖怪図鑑が30件表示される

4. https://shinrei.vercel.app/articles で記事36件が表示される

5. https://shinrei.vercel.app/sitemap.xml が本番URLで始まる URL を多数返す

6. GA4 リアルタイムレポートで自分のアクセスが計測されることを確認

# 報告
完了したら、以下を報告:
- スポット件数（Supabase の spots テーブル）
- GA4 測定IDが設定されたか
- Search Console 所有権確認が完了し、sitemap が送信されたか
- AdSense 申請が提出されたか
- 各画面の動作確認結果

# 注意事項
- service_role キーは絶対にチャットに出力しないこと
- AdSense Publisher ID は公開情報なので問題ないが、念のため秘密扱い
- Vercel 環境変数追加は必ず「All Environments」（Production/Preview/Development）にチェック
- 各ステップでスクリーンショットを残し、要約を報告すること
```

---

## 用途別簡易プロンプト

### A. データだけ投入したい場合

```
ユーザーの代わりに Supabase の SQL Editor を操作してください。
プロジェクト: https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new

以下の各 URL の SQL を順番に貼り付けて Run してください（全て冪等）:
- supabase/migrations/0001_world_videos_images.sql
- supabase/migrations/0002_contact_messages.sql
- supabase/seed_world.sql
- supabase/seed_v2.sql
- supabase/imported_part1.sql 〜 imported_part5.sql（存在するものすべて）

ベースURL: https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/

各実行後「Success」が表示されることを確認、最後に Table Editor で spots の件数を報告してください。
```

### B. GA4 だけセットアップしたい場合

タスク3 のみコピーして渡す。

### C. AdSense だけ申請したい場合

タスク5 のみコピーして渡す。
