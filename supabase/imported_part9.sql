-- =====================================================
-- shinrei: imported via scripts/import-spots.ts
-- generated: 2026-05-23T16:07:46.910Z
-- rows: 334
-- 取得元は内部 sources にのみ保存、公開画面には出ません
-- =====================================================

-- 1) spots を挿入（重複は ON CONFLICT で回避）
do $$
declare
  new_spot_id uuid;
begin

  -- 1: 紺屋町地下駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7801') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '紺屋町地下駐車場' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('紺屋町地下駐車場', '紺屋町地下駐車場-r8q2z61u', '紺屋町地下駐車場は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.067258, 134.548246, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7801', 'ghostmap.jp',
            'community-site',
            '紺屋町地下駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 2: ひょうたん池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7803') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ひょうたん池' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ひょうたん池', 'ひょうたん池-5r9022xa', 'ひょうたん池は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.898276, 134.634211, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7803', 'ghostmap.jp',
            'community-site',
            'ひょうたん池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 3: 鵜ノ田尾トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7805') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鵜ノ田尾トンネル' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鵜ノ田尾トンネル', '鵜ノ田尾トンネル-qwvbai8b', '鵜ノ田尾トンネルは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.174149, 134.330421, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7805', 'ghostmap.jp',
            'community-site',
            '鵜ノ田尾トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 4: 市役所前公園アンダーパス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7807') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '市役所前公園アンダーパス' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('市役所前公園アンダーパス', '市役所前公園アンダーパス-uyczjv4y', '市役所前公園アンダーパスは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.071536, 134.55539, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7807', 'ghostmap.jp',
            'community-site',
            '市役所前公園アンダーパスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 5: 六地蔵交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7809') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六地蔵交差点' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六地蔵交差点', '六地蔵交差点-44ar2jz2', '六地蔵交差点は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.31525, 139.546462, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7809', 'ghostmap.jp',
            'community-site',
            '六地蔵交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 6: 愛川ふれあいの村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7811') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '愛川ふれあいの村' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('愛川ふれあいの村', '愛川ふれあいの村-s60d7q4q', '愛川ふれあいの村は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.537133, 139.263253, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7811', 'ghostmap.jp',
            'community-site',
            '愛川ふれあいの村とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 7: 黒地の墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7813') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒地の墓地' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒地の墓地', '黒地の墓地-6i9hmjcy', '黒地の墓地は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.964082, 134.642508, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7813', 'ghostmap.jp',
            'community-site',
            '黒地の墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 8: 恋人峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7815') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '恋人峠' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('恋人峠', '恋人峠-391zah3q', '恋人峠は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         33.994069, 134.140706, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7815', 'ghostmap.jp',
            'community-site',
            '恋人峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 9: 木材団地協同組合近くの公衆電話
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7817') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '木材団地協同組合近くの公衆電話' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('木材団地協同組合近くの公衆電話', '木材団地協同組合近くの公衆電話-338rucgk', '木材団地協同組合近くの公衆電話は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.042989, 134.581704, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7817', 'ghostmap.jp',
            'community-site',
            '木材団地協同組合近くの公衆電話とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 10: 峰白山神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7819') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '峰白山神社' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('峰白山神社', '峰白山神社-y8c7xmtp', '峰白山神社は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.367469, 139.596668, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7819', 'ghostmap.jp',
            'community-site',
            '峰白山神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 11: 童学寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7821') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '童学寺' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('童学寺', '童学寺-yks9jwp4', '童学寺は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.058473, 134.427724, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7821', 'ghostmap.jp',
            'community-site',
            '童学寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 12: 上桜公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7823') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上桜公園' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上桜公園', '上桜公園-iz0xwd5j', '上桜公園は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.052899, 134.327007, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7823', 'ghostmap.jp',
            'community-site',
            '上桜公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 13: オークシティ下の歩道橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7825') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'オークシティ下の歩道橋' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('オークシティ下の歩道橋', 'オークシティ下の歩道橋-se0s9ik4', 'オークシティ下の歩道橋は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.48807, 139.45818, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7825', 'ghostmap.jp',
            'community-site',
            'オークシティ下の歩道橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 14: 花坂のアンダーパス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7827') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花坂のアンダーパス' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花坂のアンダーパス', '花坂のアンダーパス-7s8mj0j2', '花坂のアンダーパスは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.850572, 134.600156, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7827', 'ghostmap.jp',
            'community-site',
            '花坂のアンダーパスとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 15: あせび公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7831') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'あせび公園' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('あせび公園', 'あせび公園-b8na7zzx', 'あせび公園は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.186636, 134.433856, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7831', 'ghostmap.jp',
            'community-site',
            'あせび公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 16: 猫屋敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7833') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猫屋敷' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猫屋敷', '猫屋敷-josful5x', '猫屋敷は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.210972, 132.619077, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7833', 'ghostmap.jp',
            'community-site',
            '猫屋敷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 17: セブンイレ〇ン綾瀬吉〇東店
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7835') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'セブンイレ〇ン綾瀬吉〇東店' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('セブンイレ〇ン綾瀬吉〇東店', 'セブンイレン綾瀬吉東店-67nib284', 'セブンイレ〇ン綾瀬吉〇東店は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.424396, 139.428905, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7835', 'ghostmap.jp',
            'community-site',
            'セブンイレ〇ン綾瀬吉〇東店とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 18: 鳴門山上病院前の高砂海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7839') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳴門山上病院前の高砂海岸' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳴門山上病院前の高砂海岸', '鳴門山上病院前の高砂海岸-73dwf3o8', '鳴門山上病院前の高砂海岸は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.205269, 134.626922, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7839', 'ghostmap.jp',
            'community-site',
            '鳴門山上病院前の高砂海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 19: 鶴岩・亀岩
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7841') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鶴岩・亀岩' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鶴岩・亀岩', '鶴岩・亀岩-aq5e3yv0', '鶴岩・亀岩は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         33.854957, 134.094018, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7841', 'ghostmap.jp',
            'community-site',
            '鶴岩・亀岩とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 20: 碓氷峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7843') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '碓氷峠' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('碓氷峠', '碓氷峠-ovq69rl6', '碓氷峠は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.355352, 138.713914, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7843', 'ghostmap.jp',
            'community-site',
            '碓氷峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 21: 獄門峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7845') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '獄門峠' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('獄門峠', '獄門峠-v7akz5sl', '獄門峠は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.003577, 134.414163, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7845', 'ghostmap.jp',
            'community-site',
            '獄門峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 22: 新田八幡神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7847') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新田八幡神社' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新田八幡神社', '新田八幡神社-w4v2brjo', '新田八幡神社は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.946404, 134.277408, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7847', 'ghostmap.jp',
            'community-site',
            '新田八幡神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 23: 宮山ふるさとふれあい公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7849') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮山ふるさとふれあい公園' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮山ふるさとふれあい公園', '宮山ふるさとふれあい公園-0l6letvv', '宮山ふるさとふれあい公園は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.2581, 140.048374, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7849', 'ghostmap.jp',
            'community-site',
            '宮山ふるさとふれあい公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 24: 乙瀬中田の地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7851') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '乙瀬中田の地蔵' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('乙瀬中田の地蔵', '乙瀬中田の地蔵-6ttvp6bo', '乙瀬中田の地蔵は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.142906, 134.495629, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7851', 'ghostmap.jp',
            'community-site',
            '乙瀬中田の地蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 25: 湘南公園墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7853') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湘南公園墓地' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湘南公園墓地', '湘南公園墓地-27tpq9e0', '湘南公園墓地は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.365623, 139.399703, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7853', 'ghostmap.jp',
            'community-site',
            '湘南公園墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 26: 茅ヶ崎市民の森
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7855') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茅ヶ崎市民の森' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茅ヶ崎市民の森', '茅ヶ崎市民の森-05qmu75l', '茅ヶ崎市民の森は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.363331, 139.432082, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7855', 'ghostmap.jp',
            'community-site',
            '茅ヶ崎市民の森とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 27: 富士見台霊園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7857') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '富士見台霊園' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('富士見台霊園', '富士見台霊園-f727j603', '富士見台霊園は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.754134, 138.002443, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7857', 'ghostmap.jp',
            'community-site',
            '富士見台霊園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 28: 横須賀城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7859') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '横須賀城跡' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('横須賀城跡', '横須賀城跡-vfumebl1', '横須賀城跡は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.685593, 137.971287, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7859', 'ghostmap.jp',
            'community-site',
            '横須賀城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 29: 東山薬師庵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7861') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東山薬師庵' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東山薬師庵', '東山薬師庵-8g8rfll7', '東山薬師庵は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.848, 134.611359, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7861', 'ghostmap.jp',
            'community-site',
            '東山薬師庵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 30: 美馬西部共立火葬場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7863') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美馬西部共立火葬場' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美馬西部共立火葬場', '美馬西部共立火葬場-2q0iux0p', '美馬西部共立火葬場は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.043432, 134.06745, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7863', 'ghostmap.jp',
            'community-site',
            '美馬西部共立火葬場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 31: 博物館　明○村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7865') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '博物館　明○村' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('博物館　明○村', '博物館-明村-6up2877e', '博物館　明○村は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.343065, 136.990894, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7865', 'ghostmap.jp',
            'community-site',
            '博物館　明○村とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 32: 白雪姫と七人の小人
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7867') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '白雪姫と七人の小人' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('白雪姫と七人の小人', '白雪姫と七人の小人-1yugzsks', '白雪姫と七人の小人は、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.054535, 133.826565, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7867', 'ghostmap.jp',
            'community-site',
            '白雪姫と七人の小人とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 33: 豊丘ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7869') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊丘ダム' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊丘ダム', '豊丘ダム-e8lz5z6y', '豊丘ダムは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.62097, 138.377523, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7869', 'ghostmap.jp',
            'community-site',
            '豊丘ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 34: 鎌田山トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7871') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鎌田山トンネル' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鎌田山トンネル', '鎌田山トンネル-ayr921dg', '鎌田山トンネルは、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         36.651487, 138.323703, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7871', 'ghostmap.jp',
            'community-site',
            '鎌田山トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 35: ファッションホテル・パステル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7873') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ファッションホテル・パステル' and prefecture_slug = 'kagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ファッションホテル・パステル', 'ファッションホテル・パステル-8d6inrtu', 'ファッションホテル・パステルは、香川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '香川県', 'kagawa', null,
         34.04289, 133.8302, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7873', 'ghostmap.jp',
            'community-site',
            'ファッションホテル・パステル とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 36: お山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7875') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'お山公園' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('お山公園', 'お山公園-e574x91n', 'お山公園は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.877809, 133.842761, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7875', 'ghostmap.jp',
            'community-site',
            'お山公園とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 37: 剣峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7877') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '剣峠' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('剣峠', '剣峠-vv3x3y4g', '剣峠は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.386938, 136.731377, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7877', 'ghostmap.jp',
            'community-site',
            '剣峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 38: 九文名隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7881') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '九文名隧道' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('九文名隧道', '九文名隧道-qsubkxor', '九文名隧道は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.787905, 134.208106, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7881', 'ghostmap.jp',
            'community-site',
            '九文名隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 39: 水戸市森林公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7883') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水戸市森林公園' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水戸市森林公園', '水戸市森林公園-seyqm405', '水戸市森林公園は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.423251, 140.367422, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7883', 'ghostmap.jp',
            'community-site',
            '水戸市森林公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 40: 弘道館の至善堂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7885') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弘道館の至善堂' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弘道館の至善堂', '弘道館の至善堂-huqwbvlx', '弘道館の至善堂は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.375539, 140.477283, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7885', 'ghostmap.jp',
            'community-site',
            '弘道館の至善堂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 41: 茨城県北相馬郡守谷町野木崎河川敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7887') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茨城県北相馬郡守谷町野木崎河川敷' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茨城県北相馬郡守谷町野木崎河川敷', '茨城県北相馬郡守谷町野木崎河川敷-3gkw8jt6', '茨城県北相馬郡守谷町野木崎河川敷は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.937331, 139.954699, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7887', 'ghostmap.jp',
            'community-site',
            '茨城県北相馬郡守谷町野木崎河川敷とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 42: 玉里駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7889') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '玉里駅' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('玉里駅', '玉里駅-1ar7mq9k', '玉里駅は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.179576, 140.315247, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7889', 'ghostmap.jp',
            'community-site',
            '玉里駅とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 43: 元信一号隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7893') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '元信一号隧道' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('元信一号隧道', '元信一号隧道-lv76zb53', '元信一号隧道は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         33.829975, 134.545021, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7893', 'ghostmap.jp',
            'community-site',
            '元信一号隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 44: 水沼ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7895') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水沼ダム' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水沼ダム', '水沼ダム-qlju471b', '水沼ダムは、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.850237, 140.675819, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7895', 'ghostmap.jp',
            'community-site',
            '水沼ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 45: 花園神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7897') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '花園神社' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('花園神社', '花園神社-sy0mxif6', '花園神社は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.860798, 140.627918, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7897', 'ghostmap.jp',
            'community-site',
            '花園神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 46: 三王山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7899') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三王山' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三王山', '三王山-0b3kwwmg', '三王山は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.576461, 140.257456, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7899', 'ghostmap.jp',
            'community-site',
            '三王山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 47: 岡崎病院跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7901') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岡崎病院跡地' and prefecture_slug = 'ibaraki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岡崎病院跡地', '岡崎病院跡地-j1kss9kc', '岡崎病院跡地は、茨城県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '茨城県', 'ibaraki', null,
         36.594883, 140.320479, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7901', 'ghostmap.jp',
            'community-site',
            '岡崎病院跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 48: 飯地整形外科
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7903') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '飯地整形外科' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('飯地整形外科', '飯地整形外科-kb02cc3w', '飯地整形外科は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.913916, 140.07904, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7903', 'ghostmap.jp',
            'community-site',
            '飯地整形外科とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 49: 行部内公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7905') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '行部内公園' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('行部内公園', '行部内公園-12dowxbx', '行部内公園は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.928988, 140.17882, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7905', 'ghostmap.jp',
            'community-site',
            '行部内公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 50: 龍ヶ崎斎場前の道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7907') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '龍ヶ崎斎場前の道' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('龍ヶ崎斎場前の道', '龍ヶ崎斎場前の道-u6l2qs0s', '龍ヶ崎斎場前の道は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.895223, 140.178327, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7907', 'ghostmap.jp',
            'community-site',
            '龍ヶ崎斎場前の道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 51: 小渕交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7909') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小渕交差点' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小渕交差点', '小渕交差点-tjys8crt', '小渕交差点は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.99176, 139.753036, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7909', 'ghostmap.jp',
            'community-site',
            '小渕交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 52: ホテル・フラミンゴ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7911') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル・フラミンゴ' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル・フラミンゴ', 'ホテル・フラミンゴ-xaehbipx', 'ホテル・フラミンゴは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.077778, 139.494218, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7911', 'ghostmap.jp',
            'community-site',
            'ホテル・フラミンゴとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 53: ホテルサンパルゴ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7913') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルサンパルゴ' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルサンパルゴ', 'ホテルサンパルゴ-jm4jpga3', 'ホテルサンパルゴは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.871117, 139.37943, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7913', 'ghostmap.jp',
            'community-site',
            'ホテルサンパルゴとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 54: 三刀屋城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7915') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三刀屋城跡' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三刀屋城跡', '三刀屋城跡-jc4kj8xx', '三刀屋城跡は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.293463, 132.871614, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7915', 'ghostmap.jp',
            'community-site',
            '三刀屋城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 55: 小手指駅周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7917') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小手指駅周辺' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小手指駅周辺', '小手指駅周辺-ldfhtbv0', '小手指駅周辺は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.800539, 139.438157, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7917', 'ghostmap.jp',
            'community-site',
            '小手指駅周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 56: 津黄漁港
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7919') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '津黄漁港' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('津黄漁港', '津黄漁港-upuz7y90', '津黄漁港は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.418831, 131.067194, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7919', 'ghostmap.jp',
            'community-site',
            '津黄漁港とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 57: 女刑屍体腑分跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7921') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '女刑屍体腑分跡' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('女刑屍体腑分跡', '女刑屍体腑分跡-smcgzotl', '女刑屍体腑分跡は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.37045, 131.411569, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7921', 'ghostmap.jp',
            'community-site',
            '女刑屍体腑分跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 58: 冥加公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7923') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '冥加公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('冥加公園', '冥加公園-bdofw1ol', '冥加公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.525254, 139.731422, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7923', 'ghostmap.jp',
            'community-site',
            '冥加公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 59: 佛坂隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7925') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佛坂隧道' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佛坂隧道', '佛坂隧道-0qb66k7h', '佛坂隧道は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.139552, 131.359983, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7925', 'ghostmap.jp',
            'community-site',
            '佛坂隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 60: 神武さま
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7927') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神武さま' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神武さま', '神武さま-byffyycf', '神武さまは、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         33.913663, 132.094524, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7927', 'ghostmap.jp',
            'community-site',
            '神武さまとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 61: 天燈塚古墳跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7929') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天燈塚古墳跡' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天燈塚古墳跡', '天燈塚古墳跡-uwulskyw', '天燈塚古墳跡は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.342816, 136.940868, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7929', 'ghostmap.jp',
            'community-site',
            '天燈塚古墳跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 62: 浜田火葬場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7933') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浜田火葬場' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浜田火葬場', '浜田火葬場-jqd4k8ii', '浜田火葬場は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.906557, 132.066731, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7933', 'ghostmap.jp',
            'community-site',
            '浜田火葬場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 63: 脱隊諸士招魂の碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7935') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '脱隊諸士招魂の碑' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('脱隊諸士招魂の碑', '脱隊諸士招魂の碑-hxwjyuhh', '脱隊諸士招魂の碑は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.153043, 131.518927, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7935', 'ghostmap.jp',
            'community-site',
            '脱隊諸士招魂の碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 64: 足柄ふれあいの村
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7937') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '足柄ふれあいの村' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('足柄ふれあいの村', '足柄ふれあいの村-2cg80rxp', '足柄ふれあいの村は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.311868, 139.080096, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7937', 'ghostmap.jp',
            'community-site',
            '足柄ふれあいの村とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 65: 青根キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7939') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青根キャンプ場' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青根キャンプ場', '青根キャンプ場-i2r4g95q', '青根キャンプ場は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.548447, 139.137275, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7939', 'ghostmap.jp',
            'community-site',
            '青根キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 66: 大垂水峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7941') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大垂水峠' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大垂水峠', '大垂水峠-gyxb1rh0', '大垂水峠は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.620418, 139.227572, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7941', 'ghostmap.jp',
            'community-site',
            '大垂水峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 67: いずみ中央駅女子トイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7943') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'いずみ中央駅女子トイレ' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('いずみ中央駅女子トイレ', 'いずみ中央駅女子トイレ-qcmha7vg', 'いずみ中央駅女子トイレは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.415193, 139.487248, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7943', 'ghostmap.jp',
            'community-site',
            'いずみ中央駅女子トイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 68: 湯田温泉駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7945') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '湯田温泉駅' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('湯田温泉駅', '湯田温泉駅-bcib1koe', '湯田温泉駅は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.160045, 131.460574, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7945', 'ghostmap.jp',
            'community-site',
            '湯田温泉駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 69: 旧相首町屋敷刑場不浄の門
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7947') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧相首町屋敷刑場不浄の門' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧相首町屋敷刑場不浄の門', '旧相首町屋敷刑場不浄の門-ms2fz2wg', '旧相首町屋敷刑場不浄の門は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.413202, 131.395678, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7947', 'ghostmap.jp',
            'community-site',
            '旧相首町屋敷刑場不浄の門とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 70: テスラハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7949') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'テスラハウス' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('テスラハウス', 'テスラハウス-cthhp7de', 'テスラハウスは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         34.904664, 139.875486, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7949', 'ghostmap.jp',
            'community-site',
            'テスラハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 71: 旧草内トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7951') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧草内トンネル' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧草内トンネル', '旧草内トンネル-liqtjm2l', '旧草内トンネルは、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         43.31881, 140.360205, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7951', 'ghostmap.jp',
            'community-site',
            '旧草内トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 72: 秋穂の忠魂碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7953') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋穂の忠魂碑' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋穂の忠魂碑', '秋穂の忠魂碑-ifvxh18m', '秋穂の忠魂碑は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.016546, 131.438895, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7953', 'ghostmap.jp',
            'community-site',
            '秋穂の忠魂碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 73: 池のほとりキャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7955') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '池のほとりキャンプ場' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('池のほとりキャンプ場', '池のほとりキャンプ場-f8fijsfd', '池のほとりキャンプ場は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.010323, 139.939674, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7955', 'ghostmap.jp',
            'community-site',
            '池のほとりキャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 74: 四辻駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7961') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '四辻駅' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('四辻駅', '四辻駅-0ldltz1w', '四辻駅は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.079982, 131.447882, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7961', 'ghostmap.jp',
            'community-site',
            '四辻駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 75: 秋吉台ユースビレッジ（秋吉台ユースホステル）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7965') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋吉台ユースビレッジ（秋吉台ユースホステル）' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋吉台ユースビレッジ（秋吉台ユースホステル）', '秋吉台ユースビレッジ秋吉台ユースホステル-4h9jmaot', '秋吉台ユースビレッジ（秋吉台ユースホステル）は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.231437, 131.301901, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7965', 'ghostmap.jp',
            'community-site',
            '秋吉台ユースビレッジ（秋吉台ユースホステル）とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 76: 防府第三トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7967') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '防府第三トンネル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('防府第三トンネル', '防府第三トンネル-2kuxcbmo', '防府第三トンネルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.071331, 131.592003, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7967', 'ghostmap.jp',
            'community-site',
            '防府第三トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 77: 総合交通センター
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7969') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '総合交通センター' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('総合交通センター', '総合交通センター-a9gqif1e', '総合交通センターは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.083037, 131.398147, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7969', 'ghostmap.jp',
            'community-site',
            '総合交通センターとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 78: 菊水町ポケットパーク
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7971') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '菊水町ポケットパーク' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('菊水町ポケットパーク', '菊水町ポケットパーク-7s7oa4s4', '菊水町ポケットパークは、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.435543, 136.674643, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7971', 'ghostmap.jp',
            'community-site',
            '菊水町ポケットパークとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 79: 仁保斎場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7973') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '仁保斎場' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('仁保斎場', '仁保斎場-h5iynt3g', '仁保斎場は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.19977, 131.552439, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7973', 'ghostmap.jp',
            'community-site',
            '仁保斎場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 80: 笠戸大橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7975') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '笠戸大橋' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('笠戸大橋', '笠戸大橋-althbiti', '笠戸大橋は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.9881, 131.860399, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7975', 'ghostmap.jp',
            'community-site',
            '笠戸大橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 81: 交通安全観世音菩薩
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7977') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '交通安全観世音菩薩' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('交通安全観世音菩薩', '交通安全観世音菩薩-njpf16vy', '交通安全観世音菩薩は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.111045, 131.035588, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7977', 'ghostmap.jp',
            'community-site',
            '交通安全観世音菩薩とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 82: 中華そば◌久岬店
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7979') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中華そば◌久岬店' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中華そば◌久岬店', '中華そば久岬店-b559al2r', '中華そば◌久岬店は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.936422, 131.254761, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7979', 'ghostmap.jp',
            'community-site',
            '中華そば◌久岬店とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 83: 萩キリシタン殉教者記念公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7981') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '萩キリシタン殉教者記念公園' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('萩キリシタン殉教者記念公園', '萩キリシタン殉教者記念公園-8zg45ssz', '萩キリシタン殉教者記念公園は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.41368, 131.379852, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7981', 'ghostmap.jp',
            'community-site',
            '萩キリシタン殉教者記念公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 84: パチンコTOMATO跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7983') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'パチンコTOMATO跡' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('パチンコTOMATO跡', 'パチンコtomato跡-q78x4ovp', 'パチンコTOMATO跡は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.012937, 131.163736, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7983', 'ghostmap.jp',
            'community-site',
            'パチンコTOMATO跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 85: 若山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7985') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '若山公園' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('若山公園', '若山公園-kck1ey74', '若山公園は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.977789, 131.182801, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7985', 'ghostmap.jp',
            'community-site',
            '若山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 86: 片尾畑　長友交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7987') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '片尾畑　長友交差点' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('片尾畑　長友交差点', '片尾畑-長友交差点-h9z40s34', '片尾畑　長友交差点は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.057141, 131.135554, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7987', 'ghostmap.jp',
            'community-site',
            '片尾畑　長友交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 87: 伊藤○ビル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7989') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伊藤○ビル' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伊藤○ビル', '伊藤ビル-qbxf2s4m', '伊藤○ビルは、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.00749, 131.184754, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7989', 'ghostmap.jp',
            'community-site',
            '伊藤○ビルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 88: ボートレース下関　（下関競艇場）
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7991') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ボートレース下関　（下関競艇場）' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ボートレース下関　（下関競艇場）', 'ボートレース下関-下関競艇場-6txf2hf4', 'ボートレース下関　（下関競艇場）は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.019088, 131.004066, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7991', 'ghostmap.jp',
            'community-site',
            'ボートレース下関　（下関競艇場）とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 89: 壬生寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7993') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '壬生寺' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('壬生寺', '壬生寺-rt589hsf', '壬生寺は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.001676, 135.74338, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7993', 'ghostmap.jp',
            'community-site',
            '壬生寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 90: 明智藪
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7997') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '明智藪' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('明智藪', '明智藪-4pxfyfac', '明智藪は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.947469, 135.802259, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7997', 'ghostmap.jp',
            'community-site',
            '明智藪とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 91: 牧石小学校前交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=7999') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牧石小学校前交差点' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牧石小学校前交差点', '牧石小学校前交差点-reoxi8pn', '牧石小学校前交差点は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.714836, 133.951986, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=7999', 'ghostmap.jp',
            'community-site',
            '牧石小学校前交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 92: 安岡海水浴場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8001') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '安岡海水浴場' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('安岡海水浴場', '安岡海水浴場-7my026qd', '安岡海水浴場は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.022467, 130.915253, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8001', 'ghostmap.jp',
            'community-site',
            '安岡海水浴場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 93: 茶屋池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8003') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '茶屋池' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('茶屋池', '茶屋池-gatxhrye', '茶屋池は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         34.070634, 131.028106, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8003', 'ghostmap.jp',
            'community-site',
            '茶屋池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 94: 不動が嶽古戦場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8005') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '不動が嶽古戦場' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('不動が嶽古戦場', '不動が嶽古戦場-r892d54k', '不動が嶽古戦場は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.189702, 133.388221, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8005', 'ghostmap.jp',
            'community-site',
            '不動が嶽古戦場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 95: ベルビュー富士ホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8011') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ベルビュー富士ホテル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ベルビュー富士ホテル', 'ベルビュー富士ホテル-rahbep0b', 'ベルビュー富士ホテルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.257093, 138.968414, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8011', 'ghostmap.jp',
            'community-site',
            'ベルビュー富士ホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 96: 御殿場ビル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8013') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御殿場ビル' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御殿場ビル', '御殿場ビル-gnvtrcgq', '御殿場ビルは、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.293969, 138.948647, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8013', 'ghostmap.jp',
            'community-site',
            '御殿場ビルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 97: ホテルサンクルー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8015') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルサンクルー' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルサンクルー', 'ホテルサンクルー-8br0v6en', 'ホテルサンクルーは、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         35.022829, 139.037394, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8015', 'ghostmap.jp',
            'community-site',
            'ホテルサンクルーとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 98: 美萩野西山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8017') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '美萩野西山公園' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('美萩野西山公園', '美萩野西山公園-yij4scjy', '美萩野西山公園は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.519644, 134.14341, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8017', 'ghostmap.jp',
            'community-site',
            '美萩野西山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 99: ミステリースクエアー
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8021') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ミステリースクエアー' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ミステリースクエアー', 'ミステリースクエアー-ij6qpgi4', 'ミステリースクエアーは、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.303638, 133.332031, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8021', 'ghostmap.jp',
            'community-site',
            'ミステリースクエアーとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 100: 山伏隧道(旧山伏トンネル)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8023') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山伏隧道(旧山伏トンネル)' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山伏隧道(旧山伏トンネル)', '山伏隧道旧山伏トンネル-4rcx5cee', '山伏隧道(旧山伏トンネル)は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.451844, 138.931661, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8023', 'ghostmap.jp',
            'community-site',
            '山伏隧道(旧山伏トンネル)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 101: 竹やぶ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8025') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '竹やぶ' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('竹やぶ', '竹やぶ-hav3fdpy', '竹やぶは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.644539, 139.440197, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8025', 'ghostmap.jp',
            'community-site',
            '竹やぶとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 102: 用瀬第一トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8027') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '用瀬第一トンネル' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('用瀬第一トンネル', '用瀬第一トンネル-yjjg1zbx', '用瀬第一トンネルは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.305559, 134.193362, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8027', 'ghostmap.jp',
            'community-site',
            '用瀬第一トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 103: 赤石浜海水浴場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8029') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤石浜海水浴場' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤石浜海水浴場', '赤石浜海水浴場-fkconoq6', '赤石浜海水浴場は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.18798, 139.899306, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8029', 'ghostmap.jp',
            'community-site',
            '赤石浜海水浴場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 104: 米子環状線のカーブ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8033') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '米子環状線のカーブ' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('米子環状線のカーブ', '米子環状線のカーブ-qixjvrd4', '米子環状線のカーブは、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.447696, 133.369229, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8033', 'ghostmap.jp',
            'community-site',
            '米子環状線のカーブとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 105: モーテル高舘
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8035') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'モーテル高舘' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('モーテル高舘', 'モーテル高舘-hcqq4wb3', 'モーテル高舘は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.546192, 141.444114, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8035', 'ghostmap.jp',
            'community-site',
            'モーテル高舘とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 106: 伯耆大山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8039') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伯耆大山' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伯耆大山', '伯耆大山-dsfyzu02', '伯耆大山は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.373672, 133.55147, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8039', 'ghostmap.jp',
            'community-site',
            '伯耆大山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 107: 長尾鼻
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8041') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長尾鼻' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長尾鼻', '長尾鼻-zvbijeez', '長尾鼻は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.537622, 134.007797, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8041', 'ghostmap.jp',
            'community-site',
            '長尾鼻とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 108: 国府の用水路
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8043') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '国府の用水路' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('国府の用水路', '国府の用水路-lbc6g56z', '国府の用水路は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.439664, 133.769803, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8043', 'ghostmap.jp',
            'community-site',
            '国府の用水路とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 109: 中井隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8045') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中井隧道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中井隧道', '中井隧道-iunyt7jd', '中井隧道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.336381, 139.22103, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8045', 'ghostmap.jp',
            'community-site',
            '中井隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 110: 袋倉ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8047') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '袋倉ダム' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('袋倉ダム', '袋倉ダム-fhhklg6t', '袋倉ダムは、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.142547, 140.129499, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8047', 'ghostmap.jp',
            'community-site',
            '袋倉ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 111: 郡家の六地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8049') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '郡家の六地蔵' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('郡家の六地蔵', '郡家の六地蔵-jqvw783s', '郡家の六地蔵は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.408172, 134.256068, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8049', 'ghostmap.jp',
            'community-site',
            '郡家の六地蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 112: 木料海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8051') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '木料海岸' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('木料海岸', '木料海岸-vy4jdfds', '木料海岸は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.51922, 133.529505, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8051', 'ghostmap.jp',
            'community-site',
            '木料海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 113: 大山口列車空襲　慰霊の碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8055') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大山口列車空襲　慰霊の碑' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大山口列車空襲　慰霊の碑', '大山口列車空襲-慰霊の碑-nrasrsvc', '大山口列車空襲　慰霊の碑は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.484261, 133.456142, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8055', 'ghostmap.jp',
            'community-site',
            '大山口列車空襲　慰霊の碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 114: 鶴ヶ城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8059') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鶴ヶ城' and prefecture_slug = 'fukushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鶴ヶ城', '鶴ヶ城-67wvdq6m', '鶴ヶ城は、福島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福島県', 'fukushima', null,
         37.487833, 139.929643, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8059', 'ghostmap.jp',
            'community-site',
            '鶴ヶ城とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 115: 洗川橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8061') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '洗川橋' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('洗川橋', '洗川橋-rmhfil6t', '洗川橋は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.485034, 133.688081, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8061', 'ghostmap.jp',
            'community-site',
            '洗川橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 116: 朽ちた学童看板
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8065') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '朽ちた学童看板' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('朽ちた学童看板', '朽ちた学童看板-npb9d1b0', '朽ちた学童看板は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.600722, 134.347537, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8065', 'ghostmap.jp',
            'community-site',
            '朽ちた学童看板とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 117: 元谷避難小屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8067') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '元谷避難小屋' and prefecture_slug = 'shimane' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('元谷避難小屋', '元谷避難小屋-i2tob9rz', '元谷避難小屋は、島根県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '島根県', 'shimane', null,
         35.380977, 133.540949, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8067', 'ghostmap.jp',
            'community-site',
            '元谷避難小屋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 118: 網干駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8071') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '網干駅' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('網干駅', '網干駅-0o777imp', '網干駅は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.814212, 134.584359, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8071', 'ghostmap.jp',
            'community-site',
            '網干駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 119: 早池峰山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8075') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '早池峰山' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('早池峰山', '早池峰山-hi3lmn8h', '早池峰山は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.558589, 141.4888, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8075', 'ghostmap.jp',
            'community-site',
            '早池峰山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 120: 永瀬ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8077') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '永瀬ダム' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('永瀬ダム', '永瀬ダム-muftjy19', '永瀬ダムは、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.705563, 133.865147, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8077', 'ghostmap.jp',
            'community-site',
            '永瀬ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 121: 歌舞伎町
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8079') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '歌舞伎町' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('歌舞伎町', '歌舞伎町-dw3q5v9e', '歌舞伎町は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.696087, 139.702685, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8079', 'ghostmap.jp',
            'community-site',
            '歌舞伎町とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 122: Ｂ＆Ｇ海洋センター駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8081') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'Ｂ＆Ｇ海洋センター駐車場' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('Ｂ＆Ｇ海洋センター駐車場', 'bg海洋センター駐車場-0mwrfwb0', 'Ｂ＆Ｇ海洋センター駐車場は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.410865, 137.038441, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8081', 'ghostmap.jp',
            'community-site',
            'Ｂ＆Ｇ海洋センター駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 123: 若杉の白い家跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8083') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '若杉の白い家跡地' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('若杉の白い家跡地', '若杉の白い家跡地-vfgftrso', '若杉の白い家跡地は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.063931, 136.189413, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8083', 'ghostmap.jp',
            'community-site',
            '若杉の白い家跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 124: 鳥取大火災平和塔
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8085') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥取大火災平和塔' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥取大火災平和塔', '鳥取大火災平和塔-iver6p0y', '鳥取大火災平和塔は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.514054, 134.234701, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8085', 'ghostmap.jp',
            'community-site',
            '鳥取大火災平和塔とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 125: 樗谿公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8087') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '樗谿公園' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('樗谿公園', '樗谿公園-m15k4ppp', '樗谿公園は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.498441, 134.241978, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8087', 'ghostmap.jp',
            'community-site',
            '樗谿公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 126: 立川稲荷神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8089') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立川稲荷神社' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立川稲荷神社', '立川稲荷神社-i9nsn5ka', '立川稲荷神社は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.492717, 134.247833, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8089', 'ghostmap.jp',
            'community-site',
            '立川稲荷神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 127: 矢矯神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8091') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '矢矯神社' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('矢矯神社', '矢矯神社-n6idz14e', '矢矯神社は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.450567, 134.099422, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8091', 'ghostmap.jp',
            'community-site',
            '矢矯神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 128: 島氏永駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8093') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '島氏永駅' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('島氏永駅', '島氏永駅-heuvdb17', '島氏永駅は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.271352, 136.800934, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8093', 'ghostmap.jp',
            'community-site',
            '島氏永駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 129: 鳥取砂丘細川線
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8095') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鳥取砂丘細川線' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鳥取砂丘細川線', '鳥取砂丘細川線-9yv97tcw', '鳥取砂丘細川線は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.554807, 134.262707, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8095', 'ghostmap.jp',
            'community-site',
            '鳥取砂丘細川線とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 130: 三之宮峡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8099') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三之宮峡' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三之宮峡', '三之宮峡-ej2a2fyv', '三之宮峡は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.026997, 130.998466, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8099', 'ghostmap.jp',
            'community-site',
            '三之宮峡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 131: 松原ダム及び下筌ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8101') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '松原ダム及び下筌ダム' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('松原ダム及び下筌ダム', '松原ダム及び下筌ダム-a3uwqq8m', '松原ダム及び下筌ダムは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         33.160008, 130.984111, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8101', 'ghostmap.jp',
            'community-site',
            '松原ダム及び下筌ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 132: トロントロン
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8103') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'トロントロン' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('トロントロン', 'トロントロン-f320uyfj', 'トロントロンは、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.196034, 131.527945, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8103', 'ghostmap.jp',
            'community-site',
            'トロントロンとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 133: 姥捨山城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8105') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '姥捨山城跡' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('姥捨山城跡', '姥捨山城跡-w6kshcty', '姥捨山城跡は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         37.028201, 139.730355, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8105', 'ghostmap.jp',
            'community-site',
            '姥捨山城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 134: 都城歴史資料館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8111') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '都城歴史資料館' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('都城歴史資料館', '都城歴史資料館-67nbn1vc', '都城歴史資料館は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.716157, 131.05056, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8111', 'ghostmap.jp',
            'community-site',
            '都城歴史資料館とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 135: 愛川トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8113') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '愛川トンネル' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('愛川トンネル', '愛川トンネル-3rg85mpv', '愛川トンネルは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.53429, 139.282987, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8113', 'ghostmap.jp',
            'community-site',
            '愛川トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 136: 黒田の家臣
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8115') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒田の家臣' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒田の家臣', '黒田の家臣-j4jit71a', '黒田の家臣は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.424692, 131.680562, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8115', 'ghostmap.jp',
            'community-site',
            '黒田の家臣とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 137: トヅラ峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8117') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'トヅラ峠' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('トヅラ峠', 'トヅラ峠-uk4my5bp', 'トヅラ峠は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.552775, 139.211906, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8117', 'ghostmap.jp',
            'community-site',
            'トヅラ峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 138: 豊浜トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8119') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '豊浜トンネル' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('豊浜トンネル', '豊浜トンネル-319vkzvh', '豊浜トンネルは、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         42.055196, 140.075362, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8119', 'ghostmap.jp',
            'community-site',
            '豊浜トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 139: 文化ストリート
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8121') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '文化ストリート' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('文化ストリート', '文化ストリート-6tv5dvel', '文化ストリートは、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.914931, 131.423287, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8121', 'ghostmap.jp',
            'community-site',
            '文化ストリートとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 140: 山仮屋隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8123') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山仮屋隧道' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山仮屋隧道', '山仮屋隧道-5qlsm0uq', '山仮屋隧道は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.76273, 131.361378, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8123', 'ghostmap.jp',
            'community-site',
            '山仮屋隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 141: 宮崎特攻基地慰霊碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8125') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮崎特攻基地慰霊碑' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮崎特攻基地慰霊碑', '宮崎特攻基地慰霊碑-qtkebr64', '宮崎特攻基地慰霊碑は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.87356, 131.432925, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8125', 'ghostmap.jp',
            'community-site',
            '宮崎特攻基地慰霊碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 142: 旧藻油沼塔跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8127') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧藻油沼塔跡' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧藻油沼塔跡', '旧藻油沼塔跡-qmstxue7', '旧藻油沼塔跡は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.700276, 141.972166, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8127', 'ghostmap.jp',
            'community-site',
            '旧藻油沼塔跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 143: 小浦船津海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8129') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小浦船津海岸' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小浦船津海岸', '小浦船津海岸-kaqs2bd8', '小浦船津海岸は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.746026, 129.82326, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8129', 'ghostmap.jp',
            'community-site',
            '小浦船津海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 144: 小森谷隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8133') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小森谷隧道' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小森谷隧道', '小森谷隧道-munfsygr', '小森谷隧道は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.582236, 136.844848, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8133', 'ghostmap.jp',
            'community-site',
            '小森谷隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 145: 川南のゆうれい坂
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8137') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川南のゆうれい坂' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川南のゆうれい坂', '川南のゆうれい坂-o72dl2u5', '川南のゆうれい坂は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         32.215005, 131.537044, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8137', 'ghostmap.jp',
            'community-site',
            '川南のゆうれい坂とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 146: 青井岳キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8139') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青井岳キャンプ場' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青井岳キャンプ場', '青井岳キャンプ場-fig4kohs', '青井岳キャンプ場は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.835756, 131.22891, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8139', 'ghostmap.jp',
            'community-site',
            '青井岳キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 147: 小幌駅付近
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8141') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '小幌駅付近' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('小幌駅付近', '小幌駅付近-40einhj9', '小幌駅付近は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.590636, 140.537306, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8141', 'ghostmap.jp',
            'community-site',
            '小幌駅付近とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 148: 本蓮寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8143') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本蓮寺' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本蓮寺', '本蓮寺-908az60k', '本蓮寺は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         32.754213, 129.873636, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8143', 'ghostmap.jp',
            'community-site',
            '本蓮寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 149: 健康増進センター　アピス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8149') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '健康増進センター　アピス' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('健康増進センター　アピス', '健康増進センター-アピス-egg3zxz9', '健康増進センター　アピスは、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.757117, 130.733178, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8149', 'ghostmap.jp',
            'community-site',
            '健康増進センター　アピスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 150: 東第113号踏切道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8151') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東第113号踏切道' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東第113号踏切道', '東第113号踏切道-5gamxi52', '東第113号踏切道は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.85182, 139.531129, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8151', 'ghostmap.jp',
            'community-site',
            '東第113号踏切道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 151: 岩屋(首なし)観音
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8153') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岩屋(首なし)観音' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岩屋(首なし)観音', '岩屋首なし観音-6569s3wr', '岩屋(首なし)観音は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.586013, 140.540886, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8153', 'ghostmap.jp',
            'community-site',
            '岩屋(首なし)観音とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 152: 大バエ灯台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8157') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大バエ灯台' and prefecture_slug = 'nagasaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大バエ灯台', '大バエ灯台-0gsmk74p', '大バエ灯台は、長崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長崎県', 'nagasaki', null,
         33.439795, 129.430565, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8157', 'ghostmap.jp',
            'community-site',
            '大バエ灯台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 153: 三反田踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8159') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三反田踏切' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三反田踏切', '三反田踏切-p6scecoy', '三反田踏切は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.73605, 135.409467, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8159', 'ghostmap.jp',
            'community-site',
            '三反田踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 154: 武蔵野橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8161') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武蔵野橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武蔵野橋', '武蔵野橋-km9clxop', '武蔵野橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.723172, 139.342126, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8161', 'ghostmap.jp',
            'community-site',
            '武蔵野橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 155: 神明社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8167') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '神明社' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('神明社', '神明社-1ageqjvv', '神明社は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.855304, 137.476408, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8167', 'ghostmap.jp',
            'community-site',
            '神明社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 156: 大谷ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8169') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大谷ダム' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大谷ダム', '大谷ダム-01ywsu2a', '大谷ダムは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.855999, 137.486343, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8169', 'ghostmap.jp',
            'community-site',
            '大谷ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 157: 新黒部駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8171') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新黒部駅' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新黒部駅', '新黒部駅-y2ck6od6', '新黒部駅は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.87301, 137.480662, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8171', 'ghostmap.jp',
            'community-site',
            '新黒部駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 158: 若栗城跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8179') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '若栗城跡' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('若栗城跡', '若栗城跡-3r6ks5ya', '若栗城跡は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.877433, 137.489588, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8179', 'ghostmap.jp',
            'community-site',
            '若栗城跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 159: 嘉例沢キャンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8181') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '嘉例沢キャンプ場' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('嘉例沢キャンプ場', '嘉例沢キャンプ場-evrmnb9y', '嘉例沢キャンプ場は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.82581, 137.547069, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8181', 'ghostmap.jp',
            'community-site',
            '嘉例沢キャンプ場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 160: 若栗魔の踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8183') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '若栗魔の踏切' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('若栗魔の踏切', '若栗魔の踏切-3jbb6jkm', '若栗魔の踏切は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.871368, 137.4975, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8183', 'ghostmap.jp',
            'community-site',
            '若栗魔の踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 161: 黒部魔のカーブ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8187') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '黒部魔のカーブ' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('黒部魔のカーブ', '黒部魔のカーブ-sh5cu1yd', '黒部魔のカーブは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.85615, 137.51125, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8187', 'ghostmap.jp',
            'community-site',
            '黒部魔のカーブとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 162: 阿古屋野トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8189') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '阿古屋野トンネル' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('阿古屋野トンネル', '阿古屋野トンネル-hmec958i', '阿古屋野トンネルは、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.846478, 137.457211, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8189', 'ghostmap.jp',
            'community-site',
            '阿古屋野トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 163: 日吉神社前の道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8195') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '日吉神社前の道' and prefecture_slug = 'toyama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('日吉神社前の道', '日吉神社前の道-ljm86eq1', '日吉神社前の道は、富山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '富山県', 'toyama', null,
         36.879386, 137.484042, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8195', 'ghostmap.jp',
            'community-site',
            '日吉神社前の道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 164: 瀬崎角田公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8197') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '瀬崎角田公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('瀬崎角田公園', '瀬崎角田公園-7wcc7cdb', '瀬崎角田公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.810006, 139.80743, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8197', 'ghostmap.jp',
            'community-site',
            '瀬崎角田公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 165: 玉泉院森会館
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8201') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '玉泉院森会館' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('玉泉院森会館', '玉泉院森会館-swy8h077', '玉泉院森会館は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.215982, 131.675584, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8201', 'ghostmap.jp',
            'community-site',
            '玉泉院森会館とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 166: 大道トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8203') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大道トンネル' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大道トンネル', '大道トンネル-xhjcl8jz', '大道トンネルは、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.219485, 131.594882, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8203', 'ghostmap.jp',
            'community-site',
            '大道トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 167: 正圓寺の未成廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8205') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '正圓寺の未成廃墟' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('正圓寺の未成廃墟', '正圓寺の未成廃墟-vul25asf', '正圓寺の未成廃墟は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.634995, 135.503584, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8205', 'ghostmap.jp',
            'community-site',
            '正圓寺の未成廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 168: ジャングル公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8209') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ジャングル公園' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ジャングル公園', 'ジャングル公園-9w96t0vv', 'ジャングル公園は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.2405, 131.604495, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8209', 'ghostmap.jp',
            'community-site',
            'ジャングル公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 169: 木戸ダム周辺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8211') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '木戸ダム周辺' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('木戸ダム周辺', '木戸ダム周辺-ada8fbxh', '木戸ダム周辺は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.005464, 134.681396, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8211', 'ghostmap.jp',
            'community-site',
            '木戸ダム周辺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 170: 垂水公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8213') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '垂水公園' and prefecture_slug = 'miyazaki' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('垂水公園', '垂水公園-0877ebfu', '垂水公園は、宮崎県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '宮崎県', 'miyazaki', null,
         31.990461, 131.405067, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8213', 'ghostmap.jp',
            'community-site',
            '垂水公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 171: 中塚トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8217') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '中塚トンネル' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('中塚トンネル', '中塚トンネル-vz2xpaji', '中塚トンネルは、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.314406, 131.111807, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8217', 'ghostmap.jp',
            'community-site',
            '中塚トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 172: おにぎり山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8219') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おにぎり山' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おにぎり山', 'おにぎり山-swx2dkrc', 'おにぎり山は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.123823, 131.203666, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8219', 'ghostmap.jp',
            'community-site',
            'おにぎり山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 173: 旧滝瀬隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8223') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧滝瀬隧道' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧滝瀬隧道', '旧滝瀬隧道-5qgke5vq', '旧滝瀬隧道は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.267585, 131.077969, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8223', 'ghostmap.jp',
            'community-site',
            '旧滝瀬隧道とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 174: 上江橋下の中洲
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8227') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '上江橋下の中洲' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('上江橋下の中洲', '上江橋下の中洲-xrqew0g4', '上江橋下の中洲は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.914104, 139.543174, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8227', 'ghostmap.jp',
            'community-site',
            '上江橋下の中洲とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 175: 鍋山の湯
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8229') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鍋山の湯' and prefecture_slug = 'oita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鍋山の湯', '鍋山の湯-j46kt6cm', '鍋山の湯は、大分県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大分県', 'oita', null,
         33.315055, 131.44073, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8229', 'ghostmap.jp',
            'community-site',
            '鍋山の湯とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 176: 安濃川河口
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8233') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '安濃川河口' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('安濃川河口', '安濃川河口-mgs8eju8', '安濃川河口は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.730117, 136.528134, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8233', 'ghostmap.jp',
            'community-site',
            '安濃川河口とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 177: 多摩橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8235') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '多摩橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('多摩橋', '多摩橋-5r33qpjc', '多摩橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.732942, 139.321755, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8235', 'ghostmap.jp',
            'community-site',
            '多摩橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 178: 嘉円公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8237') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '嘉円公園' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('嘉円公園', '嘉円公園-zqy4tq75', '嘉円公園は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.787831, 135.563105, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8237', 'ghostmap.jp',
            'community-site',
            '嘉円公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 179: 明照寺地下道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8243') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '明照寺地下道' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('明照寺地下道', '明照寺地下道-2xwb5825', '明照寺地下道は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.895543, 139.719006, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8243', 'ghostmap.jp',
            'community-site',
            '明照寺地下道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 180: 三重県警
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8247') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三重県警' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三重県警', '三重県警-4g70ybw4', '三重県警は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.72633, 136.508458, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8247', 'ghostmap.jp',
            'community-site',
            '三重県警とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 181: 粟加の一本松跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8249') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '粟加の一本松跡' and prefecture_slug = 'mie' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('粟加の一本松跡', '粟加の一本松跡-decpqgke', '粟加の一本松跡は、三重県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '三重県', 'mie', null,
         34.778023, 136.444156, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8249', 'ghostmap.jp',
            'community-site',
            '粟加の一本松跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 182: おためし場腑分けの跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8253') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'おためし場腑分けの跡' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('おためし場腑分けの跡', 'おためし場腑分けの跡-c5kkttpv', 'おためし場腑分けの跡は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.152482, 136.903142, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8253', 'ghostmap.jp',
            'community-site',
            'おためし場腑分けの跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 183: 猿喰海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8255') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猿喰海岸' and prefecture_slug = 'yamaguchi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猿喰海岸', '猿喰海岸-w2bk37ji', '猿喰海岸は、山口県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山口県', 'yamaguchi', null,
         33.897785, 130.988351, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8255', 'ghostmap.jp',
            'community-site',
            '猿喰海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 184: 文化記念プール
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8257') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '文化記念プール' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('文化記念プール', '文化記念プール-uyxstnyl', '文化記念プールは、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.820132, 130.927559, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8257', 'ghostmap.jp',
            'community-site',
            '文化記念プールとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 185: 禁足地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8259') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '禁足地' and prefecture_slug = 'kagoshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('禁足地', '禁足地-h3wxy9jn', '禁足地は、鹿児島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鹿児島県', 'kagoshima', null,
         31.681518, 130.582128, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8259', 'ghostmap.jp',
            'community-site',
            '禁足地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 186: 西新町公園と聖アンデレ橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8261') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西新町公園と聖アンデレ橋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西新町公園と聖アンデレ橋', '西新町公園と聖アンデレ橋-sqikv40o', '西新町公園と聖アンデレ橋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.510112, 135.544075, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8261', 'ghostmap.jp',
            'community-site',
            '西新町公園と聖アンデレ橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 187: 秋留橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8265') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '秋留橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('秋留橋', '秋留橋-kkvozvzb', '秋留橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.716067, 139.284079, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8265', 'ghostmap.jp',
            'community-site',
            '秋留橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 188: 荒川鉱山跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8267') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '荒川鉱山跡' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('荒川鉱山跡', '荒川鉱山跡-keafw72z', '荒川鉱山跡は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         39.640772, 140.421116, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8267', 'ghostmap.jp',
            'community-site',
            '荒川鉱山跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 189: 高町池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8271') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高町池' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高町池', '高町池-ukv9xwax', '高町池は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.797154, 135.51986, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8271', 'ghostmap.jp',
            'community-site',
            '高町池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 190: 廃コバルト鉱山跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8277') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '廃コバルト鉱山跡' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('廃コバルト鉱山跡', '廃コバルト鉱山跡-7ozbyy1p', '廃コバルト鉱山跡は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         35.796652, 129.216428, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8277', 'ghostmap.jp',
            'community-site',
            '廃コバルト鉱山跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 191: 新倉惨殺屋敷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8285') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '新倉惨殺屋敷' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('新倉惨殺屋敷', '新倉惨殺屋敷-f9g48up1', '新倉惨殺屋敷は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.485755, 138.330924, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8285', 'ghostmap.jp',
            'community-site',
            '新倉惨殺屋敷とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 192: 弁天町駅前第一地下道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8289') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弁天町駅前第一地下道' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弁天町駅前第一地下道', '弁天町駅前第一地下道-t0177iml', '弁天町駅前第一地下道は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.667905, 135.462525, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8289', 'ghostmap.jp',
            'community-site',
            '弁天町駅前第一地下道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 193: 諭鶴羽ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8293') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諭鶴羽ダム' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諭鶴羽ダム', '諭鶴羽ダム-4oagkwfw', '諭鶴羽ダムは、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.249803, 134.797504, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8293', 'ghostmap.jp',
            'community-site',
            '諭鶴羽ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 194: ホテルMt Takao
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8303') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルMt Takao' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルMt Takao', 'ホテルmt-takao-p60q1ah7', 'ホテルMt Takaoは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.615649, 139.243516, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8303', 'ghostmap.jp',
            'community-site',
            'ホテルMt Takaoとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 195: 滝隧道(滝トンネル)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8305') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '滝隧道(滝トンネル)' and prefecture_slug = 'fukui' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('滝隧道(滝トンネル)', '滝隧道滝トンネル-hcl0r4v1', '滝隧道(滝トンネル)は、福井県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福井県', 'fukui', null,
         36.235821, 136.271174, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8305', 'ghostmap.jp',
            'community-site',
            '滝隧道(滝トンネル)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 196: 水無瀬の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8307') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水無瀬の滝' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水無瀬の滝', '水無瀬の滝-06hmfxyw', '水無瀬の滝は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.89364, 135.667548, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8307', 'ghostmap.jp',
            'community-site',
            '水無瀬の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 197: 沖縄アリーナ立体駐車場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8309') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '沖縄アリーナ立体駐車場' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('沖縄アリーナ立体駐車場', '沖縄アリーナ立体駐車場-ji4ob7a9', '沖縄アリーナ立体駐車場は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.331622, 127.787213, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8309', 'ghostmap.jp',
            'community-site',
            '沖縄アリーナ立体駐車場とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 198: 宮浜踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8311') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '宮浜踏切' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('宮浜踏切', '宮浜踏切-9okovsy3', '宮浜踏切は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.964965, 139.643513, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8311', 'ghostmap.jp',
            'community-site',
            '宮浜踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 199: 伊第112号踏切(東武スカイツリーライン魔の踏切)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8315') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '伊第112号踏切(東武スカイツリーライン魔の踏切)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('伊第112号踏切(東武スカイツリーライン魔の踏切)', '伊第112号踏切東武スカイツリーライン魔の踏切-b070tvbx', '伊第112号踏切(東武スカイツリーライン魔の踏切)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.95738, 139.768115, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8315', 'ghostmap.jp',
            'community-site',
            '伊第112号踏切(東武スカイツリーライン魔の踏切)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 200: 南湖院記念 太陽の郷庭園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8321') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南湖院記念 太陽の郷庭園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南湖院記念 太陽の郷庭園', '南湖院記念-太陽の郷庭園-yvtzock4', '南湖院記念 太陽の郷庭園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.31952, 139.389306, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8321', 'ghostmap.jp',
            'community-site',
            '南湖院記念 太陽の郷庭園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 201: 水道筋商店街
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8323') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '水道筋商店街' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('水道筋商店街', '水道筋商店街-9d12u5dq', '水道筋商店街は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.712937, 135.224055, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8323', 'ghostmap.jp',
            'community-site',
            '水道筋商店街とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 202: 猪名川クレー射撃場(川西射撃場)跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8333') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猪名川クレー射撃場(川西射撃場)跡地' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猪名川クレー射撃場(川西射撃場)跡地', '猪名川クレー射撃場川西射撃場跡地-yi58cakm', '猪名川クレー射撃場(川西射撃場)跡地は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.867137, 135.422346, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8333', 'ghostmap.jp',
            'community-site',
            '猪名川クレー射撃場(川西射撃場)跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 203: 守谷市本町の廃稲荷神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8339') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '守谷市本町の廃稲荷神社' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('守谷市本町の廃稲荷神社', '守谷市本町の廃稲荷神社-eqwlm3rb', '守谷市本町の廃稲荷神社は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.944485, 140.002389, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8339', 'ghostmap.jp',
            'community-site',
            '守谷市本町の廃稲荷神社とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 204: 四条畷の廃屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8341') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '四条畷の廃屋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('四条畷の廃屋', '四条畷の廃屋-53srt5e6', '四条畷の廃屋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.746579, 135.655512, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8341', 'ghostmap.jp',
            'community-site',
            '四条畷の廃屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 205: 首切り谷
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8343') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首切り谷' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首切り谷', '首切り谷-6iiqvs3d', '首切り谷は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.062458, 139.43711, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8343', 'ghostmap.jp',
            'community-site',
            '首切り谷とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 206: 大磯ケンタッキー跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8345') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大磯ケンタッキー跡地' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大磯ケンタッキー跡地', '大磯ケンタッキー跡地-ueozb4wh', '大磯ケンタッキー跡地は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.304283, 139.287616, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8345', 'ghostmap.jp',
            'community-site',
            '大磯ケンタッキー跡地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 207: パッチ池(奥池)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8349') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'パッチ池(奥池)' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('パッチ池(奥池)', 'パッチ池奥池-lvcgz0d0', 'パッチ池(奥池)は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.865801, 135.421426, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8349', 'ghostmap.jp',
            'community-site',
            'パッチ池(奥池)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 208: 与野公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8361') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '与野公園' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('与野公園', '与野公園-2x585u14', '与野公園は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.881768, 139.617485, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8361', 'ghostmap.jp',
            'community-site',
            '与野公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 209: 沖の島
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8367') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '沖の島' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('沖の島', '沖の島-jj49km6n', '沖の島は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.257547, 134.671113, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8367', 'ghostmap.jp',
            'community-site',
            '沖の島とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 210: 熊野神社の七ツ石
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8377') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '熊野神社の七ツ石' and prefecture_slug = 'tochigi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('熊野神社の七ツ石', '熊野神社の七ツ石-kwmrr3c3', '熊野神社の七ツ石は、栃木県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '栃木県', 'tochigi', null,
         36.461222, 139.763955, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8377', 'ghostmap.jp',
            'community-site',
            '熊野神社の七ツ石とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 211: 北条氏常盤亭跡(タチンダイ)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8385') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北条氏常盤亭跡(タチンダイ)' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北条氏常盤亭跡(タチンダイ)', '北条氏常盤亭跡タチンダイ-kd0gz6pi', '北条氏常盤亭跡(タチンダイ)は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.323573, 139.535143, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8385', 'ghostmap.jp',
            'community-site',
            '北条氏常盤亭跡(タチンダイ)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 212: 高雄過港隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8389') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高雄過港隧道' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高雄過港隧道', '高雄過港隧道-4rad7ewg', '高雄過港隧道は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         22.562336, 120.313121, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8389', 'ghostmap.jp',
            'community-site',
            '高雄過港隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 213: 山田の霊道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8393') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山田の霊道' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山田の霊道', '山田の霊道-0qgq0vzs', '山田の霊道は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.791421, 135.534962, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8393', 'ghostmap.jp',
            'community-site',
            '山田の霊道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 214: 監獄の墓(浦和更生園墓地)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8395') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '監獄の墓(浦和更生園墓地)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('監獄の墓(浦和更生園墓地)', '監獄の墓浦和更生園墓地-v7nn2puz', '監獄の墓(浦和更生園墓地)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.860885, 139.641748, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8395', 'ghostmap.jp',
            'community-site',
            '監獄の墓(浦和更生園墓地)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 215: 浜の宮海岸(名草の浜)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8397') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '浜の宮海岸(名草の浜)' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('浜の宮海岸(名草の浜)', '浜の宮海岸名草の浜-mjrn2tfm', '浜の宮海岸(名草の浜)は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.16528, 135.182476, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8397', 'ghostmap.jp',
            'community-site',
            '浜の宮海岸(名草の浜)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 216: 布引の滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8399') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '布引の滝' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('布引の滝', '布引の滝-81p7pt2k', '布引の滝は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.709513, 135.193742, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8399', 'ghostmap.jp',
            'community-site',
            '布引の滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 217: 南河内グリーンロード
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8403') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南河内グリーンロード' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南河内グリーンロード', '南河内グリーンロード-7m1c3rri', '南河内グリーンロードは、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.442396, 135.626951, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8403', 'ghostmap.jp',
            'community-site',
            '南河内グリーンロードとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 218: 荒井橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8405') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '荒井橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('荒井橋', '荒井橋-6bo1m77y', '荒井橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.019279, 139.503494, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8405', 'ghostmap.jp',
            'community-site',
            '荒井橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 219: 淀屋橋駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8407') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '淀屋橋駅' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('淀屋橋駅', '淀屋橋駅-7otrvpf4', '淀屋橋駅は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.692201, 135.501003, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8407', 'ghostmap.jp',
            'community-site',
            '淀屋橋駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 220: 北大江公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8409') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北大江公園' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北大江公園', '北大江公園-nz9zm5hd', '北大江公園は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.688998, 135.515199, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8409', 'ghostmap.jp',
            'community-site',
            '北大江公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 221: 長瀞の隔離病棟跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8413') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '長瀞の隔離病棟跡地' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('長瀞の隔離病棟跡地', '長瀞の隔離病棟跡地-roaodu9o', '長瀞の隔離病棟跡地は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.096053, 139.11642, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8413', 'ghostmap.jp',
            'community-site',
            '長瀞の隔離病棟跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 222: 十勝川温泉ホテル大平原
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8417') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '十勝川温泉ホテル大平原' and prefecture_slug = 'hokkaido' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('十勝川温泉ホテル大平原', '十勝川温泉ホテル大平原-fthvo89c', '十勝川温泉ホテル大平原は、北海道周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '北海道', 'hokkaido', null,
         42.931023, 143.302982, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8417', 'ghostmap.jp',
            'community-site',
            '十勝川温泉ホテル大平原とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 223: 洲原村診療所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8419') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '洲原村診療所' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('洲原村診療所', '洲原村診療所-eol80ytd', '洲原村診療所は、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         35.592907, 136.949811, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8419', 'ghostmap.jp',
            'community-site',
            '洲原村診療所とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 224: 清風寺寝屋川霊園近くの竹林
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8423') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '清風寺寝屋川霊園近くの竹林' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('清風寺寝屋川霊園近くの竹林', '清風寺寝屋川霊園近くの竹林-1o740aez', '清風寺寝屋川霊園近くの竹林は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.759217, 135.646141, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8423', 'ghostmap.jp',
            'community-site',
            '清風寺寝屋川霊園近くの竹林とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 225: 西溜池(エメラルド池)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8425') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西溜池(エメラルド池)' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西溜池(エメラルド池)', '西溜池エメラルド池-dijqlr54', '西溜池(エメラルド池)は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         35.014361, 134.271566, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8425', 'ghostmap.jp',
            'community-site',
            '西溜池(エメラルド池)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 226: 寝屋神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8433') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '寝屋神社' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('寝屋神社', '寝屋神社-8vc91zhg', '寝屋神社は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.768369, 135.654963, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8433', 'ghostmap.jp',
            'community-site',
            '寝屋神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 227: 向日町操車場の地下道(とうかい-122)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8435') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '向日町操車場の地下道(とうかい-122)' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('向日町操車場の地下道(とうかい-122)', '向日町操車場の地下道とうかい-122-e40vn1j1', '向日町操車場の地下道(とうかい-122)は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.93598, 135.706893, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8435', 'ghostmap.jp',
            'community-site',
            '向日町操車場の地下道(とうかい-122)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 228: 布施畑西公園と廃道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8437') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '布施畑西公園と廃道' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('布施畑西公園と廃道', '布施畑西公園と廃道-9a8arv4j', '布施畑西公園と廃道は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.689572, 135.066688, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8437', 'ghostmap.jp',
            'community-site',
            '布施畑西公園と廃道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 229: ホテルAyana(アヤナ)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8439') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテルAyana(アヤナ)' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテルAyana(アヤナ)', 'ホテルayanaアヤナ-mofniew0', 'ホテルAyana(アヤナ)は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.19608, 139.142715, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8439', 'ghostmap.jp',
            'community-site',
            'ホテルAyana(アヤナ)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 230: 諸磯海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8441') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '諸磯海岸' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('諸磯海岸', '諸磯海岸-vn1jz37p', '諸磯海岸は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.155201, 139.612741, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8441', 'ghostmap.jp',
            'community-site',
            '諸磯海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 231: 北野清掃工場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8443') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '北野清掃工場' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('北野清掃工場', '北野清掃工場-8r1p7o6a', '北野清掃工場は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.655441, 139.352476, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8443', 'ghostmap.jp',
            'community-site',
            '北野清掃工場　とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 232: 三浦外科
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8445') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三浦外科' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三浦外科', '三浦外科-38nuvxe3', '三浦外科は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.187319, 136.989535, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8445', 'ghostmap.jp',
            'community-site',
            '三浦外科とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 233: 万代池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8447') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '万代池' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('万代池', '万代池-aj8ufk5q', '万代池は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.61929, 135.502372, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8447', 'ghostmap.jp',
            'community-site',
            '万代池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 234: 高烏
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8451') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高烏' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高烏', '高烏-fjpldvop', '高烏は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.202148, 132.550735, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8451', 'ghostmap.jp',
            'community-site',
            '高烏とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 235: スイミングスクール南の地下道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8455') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'スイミングスクール南の地下道' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('スイミングスクール南の地下道', 'スイミングスクール南の地下道-mp50xues', 'スイミングスクール南の地下道は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.028114, 139.536086, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8455', 'ghostmap.jp',
            'community-site',
            'スイミングスクール南の地下道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 236: 鈴木モータース
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8457') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鈴木モータース' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鈴木モータース', '鈴木モータース-vada24lu', '鈴木モータースは、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.188099, 136.928614, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8457', 'ghostmap.jp',
            'community-site',
            '鈴木モータースとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 237: 泰聖寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8459') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '泰聖寺' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('泰聖寺', '泰聖寺-ughjap6g', '泰聖寺は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.656149, 135.510993, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8459', 'ghostmap.jp',
            'community-site',
            '泰聖寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 238: 元茨木川緑地(高浜町)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8461') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '元茨木川緑地(高浜町)' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('元茨木川緑地(高浜町)', '元茨木川緑地高浜町-oyq71elh', '元茨木川緑地(高浜町)は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.792948, 135.567082, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8461', 'ghostmap.jp',
            'community-site',
            '元茨木川緑地(高浜町)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 239: 万灯呂山展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8463') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '万灯呂山展望台' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('万灯呂山展望台', '万灯呂山展望台-lfnxcp62', '万灯呂山展望台は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.813514, 135.823132, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8463', 'ghostmap.jp',
            'community-site',
            '万灯呂山展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 240: お谷が池(才谷ヶ池)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8465') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'お谷が池(才谷ヶ池)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('お谷が池(才谷ヶ池)', 'お谷が池才谷ヶ池-pmgnwxz1', 'お谷が池(才谷ヶ池)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.130107, 139.68097, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8465', 'ghostmap.jp',
            'community-site',
            'お谷が池(才谷ヶ池)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 241: 押切橋前交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8467') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '押切橋前交差点' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('押切橋前交差点', '押切橋前交差点-b42mh29v', '押切橋前交差点は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.131062, 139.323827, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8467', 'ghostmap.jp',
            'community-site',
            '押切橋前交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 242: 東高根森林公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8469') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東高根森林公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東高根森林公園', '東高根森林公園-7ajq4rhi', '東高根森林公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.604417, 139.586813, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8469', 'ghostmap.jp',
            'community-site',
            '東高根森林公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 243: 平野町獺谷の豊国稲荷跡地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8473') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '平野町獺谷の豊国稲荷跡地' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('平野町獺谷の豊国稲荷跡地', '平野町獺谷の豊国稲荷跡地-8dbybkh5', '平野町獺谷の豊国稲荷跡地は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.69319, 135.164077, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8473', 'ghostmap.jp',
            'community-site',
            '平野町獺谷の豊国稲荷跡地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 244: 地蔵峠隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8475') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '地蔵峠隧道' and prefecture_slug = 'hiroshima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('地蔵峠隧道', '地蔵峠隧道-qmjqa0r2', '地蔵峠隧道は、広島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '広島県', 'hiroshima', null,
         34.177654, 132.66786, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8475', 'ghostmap.jp',
            'community-site',
            '地蔵峠隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 245: 戦災者慰霊之女神(星川)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8477') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '戦災者慰霊之女神(星川)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('戦災者慰霊之女神(星川)', '戦災者慰霊之女神星川-ads3ize8', '戦災者慰霊之女神(星川)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.143745, 139.383096, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8477', 'ghostmap.jp',
            'community-site',
            '戦災者慰霊之女神(星川)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 246: 薬師堂墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8479') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '薬師堂墓地' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('薬師堂墓地', '薬師堂墓地-ajoec1k2', '薬師堂墓地は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.904977, 139.547439, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8479', 'ghostmap.jp',
            'community-site',
            '薬師堂墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 247: 京橋駅爆撃被災者慰霊碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8481') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '京橋駅爆撃被災者慰霊碑' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('京橋駅爆撃被災者慰霊碑', '京橋駅爆撃被災者慰霊碑-fs4bbrk0', '京橋駅爆撃被災者慰霊碑は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.69572, 135.534543, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8481', 'ghostmap.jp',
            'community-site',
            '京橋駅爆撃被災者慰霊碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 248: 大阪大学献体慰霊碑
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8483') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大阪大学献体慰霊碑' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大阪大学献体慰霊碑', '大阪大学献体慰霊碑-rity4e4z', '大阪大学献体慰霊碑は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.820455, 135.526271, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8483', 'ghostmap.jp',
            'community-site',
            '大阪大学献体慰霊碑とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 249: 山里都市緑地公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8485') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山里都市緑地公園' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山里都市緑地公園', '山里都市緑地公園-lk53xx0o', '山里都市緑地公園は、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         26.325715, 127.790089, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8485', 'ghostmap.jp',
            'community-site',
            '山里都市緑地公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 250: 弁天沼
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8489') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '弁天沼' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('弁天沼', '弁天沼-apowzthq', '弁天沼は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.005794, 139.36994, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8489', 'ghostmap.jp',
            'community-site',
            '弁天沼とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 251: 万田八重窪の池(赤目が淵)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8491') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '万田八重窪の池(赤目が淵)' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('万田八重窪の池(赤目が淵)', '万田八重窪の池赤目が淵-ob05pp6t', '万田八重窪の池(赤目が淵)は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.324308, 139.302, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8491', 'ghostmap.jp',
            'community-site',
            '万田八重窪の池(赤目が淵)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 252: 下田尻の稲荷神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8493') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '下田尻の稲荷神社' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('下田尻の稲荷神社', '下田尻の稲荷神社-rx9iniyp', '下田尻の稲荷神社は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.944236, 135.427908, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8493', 'ghostmap.jp',
            'community-site',
            '下田尻の稲荷神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 253: 国道28号線の交差点
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8495') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '国道28号線の交差点' and prefecture_slug = 'tokushima' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('国道28号線の交差点', '国道28号線の交差点-m3bxcnnq', '国道28号線の交差点は、徳島県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '徳島県', 'tokushima', null,
         34.174045, 134.608695, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8495', 'ghostmap.jp',
            'community-site',
            '国道28号線の交差点とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 254: 琴滝
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8497') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '琴滝' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('琴滝', '琴滝-myjcyuop', '琴滝は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.138852, 135.439124, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8497', 'ghostmap.jp',
            'community-site',
            '琴滝とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 255: 戸塚立山公園(戸塚城跡)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8501') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '戸塚立山公園(戸塚城跡)' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('戸塚立山公園(戸塚城跡)', '戸塚立山公園戸塚城跡-69ydhzb7', '戸塚立山公園(戸塚城跡)は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.861313, 139.74891, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8501', 'ghostmap.jp',
            'community-site',
            '戸塚立山公園(戸塚城跡)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 256: 福田１号公園(アヒル公園)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8505') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '福田１号公園(アヒル公園)' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('福田１号公園(アヒル公園)', '福田1号公園アヒル公園-bzn2416d', '福田１号公園(アヒル公園)は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.442757, 139.464647, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8505', 'ghostmap.jp',
            'community-site',
            '福田１号公園(アヒル公園)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 257: 西三荘ゆとり道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8507') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西三荘ゆとり道' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西三荘ゆとり道', '西三荘ゆとり道-hv1e55ao', '西三荘ゆとり道は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.733466, 135.576395, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8507', 'ghostmap.jp',
            'community-site',
            '西三荘ゆとり道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 258: ひるがのハイツホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8509') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ひるがのハイツホテル' and prefecture_slug = 'gifu' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ひるがのハイツホテル', 'ひるがのハイツホテル-nc3l4m6p', 'ひるがのハイツホテルは、岐阜県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岐阜県', 'gifu', null,
         36.009299, 136.910486, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8509', 'ghostmap.jp',
            'community-site',
            'ひるがのハイツホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 259: 穴の浦隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8511') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '穴の浦隧道' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('穴の浦隧道', '穴の浦隧道-kanfvdvv', '穴の浦隧道は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         35.2542, 135.058899, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8511', 'ghostmap.jp',
            'community-site',
            '穴の浦隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 260: 三ヶ尻観音山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8515') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '三ヶ尻観音山' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('三ヶ尻観音山', '三ヶ尻観音山-q8vi9ge3', '三ヶ尻観音山は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.152552, 139.312945, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8515', 'ghostmap.jp',
            'community-site',
            '三ヶ尻観音山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 261: 猪山公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8517') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '猪山公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('猪山公園', '猪山公園-mh75rqkw', '猪山公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.453253, 139.456865, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8517', 'ghostmap.jp',
            'community-site',
            '猪山公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 262: 牧野公園のエゾ塚
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8523') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牧野公園のエゾ塚' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牧野公園のエゾ塚', '牧野公園のエゾ塚-04fahwf9', '牧野公園のエゾ塚は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.842195, 135.668212, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8523', 'ghostmap.jp',
            'community-site',
            '牧野公園のエゾ塚とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 263: 谷塚駅近くの踏切跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8525') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '谷塚駅近くの踏切跡' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('谷塚駅近くの踏切跡', '谷塚駅近くの踏切跡-wt1pv2yy', '谷塚駅近くの踏切跡は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.818737, 139.802325, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8525', 'ghostmap.jp',
            'community-site',
            '谷塚駅近くの踏切跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 264: 京奈和自動車道の側道とトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8529') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '京奈和自動車道の側道とトンネル' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('京奈和自動車道の側道とトンネル', '京奈和自動車道の側道とトンネル-w0b2d99n', '京奈和自動車道の側道とトンネルは、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.790429, 135.762221, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8529', 'ghostmap.jp',
            'community-site',
            '京奈和自動車道の側道とトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 265: 六甲全山縦走路 阪神高速下のトンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8531') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '六甲全山縦走路 阪神高速下のトンネル' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('六甲全山縦走路 阪神高速下のトンネル', '六甲全山縦走路-阪神高速下のトンネル-yzxuvoie', '六甲全山縦走路 阪神高速下のトンネルは、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.673596, 135.113577, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8531', 'ghostmap.jp',
            'community-site',
            '六甲全山縦走路 阪神高速下のトンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 266: 館川ダム
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8533') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '館川ダム' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('館川ダム', '館川ダム-j4czio9i', '館川ダムは、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.019323, 139.210854, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8533', 'ghostmap.jp',
            'community-site',
            '館川ダムとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 267: 空の散歩道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8535') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '空の散歩道' and prefecture_slug = 'shizuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('空の散歩道', '空の散歩道-03j6goxm', '空の散歩道は、静岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '静岡県', 'shizuoka', null,
         34.849655, 137.788156, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8535', 'ghostmap.jp',
            'community-site',
            '空の散歩道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 268: 青葉台第二公園(仏山跡地)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8537') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '青葉台第二公園(仏山跡地)' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('青葉台第二公園(仏山跡地)', '青葉台第二公園仏山跡地-yib6t60d', '青葉台第二公園(仏山跡地)は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.545268, 139.5143, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8537', 'ghostmap.jp',
            'community-site',
            '青葉台第二公園(仏山跡地)とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 269: 糸吉神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8539') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '糸吉神社' and prefecture_slug = 'nara' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('糸吉神社', '糸吉神社-fihi9yrh', '糸吉神社は、奈良県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '奈良県', 'nara', null,
         34.791154, 135.701907, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8539', 'ghostmap.jp',
            'community-site',
            '糸吉神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 270: 京丹波町蒲生野の廃墟
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8543') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '京丹波町蒲生野の廃墟' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('京丹波町蒲生野の廃墟', '京丹波町蒲生野の廃墟-w5h70mtj', '京丹波町蒲生野の廃墟は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.167459, 135.423911, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8543', 'ghostmap.jp',
            'community-site',
            '京丹波町蒲生野の廃墟とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 271: 山祇神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8547') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山祇神社' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山祇神社', '山祇神社-1ljs8164', '山祇神社は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.821281, 139.348318, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8547', 'ghostmap.jp',
            'community-site',
            '山祇神社とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 272: 御所台地蔵尊
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8549') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '御所台地蔵尊' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('御所台地蔵尊', '御所台地蔵尊-xhp80apq', '御所台地蔵尊は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.443654, 139.598379, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8549', 'ghostmap.jp',
            'community-site',
            '御所台地蔵尊とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 273: 協和町東公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8553') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '協和町東公園' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('協和町東公園', '協和町東公園-yu2ex4fr', '協和町東公園は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.561411, 135.471245, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8553', 'ghostmap.jp',
            'community-site',
            '協和町東公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 274: 本多公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8561') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '本多公園' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('本多公園', '本多公園-m86vkfxv', '本多公園は、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.003313, 134.539599, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8561', 'ghostmap.jp',
            'community-site',
            '本多公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 275: 鉄町森の小道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8567') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '鉄町森の小道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('鉄町森の小道', '鉄町森の小道-6lun4ntx', '鉄町森の小道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.566755, 139.525798, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8567', 'ghostmap.jp',
            'community-site',
            '鉄町森の小道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 276: 久下3丁目踏切
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8575') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久下3丁目踏切' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久下3丁目踏切', '久下3丁目踏切-4p27foar', '久下3丁目踏切は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.116741, 139.429323, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8575', 'ghostmap.jp',
            'community-site',
            '久下3丁目踏切とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 277: 福川水門
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8577') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '福川水門' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('福川水門', '福川水門-lp9eb3s8', '福川水門は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.193499, 139.440193, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8577', 'ghostmap.jp',
            'community-site',
            '福川水門とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 278: 箕面動物園跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8579') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '箕面動物園跡' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('箕面動物園跡', '箕面動物園跡-mmpu48kr', '箕面動物園跡は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.837819, 135.468787, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8579', 'ghostmap.jp',
            'community-site',
            '箕面動物園跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 279: 東六甲レストハウス跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8583') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '東六甲レストハウス跡' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('東六甲レストハウス跡', '東六甲レストハウス跡-67igxl8k', '東六甲レストハウス跡は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.781689, 135.288537, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8583', 'ghostmap.jp',
            'community-site',
            '東六甲レストハウス跡とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 280: 旧油井トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8585') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧油井トンネル' and prefecture_slug = 'okinawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧油井トンネル', '旧油井トンネル-iieaawz8', '旧油井トンネルは、沖縄県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '沖縄県', 'okinawa', null,
         28.186049, 129.290424, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8585', 'ghostmap.jp',
            'community-site',
            '旧油井トンネルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 281: 妙見坂公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8587') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '妙見坂公園' and prefecture_slug = 'kumamoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('妙見坂公園', '妙見坂公園-ukmq47h1', '妙見坂公園は、熊本県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '熊本県', 'kumamoto', null,
         32.703466, 130.798791, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8587', 'ghostmap.jp',
            'community-site',
            '妙見坂公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 282: 春日台公園(高津区市民健康の森)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8593') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '春日台公園(高津区市民健康の森)' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('春日台公園(高津区市民健康の森)', '春日台公園高津区市民健康の森-wze8zkbu', '春日台公園(高津区市民健康の森)は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.581577, 139.618702, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8593', 'ghostmap.jp',
            'community-site',
            '春日台公園(高津区市民健康の森)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 283: 荒川彩湖公園と道満グリーンパーク
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8595') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '荒川彩湖公園と道満グリーンパーク' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('荒川彩湖公園と道満グリーンパーク', '荒川彩湖公園と道満グリーンパーク-k13xm3r0', '荒川彩湖公園と道満グリーンパークは、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.822441, 139.631317, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8595', 'ghostmap.jp',
            'community-site',
            '荒川彩湖公園と道満グリーンパークとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 284: 天神社(大梵天王社)
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8597') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '天神社(大梵天王社)' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('天神社(大梵天王社)', '天神社大梵天王社-rpxemjfc', '天神社(大梵天王社)は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.382962, 135.522119, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8597', 'ghostmap.jp',
            'community-site',
            '天神社(大梵天王社)とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 285: 旧向島南小学校裏の墓地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8601') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '旧向島南小学校裏の墓地' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('旧向島南小学校裏の墓地', '旧向島南小学校裏の墓地-pg9r5019', '旧向島南小学校裏の墓地は、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         34.924018, 135.764964, 'approximate',
         '学校跡', 'school',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8601', 'ghostmap.jp',
            'community-site',
            '旧向島南小学校裏の墓地とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 286: 子神社と今井の丘公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8603') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '子神社と今井の丘公園' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('子神社と今井の丘公園', '子神社と今井の丘公園-o48foymo', '子神社と今井の丘公園は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.448312, 139.562612, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8603', 'ghostmap.jp',
            'community-site',
            '子神社と今井の丘公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 287: 牛滝山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8605') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '牛滝山' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('牛滝山', '牛滝山-bpijlluf', '牛滝山は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.369051, 135.449796, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8605', 'ghostmap.jp',
            'community-site',
            '牛滝山とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 288: 墓池
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8607') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '墓池' and prefecture_slug = 'hyogo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('墓池', '墓池-00zju618', '墓池は、兵庫県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '兵庫県', 'hyogo', null,
         34.810703, 134.982893, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8607', 'ghostmap.jp',
            'community-site',
            '墓池とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 289: 汐見台隧道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8611') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '汐見台隧道' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('汐見台隧道', '汐見台隧道-6me05noq', '汐見台隧道は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.398461, 139.609097, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8611', 'ghostmap.jp',
            'community-site',
            '汐見台隧道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 290: 西稱寺裏の廃屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8617') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '西稱寺裏の廃屋' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('西稱寺裏の廃屋', '西稱寺裏の廃屋-a3hrlzka', '西稱寺裏の廃屋は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.561769, 135.576969, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8617', 'ghostmap.jp',
            'community-site',
            '西稱寺裏の廃屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 291: 葛城山展望台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8619') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '葛城山展望台' and prefecture_slug = 'wakayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('葛城山展望台', '葛城山展望台-h1uqau4w', '葛城山展望台は、和歌山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '和歌山県', 'wakayama', null,
         34.347599, 135.433273, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8619', 'ghostmap.jp',
            'community-site',
            '葛城山展望台とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 292: 官軍兵士の墓誌
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8623') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '官軍兵士の墓誌' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('官軍兵士の墓誌', '官軍兵士の墓誌-01yib8fz', '官軍兵士の墓誌は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         38.92136, 139.831624, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8623', 'ghostmap.jp',
            'community-site',
            '官軍兵士の墓誌とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 293: 大浜海岸
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8625') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大浜海岸' and prefecture_slug = 'akita' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大浜海岸', '大浜海岸-k958lexm', '大浜海岸は、秋田県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '秋田県', 'akita', null,
         38.935652, 139.814619, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8625', 'ghostmap.jp',
            'community-site',
            '大浜海岸とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 294: ホテル静
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8627') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ホテル静' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ホテル静', 'ホテル静-nllfbjva', 'ホテル静は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.4065, 138.657427, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8627', 'ghostmap.jp',
            'community-site',
            'ホテル静とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 295: 佐久奈度神社下遊歩道
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8631') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '佐久奈度神社下遊歩道' and prefecture_slug = 'shiga' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('佐久奈度神社下遊歩道', '佐久奈度神社下遊歩道-9uw48tcj', '佐久奈度神社下遊歩道は、滋賀県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '滋賀県', 'shiga', null,
         34.91192, 135.912814, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8631', 'ghostmap.jp',
            'community-site',
            '佐久奈度神社下遊歩道とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 296: カンフービル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8635') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'カンフービル' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('カンフービル', 'カンフービル-8u7sx5an', 'カンフービルは、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.714965, 141.1551, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8635', 'ghostmap.jp',
            'community-site',
            'カンフービルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 297: 赤い家
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8639') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤い家' and prefecture_slug = 'niigata' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤い家', '赤い家-t6p4ktfe', '赤い家は、新潟県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '新潟県', 'niigata', null,
         37.516935, 139.003602, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8639', 'ghostmap.jp',
            'community-site',
            '赤い家とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 298: 久美浜シティーホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8643') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '久美浜シティーホテル' and prefecture_slug = 'tottori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('久美浜シティーホテル', '久美浜シティーホテル-0i3v9a5m', '久美浜シティーホテルは、鳥取県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '鳥取県', 'tottori', null,
         35.63753, 134.927748, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8643', 'ghostmap.jp',
            'community-site',
            '久美浜シティーホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 299: 撥雲洞トンネル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8647') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '撥雲洞トンネル' and prefecture_slug = 'kyoto' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('撥雲洞トンネル', '撥雲洞トンネル-y8fqxs44', '撥雲洞トンネルは、京都府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '京都府', 'kyoto', null,
         35.548569, 135.219984, 'approximate',
         'トンネル', 'tunnel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8647', 'ghostmap.jp',
            'community-site',
            '撥雲洞トンネルとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 300: 首切り地蔵
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8651') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '首切り地蔵' and prefecture_slug = 'fukuoka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('首切り地蔵', '首切り地蔵-10os7zy6', '首切り地蔵は、福岡県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '福岡県', 'fukuoka', null,
         33.875289, 130.905169, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8651', 'ghostmap.jp',
            'community-site',
            '首切り地蔵とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 301: 私の部屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8665') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '私の部屋' and prefecture_slug = 'aomori' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('私の部屋', '私の部屋-ny9d9hvh', '私の部屋は、青森県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '青森県', 'aomori', null,
         40.762966, 140.567137, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8665', 'ghostmap.jp',
            'community-site',
            '私の部屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 302: 馬込十字路
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8671') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '馬込十字路' and prefecture_slug = 'chiba' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('馬込十字路', '馬込十字路-4kuegvh2', '馬込十字路は、千葉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '千葉県', 'chiba', null,
         35.743533, 139.998137, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8671', 'ghostmap.jp',
            'community-site',
            '馬込十字路とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 303: 立正大学
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8675') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '立正大学' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('立正大学', '立正大学-d7glyorf', '立正大学は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.108756, 139.362946, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8675', 'ghostmap.jp',
            'community-site',
            '立正大学とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 304: 荒川の怪屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8681') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '荒川の怪屋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('荒川の怪屋', '荒川の怪屋-wlib2krz', '荒川の怪屋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.132166, 139.378364, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8681', 'ghostmap.jp',
            'community-site',
            '荒川の怪屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 305: 経塚山公園 公衆トイレ 南口
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8683') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '経塚山公園 公衆トイレ 南口' and prefecture_slug = 'nagano' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('経塚山公園 公衆トイレ 南口', '経塚山公園-公衆トイレ-南口-n35zd20e', '経塚山公園 公衆トイレ 南口は、長野県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '長野県', 'nagano', null,
         37.013296, 138.254228, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8683', 'ghostmap.jp',
            'community-site',
            '経塚山公園 公衆トイレ 南口とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 306: 武庫川下流域
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8685') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '武庫川下流域' and prefecture_slug = 'osaka' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('武庫川下流域', '武庫川下流域-25tj7n0u', '武庫川下流域は、大阪府周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '大阪府', 'osaka', null,
         34.741003, 135.379269, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8685', 'ghostmap.jp',
            'community-site',
            '武庫川下流域とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 307: 金蓮寺
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8687') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '金蓮寺' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('金蓮寺', '金蓮寺-f5ut8rnt', '金蓮寺は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         35.838249, 139.291508, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8687', 'ghostmap.jp',
            'community-site',
            '金蓮寺とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 308: 竹橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8693') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '竹橋' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('竹橋', '竹橋-ov8zkssk', '竹橋は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.691437, 139.756116, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8693', 'ghostmap.jp',
            'community-site',
            '竹橋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 309: 赤平増圧ポンプ場
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8699') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤平増圧ポンプ場' and prefecture_slug = 'iwate' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤平増圧ポンプ場', '赤平増圧ポンプ場-izz9nx6e', '赤平増圧ポンプ場は、岩手県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岩手県', 'iwate', null,
         39.738994, 141.131705, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8699', 'ghostmap.jp',
            'community-site',
            '赤平増圧ポンプ場とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 310: 岡山藩宍甘処刑場跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8705') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '岡山藩宍甘処刑場跡' and prefecture_slug = 'okayama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('岡山藩宍甘処刑場跡', '岡山藩宍甘処刑場跡-xkkhrpsx', '岡山藩宍甘処刑場跡は、岡山県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '岡山県', 'okayama', null,
         34.687093, 133.9937, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8705', 'ghostmap.jp',
            'community-site',
            '岡山藩宍甘処刑場跡とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 311: ヨゼフ病院裏
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8717') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'ヨゼフ病院裏' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('ヨゼフ病院裏', 'ヨゼフ病院裏-h4u0uu76', 'ヨゼフ病院裏は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.280323, 139.666178, 'approximate',
         '病院跡', 'hospital',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8717', 'ghostmap.jp',
            'community-site',
            'ヨゼフ病院裏とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 312: 山奥の謎小屋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8721') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '山奥の謎小屋' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('山奥の謎小屋', '山奥の謎小屋-hk6anh6u', '山奥の謎小屋は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.763077, 132.823199, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8721', 'ghostmap.jp',
            'community-site',
            '山奥の謎小屋とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 313: 虎杖集落
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8727') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '虎杖集落' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('虎杖集落', '虎杖集落-trje2dqy', '虎杖集落は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.823654, 133.115534, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8727', 'ghostmap.jp',
            'community-site',
            '虎杖集落とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 314: 杉立集落
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8729') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '杉立集落' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('杉立集落', '杉立集落-6l9dif1f', '杉立集落は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.862011, 132.844805, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8729', 'ghostmap.jp',
            'community-site',
            '杉立集落とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 315: 赤松遊園地
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8731') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '赤松遊園地' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('赤松遊園地', '赤松遊園地-4r8ww19k', '赤松遊園地は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.239825, 132.53367, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8731', 'ghostmap.jp',
            'community-site',
            '赤松遊園地とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 316: 奥道後ロープウェイ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8735') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '奥道後ロープウェイ' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('奥道後ロープウェイ', '奥道後ロープウェイ-jy2q4tj5', '奥道後ロープウェイは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.864218, 132.831878, 'approximate',
         '道路', 'road',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8735', 'ghostmap.jp',
            'community-site',
            '奥道後ロープウェイとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 317: 端出場水力発電所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8737') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '端出場水力発電所' and prefecture_slug = 'kochi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('端出場水力発電所', '端出場水力発電所-t1o6rjsf', '端出場水力発電所は、高知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '高知県', 'kochi', null,
         33.90149, 133.310874, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8737', 'ghostmap.jp',
            'community-site',
            '端出場水力発電所 とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 318: 銚子滝鉱山
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8739') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '銚子滝鉱山' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('銚子滝鉱山', '銚子滝鉱山-h5aar0kn', '銚子滝鉱山は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.697514, 132.791697, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8739', 'ghostmap.jp',
            'community-site',
            '銚子滝鉱山 とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 319: 芸予要塞小島砲台
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8741') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '芸予要塞小島砲台' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('芸予要塞小島砲台', '芸予要塞小島砲台-7z86ylmh', '芸予要塞小島砲台は、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         34.125761, 132.980845, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8741', 'ghostmap.jp',
            'community-site',
            '芸予要塞小島砲台とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 320: フラワーハウス
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8743') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'フラワーハウス' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('フラワーハウス', 'フラワーハウス-yfuh26t1', 'フラワーハウスは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         33.865465, 132.824083, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8743', 'ghostmap.jp',
            'community-site',
            'フラワーハウスとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 321: 南レクロッジ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8745') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南レクロッジ' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南レクロッジ', '南レクロッジ-78cawd04', '南レクロッジは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         32.96529, 132.550314, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8745', 'ghostmap.jp',
            'community-site',
            '南レクロッジとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 322: 川崎大師北の湖敏満墓所
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8749') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '川崎大師北の湖敏満墓所' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('川崎大師北の湖敏満墓所', '川崎大師北の湖敏満墓所-1dg7rtwt', '川崎大師北の湖敏満墓所は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.534381, 139.728552, 'approximate',
         '水辺・ダム', 'water',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8749', 'ghostmap.jp',
            'community-site',
            '川崎大師北の湖敏満墓所とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 323: HOTEL LA MODE
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8757') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = 'HOTEL LA MODE' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('HOTEL LA MODE', 'hotel-la-mode-nong24sd', 'HOTEL LA MODEは、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.427042, 139.362086, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8757', 'ghostmap.jp',
            'community-site',
            'HOTEL LA MODEとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 324: 大塚公園の公衆トイレ
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8761') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大塚公園の公衆トイレ' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大塚公園の公衆トイレ', '大塚公園の公衆トイレ-rw36zi68', '大塚公園の公衆トイレは、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.631847, 139.41402, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8761', 'ghostmap.jp',
            'community-site',
            '大塚公園の公衆トイレとは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 325: 大塚公園
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8763') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '大塚公園' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('大塚公園', '大塚公園-62jp3z99', '大塚公園は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.632233, 139.414963, 'approximate',
         '公園', 'park',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8763', 'ghostmap.jp',
            'community-site',
            '大塚公園とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 326: 根府川駅
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8769') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '根府川駅' and prefecture_slug = 'kanagawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('根府川駅', '根府川駅-z8fjpz75', '根府川駅は、神奈川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '神奈川県', 'kanagawa', null,
         35.202707, 139.138752, 'approximate',
         '駅・線路周辺', 'station',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8769', 'ghostmap.jp',
            'community-site',
            '根府川駅とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 327: 杉岡産婦人科医院
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8771') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '杉岡産婦人科医院' and prefecture_slug = 'gunma' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('杉岡産婦人科医院', '杉岡産婦人科医院-qfsqyfu7', '杉岡産婦人科医院は、群馬県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '群馬県', 'gunma', null,
         36.292652, 139.347292, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8771', 'ghostmap.jp',
            'community-site',
            '杉岡産婦人科医院とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 328: 末野の林
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8773') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '末野の林' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('末野の林', '末野の林-fb967ufx', '末野の林は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.039718, 137.145468, 'approximate',
         'その他', 'other',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8773', 'ghostmap.jp',
            'community-site',
            '末野の林とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 329: 高見リゾートホテル
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8775') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '高見リゾートホテル' and prefecture_slug = 'ehime' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('高見リゾートホテル', '高見リゾートホテル-9bzq8sq1', '高見リゾートホテルは、愛媛県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛媛県', 'ehime', null,
         34.368139, 133.200914, 'approximate',
         'ホテル跡', 'hotel',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8775', 'ghostmap.jp',
            'community-site',
            '高見リゾートホテルとは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 330: 常総橋
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8779') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '常総橋' and prefecture_slug = 'saitama' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('常総橋', '常総橋-88khpwcx', '常総橋は、埼玉県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '埼玉県', 'saitama', null,
         36.029735, 140.024636, 'approximate',
         '橋', 'bridge',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8779', 'ghostmap.jp',
            'community-site',
            '常総橋とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 331: 犬山城
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8791') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '犬山城' and prefecture_slug = 'aichi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('犬山城', '犬山城-ufpmyiyw', '犬山城は、愛知県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '愛知県', 'aichi', null,
         35.38842, 136.939173, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8791', 'ghostmap.jp',
            'community-site',
            '犬山城とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 332: 森の中にある廃神社
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8793') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '森の中にある廃神社' and prefecture_slug = 'tokyo' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('森の中にある廃神社', '森の中にある廃神社-f2xfx7au', '森の中にある廃神社は、東京都周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '東京都', 'tokyo', null,
         35.639071, 139.412707, 'approximate',
         '神社・寺', 'shrine-temple',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8793', 'ghostmap.jp',
            'community-site',
            '森の中にある廃神社とは？廃墟・事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 333: 柳沢峠
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8797') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '柳沢峠' and prefecture_slug = 'yamanashi' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('柳沢峠', '柳沢峠-o9pmjyad', '柳沢峠は、山梨県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '山梨県', 'yamanashi', null,
         35.776284, 138.802367, 'approximate',
         '山・峠', 'mountain-pass',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8797', 'ghostmap.jp',
            'community-site',
            '柳沢峠とは？事件・現在・心霊現象の噂',
            now(), false, 'imported via scripts/import-spots.ts');
  end if;

  -- 334: 南新保ゴマヂマチ遺跡
  if not exists (select 1 from public.sources where source_url = 'https://ghostmap.jp/spotdetail.php?spotcd=8799') then
    -- 同名同県があれば sources のみ追加して終了
    select id into new_spot_id from public.spots where name = '南新保ゴマヂマチ遺跡' and prefecture_slug = 'ishikawa' limit 1;
    if new_spot_id is null then
      insert into public.spots
        (name, slug, description, country, country_slug, prefecture, prefecture_slug, city,
         lat, lng, location_precision, category, category_slug,
         danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
      values
        ('南新保ゴマヂマチ遺跡', '南新保ゴマヂマチ遺跡-wquw7h04', '南新保ゴマヂマチ遺跡は、石川県周辺で心霊に関する噂・怪談・都市伝説として紹介されることがあるスポットです。

本ページは、Web上で確認できる掲載候補情報をもとに作成した初期データです。事件・事故・死亡事実などを断定するものではなく、内容の真偽を保証するものでもありません。

訪問や探索を推奨するものではありません。私有地、立入禁止区域、危険区域への侵入、近隣住民への迷惑行為、無断撮影は行わないでください。',
         '日本', 'japan',
         '石川県', 'ishikawa', null,
         36.599193, 136.629032, 'approximate',
         '廃墟', 'haikyo',
         1, 0, 0, false, false, 'pending_review')
      returning id into new_spot_id;
    end if;
    insert into public.sources (spot_id, source_url, source_name, source_type, raw_title, retrieved_at, is_public, memo)
    values (new_spot_id, 'https://ghostmap.jp/spotdetail.php?spotcd=8799', 'ghostmap.jp',
            'community-site',
            '南新保ゴマヂマチ遺跡とは？事件・現在・心霊現象の噂',
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