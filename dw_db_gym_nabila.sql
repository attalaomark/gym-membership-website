-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 02:17 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_db_gym_nabila`
--

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

--
-- Indexes for dumped tables
--

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
-- Constraints for dumped tables
--

--
-- Constraints for table `fakta_pemesanan`
--
ALTER TABLE `fakta_pemesanan`
  ADD CONSTRAINT `fk_pemesanan_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `dim_anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_pemesanan_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `dim_kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
