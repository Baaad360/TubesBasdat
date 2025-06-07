-- 1. Tampilkan semua data produk yang memiliki stok lebih dari 50
SELECT * 
FROM produk 
WHERE JumlahStok > 50;
-- 2. Tampilkan transaksi penjualan yang dilakukan pada tanggal '2025-06-01'
SELECT * 
FROM transaksipenjualan 
WHERE TanggalTransaksi = '2025-06-01';
-- 3. Tampilkan total biaya penjualan per metode pembayaran\
SELECT p.MetodePembayaran, SUM(t.TotalBiaya) AS TotalPenjualan
FROM transaksipenjualan t
JOIN pembayaran p ON t.IdPembayaran = p.IdPembayaran
GROUP BY p.MetodePembayaran;
-- 4. Tampilkan nama pelanggan dan total pengeluarannya
SELECT pl.NamaPelanggan, SUM(tp.TotalBiaya) AS TotalPengeluaran
FROM pelanggan pl
JOIN transaksipenjualan tp ON pl.IdTransaksiPenjualan = tp.IdTransaksiPenjualan
GROUP BY pl.NamaPelanggan;
-- 5. Tampilkan detail transaksi: tanggal, nama pelanggan, merek produk, dan total biaya
SELECT tp.TanggalTransaksi, pl.NamaPelanggan, pr.Merek, tp.TotalBiaya
FROM transaksipenjualan tp
JOIN pelanggan pl ON tp.IdTransaksiPenjualan = pl.IdTransaksiPenjualan
JOIN produk pr ON tp.IdProduk = pr.IdProduk;
-- 6. Tampilkan laporan stok produk lengkap: merek, ukuran, jumlah barang stok, barang keluar, dan level minimum stok
SELECT pr.Merek, pr.Ukuran, sb.JumlahBarangMasuk, sb.JumlahBarangKeluar, sb.LevelMinimumStok
FROM produk pr
JOIN stokbarang sb ON pr.IdStok = sb.IdStok;