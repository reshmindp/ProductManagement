-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2025 at 01:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'et', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(2, 'iusto', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(3, 'possimus', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(4, 'quia', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(5, 'consequatur', '2025-03-07 06:29:07', '2025-03-07 06:29:07');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_03_07_085157_create_categories_table', 1),
(6, '2025_03_07_085417_create_products_table', 1),
(7, '2025_03_07_085614_create_orders_table', 1),
(8, '2025_03_07_085702_create_order_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 5, '997.62', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(2, 6, '964.94', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(3, 6, '850.12', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(4, 3, '109.70', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(5, 2, '206.92', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(6, 2, '916.31', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(7, 4, '716.87', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(8, 4, '816.79', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(9, 1, '781.82', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(10, 5, '987.04', '2025-03-07 06:29:07', '2025-03-07 06:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 4, '21.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(2, 1, 13, 4, '21.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(3, 1, 17, 4, '21.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(4, 2, 8, 5, '76.80', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(5, 2, 12, 5, '76.80', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(6, 2, 14, 5, '76.80', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(7, 2, 18, 5, '76.80', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(8, 2, 19, 5, '76.80', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(9, 3, 8, 2, '14.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(10, 3, 9, 2, '14.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(11, 3, 12, 2, '14.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(12, 3, 18, 2, '14.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(13, 4, 2, 1, '19.70', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(14, 5, 3, 4, '98.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(15, 5, 6, 4, '98.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(16, 5, 7, 4, '98.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(17, 5, 15, 4, '98.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(18, 5, 18, 4, '98.60', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(19, 6, 19, 1, '93.30', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(20, 7, 16, 5, '72.20', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(21, 7, 18, 5, '72.20', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(22, 8, 13, 4, '81.30', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(23, 9, 3, 4, '25.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(24, 9, 14, 4, '25.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(25, 9, 17, 4, '25.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(26, 9, 19, 4, '25.00', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(27, 10, 7, 3, '97.30', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(28, 10, 13, 3, '97.30', '2025-03-07 06:29:07', '2025-03-07 06:29:07');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API Token', '0a7ad23ad5416d3c89c97a535760c4ddc128496bbe1b7dd640b6f28b0f7a97c7', '[\"*\"]', NULL, NULL, '2025-03-07 06:55:38', '2025-03-07 06:55:38'),
(2, 'App\\Models\\User', 1, 'API Token', '3064e9e50765b1a0a8a27408367eecd98e947a1cfecf99e1f31ab7b522da3595', '[\"*\"]', '2025-03-07 07:22:50', NULL, '2025-03-07 07:05:21', '2025-03-07 07:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `description`, `stock_quantity`, `created_by`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'est', '305.96', 4, 'Sed nisi veritatis ut vel molestiae.', 83, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(2, 'libero', '370.89', 4, 'Vel ut vel aut aut nisi commodi.', 98, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(3, 'facere', '127.80', 2, 'Aliquam quia alias velit.', 98, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(4, 'ullam', '280.00', 2, 'Minus quibusdam aut necessitatibus id rem.', 96, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(5, 'placeat', '244.88', 1, 'Deserunt praesentium rerum repellendus maiores sed enim.', 16, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(6, 'aliquam', '247.89', 2, 'Maiores id deleniti et est est harum quia.', 52, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(7, 'nam', '255.61', 2, 'Vel occaecati praesentium distinctio consequatur.', 23, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(8, 'reprehenderit', '499.57', 2, 'Eius ut quas molestiae sit.', 42, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(9, 'fuga', '152.48', 5, 'Dicta possimus sunt voluptatum ullam.', 30, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(10, 'non', '315.51', 3, 'Autem aut accusamus id deleniti pariatur.', 79, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(11, 'numquam', '46.92', 4, 'Laboriosam nobis ut at voluptatibus eum consequatur.', 74, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(12, 'sequi', '491.58', 1, 'In sunt harum eveniet aspernatur.', 22, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(13, 'et', '371.57', 4, 'Qui impedit modi quos ipsam.', 56, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(14, 'similique', '29.03', 4, 'Tempora omnis sed laborum sed ut.', 52, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(15, 'eum', '343.98', 5, 'Sapiente doloribus est sed placeat culpa.', 40, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(16, 'nihil', '205.99', 2, 'Facere esse adipisci est iure tempore temporibus eos.', 29, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(17, 'at', '412.79', 1, 'Porro qui voluptatem cumque ea officia dignissimos.', 36, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(18, 'veritatis', '453.17', 5, 'Sit alias dignissimos natus eligendi earum aut sit.', 88, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(19, 'illo', '102.55', 5, 'Aut voluptatem et architecto ut.', 37, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(20, 'non', '193.01', 2, 'Ratione voluptatem et sapiente nobis qui harum.', 86, 1, 'public/assets/images/product.png', '2025-03-07 06:29:07', '2025-03-07 06:29:07');

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
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@ecommerce.com', '2025-03-07 06:29:07', '$2y$12$1BZYweXLhiahe1HpHH/qDOtNNEGktumiyufVXiGNq1lS7GlmAtKdO', 'admin', '7MMzjIaV3q', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(2, 'Obie Reichert', 'eugenia38@example.com', '2025-03-07 06:29:07', '$2y$12$koYgYfxJ/7zuGWh1icITTeVjg5HPvM8iTP/u5MPwFsg9qHtJ39ZlS', 'user', '0fYpuDqpMw', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(3, 'Dr. Carter Williamson', 'norwood.rosenbaum@example.org', '2025-03-07 06:29:07', '$2y$12$koYgYfxJ/7zuGWh1icITTeVjg5HPvM8iTP/u5MPwFsg9qHtJ39ZlS', 'user', 'ToTWEpdwWs', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(4, 'Dr. Bo Heathcote IV', 'meagan16@example.net', '2025-03-07 06:29:07', '$2y$12$koYgYfxJ/7zuGWh1icITTeVjg5HPvM8iTP/u5MPwFsg9qHtJ39ZlS', 'user', 'OdtFnQiIAG', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(5, 'Lizzie Gottlieb Jr.', 'wweimann@example.net', '2025-03-07 06:29:07', '$2y$12$koYgYfxJ/7zuGWh1icITTeVjg5HPvM8iTP/u5MPwFsg9qHtJ39ZlS', 'user', 'rN3CupxMw4', '2025-03-07 06:29:07', '2025-03-07 06:29:07'),
(6, 'Prof. Rosemary Schroeder DVM', 'adam.koss@example.org', '2025-03-07 06:29:07', '$2y$12$koYgYfxJ/7zuGWh1icITTeVjg5HPvM8iTP/u5MPwFsg9qHtJ39ZlS', 'user', 'NrpzknQ3ZL', '2025-03-07 06:29:07', '2025-03-07 06:29:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_created_by_foreign` (`created_by`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
