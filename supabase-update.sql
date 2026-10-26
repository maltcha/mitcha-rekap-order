-- CHANARRA STORE: jalankan satu kali di Supabase > SQL Editor.
-- Menambahkan nomor WhatsApp ke order lama tanpa menghapus data.
alter table public.orders add column if not exists customer_phone text;

-- Catatan pengeluaran usaha
create table if not exists public.expenses (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  expense_date date not null default current_date,
  title text not null,
  amount numeric(12,0) not null check (amount > 0)
);

alter table public.expenses enable row level security;
drop policy if exists "admin can read expenses" on public.expenses;
drop policy if exists "admin can insert expenses" on public.expenses;
drop policy if exists "admin can update expenses" on public.expenses;
drop policy if exists "admin can delete expenses" on public.expenses;
create policy "admin can read expenses" on public.expenses for select to authenticated using (true);
create policy "admin can insert expenses" on public.expenses for insert to authenticated with check (true);
create policy "admin can update expenses" on public.expenses for update to authenticated using (true) with check (true);
create policy "admin can delete expenses" on public.expenses for delete to authenticated using (true);
grant select, insert, update, delete on public.expenses to authenticated;
