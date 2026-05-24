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
