create DATABASE tugasmodul45;
use tugasmodul45;

CREATE TABLE petugas(
id_petugas VARCHAR (10) PRIMARY KEY NOT NULL,
username VARCHAR(15) NOT NULL,
password VARCHAR(15) NOT NULL,
nama VARCHAR(25) NOT NULL
);

CREATE TABLE buku(
kode_buku VARCHAR (10) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

CREATE TABLE anggota(
id_anggota VARCHAR (10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);

CREATE TABLE pengembalian(
kode_kembali VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
kode_buku VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

CREATE TABLE peminjaman(
kode_peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
id_anggota VARCHAR(10) NOT NULL,
id_petugas VARCHAR(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku VARCHAR(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

-- Input data --
INSERT INTO petugas (id_petugas, username, password, nama) VALUES 
('PTG001', 'sarah_connor', 'terminator', 'Sarah Connor'),
('PTG002', 'bruce_wayne', 'batman', 'Bruce Wayne'),
('PTG003', 'clark_kent', 'superman', 'Clark Kent'),
('PTG004', 'peter_parker', 'spiderman', 'Peter Parker'),
('PTG005', 'tony_stark', 'ironman', 'Tony Stark');


INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku)
VALUES 
('BK01', 'Atomic Habits', 'James Clear', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Self-help'),
('BK02', 'Sapiens: Riwayat Singkat Umat Manusia', 'Yuval Noah Harari', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Sejarah'),
('BK03', 'Homo Deus: Riwayat Singkat Masa Depan', 'Yuval Noah Harari', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Futurologi'),
('BK04', 'Kim Ji-Yeong Lahir Tahun 1982', 'Cho Nam-Joo', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Feminisme'),
('BK05', 'Layangan Putus', 'Mommy ASF', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Roman'),
('BK06', 'Luka dan Lara', 'Tere Liye', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Roman'),
('BK07', 'Orang-Orang Biasa', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK08', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK09', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2023', '1', 'Tersedia', 'Fiksi-Inspiratif'),
('BK010', 'Kereta Api di Langit Malam', 'Tere Liye', 'Gramedia Pustaka Utama', '2023', '1', 'Tersedia', 'Fiksi-Fantasi');


INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam)
VALUES 
('A01', 'Adinda van der Berg', '2020', 'Jakarta', '1998-05-15', '081234567890', 'Perempuan', 'Meminjam'),
('A02', 'Budi Susanto', '2021', 'Yogyakarta', '1999-08-20', '081234567891', 'Laki-laki', 'Tidak Meminjam'),
('A03', 'Citra Sari', '2019', 'Bandung', '1997-12-10', '081234567892', 'Perempuan', 'Meminjam'),
('A04', 'David Tanaka', '2022', 'Surabaya', '2000-03-25', '081234567893', 'Laki-laki', 'Tidak Meminjam'),
('A05', 'Eva Wijaya', '2020', 'Semarang', '1998-01-05', '081234567894', 'Perempuan', 'Meminjam'),
('A06', 'Fransiska Hashimoto', '2021', 'Makassar', '1999-06-30', '081234567895', 'Perempuan', 'Tidak Meminjam'),
('A07', 'Gunawan van den Broek', '2019', 'Medan', '1997-09-12', '081234567896', 'Laki-laki', 'Meminjam'),
('A08', 'Hadi Sutanto', '2022', 'Pekanbaru', '2000-11-18', '081234567897', 'Laki-laki', 'Tidak Meminjam'),
('A09', 'Indra Prasetyo', '2020', 'Denpasar', '1998-04-02', '081234567898', 'Laki-laki', 'Meminjam'),
('A010', 'Jasmine van Acker', '2021', 'Balikpapan', '1999-07-20', '081234567899', 'Perempuan', 'Meminjam');


INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda)
VALUES 
('KMB01', 'A01', 'BK01', 'PTG001', '2024-04-01', '2024-04-07', '0'),
('KMB02', 'A03', 'BK02', 'PTG002', '2024-04-02', '2024-04-08', '0'),
('KMB03', 'A05', 'BK03', 'PTG003', '2024-04-03', '2024-04-09', '0'),
('KMB04', 'A07', 'BK04', 'PTG004', '2024-04-04', '2024-04-10', '0'),
('KMB05', 'A09', 'BK05', 'PTG005', '2024-04-05', '2024-04-11', '0'),
('KMB06', 'A01', 'BK06', 'PTG001', '2024-04-06', '2024-04-12', '0'),
('KMB07', 'A09', 'BK07', 'PTG002', '2024-04-07', '2024-04-13', '0'),
('KMB08', 'A010', 'BK08', 'PTG003', '2024-04-08', '2024-04-14', '0'),
('KMB09', 'A01', 'BK09', 'PTG004', '2024-04-09', '2024-04-15', '0'),
('KMB10', 'A010', 'BK010', 'PTG005', '2024-04-10', '2024-04-16', '0');


INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku)
VALUES 
('PMJ01', 'A01', 'PTG001', '2024-04-01', '2024-04-07', 'BK01'),
('PMJ02', 'A03', 'PTG002', '2024-04-02', '2024-04-08', 'BK02'),
('PMJ03', 'A05', 'PTG003', '2024-04-03', '2024-04-09', 'BK03'),
('PMJ04', 'A07', 'PTG004', '2024-04-04', '2024-04-10', 'BK04'),
('PMJ05', 'A09', 'PTG005', '2024-04-05', '2024-04-11', 'BK05'),
('PMJ06', 'A01', 'PTG001', '2024-04-06', '2024-04-12', 'BK06'),
('PMJ07', 'A09', 'PTG002', '2024-04-07', '2024-04-13', 'BK07'),
('PMJ08', 'A010', 'PTG003', '2024-04-08', '2024-04-14', 'BK08'),
('PMJ09', 'A01', 'PTG004', '2024-04-09', '2024-04-15', 'BK09'),
('PMJ10', 'A010', 'PTG005', '2024-04-10', '2024-04-16', 'BK010'),
('PMJ11', 'A03', 'PTG001', '2024-04-11', '2024-04-16', 'BK03'),
('PMJ12', 'A07', 'PTG002', '2024-04-16', '2024-04-22', 'BK010'),
('PMJ13', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK010'),
('PMJ14', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK07'),
('PMJ15', 'A01', 'PTG005', '2024-04-23', '2024-04-29', 'BK02');

------Soal----------------------------------------------------------------------------------------------------------
-----1-----
CREATE PROCEDURE carikembali(
    INOUT tanggal DATE
)
BEGIN
    SELECT 
        p.kode_kembali,
        p.id_anggota,
        a.nama_anggota,
        p.kode_buku,
        p.id_petugas,
        t.nama AS nama_petugas,
        p.tgl_pinjam,
        p.tgl_kembali,
        p.denda
    FROM 
        pengembalian p
    JOIN 
        anggota a ON p.id_anggota = a.id_anggota
    JOIN 
        petugas t ON p.id_petugas = t.id_petugas
    WHERE 
        p.tgl_kembali = tanggal;
END

SET @tanggal = '2024-04-22';
CALL carikembali(@tanggal);
D

SELECT * FROM pengembalian;
----------------------------------------------------------------------------------------------------------------

-----2----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE tampilanggota(
    INOUT status_pinjaman VARCHAR(30)
)
BEGIN
    SELECT * FROM anggota
    WHERE status_pinjam = status_pinjaman;
END

SET @status_pinjaman = 'Tidak Meminjam';
CALL tampilanggota(@status_pinjaman);

SELECT @status_pinjaman;
----------------------------------------------------------------------------------------------------------------

-----3----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE daftar_anggota(
	out statuspinjam VARCHAR(50))
BEGIN 
	SELECT * FROM anggota 
    WHERE 
        status_pinjam = statuspinjam;
END

SET @statuspinjam = 'Tidak Meminjam';
CALL daftar_anggota(@statuspinjam);

drop PROCEDURE daftar_anggota;
----------------------------------------------------------------------------------------------------------------

-----4----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE inputbuku(
    IN kode_buku INT (10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku VARCHAR(30),
    IN tahun_buku VARCHAR (10),
    IN jumlah_buku VARCHAR (5),
    IN status_buku VARCHAR (10),
    IN klasifikasi_buku VARCHAR (20)
)
BEGIN
    INSERT INTO buku 
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);

    SELECT 'data buku berhasil ditambahkan.' AS 'Message';
END

CALL inputbuku('BK11', 'Marmut Merah Jambu', 'Raditya Dika', 'Gramedia Pustaka Utama', '2015', '4', 'Tersedia', 'Fiksi-Fantasi');
----------------------------------------------------------------------------------------------------------------

-----5----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE hapus_anggota(
	IN kode INT 
)
BEGIN 
	DECLARE periksa VARCHAR(50);
	DECLARE anggota INT;
	
	SELECT COUNT(*) INTO anggota FROM peminjaman WHERE id_anggota = kode;
	
    IF anggota = 0 THEN
	DELETE FROM anggota WHERE id_anggota = kode;
        SET periksa = 'anggota berhasil dihapus';
    ELSE 
        SET periksa = 'anggota gagal dihapus';
    END IF;
    
    SELECT periksa;
END

CALL hapus_anggota('A010');

SELECT * FROM anggota;
----------------------------------------------------------------------------------------------------------------

-----6----------------------------------------------------------------------------------------------------------
CREATE VIEW totalbukudikembali AS
SELECT a.id_anggota, a.nama_anggota, COUNT(*) AS total_dikembalikan
FROM anggota a
INNER JOIN pengembalian p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota;

SELECT * FROM totalbukudikembali;

------------------------------------------------------------------------------------------------------------------

CREATE VIEW petugas_transaksi AS
SELECT t.id_petugas, t.nama, p.tanggal_pinjam, p.tanggal_kembali, COUNT(*) AS jumlah_transaksi
FROM petugas t
RIGHT JOIN peminjaman p ON t.id_petugas = p.id_petugas
GROUP BY t.id_petugas, t.nama
ORDER BY jumlah_transaksi ASC;

SELECT * FROM petugas_transaksi;

------------------------------------------------------------------------------------------------------------------

CREATE VIEW jumlahpinjam AS
SELECT a.id_anggota, a.nama_anggota, COUNT(*) AS jumlah_meminjam
FROM anggota a
LEFT JOIN peminjaman p ON a.id_anggota = p.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
ORDER BY jumlah_meminjam DESC;

SELECT * FROM jumlahpinjam;

----------------------------------------------------------------------------------------------------------------