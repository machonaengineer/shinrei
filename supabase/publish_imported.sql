-- =====================================================================
-- shinrei: imported_part*.sql で投入されたスポットを一括公開
-- =====================================================================
-- 5574件全てを published に変更します。
--
-- 編集ポリシー遵守のため、最終防御線として名前による安全フィルタを残します。
-- import-spots.ts のスクレイプ時点でも事件・死亡語を含む名前は除外済みです。
--
-- 使い方:
--   Supabase SQL Editor に貼り付けて Run（数秒で完了）
-- =====================================================================

-- 全 imported_part*.sql で取り込まれた spots を published に変更
update public.spots
set status = 'published'
where status = 'pending_review'
  and id in (
    select spot_id from public.sources
    where source_type in ('wikipedia', 'community-site')
      and is_public = false
      and spot_id is not null
  )
  -- 安全フィルタ（スクレイプでも除外済みだが念のため）
  and name !~ '事件|殺人|殺害|自殺|他殺|心中|焼死|轢死|溺死|餓死|縊死|絞殺|遺体|死体|死亡|死者|投身|飛び降り|飛降り|身投げ|虐待|誘拐|拉致|監禁|被害者|加害者|容疑者|号室|バラバラ';

-- 結果サマリ
select
  (select count(*) from public.spots where status = 'published') as published_count,
  (select count(*) from public.spots where status = 'pending_review') as pending_count,
  (select count(*) from public.spots where status = 'rejected' or status = 'hidden' or status = 'deleted') as other_count;

-- スポット統計を再計算
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;
