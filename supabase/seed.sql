-- =====================================================================
-- 心霊マップ - seed.sql
-- 開発確認用シードデータ（全て架空。実在の事件・個人情報は含めない）
-- =====================================================================

-- 既存データを掃除（開発用）
-- delete from public.reviews;
-- delete from public.spots;

insert into public.spots
  (name, slug, description, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  ('旧月影トンネル', 'kyu-tsukikage-tunnel',
   '地元で古くから語り継がれる、夜になると雰囲気が変わるという噂のトンネルです。真偽は不明ですが、足音を聞いたという投稿があります。',
   '神奈川県', 'kanagawa', '横浜市青葉区', '横浜市青葉区周辺（おおよその位置）',
   35.5705, 139.5371, 'approximate', 'トンネル', 'tunnel',
   3, 0, 0, false, false, 'published'),

  ('霧ヶ丘展望台', 'kirigaoka-tenboudai',
   '霧が出やすい高台にある展望台。夜になると霧で視界が悪く、独特の雰囲気を感じるという体験談が寄せられています。',
   '東京都', 'tokyo', '八王子市', '八王子市内（おおよその位置）',
   35.6585, 139.3030, 'approximate', '山・峠', 'mountain-pass',
   2, 0, 0, false, false, 'published'),

  ('黒森橋', 'kuromori-bashi',
   '森の中を抜ける小さな橋。地元では昔から少し怖い場所として知られているようです。投稿は体験談・伝承の共有を目的としています。',
   '埼玉県', 'saitama', '飯能市', '飯能市内（おおよその位置）',
   35.8553, 139.3278, 'approximate', '橋', 'bridge',
   2, 0, 0, false, false, 'published'),

  ('旧青葉ホテル跡', 'kyu-aoba-hotel-ato',
   'かつて存在したと噂されるホテルの跡地。現在は立入禁止区域に隣接しており、外部からの観察のみが想定されます。侵入は推奨しません。',
   '千葉県', 'chiba', '館山市', '館山市内（おおよその位置）',
   34.9962, 139.8696, 'area_only', 'ホテル跡', 'hotel',
   4, 0, 0, true, true, 'published'),

  ('白河公園北口', 'shirakawa-park-kitaguchi',
   '夜間に独特の静けさを感じるという都市伝説的な噂が地元で語られている公園の一角。真偽不明の体験談が共有されています。',
   '大阪府', 'osaka', '大阪市', '大阪市内（おおよその位置）',
   34.6937, 135.5023, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  ('旧灯野駅跡', 'kyu-tomono-eki-ato',
   'かつて存在したとされる駅の跡地周辺。鉄道ファンの間で都市伝説として語られることがあるエリアです。',
   '北海道', 'hokkaido', '函館市', '函館市内（おおよその位置）',
   41.7687, 140.7288, 'area_only', '駅・線路周辺', 'station',
   2, 0, 0, false, false, 'pending_review'),

  ('影沼ダム周辺', 'kagenuma-dam',
   '湖面に映る影が独特だという地元の噂があります。立入禁止区域には絶対に近づかないでください。',
   '長野県', 'nagano', '松本市', '松本市内（おおよその位置）',
   36.2380, 137.9720, 'area_only', '水辺・ダム', 'water',
   3, 0, 0, false, true, 'published');

-- reviews（全て架空）
insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '夜に通ったとき、後ろから足音のような音が聞こえた気がしました。気のせいかもしれませんが、独特の雰囲気でした。',
       4, '2024年秋', 'published'
from public.spots where slug = 'kyu-tsukikage-tunnel';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '通りすがり',
       '写真を撮ったら、端の方に白い影のようなものが写っていました。真偽はわかりませんが、印象に残る場所でした。',
       3, '2024年夏', 'published'
from public.spots where slug = 'kyu-tsukikage-tunnel';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '霧が濃い日に行きました。視界が悪いせいか、何かがいるような気配を感じました。あくまで個人の感想です。',
       3, '2025年春', 'published'
from public.spots where slug = 'kirigaoka-tenboudai';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '地元民',
       '地元では昔から少し怖い場所として知られているようです。真偽は不明ですが、雰囲気はあります。',
       2, null, 'published'
from public.spots where slug = 'kuromori-bashi';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '外から見るだけでも独特の雰囲気がありました。立入禁止なので絶対に入らないようにしてください。',
       4, '2024年冬', 'published'
from public.spots where slug = 'kyu-aoba-hotel-ato';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '深夜に通りかかると、街灯の少なさもあって少し怖く感じました。あくまで個人の感想です。',
       2, '2025年春', 'published'
from public.spots where slug = 'shirakawa-park-kitaguchi';

-- 統計を再計算（trigger で更新されているはずだが念のため）
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;
