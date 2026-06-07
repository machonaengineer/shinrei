-- =====================================================================
-- shinrei: AdSense re-application — content quality cleanup
-- =====================================================================
-- AdSense の "scaled content abuse" / "thin content" 判定を回避するため、
-- ユーザーが付加価値（口コミ・写真・動画）を一切残していないインポート
-- スポットを一旦 hidden に戻します。
--
-- 残るスポット：
-- - 手書きキュレーション 110 件（独自の本文あり）
-- - 承認済みの口コミ・写真・動画があるスポット
-- - 管理者が明示的に手で承認したスポット
--
-- これで「同じテンプレ本文の薄いページが数千件」の状態が解消されます。
-- =====================================================================

-- 1) インポートで投入したスポット（sources.source_type IN ('wikipedia', 'community-site'）
--    のうち、UGC が何も付いていないものを 'hidden' に戻す
with stale as (
  select s.id
  from public.spots s
  join public.sources src on src.spot_id = s.id
  where s.status = 'published'
    and src.source_type in ('wikipedia', 'community-site')
    -- 口コミ・写真・動画のいずれもないものだけ対象
    and not exists (
      select 1 from public.reviews r
      where r.spot_id = s.id and r.status = 'published'
    )
    and not exists (
      select 1 from public.spot_images i
      where i.spot_id = s.id and i.status = 'published'
    )
    and not exists (
      select 1 from public.spot_videos v
      where v.spot_id = s.id and v.status = 'published'
    )
)
update public.spots
set status = 'hidden',
    updated_at = now()
where id in (select id from stale);

-- 2) 結果サマリ
select
  status,
  count(*) as cnt
from public.spots
group by status
order by status;

-- 3) Sitemap キャッシュ無効化のため updated_at を更新
-- (sitemap.ts が範囲フェッチするときに最新化される)
