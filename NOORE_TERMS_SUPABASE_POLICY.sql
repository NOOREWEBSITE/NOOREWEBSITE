-- NOORE Terms & Conditions - Supabase policies
-- Run this once in Supabase SQL Editor if the website reports a permissions error.
alter table public.site_settings enable row level security;

drop policy if exists "site_settings_public_select" on public.site_settings;
create policy "site_settings_public_select" on public.site_settings
for select to anon, authenticated using (true);

drop policy if exists "site_settings_public_insert" on public.site_settings;
create policy "site_settings_public_insert" on public.site_settings
for insert to anon, authenticated with check (key = 'terms');

drop policy if exists "site_settings_public_update" on public.site_settings;
create policy "site_settings_public_update" on public.site_settings
for update to anon, authenticated using (key = 'terms') with check (key = 'terms');
