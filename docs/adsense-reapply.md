# AdSense 再申請プラン（「有用性の低いコンテンツ」対策）

## 不承認の原因（確定）

> 有用性の低いコンテンツ / コンテンツの最小要件

ほぼ確実に **5,500 件の自動生成スポットページが「同じテンプレ本文・地名違いだけ」= scaled/thin content** と判定されたため。

## 対策の全体像

| # | 対策 | 状態 |
|---|---|---|
| 1 | 薄いインポートページを `noindex` 化（地図には残す） | ✅ コード実装済（要 DB ビュー作成 + 再デプロイ） |
| 2 | sitemap を「価値あるページ」だけに | ✅ 実装済 |
| 3 | 独自記事を 44 → 50 本に増量 | ✅ 実装済 |
| 4 | 独自ドメイン取得（強く推奨） | ⬜ 未 |
| 5 | 2 週間寝かせてから再申請 | ⬜ 期間待ち |

---

## あなたがやること

### A. DB ビューを作成（5分）

Supabase SQL Editor で以下を実行：
```
supabase/adsense_quality_view.sql
```
→ `index_worthy_spots` ビューが作られ、最後に「価値あるページ件数」が表示されます。
（だいたい 110〜数百件になるはず。UGC が付くほど増えます）

URL: https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/adsense_quality_view.sql

### B. 再デプロイ
Vercel が push で自動再デプロイ済みのはず。されていなければ手動 Redeploy。

### C.（強く推奨）独自ドメイン取得
`*.vercel.app` は AdSense・SEO で不利。`shinreimap.jp` 等を取得して接続。
- 取得: Cloudflare Registrar / お名前.com（年 1,000〜4,000 円）
- Vercel → Settings → Domains → Add
- `NEXT_PUBLIC_SITE_URL` を新ドメインに更新 → Redeploy
- Search Console に新プロパティ追加 + sitemap 再送信

### D. 2 週間運用してから再申請
- この間に Google にインデックスし直してもらう
- できれば自分でいくつかスポットに口コミ・写真を付けて「UGC のあるページ」を増やす
- X で記事をシェアして自然な被リンク・流入を作る

### E. 再申請
AdSense 管理画面 → サイト → `shinrei.vercel.app`（or 新ドメイン）→「審査をリクエスト」

---

## 確認方法

再デプロイ後、薄いページが noindex になっているか：

```bash
# UGC のない import スポット（noindex のはず）
curl -s https://shinrei.vercel.app/spots/<薄いスポットのslug> | grep -o '<meta name="robots"[^>]*>'
# => content="noindex,nofollow" が出れば成功

# 手書きキュレーション（index のはず）
curl -s https://shinrei.vercel.app/spots/kyu-tsukikage-tunnel | grep -o '<meta name="robots"[^>]*>'
# => robots meta が無い（=index 許可）か content="index" なら成功

# sitemap が価値あるページだけになっているか
curl -s https://shinrei.vercel.app/sitemap.xml
```

---

## 補足：なぜ「削除」ではなく「noindex」なのか

5,500 スポットを消すと地図がスカスカになり、サービスの魅力（=全国網羅）が失われます。
そこで：
- **ユーザー向け**：地図・一覧・個別ページは全部残す（UX 維持）
- **検索エンジン向け**：薄いページは noindex でインデックスさせない（AdSense/SEO 対策）

という二面作戦を取っています。UGC（口コミ・写真・動画）が付いたページは自動的に index 対象へ「昇格」します。これがユーザー投稿を促す動機づけにもなります。
