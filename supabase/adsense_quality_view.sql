-- =====================================================================
-- shinrei: index-worthy spots view (AdSense low-value-content fix)
-- =====================================================================
-- 量産インポートページ（同一テンプレ本文）を検索インデックスから外し、
-- 「価値あるページ」だけを sitemap / index 対象にするためのビュー。
--
-- index-worthy = 次のいずれか:
--   - 公開済みの口コミ / 写真 / 動画がある
--   - インポート由来ではない（手書きキュレーション）
--
-- 適用後、アプリの sitemap.ts と generateMetadata がこのビューを参照します。
-- =====================================================================

create or replace view public.index_worthy_spots as
select s.id, s.slug, s.updated_at
from public.spots s
where s.status = 'published'
  and (
    -- 手書きキュレーション（インポート source を持たない）
    not exists (
      select 1 from public.sources src
      where src.spot_id = s.id
        and src.source_type in ('wikipedia', 'community-site')
    )
    -- もしくは UGC がついている
    or exists (
      select 1 from public.reviews r where r.spot_id = s.id and r.status = 'published'
    )
    or exists (
      select 1 from public.spot_images i where i.spot_id = s.id and i.status = 'published'
    )
    or exists (
      select 1 from public.spot_videos v where v.spot_id = s.id and v.status = 'published'
    )
  );

-- 公開読み取りを許可（anon でも sitemap 生成で読めるように）
grant select on public.index_worthy_spots to anon, authenticated;

-- 件数確認
select count(*) as index_worthy_count from public.index_worthy_spots;
