-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Jul 2021 pada 04.00
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaanv1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `tahun_terbit` int(4) NOT NULL,
  `id_penerbit` varchar(5) NOT NULL,
  `id_kategori` varchar(5) NOT NULL,
  `stok` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `pengarang`, `tahun_terbit`, `id_penerbit`, `id_kategori`, `stok`) VALUES
('BK001', 'Dunia Indah', 'Darwin', 2011, 'PT001', 'KT001', 8),
('BK002', 'Filsafat X', 'Hartanto', 2018, 'PT002', 'KT003', 4),
('BK005', 'Sejarah 7', 'Suryo', 2018, 'PT002', 'KT004', 7),
('BK006', 'Matematika 7', 'Karya', 2018, 'PT001', 'KT001', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail` varchar(6) NOT NULL,
  `id_buku` varchar(5) NOT NULL,
  `jumlah` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail`, `id_buku`, `jumlah`) VALUES
('DPJ004', 'BK003', '1'),
('DPJ007', 'BK001', '1'),
('DPJ007', 'BK003', '1'),
('DPJ012', 'BK001', '1'),
('DPJ013', 'BK005', '3'),
('DPJ014', 'BK006', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(5) NOT NULL,
  `kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
('KT001', 'Matematika'),
('KT002', 'Bahasa'),
('KT003', 'Filsafat'),
('KT004', 'Sejarah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` varchar(5) NOT NULL,
  `id_detail` varchar(6) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `id_siswa` varchar(5) NOT NULL,
  `id_petugas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_detail`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `id_siswa`, `id_petugas`) VALUES
('PJ002', 'DPJ002', '2021-07-10', '2021-07-12', 'Telah Dikembalikan', 'SI001', 'AD001'),
('PJ003', 'DPJ003', '2021-07-03', '2021-07-04', 'Telah Dikembalikan', 'SI001', 'AD001'),
('PJ004', 'DPJ004', '2021-07-09', '2021-07-14', 'Telah Dikembalikan', 'SI004', 'AD001'),
('PJ005', 'DPJ005', '2021-07-02', '2021-07-03', 'Telah Dikembalikan', 'SI001', 'AD001'),
('PJ006', 'DPJ006', '2021-07-09', '2021-07-10', 'Sedang Dipinjam', 'SI001', 'AD001'),
('PJ007', 'DPJ007', '2021-07-03', '2021-07-05', 'Sedang Dipinjam', 'SI005', 'AD001'),
('PJ008', 'DPJ008', '2021-07-02', '2021-07-03', 'Telah Dikembalikan', 'SI001', 'AD001'),
('PJ009', 'DPJ009', '2021-07-02', '2021-07-04', 'Sedang Dipinjam', 'SI002', 'AD001'),
('PJ010', 'DPJ010', '2021-07-08', '2021-07-11', 'Telah Dikembalikan', 'SI002', 'AD001'),
('PJ011', 'DPJ011', '2021-07-09', '2021-07-15', 'Telah Dikembalikan', 'SI002', 'AD001'),
('PJ012', 'DPJ012', '2021-07-09', '2021-07-10', 'Sedang Dipinjam', 'SI002', 'AD001'),
('PJ013', 'DPJ013', '2021-07-10', '2021-07-12', 'Sedang Dipinjam', 'SI004', 'AD001'),
('PJ014', 'DPJ014', '2021-07-02', '2021-07-04', 'Telah Dikembalikan', 'SI007', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(5) NOT NULL,
  `penerbit` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`) VALUES
('PT001', 'Gramedia'),
('PT002', 'Sinarmas'),
('PT003', 'Duniaku'),
('PT004', 'Uranus'),
('PT005', 'Simas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` varchar(5) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `dikembalikan` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `sanksi` varchar(10) NOT NULL,
  `id_petugas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `tanggal_pinjam`, `tanggal_kembali`, `dikembalikan`, `status`, `sanksi`, `id_petugas`) VALUES
('PJ002', '2021-07-10', '2021-07-12', '2021-07-16', 'Telah Dikembalikan', '8000', 'AD001'),
('PJ004', '2021-07-09', '2021-07-14', '2021-07-17', 'Telah Dikembalikan', '6000', 'AD001'),
('PJ005', '2021-07-02', '2021-07-03', '2021-07-07', 'Telah Dikembalikan', '8000', 'AD001'),
('PJ008', '2021-07-02', '2021-07-03', '2021-07-05', 'Telah Dikembalikan', '4000', 'AD001'),
('PJ010', '2021-07-08', '2021-07-11', '2021-07-11', 'Telah Dikembalikan', '0', 'AD001'),
('PJ011', '2021-07-09', '2021-07-15', '2021-07-16', 'Telah Dikembalikan', '2000', 'AD001'),
('PJ014', '2021-07-02', '2021-07-04', '2021-07-05', 'Telah Dikembalikan', '2000', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(5) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `gender`, `no_telp`, `alamat`, `username`, `password`) VALUES
('admin', 'Farul', 'Pria', '089682125741', 'Jl.Letnan Rantam Kec.Curahdami', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` varchar(5) NOT NULL,
  `nama_siswa` varchar(50) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `no_telp`, `alamat`, `gender`) VALUES
('SI002', 'Bintang', '089682124742', 'Jl.Kembang', 'Pria'),
('SI004', 'Bunga', '089682125748', 'Bondowoso', 'Wanita'),
('SI005', 'Kembang', '089682125750', 'Bondowoso', 'Wanita'),
('SI007', 'Lemon', '089682112222', 'Lumajang', 'Pria');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_penerbit` (`id_penerbit`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD KEY `id_detail` (`id_detail`,`id_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_detail` (`id_detail`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
