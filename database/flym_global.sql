-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2026 at 08:07 PM
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
-- Database: `flym_global`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `founded_on` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `theme_color` varchar(7) DEFAULT NULL,
  `accent_color` varchar(7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `code`, `name`, `slug`, `description`, `founded_on`, `is_active`, `sort_order`, `theme_color`, `accent_color`, `created_at`, `updated_at`) VALUES
(1, 'FLY_M1000', 'Lambs Ministry', 'lambs-ministry', 'Ministry to children of primary-school age.', '1987-01-02', 1, 3, '#9C1F8C', '#F2A413', '2026-07-09 12:52:12', '2026-07-17 09:51:26'),
(2, 'FLY_M1100', 'Junior Radicals', 'junior-radicals', 'Ministry to high schoolers and recent high-school graduates.', '2017-01-01', 1, 2, '#4A90D9', '#E8622C', '2026-07-09 12:52:12', '2026-07-17 09:51:26'),
(3, 'FLY_M1200', 'Breach Repairers', 'breach-repairers', 'Ministry to university students.', '2005-01-01', 1, 1, '#4C9A2A', '#C1272D', '2026-07-09 12:52:12', '2026-07-17 09:51:26'),
(4, 'FLY_M1300', 'Alumni', 'alumni', 'Fellowship for FLY-M alumni.', '2015-01-31', 1, 5, NULL, NULL, '2026-07-09 12:52:12', '2026-07-17 06:42:43'),
(5, 'FLY_M1400', 'Street for Christ', 'street-for-christ', 'Street evangelism outreach.', '2024-04-09', 1, 4, '#0504AA', '#EFBF04', '2026-07-09 12:52:12', '2026-07-17 09:51:26'),
(6, 'FLY_M1500', 'MTCs and TVETs', 'mtcs-and-tvets', 'Ministry to vocational and technical college students.', '2024-12-31', 0, 6, NULL, NULL, '2026-07-09 12:52:12', '2026-07-17 06:42:43'),
(7, 'FLY_M1600', 'FLY-M General', 'fly-m-general', 'FLY-M Global overall leadership and executive committee.', '1987-01-31', 0, 7, NULL, NULL, '2026-07-09 12:52:12', '2026-07-17 06:42:43'),
(8, 'FLY_M1700', 'FLY-M Media', 'fly-m-media', 'Media, communications, and content for FLY-M Global.', '2024-01-01', 0, 8, NULL, NULL, '2026-07-09 12:52:12', '2026-07-17 06:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `department_user`
--

CREATE TABLE `department_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`id`, `department_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL),
(2, 2, 5, NULL, NULL),
(3, 3, 6, NULL, NULL),
(4, 4, 7, NULL, NULL),
(5, 5, 8, NULL, NULL),
(6, 6, 9, NULL, NULL),
(7, 7, 10, NULL, NULL),
(8, 8, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `event_date` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `department_id`, `title`, `description`, `venue`, `event_date`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Crossover Radical Kesha', 'A crossover night of worship, prayer and the Word for the Lambs Ministry.', 'KICC Amphitheatre Hall', '2025-01-24', 'events/6777b79e8a77f_Kesha_1.jpg', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(2, 1, 'Restoration Radical Kesha - November Edition', 'A night of restoration, worship and prayer for the Lambs Ministry.', 'CHRISCO CCC, Near Green Park', '2025-01-12', 'events/6779a262eba8d_founders_2.jpg', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(3, 7, 'BR Annivessary', 'hjkl', 'Agro House', '2026-07-30', 'events/01KX45SSH5TN2QVX7NDDB37S2D.png', '2026-07-09 16:31:15', '2026-07-09 16:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_photos`
--

CREATE TABLE `gallery_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_photos`
--

INSERT INTO `gallery_photos` (`id`, `department_id`, `photo_path`, `caption`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'gallery/Kesha_4.jpg', NULL, 0, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(2, 1, 'gallery/Kesha_2.jpg', NULL, 1, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(3, 1, 'gallery/Kesha_1.jpg', NULL, 2, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(4, 1, 'gallery/Kesha_3.jpg', NULL, 3, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(5, 3, 'gallery/1736023543_about2.jpeg', NULL, 0, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(6, 3, 'gallery/1736023543_founders_2.jpg', NULL, 2, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(7, 3, 'gallery/1736023543_founders_1.jpeg', NULL, 3, '2026-07-09 12:52:12', '2026-07-09 12:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaders`
--

CREATE TABLE `leaders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaders`
--

INSERT INTO `leaders` (`id`, `department_id`, `position_id`, `full_name`, `phone_number`, `email`, `photo`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Keziah Neema', '0702499324', NULL, NULL, 0, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(2, 8, 1, 'Gideon Kiplangat', '0702499324', NULL, NULL, 1, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(3, 1, 1, 'Dcn. Daniel Kiteme', '0721233443', NULL, NULL, 2, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(4, 7, 1, 'Eldr. Cleophas Kosgei', '0729001702', NULL, NULL, 3, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(5, 7, 5, 'Dcn. Amugune Wilberforce', '0786789345', NULL, NULL, 4, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(6, 7, 6, 'Dcns. Joy Amugune', '0716897456', NULL, NULL, 5, '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(7, 3, 1, 'Francis Kariuki', '0702499324', 'br@flym-global.org', 'leaders/01KX47BPXSPW0J8Z32N48GEV8C.png', 0, '2026-07-09 16:58:31', '2026-07-09 16:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `university_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `joined_at` date DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `department_id`, `university_id`, `full_name`, `phone_number`, `email`, `photo`, `joined_at`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Calvin Odhiambo', NULL, NULL, NULL, '2025-09-09', 0, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(2, 3, 2, 'Ezinah Momanyi', NULL, NULL, NULL, '2025-11-09', 1, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(3, 3, 1, 'Brian Otieno', NULL, NULL, NULL, '2026-01-09', 2, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(4, 3, 1, 'Faith Wanjiru', NULL, NULL, NULL, '2026-03-09', 3, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(5, 3, 3, 'Kevin Mutua', NULL, NULL, NULL, '2026-04-09', 4, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(6, 3, 3, 'Purity Chebet', NULL, NULL, NULL, '2026-06-09', 5, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(7, 1, NULL, 'Timothy Kariuki', NULL, NULL, NULL, '2026-06-09', 0, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(8, 1, NULL, 'Sarah Nyambura', NULL, NULL, NULL, '2026-05-09', 1, '2026-07-09 17:54:05', '2026-07-09 17:54:05');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_07_09_150546_create_permission_tables', 1),
(5, '2026_07_09_150621_create_departments_table', 1),
(6, '2026_07_09_150622_create_positions_table', 1),
(7, '2026_07_09_150623_create_department_user_table', 1),
(8, '2026_07_09_150624_create_leaders_table', 1),
(9, '2026_07_09_150625_create_events_table', 1),
(10, '2026_07_09_150627_create_gallery_photos_table', 1),
(11, '2026_07_09_150628_create_news_table', 1),
(12, '2026_07_09_150629_create_contact_messages_table', 1),
(13, '2026_07_09_204428_create_universities_table', 2),
(14, '2026_07_09_204430_create_members_table', 2),
(15, '2026_07_17_094043_add_sort_order_to_departments_table', 3),
(16, '2026_07_17_100013_add_department_id_to_contact_messages_table', 4),
(17, '2026_07_17_104332_add_theme_color_to_departments_table', 5),
(18, '2026_07_17_124754_add_accent_color_to_departments_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(2, 'view_any_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(3, 'create_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(4, 'update_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(5, 'restore_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(6, 'restore_any_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(7, 'replicate_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(8, 'reorder_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(9, 'delete_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(10, 'delete_any_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(11, 'force_delete_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(12, 'force_delete_any_contact::message', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(13, 'view_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(14, 'view_any_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(15, 'create_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(16, 'update_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(17, 'restore_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(18, 'restore_any_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(19, 'replicate_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(20, 'reorder_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(21, 'delete_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(22, 'delete_any_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(23, 'force_delete_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(24, 'force_delete_any_department', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(25, 'view_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(26, 'view_any_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(27, 'create_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(28, 'update_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(29, 'restore_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(30, 'restore_any_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(31, 'replicate_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(32, 'reorder_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(33, 'delete_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(34, 'delete_any_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(35, 'force_delete_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(36, 'force_delete_any_event', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(37, 'view_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(38, 'view_any_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(39, 'create_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(40, 'update_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(41, 'restore_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(42, 'restore_any_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(43, 'replicate_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(44, 'reorder_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(45, 'delete_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(46, 'delete_any_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(47, 'force_delete_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(48, 'force_delete_any_gallery::photo', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(49, 'view_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(50, 'view_any_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(51, 'create_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(52, 'update_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(53, 'restore_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(54, 'restore_any_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(55, 'replicate_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(56, 'reorder_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(57, 'delete_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(58, 'delete_any_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(59, 'force_delete_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(60, 'force_delete_any_leader', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(61, 'view_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(62, 'view_any_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(63, 'create_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(64, 'update_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(65, 'restore_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(66, 'restore_any_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(67, 'replicate_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(68, 'reorder_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(69, 'delete_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(70, 'delete_any_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(71, 'force_delete_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(72, 'force_delete_any_news', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(73, 'view_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(74, 'view_any_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(75, 'create_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(76, 'update_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(77, 'restore_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(78, 'restore_any_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(79, 'replicate_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(80, 'reorder_position', 'web', '2026-07-09 12:52:11', '2026-07-09 12:52:11'),
(81, 'delete_position', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(82, 'delete_any_position', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(83, 'force_delete_position', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(84, 'force_delete_any_position', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(85, 'view_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(86, 'view_any_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(87, 'create_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(88, 'update_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(89, 'delete_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(90, 'delete_any_role', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(91, 'view_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(92, 'view_any_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(93, 'create_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(94, 'update_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(95, 'restore_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(96, 'restore_any_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(97, 'replicate_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(98, 'reorder_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(99, 'delete_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(100, 'delete_any_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(101, 'force_delete_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(102, 'force_delete_any_user', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(103, 'widget_DepartmentOverviewWidget', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(104, 'view_member', 'web', '2026-07-09 17:51:49', '2026-07-09 17:51:49'),
(105, 'view_any_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(106, 'create_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(107, 'update_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(108, 'restore_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(109, 'restore_any_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(110, 'replicate_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(111, 'reorder_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(112, 'delete_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(113, 'delete_any_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(114, 'force_delete_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(115, 'force_delete_any_member', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(116, 'view_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(117, 'view_any_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(118, 'create_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(119, 'update_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(120, 'restore_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(121, 'restore_any_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(122, 'replicate_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(123, 'reorder_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(124, 'delete_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(125, 'delete_any_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(126, 'force_delete_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(127, 'force_delete_any_university', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(128, 'page_EventHistoryReport', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(129, 'page_MembersByUniversityReport', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(130, 'page_MembershipGrowthReport', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50'),
(131, 'page_OverviewReport', 'web', '2026-07-09 17:51:50', '2026-07-09 17:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `department_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Chairperson', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(2, NULL, 'Treasurer', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(3, NULL, 'Secretary', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(4, NULL, 'Vice Chairperson', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(5, NULL, 'Discipleship Leader', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(6, NULL, 'Worship Leader', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(7, NULL, 'Intercession Leader', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(8, NULL, 'Welfare Leader', '2026-07-09 12:52:12', '2026-07-09 12:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12'),
(2, 'department_admin', 'web', '2026-07-09 12:52:12', '2026-07-09 12:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(32, 2),
(33, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(44, 2),
(45, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(56, 2),
(57, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(111, 2),
(112, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(123, 2),
(124, 2);

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
('1W5lOi6eiB0LXyHr5zZ92iWW7TORu599rESaEmtJ', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmFxMWJreEpJd0FTQW5TMFgzdnJRS3F5RmhVNTU4MUtvTlVFNVBWcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sYW1icy1taW5pc3RyeSI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784286579),
('3Dv1RMjgSYyBUUjzN6fNWBAmIUGb8ynSZYcNV2B8', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekFsVTJGMWM1eWgycTdOMjZBbXlKSTczOWFxUFBpR0p4eW1ScTVnbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sYW1icy1taW5pc3RyeSI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784288672),
('3qVLkEVjOYq1GicMxVSITYlLtz1nyw6BGsviKAAw', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHk4VXhkeEwzSTMxRzNNN0IxamZYTkVLZTdWenYxUzhKZGNJeU9WcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784288674),
('721HaLGmhjGxQzbLgMz1fvXdlQWSRGf76uz74x2b', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUt6ckhDWDVYZGlDdEUzNUREOUF5QjJJbThWY0UzZnZ2bDFtY0xaRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784295055),
('7uFKXwSJZrw0GdmhVzMkWOLTnKRlCU9X2U5g6SLI', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGFTR2lmbHJGV2ZHQVlBaGxzczdSWWhUbmFIM0NvTkRTeE1KMmkwWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9qdW5pb3ItcmFkaWNhbHMiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784286577),
('aF6ZKP6RfwVJVLXPY0ZGF9f5K2Me0wwCbiaDR8qE', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1pwTVNhcDV5b1VOTXNvSmMzR3FmMG9LOWc0bVI5UXBUUjlGajdGYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hbHVtbmkiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784292898),
('aoG4xSKxZG5AIYFK48MMwJ0y5Dr8f3m4mjlEoNqR', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2FXbnNySTdWUVUwbWdCaXg3YXlXRnVnQXZnSDY2Rm54QkF2TFMwdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784290632),
('DHB8HTPkYZmKXlbgbBUGhliLwFKgyIAKzkWEymZw', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGJyWklRRFRHUVdEenQxNE9WSk9vSTBvbEZoUEVuQzJCVnNWcVR3VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784291701),
('ErbXdYkNz4PHtX7NgZwXwoX8bvQcdZqUzyDcezvj', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNoN3l0RW9pbWVlbEdFWXRiVUFXYWdEeFR5S1R2aTdseFAwNEdVOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9qdW5pb3ItcmFkaWNhbHMiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784290633),
('F4hNwrhq2ldpubnfzJ0OwgZDUC45sBPmVcLe01L7', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmpSOThkdUtZOWJhd2xIS2NkU2VFNDRyVElzRWVkeVhEOVRlR291UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hbHVtbmkiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784288675),
('G5eMPpHhCuBhn6d0cUmRv4XqMcJAKeWquZ6sm48s', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSXFvTGN0WVNJTjgxczBkcHBlYW5zVTc0MXpIRjFmU3hRTlF3T0t3TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2JyZWFjaC1yZXBhaXJlcnMiO319', 1784295351),
('j6MuMAavH4ZUiWKKDvmp99GZaXo7nHvT73LLWE9u', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWVMNEVRUGhNNXdLQ3M3eWl3WE00WTVkUHNUblB1MEZlVXVRaTZLUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784286600),
('k4PtWozuIJlZl0m1Go8NEQsIUuzfd1hFDeSJ4SZa', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak9pcFJJNmljc0EySWRlSEZ0WlVhRmJVOWkyT1hZZmgwbnVCWEx4RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9qdW5pb3ItcmFkaWNhbHMiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784289081),
('KJX4FGv9zf93nLbmMcBstBntgJgBeWHL8R3HSKDl', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzYwSXo2QlJuRVE0ZDZCbURYdVpBem0xdXJvemNoQ3o5cTFhUjh5bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784293293),
('krOGGT0w35HNlIhD9WHOuYOgOSYbyrrVcYPCXlRF', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1pJVjh1c3JsTFJKTEtxUWY1N2VydkFRNUl5STJYSk1FNTNzNGJtNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784295057),
('m0cki5UQKVWgWOcgv9tBM9Guhcr3Gk0WLSBVdLEq', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFNFa3lBRE1jbWZjZ0Nrc3p1eDBtQXNtYkpMaWFPc3lzMVlBRkxNViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sYW1icy1taW5pc3RyeSI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784290635),
('MeX5Q6nogLW9kZ0pVualp82tMkh8KldkzGRPwNen', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmI2bXJ1QldrOU9Gb1FROGw3dVkxOHA5UnBzajZwN0hiY0JFQUpuMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784289080),
('morVp7M81AZCgAhFkdOz5DwiXNbXjpAedfhxU375', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamJjR3NvNFNLcktQUmlIakt6cUlnY1U4MU1hWjd0TU13bFBiN2htRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784286580),
('mzJlVlUWX0aBOVX8NyKv06MYbqPjM6YNkDF5hiY2', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmxjbnQ5OGFXVm5RNU1VWXU4SlpVa2VpTHBVTUpyWEFKZEl3UTBiaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784293619),
('nduVnK4sqPDRBeItNjiAdDJlBqYTlSbZgeTWMWZw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFZFUFBOY1NtcVlPdDBkVEs4U2lMb0JTcHZVdG40dG83V0tqanBuUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784363410),
('NfLNuzNmAdAr0juyLxgegCCrUe6WYCERkcOjfFhQ', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEZhYUtObUpmS2czN0ZsR1NWcHQzN01ZNmhiRG1KUlVSOUM3Nld3dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784292894),
('nFPcPi4xqbNkUwbdn1AESPdthOPn7OPBt5SKYZ3e', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUZDM2JWVHNMM1BqcGl2OVM0QllYRjV0VkNiTkZ2WldybEFOcllkRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784290518),
('o0PvIvLeGfw434GAyi757vhcu0CBQIgEnNdNq6RC', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0ZxQ0JlS2huUXI0ZGJBalFTdFNxWjJVcnNHQmQ3MnVubjdteUNsMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784293296),
('oCyk961zcf8q0KawvnFLxz2JGgjmi3G1yDn3KWSi', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTdzSWdPVHRGN0s2MnBybzlMSmVsUW5QcnV5UjREMFR1Q2dzbFJwRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9qdW5pb3ItcmFkaWNhbHMiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784288671),
('Oww59mECQSyp1yLlQa2MAg7vXxr5KHGhDbOeDXyV', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEJmcFhLUWJXRkZFUWh4ZUlZVVhFR2dmUlFXZnBsUU1CZHg0aHBpRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784292896),
('OZ26cWNHklEofBL3aVYc4yaq8BWqSuMA1AN4OceA', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlFCTk95Q1Y3NDZCM21rc2lpRHNpNjNlMGFESmpjck95ZUhNNXpXOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784288677),
('q5tSGMQ4JfW2S6OqSHjXKilirC5mJLnoJoDKWE6q', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDRNNUQ4Zk5DRjA3Mno0UXZBTTNaNDhUWU9jUjZVZUM1dFJ6aU1BYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784287295),
('qbjGdmKvavhkxoSIbSVpfPxHcveA0zznh1W4EAQR', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFpCSTZ0NzdPU0lZUWdQd0ladGtFblpaSFFhbjhkb21ySzlzRG4ybiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784289793),
('S1HIJA7gotgEv03grUf8zNP7pMmmBH4eEXsngvTW', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienpBdXc2V1B4VTVocEEwV0RQNEMwS3doRnhiUkk5WVVLSG9IT0FlVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784286582),
('Sq2e2FwUxnpPFrVPFgYNd9pHBDI29qGwLX8GKzG6', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGx3aWZ3bGRONDRTTG9rSEVUOWV6dUlKd2lHRUtNak9XMjZyQXB6OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784289442),
('sTpejLEhslmDavzszYsGG8oe9PN3ArQEMtrHUOZy', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1hrdE42d2NYM2pQZVFhR1VBUWtRcjljeVM1bmxtaG9CdUl3Nk9GOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784293327),
('tUxgpynodgBGfKzTxbdXJGmCu1SWMzBtVQlPQwd7', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlFnMXo4YktOWXZ4cDYyMVpWSk9uMXdrSllCV1Z2YnJvWlZkSXMxaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784290955),
('UjHGdP21wQZDFJV79ybGBKbtRVyT5UD6Ro8W1R8S', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUNNM0dib1lWQjdPaWFvT09tVzBhVk1Ua21DT0szREpOaTRPTTJUeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784293795),
('uZ9ILwp79Wv7GgdiHfCLsHgBBeS6n9dBqajWtfZE', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Claude/1.22209.0 Chrome/148.0.7778.271 Electron/42.5.1 Safari/537.36 MSIX', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibndiRjVlSHcybm9mMTk3dnBOeHM1dTQ1cE5tNVByb3owUWl0VGdEMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784294468),
('W4OzM0RTY2Fscw5uCf3UBpqkXdPGckSaGfTKOEE2', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3VPRXl4UHNMb0NZd2NIbE5OdzFrdlRYMGd2dlRjQTRmbTRid1phZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hbHVtbmkiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784290957),
('WsghtkQINHqsMfLaBufZTEW21Xp97DYfaBlkUhUK', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1Y0c0lYM05wakx2STBjUk95QURLVGlXWG9Db3VkSHU4d05BWWdoNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9zdHJlZXQtZm9yLWNocmlzdCI7czo1OiJyb3V0ZSI7czoxNToiZGVwYXJ0bWVudC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784290165),
('x86TtGSVBHEXgtZgZaOuXgvzXujUIRqLDQfVpS25', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFVSQjNjUDJFbmtISEYzTWxOVWxEaHIzNFNRZUxLRzk0R3g2QVFPTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hbHVtbmkiO3M6NToicm91dGUiO3M6MTU6ImRlcGFydG1lbnQuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784291703),
('xaHeTHhHyW6bn5l2NNmDv4y8jaDg1fBdm6p0ZEa0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid2Z1V01TZFlhWWRJUE1vV01ZRW10YUhCN2RoSEdhS1dSMXFsbFVwUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784289593),
('ySsgFZJTx02pmIRc6QOKfVM930jz0ewXxeSUkG4j', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2taUVhlMG5Xdmd0Snp1UlhRSGhXMG9lMGc2YzE0T1lscEdhUmhGNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784286576),
('ZKNuXBYQc3oROko103WJfZrTKRGtaJQhOAeq7SlC', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkZ0b2pYQ0Z4M1VOcldWTWx4a3ZTeG9TSzcxeGxjaHVZcXdYazJ0dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9icmVhY2gtcmVwYWlyZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJkZXBhcnRtZW50LmhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784288604),
('ZZJObZv825o7fYkk8mfvRjbww5kXZfqkLS8Z18wk', NULL, '127.0.0.1', 'curl/8.18.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVNObWl5MUZITGdDOXlJRDlicUFLQ3ZpaW1NVXVCd3FIWUtUTGZUdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784291699);

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `department_id`, `name`, `location`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, 'University of Nairobi', 'Nairobi', 1, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(2, 3, 'Kabarak University', 'Nakuru', 1, '2026-07-09 17:54:05', '2026-07-09 17:54:05'),
(3, 3, 'Jomo Kenyatta University of Agriculture and Technology', 'Kiambu', 1, '2026-07-09 17:54:05', '2026-07-09 17:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'FLY-M Administrator', 'ministryflym@gmail.com', NULL, '$2y$12$GZQAtduhV3TRIqWS9fnIFOeFuu6f4hz9d3xnZ5s3P.7.beuPTb8/e', NULL, '2026-07-09 12:52:13', '2026-07-09 12:52:13'),
(2, 'Gideon Kiplangat', 'gideonkiplangat4@gmail.com', NULL, '$2y$12$nSkwZh7FwRsUeaARoq/.UO1KZ.aGs./bDfuGuIVA1wBgbX9VJ3GqG', NULL, '2026-07-09 12:52:13', '2026-07-09 12:52:13'),
(3, 'FLY-M Global Super Admin', 'info@flym-global.org', NULL, '$2y$12$m.w3F5KLYX0kY0nuj/e.5.qrxmXGoNAgQ5ZrtgLfGP0ujw3tJLPcK', NULL, '2026-07-09 12:59:17', '2026-07-09 12:59:17'),
(4, 'Lambs Ministry Admin', 'lm@flymglobal.org', NULL, '$2y$12$oT1wpnKo27QKtz94E56nEujVQ/XqVHWPLjZszjSt.WOCPQlTWuMt6', NULL, '2026-07-09 12:59:17', '2026-07-09 12:59:17'),
(5, 'Junior Radicals Admin', 'jr@flymglobal.org', NULL, '$2y$12$aocbY20V7fsCXL0OAXH8duLpAxz4.LPhirwm9daa5Eu8mm4t0VNrO', NULL, '2026-07-09 12:59:18', '2026-07-09 12:59:18'),
(6, 'Breach Repairers Admin', 'br@flymglobal.org', NULL, '$2y$12$UhbQcWr6wkTGAZj8G5ew4e3K8czKjuWs7L4pUvQG8JYcosL9ohrLe', NULL, '2026-07-09 12:59:18', '2026-07-09 12:59:18'),
(7, 'Alumni Admin', 'alumni@flymglobal.org', NULL, '$2y$12$nOkmeWaLQpthAb/drpH/9O98dSNiMgZe5NGtkQRqKSmdIBUVVbChO', NULL, '2026-07-09 12:59:18', '2026-07-09 12:59:18'),
(8, 'Street for Christ Admin', 'sfc@flymglobal.org', NULL, '$2y$12$q77ty2zMCp85bG3/zuzr5OlibCqVvqdsl2ptXIjDpKwzTWGJWjrfq', NULL, '2026-07-09 12:59:19', '2026-07-09 12:59:19'),
(9, 'MTCs and TVETs Admin', 'mtcs@flymglobal.org', NULL, '$2y$12$16T8ggoI662K8QgRi9Q8Eev.ws.30IKuDShx.MiJEGQwQcKxBXVQW', NULL, '2026-07-09 12:59:19', '2026-07-09 12:59:19'),
(10, 'FLY-M General Admin', 'general@flymglobal.org', NULL, '$2y$12$Xtm9dy2/4v8Hc5jwree84e8CoUFEizZCMjGEqQkVsHgtjcooTSY0.', NULL, '2026-07-09 12:59:20', '2026-07-09 12:59:20'),
(11, 'FLY-M Media Admin', 'media@flymglobal.org', NULL, '$2y$12$jf7us9/PwiAeS.l1FnIE.uOtYJBjOQjEqfFofPfIuZssw5W1.a/mG', NULL, '2026-07-09 12:59:20', '2026-07-09 12:59:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_messages_department_id_foreign` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_code_unique` (`code`),
  ADD UNIQUE KEY `departments_slug_unique` (`slug`);

--
-- Indexes for table `department_user`
--
ALTER TABLE `department_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_user_department_id_user_id_unique` (`department_id`,`user_id`),
  ADD KEY `department_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_department_id_foreign` (`department_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_photos_department_id_foreign` (`department_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaders`
--
ALTER TABLE `leaders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaders_department_id_foreign` (`department_id`),
  ADD KEY `leaders_position_id_foreign` (`position_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_department_id_foreign` (`department_id`),
  ADD KEY `members_university_id_foreign` (`university_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_department_id_foreign` (`department_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_department_id_foreign` (`department_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universities_department_id_foreign` (`department_id`);

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
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department_user`
--
ALTER TABLE `department_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaders`
--
ALTER TABLE `leaders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `contact_messages_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `department_user`
--
ALTER TABLE `department_user`
  ADD CONSTRAINT `department_user_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `department_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD CONSTRAINT `gallery_photos_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaders`
--
ALTER TABLE `leaders`
  ADD CONSTRAINT `leaders_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaders_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `members_university_id_foreign` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `universities`
--
ALTER TABLE `universities`
  ADD CONSTRAINT `universities_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
