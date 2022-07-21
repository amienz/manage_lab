-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2022 at 03:23 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_laboratorium`
--

CREATE TABLE `fasilitas_laboratorium` (
  `id_barang` int(10) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fasilitas_laboratorium`
--

INSERT INTO `fasilitas_laboratorium` (`id_barang`, `nama_barang`, `id_lab`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'komputer', 1, 20, '2022-06-06 16:15:00', '2022-06-06 16:15:00'),
(2, 'laptop', 2, 20, '2022-06-06 16:30:13', '2022-06-06 16:30:13'),
(3, 'VR', 2, 2, '2022-06-06 16:30:13', '2022-06-06 16:30:13'),
(4, 'Speaker', 13, 2, '2022-06-20 10:08:18', '2022-06-25 01:27:43'),
(5, 'phone', 13, 5, '2022-06-25 01:16:02', '2022-06-25 01:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorium`
--

CREATE TABLE `laboratorium` (
  `id_lab` int(10) UNSIGNED NOT NULL,
  `nama_lab` varchar(255) NOT NULL,
  `harga_lab` decimal(11,0) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratorium`
--

INSERT INTO `laboratorium` (`id_lab`, `nama_lab`, `harga_lab`, `created_at`, `updated_at`) VALUES
(12, 'networking', '10000', '2022-06-19 22:44:35', '2022-06-19 22:45:11'),
(13, 'robotik lab', '40000', '2022-06-20 08:21:06', '2022-06-20 08:21:06'),
(14, 'Programming', '70000', '2022-06-25 01:47:40', '2022-06-25 01:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `log_user`
--

CREATE TABLE `log_user` (
  `id_log` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `waktu_login` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman_lab`
--

CREATE TABLE `peminjaman_lab` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `waktu_awal` datetime NOT NULL,
  `waktu_akhir` datetime NOT NULL,
  `is_accept` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman_lab`
--

INSERT INTO `peminjaman_lab` (`id`, `id_user`, `id_lab`, `waktu_awal`, `waktu_akhir`, `is_accept`, `created_at`, `updated_at`) VALUES
(1, 6, 2, '2022-06-17 09:30:00', '2022-06-17 12:30:00', 0, '2022-06-15 11:41:25', '2022-06-15 11:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id_role` int(10) UNSIGNED NOT NULL,
  `nama_role` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id_role`, `nama_role`, `created_at`, `updated_at`) VALUES
(1, 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'member', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `member` enum('civitas','non-civitas') NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `nama`, `email`, `password`, `member`, `avatar`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 'Norman Kamaru', 'norman@mail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'non-civitas', 'default.jp', 1, '2022-05-17 16:43:29', '2022-05-17 16:43:29'),
(2, 2, 'Rahmad', 'ahmad@mail.com', '75dca01832391c098332c8217cb5ca0461ced07c', 'non-civitas', 'default.jp', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 'Rahmad', 'ahmadnami@mail.com', '75dca01832391c098332c8217cb5ca0461ced07c', 'non-civitas', 'default.jp', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 'tegar satriya', 'tegar@mail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'non-civitas', 'default.jp', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 'tegar', 'tegarsat@mail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'non-civitas', 'default.jp', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 'Light Yagami', 'yagami@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'non-civitas', '1656000204_52781a72cdb2c73a6545.jpg', 1, '2022-05-29 21:22:03', '2022-06-23 11:03:24'),
(7, 1, 'admin', 'admin@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'non-civitas', 'default.jp', 1, '2022-05-29 21:42:17', '2022-05-29 21:42:17'),
(8, 1, 'Konohamaru', 'norman@mail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'non-civitas', 'default.jp', 0, '2022-06-20 11:04:10', '2022-06-20 11:04:10'),
(9, 1, 'Light Yagami ', 'yagami@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'civitas', '1655990403_50a01c97883f2175b49d.jpg', 1, '2022-06-23 08:55:01', '2022-06-23 08:55:01'),
(10, 1, 'Light Yagami ', 'yagami@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'civitas', '1656000204_52781a72cdb2c73a6545.jpg', 1, '2022-06-23 11:25:29', '2022-06-23 11:25:29'),
(11, 1, 'Light Yagami ', 'yagami@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'civitas', '1656000204_52781a72cdb2c73a6545.jpg', 1, '2022-06-25 17:26:51', '2022-06-25 17:26:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fasilitas_laboratorium`
--
ALTER TABLE `fasilitas_laboratorium`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `laboratorium`
--
ALTER TABLE `laboratorium`
  ADD PRIMARY KEY (`id_lab`);

--
-- Indexes for table `log_user`
--
ALTER TABLE `log_user`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `peminjaman_lab`
--
ALTER TABLE `peminjaman_lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fasilitas_laboratorium`
--
ALTER TABLE `fasilitas_laboratorium`
  MODIFY `id_barang` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laboratorium`
--
ALTER TABLE `laboratorium`
  MODIFY `id_lab` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `log_user`
--
ALTER TABLE `log_user`
  MODIFY `id_log` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman_lab`
--
ALTER TABLE `peminjaman_lab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id_role` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
