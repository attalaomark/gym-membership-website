-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 02:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `kelas` int(11) DEFAULT NULL,
  `check_in` enum('yes','no') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_pertama` varchar(255) DEFAULT NULL,
  `nama_akhir` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_pertama`, `nama_akhir`, `password`, `email`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, '$2y$12$gC4iCtAke2M9mQJLRtHZxevYhNLW7lCJlZg/fhEqkgRLW3J2O4feC', 'jenna@gmail.com', '2024-10-06 07:11:17', '2024-10-06 07:11:17'),
(3, 'Sandra', 'Dewi', 'gading69', 'sandra@gmail.com', '2024-10-07 04:30:40', '2024-10-07 04:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_pertama` varchar(255) DEFAULT NULL,
  `nama_akhir` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_paket` int(11) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_berhenti` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_pertama`, `nama_akhir`, `password`, `id_paket`, `tanggal_mulai`, `tanggal_berhenti`, `email`, `created_at`, `updated_at`) VALUES
(2, 'Sika', 'Dewi', 'abc123', 1, '2024-10-01', '2024-11-01', 'shiqa@gmail.com', '2024-10-05 06:31:09', '2024-11-24 19:16:36'),
(3, 'intan', 'nurul', 'gogo12', 1, '2024-08-01', '2024-09-01', 'intan@gmail.com', '2024-10-05 07:31:56', '2024-10-05 07:31:56'),
(5, 'yuni', 'sara', 'hya12', 2, '2024-09-10', NULL, 'yasar@gmail.com', '2024-10-05 09:29:35', '2024-12-14 08:14:57'),
(7, 'rosie', 'ruby', '283bp', 1, '2024-10-09', NULL, 'blakcp@gmail.com', '2024-10-05 09:30:42', '2024-10-05 09:30:42'),
(10, 'shiqa', 'dewi', 'cihuy', 2, '2024-10-09', NULL, 'gogo@gmail.com', '2024-10-06 02:03:51', '2024-10-06 02:03:51'),
(11, 'Nabila', 'Mumtaz', 'Nabila Mumtaz', 2, '2024-01-01', NULL, 'nabila.mumtaz@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(12, 'Janetha', 'Maesha', 'Janetha Maesha', 1, '2024-01-02', NULL, 'janetha.maesha@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(13, 'Attala', 'Omar', 'Attala Omar', 2, '2024-01-03', NULL, 'attala.omar@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(14, 'Sabrina', 'Indy', 'Sabrina Indy', 2, '2024-01-04', NULL, 'sabrina.indy@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(15, 'Chris', 'Matthew', 'Chris Matthew', 1, '2024-01-05', NULL, 'chris.matthew@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(16, 'Lemuel', 'Horas', 'Lemuel Horas', 2, '2024-01-06', NULL, 'lemuel.horas@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(17, 'Ulvi', 'Azzahra', 'Ulvi Azzahra', 1, '0000-00-00', NULL, 'ulvi.azzahra@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(18, 'Adi', 'Jalu', 'Adi Jalu', 2, '2024-01-09', NULL, 'adi.jalu@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(19, 'Patricia', 'Dewinta', 'Patricia Dewinta', 1, '2024-01-12', NULL, 'patricia.dewinta@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(20, 'Muhammad', 'Yahya', 'Muhammad Yahya', 2, '2024-01-13', NULL, 'muhammad.yahya@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(21, 'Rexwald', 'Kamasean', 'Rexwald Kamasean', 1, '2024-01-16', NULL, 'rexwald.kamasean@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(22, 'Pradipta', 'Deska', 'Pradipta Deska', 1, '2024-01-17', NULL, 'pradipta.deska@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(23, 'Mochammad', 'Naufal', 'Mochammad Naufal', 2, '2024-01-18', NULL, 'mochammad.naufal@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(24, 'Andreas', 'Hendra', 'Andreas Hendra', 1, '2024-01-19', NULL, 'andreas.hendra@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(25, 'Verdyan', 'Farrel', 'Verdyan Farrel', 2, '2024-01-20', NULL, 'verdyan.farrel@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(26, 'Zoen', 'Yokhanan', 'Zoen Yokhanan', 2, '2024-01-21', NULL, 'zoen.yokhanan@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(27, 'Ananda', 'Alvin', 'Ananda Alvin', 1, '2024-01-22', NULL, 'ananda.alvin@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(28, 'Muhammad', 'Asafrie', 'Muhammad Asafrie', 2, '2024-01-23', NULL, 'muhammad.asafrie@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(29, 'Khansa', 'Mutiara', 'Khansa Mutiara', 1, '2024-01-24', NULL, 'khansa.mutiara@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(30, 'Fauziah', 'Hamidah', 'Fauziah Hamidah', 2, '2024-01-25', NULL, 'fauziah.hamidah@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26'),
(31, 'Rafli', 'Ramadhan', 'Rafli Ramadhan', 1, '2024-01-26', NULL, 'rafli.ramadhan@gmail.com', '2024-12-14 05:34:26', '2024-12-14 05:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `dim_anggota`
--

CREATE TABLE `dim_anggota` (
  `nama_anggota` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_berhenti` datetime DEFAULT NULL,
  `id_paket` int(11) DEFAULT NULL,
  `id_anggota` int(11) NOT NULL,
  `sk_anggota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_anggota`
--

INSERT INTO `dim_anggota` (`nama_anggota`, `email`, `tanggal_mulai`, `tanggal_berhenti`, `id_paket`, `id_anggota`, `sk_anggota`) VALUES
('Nabila Mumtaz', 'nabila.mumtaz@gmail.com', '2024-01-01 00:00:00', NULL, 2, 1, 0),
('Janetha Maesha', 'janetha.maesha@gmail.com', '2024-01-02 00:00:00', NULL, 1, 2, 0),
('Attala Omar', 'attala.omar@gmail.com', '2024-01-03 00:00:00', NULL, 2, 3, 0),
('Sabrina Indy', 'sabrina.indy@gmail.com', '2024-01-04 00:00:00', NULL, 2, 4, 0),
('Chris Matthew', 'chris.matthew@gmail.com', '2024-01-05 00:00:00', NULL, 2, 5, 0),
('Lemuel Horas', 'lemuel.horas@gmail.com', '2024-01-06 00:00:00', NULL, 2, 6, 0),
('rosie ruby', 'blakcp@gmail.com', '2024-10-09 00:00:00', NULL, 1, 7, 1),
('Ulvi Azzahra', 'ulvi.azzahra@gmail.com', '2024-01-08 00:00:00', NULL, 1, 8, 0),
('Adi Jalu', 'adi.jalu@gmail.com', '2024-01-09 00:00:00', NULL, 2, 9, 0),
('shiqa dewi', 'gogo@gmail.com', '2024-10-09 00:00:00', NULL, 2, 10, 2),
('Rizal Dwi', 'rizal@gmail.com', '2024-10-07 00:00:00', NULL, 2, 11, 4),
('Patricia Dewinta', 'patricia.dewinta@gmail.com', '2024-01-12 00:00:00', NULL, 1, 12, 0),
('Muhammad Yahya', 'muhammad.yahya@gmail.com', '2024-01-13 00:00:00', NULL, 1, 13, 0),
('lisa manoban', 'lisa@gmail.com', '2024-10-01 00:00:00', NULL, 1, 14, 3),
('nismara', 'nismara@gmail.com', '2024-10-07 00:00:00', NULL, 1, 15, 5),
('Rexwald Kamasean', 'rexwald.kamasean@gmail.com', '2024-01-16 00:00:00', NULL, 2, 16, 0),
('Pradipta Deska', 'pradipta.deska@gmail.com', '2024-01-17 00:00:00', NULL, 1, 17, 0),
('Mochammad Naufal', 'mochammad.naufal@gmail.com', '2024-01-18 00:00:00', NULL, 2, 18, 0),
('Andreas Hendra', 'andreas.hendra@gmail.com', '2024-01-19 00:00:00', NULL, 1, 19, 0),
('Verdyan Farrel', 'verdyan.farrel@gmail.com', '2024-01-20 00:00:00', NULL, 2, 20, 0),
('Zoen Yokhanan', 'zoen.yokhanan@gmail.com', '2024-01-21 00:00:00', NULL, 2, 21, 0),
('Ananda Alvin', 'ananda.alvin@gmail.com', '2024-01-22 00:00:00', NULL, 2, 22, 0),
('Muhammad Asafrie', 'muhammad.asafrie@gmail.com', '2024-01-23 00:00:00', NULL, 1, 23, 0),
('Khansa Mutiara', 'khansa.mutiara@gmail.com', '2024-01-24 00:00:00', NULL, 2, 24, 0),
('Fauziah Hamidah', 'fauziah.hamidah@gmail.com', '2024-01-25 00:00:00', NULL, 1, 25, 0),
('Rafli Ramadhan', 'rafli.ramadhan@gmail.com', '2024-01-26 00:00:00', NULL, 2, 26, 0),
('Farah Azzahra', 'farah.azzahra@gmail.com', '2024-01-26 00:00:00', NULL, 1, 27, 0),
('Daffa Rafi', 'daffa.rafi@gmail.com', '2024-01-27 00:00:00', NULL, 2, 28, 0),
('Salsabila Indah', 'salsabila.indah@gmail.com', '2024-01-28 00:00:00', NULL, 3, 29, 0),
('Iqbal Arjuna', 'iqbal.arjuna@gmail.com', '2024-01-29 00:00:00', NULL, 1, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dim_kelas`
--

CREATE TABLE `dim_kelas` (
  `sk_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(225) NOT NULL,
  `nama_pelatih` varchar(225) NOT NULL,
  `slot` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_kelas`
--

INSERT INTO `dim_kelas` (`sk_kelas`, `nama_kelas`, `nama_pelatih`, `slot`, `id_kelas`) VALUES
(1, 'Cardio', 'Dwayne Johnson', 12, 2),
(2, 'HITT', 'Alice  Lee', 5, 3),
(3, 'Yoga', 'Dwayne Johnson', 10, 4),
(4, 'Pilates', 'Alice  Lee', 23, 5),
(5, 'Cardio', 'Dwayne Johnson', 5, 6),
(6, 'asdd', 'Alice  Lee', 222, 7);

-- --------------------------------------------------------

--
-- Table structure for table `fakta_pemesanan`
--

CREATE TABLE `fakta_pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `nama_anggota` varchar(100) NOT NULL,
  `nama_kelas` varchar(100) NOT NULL,
  `sk_pemesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fakta_pemesanan`
--

INSERT INTO `fakta_pemesanan` (`id_pemesanan`, `id_kelas`, `id_anggota`, `check_in`, `nama_anggota`, `nama_kelas`, `sk_pemesanan`) VALUES
(1, 2, 7, '2024-11-25 02:15:32', 'rosie ruby', 'Cardio', 1),
(2, 3, 10, '2024-11-13 17:43:23', 'shiqa dewi', 'HITT', 2),
(3, 4, 14, '2024-11-21 17:43:42', ' lisa manoban', 'Yoga', 3),
(4, 5, 11, '2024-12-03 17:43:52', ' Rizal Dwi', 'Pilates', 4),
(5, 2, 15, '2024-11-17 17:44:01', ' nismara', 'Cardio', 5),
(6, 2, 11, '2024-12-09 17:44:15', ' Rizal Dwi', 'Cardio', 6),
(7, 2, 1, '2024-11-25 02:15:32', 'Nabila Mumtaz', 'Cardio', 7),
(8, 3, 2, '2024-11-13 17:43:23', 'Janetha Maesha', 'HIIT', 8),
(9, 4, 3, '2024-11-21 17:43:42', 'Attala Omar', 'Yoga', 9),
(10, 5, 4, '2024-12-03 17:43:52', 'Sabrina Indy', 'Pilates', 10),
(11, 6, 5, '2024-11-17 17:44:01', 'Chris Matthew', 'Cardio', 11),
(12, 2, 6, '2024-12-09 17:44:15', 'Lemuel Horas', 'Cardio', 12),
(13, 3, 8, '2024-11-20 16:50:45', 'Ulvi Azzahra', 'HIIT', 13),
(14, 4, 9, '2024-11-22 15:22:30', 'Adi Jalu', 'Yoga', 14),
(15, 5, 12, '2024-11-23 18:15:30', 'Patricia Dewinta', 'Pilates', 15),
(16, 6, 13, '2024-12-01 14:30:45', 'Muhammad Yahya', 'Cardio', 16),
(17, 2, 16, '2024-12-05 10:30:00', 'Rexwald Kamasean', 'Cardio', 17),
(18, 3, 17, '2024-12-06 12:00:00', 'Pradipta Deska', 'HIIT', 18),
(19, 4, 18, '2024-12-07 09:45:00', 'Mochammad Naufal', 'Yoga', 19),
(20, 5, 19, '2024-12-08 11:15:30', 'Andreas Hendra', 'Pilates', 20),
(21, 6, 20, '2024-12-09 15:00:45', 'Verdyan Farrel', 'Cardio', 21),
(22, 2, 21, '2024-12-10 10:30:00', 'Zoen Yokhanan', 'Cardio', 22),
(23, 3, 22, '2024-12-11 14:00:00', 'Ananda Alvin', 'HIIT', 23),
(24, 4, 23, '2024-12-12 16:30:00', 'Muhammad Asafrie', 'Yoga', 24),
(25, 5, 24, '2024-12-13 18:15:30', 'Khansa Mutiara', 'Pilates', 25),
(26, 6, 25, '2024-12-14 10:45:00', 'Fauziah Hamidah', 'Cardio', 26),
(27, 2, 26, '2024-12-15 12:30:00', 'Rafli Ramadhan', 'Cardio', 27),
(28, 3, 27, '2024-12-16 11:45:00', 'Farah Azzahra', 'HIIT', 28),
(29, 4, 28, '2024-12-17 14:00:00', 'Daffa Rafi', 'Yoga', 29),
(30, 5, 29, '2024-12-18 16:15:00', 'Salsabila Indah', 'Pilates', 30),
(31, 6, 30, '2024-12-19 10:00:00', 'Iqbal Arjuna', 'Cardio', 31),
(32, 2, 8, '2024-12-20 11:15:00', 'Ulvi Azzahra', 'Cardio', 32),
(33, 3, 13, '2024-12-21 12:45:00', 'Muhammad Yahya', 'HIIT', 33),
(34, 4, 19, '2024-12-22 15:30:00', 'Andreas Hendra', 'Yoga', 34),
(35, 5, 24, '2024-12-23 17:45:00', 'Khansa Mutiara', 'Pilates', 35),
(36, 6, 26, '2024-12-24 14:30:00', 'Rafli Ramadhan', 'Cardio', 36);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pelatih` int(11) DEFAULT NULL,
  `nama_kelas` varchar(255) DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_berakhir` time DEFAULT NULL,
  `aktivitas` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_admin`, `id_pelatih`, `nama_kelas`, `waktu_mulai`, `waktu_berakhir`, `aktivitas`, `tanggal`, `slot`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Cardio', '10:40:22', '11:40:22', '', '2024-10-09', 12, '2024-10-06 09:42:39', '2024-12-14 05:42:21'),
(2, 2, 1, 'HITT', '12:00:22', '12:40:22', '\r\n', '2024-10-01', 5, '2024-10-06 09:42:39', '2024-12-14 05:42:30'),
(3, 2, 2, 'Yoga', '18:00:47', '18:50:47', NULL, '2024-10-11', 10, '2024-10-06 11:35:43', '2024-12-14 05:45:00'),
(4, 2, 1, 'Pilates', '16:00:22', '16:30:47', NULL, '2024-10-15', 23, '2024-10-06 11:35:43', '2024-12-14 05:45:15'),
(5, 2, 2, 'Cardio', '18:00:00', '19:30:00', NULL, NULL, 15, '2024-12-14 05:51:56', '2024-12-14 05:51:56'),
(6, 2, 1, 'asdd', '11:21:00', '12:12:00', NULL, '1111-12-12', 222, '2024-11-24 23:41:57', '2024-12-14 05:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(7, '2024_10_06_080815_create_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `harga`, `deskripsi`, `durasi`, `created_at`, `updated_at`) VALUES
(1, 350000.00, 'monthly', 1, '2024-10-05 05:14:12', '2024-10-05 05:14:12'),
(2, 1250000.00, 'yearly', 12, '2024-10-05 05:14:12', '2024-10-05 05:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `pelatih`
--

CREATE TABLE `pelatih` (
  `id_pelatih` int(11) NOT NULL,
  `nama_pertama` varchar(255) DEFAULT NULL,
  `nama_akhir` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelatih`
--

INSERT INTO `pelatih` (`id_pelatih`, `nama_pertama`, `nama_akhir`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Alice ', 'Lee', 'abc123', 'alice@gmail.com', '2024-10-05 05:21:22', '2024-10-05 06:51:08'),
(2, 'Dwayne', 'Johnson', 'abc234', 'johnson@gmail.com', '2024-10-05 05:21:22', '2024-10-05 06:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `nomor_kartu` varchar(255) DEFAULT NULL,
  `nama_bank` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_anggota`, `id_kelas`, `check_in`, `created_at`, `updated_at`) VALUES
(1, 10, 3, '2024-12-04 12:56:31', '2024-10-06 12:02:48', '2024-12-14 05:56:44'),
(2, 5, 2, NULL, '2024-10-06 05:36:02', '2024-12-14 05:56:57'),
(3, 3, 6, NULL, '2024-10-06 05:36:07', '2024-12-14 05:57:09'),
(4, 3, 5, NULL, '2024-10-06 06:41:49', '2024-12-14 05:57:16'),
(5, 3, 4, NULL, '2024-10-06 06:41:54', '2024-12-14 05:57:20'),
(7, 7, 3, NULL, '2024-10-06 17:35:08', '2024-12-14 05:57:24'),
(8, 11, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(9, 12, 3, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(10, 13, 1, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(11, 14, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(12, 15, 3, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(13, 16, 4, NULL, '2024-12-14 05:56:22', '2024-12-14 05:57:29'),
(14, 17, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(15, 18, 3, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(16, 19, 1, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(17, 20, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(18, 21, 3, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(19, 22, 1, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(20, 23, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(21, 24, 3, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(22, 25, 1, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22'),
(23, 26, 2, NULL, '2024-12-14 05:56:22', '2024-12-14 05:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EvL61VGYNc8O4Jz7LCdOqyDZe0v9LYLIx0mff4e4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnhNaFhZZEYzU2puWUdxTjRta0ptZzRMcHpqdjN3eGNrb2RJd3pEeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732526762),
('jGl2dvPGJMJzU0AddL8yUMMkDlJRQuMwtne4uirM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUY5NUJjRXNGemF1cWFaWlB2V2pweDVFNjdkVDlJYXJ0aVo4bWIxVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732526760),
('OS1YV71tySZ45btfxkJJtJEbvI5sCWJprKm4R45B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielBEV0pmZG5ySkRaaU1nUHQ5bklyTEk0bk5BZG1SR0FYelJ3ZVgxWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732527829),
('VoWXysp1lh1RAgDc3bOLzYPaHZQ2GQhyaUJnMK65', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:132.0) Gecko/20100101 Firefox/132.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEd1ZFNsQ3RndTRValRvSWNwSUVOR1hjN0FlcGhDUDdCcVhCNDkxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732526759);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','anggota') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', '$2y$12$i62oMToLmp9.S18pOXu92etYoLoEiPAS/4Yqr2itgBTG303gPoGk.', 'admin', NULL, NULL),
(2, 'Anggota User', 'anggota@example.com', '$2y$12$FhQ/EGBQc7bWpHSRdmMgt.bprSkFcZBObcH6lI6/tdS3XLLWcpRiW', 'anggota', NULL, NULL),
(3, 'Shiqa', 'shiqa@gmail.com', '$2y$12$i62oMToLmp9.S18pOXu92etYoLoEiPAS/4Yqr2itgBTG303gPoGk.', 'admin', NULL, NULL),
(4, 'Dewi', 'dewi@gmail.com', '$2y$12$i62oMToLmp9.S18pOXu92etYoLoEiPAS/4Yqr2itgBTG303gPoGk.', 'anggota', NULL, NULL),
(5, 'omar', 'omar@gmail.com', '$2y$12$g5Us3BZ7Yk4hD6TRNBrwouQruSpTWCXfKVpp/pjUnhewBWveJMv8u', 'admin', '2024-10-06 02:24:55', '2024-10-06 02:24:55'),
(6, 'shiqa', 'rdewinar@gmail.com', '$2y$12$eZtfisrsb85zDYutwlelsuHMdSVBIAvVNKcr/d.8hWPlQTVwjfgCi', 'admin', '2024-10-06 05:33:01', '2024-10-06 05:33:01'),
(7, 'rashiqa', 'gogo@gmail.com', '$2y$12$sEcP4gHoYCR0tFp64OGsqOE9x1JVBtkUqtV7xtR7bafAwEjaGYcw6', 'admin', '2024-10-06 18:11:01', '2024-10-06 18:11:01'),
(8, 'diatri', 'diatrira18@gmail.com', '$2y$12$JYSoLOfcaLmY77a7elj4OOracEeduAqNMmuipyb2BvHR3FxhYeW6G', 'admin', '2024-10-06 18:19:27', '2024-10-06 18:19:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `kelas` (`kelas`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `dim_anggota`
--
ALTER TABLE `dim_anggota`
  ADD KEY `id_anggota` (`id_anggota`) USING BTREE;

--
-- Indexes for table `dim_kelas`
--
ALTER TABLE `dim_kelas`
  ADD KEY `id_kelas` (`id_kelas`) USING BTREE;

--
-- Indexes for table `fakta_pemesanan`
--
ALTER TABLE `fakta_pemesanan`
  ADD KEY `fk_pemesanan_kelas` (`id_kelas`),
  ADD KEY `fk_pemesanan_anggota` (`id_anggota`),
  ADD KEY `id_pemesanan` (`id_pemesanan`) USING BTREE;

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pelatih` (`id_pelatih`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pelatih`
--
ALTER TABLE `pelatih`
  ADD PRIMARY KEY (`id_pelatih`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pelatih`
--
ALTER TABLE `pelatih`
  MODIFY `id_pelatih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`);

--
-- Constraints for table `fakta_pemesanan`
--
ALTER TABLE `fakta_pemesanan`
  ADD CONSTRAINT `fk_pemesanan_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `dim_anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_pemesanan_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `dim_kelas` (`id_kelas`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_pelatih`) REFERENCES `pelatih` (`id_pelatih`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
