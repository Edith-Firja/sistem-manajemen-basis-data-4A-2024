CREATE DATABASE cobabelajar;
use cobabelajar;

CREATE TABLE mobil(
    id_mobil INT PRIMARY KEY NOT NULL Auto_Increment,
    platno VARCHAR(15) NOT NULL,
    merk VARCHAR(15),
    jenis VARCHAR(15),
    harga_sewa_perhari VARCHAR(15),
);

CREATE TABLE peminjaman(
    id_peminjaman  INT PRIMARY KEY NOT NULL Auto_Increment,
    tgl_pinjam VARCHAR(25) NOT NULL,
    tgl_rencana_kembali VARCHAR(15) NOT NULL,
    total_hari VARCHAR(15) NOT NULL,
    total_bayar VARCHAR(15) NOT NULL,
    tgl_kembali VARCHAR(15) NOT NULL,
    denda VARCHAR(15) NOT NULL
);

CREATE TABLE pelanggan(
    id_pelanggan  INT PRIMARY KEY NOT NULL Auto_Increment,
    nama VARCHAR(25) NOT NULL,
    alamat VARCHAR(15) NOT NULL,
    NIK VARCHAR(15) NOT NULL,
    no_telp VARCHAR(15) NOT NULL,
    jenis_kelamin VARCHAR(2) NOT NULL,
);



