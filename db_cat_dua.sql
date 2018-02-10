-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 10, 2018 at 08:57 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wangsit`
--

-- --------------------------------------------------------

--
-- Table structure for table `m_admin`
--

DROP TABLE IF EXISTS `m_admin`;
CREATE TABLE IF NOT EXISTS `m_admin` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('admin','guru','siswa') NOT NULL,
  `kon_id` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kon_id` (`kon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_admin`
--

INSERT INTO `m_admin` (`id`, `username`, `password`, `level`, `kon_id`) VALUES
(1, 'admin', '46f94c8de14fb36680850768ff1b7f2a', 'admin', 0),
(28, '1', '46f94c8de14fb36680850768ff1b7f2a', 'guru', 8),
(30, '2', '46f94c8de14fb36680850768ff1b7f2a', 'guru', 9);

-- --------------------------------------------------------

--
-- Table structure for table `m_guru`
--

DROP TABLE IF EXISTS `m_guru`;
CREATE TABLE IF NOT EXISTS `m_guru` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_guru`
--

INSERT INTO `m_guru` (`id`, `nip`, `nama`) VALUES
(8, '1', 'Om Jero'),
(9, '2', 'Bayu');

--
-- Triggers `m_guru`
--
DROP TRIGGER IF EXISTS `hapus_guru`;
DELIMITER $$
CREATE TRIGGER `hapus_guru` AFTER DELETE ON `m_guru` FOR EACH ROW BEGIN
DELETE FROM m_soal WHERE m_soal.id_guru = OLD.id;
DELETE FROM m_admin WHERE m_admin.level = 'guru' AND m_admin.kon_id = OLD.id;
DELETE FROM tr_guru_mapel WHERE tr_guru_mapel.id_guru = OLD.id;
DELETE FROM tr_guru_tes WHERE tr_guru_tes.id_guru = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `m_mapel`
--

DROP TABLE IF EXISTS `m_mapel`;
CREATE TABLE IF NOT EXISTS `m_mapel` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_mapel`
--

INSERT INTO `m_mapel` (`id`, `nama`) VALUES
(6, 'TKPA'),
(7, 'SAINTEK'),
(8, 'SOSHUM'),
(9, 'TKPA 2'),
(10, 'SAINTEK 2'),
(11, 'SOSHUM 2');

-- --------------------------------------------------------

--
-- Table structure for table `m_siswa`
--

DROP TABLE IF EXISTS `m_siswa`;
CREATE TABLE IF NOT EXISTS `m_siswa` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Triggers `m_siswa`
--
DROP TRIGGER IF EXISTS `hapus_siswa`;
DELIMITER $$
CREATE TRIGGER `hapus_siswa` AFTER DELETE ON `m_siswa` FOR EACH ROW BEGIN
DELETE FROM tr_ikut_ujian WHERE tr_ikut_ujian.id_user = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `m_soal`
--

DROP TABLE IF EXISTS `m_soal`;
CREATE TABLE IF NOT EXISTS `m_soal` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `bobot` int(2) NOT NULL,
  `file` varchar(150) DEFAULT NULL,
  `tipe_file` varchar(50) DEFAULT NULL,
  `soal` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `opsi_a` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `opsi_b` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `opsi_c` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `opsi_d` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `opsi_e` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `jawaban` varchar(5) DEFAULT NULL,
  `tgl_input` datetime DEFAULT NULL,
  `jml_benar` int(6) DEFAULT NULL,
  `jml_salah` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_guru` (`id_guru`),
  KEY `id_mapel` (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tr_guru_mapel`
--

DROP TABLE IF EXISTS `tr_guru_mapel`;
CREATE TABLE IF NOT EXISTS `tr_guru_mapel` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_guru` (`id_guru`),
  KEY `id_mapel` (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_guru_mapel`
--

INSERT INTO `tr_guru_mapel` (`id`, `id_guru`, `id_mapel`) VALUES
(23, 8, 5),
(24, 8, 6),
(25, 8, 7),
(26, 8, 8),
(27, 9, 6),
(28, 9, 7),
(29, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tr_guru_tes`
--

DROP TABLE IF EXISTS `tr_guru_tes`;
CREATE TABLE IF NOT EXISTS `tr_guru_tes` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_guru` int(6) NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(6) NOT NULL,
  `waktu` int(6) NOT NULL,
  `jenis` enum('acak','set') NOT NULL,
  `detil_jenis` varchar(500) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_guru` (`id_guru`),
  KEY `id_mapel` (`id_mapel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tr_ikut_ujian`
--

DROP TABLE IF EXISTS `tr_ikut_ujian`;
CREATE TABLE IF NOT EXISTS `tr_ikut_ujian` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_tes` int(6) NOT NULL,
  `id_user` int(6) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(6) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tes` (`id_tes`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
