-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2022 at 12:38 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sistem_informasi_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(20) NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `id_spesialis` varchar(255) NOT NULL,
  `hari_praktek` varchar(255) NOT NULL,
  `jam_praktek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_spesialis`, `hari_praktek`, `jam_praktek`) VALUES
('DKT001', 'Drg. Ticha', 'SPS001', 'Rabu', '13.00'),
('DKT002', 'Dr. Elda Oktavia', 'SPS002', 'Selasa', '11.00'),
('DKT003', 'Drg. Yuli', 'SPS001', 'Jumat', '12.00');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `kode_kamar` varchar(11) NOT NULL,
  `nama_kamar` varchar(255) NOT NULL,
  `jenis_kamar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`kode_kamar`, `nama_kamar`, `jenis_kamar`) VALUES
('KMR001', 'Melati12', 'VIP'),
('KMR002', 'Mawar', 'Ekonomi');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kode_obat` varchar(11) NOT NULL,
  `nama_obat` varchar(255) NOT NULL,
  `jenis_obat` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`kode_obat`, `nama_obat`, `jenis_obat`, `harga`) VALUES
('OBT002', 'Obat Sakit Gigi', 'Tablet', '23000'),
('OBT003', 'Obat Magh', 'Sirup', '40000');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(11) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `jenis_kelamin` enum('Laki Laki','Perempuan') NOT NULL,
  `umur` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `umur`, `alamat`, `no_hp`) VALUES
('PSN001', 'Fauzein Mulya Warman', 'Laki Laki', 18, 'jln. Baru Andalas No.18, Simpang Haru\nKota Padang', ' 082283753380'),
('PSN002', 'M. Faris Alfatih Murad', 'Laki Laki', 17, 'Solok', ' 085687987767'),
('PSN003', 'Jumaila', 'Perempuan', 12, 'Jakarta', ' 082434334565');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` varchar(11) NOT NULL,
  `kode_periksa` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL,
  `pembayaran` varchar(255) NOT NULL,
  `kembalian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `kode_periksa`, `harga`, `pembayaran`, `kembalian`) VALUES
('BYR001', 'PRS001', '46000', '50000', '4000'),
('BYR002', 'PRS003', '40000000', '40000000', '0'),
('BYR003', 'PRS002', '23000', '30000', '7000');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `kode_periksa` varchar(11) NOT NULL,
  `id_pasien` varchar(11) NOT NULL,
  `id_dokter` varchar(11) NOT NULL,
  `diagnosa` text NOT NULL,
  `tgl_periksa` date NOT NULL,
  `tindakan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`kode_periksa`, `id_pasien`, `id_dokter`, `diagnosa`, `tgl_periksa`, `tindakan`) VALUES
('PRS001', 'PSN001', 'DKT001', 'Mengalami Gigi Berlobang\nyang sudah cukup besar, dan\nharus segera dibersihkan dan\nditambal', '2022-01-30', 'Rawat Jalan'),
('PRS002', 'PSN002', 'DKT003', 'Cabut Gigi goyang', '2022-01-30', 'Rawat Jalan'),
('PRS003', 'PSN003', 'DKT002', 'Mengalami Sakit Jantung', '2022-01-30', 'Rawat Inap');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `id_rawat_inap` varchar(11) NOT NULL,
  `kode_periksa` varchar(255) NOT NULL,
  `kode_kamar` varchar(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`id_rawat_inap`, `kode_periksa`, `kode_kamar`, `tgl_masuk`, `tgl_keluar`, `harga`) VALUES
('RWI001', 'PRS003', 'KMR001', '2022-01-30', '2022-02-14', '40000000');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `id_rawat_jalan` varchar(11) NOT NULL,
  `kode_periksa` varchar(255) NOT NULL,
  `kode_obat` varchar(11) NOT NULL,
  `jumlah_obat` int(11) NOT NULL,
  `harga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rawat_jalan`
--

INSERT INTO `rawat_jalan` (`id_rawat_jalan`, `kode_periksa`, `kode_obat`, `jumlah_obat`, `harga`) VALUES
('RWJ001', 'PRS001', 'OBT002', 2, '46000'),
('RWJ002', 'PRS002', 'OBT002', 1, '23000');

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id_spesialis` varchar(20) NOT NULL,
  `nama_spesialis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id_spesialis`, `nama_spesialis`) VALUES
('SPS001', 'Spesialis Gigi'),
('SPS002', 'Spesialis Jantung'),
('SPS003', 'Spesialis Anak');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`kode_kamar`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`kode_periksa`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`id_rawat_inap`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`id_rawat_jalan`);

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id_spesialis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
