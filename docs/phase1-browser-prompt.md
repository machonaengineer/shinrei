# フェーズ1：公開ライブ化 — Browser Claude 完全自動化プロンプト

このファイルの **「プロンプト本体」セクション全体** を、ブラウザ操作可能な Claude（Claude Computer Use 等）に貼り付けて使ってください。

---

## プロンプト本体（ここから下を全部コピー）

```
あなたはユーザーのブラウザを操作できる Claude です。
心霊マップ（https://shinrei.vercel.app/）のフェーズ1「公開ライブ化」を完了してください。

ユーザーは以下のサービスにログイン済みです:
- GitHub
- Supabase
- Vercel
- Google アカウント（Analytics / Search Console / AdSense 用）

## 既知の情報
- 本番URL: https://shinrei.vercel.app/
- Production branch: claude/haunted-spots-map-app-bFlGP
- Supabase Project URL: https://veitlcibjkxtebcmmwml.supabase.co
- Supabase Project Ref: veitlcibjkxtebcmmwml
- Admin email: imai.ryunosuke80@gmail.com
- AdSense / GA4 / Search Console 全て同じ Google アカウント（imai.ryunosuke80@gmail.com）で運用

## 全体方針
- service_role key、AdSense secret、admin password などは絶対にチャットに表示しない（コピペで Vercel に直接貼ること）
- 各ステップ完了後、画面のスクリーンショットを残し、結果を 1〜2 行で報告
- 致命的な失敗時のみユーザーに確認、それ以外は判断して進める

# ステップ1: Supabase SQL の適用（10分）

## 1-A. スキーマ + Storage バケット
1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new を開く
2. 別タブで以下を開き、Raw 表示の内容を全文コピー:
   https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/phase1_step_a_setup.sql
3. SQL Editor に貼り付け → Run（青いボタン）
4. 「Success. No rows returned」または成功メッセージを確認

## 1-B. 5574 スポットの一括投入
imported_part1.sql から imported_part15.sql を順番に適用する。
各ファイルにつき以下を繰り返す:
  - 上記 SQL Editor の「+ New query」で新しいクエリタブを開く
  - https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/imported_partN.sql （N=1..15）を開いて全文コピー
  - 貼り付け → Run
  - Success を確認
  - 次の N に進む

15ファイル全部適用したら、Table Editor → spots テーブルで件数が 5000 件超になっていることを確認。

## 1-C. 全件を公開状態へ
1. SQL Editor で新しいクエリを開く
2. https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/phase1_step_c_publish.sql の内容をコピー
3. 貼り付け → Run
4. 結果として表示される published_count が 5000+ になっていることを確認

# ステップ2: Vercel 環境変数（5分）

1. https://vercel.com/dashboard で shinrei プロジェクトを開く
2. Settings → Environment Variables
3. 以下の環境変数を確認。なければ追加（全環境 Production/Preview/Development にチェック）:
   - NEXT_PUBLIC_SUPABASE_URL = https://veitlcibjkxtebcmmwml.supabase.co
   - NEXT_PUBLIC_SUPABASE_ANON_KEY = sb_publishable_B6BeDkPgpWr36dxdeE69Og_7GMcRRB6
   - SUPABASE_SERVICE_ROLE_KEY = (Supabase Settings → API → service_role を Reveal してコピー / Sensitive チェック)
   - NEXT_PUBLIC_SITE_URL = https://shinrei.vercel.app
   - ADMIN_EMAIL = imai.ryunosuke80@gmail.com
   - IP_HASH_SALT = (まだなければ openssl rand -base64 32 相当の任意のランダム文字列 / Sensitive チェック)

4. 設定後、Deployments → 最新のデプロイの ... メニュー → Redeploy（Use existing Build Cache は OFF）
5. デプロイが Ready になることを確認

# ステップ3: 動作確認（3分）

ブラウザで以下を開いて、各画面の状態を報告:

1. https://shinrei.vercel.app/  
   - ヒーロー下の「📍 掲載スポット X件」が 5000+ になっているか
   - 「あなたは X 人目の訪問者です」が表示されているか

2. https://shinrei.vercel.app/map  
   - 地図に大量のピンが表示されているか

3. https://shinrei.vercel.app/area/tokyo  
   - 東京都のスポット一覧に複数件表示されているか

4. https://shinrei.vercel.app/country/usa  
   - アメリカのスポットが複数件表示されているか

5. https://shinrei.vercel.app/sitemap.xml  
   - 1000+ の <loc> エントリがあるか、shinrei.vercel.app で始まるか

# ステップ4: Google Analytics 4 セットアップ（5分）

1. https://analytics.google.com を開く
2. もし shinrei.vercel.app のプロパティがなければ新規作成:
   - 管理 → プロパティを作成
   - プロパティ名: 心霊マップ
   - レポートのタイムゾーン: 日本
   - 通貨: 日本円
3. 「データストリーム」→「ウェブ」を追加
   - URL: https://shinrei.vercel.app
   - ストリーム名: 心霊マップ Web
4. 作成後表示される「測定ID」(G-XXXXXXXXXX) をコピー
5. Vercel に戻り、Environment Variables に追加:
   - NEXT_PUBLIC_GA_MEASUREMENT_ID = G-XXXXXXXXXX
6. Vercel で Redeploy
7. デプロイ後、shinrei.vercel.app を開いて GA4「リアルタイム」レポートでアクセスが計測されることを確認

# ステップ5: Google Search Console 登録（5分）

1. https://search.google.com/search-console を開く
2. 「プロパティを追加」→「URL プレフィックス」
3. URL: https://shinrei.vercel.app/
4. 所有権確認画面で「HTML タグ」を選択
5. 表示される <meta name="google-site-verification" content="XXXXXXXX"> の content 値をコピー
6. Vercel Environment Variables に追加:
   - NEXT_PUBLIC_GOOGLE_SITE_VERIFICATION = XXXXXXXX
7. Vercel で Redeploy
8. デプロイ完了後、Search Console で「確認」ボタンをクリック
9. 所有権確認後、左メニュー「サイトマップ」を開く
10. 新しいサイトマップの追加: sitemap.xml と入力 → 送信
11. ステータスが「成功しました」になることを確認

# ステップ6: Google AdSense 申請（5分）

注: 審査には数日〜数週間かかります。このステップでは申請の提出までを行います。
注: imai.ryunosuke80@gmail.com で AdSense にログインしてください（他アカウントでログイン中の場合は切り替え）。

1. https://www.google.com/adsense を開く
2. imai.ryunosuke80@gmail.com でログイン状態であることを必ず確認（右上のアカウントアイコン）
3. もしまだなら「お申し込み」または「ご利用開始」
4. サイト URL: https://shinrei.vercel.app
5. お支払い先住所等を入力（個人事業主としての本人名義・現住所。後日 PIN コードが郵送される）
6. 「サイトを AdSense にリンクする」画面で表示される Publisher ID（ca-pub-XXXXXXXXXXXXXXXX）をコピー
7. Vercel Environment Variables に追加:
   - NEXT_PUBLIC_ADSENSE_CLIENT_ID = ca-pub-XXXXXXXXXXXXXXXX
8. Vercel で Redeploy
9. デプロイ後、以下を確認:
   - https://shinrei.vercel.app/ads.txt が
     google.com, pub-XXXXXXXXXXXXXXXX, DIRECT, f08c47fec0942fa0
     のような形式で返ること
   - shinrei.vercel.app のページソースに pagead2.googlesyndication.com の script タグが入っていること
10. AdSense 画面に戻り、「サイトを確認」をクリック
11. 確認完了後、AdSense 申請を提出（審査開始）

# ステップ7: 管理者アカウント作成（2分）

1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/auth/users を開く
2. 「Add user」→「Create new user」
3. Email: imai.ryunosuke80@gmail.com
4. Password: ユーザーに「管理者用パスワードを決めてください（8文字以上）」と質問して入力
5. Auto Confirm User にチェック → Create user
6. SQL Editor で以下を実行:
   update public.profiles set role = 'admin'
   where id = (select id from auth.users where email = 'imai.ryunosuke80@gmail.com');
7. 「1 row affected」を確認
8. https://shinrei.vercel.app/login で同じメール+パスワードでログイン → /admin にリダイレクトされ管理画面が見えれば成功

# 最終報告

完了したら、以下を 1 メッセージで報告:
- spots テーブルの行数（Published / Pending それぞれ）
- GA4 測定 ID が Vercel に設定されたか（実値は出さず「設定済み」と書くのみ）
- Search Console の所有権確認が完了し sitemap が「成功」ステータスか
- AdSense 申請が提出されたか
- /admin にログインできたか
- 各画面の動作確認結果（OK/NG）

NG が出た画面はスクリーンショットと エラーメッセージ全文を報告すること。
```

---

## 補足：プロンプト使用上の注意

- Browser Claude が完了したら、`/admin/spots` で投稿の承認状況を確認できます
- AdSense は審査中の数日〜数週間、サイトのコンテンツ充実度・トラフィック・ユーザー体験を見られます
- フェーズ1の完了基準: **全 5500+ スポットが地図に表示 / GA4 が計測中 / sitemap 送信済み / AdSense 申請済み**

## トラブルシュート

| 症状 | 原因 | 対処 |
|---|---|---|
| SQL Editor が「Cannot connect to backend」 | Supabase が一時停止中 | 数分待つ |
| imported_part*.sql が timeout | クエリが大きすぎる | 1ファイルずつ実行する |
| Vercel redeploy が失敗 | 環境変数の typo | Settings → Env で名前を見直す |
| /map にピンが出ない | spots.status = pending_review のまま | phase1_step_c_publish.sql を再実行 |
| /admin が「forbidden」 | profiles.role != 'admin' | ステップ7-6 の SQL を再実行 |
