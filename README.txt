CHANARRA STORE — REKAP ORDER ADMIN

Isi paket:
- index.html: web rekap admin (terpisah dari web order pelanggan)
- supabase-update.sql: update database Supabase untuk nomor WhatsApp dan pengeluaran

FITUR
- Tanggal habis otomatis dihitung dari tanggal order + durasi (mis. 2 Oktober + 3 hari = 5 Oktober).
- Mendukung durasi hari, minggu, bulan, dan tahun; contoh: 3 hari, 2 minggu, 1 bulan, 6 bulan, 1 tahun.
- Tanggal habis masih bisa diedit manual.
- Nomor WhatsApp pelanggan dan tombol WA Reminder dengan pesan pengingat yang sudah diisi otomatis.
- Rekap order, harga jual, modal, keuntungan kotor, status perpanjangan, ekspor CSV.
- Catatan pengeluaran usaha.
- Login admin via Supabase.

LANGKAH PENTING
1. Buka Supabase project yang dipakai web Chanarra Store.
2. Masuk SQL Editor > New query.
3. Salin seluruh isi file supabase-update.sql lalu klik Run. Ini menambahkan kolom dan tabel baru tanpa menghapus order lama.
4. Di index.html, isi SUPABASE_URL dan SUPABASE_ANON_KEY di bagian CONFIG menggunakan Project URL dan anon/public atau publishable key dari Supabase.
   Jangan pernah memakai service_role/secret key di website.
5. Deploy index.html ke situs Netlify TERPISAH dari web order pelanggan.
6. Login menggunakan akun admin Supabase yang sudah ada.

NOMOR WHATSAPP
Masukkan nomor dengan format Indonesia, contoh 081234567890 atau 6281234567890.
Tombol WA Reminder membuka WhatsApp dengan teks pengingat siap kirim; admin tetap menekan tombol kirim sendiri. Pengiriman otomatis tanpa klik memerlukan integrasi WhatsApp Business API.

CATATAN DURASI
Untuk menghitung tanggal otomatis, tulis durasi seperti “3 hari”, “2 minggu”, “1 bulan”, “6 bulan”, atau “1 tahun”. Contoh 2 Oktober + 3 hari menghasilkan 5 Oktober sesuai cara hitung yang diminta. Paket bulanan dihitung dengan menambah bulan kalender.

PESANAN DARI WEB PELANGGAN
Paket ini menyiapkan web admin. Agar order pelanggan masuk otomatis, halaman order pelanggan juga harus diubah untuk menyimpan order ke tabel orders yang sama. Tombol WhatsApp saja tidak menyimpan data otomatis ke database. Jangan bagikan kredensial admin.
