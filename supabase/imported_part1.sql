-- =====================================================
-- shinrei: imported via scripts/import-spots.ts
-- generated: 2026-05-23T15:15:11.715Z
-- rows: 329
-- 取得元は内部 sources にのみ保存、公開画面には出ません
-- =====================================================

-- 1) spots を挿入（重複は ON CONFLICT で回避）
do $$
declare
  new_spot_id uuid;
begin

  -- 1: 平和の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平和の滝' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平和の滝', '平和の滝-oc8isl2x', '平和の滝は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.053935, 141.221496, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1', 'ghostmap.jp',
            'community-site',
            '平和の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 2: 十和田湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=3') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十和田湖' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十和田湖', '十和田湖-o183kcrx', '十和田湖は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.42045, 140.87381, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=3', 'ghostmap.jp',
            'community-site',
            '十和田湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 3: 雫石・慰霊の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雫石・慰霊の森' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雫石・慰霊の森', '雫石・慰霊の森-g11fyunv', '雫石・慰霊の森は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.657071, 141.001902, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5', 'ghostmap.jp',
            'community-site',
            '雫石・慰霊の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 4: 七ヶ宿ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七ヶ宿ダム' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七ヶ宿ダム', '七ヶ宿ダム-62vabbxf', '七ヶ宿ダムは、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.971163, 140.504716, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7', 'ghostmap.jp',
            'community-site',
            '七ヶ宿ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 5: 梅林園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=9') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '梅林園' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('梅林園', '梅林園-adosuh7a', '梅林園は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.655491, 140.082839, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=9', 'ghostmap.jp',
            'community-site',
            '梅林園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 6: 新庄厚生病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=11') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新庄厚生病院' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新庄厚生病院', '新庄厚生病院-zbbb1aut', '新庄厚生病院は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.74071, 140.310324, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=11', 'ghostmap.jp',
            'community-site',
            '新庄厚生病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 7: 千駄ヶ谷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=13') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千駄ヶ谷トンネル' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千駄ヶ谷トンネル', '千駄ヶ谷トンネル-3shz98ft', '千駄ヶ谷トンネルは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.675402, 139.711648, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=13', 'ghostmap.jp',
            'community-site',
            '千駄ヶ谷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 8: 久木踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=15') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久木踏切' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久木踏切', '久木踏切-0sus5n15', '久木踏切は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.305811, 139.56848, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=15', 'ghostmap.jp',
            'community-site',
            '久木踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 9: 須花トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=17') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '須花トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('須花トンネル', '須花トンネル-zkagm4zc', '須花トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.399329, 139.488602, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=17', 'ghostmap.jp',
            'community-site',
            '須花トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 10: 人穴
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=21') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人穴' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人穴', '人穴-ooiq8r2p', '人穴は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.361619, 138.591083, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=21', 'ghostmap.jp',
            'community-site',
            '人穴とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 11: 花魁淵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=23') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花魁淵' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花魁淵', '花魁淵-pnkr73am', '花魁淵は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.807645, 138.856344, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=23', 'ghostmap.jp',
            'community-site',
            '花魁淵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 12: 人肉館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=25') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人肉館' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人肉館', '人肉館-w3jk36tx', '人肉館は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.268858, 137.98914, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=25', 'ghostmap.jp',
            'community-site',
            '人肉館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 13: 21世紀の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=27') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '21世紀の森' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('21世紀の森', '21世紀の森-uarvx4vb', '21世紀の森は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.238444, 131.461114, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=27', 'ghostmap.jp',
            'community-site',
            '21世紀の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 14: 西海橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=29') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西海橋' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西海橋', '西海橋-ppfo1fbn', '西海橋は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.053855, 129.758548, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=29', 'ghostmap.jp',
            'community-site',
            '西海橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 15: 七ツ釜
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=31') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七ツ釜' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七ツ釜', '七ツ釜-0h4zq97a', '七ツ釜は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.549073, 129.93302, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=31', 'ghostmap.jp',
            'community-site',
            '七ツ釜とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 16: 阿蘇大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=33') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿蘇大橋' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿蘇大橋', '阿蘇大橋-jtej8wfi', '阿蘇大橋は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.883562, 130.98861, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=33', 'ghostmap.jp',
            'community-site',
            '阿蘇大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 17: ザビエル公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=35') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ザビエル公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ザビエル公園', 'ザビエル公園-txheuyex', 'ザビエル公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.591186, 130.551253, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=35', 'ghostmap.jp',
            'community-site',
            'ザビエル公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 18: 英彦山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=37') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '英彦山' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('英彦山', '英彦山-yfhx56wo', '英彦山は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.47579, 130.924234, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=37', 'ghostmap.jp',
            'community-site',
            '英彦山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 19: 別大国道（手招き地蔵）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=39') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '別大国道（手招き地蔵）' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('別大国道（手招き地蔵）', '別大国道手招き地蔵-g8wxngvp', '別大国道（手招き地蔵）は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.256928, 131.552412, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=39', 'ghostmap.jp',
            'community-site',
            '別大国道（手招き地蔵）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 20: 藤宮神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=41') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '藤宮神社' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('藤宮神社', '藤宮神社-ui5i2qfl', '藤宮神社は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.589357, 133.61907, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=41', 'ghostmap.jp',
            'community-site',
            '藤宮神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 21: 三坂峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=43') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三坂峠' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三坂峠', '三坂峠-sm9suqnv', '三坂峠は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.707684, 132.86044, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=43', 'ghostmap.jp',
            'community-site',
            '三坂峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 22: 足摺岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=45') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '足摺岬' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('足摺岬', '足摺岬-dzolc2tb', '足摺岬は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         32.723317, 133.020715, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=45', 'ghostmap.jp',
            'community-site',
            '足摺岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 23: 松原公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=47') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松原公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松原公園', '松原公園-fdhy0ofq', '松原公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.946302, 139.614923, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=47', 'ghostmap.jp',
            'community-site',
            '松原公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 24: 坪野鉱泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=49') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '坪野鉱泉' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('坪野鉱泉', '坪野鉱泉-zhqyb6v6', '坪野鉱泉は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.77711, 137.4578, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=49', 'ghostmap.jp',
            'community-site',
            '坪野鉱泉とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 25: 白倉トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=51') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白倉トンネル' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白倉トンネル', '白倉トンネル-u7hko2hm', '白倉トンネルは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.748171, 137.430321, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=51', 'ghostmap.jp',
            'community-site',
            '白倉トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 26: おばけ階段
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=53') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おばけ階段' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おばけ階段', 'おばけ階段-bevmotih', 'おばけ階段は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.718516, 139.762252, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=53', 'ghostmap.jp',
            'community-site',
            'おばけ階段とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 27: 旧東山トンネル（花山トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=55') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧東山トンネル（花山トンネル）' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧東山トンネル（花山トンネル）', '旧東山トンネル花山トンネル-mzh3rt4s', '旧東山トンネル（花山トンネル）は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.989657, 135.790642, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=55', 'ghostmap.jp',
            'community-site',
            '旧東山トンネル（花山トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 28: 船岡山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=57') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '船岡山' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('船岡山', '船岡山-5sic5lki', '船岡山は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.039518, 135.74221, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=57', 'ghostmap.jp',
            'community-site',
            '船岡山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 29: 野間トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=59') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野間トンネル' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野間トンネル', '野間トンネル-dmup9yt5', '野間トンネルは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.933714, 135.475955, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=59', 'ghostmap.jp',
            'community-site',
            '野間トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 30: 滝畑第三トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=61') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝畑第三トンネル' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝畑第三トンネル', '滝畑第三トンネル-0mx962o1', '滝畑第三トンネルは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.399394, 135.520932, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=61', 'ghostmap.jp',
            'community-site',
            '滝畑第三トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 31: 廃養護学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=63') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '廃養護学校' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('廃養護学校', '廃養護学校-wo07b6a5', '廃養護学校は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.412004, 135.37252, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=63', 'ghostmap.jp',
            'community-site',
            '廃養護学校とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 32: 雄別炭鉱（釧路炭鉱）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=65') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雄別炭鉱（釧路炭鉱）' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雄別炭鉱（釧路炭鉱）', '雄別炭鉱釧路炭鉱-ojglmr3b', '雄別炭鉱（釧路炭鉱）は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.224885, 144.075283, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=65', 'ghostmap.jp',
            'community-site',
            '雄別炭鉱（釧路炭鉱）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 33: リバーサイド病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=67') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'リバーサイド病院' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('リバーサイド病院', 'リバーサイド病院-uebxqmn4', 'リバーサイド病院は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.597178, 135.474098, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=67', 'ghostmap.jp',
            'community-site',
            'リバーサイド病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 34: 旧柳ヶ瀬トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=69') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧柳ヶ瀬トンネル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧柳ヶ瀬トンネル', '旧柳ヶ瀬トンネル-yv6ju3me', '旧柳ヶ瀬トンネルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.60422, 136.17257, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=69', 'ghostmap.jp',
            'community-site',
            '旧柳ヶ瀬トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 35: 白高大神
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=71') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白高大神' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白高大神', '白高大神-hn9g8uq2', '白高大神は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.661561, 135.744395, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=71', 'ghostmap.jp',
            'community-site',
            '白高大神とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 36: 御霊櫃峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=73') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御霊櫃峠' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御霊櫃峠', '御霊櫃峠-nhck3s8w', '御霊櫃峠は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.432542, 140.201874, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=73', 'ghostmap.jp',
            'community-site',
            '御霊櫃峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 37: 鈴が森刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=77') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鈴が森刑場跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鈴が森刑場跡', '鈴が森刑場跡-dm1v2ha0', '鈴が森刑場跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.591633, 139.736462, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=77', 'ghostmap.jp',
            'community-site',
            '鈴が森刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 38: 江北橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=79') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '江北橋' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('江北橋', '江北橋-8li4t190', '江北橋は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.763634, 139.761155, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=79', 'ghostmap.jp',
            'community-site',
            '江北橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 39: 熊走大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=81') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '熊走大橋' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('熊走大橋', '熊走大橋-mcg8n39e', '熊走大橋は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.478368, 136.726774, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=81', 'ghostmap.jp',
            'community-site',
            '熊走大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 40: 朝鮮トンネル（二股トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=83') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '朝鮮トンネル（二股トンネル）' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('朝鮮トンネル（二股トンネル）', '朝鮮トンネル二股トンネル-qyyx46ro', '朝鮮トンネル（二股トンネル）は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.472377, 137.222396, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=83', 'ghostmap.jp',
            'community-site',
            '朝鮮トンネル（二股トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 41: 城南工業高校跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=85') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '城南工業高校跡地' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('城南工業高校跡地', '城南工業高校跡地-t3cgitmf', '城南工業高校跡地は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.056603, 134.556535, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=85', 'ghostmap.jp',
            'community-site',
            '城南工業高校跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 42: 西部公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=87') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西部公園' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西部公園', '西部公園-4576dg56', '西部公園は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.069268, 134.51348, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=87', 'ghostmap.jp',
            'community-site',
            '西部公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 43: 静山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=89') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '静山荘' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('静山荘', '静山荘-lf1l46o1', '静山荘は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.52633, 134.231858, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=89', 'ghostmap.jp',
            'community-site',
            '静山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 44: 達磨神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=91') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '達磨神社' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('達磨神社', '達磨神社-3jyl5zae', '達磨神社は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.772839, 140.057783, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=91', 'ghostmap.jp',
            'community-site',
            '達磨神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 45: 宮中（鷹ノ巣）ダムの上のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=95') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮中（鷹ノ巣）ダムの上のトンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮中（鷹ノ巣）ダムの上のトンネル', '宮中鷹ノ巣ダムの上のトンネル-4nt9tls3', '宮中（鷹ノ巣）ダムの上のトンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.068642, 138.696276, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=95', 'ghostmap.jp',
            'community-site',
            '宮中（鷹ノ巣）ダムの上のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 46: 淡嶋神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=97') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '淡嶋神社' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('淡嶋神社', '淡嶋神社-pepk6175', '淡嶋神社は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.273619, 135.066471, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=97', 'ghostmap.jp',
            'community-site',
            '淡嶋神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 47: 旧無患子トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=99') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧無患子トンネル' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧無患子トンネル', '旧無患子トンネル-2716g0gm', '旧無患子トンネルは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.411975, 136.548214, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=99', 'ghostmap.jp',
            'community-site',
            '旧無患子トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 48: 旧四十九院トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=101') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧四十九院トンネル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧四十九院トンネル', '旧四十九院トンネル-pj01cagd', '旧四十九院トンネルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.251251, 136.385808, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=101', 'ghostmap.jp',
            'community-site',
            '旧四十九院トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 49: 地図から消えた海岸（浜宿海岸）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=103') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地図から消えた海岸（浜宿海岸）' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地図から消えた海岸（浜宿海岸）', '地図から消えた海岸浜宿海岸-vbuywjrq', '地図から消えた海岸（浜宿海岸）は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.464869, 140.412527, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=103', 'ghostmap.jp',
            'community-site',
            '地図から消えた海岸（浜宿海岸）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 50: 十瀬野公園墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=105') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十瀬野公園墓地' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十瀬野公園墓地', '十瀬野公園墓地-lsqy9z6q', '十瀬野公園墓地は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.343713, 140.551202, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=105', 'ghostmap.jp',
            'community-site',
            '十瀬野公園墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 51: 糸数壕（アブチラガマ）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=107') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '糸数壕（アブチラガマ）' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('糸数壕（アブチラガマ）', '糸数壕アブチラガマ-nn5py5xq', '糸数壕（アブチラガマ）は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.154497, 127.764257, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=107', 'ghostmap.jp',
            'community-site',
            '糸数壕（アブチラガマ）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 52: 真の道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=109') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '真の道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('真の道', '真の道-nsh3urdw', '真の道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.639127, 139.222882, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=109', 'ghostmap.jp',
            'community-site',
            '真の道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 53: 入道崎（入道岬）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=111') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '入道崎（入道岬）' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('入道崎（入道岬）', '入道崎入道岬-c42kopce', '入道崎（入道岬）は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         40.004353, 139.698905, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=111', 'ghostmap.jp',
            'community-site',
            '入道崎（入道岬）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 54: 青山霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=115') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青山霊園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青山霊園', '青山霊園-g2luvkg1', '青山霊園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.666384, 139.722149, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=115', 'ghostmap.jp',
            'community-site',
            '青山霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 55: チョマトー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=117') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'チョマトー' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('チョマトー', 'チョマトー-oy1yttnb', 'チョマトーは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.931818, 143.176953, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=117', 'ghostmap.jp',
            'community-site',
            'チョマトーとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 56: 一本杉（日立）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=119') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一本杉（日立）' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一本杉（日立）', '一本杉日立-hnztefak', '一本杉（日立）は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.627464, 140.607432, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=119', 'ghostmap.jp',
            'community-site',
            '一本杉（日立）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 57: 希望湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=121') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '希望湖' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('希望湖', '希望湖-dl14d5it', '希望湖は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.871682, 138.293929, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=121', 'ghostmap.jp',
            'community-site',
            '希望湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 58: 旧日本陸軍防疫研究所跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=125') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日本陸軍防疫研究所跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日本陸軍防疫研究所跡', '旧日本陸軍防疫研究所跡-tba43egs', '旧日本陸軍防疫研究所跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.702566, 139.716493, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=125', 'ghostmap.jp',
            'community-site',
            '旧日本陸軍防疫研究所跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 59: 旧日本陸軍中野病院跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=127') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日本陸軍中野病院跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日本陸軍中野病院跡', '旧日本陸軍中野病院跡-t2nat984', '旧日本陸軍中野病院跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.730541, 139.665643, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=127', 'ghostmap.jp',
            'community-site',
            '旧日本陸軍中野病院跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 60: 祟りの岩
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=129') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '祟りの岩' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('祟りの岩', '祟りの岩-r7kzuxr8', '祟りの岩は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.772833, 135.316758, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=129', 'ghostmap.jp',
            'community-site',
            '祟りの岩とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 61: 浄化槽で殺された無念の園児たち
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=131') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浄化槽で殺された無念の園児たち' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浄化槽で殺された無念の園児たち', '浄化槽で殺された無念の園児たち-oczc1asc', '浄化槽で殺された無念の園児たちは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.777119, 135.322567, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=131', 'ghostmap.jp',
            'community-site',
            '浄化槽で殺された無念の園児たちとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 62: 旧日本陸軍大蔵病院跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=137') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日本陸軍大蔵病院跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日本陸軍大蔵病院跡', '旧日本陸軍大蔵病院跡-kmeoliqi', '旧日本陸軍大蔵病院跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.634, 139.612069, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=137', 'ghostmap.jp',
            'community-site',
            '旧日本陸軍大蔵病院跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 63: 天ケ瀬ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=143') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天ケ瀬ダム' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天ケ瀬ダム', '天ケ瀬ダム-ndd0ynhp', '天ケ瀬ダムは、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.867999, 135.839459, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=143', 'ghostmap.jp',
            'community-site',
            '天ケ瀬ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 64: 池之坊満月城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=145') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '池之坊満月城' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('池之坊満月城', '池之坊満月城-8dartuyu', '池之坊満月城は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.796336, 135.246599, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=145', 'ghostmap.jp',
            'community-site',
            '池之坊満月城とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 65: 三途の川の踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=147') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三途の川の踏切' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三途の川の踏切', '三途の川の踏切-wgn86bvo', '三途の川の踏切は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.738938, 135.381917, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=147', 'ghostmap.jp',
            'community-site',
            '三途の川の踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 66: メリーさんの館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=149') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'メリーさんの館' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('メリーさんの館', 'メリーさんの館-rumw5p7p', 'メリーさんの館は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.782069, 135.263446, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=149', 'ghostmap.jp',
            'community-site',
            'メリーさんの館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 67: 北境城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=151') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北境城' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北境城', '北境城-tg7sjceh', '北境城は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.473509, 141.30793, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=151', 'ghostmap.jp',
            'community-site',
            '北境城とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 68: 小串トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=153') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小串トンネル' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小串トンネル', '小串トンネル-pxda2h1l', '小串トンネルは、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.310354, 131.092091, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=153', 'ghostmap.jp',
            'community-site',
            '小串トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 69: 城山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=155') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '城山公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('城山公園', '城山公園-txrtyk07', '城山公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.598491, 130.551052, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=155', 'ghostmap.jp',
            'community-site',
            '城山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 70: 関之尾滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=157') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '関之尾滝' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('関之尾滝', '関之尾滝-ndfehwey', '関之尾滝は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.761365, 130.986998, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=157', 'ghostmap.jp',
            'community-site',
            '関之尾滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 71: 青の洞門
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=159') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青の洞門' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青の洞門', '青の洞門-txac1400', '青の洞門は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.500111, 131.171816, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=159', 'ghostmap.jp',
            'community-site',
            '青の洞門とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 72: 赤迫池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=161') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤迫池' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤迫池', '赤迫池-dyfpu8as', '赤迫池は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.193799, 131.709423, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=161', 'ghostmap.jp',
            'community-site',
            '赤迫池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 73: 十文字原高原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=163') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十文字原高原' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十文字原高原', '十文字原高原-4l5dis6v', '十文字原高原は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.329773, 131.459589, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=163', 'ghostmap.jp',
            'community-site',
            '十文字原高原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 74: 白梅の塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=165') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白梅の塔' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白梅の塔', '白梅の塔-lh3ru96p', '白梅の塔は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.1164, 127.686277, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=165', 'ghostmap.jp',
            'community-site',
            '白梅の塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 75: 首狩神社（浅間神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=167') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首狩神社（浅間神社）' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首狩神社（浅間神社）', '首狩神社浅間神社-cm6mgx0m', '首狩神社（浅間神社）は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.800144, 137.484322, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=167', 'ghostmap.jp',
            'community-site',
            '首狩神社（浅間神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 76: 栗生トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=169') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '栗生トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('栗生トンネル', '栗生トンネル-u8ef5xko', '栗生トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.678646, 139.174829, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=169', 'ghostmap.jp',
            'community-site',
            '栗生トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 77: 長年空き地だった場所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=171') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長年空き地だった場所' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長年空き地だった場所', '長年空き地だった場所-z66fp8om', '長年空き地だった場所は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.739893, 135.354084, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=171', 'ghostmap.jp',
            'community-site',
            '長年空き地だった場所とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 78: 青野ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=173') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青野ダム' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青野ダム', '青野ダム-2rh31yar', '青野ダムは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.93913, 135.228853, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=173', 'ghostmap.jp',
            'community-site',
            '青野ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 79: 六方沢橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=177') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六方沢橋' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六方沢橋', '六方沢橋-rna59m0t', '六方沢橋は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.816483, 139.587328, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=177', 'ghostmap.jp',
            'community-site',
            '六方沢橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 80: 八王子1トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=179') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子1トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子1トンネル', '八王子1トンネル-63u8xz7z', '八王子1トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.617867, 139.344052, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=179', 'ghostmap.jp',
            'community-site',
            '八王子1トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 81: 八王子3トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=181') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子3トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子3トンネル', '八王子3トンネル-2peos4vk', '八王子3トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.623618, 139.346547, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=181', 'ghostmap.jp',
            'community-site',
            '八王子3トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 82: 三段壁
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=183') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三段壁' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三段壁', '三段壁-31rqov6s', '三段壁は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         33.665836, 135.335373, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=183', 'ghostmap.jp',
            'community-site',
            '三段壁とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 83: 西宮市香櫨園（こうろえん）浜
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=185') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西宮市香櫨園（こうろえん）浜' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西宮市香櫨園（こうろえん）浜', '西宮市香櫨園こうろえん浜-o9xkl25g', '西宮市香櫨園（こうろえん）浜は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.724556, 135.329032, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=185', 'ghostmap.jp',
            'community-site',
            '西宮市香櫨園（こうろえん）浜とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 84: 山中トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=187') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山中トンネル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山中トンネル', '山中トンネル-1lr3yiey', '山中トンネルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.767077, 136.121222, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=187', 'ghostmap.jp',
            'community-site',
            '山中トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 85: 森川公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=189') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '森川公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('森川公園', '森川公園-0xejycex', '森川公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.271083, 127.741143, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=189', 'ghostmap.jp',
            'community-site',
            '森川公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 86: 旧日野橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=191') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日野橋' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日野橋', '旧日野橋-bogovlp0', '旧日野橋は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.429873, 133.366106, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=191', 'ghostmap.jp',
            'community-site',
            '旧日野橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 87: 天神山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=193') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天神山' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天神山', '天神山-wur90lca', '天神山は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.632652, 130.564173, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=193', 'ghostmap.jp',
            'community-site',
            '天神山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 88: 苦楽園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=195') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '苦楽園' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('苦楽園', '苦楽園-cipd6ojk', '苦楽園は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.751795, 135.313161, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=195', 'ghostmap.jp',
            'community-site',
            '苦楽園　とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 89: 旧犬鳴トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=197') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧犬鳴トンネル' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧犬鳴トンネル', '旧犬鳴トンネル-wwoby0yw', '旧犬鳴トンネルは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.676037, 130.547324, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=197', 'ghostmap.jp',
            'community-site',
            '旧犬鳴トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 90: 平家の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=199') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平家の墓' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平家の墓', '平家の墓-4ik1btq4', '平家の墓は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.57261, 136.427064, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=199', 'ghostmap.jp',
            'community-site',
            '平家の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 91: 北鹿島小学校（常広城）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=201') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北鹿島小学校（常広城）' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北鹿島小学校（常広城）', '北鹿島小学校常広城-i6xsefu7', '北鹿島小学校（常広城）は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.119707, 130.101791, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=201', 'ghostmap.jp',
            'community-site',
            '北鹿島小学校（常広城）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 92: 芦原トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=203') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '芦原トンネル' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('芦原トンネル', '芦原トンネル-2h9d0fpv', '芦原トンネルは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.420505, 135.796584, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=203', 'ghostmap.jp',
            'community-site',
            '芦原トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 93: 虹の大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=205') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '虹の大橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('虹の大橋', '虹の大橋-zsbvoamy', '虹の大橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.53308, 139.217812, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=205', 'ghostmap.jp',
            'community-site',
            '虹の大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 94: 観音隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=207') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '観音隧道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('観音隧道', '観音隧道-ms2gs0vh', '観音隧道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.263481, 139.872743, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=207', 'ghostmap.jp',
            'community-site',
            '観音隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 95: 東勝寺跡　腹切りやぐら
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=211') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東勝寺跡　腹切りやぐら' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東勝寺跡　腹切りやぐら', '東勝寺跡-腹切りやぐら-5j83pgri', '東勝寺跡　腹切りやぐらは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.320365, 139.559459, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=211', 'ghostmap.jp',
            'community-site',
            '東勝寺跡　腹切りやぐらとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 96: あみだババアの池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=219') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'あみだババアの池' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('あみだババアの池', 'あみだババアの池-g4232szv', 'あみだババアの池は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.816653, 135.765256, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=219', 'ghostmap.jp',
            'community-site',
            'あみだババアの池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 97: 滝沢峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=221') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝沢峠' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝沢峠', '滝沢峠-u931g4jv', '滝沢峠は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.512196, 139.971526, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=221', 'ghostmap.jp',
            'community-site',
            '滝沢峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 98: カローラ山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=223') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'カローラ山荘' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('カローラ山荘', 'カローラ山荘-jp6ogw21', 'カローラ山荘は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.49976, 141.581897, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=223', 'ghostmap.jp',
            'community-site',
            'カローラ山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 99: ラブホテル　コスモ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=225') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ラブホテル　コスモ' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ラブホテル　コスモ', 'ラブホテル-コスモ-s6upjypn', 'ラブホテル　コスモは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.944031, 143.22668, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=225', 'ghostmap.jp',
            'community-site',
            'ラブホテル　コスモとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 100: 原城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=229') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '原城跡' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('原城跡', '原城跡-3cqaqnul', '原城跡は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.628919, 130.254128, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=229', 'ghostmap.jp',
            'community-site',
            '原城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 101: 古虎渓ハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=231') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '古虎渓ハウス' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('古虎渓ハウス', '古虎渓ハウス-wphkt7b5', '古虎渓ハウスは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.308196, 137.106852, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=231', 'ghostmap.jp',
            'community-site',
            '古虎渓ハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 102: 津風呂湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=235') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '津風呂湖' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('津風呂湖', '津風呂湖-wfomgge6', '津風呂湖は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.398465, 135.891652, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=235', 'ghostmap.jp',
            'community-site',
            '津風呂湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 103: 畑トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=237') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '畑トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('畑トンネル', '畑トンネル-uvaqdsd1', '畑トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.84497, 139.293807, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=237', 'ghostmap.jp',
            'community-site',
            '畑トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 104: こしき岩
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=239') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'こしき岩' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('こしき岩', 'こしき岩-qyw2oirc', 'こしき岩は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.75868, 135.322056, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=239', 'ghostmap.jp',
            'community-site',
            'こしき岩とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 105: 旧童学寺トンネル（石井トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=241') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧童学寺トンネル（石井トンネル）' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧童学寺トンネル（石井トンネル）', '旧童学寺トンネル石井トンネル-w913m1ec', '旧童学寺トンネル（石井トンネル）は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.053945, 134.425551, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=241', 'ghostmap.jp',
            'community-site',
            '旧童学寺トンネル（石井トンネル）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 106: 緑山峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=243') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑山峠' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑山峠', '緑山峠-z2apv492', '緑山峠は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.566715, 139.485769, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=243', 'ghostmap.jp',
            'community-site',
            '緑山峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 107: 桜木神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=245') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桜木神社' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桜木神社', '桜木神社-gqy5mptk', '桜木神社は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.804203, 139.491415, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=245', 'ghostmap.jp',
            'community-site',
            '桜木神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 108: 旧総谷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=247') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧総谷トンネル' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧総谷トンネル', '旧総谷トンネル-c1cmeutf', '旧総谷トンネルは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.675685, 136.326108, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=247', 'ghostmap.jp',
            'community-site',
            '旧総谷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 109: 青木湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=249') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青木湖' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青木湖', '青木湖-dwpk5hf8', '青木湖は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.611256, 137.851424, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=249', 'ghostmap.jp',
            'community-site',
            '青木湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 110: 枕木山廃ラブホテル（ホテルシャモニー）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=251') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '枕木山廃ラブホテル（ホテルシャモニー）' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('枕木山廃ラブホテル（ホテルシャモニー）', '枕木山廃ラブホテルホテルシャモニー-49qmraa7', '枕木山廃ラブホテル（ホテルシャモニー）は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.539036, 133.128971, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=251', 'ghostmap.jp',
            'community-site',
            '枕木山廃ラブホテル（ホテルシャモニー）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 111: 深谷大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=253') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '深谷大橋' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('深谷大橋', '深谷大橋-zyhswgpb', '深谷大橋は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.393649, 132.004078, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=253', 'ghostmap.jp',
            'community-site',
            '深谷大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 112: 稲取廃隔離病棟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=255') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '稲取廃隔離病棟' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('稲取廃隔離病棟', '稲取廃隔離病棟-tc6waxo1', '稲取廃隔離病棟は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.785851, 139.055427, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=255', 'ghostmap.jp',
            'community-site',
            '稲取廃隔離病棟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 113: 滝不動
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=257') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝不動' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝不動', '滝不動-0iwlvbip', '滝不動は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.162777, 140.260576, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=257', 'ghostmap.jp',
            'community-site',
            '滝不動とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 114: 佐波川トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=259') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐波川トンネル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐波川トンネル', '佐波川トンネル-edc257n6', '佐波川トンネルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.276563, 131.656126, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=259', 'ghostmap.jp',
            'community-site',
            '佐波川トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 115: 青木ヶ原樹海
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=263') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青木ヶ原樹海' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青木ヶ原樹海', '青木ヶ原樹海-kav9x939', '青木ヶ原樹海は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.476695, 138.620805, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=263', 'ghostmap.jp',
            'community-site',
            '青木ヶ原樹海とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 116: 喫茶いずみ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=265') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '喫茶いずみ' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('喫茶いずみ', '喫茶いずみ-yw1oerqp', '喫茶いずみは、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         24.782799, 125.352329, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=265', 'ghostmap.jp',
            'community-site',
            '喫茶いずみとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 117: ほととぎす旅館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=269') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ほととぎす旅館' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ほととぎす旅館', 'ほととぎす旅館-fme5gzbo', 'ほととぎす旅館は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.322552, 135.269356, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=269', 'ghostmap.jp',
            'community-site',
            'ほととぎす旅館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 118: 旧佐和山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=271') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧佐和山トンネル' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧佐和山トンネル', '旧佐和山トンネル-88wsje9j', '旧佐和山トンネルは、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.277266, 136.270361, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=271', 'ghostmap.jp',
            'community-site',
            '旧佐和山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 119: 皆殺しの館跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=273') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '皆殺しの館跡' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('皆殺しの館跡', '皆殺しの館跡-vv0zl31n', '皆殺しの館跡は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.375941, 135.368967, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=273', 'ghostmap.jp',
            'community-site',
            '皆殺しの館跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 120: 旧由良トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=275') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧由良トンネル' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧由良トンネル', '旧由良トンネル-ejh5qa9s', '旧由良トンネルは、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         33.94858, 135.127059, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=275', 'ghostmap.jp',
            'community-site',
            '旧由良トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 121: 風吹トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=277') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '風吹トンネル' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('風吹トンネル', '風吹トンネル-l8ih4imr', '風吹トンネルは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.733223, 138.026011, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=277', 'ghostmap.jp',
            'community-site',
            '風吹トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 122: 日光ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=281') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日光ホテル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日光ホテル', '日光ホテル-bgs63ooy', '日光ホテルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.073188, 136.172389, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=281', 'ghostmap.jp',
            'community-site',
            '日光ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 123: 鱒池亭
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=283') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鱒池亭' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鱒池亭', '鱒池亭-xappfdws', '鱒池亭は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.691616, 136.226683, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=283', 'ghostmap.jp',
            'community-site',
            '鱒池亭とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 124: 青山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=285') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青山トンネル' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青山トンネル', '青山トンネル-mghw136i', '青山トンネルは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.671291, 136.270094, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=285', 'ghostmap.jp',
            'community-site',
            '青山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 125: 安濃ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=287') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '安濃ダム' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('安濃ダム', '安濃ダム-xdudoxyz', '安濃ダムは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.805276, 136.379533, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=287', 'ghostmap.jp',
            'community-site',
            '安濃ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 126: 中河原海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=289') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中河原海岸' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中河原海岸', '中河原海岸-au6xel4u', '中河原海岸は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.726289, 136.528204, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=289', 'ghostmap.jp',
            'community-site',
            '中河原海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 127: 尼ケ坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=291') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '尼ケ坂' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('尼ケ坂', '尼ケ坂-96od4vov', '尼ケ坂は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.187664, 136.91967, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=291', 'ghostmap.jp',
            'community-site',
            '尼ケ坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 128: 大道平池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=297') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大道平池' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大道平池', '大道平池-75m27iq6', '大道平池は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.238653, 137.044215, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=297', 'ghostmap.jp',
            'community-site',
            '大道平池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 129: 古城池トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=299') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '古城池トンネル' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('古城池トンネル', '古城池トンネル-ckc4kmt7', '古城池トンネルは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.551993, 133.76804, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=299', 'ghostmap.jp',
            'community-site',
            '古城池トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 130: 沙美海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=301') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '沙美海岸' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('沙美海岸', '沙美海岸-2akiuihm', '沙美海岸は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.502445, 133.632498, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=301', 'ghostmap.jp',
            'community-site',
            '沙美海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 131: 似島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=303') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '似島' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('似島', '似島-abxl9k02', '似島は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.303422, 132.431049, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=303', 'ghostmap.jp',
            'community-site',
            '似島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 132: 己斐峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=305') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '己斐峠' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('己斐峠', '己斐峠-ovtltxvg', '己斐峠は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.415939, 132.410321, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=305', 'ghostmap.jp',
            'community-site',
            '己斐峠とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 133: 福山グリーンライン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=307') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '福山グリーンライン' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('福山グリーンライン', '福山グリーンライン-hzcech9r', '福山グリーンラインは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.372816, 133.359252, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=307', 'ghostmap.jp',
            'community-site',
            '福山グリーンラインとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 134: 湖山池・青島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=309') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湖山池・青島' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湖山池・青島', '湖山池・青島-aue3cj0q', '湖山池・青島は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.516841, 134.149391, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=309', 'ghostmap.jp',
            'community-site',
            '湖山池・青島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 135: 鳥取プレイランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=311') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥取プレイランド' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥取プレイランド', '鳥取プレイランド-im81tsk3', '鳥取プレイランドは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.457979, 134.374674, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=311', 'ghostmap.jp',
            'community-site',
            '鳥取プレイランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 136: 宇部新川駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=313') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宇部新川駅' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宇部新川駅', '宇部新川駅-oo3pn8az', '宇部新川駅は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.95855, 131.242559, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=313', 'ghostmap.jp',
            'community-site',
            '宇部新川駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 137: 豊田湖の近くにあるトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=315') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊田湖の近くにあるトンネル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊田湖の近くにあるトンネル', '豊田湖の近くにあるトンネル-n8ipvjeg', '豊田湖の近くにあるトンネルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.239227, 131.118728, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=315', 'ghostmap.jp',
            'community-site',
            '豊田湖の近くにあるトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 138: 丸山ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=317') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丸山ダム' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丸山ダム', '丸山ダム-6merbie1', '丸山ダムは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.468998, 137.172035, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=317', 'ghostmap.jp',
            'community-site',
            '丸山ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 139: 寒洞池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=319') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '寒洞池' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('寒洞池', '寒洞池-4mtbyyxh', '寒洞池は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.428611, 136.91735, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=319', 'ghostmap.jp',
            'community-site',
            '寒洞池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 140: 蟻尾山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=321') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '蟻尾山' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('蟻尾山', '蟻尾山-icr5r55k', '蟻尾山は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.09093, 130.076354, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=321', 'ghostmap.jp',
            'community-site',
            '蟻尾山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 141: エロ本小屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=323') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'エロ本小屋' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('エロ本小屋', 'エロ本小屋-k5r73c3r', 'エロ本小屋は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.410242, 137.204579, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=323', 'ghostmap.jp',
            'community-site',
            'エロ本小屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 142: 関山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=325') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '関山トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('関山トンネル', '関山トンネル-t39mkmfq', '関山トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.388832, 140.570498, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=325', 'ghostmap.jp',
            'community-site',
            '関山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 143: 錦ヶ浦
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=327') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '錦ヶ浦' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('錦ヶ浦', '錦ヶ浦-6fhs2d7e', '錦ヶ浦は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.083783, 139.079638, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=327', 'ghostmap.jp',
            'community-site',
            '錦ヶ浦とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 144: 二ノ岡神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=329') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '二ノ岡神社' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('二ノ岡神社', '二ノ岡神社-0mwkv16q', '二ノ岡神社は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.281975, 138.948943, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=329', 'ghostmap.jp',
            'community-site',
            '二ノ岡神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 145: ホテル活魚（油井グランドホテル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=331') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル活魚（油井グランドホテル）' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル活魚（油井グランドホテル）', 'ホテル活魚油井グランドホテル-jnhjvr29', 'ホテル活魚（油井グランドホテル）は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.575149, 140.331366, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=331', 'ghostmap.jp',
            'community-site',
            'ホテル活魚（油井グランドホテル）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 146: 日本平パークウェイの歩道橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=339') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日本平パークウェイの歩道橋' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日本平パークウェイの歩道橋', '日本平パークウェイの歩道橋-39t14b6y', '日本平パークウェイの歩道橋は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.967861, 138.45702, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=339', 'ghostmap.jp',
            'community-site',
            '日本平パークウェイの歩道橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 147: 材木座海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=341') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '材木座海岸' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('材木座海岸', '材木座海岸-8nyycc2o', '材木座海岸は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.308261, 139.545437, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=341', 'ghostmap.jp',
            'community-site',
            '材木座海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 148: 船坂川　水飲み場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=343') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '船坂川　水飲み場' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('船坂川　水飲み場', '船坂川-水飲み場-ft9edj7f', '船坂川　水飲み場は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.79781, 135.273949, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=343', 'ghostmap.jp',
            'community-site',
            '船坂川　水飲み場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 149: 内灘霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=345') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内灘霊園' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内灘霊園', '内灘霊園-g0iwyxsj', '内灘霊園は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.676289, 136.656243, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=345', 'ghostmap.jp',
            'community-site',
            '内灘霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 150: ヤセの断崖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=347') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ヤセの断崖' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ヤセの断崖', 'ヤセの断崖-krrk570w', 'ヤセの断崖は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         37.209516, 136.683588, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=347', 'ghostmap.jp',
            'community-site',
            'ヤセの断崖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 151: 旧蔵原トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=349') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧蔵原トンネル' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧蔵原トンネル', '旧蔵原トンネル-bj2qo2xj', '旧蔵原トンネルは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.584037, 136.845479, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=349', 'ghostmap.jp',
            'community-site',
            '旧蔵原トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 152: シーサイドラインの赤い橋（浦浜大橋）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=351') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'シーサイドラインの赤い橋（浦浜大橋）' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('シーサイドラインの赤い橋（浦浜大橋）', 'シーサイドラインの赤い橋浦浜大橋-gjl34m9g', 'シーサイドラインの赤い橋（浦浜大橋）は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.768338, 138.810832, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=351', 'ghostmap.jp',
            'community-site',
            'シーサイドラインの赤い橋（浦浜大橋）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 153: 日蓮岩屋（七面大天女岩屋）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=353') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日蓮岩屋（七面大天女岩屋）' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日蓮岩屋（七面大天女岩屋）', '日蓮岩屋七面大天女岩屋-s3pem7bs', '日蓮岩屋（七面大天女岩屋）は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.795928, 138.827147, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=353', 'ghostmap.jp',
            'community-site',
            '日蓮岩屋（七面大天女岩屋）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 154: 流れ橋（上津屋橋）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=355') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '流れ橋（上津屋橋）' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('流れ橋（上津屋橋）', '流れ橋上津屋橋-scbfq2jw', '流れ橋（上津屋橋）は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.86838, 135.748395, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=355', 'ghostmap.jp',
            'community-site',
            '流れ橋（上津屋橋）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 155: 内の倉ダムと近くのトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=357') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内の倉ダムと近くのトンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内の倉ダムと近くのトンネル', '内の倉ダムと近くのトンネル-z6b26rzu', '内の倉ダムと近くのトンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.849324, 139.427541, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=357', 'ghostmap.jp',
            'community-site',
            '内の倉ダムと近くのトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 156: ヤビツ峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=359') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ヤビツ峠' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ヤビツ峠', 'ヤビツ峠-d7d34zkb', 'ヤビツ峠は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.427908, 139.219228, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=359', 'ghostmap.jp',
            'community-site',
            'ヤビツ峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 157: 喝破道場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=361') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '喝破道場' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('喝破道場', '喝破道場-8zxqmks2', '喝破道場は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.340451, 134.214902, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=361', 'ghostmap.jp',
            'community-site',
            '喝破道場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 158: 軍艦島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=363') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '軍艦島' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('軍艦島', '軍艦島-0loqdp3f', '軍艦島は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.628415, 129.738244, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=363', 'ghostmap.jp',
            'community-site',
            '軍艦島とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 159: 根香寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=365') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '根香寺' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('根香寺', '根香寺-ksz2q857', '根香寺は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.344393, 133.960626, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=365', 'ghostmap.jp',
            'community-site',
            '根香寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 160: 乃木神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=367') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '乃木神社' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('乃木神社', '乃木神社-b2qnmbp3', '乃木神社は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.22536, 133.779958, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=367', 'ghostmap.jp',
            'community-site',
            '乃木神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 161: 満濃池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=369') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '満濃池' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('満濃池', '満濃池-wxfqfhck', '満濃池は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.165245, 133.867087, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=369', 'ghostmap.jp',
            'community-site',
            '満濃池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 162: 日和佐トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=371') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日和佐トンネル' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日和佐トンネル', '日和佐トンネル-wvgfyamd', '日和佐トンネルは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.717658, 134.493537, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=371', 'ghostmap.jp',
            'community-site',
            '日和佐トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 163: 十三佛
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=373') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十三佛' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十三佛', '十三佛-sv7xmaqy', '十三佛は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.246015, 130.604965, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=373', 'ghostmap.jp',
            'community-site',
            '十三佛とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 164: 佐賀県立森林公園（千人塚）嘉瀬処刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=375') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐賀県立森林公園（千人塚）嘉瀬処刑場跡' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐賀県立森林公園（千人塚）嘉瀬処刑場跡', '佐賀県立森林公園千人塚嘉瀬処刑場跡-wczhg0bn', '佐賀県立森林公園（千人塚）嘉瀬処刑場跡は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.242676, 130.248532, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=375', 'ghostmap.jp',
            'community-site',
            '佐賀県立森林公園（千人塚）嘉瀬処刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 165: イノチャン山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=377') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'イノチャン山荘' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('イノチャン山荘', 'イノチャン山荘-hr675urf', 'イノチャン山荘は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.339824, 130.349819, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=377', 'ghostmap.jp',
            'community-site',
            'イノチャン山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 166: 三瀬峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=379') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三瀬峠' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三瀬峠', '三瀬峠-l6li4dxn', '三瀬峠は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.474462, 130.281633, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=379', 'ghostmap.jp',
            'community-site',
            '三瀬峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 167: 旧日見トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=381') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日見トンネル' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日見トンネル', '旧日見トンネル-uc0pa9w0', '旧日見トンネルは、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.752858, 129.920247, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=381', 'ghostmap.jp',
            'community-site',
            '旧日見トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 168: 光源寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=383') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '光源寺' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('光源寺', '光源寺-fqa9e3by', '光源寺は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.750247, 129.886601, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=383', 'ghostmap.jp',
            'community-site',
            '光源寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 169: 大島蛤診療所跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=385') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大島蛤診療所跡' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大島蛤診療所跡', '大島蛤診療所跡-rx3lhcyh', '大島蛤診療所跡は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.029854, 129.602726, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=385', 'ghostmap.jp',
            'community-site',
            '大島蛤診療所跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 170: 地球岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=387') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地球岬' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地球岬', '地球岬-82dcyf9h', '地球岬は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.301745, 141.001819, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=387', 'ghostmap.jp',
            'community-site',
            '地球岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 171: 三国トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=389') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三国トンネル' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三国トンネル', '三国トンネル-3gr3xowr', '三国トンネルは、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         32.90338, 131.612365, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=389', 'ghostmap.jp',
            'community-site',
            '三国トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 172: 旧佐敷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=391') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧佐敷トンネル' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧佐敷トンネル', '旧佐敷トンネル-anf0xnw4', '旧佐敷トンネルは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.32266, 130.490675, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=391', 'ghostmap.jp',
            'community-site',
            '旧佐敷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 173: 信愛病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=393') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '信愛病院' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('信愛病院', '信愛病院-uwsnifxv', '信愛病院は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.956515, 130.714532, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=393', 'ghostmap.jp',
            'community-site',
            '信愛病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 174: 仏舎利塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=395') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仏舎利塔' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仏舎利塔', '仏舎利塔-iphph8rl', '仏舎利塔は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.792657, 131.475854, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=395', 'ghostmap.jp',
            'community-site',
            '仏舎利塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 175: 市民の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=397') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '市民の森' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('市民の森', '市民の森-c7vhs7xk', '市民の森は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.963395, 131.464972, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=397', 'ghostmap.jp',
            'community-site',
            '市民の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 176: 平和台公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=399') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平和台公園' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平和台公園', '平和台公園-gel5lxtc', '平和台公園は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.948053, 131.414496, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=399', 'ghostmap.jp',
            'community-site',
            '平和台公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 177: 高千穂峡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=401') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高千穂峡' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高千穂峡', '高千穂峡-tkysa1kv', '高千穂峡は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.701762, 131.300378, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=401', 'ghostmap.jp',
            'community-site',
            '高千穂峡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 178: 涙橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=403') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '涙橋' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('涙橋', '涙橋-htzbrrii', '涙橋は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.559321, 130.546298, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=403', 'ghostmap.jp',
            'community-site',
            '涙橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 179: 杉沢村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=405') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '杉沢村' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('杉沢村', '杉沢村-sq74e41m', '杉沢村は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.727308, 140.757348, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=405', 'ghostmap.jp',
            'community-site',
            '杉沢村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 180: 三戸トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=407') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三戸トンネル' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三戸トンネル', '三戸トンネル-mx7j1mqs', '三戸トンネルは、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.435224, 141.274575, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=407', 'ghostmap.jp',
            'community-site',
            '三戸トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 181: ホテルエンドレス2
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=409') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルエンドレス2' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルエンドレス2', 'ホテルエンドレス2-wctgr780', 'ホテルエンドレス2は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.918632, 140.883504, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=409', 'ghostmap.jp',
            'community-site',
            'ホテルエンドレス2とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 182: 四十四田ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=411') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '四十四田ダム' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('四十四田ダム', '四十四田ダム-1bn9azre', '四十四田ダムは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.752906, 141.148587, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=411', 'ghostmap.jp',
            'community-site',
            '四十四田ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 183: まんだら堂やぐら群
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=413') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'まんだら堂やぐら群' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('まんだら堂やぐら群', 'まんだら堂やぐら群-h4nchnjp', 'まんだら堂やぐら群は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.308104, 139.565029, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=413', 'ghostmap.jp',
            'community-site',
            'まんだら堂やぐら群とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 184: おいし観音
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=415') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おいし観音' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おいし観音', 'おいし観音-hitjapuc', 'おいし観音は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.222726, 141.01067, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=415', 'ghostmap.jp',
            'community-site',
            'おいし観音とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 185: 千秋公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=417') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千秋公園' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千秋公園', '千秋公園-w23zryx7', '千秋公園は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.720697, 140.121924, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=417', 'ghostmap.jp',
            'community-site',
            '千秋公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 186: 田沢湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=419') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田沢湖' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田沢湖', '田沢湖-mdwk0hhs', '田沢湖は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.714186, 140.635192, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=419', 'ghostmap.jp',
            'community-site',
            '田沢湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 187: 一つ森公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=421') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一つ森公園' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一つ森公園', '一つ森公園-7t26hqz4', '一つ森公園は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.7008, 140.138817, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=421', 'ghostmap.jp',
            'community-site',
            '一つ森公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 188: 熊野神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=425') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '熊野神社' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('熊野神社', '熊野神社-3lvl6mce', '熊野神社は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.420008, 140.548607, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=425', 'ghostmap.jp',
            'community-site',
            '熊野神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 189: 抱返り渓谷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=427') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '抱返り渓谷' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('抱返り渓谷', '抱返り渓谷-hz4y7bh4', '抱返り渓谷は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.608174, 140.651756, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=427', 'ghostmap.jp',
            'community-site',
            '抱返り渓谷とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 190: 与兵衛沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=431') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '与兵衛沼' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('与兵衛沼', '与兵衛沼-7o9z3sek', '与兵衛沼は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.281768, 140.90103, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=431', 'ghostmap.jp',
            'community-site',
            '与兵衛沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 191: すずらん峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=433') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'すずらん峠' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('すずらん峠', 'すずらん峠-k43y7fun', 'すずらん峠は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.141434, 140.600402, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=433', 'ghostmap.jp',
            'community-site',
            'すずらん峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 192: 富山観音
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=435') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '富山観音' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('富山観音', '富山観音-rdepp28w', '富山観音は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.397051, 141.107214, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=435', 'ghostmap.jp',
            'community-site',
            '富山観音とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 193: 旧加茂坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=443') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧加茂坂トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧加茂坂トンネル', '旧加茂坂トンネル-rzd0jv8v', '旧加茂坂トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.751709, 139.742799, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=443', 'ghostmap.jp',
            'community-site',
            '旧加茂坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 194: 旧三森トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=447') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧三森トンネル' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧三森トンネル', '旧三森トンネル-1fu18hke', '旧三森トンネルは、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.397458, 140.190415, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=447', 'ghostmap.jp',
            'community-site',
            '旧三森トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 195: 雪割橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=449') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雪割橋' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雪割橋', '雪割橋-y4umht7t', '雪割橋は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         37.170386, 140.0801, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=449', 'ghostmap.jp',
            'community-site',
            '雪割橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 196: 麓宝園跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=451') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '麓宝園跡' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('麓宝園跡', '麓宝園跡-qhvv6amx', '麓宝園跡は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.691781, 133.728871, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=451', 'ghostmap.jp',
            'community-site',
            '麓宝園跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 197: 五台山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=453') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五台山公園' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五台山公園', '五台山公園-806mxtrv', '五台山公園は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.546702, 133.574114, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=453', 'ghostmap.jp',
            'community-site',
            '五台山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 198: 俵津隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=457') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '俵津隧道' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('俵津隧道', '俵津隧道-5a3bl7gr', '俵津隧道は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.336265, 132.511534, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=457', 'ghostmap.jp',
            'community-site',
            '俵津隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 199: ホテルセリーヌ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=461') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルセリーヌ' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルセリーヌ', 'ホテルセリーヌ-htd4z986', 'ホテルセリーヌは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.846397, 138.198547, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=461', 'ghostmap.jp',
            'community-site',
            'ホテルセリーヌとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 200: 院内銀山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=463') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '院内銀山' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('院内銀山', '院内銀山-5ihi12ir', '院内銀山は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.048786, 140.362802, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=463', 'ghostmap.jp',
            'community-site',
            '院内銀山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 201: 野竹トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=465') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野竹トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野竹トンネル', '野竹トンネル-93ub8hhf', '野竹トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.399934, 138.291788, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=465', 'ghostmap.jp',
            'community-site',
            '野竹トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 202: 諏訪湖の近くの電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=467') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諏訪湖の近くの電話ボックス' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諏訪湖の近くの電話ボックス', '諏訪湖の近くの電話ボックス-aktypi59', '諏訪湖の近くの電話ボックスは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.052658, 138.052705, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=467', 'ghostmap.jp',
            'community-site',
            '諏訪湖の近くの電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 203: 諏訪湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=469') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諏訪湖' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諏訪湖', '諏訪湖-tkaao0ov', '諏訪湖は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.047295, 138.08358, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=469', 'ghostmap.jp',
            'community-site',
            '諏訪湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 204: 倶利伽羅トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=475') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '倶利伽羅トンネル' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('倶利伽羅トンネル', '倶利伽羅トンネル-5vtdr7l9', '倶利伽羅トンネルは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.674537, 136.815296, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=475', 'ghostmap.jp',
            'community-site',
            '倶利伽羅トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 205: 生鼻崎第二トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=477') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '生鼻崎第二トンネル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('生鼻崎第二トンネル', '生鼻崎第二トンネル-5qwhstdd', '生鼻崎第二トンネルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.899728, 139.88488, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=477', 'ghostmap.jp',
            'community-site',
            '生鼻崎第二トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 206: 白石鉱山(白石工業桑名工場)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=479') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白石鉱山(白石工業桑名工場)' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白石鉱山(白石工業桑名工場)', '白石鉱山白石工業桑名工場-91y5hzfi', '白石鉱山(白石工業桑名工場)は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.209178, 136.448785, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=479', 'ghostmap.jp',
            'community-site',
            '白石鉱山(白石工業桑名工場)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 207: 新田さん家
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=481') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新田さん家' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新田さん家', '新田さん家-0371cojr', '新田さん家は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.984841, 138.455456, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=481', 'ghostmap.jp',
            'community-site',
            '新田さん家とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 208: 新府城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=485') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新府城跡' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新府城跡', '新府城跡-wl5e5nrp', '新府城跡は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.735485, 138.424993, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=485', 'ghostmap.jp',
            'community-site',
            '新府城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 209: 水元公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=487') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水元公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水元公園', '水元公園-9lca4eoh', '水元公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.787805, 139.869735, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=487', 'ghostmap.jp',
            'community-site',
            '水元公園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 210: はねたき橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=489') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'はねたき橋' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('はねたき橋', 'はねたき橋-eoph6pii', 'はねたき橋は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.438524, 139.278457, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=489', 'ghostmap.jp',
            'community-site',
            'はねたき橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 211: 城下トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=491') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '城下トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('城下トンネル', '城下トンネル-1wy3ep4t', '城下トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.485713, 139.263535, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=491', 'ghostmap.jp',
            'community-site',
            '城下トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 212: ホワイトハウス（茨城）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=493') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホワイトハウス（茨城）' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホワイトハウス（茨城）', 'ホワイトハウス茨城-bwfeombz', 'ホワイトハウス（茨城）は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.416523, 140.511796, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=493', 'ghostmap.jp',
            'community-site',
            'ホワイトハウス（茨城）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 213: 金山ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=495') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金山ダム' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金山ダム', '金山ダム-vf6g6jdh', '金山ダムは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.151971, 140.077165, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=495', 'ghostmap.jp',
            'community-site',
            '金山ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 214: 吉見百穴
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=497') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '吉見百穴' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('吉見百穴', '吉見百穴-6snnkh0j', '吉見百穴は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.039622, 139.421367, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=497', 'ghostmap.jp',
            'community-site',
            '吉見百穴とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 215: 正丸峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=501') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正丸峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正丸峠', '正丸峠-9lyf87ev', '正丸峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         35.94112, 139.159589, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=501', 'ghostmap.jp',
            'community-site',
            '正丸峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 216: 正喜橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=505') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正喜橋' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正喜橋', '正喜橋-whmu038a', '正喜橋は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.111608, 139.197188, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=505', 'ghostmap.jp',
            'community-site',
            '正喜橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 217: 矢板トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=507') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '矢板トンネル' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('矢板トンネル', '矢板トンネル-eoffkt36', '矢板トンネルは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.799006, 139.875649, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=507', 'ghostmap.jp',
            'community-site',
            '矢板トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 218: 東洋診療所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=509') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東洋診療所' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東洋診療所', '東洋診療所-13fnjshw', '東洋診療所は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.258854, 139.77453, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=509', 'ghostmap.jp',
            'community-site',
            '東洋診療所とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 219: 鞍掛山神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=511') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鞍掛山神社' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鞍掛山神社', '鞍掛山神社-np7bb1pj', '鞍掛山神社は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.638067, 139.791143, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=511', 'ghostmap.jp',
            'community-site',
            '鞍掛山神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 220: 六本木ヒルズと毛利庭園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=513') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六本木ヒルズと毛利庭園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六本木ヒルズと毛利庭園', '六本木ヒルズと毛利庭園-v2g6k5h4', '六本木ヒルズと毛利庭園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.66023, 139.730545, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=513', 'ghostmap.jp',
            'community-site',
            '六本木ヒルズと毛利庭園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 221: 人形トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=515') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人形トンネル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人形トンネル', '人形トンネル-jyhzg28p', '人形トンネルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.668369, 131.709653, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=515', 'ghostmap.jp',
            'community-site',
            '人形トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 222: 大池遊園駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=517') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大池遊園駅' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大池遊園駅', '大池遊園駅-xer0fwdp', '大池遊園駅は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.204695, 135.28546, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=517', 'ghostmap.jp',
            'community-site',
            '大池遊園駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 223: 蟲式灰尊人道寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=519') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '蟲式灰尊人道寺' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('蟲式灰尊人道寺', '蟲式灰尊人道寺-ad32dqv6', '蟲式灰尊人道寺は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.527098, 141.666195, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=519', 'ghostmap.jp',
            'community-site',
            '蟲式灰尊人道寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 224: 多羅尾処刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=523') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多羅尾処刑場跡' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多羅尾処刑場跡', '多羅尾処刑場跡-eto78sl4', '多羅尾処刑場跡は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.809248, 136.066575, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=523', 'ghostmap.jp',
            'community-site',
            '多羅尾処刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 225: 鳥取砂丘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=525') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥取砂丘' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥取砂丘', '鳥取砂丘-tjh2p7jn', '鳥取砂丘は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.538303, 134.229513, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=525', 'ghostmap.jp',
            'community-site',
            '鳥取砂丘とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 226: 殺生石
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=527') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '殺生石' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('殺生石', '殺生石-folh94c5', '殺生石は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         37.101476, 139.998918, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=527', 'ghostmap.jp',
            'community-site',
            '殺生石とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 227: 宇津ノ谷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=529') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宇津ノ谷トンネル' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宇津ノ谷トンネル', '宇津ノ谷トンネル-0ds5w8ex', '宇津ノ谷トンネルは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.932609, 138.302692, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=529', 'ghostmap.jp',
            'community-site',
            '宇津ノ谷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 228: 旧油戸トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=531') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧油戸トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧油戸トンネル', '旧油戸トンネル-jfx1o5d9', '旧油戸トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.747285, 139.708451, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=531', 'ghostmap.jp',
            'community-site',
            '旧油戸トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 229: 有馬街道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=533') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '有馬街道' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('有馬街道', '有馬街道-1g462xb5', '有馬街道は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.802265, 135.250452, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=533', 'ghostmap.jp',
            'community-site',
            '有馬街道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 230: 落合橋と赤橋トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=535') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '落合橋と赤橋トンネル' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('落合橋と赤橋トンネル', '落合橋と赤橋トンネル-ec1qpa0t', '落合橋と赤橋トンネルは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.031674, 135.650706, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=535', 'ghostmap.jp',
            'community-site',
            '落合橋と赤橋トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 231: 中国人墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=537') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中国人墓地' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中国人墓地', '中国人墓地-mgq4iwau', '中国人墓地は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.648276, 142.594287, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=537', 'ghostmap.jp',
            'community-site',
            '中国人墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 232: 血塗られた村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=539') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '血塗られた村' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('血塗られた村', '血塗られた村-xfihmmsc', '血塗られた村は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.813631, 137.255688, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=539', 'ghostmap.jp',
            'community-site',
            '血塗られた村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 233: 泉の広場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=541') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '泉の広場' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('泉の広場', '泉の広場-n57mp3kz', '泉の広場は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.702005, 135.501896, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=541', 'ghostmap.jp',
            'community-site',
            '泉の広場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 234: ピョウタンの滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=543') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ピョウタンの滝' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ピョウタンの滝', 'ピョウタンの滝-2p84zl3j', 'ピョウタンの滝は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.593505, 142.951397, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=543', 'ghostmap.jp',
            'community-site',
            'ピョウタンの滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 235: 黒森峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=545') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒森峠' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒森峠', '黒森峠-cizv0qet', '黒森峠は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.378509, 140.629048, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=545', 'ghostmap.jp',
            'community-site',
            '黒森峠 とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 236: 新登別大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=547') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新登別大橋' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新登別大橋', '新登別大橋-3w69rddx', '新登別大橋は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.473385, 141.13362, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=547', 'ghostmap.jp',
            'community-site',
            '新登別大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 237: 小日向神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=549') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小日向神社' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小日向神社', '小日向神社-ztu7ji2p', '小日向神社は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.710851, 139.734915, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=549', 'ghostmap.jp',
            'community-site',
            '小日向神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 238: 行者還トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=553') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '行者還トンネル' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('行者還トンネル', '行者還トンネル-v7494ysb', '行者還トンネルは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.187062, 135.94338, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=553', 'ghostmap.jp',
            'community-site',
            '行者還トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 239: 千本浜の首塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=555') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千本浜の首塚' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千本浜の首塚', '千本浜の首塚-4wr35ymw', '千本浜の首塚は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.094093, 138.848721, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=555', 'ghostmap.jp',
            'community-site',
            '千本浜の首塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 240: 昇仙峡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=557') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '昇仙峡' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('昇仙峡', '昇仙峡-ql6mztwg', '昇仙峡は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.718168, 138.553401, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=557', 'ghostmap.jp',
            'community-site',
            '昇仙峡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 241: 豊明終末処理場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=561') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊明終末処理場' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊明終末処理場', '豊明終末処理場-mx5klleu', '豊明終末処理場は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.034828, 137.007615, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=561', 'ghostmap.jp',
            'community-site',
            '豊明終末処理場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 242: 本牧の白い家
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=565') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本牧の白い家' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本牧の白い家', '本牧の白い家-8azmo52e', '本牧の白い家は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.423641, 139.667084, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=565', 'ghostmap.jp',
            'community-site',
            '本牧の白い家とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 243: ホテル森のゴリラ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=567') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル森のゴリラ' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル森のゴリラ', 'ホテル森のゴリラ-wpuizd6a', 'ホテル森のゴリラは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.32212, 138.457947, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=567', 'ghostmap.jp',
            'community-site',
            'ホテル森のゴリラとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 244: 葉梨トンネル(宮ヶ澤トンネル)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=569') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '葉梨トンネル(宮ヶ澤トンネル)' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('葉梨トンネル(宮ヶ澤トンネル)', '葉梨トンネル宮ヶ澤トンネル-c7tdsnjx', '葉梨トンネル(宮ヶ澤トンネル)は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.922699, 138.220383, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=569', 'ghostmap.jp',
            'community-site',
            '葉梨トンネル(宮ヶ澤トンネル)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 245: 美の山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=577') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美の山公園' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美の山公園', '美の山公園-m4wdvm5t', '美の山公園は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.0558, 139.11457, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=577', 'ghostmap.jp',
            'community-site',
            '美の山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 246: 化女沼レジャーランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=581') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '化女沼レジャーランド' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('化女沼レジャーランド', '化女沼レジャーランド-ppk4m3pl', '化女沼レジャーランドは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.631995, 140.967019, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=581', 'ghostmap.jp',
            'community-site',
            '化女沼レジャーランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 247: 天心白菊の塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=583') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天心白菊の塔' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天心白菊の塔', '天心白菊の塔-6qnx42as', '天心白菊の塔は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.557278, 137.184083, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=583', 'ghostmap.jp',
            'community-site',
            '天心白菊の塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 248: 江古田の森公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=585') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '江古田の森公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('江古田の森公園', '江古田の森公園-bpq47faq', '江古田の森公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.730071, 139.666096, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=585', 'ghostmap.jp',
            'community-site',
            '江古田の森公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 249: 綾瀬駅近くの公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=589') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '綾瀬駅近くの公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('綾瀬駅近くの公園', '綾瀬駅近くの公園-ojn40bcw', '綾瀬駅近くの公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.757841, 139.817601, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=589', 'ghostmap.jp',
            'community-site',
            '綾瀬駅近くの公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 250: 日田街道のお地蔵さん
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=593') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日田街道のお地蔵さん' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日田街道のお地蔵さん', '日田街道のお地蔵さん-zdwp42ai', '日田街道のお地蔵さんは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.933007, 130.778567, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=593', 'ghostmap.jp',
            'community-site',
            '日田街道のお地蔵さんとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 251: 忍者村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=595') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '忍者村' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('忍者村', '忍者村-6plonhzx', '忍者村は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.56541, 130.257421, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=595', 'ghostmap.jp',
            'community-site',
            '忍者村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 252: 地蔵峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=597') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵峠' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵峠', '地蔵峠-ze78z1qe', '地蔵峠は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.443858, 138.693337, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=597', 'ghostmap.jp',
            'community-site',
            '地蔵峠とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 253: 台東区内のとあるライブハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=599') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '台東区内のとあるライブハウス' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('台東区内のとあるライブハウス', '台東区内のとあるライブハウス-5v1dh8cj', '台東区内のとあるライブハウスは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.712493, 139.780095, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=599', 'ghostmap.jp',
            'community-site',
            '台東区内のとあるライブハウスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 254: 憾満ヶ淵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=601') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '憾満ヶ淵' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('憾満ヶ淵', '憾満ヶ淵-c9ob42ro', '憾満ヶ淵は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.75003, 139.591557, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=601', 'ghostmap.jp',
            'community-site',
            '憾満ヶ淵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 255: あるはずのないトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=603') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'あるはずのないトンネル' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('あるはずのないトンネル', 'あるはずのないトンネル-7pbrmsh9', 'あるはずのないトンネルは、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.307392, 135.345804, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=603', 'ghostmap.jp',
            'community-site',
            'あるはずのないトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 256: 世界無名戦士の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=605') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '世界無名戦士の墓' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('世界無名戦士の墓', '世界無名戦士の墓-jgcvx0qz', '世界無名戦士の墓は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.964189, 139.28944, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=605', 'ghostmap.jp',
            'community-site',
            '世界無名戦士の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 257: 一ツ木駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=607') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一ツ木駅' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一ツ木駅', '一ツ木駅-2liayqwe', '一ツ木駅は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.01361, 137.025466, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=607', 'ghostmap.jp',
            'community-site',
            '一ツ木駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 258: 比叡山回転展望閣
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=609') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '比叡山回転展望閣' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('比叡山回転展望閣', '比叡山回転展望閣-6261nwio', '比叡山回転展望閣は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         35.064654, 135.829008, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=609', 'ghostmap.jp',
            'community-site',
            '比叡山回転展望閣とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 259: 八幡の藪知らず
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=611') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八幡の藪知らず' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八幡の藪知らず', '八幡の藪知らず-qmpdgwce', '八幡の藪知らずは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.721541, 139.930011, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=611', 'ghostmap.jp',
            'community-site',
            '八幡の藪知らずとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 260: ホテル キャデラックハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=613') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル キャデラックハウス' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル キャデラックハウス', 'ホテル-キャデラックハウス-7jpdhiua', 'ホテル キャデラックハウスは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.883607, 138.440772, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=613', 'ghostmap.jp',
            'community-site',
            'ホテル キャデラックハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 261: 内津トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=617') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内津トンネル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内津トンネル', '内津トンネル-4q63h1xu', '内津トンネルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.330007, 137.071738, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=617', 'ghostmap.jp',
            'community-site',
            '内津トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 262: エローラ風車
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=619') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'エローラ風車' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('エローラ風車', 'エローラ風車-qhsyxnpk', 'エローラ風車は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.91898, 139.8305, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=619', 'ghostmap.jp',
            'community-site',
            'エローラ風車とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 263: 円座町にある墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=623') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '円座町にある墓地' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('円座町にある墓地', '円座町にある墓地-lgx97ilp', '円座町にある墓地は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.289406, 134.017295, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=623', 'ghostmap.jp',
            'community-site',
            '円座町にある墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 264: 天狗の森（八坂神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=631') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天狗の森（八坂神社）' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天狗の森（八坂神社）', '天狗の森八坂神社-ejkck9om', '天狗の森（八坂神社）は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.612198, 136.661958, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=631', 'ghostmap.jp',
            'community-site',
            '天狗の森（八坂神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 265: 下関旧国立病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=639') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下関旧国立病院' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下関旧国立病院', '下関旧国立病院-ioxc4q67', '下関旧国立病院は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.968202, 130.934589, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=639', 'ghostmap.jp',
            'community-site',
            '下関旧国立病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 266: キューピーの館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=641') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'キューピーの館' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('キューピーの館', 'キューピーの館-37ihuahg', 'キューピーの館は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.701729, 133.841659, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=641', 'ghostmap.jp',
            'community-site',
            'キューピーの館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 267: 緑が丘公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=643') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑が丘公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑が丘公園', '緑が丘公園-1wtmbp49', '緑が丘公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.217467, 127.685984, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=643', 'ghostmap.jp',
            'community-site',
            '緑が丘公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 268: 北条バスストップ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=645') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北条バスストップ' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北条バスストップ', '北条バスストップ-u6rlbgf1', '北条バスストップは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.93528, 134.837049, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=645', 'ghostmap.jp',
            'community-site',
            '北条バスストップとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 269: ホテルいずみ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=647') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルいずみ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルいずみ', 'ホテルいずみ-cf0nx7b7', 'ホテルいずみは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.44728, 138.688512, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=647', 'ghostmap.jp',
            'community-site',
            'ホテルいずみとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 270: 墓間温泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=649') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '墓間温泉' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('墓間温泉', '墓間温泉-jkuwikxk', '墓間温泉は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.366169, 138.728963, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=649', 'ghostmap.jp',
            'community-site',
            '墓間温泉とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 271: 鷹ノ巣村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=651') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鷹ノ巣村' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鷹ノ巣村', '鷹ノ巣村-k4383ehp', '鷹ノ巣村は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.388601, 138.699926, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=651', 'ghostmap.jp',
            'community-site',
            '鷹ノ巣村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 272: 浦佐スキー場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=653') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浦佐スキー場' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浦佐スキー場', '浦佐スキー場-hi47jxq7', '浦佐スキー場は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.163595, 138.911362, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=653', 'ghostmap.jp',
            'community-site',
            '浦佐スキー場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 273: 妙高高原ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=655') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙高高原ホテル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙高高原ホテル', '妙高高原ホテル-s5tg680u', '妙高高原ホテルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.887447, 138.183424, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=655', 'ghostmap.jp',
            'community-site',
            '妙高高原ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 274: ホテルBell
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=657') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルBell' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルBell', 'ホテルbell-qx2ixcf5', 'ホテルBellは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.842158, 138.201588, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=657', 'ghostmap.jp',
            'community-site',
            'ホテルBellとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 275: 姫川病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=661') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '姫川病院' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('姫川病院', '姫川病院-zwydge1c', '姫川病院は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.02, 137.859556, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=661', 'ghostmap.jp',
            'community-site',
            '姫川病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 276: モテル北陸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=663') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'モテル北陸' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('モテル北陸', 'モテル北陸-7tcv5tbv', 'モテル北陸は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.318924, 136.398754, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=663', 'ghostmap.jp',
            'community-site',
            'モテル北陸とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 277: 旧桜町トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=665') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧桜町トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧桜町トンネル', '旧桜町トンネル-zb3k1i38', '旧桜町トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.312905, 138.750715, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=665', 'ghostmap.jp',
            'community-site',
            '旧桜町トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 278: 高石第二隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=667') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高石第二隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高石第二隧道', '高石第二隧道-uelhmayw', '高石第二隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.660667, 139.278064, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=667', 'ghostmap.jp',
            'community-site',
            '高石第二隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 279: 比礼隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=671') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '比礼隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('比礼隧道', '比礼隧道-vzc73ey9', '比礼隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.455713, 138.939239, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=671', 'ghostmap.jp',
            'community-site',
            '比礼隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 280: ホテル プラザ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=673') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル プラザ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル プラザ', 'ホテル-プラザ-h4tl2t1b', 'ホテル プラザは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.42863, 138.839733, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=673', 'ghostmap.jp',
            'community-site',
            'ホテル プラザとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 281: やひこ観光ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=677') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'やひこ観光ホテル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('やひこ観光ホテル', 'やひこ観光ホテル-84v90ri2', 'やひこ観光ホテルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.699757, 138.831526, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=677', 'ghostmap.jp',
            'community-site',
            'やひこ観光ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 282: 成合自販機前公衆電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=679') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '成合自販機前公衆電話ボックス' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('成合自販機前公衆電話ボックス', '成合自販機前公衆電話ボックス-prx9ysny', '成合自販機前公衆電話ボックスは、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.302769, 134.023184, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=679', 'ghostmap.jp',
            'community-site',
            '成合自販機前公衆電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 283: 甚目寺の家（三角屋敷）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=681') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '甚目寺の家（三角屋敷）' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('甚目寺の家（三角屋敷）', '甚目寺の家三角屋敷-lsa6toxe', '甚目寺の家（三角屋敷）は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.191004, 136.83077, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=681', 'ghostmap.jp',
            'community-site',
            '甚目寺の家（三角屋敷）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 284: 秋葉湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=683') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋葉湖' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋葉湖', '秋葉湖-im7nsv19', '秋葉湖は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.782595, 139.136288, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=683', 'ghostmap.jp',
            'community-site',
            '秋葉湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 285: 川口廃ペンション
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=685') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川口廃ペンション' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川口廃ペンション', '川口廃ペンション-0xrs6mfo', '川口廃ペンションは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.263274, 138.86973, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=685', 'ghostmap.jp',
            'community-site',
            '川口廃ペンションとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 286: 阿木川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=687') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿木川ダム' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿木川ダム', '阿木川ダム-58le05k9', '阿木川ダムは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.424946, 137.431835, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=687', 'ghostmap.jp',
            'community-site',
            '阿木川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 287: 観音の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=689') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '観音の滝' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('観音の滝', '観音の滝-btsj34cy', '観音の滝は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.434736, 130.129967, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=689', 'ghostmap.jp',
            'community-site',
            '観音の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 288: 佐白山(笠間城跡)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=691') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐白山(笠間城跡)' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐白山(笠間城跡)', '佐白山笠間城跡-iw1p1c60', '佐白山(笠間城跡)は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.382674, 140.26706, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=691', 'ghostmap.jp',
            'community-site',
            '佐白山(笠間城跡)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 289: 旧和田トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=693') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧和田トンネル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧和田トンネル', '旧和田トンネル-pt0tgi4u', '旧和田トンネルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.659146, 140.195857, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=693', 'ghostmap.jp',
            'community-site',
            '旧和田トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 290: 柳澤隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=695') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '柳澤隧道' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('柳澤隧道', '柳澤隧道-4go83gyr', '柳澤隧道は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         37.067133, 138.858047, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=695', 'ghostmap.jp',
            'community-site',
            '柳澤隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 291: 梅ノ木踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=697') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '梅ノ木踏切' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('梅ノ木踏切', '梅ノ木踏切-wj7i9113', '梅ノ木踏切は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.951635, 135.705152, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=697', 'ghostmap.jp',
            'community-site',
            '梅ノ木踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 292: 久米田池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=699') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久米田池' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久米田池', '久米田池-nxsj665d', '久米田池は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.455662, 135.418449, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=699', 'ghostmap.jp',
            'community-site',
            '久米田池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 293: コンコン神社　（下飯田稲荷）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=703') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'コンコン神社　（下飯田稲荷）' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('コンコン神社　（下飯田稲荷）', 'コンコン神社-下飯田稲荷-qgrzhnet', 'コンコン神社　（下飯田稲荷）は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         35.836782, 140.646653, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=703', 'ghostmap.jp',
            'community-site',
            'コンコン神社　（下飯田稲荷）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 294: 呼ばわり山　（今熊神社奥社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=705') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '呼ばわり山　（今熊神社奥社）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('呼ばわり山　（今熊神社奥社）', '呼ばわり山-今熊神社奥社-52eeux47', '呼ばわり山　（今熊神社奥社）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.71059, 139.215927, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=705', 'ghostmap.jp',
            'community-site',
            '呼ばわり山　（今熊神社奥社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 295: 御宿町火葬場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=707') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御宿町火葬場' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御宿町火葬場', '御宿町火葬場-w4jsgifb', '御宿町火葬場は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.198735, 140.366831, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=707', 'ghostmap.jp',
            'community-site',
            '御宿町火葬場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 296: 多良崎城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=709') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多良崎城跡' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多良崎城跡', '多良崎城跡-3duco52u', '多良崎城跡は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.432436, 140.572411, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=709', 'ghostmap.jp',
            'community-site',
            '多良崎城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 297: 海沢隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=711') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '海沢隧道' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('海沢隧道', '海沢隧道-eiitb2ia', '海沢隧道は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.796959, 139.121704, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=711', 'ghostmap.jp',
            'community-site',
            '海沢隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 298: ホテルすずきヶ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=713') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルすずきヶ池' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルすずきヶ池', 'ホテルすずきヶ池-7sexch0v', 'ホテルすずきヶ池は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.211816, 139.439152, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=713', 'ghostmap.jp',
            'community-site',
            'ホテルすずきヶ池とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 299: 焼肉・ラーメン大萬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=717') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '焼肉・ラーメン大萬' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('焼肉・ラーメン大萬', '焼肉・ラーメン大萬-zii1ygaf', '焼肉・ラーメン大萬は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.716766, 139.37994, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=717', 'ghostmap.jp',
            'community-site',
            '焼肉・ラーメン大萬とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 300: 角田ジェイソン村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=719') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '角田ジェイソン村' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('角田ジェイソン村', '角田ジェイソン村-2usuuc5i', '角田ジェイソン村は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.794228, 138.824192, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=719', 'ghostmap.jp',
            'community-site',
            '角田ジェイソン村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 301: 太宰府天満宮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=721') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '太宰府天満宮' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('太宰府天満宮', '太宰府天満宮-fm7u45v7', '太宰府天満宮は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.52137, 130.534885, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=721', 'ghostmap.jp',
            'community-site',
            '太宰府天満宮とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 302: クリスタルハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=723') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'クリスタルハウス' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('クリスタルハウス', 'クリスタルハウス-75ssho26', 'クリスタルハウスは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.258234, 139.439852, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=723', 'ghostmap.jp',
            'community-site',
            'クリスタルハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 303: くらやみ坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=727') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'くらやみ坂' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('くらやみ坂', 'くらやみ坂-j25zcxjp', 'くらやみ坂は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.452699, 139.618575, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=727', 'ghostmap.jp',
            'community-site',
            'くらやみ坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 304: 東光山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=729') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東光山公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東光山公園', '東光山公園-vzcdmahf', '東光山公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         32.098674, 130.360469, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=729', 'ghostmap.jp',
            'community-site',
            '東光山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 305: 妙高大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=731') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙高大橋' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙高大橋', '妙高大橋-szawk4hs', '妙高大橋は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.906061, 138.215743, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=731', 'ghostmap.jp',
            'community-site',
            '妙高大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 306: 白幡神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=733') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白幡神社' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白幡神社', '白幡神社-wu60ym6j', '白幡神社は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.639101, 140.122998, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=733', 'ghostmap.jp',
            'community-site',
            '白幡神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 307: 五色台トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=735') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五色台トンネル' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五色台トンネル', '五色台トンネル-zdcwvjxv', '五色台トンネルは、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.345053, 133.941337, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=735', 'ghostmap.jp',
            'community-site',
            '五色台トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 308: 油壺 三浦道寸の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=737') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '油壺 三浦道寸の墓' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('油壺 三浦道寸の墓', '油壺-三浦道寸の墓-7qdvjwg6', '油壺 三浦道寸の墓は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.162835, 139.613219, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=737', 'ghostmap.jp',
            'community-site',
            '油壺 三浦道寸の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 309: 東京競馬場第３コーナーの大欅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=739') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東京競馬場第３コーナーの大欅' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東京競馬場第３コーナーの大欅', '東京競馬場第3コーナーの大欅-b38zhwka', '東京競馬場第３コーナーの大欅は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.66195, 139.488115, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=739', 'ghostmap.jp',
            'community-site',
            '東京競馬場第３コーナーの大欅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 310: 旅荘嵯峨
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=741') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旅荘嵯峨' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旅荘嵯峨', '旅荘嵯峨-jmjsz3b7', '旅荘嵯峨は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.878491, 139.313968, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=741', 'ghostmap.jp',
            'community-site',
            '旅荘嵯峨とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 311: 稲葉隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=743') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '稲葉隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('稲葉隧道', '稲葉隧道-4dmxe59h', '稲葉隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.358748, 139.049449, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=743', 'ghostmap.jp',
            'community-site',
            '稲葉隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 312: 加嶺隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=747') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加嶺隧道' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加嶺隧道', '加嶺隧道-a2bse0ih', '加嶺隧道は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.210294, 133.665526, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=747', 'ghostmap.jp',
            'community-site',
            '加嶺隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 313: 神明公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=749') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神明公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神明公園', '神明公園-18fu7zs0', '神明公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.888669, 139.034418, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=749', 'ghostmap.jp',
            'community-site',
            '神明公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 314: 真野原山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=751') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '真野原山荘' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('真野原山荘', '真野原山荘-q84ouq93', '真野原山荘は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.37892, 133.663571, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=751', 'ghostmap.jp',
            'community-site',
            '真野原山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 315: 五十嵐トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=753') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五十嵐トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五十嵐トンネル', '五十嵐トンネル-lcwkrc2e', '五十嵐トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.879526, 138.949011, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=753', 'ghostmap.jp',
            'community-site',
            '五十嵐トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 316: 骸骨山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=757') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '骸骨山' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('骸骨山', '骸骨山-r7tf0e7r', '骸骨山は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.617921, 127.927111, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=757', 'ghostmap.jp',
            'community-site',
            '骸骨山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 317: 国際通り
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=761') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '国際通り' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('国際通り', '国際通り-5kjou145', '国際通りは、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.217844, 127.690765, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=761', 'ghostmap.jp',
            'community-site',
            '国際通りとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 318: 瀬長島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=765') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '瀬長島' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('瀬長島', '瀬長島-e0byatsc', '瀬長島は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.175043, 127.644051, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=765', 'ghostmap.jp',
            'community-site',
            '瀬長島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 319: 大久野島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=767') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大久野島' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大久野島', '大久野島-1wdxtjy1', '大久野島は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         34.31028, 132.993031, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=767', 'ghostmap.jp',
            'community-site',
            '大久野島とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 320: 夜間瀬隧道（竜王トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=771') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '夜間瀬隧道（竜王トンネル）' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('夜間瀬隧道（竜王トンネル）', '夜間瀬隧道竜王トンネル-lxj7h4j2', '夜間瀬隧道（竜王トンネル）は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.780256, 138.438446, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=771', 'ghostmap.jp',
            'community-site',
            '夜間瀬隧道（竜王トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 321: ホテルロマン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=773') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルロマン' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルロマン', 'ホテルロマン-6mmje0bl', 'ホテルロマンは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.076166, 139.595423, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=773', 'ghostmap.jp',
            'community-site',
            'ホテルロマンとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 322: 不動の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=775') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '不動の滝' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('不動の滝', '不動の滝-vp4olfhk', '不動の滝は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.149788, 133.673403, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=775', 'ghostmap.jp',
            'community-site',
            '不動の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 323: 屋島隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=777') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '屋島隧道' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('屋島隧道', '屋島隧道-kqatd08e', '屋島隧道は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.363985, 134.104109, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=777', 'ghostmap.jp',
            'community-site',
            '屋島隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 324: ガーナ森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=783') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ガーナ森' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ガーナ森', 'ガーナ森-cfnyljup', 'ガーナ森は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.200879, 127.677533, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=783', 'ghostmap.jp',
            'community-site',
            'ガーナ森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 325: 鈴蘭公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=785') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鈴蘭公園' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鈴蘭公園', '鈴蘭公園-xnvf225l', '鈴蘭公園は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.946501, 143.197639, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=785', 'ghostmap.jp',
            'community-site',
            '鈴蘭公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 326: 泣く木跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=787') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '泣く木跡' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('泣く木跡', '泣く木跡-8chscm43', '泣く木跡は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.075887, 141.756655, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=787', 'ghostmap.jp',
            'community-site',
            '泣く木跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 327: 京急黄金町駅前の駐車場と大岡川
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=789') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '京急黄金町駅前の駐車場と大岡川' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('京急黄金町駅前の駐車場と大岡川', '京急黄金町駅前の駐車場と大岡川-h2mrk72a', '京急黄金町駅前の駐車場と大岡川は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.440035, 139.622634, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=789', 'ghostmap.jp',
            'community-site',
            '京急黄金町駅前の駐車場と大岡川とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 328: 滝畑ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=795') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝畑ダム' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝畑ダム', '滝畑ダム-p2qwyjqq', '滝畑ダムは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.389558, 135.52676, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=795', 'ghostmap.jp',
            'community-site',
            '滝畑ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 329: 梨の木隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=797') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '梨の木隧道' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('梨の木隧道', '梨の木隧道-qjdw0abk', '梨の木隧道は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.387066, 135.534979, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=797', 'ghostmap.jp',
            'community-site',
            '梨の木隧道とは？事件・現在・心霊現象の噂',
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