-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk project_db_gym
CREATE DATABASE IF NOT EXISTS `project_db_gym` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_db_gym`;

-- membuang struktur untuk table project_db_gym.absensi
CREATE TABLE IF NOT EXISTS `absensi` (
  `id_absensi` int NOT NULL AUTO_INCREMENT,
  `id_anggota` int DEFAULT NULL,
  `kelas` int DEFAULT NULL,
  `check_in` enum('yes','no') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_absensi`),
  KEY `id_anggota` (`id_anggota`),
  KEY `kelas` (`kelas`),
  CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.absensi: ~0 rows (lebih kurang)

-- membuang struktur untuk table project_db_gym.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nama_pertama` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_akhir` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.admin: ~2 rows (lebih kurang)
INSERT INTO `admin` (`id_admin`, `nama_pertama`, `nama_akhir`, `password`, `email`, `created_at`, `updated_at`) VALUES
	(2, NULL, NULL, '$2y$12$gC4iCtAke2M9mQJLRtHZxevYhNLW7lCJlZg/fhEqkgRLW3J2O4feC', 'jenna@gmail.com', '2024-10-06 07:11:17', '2024-10-06 07:11:17'),
	(3, 'Sandra', 'Dewi', 'gading69', 'sandra@gmail.com', '2024-10-07 04:30:40', '2024-10-07 04:30:40');

-- membuang struktur untuk table project_db_gym.anggota
CREATE TABLE IF NOT EXISTS `anggota` (
  `id_anggota` int NOT NULL AUTO_INCREMENT,
  `nama_pertama` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_akhir` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_paket` int DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_berhenti` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_anggota`),
  KEY `id_paket` (`id_paket`),
  CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.anggota: ~26 rows (lebih kurang)
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

-- membuang struktur untuk table project_db_gym.dim_anggota
CREATE TABLE IF NOT EXISTS `dim_anggota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_anggota` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_berhenti` datetime DEFAULT NULL,
  `id_paket` int DEFAULT NULL,
  `id_anggota` int NOT NULL,
  `sk_anggota` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.dim_anggota: ~120 rows (lebih kurang)
INSERT INTO `dim_anggota` (`id`, `nama_anggota`, `email`, `tanggal_mulai`, `tanggal_berhenti`, `id_paket`, `id_anggota`, `sk_anggota`) VALUES
	(1, 'Nabila Mumtaz', 'nabila.mumtaz@gmail.com', '2024-01-01 00:00:00', NULL, 2, 1, 0),
	(2, 'Janetha Maesha', 'janetha.maesha@gmail.com', '2024-01-02 00:00:00', NULL, 1, 2, 0),
	(3, 'Attala Omar', 'attala.omar@gmail.com', '2024-01-03 00:00:00', NULL, 2, 3, 0),
	(4, 'Sabrina Indy', 'sabrina.indy@gmail.com', '2024-01-04 00:00:00', NULL, 2, 4, 0),
	(5, 'Chris Matthew', 'chris.matthew@gmail.com', '2024-01-05 00:00:00', NULL, 2, 5, 0),
	(6, 'Lemuel Horas', 'lemuel.horas@gmail.com', '2024-01-06 00:00:00', NULL, 2, 6, 0),
	(7, 'rosie ruby', 'blakcp@gmail.com', '2024-10-09 00:00:00', NULL, 1, 7, 1),
	(8, 'Ulvi Azzahra', 'ulvi.azzahra@gmail.com', '2024-01-08 00:00:00', NULL, 1, 8, 0),
	(9, 'Adi Jalu', 'adi.jalu@gmail.com', '2024-01-09 00:00:00', NULL, 2, 9, 0),
	(10, 'shiqa dewi', 'gogo@gmail.com', '2024-10-09 00:00:00', NULL, 2, 10, 2),
	(11, 'Rizal Dwi', 'rizal@gmail.com', '2024-10-07 00:00:00', NULL, 2, 11, 4),
	(12, 'Patricia Dewinta', 'patricia.dewinta@gmail.com', '2024-01-12 00:00:00', NULL, 1, 12, 0),
	(13, 'Muhammad Yahya', 'muhammad.yahya@gmail.com', '2024-01-13 00:00:00', NULL, 1, 13, 0),
	(14, 'lisa manoban', 'lisa@gmail.com', '2024-10-01 00:00:00', NULL, 1, 14, 3),
	(15, 'nismara', 'nismara@gmail.com', '2024-10-07 00:00:00', NULL, 1, 15, 5),
	(16, 'Rexwald Kamasean', 'rexwald.kamasean@gmail.com', '2024-01-16 00:00:00', NULL, 2, 16, 0),
	(17, 'Pradipta Deska', 'pradipta.deska@gmail.com', '2024-01-17 00:00:00', NULL, 1, 17, 0),
	(18, 'Mochammad Naufal', 'mochammad.naufal@gmail.com', '2024-01-18 00:00:00', NULL, 2, 18, 0),
	(19, 'Andreas Hendra', 'andreas.hendra@gmail.com', '2024-01-19 00:00:00', NULL, 1, 19, 0),
	(20, 'Verdyan Farrel', 'verdyan.farrel@gmail.com', '2024-01-20 00:00:00', NULL, 2, 20, 0),
	(21, 'Zoen Yokhanan', 'zoen.yokhanan@gmail.com', '2024-01-21 00:00:00', NULL, 2, 21, 0),
	(22, 'Ananda Alvin', 'ananda.alvin@gmail.com', '2024-01-22 00:00:00', NULL, 2, 22, 0),
	(23, 'Muhammad Asafrie', 'muhammad.asafrie@gmail.com', '2024-01-23 00:00:00', NULL, 1, 23, 0),
	(24, 'Khansa Mutiara', 'khansa.mutiara@gmail.com', '2024-01-24 00:00:00', NULL, 2, 24, 0),
	(25, 'Fauziah Hamidah', 'fauziah.hamidah@gmail.com', '2024-01-25 00:00:00', NULL, 1, 25, 0),
	(26, 'Rafli Ramadhan', 'rafli.ramadhan@gmail.com', '2024-01-26 00:00:00', NULL, 2, 26, 0),
	(27, 'Farah Azzahra', 'farah.azzahra@gmail.com', '2024-01-26 00:00:00', NULL, 1, 27, 0),
	(28, 'Daffa Rafi', 'daffa.rafi@gmail.com', '2024-01-27 00:00:00', NULL, 2, 28, 0),
	(29, 'Salsabila Indah', 'salsabila.indah@gmail.com', '2024-01-28 00:00:00', NULL, 3, 29, 0),
	(30, 'Iqbal Arjuna', 'iqbal.arjuna@gmail.com', '2024-01-29 00:00:00', NULL, 1, 30, 0),
	(31, 'Nabila Mumtaz', 'nabila.mumtaz@gmail.com', '2024-01-01 00:00:00', NULL, 2, 1, 0),
	(32, 'Janetha Maesha', 'janetha.maesha@gmail.com', '2024-01-02 00:00:00', NULL, 1, 2, 0),
	(33, 'Attala Omar', 'attala.omar@gmail.com', '2024-01-03 00:00:00', NULL, 2, 3, 0),
	(34, 'Sabrina Indy', 'sabrina.indy@gmail.com', '2024-01-04 00:00:00', NULL, 2, 4, 0),
	(35, 'Chris Matthew', 'chris.matthew@gmail.com', '2024-01-05 00:00:00', NULL, 2, 5, 0),
	(36, 'Lemuel Horas', 'lemuel.horas@gmail.com', '2024-01-06 00:00:00', NULL, 2, 6, 0),
	(37, 'rosie ruby', 'blakcp@gmail.com', '2024-10-09 00:00:00', NULL, 1, 7, 1),
	(38, 'Ulvi Azzahra', 'ulvi.azzahra@gmail.com', '2024-01-08 00:00:00', NULL, 1, 8, 0),
	(39, 'Adi Jalu', 'adi.jalu@gmail.com', '2024-01-09 00:00:00', NULL, 2, 9, 0),
	(40, 'shiqa dewi', 'gogo@gmail.com', '2024-10-09 00:00:00', NULL, 2, 10, 2),
	(41, 'Rizal Dwi', 'rizal@gmail.com', '2024-10-07 00:00:00', NULL, 2, 11, 4),
	(42, 'Patricia Dewinta', 'patricia.dewinta@gmail.com', '2024-01-12 00:00:00', NULL, 1, 12, 0),
	(43, 'Muhammad Yahya', 'muhammad.yahya@gmail.com', '2024-01-13 00:00:00', NULL, 1, 13, 0),
	(44, 'lisa manoban', 'lisa@gmail.com', '2024-10-01 00:00:00', NULL, 1, 14, 3),
	(45, 'nismara', 'nismara@gmail.com', '2024-10-07 00:00:00', NULL, 1, 15, 5),
	(46, 'Rexwald Kamasean', 'rexwald.kamasean@gmail.com', '2024-01-16 00:00:00', NULL, 2, 16, 0),
	(47, 'Pradipta Deska', 'pradipta.deska@gmail.com', '2024-01-17 00:00:00', NULL, 1, 17, 0),
	(48, 'Mochammad Naufal', 'mochammad.naufal@gmail.com', '2024-01-18 00:00:00', NULL, 2, 18, 0),
	(49, 'Andreas Hendra', 'andreas.hendra@gmail.com', '2024-01-19 00:00:00', NULL, 1, 19, 0),
	(50, 'Verdyan Farrel', 'verdyan.farrel@gmail.com', '2024-01-20 00:00:00', NULL, 2, 20, 0),
	(51, 'Zoen Yokhanan', 'zoen.yokhanan@gmail.com', '2024-01-21 00:00:00', NULL, 2, 21, 0),
	(52, 'Ananda Alvin', 'ananda.alvin@gmail.com', '2024-01-22 00:00:00', NULL, 2, 22, 0),
	(53, 'Muhammad Asafrie', 'muhammad.asafrie@gmail.com', '2024-01-23 00:00:00', NULL, 1, 23, 0),
	(54, 'Khansa Mutiara', 'khansa.mutiara@gmail.com', '2024-01-24 00:00:00', NULL, 2, 24, 0),
	(55, 'Fauziah Hamidah', 'fauziah.hamidah@gmail.com', '2024-01-25 00:00:00', NULL, 1, 25, 0),
	(56, 'Rafli Ramadhan', 'rafli.ramadhan@gmail.com', '2024-01-26 00:00:00', NULL, 2, 26, 0),
	(57, 'Farah Azzahra', 'farah.azzahra@gmail.com', '2024-01-26 00:00:00', NULL, 1, 27, 0),
	(58, 'Daffa Rafi', 'daffa.rafi@gmail.com', '2024-01-27 00:00:00', NULL, 2, 28, 0),
	(59, 'Salsabila Indah', 'salsabila.indah@gmail.com', '2024-01-28 00:00:00', NULL, 3, 29, 0),
	(60, 'Iqbal Arjuna', 'iqbal.arjuna@gmail.com', '2024-01-29 00:00:00', NULL, 1, 30, 0),
	(61, 'Nabila Mumtaz', 'nabila.mumtaz@gmail.com', '2024-01-01 00:00:00', NULL, 2, 1, 0),
	(62, 'Janetha Maesha', 'janetha.maesha@gmail.com', '2024-01-02 00:00:00', NULL, 1, 2, 0),
	(63, 'Attala Omar', 'attala.omar@gmail.com', '2024-01-03 00:00:00', NULL, 2, 3, 0),
	(64, 'Sabrina Indy', 'sabrina.indy@gmail.com', '2024-01-04 00:00:00', NULL, 2, 4, 0),
	(65, 'Chris Matthew', 'chris.matthew@gmail.com', '2024-01-05 00:00:00', NULL, 2, 5, 0),
	(66, 'Lemuel Horas', 'lemuel.horas@gmail.com', '2024-01-06 00:00:00', NULL, 2, 6, 0),
	(67, 'rosie ruby', 'blakcp@gmail.com', '2024-10-09 00:00:00', NULL, 1, 7, 1),
	(68, 'Ulvi Azzahra', 'ulvi.azzahra@gmail.com', '2024-01-08 00:00:00', NULL, 1, 8, 0),
	(69, 'Adi Jalu', 'adi.jalu@gmail.com', '2024-01-09 00:00:00', NULL, 2, 9, 0),
	(70, 'shiqa dewi', 'gogo@gmail.com', '2024-10-09 00:00:00', NULL, 2, 10, 2),
	(71, 'Rizal Dwi', 'rizal@gmail.com', '2024-10-07 00:00:00', NULL, 2, 11, 4),
	(72, 'Patricia Dewinta', 'patricia.dewinta@gmail.com', '2024-01-12 00:00:00', NULL, 1, 12, 0),
	(73, 'Muhammad Yahya', 'muhammad.yahya@gmail.com', '2024-01-13 00:00:00', NULL, 1, 13, 0),
	(74, 'lisa manoban', 'lisa@gmail.com', '2024-10-01 00:00:00', NULL, 1, 14, 3),
	(75, 'nismara', 'nismara@gmail.com', '2024-10-07 00:00:00', NULL, 1, 15, 5),
	(76, 'Rexwald Kamasean', 'rexwald.kamasean@gmail.com', '2024-01-16 00:00:00', NULL, 2, 16, 0),
	(77, 'Pradipta Deska', 'pradipta.deska@gmail.com', '2024-01-17 00:00:00', NULL, 1, 17, 0),
	(78, 'Mochammad Naufal', 'mochammad.naufal@gmail.com', '2024-01-18 00:00:00', NULL, 2, 18, 0),
	(79, 'Andreas Hendra', 'andreas.hendra@gmail.com', '2024-01-19 00:00:00', NULL, 1, 19, 0),
	(80, 'Verdyan Farrel', 'verdyan.farrel@gmail.com', '2024-01-20 00:00:00', NULL, 2, 20, 0),
	(81, 'Zoen Yokhanan', 'zoen.yokhanan@gmail.com', '2024-01-21 00:00:00', NULL, 2, 21, 0),
	(82, 'Ananda Alvin', 'ananda.alvin@gmail.com', '2024-01-22 00:00:00', NULL, 2, 22, 0),
	(83, 'Muhammad Asafrie', 'muhammad.asafrie@gmail.com', '2024-01-23 00:00:00', NULL, 1, 23, 0),
	(84, 'Khansa Mutiara', 'khansa.mutiara@gmail.com', '2024-01-24 00:00:00', NULL, 2, 24, 0),
	(85, 'Fauziah Hamidah', 'fauziah.hamidah@gmail.com', '2024-01-25 00:00:00', NULL, 1, 25, 0),
	(86, 'Rafli Ramadhan', 'rafli.ramadhan@gmail.com', '2024-01-26 00:00:00', NULL, 2, 26, 0),
	(87, 'Farah Azzahra', 'farah.azzahra@gmail.com', '2024-01-26 00:00:00', NULL, 1, 27, 0),
	(88, 'Daffa Rafi', 'daffa.rafi@gmail.com', '2024-01-27 00:00:00', NULL, 2, 28, 0),
	(89, 'Salsabila Indah', 'salsabila.indah@gmail.com', '2024-01-28 00:00:00', NULL, 3, 29, 0),
	(90, 'Iqbal Arjuna', 'iqbal.arjuna@gmail.com', '2024-01-29 00:00:00', NULL, 1, 30, 0),
	(91, 'Nabila Mumtaz', 'nabila.mumtaz@gmail.com', '2024-01-01 00:00:00', NULL, 2, 1, 0),
	(92, 'Janetha Maesha', 'janetha.maesha@gmail.com', '2024-01-02 00:00:00', NULL, 1, 2, 0),
	(93, 'Attala Omar', 'attala.omar@gmail.com', '2024-01-03 00:00:00', NULL, 2, 3, 0),
	(94, 'Sabrina Indy', 'sabrina.indy@gmail.com', '2024-01-04 00:00:00', NULL, 2, 4, 0),
	(95, 'Chris Matthew', 'chris.matthew@gmail.com', '2024-01-05 00:00:00', NULL, 2, 5, 0),
	(96, 'Lemuel Horas', 'lemuel.horas@gmail.com', '2024-01-06 00:00:00', NULL, 2, 6, 0),
	(97, 'rosie ruby', 'blakcp@gmail.com', '2024-10-09 00:00:00', NULL, 1, 7, 1),
	(98, 'Ulvi Azzahra', 'ulvi.azzahra@gmail.com', '2024-01-08 00:00:00', NULL, 1, 8, 0),
	(99, 'Adi Jalu', 'adi.jalu@gmail.com', '2024-01-09 00:00:00', NULL, 2, 9, 0),
	(100, 'shiqa dewi', 'gogo@gmail.com', '2024-10-09 00:00:00', NULL, 2, 10, 2),
	(101, 'Rizal Dwi', 'rizal@gmail.com', '2024-10-07 00:00:00', NULL, 2, 11, 4),
	(102, 'Patricia Dewinta', 'patricia.dewinta@gmail.com', '2024-01-12 00:00:00', NULL, 1, 12, 0),
	(103, 'Muhammad Yahya', 'muhammad.yahya@gmail.com', '2024-01-13 00:00:00', NULL, 1, 13, 0),
	(104, 'lisa manoban', 'lisa@gmail.com', '2024-10-01 00:00:00', NULL, 1, 14, 3),
	(105, 'nismara', 'nismara@gmail.com', '2024-10-07 00:00:00', NULL, 1, 15, 5),
	(106, 'Rexwald Kamasean', 'rexwald.kamasean@gmail.com', '2024-01-16 00:00:00', NULL, 2, 16, 0),
	(107, 'Pradipta Deska', 'pradipta.deska@gmail.com', '2024-01-17 00:00:00', NULL, 1, 17, 0),
	(108, 'Mochammad Naufal', 'mochammad.naufal@gmail.com', '2024-01-18 00:00:00', NULL, 2, 18, 0),
	(109, 'Andreas Hendra', 'andreas.hendra@gmail.com', '2024-01-19 00:00:00', NULL, 1, 19, 0),
	(110, 'Verdyan Farrel', 'verdyan.farrel@gmail.com', '2024-01-20 00:00:00', NULL, 2, 20, 0),
	(111, 'Zoen Yokhanan', 'zoen.yokhanan@gmail.com', '2024-01-21 00:00:00', NULL, 2, 21, 0),
	(112, 'Ananda Alvin', 'ananda.alvin@gmail.com', '2024-01-22 00:00:00', NULL, 2, 22, 0),
	(113, 'Muhammad Asafrie', 'muhammad.asafrie@gmail.com', '2024-01-23 00:00:00', NULL, 1, 23, 0),
	(114, 'Khansa Mutiara', 'khansa.mutiara@gmail.com', '2024-01-24 00:00:00', NULL, 2, 24, 0),
	(115, 'Fauziah Hamidah', 'fauziah.hamidah@gmail.com', '2024-01-25 00:00:00', NULL, 1, 25, 0),
	(116, 'Rafli Ramadhan', 'rafli.ramadhan@gmail.com', '2024-01-26 00:00:00', NULL, 2, 26, 0),
	(117, 'Farah Azzahra', 'farah.azzahra@gmail.com', '2024-01-26 00:00:00', NULL, 1, 27, 0),
	(118, 'Daffa Rafi', 'daffa.rafi@gmail.com', '2024-01-27 00:00:00', NULL, 2, 28, 0),
	(119, 'Salsabila Indah', 'salsabila.indah@gmail.com', '2024-01-28 00:00:00', NULL, 3, 29, 0),
	(120, 'Iqbal Arjuna', 'iqbal.arjuna@gmail.com', '2024-01-29 00:00:00', NULL, 1, 30, 0);

-- membuang struktur untuk table project_db_gym.dim_kelas
CREATE TABLE IF NOT EXISTS `dim_kelas` (
  `sk_kelas` int NOT NULL,
  `nama_kelas` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pelatih` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `slot` int NOT NULL,
  `id_kelas` int NOT NULL,
  KEY `id_kelas` (`id_kelas`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.dim_kelas: ~24 rows (lebih kurang)
INSERT INTO `dim_kelas` (`sk_kelas`, `nama_kelas`, `nama_pelatih`, `slot`, `id_kelas`) VALUES
	(1, 'Cardio', 'Dwayne Johnson', 12, 2),
	(2, 'HITT', 'Alice  Lee', 5, 3),
	(3, 'Yoga', 'Dwayne Johnson', 10, 4),
	(4, 'Pilates', 'Alice  Lee', 23, 5),
	(5, 'Cardio', 'Dwayne Johnson', 5, 6),
	(6, 'asdd', 'Alice  Lee', 222, 7),
	(1, 'Cardio', 'Dwayne Johnson', 12, 2),
	(2, 'HITT', 'Alice  Lee', 5, 3),
	(3, 'Yoga', 'Dwayne Johnson', 10, 4),
	(4, 'Pilates', 'Alice  Lee', 23, 5),
	(5, 'Cardio', 'Dwayne Johnson', 5, 6),
	(6, 'asdd', 'Alice  Lee', 222, 7),
	(1, 'Cardio', 'Dwayne Johnson', 12, 2),
	(2, 'HITT', 'Alice  Lee', 5, 3),
	(3, 'Yoga', 'Dwayne Johnson', 10, 4),
	(4, 'Pilates', 'Alice  Lee', 23, 5),
	(5, 'Cardio', 'Dwayne Johnson', 5, 6),
	(6, 'asdd', 'Alice  Lee', 222, 7),
	(1, 'Cardio', 'Dwayne Johnson', 12, 2),
	(2, 'HITT', 'Alice  Lee', 5, 3),
	(3, 'Yoga', 'Dwayne Johnson', 10, 4),
	(4, 'Pilates', 'Alice  Lee', 23, 5),
	(5, 'Cardio', 'Dwayne Johnson', 5, 6),
	(6, 'asdd', 'Alice  Lee', 222, 7);

-- membuang struktur untuk table project_db_gym.fakta_pemesanan
CREATE TABLE IF NOT EXISTS `fakta_pemesanan` (
  `id_pemesanan` int NOT NULL,
  `id_kelas` int NOT NULL,
  `id_anggota` int NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `nama_anggota` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kelas` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sk_pemesanan` int NOT NULL,
  KEY `fk_pemesanan_kelas` (`id_kelas`),
  KEY `fk_pemesanan_anggota` (`id_anggota`),
  KEY `id_pemesanan` (`id_pemesanan`) USING BTREE,
  CONSTRAINT `fk_pemesanan_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `dim_anggota` (`id_anggota`),
  CONSTRAINT `fk_pemesanan_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `dim_kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.fakta_pemesanan: ~0 rows (lebih kurang)
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
	(36, 6, 26, '2024-12-24 14:30:00', 'Rafli Ramadhan', 'Cardio', 36),
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
	(36, 6, 26, '2024-12-24 14:30:00', 'Rafli Ramadhan', 'Cardio', 36),
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
	(36, 6, 26, '2024-12-24 14:30:00', 'Rafli Ramadhan', 'Cardio', 36),
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

-- membuang struktur untuk table project_db_gym.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `id_admin` int DEFAULT NULL,
  `id_pelatih` int DEFAULT NULL,
  `nama_kelas` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_berakhir` time DEFAULT NULL,
  `aktivitas` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `slot` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kelas`),
  KEY `id_admin` (`id_admin`),
  KEY `id_pelatih` (`id_pelatih`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_pelatih`) REFERENCES `pelatih` (`id_pelatih`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.kelas: ~0 rows (lebih kurang)
INSERT INTO `kelas` (`id_kelas`, `id_admin`, `id_pelatih`, `nama_kelas`, `waktu_mulai`, `waktu_berakhir`, `aktivitas`, `tanggal`, `slot`, `created_at`, `updated_at`) VALUES
	(1, 2, 2, 'Cardio', '10:40:22', '11:40:22', '', '2024-10-09', 12, '2024-10-06 09:42:39', '2024-12-14 05:42:21'),
	(2, 2, 1, 'HITT', '12:00:22', '12:40:22', '\r\n', '2024-10-01', 5, '2024-10-06 09:42:39', '2024-12-14 05:42:30'),
	(3, 2, 2, 'Yoga', '18:00:47', '18:50:47', NULL, '2024-10-11', 10, '2024-10-06 11:35:43', '2024-12-14 05:45:00'),
	(4, 2, 1, 'Pilates', '16:00:22', '16:30:47', NULL, '2024-10-15', 23, '2024-10-06 11:35:43', '2024-12-14 05:45:15'),
	(5, 2, 2, 'Cardio', '18:00:00', '19:30:00', NULL, NULL, 15, '2024-12-14 05:51:56', '2024-12-14 05:51:56'),
	(6, 2, 1, 'asdd', '11:21:00', '12:12:00', NULL, '1111-12-12', 222, '2024-11-24 23:41:57', '2024-12-14 05:43:35');

-- membuang struktur untuk table project_db_gym.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel project_db_gym.migrations: ~4 rows (lebih kurang)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '0001_01_01_000000_create_users_table', 1),
	(5, '0001_01_01_000001_create_cache_table', 1),
	(6, '0001_01_01_000002_create_jobs_table', 1),
	(7, '2024_10_06_080815_create_users_table', 2);

-- membuang struktur untuk table project_db_gym.paket
CREATE TABLE IF NOT EXISTS `paket` (
  `id_paket` int NOT NULL AUTO_INCREMENT,
  `harga` decimal(10,2) DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `durasi` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paket`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.paket: ~2 rows (lebih kurang)
INSERT INTO `paket` (`id_paket`, `harga`, `deskripsi`, `durasi`, `created_at`, `updated_at`) VALUES
	(1, 350000.00, 'monthly', 1, '2024-10-05 05:14:12', '2024-10-05 05:14:12'),
	(2, 1250000.00, 'yearly', 12, '2024-10-05 05:14:12', '2024-10-05 05:14:12');

-- membuang struktur untuk table project_db_gym.pelatih
CREATE TABLE IF NOT EXISTS `pelatih` (
  `id_pelatih` int NOT NULL AUTO_INCREMENT,
  `nama_pertama` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_akhir` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pelatih`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.pelatih: ~2 rows (lebih kurang)
INSERT INTO `pelatih` (`id_pelatih`, `nama_pertama`, `nama_akhir`, `password`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'Alice ', 'Lee', 'abc123', 'alice@gmail.com', '2024-10-05 05:21:22', '2024-10-05 06:51:08'),
	(2, 'Dwayne', 'Johnson', 'abc234', 'johnson@gmail.com', '2024-10-05 05:21:22', '2024-10-05 06:51:22');

-- membuang struktur untuk table project_db_gym.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_anggota` int DEFAULT NULL,
  `nomor_kartu` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_bank` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pembayaran`),
  KEY `id_anggota` (`id_anggota`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.pembayaran: ~0 rows (lebih kurang)

-- membuang struktur untuk table project_db_gym.pemesanan
CREATE TABLE IF NOT EXISTS `pemesanan` (
  `id_pemesanan` int NOT NULL AUTO_INCREMENT,
  `id_anggota` int DEFAULT NULL,
  `id_kelas` int DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pemesanan`),
  KEY `id_anggota` (`id_anggota`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel project_db_gym.pemesanan: ~0 rows (lebih kurang)
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

-- membuang struktur untuk table project_db_gym.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel project_db_gym.sessions: ~4 rows (lebih kurang)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('ktgV0Y9GMxqXmBaj6pSTZqB16WtkRtmG99qh7ByZ', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZHEyaXVCV0ZUOGZVaTdZa1RlRUY0S3dMa21rQzlDUHhQZ1NTZUd3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbj9idWxhbj0xMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE4O3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTczNDIzNjkyMzt9fQ==', 1734263499);

-- membuang struktur untuk table project_db_gym.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','anggota') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel project_db_gym.users: ~18 rows (lebih kurang)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
	(1, 'Admin User', 'admin@example.com', '$2y$12$jR734FwkY1tgqcPi9BsGneGQPk9eX6pJAeyeXflqcrCepQ9MCKHai', 'admin', NULL, NULL),
	(2, 'Anggota User', 'anggota@example.com', '$2y$12$FhQ/EGBQc7bWpHSRdmMgt.bprSkFcZBObcH6lI6/tdS3XLLWcpRiW', 'anggota', NULL, NULL),
	(3, 'Shiqa', 'shiqa@gmail.com', '$2y$12$XUv2Hf5tsoevW9t5E0VK.Oihi25.d6o56eXfk8Jq/PgsVoiD9.uNG', 'admin', NULL, NULL),
	(4, 'Dewi', 'dewi@gmail.com', '$2y$12$fugZ/ouc6cEc3emgCrFdk.NdNHnDN8KY0YeeRBgpXPcqDCxoFlvs.', 'anggota', NULL, NULL),
	(5, 'omar', 'omar@gmail.com', '$2y$12$g5Us3BZ7Yk4hD6TRNBrwouQruSpTWCXfKVpp/pjUnhewBWveJMv8u', 'admin', '2024-10-06 02:24:55', '2024-10-06 02:24:55'),
	(6, 'shiqa', 'rdewinar@gmail.com', '$2y$12$eZtfisrsb85zDYutwlelsuHMdSVBIAvVNKcr/d.8hWPlQTVwjfgCi', 'admin', '2024-10-06 05:33:01', '2024-10-06 05:33:01'),
	(7, 'rashiqa', 'gogo@gmail.com', '$2y$12$sEcP4gHoYCR0tFp64OGsqOE9x1JVBtkUqtV7xtR7bafAwEjaGYcw6', 'admin', '2024-10-06 18:11:01', '2024-10-06 18:11:01'),
	(8, 'diatri', 'diatrira18@gmail.com', '$2y$12$JYSoLOfcaLmY77a7elj4OOracEeduAqNMmuipyb2BvHR3FxhYeW6G', 'admin', '2024-10-06 18:19:27', '2024-10-06 18:19:27'),
	(9, 'nabila', 'nabila@gmail.com', '$2y$12$pFJWt80C1WlLpLtm17v27uHH6EGBzhEP111hB77qLaPMP84IeDjW.', 'admin', '2024-10-07 01:19:01', '2024-10-07 01:19:01'),
	(10, 'omar', 'atala@gmail.com', '$2y$12$6gYkDgBN34DLwqIspVnhiegqrsKNOJig/UF.rUer61PWhnfxXxfoK', 'admin', '2024-10-07 01:40:09', '2024-10-07 01:40:09'),
	(11, 'Rizal Dwi', 'rizal@gmail.com', '$2y$12$WJDtY/1aV8S/zdXyn3dF..M.iPHKV0nclU4wZ0RLK26LsGRgISLLi', 'admin', '2024-10-07 03:14:23', '2024-10-07 03:14:23'),
	(12, 'Rashiqa Nariswari', 'rashiqanariswari@gmail.com', '$2y$12$Qie0apKilCmy9.UchzNTl.1/N1CtrpxduoUUJ6cjQ/3K9RW6T9fS.', 'admin', '2024-10-07 03:23:39', '2024-10-07 03:23:39'),
	(13, 'Najla Dhiqa', 'ndiru@gmail.com', '$2y$12$Ai0Wt3ip0LuJzEtFyd0r..y9q0mQyhIDvdDPsP/87QWgOSW4OPVmS', 'admin', '2024-10-07 03:25:39', '2024-10-07 03:25:39'),
	(14, 'lisa manoban', 'lisa@gmail.com', '$2y$12$S7vmzJ6V83v/RXcfXcaspe7RTNzjckrU5qzyLdt2vCJNmc/0qEh/e', 'admin', '2024-10-07 03:39:43', '2024-10-07 03:39:43'),
	(15, 'nismara', 'nismara@gmail.com', '$2y$12$6HB9RS0w6VCIbaO9SowQ4.MTUpMJhM4xz1RTilhdspf1F/RbDGIgK', 'anggota', '2024-10-07 03:54:53', '2024-10-07 03:54:53'),
	(16, 'cheila', 'cheila@gmail.com', 'ayam123', 'anggota', NULL, NULL),
	(17, 'cheila', 'cheila2@gmail.com', '$2y$12$M.KuD1a2Ly2sDhxOrxK3EugIprM/vPQou6UdUXCtvWXfFrRJF.NY.', 'admin', '2024-11-23 02:31:05', '2024-11-23 02:31:05'),
	(18, 'melly', 'melly@gmail.com', '$2y$12$HXU0N5jccBifAiNFMU0B9Opw/AH/aFCTFwxFIBRJkfXw.MhQkyGOG', 'admin', '2024-11-24 20:52:46', '2024-11-24 20:52:46');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
