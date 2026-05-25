# 残タスク用 — Browser Claude プロンプト（migration 0003 適用）

訪問者カウンターを動かすための SQL 1本を適用するだけの最小プロンプトです。
ブラウザ操作可能な Claude に以下をそのまま貼り付けてください。

---

```
あなたはユーザーのブラウザを操作できる Claude です。ユーザーは Supabase にログイン済みです。
心霊マップの訪問者カウンター用テーブルを作成する SQL を1本適用してください。

手順:
1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new を開く
2. 別タブで以下の Raw URL を開き、内容を全文コピー:
   https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/migrations/0003_visit_counter.sql
3. SQL Editor に貼り付けて Run（青いボタン）
4. 「Success. No rows returned」が出ることを確認
5. 確認のため、SQL Editor で次を実行:
   select * from public.visit_counter;
   → id=1, total_count=0 の行が1件返ればOK
6. ブラウザで https://shinrei.vercel.app/ を開き、ヒーロー下に
   「👻 あなたは 1 人目の訪問者です」のような表示が出ることを確認

完了したら、visit_counter テーブルが作成されたか、トップページにカウンターが表示されたかを報告してください。
```

---

## 補足

このSQL は以下を作成します（冪等。何度実行しても安全）:
- `visit_counter` テーブル（singleton 行）
- `increment_visit_count()` 関数（atomic increment）
- RLS ポリシー（公開読取 + admin 全権）
- anon/authenticated への実行権限付与

適用後、`/api/visit` が正常にカウントを返すようになり、トップページのカウンターが作動します。
