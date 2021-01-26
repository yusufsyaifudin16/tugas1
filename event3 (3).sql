-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26 Jan 2021 pada 23.05
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'artikel', 'artikel', NULL, NULL),
(4, 'berita penting', 'berita-penting', '2019-12-16 14:31:27', '2019-12-16 15:18:48'),
(6, 'Pendadaran', 'pendadaran', '2020-12-27 04:49:15', '2020-12-27 04:49:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_18_205339_tambah_softdelete_ke_post', 1),
(2, '2019_12_18_215229_tambah_field_user_post', 2),
(3, '2019_12_18_223400_add_tipe_user', 3),
(4, '2020_12_26_234948_create_room_table', 4),
(5, '2020_12_27_003136_tambah_field_room_post', 5),
(6, '2020_12_27_010200_tambah_field_status_post', 6),
(7, '2020_12_27_022208_tambah_tanggal_ke_post', 7),
(8, '2020_12_27_105407_create_events_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `judul`, `category_id`, `content`, `gambar`, `created_at`, `updated_at`, `slug`, `deleted_at`, `users_id`, `room_id`, `status`, `date_start`, `date_end`) VALUES
(9, 'title title', 4, '<p>asdasdasfa</p>', 'public/uploads/posts/1576707127ig2.png', '2019-12-18 15:12:07', '2021-01-13 02:08:26', 'title-title', NULL, 2, 3, 'acc', '2020-12-01 08:00:00', '2020-12-02 12:00:00'),
(15, 'testing', 4, '<p>fggdhfhd</p>', 'public/uploads/posts/1609057397amikom-1.jpg', '2020-12-26 20:28:23', '2021-01-25 21:54:30', 'testing', NULL, 11, 2, 'acc', '2021-01-22 04:00:00', '2024-02-22 03:00:00'),
(16, 'tes status', 2, 'ferheteth', 'public/uploads/posts/1609059637amikom-1.jpg', '2020-12-27 02:00:37', '2020-12-27 05:14:25', 'tes-status', '2020-12-27 05:14:25', 5, 2, 'pending', '2020-12-25 04:05:00', '2020-12-24 03:05:00'),
(17, 'testes', 4, 'asdfg', 'public/uploads/posts/1611643297amikom-1.jpg', '2021-01-25 23:41:37', '2021-01-25 23:41:53', 'testes', NULL, 12, 2, 'reject', '2021-01-12 15:00:00', '2021-01-20 16:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Cinema', 'ruang-cinema', NULL, '2020-12-27 04:48:33'),
(2, 'Citra 2', 'Citra-2', NULL, NULL),
(3, 'Citra 1', 'Citra-1', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yusuf syaifudin', 'admin', 'yusufsyaifudin16@gmail.com', NULL, '$2y$10$IJ/Gl/bwyN7uY2v0a9.dxu9mqC.N/7y72Pg/0IGR19/1XFq.UjSNm', NULL, '2019-12-18 14:34:52', '2021-01-12 23:56:47'),
(2, 'dimas', 'admin', 'dimas@gmail.com', NULL, '$2y$10$9BE/0wsSshfRTfvp7VXCbO0iwiwW70SeTWlenTPKmx44fPSbGv5U6', NULL, '2020-01-20 19:31:02', '2020-12-27 04:47:30'),
(4, 'yusuf', 'superuser', 'yusuf@gmail.com', NULL, '$2y$10$2mBizSiDPtelxCuV1kQqVus/91L5LYaNEw1qQPD8jGw.e8JojF5JG', NULL, '2020-01-20 19:27:48', '2021-01-25 22:00:14'),
(5, 'adminlama', 'user', 'adminbaru@gmail.com', NULL, '$2y$10$ymmZv1HHnAfbuRUakh86OOpd0aPEUaGaSui5.vYH3vT11zoLa672S', NULL, '2020-12-26 21:50:03', '2021-01-26 15:04:26'),
(8, 'password', 'user', 'password@gmail.com', NULL, '$2y$10$JQ1h0Tr5eAbxXHp11AF/aeO3Y42v6CEgRBBw94QZwobc1SnHEV7.6', NULL, '2020-12-26 22:20:50', '2020-12-27 01:16:41'),
(10, 'userbaru', 'superuser', 'userbaru@gmail.com', NULL, '$2y$10$QyhWxRITUaUwLRaiPxKjFOT.8VJe4lPU2RpNqn6EfL98JqDnulSfm', NULL, '2021-01-25 22:09:41', '2021-01-25 22:56:02'),
(11, 'tesaja', 'superuser', 'tesaja@gmail.com', NULL, '$2y$10$qEEBl5OtFtedH81.E25qt.C.xMTBcJf5ifAeVo1EHUr7rwS3AtIh6', NULL, '2021-01-25 22:38:31', '2021-01-25 22:51:29'),
(12, 'tesaja2', 'admin', 'tesaja2@gmail.com', NULL, '$2y$10$874yCbIMmRbludJFKitG/OMiWIvwxqjvqtPiaycf0ogXUPolO0iVy', NULL, '2021-01-25 22:40:09', '2021-01-25 22:40:09'),
(13, 'akuaku', 'superuser', 'akuaku@gmail.com', NULL, '$2y$10$Bb4YzVX2XcSFPzQRpdqyt.zMOYj.FwWZHTcrrScPXeiYnEazRbooO', NULL, '2021-01-25 23:21:39', '2021-01-25 23:21:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
