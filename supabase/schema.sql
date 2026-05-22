-- =====================================================================
-- 心霊マップ - schema.sql
-- Supabase / PostgreSQL
-- 流す順番: schema.sql -> policies.sql -> seed.sql
-- =====================================================================

-- Extensions ---------------------------------------------------------------
create extension if not exists "pgcrypto";
create extension if not exists "postgis";

-- Profiles -----------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  role text not null default 'user' check (role in ('user', 'admin')),
  created_at timestamptz not null default now()
);

-- Spots --------------------------------------------------------------------
create table if not exists public.spots (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  description text,
  prefecture text not null,
  prefecture_slug text not null,
  city text,
  address_public text,
  lat double precision not null,
  lng double precision not null,
  location_precision text not null default 'approximate'
    check (location_precision in ('exact', 'approximate', 'area_only')),
  category text not null,
  category_slug text not null,
  danger_level integer not null default 1 check (danger_level between 1 and 5),
  scary_score numeric not null default 0,
  review_count integer not null default 0,
  is_private_property boolean not null default false,
  is_entry_prohibited boolean not null default false,
  status text not null default 'pending_review'
    check (status in ('draft', 'pending_review', 'published', 'rejected', 'hidden', 'deleted')),
  created_by uuid null references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists spots_status_idx on public.spots(status);
create index if not exists spots_prefecture_slug_idx on public.spots(prefecture_slug);
create index if not exists spots_category_slug_idx on public.spots(category_slug);
create index if not exists spots_created_at_idx on public.spots(created_at desc);

-- Reviews ------------------------------------------------------------------
create table if not exists public.reviews (
  id uuid primary key default gen_random_uuid(),
  spot_id uuid not null references public.spots(id) on delete cascade,
  user_name text,
  body text not null,
  scary_score integer not null default 3 check (scary_score between 1 and 5),
  visited_at text,
  image_url text,
  status text not null default 'pending_review'
    check (status in ('pending_review', 'published', 'rejected', 'hidden', 'deleted')),
  ip_hash text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists reviews_spot_id_idx on public.reviews(spot_id);
create index if not exists reviews_status_idx on public.reviews(status);
create index if not exists reviews_created_at_idx on public.reviews(created_at desc);

-- Reports ------------------------------------------------------------------
create table if not exists public.reports (
  id uuid primary key default gen_random_uuid(),
  target_type text not null check (target_type in ('spot', 'review', 'image', 'other')),
  target_id uuid,
  reason text not null,
  email text,
  body text,
  status text not null default 'open'
    check (status in ('open', 'reviewing', 'resolved', 'rejected')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists reports_status_idx on public.reports(status);

-- Removal requests ---------------------------------------------------------
create table if not exists public.removal_requests (
  id uuid primary key default gen_random_uuid(),
  target_url text not null,
  reason text not null,
  is_rights_holder boolean not null default false,
  email text not null,
  body text not null,
  status text not null default 'open'
    check (status in ('open', 'reviewing', 'resolved', 'rejected')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists removal_requests_status_idx on public.removal_requests(status);

-- Spot images --------------------------------------------------------------
create table if not exists public.spot_images (
  id uuid primary key default gen_random_uuid(),
  spot_id uuid references public.spots(id) on delete cascade,
  review_id uuid references public.reviews(id) on delete cascade,
  image_url text not null,
  status text not null default 'pending_review'
    check (status in ('pending_review', 'published', 'rejected', 'hidden', 'deleted')),
  created_at timestamptz not null default now()
);

create index if not exists spot_images_spot_id_idx on public.spot_images(spot_id);
create index if not exists spot_images_review_id_idx on public.spot_images(review_id);

-- Sources ------------------------------------------------------------------
create table if not exists public.sources (
  id uuid primary key default gen_random_uuid(),
  spot_id uuid references public.spots(id) on delete cascade,
  source_type text,
  source_url text,
  memo text,
  created_at timestamptz not null default now()
);

-- =====================================================================
-- Helper functions
-- =====================================================================

-- updated_at trigger
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_spots_updated_at on public.spots;
create trigger trg_spots_updated_at
before update on public.spots
for each row execute function public.set_updated_at();

drop trigger if exists trg_reviews_updated_at on public.reviews;
create trigger trg_reviews_updated_at
before update on public.reviews
for each row execute function public.set_updated_at();

drop trigger if exists trg_reports_updated_at on public.reports;
create trigger trg_reports_updated_at
before update on public.reports
for each row execute function public.set_updated_at();

drop trigger if exists trg_removal_requests_updated_at on public.removal_requests;
create trigger trg_removal_requests_updated_at
before update on public.removal_requests
for each row execute function public.set_updated_at();

-- admin判定関数
create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists(
    select 1 from public.profiles
    where id = auth.uid()
      and role = 'admin'
  );
$$;

-- Re-aggregate spot stats from published reviews
create or replace function public.recalc_spot_stats(target_spot uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.spots s
  set
    review_count = coalesce(sub.cnt, 0),
    scary_score = coalesce(sub.avg_score, 0),
    updated_at = now()
  from (
    select
      spot_id,
      count(*)::int as cnt,
      round(avg(scary_score)::numeric, 2) as avg_score
    from public.reviews
    where status = 'published'
      and spot_id = target_spot
    group by spot_id
  ) sub
  where s.id = target_spot;

  -- 0件の場合は明示的にリセット
  update public.spots
  set review_count = 0, scary_score = 0, updated_at = now()
  where id = target_spot
    and not exists (
      select 1 from public.reviews
      where spot_id = target_spot and status = 'published'
    );
end;
$$;

-- Trigger to keep spot stats in sync with reviews
create or replace function public.reviews_stats_trigger()
returns trigger
language plpgsql
as $$
begin
  if tg_op = 'INSERT' then
    perform public.recalc_spot_stats(new.spot_id);
    return new;
  elsif tg_op = 'UPDATE' then
    perform public.recalc_spot_stats(new.spot_id);
    if new.spot_id is distinct from old.spot_id then
      perform public.recalc_spot_stats(old.spot_id);
    end if;
    return new;
  elsif tg_op = 'DELETE' then
    perform public.recalc_spot_stats(old.spot_id);
    return old;
  end if;
  return null;
end;
$$;

drop trigger if exists trg_reviews_stats on public.reviews;
create trigger trg_reviews_stats
after insert or update or delete on public.reviews
for each row execute function public.reviews_stats_trigger();

-- Auto-create profile on auth.users insert
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  admin_email text := current_setting('app.admin_email', true);
begin
  insert into public.profiles (id, display_name, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'display_name', split_part(new.email, '@', 1)),
    case
      when admin_email is not null and admin_email <> '' and new.email = admin_email then 'admin'
      else 'user'
    end
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();
