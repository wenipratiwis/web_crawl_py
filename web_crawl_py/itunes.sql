-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 Feb 2019 pada 17.06
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itunes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `table 1`
--

CREATE TABLE `table 1` (
  `Name` varchar(26) DEFAULT NULL,
  `Developer` varchar(29) DEFAULT NULL,
  `Star` decimal(2,1) DEFAULT NULL,
  `Rating` varchar(14) DEFAULT NULL,
  `Price` varchar(4) DEFAULT NULL,
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `table 1`
--

INSERT INTO `table 1` (`Name`, `Developer`, `Star`, `Rating`, `Price`, `NULL`) VALUES
('Candy Crush Saga', 'King', '4.4', ' 27.6K Ratings', 'Free', ''),
('Candy Crush Friends Saga', 'King', '4.6', ' 5K Ratings', 'Free', ''),
('Candy Crush Soda Saga', 'King', '4.3', ' 2.7K Ratings', 'Free', ''),
('Candy Crush Jelly Saga', 'King', '4.2', ' 474 Ratings', 'Free', ''),
('Farm Heroes Saga', 'King', '4.3', ' 441 Ratings', 'Free', ''),
('Bubble Witch 3 Saga', 'King', '4.4', ' 940 Ratings', 'Free', ''),
('Pet Rescue Saga', 'King', '4.3', ' 299 Ratings', 'Free', ''),
('Block Puzzle Jewel Legend', 'Yan Yuliang', '4.0', ' 734 Ratings', 'Free', ''),
('Zombie Tsunami', 'Mobigame', '4.2', ' 117 Ratings', 'Free', ''),
('Flow Free', 'Big Duck Games LLC', '4.4', ' 701 Ratings', 'Free', ''),
('Cookie Jam - Match 3 Games', 'Jam City Inc.', '4.6', ' 434 Ratings', 'Free', ''),
('Ludo King', 'Gametion', '4.0', ' 37.7K Ratings', 'Free', ''),
('aa', 'General Adaptive Apps Pty Ltd', '4.2', ' 64 Ratings', 'Free', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
