# AdSense 再申請準備 — Browser Claude 用統合プロンプト

ブラウザ操作可能な Claude（Computer Use / claude.ai のエージェント）に下記「プロンプト本体」を全部コピペしてください。

---

## プロンプト本体

```
あなたはユーザーのブラウザを操作できる Claude です。
ユーザー (imai.ryunosuke80@gmail.com) は以下にログイン済み:
- GitHub (machonaengineer)
- Vercel
- Supabase (project ref: veitlcibjkxtebcmmwml)
- Google アカウント (Search Console / AdSense)
- お名前.com or Cloudflare Registrar（ドメイン購入用）

心霊マップの AdSense 不承認（「有用性の低いコンテンツ」）への再申請準備を完了させてください。
以下のステップを順番に実行し、各ステップ完了後に短く報告してください。

# ステップ 1: Supabase に index_worthy_spots ビュー作成（3分）

1. https://supabase.com/dashboard/project/veitlcibjkxtebcmmwml/sql/new を開く
2. 別タブで以下を開き、内容を全文コピー:
   https://raw.githubusercontent.com/machonaengineer/shinrei/claude/haunted-spots-map-app-bFlGP/supabase/adsense_quality_view.sql
3. SQL Editor に貼り付けて「Run」
4. 「Success」と最後に表示される件数 (index_worthy_count) を控えて報告
   ※ 期待値は 110〜数百件。5,000件なら何かが間違っている

# ステップ 2: noindex 動作確認（3分）

ブラウザで以下を順に開き、ページソース内の <meta name="robots"> を確認:

A. 手書きキュレーション（index されるべき）:
   https://shinrei.vercel.app/spots/kyu-tsukikage-tunnel
   → 「View Page Source」で 'noindex' という文字列がないことを確認

B. インポート由来でUGC無し（noindex されるべき）:
   https://shinrei.vercel.app/area/tokyo を開く
   → スポット一覧の中から「○○橋-xxxxxx」のような日本語slug+ランダム文字列のスポットを1つクリック
   → ページソースに content="noindex,nofollow" があるか確認

C. sitemap が厳選されているか:
   https://shinrei.vercel.app/sitemap.xml
   → 含まれる <loc> の総数を確認（インポート前は1,165、ビュー適用後は数百〜千件程度に減るはず）

各 A/B/C の結果を OK/NG で報告。

# ステップ 3: 独自ドメイン取得（10〜15分）

AdSense 通過率を大きく上げるため独自ドメインを取得します。

## 3-A. 空きドメインを確認

以下の候補を順番に Cloudflare Registrar (https://dash.cloudflare.com/registrar)
または お名前.com (https://www.onamae.com/) で検索:

第1候補: shinreimap.jp  (年間 約3,000円)
第2候補: shinrei-map.com (年間 約1,500円)
第3候補: shinrei.app (年間 約2,500円)
第4候補: shinreimap.com (年間 約1,500円)
第5候補: shinrei-map.jp (年間 約3,000円)

第1候補から順に空きを確認。空いていれば即「カートに入れる」→「購入」。
Cloudflare Registrar が原価販売で最安。お名前.com の方が UI が日本語で慣れている人向け。

## 3-B. ユーザーに確認

価格・登録者情報入力前に、ユーザーに「この候補で取得していいですか？年間XXX円です」と確認すること。

## 3-C. 登録者情報の入力
- 名前: imai.ryunosuke80@gmail.com の本名（ユーザーに聞く）
- 住所: 本人の現住所（ユーザーに聞く）
- 電話番号: ユーザーに聞く
- Whois 代行サービス（プライバシー保護）はオン推奨

決済はユーザーに任せる（カード情報を勝手に入力しない）。

# ステップ 4: Vercel にドメイン接続（5分）

1. https://vercel.com/dashboard で shinrei プロジェクトを開く
2. Settings → Domains → Add domain
3. 取得したドメイン名（例: shinreimap.jp）を入力
4. 「Add」をクリック
5. 表示される DNS レコード（A レコードまたは CNAME）を控える:
   - A レコード: 76.76.21.21 (例。実際は Vercel の指示に従う)
   - CNAME: cname.vercel-dns.com.

# ステップ 5: DNS 設定（5分）

ドメイン取得元（Cloudflare or お名前.com）の DNS 管理画面で:

## Cloudflare Registrar の場合:
1. https://dash.cloudflare.com/ → 該当ドメインをクリック
2. DNS → Records → Add record
3. Type: A, Name: @, Content: 76.76.21.21, Proxy: OFF
4. もう一度 Add record で Type: CNAME, Name: www, Content: cname.vercel-dns.com.

## お名前.com の場合:
1. ナビゲーションメニュー「ドメイン」→「DNS設定」→ 該当ドメイン
2. DNSレコード設定 → 入力
3. ホスト名: 空欄, TYPE: A, VALUE: 76.76.21.21
4. ホスト名: www, TYPE: CNAME, VALUE: cname.vercel-dns.com.

設定後、Vercel に戻り、ドメインの横にチェックマーク（緑）が付くまで5〜15分待機。

# ステップ 6: NEXT_PUBLIC_SITE_URL 更新（2分）

1. Vercel → shinrei → Settings → Environment Variables
2. NEXT_PUBLIC_SITE_URL を見つけて Edit
3. 値を https://shinreimap.jp （実際に取得したドメイン）に変更
4. Save
5. Deployments → 最新の「...」→ Redeploy（Use existing Build Cache は OFF）

# ステップ 7: HTTPS 確認（3分）

Vercel が自動で Let's Encrypt 証明書を発行します。

1. https://shinreimap.jp/ にアクセス（httpsで）
2. 鍵マーク (🔒) が付くことを確認
3. shinrei.vercel.app → shinreimap.jp に自動転送されるか確認:
   curl で https://shinrei.vercel.app/ にアクセスし、301 リダイレクトの Location ヘッダを確認
   Vercel 設定で「Redirect to Primary Domain」を ON にする

# ステップ 8: Search Console に新ドメイン登録（5分）

1. https://search.google.com/search-console を開く
2. 左上のプロパティ選択 → 「プロパティを追加」
3. 「ドメイン」プロパティを選択（"https://" 抜きでドメイン名を入力）
   例: shinreimap.jp
4. 表示される TXT レコードをコピー
5. Cloudflare/お名前.com の DNS 設定で TXT レコード追加:
   - Type: TXT
   - Name: @
   - Content: <Search Console が表示した値>
6. Search Console で「確認」ボタンをクリック
7. 確認成功後、左メニュー「サイトマップ」を開く
8. https://shinreimap.jp/sitemap.xml を入力 → 送信
9. ステータスが「成功しました」になるまで待つ（即時の場合もあれば数時間後の場合もある）

# ステップ 9: 旧 shinrei.vercel.app プロパティの後処理（2分）

旧 vercel.app プロパティは削除せず残しておく（リダイレクト追跡のため）。
ただし AdSense 申請は新ドメインだけで行うので、旧プロパティでサイトマップ削除する:
1. Search Console で shinrei.vercel.app プロパティを開く
2. サイトマップ → sitemap.xml → 削除

# ステップ 10: AdSense に新ドメイン追加（2分・ただし再申請は2週間後）

新ドメインを AdSense に紐付けはするが、再申請は2週間運用後にすることをユーザーに必ず説明:

1. https://www.google.com/adsense/new/u/0/pub-3426988731032283/sites を開く
2. 「サイトを追加」→ shinreimap.jp（実際のドメイン）を追加
3. ads.txt の自動更新を待つ（数時間〜1日）
4. https://shinreimap.jp/ads.txt が pub-3426988731032283 を含むか確認

このステップでは「審査をリクエスト」は押さない。
2週間の運用期間を置いてから再申請する旨をユーザーに伝える。

# ステップ 11: 動作確認

最後に以下を一覧確認:

- [ ] https://shinreimap.jp/ がトップを返す
- [ ] https://shinreimap.jp/map/ で地図にピンが多数表示
- [ ] https://shinreimap.jp/area/tokyo/ で東京の一覧が表示
- [ ] https://shinreimap.jp/sitemap.xml が新ドメインで返る（<loc> も新ドメインに）
- [ ] https://shinreimap.jp/ads.txt が pub-3426988731032283 を返す
- [ ] https://shinreimap.jp/robots.txt が「Allow: /」を含む
- [ ] Google Search Console の「URL 検査」で https://shinreimap.jp/ をテストし、「URLは Google に登録できます」と出る
- [ ] 旧 https://shinrei.vercel.app/ にアクセスすると 301 で shinreimap.jp に転送される

# 最終報告

完了したら以下を一括報告:
- 取得した独自ドメイン名と年間費用
- index_worthy_count（ステップ1）
- ステップ2 A/B/C の noindex 動作結果
- 新ドメインで HTTPS が有効か
- Search Console 所有権確認 + sitemap 送信「成功」
- AdSense に新ドメイン追加完了
- 2週間後に再申請する旨をユーザーが理解しているか

# 注意事項

- ドメイン購入の決済情報・住所はユーザーに直接入力させる
- 「審査をリクエスト」ボタンは絶対に押さない（2週間運用後にユーザーが押す）
- shinrei.vercel.app のリダイレクト確認は最後に必ず行う
- 各ステップでエラーが出たらスクリーンショット＋エラー文言を残してから次に進む
```

---

## 補足

このプロンプト1本で **AdSense 再申請に向けた最重要施策（独自ドメイン化）** が完了します。
ステップ完了後、2週間運用してから AdSense の「審査をリクエスト」をユーザー自身が押してください。

その間にやれること（あなた手動 or 私が別途）:
- 自分でいくつかスポットに口コミ・写真を投稿して UGC ページを増やす
- X で記事を月3〜5本シェアして自然な被リンク・流入を作る
- 独自記事をさらに増やす（私に指示してください、追加します）
