-- =====================================================
-- shinrei: imported via scripts/import-spots.ts
-- generated: 2026-05-23T16:06:15.071Z
-- rows: 270
-- 取得元は内部 sources にのみ保存、公開画面には出ません
-- =====================================================

-- 1) spots を挿入（重複は ON CONFLICT で回避）
do $$
declare
  new_spot_id uuid;
begin

  -- 1: ふる里村工芸館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5002') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ふる里村工芸館' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ふる里村工芸館', 'ふる里村工芸館-ma1xeigy', 'ふる里村工芸館は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.528421, 137.807968, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5002', 'ghostmap.jp',
            'community-site',
            'ふる里村工芸館とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 2: 銭洗弁財天 宇賀福神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5004') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '銭洗弁財天 宇賀福神社' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('銭洗弁財天 宇賀福神社', '銭洗弁財天-宇賀福神社-fqrg5339', '銭洗弁財天 宇賀福神社は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.325687, 139.542216, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5004', 'ghostmap.jp',
            'community-site',
            '銭洗弁財天 宇賀福神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 3: 岡山県の山奥にある廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5006') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岡山県の山奥にある廃墟' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岡山県の山奥にある廃墟', '岡山県の山奥にある廃墟-j7hk9fjt', '岡山県の山奥にある廃墟は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.722035, 133.69031, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5006', 'ghostmap.jp',
            'community-site',
            '岡山県の山奥にある廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 4: 美人林
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5008') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美人林' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美人林', '美人林-zg1hg3hd', '美人林は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.100646, 138.618622, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5008', 'ghostmap.jp',
            'community-site',
            '美人林とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 5: 北海道百年記念塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5010') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北海道百年記念塔' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北海道百年記念塔', '北海道百年記念塔-rhe3rkh9', '北海道百年記念塔は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.055959, 141.495868, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5010', 'ghostmap.jp',
            'community-site',
            '北海道百年記念塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 6: 栃木県総合運動公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5012') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '栃木県総合運動公園' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('栃木県総合運動公園', '栃木県総合運動公園-76ry9qqg', '栃木県総合運動公園は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.510861, 139.859734, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5012', 'ghostmap.jp',
            'community-site',
            '栃木県総合運動公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 7: 松川大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5014') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松川大橋' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松川大橋', '松川大橋-1eu7piqg', '松川大橋は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.870387, 140.914528, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5014', 'ghostmap.jp',
            'community-site',
            '松川大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 8: 榎下神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5016') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '榎下神社' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('榎下神社', '榎下神社-b09wc82z', '榎下神社は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.3213, 138.857494, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5016', 'ghostmap.jp',
            'community-site',
            '榎下神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 9: 緑町公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5018') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑町公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑町公園', '緑町公園-3effmo4c', '緑町公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.648288, 139.332357, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5018', 'ghostmap.jp',
            'community-site',
            '緑町公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 10: 松山GC下のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5020') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松山GC下のトンネル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松山GC下のトンネル', '松山gc下のトンネル-1vdcy6ia', '松山GC下のトンネルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.802077, 132.924688, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5020', 'ghostmap.jp',
            'community-site',
            '松山GC下のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 11: 高尾みころも霊堂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5022') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高尾みころも霊堂' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高尾みころも霊堂', '高尾みころも霊堂-uwl223pc', '高尾みころも霊堂は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.637012, 139.282314, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5022', 'ghostmap.jp',
            'community-site',
            '高尾みころも霊堂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 12: 見晴トンネル（見晴隧道）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5024') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '見晴トンネル（見晴隧道）' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('見晴トンネル（見晴隧道）', '見晴トンネル見晴隧道-v8qe272e', '見晴トンネル（見晴隧道）は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.436301, 139.658926, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5024', 'ghostmap.jp',
            'community-site',
            '見晴トンネル（見晴隧道）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 13: 駿河台の首吊り山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5030') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '駿河台の首吊り山' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('駿河台の首吊り山', '駿河台の首吊り山-r6gsltab', '駿河台の首吊り山は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.826664, 139.336117, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5030', 'ghostmap.jp',
            'community-site',
            '駿河台の首吊り山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 14: 霊街道2号線
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5032') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '霊街道2号線' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('霊街道2号線', '霊街道2号線-hy2fundn', '霊街道2号線は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.062549, 131.490164, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5032', 'ghostmap.jp',
            'community-site',
            '霊街道2号線とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 15: 旅館の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5036') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旅館の廃墟' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旅館の廃墟', '旅館の廃墟-efai8dh0', '旅館の廃墟は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.079186, 129.967553, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5036', 'ghostmap.jp',
            'community-site',
            '旅館の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 16: 世田谷公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5040') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '世田谷公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('世田谷公園', '世田谷公園-gn498gpn', '世田谷公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.642841, 139.682061, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5040', 'ghostmap.jp',
            'community-site',
            '世田谷公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 17: 前沢森の広場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5042') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '前沢森の広場' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('前沢森の広場', '前沢森の広場-f6msxbwi', '前沢森の広場は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.741637, 139.516942, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5042', 'ghostmap.jp',
            'community-site',
            '前沢森の広場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 18: かっぱ寿司栃木店の隣
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5044') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'かっぱ寿司栃木店の隣' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('かっぱ寿司栃木店の隣', 'かっぱ寿司栃木店の隣-t3t7dp8d', 'かっぱ寿司栃木店の隣は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.383701, 139.716548, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5044', 'ghostmap.jp',
            'community-site',
            'かっぱ寿司栃木店の隣とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 19: 西荒川ダム（東古屋ダム）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5046') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西荒川ダム（東古屋ダム）' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西荒川ダム（東古屋ダム）', '西荒川ダム東古屋ダム-jtsvm8jt', '西荒川ダム（東古屋ダム）は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.816775, 139.808235, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5046', 'ghostmap.jp',
            'community-site',
            '西荒川ダム（東古屋ダム）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 20: 三ツ沢墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5048') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三ツ沢墓地' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三ツ沢墓地', '三ツ沢墓地-c1agyzot', '三ツ沢墓地は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.479538, 139.607154, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5048', 'ghostmap.jp',
            'community-site',
            '三ツ沢墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 21: 呪われたコンビニ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5050') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '呪われたコンビニ' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('呪われたコンビニ', '呪われたコンビニ-hy86jems', '呪われたコンビニは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.056768, 141.328547, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5050', 'ghostmap.jp',
            'community-site',
            '呪われたコンビニとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 22: 有馬わんわんランド（跡地）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5052') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '有馬わんわんランド（跡地）' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('有馬わんわんランド（跡地）', '有馬わんわんランド跡地-quini49n', '有馬わんわんランド（跡地）は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.801479, 135.252386, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5052', 'ghostmap.jp',
            'community-site',
            '有馬わんわんランド（跡地）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 23: 総武はな遊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5054') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '総武はな遊園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('総武はな遊園', '総武はな遊園-u4mf8q45', '総武はな遊園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.739338, 140.714697, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5054', 'ghostmap.jp',
            'community-site',
            '総武はな遊園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 24: ホテルサンヒルズ相模湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5056') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルサンヒルズ相模湖' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルサンヒルズ相模湖', 'ホテルサンヒルズ相模湖-n3ihenbi', 'ホテルサンヒルズ相模湖は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.614108, 139.15665, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5056', 'ghostmap.jp',
            'community-site',
            'ホテルサンヒルズ相模湖とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 25: 桜公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5058') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桜公園' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桜公園', '桜公園-t088q55k', '桜公園は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.750795, 130.633492, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5058', 'ghostmap.jp',
            'community-site',
            '桜公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 26: 伊勢神宮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5060') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伊勢神宮' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伊勢神宮', '伊勢神宮-lq2iymd0', '伊勢神宮は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.487174, 136.703267, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5060', 'ghostmap.jp',
            'community-site',
            '伊勢神宮 とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 27: 岐阜公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5064') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岐阜公園' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岐阜公園', '岐阜公園-kpvbtcvb', '岐阜公園は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.434694, 136.774356, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5064', 'ghostmap.jp',
            'community-site',
            '岐阜公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 28: 市ヶ尾横穴古墳群
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5066') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '市ヶ尾横穴古墳群' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('市ヶ尾横穴古墳群', '市ヶ尾横穴古墳群-529k232d', '市ヶ尾横穴古墳群は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.55718, 139.54002, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5066', 'ghostmap.jp',
            'community-site',
            '市ヶ尾横穴古墳群とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 29: 星美学園高等学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5068') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '星美学園高等学校' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('星美学園高等学校', '星美学園高等学校-7c4ddjyk', '星美学園高等学校は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.783442, 139.716257, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5068', 'ghostmap.jp',
            'community-site',
            '星美学園高等学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 30: 川崎市立井田病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5070') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川崎市立井田病院' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川崎市立井田病院', '川崎市立井田病院-mpd4i4mv', '川崎市立井田病院は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.559423, 139.640812, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5070', 'ghostmap.jp',
            'community-site',
            '川崎市立井田病院とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 31: 成立学園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5072') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '成立学園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('成立学園', '成立学園-umrnenpy', '成立学園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.77143, 139.724915, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5072', 'ghostmap.jp',
            'community-site',
            '成立学園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 32: 比丘尼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5074') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '比丘尼' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('比丘尼', '比丘尼-iryf28a5', '比丘尼は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.756483, 139.600889, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5074', 'ghostmap.jp',
            'community-site',
            '比丘尼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 33: 西海橋水族館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5076') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西海橋水族館' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西海橋水族館', '西海橋水族館-fc7p83wx', '西海橋水族館は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.053696, 129.762742, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5076', 'ghostmap.jp',
            'community-site',
            '西海橋水族館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 34: 郷之原トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5078') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '郷之原トンネル' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('郷之原トンネル', '郷之原トンネル-2ymcukgi', '郷之原トンネルは、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.387715, 130.814418, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5078', 'ghostmap.jp',
            'community-site',
            '郷之原トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 35: 北条線列車脱線転覆事故現場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5080') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北条線列車脱線転覆事故現場' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北条線列車脱線転覆事故現場', '北条線列車脱線転覆事故現場-kpb7trk8', '北条線列車脱線転覆事故現場は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.862462, 134.876627, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5080', 'ghostmap.jp',
            'community-site',
            '北条線列車脱線転覆事故現場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 36: 土山駅周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5082') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '土山駅周辺' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('土山駅周辺', '土山駅周辺-26osq96n', '土山駅周辺は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.720438, 134.888865, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5082', 'ghostmap.jp',
            'community-site',
            '土山駅周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 37: 長野滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5084') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長野滝' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長野滝', '長野滝-05ids0jz', '長野滝は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.76291, 130.496292, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5084', 'ghostmap.jp',
            'community-site',
            '長野滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 38: 赤羽駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5086') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤羽駅' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤羽駅', '赤羽駅-61myr7q4', '赤羽駅は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.777753, 139.721087, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5086', 'ghostmap.jp',
            'community-site',
            '赤羽駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 39: 供中口古戦場　キリシタン殉教地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5088') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '供中口古戦場　キリシタン殉教地' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('供中口古戦場　キリシタン殉教地', '供中口古戦場-キリシタン殉教地-c6rq26id', '供中口古戦場　キリシタン殉教地は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.594512, 140.458982, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5088', 'ghostmap.jp',
            'community-site',
            '供中口古戦場　キリシタン殉教地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 40: 立江寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5090') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立江寺' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立江寺', '立江寺-wxkrwqbk', '立江寺は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.967851, 134.605694, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5090', 'ghostmap.jp',
            'community-site',
            '立江寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 41: 鉢形城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5096') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鉢形城跡' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鉢形城跡', '鉢形城跡-xuit0apt', '鉢形城跡は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.107293, 139.193371, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5096', 'ghostmap.jp',
            'community-site',
            '鉢形城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 42: 佐野市役所田沼庁舎
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5098') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐野市役所田沼庁舎' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐野市役所田沼庁舎', '佐野市役所田沼庁舎-xjb35bhb', '佐野市役所田沼庁舎は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.375057, 139.570114, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5098', 'ghostmap.jp',
            'community-site',
            '佐野市役所田沼庁舎とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 43: 手取川古戦場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5100') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '手取川古戦場' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('手取川古戦場', '手取川古戦場-ocbfa0u8', '手取川古戦場は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.478978, 136.479584, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5100', 'ghostmap.jp',
            'community-site',
            '手取川古戦場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 44: 佐野レジャーランド跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5102') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐野レジャーランド跡地' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐野レジャーランド跡地', '佐野レジャーランド跡地-0fzjti8t', '佐野レジャーランド跡地は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.304546, 139.622369, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5102', 'ghostmap.jp',
            'community-site',
            '佐野レジャーランド跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 45: コウモリ屋敷（日本特殊鋼管大湊工場）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5104') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'コウモリ屋敷（日本特殊鋼管大湊工場）' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('コウモリ屋敷（日本特殊鋼管大湊工場）', 'コウモリ屋敷日本特殊鋼管大湊工場-2n9ilj83', 'コウモリ屋敷（日本特殊鋼管大湊工場）は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.278898, 141.193604, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5104', 'ghostmap.jp',
            'community-site',
            'コウモリ屋敷（日本特殊鋼管大湊工場）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 46: 敦賀国際スキー場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5108') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '敦賀国際スキー場' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('敦賀国際スキー場', '敦賀国際スキー場-mnfco4l1', '敦賀国際スキー場は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.536999, 136.097223, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5108', 'ghostmap.jp',
            'community-site',
            '敦賀国際スキー場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 47: 小山ゆうえんち跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5110') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小山ゆうえんち跡地' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小山ゆうえんち跡地', '小山ゆうえんち跡地-vuvqw5p3', '小山ゆうえんち跡地は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.334488, 139.809072, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5110', 'ghostmap.jp',
            'community-site',
            '小山ゆうえんち跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 48: 長石林道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5112') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長石林道' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長石林道', '長石林道-pj0m58ps', '長石林道は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.449418, 139.439211, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5112', 'ghostmap.jp',
            'community-site',
            '長石林道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 49: 中山峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5114') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中山峠' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中山峠', '中山峠-23hrf5p4', '中山峠は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.898326, 140.04175, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5114', 'ghostmap.jp',
            'community-site',
            '中山峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 50: 砂丘トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5116') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '砂丘トンネル' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('砂丘トンネル', '砂丘トンネル-8di6f34o', '砂丘トンネルは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.531381, 134.229635, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5116', 'ghostmap.jp',
            'community-site',
            '砂丘トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 51: ホテルサザンナッツ(旧ホテル結城)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5118') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルサザンナッツ(旧ホテル結城)' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルサザンナッツ(旧ホテル結城)', 'ホテルサザンナッツ旧ホテル結城-4dkprk45', 'ホテルサザンナッツ(旧ホテル結城)は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         37.104296, 140.23265, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5118', 'ghostmap.jp',
            'community-site',
            'ホテルサザンナッツ(旧ホテル結城)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 52: アクタ西宮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5120') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'アクタ西宮' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('アクタ西宮', 'アクタ西宮-evhhsmyq', 'アクタ西宮は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.746867, 135.357732, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5120', 'ghostmap.jp',
            'community-site',
            'アクタ西宮とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 53: 根岸共同墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5122') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '根岸共同墓地' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('根岸共同墓地', '根岸共同墓地-ahe93idm', '根岸共同墓地は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.426675, 139.63245, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5122', 'ghostmap.jp',
            'community-site',
            '根岸共同墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 54: 南風見田
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5124') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南風見田' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南風見田', '南風見田-zgy7j1m9', '南風見田は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         24.272633, 123.831573, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5124', 'ghostmap.jp',
            'community-site',
            '南風見田とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 55: 小鷹刑場跡供養碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5126') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小鷹刑場跡供養碑' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小鷹刑場跡供養碑', '小鷹刑場跡供養碑-azl6mxnn', '小鷹刑場跡供養碑は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.678416, 141.152596, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5126', 'ghostmap.jp',
            'community-site',
            '小鷹刑場跡供養碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 56: 水野病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5128') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水野病院' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水野病院', '水野病院-zsilbjxr', '水野病院は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.723772, 135.531566, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5128', 'ghostmap.jp',
            'community-site',
            '水野病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 57: 交通危除地蔵尊及び妙正寺川改修記念碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5130') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '交通危除地蔵尊及び妙正寺川改修記念碑' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('交通危除地蔵尊及び妙正寺川改修記念碑', '交通危除地蔵尊及び妙正寺川改修記念碑-qpoax1zl', '交通危除地蔵尊及び妙正寺川改修記念碑は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.722183, 139.637816, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5130', 'ghostmap.jp',
            'community-site',
            '交通危除地蔵尊及び妙正寺川改修記念碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 58: 真嘉比南公園（ハーフムーンヒル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5132') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '真嘉比南公園（ハーフムーンヒル）' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('真嘉比南公園（ハーフムーンヒル）', '真嘉比南公園ハーフムーンヒル-h760hyf2', '真嘉比南公園（ハーフムーンヒル）は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.22295, 127.701937, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5132', 'ghostmap.jp',
            'community-site',
            '真嘉比南公園（ハーフムーンヒル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 59: 日向薬師
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5134') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日向薬師' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日向薬師', '日向薬師-s3njkajf', '日向薬師は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.439521, 139.274952, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5134', 'ghostmap.jp',
            'community-site',
            '日向薬師とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 60: 横浜にある無縁仏の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5136') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '横浜にある無縁仏の墓' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('横浜にある無縁仏の墓', '横浜にある無縁仏の墓-zwhy4tqu', '横浜にある無縁仏の墓は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.502783, 139.580499, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5136', 'ghostmap.jp',
            'community-site',
            '横浜にある無縁仏の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 61: 正伝寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5140') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正伝寺' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正伝寺', '正伝寺-g48j7g04', '正伝寺は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.599698, 140.456686, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5140', 'ghostmap.jp',
            'community-site',
            '正伝寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 62: 龍飛崎
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5142') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '龍飛崎' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('龍飛崎', '龍飛崎-qh9w9n0a', '龍飛崎は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.259743, 140.342102, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5142', 'ghostmap.jp',
            'community-site',
            '龍飛崎とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 63: 一光小中学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5144') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一光小中学校' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一光小中学校', '一光小中学校-n54thxzr', '一光小中学校は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.061908, 136.06935, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5144', 'ghostmap.jp',
            'community-site',
            '一光小中学校とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 64: 内山霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5146') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内山霊園' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内山霊園', '内山霊園-rgwj2vom', '内山霊園は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.07409, 138.029049, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5146', 'ghostmap.jp',
            'community-site',
            '内山霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 65: 笹子墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5154') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笹子墓地' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笹子墓地', '笹子墓地-ggow1cug', '笹子墓地は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.605631, 138.832124, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5154', 'ghostmap.jp',
            'community-site',
            '笹子墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 66: 旧東海道　金谷坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5156') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧東海道　金谷坂' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧東海道　金谷坂', '旧東海道-金谷坂-ibu4h5fd', '旧東海道　金谷坂は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.815631, 138.123849, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5156', 'ghostmap.jp',
            'community-site',
            '旧東海道　金谷坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 67: 夜景が見える駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5160') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '夜景が見える駐車場' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('夜景が見える駐車場', '夜景が見える駐車場-nwer5qon', '夜景が見える駐車場は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.433564, 136.551466, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5160', 'ghostmap.jp',
            'community-site',
            '夜景が見える駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 68: 加賀野八幡神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5164') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加賀野八幡神社' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加賀野八幡神社', '加賀野八幡神社-imb6ckin', '加賀野八幡神社は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.374483, 136.635414, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5164', 'ghostmap.jp',
            'community-site',
            '加賀野八幡神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 69: 絹の道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5170') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '絹の道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('絹の道', '絹の道-wpy2zpzu', '絹の道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.621998, 139.351922, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5170', 'ghostmap.jp',
            'community-site',
            '絹の道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 70: 青山古戦場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5172') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青山古戦場跡' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青山古戦場跡', '青山古戦場跡-m6k92j06', '青山古戦場跡は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.842352, 134.626137, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5172', 'ghostmap.jp',
            'community-site',
            '青山古戦場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 71: 旧 高木山バス停
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5174') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧 高木山バス停' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧 高木山バス停', '旧-高木山バス停-8seaqudu', '旧 高木山バス停は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.859226, 135.542325, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5174', 'ghostmap.jp',
            'community-site',
            '旧 高木山バス停とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 72: 薮塚石切場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5176') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '薮塚石切場跡' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('薮塚石切場跡', '薮塚石切場跡-jakziwnj', '薮塚石切場跡は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.368591, 139.322996, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5176', 'ghostmap.jp',
            'community-site',
            '薮塚石切場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 73: 血の池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5178') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '血の池' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('血の池', '血の池-2u538aut', '血の池は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.121251, 139.403953, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5178', 'ghostmap.jp',
            'community-site',
            '血の池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 74: 苫屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5180') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '苫屋' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('苫屋', '苫屋-64nvoxga', '苫屋は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         40.066984, 141.777695, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5180', 'ghostmap.jp',
            'community-site',
            '苫屋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 75: 前沢第3緑地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5182') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '前沢第3緑地' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('前沢第3緑地', '前沢第3緑地-m08fyjqa', '前沢第3緑地は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.741766, 139.516582, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5182', 'ghostmap.jp',
            'community-site',
            '前沢第3緑地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 76: 筑波山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5184') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '筑波山' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('筑波山', '筑波山-bapoa9ot', '筑波山は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.225255, 140.107535, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5184', 'ghostmap.jp',
            'community-site',
            '筑波山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 77: 釜ノ台集落
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5186') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '釜ノ台集落' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('釜ノ台集落', '釜ノ台集落-yxko9tn3', '釜ノ台集落は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.161152, 139.883444, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5186', 'ghostmap.jp',
            'community-site',
            '釜ノ台集落とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 78: 三橋総合公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5190') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三橋総合公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三橋総合公園', '三橋総合公園-ltzljj0d', '三橋総合公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.912572, 139.596936, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5190', 'ghostmap.jp',
            'community-site',
            '三橋総合公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 79: 黒目川
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5192') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒目川' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒目川', '黒目川-ddd3vcc3', '黒目川は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.766113, 139.539643, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5192', 'ghostmap.jp',
            'community-site',
            '黒目川とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 80: 大池公園六角堂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5194') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大池公園六角堂' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大池公園六角堂', '大池公園六角堂-jni0u3ec', '大池公園六角堂は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.221308, 140.331746, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5194', 'ghostmap.jp',
            'community-site',
            '大池公園六角堂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 81: 佐野市運動公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5196') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐野市運動公園' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐野市運動公園', '佐野市運動公園-xrkn2ely', '佐野市運動公園は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.35176, 139.551562, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5196', 'ghostmap.jp',
            'community-site',
            '佐野市運動公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 82: 小名浜三崎公園第7駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5200') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小名浜三崎公園第7駐車場' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小名浜三崎公園第7駐車場', '小名浜三崎公園第7駐車場-nghjzfmp', '小名浜三崎公園第7駐車場は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.937484, 140.918475, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5200', 'ghostmap.jp',
            'community-site',
            '小名浜三崎公園第7駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 83: 立石様
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5204') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立石様' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立石様', '立石様-5yzxrld1', '立石様は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.739623, 139.855616, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5204', 'ghostmap.jp',
            'community-site',
            '立石様とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 84: キューピー寺（瀧の入不動尊）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5206') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'キューピー寺（瀧の入不動尊）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('キューピー寺（瀧の入不動尊）', 'キューピー寺瀧の入不動尊-37hpqlc2', 'キューピー寺（瀧の入不動尊）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.760795, 139.380667, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5206', 'ghostmap.jp',
            'community-site',
            'キューピー寺（瀧の入不動尊）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 85: 旧鞍掛峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5208') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧鞍掛峠' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧鞍掛峠', '旧鞍掛峠-bby7eacx', '旧鞍掛峠は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.643863, 139.792936, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5208', 'ghostmap.jp',
            'community-site',
            '旧鞍掛峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 86: 多福寺ゴミ捨て場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5214') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多福寺ゴミ捨て場' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多福寺ゴミ捨て場', '多福寺ゴミ捨て場-7n80l6j8', '多福寺ゴミ捨て場は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.834809, 139.491427, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5214', 'ghostmap.jp',
            'community-site',
            '多福寺ゴミ捨て場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 87: 弐分方町の切通し
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5216') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弐分方町の切通し' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弐分方町の切通し', '弐分方町の切通し-mzz10xes', '弐分方町の切通しは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.681678, 139.276471, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5216', 'ghostmap.jp',
            'community-site',
            '弐分方町の切通しとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 88: 墨俣一夜城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5224') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '墨俣一夜城' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('墨俣一夜城', '墨俣一夜城-uyeglz21', '墨俣一夜城は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.367076, 136.687732, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5224', 'ghostmap.jp',
            'community-site',
            '墨俣一夜城とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 89: 不破の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5226') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '不破の滝' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('不破の滝', '不破の滝-ppj8fqke', '不破の滝は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.419133, 136.517487, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5226', 'ghostmap.jp',
            'community-site',
            '不破の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 90: 滝谷避難小屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5230') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝谷避難小屋' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝谷避難小屋', '滝谷避難小屋-x9xt5zz1', '滝谷避難小屋は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.311736, 137.631397, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5230', 'ghostmap.jp',
            'community-site',
            '滝谷避難小屋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 91: みろくの里スタジオ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5232') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'みろくの里スタジオ' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('みろくの里スタジオ', 'みろくの里スタジオ-94ru74ky', 'みろくの里スタジオは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.410274, 133.303416, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5232', 'ghostmap.jp',
            'community-site',
            'みろくの里スタジオとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 92: 中央公園の隣にある団地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5234') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中央公園の隣にある団地' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中央公園の隣にある団地', '中央公園の隣にある団地-dz0atn22', '中央公園の隣にある団地は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.716966, 139.559785, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5234', 'ghostmap.jp',
            'community-site',
            '中央公園の隣にある団地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 93: 丸亀城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5236') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丸亀城' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丸亀城', '丸亀城-40o6x531', '丸亀城は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.286013, 133.800259, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5236', 'ghostmap.jp',
            'community-site',
            '丸亀城とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 94: 大仏公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5238') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大仏公園' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大仏公園', '大仏公園-1t7llzrk', '大仏公園は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.548323, 140.544372, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5238', 'ghostmap.jp',
            'community-site',
            '大仏公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 95: 十二湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5240') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十二湖' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十二湖', '十二湖-38myaql4', '十二湖は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.563669, 139.979706, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5240', 'ghostmap.jp',
            'community-site',
            '十二湖とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 96: 南原峡キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5242') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南原峡キャンプ場' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南原峡キャンプ場', '南原峡キャンプ場-a3gsczw0', '南原峡キャンプ場は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.576974, 132.513313, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5242', 'ghostmap.jp',
            'community-site',
            '南原峡キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 97: 旧あいのり温泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5244') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧あいのり温泉' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧あいのり温泉', '旧あいのり温泉-xhg4dwtg', '旧あいのり温泉は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.426198, 140.634164, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5244', 'ghostmap.jp',
            'community-site',
            '旧あいのり温泉とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 98: 出戸バスターミナル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5246') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '出戸バスターミナル' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('出戸バスターミナル', '出戸バスターミナル-wl4jgb4r', '出戸バスターミナルは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.609475, 135.565479, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5246', 'ghostmap.jp',
            'community-site',
            '出戸バスターミナルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 99: 極楽橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5256') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '極楽橋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('極楽橋', '極楽橋-jhafsq2x', '極楽橋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.770313, 135.648011, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5256', 'ghostmap.jp',
            'community-site',
            '極楽橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 100: あかしあ公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5258') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'あかしあ公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('あかしあ公園', 'あかしあ公園-sr4glgfi', 'あかしあ公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.953086, 139.141493, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5258', 'ghostmap.jp',
            'community-site',
            'あかしあ公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 101: スーパー玉出　今里店
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5260') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'スーパー玉出　今里店' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('スーパー玉出　今里店', 'スーパー玉出-今里店-c5t667so', 'スーパー玉出　今里店は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.6624, 135.541433, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5260', 'ghostmap.jp',
            'community-site',
            'スーパー玉出　今里店とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 102: 浜町隧道トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5264') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浜町隧道トンネル' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浜町隧道トンネル', '浜町隧道トンネル-kdkxi6ul', '浜町隧道トンネルは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.687879, 139.790055, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5264', 'ghostmap.jp',
            'community-site',
            '浜町隧道トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 103: 西蔵王山荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5266') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西蔵王山荘' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西蔵王山荘', '西蔵王山荘-v0h3eire', '西蔵王山荘は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.199565, 140.370198, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5266', 'ghostmap.jp',
            'community-site',
            '西蔵王山荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 104: JR越後線小針駅のトイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5268') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'JR越後線小針駅のトイレ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('JR越後線小針駅のトイレ', 'jr越後線小針駅のトイレ-a26sfi4w', 'JR越後線小針駅のトイレは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.889609, 138.991396, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5268', 'ghostmap.jp',
            'community-site',
            'JR越後線小針駅のトイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 105: 赤塚不動の滝（首洗いの滝）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5270') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤塚不動の滝（首洗いの滝）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤塚不動の滝（首洗いの滝）', '赤塚不動の滝首洗いの滝-e3kn4ti2', '赤塚不動の滝（首洗いの滝）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.782676, 139.6452, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5270', 'ghostmap.jp',
            'community-site',
            '赤塚不動の滝（首洗いの滝）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 106: 大倉ダム下公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5272') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大倉ダム下公園' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大倉ダム下公園', '大倉ダム下公園-8sx6h5al', '大倉ダム下公園は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.320591, 140.705654, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5272', 'ghostmap.jp',
            'community-site',
            '大倉ダム下公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 107: 松ヶ岡公園　瓢箪池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5274') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松ヶ岡公園　瓢箪池' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松ヶ岡公園　瓢箪池', '松ヶ岡公園-瓢箪池-rvkdnw2l', '松ヶ岡公園　瓢箪池は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.056117, 140.882484, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5274', 'ghostmap.jp',
            'community-site',
            '松ヶ岡公園　瓢箪池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 108: 神辺城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5276') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神辺城跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神辺城跡', '神辺城跡-3qmrderr', '神辺城跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.538167, 133.385031, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5276', 'ghostmap.jp',
            'community-site',
            '神辺城跡  とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 109: 五太子の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5278') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五太子の滝' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五太子の滝', '五太子の滝-6ot6e0tx', '五太子の滝は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.069243, 136.0599, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5278', 'ghostmap.jp',
            'community-site',
            '五太子の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 110: 漂流病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5280') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '漂流病院' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('漂流病院', '漂流病院-9at3ahwz', '漂流病院は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.308865, 135.183842, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5280', 'ghostmap.jp',
            'community-site',
            '漂流病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 111: 大浦中学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5282') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大浦中学校' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大浦中学校', '大浦中学校-jspajxnj', '大浦中学校は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.733346, 129.880977, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5282', 'ghostmap.jp',
            'community-site',
            '大浦中学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 112: 稲佐山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5286') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '稲佐山' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('稲佐山', '稲佐山-k3molmj6', '稲佐山は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.752917, 129.850419, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5286', 'ghostmap.jp',
            'community-site',
            '稲佐山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 113: 峰谷橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5298') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '峰谷橋' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('峰谷橋', '峰谷橋-d4g89p15', '峰谷橋は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.779142, 139.016093, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5298', 'ghostmap.jp',
            'community-site',
            '峰谷橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 114: 多摩山荘跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5302') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多摩山荘跡地' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多摩山荘跡地', '多摩山荘跡地-mtoz6k41', '多摩山荘跡地は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.637854, 139.39415, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5302', 'ghostmap.jp',
            'community-site',
            '多摩山荘跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 115: 飛田新地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5304') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '飛田新地' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('飛田新地', '飛田新地-sqgexm4d', '飛田新地は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.643628, 135.505979, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5304', 'ghostmap.jp',
            'community-site',
            '飛田新地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 116: 異音道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5316') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '異音道' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('異音道', '異音道-xmojzm7c', '異音道は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.126805, 136.702542, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5316', 'ghostmap.jp',
            'community-site',
            '異音道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 117: プチマドンナ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5318') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'プチマドンナ' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('プチマドンナ', 'プチマドンナ-etccgkrr', 'プチマドンナは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.028173, 132.046115, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5318', 'ghostmap.jp',
            'community-site',
            'プチマドンナとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 118: 摂津市平和公園 祈る子
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5322') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '摂津市平和公園 祈る子' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('摂津市平和公園 祈る子', '摂津市平和公園-祈る子-9deb4xwl', '摂津市平和公園 祈る子は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.782151, 135.559089, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5322', 'ghostmap.jp',
            'community-site',
            '摂津市平和公園 祈る子とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 119: 鳥飼大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5330') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥飼大橋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥飼大橋', '鳥飼大橋-2ifame4k', '鳥飼大橋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.758132, 135.573521, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5330', 'ghostmap.jp',
            'community-site',
            '鳥飼大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 120: 坂本国際墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5338') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '坂本国際墓地' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('坂本国際墓地', '坂本国際墓地-iogqbuta', '坂本国際墓地は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.765038, 129.868022, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5338', 'ghostmap.jp',
            'community-site',
            '坂本国際墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 121: 琴平岳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5340') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '琴平岳' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('琴平岳', '琴平岳-d0l8pin2', '琴平岳は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.944751, 129.990272, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5340', 'ghostmap.jp',
            'community-site',
            '琴平岳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 122: 黒髪山の墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5342') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒髪山の墓地' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒髪山の墓地', '黒髪山の墓地-9bm03c7x', '黒髪山の墓地は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.701674, 135.820091, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5342', 'ghostmap.jp',
            'community-site',
            '黒髪山の墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 123: 南大隅町の廃病院(阿久根病院)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5346') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南大隅町の廃病院(阿久根病院)' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南大隅町の廃病院(阿久根病院)', '南大隅町の廃病院阿久根病院-tva54m30', '南大隅町の廃病院(阿久根病院)は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.215395, 130.771029, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5346', 'ghostmap.jp',
            'community-site',
            '南大隅町の廃病院(阿久根病院)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 124: 二葉山平和塔（仏舎利塔）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5348') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '二葉山平和塔（仏舎利塔）' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('二葉山平和塔（仏舎利塔）', '二葉山平和塔仏舎利塔-easfvfz5', '二葉山平和塔（仏舎利塔）は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.405885, 132.477945, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5348', 'ghostmap.jp',
            'community-site',
            '二葉山平和塔（仏舎利塔）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 125: 鹿児島空港地下道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5350') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鹿児島空港地下道' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鹿児島空港地下道', '鹿児島空港地下道-jqa3hgsw', '鹿児島空港地下道は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.8064, 130.71598, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5350', 'ghostmap.jp',
            'community-site',
            '鹿児島空港地下道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 126: 武蔵野市立第四小学校近くの路地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5352') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武蔵野市立第四小学校近くの路地' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武蔵野市立第四小学校近くの路地', '武蔵野市立第四小学校近くの路地-k1ssk0p5', '武蔵野市立第四小学校近くの路地は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.711064, 139.580736, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5352', 'ghostmap.jp',
            'community-site',
            '武蔵野市立第四小学校近くの路地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 127: 宮古街道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5354') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮古街道' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮古街道', '宮古街道-1bb1rbhh', '宮古街道は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.691237, 141.191477, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5354', 'ghostmap.jp',
            'community-site',
            '宮古街道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 128: 吉浦墓地奥の廃道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5356') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '吉浦墓地奥の廃道' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('吉浦墓地奥の廃道', '吉浦墓地奥の廃道-i4b73usf', '吉浦墓地奥の廃道は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.25751, 132.537343, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5356', 'ghostmap.jp',
            'community-site',
            '吉浦墓地奥の廃道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 129: 下奥多摩橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5370') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下奥多摩橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下奥多摩橋', '下奥多摩橋-mj3s9f40', '下奥多摩橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.782876, 139.272759, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5370', 'ghostmap.jp',
            'community-site',
            '下奥多摩橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 130: 藤橋城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5386') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '藤橋城跡' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('藤橋城跡', '藤橋城跡-xcewymk1', '藤橋城跡は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.804101, 139.300536, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5386', 'ghostmap.jp',
            'community-site',
            '藤橋城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 131: グリーンロッジ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5390') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'グリーンロッジ' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('グリーンロッジ', 'グリーンロッジ-drhrpmtz', 'グリーンロッジは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.83462, 139.360584, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5390', 'ghostmap.jp',
            'community-site',
            'グリーンロッジとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 132: 天神沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5392') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天神沼' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天神沼', '天神沼-cq73brzg', '天神沼は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.352785, 139.253856, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5392', 'ghostmap.jp',
            'community-site',
            '天神沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 133: 追分跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5394') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '追分跡' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('追分跡', '追分跡-7y72ce59', '追分跡は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.792019, 139.277877, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5394', 'ghostmap.jp',
            'community-site',
            '追分跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 134: 笹仁田峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5398') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笹仁田峠' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笹仁田峠', '笹仁田峠-8x8sufel', '笹仁田峠は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.813538, 139.298443, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5398', 'ghostmap.jp',
            'community-site',
            '笹仁田峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 135: 加藤塚交差点 / 加藤塚立体
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5400') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加藤塚交差点 / 加藤塚立体' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加藤塚交差点 / 加藤塚立体', '加藤塚交差点-加藤塚立体-lzaszju5', '加藤塚交差点 / 加藤塚立体は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.76877, 139.347409, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5400', 'ghostmap.jp',
            'community-site',
            '加藤塚交差点 / 加藤塚立体とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 136: 詫間海軍航空隊　防空壕跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5416') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '詫間海軍航空隊　防空壕跡' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('詫間海軍航空隊　防空壕跡', '詫間海軍航空隊-防空壕跡-9k6cguce', '詫間海軍航空隊　防空壕跡は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.234382, 133.639558, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5416', 'ghostmap.jp',
            'community-site',
            '詫間海軍航空隊　防空壕跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 137: 坂中峠廃教会（牟礼の教会）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5418') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '坂中峠廃教会（牟礼の教会）' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('坂中峠廃教会（牟礼の教会）', '坂中峠廃教会牟礼の教会-8iahhptu', '坂中峠廃教会（牟礼の教会）は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.710674, 138.205428, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5418', 'ghostmap.jp',
            'community-site',
            '坂中峠廃教会（牟礼の教会）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 138: 村山団地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5420') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '村山団地' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('村山団地', '村山団地-wtv22v1d', '村山団地は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.743635, 139.409961, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5420', 'ghostmap.jp',
            'community-site',
            '村山団地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 139: 西来院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5426') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西来院' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西来院', '西来院-odzt30sw', '西来院は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.713358, 137.716252, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5426', 'ghostmap.jp',
            'community-site',
            '西来院とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 140: 桂の里公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5430') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '桂の里公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('桂の里公園', '桂の里公園-hb19r9x3', '桂の里公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.796548, 139.328249, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5430', 'ghostmap.jp',
            'community-site',
            '桂の里公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 141: 須花溜
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5434') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '須花溜' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('須花溜', '須花溜-24h2jyf6', '須花溜は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.397165, 139.487086, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5434', 'ghostmap.jp',
            'community-site',
            '須花溜とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 142: 陸軍井戸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5436') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '陸軍井戸' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('陸軍井戸', '陸軍井戸-6chwo5ek', '陸軍井戸は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.792288, 139.325921, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5436', 'ghostmap.jp',
            'community-site',
            '陸軍井戸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 143: 花畑団地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5438') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花畑団地' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花畑団地', '花畑団地-bsggqake', '花畑団地は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.806135, 139.813154, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5438', 'ghostmap.jp',
            'community-site',
            '花畑団地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 144: 南蔵院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5440') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南蔵院' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南蔵院', '南蔵院-fwhlu3df', '南蔵院は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.73122, 139.64638, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5440', 'ghostmap.jp',
            'community-site',
            '南蔵院とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 145: 狭山湖外周道路
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5442') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '狭山湖外周道路' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('狭山湖外周道路', '狭山湖外周道路-0mmpide0', '狭山湖外周道路は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.781461, 139.371541, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5442', 'ghostmap.jp',
            'community-site',
            '狭山湖外周道路とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 146: 大荷田川橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5444') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大荷田川橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大荷田川橋', '大荷田川橋-m11reklg', '大荷田川橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.764761, 139.289367, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5444', 'ghostmap.jp',
            'community-site',
            '大荷田川橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 147: 麦わら帽子のお爺さんが出る山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5446') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '麦わら帽子のお爺さんが出る山' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('麦わら帽子のお爺さんが出る山', '麦わら帽子のお爺さんが出る山-rqb1iykp', '麦わら帽子のお爺さんが出る山は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.556869, 132.431317, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5446', 'ghostmap.jp',
            'community-site',
            '麦わら帽子のお爺さんが出る山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 148: 大雷神社隣の墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5448') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大雷神社隣の墓地' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大雷神社隣の墓地', '大雷神社隣の墓地-qnyrsco4', '大雷神社隣の墓地は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.14513, 140.334935, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5448', 'ghostmap.jp',
            'community-site',
            '大雷神社隣の墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 149: 竹間沢こぶしの里（古井戸地蔵）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5450') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '竹間沢こぶしの里（古井戸地蔵）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('竹間沢こぶしの里（古井戸地蔵）', '竹間沢こぶしの里古井戸地蔵-hzzozrbp', '竹間沢こぶしの里（古井戸地蔵）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.821677, 139.548275, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5450', 'ghostmap.jp',
            'community-site',
            '竹間沢こぶしの里（古井戸地蔵）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 150: 谷町JCT付近
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5452') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷町JCT付近' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷町JCT付近', '谷町jct付近-3ebzdysi', '谷町JCT付近は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.666954, 139.738945, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5452', 'ghostmap.jp',
            'community-site',
            '谷町JCT付近とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 151: 萱田第一緑地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5454') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '萱田第一緑地' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('萱田第一緑地', '萱田第一緑地-em8otlez', '萱田第一緑地は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.726818, 140.103168, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5454', 'ghostmap.jp',
            'community-site',
            '萱田第一緑地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 152: 浅間モーターロッジ跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5456') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浅間モーターロッジ跡地' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浅間モーターロッジ跡地', '浅間モーターロッジ跡地-75njvpkt', '浅間モーターロッジ跡地は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.340484, 138.552284, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5456', 'ghostmap.jp',
            'community-site',
            '浅間モーターロッジ跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 153: 沖縄師範健児之塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5462') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '沖縄師範健児之塔' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('沖縄師範健児之塔', '沖縄師範健児之塔-83r1jnj7', '沖縄師範健児之塔は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.09109, 127.719326, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5462', 'ghostmap.jp',
            'community-site',
            '沖縄師範健児之塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 154: 恵風園病院跡地裏
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5464') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '恵風園病院跡地裏' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('恵風園病院跡地裏', '恵風園病院跡地裏-y184qpvo', '恵風園病院跡地裏は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.30719, 139.497408, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5464', 'ghostmap.jp',
            'community-site',
            '恵風園病院跡地裏とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 155: ラブホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5468') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ラブホテル' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ラブホテル', 'ラブホテル-y6z979a6', 'ラブホテルは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.699964, 139.970168, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5468', 'ghostmap.jp',
            'community-site',
            'ラブホテルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 156: 共栄公園と加藤学園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5474') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '共栄公園と加藤学園' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('共栄公園と加藤学園', '共栄公園と加藤学園-d3ibw1sb', '共栄公園と加藤学園は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.11825, 138.869088, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5474', 'ghostmap.jp',
            'community-site',
            '共栄公園と加藤学園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 157: 大沼キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5478') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大沼キャンプ場' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大沼キャンプ場', '大沼キャンプ場-0ql1zrtd', '大沼キャンプ場は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.419857, 140.10488, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5478', 'ghostmap.jp',
            'community-site',
            '大沼キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 158: きぬ川館本店（かっぱ温泉）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5480') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'きぬ川館本店（かっぱ温泉）' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('きぬ川館本店（かっぱ温泉）', 'きぬ川館本店かっぱ温泉-igapzspu', 'きぬ川館本店（かっぱ温泉）は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.836563, 139.721805, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5480', 'ghostmap.jp',
            'community-site',
            'きぬ川館本店（かっぱ温泉）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 159: 首無し地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5484') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首無し地蔵' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首無し地蔵', '首無し地蔵-t66gj892', '首無し地蔵は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.514369, 133.478132, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5484', 'ghostmap.jp',
            'community-site',
            '首無し地蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 160: 弁天橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5488') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弁天橋' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弁天橋', '弁天橋-rqto4789', '弁天橋は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.601546, 136.124232, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5488', 'ghostmap.jp',
            'community-site',
            '弁天橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 161: 切れ池跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5492') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '切れ池跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('切れ池跡', '切れ池跡-2cmhpw28', '切れ池跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.508277, 133.508988, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5492', 'ghostmap.jp',
            'community-site',
            '切れ池跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 162: 西条藩処刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5494') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西条藩処刑場跡' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西条藩処刑場跡', '西条藩処刑場跡-gst6snq0', '西条藩処刑場跡は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.912643, 133.182798, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5494', 'ghostmap.jp',
            'community-site',
            '西条藩処刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 163: 浦島橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5496') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浦島橋' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浦島橋', '浦島橋-cexdqhqf', '浦島橋は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.513776, 133.42062, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5496', 'ghostmap.jp',
            'community-site',
            '浦島橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 164: お清明神と供養地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5502') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'お清明神と供養地蔵' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('お清明神と供養地蔵', 'お清明神と供養地蔵-0rpsy3vv', 'お清明神と供養地蔵は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.51446, 133.487095, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5502', 'ghostmap.jp',
            'community-site',
            'お清明神と供養地蔵とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 165: 犬鳴川
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5506') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬鳴川' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬鳴川', '犬鳴川-1hhing5y', '犬鳴川は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.68838, 130.573939, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5506', 'ghostmap.jp',
            'community-site',
            '犬鳴川とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 166: 獄門石
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5508') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '獄門石' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('獄門石', '獄門石-09bnn1f6', '獄門石は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.678826, 133.861156, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5508', 'ghostmap.jp',
            'community-site',
            '獄門石とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 167: 青蓮寺の首切り地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5510') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青蓮寺の首切り地蔵' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青蓮寺の首切り地蔵', '青蓮寺の首切り地蔵-te9ggoap', '青蓮寺の首切り地蔵は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.607091, 136.111979, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5510', 'ghostmap.jp',
            'community-site',
            '青蓮寺の首切り地蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 168: 老司いぜき
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5512') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老司いぜき' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老司いぜき', '老司いぜき-aqmsvid0', '老司いぜきは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.533909, 130.426898, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5512', 'ghostmap.jp',
            'community-site',
            '老司いぜきとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 169: 伊賀越峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5514') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伊賀越峠' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伊賀越峠', '伊賀越峠-w53yvjc9', '伊賀越峠は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.778352, 136.336588, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5514', 'ghostmap.jp',
            'community-site',
            '伊賀越峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 170: 五色ノ浜
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5516') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五色ノ浜' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五色ノ浜', '五色ノ浜-rbx43ug8', '五色ノ浜は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.427609, 133.458036, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5516', 'ghostmap.jp',
            'community-site',
            '五色ノ浜とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 171: 旧名古屋トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5518') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧名古屋トンネル' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧名古屋トンネル', '旧名古屋トンネル-2cbdotyp', '旧名古屋トンネルは、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.441713, 133.313106, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5518', 'ghostmap.jp',
            'community-site',
            '旧名古屋トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 172: 老司古墳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5520') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老司古墳' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老司古墳', '老司古墳-ft91m8jo', '老司古墳は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.530466, 130.420182, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5520', 'ghostmap.jp',
            'community-site',
            '老司古墳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 173: 野多目大池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5522') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野多目大池' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野多目大池', '野多目大池-nu9xiuhp', '野多目大池は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.538428, 130.418489, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5522', 'ghostmap.jp',
            'community-site',
            '野多目大池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 174: キムンドの滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5524') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'キムンドの滝' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('キムンドの滝', 'キムンドの滝-kzyw2xoe', 'キムンドの滝は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.618871, 140.935722, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5524', 'ghostmap.jp',
            'community-site',
            'キムンドの滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 175: ヨコ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5530') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ヨコ' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ヨコ', 'ヨコ-nkpvpuk3', 'ヨコは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.379128, 133.513862, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5530', 'ghostmap.jp',
            'community-site',
            'ヨコとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 176: 南11条おおたに公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5534') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南11条おおたに公園' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南11条おおたに公園', '南11条おおたに公園-dx0oez3e', '南11条おおたに公園は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.044176, 141.333835, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5534', 'ghostmap.jp',
            'community-site',
            '南11条おおたに公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 177: 芝久保二郵便局に行く道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5536') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '芝久保二郵便局に行く道' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('芝久保二郵便局に行く道', '芝久保二郵便局に行く道-6ojfscnh', '芝久保二郵便局に行く道は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.728997, 139.525508, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5536', 'ghostmap.jp',
            'community-site',
            '芝久保二郵便局に行く道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 178: 三段滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5538') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三段滝' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三段滝', '三段滝-vqp5neqi', '三段滝は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.350069, 142.150576, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5538', 'ghostmap.jp',
            'community-site',
            '三段滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 179: 柳原集落
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5540') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '柳原集落' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('柳原集落', '柳原集落-ya3w6gfb', '柳原集落は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.66462, 130.550677, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5540', 'ghostmap.jp',
            'community-site',
            '柳原集落とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 180: 因島アメニティ公園(ザウルくん）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5542') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '因島アメニティ公園(ザウルくん）' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('因島アメニティ公園(ザウルくん）', '因島アメニティ公園ザウルくん-afakn9ti', '因島アメニティ公園(ザウルくん）は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         34.356446, 133.16951, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5542', 'ghostmap.jp',
            'community-site',
            '因島アメニティ公園(ザウルくん）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 181: 龍満池・竜桜公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5548') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '龍満池・竜桜公園' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('龍満池・竜桜公園', '龍満池・竜桜公園-9gg7fwev', '龍満池・竜桜公園は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.24316, 134.034596, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5548', 'ghostmap.jp',
            'community-site',
            '龍満池・竜桜公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 182: 老松橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5552') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老松橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老松橋', '老松橋-inppkoeg', '老松橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.530031, 130.426778, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5552', 'ghostmap.jp',
            'community-site',
            '老松橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 183: 井尻橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5554') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '井尻橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('井尻橋', '井尻橋-xa4qz6hu', '井尻橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.553971, 130.434595, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5554', 'ghostmap.jp',
            'community-site',
            '井尻橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 184: 野多目小学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5562') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野多目小学校' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野多目小学校', '野多目小学校-uklmpuof', '野多目小学校は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.540598, 130.424534, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5562', 'ghostmap.jp',
            'community-site',
            '野多目小学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 185: 印旛郡栄町松崎街道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5568') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '印旛郡栄町松崎街道' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('印旛郡栄町松崎街道', '印旛郡栄町松崎街道-t81olo4g', '印旛郡栄町松崎街道は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.820536, 140.264038, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5568', 'ghostmap.jp',
            'community-site',
            '印旛郡栄町松崎街道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 186: 手城東公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5576') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '手城東公園' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('手城東公園', '手城東公園-h1p3cft4', '手城東公園は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.480944, 133.400373, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5576', 'ghostmap.jp',
            'community-site',
            '手城東公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 187: 霊園の溜池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5580') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '霊園の溜池' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('霊園の溜池', '霊園の溜池-4wzz8nxx', '霊園の溜池は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.512053, 133.494756, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5580', 'ghostmap.jp',
            'community-site',
            '霊園の溜池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 188: 三朝戦場跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5582') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三朝戦場跡地' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三朝戦場跡地', '三朝戦場跡地-mu47i8ni', '三朝戦場跡地は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.408338, 133.831057, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5582', 'ghostmap.jp',
            'community-site',
            '三朝戦場跡地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 189: 下日佐橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5584') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下日佐橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下日佐橋', '下日佐橋-c31ww9ny', '下日佐橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.541609, 130.430992, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5584', 'ghostmap.jp',
            'community-site',
            '下日佐橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 190: 椎坂峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5586') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '椎坂峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('椎坂峠', '椎坂峠-z2oci1vh', '椎坂峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.654898, 139.171512, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5586', 'ghostmap.jp',
            'community-site',
            '椎坂峠とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 191: 霧積ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5588') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '霧積ダム' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('霧積ダム', '霧積ダム-7li5b508', '霧積ダムは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.368567, 138.700676, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5588', 'ghostmap.jp',
            'community-site',
            '霧積ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 192: 赤谷水管橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5590') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤谷水管橋' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤谷水管橋', '赤谷水管橋-5ntmbb4u', '赤谷水管橋は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.729681, 138.894745, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5590', 'ghostmap.jp',
            'community-site',
            '赤谷水管橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 193: 赤城大沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5592') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤城大沼' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤城大沼', '赤城大沼-pstxsu32', '赤城大沼は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.555275, 139.175835, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5592', 'ghostmap.jp',
            'community-site',
            '赤城大沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 194: 串山海水浴場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5594') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '串山海水浴場' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('串山海水浴場', '串山海水浴場-6r9pd7km', '串山海水浴場は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.859226, 129.699655, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5594', 'ghostmap.jp',
            'community-site',
            '串山海水浴場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 195: 城跡近辺の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5596') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '城跡近辺の廃墟' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('城跡近辺の廃墟', '城跡近辺の廃墟-lyc1h4kt', '城跡近辺の廃墟は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.854151, 129.696662, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5596', 'ghostmap.jp',
            'community-site',
            '城跡近辺の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 196: 八神街道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5598') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八神街道' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八神街道', '八神街道-q3gb8prl', '八神街道は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.263833, 136.706357, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5598', 'ghostmap.jp',
            'community-site',
            '八神街道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 197: 少彦根神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5600') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '少彦根神社' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('少彦根神社', '少彦根神社-a81iv2sp', '少彦根神社は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.435907, 141.271605, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5600', 'ghostmap.jp',
            'community-site',
            '少彦根神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 198: 板橋池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5602') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '板橋池' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('板橋池', '板橋池-f2nax8o9', '板橋池は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.935982, 140.240747, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5602', 'ghostmap.jp',
            'community-site',
            '板橋池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 199: 陽南グランド脇にあるトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5604') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '陽南グランド脇にあるトンネル' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('陽南グランド脇にあるトンネル', '陽南グランド脇にあるトンネル-punevgn8', '陽南グランド脇にあるトンネルは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.534559, 139.86316, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5604', 'ghostmap.jp',
            'community-site',
            '陽南グランド脇にあるトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 200: 所沢パークタウン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5606') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '所沢パークタウン' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('所沢パークタウン', '所沢パークタウン-76unk32e', '所沢パークタウンは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.800813, 139.469425, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5606', 'ghostmap.jp',
            'community-site',
            '所沢パークタウンとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 201: 井戸公園の赤い橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5608') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '井戸公園の赤い橋' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('井戸公園の赤い橋', '井戸公園の赤い橋-j9rx4el0', '井戸公園の赤い橋は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.50844, 133.501104, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5608', 'ghostmap.jp',
            'community-site',
            '井戸公園の赤い橋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 202: 老司緑地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5610') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老司緑地' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老司緑地', '老司緑地-c9ehzv37', '老司緑地は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.535854, 130.418791, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5610', 'ghostmap.jp',
            'community-site',
            '老司緑地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 203: 下白水大塚古墳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5612') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下白水大塚古墳' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下白水大塚古墳', '下白水大塚古墳-pxh2kd5o', '下白水大塚古墳は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.529305, 130.441761, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5612', 'ghostmap.jp',
            'community-site',
            '下白水大塚古墳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 204: 仁別国民の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5614') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仁別国民の森' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仁別国民の森', '仁別国民の森-cew7kxyu', '仁別国民の森は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.808759, 140.264122, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5614', 'ghostmap.jp',
            'community-site',
            '仁別国民の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 205: 黒い影が立つトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5616') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒い影が立つトンネル' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒い影が立つトンネル', '黒い影が立つトンネル-hdjt3tmh', '黒い影が立つトンネルは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.535064, 133.727966, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5616', 'ghostmap.jp',
            'community-site',
            '黒い影が立つトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 206: 今光橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5618') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '今光橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('今光橋', '今光橋-vi0ns2n9', '今光橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.519915, 130.426178, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5618', 'ghostmap.jp',
            'community-site',
            '今光橋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 207: 備後福山藩処刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5620') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '備後福山藩処刑場跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('備後福山藩処刑場跡', '備後福山藩処刑場跡-mjtnb8nz', '備後福山藩処刑場跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.503153, 133.36735, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5620', 'ghostmap.jp',
            'community-site',
            '備後福山藩処刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 208: フラワータウン駅のバス停
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5624') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'フラワータウン駅のバス停' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('フラワータウン駅のバス停', 'フラワータウン駅のバス停-lmjne4pw', 'フラワータウン駅のバス停は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.885931, 135.199642, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5624', 'ghostmap.jp',
            'community-site',
            'フラワータウン駅のバス停とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 209: 妙見橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5626') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙見橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙見橋', '妙見橋-rjcco46z', '妙見橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.52332, 130.424747, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5626', 'ghostmap.jp',
            'community-site',
            '妙見橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 210: 野多目中央公園隣の墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5628') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野多目中央公園隣の墓地' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野多目中央公園隣の墓地', '野多目中央公園隣の墓地-s9ct0g8t', '野多目中央公園隣の墓地は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.53843, 130.424615, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5628', 'ghostmap.jp',
            'community-site',
            '野多目中央公園隣の墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 211: 専故寺跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5630') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '専故寺跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('専故寺跡', '専故寺跡-ccohoa2l', '専故寺跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.494212, 133.383953, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5630', 'ghostmap.jp',
            'community-site',
            '専故寺跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 212: 老司墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5632') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老司墓地' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老司墓地', '老司墓地-mad9g1oe', '老司墓地は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.534715, 130.420949, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5632', 'ghostmap.jp',
            'community-site',
            '老司墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 213: 御厨駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5636') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御厨駅' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御厨駅', '御厨駅-g6koiexu', '御厨駅は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.71859, 137.885398, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5636', 'ghostmap.jp',
            'community-site',
            '御厨駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 214: 室生ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5640') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '室生ダム' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('室生ダム', '室生ダム-81vlvzpz', '室生ダムは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.555258, 136.00699, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5640', 'ghostmap.jp',
            'community-site',
            '室生ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 215: 的場橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5644') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '的場橋' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('的場橋', '的場橋-7gtf1c3l', '的場橋は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.546301, 130.431061, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5644', 'ghostmap.jp',
            'community-site',
            '的場橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 216: 南行徳公園（えんぴつ公園）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5650') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南行徳公園（えんぴつ公園）' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南行徳公園（えんぴつ公園）', '南行徳公園えんぴつ公園-i7zjzijs', '南行徳公園（えんぴつ公園）は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.675107, 139.902262, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5650', 'ghostmap.jp',
            'community-site',
            '南行徳公園（えんぴつ公園）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 217: 厚狭ゴルフ倶楽部入口のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5652') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '厚狭ゴルフ倶楽部入口のトンネル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('厚狭ゴルフ倶楽部入口のトンネル', '厚狭ゴルフ倶楽部入口のトンネル-ht78mb7q', '厚狭ゴルフ倶楽部入口のトンネルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.026914, 131.126626, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5652', 'ghostmap.jp',
            'community-site',
            '厚狭ゴルフ倶楽部入口のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 218: キッコーマンアリーナ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5654') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'キッコーマンアリーナ' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('キッコーマンアリーナ', 'キッコーマンアリーナ-wvq4pbum', 'キッコーマンアリーナは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.858885, 139.917731, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5654', 'ghostmap.jp',
            'community-site',
            'キッコーマンアリーナとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 219: 的場橋近くの墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5656') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '的場橋近くの墓地' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('的場橋近くの墓地', '的場橋近くの墓地-9irmed0h', '的場橋近くの墓地は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.546793, 130.430135, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5656', 'ghostmap.jp',
            'community-site',
            '的場橋近くの墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 220: 十思公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5662') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十思公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十思公園', '十思公園-2gaq7p61', '十思公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.691083, 139.777666, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5662', 'ghostmap.jp',
            'community-site',
            '十思公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 221: 丸二ホテル伊勢の郷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5664') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丸二ホテル伊勢の郷' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丸二ホテル伊勢の郷', '丸二ホテル伊勢の郷-5bfjiifc', '丸二ホテル伊勢の郷は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.518424, 136.616053, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5664', 'ghostmap.jp',
            'community-site',
            '丸二ホテル伊勢の郷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 222: 和田にある大木
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5668') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '和田にある大木' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('和田にある大木', '和田にある大木-ds911uve', '和田にある大木は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.548312, 130.428303, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5668', 'ghostmap.jp',
            'community-site',
            '和田にある大木とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 223: うらわ自動車教習所前にある歩道橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5670') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'うらわ自動車教習所前にある歩道橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('うらわ自動車教習所前にある歩道橋', 'うらわ自動車教習所前にある歩道橋-c8otkxmy', 'うらわ自動車教習所前にある歩道橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.838663, 139.676815, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5670', 'ghostmap.jp',
            'community-site',
            'うらわ自動車教習所前にある歩道橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 224: 仏壇放置されてる 悲しき家
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5672') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仏壇放置されてる 悲しき家' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仏壇放置されてる 悲しき家', '仏壇放置されてる-悲しき家-6npketna', '仏壇放置されてる 悲しき家は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.231783, 136.686554, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5672', 'ghostmap.jp',
            'community-site',
            '仏壇放置されてる 悲しき家とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 225: 那の川交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5674') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '那の川交差点' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('那の川交差点', '那の川交差点-grlfpd92', '那の川交差点は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.575814, 130.411896, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5674', 'ghostmap.jp',
            'community-site',
            '那の川交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 226: 青い旅館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5678') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青い旅館' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青い旅館', '青い旅館-hllzzvfz', '青い旅館は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.628379, 138.758798, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5678', 'ghostmap.jp',
            'community-site',
            '青い旅館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 227: 交差点にある柳の木
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5680') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '交差点にある柳の木' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('交差点にある柳の木', '交差点にある柳の木-y3dgoj5y', '交差点にある柳の木は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.752779, 140.455569, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5680', 'ghostmap.jp',
            'community-site',
            '交差点にある柳の木とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 228: 三津屋の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5682') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三津屋の廃墟' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三津屋の廃墟', '三津屋の廃墟-868mn1m2', '三津屋の廃墟は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.727118, 135.476047, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5682', 'ghostmap.jp',
            'community-site',
            '三津屋の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 229: 県営住宅島二丁目団地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5684') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '県営住宅島二丁目団地' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('県営住宅島二丁目団地', '県営住宅島二丁目団地-9fdl6psy', '県営住宅島二丁目団地は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.39509, 140.343267, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5684', 'ghostmap.jp',
            'community-site',
            '県営住宅島二丁目団地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 230: ガラスの森【跡地】
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5686') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ガラスの森【跡地】' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ガラスの森【跡地】', 'ガラスの森跡地-87z4w0cc', 'ガラスの森【跡地】は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.625836, 140.891964, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5686', 'ghostmap.jp',
            'community-site',
            'ガラスの森【跡地】とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 231: 牧目交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5688') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牧目交差点' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牧目交差点', '牧目交差点-1wophpsc', '牧目交差点は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.171896, 139.459962, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5688', 'ghostmap.jp',
            'community-site',
            '牧目交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 232: 江波皿山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5690') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '江波皿山' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('江波皿山', '江波皿山-yva3114i', '江波皿山は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.371047, 132.432631, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5690', 'ghostmap.jp',
            'community-site',
            '江波皿山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 233: フローラル下　磯
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5692') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'フローラル下　磯' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('フローラル下　磯', 'フローラル下-磯-wfwmzgb6', 'フローラル下　磯は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         34.890424, 139.869372, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5692', 'ghostmap.jp',
            'community-site',
            'フローラル下　磯とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 234: 湯西川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5694') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湯西川ダム' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湯西川ダム', '湯西川ダム-mjmcph63', '湯西川ダムは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.936035, 139.66258, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5694', 'ghostmap.jp',
            'community-site',
            '湯西川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 235: 粟ヶ岳の水源地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5698') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '粟ヶ岳の水源地' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('粟ヶ岳の水源地', '粟ヶ岳の水源地-gxzah2w0', '粟ヶ岳の水源地は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.578956, 139.145208, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5698', 'ghostmap.jp',
            'community-site',
            '粟ヶ岳の水源地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 236: 栗谷沢ダム橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5702') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '栗谷沢ダム橋' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('栗谷沢ダム橋', '栗谷沢ダム橋-eanq1fgr', '栗谷沢ダム橋は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.642291, 139.804297, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5702', 'ghostmap.jp',
            'community-site',
            '栗谷沢ダム橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 237: 利根導水路用水の水門
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5704') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '利根導水路用水の水門' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('利根導水路用水の水門', '利根導水路用水の水門-uahvrnvv', '利根導水路用水の水門は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.185932, 139.472834, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5704', 'ghostmap.jp',
            'community-site',
            '利根導水路用水の水門とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 238: 大谷川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5706') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大谷川ダム' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大谷川ダム', '大谷川ダム-2eoxukq9', '大谷川ダムは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.746897, 139.576535, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5706', 'ghostmap.jp',
            'community-site',
            '大谷川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 239: お化け通り
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5708') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'お化け通り' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('お化け通り', 'お化け通り-4zcic3u5', 'お化け通りは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.67755, 139.596337, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5708', 'ghostmap.jp',
            'community-site',
            'お化け通りとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 240: クリーンパーク茂原周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5710') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'クリーンパーク茂原周辺' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('クリーンパーク茂原周辺', 'クリーンパーク茂原周辺-lh94f47d', 'クリーンパーク茂原周辺は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.466932, 139.873865, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5710', 'ghostmap.jp',
            'community-site',
            'クリーンパーク茂原周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 241: 大沢峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5712') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大沢峠' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大沢峠', '大沢峠-lt7hl42c', '大沢峠は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.690551, 139.090741, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5712', 'ghostmap.jp',
            'community-site',
            '大沢峠とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 242: 行橋総合公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5716') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '行橋総合公園' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('行橋総合公園', '行橋総合公園-jmfmpytq', '行橋総合公園は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.737831, 131.015954, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5716', 'ghostmap.jp',
            'community-site',
            '行橋総合公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 243: 新仲哀トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5720') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新仲哀トンネル' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新仲哀トンネル', '新仲哀トンネル-reojmibc', '新仲哀トンネルは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.680068, 130.883904, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5720', 'ghostmap.jp',
            'community-site',
            '新仲哀トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 244: 信濃川大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5726') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '信濃川大橋' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('信濃川大橋', '信濃川大橋-gnql3qx5', '信濃川大橋は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.853679, 139.020201, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5726', 'ghostmap.jp',
            'community-site',
            '信濃川大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 245: しらさぎ台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5730') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'しらさぎ台' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('しらさぎ台', 'しらさぎ台-oko2ys6e', 'しらさぎ台は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.466416, 141.243881, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5730', 'ghostmap.jp',
            'community-site',
            'しらさぎ台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 246: 阿賀野川頭首工
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5732') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿賀野川頭首工' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿賀野川頭首工', '阿賀野川頭首工-81qtayzo', '阿賀野川頭首工は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.737053, 139.283071, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5732', 'ghostmap.jp',
            'community-site',
            '阿賀野川頭首工とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 247: 渡波海水浴場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5734') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '渡波海水浴場' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('渡波海水浴場', '渡波海水浴場-br43tx15', '渡波海水浴場は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.413349, 141.343746, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5734', 'ghostmap.jp',
            'community-site',
            '渡波海水浴場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 248: 辰ノ口親水公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5736') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '辰ノ口親水公園' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('辰ノ口親水公園', '辰ノ口親水公園-eqcqmv8x', '辰ノ口親水公園は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.58883, 140.418228, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5736', 'ghostmap.jp',
            'community-site',
            '辰ノ口親水公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 249: 金光隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5738') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金光隧道' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金光隧道', '金光隧道-kpzryz7e', '金光隧道は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.535956, 133.626497, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5738', 'ghostmap.jp',
            'community-site',
            '金光隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 250: 土肥金山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5740') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '土肥金山' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('土肥金山', '土肥金山-hrfq6r4j', '土肥金山は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.908282, 138.792858, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5740', 'ghostmap.jp',
            'community-site',
            '土肥金山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 251: 大歳大明神
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5746') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大歳大明神' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大歳大明神', '大歳大明神-k2yk1rke', '大歳大明神は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.525899, 132.352788, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5746', 'ghostmap.jp',
            'community-site',
            '大歳大明神とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 252: 空港南トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5748') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '空港南トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('空港南トンネル', '空港南トンネル-0260cszq', '空港南トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.155462, 137.924688, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5748', 'ghostmap.jp',
            'community-site',
            '空港南トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 253: 禁野車塚古墳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5750') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '禁野車塚古墳' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('禁野車塚古墳', '禁野車塚古墳-bkk12c2x', '禁野車塚古墳は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.81083, 135.657039, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5750', 'ghostmap.jp',
            'community-site',
            '禁野車塚古墳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 254: ホテル天王
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5752') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル天王' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル天王', 'ホテル天王-wr08qeoa', 'ホテル天王は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.288932, 138.838153, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5752', 'ghostmap.jp',
            'community-site',
            'ホテル天王とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 255: 七曲峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5758') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七曲峠' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七曲峠', '七曲峠-qv4r36zl', '七曲峠は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.193847, 140.36362, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5758', 'ghostmap.jp',
            'community-site',
            '七曲峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 256: 全生園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5760') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '全生園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('全生園', '全生園-52k7588g', '全生園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.762618, 139.496565, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5760', 'ghostmap.jp',
            'community-site',
            '全生園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 257: 戻路大番社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5766') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '戻路大番社' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('戻路大番社', '戻路大番社-dktwegz5', '戻路大番社は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.128432, 131.917305, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5766', 'ghostmap.jp',
            'community-site',
            '戻路大番社とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 258: 氷室神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5768') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '氷室神社' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('氷室神社', '氷室神社-jed8azfn', '氷室神社は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.694254, 135.142031, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5768', 'ghostmap.jp',
            'community-site',
            '氷室神社とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 259: 大野橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5772') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大野橋' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大野橋', '大野橋-7e6rgu62', '大野橋は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.486243, 136.659158, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5772', 'ghostmap.jp',
            'community-site',
            '大野橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 260: 北条首やぐら
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5774') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北条首やぐら' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北条首やぐら', '北条首やぐら-fkcog4u8', '北条首やぐらは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.327774, 139.57681, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5774', 'ghostmap.jp',
            'community-site',
            '北条首やぐらとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 261: 待避場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5776') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '待避場' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('待避場', '待避場-cabmd6p2', '待避場は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         37.380982, 137.146902, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5776', 'ghostmap.jp',
            'community-site',
            '待避場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 262: 本牧の白い家
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5778') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本牧の白い家' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本牧の白い家', '本牧の白い家-bgj235j0', '本牧の白い家は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

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
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5778', 'ghostmap.jp',
            'community-site',
            '本牧の白い家とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 263: 人肉館脇の廃旅館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5780') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人肉館脇の廃旅館' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人肉館脇の廃旅館', '人肉館脇の廃旅館-ik2mugjk', '人肉館脇の廃旅館は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.268709, 137.988978, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5780', 'ghostmap.jp',
            'community-site',
            '人肉館脇の廃旅館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 264: 旧碓氷峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5782') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧碓氷峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧碓氷峠', '旧碓氷峠-669shuzr', '旧碓氷峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.371469, 138.658286, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5782', 'ghostmap.jp',
            'community-site',
            '旧碓氷峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 265: 上野沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5784') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上野沼' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上野沼', '上野沼-c8ivixyb', '上野沼は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.350735, 140.054586, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5784', 'ghostmap.jp',
            'community-site',
            '上野沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 266: ホテル山花
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5786') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル山花' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル山花', 'ホテル山花-axsuvaq2', 'ホテル山花は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.150108, 136.254384, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5786', 'ghostmap.jp',
            'community-site',
            'ホテル山花とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 267: 阿那賀慈母観音(桜ヶ丘英霊墓地)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5790') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿那賀慈母観音(桜ヶ丘英霊墓地)' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿那賀慈母観音(桜ヶ丘英霊墓地)', '阿那賀慈母観音桜ヶ丘英霊墓地-bp3c6igx', '阿那賀慈母観音(桜ヶ丘英霊墓地)は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.272707, 134.667344, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5790', 'ghostmap.jp',
            'community-site',
            '阿那賀慈母観音(桜ヶ丘英霊墓地)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 268: 軍畑大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5792') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '軍畑大橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('軍畑大橋', '軍畑大橋-eqqwwfy2', '軍畑大橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.805217, 139.207818, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5792', 'ghostmap.jp',
            'community-site',
            '軍畑大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 269: 丸池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5794') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丸池' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丸池', '丸池-uqxl0emg', '丸池は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.777838, 139.346268, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5794', 'ghostmap.jp',
            'community-site',
            '丸池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 270: 卑弥呼の里（産山リゾートホテル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=5798') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '卑弥呼の里（産山リゾートホテル）' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('卑弥呼の里（産山リゾートホテル）', '卑弥呼の里産山リゾートホテル-hll33bim', '卑弥呼の里（産山リゾートホテル）は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         32.986106, 131.191801, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=5798', 'ghostmap.jp',
            'community-site',
            '卑弥呼の里（産山リゾートホテル）とは？廃墟・事件・現在・心霊現象の噂',
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