-- =====================================================
-- shinrei: imported via scripts/import-spots.ts
-- generated: 2026-05-23T16:07:47.110Z
-- rows: 394
-- 取得元は内部 sources にのみ保存、公開画面には出ません
-- =====================================================

-- 1) spots を挿入（重複は ON CONFLICT で回避）
do $$
declare
  new_spot_id uuid;
begin

  -- 1: 函館山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=2') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '函館山' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('函館山', '函館山-szzstrmo', '函館山は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.758781, 140.712026, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=2', 'ghostmap.jp',
            'community-site',
            '函館山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 2: 恐山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=4') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '恐山' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('恐山', '恐山-vawh3r5r', '恐山は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         41.327556, 141.090407, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=4', 'ghostmap.jp',
            'community-site',
            '恐山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 3: 旧吹上トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=6') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧吹上トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧吹上トンネル', '旧吹上トンネル-wqne9d3l', '旧吹上トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.816328, 139.248541, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=6', 'ghostmap.jp',
            'community-site',
            '旧吹上トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 4: 旧水界トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧水界トンネル' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧水界トンネル', '旧水界トンネル-549qrn4z', '旧水界トンネルは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.708641, 141.369786, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8', 'ghostmap.jp',
            'community-site',
            '旧水界トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 5: 鉄道学園跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=10') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鉄道学園跡地' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鉄道学園跡地', '鉄道学園跡地-hlnk63mk', '鉄道学園跡地は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.613409, 140.062416, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=10', 'ghostmap.jp',
            'community-site',
            '鉄道学園跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 6: 八木山橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=12') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八木山橋' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八木山橋', '八木山橋-6ldzw3b2', '八木山橋は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.250347, 140.852416, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=12', 'ghostmap.jp',
            'community-site',
            '八木山橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 7: 平将門の首塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=14') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平将門の首塚' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平将門の首塚', '平将門の首塚-idkcsj5b', '平将門の首塚は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.687332, 139.76267, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=14', 'ghostmap.jp',
            'community-site',
            '平将門の首塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 8: おせんころがし
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=16') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おせんころがし' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おせんころがし', 'おせんころがし-rbetkejg', 'おせんころがしは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.11616, 140.224179, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=16', 'ghostmap.jp',
            'community-site',
            'おせんころがしとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 9: 群馬の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=18') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '群馬の森' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('群馬の森', '群馬の森-zsfxwhan', '群馬の森は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.29721, 139.076398, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=18', 'ghostmap.jp',
            'community-site',
            '群馬の森とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 10: 旧天城トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=20') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧天城トンネル' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧天城トンネル', '旧天城トンネル-cy70bq2w', '旧天城トンネルは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.830822, 138.934806, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=20', 'ghostmap.jp',
            'community-site',
            '旧天城トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 11: 女鬼トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=22') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '女鬼トンネル' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('女鬼トンネル', '女鬼トンネル-klckhm4r', '女鬼トンネルは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.462733, 136.56057, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=22', 'ghostmap.jp',
            'community-site',
            '女鬼トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 12: ホワイトハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=24') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホワイトハウス' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホワイトハウス', 'ホワイトハウス-pgtc13vb', 'ホワイトハウスは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.792157, 138.820687, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=24', 'ghostmap.jp',
            'community-site',
            'ホワイトハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 13: 清滝トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=26') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '清滝トンネル' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('清滝トンネル', '清滝トンネル-y124o650', '清滝トンネルは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.033448, 135.660575, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=26', 'ghostmap.jp',
            'community-site',
            '清滝トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 14: 犬鳴峠（犬鳴村）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=28') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬鳴峠（犬鳴村）' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬鳴峠（犬鳴村）', '犬鳴峠犬鳴村-6ih2f5cv', '犬鳴峠（犬鳴村）は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.67595, 130.55028, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=28', 'ghostmap.jp',
            'community-site',
            '犬鳴峠（犬鳴村）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 15: 久峰隧道（コツコツトンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=30') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久峰隧道（コツコツトンネル）' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久峰隧道（コツコツトンネル）', '久峰隧道コツコツトンネル-aily5319', '久峰隧道（コツコツトンネル）は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.025901, 131.458515, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=30', 'ghostmap.jp',
            'community-site',
            '久峰隧道（コツコツトンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 16: 富岡吉利支丹供養碑（千人塚）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=32') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '富岡吉利支丹供養碑（千人塚）' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('富岡吉利支丹供養碑（千人塚）', '富岡吉利支丹供養碑千人塚-cnx09x3y', '富岡吉利支丹供養碑（千人塚）は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.511035, 130.040172, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=32', 'ghostmap.jp',
            'community-site',
            '富岡吉利支丹供養碑（千人塚）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 17: 田原坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=34') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '田原坂' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('田原坂', '田原坂-udubuvck', '田原坂は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.91651, 130.645982, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=34', 'ghostmap.jp',
            'community-site',
            '田原坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 18: 牛頸ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=36') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牛頸ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牛頸ダム', '牛頸ダム-x4f5oexs', '牛頸ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.486433, 130.476999, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=36', 'ghostmap.jp',
            'community-site',
            '牛頸ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 19: 二級ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=38') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '二級ダム' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('二級ダム', '二級ダム-58z3ujaq', '二級ダムは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.28249, 132.633203, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=38', 'ghostmap.jp',
            'community-site',
            '二級ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 20: 名護市許田洋館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=40') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '名護市許田洋館' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('名護市許田洋館', '名護市許田洋館-3df92380', '名護市許田洋館は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.544222, 127.960051, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=40', 'ghostmap.jp',
            'community-site',
            '名護市許田洋館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 21: 大谷池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=42') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大谷池' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大谷池', '大谷池-xzqq4qa8', '大谷池は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.753933, 132.744325, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=42', 'ghostmap.jp',
            'community-site',
            '大谷池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 22: 牟礼病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=44') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牟礼病院' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牟礼病院', '牟礼病院-zx4umqc8', '牟礼病院は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.335831, 134.155197, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=44', 'ghostmap.jp',
            'community-site',
            '牟礼病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 23: 旧小別沢トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=46') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧小別沢トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧小別沢トンネル', '旧小別沢トンネル-ou5iyhw4', '旧小別沢トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.046268, 141.283584, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=46', 'ghostmap.jp',
            'community-site',
            '旧小別沢トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 24: 秋ヶ瀬公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=48') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋ヶ瀬公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋ヶ瀬公園', '秋ヶ瀬公園-fpqw6z12', '秋ヶ瀬公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.848722, 139.605308, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=48', 'ghostmap.jp',
            'community-site',
            '秋ヶ瀬公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 25: 頭川トンネル(旧津々良トンネル)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=50') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '頭川トンネル(旧津々良トンネル)' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('頭川トンネル(旧津々良トンネル)', '頭川トンネル旧津良トンネル-elkz042l', '頭川トンネル(旧津々良トンネル)は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.782735, 136.94983, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=50', 'ghostmap.jp',
            'community-site',
            '頭川トンネル(旧津々良トンネル)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 26: 頭川神社（幽霊神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=52') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '頭川神社（幽霊神社）' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('頭川神社（幽霊神社）', '頭川神社幽霊神社-qgudjf9c', '頭川神社（幽霊神社）は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.769153, 136.961257, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=52', 'ghostmap.jp',
            'community-site',
            '頭川神社（幽霊神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 27: 道了堂跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=54') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '道了堂跡' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('道了堂跡', '道了堂跡-pr2beg8t', '道了堂跡は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.624781, 139.348777, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=54', 'ghostmap.jp',
            'community-site',
            '道了堂跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 28: 深泥池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=56') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '深泥池' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('深泥池', '深泥池-j5t4m6nh', '深泥池は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.057716, 135.768449, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=56', 'ghostmap.jp',
            'community-site',
            '深泥池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 29: 将軍塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=58') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '将軍塚' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('将軍塚', '将軍塚-bdb1zduq', '将軍塚は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.002046, 135.787167, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=58', 'ghostmap.jp',
            'community-site',
            '将軍塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 30: 妙見山（しおき場）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=60') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙見山（しおき場）' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙見山（しおき場）', '妙見山しおき場-2a5iuc6z', '妙見山（しおき場）は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.935736, 135.471423, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=60', 'ghostmap.jp',
            'community-site',
            '妙見山（しおき場）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 31: 一龍旅館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=62') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一龍旅館' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一龍旅館', '一龍旅館-um76fp0b', '一龍旅館は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.397643, 135.382497, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=62', 'ghostmap.jp',
            'community-site',
            '一龍旅館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 32: 旧仲村トンネル（立石トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=66') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧仲村トンネル（立石トンネル）' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧仲村トンネル（立石トンネル）', '旧仲村トンネル立石トンネル-2j8ic196', '旧仲村トンネル（立石トンネル）は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.311681, 134.152223, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=66', 'ghostmap.jp',
            'community-site',
            '旧仲村トンネル（立石トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 33: ホテル祇園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=68') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル祇園' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル祇園', 'ホテル祇園-k6jngryx', 'ホテル祇園は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         35.077501, 135.886539, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=68', 'ghostmap.jp',
            'community-site',
            'ホテル祇園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 34: 汀公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=70') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '汀公園' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('汀公園', '汀公園-y2dbpgpy', '汀公園は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.230084, 135.168417, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=70', 'ghostmap.jp',
            'community-site',
            '汀公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 35: つがね落しの滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=74') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'つがね落しの滝' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('つがね落しの滝', 'つがね落しの滝-ij7x3cru', 'つがね落しの滝は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.914114, 129.69839, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=74', 'ghostmap.jp',
            'community-site',
            'つがね落しの滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 36: 旧小峰トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=76') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧小峰トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧小峰トンネル', '旧小峰トンネル-1e7t3i3w', '旧小峰トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.715162, 139.232531, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=76', 'ghostmap.jp',
            'community-site',
            '旧小峰トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 37: 宅部池（たっちゃん池）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=78') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宅部池（たっちゃん池）' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宅部池（たっちゃん池）', '宅部池たっちゃん池-orwhd42j', '宅部池（たっちゃん池）は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.760092, 139.441584, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=78', 'ghostmap.jp',
            'community-site',
            '宅部池（たっちゃん池）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 38: 姿見の井戸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=80') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '姿見の井戸' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('姿見の井戸', '姿見の井戸-9px3a8je', '姿見の井戸は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.743763, 139.615024, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=80', 'ghostmap.jp',
            'community-site',
            '姿見の井戸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 39: 牛首トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=82') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牛首トンネル' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牛首トンネル', '牛首トンネル-xl22c2hc', '牛首トンネルは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.731043, 136.819824, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=82', 'ghostmap.jp',
            'community-site',
            '牛首トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 40: 種松山山頂公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=84') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '種松山山頂公園' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('種松山山頂公園', '種松山山頂公園-drkuyksh', '種松山山頂公園は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.547483, 133.79062, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=84', 'ghostmap.jp',
            'community-site',
            '種松山山頂公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 41: ホテルニュー鳴門
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=86') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルニュー鳴門' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルニュー鳴門', 'ホテルニュー鳴門-bxw35mc8', 'ホテルニュー鳴門は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.238345, 134.612398, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=86', 'ghostmap.jp',
            'community-site',
            'ホテルニュー鳴門とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 42: 旧戸倉トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=88') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧戸倉トンネル' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧戸倉トンネル', '旧戸倉トンネル-ept1i8oj', '旧戸倉トンネルは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.296932, 134.510998, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=88', 'ghostmap.jp',
            'community-site',
            '旧戸倉トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 43: 赤名トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=90') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤名トンネル' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤名トンネル', '赤名トンネル-050e66yr', '赤名トンネルは、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         34.960044, 132.734763, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=90', 'ghostmap.jp',
            'community-site',
            '赤名トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 44: 首塚（堂の山）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=92') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首塚（堂の山）' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首塚（堂の山）', '首塚堂の山-49ie303g', '首塚（堂の山）は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.663257, 140.045832, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=92', 'ghostmap.jp',
            'community-site',
            '首塚（堂の山）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 45: 新宿区立足柄学園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=94') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新宿区立足柄学園' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新宿区立足柄学園', '新宿区立足柄学園-gnfyaz5z', '新宿区立足柄学園は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.332816, 138.974596, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=94', 'ghostmap.jp',
            'community-site',
            '新宿区立足柄学園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 46: 常紋トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=96') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '常紋トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('常紋トンネル', '常紋トンネル-2fo68vsu', '常紋トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.837301, 143.547876, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=96', 'ghostmap.jp',
            'community-site',
            '常紋トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 47: 旧善波トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=98') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧善波トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧善波トンネル', '旧善波トンネル-weo2njbf', '旧善波トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.382444, 139.251304, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=98', 'ghostmap.jp',
            'community-site',
            '旧善波トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 48: 天狗橋周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=100') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天狗橋周辺' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天狗橋周辺', '天狗橋周辺-5ee2pkke', '天狗橋周辺は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.450481, 136.619319, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=100', 'ghostmap.jp',
            'community-site',
            '天狗橋周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 49: しとどの巌
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=102') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'しとどの巌' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('しとどの巌', 'しとどの巌-hhs1b9c6', 'しとどの巌は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.164761, 139.075372, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=102', 'ghostmap.jp',
            'community-site',
            'しとどの巌とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 50: 料亭ふるさと（割烹ふるさと）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=104') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '料亭ふるさと（割烹ふるさと）' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('料亭ふるさと（割烹ふるさと）', '料亭ふるさと割烹ふるさと-9sq7m871', '料亭ふるさと（割烹ふるさと）は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.191595, 140.310827, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=104', 'ghostmap.jp',
            'community-site',
            '料亭ふるさと（割烹ふるさと）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 51: 雄蛇ヶ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=106') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雄蛇ヶ池' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雄蛇ヶ池', '雄蛇ヶ池-1hytbpnf', '雄蛇ヶ池は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.55984, 140.329352, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=106', 'ghostmap.jp',
            'community-site',
            '雄蛇ヶ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 52: 中城高原ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=108') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中城高原ホテル' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中城高原ホテル', '中城高原ホテル-jvexw70j', '中城高原ホテルは、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.282735, 127.797817, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=108', 'ghostmap.jp',
            'community-site',
            '中城高原ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 53: 旧伊勢神トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=110') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧伊勢神トンネル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧伊勢神トンネル', '旧伊勢神トンネル-egi47kiz', '旧伊勢神トンネルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.172854, 137.430368, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=110', 'ghostmap.jp',
            'community-site',
            '旧伊勢神トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 54: 三宝寺池（石神井公園）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=112') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三宝寺池（石神井公園）' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三宝寺池（石神井公園）', '三宝寺池石神井公園-3tsvtfnz', '三宝寺池（石神井公園）は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.737839, 139.594529, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=112', 'ghostmap.jp',
            'community-site',
            '三宝寺池（石神井公園）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 55: 正助ふるさと村奥　菊姫の首塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=114') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正助ふるさと村奥　菊姫の首塚' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正助ふるさと村奥　菊姫の首塚', '正助ふるさと村奥-菊姫の首塚-3zpt5g4r', '正助ふるさと村奥　菊姫の首塚は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.780699, 130.629223, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=114', 'ghostmap.jp',
            'community-site',
            '正助ふるさと村奥　菊姫の首塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 56: 厨子奥トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=116') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '厨子奥トンネル' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('厨子奥トンネル', '厨子奥トンネル-0kcyrhoz', '厨子奥トンネルは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.991006, 135.802205, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=116', 'ghostmap.jp',
            'community-site',
            '厨子奥トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 57: 八甲田山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=118') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八甲田山' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八甲田山', '八甲田山-yndlwwb6', '八甲田山は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.680825, 140.83364, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=118', 'ghostmap.jp',
            'community-site',
            '八甲田山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 58: 二ッ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=120') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '二ッ池' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('二ッ池', '二ッ池-7ymy57j1', '二ッ池は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.520753, 139.650762, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=120', 'ghostmap.jp',
            'community-site',
            '二ッ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 59: 久米島のとある旅館に一室
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=122') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久米島のとある旅館に一室' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久米島のとある旅館に一室', '久米島のとある旅館に一室-d32avskg', '久米島のとある旅館に一室は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.327463, 126.806646, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=122', 'ghostmap.jp',
            'community-site',
            '久米島のとある旅館に一室とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 60: 千日デパート火災現場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=126') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千日デパート火災現場跡' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千日デパート火災現場跡', '千日デパート火災現場跡-0wuq3msx', '千日デパート火災現場跡は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.666402, 135.502656, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=126', 'ghostmap.jp',
            'community-site',
            '千日デパート火災現場跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 61: 弁天池の牛女
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=130') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弁天池の牛女' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弁天池の牛女', '弁天池の牛女-ac48y7js', '弁天池の牛女は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.775224, 135.308751, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=130', 'ghostmap.jp',
            'community-site',
            '弁天池の牛女とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 62: 火垂るの墓：少女像（満池谷墓地）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=132') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '火垂るの墓：少女像（満池谷墓地）' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('火垂るの墓：少女像（満池谷墓地）', '火垂るの墓少女像満池谷墓地-t1d5jhpp', '火垂るの墓：少女像（満池谷墓地）は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.752996, 135.334707, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=132', 'ghostmap.jp',
            'community-site',
            '火垂るの墓：少女像（満池谷墓地）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 63: 旧日本陸軍　ロボトミー実験場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=136') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日本陸軍　ロボトミー実験場跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日本陸軍　ロボトミー実験場跡', '旧日本陸軍-ロボトミー実験場跡-czunfygv', '旧日本陸軍　ロボトミー実験場跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.668297, 139.619236, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=136', 'ghostmap.jp',
            'community-site',
            '旧日本陸軍　ロボトミー実験場跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 64: 青野ダム　御旅橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=140') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青野ダム　御旅橋' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青野ダム　御旅橋', '青野ダム-御旅橋-svseri1s', '青野ダム　御旅橋は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.948694, 135.205827, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=140', 'ghostmap.jp',
            'community-site',
            '青野ダム　御旅橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 65: 宇治川ライン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=144') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宇治川ライン' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宇治川ライン', '宇治川ライン-8re2p339', '宇治川ラインは、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.877878, 135.828502, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=144', 'ghostmap.jp',
            'community-site',
            '宇治川ラインとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 66: 樋の池の「手っちゃん」
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=146') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '樋の池の「手っちゃん」' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('樋の池の「手っちゃん」', '樋の池の手っちゃん-c0togdsn', '樋の池の「手っちゃん」は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.752037, 135.321078, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=146', 'ghostmap.jp',
            'community-site',
            '樋の池の「手っちゃん」とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 67: 開聞トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=152') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '開聞トンネル' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('開聞トンネル', '開聞トンネル-hqulub2e', '開聞トンネルは、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.178267, 130.552522, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=152', 'ghostmap.jp',
            'community-site',
            '開聞トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 68: 入来峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=154') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '入来峠' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('入来峠', '入来峠-m7cwl5nk', '入来峠は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.729372, 130.471578, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=154', 'ghostmap.jp',
            'community-site',
            '入来峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 69: 武岡トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=156') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武岡トンネル' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武岡トンネル', '武岡トンネル-735sxuj4', '武岡トンネルは、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.580117, 130.535354, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=156', 'ghostmap.jp',
            'community-site',
            '武岡トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 70: 堀切峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=158') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '堀切峠' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('堀切峠', '堀切峠-7er7n940', '堀切峠は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.775858, 131.482349, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=158', 'ghostmap.jp',
            'community-site',
            '堀切峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 71: 六ヶ迫トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=160') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六ヶ迫トンネル' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六ヶ迫トンネル', '六ヶ迫トンネル-lyr6znum', '六ヶ迫トンネルは、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.176739, 131.777181, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=160', 'ghostmap.jp',
            'community-site',
            '六ヶ迫トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 72: 仏崎公園（仏崎遊園地）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=162') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仏崎公園（仏崎遊園地）' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仏崎公園（仏崎遊園地）', '仏崎公園仏崎遊園地-7wrbr4ix', '仏崎公園（仏崎遊園地）は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.256557, 131.551996, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=162', 'ghostmap.jp',
            'community-site',
            '仏崎公園（仏崎遊園地）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 73: 喜屋武岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=164') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '喜屋武岬' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('喜屋武岬', '喜屋武岬-czdmdh2k', '喜屋武岬は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.078971, 127.669311, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=164', 'ghostmap.jp',
            'community-site',
            '喜屋武岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 74: 入鹿池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=166') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '入鹿池' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('入鹿池', '入鹿池-6yymwlpk', '入鹿池は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.34135, 136.994705, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=166', 'ghostmap.jp',
            'community-site',
            '入鹿池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 75: 旧本坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=168') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧本坂トンネル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧本坂トンネル', '旧本坂トンネル-k8v5do7g', '旧本坂トンネルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.798837, 137.492252, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=168', 'ghostmap.jp',
            'community-site',
            '旧本坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 76: 薗原ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=170') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '薗原ダム' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('薗原ダム', '薗原ダム-cnch69gu', '薗原ダムは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.639748, 139.174665, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=170', 'ghostmap.jp',
            'community-site',
            '薗原ダムとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 77: くつわ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=172') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'くつわ池' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('くつわ池', 'くつわ池-5rrdhl44', 'くつわ池は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.859498, 135.836259, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=172', 'ghostmap.jp',
            'community-site',
            'くつわ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 78: 首つりダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=174') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首つりダム' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首つりダム', '首つりダム-7uynvc22', '首つりダムは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.937619, 135.217023, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=174', 'ghostmap.jp',
            'community-site',
            '首つりダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 79: 雄島トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=176') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雄島トンネル' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雄島トンネル', '雄島トンネル-6yaa34dq', '雄島トンネルは、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.250389, 136.125197, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=176', 'ghostmap.jp',
            'community-site',
            '雄島トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 80: 信貴生駒スカイライン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=178') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '信貴生駒スカイライン' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('信貴生駒スカイライン', '信貴生駒スカイライン-rwhy1yyv', '信貴生駒スカイラインは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.686718, 135.685701, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=178', 'ghostmap.jp',
            'community-site',
            '信貴生駒スカイラインとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 81: 八王子2トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=180') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子2トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子2トンネル', '八王子2トンネル-n12r5fo0', '八王子2トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.62112, 139.346327, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=180', 'ghostmap.jp',
            'community-site',
            '八王子2トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 82: 首塚大明神
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=182') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首塚大明神' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首塚大明神', '首塚大明神-ijj3j0pq', '首塚大明神は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.987034, 135.639484, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=182', 'ghostmap.jp',
            'community-site',
            '首塚大明神とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 83: 五ケ池・仁川ピクニックセンター
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=186') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五ケ池・仁川ピクニックセンター' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五ケ池・仁川ピクニックセンター', '五ケ池・仁川ピクニックセンター-guley1et', '五ケ池・仁川ピクニックセンターは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.779544, 135.334665, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=186', 'ghostmap.jp',
            'community-site',
            '五ケ池・仁川ピクニックセンターとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 84: 旧野木病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=188') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧野木病院' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧野木病院', '旧野木病院-bidz1w0v', '旧野木病院は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.226883, 139.761114, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=188', 'ghostmap.jp',
            'community-site',
            '旧野木病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 85: 大山貝塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=190') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大山貝塚' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大山貝塚', '大山貝塚-vuqh63hb', '大山貝塚は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.273902, 127.745196, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=190', 'ghostmap.jp',
            'community-site',
            '大山貝塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 86: 北金井キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=194') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北金井キャンプ場' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北金井キャンプ場', '北金井キャンプ場-1hooma7h', '北金井キャンプ場は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.353228, 139.351394, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=194', 'ghostmap.jp',
            'community-site',
            '北金井キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 87: 八王子城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=196') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子城跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子城跡', '八王子城跡-inbm6cc7', '八王子城跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.653132, 139.253012, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=196', 'ghostmap.jp',
            'community-site',
            '八王子城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 88: 明通トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=204') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '明通トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('明通トンネル', '明通トンネル-nrcbiaxm', '明通トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.380653, 138.072032, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=204', 'ghostmap.jp',
            'community-site',
            '明通トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 89: 東京湾観音
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=206') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東京湾観音' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東京湾観音', '東京湾観音-z2q0q2ib', '東京湾観音は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.263376, 139.862471, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=206', 'ghostmap.jp',
            'community-site',
            '東京湾観音とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 90: 三井大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=208') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三井大橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三井大橋', '三井大橋-ckci7rrl', '三井大橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.589192, 139.266894, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=208', 'ghostmap.jp',
            'community-site',
            '三井大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 91: 芝山トンネル（旧柏原トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=210') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '芝山トンネル（旧柏原トンネル）' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('芝山トンネル（旧柏原トンネル）', '芝山トンネル旧柏原トンネル-i7uowkf3', '芝山トンネル（旧柏原トンネル）は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.573056, 135.653423, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=210', 'ghostmap.jp',
            'community-site',
            '芝山トンネル（旧柏原トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 92: 笠置トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=216') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笠置トンネル' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笠置トンネル', '笠置トンネル-wry9eohw', '笠置トンネルは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.760345, 135.947453, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=216', 'ghostmap.jp',
            'community-site',
            '笠置トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 93: メタボ広沢
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=218') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'メタボ広沢' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('メタボ広沢', 'メタボ広沢-v00vnz2r', 'メタボ広沢は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.020809, 135.686475, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=218', 'ghostmap.jp',
            'community-site',
            'メタボ広沢とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 94: 賽の河原（石見畳ケ浦）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=220') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '賽の河原（石見畳ケ浦）' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('賽の河原（石見畳ケ浦）', '賽の河原石見畳ケ浦-rmthy0dm', '賽の河原（石見畳ケ浦）は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.942281, 132.10796, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=220', 'ghostmap.jp',
            'community-site',
            '賽の河原（石見畳ケ浦）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 95: 翁島ペンション（幽霊ペンション）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=222') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '翁島ペンション（幽霊ペンション）' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('翁島ペンション（幽霊ペンション）', '翁島ペンション幽霊ペンション-a22lixdc', '翁島ペンション（幽霊ペンション）は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.546721, 140.058996, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=222', 'ghostmap.jp',
            'community-site',
            '翁島ペンション（幽霊ペンション）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 96: 侍トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=224') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '侍トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('侍トンネル', '侍トンネル-l5o2ywzd', '侍トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.844786, 139.734187, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=224', 'ghostmap.jp',
            'community-site',
            '侍トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 97: 南原トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=226') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南原トンネル' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南原トンネル', '南原トンネル-m2ltcwd1', '南原トンネルは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.563358, 132.5139, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=226', 'ghostmap.jp',
            'community-site',
            '南原トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 98: めがね橋（碓氷第三橋梁）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=228') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'めがね橋（碓氷第三橋梁）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('めがね橋（碓氷第三橋梁）', 'めがね橋碓氷第三橋梁-xw29lhx7', 'めがね橋（碓氷第三橋梁）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.357742, 138.698271, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=228', 'ghostmap.jp',
            'community-site',
            'めがね橋（碓氷第三橋梁）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 99: シガイの森（新開の森）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=230') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'シガイの森（新開の森）' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('シガイの森（新開の森）', 'シガイの森新開の森-x8d199zm', 'シガイの森（新開の森）は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         35.145823, 136.11965, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=230', 'ghostmap.jp',
            'community-site',
            'シガイの森（新開の森）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 100: 旧笹子トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=232') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧笹子トンネル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧笹子トンネル', '旧笹子トンネル-sdjkl2rm', '旧笹子トンネルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.612863, 138.780178, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=232', 'ghostmap.jp',
            'community-site',
            '旧笹子トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 101: 前田トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=234') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '前田トンネル' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('前田トンネル', '前田トンネル-622jdd34', '前田トンネルは、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.237921, 127.729823, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=234', 'ghostmap.jp',
            'community-site',
            '前田トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 102: 新三郷のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=236') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新三郷のトンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新三郷のトンネル', '新三郷のトンネル-tmgkb9i2', '新三郷のトンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.862177, 139.863919, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=236', 'ghostmap.jp',
            'community-site',
            '新三郷のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 103: 小美玉小川脳病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=238') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小美玉小川脳病院' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小美玉小川脳病院', '小美玉小川脳病院-8dd6o0wf', '小美玉小川脳病院は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.144949, 140.414649, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=238', 'ghostmap.jp',
            'community-site',
            '小美玉小川脳病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 104: 厚木恵心病院跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=242') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '厚木恵心病院跡' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('厚木恵心病院跡', '厚木恵心病院跡-f4mtlxc2', '厚木恵心病院跡は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.499417, 139.361199, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=242', 'ghostmap.jp',
            'community-site',
            '厚木恵心病院跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 105: 上柚木公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=244') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上柚木公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上柚木公園', '上柚木公園-3o9ezl1d', '上柚木公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.620849, 139.372151, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=244', 'ghostmap.jp',
            'community-site',
            '上柚木公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 106: 旧日貫トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=250') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧日貫トンネル' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧日貫トンネル', '旧日貫トンネル-d2xmt9jc', '旧日貫トンネルは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.872311, 132.331426, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=250', 'ghostmap.jp',
            'community-site',
            '旧日貫トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 107: かもめ荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=252') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'かもめ荘' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('かもめ荘', 'かもめ荘-rni0ur79', 'かもめ荘は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.424903, 132.626245, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=252', 'ghostmap.jp',
            'community-site',
            'かもめ荘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 108: ＳＳＳ（アフシマノ嶽）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=256') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ＳＳＳ（アフシマノ嶽）' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ＳＳＳ（アフシマノ嶽）', 'sssアフシマノ嶽-74xgp0v3', 'ＳＳＳ（アフシマノ嶽）は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.452219, 127.806809, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=256', 'ghostmap.jp',
            'community-site',
            'ＳＳＳ（アフシマノ嶽）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 109: 東尋坊
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=258') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東尋坊' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東尋坊', '東尋坊-t0qtrzu5', '東尋坊は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.237644, 136.125424, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=258', 'ghostmap.jp',
            'community-site',
            '東尋坊とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 110: 六角堂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=260') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六角堂' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六角堂', '六角堂-r6nkrxnn', '六角堂は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.123561, 137.18968, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=260', 'ghostmap.jp',
            'community-site',
            '六角堂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 111: 首吊り廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=262') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首吊り廃墟' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首吊り廃墟', '首吊り廃墟-8v3ua95s', '首吊り廃墟は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.6505, 135.505954, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=262', 'ghostmap.jp',
            'community-site',
            '首吊り廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 112: 円形校舎廃墟（沼東小学校）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=264') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '円形校舎廃墟（沼東小学校）' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('円形校舎廃墟（沼東小学校）', '円形校舎廃墟沼東小学校-yusjdg6d', '円形校舎廃墟（沼東小学校）は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.319451, 141.951478, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=264', 'ghostmap.jp',
            'community-site',
            '円形校舎廃墟（沼東小学校）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 113: 旧仲哀トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=266') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧仲哀トンネル' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧仲哀トンネル', '旧仲哀トンネル-y8fy561e', '旧仲哀トンネルは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.681623, 130.884775, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=266', 'ghostmap.jp',
            'community-site',
            '旧仲哀トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 114: 暗峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=268') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '暗峠' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('暗峠', '暗峠-nosup63x', '暗峠は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.665096, 135.671215, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=268', 'ghostmap.jp',
            'community-site',
            '暗峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 115: 旧生駒トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=270') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧生駒トンネル' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧生駒トンネル', '旧生駒トンネル-gr6wqjgp', '旧生駒トンネルは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.6878, 135.658128, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=270', 'ghostmap.jp',
            'community-site',
            '旧生駒トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 116: 甲賀ファミリーランド跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=272') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '甲賀ファミリーランド跡' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('甲賀ファミリーランド跡', '甲賀ファミリーランド跡-i8hww8g4', '甲賀ファミリーランド跡は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.952033, 136.107964, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=272', 'ghostmap.jp',
            'community-site',
            '甲賀ファミリーランド跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 117: プラザ松本
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=274') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'プラザ松本' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('プラザ松本', 'プラザ松本-2no9feed', 'プラザ松本は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.506053, 135.79174, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=274', 'ghostmap.jp',
            'community-site',
            'プラザ松本とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 118: 摩耶観光ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=276') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '摩耶観光ホテル' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('摩耶観光ホテル', '摩耶観光ホテル-5w0lnn21', '摩耶観光ホテルは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.727576, 135.212789, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=276', 'ghostmap.jp',
            'community-site',
            '摩耶観光ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 119: 九十九橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=278') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '九十九橋' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('九十九橋', '九十九橋-1zyxn4zh', '九十九橋は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.063229, 136.211492, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=278', 'ghostmap.jp',
            'community-site',
            '九十九橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 120: 深谷霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=280') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '深谷霊園' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('深谷霊園', '深谷霊園-l6alelst', '深谷霊園は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.092528, 136.178621, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=280', 'ghostmap.jp',
            'community-site',
            '深谷霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 121: 一乗滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=282') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一乗滝' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一乗滝', '一乗滝-c3e8zphg', '一乗滝は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         35.978675, 136.307702, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=282', 'ghostmap.jp',
            'community-site',
            '一乗滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 122: 青山トンネル前の電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=284') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青山トンネル前の電話ボックス' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青山トンネル前の電話ボックス', '青山トンネル前の電話ボックス-kunyj9vw', '青山トンネル前の電話ボックスは、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.669414, 136.266699, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=284', 'ghostmap.jp',
            'community-site',
            '青山トンネル前の電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 123: 旧長野トンネル（昭和のトンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=286') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧長野トンネル（昭和のトンネル）' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧長野トンネル（昭和のトンネル）', '旧長野トンネル昭和のトンネル-pdk6vbrd', '旧長野トンネル（昭和のトンネル）は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.76248, 136.325396, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=286', 'ghostmap.jp',
            'community-site',
            '旧長野トンネル（昭和のトンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 124: 鶯花荘寮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=288') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鶯花荘寮' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鶯花荘寮', '鶯花荘寮-yaqkm7zu', '鶯花荘寮は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         35.017866, 136.454873, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=288', 'ghostmap.jp',
            'community-site',
            '鶯花荘寮とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 125: 呪われた灯篭
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=290') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '呪われた灯篭' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('呪われた灯篭', '呪われた灯篭-k17z6rem', '呪われた灯篭は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.562234, 136.520401, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=290', 'ghostmap.jp',
            'community-site',
            '呪われた灯篭とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 126: 坊ヶ坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=292') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '坊ヶ坂' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('坊ヶ坂', '坊ヶ坂-07qtm942', '坊ヶ坂は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.187582, 136.920583, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=292', 'ghostmap.jp',
            'community-site',
            '坊ヶ坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 127: 東谷山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=294') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東谷山' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東谷山', '東谷山-a738qpe1', '東谷山は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.256081, 137.053027, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=294', 'ghostmap.jp',
            'community-site',
            '東谷山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 128: 長久手古戦場公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=296') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長久手古戦場公園' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長久手古戦場公園', '長久手古戦場公園-gicxn06g', '長久手古戦場公園は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.173357, 137.047993, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=296', 'ghostmap.jp',
            'community-site',
            '長久手古戦場公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 129: 八事霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=298') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八事霊園' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八事霊園', '八事霊園-g5445dzt', '八事霊園は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.141349, 136.971008, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=298', 'ghostmap.jp',
            'community-site',
            '八事霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 130: 旧志戸坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=300') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧志戸坂トンネル' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧志戸坂トンネル', '旧志戸坂トンネル-kbysfr2k', '旧志戸坂トンネルは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.207701, 134.331552, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=300', 'ghostmap.jp',
            'community-site',
            '旧志戸坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 131: 人形峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=302') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人形峠' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人形峠', '人形峠-kkjydkd4', '人形峠は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.313479, 133.931004, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=302', 'ghostmap.jp',
            'community-site',
            '人形峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 132: 魚切ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=304') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '魚切ダム' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('魚切ダム', '魚切ダム-n5glto0t', '魚切ダムは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.427754, 132.330034, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=304', 'ghostmap.jp',
            'community-site',
            '魚切ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 133: 鏡山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=306') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鏡山公園' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鏡山公園', '鏡山公園-gt7vpsxn', '鏡山公園は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.405954, 132.726982, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=306', 'ghostmap.jp',
            'community-site',
            '鏡山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 134: 多鯰ヶ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=308') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多鯰ヶ池' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多鯰ヶ池', '多鯰ヶ池-ra845rn7', '多鯰ヶ池は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.535457, 134.238179, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=308', 'ghostmap.jp',
            'community-site',
            '多鯰ヶ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 135: 鳥取城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=310') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥取城跡' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥取城跡', '鳥取城跡-afyqcw9s', '鳥取城跡は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.507405, 134.240019, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=310', 'ghostmap.jp',
            'community-site',
            '鳥取城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 136: 高子沼グリーンランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=312') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高子沼グリーンランド' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高子沼グリーンランド', '高子沼グリーンランド-w1okgd0w', '高子沼グリーンランドは、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.804884, 140.519041, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=312', 'ghostmap.jp',
            'community-site',
            '高子沼グリーンランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 137: 豊田湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=316') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊田湖' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊田湖', '豊田湖-rcmxyfqv', '豊田湖は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.239267, 131.124252, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=316', 'ghostmap.jp',
            'community-site',
            '豊田湖とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 138: １３号トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=318') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '１３号トンネル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('１３号トンネル', '13号トンネル-6edmyl49', '１３号トンネルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.326898, 137.10794, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=318', 'ghostmap.jp',
            'community-site',
            '１３号トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 139: UCC喫茶店
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=320') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'UCC喫茶店' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('UCC喫茶店', 'ucc喫茶店-lz8j2ass', 'UCC喫茶店は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.456614, 136.840521, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=320', 'ghostmap.jp',
            'community-site',
            'UCC喫茶店とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 140: 鶯谷トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=322') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鶯谷トンネル' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鶯谷トンネル', '鶯谷トンネル-mca5ofsh', '鶯谷トンネルは、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.419513, 136.773483, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=322', 'ghostmap.jp',
            'community-site',
            '鶯谷トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 141: 旧品井沼トンネル（根廻トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=324') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧品井沼トンネル（根廻トンネル）' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧品井沼トンネル（根廻トンネル）', '旧品井沼トンネル根廻トンネル-g5bl80bq', '旧品井沼トンネル（根廻トンネル）は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.415384, 141.074388, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=324', 'ghostmap.jp',
            'community-site',
            '旧品井沼トンネル（根廻トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 142: 船坂峠の冷水
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=326') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '船坂峠の冷水' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('船坂峠の冷水', '船坂峠の冷水-bcl3zmt2', '船坂峠の冷水は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.787587, 135.300208, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=326', 'ghostmap.jp',
            'community-site',
            '船坂峠の冷水とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 143: バンバ穴（婆々穴）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=328') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'バンバ穴（婆々穴）' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('バンバ穴（婆々穴）', 'バンバ穴婆穴-2p57mylw', 'バンバ穴（婆々穴）は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.294138, 138.647865, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=328', 'ghostmap.jp',
            'community-site',
            'バンバ穴（婆々穴）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 144: 浜名湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=330') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浜名湖' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浜名湖', '浜名湖-lg75wzle', '浜名湖は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.746886, 137.595203, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=330', 'ghostmap.jp',
            'community-site',
            '浜名湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 145: ホテル浜山（廃旅館H）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=340') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル浜山（廃旅館H）' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル浜山（廃旅館H）', 'ホテル浜山廃旅館h-64plcehg', 'ホテル浜山（廃旅館H）は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.818009, 139.069898, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=340', 'ghostmap.jp',
            'community-site',
            'ホテル浜山（廃旅館H）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 146: 鳥越城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=344') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥越城跡' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥越城跡', '鳥越城跡-n48g4aos', '鳥越城跡は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.366231, 136.601163, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=344', 'ghostmap.jp',
            'community-site',
            '鳥越城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 147: 解剖墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=346') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '解剖墓地' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('解剖墓地', '解剖墓地-726wwosk', '解剖墓地は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.571796, 136.677822, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=346', 'ghostmap.jp',
            'community-site',
            '解剖墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 148: 鷹の巣トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=348') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鷹の巣トンネル' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鷹の巣トンネル', '鷹の巣トンネル-l1u6ygrv', '鷹の巣トンネルは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.497892, 136.718039, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=348', 'ghostmap.jp',
            'community-site',
            '鷹の巣トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 149: 寺家トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=350') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '寺家トンネル' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('寺家トンネル', '寺家トンネル-ep2apjb7', '寺家トンネルは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.560103, 137.242153, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=350', 'ghostmap.jp',
            'community-site',
            '寺家トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 150: 地蔵坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=352') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵坂' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵坂', '地蔵坂-tygnnfms', '地蔵坂は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.771988, 135.328128, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=352', 'ghostmap.jp',
            'community-site',
            '地蔵坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 151: ブラックハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=354') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ブラックハウス' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ブラックハウス', 'ブラックハウス-i6oj7pf7', 'ブラックハウスは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.68433, 138.808596, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=354', 'ghostmap.jp',
            'community-site',
            'ブラックハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 152: 間瀬トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=356') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '間瀬トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('間瀬トンネル', '間瀬トンネル-ya4wwind', '間瀬トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.73756, 138.820111, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=356', 'ghostmap.jp',
            'community-site',
            '間瀬トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 153: 山神トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=358') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山神トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山神トンネル', '山神トンネル-h5y42tch', '山神トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.455291, 139.265828, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=358', 'ghostmap.jp',
            'community-site',
            '山神トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 154: 小坪トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=360') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小坪トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小坪トンネル', '小坪トンネル-oage1ms2', '小坪トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.30697, 139.563519, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=360', 'ghostmap.jp',
            'community-site',
            '小坪トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 155: 林田港
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=362') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '林田港' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('林田港', '林田港-tg4t176u', '林田港は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.341443, 133.882981, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=362', 'ghostmap.jp',
            'community-site',
            '林田港とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 156: 首切峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=364') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首切峠' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首切峠', '首切峠-wvm8fyeh', '首切峠は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.173569, 133.940722, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=364', 'ghostmap.jp',
            'community-site',
            '首切峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 157: 牟礼トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=366') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牟礼トンネル' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牟礼トンネル', '牟礼トンネル-rfqk013r', '牟礼トンネルは、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.31901, 134.161481, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=366', 'ghostmap.jp',
            'community-site',
            '牟礼トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 158: 栗林トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=368') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '栗林トンネル' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('栗林トンネル', '栗林トンネル-xpvrpxqo', '栗林トンネルは、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.32985, 134.033065, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=368', 'ghostmap.jp',
            'community-site',
            '栗林トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 159: 旧東山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=370') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧東山トンネル' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧東山トンネル', '旧東山トンネル-n8j9alt8', '旧東山トンネルは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.847895, 134.613014, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=370', 'ghostmap.jp',
            'community-site',
            '旧東山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 160: 大坂峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=372') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大坂峠' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大坂峠', '大坂峠-lqg7hqd8', '大坂峠は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.19204, 134.443639, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=372', 'ghostmap.jp',
            'community-site',
            '大坂峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 161: 南畑ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=374') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南畑ダム' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南畑ダム', '南畑ダム-epuy6g0r', '南畑ダムは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.434342, 130.423716, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=374', 'ghostmap.jp',
            'community-site',
            '南畑ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 162: 然別湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=376') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '然別湖' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('然別湖', '然別湖-l3rgufok', '然別湖は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.272768, 143.11954, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=376', 'ghostmap.jp',
            'community-site',
            '然別湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 163: 清水の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=378') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '清水の滝' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('清水の滝', '清水の滝-tbwwamnm', '清水の滝は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.325509, 130.214825, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=378', 'ghostmap.jp',
            'community-site',
            '清水の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 164: 鍋冠山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=380') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鍋冠山公園' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鍋冠山公園', '鍋冠山公園-yvqvb4h2', '鍋冠山公園は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.729293, 129.869168, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=380', 'ghostmap.jp',
            'community-site',
            '鍋冠山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 165: 権現山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=382') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '権現山' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('権現山', '権現山-4u09cy5z', '権現山は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.580391, 129.740125, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=382', 'ghostmap.jp',
            'community-site',
            '権現山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 166: 黒浜トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=384') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒浜トンネル' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒浜トンネル', '黒浜トンネル-r78ee77d', '黒浜トンネルは、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.626557, 129.791739, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=384', 'ghostmap.jp',
            'community-site',
            '黒浜トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 167: 志高ユートピア
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=386') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '志高ユートピア' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('志高ユートピア', '志高ユートピア-iqa8i0c4', '志高ユートピアは、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.265676, 131.445277, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=386', 'ghostmap.jp',
            'community-site',
            '志高ユートピアとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 168: 三国峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=388') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三国峠' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三国峠', '三国峠-9m5ks8xk', '三国峠は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         32.900479, 131.615825, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=388', 'ghostmap.jp',
            'community-site',
            '三国峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 169: 金峰山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=390') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金峰山' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金峰山', '金峰山-vfruyxbp', '金峰山は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.813964, 130.638855, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=390', 'ghostmap.jp',
            'community-site',
            '金峰山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 170: 天草パールラインホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=392') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天草パールラインホテル' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天草パールラインホテル', '天草パールラインホテル-f6nb1cqb', '天草パールラインホテルは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.610408, 130.460698, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=392', 'ghostmap.jp',
            'community-site',
            '天草パールラインホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 171: 白糸の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=394') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白糸の滝' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白糸の滝', '白糸の滝-6b04xqk7', '白糸の滝は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.809061, 130.903642, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=394', 'ghostmap.jp',
            'community-site',
            '白糸の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 172: 青雲橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=398') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青雲橋' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青雲橋', '青雲橋-oko9xpie', '青雲橋は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         32.659601, 131.389719, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=398', 'ghostmap.jp',
            'community-site',
            '青雲橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 173: 小布瀬の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=400') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小布瀬の滝' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小布瀬の滝', '小布瀬の滝-wd5m7x14', '小布瀬の滝は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.638174, 131.246598, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=400', 'ghostmap.jp',
            'community-site',
            '小布瀬の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 174: 坂元墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=402') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '坂元墓地' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('坂元墓地', '坂元墓地-ydn38qtz', '坂元墓地は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.62193, 130.551276, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=402', 'ghostmap.jp',
            'community-site',
            '坂元墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 175: 城ヶ倉大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=404') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '城ヶ倉大橋' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('城ヶ倉大橋', '城ヶ倉大橋-gegodl2f', '城ヶ倉大橋は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.650342, 140.825629, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=404', 'ghostmap.jp',
            'community-site',
            '城ヶ倉大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 176: スペース21
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=406') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'スペース21' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('スペース21', 'スペース21-46fmezwb', 'スペース21は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.686321, 140.355169, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=406', 'ghostmap.jp',
            'community-site',
            'スペース21とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 177: 喜和楽園温泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=408') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '喜和楽園温泉' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('喜和楽園温泉', '喜和楽園温泉-tdypeg52', '喜和楽園温泉は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.463124, 141.426746, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=408', 'ghostmap.jp',
            'community-site',
            '喜和楽園温泉とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 178: 黒森山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=412') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒森山' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒森山', '黒森山-xnk5ebog', '黒森山は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.621326, 141.268066, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=412', 'ghostmap.jp',
            'community-site',
            '黒森山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 179: デンデラ野
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=414') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'デンデラ野' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('デンデラ野', 'デンデラ野-jjp45m5f', 'デンデラ野は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.361345, 141.606325, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=414', 'ghostmap.jp',
            'community-site',
            'デンデラ野とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 180: 男鹿プリンスホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=416') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '男鹿プリンスホテル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('男鹿プリンスホテル', '男鹿プリンスホテル-j87tthey', '男鹿プリンスホテルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.972676, 139.741099, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=416', 'ghostmap.jp',
            'community-site',
            '男鹿プリンスホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 181: 千秋トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=418') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '千秋トンネル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('千秋トンネル', '千秋トンネル-d1dtzik4', '千秋トンネルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.724101, 140.122555, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=418', 'ghostmap.jp',
            'community-site',
            '千秋トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 182: 茶臼峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=420') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茶臼峠' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茶臼峠', '茶臼峠-cofdhek9', '茶臼峠は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.909942, 139.876391, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=420', 'ghostmap.jp',
            'community-site',
            '茶臼峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 183: 乙女の祈り
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=426') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '乙女の祈り' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('乙女の祈り', '乙女の祈り-5qmz3299', '乙女の祈りは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.381397, 141.088776, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=426', 'ghostmap.jp',
            'community-site',
            '乙女の祈りとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 184: 新吹上トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=428') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新吹上トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新吹上トンネル', '新吹上トンネル-wwdfcp3y', '新吹上トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.815603, 139.248763, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=428', 'ghostmap.jp',
            'community-site',
            '新吹上トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 185: 仙岩トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=430') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仙岩トンネル' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仙岩トンネル', '仙岩トンネル-umyugiz7', '仙岩トンネルは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.706658, 140.809437, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=430', 'ghostmap.jp',
            'community-site',
            '仙岩トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 186: ホテルニュー鳴子
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=432') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルニュー鳴子' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルニュー鳴子', 'ホテルニュー鳴子-bj5niuht', 'ホテルニュー鳴子は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.724323, 140.721863, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=432', 'ghostmap.jp',
            'community-site',
            'ホテルニュー鳴子とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 187: 釜房ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=434') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '釜房ダム' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('釜房ダム', '釜房ダム-8ixgsh9q', '釜房ダムは、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.203141, 140.698678, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=434', 'ghostmap.jp',
            'community-site',
            '釜房ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 188: 旧関山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=436') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧関山トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧関山トンネル', '旧関山トンネル-w4ub3h5b', '旧関山トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.381799, 140.565853, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=436', 'ghostmap.jp',
            'community-site',
            '旧関山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 189: 高館山の展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=438') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高館山の展望台' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高館山の展望台', '高館山の展望台-er20zxop', '高館山の展望台は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.762855, 139.747222, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=438', 'ghostmap.jp',
            'community-site',
            '高館山の展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 190: 白山島（白山神社）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=442') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白山島（白山神社）' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白山島（白山神社）', '白山島白山神社-2ai4px0f', '白山島（白山神社）は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.724796, 139.682982, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=442', 'ghostmap.jp',
            'community-site',
            '白山島（白山神社）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 191: 上蓬莱橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=444') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上蓬莱橋' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上蓬莱橋', '上蓬莱橋-ufe5hqwv', '上蓬莱橋は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.683659, 140.497694, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=444', 'ghostmap.jp',
            'community-site',
            '上蓬莱橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 192: 横向温泉ロッジ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=448') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '横向温泉ロッジ' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('横向温泉ロッジ', '横向温泉ロッジ-i82jurxl', '横向温泉ロッジは、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.65945, 140.258132, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=448', 'ghostmap.jp',
            'community-site',
            '横向温泉ロッジとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 193: 見返り橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=450') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '見返り橋' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('見返り橋', '見返り橋-fwfc1lyw', '見返り橋は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.692638, 133.729268, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=450', 'ghostmap.jp',
            'community-site',
            '見返り橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 194: 嵐山展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=452') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '嵐山展望台' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('嵐山展望台', '嵐山展望台-d1cdqst7', '嵐山展望台は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.794355, 142.302133, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=452', 'ghostmap.jp',
            'community-site',
            '嵐山展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 195: スカイレストニュー室戸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=454') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'スカイレストニュー室戸' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('スカイレストニュー室戸', 'スカイレストニュー室戸-cjyd4jhg', 'スカイレストニュー室戸は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.264213, 134.178951, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=454', 'ghostmap.jp',
            'community-site',
            'スカイレストニュー室戸とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 196: 原池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=456') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '原池' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('原池', '原池-jc12bdiu', '原池は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.735038, 132.790526, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=456', 'ghostmap.jp',
            'community-site',
            '原池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 197: 夜昼トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=458') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '夜昼トンネル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('夜昼トンネル', '夜昼トンネル-tn64wypu', '夜昼トンネルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.46884, 132.491489, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=458', 'ghostmap.jp',
            'community-site',
            '夜昼トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 198: 谷上山第二展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=460') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷上山第二展望台' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷上山第二展望台', '谷上山第二展望台-2jwhzsq2', '谷上山第二展望台は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.745316, 132.729844, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=460', 'ghostmap.jp',
            'community-site',
            '谷上山第二展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 199: ホテル2001
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=462') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル2001' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル2001', 'ホテル2001-v6awiwad', 'ホテル2001は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.351331, 138.323778, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=462', 'ghostmap.jp',
            'community-site',
            'ホテル2001とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 200: 姥沢トンネル（49番トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=464') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '姥沢トンネル（49番トンネル）' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('姥沢トンネル（49番トンネル）', '姥沢トンネル49番トンネル-lyixedk1', '姥沢トンネル（49番トンネル）は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.908418, 138.252334, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=464', 'ghostmap.jp',
            'community-site',
            '姥沢トンネル（49番トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 201: 七曲りにある一本松
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=466') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七曲りにある一本松' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七曲りにある一本松', '七曲りにある一本松-efrzlqys', '七曲りにある一本松は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.670725, 138.17526, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=466', 'ghostmap.jp',
            'community-site',
            '七曲りにある一本松とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 202: すずらん池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=476') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'すずらん池' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('すずらん池', 'すずらん池-i6i0sra3', 'すずらん池は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.873603, 138.310522, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=476', 'ghostmap.jp',
            'community-site',
            'すずらん池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 203: 旧割石トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=478') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧割石トンネル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧割石トンネル', '旧割石トンネル-3vgd8pp9', '旧割石トンネルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.519159, 138.48315, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=478', 'ghostmap.jp',
            'community-site',
            '旧割石トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 204: 仙岩トンネル前のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=480') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仙岩トンネル前のトンネル' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仙岩トンネル前のトンネル', '仙岩トンネル前のトンネル-mfd8r935', '仙岩トンネル前のトンネルは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.69699, 140.800212, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=480', 'ghostmap.jp',
            'community-site',
            '仙岩トンネル前のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 205: おむつ塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=482') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おむつ塚' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おむつ塚', 'おむつ塚-tdx0uq2i', 'おむつ塚は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.666731, 138.677549, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=482', 'ghostmap.jp',
            'community-site',
            'おむつ塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 206: 内山峠スノーシェルター
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=484') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '内山峠スノーシェルター' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('内山峠スノーシェルター', '内山峠スノーシェルター-2c74jrc1', '内山峠スノーシェルターは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.621848, 136.785486, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=484', 'ghostmap.jp',
            'community-site',
            '内山峠スノーシェルターとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 207: 下仁田トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=486') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下仁田トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下仁田トンネル', '下仁田トンネル-3rmaeq78', '下仁田トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.221236, 138.785443, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=486', 'ghostmap.jp',
            'community-site',
            '下仁田トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 208: 不通橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=488') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '不通橋' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('不通橋', '不通橋-iaquewem', '不通橋は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.226823, 138.799182, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=488', 'ghostmap.jp',
            'community-site',
            '不通橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 209: 琴平橋（金比羅橋）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=490') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '琴平橋（金比羅橋）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('琴平橋（金比羅橋）', '琴平橋金比羅橋-ano5l5nw', '琴平橋（金比羅橋）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.122214, 138.990732, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=490', 'ghostmap.jp',
            'community-site',
            '琴平橋（金比羅橋）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 210: 五浦海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=492') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五浦海岸' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五浦海岸', '五浦海岸-rw1bfvg6', '五浦海岸は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.833421, 140.803126, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=492', 'ghostmap.jp',
            'community-site',
            '五浦海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 211: 平安閣
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=494') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平安閣' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平安閣', '平安閣-0lzl1r9c', '平安閣は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.298084, 140.317327, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=494', 'ghostmap.jp',
            'community-site',
            '平安閣とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 212: ホテル江戸城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=496') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル江戸城' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル江戸城', 'ホテル江戸城-vgftqq2s', 'ホテル江戸城は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.663278, 140.219302, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=496', 'ghostmap.jp',
            'community-site',
            'ホテル江戸城とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 213: 秩父湖に架かる吊り橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=498') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秩父湖に架かる吊り橋' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秩父湖に架かる吊り橋', '秩父湖に架かる吊り橋-l0hz22xo', '秩父湖に架かる吊り橋は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.941982, 138.892066, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=498', 'ghostmap.jp',
            'community-site',
            '秩父湖に架かる吊り橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 214: ホテル青い鳥
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=502') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル青い鳥' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル青い鳥', 'ホテル青い鳥-a9t1yksa', 'ホテル青い鳥は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.322545, 138.591422, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=502', 'ghostmap.jp',
            'community-site',
            'ホテル青い鳥とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 215: 顔振峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=504') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '顔振峠' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('顔振峠', '顔振峠-lixle9bb', '顔振峠は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.926339, 139.245447, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=504', 'ghostmap.jp',
            'community-site',
            '顔振峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 216: 華厳の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=506') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '華厳の滝' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('華厳の滝', '華厳の滝-21alws81', '華厳の滝は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.737861, 139.502544, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=506', 'ghostmap.jp',
            'community-site',
            '華厳の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 217: 猪子トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=508') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猪子トンネル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猪子トンネル', '猪子トンネル-rsymsrxh', '猪子トンネルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.415621, 139.423561, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=508', 'ghostmap.jp',
            'community-site',
            '猪子トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 218: ブルースカイ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=510') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ブルースカイ' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ブルースカイ', 'ブルースカイ-tbm28ns3', 'ブルースカイは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.61079, 139.973564, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=510', 'ghostmap.jp',
            'community-site',
            'ブルースカイとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 219: 皇居
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=512') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '皇居' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('皇居', '皇居-at421pa3', '皇居は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.685013, 139.752835, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=512', 'ghostmap.jp',
            'community-site',
            '皇居とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 220: 鎧神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=514') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鎧神社' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鎧神社', '鎧神社-fuagsmq9', '鎧神社は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.704456, 139.691648, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=514', 'ghostmap.jp',
            'community-site',
            '鎧神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 221: 井の頭公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=516') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '井の頭公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('井の頭公園', '井の頭公園-hglhos1e', '井の頭公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.699525, 139.576916, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=516', 'ghostmap.jp',
            'community-site',
            '井の頭公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 222: 八王子4トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=520') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八王子4トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八王子4トンネル', '八王子4トンネル-kf2y0h2x', '八王子4トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.623303, 139.348714, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=520', 'ghostmap.jp',
            'community-site',
            '八王子4トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 223: 旧風吹トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=522') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧風吹トンネル' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧風吹トンネル', '旧風吹トンネル-b7m1hy52', '旧風吹トンネルは、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.304365, 135.308463, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=522', 'ghostmap.jp',
            'community-site',
            '旧風吹トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 224: 笹子トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=524') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笹子トンネル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笹子トンネル', '笹子トンネル-bg7bn3vd', '笹子トンネルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.624163, 138.789475, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=524', 'ghostmap.jp',
            'community-site',
            '笹子トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 225: キリシタン塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=526') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'キリシタン塚' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('キリシタン塚', 'キリシタン塚-22hnap83', 'キリシタン塚は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.018882, 138.249931, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=526', 'ghostmap.jp',
            'community-site',
            'キリシタン塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 226: 門田稲荷神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=528') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '門田稲荷神社' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('門田稲荷神社', '門田稲荷神社-kt07swin', '門田稲荷神社は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.323939, 139.435538, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=528', 'ghostmap.jp',
            'community-site',
            '門田稲荷神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 227: 神子沢トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=530') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神子沢トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神子沢トンネル', '神子沢トンネル-dzmqkkcn', '神子沢トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.737562, 139.727685, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=530', 'ghostmap.jp',
            'community-site',
            '神子沢トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 228: ブラックビル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=532') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ブラックビル' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ブラックビル', 'ブラックビル-atas73tp', 'ブラックビルは、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         33.665758, 135.353316, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=532', 'ghostmap.jp',
            'community-site',
            'ブラックビルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 229: 血の池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=534') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '血の池' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('血の池', '血の池-m7vtcnmo', '血の池は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.033199, 135.673459, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=534', 'ghostmap.jp',
            'community-site',
            '血の池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 230: 篠津囚人墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=536') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '篠津囚人墓地' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('篠津囚人墓地', '篠津囚人墓地-7a8bvxj7', '篠津囚人墓地は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.32492, 141.643006, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=536', 'ghostmap.jp',
            'community-site',
            '篠津囚人墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 231: 西岡水源池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=538') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西岡水源池' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西岡水源池', '西岡水源池-h4be1wvv', '西岡水源池は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.986528, 141.380154, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=538', 'ghostmap.jp',
            'community-site',
            '西岡水源池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 232: 旧多摩病院跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=540') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧多摩病院跡' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧多摩病院跡', '旧多摩病院跡-vu5h3eaf', '旧多摩病院跡は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.682528, 139.509198, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=540', 'ghostmap.jp',
            'community-site',
            '旧多摩病院跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 233: 屯鶴峯防空壕
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=542') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '屯鶴峯防空壕' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('屯鶴峯防空壕', '屯鶴峯防空壕-d28g3zud', '屯鶴峯防空壕は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.541277, 135.663353, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=542', 'ghostmap.jp',
            'community-site',
            '屯鶴峯防空壕とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 234: 天華園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=544') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天華園' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天華園', '天華園-6wp61jfb', '天華園は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.476267, 141.134017, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=544', 'ghostmap.jp',
            'community-site',
            '天華園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 235: 旧大函トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=548') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧大函トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧大函トンネル', '旧大函トンネル-uv8volfk', '旧大函トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.7, 143.015231, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=548', 'ghostmap.jp',
            'community-site',
            '旧大函トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 236: 切支丹坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=550') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '切支丹坂' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('切支丹坂', '切支丹坂-ijekuhyg', '切支丹坂は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.713192, 139.739005, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=550', 'ghostmap.jp',
            'community-site',
            '切支丹坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 237: 豊沢隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=552') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊沢隧道' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊沢隧道', '豊沢隧道-7td4kdid', '豊沢隧道は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.481206, 140.972182, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=552', 'ghostmap.jp',
            'community-site',
            '豊沢隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 238: 日本BE研究所　桑原研修所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=554') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日本BE研究所　桑原研修所' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日本BE研究所　桑原研修所', '日本be研究所-桑原研修所-qxl52yt8', '日本BE研究所　桑原研修所は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.120562, 139.038297, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=554', 'ghostmap.jp',
            'community-site',
            '日本BE研究所　桑原研修所とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 239: 一庫ダム（龍化トンネル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=556') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一庫ダム（龍化トンネル）' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一庫ダム（龍化トンネル）', '一庫ダム龍化トンネル-c4oka8w1', '一庫ダム（龍化トンネル）は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.924073, 135.409727, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=556', 'ghostmap.jp',
            'community-site',
            '一庫ダム（龍化トンネル）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 240: 新潟ロシア村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=558') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新潟ロシア村' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新潟ロシア村', '新潟ロシア村-vk717spo', '新潟ロシア村は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.840092, 139.293302, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=558', 'ghostmap.jp',
            'community-site',
            '新潟ロシア村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 241: 三崎公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=562') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三崎公園' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三崎公園', '三崎公園-kc0ctvjo', '三崎公園は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.938304, 140.919969, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=562', 'ghostmap.jp',
            'community-site',
            '三崎公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 242: 三州園ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=564') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三州園ホテル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三州園ホテル', '三州園ホテル-ryl2wain', '三州園ホテルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.807355, 137.145767, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=564', 'ghostmap.jp',
            'community-site',
            '三州園ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 243: 本牧山頂公園（隠れた人工霊山）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=566') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本牧山頂公園（隠れた人工霊山）' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本牧山頂公園（隠れた人工霊山）', '本牧山頂公園隠れた人工霊山-yrsuip2s', '本牧山頂公園（隠れた人工霊山）は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.425183, 139.661822, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=566', 'ghostmap.jp',
            'community-site',
            '本牧山頂公園（隠れた人工霊山）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 244: 生駒山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=568') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '生駒山' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('生駒山', '生駒山-bvlxj0ga', '生駒山は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.677264, 135.689263, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=568', 'ghostmap.jp',
            'community-site',
            '生駒山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 245: 多々良木トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=570') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多々良木トンネル' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多々良木トンネル', '多良木トンネル-h33xoyy8', '多々良木トンネルは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.239737, 134.845034, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=570', 'ghostmap.jp',
            'community-site',
            '多々良木トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 246: 魔のカーブ（兵庫）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=574') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '魔のカーブ（兵庫）' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('魔のカーブ（兵庫）', '魔のカーブ兵庫-sjvcujyb', '魔のカーブ（兵庫）は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.013707, 134.760584, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=574', 'ghostmap.jp',
            'community-site',
            '魔のカーブ（兵庫）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 247: 奥多摩湖ロープウェイ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=576') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '奥多摩湖ロープウェイ' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('奥多摩湖ロープウェイ', '奥多摩湖ロープウェイ-f7ckg6qe', '奥多摩湖ロープウェイは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.77155, 139.002199, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=576', 'ghostmap.jp',
            'community-site',
            '奥多摩湖ロープウェイとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 248: 軽井沢大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=578') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '軽井沢大橋' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('軽井沢大橋', '軽井沢大橋-kei7388q', '軽井沢大橋は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.314466, 138.551203, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=578', 'ghostmap.jp',
            'community-site',
            '軽井沢大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 249: ふじみ野市立福岡中学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=580') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ふじみ野市立福岡中学校' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ふじみ野市立福岡中学校', 'ふじみ野市立福岡中学校-kwvkdtr4', 'ふじみ野市立福岡中学校は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.875237, 139.522127, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=580', 'ghostmap.jp',
            'community-site',
            'ふじみ野市立福岡中学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 250: 野方第3踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=584') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野方第3踏切' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野方第3踏切', '野方第3踏切-03u2ermv', '野方第3踏切は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.720359, 139.650861, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=584', 'ghostmap.jp',
            'community-site',
            '野方第3踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 251: 大滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=586') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大滝' and prefecture_slug = 'miyagi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大滝', '大滝-a7an24h0', '大滝は、宮城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮城県', 'miyagi', null,
         38.563334, 140.690918, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=586', 'ghostmap.jp',
            'community-site',
            '大滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 252: 竹ノ塚駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=590') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '竹ノ塚駅' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('竹ノ塚駅', '竹ノ塚駅-7uorpnu9', '竹ノ塚駅は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.79396, 139.790259, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=590', 'ghostmap.jp',
            'community-site',
            '竹ノ塚駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 253: 信号機の横に座る老人の男性
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=592') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '信号機の横に座る老人の男性' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('信号機の横に座る老人の男性', '信号機の横に座る老人の男性-switi1s4', '信号機の横に座る老人の男性は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.879317, 130.769958, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=592', 'ghostmap.jp',
            'community-site',
            '信号機の横に座る老人の男性とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 254: ニャロメの塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=600') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ニャロメの塔' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ニャロメの塔', 'ニャロメの塔-ty79h31a', 'ニャロメの塔は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.48341, 136.716208, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=600', 'ghostmap.jp',
            'community-site',
            'ニャロメの塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 255: ロシア病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=602') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ロシア病院' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ロシア病院', 'ロシア病院-iz58wc0r', 'ロシア病院は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.497594, 135.443907, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=602', 'ghostmap.jp',
            'community-site',
            'ロシア病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 256: 定峰峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=604') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '定峰峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('定峰峠', '定峰峠-e0qc7wdp', '定峰峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.011304, 139.163538, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=604', 'ghostmap.jp',
            'community-site',
            '定峰峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 257: 神流湖（下久保ダム）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=606') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神流湖（下久保ダム）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神流湖（下久保ダム）', '神流湖下久保ダム-0dqgzbwq', '神流湖（下久保ダム）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.127407, 139.006222, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=606', 'ghostmap.jp',
            'community-site',
            '神流湖（下久保ダム）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 258: ホテル望洋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=608') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル望洋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル望洋', 'ホテル望洋-7j82z65n', 'ホテル望洋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         34.917454, 139.938037, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=608', 'ghostmap.jp',
            'community-site',
            'ホテル望洋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 259: 鎖塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=610') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鎖塚' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鎖塚', '鎖塚-wfqfh25v', '鎖塚は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.883322, 144.018172, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=610', 'ghostmap.jp',
            'community-site',
            '鎖塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 260: 洗心寮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=612') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '洗心寮' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('洗心寮', '洗心寮-77g10hgi', '洗心寮は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.427535, 138.894276, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=612', 'ghostmap.jp',
            'community-site',
            '洗心寮とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 261: 人面電柱
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=614') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人面電柱' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人面電柱', '人面電柱-z6f7033x', '人面電柱は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.670631, 135.604625, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=614', 'ghostmap.jp',
            'community-site',
            ' 人面電柱とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 262: ホテルみほし館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=616') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルみほし館' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルみほし館', 'ホテルみほし館-z2hh1qyt', 'ホテルみほし館は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.38237, 139.918687, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=616', 'ghostmap.jp',
            'community-site',
            'ホテルみほし館とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 263: 会吉トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=618') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '会吉トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('会吉トンネル', '会吉トンネル-doi3dqko', '会吉トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.377966, 138.053963, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=618', 'ghostmap.jp',
            'community-site',
            '会吉トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 264: 14号トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=620') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '14号トンネル' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('14号トンネル', '14号トンネル-yw8orb7v', '14号トンネルは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.305355, 137.106671, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=620', 'ghostmap.jp',
            'community-site',
            '14号トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 265: 鎌倉岳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=622') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鎌倉岳' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鎌倉岳', '鎌倉岳-1niwq2r6', '鎌倉岳は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.466888, 140.6897, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=622', 'ghostmap.jp',
            'community-site',
            '鎌倉岳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 266: 山元トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=624') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山元トンネル' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山元トンネル', '山元トンネル-jsx7ljn2', '山元トンネルは、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.171695, 140.250313, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=624', 'ghostmap.jp',
            'community-site',
            '山元トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 267: リゾートIN長岡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=632') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'リゾートIN長岡' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('リゾートIN長岡', 'リゾートin長岡-zfq9gu3y', 'リゾートIN長岡は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.405312, 138.693638, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=632', 'ghostmap.jp',
            'community-site',
            'リゾートIN長岡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 268: たのうら燕
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=636') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'たのうら燕' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('たのうら燕', 'たのうら燕-2xhuvuju', 'たのうら燕は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.72263, 138.791431, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=636', 'ghostmap.jp',
            'community-site',
            'たのうら燕とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 269: クイーンシャトー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=638') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'クイーンシャトー' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('クイーンシャトー', 'クイーンシャトー-9ny6qpj2', 'クイーンシャトーは、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.378164, 140.46, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=638', 'ghostmap.jp',
            'community-site',
            'クイーンシャトーとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 270: 瀬崎角田公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=640') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '瀬崎角田公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('瀬崎角田公園', '瀬崎角田公園-y02v74x3', '瀬崎角田公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.809774, 139.807552, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=640', 'ghostmap.jp',
            'community-site',
            '瀬崎角田公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 271: 国東小学校
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=642') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '国東小学校' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('国東小学校', '国東小学校-shdx4xb4', '国東小学校は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.562055, 131.729033, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=642', 'ghostmap.jp',
            'community-site',
            '国東小学校とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 272: ホテルニュージャパン跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=644') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルニュージャパン跡地' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルニュージャパン跡地', 'ホテルニュージャパン跡地-ro4jv68m', 'ホテルニュージャパン跡地は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.676209, 139.738483, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=644', 'ghostmap.jp',
            'community-site',
            'ホテルニュージャパン跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 273: 祈願祈祷事務局（観音寺別院）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=646') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '祈願祈祷事務局（観音寺別院）' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('祈願祈祷事務局（観音寺別院）', '祈願祈祷事務局観音寺別院-9vsqc41v', '祈願祈祷事務局（観音寺別院）は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.406487, 138.647454, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=646', 'ghostmap.jp',
            'community-site',
            '祈願祈祷事務局（観音寺別院）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 274: 地蔵温泉
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=648') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵温泉' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵温泉', '地蔵温泉-pjqsuy8e', '地蔵温泉は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.444333, 138.691924, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=648', 'ghostmap.jp',
            'community-site',
            '地蔵温泉とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 275: 柏崎トルコ文化村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=650') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '柏崎トルコ文化村' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('柏崎トルコ文化村', '柏崎トルコ文化村-1bc7lceg', '柏崎トルコ文化村は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.350111, 138.50295, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=650', 'ghostmap.jp',
            'community-site',
            '柏崎トルコ文化村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 276: 下源入交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=652') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下源入交差点' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下源入交差点', '下源入交差点-4c6gthbn', '下源入交差点は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.165214, 138.25645, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=652', 'ghostmap.jp',
            'community-site',
            '下源入交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 277: 妙高国際ロッジ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=656') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙高国際ロッジ' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙高国際ロッジ', '妙高国際ロッジ-kxqpgv8i', '妙高国際ロッジは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.854737, 138.138464, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=656', 'ghostmap.jp',
            'community-site',
            '妙高国際ロッジとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 278: 舞鶴
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=662') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '舞鶴' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('舞鶴', '舞鶴-bxt4mz9q', '舞鶴は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.305843, 138.713707, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=662', 'ghostmap.jp',
            'community-site',
            '舞鶴とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 279: 角神隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=666') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '角神隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('角神隧道', '角神隧道-vsio02ea', '角神隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.701513, 139.480319, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=666', 'ghostmap.jp',
            'community-site',
            '角神隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 280: 中永隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=670') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中永隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中永隧道', '中永隧道-ww4djdqs', '中永隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.515337, 138.742396, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=670', 'ghostmap.jp',
            'community-site',
            '中永隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 281: ホテル ベルサイユ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=672') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル ベルサイユ' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル ベルサイユ', 'ホテル-ベルサイユ-2oy94wg4', 'ホテル ベルサイユは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.524379, 138.878566, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=672', 'ghostmap.jp',
            'community-site',
            'ホテル ベルサイユとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 282: 熊沢トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=680') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '熊沢トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('熊沢トンネル', '熊沢トンネル-s1vj0fzc', '熊沢トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.778551, 139.145236, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=680', 'ghostmap.jp',
            'community-site',
            '熊沢トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 283: 伊古部海岸の廃道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=682') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伊古部海岸の廃道' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伊古部海岸の廃道', '伊古部海岸の廃道-suejon1v', '伊古部海岸の廃道は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         34.660867, 137.387825, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=682', 'ghostmap.jp',
            'community-site',
            '伊古部海岸の廃道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 284: 石打ロイヤルホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=684') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '石打ロイヤルホテル' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('石打ロイヤルホテル', '石打ロイヤルホテル-sf19cl51', '石打ロイヤルホテルは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.974547, 138.799918, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=684', 'ghostmap.jp',
            'community-site',
            '石打ロイヤルホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 285: 八柱霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=688') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八柱霊園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八柱霊園', '八柱霊園-dxtbe78n', '八柱霊園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.780778, 139.949394, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=688', 'ghostmap.jp',
            'community-site',
            '八柱霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 286: じゅんさい池公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=690') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'じゅんさい池公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('じゅんさい池公園', 'じゅんさい池公園-ungk1oux', 'じゅんさい池公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.941811, 139.103951, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=690', 'ghostmap.jp',
            'community-site',
            'じゅんさい池公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 287: どんち池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=692') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'どんち池' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('どんち池', 'どんち池-x9bptyi0', 'どんち池は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.839064, 138.904299, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=692', 'ghostmap.jp',
            'community-site',
            'どんち池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 288: 太夫浜霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=694') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '太夫浜霊園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('太夫浜霊園', '太夫浜霊園-h50eyo7o', '太夫浜霊園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.960842, 139.171168, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=694', 'ghostmap.jp',
            'community-site',
            '太夫浜霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 289: 魔のカーブ（京都）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=696') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '魔のカーブ（京都）' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('魔のカーブ（京都）', '魔のカーブ京都-vlut4lxv', '魔のカーブ（京都）は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.958633, 135.680399, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=696', 'ghostmap.jp',
            'community-site',
            '魔のカーブ（京都）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 290: 老ノ坂バス停
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=700') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '老ノ坂バス停' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('老ノ坂バス停', '老ノ坂バス停-5k0rq4ql', '老ノ坂バス停は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.991615, 135.638192, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=700', 'ghostmap.jp',
            'community-site',
            '老ノ坂バス停とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 291: 天蓋の花公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=702') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天蓋の花公園' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天蓋の花公園', '天蓋の花公園-cvb25gps', '天蓋の花公園は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.980287, 135.660385, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=702', 'ghostmap.jp',
            'community-site',
            '天蓋の花公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 292: ありがた山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=704') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ありがた山' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ありがた山', 'ありがた山-qkp1s35p', 'ありがた山は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.631436, 139.512234, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=704', 'ghostmap.jp',
            'community-site',
            'ありがた山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 293: 線守稲荷神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=706') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '線守稲荷神社' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('線守稲荷神社', '線守稲荷神社-j90rw9ry', '線守稲荷神社は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.360391, 139.058632, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=706', 'ghostmap.jp',
            'community-site',
            '線守稲荷神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 294: 地蔵寺（水子地蔵）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=708') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵寺（水子地蔵）' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵寺（水子地蔵）', '地蔵寺水子地蔵-nhvjk0qu', '地蔵寺（水子地蔵）は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.036457, 138.956303, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=708', 'ghostmap.jp',
            'community-site',
            '地蔵寺（水子地蔵）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 295: 打越橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=710') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '打越橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('打越橋', '打越橋-6g4qwyf2', '打越橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.43343, 139.63888, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=710', 'ghostmap.jp',
            'community-site',
            '打越橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 296: 旧満地トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=712') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧満地トンネル' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧満地トンネル', '旧満地トンネル-ptkoflg5', '旧満地トンネルは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.756382, 139.292429, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=712', 'ghostmap.jp',
            'community-site',
            '旧満地トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 297: 後山隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=714') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '後山隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('後山隧道', '後山隧道-0fc6c8pm', '後山隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.153733, 138.878217, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=714', 'ghostmap.jp',
            'community-site',
            '後山隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 298: 野田山墓地（前田家の墓）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=716') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野田山墓地（前田家の墓）' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野田山墓地（前田家の墓）', '野田山墓地前田家の墓-gex0idem', '野田山墓地（前田家の墓）は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.532493, 136.66677, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=716', 'ghostmap.jp',
            'community-site',
            '野田山墓地（前田家の墓）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 299: 富士急ハイランドの戦慄迷宮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=718') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '富士急ハイランドの戦慄迷宮' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('富士急ハイランドの戦慄迷宮', '富士急ハイランドの戦慄迷宮-9smmhi2z', '富士急ハイランドの戦慄迷宮は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.487544, 138.783576, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=718', 'ghostmap.jp',
            'community-site',
            '富士急ハイランドの戦慄迷宮とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 300: お玉ケ池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=720') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'お玉ケ池' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('お玉ケ池', 'お玉ケ池-xak4jhbn', 'お玉ケ池は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.205696, 139.041497, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=720', 'ghostmap.jp',
            'community-site',
            'お玉ケ池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 301: 安井金比羅宮
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=722') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '安井金比羅宮' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('安井金比羅宮', '安井金比羅宮-tkw7vt0r', '安井金比羅宮は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.99992, 135.775961, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=722', 'ghostmap.jp',
            'community-site',
            '安井金比羅宮とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 302: 鎌倉霊園太刀洗門前の電話ボックス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=726') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鎌倉霊園太刀洗門前の電話ボックス' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鎌倉霊園太刀洗門前の電話ボックス', '鎌倉霊園太刀洗門前の電話ボックス-4pwnzdn8', '鎌倉霊園太刀洗門前の電話ボックスは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.325886, 139.583014, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=726', 'ghostmap.jp',
            'community-site',
            '鎌倉霊園太刀洗門前の電話ボックスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 303: 南伊勢高校 南勢校舎裏の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=728') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南伊勢高校 南勢校舎裏の廃墟' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南伊勢高校 南勢校舎裏の廃墟', '南伊勢高校-南勢校舎裏の廃墟-2x4b1bsl', '南伊勢高校 南勢校舎裏の廃墟は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.345314, 136.694083, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=728', 'ghostmap.jp',
            'community-site',
            '南伊勢高校 南勢校舎裏の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 304: 宇土殺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=730') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宇土殺' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宇土殺', '宇土殺-c99qal9j', '宇土殺は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.691135, 130.661785, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=730', 'ghostmap.jp',
            'community-site',
            '宇土殺とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 305: 緑のペンション
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=732') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑のペンション' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑のペンション', '緑のペンション-8xvpll5j', '緑のペンションは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.879176, 138.19118, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=732', 'ghostmap.jp',
            'community-site',
            '緑のペンションとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 306: 幽霊坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=734') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '幽霊坂' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('幽霊坂', '幽霊坂-eeysss2l', '幽霊坂は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.37363, 140.46043, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=734', 'ghostmap.jp',
            'community-site',
            '幽霊坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 307: オチョバンバの石碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=736') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'オチョバンバの石碑' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('オチョバンバの石碑', 'オチョバンバの石碑-esf1acut', 'オチョバンバの石碑は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.344305, 139.404189, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=736', 'ghostmap.jp',
            'community-site',
            'オチョバンバの石碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 308: 谷田踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=738') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷田踏切' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷田踏切', '谷田踏切-adopa6fx', '谷田踏切は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.669622, 140.17808, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=738', 'ghostmap.jp',
            'community-site',
            '谷田踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 309: 五十島トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=740') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '五十島トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('五十島トンネル', '五十島トンネル-yz0tinql', '五十島トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.720831, 139.35462, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=740', 'ghostmap.jp',
            'community-site',
            '五十島トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 310: 丸山大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=742') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '丸山大橋' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('丸山大橋', '丸山大橋-78msvkf9', '丸山大橋は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.082259, 139.592285, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=742', 'ghostmap.jp',
            'community-site',
            '丸山大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 311: 花見潟墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=748') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花見潟墓地' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花見潟墓地', '花見潟墓地-rz2g9qc2', '花見潟墓地は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.516259, 133.641591, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=748', 'ghostmap.jp',
            'community-site',
            '花見潟墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 312: 海辺の廃牛舎
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=750') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '海辺の廃牛舎' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('海辺の廃牛舎', '海辺の廃牛舎-b3vs9lkj', '海辺の廃牛舎は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.524499, 138.662712, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=750', 'ghostmap.jp',
            'community-site',
            '海辺の廃牛舎とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 313: 寺尾中央公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=752') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '寺尾中央公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('寺尾中央公園', '寺尾中央公園-wnhzxq1m', '寺尾中央公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.883254, 138.972405, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=752', 'ghostmap.jp',
            'community-site',
            '寺尾中央公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 314: 辺戸岬
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=754') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '辺戸岬' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('辺戸岬', '辺戸岬-4r9288uu', '辺戸岬は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.872009, 128.265508, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=754', 'ghostmap.jp',
            'community-site',
            '辺戸岬とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 315: ガジュマル公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=760') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ガジュマル公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ガジュマル公園', 'ガジュマル公園-uf5n19wh', 'ガジュマル公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.23462, 127.697632, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=760', 'ghostmap.jp',
            'community-site',
            'ガジュマル公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 316: 玉陵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=762') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '玉陵' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('玉陵', '玉陵-dqgaoa11', '玉陵は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.218465, 127.71409, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=762', 'ghostmap.jp',
            'community-site',
            '玉陵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 317: 万座毛
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=764') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '万座毛' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('万座毛', '万座毛-nz2fdvho', '万座毛は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.5052, 127.850367, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=764', 'ghostmap.jp',
            'community-site',
            '万座毛とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 318: 武蔵野中央公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=768') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武蔵野中央公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武蔵野中央公園', '武蔵野中央公園-opeuk34q', '武蔵野中央公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.718438, 139.558835, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=768', 'ghostmap.jp',
            'community-site',
            '武蔵野中央公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 319: 21世紀の森と広場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=770') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '21世紀の森と広場' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('21世紀の森と広場', '21世紀の森と広場-q12rp6hy', '21世紀の森と広場は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.801736, 139.94077, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=770', 'ghostmap.jp',
            'community-site',
            '21世紀の森と広場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 320: 胎内トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=772') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '胎内トンネル' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('胎内トンネル', '胎内トンネル-cjt4on10', '胎内トンネルは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         38.003552, 139.48313, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=772', 'ghostmap.jp',
            'community-site',
            '胎内トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 321: 拝島橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=774') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '拝島橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('拝島橋', '拝島橋-o841nil8', '拝島橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.699295, 139.346993, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=774', 'ghostmap.jp',
            'community-site',
            '拝島橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 322: 塩之入峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=776') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '塩之入峠' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('塩之入峠', '塩之入峠-jbs0uzxq', '塩之入峠は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.559118, 138.798126, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=776', 'ghostmap.jp',
            'community-site',
            '塩之入峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 323: 小金井公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=778') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小金井公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小金井公園', '小金井公園-n0rpxwia', '小金井公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.716518, 139.522548, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=778', 'ghostmap.jp',
            'community-site',
            '小金井公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 324: 裏新池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=780') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '裏新池' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('裏新池', '裏新池-34uvtc38', '裏新池は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.158778, 133.679915, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=780', 'ghostmap.jp',
            'community-site',
            '裏新池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 325: 大崎山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=784') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大崎山公園' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大崎山公園', '大崎山公園-ypsqinck', '大崎山公園は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.618396, 139.001942, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=784', 'ghostmap.jp',
            'community-site',
            '大崎山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 326: 築別炭鉱
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=786') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '築別炭鉱' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('築別炭鉱', '築別炭鉱-w6vhd2ta', '築別炭鉱は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         44.39156, 141.888486, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=786', 'ghostmap.jp',
            'community-site',
            '築別炭鉱とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 327: 旧豊浜トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=788') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧豊浜トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧豊浜トンネル', '旧豊浜トンネル-7r3xes9c', '旧豊浜トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.2503, 140.696095, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=788', 'ghostmap.jp',
            'community-site',
            '旧豊浜トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 328: 角石原隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=792') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '角石原隧道' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('角石原隧道', '角石原隧道-pno6fpqz', '角石原隧道は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.857228, 139.414423, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=792', 'ghostmap.jp',
            'community-site',
            '角石原隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 329: HOTELジャスパー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=794') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'HOTELジャスパー' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('HOTELジャスパー', 'hotelジャスパー-6eq975cz', 'HOTELジャスパーは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.841558, 138.202725, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=794', 'ghostmap.jp',
            'community-site',
            'HOTELジャスパーとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 330: 夕月橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=796') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '夕月橋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('夕月橋', '夕月橋-12sj85dx', '夕月橋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.385618, 135.525287, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=796', 'ghostmap.jp',
            'community-site',
            '夕月橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 331: 北区立神谷公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=802') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北区立神谷公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北区立神谷公園', '北区立神谷公園-p427et2h', '北区立神谷公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.772443, 139.731189, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=802', 'ghostmap.jp',
            'community-site',
            '北区立神谷公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 332: 石澄の滝までの道中の廃墟群
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=804') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '石澄の滝までの道中の廃墟群' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('石澄の滝までの道中の廃墟群', '石澄の滝までの道中の廃墟群-mms1ehji', '石澄の滝までの道中の廃墟群は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.840258, 135.454061, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=804', 'ghostmap.jp',
            'community-site',
            '石澄の滝までの道中の廃墟群とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 333: ライブ24
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=808') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ライブ24' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ライブ24', 'ライブ24-zgfpsfhk', 'ライブ24は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.119644, 140.481473, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=808', 'ghostmap.jp',
            'community-site',
            'ライブ24とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 334: 高松城番町血屋敷井戸址
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=810') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高松城番町血屋敷井戸址' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高松城番町血屋敷井戸址', '高松城番町血屋敷井戸址-ej4minoa', '高松城番町血屋敷井戸址は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.346836, 134.05112, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=810', 'ghostmap.jp',
            'community-site',
            '高松城番町血屋敷井戸址とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 335: 石人山古墳
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=812') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '石人山古墳' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('石人山古墳', '石人山古墳-i36uonyy', '石人山古墳は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.2377, 130.517162, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=812', 'ghostmap.jp',
            'community-site',
            '石人山古墳とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 336: 飛形山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=814') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '飛形山' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('飛形山', '飛形山-rz5r7x4s', '飛形山は、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         33.161194, 130.5887, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=814', 'ghostmap.jp',
            'community-site',
            '飛形山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 337: 十里塚にあるお墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=818') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十里塚にあるお墓' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十里塚にあるお墓', '十里塚にあるお墓-x8c7gehr', '十里塚にあるお墓は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.879122, 139.802624, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=818', 'ghostmap.jp',
            'community-site',
            '十里塚にあるお墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 338: 中新町交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=820') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中新町交差点' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中新町交差点', '中新町交差点-ws8k516a', '中新町交差点は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.337275, 134.047034, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=820', 'ghostmap.jp',
            'community-site',
            '中新町交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 339: 美郷町六郷の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=822') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美郷町六郷の廃墟' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美郷町六郷の廃墟', '美郷町六郷の廃墟-lpucrliw', '美郷町六郷の廃墟は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.422441, 140.550956, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=822', 'ghostmap.jp',
            'community-site',
            '美郷町六郷の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 340: 御坊川原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=824') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御坊川原' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御坊川原', '御坊川原-r5v8bdr5', '御坊川原は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.332983, 134.060119, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=824', 'ghostmap.jp',
            'community-site',
            '御坊川原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 341: 湯田川温泉ラブホ跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=826') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湯田川温泉ラブホ跡地' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湯田川温泉ラブホ跡地', '湯田川温泉ラブホ跡地-o7ju5wuf', '湯田川温泉ラブホ跡地は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.691841, 139.764116, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=826', 'ghostmap.jp',
            'community-site',
            '湯田川温泉ラブホ跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 342: 越廼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=828') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '越廼' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('越廼', '越廼-hnpnuosu', '越廼は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.02741, 135.999423, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=828', 'ghostmap.jp',
            'community-site',
            '越廼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 343: 保呂瀬トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=830') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '保呂瀬トンネル' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('保呂瀬トンネル', '保呂瀬トンネル-bgfd5mz8', '保呂瀬トンネルは、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.911662, 140.201179, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=830', 'ghostmap.jp',
            'community-site',
            '保呂瀬トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 344: 旧観音坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=832') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧観音坂トンネル' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧観音坂トンネル', '旧観音坂トンネル-pnx4uac4', '旧観音坂トンネルは、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.385212, 136.337277, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=832', 'ghostmap.jp',
            'community-site',
            '旧観音坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 345: 今宿山岸の山道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=834') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '今宿山岸の山道' and prefecture_slug = 'yamagata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('今宿山岸の山道', '今宿山岸の山道-6vpdufzj', '今宿山岸の山道は、山形県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山形県', 'yamagata', null,
         38.228101, 140.476556, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=834', 'ghostmap.jp',
            'community-site',
            '今宿山岸の山道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 346: 晴醐苑ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=838') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '晴醐苑ホテル' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('晴醐苑ホテル', '晴醐苑ホテル-lq5eb998', '晴醐苑ホテルは、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.395831, 133.369371, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=838', 'ghostmap.jp',
            'community-site',
            '晴醐苑ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 347: 滝山城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=842') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝山城跡' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝山城跡', '滝山城跡-xpsfhgn0', '滝山城跡は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.701534, 139.329583, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=842', 'ghostmap.jp',
            'community-site',
            '滝山城跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 348: 緑風荘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=844') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '緑風荘' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('緑風荘', '緑風荘-lf8mq8ow', '緑風荘は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         40.322907, 141.317051, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=844', 'ghostmap.jp',
            'community-site',
            '緑風荘とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 349: 東秋川橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=846') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東秋川橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東秋川橋', '東秋川橋-yt2w5viv', '東秋川橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.716931, 139.317647, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=846', 'ghostmap.jp',
            'community-site',
            '東秋川橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 350: 富士森公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=848') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '富士森公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('富士森公園', '富士森公園-9nxnmbt5', '富士森公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.651223, 139.323476, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=848', 'ghostmap.jp',
            'community-site',
            '富士森公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 351: 水甫トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=850') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水甫トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水甫トンネル', '水甫トンネル-sa09quqe', '水甫トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.609661, 139.356853, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=850', 'ghostmap.jp',
            'community-site',
            '水甫トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 352: 早出川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=856') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '早出川ダム' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('早出川ダム', '早出川ダム-shgut7tk', '早出川ダムは、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.642238, 139.295225, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=856', 'ghostmap.jp',
            'community-site',
            '早出川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 353: あぶくま高原ホテル（阿武隈高原温泉廃墟）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=870') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'あぶくま高原ホテル（阿武隈高原温泉廃墟）' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('あぶくま高原ホテル（阿武隈高原温泉廃墟）', 'あぶくま高原ホテル阿武隈高原温泉廃墟-clv23eiz', 'あぶくま高原ホテル（阿武隈高原温泉廃墟）は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.356838, 140.68244, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=870', 'ghostmap.jp',
            'community-site',
            'あぶくま高原ホテル（阿武隈高原温泉廃墟）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 354: 箕面の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=872') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '箕面の滝' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('箕面の滝', '箕面の滝-incpr5x2', '箕面の滝は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.852502, 135.472017, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=872', 'ghostmap.jp',
            'community-site',
            '箕面の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 355: 泣塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=876') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '泣塔' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('泣塔', '泣塔-qz3h5n36', '泣塔は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.335229, 139.518976, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=876', 'ghostmap.jp',
            'community-site',
            '泣塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 356: 雄鹿戸トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=882') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '雄鹿戸トンネル' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('雄鹿戸トンネル', '雄鹿戸トンネル-hwqwaqq0', '雄鹿戸トンネルは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.74369, 141.683836, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=882', 'ghostmap.jp',
            'community-site',
            '雄鹿戸トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 357: 猪苗代湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=884') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猪苗代湖' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猪苗代湖', '猪苗代湖-q49m3y8d', '猪苗代湖は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.419595, 140.097287, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=884', 'ghostmap.jp',
            'community-site',
            '猪苗代湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 358: ケンちゃんハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=896') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ケンちゃんハウス' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ケンちゃんハウス', 'ケンちゃんハウス-2savs4j6', 'ケンちゃんハウスは、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.62027, 139.84326, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=896', 'ghostmap.jp',
            'community-site',
            'ケンちゃんハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 359: 白山道トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=898') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白山道トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白山道トンネル', '白山道トンネル-qpxb37t6', '白山道トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.334856, 139.61005, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=898', 'ghostmap.jp',
            'community-site',
            '白山道トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 360: 茅打ちバンタ及びその周辺一帯
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=900') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茅打ちバンタ及びその周辺一帯' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茅打ちバンタ及びその周辺一帯', '茅打ちバンタ及びその周辺一帯-9023gyay', '茅打ちバンタ及びその周辺一帯は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.854752, 128.249577, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=900', 'ghostmap.jp',
            'community-site',
            '茅打ちバンタ及びその周辺一帯とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 361: 三井グリーンランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=902') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三井グリーンランド' and prefecture_slug = 'saga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三井グリーンランド', '三井グリーンランド-koreq2ee', '三井グリーンランドは、佐賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '佐賀県', 'saga', null,
         32.991924, 130.459688, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=902', 'ghostmap.jp',
            'community-site',
            '三井グリーンランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 362: 多摩湖
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=904') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多摩湖' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多摩湖', '多摩湖-siktecsa', '多摩湖は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.7634, 139.431198, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=904', 'ghostmap.jp',
            'community-site',
            '多摩湖とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 363: 一本松交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=906') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '一本松交差点' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('一本松交差点', '一本松交差点-cqnm16md', '一本松交差点は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.51361, 139.33713, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=906', 'ghostmap.jp',
            'community-site',
            '一本松交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 364: ホテルすかいらぶ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=908') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルすかいらぶ' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルすかいらぶ', 'ホテルすかいらぶ-4byia3f8', 'ホテルすかいらぶは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.383028, 139.254781, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=908', 'ghostmap.jp',
            'community-site',
            'ホテルすかいらぶとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 365: 猪掛トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=912') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猪掛トンネル' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猪掛トンネル', '猪掛トンネル-ay9sq5fa', '猪掛トンネルは、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.688257, 128.792568, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=912', 'ghostmap.jp',
            'community-site',
            '猪掛トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 366: 茶々子の墓
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=914') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茶々子の墓' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茶々子の墓', '茶子の墓-34u0sbol', '茶々子の墓は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.666375, 128.724497, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=914', 'ghostmap.jp',
            'community-site',
            '茶々子の墓とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 367: 白糸の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=918') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白糸の滝' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白糸の滝', '白糸の滝-0tzniesj', '白糸の滝は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.312993, 138.587347, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=918', 'ghostmap.jp',
            'community-site',
            '白糸の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 368: やまびこ大橋交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=926') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'やまびこ大橋交差点' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('やまびこ大橋交差点', 'やまびこ大橋交差点-dxf0mgc4', 'やまびこ大橋交差点は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.524874, 139.235534, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=926', 'ghostmap.jp',
            'community-site',
            'やまびこ大橋交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 369: 瀬良垣某信号機手前
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=928') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '瀬良垣某信号機手前' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('瀬良垣某信号機手前', '瀬良垣某信号機手前-lv0um2a7', '瀬良垣某信号機手前は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.508234, 127.873821, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=928', 'ghostmap.jp',
            'community-site',
            '瀬良垣某信号機手前とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 370: 七沢自然教室
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=930') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '七沢自然教室' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('七沢自然教室', '七沢自然教室-seuecyr3', '七沢自然教室は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.460679, 139.287822, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=930', 'ghostmap.jp',
            'community-site',
            '七沢自然教室とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 371: 天使の森公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=932') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天使の森公園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天使の森公園', '天使の森公園-yau6bpbx', '天使の森公園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.722611, 140.245103, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=932', 'ghostmap.jp',
            'community-site',
            '天使の森公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 372: 呼塚交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=934') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '呼塚交差点' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('呼塚交差点', '呼塚交差点-5haglxzi', '呼塚交差点は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.870201, 139.974991, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=934', 'ghostmap.jp',
            'community-site',
            '呼塚交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 373: 三ッ塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=936') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三ッ塚' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三ッ塚', '三ッ塚-mkyfevha', '三ッ塚は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.723016, 139.565399, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=936', 'ghostmap.jp',
            'community-site',
            '三ッ塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 374: 人見神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=938') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '人見神社' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('人見神社', '人見神社-kznxlatd', '人見神社は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.337166, 139.867222, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=938', 'ghostmap.jp',
            'community-site',
            '人見神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 375: 陵北大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=942') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '陵北大橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('陵北大橋', '陵北大橋-gy43hbh5', '陵北大橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.681813, 139.271109, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=942', 'ghostmap.jp',
            'community-site',
            '陵北大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 376: 太秦駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=944') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '太秦駅' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('太秦駅', '太秦駅-wdtuqg93', '太秦駅は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.017049, 135.700203, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=944', 'ghostmap.jp',
            'community-site',
            '太秦駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 377: サンシャイン60（巣鴨プリズン）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=946') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'サンシャイン60（巣鴨プリズン）' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('サンシャイン60（巣鴨プリズン）', 'サンシャイン60巣鴨プリズン-x0zsvli8', 'サンシャイン60（巣鴨プリズン）は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.729461, 139.718392, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=946', 'ghostmap.jp',
            'community-site',
            'サンシャイン60（巣鴨プリズン）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 378: 日本坂トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=948') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日本坂トンネル' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日本坂トンネル', '日本坂トンネル-c04oq6d2', '日本坂トンネルは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.908907, 138.340847, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=948', 'ghostmap.jp',
            'community-site',
            '日本坂トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 379: 真のsss（シーゾーグムイ付近新川川流域にある御嶽）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=950') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '真のsss（シーゾーグムイ付近新川川流域にある御嶽）' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('真のsss（シーゾーグムイ付近新川川流域にある御嶽）', '真のsssシーゾーグムイ付近新川川流域にある御嶽-yvvkluon', '真のsss（シーゾーグムイ付近新川川流域にある御嶽）は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.666861, 128.250974, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=950', 'ghostmap.jp',
            'community-site',
            '真のsss（シーゾーグムイ付近新川川流域にある御嶽）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 380: 夢見ケ崎動物公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=952') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '夢見ケ崎動物公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('夢見ケ崎動物公園', '夢見ケ崎動物公園-phr54izr', '夢見ケ崎動物公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.549267, 139.665585, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=952', 'ghostmap.jp',
            'community-site',
            '夢見ケ崎動物公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 381: ホテル〇ネッ〇ス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=956') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル〇ネッ〇ス' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル〇ネッ〇ス', 'ホテルネッス-5v4a9zog', 'ホテル〇ネッ〇スは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.56353, 139.717716, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=956', 'ghostmap.jp',
            'community-site',
            'ホテル〇ネッ〇スとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 382: 鵜の森公園(鵜森神社・浜田城址)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=958') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鵜の森公園(鵜森神社・浜田城址)' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鵜の森公園(鵜森神社・浜田城址)', '鵜の森公園鵜森神社・浜田城址-nkadm330', '鵜の森公園(鵜森神社・浜田城址)は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.964748, 136.616149, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=958', 'ghostmap.jp',
            'community-site',
            '鵜の森公園(鵜森神社・浜田城址)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 383: 八坂神社(東村山市)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=960') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '八坂神社(東村山市)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('八坂神社(東村山市)', '八坂神社東村山市-608sf2r8', '八坂神社(東村山市)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.75037, 139.465739, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=960', 'ghostmap.jp',
            'community-site',
            '八坂神社(東村山市)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 384: 野内病院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=964') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '野内病院' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('野内病院', '野内病院-od2hgmgt', '野内病院は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.862417, 140.83593, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=964', 'ghostmap.jp',
            'community-site',
            '野内病院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 385: 山崎マーケット跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=966') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山崎マーケット跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山崎マーケット跡', '山崎マーケット跡-wpiga06h', '山崎マーケット跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.627444, 134.052819, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=966', 'ghostmap.jp',
            'community-site',
            '山崎マーケット跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 386: ドライブイン一の丸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=968') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ドライブイン一の丸' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ドライブイン一の丸', 'ドライブイン一の丸-3tzzcarg', 'ドライブイン一の丸は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.906993, 133.934889, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=968', 'ghostmap.jp',
            'community-site',
            'ドライブイン一の丸とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 387: 川場村にある廃村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=970') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川場村にある廃村' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川場村にある廃村', '川場村にある廃村-ypagbs2p', '川場村にある廃村は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.688025, 139.129069, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=970', 'ghostmap.jp',
            'community-site',
            '川場村にある廃村とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 388: 源氏の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=974') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '源氏の滝' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('源氏の滝', '源氏の滝-g4qklt2w', '源氏の滝は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.79021, 135.704114, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=974', 'ghostmap.jp',
            'community-site',
            '源氏の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 389: 枚岡神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=978') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '枚岡神社' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('枚岡神社', '枚岡神社-8csq185z', '枚岡神社は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.669945, 135.650618, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=978', 'ghostmap.jp',
            'community-site',
            '枚岡神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 390: 男塾
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=982') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '男塾' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('男塾', '男塾-oxnqxfqb', '男塾は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.708381, 140.867185, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=982', 'ghostmap.jp',
            'community-site',
            '男塾とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 391: 保津川
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=984') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '保津川' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('保津川', '保津川-841zg1f4', '保津川は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.017336, 135.587664, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=984', 'ghostmap.jp',
            'community-site',
            '保津川とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 392: 奈良ドリームランド
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=994') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '奈良ドリームランド' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('奈良ドリームランド', '奈良ドリームランド-vz829dyb', '奈良ドリームランドは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.699487, 135.822399, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=994', 'ghostmap.jp',
            'community-site',
            '奈良ドリームランドとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 393: JR高砂駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=998') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'JR高砂駅' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('JR高砂駅', 'jr高砂駅-1xrdc6ur', 'JR高砂駅は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.099961, 141.54089, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=998', 'ghostmap.jp',
            'community-site',
            'JR高砂駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 394: 加茂青砂海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=1000') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '加茂青砂海岸' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('加茂青砂海岸', '加茂青砂海岸-06igwof6', '加茂青砂海岸は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.908884, 139.731118, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=1000', 'ghostmap.jp',
            'community-site',
            '加茂青砂海岸とは？事件・現在・心霊現象の噂',
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