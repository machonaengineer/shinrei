-- =====================================================
-- shinrei: imported via scripts/import-spots.ts
-- generated: 2026-05-23T16:07:46.858Z
-- rows: 327
-- 取得元は内部 sources にのみ保存、公開画面には出ません
-- =====================================================

-- 1) spots を挿入（重複は ON CONFLICT で回避）
do $$
declare
  new_spot_id uuid;
begin

  -- 1: 龍宮城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1004') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '龍宮城' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('龍宮城', '龍宮城-7jjnl09n', '龍宮城は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.105503, 140.545618, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1004', 'ghostmap.jp',
            'community-site',
            '龍宮城とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 2: 加太砲台跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1022') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加太砲台跡' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加太砲台跡', '加太砲台跡-9eeyjxoo', '加太砲台跡は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.296336, 135.071958, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1022', 'ghostmap.jp',
            'community-site',
            '加太砲台跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 3: 海軍壕公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1024') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '海軍壕公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('海軍壕公園', '海軍壕公園-vw0ezxjl', '海軍壕公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.186183, 127.676657, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1024', 'ghostmap.jp',
            'community-site',
            '海軍壕公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 4: 貴日土神社と泣き別れ坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1026') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '貴日土神社と泣き別れ坂' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('貴日土神社と泣き別れ坂', '貴日土神社と泣き別れ坂-97svdpat', '貴日土神社と泣き別れ坂は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.416308, 139.394252, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1026', 'ghostmap.jp',
            'community-site',
            '貴日土神社と泣き別れ坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 5: 藤塚トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1030') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '藤塚トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('藤塚トンネル', '藤塚トンネル-ymv81pxo', '藤塚トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.452601, 139.572031, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1030', 'ghostmap.jp',
            'community-site',
            '藤塚トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 6: 禁断の地（新城島）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1032') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '禁断の地（新城島）' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('禁断の地（新城島）', '禁断の地新城島-ytfw8osw', '禁断の地（新城島）は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         24.236477, 123.947411, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1032', 'ghostmap.jp',
            'community-site',
            '禁断の地（新城島）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 7: 大塚団地跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1034') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大塚団地跡' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大塚団地跡', '大塚団地跡-7cby81uw', '大塚団地跡は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         35.050119, 136.200026, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1034', 'ghostmap.jp',
            'community-site',
            '大塚団地跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 8: 道正橋・魔のカーブ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1036') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '道正橋・魔のカーブ' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('道正橋・魔のカーブ', '道正橋・魔のカーブ-os92iqcj', '道正橋・魔のカーブは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.509827, 139.484516, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1036', 'ghostmap.jp',
            'community-site',
            '道正橋・魔のカーブとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 9: さとしちゃん像（緑ヶ丘霊園）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1038') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'さとしちゃん像（緑ヶ丘霊園）' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('さとしちゃん像（緑ヶ丘霊園）', 'さとしちゃん像緑ヶ丘霊園-4b5rx8jo', 'さとしちゃん像（緑ヶ丘霊園）は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.606023, 139.594354, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1038', 'ghostmap.jp',
            'community-site',
            'さとしちゃん像（緑ヶ丘霊園）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 10: スクラップ置き場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1042') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'スクラップ置き場' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('スクラップ置き場', 'スクラップ置き場-ux1onw7k', 'スクラップ置き場は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.65706, 140.077508, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1042', 'ghostmap.jp',
            'community-site',
            'スクラップ置き場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 11: 真玉橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1046') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '真玉橋' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('真玉橋', '真玉橋-3cl8fmp6', '真玉橋は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.194987, 127.695465, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1046', 'ghostmap.jp',
            'community-site',
            '真玉橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 12: 大川寺遊園地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1048') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大川寺遊園地' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大川寺遊園地', '大川寺遊園地-606tsgvz', '大川寺遊園地は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.607064, 137.308377, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1048', 'ghostmap.jp',
            'community-site',
            '大川寺遊園地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 13: 浦添大公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1052') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浦添大公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浦添大公園', '浦添大公園-h8z5r6vz', '浦添大公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.254462, 127.726136, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1052', 'ghostmap.jp',
            'community-site',
            '浦添大公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 14: 田麦川近くの廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1054') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田麦川近くの廃墟' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田麦川近くの廃墟', '田麦川近くの廃墟-14a8r4tm', '田麦川近くの廃墟は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.571098, 139.923077, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1054', 'ghostmap.jp',
            'community-site',
            '田麦川近くの廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 15: 安房トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1056') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '安房トンネル' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('安房トンネル', '安房トンネル-p1jb5vm4', '安房トンネルは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.202038, 137.600018, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1056', 'ghostmap.jp',
            'community-site',
            '安房トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 16: 里見公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1060') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '里見公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('里見公園', '里見公園-at570nc0', '里見公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.747085, 139.899083, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1060', 'ghostmap.jp',
            'community-site',
            '里見公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 17: せどむら坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1062') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'せどむら坂' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('せどむら坂', 'せどむら坂-yzmwnfll', 'せどむら坂は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.563193, 139.35589, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1062', 'ghostmap.jp',
            'community-site',
            'せどむら坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 18: 松工裏の電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1064') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松工裏の電話ボックス' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松工裏の電話ボックス', '松工裏の電話ボックス-j51eu2c3', '松工裏の電話ボックスは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.833764, 132.762121, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1064', 'ghostmap.jp',
            'community-site',
            '松工裏の電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 19: 隔離病棟のさ迷う霊
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1066') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '隔離病棟のさ迷う霊' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('隔離病棟のさ迷う霊', '隔離病棟のさ迷う霊-3yo0fben', '隔離病棟のさ迷う霊は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         38.943493, 139.834633, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1066', 'ghostmap.jp',
            'community-site',
            '隔離病棟のさ迷う霊とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 20: 神居古潭トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1072') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神居古潭トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神居古潭トンネル', '神居古潭トンネル-0rmw3y39', '神居古潭トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.729926, 142.199618, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1072', 'ghostmap.jp',
            'community-site',
            '神居古潭トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 21: 五月山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1074') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五月山' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五月山', '五月山-61jwfyq2', '五月山は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.837759, 135.439078, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1074', 'ghostmap.jp',
            'community-site',
            '五月山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 22: いわき賽の河原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1078') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'いわき賽の河原' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('いわき賽の河原', 'いわき賽の河原-2cqbi468', 'いわき賽の河原は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         37.007402, 140.97904, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1078', 'ghostmap.jp',
            'community-site',
            'いわき賽の河原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 23: 黒瀬病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1080') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒瀬病院' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒瀬病院', '黒瀬病院-h0alnru3', '黒瀬病院は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.32521, 132.650975, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1080', 'ghostmap.jp',
            'community-site',
            '黒瀬病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 24: 小和清水の惨殺屋敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1082') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小和清水の惨殺屋敷' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小和清水の惨殺屋敷', '小和清水の惨殺屋敷-t46p3dri', '小和清水の惨殺屋敷は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.671509, 140.118039, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1082', 'ghostmap.jp',
            'community-site',
            '小和清水の惨殺屋敷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 25: 相模原慰霊塔と相模原市営斎場を結ぶライン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1084') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '相模原慰霊塔と相模原市営斎場を結ぶライン' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('相模原慰霊塔と相模原市営斎場を結ぶライン', '相模原慰霊塔と相模原市営斎場を結ぶライン-bytbplpd', '相模原慰霊塔と相模原市営斎場を結ぶラインは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.548015, 139.423735, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1084', 'ghostmap.jp',
            'community-site',
            '相模原慰霊塔と相模原市営斎場を結ぶラインとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 26: オレンジハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1088') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'オレンジハウス' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('オレンジハウス', 'オレンジハウス-tfg5a95d', 'オレンジハウスは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.878636, 140.08561, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1088', 'ghostmap.jp',
            'community-site',
            'オレンジハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 27: 都立戸山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1090') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '都立戸山公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('都立戸山公園', '都立戸山公園-8mmg6wor', '都立戸山公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.705393, 139.70393, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1090', 'ghostmap.jp',
            'community-site',
            '都立戸山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 28: 湯の花トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1092') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湯の花トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湯の花トンネル', '湯の花トンネル-gj886kex', '湯の花トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.639632, 139.256335, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1092', 'ghostmap.jp',
            'community-site',
            '湯の花トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 29: 猿尾トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1094') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猿尾トンネル' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猿尾トンネル', '猿尾トンネル-gb53ormz', '猿尾トンネルは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.642428, 140.458176, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1094', 'ghostmap.jp',
            'community-site',
            '猿尾トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 30: 金野井大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1098') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金野井大橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金野井大橋', '金野井大橋-pdab45yd', '金野井大橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.991842, 139.819721, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1098', 'ghostmap.jp',
            'community-site',
            '金野井大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 31: 美南中央公園近くの貯水池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1104') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美南中央公園近くの貯水池' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美南中央公園近くの貯水池', '美南中央公園近くの貯水池-nix41iw4', '美南中央公園近くの貯水池は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.867291, 139.851612, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1104', 'ghostmap.jp',
            'community-site',
            '美南中央公園近くの貯水池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 32: 千住に当たっている隅田川周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1106') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千住に当たっている隅田川周辺' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千住に当たっている隅田川周辺', '千住に当たっている隅田川周辺-idswou7m', '千住に当たっている隅田川周辺は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.730419, 139.81184, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1106', 'ghostmap.jp',
            'community-site',
            '千住に当たっている隅田川周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 33: 大佐沢沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1118') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大佐沢沼' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大佐沢沼', '大佐沢沼-lptv677r', '大佐沢沼は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.554618, 140.3824, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1118', 'ghostmap.jp',
            'community-site',
            '大佐沢沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 34: 新小岩駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1120') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新小岩駅' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新小岩駅', '新小岩駅-4kyl66o2', '新小岩駅は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.71675, 139.857811, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1120', 'ghostmap.jp',
            'community-site',
            '新小岩駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 35: マルイ病院(跡地)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1124') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'マルイ病院(跡地)' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('マルイ病院(跡地)', 'マルイ病院跡地-a96tue2q', 'マルイ病院(跡地)は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.370114, 135.267379, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1124', 'ghostmap.jp',
            'community-site',
            'マルイ病院(跡地)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 36: 若人の広場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1138') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '若人の広場' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('若人の広場', '若人の広場-aqdbe9cy', '若人の広場は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.233803, 134.711781, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1138', 'ghostmap.jp',
            'community-site',
            '若人の広場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 37: 立待岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1142') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立待岬' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立待岬', '立待岬-a1h1889v', '立待岬は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.744677, 140.720787, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1142', 'ghostmap.jp',
            'community-site',
            '立待岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 38: 外国人墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1144') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '外国人墓地' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('外国人墓地', '外国人墓地-d5z3w2ep', '外国人墓地は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.765166, 140.706567, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1144', 'ghostmap.jp',
            'community-site',
            '外国人墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 39: ホテル ラ・レインボー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1168') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル ラ・レインボー' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル ラ・レインボー', 'ホテル-ラ・レインボー-7qdec77y', 'ホテル ラ・レインボーは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.444972, 133.796507, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1168', 'ghostmap.jp',
            'community-site',
            'ホテル ラ・レインボーとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 40: 散在ガ池森林公園(鎌倉湖)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1184') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '散在ガ池森林公園(鎌倉湖)' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('散在ガ池森林公園(鎌倉湖)', '散在ガ池森林公園鎌倉湖-pyn0cr2j', '散在ガ池森林公園(鎌倉湖)は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.340965, 139.561558, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1184', 'ghostmap.jp',
            'community-site',
            '散在ガ池森林公園(鎌倉湖)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 41: 羽地内海
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1194') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '羽地内海' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('羽地内海', '羽地内海-r9bwatyr', '羽地内海は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.650681, 127.993212, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1194', 'ghostmap.jp',
            'community-site',
            '羽地内海とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 42: 樽水ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1196') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '樽水ダム' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('樽水ダム', '樽水ダム-a2fa7r4b', '樽水ダムは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.176536, 140.840092, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1196', 'ghostmap.jp',
            'community-site',
            '樽水ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 43: 玄界灘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1198') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '玄界灘' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('玄界灘', '玄界灘-2bmpyp3i', '玄界灘は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.580303, 130.046574, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1198', 'ghostmap.jp',
            'community-site',
            '玄界灘とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 44: ホテルお山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1200') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルお山' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルお山', 'ホテルお山-v1ixtu2i', 'ホテルお山は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.432799, 138.884372, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1200', 'ghostmap.jp',
            'community-site',
            'ホテルお山とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 45: ユネスコ会館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1208') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ユネスコ会館' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ユネスコ会館', 'ユネスコ会館-esa9l2m9', 'ユネスコ会館は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.776209, 135.291313, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1208', 'ghostmap.jp',
            'community-site',
            'ユネスコ会館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 46: 糀屋ダム（翠明湖）と翠公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1210') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '糀屋ダム（翠明湖）と翠公園' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('糀屋ダム（翠明湖）と翠公園', '糀屋ダム翠明湖と翠公園-aohn7vph', '糀屋ダム（翠明湖）と翠公園は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.029153, 134.913282, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1210', 'ghostmap.jp',
            'community-site',
            '糀屋ダム（翠明湖）と翠公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 47: 黒潮荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1212') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒潮荘' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒潮荘', '黒潮荘-jh7ewjry', '黒潮荘は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.320414, 134.916489, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1212', 'ghostmap.jp',
            'community-site',
            '黒潮荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 48: 高田牧場（武家屋敷）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1216') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高田牧場（武家屋敷）' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高田牧場（武家屋敷）', '高田牧場武家屋敷-rgd0in63', '高田牧場（武家屋敷）は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.779496, 134.927611, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1216', 'ghostmap.jp',
            'community-site',
            '高田牧場（武家屋敷）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 49: ゼロ戦墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1218') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ゼロ戦墓地' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ゼロ戦墓地', 'ゼロ戦墓地-4vt5vbry', 'ゼロ戦墓地は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.796854, 135.335937, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1218', 'ghostmap.jp',
            'community-site',
            'ゼロ戦墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 50: 旧旧吹上トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1220') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧旧吹上トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧旧吹上トンネル', '旧旧吹上トンネル-md7j3gef', '旧旧吹上トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.816734, 139.248001, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1220', 'ghostmap.jp',
            'community-site',
            '旧旧吹上トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 51: くろんど池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1222') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'くろんど池' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('くろんど池', 'くろんど池-8lwzppf8', 'くろんど池は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.762231, 135.714386, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1222', 'ghostmap.jp',
            'community-site',
            'くろんど池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 52: 武山駐屯地高等工科学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1224') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武山駐屯地高等工科学校' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武山駐屯地高等工科学校', '武山駐屯地高等工科学校-pex4zdt9', '武山駐屯地高等工科学校は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.209573, 139.63129, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1224', 'ghostmap.jp',
            'community-site',
            '武山駐屯地高等工科学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 53: 末吉公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1226') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '末吉公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('末吉公園', '末吉公園-wjktm6ek', '末吉公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.228874, 127.715191, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1226', 'ghostmap.jp',
            'community-site',
            '末吉公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 54: 谷中霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1228') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷中霊園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷中霊園', '谷中霊園-hyr1t4vm', '谷中霊園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.724809, 139.771489, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1228', 'ghostmap.jp',
            'community-site',
            '谷中霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 55: 祟りの松の木
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1230') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '祟りの松の木' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('祟りの松の木', '祟りの松の木-iu7ozjeh', '祟りの松の木は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.622767, 140.104072, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1230', 'ghostmap.jp',
            'community-site',
            '祟りの松の木とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 56: 佐倉の幽霊屋敷（ユーカリ惨殺屋敷）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1232') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐倉の幽霊屋敷（ユーカリ惨殺屋敷）' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐倉の幽霊屋敷（ユーカリ惨殺屋敷）', '佐倉の幽霊屋敷ユーカリ惨殺屋敷-3ggrb859', '佐倉の幽霊屋敷（ユーカリ惨殺屋敷）は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.726121, 140.166147, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1232', 'ghostmap.jp',
            'community-site',
            '佐倉の幽霊屋敷（ユーカリ惨殺屋敷）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 57: 東京タワー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1234') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東京タワー' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東京タワー', '東京タワー-aqegz7ql', '東京タワーは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.657967, 139.746426, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1234', 'ghostmap.jp',
            'community-site',
            '東京タワーとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 58: ホテルアイランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1240') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルアイランド' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルアイランド', 'ホテルアイランド-45gu4zdi', 'ホテルアイランドは、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.809713, 131.454309, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1240', 'ghostmap.jp',
            'community-site',
            'ホテルアイランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 59: 清水公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1242') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '清水公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('清水公園', '清水公園-fq9krx7a', '清水公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.961063, 139.848974, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1242', 'ghostmap.jp',
            'community-site',
            '清水公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 60: 住吉海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1244') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '住吉海岸' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('住吉海岸', '住吉海岸-b1xrboeq', '住吉海岸は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.516117, 133.766903, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1244', 'ghostmap.jp',
            'community-site',
            '住吉海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 61: 立神峡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1246') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立神峡' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立神峡', '立神峡-qdckt874', '立神峡は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.549931, 130.708003, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1246', 'ghostmap.jp',
            'community-site',
            '立神峡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 62: 朝里温泉病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1248') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '朝里温泉病院' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('朝里温泉病院', '朝里温泉病院-8j7ht90g', '朝里温泉病院は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.143638, 141.038312, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1248', 'ghostmap.jp',
            'community-site',
            '朝里温泉病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 63: としまえんのお化け屋敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1250') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'としまえんのお化け屋敷' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('としまえんのお化け屋敷', 'としまえんのお化け屋敷-nh7eacbn', 'としまえんのお化け屋敷は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.746706, 139.644929, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1250', 'ghostmap.jp',
            'community-site',
            'としまえんのお化け屋敷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 64: 藻岩山百段階段
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1252') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '藻岩山百段階段' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('藻岩山百段階段', '藻岩山百段階段-pl3v1ni2', '藻岩山百段階段は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.029913, 141.335546, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1252', 'ghostmap.jp',
            'community-site',
            '藻岩山百段階段とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 65: 茅ヶ崎駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1256') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茅ヶ崎駅' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茅ヶ崎駅', '茅ヶ崎駅-xo19uq4m', '茅ヶ崎駅は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.330295, 139.407089, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1256', 'ghostmap.jp',
            'community-site',
            '茅ヶ崎駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 66: 保土ヶ谷公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1260') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '保土ヶ谷公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('保土ヶ谷公園', '保土ヶ谷公園-23vgyms2', '保土ヶ谷公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.455052, 139.584417, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1260', 'ghostmap.jp',
            'community-site',
            '保土ヶ谷公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 67: 向山踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1262') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '向山踏切' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('向山踏切', '向山踏切-a2r0klwm', '向山踏切は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.747998, 140.089902, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1262', 'ghostmap.jp',
            'community-site',
            '向山踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 68: 市川市河原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1264') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '市川市河原' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('市川市河原', '市川市河原-qwdz425s', '市川市河原は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.701378, 139.921203, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1264', 'ghostmap.jp',
            'community-site',
            '市川市河原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 69: 赤坂公園とその周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1266') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤坂公園とその周辺' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤坂公園とその周辺', '赤坂公園とその周辺-0926u7hy', '赤坂公園とその周辺は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.779412, 140.290987, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1266', 'ghostmap.jp',
            'community-site',
            '赤坂公園とその周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 70: 大籠地区の隠れキリシタン関連遺跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1268') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大籠地区の隠れキリシタン関連遺跡' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大籠地区の隠れキリシタン関連遺跡', '大籠地区の隠れキリシタン関連遺跡-thjwseqq', '大籠地区の隠れキリシタン関連遺跡は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.790402, 141.404899, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1268', 'ghostmap.jp',
            'community-site',
            '大籠地区の隠れキリシタン関連遺跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 71: 東京ディズニーランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1270') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東京ディズニーランド' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東京ディズニーランド', '東京ディズニーランド-k23pe4mc', '東京ディズニーランドは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.632606, 139.88014, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1270', 'ghostmap.jp',
            'community-site',
            '東京ディズニーランドとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 72: 白薔薇学園前
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1276') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白薔薇学園前' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白薔薇学園前', '白薔薇学園前-5ygern47', '白薔薇学園前は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.864806, 137.10989, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1276', 'ghostmap.jp',
            'community-site',
            '白薔薇学園前とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 73: 鵜原理想郷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1282') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鵜原理想郷' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鵜原理想郷', '鵜原理想郷-xhu3nvrl', '鵜原理想郷は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.132447, 140.275068, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1282', 'ghostmap.jp',
            'community-site',
            '鵜原理想郷とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 74: 丑ヶ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1284') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丑ヶ池' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丑ヶ池', '丑ヶ池-sb20ld15', '丑ヶ池は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.597837, 140.37346, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1284', 'ghostmap.jp',
            'community-site',
            '丑ヶ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 75: 鹿野山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1286') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鹿野山トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鹿野山トンネル', '鹿野山トンネル-nvgtf334', '鹿野山トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.24365, 139.963882, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1286', 'ghostmap.jp',
            'community-site',
            '鹿野山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 76: 血の池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1288') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '血の池' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('血の池', '血の池-lqm3yqb7', '血の池は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.770366, 136.853503, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1288', 'ghostmap.jp',
            'community-site',
            '血の池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 77: 東濃朝鮮初中級学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1292') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東濃朝鮮初中級学校' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東濃朝鮮初中級学校', '東濃朝鮮初中級学校-eiwqm7yp', '東濃朝鮮初中級学校は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.372928, 137.18585, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1292', 'ghostmap.jp',
            'community-site',
            '東濃朝鮮初中級学校とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 78: 宮島池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1298') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮島池' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮島池', '宮島池-0jem5xin', '宮島池は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.54571, 140.425074, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1298', 'ghostmap.jp',
            'community-site',
            '宮島池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 79: サイカチ沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1300') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'サイカチ沼' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('サイカチ沼', 'サイカチ沼-bak5x6kw', 'サイカチ沼は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.258334, 140.742674, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1300', 'ghostmap.jp',
            'community-site',
            'サイカチ沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 80: 岩手医科大学の渡り廊下
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1302') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岩手医科大学の渡り廊下' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岩手医科大学の渡り廊下', '岩手医科大学の渡り廊下-67rqsi0i', '岩手医科大学の渡り廊下は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.705305, 141.15155, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1302', 'ghostmap.jp',
            'community-site',
            '岩手医科大学の渡り廊下とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 81: ふるさとの緑の景観地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1310') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ふるさとの緑の景観地' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ふるさとの緑の景観地', 'ふるさとの緑の景観地-et3qvbec', 'ふるさとの緑の景観地は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.969185, 139.631649, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1310', 'ghostmap.jp',
            'community-site',
            'ふるさとの緑の景観地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 82: 旧和田峠トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1314') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧和田峠トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧和田峠トンネル', '旧和田峠トンネル-5x7xk26b', '旧和田峠トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.144114, 138.143972, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1314', 'ghostmap.jp',
            'community-site',
            '旧和田峠トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 83: クジラかん(旧下関市立水族館)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1322') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'クジラかん(旧下関市立水族館)' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('クジラかん(旧下関市立水族館)', 'クジラかん旧下関市立水族館-okntir5t', 'クジラかん(旧下関市立水族館)は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.988814, 130.994018, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1322', 'ghostmap.jp',
            'community-site',
            'クジラかん(旧下関市立水族館)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 84: 恋問海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1324') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '恋問海岸' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('恋問海岸', '恋問海岸-brsamlxd', '恋問海岸は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.992226, 144.198978, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1324', 'ghostmap.jp',
            'community-site',
            '恋問海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 85: 大洗町のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1326') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大洗町のトンネル' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大洗町のトンネル', '大洗町のトンネル-c9vf8bjg', '大洗町のトンネルは、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.307024, 140.554293, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1326', 'ghostmap.jp',
            'community-site',
            '大洗町のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 86: 高島平団地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1328') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高島平団地' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高島平団地', '高島平団地-kcw67gnt', '高島平団地は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.78874, 139.657051, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1328', 'ghostmap.jp',
            'community-site',
            '高島平団地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 87: 比治山陸軍墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1332') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '比治山陸軍墓地' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('比治山陸軍墓地', '比治山陸軍墓地-j05xwwjv', '比治山陸軍墓地は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.382015, 132.473037, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1332', 'ghostmap.jp',
            'community-site',
            '比治山陸軍墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 88: 笹谷峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1334') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笹谷峠' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笹谷峠', '笹谷峠-t7dz7o65', '笹谷峠は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.192323, 140.515137, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1334', 'ghostmap.jp',
            'community-site',
            '笹谷峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 89: ふるさと村 道の駅トイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1336') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ふるさと村 道の駅トイレ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ふるさと村 道の駅トイレ', 'ふるさと村-道の駅トイレ-l3nuzsww', 'ふるさと村 道の駅トイレは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.86662, 139.021311, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1336', 'ghostmap.jp',
            'community-site',
            'ふるさと村 道の駅トイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 90: 母子の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1342') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '母子の墓' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('母子の墓', '母子の墓-enx8bhmc', '母子の墓は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.69237, 134.272586, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1342', 'ghostmap.jp',
            'community-site',
            '母子の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 91: 犬の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1344') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬の墓' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬の墓', '犬の墓-tjcu68dv', '犬の墓は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         33.965208, 134.083041, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1344', 'ghostmap.jp',
            'community-site',
            '犬の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 92: 山谷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1352') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山谷トンネル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山谷トンネル', '山谷トンネル-dulnl78p', '山谷トンネルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.158784, 140.540628, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1352', 'ghostmap.jp',
            'community-site',
            '山谷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 93: 諏訪崎海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1358') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諏訪崎海岸' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諏訪崎海岸', '諏訪崎海岸-ly4kzi48', '諏訪崎海岸は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.440323, 132.3983, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1358', 'ghostmap.jp',
            'community-site',
            '諏訪崎海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 94: ホテルＭ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1360') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルＭ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルＭ', 'ホテルm-bk35call', 'ホテルＭは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.731911, 139.332508, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1360', 'ghostmap.jp',
            'community-site',
            'ホテルＭとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 95: 旧松尾トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1366') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧松尾トンネル' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧松尾トンネル', '旧松尾トンネル-ralwwzyu', '旧松尾トンネルは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.196168, 132.153533, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1366', 'ghostmap.jp',
            'community-site',
            '旧松尾トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 96: 崖松キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1372') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '崖松キャンプ場' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('崖松キャンプ場', '崖松キャンプ場-46mcvlsj', '崖松キャンプ場は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.718571, 138.786914, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1372', 'ghostmap.jp',
            'community-site',
            '崖松キャンプ場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 97: 寺の近くの道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1376') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '寺の近くの道' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('寺の近くの道', '寺の近くの道-z2wzvd44', '寺の近くの道は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.710559, 139.582135, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1376', 'ghostmap.jp',
            'community-site',
            '寺の近くの道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 98: 田無駅南口自転車駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1378') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田無駅南口自転車駐車場' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田無駅南口自転車駐車場', '田無駅南口自転車駐車場-taprqz9a', '田無駅南口自転車駐車場は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.726325, 139.53823, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1378', 'ghostmap.jp',
            'community-site',
            '田無駅南口自転車駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 99: 犬鳴山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1382') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬鳴山トンネル' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬鳴山トンネル', '犬鳴山トンネル-v17g1m1c', '犬鳴山トンネルは、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.338584, 135.389316, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1382', 'ghostmap.jp',
            'community-site',
            '犬鳴山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 100: こどもの国近くの防空壕
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1386') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'こどもの国近くの防空壕' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('こどもの国近くの防空壕', 'こどもの国近くの防空壕-2bf3k478', 'こどもの国近くの防空壕は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.554374, 139.489647, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1386', 'ghostmap.jp',
            'community-site',
            'こどもの国近くの防空壕とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 101: 土合駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1388') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '土合駅' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('土合駅', '土合駅-boa72byj', '土合駅は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.831508, 138.966953, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1388', 'ghostmap.jp',
            'community-site',
            '土合駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 102: ビビリ神社（正一位石倉稲荷神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1390') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ビビリ神社（正一位石倉稲荷神社）' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ビビリ神社（正一位石倉稲荷神社）', 'ビビリ神社正一位石倉稲荷神社-h4ve585g', 'ビビリ神社（正一位石倉稲荷神社）は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.77109, 140.853286, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1390', 'ghostmap.jp',
            'community-site',
            'ビビリ神社（正一位石倉稲荷神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 103: 京王プラザホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1392') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '京王プラザホテル' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('京王プラザホテル', '京王プラザホテル-m159b1gi', '京王プラザホテルは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.690274, 139.694366, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1392', 'ghostmap.jp',
            'community-site',
            '京王プラザホテルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 104: 八王子霊園の電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1394') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子霊園の電話ボックス' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子霊園の電話ボックス', '八王子霊園の電話ボックス-n3smpjv8', '八王子霊園の電話ボックスは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.660457, 139.268624, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1394', 'ghostmap.jp',
            'community-site',
            '八王子霊園の電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 105: 田浦廃村（伽椰子の家）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1400') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田浦廃村（伽椰子の家）' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田浦廃村（伽椰子の家）', '田浦廃村伽椰子の家-61z2fn3u', '田浦廃村（伽椰子の家）は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.291224, 139.626674, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1400', 'ghostmap.jp',
            'community-site',
            '田浦廃村（伽椰子の家）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 106: 鶴見緑地公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1402') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鶴見緑地公園' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鶴見緑地公園', '鶴見緑地公園-avwhemqs', '鶴見緑地公園は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.714415, 135.580279, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1402', 'ghostmap.jp',
            'community-site',
            '鶴見緑地公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 107: アジャリの森（歩人山神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1404') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'アジャリの森（歩人山神社）' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('アジャリの森（歩人山神社）', 'アジャリの森歩人山神社-36x39ocp', 'アジャリの森（歩人山神社）は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.842998, 135.604023, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1404', 'ghostmap.jp',
            'community-site',
            'アジャリの森（歩人山神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 108: 馬橋駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1406') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '馬橋駅' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('馬橋駅', '馬橋駅-9ylde0go', '馬橋駅は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.811201, 139.917412, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1406', 'ghostmap.jp',
            'community-site',
            '馬橋駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 109: 休暇村八徳山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1408') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '休暇村八徳山荘' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('休暇村八徳山荘', '休暇村八徳山荘-4qo3k7dh', '休暇村八徳山荘は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.725487, 139.384977, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1408', 'ghostmap.jp',
            'community-site',
            '休暇村八徳山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 110: 福岡藩刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1412') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '福岡藩刑場跡' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('福岡藩刑場跡', '福岡藩刑場跡-rtcwuala', '福岡藩刑場跡は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.589796, 130.403538, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1412', 'ghostmap.jp',
            'community-site',
            '福岡藩刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 111: 郡ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1414') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '郡ダム' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('郡ダム', '郡ダム-rjjremfd', '郡ダムは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.294759, 139.906189, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1414', 'ghostmap.jp',
            'community-site',
            '郡ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 112: 小曲園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1416') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小曲園' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小曲園', '小曲園-ecugd30l', '小曲園は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.506483, 138.772141, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1416', 'ghostmap.jp',
            'community-site',
            '小曲園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 113: 石見銀山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1418') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '石見銀山' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('石見銀山', '石見銀山-gaxqiczq', '石見銀山は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         35.105305, 132.438469, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1418', 'ghostmap.jp',
            'community-site',
            '石見銀山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 114: 弥彦公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1424') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弥彦公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弥彦公園', '弥彦公園-yu07zr8m', '弥彦公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.698168, 138.82895, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1424', 'ghostmap.jp',
            'community-site',
            '弥彦公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 115: ホテル好楽園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1426') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル好楽園' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル好楽園', 'ホテル好楽園-sdmhec0y', 'ホテル好楽園は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.303595, 134.935783, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1426', 'ghostmap.jp',
            'community-site',
            'ホテル好楽園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 116: 日本ウエスタン村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1428') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日本ウエスタン村' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日本ウエスタン村', '日本ウエスタン村-vu49aa4o', '日本ウエスタン村は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.773378, 139.710022, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1428', 'ghostmap.jp',
            'community-site',
            '日本ウエスタン村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 117: 小笠山憩の森（小笠山トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1432') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小笠山憩の森（小笠山トンネル）' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小笠山憩の森（小笠山トンネル）', '小笠山憩の森小笠山トンネル-lf5wru21', '小笠山憩の森（小笠山トンネル）は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.732531, 138.014257, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1432', 'ghostmap.jp',
            'community-site',
            '小笠山憩の森（小笠山トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 118: モーテルサンリバー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1436') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'モーテルサンリバー' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('モーテルサンリバー', 'モーテルサンリバー-x5s33gyr', 'モーテルサンリバーは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.988983, 135.636614, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1436', 'ghostmap.jp',
            'community-site',
            'モーテルサンリバーとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 119: ホテルロンドン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1440') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルロンドン' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルロンドン', 'ホテルロンドン-8lp8cyo5', 'ホテルロンドンは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.743154, 137.701484, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1440', 'ghostmap.jp',
            'community-site',
            'ホテルロンドンとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 120: ３分間トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1442') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '３分間トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('３分間トンネル', '3分間トンネル-kzwddeee', '３分間トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.25693, 139.743536, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1442', 'ghostmap.jp',
            'community-site',
            '３分間トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 121: 北海道勇払戦没者の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1444') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北海道勇払戦没者の墓' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北海道勇払戦没者の墓', '北海道勇払戦没者の墓-yuxx24vh', '北海道勇払戦没者の墓は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.630273, 141.734147, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1444', 'ghostmap.jp',
            'community-site',
            '北海道勇払戦没者の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 122: 高岡霊園（六地蔵と人形の呪い）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1446') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高岡霊園（六地蔵と人形の呪い）' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高岡霊園（六地蔵と人形の呪い）', '高岡霊園六地蔵と人形の呪い-kr796zkv', '高岡霊園（六地蔵と人形の呪い）は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.661105, 141.595058, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1446', 'ghostmap.jp',
            'community-site',
            '高岡霊園（六地蔵と人形の呪い）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 123: 荒川トンネル（双神トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1448') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '荒川トンネル（双神トンネル）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('荒川トンネル（双神トンネル）', '荒川トンネル双神トンネル-tbpu43l2', '荒川トンネル（双神トンネル）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         35.974507, 138.971871, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1448', 'ghostmap.jp',
            'community-site',
            '荒川トンネル（双神トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 124: 倶多楽湖観光道路
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1450') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '倶多楽湖観光道路' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('倶多楽湖観光道路', '倶多楽湖観光道路-nkgdsf3u', '倶多楽湖観光道路は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.506528, 141.166098, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1450', 'ghostmap.jp',
            'community-site',
            '倶多楽湖観光道路とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 125: 旧御坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1452') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧御坂トンネル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧御坂トンネル', '旧御坂トンネル-v119c3c0', '旧御坂トンネルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.557512, 138.783771, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1452', 'ghostmap.jp',
            'community-site',
            '旧御坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 126: 大菩薩峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1454') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大菩薩峠' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大菩薩峠', '大菩薩峠-mm4ble49', '大菩薩峠は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.736097, 138.852983, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1454', 'ghostmap.jp',
            'community-site',
            '大菩薩峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 127: 加茂山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1456') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加茂山公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加茂山公園', '加茂山公園-dwwf7d1m', '加茂山公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.656084, 139.05344, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1456', 'ghostmap.jp',
            'community-site',
            '加茂山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 128: 法皇トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1460') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '法皇トンネル' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('法皇トンネル', '法皇トンネル-49q6voof', '法皇トンネルは、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.942425, 133.526931, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1460', 'ghostmap.jp',
            'community-site',
            '法皇トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 129: 旧三瓶トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1462') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧三瓶トンネル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧三瓶トンネル', '旧三瓶トンネル-chi8xa0e', '旧三瓶トンネルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.382791, 132.451258, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1462', 'ghostmap.jp',
            'community-site',
            '旧三瓶トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 130: 白根火山ロープウェイ付近の斜面
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1464') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白根火山ロープウェイ付近の斜面' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白根火山ロープウェイ付近の斜面', '白根火山ロープウェイ付近の斜面-78ia0jts', '白根火山ロープウェイ付近の斜面は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.629534, 138.554163, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1464', 'ghostmap.jp',
            'community-site',
            '白根火山ロープウェイ付近の斜面とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 131: 浦浜の廃駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1468') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浦浜の廃駐車場' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浦浜の廃駐車場', '浦浜の廃駐車場-irczdp0i', '浦浜の廃駐車場は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.778538, 138.815861, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1468', 'ghostmap.jp',
            'community-site',
            '浦浜の廃駐車場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 132: 揚川隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1470') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '揚川隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('揚川隧道', '揚川隧道-mpqx563p', '揚川隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.695814, 139.382952, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1470', 'ghostmap.jp',
            'community-site',
            '揚川隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 133: 鳥羽ロイヤルホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1474') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥羽ロイヤルホテル' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥羽ロイヤルホテル', '鳥羽ロイヤルホテル-7feevnnn', '鳥羽ロイヤルホテルは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.477364, 136.854348, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1474', 'ghostmap.jp',
            'community-site',
            '鳥羽ロイヤルホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 134: 紫陽花トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1476') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '紫陽花トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('紫陽花トンネル', '紫陽花トンネル-cyxxat53', '紫陽花トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.717978, 139.080823, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1476', 'ghostmap.jp',
            'community-site',
            '紫陽花トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 135: 諏訪神社（呪いの御神木）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1478') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諏訪神社（呪いの御神木）' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諏訪神社（呪いの御神木）', '諏訪神社呪いの御神木-1zb94bn9', '諏訪神社（呪いの御神木）は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.639844, 138.778777, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1478', 'ghostmap.jp',
            'community-site',
            '諏訪神社（呪いの御神木）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 136: 信楽高原鐵道列車正面衝突事故現場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1480') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '信楽高原鐵道列車正面衝突事故現場' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('信楽高原鐵道列車正面衝突事故現場', '信楽高原鐵道列車正面衝突事故現場-cez7rofu', '信楽高原鐵道列車正面衝突事故現場は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.920825, 136.087923, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1480', 'ghostmap.jp',
            'community-site',
            '信楽高原鐵道列車正面衝突事故現場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 137: やまびこ通り
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1484') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'やまびこ通り' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('やまびこ通り', 'やまびこ通り-6j658zgv', 'やまびこ通りは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.806383, 139.302446, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1484', 'ghostmap.jp',
            'community-site',
            'やまびこ通りとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 138: 長居公園の公衆トイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1486') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長居公園の公衆トイレ' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長居公園の公衆トイレ', '長居公園の公衆トイレ-a5v5n7ls', '長居公園の公衆トイレは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.609604, 135.516462, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1486', 'ghostmap.jp',
            'community-site',
            '長居公園の公衆トイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 139: 旧鳥越トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1488') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧鳥越トンネル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧鳥越トンネル', '旧鳥越トンネル-wodc1mpn', '旧鳥越トンネルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.051271, 132.483695, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1488', 'ghostmap.jp',
            'community-site',
            '旧鳥越トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 140: ホワイトハウス近くのトイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1490') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホワイトハウス近くのトイレ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホワイトハウス近くのトイレ', 'ホワイトハウス近くのトイレ-5yy0wdtz', 'ホワイトハウス近くのトイレは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.795747, 138.825096, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1490', 'ghostmap.jp',
            'community-site',
            'ホワイトハウス近くのトイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 141: 旧真弓トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1492') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧真弓トンネル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧真弓トンネル', '旧真弓トンネル-zoa54cf4', '旧真弓トンネルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.602235, 132.845312, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1492', 'ghostmap.jp',
            'community-site',
            '旧真弓トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 142: 早出山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1494') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '早出山荘' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('早出山荘', '早出山荘-snl0imao', '早出山荘は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.649635, 139.286344, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1494', 'ghostmap.jp',
            'community-site',
            '早出山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 143: 高松の池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1498') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高松の池' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高松の池', '高松の池-4aygc4w3', '高松の池は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.722768, 141.144555, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1498', 'ghostmap.jp',
            'community-site',
            '高松の池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 144: 川内公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1500') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川内公園' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川内公園', '川内公園-zif4c2ue', '川内公園は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.797614, 132.921117, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1500', 'ghostmap.jp',
            'community-site',
            '川内公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 145: 元旅館の廃屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1502') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '元旅館の廃屋' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('元旅館の廃屋', '元旅館の廃屋-lwgfsym0', '元旅館の廃屋は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.885047, 135.698212, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1502', 'ghostmap.jp',
            'community-site',
            '元旅館の廃屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 146: 鵜の巣断崖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1504') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鵜の巣断崖' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鵜の巣断崖', '鵜の巣断崖-l373bv2f', '鵜の巣断崖は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.88864, 141.958101, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1504', 'ghostmap.jp',
            'community-site',
            '鵜の巣断崖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 147: 北海道苫小牧市にある廃墟ラブホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1508') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北海道苫小牧市にある廃墟ラブホテル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北海道苫小牧市にある廃墟ラブホテル', '北海道苫小牧市にある廃墟ラブホテル-l6sdwq5q', '北海道苫小牧市にある廃墟ラブホテルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.579511, 141.428116, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1508', 'ghostmap.jp',
            'community-site',
            '北海道苫小牧市にある廃墟ラブホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 148: 支笏湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1510') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '支笏湖' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('支笏湖', '支笏湖-1k9ygtyr', '支笏湖は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.756215, 141.326584, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1510', 'ghostmap.jp',
            'community-site',
            '支笏湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 149: 水明郷共同墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1512') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水明郷共同墓地' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水明郷共同墓地', '水明郷共同墓地-l19pj1k7', '水明郷共同墓地は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.781165, 141.444683, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1512', 'ghostmap.jp',
            'community-site',
            '水明郷共同墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 150: 藤橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1516') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '藤橋' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('藤橋', '藤橋-wny87olm', '藤橋は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.094164, 141.184737, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1516', 'ghostmap.jp',
            'community-site',
            '藤橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 151: オタモイ海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1518') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'オタモイ海岸' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('オタモイ海岸', 'オタモイ海岸-mred3zge', 'オタモイ海岸は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.229398, 140.955234, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1518', 'ghostmap.jp',
            'community-site',
            'オタモイ海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 152: 平山城址公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1522') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平山城址公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平山城址公園', '平山城址公園-lrzochps', '平山城址公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.639947, 139.381925, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1522', 'ghostmap.jp',
            'community-site',
            '平山城址公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 153: 朝日牧場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1526') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '朝日牧場' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('朝日牧場', '朝日牧場-4n156dbc', '朝日牧場は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.400149, 134.884933, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1526', 'ghostmap.jp',
            'community-site',
            '朝日牧場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 154: 旧一宮火葬場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1528') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧一宮火葬場' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧一宮火葬場', '旧一宮火葬場-376ybdqu', '旧一宮火葬場は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.049041, 134.471042, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1528', 'ghostmap.jp',
            'community-site',
            '旧一宮火葬場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 155: 犬成神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1530') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬成神社' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬成神社', '犬成神社-kb24jfi1', '犬成神社は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.493713, 140.190954, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1530', 'ghostmap.jp',
            'community-site',
            '犬成神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 156: なぎ公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1532') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'なぎ公園' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('なぎ公園', 'なぎ公園-222uznhl', 'なぎ公園は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.03384, 135.170489, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1532', 'ghostmap.jp',
            'community-site',
            'なぎ公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 157: 串崎ケープホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1534') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '串崎ケープホテル' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('串崎ケープホテル', '串崎ケープホテル-bsecwz9w', '串崎ケープホテルは、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.494483, 130.04768, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1534', 'ghostmap.jp',
            'community-site',
            '串崎ケープホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 158: 鷹の巣遊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1536') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鷹の巣遊園' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鷹の巣遊園', '鷹の巣遊園-sfkspl6h', '鷹の巣遊園は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.188384, 135.141002, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1536', 'ghostmap.jp',
            'community-site',
            '鷹の巣遊園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 159: 倉谷温泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1538') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '倉谷温泉' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('倉谷温泉', '倉谷温泉-5z070ppv', '倉谷温泉は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.302059, 135.350652, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1538', 'ghostmap.jp',
            'community-site',
            '倉谷温泉とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 160: 磔者坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1542') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '磔者坂' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('磔者坂', '磔者坂-str7yaho', '磔者坂は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.632405, 130.564494, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1542', 'ghostmap.jp',
            'community-site',
            '磔者坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 161: ホテル甚五郎
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1544') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル甚五郎' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル甚五郎', 'ホテル甚五郎-t5n7bsyy', 'ホテル甚五郎は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.357943, 134.104374, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1544', 'ghostmap.jp',
            'community-site',
            'ホテル甚五郎とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 162: 久渡寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1548') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久渡寺' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久渡寺', '久渡寺-c1vwovvi', '久渡寺は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.53983, 140.429315, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1548', 'ghostmap.jp',
            'community-site',
            '久渡寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 163: 三連蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1552') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三連蔵' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三連蔵', '三連蔵-11diyf9o', '三連蔵は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.515842, 137.825258, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1552', 'ghostmap.jp',
            'community-site',
            '三連蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 164: 満願寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1554') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '満願寺' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('満願寺', '満願寺-cp30jel1', '満願寺は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.330892, 137.819602, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1554', 'ghostmap.jp',
            'community-site',
            '満願寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 165: 陣馬形山キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1556') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '陣馬形山キャンプ場' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('陣馬形山キャンプ場', '陣馬形山キャンプ場-rsm5y41f', '陣馬形山キャンプ場は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.672498, 137.983346, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1556', 'ghostmap.jp',
            'community-site',
            '陣馬形山キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 166: 郡界トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1558') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '郡界トンネル' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('郡界トンネル', '郡界トンネル-imdtxvpx', '郡界トンネルは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.038274, 140.750111, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1558', 'ghostmap.jp',
            'community-site',
            '郡界トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 167: 葦毛崎展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1568') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '葦毛崎展望台' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('葦毛崎展望台', '葦毛崎展望台-f5ptiu29', '葦毛崎展望台は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.539039, 141.580322, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1568', 'ghostmap.jp',
            'community-site',
            '葦毛崎展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 168: 七ツ屋の高架下
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1570') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七ツ屋の高架下' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七ツ屋の高架下', '七ツ屋の高架下-s04rg3mn', '七ツ屋の高架下は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.582095, 136.651992, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1570', 'ghostmap.jp',
            'community-site',
            '七ツ屋の高架下とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 169: 観音の滝近くの歩道橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1574') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '観音の滝近くの歩道橋' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('観音の滝近くの歩道橋', '観音の滝近くの歩道橋-jq937zcs', '観音の滝近くの歩道橋は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         33.273433, 131.005201, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1574', 'ghostmap.jp',
            'community-site',
            '観音の滝近くの歩道橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 170: 花魁淵（藻南公園）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1576') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花魁淵（藻南公園）' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花魁淵（藻南公園）', '花魁淵藻南公園-7kqrz56r', '花魁淵（藻南公園）は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.984056, 141.337738, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1576', 'ghostmap.jp',
            'community-site',
            '花魁淵（藻南公園）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 171: すだもふ山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1578') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'すだもふ山荘' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('すだもふ山荘', 'すだもふ山荘-winwv7py', 'すだもふ山荘は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.235381, 131.300451, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1578', 'ghostmap.jp',
            'community-site',
            'すだもふ山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 172: 桐生川ダム（梅田湖）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1580') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桐生川ダム（梅田湖）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桐生川ダム（梅田湖）', '桐生川ダム梅田湖-upt9ekla', '桐生川ダム（梅田湖）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.473731, 139.40832, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1580', 'ghostmap.jp',
            'community-site',
            '桐生川ダム（梅田湖）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 173: 力丸ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1582') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '力丸ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('力丸ダム', '力丸ダム-qcf81hlb', '力丸ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.689267, 130.626825, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1582', 'ghostmap.jp',
            'community-site',
            '力丸ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 174: 田の上踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1584') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田の上踏切' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田の上踏切', '田の上踏切-cg7zf8y3', '田の上踏切は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.76607, 139.310243, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1584', 'ghostmap.jp',
            'community-site',
            '田の上踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 175: 佐世保市釜墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1586') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐世保市釜墓地' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐世保市釜墓地', '佐世保市釜墓地-8qxrxe1u', '佐世保市釜墓地は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.081344, 129.781949, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1586', 'ghostmap.jp',
            'community-site',
            '佐世保市釜墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 176: 大正池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1590') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大正池' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大正池', '大正池-9ga10vc0', '大正池は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.181205, 141.784104, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1590', 'ghostmap.jp',
            'community-site',
            '大正池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 177: ASAHIBEER（アサヒビール）西宮工場跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1594') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ASAHIBEER（アサヒビール）西宮工場跡地' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ASAHIBEER（アサヒビール）西宮工場跡地', 'asahibeerアサヒビール西宮工場跡地-tkoe7fl6', 'ASAHIBEER（アサヒビール）西宮工場跡地は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.737866, 135.35747, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1594', 'ghostmap.jp',
            'community-site',
            'ASAHIBEER（アサヒビール）西宮工場跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 178: 鋸山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1596') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鋸山' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鋸山', '鋸山-mowzchx8', '鋸山は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.159607, 139.834967, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1596', 'ghostmap.jp',
            'community-site',
            '鋸山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 179: 八幡岬公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1598') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八幡岬公園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八幡岬公園', '八幡岬公園-zbxibnlk', '八幡岬公園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.136054, 140.31146, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1598', 'ghostmap.jp',
            'community-site',
            '八幡岬公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 180: 刑部岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1604') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '刑部岬' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('刑部岬', '刑部岬-9ecveme2', '刑部岬は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.693413, 140.739326, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1604', 'ghostmap.jp',
            'community-site',
            '刑部岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 181: 高幡城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1608') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高幡城跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高幡城跡', '高幡城跡-i2w1gw98', '高幡城跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.660993, 139.409595, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1608', 'ghostmap.jp',
            'community-site',
            '高幡城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 182: 百草城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1610') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '百草城跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('百草城跡', '百草城跡-wzbgd9og', '百草城跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.65414, 139.426503, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1610', 'ghostmap.jp',
            'community-site',
            '百草城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 183: 五色沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1614') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五色沼' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五色沼', '五色沼-6c5b584r', '五色沼は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.65216, 140.078945, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1614', 'ghostmap.jp',
            'community-site',
            '五色沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 184: 豊田陸橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1616') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊田陸橋' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊田陸橋', '豊田陸橋-2zvqghuc', '豊田陸橋は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.656875, 139.377339, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1616', 'ghostmap.jp',
            'community-site',
            '豊田陸橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 185: みはらし公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1618') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'みはらし公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('みはらし公園', 'みはらし公園-guwyt3j2', 'みはらし公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.654361, 139.400885, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1618', 'ghostmap.jp',
            'community-site',
            'みはらし公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 186: 知覧特攻平和会館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1620') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '知覧特攻平和会館' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('知覧特攻平和会館', '知覧特攻平和会館-po6xomyl', '知覧特攻平和会館は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.363626, 130.434304, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1620', 'ghostmap.jp',
            'community-site',
            '知覧特攻平和会館とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 187: 黒岩横穴墓群
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1622') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒岩横穴墓群' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒岩横穴墓群', '黒岩横穴墓群-3u5qiscr', '黒岩横穴墓群は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.061612, 139.438805, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1622', 'ghostmap.jp',
            'community-site',
            '黒岩横穴墓群とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 188: 魔女の館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1624') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '魔女の館' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('魔女の館', '魔女の館-yiptdtyh', '魔女の館は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.271658, 132.681857, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1624', 'ghostmap.jp',
            'community-site',
            '魔女の館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 189: 沖縄陸軍病院南風原壕群20号
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1626') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '沖縄陸軍病院南風原壕群20号' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('沖縄陸軍病院南風原壕群20号', '沖縄陸軍病院南風原壕群20号-eob25a2l', '沖縄陸軍病院南風原壕群20号は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.187753, 127.732909, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1626', 'ghostmap.jp',
            'community-site',
            '沖縄陸軍病院南風原壕群20号とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 190: 上野恩賜公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1628') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上野恩賜公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上野恩賜公園', '上野恩賜公園-ceafb3a5', '上野恩賜公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.715092, 139.773795, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1628', 'ghostmap.jp',
            'community-site',
            '上野恩賜公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 191: 谷ノ上横穴墓群
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1630') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷ノ上横穴墓群' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷ノ上横穴墓群', '谷ノ上横穴墓群-n46qy4af', '谷ノ上横穴墓群は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.668828, 139.397739, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1630', 'ghostmap.jp',
            'community-site',
            '谷ノ上横穴墓群とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 192: 旧善知鳥トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1634') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧善知鳥トンネル' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧善知鳥トンネル', '旧善知鳥トンネル-n3lfmvfi', '旧善知鳥トンネルは、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.882794, 140.850858, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1634', 'ghostmap.jp',
            'community-site',
            '旧善知鳥トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 193: 岩屋寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1638') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岩屋寺' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岩屋寺', '岩屋寺-rmnogktv', '岩屋寺は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.731726, 136.914497, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1638', 'ghostmap.jp',
            'community-site',
            '岩屋寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 194: 綱取ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1640') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '綱取ダム' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('綱取ダム', '綱取ダム-l28ysaxa', '綱取ダムは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.71117, 141.205082, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1640', 'ghostmap.jp',
            'community-site',
            '綱取ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 195: 旧馬神トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1642') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧馬神トンネル' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧馬神トンネル', '旧馬神トンネル-aamckdpi', '旧馬神トンネルは、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.245417, 130.066134, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1642', 'ghostmap.jp',
            'community-site',
            '旧馬神トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 196: 北山ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1644') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北山ダム' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北山ダム', '北山ダム-2itsq4ej', '北山ダムは、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.433776, 130.244903, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1644', 'ghostmap.jp',
            'community-site',
            '北山ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 197: 鉄路犠牲者供養塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1648') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鉄路犠牲者供養塔' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鉄路犠牲者供養塔', '鉄路犠牲者供養塔-b2nu5iqx', '鉄路犠牲者供養塔は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.613085, 139.735971, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1648', 'ghostmap.jp',
            'community-site',
            '鉄路犠牲者供養塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 198: 河内ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1654') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '河内ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('河内ダム', '河内ダム-3s6eic9v', '河内ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.408746, 130.485124, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1654', 'ghostmap.jp',
            'community-site',
            '河内ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 199: 猫の目交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1656') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猫の目交差点' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猫の目交差点', '猫の目交差点-peyilhms', '猫の目交差点は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.91693, 136.777186, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1656', 'ghostmap.jp',
            'community-site',
            '猫の目交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 200: 黄泉比良坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1658') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黄泉比良坂' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黄泉比良坂', '黄泉比良坂-zmmk475m', '黄泉比良坂は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.427705, 133.16204, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1658', 'ghostmap.jp',
            'community-site',
            '黄泉比良坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 201: 宍道湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1660') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宍道湖' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宍道湖', '宍道湖-kw86iwch', '宍道湖は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.457654, 132.901095, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1660', 'ghostmap.jp',
            'community-site',
            '宍道湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 202: 桧山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1662') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桧山トンネル' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桧山トンネル', '桧山トンネル-smcm0ory', '桧山トンネルは、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.450599, 133.06851, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1662', 'ghostmap.jp',
            'community-site',
            '桧山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 203: ヴァンガード竜串
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1666') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ヴァンガード竜串' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ヴァンガード竜串', 'ヴァンガード竜串-dcl3orob', 'ヴァンガード竜串は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         32.782608, 132.845858, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1666', 'ghostmap.jp',
            'community-site',
            'ヴァンガード竜串とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 204: 浦戸大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1668') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浦戸大橋' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浦戸大橋', '浦戸大橋-v9malwiy', '浦戸大橋は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.500081, 133.567981, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1668', 'ghostmap.jp',
            'community-site',
            '浦戸大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 205: 仁淀川河口大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1672') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仁淀川河口大橋' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仁淀川河口大橋', '仁淀川河口大橋-jgji0d4e', '仁淀川河口大橋は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.46107, 133.481011, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1672', 'ghostmap.jp',
            'community-site',
            '仁淀川河口大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 206: 篠崎公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1674') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '篠崎公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('篠崎公園', '篠崎公園-mp2iixk1', '篠崎公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.715178, 139.898031, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1674', 'ghostmap.jp',
            'community-site',
            '篠崎公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 207: 桑畑橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1676') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桑畑橋' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桑畑橋', '桑畑橋-hibef4j9', '桑畑橋は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         40.291559, 141.788126, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1676', 'ghostmap.jp',
            'community-site',
            '桑畑橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 208: 関越道(みなかみ～沼田間)に佇む人影
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1680') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '関越道(みなかみ～沼田間)に佇む人影' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('関越道(みなかみ～沼田間)に佇む人影', '関越道みなかみ沼田間に佇む人影-eb8wamme', '関越道(みなかみ～沼田間)に佇む人影は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.674478, 139.028896, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1680', 'ghostmap.jp',
            'community-site',
            '関越道(みなかみ～沼田間)に佇む人影とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 209: 旧釜トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1682') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧釜トンネル' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧釜トンネル', '旧釜トンネル-h1o037ws', '旧釜トンネルは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.210503, 137.610804, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1682', 'ghostmap.jp',
            'community-site',
            '旧釜トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 210: 川越街道の花嫁
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1684') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川越街道の花嫁' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川越街道の花嫁', '川越街道の花嫁-x0pqyyph', '川越街道の花嫁は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.917909, 139.498919, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1684', 'ghostmap.jp',
            'community-site',
            '川越街道の花嫁とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 211: 神楽女湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1688') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神楽女湖' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神楽女湖', '神楽女湖-5gbi3v7y', '神楽女湖は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.255722, 131.464304, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1688', 'ghostmap.jp',
            'community-site',
            '神楽女湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 212: 総曲輪の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1690') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '総曲輪の廃墟' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('総曲輪の廃墟', '総曲輪の廃墟-a6zx5kd3', '総曲輪の廃墟は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.690233, 137.21556, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1690', 'ghostmap.jp',
            'community-site',
            '総曲輪の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 213: 千葉県立船橋県民の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1692') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千葉県立船橋県民の森' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千葉県立船橋県民の森', '千葉県立船橋県民の森-j9gi0zul', '千葉県立船橋県民の森は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.767793, 140.059274, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1692', 'ghostmap.jp',
            'community-site',
            '千葉県立船橋県民の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 214: 印旛沼公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1696') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '印旛沼公園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('印旛沼公園', '印旛沼公園-3z8mr07c', '印旛沼公園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.752111, 140.183995, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1696', 'ghostmap.jp',
            'community-site',
            '印旛沼公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 215: 野比病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1698') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野比病院' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野比病院', '野比病院-hyv7bseo', '野比病院は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.213869, 139.701588, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1698', 'ghostmap.jp',
            'community-site',
            '野比病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 216: 地蔵公園の霊道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1700') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵公園の霊道' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵公園の霊道', '地蔵公園の霊道-3f83m99q', '地蔵公園の霊道は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.732922, 135.310474, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1700', 'ghostmap.jp',
            'community-site',
            '地蔵公園の霊道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 217: 山倉ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1702') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山倉ダム' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山倉ダム', '山倉ダム-2rbuol7e', '山倉ダムは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.491139, 140.128732, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1702', 'ghostmap.jp',
            'community-site',
            '山倉ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 218: 君鴨トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1704') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '君鴨トンネル' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('君鴨トンネル', '君鴨トンネル-azwwruok', '君鴨トンネルは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.15618, 140.009162, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1704', 'ghostmap.jp',
            'community-site',
            '君鴨トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 219: 千人塚海難漁民慰霊塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1708') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千人塚海難漁民慰霊塔' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千人塚海難漁民慰霊塔', '千人塚海難漁民慰霊塔-twvoevel', '千人塚海難漁民慰霊塔は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         35.742925, 140.856013, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1708', 'ghostmap.jp',
            'community-site',
            '千人塚海難漁民慰霊塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 220: 中の島大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1710') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中の島大橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中の島大橋', '中の島大橋-u2ucon77', '中の島大橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.383662, 139.912605, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1710', 'ghostmap.jp',
            'community-site',
            '中の島大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 221: 小渋ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1712') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小渋ダム' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小渋ダム', '小渋ダム-uoro8r75', '小渋ダムは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.609833, 137.989693, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1712', 'ghostmap.jp',
            'community-site',
            '小渋ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 222: レストハウス岳見
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1714') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'レストハウス岳見' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('レストハウス岳見', 'レストハウス岳見-cdnevzff', 'レストハウス岳見は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.499543, 140.412004, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1714', 'ghostmap.jp',
            'community-site',
            'レストハウス岳見とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 223: 竹岡駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1716') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '竹岡駅' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('竹岡駅', '竹岡駅-bbmt0i9j', '竹岡駅は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.197371, 139.829884, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1716', 'ghostmap.jp',
            'community-site',
            '竹岡駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 224: メキシコ記念塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1718') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'メキシコ記念塔' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('メキシコ記念塔', 'メキシコ記念塔-4e8vby0w', 'メキシコ記念塔は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.181262, 140.367894, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1718', 'ghostmap.jp',
            'community-site',
            'メキシコ記念塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 225: 簗瀬八幡平の首塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1720') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '簗瀬八幡平の首塚' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('簗瀬八幡平の首塚', '簗瀬八幡平の首塚-t7xdqcnx', '簗瀬八幡平の首塚は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.309806, 138.858269, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1720', 'ghostmap.jp',
            'community-site',
            '簗瀬八幡平の首塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 226: 幽霊踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1724') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '幽霊踏切' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('幽霊踏切', '幽霊踏切-ca1zo5ii', '幽霊踏切は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.870579, 139.929452, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1724', 'ghostmap.jp',
            'community-site',
            '幽霊踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 227: 本栖湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1726') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本栖湖' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本栖湖', '本栖湖-2w7g14sk', '本栖湖は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.462558, 138.582487, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1726', 'ghostmap.jp',
            'community-site',
            '本栖湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 228: 神明社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1728') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神明社' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神明社', '神明社-fzz6k7ll', '神明社は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.617291, 139.125248, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1728', 'ghostmap.jp',
            'community-site',
            '神明社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 229: 韮山火葬場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1730') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '韮山火葬場跡' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('韮山火葬場跡', '韮山火葬場跡-ihc8ixue', '韮山火葬場跡は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.060769, 138.95176, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1730', 'ghostmap.jp',
            'community-site',
            '韮山火葬場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 230: 亀石峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1732') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '亀石峠' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('亀石峠', '亀石峠-nu8vzto2', '亀石峠は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.023694, 139.042417, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1732', 'ghostmap.jp',
            'community-site',
            '亀石峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 231: 環状七号線の高円寺陸橋付近
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1734') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '環状七号線の高円寺陸橋付近' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('環状七号線の高円寺陸橋付近', '環状七号線の高円寺陸橋付近-ctc7fvym', '環状七号線の高円寺陸橋付近は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.697898, 139.654638, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1734', 'ghostmap.jp',
            'community-site',
            '環状七号線の高円寺陸橋付近とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 232: 芦ノ湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1738') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '芦ノ湖' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('芦ノ湖', '芦ノ湖-2hvbccil', '芦ノ湖は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.204672, 139.007349, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1738', 'ghostmap.jp',
            'community-site',
            '芦ノ湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 233: 敷島公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1740') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '敷島公園' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('敷島公園', '敷島公園-7lzoljhs', '敷島公園は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.412718, 139.052131, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1740', 'ghostmap.jp',
            'community-site',
            '敷島公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 234: 松代象山地下壕
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1742') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松代象山地下壕' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松代象山地下壕', '松代象山地下壕-bwjmwntm', '松代象山地下壕は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.55574, 138.197247, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1742', 'ghostmap.jp',
            'community-site',
            '松代象山地下壕とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 235: 日置市城山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1744') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日置市城山公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日置市城山公園', '日置市城山公園-2fzkaz5i', '日置市城山公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.629578, 130.389347, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1744', 'ghostmap.jp',
            'community-site',
            '日置市城山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 236: 金輪島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1746') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金輪島' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金輪島', '金輪島-vzicxavh', '金輪島は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.338424, 132.483641, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1746', 'ghostmap.jp',
            'community-site',
            '金輪島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 237: 山本園大谷グランドセンター（大谷グランドホテル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1748') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山本園大谷グランドセンター（大谷グランドホテル）' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山本園大谷グランドセンター（大谷グランドホテル）', '山本園大谷グランドセンター大谷グランドホテル-n1aj9iv3', '山本園大谷グランドセンター（大谷グランドホテル）は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.596503, 139.818279, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1748', 'ghostmap.jp',
            'community-site',
            '山本園大谷グランドセンター（大谷グランドホテル）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 238: 松戸市斎場前の道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1750') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松戸市斎場前の道' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松戸市斎場前の道', '松戸市斎場前の道-a1wd7coo', '松戸市斎場前の道は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.785071, 139.957492, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1750', 'ghostmap.jp',
            'community-site',
            '松戸市斎場前の道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 239: 鮎屋の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1752') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鮎屋の滝' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鮎屋の滝', '鮎屋の滝-e5g1dctw', '鮎屋の滝は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.302621, 134.843665, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1752', 'ghostmap.jp',
            'community-site',
            '鮎屋の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 240: 奥只見シルバーライン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1754') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '奥只見シルバーライン' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('奥只見シルバーライン', '奥只見シルバーライン-3foofvwn', '奥只見シルバーラインは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.16808, 139.145708, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1754', 'ghostmap.jp',
            'community-site',
            '奥只見シルバーラインとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 241: 月光の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1756') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '月光の滝' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('月光の滝', '月光の滝-v15h3jan', '月光の滝は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.824072, 140.893822, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1756', 'ghostmap.jp',
            'community-site',
            '月光の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 242: 眼鏡橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1758') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '眼鏡橋' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('眼鏡橋', '眼鏡橋-p7bzd8tm', '眼鏡橋は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.747146, 129.880098, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1758', 'ghostmap.jp',
            'community-site',
            '眼鏡橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 243: 二度上峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1760') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '二度上峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('二度上峠', '二度上峠-63n4ieqd', '二度上峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.43574, 138.643408, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1760', 'ghostmap.jp',
            'community-site',
            '二度上峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 244: 南酒々井のお化けトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1762') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南酒々井のお化けトンネル' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南酒々井のお化けトンネル', '南酒井のお化けトンネル-lho7arqv', '南酒々井のお化けトンネルは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.699787, 140.263467, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1762', 'ghostmap.jp',
            'community-site',
            '南酒々井のお化けトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 245: 岳集落
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1764') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岳集落' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岳集落', '岳集落-c50dkizu', '岳集落は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         35.938573, 139.066111, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1764', 'ghostmap.jp',
            'community-site',
            '岳集落とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 246: 高野山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1766') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高野山公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高野山公園', '高野山公園-5wg5itzk', '高野山公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         32.041986, 130.314674, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1766', 'ghostmap.jp',
            'community-site',
            '高野山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 247: オホーツク庭園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1768') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'オホーツク庭園' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('オホーツク庭園', 'オホーツク庭園-j7kc9ubm', 'オホーツク庭園は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         44.355631, 143.346766, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1768', 'ghostmap.jp',
            'community-site',
            'オホーツク庭園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 248: 父母トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1770') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '父母トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('父母トンネル', '父母トンネル-3mwkhovu', '父母トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.082908, 138.764732, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1770', 'ghostmap.jp',
            'community-site',
            '父母トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 249: 旧鐘ヶ坂トンネル(明治のトンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1772') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧鐘ヶ坂トンネル(明治のトンネル）' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧鐘ヶ坂トンネル(明治のトンネル）', '旧鐘ヶ坂トンネル明治のトンネル-hvx1ti7p', '旧鐘ヶ坂トンネル(明治のトンネル）は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.120058, 135.119938, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1772', 'ghostmap.jp',
            'community-site',
            '旧鐘ヶ坂トンネル(明治のトンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 250: 戦場ヶ原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1774') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '戦場ヶ原' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('戦場ヶ原', '戦場ヶ原-522pzytq', '戦場ヶ原は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.777255, 139.444313, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1774', 'ghostmap.jp',
            'community-site',
            '戦場ヶ原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 251: 蘇我陸橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1778') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '蘇我陸橋' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('蘇我陸橋', '蘇我陸橋-tq914mbt', '蘇我陸橋は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.566005, 140.129685, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1778', 'ghostmap.jp',
            'community-site',
            '蘇我陸橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 252: 乙丸陸橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1780') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '乙丸陸橋' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('乙丸陸橋', '乙丸陸橋-0wpstd9v', '乙丸陸橋は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.58679, 136.663293, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1780', 'ghostmap.jp',
            'community-site',
            '乙丸陸橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 253: 愛宕山の裏山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1782') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '愛宕山の裏山' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('愛宕山の裏山', '愛宕山の裏山-vt1ddlnm', '愛宕山の裏山は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.713162, 141.161485, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1782', 'ghostmap.jp',
            'community-site',
            '愛宕山の裏山とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 254: 県立三ツ池公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1786') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '県立三ツ池公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('県立三ツ池公園', '県立三ツ池公園-0syspu8g', '県立三ツ池公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.522744, 139.660971, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1786', 'ghostmap.jp',
            'community-site',
            '県立三ツ池公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 255: おぼない旅館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1788') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おぼない旅館' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おぼない旅館', 'おぼない旅館-hccyd7ma', 'おぼない旅館は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         40.321029, 141.317722, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1788', 'ghostmap.jp',
            'community-site',
            'おぼない旅館とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 256: 南昌第一トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1792') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南昌第一トンネル' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南昌第一トンネル', '南昌第一トンネル-gkkrubps', '南昌第一トンネルは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.631623, 141.053891, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1792', 'ghostmap.jp',
            'community-site',
            '南昌第一トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 257: ほまれや公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1794') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ほまれや公園' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ほまれや公園', 'ほまれや公園-mgo1wfeh', 'ほまれや公園は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.790896, 141.153814, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1794', 'ghostmap.jp',
            'community-site',
            'ほまれや公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 258: 大庭神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1796') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大庭神社' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大庭神社', '大庭神社-8gbxj7kd', '大庭神社は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.360479, 139.458507, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1796', 'ghostmap.jp',
            'community-site',
            '大庭神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 259: 田上山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1800') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田上山' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田上山', '田上山-ciqsntgq', '田上山は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.927753, 135.946749, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1800', 'ghostmap.jp',
            'community-site',
            '田上山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 260: 越谷レイクタウン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1802') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '越谷レイクタウン' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('越谷レイクタウン', '越谷レイクタウン-0bd0orya', '越谷レイクタウンは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.877802, 139.824586, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1802', 'ghostmap.jp',
            'community-site',
            '越谷レイクタウンとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 261: 天理トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1804') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天理トンネル' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天理トンネル', '天理トンネル-gk9jm473', '天理トンネルは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.594326, 135.856621, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1804', 'ghostmap.jp',
            'community-site',
            '天理トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 262: 民宿とおの
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1806') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '民宿とおの' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('民宿とおの', '民宿とおの-951nma25', '民宿とおのは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.333314, 141.531233, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1806', 'ghostmap.jp',
            'community-site',
            '民宿とおのとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 263: 亀山公園（日隈神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1808') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '亀山公園（日隈神社）' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('亀山公園（日隈神社）', '亀山公園日隈神社-smm6h9th', '亀山公園（日隈神社）は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         33.314481, 130.928621, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1808', 'ghostmap.jp',
            'community-site',
            '亀山公園（日隈神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 264: 阿蘇観光ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1810') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿蘇観光ホテル' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿蘇観光ホテル', '阿蘇観光ホテル-bbcwf2aw', '阿蘇観光ホテルは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.880243, 131.031247, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1810', 'ghostmap.jp',
            'community-site',
            '阿蘇観光ホテルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 265: 内大臣橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1812') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内大臣橋' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内大臣橋', '内大臣橋-z3yt1wrf', '内大臣橋は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.639296, 130.9748, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1812', 'ghostmap.jp',
            'community-site',
            '内大臣橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 266: 緑川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1814') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑川ダム' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑川ダム', '緑川ダム-cvit4sqr', '緑川ダムは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.628919, 130.91069, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1814', 'ghostmap.jp',
            'community-site',
            '緑川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 267: 仙元山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1816') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仙元山' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仙元山', '仙元山-ft4yotc0', '仙元山は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.178156, 139.269413, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1816', 'ghostmap.jp',
            'community-site',
            '仙元山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 268: 西湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1818') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西湖' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西湖', '西湖-2w6mxsq0', '西湖は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.499157, 138.687443, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1818', 'ghostmap.jp',
            'community-site',
            '西湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 269: 桂橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1820') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桂橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桂橋', '桂橋-txye0jxe', '桂橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.610264, 139.216026, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1820', 'ghostmap.jp',
            'community-site',
            '桂橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 270: 袋田の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1822') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '袋田の滝' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('袋田の滝', '袋田の滝-ty8rwyk6', '袋田の滝は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.764604, 140.407162, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1822', 'ghostmap.jp',
            'community-site',
            '袋田の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 271: 渋井町緑地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1824') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '渋井町緑地' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('渋井町緑地', '渋井町緑地-p7b3dlzg', '渋井町緑地は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.359237, 140.512712, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1824', 'ghostmap.jp',
            'community-site',
            '渋井町緑地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 272: 鬼怒砂丘慰霊塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1826') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鬼怒砂丘慰霊塔' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鬼怒砂丘慰霊塔', '鬼怒砂丘慰霊塔-7bpwya75', '鬼怒砂丘慰霊塔は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.132156, 139.957023, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1826', 'ghostmap.jp',
            'community-site',
            '鬼怒砂丘慰霊塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 273: 日奈久・坂本線
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1828') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日奈久・坂本線' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日奈久・坂本線', '日奈久・坂本線-yluns9nx', '日奈久・坂本線は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.434148, 130.581353, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1828', 'ghostmap.jp',
            'community-site',
            '日奈久・坂本線とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 274: 有佐貝塚　大塚古墳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1830') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '有佐貝塚　大塚古墳' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('有佐貝塚　大塚古墳', '有佐貝塚-大塚古墳-fhbd6fk6', '有佐貝塚　大塚古墳は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.55586, 130.663758, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1830', 'ghostmap.jp',
            'community-site',
            '有佐貝塚　大塚古墳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 275: 半田沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1832') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '半田沼' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('半田沼', '半田沼-al6urfeu', '半田沼は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.879908, 140.497554, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1832', 'ghostmap.jp',
            'community-site',
            '半田沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 276: 甲山墓園 公衆トイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1834') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '甲山墓園 公衆トイレ' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('甲山墓園 公衆トイレ', '甲山墓園-公衆トイレ-q8bxhb7s', '甲山墓園 公衆トイレは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.775072, 135.322058, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1834', 'ghostmap.jp',
            'community-site',
            '甲山墓園 公衆トイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 277: パチンコ新天地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1838') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'パチンコ新天地' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('パチンコ新天地', 'パチンコ新天地-2jzv1ur0', 'パチンコ新天地は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.580526, 138.050428, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1838', 'ghostmap.jp',
            'community-site',
            'パチンコ新天地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 278: 弁天山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1840') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弁天山' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弁天山', '弁天山-ib811dlo', '弁天山は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.742731, 140.471192, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1840', 'ghostmap.jp',
            'community-site',
            '弁天山とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 279: 桔梗城跡（城山公園）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1842') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桔梗城跡（城山公園）' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桔梗城跡（城山公園）', '桔梗城跡城山公園-fcj9gcgc', '桔梗城跡（城山公園）は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.536735, 140.18559, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1842', 'ghostmap.jp',
            'community-site',
            '桔梗城跡（城山公園）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 280: 岩山パークランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1844') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岩山パークランド' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岩山パークランド', '岩山パークランド-iozfsz0i', '岩山パークランドは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.701211, 141.191654, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1844', 'ghostmap.jp',
            'community-site',
            '岩山パークランドとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 281: タガマヤ村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1846') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'タガマヤ村' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('タガマヤ村', 'タガマヤ村-ws9etlsb', 'タガマヤ村は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.327013, 140.255327, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1846', 'ghostmap.jp',
            'community-site',
            'タガマヤ村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 282: 霊道真っ只中ビル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1848') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '霊道真っ只中ビル' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('霊道真っ只中ビル', '霊道真っ只中ビル-5bium0y0', '霊道真っ只中ビルは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.731646, 139.765676, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1848', 'ghostmap.jp',
            'community-site',
            '霊道真っ只中ビルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 283: 朱鞠内湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1850') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '朱鞠内湖' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('朱鞠内湖', '朱鞠内湖-9grxmttb', '朱鞠内湖は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         44.31661, 142.206387, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1850', 'ghostmap.jp',
            'community-site',
            '朱鞠内湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 284: 灰ヶ峰
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1852') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '灰ヶ峰' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('灰ヶ峰', '灰ヶ峰-7p8vbkud', '灰ヶ峰は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.269939, 132.593442, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1852', 'ghostmap.jp',
            'community-site',
            '灰ヶ峰とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 285: 山の上展望公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1854') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山の上展望公園' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山の上展望公園', '山の上展望公園-7lx9gdxj', '山の上展望公園は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.883341, 130.560095, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1854', 'ghostmap.jp',
            'community-site',
            '山の上展望公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 286: 石塘橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1856') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '石塘橋' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('石塘橋', '石塘橋-15q0sljq', '石塘橋は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.882751, 130.564232, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1856', 'ghostmap.jp',
            'community-site',
            '石塘橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 287: 新堀橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1858') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新堀橋' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新堀橋', '新堀橋-p7y2a4jy', '新堀橋は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.809868, 130.704359, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1858', 'ghostmap.jp',
            'community-site',
            '新堀橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 288: 榛名湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1862') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '榛名湖' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('榛名湖', '榛名湖-t5t50z2u', '榛名湖は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.473607, 138.866313, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1862', 'ghostmap.jp',
            'community-site',
            '榛名湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 289: 旧熊ノ平駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1864') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧熊ノ平駅' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧熊ノ平駅', '旧熊ノ平駅-6owoluvz', '旧熊ノ平駅は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.355573, 138.685344, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1864', 'ghostmap.jp',
            'community-site',
            '旧熊ノ平駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 290: 栗山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1866') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '栗山公園' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('栗山公園', '栗山公園-6j9x2j7t', '栗山公園は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.065251, 141.779938, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1866', 'ghostmap.jp',
            'community-site',
            '栗山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 291: 裏摩周湖展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1870') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '裏摩周湖展望台' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('裏摩周湖展望台', '裏摩周湖展望台-h46764vb', '裏摩周湖展望台は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.600362, 144.570765, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1870', 'ghostmap.jp',
            'community-site',
            '裏摩周湖展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 292: 養源院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1872') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '養源院' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('養源院', '養源院-d2jk7r5i', '養源院は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.987829, 135.773624, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1872', 'ghostmap.jp',
            'community-site',
            '養源院とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 293: 足羽山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1876') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '足羽山' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('足羽山', '足羽山-whfnjrj7', '足羽山は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.0531, 136.204, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1876', 'ghostmap.jp',
            'community-site',
            '足羽山とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 294: 仏原ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1878') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仏原ダム' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仏原ダム', '仏原ダム-c427dydp', '仏原ダムは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.95251, 136.622902, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1878', 'ghostmap.jp',
            'community-site',
            '仏原ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 295: 船上山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1880') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '船上山' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('船上山', '船上山-abf945os', '船上山は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.431582, 133.598213, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1880', 'ghostmap.jp',
            'community-site',
            '船上山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 296: いこいの踏切跡（大成第五踏切）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1882') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'いこいの踏切跡（大成第五踏切）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('いこいの踏切跡（大成第五踏切）', 'いこいの踏切跡大成第五踏切-py4uzduo', 'いこいの踏切跡（大成第五踏切）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.930907, 139.614305, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1882', 'ghostmap.jp',
            'community-site',
            'いこいの踏切跡（大成第五踏切）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 297: 百谷ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1884') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '百谷ダム' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('百谷ダム', '百谷ダム-cpwm2gdc', '百谷ダムは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.511234, 134.272645, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1884', 'ghostmap.jp',
            'community-site',
            '百谷ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 298: 愛宕山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1886') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '愛宕山' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('愛宕山', '愛宕山-hbnzcmhg', '愛宕山は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         32.5621, 131.6696, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1886', 'ghostmap.jp',
            'community-site',
            '愛宕山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 299: 3本イチョウの木
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1892') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '3本イチョウの木' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('3本イチョウの木', '3本イチョウの木-ab1unodf', '3本イチョウの木は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.7816, 130.7179, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1892', 'ghostmap.jp',
            'community-site',
            '3本イチョウの木とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 300: 関の山いこいの森キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1894') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '関の山いこいの森キャンプ場' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('関の山いこいの森キャンプ場', '関の山いこいの森キャンプ場-9p2sqzaz', '関の山いこいの森キャンプ場は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.634124, 130.740805, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1894', 'ghostmap.jp',
            'community-site',
            '関の山いこいの森キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 301: 油木ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1896') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '油木ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('油木ダム', '油木ダム-4f6o3m05', '油木ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.545965, 130.899178, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1896', 'ghostmap.jp',
            'community-site',
            '油木ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 302: 合所ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1900') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '合所ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('合所ダム', '合所ダム-phgm2djk', '合所ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.305068, 130.800791, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1900', 'ghostmap.jp',
            'community-site',
            '合所ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 303: 山中越え
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1902') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山中越え' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山中越え', '山中越え-a07fic7w', '山中越えは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.040402, 135.814529, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1902', 'ghostmap.jp',
            'community-site',
            '山中越えとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 304: 照葉大吊橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1904') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '照葉大吊橋' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('照葉大吊橋', '照葉大吊橋-lt4bwxgd', '照葉大吊橋は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.028744, 131.194267, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1904', 'ghostmap.jp',
            'community-site',
            '照葉大吊橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 305: 青土ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1906') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青土ダム' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青土ダム', '青土ダム-xgpfe4fy', '青土ダムは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.956096, 136.303912, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1906', 'ghostmap.jp',
            'community-site',
            '青土ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 306: 能取港の電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1910') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '能取港の電話ボックス' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('能取港の電話ボックス', '能取港の電話ボックス-7gadm6nv', '能取港の電話ボックスは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         44.0397, 144.1811, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1910', 'ghostmap.jp',
            'community-site',
            '能取港の電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 307: 秋月隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1924') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋月隧道' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋月隧道', '秋月隧道-df20sva6', '秋月隧道は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.485428, 130.674963, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1924', 'ghostmap.jp',
            'community-site',
            '秋月隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 308: 滝沢展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1926') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝沢展望台' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝沢展望台', '滝沢展望台-ryiz7dai', '滝沢展望台は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.862518, 137.714653, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1926', 'ghostmap.jp',
            'community-site',
            '滝沢展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 309: 見分森公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1930') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '見分森公園' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('見分森公園', '見分森公園-teacdvj2', '見分森公園は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.120339, 141.103249, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1930', 'ghostmap.jp',
            'community-site',
            '見分森公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 310: 444ポスト
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1934') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '444ポスト' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('444ポスト', '444ポスト-8aluimkh', '444ポストは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.124587, 141.118457, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1934', 'ghostmap.jp',
            'community-site',
            '444ポストとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 311: 地獄の姫
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1936') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地獄の姫' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地獄の姫', '地獄の姫-8srlzs7b', '地獄の姫は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.58128, 137.611656, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1936', 'ghostmap.jp',
            'community-site',
            '地獄の姫とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 312: 木村産婦人科
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1938') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '木村産婦人科' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('木村産婦人科', '木村産婦人科-6f03hum5', '木村産婦人科は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.554964, 141.171085, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1938', 'ghostmap.jp',
            'community-site',
            '木村産婦人科とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 313: 開陽台展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1940') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '開陽台展望台' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('開陽台展望台', '開陽台展望台-yj4gw1ln', '開陽台展望台は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.618781, 144.866703, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1940', 'ghostmap.jp',
            'community-site',
            '開陽台展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 314: 雄島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1944') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雄島' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雄島', '雄島-982f41dl', '雄島は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.251029, 136.118592, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1944', 'ghostmap.jp',
            'community-site',
            '雄島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 315: 戸塚森森林公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1948') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '戸塚森森林公園' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('戸塚森森林公園', '戸塚森森林公園-2o7kriai', '戸塚森森林公園は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.471649, 141.183629, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1948', 'ghostmap.jp',
            'community-site',
            '戸塚森森林公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 316: 秋葉ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1952') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋葉ダム' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋葉ダム', '秋葉ダム-l36solxg', '秋葉ダムは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.9724, 137.828, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1952', 'ghostmap.jp',
            'community-site',
            '秋葉ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 317: ジャガラモガラ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1960') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ジャガラモガラ' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ジャガラモガラ', 'ジャガラモガラ-c8qseuay', 'ジャガラモガラは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.345353, 140.435901, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1960', 'ghostmap.jp',
            'community-site',
            'ジャガラモガラとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 318: 金鶏山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1962') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金鶏山' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金鶏山', '金鶏山-p6jfej9r', '金鶏山は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         38.988231, 141.109488, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1962', 'ghostmap.jp',
            'community-site',
            '金鶏山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 319: いもんた（知行寺山稲荷大権現）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1968') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'いもんた（知行寺山稲荷大権現）' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('いもんた（知行寺山稲荷大権現）', 'いもんた知行寺山稲荷大権現-1d8qkcf4', 'いもんた（知行寺山稲荷大権現）は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.129603, 133.743116, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1968', 'ghostmap.jp',
            'community-site',
            'いもんた（知行寺山稲荷大権現）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 320: 正木ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1970') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正木ダム' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正木ダム', '正木ダム-h1v9v1nz', '正木ダムは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.90803, 134.424623, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1970', 'ghostmap.jp',
            'community-site',
            '正木ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 321: 犬のシミが浮き出た壁
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1972') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬のシミが浮き出た壁' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬のシミが浮き出た壁', '犬のシミが浮き出た壁-lsrfp2ww', '犬のシミが浮き出た壁は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.64327, 139.63922, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1972', 'ghostmap.jp',
            'community-site',
            '犬のシミが浮き出た壁とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 322: 苦竹インター歩行者専用トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1974') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '苦竹インター歩行者専用トンネル' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('苦竹インター歩行者専用トンネル', '苦竹インター歩行者専用トンネル-fwxtx3wj', '苦竹インター歩行者専用トンネルは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.2683, 140.9384, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1974', 'ghostmap.jp',
            'community-site',
            '苦竹インター歩行者専用トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 323: 田沢湖スポーツセンター
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1978') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田沢湖スポーツセンター' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田沢湖スポーツセンター', '田沢湖スポーツセンター-1jeydlu8', '田沢湖スポーツセンターは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.759909, 140.759209, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1978', 'ghostmap.jp',
            'community-site',
            '田沢湖スポーツセンターとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 324: 大神楽２号トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1982') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大神楽２号トンネル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大神楽２号トンネル', '大神楽2号トンネル-kpgpg4a4', '大神楽２号トンネルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         36.057044, 138.712867, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1982', 'ghostmap.jp',
            'community-site',
            '大神楽２号トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 325: 松園のお化け屋敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1992') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松園のお化け屋敷' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松園のお化け屋敷', '松園のお化け屋敷-ziuasqhx', '松園のお化け屋敷は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.747546, 141.167075, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1992', 'ghostmap.jp',
            'community-site',
            '松園のお化け屋敷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 326: 厨川の鉄道の真上にある橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1994') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '厨川の鉄道の真上にある橋' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('厨川の鉄道の真上にある橋', '厨川の鉄道の真上にある橋-vvr37nvt', '厨川の鉄道の真上にある橋は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.751109, 141.132541, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1994', 'ghostmap.jp',
            'community-site',
            '厨川の鉄道の真上にある橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 327: 旧北陸トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1996') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧北陸トンネル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧北陸トンネル', '旧北陸トンネル-v33yscp3', '旧北陸トンネルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.662631, 136.10629, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1996', 'ghostmap.jp',
            'community-site',
            '旧北陸トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;
end$$;

-- 統計再計算
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;