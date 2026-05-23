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
