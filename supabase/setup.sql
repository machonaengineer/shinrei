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
-- =====================================================================
-- 心霊マップ - migration 0002: contact_messages
-- =====================================================================

create table if not exists public.contact_messages (
  id uuid primary key default gen_random_uuid(),
  name text,
  email text,
  subject text,
  body text not null,
  source text,
  status text not null default 'open'
    check (status in ('open', 'reviewing', 'resolved', 'rejected')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists contact_messages_status_idx on public.contact_messages(status);
create index if not exists contact_messages_created_at_idx on public.contact_messages(created_at desc);

drop trigger if exists trg_contact_messages_updated_at on public.contact_messages;
create trigger trg_contact_messages_updated_at
before update on public.contact_messages
for each row execute function public.set_updated_at();

alter table public.contact_messages enable row level security;

drop policy if exists "contact_messages_anyone_insert" on public.contact_messages;
create policy "contact_messages_anyone_insert" on public.contact_messages
  for insert with check (status = 'open');

drop policy if exists "contact_messages_admin_all" on public.contact_messages;
create policy "contact_messages_admin_all" on public.contact_messages
  for all using (public.is_admin()) with check (public.is_admin());
-- =====================================================================
-- shinrei migration 0003: visit counter
-- =====================================================================

-- 訪問カウンター（singleton row）
create table if not exists public.visit_counter (
  id integer primary key default 1,
  total_count bigint not null default 0,
  updated_at timestamptz not null default now(),
  constraint visit_counter_singleton check (id = 1)
);

insert into public.visit_counter (id, total_count)
values (1, 0)
on conflict (id) do nothing;

-- atomic increment 関数（API から呼ぶ）
create or replace function public.increment_visit_count()
returns bigint
language plpgsql
security definer
set search_path = public
as $$
declare
  new_count bigint;
begin
  update public.visit_counter
  set total_count = total_count + 1,
      updated_at = now()
  where id = 1
  returning total_count into new_count;
  return new_count;
end;
$$;

-- 公開読取（カウンターのみ閲覧 OK）
alter table public.visit_counter enable row level security;

drop policy if exists "visit_counter_public_read" on public.visit_counter;
create policy "visit_counter_public_read" on public.visit_counter
  for select using (true);

drop policy if exists "visit_counter_admin_all" on public.visit_counter;
create policy "visit_counter_admin_all" on public.visit_counter
  for all using (public.is_admin()) with check (public.is_admin());

-- 関数の公開
grant execute on function public.increment_visit_count() to anon, authenticated;
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
-- =====================================================================
-- 心霊マップ - seed_world.sql
-- 手書きキュレーション（日本拡充 + 海外）
-- 本文は独自テンプレート。他サイトからのコピーは含めません。
-- 全て公知の地名・著名な伝承名のみを使用し、事件断定は避けています。
-- =====================================================================

-- ----- 共通の description テンプレート用関数（インライン） -----
-- 各 insert 内で生成します。

-- ========== 日本（追加） ==========
insert into public.spots
  (name, slug, description, country, country_slug, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  ('犬鳴峠周辺', 'inunaki-area',
   '犬鳴峠は福岡県内で語られる怪談・都市伝説の舞台として広く知られているエリアです。様々な噂や逸話が地元・ネット上で語られてきました。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。掲載内容の真偽を保証するものでもありません。訪問や探索を推奨するものではなく、私有地・立入禁止区域への侵入、近隣住民への迷惑行為は行わないでください。',
   '日本', 'japan', '福岡県', 'fukuoka', '宮若市', '宮若市周辺（おおよその位置）',
   33.6710, 130.6500, 'area_only', '山・峠', 'mountain-pass',
   3, 0, 0, false, true, 'published'),

  ('八幡の藪知らず周辺', 'yawata-yabushirazu',
   '千葉県市川市にあるとされる「八幡の藪知らず」は、江戸時代の文献にも登場する古い伝承の舞台として知られています。地元では「入ってはいけない藪」として語り継がれてきました。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   '日本', 'japan', '千葉県', 'chiba', '市川市', '市川市八幡周辺',
   35.7218, 139.9217, 'approximate', '神社・寺', 'shrine-temple',
   2, 0, 0, false, true, 'published'),

  ('青木ヶ原樹海周辺', 'aokigahara-area',
   '富士山麓に広がる青木ヶ原樹海は、独特の地形と植生をもち、多くの怪談・都市伝説の舞台として語られてきた森林地帯です。本ページは民俗・地理情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。樹海は地形が複雑で遭難の危険が高いため、訪問・探索を推奨するものではありません。',
   '日本', 'japan', '山梨県', 'yamanashi', '富士河口湖町', '富士河口湖町周辺',
   35.4720, 138.6230, 'area_only', '山・峠', 'mountain-pass',
   4, 0, 0, false, false, 'published'),

  ('旧吹上トンネル', 'kyu-fukiage-tunnel',
   '東京都西部の山間部に位置するとされるトンネル名として、心霊スポット系の語りで知られる場所です。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。訪問や探索を推奨するものではなく、私有地・立入禁止区域への侵入は行わないでください。',
   '日本', 'japan', '東京都', 'tokyo', '青梅市', '青梅市成木周辺',
   35.8410, 139.2210, 'approximate', 'トンネル', 'tunnel',
   3, 0, 0, false, false, 'published'),

  ('旧七尾トンネル', 'kyu-nanao-tunnel',
   '石川県内で語られる旧道トンネルの一つとして知られる場所です。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   '日本', 'japan', '石川県', 'ishikawa', '七尾市', '七尾市周辺',
   37.0430, 136.9670, 'area_only', 'トンネル', 'tunnel',
   2, 0, 0, false, false, 'published'),

  ('常紋トンネル周辺', 'jomon-tunnel-area',
   '北海道のJR石北本線沿いにあるとされる常紋トンネルは、明治期の鉄道建設にまつわる伝承で知られる場所です。本ページは民俗・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。鉄道施設への無断立入は行わないでください。',
   '日本', 'japan', '北海道', 'hokkaido', '北見市', '北見市留辺蘂町〜遠軽町境界周辺',
   43.9430, 143.6160, 'area_only', '駅・線路周辺', 'station',
   3, 0, 0, false, true, 'published'),

  ('天王森泉公園周辺', 'tennomori-park',
   '神奈川県横浜市にある公園として知られる場所で、地元ではいくつかの怪談・噂が語られることがあります。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   '日本', 'japan', '神奈川県', 'kanagawa', '横浜市泉区', '横浜市泉区岡津町周辺',
   35.4180, 139.4910, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  ('東尋坊周辺', 'tojinbo-area',
   '福井県の東尋坊は、断崖絶壁の景勝地として知られる一方、古くから様々な伝承・怪談の舞台として語られてきた場所です。本ページは民俗・地理情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。崖縁は危険なため、安全な観光ルートをご利用ください。',
   '日本', 'japan', '福井県', 'fukui', '坂井市', '坂井市三国町周辺',
   36.2410, 136.1280, 'approximate', '水辺・ダム', 'water',
   3, 0, 0, false, false, 'published'),

  ('伊勢谷トンネル', 'iseya-tunnel',
   '関東圏で語られるトンネル名のひとつ。地元では古くから怪談として語られることがあるとされます。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '神奈川県', 'kanagawa', '横須賀市', '横須賀市周辺',
   35.2980, 139.6710, 'approximate', 'トンネル', 'tunnel',
   2, 0, 0, false, false, 'published'),

  ('小坪トンネル', 'kotsubo-tunnel',
   '神奈川県の海岸沿いにあるトンネルとして、地元では古くから怪談・噂が語られてきた場所のひとつです。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '神奈川県', 'kanagawa', '逗子市', '逗子市〜鎌倉市境界周辺',
   35.3010, 139.5610, 'approximate', 'トンネル', 'tunnel',
   2, 0, 0, false, false, 'published'),

  ('上原樹林周辺', 'uehara-rinyu',
   '関東近郊の樹林帯として地元で語られることがあるエリアです。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   '日本', 'japan', '埼玉県', 'saitama', '飯能市', '飯能市山間部',
   35.8870, 139.2700, 'area_only', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  ('生駒トンネル周辺', 'ikoma-tunnel-area',
   '近畿圏の旧鉄道トンネルとして、いくつかの伝承・怪談が語られる場所のひとつです。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '大阪府', 'osaka', '東大阪市', '東大阪〜生駒境界周辺',
   34.6750, 135.6810, 'area_only', '駅・線路周辺', 'station',
   2, 0, 0, false, false, 'published'),

  ('再度山ドライブウェイ', 'futatabisan-driveway',
   '六甲山系の山道として知られる道路で、深夜帯にまつわる怪談・噂が語られることがある場所です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。夜間の運転には十分ご注意ください。',
   '日本', 'japan', '兵庫県', 'hyogo', '神戸市', '神戸市灘区〜中央区山間部',
   34.7320, 135.2010, 'area_only', '道路', 'road',
   2, 0, 0, false, false, 'published'),

  ('お菊の井戸', 'okiku-well',
   '播州皿屋敷の怪談として古くから語られてきた伝承の舞台として知られる場所です。本ページは民俗・伝承情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '兵庫県', 'hyogo', '姫路市', '姫路市本町（姫路城周辺）',
   34.8395, 134.6940, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('番町皿屋敷の地', 'banchou-sarayashiki',
   '江戸の怪談「番町皿屋敷」の舞台として伝えられる地域として知られる場所です。本ページは民俗・伝承情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '東京都', 'tokyo', '千代田区', '千代田区五番町周辺',
   35.6890, 139.7400, 'area_only', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('四谷怪談ゆかりの地', 'yotsuya-kaidan-yukari',
   '江戸期の怪談「四谷怪談」にゆかりがあると伝えられる地域として知られる場所です。本ページは民俗・伝承情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '東京都', 'tokyo', '新宿区', '新宿区左門町周辺',
   35.6884, 139.7240, 'area_only', '神社・寺', 'shrine-temple',
   2, 0, 0, false, false, 'published'),

  ('遠野物語の里', 'tono-monogatari',
   '柳田國男「遠野物語」に登場する民俗・伝承の里として広く知られるエリアです。本ページは民俗・伝承情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '岩手県', 'iwate', '遠野市', '遠野市内',
   39.3270, 141.5340, 'area_only', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('天井裏の蛇神社', 'tenjouura-snake',
   '東北地方で蛇神信仰が伝えられる神社の一例として知られる場所です。本ページは民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '宮城県', 'miyagi', '仙台市', '仙台市内（おおよその位置）',
   38.2680, 140.8690, 'area_only', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('河童伝承の里・牛深', 'kappa-ushibuka',
   '九州の海辺で河童伝承が語り継がれてきたとされる地域の一つです。本ページは民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '熊本県', 'kumamoto', '天草市', '天草市牛深町周辺',
   32.1880, 130.0210, 'area_only', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  ('座敷童ゆかりの旅館街', 'zashiki-warashi-yado',
   '東北地方では座敷童（ざしきわらし）伝承が今も語られる旅館・古民家があるとされます。本ページは民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '岩手県', 'iwate', '二戸市', '二戸市金田一温泉周辺',
   40.2980, 141.3290, 'area_only', 'ホテル跡', 'hotel',
   1, 0, 0, false, false, 'published'),

  ('八甲田山周辺', 'hakkoda-area',
   '八甲田山は冬期の厳しい自然条件と歴史的逸話で知られる山域です。本ページは地理・歴史情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。冬期の入山は極めて危険なため、軽装での訪問は絶対に避けてください。',
   '日本', 'japan', '青森県', 'aomori', '青森市', '青森市〜十和田市境界周辺',
   40.6580, 140.8770, 'area_only', '山・峠', 'mountain-pass',
   4, 0, 0, false, false, 'published'),

  ('恐山', 'osorezan',
   '青森県下北半島の霊場として古くから信仰を集めてきた場所で、独特の景観で知られる山岳信仰の地です。本ページは民俗・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。霊場ですので参拝マナーを守ってください。',
   '日本', 'japan', '青森県', 'aomori', 'むつ市', 'むつ市田名部宇曽利山',
   41.3260, 141.1010, 'approximate', '神社・寺', 'shrine-temple',
   2, 0, 0, false, false, 'published'),

  ('那智の滝周辺', 'nachi-falls-area',
   '熊野信仰の中心の一つ、那智の滝周辺は古来より霊地として知られる場所です。本ページは民俗・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '和歌山県', 'wakayama', '那智勝浦町', '那智勝浦町那智山',
   33.6700, 135.8910, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  ('血の池地獄周辺', 'chinoike-jigoku',
   '別府地獄めぐりの一つ「血の池地獄」は、その独特な色と地名から古くから様々な伝承が語られてきた観光地です。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '大分県', 'oita', '別府市', '別府市野田',
   33.3300, 131.5040, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  ('白虎隊自刃の地・飯盛山', 'iimoriyama',
   '会津・飯盛山は幕末の歴史で知られる場所で、地元では歴史にまつわる伝承・物語が語り継がれてきた地域です。本ページは歴史・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '福島県', 'fukushima', '会津若松市', '会津若松市一箕町',
   37.5040, 139.9450, 'approximate', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  ('琵琶湖・葛籠尾崎沖', 'biwako-tsuzurao',
   '琵琶湖北部の葛籠尾崎沖は、湖底遺跡・湖水伝承で知られる場所です。本ページは考古・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。湖上活動は十分な装備と知識をもって行ってください。',
   '日本', 'japan', '滋賀県', 'shiga', '長浜市', '長浜市湖北町沖',
   35.4710, 136.1500, 'area_only', '水辺・ダム', 'water',
   2, 0, 0, false, false, 'published'),

  ('清滝トンネル', 'kiyotaki-tunnel',
   '京都の山間部にあるとされるトンネルとして、地元では古くから怪談・噂が語られてきた場所です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '京都府', 'kyoto', '京都市右京区', '京都市右京区嵯峨清滝',
   35.0420, 135.6520, 'approximate', 'トンネル', 'tunnel',
   3, 0, 0, false, false, 'published'),

  ('道後温泉本館裏路地', 'dogo-ura',
   '愛媛・道後温泉本館周辺は、古くから様々な伝承・物語の舞台として語られてきた歴史ある温泉街です。本ページは民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '愛媛県', 'ehime', '松山市', '松山市道後湯之町',
   33.8520, 132.7860, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('安達ヶ原・黒塚', 'adachigahara-kurozuka',
   '福島県二本松に伝わる「安達ヶ原の鬼婆」伝承の地として知られる場所です。本ページは民俗・伝承情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '福島県', 'fukushima', '二本松市', '二本松市安達ヶ原',
   37.6010, 140.4180, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published');

-- ========== 海外（民俗・著名スポット） ==========
insert into public.spots
  (name, slug, description, country, country_slug, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  -- USA
  ('スタンリー・ホテル', 'stanley-hotel',
   'コロラド州エステス・パークにあるスタンリー・ホテルは、スティーヴン・キング「シャイニング」の着想元として広く知られる歴史あるリゾートホテルです。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   'アメリカ合衆国', 'usa', 'コロラド州', 'colorado', 'エステス・パーク', 'Estes Park, Colorado, USA',
   40.3826, -105.5217, 'approximate', 'ホテル跡', 'hotel',
   2, 0, 0, false, false, 'published'),

  ('セーラム（魔女裁判史跡群）', 'salem-witch-sites',
   'マサチューセッツ州セーラムは17世紀の魔女裁判で世界的に知られる歴史都市で、関連史跡・博物館が点在しています。本ページは歴史・観光情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'マサチューセッツ州', 'massachusetts', 'セーラム', 'Salem, Massachusetts, USA',
   42.5197, -70.8955, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('アルカトラズ島', 'alcatraz',
   'サンフランシスコ湾のアルカトラズ島は、かつての連邦刑務所跡で現在は観光名所となっている島です。本ページは歴史・観光情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   'アメリカ合衆国', 'usa', 'カリフォルニア州', 'california', 'サンフランシスコ', 'Alcatraz Island, San Francisco Bay, USA',
   37.8270, -122.4230, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  ('ウェイバリーヒルズ・サナトリウム', 'waverly-hills',
   'ケンタッキー州ルイビルの旧サナトリウム建築物として知られる歴史的建造物です。本ページは公開情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。',
   'アメリカ合衆国', 'usa', 'ケンタッキー州', 'kentucky', 'ルイビル', 'Louisville, Kentucky, USA',
   38.1100, -85.8390, 'approximate', '病院跡', 'hospital',
   3, 0, 0, false, false, 'published'),

  ('ニューオーリンズ・ラロー邸', 'lalaurie-mansion',
   'ルイジアナ州ニューオーリンズのフレンチ・クォーターにある歴史的邸宅として、地元の伝承・観光ツアーで広く知られる建物です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'ルイジアナ州', 'louisiana', 'ニューオーリンズ', 'French Quarter, New Orleans, USA',
   29.9590, -90.0640, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- UK
  ('ロンドン塔', 'tower-of-london',
   'ロンドン塔は11世紀から続く歴史的城塞で、英国の歴史にまつわる多くの伝承で知られています。本ページは歴史・観光情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'イングランド', 'england', 'ロンドン', 'Tower of London, London, UK',
   51.5081, -0.0759, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  ('エディンバラ・ヴォルツ', 'edinburgh-vaults',
   'スコットランド・エディンバラ旧市街の地下通路（ヴォルツ）は、地元のゴーストツアーで広く知られる観光地です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'スコットランド', 'scotland', 'エディンバラ', 'South Bridge Vaults, Edinburgh, UK',
   55.9486, -3.1880, 'approximate', '都市伝説', 'urban-legend',
   2, 0, 0, false, false, 'published'),

  ('ボーリー教会跡', 'borley-church',
   'イングランド・エセックスのボーリーは、20世紀初頭以来「英国で最も話題になった」と語られた逸話で知られる地域です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'イングランド', 'england', 'エセックス', 'Borley, Essex, UK',
   52.0660, 0.7220, 'area_only', '神社・寺', 'shrine-temple',
   2, 0, 0, false, false, 'published'),

  ('プラックリー村', 'pluckley-village',
   'イングランド・ケント州のプラックリー村は、地元の民俗伝承で広く知られる村です。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'イングランド', 'england', 'ケント州', 'Pluckley, Kent, UK',
   51.1700, 0.7530, 'area_only', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- Ireland
  ('リープ城', 'leap-castle',
   'アイルランド・オファリー州のリープ城は、地元の伝承・観光ツアーで広く知られる中世の城跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アイルランド', 'ireland', 'オファリー州', 'offaly', 'コオリ', 'Leap Castle, County Offaly, Ireland',
   53.0410, -7.8170, 'approximate', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- Romania
  ('ブラン城', 'bran-castle',
   'ルーマニア・トランシルヴァニア地方のブラン城は、ブラム・ストーカーの小説「ドラキュラ」のイメージで世界的に知られる観光城です。本ページは観光・文学史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'ルーマニア', 'romania', 'ブラショヴ県', 'brasov', 'ブラン', 'Bran Castle, Brașov County, Romania',
   45.5150, 25.3670, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  ('ホイア・バチウの森', 'hoia-baciu',
   'ルーマニア・クルジュ近郊のホイア・バチウの森は、独特の地形と地元の民俗伝承で知られる森林地帯です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'ルーマニア', 'romania', 'クルジュ県', 'cluj', 'クルジュ＝ナポカ', 'Hoia-Baciu Forest, Cluj-Napoca, Romania',
   46.7770, 23.5320, 'area_only', '山・峠', 'mountain-pass',
   2, 0, 0, false, false, 'published'),

  -- Italy
  ('ポヴェーリア島', 'poveglia-island',
   'イタリア・ヴェネツィア潟に浮かぶポヴェーリア島は、歴史的経緯と地元の伝承で知られる小島です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。一般立入は通常制限されています。',
   'イタリア', 'italy', 'ヴェネト州', 'veneto', 'ヴェネツィア', 'Poveglia Island, Venice Lagoon, Italy',
   45.3810, 12.3310, 'exact', '廃墟', 'haikyo',
   3, 0, 0, false, true, 'published'),

  -- France
  ('カタコンブ・ド・パリ', 'catacombes-paris',
   'パリの地下に広がる骨葬墓地「カタコンブ」は、18世紀末以来の歴史を持つ観光遺構です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。一般公開ルート外への立入は禁止されています。',
   'フランス', 'france', 'イル＝ド＝フランス地方', 'ile-de-france', 'パリ', 'Catacombes de Paris, Paris, France',
   48.8338, 2.3324, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, true, 'published'),

  -- Germany
  ('フランケンシュタイン城', 'frankenstein-castle',
   'ドイツ・ヘッセン州ダルムシュタット近郊のフランケンシュタイン城は、地元の伝承と文学的連想で知られる中世の城跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'ドイツ', 'germany', 'ヘッセン州', 'hessen', 'ダルムシュタット', 'Burg Frankenstein, Mühltal, Germany',
   49.7950, 8.6730, 'approximate', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- Czech
  ('セドレツ納骨堂', 'sedlec-ossuary',
   'チェコ・クトナー・ホラのセドレツ納骨堂は、約4万人分の遺骨で内装が装飾された歴史的礼拝堂として広く知られる観光地です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'チェコ', 'czech', '中央ボヘミア州', 'central-bohemia', 'クトナー・ホラ', 'Sedlec Ossuary, Kutná Hora, Czech Republic',
   49.9610, 15.2890, 'exact', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- Mexico
  ('人形島', 'isla-de-las-munecas',
   'メキシコ・ソチミルコ運河の島々の一つ「人形島」は、無数の人形で知られる観光地です。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'メキシコ', 'mexico', 'メキシコシティ', 'cdmx', 'ソチミルコ', 'Isla de las Muñecas, Xochimilco, Mexico',
   19.2860, -99.0960, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- India
  ('バンガル要塞', 'bhangarh-fort',
   'インド・ラージャスターン州のバンガル要塞は、地元の伝承で広く知られる中世の城塞跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。日没後の立入は制限されています。',
   'インド', 'india', 'ラージャスターン州', 'rajasthan', 'バンガル', 'Bhangarh Fort, Rajasthan, India',
   27.0950, 76.2880, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, true, 'published'),

  -- Thailand
  ('メーナーク廟周辺', 'mae-nak-shrine',
   'タイ・バンコクの「メーナーク・プラカノン」廟は、タイで最も有名な民間伝承の一つに関連する寺院です。本ページは民俗・観光情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'タイ', 'thailand', 'バンコク都', 'bangkok', 'バンコク', 'Mae Nak Shrine, Phra Khanong, Bangkok',
   13.7080, 100.6010, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- Taiwan
  ('民雄鬼屋', 'minxiong-haunted-house',
   '台湾・嘉義県民雄郷の旧劉家洋楼は、地元の伝承で知られる歴史的洋館跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '台湾', 'taiwan', '嘉義県', 'chiayi', '民雄郷', 'Old Liu Family Mansion, Minxiong, Chiayi',
   23.5510, 120.4280, 'approximate', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published');

-- 統計再計算
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;
-- =====================================================================
-- 心霊マップ - seed_v2.sql
-- 第2弾シード：日本40件 + 海外20件 = 60件追加（合計約110件）
-- 全て手書き・公知の地名/伝承名のみ・独自テンプレート文
-- 事件・事故・死亡事実の断定は一切なし
-- =====================================================================

-- ========== 日本 追加40件（都道府県カバー拡充） ==========
insert into public.spots
  (name, slug, description, country, country_slug, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  -- 北海道
  ('北見・常呂川沿いの旧道', 'tokoro-old-road',
   '北海道北見市を流れる常呂川沿いの旧道として、地元では古くから旅人の伝承が語られてきた地域です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '北海道', 'hokkaido', '北見市', '北見市常呂川流域',
   43.7990, 143.8990, 'area_only', '道路', 'road',
   2, 0, 0, false, false, 'published'),

  ('小樽・天狗山周辺', 'otaru-tenguyama',
   '北海道小樽市の天狗山は、市街地を見下ろす展望地として知られると同時に、天狗信仰にまつわる地名として伝承が語られてきた山です。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '北海道', 'hokkaido', '小樽市', '小樽市天狗山周辺',
   43.1830, 140.9930, 'approximate', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  -- 秋田
  ('生保内・抱返り渓谷', 'dakigaeri-keikoku',
   '秋田県仙北市の抱返り渓谷は、エメラルド色の渓流と神秘的な景観で知られる景勝地です。古くから渓流にまつわる民俗伝承が語られてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '秋田県', 'akita', '仙北市', '仙北市田沢湖卒田',
   39.6680, 140.7090, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 山形
  ('山寺・立石寺周辺', 'risshakuji-area',
   '山形・立石寺（通称「山寺」）は松尾芭蕉の句で広く知られる古刹で、山岳信仰の地として古くから多くの伝承を持つ寺院です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '山形県', 'yamagata', '山形市', '山形市山寺',
   38.3140, 140.4350, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- 群馬
  ('赤城山・大沼周辺', 'akagi-onuma',
   '群馬県前橋市の赤城山山頂部の大沼は、古来より赤城信仰の中心地として知られる火口湖です。地元では古くから多くの民俗伝承が伝えられてきました。本ページは民俗・観光情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '群馬県', 'gunma', '前橋市', '前橋市富士見町赤城山',
   36.5500, 139.1820, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  ('伊勢崎・華蔵寺公園', 'isesaki-kezoji',
   '群馬県伊勢崎市の華蔵寺公園は、地元で親しまれる公園として知られる場所です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '群馬県', 'gunma', '伊勢崎市', '伊勢崎市華蔵寺町',
   36.3220, 139.2090, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  -- 栃木
  ('日光・霧降高原', 'kirifuri-kogen',
   '栃木県日光市の霧降高原は、その名の通り霧が立ち込めやすい高原で、独特の景観で知られる観光地です。本ページは観光・地理情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '栃木県', 'tochigi', '日光市', '日光市霧降高原',
   36.7920, 139.6180, 'approximate', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  -- 茨城
  ('袋田の滝周辺', 'fukuroda-falls',
   '茨城県大子町の袋田の滝は、日本三名瀑の一つに数えられる名瀑で、古くから多くの伝承が語り継がれてきた景勝地です。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '茨城県', 'ibaraki', '大子町', '久慈郡大子町袋田',
   36.7480, 140.4080, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 新潟
  ('佐渡・宿根木', 'sadogashima-shukunegi',
   '新潟県佐渡市の宿根木は、江戸期の廻船業で栄えた歴史的集落として、独自の民俗文化を持つ地域です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '新潟県', 'niigata', '佐渡市', '佐渡市宿根木',
   37.8430, 138.2470, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('魚沼・銀山平', 'ginzan-daira-niigata',
   '新潟県魚沼市の奥只見湖周辺、銀山平は、廃鉱と山岳の独特な歴史を持つ地域です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '新潟県', 'niigata', '魚沼市', '魚沼市銀山平',
   37.1530, 139.2510, 'area_only', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- 富山
  ('黒部峡谷・宇奈月', 'kurobe-unazuki',
   '富山県黒部市の黒部峡谷は、深い谷と急峻な地形で知られる景勝地で、多くの自然伝承が語り継がれてきた地域です。本ページは観光・地理情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '富山県', 'toyama', '黒部市', '黒部市宇奈月',
   36.8210, 137.5990, 'approximate', '水辺・ダム', 'water',
   2, 0, 0, false, false, 'published'),

  -- 石川
  ('輪島・千枚田周辺', 'wajima-senmaida',
   '石川県輪島市の白米千枚田は、能登半島の海岸沿いに広がる棚田で、世界農業遺産にも認定された景勝地です。古くから地元では多くの伝承が語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '石川県', 'ishikawa', '輪島市', '輪島市白米町',
   37.3500, 136.7980, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 福井
  ('永平寺周辺', 'eiheiji-area',
   '福井県永平寺町の曹洞宗大本山永平寺は、深い山中にある古刹で、独特の宗教的雰囲気を持つ霊場です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。参拝マナーをお守りください。',
   '日本', 'japan', '福井県', 'fukui', '永平寺町', '吉田郡永平寺町志比',
   36.0570, 136.3550, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- 山梨
  ('河口湖・産屋ヶ崎', 'ubuyagasaki',
   '山梨県富士河口湖町の河口湖北岸、産屋ヶ崎は富士山を望む景勝地として知られる岬です。地元では古くから様々な伝承が語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '山梨県', 'yamanashi', '富士河口湖町', '南都留郡富士河口湖町',
   35.5240, 138.7510, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 静岡
  ('蓮華寺池公園', 'rengeji-park',
   '静岡県藤枝市の蓮華寺池公園は、地元で親しまれる公園として知られる場所です。本ページは公開情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '静岡県', 'shizuoka', '藤枝市', '藤枝市若王子',
   34.8580, 138.2580, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  ('伊豆・浄蓮の滝', 'jorenfalls',
   '静岡県伊豆市の浄蓮の滝は、伊豆を代表する名瀑で、石川さゆりの歌で広く知られる観光地です。地元では古くから滝にまつわる伝承が語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '静岡県', 'shizuoka', '伊豆市', '伊豆市湯ヶ島',
   34.8780, 138.9230, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 愛知
  ('犬山・寂光院', 'jakkoin-inuyama',
   '愛知県犬山市の寂光院（継鹿尾山）は、紅葉の名所として知られる古刹で、山岳信仰の歴史を持つ寺院です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '愛知県', 'aichi', '犬山市', '犬山市継鹿尾杉ノ段',
   35.3850, 136.9800, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- 岐阜
  ('飛騨・千光寺', 'senkoji-hida',
   '岐阜県高山市の千光寺は、円空仏で知られる古刹で、山中にひっそりと佇む独特の雰囲気を持つ寺院です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '岐阜県', 'gifu', '高山市', '高山市丹生川町',
   36.2280, 137.3380, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('養老の滝周辺', 'yoro-falls',
   '岐阜県養老町の養老の滝は、孝行伝説で広く知られる名瀑です。地元では古くから多くの民俗伝承が語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '岐阜県', 'gifu', '養老町', '養老郡養老町',
   35.3060, 136.5380, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 三重
  ('伊勢神宮・五十鈴川', 'isuzugawa',
   '三重県伊勢市を流れる五十鈴川は、伊勢神宮の御手洗場として古来より神聖な川として位置付けられてきた水域です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '三重県', 'mie', '伊勢市', '伊勢市宇治館町',
   34.4550, 136.7250, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- 奈良
  ('大神神社・三輪山', 'omiwa-shrine',
   '奈良県桜井市の大神神社は、三輪山自体を御神体とする古い神社で、日本最古級の神社として知られています。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '奈良県', 'nara', '桜井市', '桜井市三輪',
   34.5290, 135.8530, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('十津川・果無集落', 'hatenashi',
   '奈良県十津川村の果無集落は、奥深い山中に位置する集落で、熊野古道沿いに位置する独特の景観を持つ地域です。本ページは観光・地理情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '奈良県', 'nara', '十津川村', '吉野郡十津川村',
   33.9080, 135.7770, 'approximate', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  -- 鳥取
  ('鳥取砂丘・浦富海岸', 'tottori-uradome',
   '鳥取県岩美町の浦富海岸は、リアス式海岸の景勝地として知られる海域です。地元では古くから海にまつわる伝承が語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '鳥取県', 'tottori', '岩美町', '岩美郡岩美町',
   35.6010, 134.3160, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 島根
  ('出雲・須佐神社', 'susa-jinja',
   '島根県出雲市の須佐神社は、須佐之男命を祀る古社で、出雲神話の中心地のひとつとして知られています。本ページは観光・神話情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '島根県', 'shimane', '出雲市', '出雲市佐田町',
   35.2380, 132.6900, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('石見銀山・大久保間歩', 'iwami-okubo',
   '島根県大田市の石見銀山は、世界遺産に登録された歴史的銀鉱山で、多くの坑道跡が現存しています。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '島根県', 'shimane', '大田市', '大田市大森町',
   35.1110, 132.4350, 'approximate', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- 岡山
  ('鬼ノ城', 'kinojo',
   '岡山県総社市の鬼ノ城は、桃太郎伝説の舞台のひとつとされる古代山城跡として知られる遺跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '岡山県', 'okayama', '総社市', '総社市奥坂',
   34.7180, 133.7660, 'approximate', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- 広島
  ('厳島神社周辺', 'itsukushima',
   '広島県廿日市市の厳島神社は、海上に建つ朱塗りの大鳥居で世界的に知られる世界遺産です。古くから神聖な島として位置付けられてきました。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '広島県', 'hiroshima', '廿日市市', '廿日市市宮島町',
   34.2960, 132.3200, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- 山口
  ('秋吉台・秋芳洞', 'akiyoshido',
   '山口県美祢市の秋芳洞は、日本最大級の鍾乳洞で、独特の地下景観で知られる観光地です。地下の異世界感は多くの伝承を生んできました。本ページは観光・地理情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '山口県', 'yamaguchi', '美祢市', '美祢市秋芳町',
   34.2280, 131.3050, 'approximate', '山・峠', 'mountain-pass',
   1, 0, 0, false, false, 'published'),

  -- 徳島
  ('祖谷のかずら橋', 'iya-kazura-bashi',
   '徳島県三好市の祖谷渓谷にあるかずら橋は、シラクチカズラで作られた歴史的な吊り橋で、平家落人伝説の地として知られています。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '徳島県', 'tokushima', '三好市', '三好市西祖谷山村',
   33.8400, 133.8480, 'approximate', '橋', 'bridge',
   1, 0, 0, false, false, 'published'),

  -- 香川
  ('栗林公園', 'ritsurin-koen',
   '香川県高松市の栗林公園は、江戸時代に造営された歴史ある大名庭園で、多くの逸話と歴史を持つ国指定の特別名勝です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '香川県', 'kagawa', '高松市', '高松市栗林町',
   34.3290, 134.0440, 'approximate', '公園', 'park',
   1, 0, 0, false, false, 'published'),

  -- 高知
  ('桂浜・浦戸城跡', 'urado-castle',
   '高知県高知市の浦戸城跡は、長宗我部氏の居城跡として知られる歴史的城跡です。桂浜の絶景とともに、多くの歴史的逸話を持つ場所です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '高知県', 'kochi', '高知市', '高知市浦戸',
   33.4970, 133.5760, 'approximate', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- 佐賀
  ('武雄温泉・楼門', 'takeo-onsen',
   '佐賀県武雄市の武雄温泉は、1300年の歴史を持つとされる温泉で、独特の楼門で知られる歴史的温泉地です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '佐賀県', 'saga', '武雄市', '武雄市武雄町',
   33.1990, 130.0150, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- 長崎
  ('長崎・軍艦島', 'gunkanjima',
   '長崎県長崎市の端島（通称軍艦島）は、かつて炭鉱で栄えた海上の人工島で、現在は無人化し独特の景観で世界遺産に登録されている廃墟群です。本ページは観光・歴史情報をもとに作成した初期データであり、事件・事故・死亡事実などを断定するものではありません。立入は許可されたツアーのみです。',
   '日本', 'japan', '長崎県', 'nagasaki', '長崎市', '長崎市高島町端島',
   32.6280, 129.7380, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, true, 'published'),

  -- 熊本
  ('熊本城・本丸', 'kumamoto-castle',
   '熊本県熊本市の熊本城は、加藤清正により築城された日本三名城のひとつで、長い歴史と多くの逸話を持つ城郭です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '熊本県', 'kumamoto', '熊本市', '熊本市中央区本丸',
   32.8060, 130.7060, 'exact', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- 宮崎
  ('高千穂峡', 'takachiho-kyo',
   '宮崎県高千穂町の高千穂峡は、神話の里として知られる景勝地で、天孫降臨伝説の舞台のひとつとされています。本ページは観光・神話情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '宮崎県', 'miyazaki', '高千穂町', '西臼杵郡高千穂町',
   32.7150, 131.3050, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  -- 鹿児島
  ('屋久島・縄文杉周辺', 'jomon-sugi',
   '鹿児島県屋久島町の縄文杉は、推定樹齢数千年とされる屋久島の象徴的な巨木で、世界自然遺産の中心的存在です。本ページは観光・自然情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '鹿児島県', 'kagoshima', '屋久島町', '熊毛郡屋久島町',
   30.2950, 130.5210, 'approximate', '山・峠', 'mountain-pass',
   2, 0, 0, false, false, 'published'),

  -- 沖縄
  ('斎場御嶽', 'seifa-utaki',
   '沖縄県南城市の斎場御嶽は、琉球王国時代から続く沖縄最高の聖地として知られる御嶽（うたき）で、世界遺産に登録されている宗教文化遺産です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。参拝マナーをお守りください。',
   '日本', 'japan', '沖縄県', 'okinawa', '南城市', '南城市知念久手堅',
   26.1690, 127.8270, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('沖縄・首里城跡', 'shurijo',
   '沖縄県那覇市の首里城は、琉球王国の王城として500年以上の歴史を持つ城跡で、世界遺産に登録された琉球文化の象徴的存在です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '沖縄県', 'okinawa', '那覇市', '那覇市首里',
   26.2170, 127.7190, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- その他追加
  ('箱根・芦ノ湖', 'ashinoko',
   '神奈川県箱根町の芦ノ湖は、富士山を望む景勝地として観光客に親しまれる湖です。古くから湖にまつわる伝承も語り継がれてきました。本ページは観光・民俗情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '神奈川県', 'kanagawa', '箱根町', '足柄下郡箱根町',
   35.2030, 139.0070, 'approximate', '水辺・ダム', 'water',
   1, 0, 0, false, false, 'published'),

  ('鎌倉・化粧坂', 'kewaizaka',
   '神奈川県鎌倉市の化粧坂（けわいざか）は、鎌倉七口のひとつに数えられる古い切通しで、歴史的な伝承を持つ場所です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '日本', 'japan', '神奈川県', 'kanagawa', '鎌倉市', '鎌倉市扇ガ谷',
   35.3260, 139.5430, 'approximate', '道路', 'road',
   1, 0, 0, false, false, 'published');

-- ========== 海外 追加20件 ==========
insert into public.spots
  (name, slug, description, country, country_slug, prefecture, prefecture_slug, city, address_public,
   lat, lng, location_precision, category, category_slug,
   danger_level, scary_score, review_count, is_private_property, is_entry_prohibited, status)
values
  -- USA 追加
  ('ニューオーリンズ・聖ルイス墓地', 'st-louis-cemetery',
   'ルイジアナ州ニューオーリンズの聖ルイス墓地は、地上墓所が特徴的な歴史ある墓地で、地元の伝承で広く知られる観光地です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'ルイジアナ州', 'louisiana', 'ニューオーリンズ', 'St. Louis Cemetery, New Orleans',
   29.9590, -90.0710, 'approximate', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('サバンナ歴史地区', 'savannah-historic',
   'ジョージア州サバンナの歴史地区は、植民地時代からの古い建築物が残る街並みで、多くの観光ゴーストツアーが開催される地域として知られます。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'ジョージア州', 'georgia', 'サバンナ', 'Savannah Historic District, Georgia',
   32.0810, -81.0910, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('クイーン・メリー号', 'queen-mary-ship',
   'カリフォルニア州ロングビーチに係留されている旧豪華客船クイーン・メリー号は、現在ホテル・観光施設として運営される歴史的客船で、多くの伝承を持つことで知られます。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'カリフォルニア州', 'california', 'ロングビーチ', 'Queen Mary, Long Beach',
   33.7530, -118.1900, 'exact', 'ホテル跡', 'hotel',
   1, 0, 0, false, false, 'published'),

  ('オクラホマ・グラントヒル墓地', 'grant-hill-cemetery',
   '米国オクラホマ州の古い墓地として、地元の歴史と伝承で知られる地域の一つです。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'オクラホマ州', 'oklahoma', 'グラントヒル', 'Grant Hill area, Oklahoma',
   35.5000, -97.5000, 'area_only', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  ('オハイオ州立刑務所跡', 'ohio-state-reformatory',
   'オハイオ州マンスフィールドの旧オハイオ州立刑務所は、映画『ショーシャンクの空に』のロケ地として知られる歴史的建造物です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アメリカ合衆国', 'usa', 'オハイオ州', 'ohio', 'マンスフィールド', 'Ohio State Reformatory, Mansfield',
   40.7740, -82.5340, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- UK 追加
  ('ヨーク・シャンブルズ通り', 'york-shambles',
   '英国ノース・ヨークシャー、ヨークのシャンブルズ通りは中世建築が残る歴史的商店街で、地元の観光ゴーストツアーで知られる地域です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'イングランド', 'england', 'ヨーク', 'The Shambles, York',
   53.9590, -1.0810, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  ('チリンガム城', 'chillingham-castle',
   '英国ノーサンバーランドのチリンガム城は、地元の伝承と観光ツアーで広く知られる中世の城です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'イングランド', 'england', 'ノーサンバーランド', 'Chillingham Castle, Northumberland',
   55.5260, -1.9100, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- Scotland
  ('グラームス城', 'glamis-castle',
   'スコットランド・アンガス州のグラームス城は、シェイクスピア『マクベス』の舞台のひとつとして知られる中世の城で、王室と縁深い歴史を持ちます。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'イギリス', 'uk', 'スコットランド', 'scotland', 'アンガス', 'Glamis Castle, Angus',
   56.6240, -3.0010, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- Ireland
  ('キルキー古城跡', 'duckett-grove',
   'アイルランド・カーロー州のダケッツ・グローブは、19世紀の邸宅跡として地元で広く知られる廃墟です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'アイルランド', 'ireland', 'カーロー州', 'carlow', 'カーロー', 'Duckett''s Grove, County Carlow',
   52.8000, -6.8390, 'approximate', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- Germany
  ('ベルリン・テンペルホーフ空港跡', 'tempelhof-airport',
   'ドイツ・ベルリンのテンペルホーフ空港は、20世紀の歴史的航空遺産で、現在は公園として開放されている広大な廃旧空港です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'ドイツ', 'germany', 'ベルリン', 'berlin', 'ベルリン', 'Tempelhof, Berlin',
   52.4730, 13.4030, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  ('ハイデルベルク城', 'heidelberg-castle',
   'ドイツ・バーデン＝ヴュルテンベルク州のハイデルベルク城は、ライン地方の代表的城跡として知られる歴史的建造物です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'ドイツ', 'germany', 'バーデン＝ヴュルテンベルク州', 'baden-wuerttemberg', 'ハイデルベルク', 'Heidelberg Castle',
   49.4100, 8.7150, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- France
  ('モン・サン＝ミシェル', 'mont-saint-michel',
   'フランス・ノルマンディーのモン・サン＝ミシェルは、潮の干満で島になる修道院として世界遺産に登録された霊場です。本ページは観光・宗教情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'フランス', 'france', 'ノルマンディー地方', 'normandy', 'マンシュ県', 'Mont-Saint-Michel',
   48.6360, -1.5110, 'exact', '神社・寺', 'shrine-temple',
   1, 0, 0, false, false, 'published'),

  -- Czech
  ('プラハ城', 'prague-castle',
   'チェコ共和国の首都プラハにあるプラハ城は、9世紀から続く歴史的城塞で、ボヘミア王・神聖ローマ皇帝・チェコ大統領の居城として多くの歴史的逸話を持ちます。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'チェコ', 'czech', 'プラハ', 'prague', 'プラハ', 'Prague Castle',
   50.0900, 14.4000, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- Korea
  ('景福宮', 'gyeongbokgung',
   '韓国・ソウルの景福宮は、朝鮮王朝の正宮として14世紀末に創建された王宮で、多くの歴史的逸話を持つ韓国を代表する古宮です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '韓国', 'korea', 'ソウル特別市', 'seoul', 'ソウル', 'Gyeongbokgung Palace, Seoul',
   37.5790, 126.9770, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- China
  ('故宮博物院（紫禁城）', 'forbidden-city',
   '中国・北京の紫禁城は、明・清両王朝の宮殿として500年以上の歴史を持つ世界遺産で、多くの伝承と歴史的逸話を持つ広大な宮殿群です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   '中国', 'china', '北京市', 'beijing', '北京', 'Forbidden City, Beijing',
   39.9170, 116.3970, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published'),

  -- Philippines
  ('マニラ・サンチャゴ要塞', 'fort-santiago',
   'フィリピン・マニラのサンチャゴ要塞は、スペイン植民地時代の歴史的要塞跡で、フィリピン国民的英雄ホセ・リサールゆかりの地として知られる史跡です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'フィリピン', 'philippines', 'メトロ・マニラ', 'metro-manila', 'マニラ', 'Fort Santiago, Manila',
   14.5950, 120.9700, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- Indonesia
  ('ジャカルタ・コタトゥア', 'kota-tua-jakarta',
   'インドネシア・ジャカルタのコタトゥア（旧市街）は、オランダ植民地時代の建築物が残る歴史地区で、多くの観光ツアーで知られる地域です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'インドネシア', 'indonesia', 'ジャカルタ首都特別州', 'jakarta', 'ジャカルタ', 'Kota Tua, Jakarta',
   -6.1350, 106.8130, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- Australia
  ('ポート・アーサー史跡', 'port-arthur',
   'オーストラリア・タスマニア州のポート・アーサー史跡は、19世紀の流刑植民地跡として世界遺産に登録された歴史的遺構です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'オーストラリア', 'australia', 'タスマニア州', 'tasmania', 'ポート・アーサー', 'Port Arthur Historic Site',
   -43.1470, 147.8520, 'exact', '廃墟', 'haikyo',
   2, 0, 0, false, false, 'published'),

  -- Canada
  ('オールド・ケベック', 'old-quebec',
   'カナダ・ケベック州の旧市街オールド・ケベックは、北米唯一の城壁都市として世界遺産に登録された歴史地区で、多くの観光ツアーが開催される地域です。本ページは観光・歴史情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'カナダ', 'canada', 'ケベック州', 'quebec', 'ケベック市', 'Old Quebec',
   46.8120, -71.2070, 'approximate', '都市伝説', 'urban-legend',
   1, 0, 0, false, false, 'published'),

  -- Mexico追加
  ('チチェン・イッツァ', 'chichen-itza',
   'メキシコ・ユカタン州のチチェン・イッツァは、マヤ文明の代表的遺跡として世界遺産に登録された壮大な古代都市跡です。多くの宗教儀礼が行われた地として、深い文化史を持ちます。本ページは観光・考古学情報をもとに作成した初期データであり、内容の真偽を保証するものではありません。',
   'メキシコ', 'mexico', 'ユカタン州', 'yucatan', 'ティヌム', 'Chichén Itzá, Yucatán',
   20.6840, -88.5680, 'exact', '廃墟', 'haikyo',
   1, 0, 0, false, false, 'published');

-- 統計再計算
do $$
declare r record;
begin
  for r in select id from public.spots loop
    perform public.recalc_spot_stats(r.id);
  end loop;
end$$;
