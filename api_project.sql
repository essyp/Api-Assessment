-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 11:02 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `book_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 22, 'Lucy Kelly', '2021-05-03 21:56:18', '2021-05-03 21:56:18'),
(2, 23, 'Ifeanyi Eze', '2021-05-03 21:58:41', '2021-05-03 21:58:41'),
(3, 26, 'Eze Philip', '2021-05-03 22:03:46', '2021-05-03 22:03:46'),
(4, 27, 'Evans Moore', '2021-05-04 06:28:53', '2021-05-04 06:28:53'),
(5, 28, 'Lucy Kelly', '2021-05-04 06:35:31', '2021-05-04 06:35:31'),
(6, 28, 'Frank Moore', '2021-05-04 06:35:31', '2021-05-04 06:35:31'),
(7, 31, 'Lucy Kelly', '2021-05-04 06:45:43', '2021-05-04 06:45:43'),
(8, 31, 'Ifeanyi Okeke', '2021-05-04 06:45:43', '2021-05-04 06:45:43'),
(13, 32, 'Lucy Kellys', '2021-05-04 07:41:31', '2021-05-04 07:41:31'),
(14, 32, 'Elo Moores', '2021-05-04 07:41:31', '2021-05-04 07:41:31'),
(16, 30, 'Lucy Kelly', '2021-05-04 07:42:22', '2021-05-04 07:42:22'),
(17, 30, 'Kelly Moore', '2021-05-04 07:42:22', '2021-05-04 07:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_pages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `isbn`, `authors`, `country`, `number_of_pages`, `publisher`, `release_date`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Information Technology Book', 'aqswde124', 'Frank Moore', 'Nigeria', '345', 'Afrihub', '2020-06-03', 1, '2020-06-24 06:27:21', '2020-06-24 06:27:21'),
(19, 'Software Development book', '1122AE1', 'Frank Moore3', 'Nigeria', '346', 'Afrihub', '2020-06-07', 1, '2020-06-24 06:28:39', '2020-06-24 06:28:39'),
(21, 'Write Good Codes', '11223344qq', 'Frank Moore', 'Nigeria', '5', 'Africana Publishers', '2021-04-30', 1, '2021-05-03 19:33:31', '2021-05-03 19:33:31'),
(22, 'Become a developer', 'qqqwwxxx', 'test', 'Nigeria', '8', 'Africana Publishers', '2021-04-28', 1, '2021-05-03 21:56:18', '2021-05-03 21:56:18'),
(23, 'test book', '123rcda', 'test', 'Nigeria', '5', 'Africana Publishers', '2021-04-26', 1, '2021-05-03 21:58:41', '2021-05-03 21:58:41'),
(26, 'Test Book2', 'qwertyfff', 'test', 'Nigeria', '8', 'Africana Publishers', '2021-05-03', 1, '2021-05-03 22:03:46', '2021-05-03 22:03:46'),
(27, 'Test Book 3', 'mnbvcxz', 'test', 'Nigeria', '5', 'Africana Publishers', '2021-05-02', 1, '2021-05-04 06:28:53', '2021-05-04 06:28:53'),
(28, 'Test Book 4', 'asdfghj', 'test', 'Nigeria', '8', 'Africana Publishers', '2021-05-03', 1, '2021-05-04 06:35:31', '2021-05-04 06:35:31'),
(30, 'Test Book 5', 'lokiujhy', 'test', 'Nigeria', '8', 'Africana Publishers', '2021-05-03', 1, '2021-05-04 06:40:05', '2021-05-04 06:40:05'),
(31, 'Test Book 6', 'wsedfr', 'test', 'Nigeria', '5', 'Africana Publishers', '2021-04-29', 1, '2021-05-04 06:45:43', '2021-05-04 06:45:43'),
(32, 'Test Book 7', 'qaswder', 'test', 'Nigeria', '8', 'Africana Publishers', '2021-05-03', 1, '2021-05-04 06:48:13', '2021-05-04 07:30:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_06_22_222720_create_books_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 2),
(5, '2021_05_03_203942_create_authors_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
