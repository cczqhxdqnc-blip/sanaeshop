-- Copie TOUT ce fichier dans Supabase > SQL Editor > Run
create table products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null default 'other',
  price numeric not null,
  description text,
  image_url text not null,
  sold boolean not null default false,
  created_at timestamptz not null default now()
);
alter table products enable row level security;
create policy "tout le monde peut voir" on products for select using (true);
create policy "admin ajoute" on products for insert to authenticated with check (true);
create policy "admin modifie" on products for update to authenticated using (true);
create policy "admin supprime" on products for delete to authenticated using (true);

insert into storage.buckets (id, name, public) values ('products', 'products', true);
create policy "admin upload" on storage.objects for insert to authenticated with check (bucket_id = 'products');
create policy "admin delete img" on storage.objects for delete to authenticated using (bucket_id = 'products');
