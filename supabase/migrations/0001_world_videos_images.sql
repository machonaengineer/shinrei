-- =====================================================================
-- 心霊マップ - migration 0001: 海外対応 + 動画 + 拡張
-- 既存DBにこの内容のみ追加で流せる（idempotent）
-- =====================================================================

-- spots: country support ------------------------------------------------
alter table public.spots
  add column if not exists country text not null default '日本';
alter table public.spots
  add column if not exists country_slug text not null default 'japan';

create index if not exists spots_country_slug_idx on public.spots(country_slug);

-- sources: extend for internal moderation ------------------------------
alter table public.sources
  add column if not exists source_name text;
alter table public.sources
  add column if not exists raw_title text;
alter table public.sources
  add column if not exists retrieved_at timestamptz;
alter table public.sources
  add column if not exists is_public boolean not null default false;

create index if not exists sources_source_url_idx on public.sources(source_url);

-- spot_images: extend for moderation/upload metadata --------------------
alter table public.spot_images
  add column if not exists caption text;
alter table public.spot_images
  add column if not exists uploaded_by_name text;
alter table public.spot_images
  add column if not exists source_type text;
alter table public.spot_images
  add column if not exists moderation_note text;
alter table public.spot_images
  add column if not exists is_ai_generated boolean not null default false;
alter table public.spot_images
  add column if not exists is_sensitive boolean not null default false;
alter table public.spot_images
  add column if not exists report_count integer not null default 0;
alter table public.spot_images
  add column if not exists updated_at timestamptz not null default now();

drop trigger if exists trg_spot_images_updated_at on public.spot_images;
create trigger trg_spot_images_updated_at
before update on public.spot_images
for each row execute function public.set_updated_at();

-- spot_videos: new table ------------------------------------------------
create table if not exists public.spot_videos (
  id uuid primary key default gen_random_uuid(),
  spot_id uuid not null references public.spots(id) on delete cascade,
  platform text not null check (platform in ('youtube', 'tiktok', 'other')),
  video_url text not null,
  embed_url text,
  title text,
  status text not null default 'pending_review'
    check (status in ('pending_review', 'published', 'rejected', 'hidden', 'deleted')),
  source_type text,
  submitted_by_name text,
  moderation_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists spot_videos_spot_id_idx on public.spot_videos(spot_id);
create index if not exists spot_videos_status_idx on public.spot_videos(status);
create index if not exists spot_videos_platform_idx on public.spot_videos(platform);

drop trigger if exists trg_spot_videos_updated_at on public.spot_videos;
create trigger trg_spot_videos_updated_at
before update on public.spot_videos
for each row execute function public.set_updated_at();

alter table public.spot_videos enable row level security;

drop policy if exists "spot_videos_public_read_published" on public.spot_videos;
create policy "spot_videos_public_read_published" on public.spot_videos
  for select using (status = 'published' or public.is_admin());

drop policy if exists "spot_videos_anyone_insert_pending" on public.spot_videos;
create policy "spot_videos_anyone_insert_pending" on public.spot_videos
  for insert with check (status = 'pending_review');

drop policy if exists "spot_videos_admin_all" on public.spot_videos;
create policy "spot_videos_admin_all" on public.spot_videos
  for all using (public.is_admin()) with check (public.is_admin());

-- Storage bucket: spot-photos (run after creating bucket) ---------------
-- insert into storage.buckets (id, name, public) values ('spot-photos', 'spot-photos', true)
--   on conflict (id) do nothing;
