# 心霊マップ（Shinrei Map）

全国の心霊スポット、怪談、都市伝説を地図上で探せる口コミ投稿型のWebサービスです。

> ⚠ 本サービスはユーザー投稿に基づく**心霊・怪談・都市伝説の口コミマップ**であり、事件・事故・死亡事実等を断定する目的ではありません。

## 🚀 すぐに公開する（Go Live）

最短経路で本番公開する手順です。所要 10〜15 分。

### ステップ1：Supabase プロジェクトを作成

1. https://supabase.com にサインアップ → **New Project**
2. プロジェクト名・パスワード・リージョン（例: Tokyo）を入力して作成
3. プロジェクト立ち上げ後、左メニュー **SQL Editor** を開く
4. **[`supabase/setup.sql`](./supabase/setup.sql) の内容を全部コピーして貼り付け → Run**（schema + policies + seed を一括適用。所要 5 秒）
5. **Project Settings → API** から以下をメモ
   - `Project URL`
   - `anon public` キー
   - `service_role` キー（**サーバー限定**）

### ステップ2：Vercel にデプロイ

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fmachonaengineer%2Fshinrei&env=NEXT_PUBLIC_SUPABASE_URL,NEXT_PUBLIC_SUPABASE_ANON_KEY,SUPABASE_SERVICE_ROLE_KEY,NEXT_PUBLIC_SITE_URL,ADMIN_EMAIL,IP_HASH_SALT&envDescription=Supabase%20%E3%81%A8%E3%82%B5%E3%82%A4%E3%83%88%E3%81%AE%E8%A8%AD%E5%AE%9A&envLink=https%3A%2F%2Fgithub.com%2Fmachonaengineer%2Fshinrei%23%E3%82%B9%E3%83%86%E3%83%83%E3%83%972vercel-%E3%81%AB%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4)

または手動で：

1. https://vercel.com にサインアップ → **Add New → Project**
2. このリポジトリを Import
3. **Production Branch** を `claude/haunted-spots-map-app-bFlGP`（または main にマージ後 `main`）に設定
4. **Environment Variables** に下記を設定（後述の `.env.example` 参照）
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `SUPABASE_SERVICE_ROLE_KEY` ← **Sensitive** にチェック
   - `NEXT_PUBLIC_SITE_URL`（例: `https://your-app.vercel.app`）
   - `ADMIN_EMAIL`
   - `IP_HASH_SALT`（任意のランダム文字列）
5. **Deploy**

### ステップ3：管理者アカウントを作成

1. Supabase **Authentication → Users → Add user** で `ADMIN_EMAIL` のユーザーを作成
2. SQL Editor で以下を実行（手動昇格）：
   ```sql
   update public.profiles set role = 'admin' where id = '<UserのUID>';
   ```
3. デプロイ済みサイトの `/login` から ログイン → `/admin` にアクセス可能

### ステップ4：Supabase 認証の URL 設定（推奨）

1. Supabase **Authentication → URL Configuration**
2. **Site URL** に Vercel の本番URLを設定
3. **Redirect URLs** に `https://your-app.vercel.app/**` を追加

これで公開完了です。`/submit/spot` から投稿 → `/admin/spots` で承認 → `/map` に反映の流れを確認してください。

---

---

## 1. サービス概要

- 地図上で心霊スポットを探す（カテゴリ・都道府県・怖さスコアフィルター）
- 都道府県別 / カテゴリ別 SEO ページ
- スポット詳細ページ・口コミ投稿
- 通報フォーム・削除依頼フォーム
- 管理画面（承認・却下・非公開・削除・通報対応）
- ダークテーマ、スマホファースト

## 2. 技術スタック

- Next.js 14（App Router）
- TypeScript
- React 18
- Tailwind CSS
- Supabase (PostgreSQL + Auth + Storage + PostGIS)
- Leaflet + OpenStreetMap（地図タイルは `.env` で差し替え可能）
- Vercel デプロイを前提
- 無料 / 低コスト運用前提

## 3. ディレクトリ構成

```
src/
  app/
    page.tsx               # トップ
    layout.tsx             # ルートレイアウト
    globals.css
    map/                   # 地図ページ
    spots/[slug]/          # スポット詳細 + 口コミ投稿
    submit/spot/           # スポット投稿
    report/                # 通報フォーム
    removal-request/       # 削除依頼フォーム
    area/[prefectureSlug]/ # 都道府県SEOページ
    category/[categorySlug]/  # カテゴリSEOページ
    admin/                 # 管理画面
    login/                 # 管理ログイン
    terms/ privacy/ disclaimer/
    actions/               # Server Actions
    sitemap.ts robots.ts not-found.tsx
  components/              # 共通UI
  lib/                     # supabase / constants / utils / map / seo
  types/                   # 型定義
  middleware.ts            # /admin の認可
supabase/
  schema.sql               # テーブル + 関数 + トリガ
  policies.sql             # RLS
  seed.sql                 # 開発用シード（全て架空データ）
```

## 4. セットアップ手順（ローカル）

### 4.1 依存をインストール

```bash
npm install
```

### 4.2 Supabase プロジェクトを作成

1. https://supabase.com にて新規プロジェクトを作成
2. Project Settings → API から以下を取得
   - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon public` キー → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `service_role` キー → `SUPABASE_SERVICE_ROLE_KEY`（**サーバー専用**。クライアントへ漏らさない）

### 4.3 SQL の適用

Supabase の SQL Editor で、以下を **順番** に実行します。

1. `supabase/schema.sql`
2. `supabase/policies.sql`
3. `supabase/seed.sql`（開発確認用。本番では不要）

> `schema.sql` は `pgcrypto` と `postgis` 拡張を有効化します。Supabase ダッシュボードの Database → Extensions から有効にできない場合は SQL の `create extension` 行がそのまま有効化を行います。

### 4.4 環境変数

```bash
cp .env.example .env.local
```

`.env.local` を編集して値を埋めます。

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...        # サーバー専用
NEXT_PUBLIC_SITE_URL=http://localhost:3000
NEXT_PUBLIC_SITE_NAME=心霊マップ
NEXT_PUBLIC_MAP_TILE_URL=https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png
NEXT_PUBLIC_MAP_ATTRIBUTION=© OpenStreetMap contributors
ADMIN_EMAIL=your-admin@example.com      # 任意。サインアップ時に admin として登録される
IP_HASH_SALT=任意のランダム文字列
```

### 4.5 ローカル起動

```bash
npm run dev
```

http://localhost:3000 を開きます。

## 5. 管理者の作成方法

1. Supabase ダッシュボードの Authentication → Users から、管理者メール（`ADMIN_EMAIL` で指定したアドレス）でユーザーを作成（Invite または Password 設定）
2. ユーザー作成時の `handle_new_user` トリガが `profiles.role = 'admin'` を自動付与します
3. もしくは SQL Editor で：
   ```sql
   update public.profiles set role = 'admin' where id = '<対象UserのUID>';
   ```
4. `/login` から ログイン → `/admin` にリダイレクトされます

> `handle_new_user` トリガで `ADMIN_EMAIL` を読むには Postgres の `app.admin_email` GUC が必要です。Supabase のダッシュボードでは設定が難しいため、上記 3. の SQL での明示昇格を **推奨** します。

## 6. Vercel デプロイ手順

1. GitHub に push したリポジトリを Vercel に Import
2. Environment Variables に `.env.local` と同じ値を設定（`SUPABASE_SERVICE_ROLE_KEY` は **All Environments / Server-only**）
3. `NEXT_PUBLIC_SITE_URL` は本番URL（例：`https://example.com`）
4. Deploy
5. Supabase の Auth Settings → Site URL / Additional Redirect URLs に本番URLを追加

## 7. 地図タイル設定（プロバイダ差し替え）

`NEXT_PUBLIC_MAP_TILE_URL` と `NEXT_PUBLIC_MAP_ATTRIBUTION` を差し替えるだけで切り替え可能です。

- OpenStreetMap（無料・デフォルト）
  - `https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png`
- MapTiler（要APIキー）
  - `https://api.maptiler.com/maps/dark/{z}/{x}/{y}.png?key=YOUR_KEY`
- Mapbox（要トークン）
  - `https://api.mapbox.com/styles/v1/.../tiles/{z}/{x}/{y}?access_token=...`

将来 MapLibre GL に乗り換える場合も `MapView.tsx` の中だけを差し替える設計です。

## 8. 投稿承認フロー

1. ユーザーがスポット・口コミを投稿（`status = pending_review`）
2. 管理画面 `/admin/spots` `/admin/reviews` で確認
3. 「承認」で `status = published` に → 公開
4. 「却下 / 非公開 / 削除」も同じUIから可能
5. レビューが承認・取り消し・削除されると `reviews_stats_trigger` が `spots.review_count` と `scary_score` を自動再計算

## 9. 法務・安全運用上の注意

- 個人情報、事件事故の断定表現、被害者名等は**明示的に禁止**しています
- スポット詳細・トップ・免責ページに**免責文**を常時表示しています
- すべての投稿は `pending_review` で保存し、管理者承認後のみ公開
- RLS により：
  - 一般ユーザーは `published` のみ読み取り可能
  - `pending_review` / `hidden` / `rejected` / `deleted` は管理者のみ閲覧可能
  - `status` 変更は管理者のみ可能（admin 判定関数 + RLS で二重防御）
- `middleware.ts` で `/admin` パスを認可
- アクセスIPはハッシュ化（`IP_HASH_SALT`）して保存し、生IPは保持しない
- 削除依頼は `/removal-request` で常時受付。`/admin/removal-requests` で対応状況を管理
- 通報は `/report` で常時受付

## 10. 投稿フォームのバリデーション

- スポット投稿：名称・都道府県・カテゴリ・緯度経度必須、概要20文字以上、同意必須
- 口コミ投稿：本文20文字以上、怖さスコア1〜5、同意必須
- 通報：理由必須
- 削除依頼：対象URL・理由・本文・メール必須、確認チェック必須

## 11. SEO

- 動的 `metadata` / OGP / canonical
- `sitemap.xml`（`/sitemap.ts`）
- `robots.txt`（`/robots.ts`、`/admin` `/login` `/report` `/removal-request` は disallow）
- スポット詳細に `Place` 構造化データ（aggregateRating含む）
- URL は slug ベース

## 12. 今後の拡張案

- ユーザーアカウント / お気に入り / 訪問チェック / ランキング
- 現在地から近いスポット（PostGIS の `<->` 演算子による距離検索）
- AI による口コミ要約 / 危険表現自動検知
- 画像アップロード時の EXIF 自動削除（Supabase Edge Function / Sharp）
- 画像モデレーション（Google Vision SafeSearch 等）
- YouTube / TikTok 埋め込み
- OGP 画像の自動生成（`opengraph-image.tsx`）
- スポット巡礼ルート作成
- 都道府県別 SEO 記事の自動生成

## 13. 仮定・既知の制約

実装時に置いた合理的な仮定：

- 画像アップロードは初期MVPでは **URL入力** 方式（口コミの画像URL欄）。Supabase Storage への直接アップロードは将来拡張ポイント。
- EXIF 削除は将来実装。フロントでサムネ表示を行う場合は別途実装が必要。
- 管理者判定は `profiles.role = 'admin'` + RLS + middleware の三重チェック。
- `handle_new_user` トリガは GUC が未設定でも例外を投げない設計（`current_setting(..., true)`）。
- Leaflet は CDN（unpkg）からスタイルを読み込み、本体はバンドルされます（`npm i leaflet`）。
- 地図ピンは Leaflet `divIcon` を使い、カテゴリ別の色・絵文字で識別。

## 14. 確認チェックリスト

- [ ] `npm install` が成功する
- [ ] `npm run dev` で http://localhost:3000 が起動する
- [ ] `npm run typecheck` が通る
- [ ] Supabase SQL が3ファイル順に流せる
- [ ] トップに人気スポット・最新口コミが表示される
- [ ] `/map` に地図とピンが表示される
- [ ] `/spots/[slug]` に詳細・免責文が表示される
- [ ] スポット投稿が `pending_review` で保存される
- [ ] 口コミ投稿が `pending_review` で保存される
- [ ] 未承認データが一般画面に出ない
- [ ] `/login` → admin で `/admin` にアクセスできる
- [ ] 通報・削除依頼が受け付けられる
- [ ] スマホ表示が崩れない
