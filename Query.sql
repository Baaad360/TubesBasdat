CREATE DATABASE Toko_Sembako;
-- Gunakan database
USE Toko_Sembako;

-- 1. Tabel TransaksiPenjualan
CREATE TABLE TransaksiPenjualan (
    IdTransaksiPenjualan VARCHAR(255) PRIMARY KEY,
    TanggalTransaksi DATE,
    IdProduk VARCHAR(255),
    HargaSatuan INT(10),
    TotalBiaya INT(20),
    IdPembayaran VARCHAR(255)
);

-- 2. Tabel Produk
CREATE TABLE Produk (
    IdProduk VARCHAR(255) PRIMARY KEY,
    Merek VARCHAR(255),
    Jenis VARCHAR(255),
    IdStok VARCHAR(255),
    Ukuran INT(10),
    Harga INT(10),
    JumlahStok INT(10)
);

-- 3. Tabel Pembayaran
CREATE TABLE Pembayaran (
    IdPembayaran VARCHAR(255) PRIMARY KEY,
    MetodePembayaran VARCHAR(255),
    BuktiPembayaran VARCHAR(255),
    StatusPembayaran VARCHAR(255)
);

-- 4. Tabel StokBarang
CREATE TABLE StokBarang (
    IdStok VARCHAR(255) PRIMARY KEY,
    JumlahBarangMasuk INT(10),
    JumlahBarangKeluar INT(10),
    LevelMinimumStok INT(10)
);

-- 5. Tabel Pelanggan
CREATE TABLE Pelanggan (
    IdPelanggan VARCHAR(255) PRIMARY KEY,
    NamaPelanggan VARCHAR(255),
    DataPelanggan VARCHAR(255),
    IdTransaksiPenjualan VARCHAR(255)
);

-- Tambahkan FOREIGN KEY setelah semua tabel dibuat
ALTER TABLE TransaksiPenjualan
    ADD CONSTRAINT fk_transaksi_produk FOREIGN KEY (IdProduk) REFERENCES Produk(IdProduk) ON DELETE CASCADE,
    ADD CONSTRAINT fk_transaksi_pembayaran FOREIGN KEY (IdPembayaran) REFERENCES Pembayaran(IdPembayaran) ON DELETE CASCADE;

ALTER TABLE Produk
    ADD CONSTRAINT fk_produk_stok FOREIGN KEY (IdStok) REFERENCES StokBarang(IdStok) ON DELETE CASCADE;

ALTER TABLE Pelanggan
    ADD CONSTRAINT fk_pelanggan_transaksi FOREIGN KEY (IdTransaksiPenjualan) REFERENCES TransaksiPenjualan(IdTransaksiPenjualan) ON DELETE CASCADE;

-- 1. StokBarang
INSERT INTO StokBarang (IdStok, JumlahBarangMasuk, JumlahBarangKeluar, LevelMinimumStok) VALUES
('STK001', 100, 20, 30), ('STK002', 120, 40, 25), ('STK003', 150, 60, 40), ('STK004', 200, 70, 60),
('STK005', 250, 80, 50), ('STK006', 300, 100, 70), ('STK007', 180, 90, 30), ('STK008', 400, 120, 80),
('STK009', 500, 150, 100), ('STK010', 320, 130, 90), ('STK011', 140, 60, 30), ('STK012', 170, 70, 40),
('STK013', 600, 250, 150), ('STK014', 430, 210, 100), ('STK015', 340, 190, 90), ('STK016', 220, 110, 60),
('STK017', 310, 170, 70), ('STK018', 150, 80, 30), ('STK019', 360, 140, 90), ('STK020', 240, 120, 50),
('STK021', 130, 50, 20), ('STK022', 280, 110, 60), ('STK023', 290, 120, 70), ('STK024', 370, 150, 80),
('STK025', 410, 180, 100), ('STK026', 390, 170, 90), ('STK027', 330, 160, 80), ('STK028', 260, 130, 60),
('STK029', 350, 140, 70), ('STK030', 300, 100, 50), ('STK031', 440, 220, 110), ('STK032', 460, 230, 120),
('STK033', 480, 240, 130), ('STK034', 500, 250, 140), ('STK035', 520, 260, 150), ('STK036', 540, 270, 160),
('STK037', 560, 280, 170), ('STK038', 580, 290, 180), ('STK039', 600, 300, 190), ('STK040', 620, 310, 200);

-- 2. Produk
INSERT INTO Produk (IdProduk, Merek, Jenis, IdStok, Ukuran, Harga, JumlahStok) VALUES
('PRD001', 'Indomie', 'Mie Instan', 'STK001', 80, 3000, 70),
('PRD002', 'Bimoli', 'Minyak Goreng', 'STK002', 1000, 15000, 150),
('PRD003', 'Aqua', 'Air Mineral', 'STK003', 1500, 5000, 90),
('PRD004', 'Sedaap', 'Mie Instan', 'STK004', 80, 2800, 60),
('PRD005', 'Tropical', 'Minyak Goreng', 'STK005', 1000, 14000, 200),
('PRD006', 'Le Minerale', 'Air Mineral', 'STK006', 1500, 4800, 100),
('PRD007', 'Royco', 'Bumbu', 'STK007', 25, 1000, 300),
('PRD008', 'Gulaku', 'Gula Pasir', 'STK008', 1000, 13000, 180),
('PRD009', 'Kapal Api', 'Kopi Bubuk', 'STK009', 150, 5000, 110),
('PRD010', 'Sunlight', 'Sabun Cuci', 'STK010', 800, 9000, 75),
('PRD011', 'Frisian Flag', 'Susu Kental', 'STK011', 200, 7000, 90),
('PRD012', 'Roma', 'Biskuit', 'STK012', 300, 8000, 95),
('PRD013', 'ABC', 'Kecap Manis', 'STK013', 600, 12000, 100),
('PRD014', 'So Klin', 'Detergen', 'STK014', 1000, 11000, 105),
('PRD015', 'Downy', 'Pewangi', 'STK015', 400, 9500, 110),
('PRD016', 'Baygon', 'Anti Nyamuk', 'STK016', 500, 15000, 60),
('PRD017', 'Hit', 'Anti Serangga', 'STK017', 250, 13500, 80),
('PRD018', 'Rinso', 'Sabun Cuci', 'STK018', 850, 8900, 130),
('PRD019', 'Mama Lemon', 'Sabun Cuci', 'STK019', 700, 9200, 100),
('PRD020', 'Milo', 'Minuman Serbuk', 'STK020', 400, 11000, 140),
('PRD021', 'Energen', 'Minuman Sereal', 'STK021', 30, 5000, 95),
('PRD022', 'Teh Pucuk', 'Minuman Botol', 'STK022', 350, 4500, 180),
('PRD023', 'Ultra Milk', 'Susu Kotak', 'STK023', 250, 6000, 190),
('PRD024', 'Indomilk', 'Susu Kotak', 'STK024', 250, 5800, 210),
('PRD025', 'Silver Queen', 'Cokelat', 'STK025', 200, 15000, 70),
('PRD026', 'Tango', 'Wafer', 'STK026', 180, 8500, 110),
('PRD027', 'Lays', 'Snack Kentang', 'STK027', 170, 9500, 120),
('PRD028', 'Chitato', 'Snack Kentang', 'STK028', 170, 9700, 130),
('PRD029', 'Top', 'Kopi Sachet', 'STK029', 30, 2000, 300),
('PRD030', 'Good Day', 'Kopi Sachet', 'STK030', 30, 2200, 280),
('PRD031', 'ABC Sari Kacang Hijau', 'Minuman', 'STK031', 250, 5500, 140),
('PRD032', 'Ale-Ale', 'Minuman Botol', 'STK032', 200, 3000, 200),
('PRD033', 'You C1000', 'Minuman Vitamin', 'STK033', 140, 8500, 100),
('PRD034', 'Pocari Sweat', 'Minuman Elektrolit', 'STK034', 350, 9500, 90),
('PRD035', 'Lasegar', 'Minuman Herbal', 'STK035', 200, 4500, 100),
('PRD036', 'Mizone', 'Minuman Isotonik', 'STK036', 500, 7000, 90),
('PRD037', 'Teh Botol Sosro', 'Teh Botol', 'STK037', 350, 6000, 120),
('PRD038', 'Floridina', 'Minuman Jeruk', 'STK038', 360, 5000, 110),
('PRD039', 'Nu Green Tea', 'Minuman Teh', 'STK039', 400, 5500, 130),
('PRD040', 'Nestle Dancow', 'Susu Bubuk', 'STK040', 600, 25000, 60);

-- 3. Pembayaran
INSERT INTO Pembayaran (IdPembayaran, MetodePembayaran, BuktiPembayaran, StatusPembayaran) VALUES
('PMB001', 'Transfer', 'bukti1.jpg', 'Lunas'),
('PMB002', 'Cash', '-', 'Lunas'),
('PMB003', 'QRIS', 'bukti3.jpg', 'Belum Lunas'),
('PMB004', 'Transfer', 'bukti4.jpg', 'Lunas'),
('PMB005', 'Cash', '-', 'Lunas'),
('PMB006', 'QRIS', 'bukti6.jpg', 'Lunas'),
('PMB007', 'Transfer', 'bukti7.jpg', 'Belum Lunas'),
('PMB008', 'Cash', '-', 'Lunas'),
('PMB009', 'QRIS', 'bukti9.jpg', 'Lunas'),
('PMB010', 'Transfer', 'bukti10.jpg', 'Lunas'),
('PMB011', 'QRIS', 'bukti11.jpg', 'Lunas'),
('PMB012', 'Cash', '-', 'Belum Lunas'),
('PMB013', 'Transfer', 'bukti13.jpg', 'Lunas'),
('PMB014', 'QRIS', 'bukti14.jpg', 'Lunas'),
('PMB015', 'Cash', '-', 'Lunas'),
('PMB016', 'QRIS', 'bukti16.jpg', 'Belum Lunas'),
('PMB017', 'Transfer', 'bukti17.jpg', 'Lunas'),
('PMB018', 'Cash', '-', 'Lunas'),
('PMB019', 'QRIS', 'bukti19.jpg', 'Lunas'),
('PMB020', 'Transfer', 'bukti20.jpg', 'Belum Lunas'),
('PMB021', 'Cash', '-', 'Lunas'),
('PMB022', 'QRIS', 'bukti22.jpg', 'Lunas'),
('PMB023', 'Transfer', 'bukti23.jpg', 'Lunas'),
('PMB024', 'QRIS', 'bukti24.jpg', 'Belum Lunas'),
('PMB025', 'Cash', '-', 'Lunas'),
('PMB026', 'QRIS', 'bukti26.jpg', 'Lunas'),
('PMB027', 'Transfer', 'bukti27.jpg', 'Lunas'),
('PMB028', 'Cash', '-', 'Belum Lunas'),
('PMB029', 'QRIS', 'bukti29.jpg', 'Lunas'),
('PMB030', 'Transfer', 'bukti30.jpg', 'Lunas'),
('PMB031', 'Cash', '-', 'Lunas'),
('PMB032', 'QRIS', 'bukti32.jpg', 'Belum Lunas'),
('PMB033', 'Transfer', 'bukti33.jpg', 'Lunas'),
('PMB034', 'Cash', '-', 'Lunas'),
('PMB035', 'QRIS', 'bukti35.jpg', 'Lunas'),
('PMB036', 'Transfer', 'bukti36.jpg', 'Belum Lunas'),
('PMB037', 'Cash', '-', 'Lunas'),
('PMB038', 'QRIS', 'bukti38.jpg', 'Lunas'),
('PMB039', 'Transfer', 'bukti39.jpg', 'Lunas'),
('PMB040', 'Cash', '-', 'Belum Lunas');

-- 4. TransaksiPenjualan
INSERT INTO TransaksiPenjualan (IdTransaksiPenjualan, TanggalTransaksi, IdProduk, HargaSatuan, TotalBiaya, IdPembayaran) VALUES
('TRX001', '2025-06-01', 'PRD001', 3000, 15000, 'PMB001'),
('TRX002', '2025-06-01', 'PRD002', 15000, 30000, 'PMB002'),
('TRX003', '2025-06-02', 'PRD003', 5000, 25000, 'PMB003'),
('TRX004', '2025-06-02', 'PRD004', 2800, 11200, 'PMB004'),
('TRX005', '2025-06-03', 'PRD005', 14000, 28000, 'PMB005'),
('TRX006', '2025-06-03', 'PRD006', 4800, 19200, 'PMB006'),
('TRX007', '2025-06-04', 'PRD007', 1000, 5000, 'PMB007'),
('TRX008', '2025-06-04', 'PRD008', 13000, 26000, 'PMB008'),
('TRX009', '2025-06-05', 'PRD009', 5000, 10000, 'PMB009'),
('TRX010', '2025-06-05', 'PRD010', 9000, 18000, 'PMB010'),
('TRX011', '2025-06-06', 'PRD011', 7000, 14000, 'PMB011'),
('TRX012', '2025-06-06', 'PRD012', 8000, 16000, 'PMB012'),
('TRX013', '2025-06-07', 'PRD013', 12000, 24000, 'PMB013'),
('TRX014', '2025-06-07', 'PRD014', 11000, 22000, 'PMB014'),
('TRX015', '2025-06-08', 'PRD015', 9500, 19000, 'PMB015'),
('TRX016', '2025-06-08', 'PRD016', 15000, 30000, 'PMB016'),
('TRX017', '2025-06-09', 'PRD017', 13500, 27000, 'PMB017'),
('TRX018', '2025-06-09', 'PRD018', 8900, 17800, 'PMB018'),
('TRX019', '2025-06-10', 'PRD019', 9200, 18400, 'PMB019'),
('TRX020', '2025-06-10', 'PRD020', 11000, 22000, 'PMB020'),
('TRX021', '2025-06-11', 'PRD021', 5000, 10000, 'PMB021'),
('TRX022', '2025-06-11', 'PRD022', 4500, 9000, 'PMB022'),
('TRX023', '2025-06-12', 'PRD023', 6000, 12000, 'PMB023'),
('TRX024', '2025-06-12', 'PRD024', 5800, 11600, 'PMB024'),
('TRX025', '2025-06-13', 'PRD025', 15000, 30000, 'PMB025'),
('TRX026', '2025-06-13', 'PRD026', 8500, 17000, 'PMB026'),
('TRX027', '2025-06-14', 'PRD027', 9500, 19000, 'PMB027'),
('TRX028', '2025-06-14', 'PRD028', 9700, 19400, 'PMB028'),
('TRX029', '2025-06-15', 'PRD029', 2000, 6000, 'PMB029'),
('TRX030', '2025-06-15', 'PRD030', 2200, 8800, 'PMB030'),
('TRX031', '2025-06-16', 'PRD031', 5500, 11000, 'PMB031'),
('TRX032', '2025-06-16', 'PRD032', 3000, 9000, 'PMB032'),
('TRX033', '2025-06-17', 'PRD033', 8500, 25500, 'PMB033'),
('TRX034', '2025-06-17', 'PRD034', 9500, 19000, 'PMB034'),
('TRX035', '2025-06-18', 'PRD035', 4500, 9000, 'PMB035'),
('TRX036', '2025-06-18', 'PRD036', 7000, 14000, 'PMB036'),
('TRX037', '2025-06-19', 'PRD037', 6000, 12000, 'PMB037'),
('TRX038', '2025-06-19', 'PRD038', 5000, 15000, 'PMB038'),
('TRX039', '2025-06-20', 'PRD039', 5500, 11000, 'PMB039'),
('TRX040', '2025-06-20', 'PRD040', 25000, 50000, 'PMB040');

-- 5. Pelanggan
INSERT INTO Pelanggan (IdPelanggan, NamaPelanggan, DataPelanggan, IdTransaksiPenjualan) VALUES
('PLG001', 'Andi', '081234567891', 'TRX001'),
('PLG002', 'Budi', '081234567892', 'TRX002'),
('PLG003', 'Citra', '081234567893', 'TRX003'),
('PLG004', 'Dedi', '081234567894', 'TRX004'),
('PLG005', 'Eka', '081234567895', 'TRX005'),
('PLG006', 'Fajar', '081234567896', 'TRX006'),
('PLG007', 'Gina', '081234567897', 'TRX007'),
('PLG008', 'Hari', '081234567898', 'TRX008'),
('PLG009', 'Ika', '081234567899', 'TRX009'),
('PLG010', 'Joko', '081234567800', 'TRX010'),
('PLG011', 'Kiki', '081234567811', 'TRX011'),
('PLG012', 'Lina', '081234567822', 'TRX012'),
('PLG013', 'Made', '081234567833', 'TRX013'),
('PLG014', 'Nina', '081234567844', 'TRX014'),
('PLG015', 'Omar', '081234567855', 'TRX015'),
('PLG016', 'Putri', '081234567866', 'TRX016'),
('PLG017', 'Qori', '081234567877', 'TRX017'),
('PLG018', 'Rudi', '081234567888', 'TRX018'),
('PLG019', 'Sinta', '081234567899', 'TRX019'),
('PLG020', 'Tono', '081234567900', 'TRX020'),
('PLG021', 'Umar', '081234567901', 'TRX021'),
('PLG022', 'Vina', '081234567902', 'TRX022'),
('PLG023', 'Wawan', '081234567903', 'TRX023'),
('PLG024', 'Xena', '081234567904', 'TRX024'),
('PLG025', 'Yoga', '081234567905', 'TRX025'),
('PLG026', 'Zaki', '081234567906', 'TRX026'),
('PLG027', 'Arum', '081234567907', 'TRX027'),
('PLG028', 'Bagus', '081234567908', 'TRX028'),
('PLG029', 'Cahya', '081234567909', 'TRX029'),
('PLG030', 'Dian', '081234567910', 'TRX030'),
('PLG031', 'Erlangga', '081234567911', 'TRX031'),
('PLG032', 'Farah', '081234567912', 'TRX032'),
('PLG033', 'Gilang', '081234567913', 'TRX033'),
('PLG034', 'Hesti', '081234567914', 'TRX034'),
('PLG035', 'Irwan', '081234567915', 'TRX035'),
('PLG036', 'Jihan', '081234567916', 'TRX036'),
('PLG037', 'Kamal', '081234567917', 'TRX037'),
('PLG038', 'Laila', '081234567918', 'TRX038'),
('PLG039', 'Maya', '081234567919', 'TRX039'),
('PLG040', 'Nizar', '081234567920', 'TRX040');
