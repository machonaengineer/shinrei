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
-- =====================================================================
-- 心霊マップ - seed.sql
-- 開発確認用シードデータ（全て架空。実在の事件・個人情報は含めない）
-- =====================================================================

-- 既存データを掃除（開発用）
-- delete from public.reviews;
-- delete from public.spots;

insert into public.spots
  (name, slug, description, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  ('旧月影トンネル', 'kyu-tsukikage-tunnel',
   '地元で古くから語り継がれる、夜になると雰囲気が変わるという噂のトンネルです。真偽は不明ですが、足音を聞いたという投稿があります。',
   '神奈川県', 'kanagawa', '横浜市青葉区', '横浜市青葉区周辺（おおよその位置）',
   35.5705, 139.5371, 'approximate', 'トンネル', 'tunnel',
   3, 0, 0, false, false, 'published'),

  ('霧ヶ丘展望台', 'kirigaoka-tenboudai',
   '霧が出やすい高台にある展望台。夜になると霧で視界が悪く、独特の雰囲気を感じるという体験談が寄せられています。',
   '東京都', 'tokyo', '八王子市', '八王子市内（おおよその位置）',
   35.6585, 139.3030, 'approximate', '山・峠', 'mountain-pass',
   2, 0, 0, false, false, 'published'),

  ('黒森橋', 'kuromori-bashi',
   '森の中を抜ける小さな橋。地元では昔から少し怖い場所として知られているようです。投稿は体験談・伝承の共有を目的としています。',
   '埼玉県', 'saitama', '飯能市', '飯能市内（おおよその位置）',
   35.8553, 139.3278, 'approximate', '橋', 'bridge',
   2, 0, 0, false, false, 'published'),

  ('旧青葉ホテル跡', 'kyu-aoba-hotel-ato',
   'かつて存在したと噂されるホテルの跡地。現在は立入禁止区域に隣接しており、外部からの観察のみが想定されます。侵入は推奨しません。',
   '千葉県', 'chiba', '館山市', '館山市内（おおよその位置）',
   34.9962, 139.8696, 'area_only', 'ホテル跡', 'hotel',
   4, 0, 0, true, true, 'published'),

  ('白河公園北口', 'shirakawa-park-kitaguchi',
   '夜間に独特の静けさを感じるという都市伝説的な噂が地元で語られている公園の一角。真偽不明の体験談が共有されています。',
   '大阪府', 'osaka', '大阪市', '大阪市内（おおよその位置）',
   34.6937, 135.5023, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  ('旧灯野駅跡', 'kyu-tomono-eki-ato',
   'かつて存在したとされる駅の跡地周辺。鉄道ファンの間で都市伝説として語られることがあるエリアです。',
   '北海道', 'hokkaido', '函館市', '函館市内（おおよその位置）',
   41.7687, 140.7288, 'area_only', '駅・線路周辺', 'station',
   2, 0, 0, false, false, 'pending_review'),

  ('影沼ダム周辺', 'kagenuma-dam',
   '湖面に映る影が独特だという地元の噂があります。立入禁止区域には絶対に近づかないでください。',
   '長野県', 'nagano', '松本市', '松本市内（おおよその位置）',
   36.2380, 137.9720, 'area_only', '水辺・ダム', 'water',
   3, 0, 0, false, true, 'published');

-- reviews（全て架空）
insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '夜に通ったとき、後ろから足音のような音が聞こえた気がしました。気のせいかもしれませんが、独特の雰囲気でした。',
       4, '2024年秋', 'published'
from public.spots where slug = 'kyu-tsukikage-tunnel';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '通りすがり',
       '写真を撮ったら、端の方に白い影のようなものが写っていました。真偽はわかりませんが、印象に残る場所でした。',
       3, '2024年夏', 'published'
from public.spots where slug = 'kyu-tsukikage-tunnel';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '霧が濃い日に行きました。視界が悪いせいか、何かがいるような気配を感じました。あくまで個人の感想です。',
       3, '2025年春', 'published'
from public.spots where slug = 'kirigaoka-tenboudai';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '地元民',
       '地元では昔から少し怖い場所として知られているようです。真偽は不明ですが、雰囲気はあります。',
       2, null, 'published'
from public.spots where slug = 'kuromori-bashi';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '外から見るだけでも独特の雰囲気がありました。立入禁止なので絶対に入らないようにしてください。',
       4, '2024年冬', 'published'
from public.spots where slug = 'kyu-aoba-hotel-ato';

insert into public.reviews (spot_id, user_name, body, scary_score, visited_at, status)
select id, '匿名',
       '深夜に通りかかると、街灯の少なさもあって少し怖く感じました。あくまで個人の感想です。',
       2, '2025年春', 'published'
from public.spots where slug = 'shirakawa-park-kitaguchi';

-- 統計を再計算（trigger で更新されているはずだが念のため）
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;
