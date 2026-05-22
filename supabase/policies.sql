-- =====================================================================
-- 心霊マップ - policies.sql
-- Row Level Security
-- =====================================================================

alter table public.profiles enable row level security;
alter table public.spots enable row level security;
alter table public.reviews enable row level security;
alter table public.reports enable row level security;
alter table public.removal_requests enable row level security;
alter table public.spot_images enable row level security;
alter table public.sources enable row level security;

-- profiles --------------------------------------------------------------
drop policy if exists "profiles_self_read" on public.profiles;
create policy "profiles_self_read" on public.profiles
  for select using (auth.uid() = id or public.is_admin());

drop policy if exists "profiles_self_update" on public.profiles;
create policy "profiles_self_update" on public.profiles
  for update using (auth.uid() = id)
  with check (auth.uid() = id and role = (select role from public.profiles where id = auth.uid()));

drop policy if exists "profiles_admin_all" on public.profiles;
create policy "profiles_admin_all" on public.profiles
  for all using (public.is_admin()) with check (public.is_admin());

-- spots -----------------------------------------------------------------
drop policy if exists "spots_public_read_published" on public.spots;
create policy "spots_public_read_published" on public.spots
  for select using (status = 'published' or public.is_admin());

drop policy if exists "spots_anyone_insert_pending" on public.spots;
create policy "spots_anyone_insert_pending" on public.spots
  for insert
  with check (
    status = 'pending_review'
    and (created_by is null or created_by = auth.uid())
  );

drop policy if exists "spots_admin_all" on public.spots;
create policy "spots_admin_all" on public.spots
  for all using (public.is_admin()) with check (public.is_admin());

-- reviews ---------------------------------------------------------------
drop policy if exists "reviews_public_read_published" on public.reviews;
create policy "reviews_public_read_published" on public.reviews
  for select using (status = 'published' or public.is_admin());

drop policy if exists "reviews_anyone_insert_pending" on public.reviews;
create policy "reviews_anyone_insert_pending" on public.reviews
  for insert
  with check (status = 'pending_review');

drop policy if exists "reviews_admin_all" on public.reviews;
create policy "reviews_admin_all" on public.reviews
  for all using (public.is_admin()) with check (public.is_admin());

-- reports ---------------------------------------------------------------
drop policy if exists "reports_anyone_insert" on public.reports;
create policy "reports_anyone_insert" on public.reports
  for insert
  with check (status = 'open');

drop policy if exists "reports_admin_all" on public.reports;
create policy "reports_admin_all" on public.reports
  for all using (public.is_admin()) with check (public.is_admin());

-- removal_requests ------------------------------------------------------
drop policy if exists "removal_requests_anyone_insert" on public.removal_requests;
create policy "removal_requests_anyone_insert" on public.removal_requests
  for insert
  with check (status = 'open');

drop policy if exists "removal_requests_admin_all" on public.removal_requests;
create policy "removal_requests_admin_all" on public.removal_requests
  for all using (public.is_admin()) with check (public.is_admin());

-- spot_images -----------------------------------------------------------
drop policy if exists "spot_images_public_read_published" on public.spot_images;
create policy "spot_images_public_read_published" on public.spot_images
  for select using (status = 'published' or public.is_admin());

drop policy if exists "spot_images_anyone_insert_pending" on public.spot_images;
create policy "spot_images_anyone_insert_pending" on public.spot_images
  for insert
  with check (status = 'pending_review');

drop policy if exists "spot_images_admin_all" on public.spot_images;
create policy "spot_images_admin_all" on public.spot_images
  for all using (public.is_admin()) with check (public.is_admin());

-- sources ---------------------------------------------------------------
drop policy if exists "sources_public_read" on public.sources;
create policy "sources_public_read" on public.sources
  for select using (true);

drop policy if exists "sources_admin_all" on public.sources;
create policy "sources_admin_all" on public.sources
  for all using (public.is_admin()) with check (public.is_admin());

-- =====================================================================
-- Storage bucket policies (run after creating bucket 'spot-images')
-- =====================================================================
-- The following can be executed once the bucket exists.
-- They allow anonymous uploads to a 'pending/' prefix and public read of
-- objects under 'published/' prefix. Admin operations bypass via service role.

-- insert into storage.buckets (id, name, public) values ('spot-images', 'spot-images', true)
--   on conflict (id) do nothing;
