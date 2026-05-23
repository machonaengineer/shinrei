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
