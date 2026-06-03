# YouTube Data API 連携手順

スポットごとに YouTube の関連動画を自動取得して `spot_videos` に投入するバッチです。
投入結果は `pending_review` で保存され、`/admin/videos` で承認後に公開されます。

## 1. API キー取得（Browser Claude に渡してOK）

```
あなたはユーザーのブラウザを操作できる Claude です。
imai.ryunosuke80@gmail.com で Google Cloud にログイン済み前提です。
YouTube Data API v3 のキーを発行してください。

手順:
1. https://console.cloud.google.com/ を開く
2. 既存プロジェクトを使うか、新規プロジェクトを作成（名前: shinrei-map）
3. 左メニュー「APIs & Services → Library」→ "YouTube Data API v3" を検索 → Enable
4. 左メニュー「APIs & Services → Credentials」→ "Create credentials" → "API key"
5. 発行された API キーをコピー（チャットには出力せず、直接 Vercel に貼る）
6. キーの "Edit API key" → "API restrictions" で "YouTube Data API v3" のみに限定 → Save
7. https://vercel.com/dashboard で shinrei プロジェクト → Settings → Environment Variables
8. 以下を追加（Production + Preview + Development、Sensitive チェック）:
   - YOUTUBE_API_KEY = <貼り付け>
9. Deployments → 最新の "..." → Redeploy

完了したら、API キーが Vercel に設定されたかと、Quota が表示されたか報告してください。
```

## 2. バッチ実行

API キーはサーバー専用なので、ローカルで実行します。

```bash
# .env.local に YOUTUBE_API_KEY を追記したうえで:

# まずは dry run（DB 書き込み無し）で結果プレビュー
npm run import:youtube

# 問題なければ書き込みモード
YT_DRY_RUN=false YT_SPOT_LIMIT=30 npm run import:youtube
```

### コスト管理
- `search.list` は **1 回 100 quota unit**
- デフォルト 1 日上限 **10,000 unit = 100 spot/日** まで
- 全 5,680 spot に行き渡らせる場合は **約 57 日** かかる
- 上限を上げたい場合は Google Cloud で "Quota increase" を申請

### スケジュール
- Vercel Cron や GitHub Actions で 1 日 1 回 自動実行する場合は、別途設定が必要

## 3. 承認

実行後、`/admin/videos?status=pending_review` で `source_type=youtube-data-api` の行をチェックし、承認 / 却下 を行ってください。
