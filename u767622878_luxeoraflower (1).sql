-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2026 at 03:15 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u767622878_luxeoraflower`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('owner','manager') NOT NULL DEFAULT 'manager',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `login_attempts` int(11) DEFAULT 0,
  `locked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password_hash`, `role`, `is_active`, `created_at`, `login_attempts`, `locked_until`) VALUES
(1, 'Luxeora Owner', 'owner@luxeora.com', '$2y$10$C6MEb1L2S8pgvBlJAWWsXOY1aw4kaRLJvAZ.kwCd08/A96FATNGYm', 'owner', 1, '2026-02-16 15:27:34', 1, NULL),
(2, 'Luxeora Manager', 'manager@luxeora.com', '$2y$10$C6MEb1L2S8pgvBlJAWWsXOY1aw4kaRLJvAZ.kwCd08/A96FATNGYm', 'manager', 1, '2026-02-16 15:27:34', 0, NULL),
(5, 'Luxeora Admin', 'admin@luxeora.com', '$2y$10$C6MEb1L2S8pgvBlJAWWsXOY1aw4kaRLJvAZ.kwCd08/A96FATNGYm', 'owner', 1, '2026-02-16 17:28:34', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `excerpt_en` text DEFAULT NULL,
  `excerpt_ar` text DEFAULT NULL,
  `body_en` longtext DEFAULT NULL,
  `body_ar` longtext DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `published_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `slug`, `title_en`, `title_ar`, `excerpt_en`, `excerpt_ar`, `body_en`, `body_ar`, `image`, `is_published`, `published_at`, `created_at`) VALUES
(1, 'the-language-of-flowers', 'The Language of Flowers: What Each Bloom Means', 'لغة الزهور: ماذا تعني كل زهرة', 'Discover the hidden meanings behind your favorite flowers and learn how to send the perfect message with your next bouquet.', 'اكتشف المعاني الخفية وراء أزهارك المفضلة وتعلم كيف ترسل الرسالة المثالية مع باقتك القادمة.', '<p>Flowers have been used for centuries to convey emotions and messages that words sometimes cannot express. From the passionate red rose to the pure white lily, each bloom carries its own unique symbolism.</p><h3>Roses</h3><p>Red roses symbolize deep love and passion. Pink roses represent grace and admiration. White roses signify purity and new beginnings.</p><h3>Peonies</h3><p>These lush blooms represent prosperity, good fortune, and a happy marriage. They are a favorite for weddings and celebrations.</p>', '<p>استُخدمت الزهور لعدة قرون للتعبير عن المشاعر والرسائل التي لا تستطيع الكلمات أحيانًا التعبير عنها. من الوردة الحمراء العاطفية إلى الزنبق الأبيض النقي، تحمل كل زهرة رمزيتها الفريدة.</p><h3>الورود</h3><p>ترمز الورود الحمراء إلى الحب العميق والعاطفة. تمثل الورود الوردية الأناقة والإعجاب. تشير الورود البيضاء إلى النقاء والبدايات الجديدة.</p>', 'blog/language-of-flowers.jpg', 1, '2026-02-16 15:27:34', '2026-02-16 15:27:34'),
(2, 'caring-for-luxury-bouquets', 'How to Care for Your Luxury Bouquet', 'كيفية العناية بباقتك الفاخرة', 'Expert tips to make your premium flower arrangements last longer and stay fresh.', 'نصائح خبيرة لجعل تنسيقات زهورك الفاخرة تدوم أطول وتبقى طازجة.', '<p>When you receive a luxury bouquet from Luxeora, you want to enjoy its beauty for as long as possible. Here are our expert tips for extending the life of your flowers.</p><h3>Hydration</h3><p>Immediately place your flowers in clean, lukewarm water. Add the flower food provided with your arrangement.</p><h3>Placement</h3><p>Keep your bouquet away from direct sunlight, heating vents, and fruit bowls (which emit ethylene gas).</p>', '<p>عندما تتلقى باقة فاخرة من لوكسيورا، تريد الاستمتاع بجمالها لأطول فترة ممكنة. إليك نصائحنا الخبيرة لإطالة عمر زهورك.</p><h3>الترطيب</h3><p>ضع أزهارك فورًا في ماء نظيف فاتر. أضف غذاء الزهور المرفق مع تنسيقك.</p><h3>الموقع</h3><p>أبقِ باقتك بعيدة عن أشعة الشمس المباشرة وفتحات التدفئة وأطباق الفاكهة.</p>', 'blog/caring-for-bouquets.jpg', 1, '2026-02-16 15:27:34', '2026-02-16 15:27:34'),
(3, 'trending-wedding-flowers-2024', 'Trending Wedding Flowers for 2024', 'زهور الزفاف الرائجة لعام ٢٠٢٤', 'From romantic peonies to exotic orchids, discover the most sought-after wedding flowers this season.', 'من الفاوانيا الرومانسية إلى الأوركيد الغريبة، اكتشف أكثر زهور الزفاف طلبًا هذا الموسم.', '<p>Wedding flower trends are evolving, with couples seeking more personalized and luxurious floral experiences. Here are the top trends we are seeing at Luxeora this season.</p><h3>Romantic Peonies</h3><p>Peonies continue to reign supreme in wedding floral design. Their lush, full blooms create a romantic atmosphere.</p><h3>Dried & Preserved Elements</h3><p>Mixing fresh flowers with dried and preserved elements adds texture and a contemporary feel to wedding arrangements.</p>', '<p>تتطور اتجاهات زهور الزفاف، حيث يبحث الأزواج عن تجارب زهرية أكثر تخصيصًا وفخامة. إليك أهم الاتجاهات التي نراها في لوكسيورا هذا الموسم.</p><h3>الفاوانيا الرومانسية</h3><p>تستمر الفاوانيا في السيطرة على تصميم زهور الزفاف. تخلق أزهارها الخصبة الكاملة أجواءً رومانسية.</p>', 'blog/wedding-flowers-2024.jpg', 1, '2026-02-16 15:27:34', '2026-02-16 15:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `name_en` varchar(255) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `description_en` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `sort_order`, `name_en`, `name_ar`, `created_at`, `description_en`, `description_ar`, `icon`, `image`) VALUES
(1, 'roses', 0, 'Roses', 'ورود', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL),
(2, 'bouquets', 0, 'Bouquets', 'باقات', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL),
(3, 'arrangements', 0, 'Arrangements', 'تنسيقات', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL),
(4, 'plants', 0, 'Plants', 'نباتات', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL),
(5, 'luxury-boxes', 0, 'Luxury Boxes', 'صناديق فاخرة', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL),
(6, 'dried-flowers', 0, 'Dried Flowers', 'زهور مجففة', '2026-02-16 15:27:34', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `lang` enum('en','ar') NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `lang`, `name`) VALUES
(1, 1, 'en', 'Roses'),
(2, 1, 'ar', 'ورود'),
(3, 2, 'en', 'Bouquets'),
(4, 2, 'ar', 'باقات'),
(5, 3, 'en', 'Arrangements'),
(6, 3, 'ar', 'تنسيقات'),
(7, 4, 'en', 'Plants'),
(8, 4, 'ar', 'نباتات'),
(9, 5, 'en', 'Luxury Boxes'),
(10, 5, 'ar', 'صناديق فاخرة'),
(11, 6, 'en', 'Dried Flowers'),
(12, 6, 'ar', 'زهور مجففة');

-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

CREATE TABLE `cms_content` (
  `id` int(11) NOT NULL,
  `page_key` varchar(255) NOT NULL,
  `content_en` text DEFAULT NULL,
  `content_ar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_content`
--

INSERT INTO `cms_content` (`id`, `page_key`, `content_en`, `content_ar`) VALUES
(1, 'hero_title', 'THE ART OF GIFTING', 'فن الإهداء'),
(2, 'hero_subtitle', 'Luxury floral arrangements crafted with passion', 'تنسيقات زهور فاخرة صُنعت بشغف');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `starts_at` date DEFAULT NULL,
  `ends_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `is_active`, `starts_at`, `ends_at`, `created_at`) VALUES
(1, 'WELCOME10', 'percent', 10.00, 1, '2024-01-01', '2026-12-31', '2026-02-16 15:27:34'),
(2, 'LUXE50', 'fixed', 50.00, 1, '2024-01-01', '2026-12-31', '2026-02-16 15:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `emirate` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `city`, `emirate`, `created_at`) VALUES
(1, 'box nem', 'ibrahimkhalil881995@gmail.com', '+971503009134', 'assssssssssssssssaasas', 'الاسكندريه', 'Dubai', '2026-02-18 13:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `name_en` varchar(255) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id`, `slug`, `sort_order`, `name_en`, `name_ar`, `created_at`, `icon`) VALUES
(1, 'birthday', 0, 'Birthday', 'عيد ميلاد', '2026-02-16 15:27:34', NULL),
(2, 'anniversary', 0, 'Anniversary', 'ذكرى سنوية', '2026-02-16 15:27:34', NULL),
(3, 'wedding', 0, 'Wedding', 'زفاف', '2026-02-16 15:27:34', NULL),
(4, 'congratulations', 0, 'Congratulations', 'تهاني', '2026-02-16 15:27:34', NULL),
(5, 'sympathy', 0, 'Sympathy', 'تعازي', '2026-02-16 15:27:34', NULL),
(6, 'just-because', 0, 'Just Because', 'بدون مناسبة', '2026-02-16 15:27:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `occasion_translations`
--

CREATE TABLE `occasion_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `occasion_id` int(10) UNSIGNED NOT NULL,
  `lang` enum('en','ar') NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasion_translations`
--

INSERT INTO `occasion_translations` (`id`, `occasion_id`, `lang`, `name`) VALUES
(1, 1, 'en', 'Birthday'),
(2, 1, 'ar', 'عيد ميلاد'),
(3, 2, 'en', 'Anniversary'),
(4, 2, 'ar', 'ذكرى سنوية'),
(5, 3, 'en', 'Wedding'),
(6, 3, 'ar', 'زفاف'),
(7, 4, 'en', 'Congratulations'),
(8, 4, 'ar', 'تهاني'),
(9, 5, 'en', 'Sympathy'),
(10, 5, 'ar', 'تعازي'),
(11, 6, 'en', 'Just Because'),
(12, 6, 'ar', 'بدون مناسبة');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT 'cod',
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_number`, `status`, `subtotal`, `shipping`, `discount`, `total`, `coupon_code`, `payment_method`, `stripe_session_id`, `notes`, `shipping_address`, `created_at`) VALUES
(1, 1, 'LXR-CB0C29A6', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:20:48'),
(2, 1, 'LXR-CF3D1587', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:21:55'),
(3, 1, 'LXR-D88D538B', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:24:24'),
(4, 1, 'LXR-D953652C', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:24:37'),
(5, 1, 'LXR-EC0454FE', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Abu Dhabi', '2026-02-18 13:29:36'),
(6, 1, 'LXR-ED18A269', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', NULL, 'sasa', 'assssssssssssssssaasas, الاسكندريه, Abu Dhabi', '2026-02-18 13:29:53'),
(7, 1, 'LXR-F1C57A31', '', 1930.00, 0.00, 0.00, 1930.00, NULL, 'stripe', 'cs_live_b1xi5i85STeJyymoFnitICusdIBqacxmiAgRmIpZ33y6qLK3LZWKnHGtXB', 'sasa', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:31:08'),
(8, 1, 'LXR-FD6E0192', '', 280.00, 0.00, 0.00, 280.00, NULL, 'stripe', 'cs_live_a1tWk0h5kx8ms8ZKb2a80ymbXnZQWV35AbyA6vQ6p5uYw3zV8VR8TrFrUO', '', 'assssssssssssssssaasas, الاسكندريه, Abu Dhabi', '2026-02-18 13:34:14'),
(9, 1, 'LXR-060CA006', '', 280.00, 0.00, 0.00, 280.00, NULL, 'stripe', 'cs_live_a1CXHIuPbpqeILgOarXaaXqVJZ2cULiO72wBbJyLM37U8QkshYpMNLeOcF', '', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 13:36:32'),
(10, 1, 'LXR-36A854AB', '', 0.00, 25.00, 0.00, 25.00, NULL, 'stripe', NULL, '', 'تقاطع مصطفي صفوت معا برهان, القاهرة, Dubai', '2026-02-18 13:49:30'),
(11, 1, 'LXR-CA2EA898', '', 450.00, 0.00, 0.00, 450.00, NULL, 'stripe', 'cs_live_a1hFfddc43XywhL0D1aLhjes8bjPYw185gubC7vsx3DdKprPix3NAtJr19', '', 'assssssssssssssssaasas, الاسكندريه, Abu Dhabi', '2026-02-18 14:28:50'),
(12, 1, 'LXR-59A6AC0D', '', 450.00, 0.00, 0.00, 450.00, NULL, 'stripe', 'cs_live_a1Wy4DP2Np0vo4NmXmVM7CiQj6dzYQEV3SfiMtuX3HbXiZDtUQbMRFAIbQ', '', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-18 18:31:54'),
(13, 1, 'LXR-925908E7', '', 730.00, 0.00, 0.00, 730.00, NULL, 'stripe', 'cs_live_b1Ij6Gp4r0a5ixhe6VNqv1P2cZwkUEHkQhSzvyMYAEa1Z0wwXhLQicHkxM', '', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-19 15:15:49'),
(14, 1, 'LXR-9C68DAB8', '', 300.00, 0.00, 0.00, 300.00, NULL, 'stripe', 'cs_live_a1uQV5uSplw5wTgTyPWTXSRoJHsTm3lFEEcSFyXSudFZ3TIqZn3biFU62W', '', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-19 15:18:30'),
(15, 1, 'LXR-0EF540FD', '', 1020.00, 0.00, 0.00, 1020.00, NULL, 'stripe', 'cs_live_b1mQG6ICfYVCxgl6oXwfi5OpEcua9uOzPl3C58PIYiF6LcIZXU8inM8b5X', '', 'assssssssssssssssaasas, الاسكندريه, Dubai', '2026-02-19 18:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `name_snapshot` varchar(255) NOT NULL,
  `price_snapshot` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name_snapshot`, `price_snapshot`, `qty`) VALUES
(1, 1, 18, 'box nem', 199.00, 0),
(2, 1, 4, 'Grand Luxury Box', 750.00, 1),
(3, 1, 3, 'Blush Peony Arrangement', 280.00, 1),
(4, 1, 2, 'Royal Garden Bouquet', 450.00, 2),
(5, 2, 18, 'بوكس بالاسم ', 199.00, 0),
(6, 2, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(7, 2, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(8, 2, 2, 'باقة الحديقة الملكية', 450.00, 2),
(9, 3, 18, 'بوكس بالاسم ', 199.00, 0),
(10, 3, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(11, 3, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(12, 3, 2, 'باقة الحديقة الملكية', 450.00, 2),
(13, 4, 18, 'بوكس بالاسم ', 199.00, 0),
(14, 4, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(15, 4, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(16, 4, 2, 'باقة الحديقة الملكية', 450.00, 2),
(17, 5, 18, 'بوكس بالاسم ', 199.00, 0),
(18, 5, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(19, 5, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(20, 5, 2, 'باقة الحديقة الملكية', 450.00, 2),
(21, 6, 18, 'بوكس بالاسم ', 199.00, 0),
(22, 6, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(23, 6, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(24, 6, 2, 'باقة الحديقة الملكية', 450.00, 2),
(25, 7, 4, 'صندوق الفخامة الكبير', 750.00, 1),
(26, 7, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(27, 7, 2, 'باقة الحديقة الملكية', 450.00, 2),
(28, 8, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(29, 9, 3, 'تنسيق الفاوانيا الوردية', 280.00, 1),
(30, 10, 18, 'بوكس بالاسم ', 199.00, 0),
(31, 11, 2, 'باقة الحديقة الملكية', 450.00, 1),
(32, 12, 2, 'باقة الحديقة الملكية', 450.00, 1),
(33, 13, 18, 'box nem', 199.00, 0),
(34, 13, 2, 'Royal Garden Bouquet', 450.00, 1),
(35, 13, 3, 'Blush Peony Arrangement', 280.00, 1),
(36, 14, 8, 'Seasonal Wildflower Basket', 300.00, 1),
(37, 15, 5, 'أحلام اللافندر', 150.00, 1),
(38, 15, 6, 'أناقة الأوركيد', 420.00, 1),
(39, 15, 2, 'باقة الحديقة الملكية', 450.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages_content`
--

CREATE TABLE `pages_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_name` varchar(100) NOT NULL,
  `content_en` text DEFAULT NULL,
  `content_ar` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages_content`
--

INSERT INTO `pages_content` (`id`, `key_name`, `content_en`, `content_ar`, `updated_at`) VALUES
(1, 'hero_title', 'THE ART OF GIFTING', 'فن الهدايا', '2026-02-16 15:27:34'),
(2, 'hero_subtitle', 'Exquisite floral arrangements crafted with passion for life\'s most memorable moments', 'تنسيقات زهور رائعة صُنعت بشغف لأكثر لحظات الحياة التي لا تُنسى', '2026-02-16 15:27:34'),
(3, 'hero_cta_primary', 'Shop Collection', 'تسوق المجموعة', '2026-02-16 15:27:34'),
(4, 'hero_cta_secondary', 'Our Story', 'قصتنا', '2026-02-16 15:27:34'),
(5, 'about_text', 'At Luxeora Flowers, we believe that every bloom tells a story. Founded in the heart of the UAE, we are dedicated to creating extraordinary floral experiences that transform moments into lasting memories. Our master florists hand-select each flower, ensuring only the finest quality blooms grace our arrangements.', 'في لوكسيورا فلاورز، نؤمن أن كل زهرة تروي قصة. تأسسنا في قلب الإمارات العربية المتحدة، ونحن ملتزمون بخلق تجارب زهرية استثنائية تحول اللحظات إلى ذكريات دائمة. يختار خبراء الزهور لدينا كل زهرة يدويًا، لضمان أن أجود الزهور فقط تزين تنسيقاتنا.', '2026-02-16 15:27:34'),
(6, 'footer_about', 'Luxeora Flowers is the UAE\'s premier luxury florist, delivering exquisite arrangements for life\'s most cherished moments.', 'لوكسيورا فلاورز هي أرقى بائعي الزهور الفاخرة في الإمارات، تقدم تنسيقات رائعة لأعز لحظات الحياة.', '2026-02-16 15:27:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `badge` enum('none','new','bestseller') NOT NULL DEFAULT 'none',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name_en` varchar(255) DEFAULT NULL,
  `name_ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `price`, `sale_price`, `stock`, `is_active`, `badge`, `is_featured`, `created_at`, `updated_at`, `name_en`, `name_ar`) VALUES
(2, 'LXR-002', 520.00, 450.00, 12, 1, 'bestseller', 1, '2026-02-16 15:27:34', '2026-02-19 18:05:35', 'Royal Garden Bouquet', 'باقة الحديقة الملكية'),
(3, 'LXR-003', 280.00, NULL, 30, 1, 'none', 1, '2026-02-16 15:27:34', '2026-02-19 15:15:49', 'Blush Peony Arrangement', 'تنسيق الفاوانيا الوردية'),
(4, 'LXR-004', 750.00, NULL, 8, 1, 'new', 1, '2026-02-16 15:27:34', '2026-02-18 13:31:08', 'Grand Luxury Box', 'صندوق الفخامة الكبير'),
(5, 'LXR-005', 180.00, 150.00, 59, 1, 'none', 1, '2026-02-16 15:27:34', '2026-02-19 18:05:35', 'Lavender Dreams', 'أحلام اللافندر'),
(6, 'LXR-006', 420.00, NULL, 24, 1, 'bestseller', 1, '2026-02-16 15:27:34', '2026-02-19 18:05:35', 'Orchid Elegance', 'أناقة الأوركيد'),
(7, 'LXR-007', 650.00, 580.00, 20, 1, 'none', 1, '2026-02-16 15:27:34', '2026-02-16 20:50:38', 'Preserved Rose Dome', 'قبة الوردة المحفوظة'),
(8, 'LXR-008', 300.00, NULL, 34, 1, 'new', 1, '2026-02-16 15:27:34', '2026-02-19 15:18:30', 'Seasonal Wildflower Basket', 'سلة الزهور البرية الموسمية'),
(17, '23', 500.00, 199.00, 5, 1, 'new', 0, '2026-02-18 12:20:59', '2026-02-18 12:20:59', NULL, NULL),
(18, '23-1771419074', 500.00, 199.00, 0, 1, 'none', 1, '2026-02-18 12:51:14', '2026-02-18 12:51:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(7, 1),
(17, 1),
(18, 1),
(2, 2),
(5, 2),
(8, 2),
(18, 2),
(3, 3),
(18, 3),
(6, 4),
(18, 4),
(4, 5),
(17, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(500) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `sort_order`) VALUES
(2, 2, 'products/royal-garden-bouquet.jpg', 0),
(3, 3, 'products/blush-peony-arrangement.jpg', 0),
(4, 4, 'products/grand-luxury-box.jpg', 0),
(5, 5, 'products/lavender-dreams.jpg', 0),
(6, 6, 'products/orchid-elegance.jpg', 0),
(7, 7, 'products/preserved-rose-dome.jpg', 0),
(8, 8, 'products/seasonal-wildflower-basket.jpg', 0),
(9, 17, 'products/product-17-1771417259.jpg', 0),
(10, 18, 'products/product-18-1771419074.jpg', 0),
(11, 18, 'products/product-18-1771419074-0.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_occasions`
--

CREATE TABLE `product_occasions` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `occasion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_occasions`
--

INSERT INTO `product_occasions` (`product_id`, `occasion_id`) VALUES
(3, 1),
(7, 1),
(18, 1),
(4, 2),
(7, 2),
(2, 3),
(4, 3),
(2, 4),
(6, 4),
(8, 4),
(5, 5),
(3, 6),
(5, 6),
(6, 6),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `lang` enum('en','ar') NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `care_instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `lang`, `name`, `slug`, `short_desc`, `description`, `care_instructions`) VALUES
(3, 2, 'en', 'Royal Garden Bouquet', 'royal-garden-bouquet', 'An opulent mixed bouquet featuring roses, peonies, and hydrangeas.', 'The Royal Garden Bouquet is a masterpiece of floral artistry. Featuring a lush combination of garden roses, peonies, hydrangeas, and eucalyptus, each arrangement is designed to create a stunning visual impact. Presented in our signature hat box.', 'Display away from direct sunlight. Mist daily. Change water every 2-3 days.'),
(4, 2, 'ar', 'باقة الحديقة الملكية', 'باقة-الحديقة-الملكية', 'باقة مختلطة فاخرة تضم الورود والفاونيا والكوبية.', 'باقة الحديقة الملكية هي تحفة فنية من فن الأزهار. تضم مزيجًا خصبًا من ورود الحديقة والفاونيا والكوبية والأوكالبتوس، وكل تنسيق مصمم لخلق تأثير بصري مذهل. تُقدم في صندوقنا المميز.', 'ضعها بعيدًا عن أشعة الشمس المباشرة. رش الماء يوميًا. غيّر الماء كل 2-3 أيام.'),
(5, 3, 'en', 'Blush Peony Arrangement', 'blush-peony-arrangement', 'Delicate pink peonies artfully arranged in a crystal vase.', 'Our Blush Peony Arrangement features the most exquisite pink peonies, artfully arranged with soft greenery in a hand-cut crystal vase. A gift that speaks of refined taste and heartfelt emotion.', 'Keep in indirect light. Change water daily. Avoid drafts.'),
(6, 3, 'ar', 'تنسيق الفاوانيا الوردية', 'تنسيق-الفاوانيا-الوردية', 'فاوانيا وردية رقيقة منسقة بفن في مزهرية كريستال.', 'يتميز تنسيق الفاوانيا الوردية بأجمل زهور الفاوانيا الوردية، منسقة بفنية مع خضرة ناعمة في مزهرية كريستال مقطوعة يدويًا. هدية تعبر عن الذوق الرفيع والمشاعر الصادقة.', 'احفظها في ضوء غير مباشر. غيّر الماء يوميًا. تجنب التيارات الهوائية.'),
(7, 4, 'en', 'Grand Luxury Box', 'grand-luxury-box', 'Our signature luxury flower box with 50 premium roses.', 'The Grand Luxury Box is the ultimate expression of luxury gifting. Featuring 50 premium Ecuadorian roses meticulously arranged in our handcrafted velvet-lined box. Each box is finished with gold foil branding and a personalized card.', 'Keep lid open when displaying. Mist roses gently every other day.'),
(8, 4, 'ar', 'صندوق الفخامة الكبير', 'صندوق-الفخامة-الكبير', 'صندوق الزهور الفاخر المميز مع 50 وردة فاخرة.', 'صندوق الفخامة الكبير هو التعبير الأسمى عن الهدايا الفاخرة. يضم 50 وردة إكوادورية فاخرة مرتبة بدقة في صندوقنا المصنوع يدويًا والمبطن بالمخمل. كل صندوق مزين بشعار رقائق الذهب وبطاقة شخصية.', 'أبقِ الغطاء مفتوحًا عند العرض. رش الورود بلطف كل يومين.'),
(9, 5, 'en', 'Lavender Dreams', 'lavender-dreams', 'A soothing arrangement of lavender and complementary blooms.', 'Let the calming beauty of Lavender Dreams transform any space. This arrangement combines fresh lavender stems with complementary purple and white blooms, creating a serene and fragrant display perfect for any occasion.', 'Keep in a cool, well-ventilated area. Change water every 3 days.'),
(10, 5, 'ar', 'أحلام اللافندر', 'أحلام-اللافندر', 'تنسيق مريح من اللافندر والأزهار المكملة.', 'دع جمال أحلام اللافندر المهدئ يحول أي مساحة. يجمع هذا التنسيق بين سيقان اللافندر الطازجة والأزهار البنفسجية والبيضاء المكملة، مما يخلق عرضًا هادئًا وعطرًا مثاليًا لأي مناسبة.', 'احفظها في مكان بارد وجيد التهوية. غيّر الماء كل 3 أيام.'),
(11, 6, 'en', 'Orchid Elegance', 'orchid-elegance', 'Stunning white phalaenopsis orchids in a designer ceramic pot.', 'Orchid Elegance features three stems of pristine white phalaenopsis orchids, presented in a hand-glazed designer ceramic pot. This long-lasting plant makes a sophisticated gift or addition to any luxurious interior.', 'Indirect bright light. Water once a week. Do not overwater.'),
(12, 6, 'ar', 'أناقة الأوركيد', 'أناقة-الأوركيد', 'أوركيد فالاينوبسيس أبيض مذهل في وعاء سيراميك مصمم.', 'تتميز أناقة الأوركيد بثلاثة سيقان من أوركيد فالاينوبسيس الأبيض النقي، مقدمة في وعاء سيراميك مصمم ومطلي يدويًا. هذا النبات طويل العمر يشكل هدية راقية أو إضافة لأي ديكور فاخر.', 'ضوء ساطع غير مباشر. اسقِ مرة أسبوعيًا. لا تفرط في الري.'),
(13, 7, 'en', 'Preserved Rose Dome', 'preserved-rose-dome', 'A single preserved rose under a glass dome, lasting years.', 'Inspired by timeless romance, our Preserved Rose Dome features a single Ecuadorian rose, carefully preserved to last for years. Displayed under an elegant glass dome on a wooden base, this piece is a lasting symbol of love and beauty.', 'No water needed. Keep away from direct sunlight and humidity.'),
(14, 7, 'ar', 'قبة الوردة المحفوظة', 'قبة-الوردة-المحفوظة', 'وردة محفوظة واحدة تحت قبة زجاجية تدوم لسنوات.', 'مستوحاة من الرومانسية الخالدة، تتميز قبة الوردة المحفوظة بوردة إكوادورية واحدة محفوظة بعناية لتدوم لسنوات. معروضة تحت قبة زجاجية أنيقة على قاعدة خشبية، هذه القطعة رمز دائم للحب والجمال.', 'لا تحتاج ماء. احفظها بعيدًا عن أشعة الشمس المباشرة والرطوبة.'),
(15, 8, 'en', 'Seasonal Wildflower Basket', 'seasonal-wildflower-basket', 'A charming basket of seasonal wildflowers and meadow blooms.', 'Celebrate nature with our Seasonal Wildflower Basket. A curated selection of the freshest seasonal wildflowers and meadow blooms, arranged in a hand-woven basket. Each arrangement is unique, capturing the beauty of the current season.', 'Keep in a cool spot. Add water to the floral foam daily. Enjoy for 5-7 days.'),
(16, 8, 'ar', 'سلة الزهور البرية الموسمية', 'سلة-الزهور-البرية-الموسمية', 'سلة ساحرة من الزهور البرية الموسمية وأزهار المروج.', 'احتفل بالطبيعة مع سلة الزهور البرية الموسمية. مجموعة منتقاة من أنعش الزهور البرية الموسمية وأزهار المروج، مرتبة في سلة منسوجة يدويًا. كل تنسيق فريد من نوعه، يلتقط جمال الموسم الحالي.', 'احفظها في مكان بارد. أضف الماء إلى إسفنج الزهور يوميًا. استمتع بها لمدة 5-7 أيام.'),
(29, 17, 'en', 'box nem', 'box-nem', '', '', ''),
(30, 17, 'ar', 'بوكس بالاسم ', 'بوكس-بالاسم', '', '', ''),
(33, 18, 'en', 'box nem', 'box-nem-33', '', '', ''),
(34, 18, 'ar', 'بوكس بالاسم ', 'بوكس-بالاسم-34', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `name_ar` varchar(150) NOT NULL,
  `text_en` text NOT NULL,
  `text_ar` text NOT NULL,
  `rating` tinyint(4) NOT NULL DEFAULT 5,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name_en`, `name_ar`, `text_en`, `text_ar`, `rating`, `is_active`, `created_at`) VALUES
(1, 'Sarah Al Maktoum', 'سارة المكتوم', 'Absolutely stunning arrangements! Luxeora exceeded all my expectations for my wedding. The flowers were fresh, beautifully presented, and the service was impeccable.', 'تنسيقات مذهلة حقًا! فاقت لوكسيورا كل توقعاتي لحفل زفافي. كانت الزهور طازجة ومقدمة بشكل جميل والخدمة لا تشوبها شائبة.', 5, 1, '2026-02-16 15:27:34'),
(2, 'Ahmed Hassan', 'أحمد حسن', 'I have been ordering from Luxeora for all special occasions. Their luxury boxes make the perfect gift every time. Outstanding quality and attention to detail.', 'لقد كنت أطلب من لوكسيورا لجميع المناسبات الخاصة. صناديقهم الفاخرة تشكل الهدية المثالية في كل مرة. جودة رائعة واهتمام بالتفاصيل.', 5, 1, '2026-02-16 15:27:34'),
(3, 'Fatima Al Rashid', 'فاطمة الراشد', 'The preserved rose dome I received was breathtaking. It has been months and it still looks as beautiful as the day it arrived. A truly magical gift from Luxeora.', 'قبة الوردة المحفوظة التي تلقيتها كانت أخّاذة. مرت أشهر ولا تزال جميلة كما في اليوم الذي وصلت فيه. هدية سحرية حقًا من لوكسيورا.', 5, 1, '2026-02-16 15:27:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_lang` (`category_id`,`lang`);

--
-- Indexes for table `cms_content`
--
ALTER TABLE `cms_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_key` (`page_key`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ip_time` (`ip_address`,`attempted_at`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `occasions`
--
ALTER TABLE `occasions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `occasion_lang` (`occasion_id`,`lang`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `idx_stripe_session` (`stripe_session_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pages_content`
--
ALTER TABLE `pages_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_name` (`key_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_occasions`
--
ALTER TABLE `product_occasions`
  ADD PRIMARY KEY (`product_id`,`occasion_id`),
  ADD KEY `occasion_id` (`occasion_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_lang` (`product_id`,`lang`),
  ADD UNIQUE KEY `lang_slug` (`lang`,`slug`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cms_content`
--
ALTER TABLE `cms_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pages_content`
--
ALTER TABLE `pages_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  ADD CONSTRAINT `occasion_translations_ibfk_1` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_occasions`
--
ALTER TABLE `product_occasions`
  ADD CONSTRAINT `product_occasions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_occasions_ibfk_2` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
