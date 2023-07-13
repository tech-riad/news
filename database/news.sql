-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 11:02 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'NV7hR4kWdfmUVNKrza4AWljxD23p8KoF', 1, '2023-06-25 08:38:42', '2023-06-25 08:38:42', '2023-06-25 08:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_name` varchar(191) DEFAULT NULL,
  `ad_size` varchar(191) DEFAULT NULL,
  `ad_type` varchar(191) DEFAULT NULL,
  `ad_url` varchar(191) DEFAULT NULL,
  `ad_image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ad_code` longtext DEFAULT NULL,
  `ad_text` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `ad_name`, `ad_size`, `ad_type`, `ad_url`, `ad_image_id`, `ad_code`, `ad_text`, `created_at`, `updated_at`) VALUES
(1, 'Buy Now', '970*90', 'image', '', 51, NULL, NULL, '2023-06-25 08:38:41', '2023-06-25 08:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `ad_locations`
--

CREATE TABLE `ad_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `unique_name` varchar(191) NOT NULL,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_locations`
--

INSERT INTO `ad_locations` (`id`, `title`, `unique_name`, `ad_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Top Banner', 'top_banner', NULL, 1, NULL, NULL),
(2, 'Home Page Middle', 'home_page_middle', NULL, 1, NULL, NULL),
(3, 'Home Page Bottom', 'home_page_bottom', NULL, 1, NULL, NULL),
(4, 'Widget', 'widget', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `tabs` varchar(191) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `original_image` varchar(191) DEFAULT NULL COMMENT 'cover image',
  `thumbnail` varchar(191) DEFAULT NULL COMMENT 'cover image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_intros`
--

CREATE TABLE `app_intros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `disk` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `audio_name` varchar(191) NOT NULL,
  `disk` varchar(191) NOT NULL,
  `original` text NOT NULL,
  `audio_mp3` text NOT NULL,
  `audio_ogg` text NOT NULL,
  `duration` text NOT NULL,
  `audio_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audio_post`
--

CREATE TABLE `audio_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `audio_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `is_featured` tinyint(1) NOT NULL COMMENT '0 for not, 1 for featured',
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `language`, `slug`, `is_featured`, `meta_description`, `meta_keywords`, `order`, `created_at`, `updated_at`) VALUES
(1, 'World', 'en', 'world', 0, NULL, NULL, 1, '2023-06-25 08:38:55', '2023-06-25 08:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `message_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crons`
--

CREATE TABLE `crons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cron_for` varchar(191) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email_group` varchar(191) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `template_body` longtext DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_group`, `subject`, `template_body`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'registration', 'Registration successful', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br /> To open your {SITE_NAME} homepage, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{SITE_URL}\"><strong>{SITE_NAME} Account</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /><br />{SITE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /><br /><br />{SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>', 'en', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(2, 'forgot_password', 'Forgot Password', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Forgot your password, huh? No big deal.<br />To create a new password, just follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{PASS_KEY_URL}\"><strong>Create new password</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {PASS_KEY_URL}<br /><br /> You received this email, because it was requested by a {SITE_NAME} user.This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.<br /><br />Thank you,<br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>', 'en', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(3, 'activate_account', 'Activate Account', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>Activate Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe. To verify your email address, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{ACTIVATE_URL}\"><strong>Complete Registration</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {ACTIVATE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /> Your password: {PASSWORD}<br /><br /><br /> {SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table><p>&nbsp;</p>', 'en', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(4, 'reset_password', 'Reset Password', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">You have changed your password.<br />Please, keep it in your records so you don\'t forget it:<br />Your username: {USERNAME}<br />Your email address: {USER_EMAIL}<br />Your new password: {NEW_PASSWORD}<br /><br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>', 'en', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(5, 'registration', 'Registration successful', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe.<br /> To open your {SITE_NAME} homepage, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{SITE_URL}\"><strong>{SITE_NAME} Account</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /><br />{SITE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /><br /><br />{SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>', 'ar', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(6, 'activate_account', 'Activate Account', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Forgot your password, huh? No big deal.<br />To create a new password, just follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{PASS_KEY_URL}\"><strong>Create new password</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {PASS_KEY_URL}<br /><br /> You received this email, because it was requested by a {SITE_NAME} user.This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same.<br /><br />Thank you,<br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>', 'ar', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(7, 'reset_password', 'Reset Password', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>Activate Account</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">Thanks for joining {SITE_NAME}. We listed your sign in details below, make sure you keep them safe. To verify your email address, please follow this link:<br /> <a style=\"color: #11a7db; text-decoration: none;\" href=\"{ACTIVATE_URL}\"><strong>Complete Registration</strong></a><br /><br /> Link doesn\'t work? Copy the following link to your browser address bar:<br /> {ACTIVATE_URL}<br /><br /> Your username: {USERNAME}<br /> Your email address: {USER_EMAIL}<br /> Your password: {PASSWORD}<br /><br /><br /> {SIGNATURE}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table><p>&nbsp;</p>', 'ar', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(8, 'forgot_password', 'Forgot Password', '<table id=\"backgroundTable\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td valign=\"top\"><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td width=\"600\" height=\"50\">&nbsp;</td></tr><tr><td style=\"color: #999999;\" width=\"600\" height=\"90\">{SITE_LOGO}</td></tr><tr><td style=\"background: whitesmoke; border: 1px solid #e0e0e0; font-family: Helvetica,Arial,sans-serif;\" valign=\"top\" bgcolor=\"whitesmoke\" width=\"600\" height=\"200\"><table style=\"margin-left: 15px;\" align=\"center\"><tbody><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr><tr><td width=\"560\"><h4>New Password</h4><p style=\"font-size: 12px; font-family: Helvetica,Arial,sans-serif;\">Hi {USERNAME},</p><p style=\"font-size: 12px; line-height: 20px; font-family: Helvetica,Arial,sans-serif;\">You have changed your password.<br />Please, keep it in your records so you don\'t forget it:<br />Your username: {USERNAME}<br />Your email address: {USER_EMAIL}<br />Your new password: {NEW_PASSWORD}<br /><br /><br /> Best Regards,<br /> {SITE_NAME}</p></td></tr><tr><td width=\"560\" height=\"10\">&nbsp;</td></tr></tbody></table></td></tr><tr><td width=\"600\" height=\"10\">&nbsp;</td></tr><tr><td align=\"right\"><span style=\"font-size: 10px; color: #999999; font-family: Helvetica,Arial,sans-serif;\">{SIGNATURE}</span></td></tr></tbody></table></td></tr></tbody></table>', 'ar', '2023-06-25 08:38:55', '2023-06-25 08:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flag_icons`
--

CREATE TABLE `flag_icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon_class` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flag_icons`
--

INSERT INTO `flag_icons` (`id`, `icon_class`, `title`, `created_at`, `updated_at`) VALUES
(1, 'flag-icon flag-icon-ad', 'ad', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(2, 'flag-icon flag-icon-ae', 'ae', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(3, 'flag-icon flag-icon-af', 'af', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(4, 'flag-icon flag-icon-ag', 'ag', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(5, 'flag-icon flag-icon-ai', 'ai', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(6, 'flag-icon flag-icon-al', 'al', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(7, 'flag-icon flag-icon-am', 'am', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(8, 'flag-icon flag-icon-ao', 'ao', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(9, 'flag-icon flag-icon-aq', 'aq', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(10, 'flag-icon flag-icon-ar', 'ar', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(11, 'flag-icon flag-icon-as', 'as', '2023-06-25 08:38:57', '2023-06-25 08:38:57'),
(12, 'flag-icon flag-icon-at', 'at', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(13, 'flag-icon flag-icon-au', 'au', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(14, 'flag-icon flag-icon-aw', 'aw', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(15, 'flag-icon flag-icon-ax', 'ax', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(16, 'flag-icon flag-icon-az', 'az', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(17, 'flag-icon flag-icon-ba', 'ba', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(18, 'flag-icon flag-icon-bb', 'bb', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(19, 'flag-icon flag-icon-bd', 'bd', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(20, 'flag-icon flag-icon-be', 'be', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(21, 'flag-icon flag-icon-bf', 'bf', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(22, 'flag-icon flag-icon-bg', 'bg', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(23, 'flag-icon flag-icon-bh', 'bh', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(24, 'flag-icon flag-icon-bi', 'bi', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(25, 'flag-icon flag-icon-bj', 'bj', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(26, 'flag-icon flag-icon-bl', 'bl', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(27, 'flag-icon flag-icon-bm', 'bm', '2023-06-25 08:38:58', '2023-06-25 08:38:58'),
(28, 'flag-icon flag-icon-bn', 'bn', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(29, 'flag-icon flag-icon-bo', 'bo', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(30, 'flag-icon flag-icon-bq', 'bq', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(31, 'flag-icon flag-icon-br', 'br', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(32, 'flag-icon flag-icon-bs', 'bs', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(33, 'flag-icon flag-icon-bt', 'bt', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(34, 'flag-icon flag-icon-bv', 'bv', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(35, 'flag-icon flag-icon-bw', 'bw', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(36, 'flag-icon flag-icon-by', 'by', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(37, 'flag-icon flag-icon-bz', 'bz', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(38, 'flag-icon flag-icon-ca', 'ca', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(39, 'flag-icon flag-icon-cc', 'cc', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(40, 'flag-icon flag-icon-cd', 'cd', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(41, 'flag-icon flag-icon-cf', 'cf', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(42, 'flag-icon flag-icon-cg', 'cg', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(43, 'flag-icon flag-icon-ch', 'ch', '2023-06-25 08:38:59', '2023-06-25 08:38:59'),
(44, 'flag-icon flag-icon-ci', 'ci', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(45, 'flag-icon flag-icon-ck', 'ck', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(46, 'flag-icon flag-icon-cl', 'cl', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(47, 'flag-icon flag-icon-cm', 'cm', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(48, 'flag-icon flag-icon-cn', 'cn', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(49, 'flag-icon flag-icon-co', 'co', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(50, 'flag-icon flag-icon-cr', 'cr', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(51, 'flag-icon flag-icon-cu', 'cu', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(52, 'flag-icon flag-icon-cv', 'cv', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(53, 'flag-icon flag-icon-cw', 'cw', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(54, 'flag-icon flag-icon-cx', 'cx', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(55, 'flag-icon flag-icon-cy', 'cy', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(56, 'flag-icon flag-icon-cz', 'cz', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(57, 'flag-icon flag-icon-de', 'de', '2023-06-25 08:39:00', '2023-06-25 08:39:00'),
(58, 'flag-icon flag-icon-dj', 'dj', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(59, 'flag-icon flag-icon-dk', 'dk', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(60, 'flag-icon flag-icon-dm', 'dm', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(61, 'flag-icon flag-icon-do', 'do', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(62, 'flag-icon flag-icon-dz', 'dz', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(63, 'flag-icon flag-icon-ec', 'ec', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(64, 'flag-icon flag-icon-ee', 'ee', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(65, 'flag-icon flag-icon-eg', 'eg', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(66, 'flag-icon flag-icon-eh', 'eh', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(67, 'flag-icon flag-icon-er', 'er', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(68, 'flag-icon flag-icon-es', 'es', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(69, 'flag-icon flag-icon-et', 'et', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(70, 'flag-icon flag-icon-fi', 'fi', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(71, 'flag-icon flag-icon-fj', 'fj', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(72, 'flag-icon flag-icon-fk', 'fk', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(73, 'flag-icon flag-icon-fm', 'fm', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(74, 'flag-icon flag-icon-fo', 'fo', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(75, 'flag-icon flag-icon-fr', 'fr', '2023-06-25 08:39:01', '2023-06-25 08:39:01'),
(76, 'flag-icon flag-icon-ga', 'ga', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(77, 'flag-icon flag-icon-gb', 'gb', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(78, 'flag-icon flag-icon-gd', 'gd', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(79, 'flag-icon flag-icon-ge', 'ge', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(80, 'flag-icon flag-icon-gf', 'gf', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(81, 'flag-icon flag-icon-gg', 'gg', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(82, 'flag-icon flag-icon-gh', 'gh', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(83, 'flag-icon flag-icon-gi', 'gi', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(84, 'flag-icon flag-icon-gl', 'gl', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(85, 'flag-icon flag-icon-gm', 'gm', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(86, 'flag-icon flag-icon-gn', 'gn', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(87, 'flag-icon flag-icon-gp', 'gp', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(88, 'flag-icon flag-icon-gq', 'gq', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(89, 'flag-icon flag-icon-gr', 'gr', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(90, 'flag-icon flag-icon-gs', 'gs', '2023-06-25 08:39:02', '2023-06-25 08:39:02'),
(91, 'flag-icon flag-icon-gt', 'gt', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(92, 'flag-icon flag-icon-gu', 'gu', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(93, 'flag-icon flag-icon-gw', 'gw', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(94, 'flag-icon flag-icon-gy', 'gy', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(95, 'flag-icon flag-icon-hk', 'hk', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(96, 'flag-icon flag-icon-hm', 'hm', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(97, 'flag-icon flag-icon-hn', 'hn', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(98, 'flag-icon flag-icon-hr', 'hr', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(99, 'flag-icon flag-icon-ht', 'ht', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(100, 'flag-icon flag-icon-hu', 'hu', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(101, 'flag-icon flag-icon-id', 'id', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(102, 'flag-icon flag-icon-ie', 'ie', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(103, 'flag-icon flag-icon-il', 'il', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(104, 'flag-icon flag-icon-im', 'im', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(105, 'flag-icon flag-icon-in', 'in', '2023-06-25 08:39:03', '2023-06-25 08:39:03'),
(106, 'flag-icon flag-icon-io', 'io', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(107, 'flag-icon flag-icon-iq', 'iq', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(108, 'flag-icon flag-icon-ir', 'ir', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(109, 'flag-icon flag-icon-is', 'is', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(110, 'flag-icon flag-icon-it', 'it', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(111, 'flag-icon flag-icon-je', 'je', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(112, 'flag-icon flag-icon-jm', 'jm', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(113, 'flag-icon flag-icon-jo', 'jo', '2023-06-25 08:39:04', '2023-06-25 08:39:04'),
(114, 'flag-icon flag-icon-jp', 'jp', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(115, 'flag-icon flag-icon-ke', 'ke', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(116, 'flag-icon flag-icon-kg', 'kg', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(117, 'flag-icon flag-icon-kh', 'kh', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(118, 'flag-icon flag-icon-ki', 'ki', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(119, 'flag-icon flag-icon-km', 'km', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(120, 'flag-icon flag-icon-kn', 'kn', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(121, 'flag-icon flag-icon-kp', 'kp', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(122, 'flag-icon flag-icon-kr', 'kr', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(123, 'flag-icon flag-icon-kw', 'kw', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(124, 'flag-icon flag-icon-ky', 'ky', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(125, 'flag-icon flag-icon-kz', 'kz', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(126, 'flag-icon flag-icon-la', 'la', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(127, 'flag-icon flag-icon-lb', 'lb', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(128, 'flag-icon flag-icon-lc', 'lc', '2023-06-25 08:39:05', '2023-06-25 08:39:05'),
(129, 'flag-icon flag-icon-li', 'li', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(130, 'flag-icon flag-icon-lk', 'lk', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(131, 'flag-icon flag-icon-lr', 'lr', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(132, 'flag-icon flag-icon-ls', 'ls', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(133, 'flag-icon flag-icon-lt', 'lt', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(134, 'flag-icon flag-icon-lu', 'lu', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(135, 'flag-icon flag-icon-lv', 'lv', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(136, 'flag-icon flag-icon-ly', 'ly', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(137, 'flag-icon flag-icon-ma', 'ma', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(138, 'flag-icon flag-icon-mc', 'mc', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(139, 'flag-icon flag-icon-md', 'md', '2023-06-25 08:39:06', '2023-06-25 08:39:06'),
(140, 'flag-icon flag-icon-me', 'me', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(141, 'flag-icon flag-icon-mf', 'mf', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(142, 'flag-icon flag-icon-mg', 'mg', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(143, 'flag-icon flag-icon-mh', 'mh', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(144, 'flag-icon flag-icon-mk', 'mk', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(145, 'flag-icon flag-icon-ml', 'ml', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(146, 'flag-icon flag-icon-mm', 'mm', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(147, 'flag-icon flag-icon-mn', 'mn', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(148, 'flag-icon flag-icon-mo', 'mo', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(149, 'flag-icon flag-icon-mp', 'mp', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(150, 'flag-icon flag-icon-mq', 'mq', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(151, 'flag-icon flag-icon-mr', 'mr', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(152, 'flag-icon flag-icon-ms', 'ms', '2023-06-25 08:39:07', '2023-06-25 08:39:07'),
(153, 'flag-icon flag-icon-mt', 'mt', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(154, 'flag-icon flag-icon-mu', 'mu', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(155, 'flag-icon flag-icon-mv', 'mv', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(156, 'flag-icon flag-icon-mw', 'mw', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(157, 'flag-icon flag-icon-mx', 'mx', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(158, 'flag-icon flag-icon-my', 'my', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(159, 'flag-icon flag-icon-mz', 'mz', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(160, 'flag-icon flag-icon-na', 'na', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(161, 'flag-icon flag-icon-nc', 'nc', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(162, 'flag-icon flag-icon-ne', 'ne', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(163, 'flag-icon flag-icon-nf', 'nf', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(164, 'flag-icon flag-icon-ng', 'ng', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(165, 'flag-icon flag-icon-ni', 'ni', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(166, 'flag-icon flag-icon-nl', 'nl', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(167, 'flag-icon flag-icon-no', 'no', '2023-06-25 08:39:08', '2023-06-25 08:39:08'),
(168, 'flag-icon flag-icon-np', 'np', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(169, 'flag-icon flag-icon-nr', 'nr', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(170, 'flag-icon flag-icon-nu', 'nu', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(171, 'flag-icon flag-icon-nz', 'nz', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(172, 'flag-icon flag-icon-om', 'om', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(173, 'flag-icon flag-icon-pa', 'pa', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(174, 'flag-icon flag-icon-pe', 'pe', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(175, 'flag-icon flag-icon-pf', 'pf', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(176, 'flag-icon flag-icon-pg', 'pg', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(177, 'flag-icon flag-icon-ph', 'ph', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(178, 'flag-icon flag-icon-pk', 'pk', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(179, 'flag-icon flag-icon-pl', 'pl', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(180, 'flag-icon flag-icon-pm', 'pm', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(181, 'flag-icon flag-icon-pn', 'pn', '2023-06-25 08:39:09', '2023-06-25 08:39:09'),
(182, 'flag-icon flag-icon-pr', 'pr', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(183, 'flag-icon flag-icon-ps', 'ps', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(184, 'flag-icon flag-icon-pt', 'pt', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(185, 'flag-icon flag-icon-pw', 'pw', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(186, 'flag-icon flag-icon-py', 'py', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(187, 'flag-icon flag-icon-qa', 'qa', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(188, 'flag-icon flag-icon-re', 're', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(189, 'flag-icon flag-icon-ro', 'ro', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(190, 'flag-icon flag-icon-rs', 'rs', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(191, 'flag-icon flag-icon-ru', 'ru', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(192, 'flag-icon flag-icon-rw', 'rw', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(193, 'flag-icon flag-icon-sa', 'sa', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(194, 'flag-icon flag-icon-sb', 'sb', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(195, 'flag-icon flag-icon-sc', 'sc', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(196, 'flag-icon flag-icon-sd', 'sd', '2023-06-25 08:39:10', '2023-06-25 08:39:10'),
(197, 'flag-icon flag-icon-se', 'se', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(198, 'flag-icon flag-icon-sg', 'sg', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(199, 'flag-icon flag-icon-sh', 'sh', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(200, 'flag-icon flag-icon-si', 'si', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(201, 'flag-icon flag-icon-sj', 'sj', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(202, 'flag-icon flag-icon-sk', 'sk', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(203, 'flag-icon flag-icon-sl', 'sl', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(204, 'flag-icon flag-icon-sm', 'sm', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(205, 'flag-icon flag-icon-sn', 'sn', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(206, 'flag-icon flag-icon-so', 'so', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(207, 'flag-icon flag-icon-sr', 'sr', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(208, 'flag-icon flag-icon-ss', 'ss', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(209, 'flag-icon flag-icon-st', 'st', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(210, 'flag-icon flag-icon-sv', 'sv', '2023-06-25 08:39:11', '2023-06-25 08:39:11'),
(211, 'flag-icon flag-icon-sx', 'sx', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(212, 'flag-icon flag-icon-sy', 'sy', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(213, 'flag-icon flag-icon-sz', 'sz', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(214, 'flag-icon flag-icon-tc', 'tc', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(215, 'flag-icon flag-icon-td', 'td', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(216, 'flag-icon flag-icon-tf', 'tf', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(217, 'flag-icon flag-icon-tg', 'tg', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(218, 'flag-icon flag-icon-th', 'th', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(219, 'flag-icon flag-icon-tj', 'tj', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(220, 'flag-icon flag-icon-tk', 'tk', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(221, 'flag-icon flag-icon-tl', 'tl', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(222, 'flag-icon flag-icon-tm', 'tm', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(223, 'flag-icon flag-icon-tn', 'tn', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(224, 'flag-icon flag-icon-to', 'to', '2023-06-25 08:39:12', '2023-06-25 08:39:12'),
(225, 'flag-icon flag-icon-tr', 'tr', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(226, 'flag-icon flag-icon-tt', 'tt', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(227, 'flag-icon flag-icon-tv', 'tv', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(228, 'flag-icon flag-icon-tw', 'tw', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(229, 'flag-icon flag-icon-tz', 'tz', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(230, 'flag-icon flag-icon-ua', 'ua', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(231, 'flag-icon flag-icon-ug', 'ug', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(232, 'flag-icon flag-icon-um', 'um', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(233, 'flag-icon flag-icon-us', 'us', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(234, 'flag-icon flag-icon-uy', 'uy', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(235, 'flag-icon flag-icon-uz', 'uz', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(236, 'flag-icon flag-icon-va', 'va', '2023-06-25 08:39:13', '2023-06-25 08:39:13'),
(237, 'flag-icon flag-icon-vc', 'vc', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(238, 'flag-icon flag-icon-ve', 've', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(239, 'flag-icon flag-icon-vg', 'vg', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(240, 'flag-icon flag-icon-vi', 'vi', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(241, 'flag-icon flag-icon-vn', 'vn', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(242, 'flag-icon flag-icon-vu', 'vu', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(243, 'flag-icon flag-icon-wf', 'wf', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(244, 'flag-icon flag-icon-ws', 'ws', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(245, 'flag-icon flag-icon-ye', 'ye', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(246, 'flag-icon flag-icon-yt', 'yt', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(247, 'flag-icon flag-icon-za', 'za', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(248, 'flag-icon flag-icon-zm', 'zm', '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(249, 'flag-icon flag-icon-zw', 'zw', '2023-06-25 08:39:14', '2023-06-25 08:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disk` varchar(191) NOT NULL,
  `album_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tab` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `is_cover` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 no, 1 yes',
  `original_image` varchar(191) NOT NULL,
  `thumbnail` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disk` varchar(191) NOT NULL,
  `original_image` varchar(191) NOT NULL,
  `og_image` varchar(191) NOT NULL,
  `thumbnail` varchar(191) NOT NULL,
  `big_image` varchar(191) NOT NULL,
  `big_image_two` varchar(191) NOT NULL,
  `medium_image` varchar(191) NOT NULL,
  `medium_image_two` varchar(191) NOT NULL,
  `medium_image_three` varchar(191) NOT NULL,
  `small_image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `icon_class` varchar(191) DEFAULT NULL,
  `text_direction` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `status`, `icon_class`, `text_direction`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'active', 'flag-icon flag-icon-us', 'LTR', '2023-06-25 08:38:56', '2023-06-25 08:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `language_configs`
--

CREATE TABLE `language_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `script` varchar(191) DEFAULT NULL,
  `native` varchar(191) DEFAULT NULL,
  `regional` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_configs`
--

INSERT INTO `language_configs` (`id`, `language_id`, `name`, `script`, `native`, `regional`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'Latn', 'English', 'en_GB', '2023-06-25 08:38:57', '2023-06-25 08:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `remark` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `title`, `remark`, `created_at`, `updated_at`) VALUES
(1, 'Primary Menu', NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE `menu_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `is_mega_menu` enum('no','tab','category') NOT NULL COMMENT 'no = normal menu, tab = tab type mega menu, category = category type mega menu',
  `order` int(11) NOT NULL DEFAULT 0,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `new_teb` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`id`, `label`, `language`, `menu_id`, `is_mega_menu`, `order`, `parent`, `source`, `url`, `page_id`, `category_id`, `sub_category_id`, `post_id`, `status`, `new_teb`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'en', 1, 'no', 1, NULL, 'custom', '#', NULL, NULL, NULL, NULL, 1, 0, '2020-10-14 05:26:41', '2020-12-18 21:45:20'),
(2, 'Contact Us', 'en', 1, 'no', 11, NULL, 'page', NULL, 1, NULL, NULL, NULL, 1, 0, '2020-10-14 05:34:07', '2020-12-19 04:35:31'),
(3, 'About us', 'en', 1, 'no', 12, NULL, 'page', NULL, 2, NULL, NULL, NULL, 1, 0, '2020-10-14 05:42:29', '2020-12-18 21:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `unique_name` varchar(191) NOT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `title`, `unique_name`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 'Primary', 'primary', 1, '2023-06-25 08:39:15', '2023-06-25 08:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_06_04_000000_create_images_table', 1),
(3, '2014_06_12_000001_create_videos_table', 1),
(4, '2014_06_12_000002_create_audios_table', 1),
(5, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_09_28_121115_create_Permissions_table', 1),
(8, '2019_10_02_101820_create_categories_table', 1),
(9, '2019_10_02_130602_create_sub_categories_table', 1),
(10, '2019_10_03_102624_create_posts_table', 1),
(11, '2019_10_13_160721_create_settings_table', 1),
(12, '2019_10_13_173518_create_languages_table', 1),
(13, '2019_10_13_180528_create_language_configs_table', 1),
(14, '2019_10_16_102855_create_flag_icon', 1),
(15, '2019_11_05_144716_create_email_templates_table', 1),
(16, '2019_11_16_155414_create_pages_table', 1),
(17, '2019_11_23_161232_create_menu_table', 1),
(18, '2019_11_23_161241_create_menu_item_table', 1),
(19, '2019_11_30_170502_create_menu_locations_table', 1),
(20, '2019_12_31_180342_create_ads_table', 1),
(21, '2020_01_01_151432_create_ad_locations_table', 1),
(22, '2020_01_05_160344_create_crons_table', 1),
(23, '2020_01_06_141735_create_polls_table', 1),
(24, '2020_01_06_145613_create_votes_table', 1),
(25, '2020_01_07_173342_create_widgets_table', 1),
(26, '2020_01_08_141817_create_contact_messages_table', 1),
(27, '2020_01_08_151731_create_comments_table', 1),
(28, '2020_02_27_171520_create_themes_table', 1),
(29, '2020_02_29_123626_create_theme_sections_table', 1),
(30, '2020_03_02_174040_create_tags_table', 1),
(31, '2020_07_07_005751_create_poll_options_table', 1),
(32, '2020_07_16_110239_create_jobs_table', 1),
(33, '2020_08_17_162145_create_social_media_table', 1),
(34, '2020_08_27_105041_create_poll_results_table', 1),
(35, '2020_09_24_140613_create_visitor_trackers_table', 1),
(36, '2020_11_07_144953_create_reactions_table', 1),
(37, '2020_11_16_144042_create_audio_post_table', 1),
(38, '2020_11_24_145954_create_albums_table', 1),
(39, '2020_11_24_150907_create_gallery_images_table', 1),
(40, '2020_12_03_125915_create_rss_feeds_table', 1),
(41, '2020_12_15_124608_column_update', 1),
(42, '2021_01_02_175930_column_update_2nd', 1),
(43, '2021_01_04_111845_create_app_intros_table', 1),
(44, '2021_01_13_154702_create_quiz_questions_table', 1),
(45, '2021_01_14_154705_create_quiz_results_table', 1),
(46, '2021_01_14_154717_create_quiz_answers_table', 1),
(47, '2021_02_23_104453_version_control', 1),
(48, '2021_02_23_104453_version_update', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL,
  `page_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 default page, 2 contact us page',
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `template` varchar(191) NOT NULL DEFAULT '1' COMMENT '1 without sidebar, 2 with right sidebar, 3 with left sidebar',
  `visibility` varchar(191) NOT NULL,
  `show_for_register` tinyint(1) NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `show_breadcrumb` tinyint(1) NOT NULL,
  `location` varchar(191) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `image_id`, `title`, `language`, `page_type`, `slug`, `description`, `template`, `visibility`, `show_for_register`, `show_title`, `show_breadcrumb`, `location`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Contact Us', 'en', 2, 'contact-us', 'Mock Turtle went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, jumping up and went back for a minute or two the Caterpillar angrily, rearing itself upright as it can be,\' said the last word with such a dreadful time.\' So Alice got up this morning, but I THINK I can listen all day to day.\' This was quite impossible to say than his first remark, \'It was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a very deep well. Either the well was very fond of pretending to be a walrus or hippopotamus, but then she remembered trying to box her own mind (as well as she passed; it was very likely it can talk: at any rate, the Dormouse said--\' the Hatter said, tossing his head sadly. \'Do I look like one, but it was over at last: \'and I do hope it\'ll make me grow large again, for she felt sure she would keep, through all her coaxing. Hardly knowing what she did, she picked her way into that beautiful garden--how IS that to be a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they walked off together. Alice was so large in the house if it began ordering people about like that!\' By this time she had put on your head-- Do you think, at your age, it is almost certain to disagree with you, sooner or later. However, this bottle was NOT marked \'poison,\' so Alice ventured to remark. \'Tut, tut, child!\' said the Duchess, as she was playing against herself, for she thought, and looked at her, and the Dormouse go on in a tone of this rope--Will the roof of the shepherd boy--and the sneeze of the suppressed guinea-pigs, filled the air, and came back again. \'Keep your temper,\' said the March Hare. \'Sixteenth,\' added the Gryphon; and then nodded. \'It\'s no use denying it. I suppose Dinah\'ll be sending me on messages next!\' And she began again. \'I wonder if I must, I must,\' the King triumphantly, pointing to the shore. CHAPTER III. A Caucus-Race and a long argument with the Lory, who at last in the distance. \'Come on!\' cried the Mouse, frowning, but very politely: \'Did you say &quot;What a pity!&quot;?\' the Rabbit say to itself \'Then I\'ll go round a deal faster than it does.\' \'Which would NOT be an old Turtle--we used to say.\' \'So he did, so he with his nose, and broke to pieces against one of the evening, beautiful Soup! Soup of the moment he was in a soothing tone: \'don\'t be angry about it. And yet you incessantly stand on their throne when they liked, and left off writing on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old crab, HE was.\' \'I never went to work nibbling at the bottom of a dance is it?\' he said, turning to the Mock Turtle. \'No, no! The adventures first,\' said the Mouse, sharply and very soon came upon a heap of sticks and dry leaves, and the turtles all advance! They are waiting on the Duchess\'s cook. She.', '1', '1', 0, 1, 1, NULL, NULL, NULL, NULL, '2023-06-25 08:38:56', '2023-06-25 08:38:56'),
(2, NULL, 'About Us', 'en', 1, 'about-us', 'Footman, and began whistling. \'Oh, there\'s no use speaking to it,\' she said to the Mock Turtle Soup is made from,\' said the Hatter, \'when the Queen in front of the baby, the shriek of the court. All this time the Queen merely remarking as it left no mark on the bank, with her head!\' Those whom she sentenced were taken into custody by the soldiers, who of course had to double themselves up and throw us, with the Dormouse. \'Fourteenth of March, I think I must go and take it away!\' There was not otherwise than what you mean,\' the March Hare. \'I didn\'t know that you\'re mad?\' \'To begin with,\' said the Mock Turtle repeated thoughtfully. \'I should like to be Involved in this way! Stop this moment, and fetch me a good way off, and she felt unhappy. \'It was the only difficulty was, that if something wasn\'t done about it just grazed his nose, and broke off a bit of the ground--and I should think!\' (Dinah was the matter with it. There was nothing so VERY much out of that is--&quot;Birds of a muchness&quot;--did you ever saw. How she longed to change them--\' when she had never before seen a cat without a porpoise.\' \'Wouldn\'t it really?\' said Alice as she went on growing, and, as she swam about, trying to put his mouth close to her, though, as they came nearer, Alice could see, as well as the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come to the jury, and the baby was howling so much frightened to say which), and they walked off together, Alice heard the Queen\'s shrill cries to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the King, and he poured a little pattering of feet in the chimney as she was terribly frightened all the party went back to the King, looking round the neck of the Mock Turtle went on, \'that they\'d let Dinah stop in the way down one side and up the fan and a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Mock Turtle at last, and they can\'t prove I did: there\'s no use now,\' thought Alice, \'shall I NEVER get any older than you, and must know better\'; and this was her dream:-- First, she dreamed of little animals and birds waiting outside. The poor little juror (it was exactly the right size again; and the game was in the middle, nursing a baby; the cook was leaning over the wig, (look at the Mouse\'s tail; \'but why do you like the three gardeners, but she got used to it in time,\' said the King, the Queen, and in THAT direction,\' waving the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance. So they got settled down in an offended tone, \'Hm! No accounting for tastes! Sing her &quot;Turtle Soup,&quot; will you, won\'t you, will you, won\'t you, will you join the dance? Will you, won\'t you, will you join the dance. Would not, could not, would not, could not, would not join the dance? Will you, won\'t you, will you join the dance. Would not, could not, would not, could not, could not, would not.', '1', '1', 0, 1, 1, NULL, NULL, NULL, NULL, '2023-06-25 08:38:56', '2023-06-25 08:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'album_read', 'album', '', NULL, NULL),
(2, 'album_write', 'album', '', NULL, NULL),
(3, 'album_delete', 'album', '', NULL, NULL),
(4, 'rss_read', 'rss', '', NULL, NULL),
(5, 'rss_write', 'rss', '', NULL, NULL),
(6, 'rss_delete', 'rss', '', NULL, NULL),
(7, 'api_read', 'api', '', NULL, NULL),
(8, 'api_write', 'api', '', NULL, NULL),
(9, 'api_delete', 'api', '', NULL, NULL),
(10, 'users_read', 'users', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(11, 'users_write', 'users', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(12, 'users_delete', 'users', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(13, 'role_read', 'role', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(14, 'role_write', 'role', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(15, 'role_delete', 'role', '', '2023-06-25 08:38:42', '2023-06-25 08:38:42'),
(16, 'permission_read', 'permission', '', '2023-06-25 08:38:43', '2023-06-25 08:38:43'),
(17, 'permission_write', 'permission', '', '2023-06-25 08:38:43', '2023-06-25 08:38:43'),
(18, 'permission_delete', 'permission', '', '2023-06-25 08:38:43', '2023-06-25 08:38:43'),
(19, 'settings_read', 'settings', '', '2023-06-25 08:38:43', '2023-06-25 08:38:43'),
(20, 'settings_write', 'settings', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(21, 'settings_delete', 'settings', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(22, 'language_settings_read', 'language_settings', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(23, 'language_settings_write', 'language_settings', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(24, 'language_settings_delete', 'language_settings', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(25, 'pages_read', 'pages', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(26, 'pages_write', 'pages', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(27, 'pages_delete', 'pages', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(28, 'menu_read', 'menu', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(29, 'menu_write', 'menu', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(30, 'menu_delete', 'menu', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(31, 'menu_item_read', 'menu_item', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(32, 'menu_item_write', 'menu_item', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(33, 'menu_item_delete', 'menu_item', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(34, 'post_read', 'post', '', '2023-06-25 08:38:44', '2023-06-25 08:38:44'),
(35, 'post_write', 'post', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(36, 'post_delete', 'post', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(37, 'category_read', 'category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(38, 'category_write', 'category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(39, 'category_delete', 'category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(40, 'sub_category_read', 'sub_category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(41, 'sub_category_write', 'sub_category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(42, 'sub_category_delete', 'sub_category', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(43, 'widget_read', 'widget', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(44, 'widget_write', 'widget', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(45, 'widget_delete', 'widget', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(46, 'newsletter_read', 'newsletter', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(47, 'newsletter_write', 'newsletter', '', '2023-06-25 08:38:45', '2023-06-25 08:38:45'),
(48, 'newsletter_delete', 'newsletter', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(49, 'notification_read', 'notification', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(50, 'notification_write', 'notification', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(51, 'notification_delete', 'notification', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(52, 'contact_message_read', 'contact_message', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(53, 'contact_message_write', 'contact_message', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(54, 'contact_message_delete', 'contact_message', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(55, 'ads_read', 'ads', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(56, 'ads_write', 'ads', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(57, 'ads_delete', 'ads', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(58, 'theme_section_read', 'theme_section', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(59, 'theme_section_write', 'theme_section', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(60, 'theme_section_delete', 'theme_section', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(61, 'socials_read', 'socials', '', '2023-06-25 08:38:46', '2023-06-25 08:38:46'),
(62, 'socials_write', 'socials', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(63, 'socials_delete', 'socials', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(64, 'polls_read', 'polls', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(65, 'polls_write', 'polls', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(66, 'polls_delete', 'polls', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(67, 'comments_read', 'comments', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(68, 'comments_write', 'comments', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(69, 'comments_delete', 'comments', '', '2023-06-25 08:38:47', '2023-06-25 08:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'M2TYdFH2OyxXU1grGbUPeobCQ4kfRxsM', '2023-06-25 08:44:44', '2023-06-25 08:44:44'),
(2, 1, 'VMPVavUufVQxla9J8LUff4f9eE6GR2pG', '2023-06-25 08:51:25', '2023-06-25 08:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `auth_required` varchar(191) NOT NULL DEFAULT '0',
  `status` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED DEFAULT NULL,
  `option` varchar(191) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poll_results`
--

CREATE TABLE `poll_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) DEFAULT NULL,
  `poll_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `browser_details` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `language` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_type` enum('article','video','audio','trivia-quiz','personality-quiz') DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 Non Submitted, 1 submitted',
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 0,
  `auth_required` tinyint(1) NOT NULL DEFAULT 0,
  `slider` tinyint(1) NOT NULL DEFAULT 0,
  `slider_order` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `featured_order` int(11) NOT NULL DEFAULT 0,
  `breaking` tinyint(1) NOT NULL DEFAULT 0,
  `breaking_order` int(11) NOT NULL DEFAULT 0,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `recommended_order` int(11) NOT NULL DEFAULT 0,
  `editor_picks` tinyint(1) NOT NULL DEFAULT 0,
  `editor_picks_order` int(11) NOT NULL DEFAULT 0,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `scheduled_date` timestamp NULL DEFAULT NULL,
  `layout` varchar(191) DEFAULT 'default',
  `video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `video_url_type` varchar(191) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `video_thumbnail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `total_hit` bigint(20) NOT NULL DEFAULT 0,
  `contents` longtext DEFAULT NULL COMMENT 'extra content',
  `read_more_link` text DEFAULT NULL COMMENT 'rss post actual link',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `language`, `user_id`, `category_id`, `sub_category_id`, `post_type`, `submitted`, `image_id`, `visibility`, `auth_required`, `slider`, `slider_order`, `featured`, `featured_order`, `breaking`, `breaking_order`, `recommended`, `recommended_order`, `editor_picks`, `editor_picks_order`, `scheduled`, `meta_title`, `meta_keywords`, `meta_description`, `tags`, `scheduled_date`, `layout`, `video_id`, `video_url_type`, `video_url`, `video_thumbnail_id`, `status`, `total_hit`, `contents`, `read_more_link`, `created_at`, `updated_at`) VALUES
(1, 'Sample article post', 'sample-article-post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'en', 1, 1, 1, 'article', 0, NULL, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, NULL, NULL, NULL, 'politics,world', NULL, 'default', NULL, '', '', NULL, 1, 0, NULL, NULL, '2023-06-25 08:38:56', '2023-06-25 08:38:56'),
(2, 'Sample video post', 'sample-video-post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'en', 1, 1, 1, 'video', 0, NULL, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, NULL, NULL, NULL, 'politics,world', NULL, 'default', NULL, 'mp4_url', 'https://youtu.be/VpcrmAja6bY', NULL, 1, 0, NULL, NULL, '2023-06-25 08:38:56', '2023-06-25 08:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quiz_question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `answer_text` varchar(191) DEFAULT NULL,
  `is_correct` tinyint(4) NOT NULL DEFAULT 0,
  `result_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `answer_format` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `result_title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `min_correct` int(11) DEFAULT NULL,
  `max_correct` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `data_reaction` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin', '{\"users_read\":true,\"users_write\":true,\"users_delete\":true,\"settings_read\":true,\"settings_write\":true,\"settings_delete\":true,\"role_read\":true,\"role_write\":true,\"role_delete\":true,\"permission_read\":true,\"permission_write\":true,\"permission_delete\":true,\"language_settings_read\":true,\"language_settings_write\":true,\"language_settings_delete\":true,\"pages_read\":true,\"pages_write\":true,\"pages_delete\":true,\"menu_read\":true,\"menu_write\":true,\"menu_delete\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"menu_item_delete\":true,\"post_read\":true,\"post_write\":true,\"post_delete\":true,\"category_read\":true,\"category_write\":true,\"category_delete\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"sub_category_delete\":true,\"widget_read\":true,\"widget_write\":true,\"widget_delete\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"newsletter_delete\":true,\"notification_read\":true,\"notification_write\":true,\"notification_delete\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"contact_message_delete\":true,\"ads_read\":true,\"ads_write\":true,\"ads_delete\":true,\"theme_section_read\":true,\"theme_section_write\":true,\"theme_section_delete\":true,\"polls_read\":true,\"polls_write\":true,\"polls_delete\":true,\"socials_read\":true,\"socials_write\":true,\"socials_delete\":true,\"comments_read\":true,\"comments_write\":true,\"comments_delete\":true,\"album_read\":true,\"album_write\":true,\"album_delete\":true,\"rss_read\":true,\"rss_write\":true,\"rss_delete\":true,\"api_read\":true,\"api_write\":true,\"api_delete\":true}', '2023-06-25 08:38:41', '2023-06-25 08:38:41'),
(2, 'admin', 'Admin', '{\"users_read\":true,\"users_write\":true,\"settings_read\":true,\"settings_write\":true,\"role_read\":true,\"role_write\":true,\"permission_read\":true,\"permission_write\":true,\"language_settings_read\":true,\"language_settings_write\":true,\"pages_read\":true,\"pages_write\":true,\"menu_read\":true,\"menu_write\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"post_read\":true,\"post_write\":true,\"category_read\":true,\"category_write\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"widget_read\":true,\"widget_write\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"notification_read\":true,\"notification_write\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"ads_read\":true,\"ads_write\":true,\"theme_section_read\":true,\"theme_section_write\":true,\"polls_read\":true,\"polls_write\":true,\"socials_read\":true,\"socials_write\":true,\"comments_read\":true,\"comments_write\":true,\"album_read\":true,\"album_write\":true,\"rss_read\":true,\"rss_write\":true}', '2023-06-25 08:38:41', '2023-06-25 08:38:41'),
(3, 'editor', 'Editor', '{\"pages_read\":true,\"pages_write\":true,\"menu_read\":true,\"menu_write\":true,\"menu_item_read\":true,\"menu_item_write\":true,\"post_read\":true,\"post_write\":true,\"category_read\":true,\"category_write\":true,\"sub_category_read\":true,\"sub_category_write\":true,\"widget_read\":true,\"widget_write\":true,\"newsletter_read\":true,\"newsletter_write\":true,\"notification_read\":true,\"notification_write\":true,\"contact_message_read\":true,\"contact_message_write\":true,\"ads_read\":true,\"ads_write\":true,\"polls_read\":true,\"polls_write\":true}', '2023-06-25 08:38:41', '2023-06-25 08:38:41'),
(4, 'user', 'User', NULL, '2023-06-25 08:38:41', '2023-06-25 08:38:41'),
(5, 'subscriber', 'Subscriber', NULL, '2023-06-25 08:38:41', '2023-06-25 08:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-06-25 08:38:42', '2023-06-25 08:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `rss_feeds`
--

CREATE TABLE `rss_feeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `feed_url` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_limit` smallint(6) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `show_read_more` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `keep_date` tinyint(1) NOT NULL DEFAULT 0,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `scheduled_date` timestamp NULL DEFAULT NULL,
  `layout` varchar(191) NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `value`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'api_key_for_app', '', 'en', NULL, NULL),
(2, 'latest_apk_version', '', 'en', NULL, NULL),
(3, 'latest_apk_code', '', 'en', NULL, NULL),
(4, 'apk_file_url', '', 'en', NULL, NULL),
(5, 'whats_new_on_latest_apk', '', 'en', NULL, NULL),
(6, 'apk_update_skipable_status', 'false', 'en', NULL, NULL),
(7, 'latest_ipa_version', '', 'en', NULL, NULL),
(8, 'latest_ipa_code', '', 'en', NULL, NULL),
(9, 'ipa_file_url', '', 'en', NULL, NULL),
(10, 'whats_new_on_latest_ipa', '', 'en', NULL, NULL),
(11, 'ios_update_skipable_status', '', 'en', NULL, NULL),
(12, 'mandatory_login', 'false', 'en', NULL, NULL),
(13, 'intro_skippable', 'false', 'en', NULL, NULL),
(14, 'privacy_policy_url', '', 'en', NULL, NULL),
(15, 'terms_n_condition_url', '', 'en', NULL, NULL),
(16, 'support_url', '', 'en', NULL, NULL),
(17, 'ads_enable', 'false', 'en', NULL, NULL),
(18, 'mobile_ads_network', '', 'en', NULL, NULL),
(19, 'admob_app_id', '', 'en', NULL, NULL),
(20, 'admob_banner_ads_id', '', 'en', NULL, NULL),
(21, 'admob_interstitial_ads_id', '', 'en', NULL, NULL),
(22, 'admob_native_ads_id', '', 'en', NULL, NULL),
(23, 'fan_native_ads_placement_id', '', 'en', NULL, NULL),
(24, 'fan_banner_ads_placement_id', '', 'en', NULL, NULL),
(25, 'fan_interstitial_ads_placement_id', '', 'en', NULL, NULL),
(26, 'startapp_app_id', '', 'en', NULL, NULL),
(27, 'version', '121', 'en', NULL, NULL),
(28, 'default_language', 'en', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(29, 'timezone', 'Asia/Dhaka', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(30, 'application_name', 'NewsTime24', 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:08'),
(31, 'mail_driver', 'smtp', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(32, 'mail_host', NULL, 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(33, 'sendmail_path', '/usr/bin/sendmail -bs', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(34, 'mail_port', NULL, 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(35, 'mail_address', NULL, 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(36, 'mail_name', 'NewsTime24', 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(37, 'mail_username', NULL, 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(38, 'mail_password', NULL, 'en', '2023-06-25 08:38:50', '2023-06-25 08:49:25'),
(39, 'mail_encryption', 'ssl', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(40, 'default_storage', 'local', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(41, 'aws_access_key_id', '', 'en', '2023-06-25 08:38:50', '2023-06-25 08:38:50'),
(42, 'aws_secret_access_key', '', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(43, 'aws_default_region', '', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(44, 'aws_bucket', '', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(45, 'logo', 'images/logo.png', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(46, 'favicon', 'images/favicon.png', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(47, 'onesignal_api_key', '', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(48, 'onesignal_app_id', '', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(49, 'onesignal_action_message', 'We\'d like to show you notifications for the latest updates.', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(50, 'onesignal_accept_button', 'ALLOW', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(51, 'onesignal_cancel_button', 'NO THANKS', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(52, 'notification_status', '0', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(53, 'seo_title', 'NewsTime24', 'en', '2023-06-25 08:38:51', '2023-06-25 08:50:04'),
(54, 'seo_keywords', NULL, 'en', '2023-06-25 08:38:51', '2023-06-25 08:50:04'),
(55, 'seo_meta_description', NULL, 'en', '2023-06-25 08:38:51', '2023-06-25 08:50:04'),
(56, 'author_name', 'NewsTime24BD', 'en', '2023-06-25 08:38:51', '2023-06-25 08:50:04'),
(57, 'og_title', 'Your Website Title', 'en', '2023-06-25 08:38:51', '2023-06-25 08:38:51'),
(58, 'og_description', NULL, 'en', '2023-06-25 08:38:52', '2023-06-25 08:50:04'),
(59, 'og_image', 'images/20201018123322_og_image_49.png', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(60, 'google_analytics_id', NULL, 'en', '2023-06-25 08:38:52', '2023-06-25 08:50:05'),
(61, 'page_detail_prefix', 'page', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(62, 'article_detail_prefix', 'story', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(63, 'url', 'http://127.0.0.1:8000', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(64, 'address', 'Mirpur, Dhaka', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:08'),
(65, 'email', 'info@newstime24.net', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:08'),
(66, 'phone', '0123456789', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:08'),
(67, 'zip_code', '1216', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:08'),
(68, 'city', 'Dhaka', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(69, 'state', 'Dhaka', 'en', '2023-06-25 08:38:52', '2023-06-25 08:38:52'),
(70, 'country', 'Bangladesh', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:08'),
(71, 'website', 'newstime24.net', 'en', '2023-06-25 08:38:52', '2023-06-25 08:49:09'),
(72, 'company_registration', '123456789', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(73, 'tax_number', '123456789', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(74, 'about_us_description', 'Alice noticed with some surprise that the mouse to the jury. \'Not yet, not yet!\' the Rabbit noticed Alice, as she could, for the first really clever thing the King said, for about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle would be so kind,\' Alice replied, rather shyly, \'I--I.', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(75, 'captcha_secret', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(76, 'captcha_sitekey', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(77, 'captcha_visibility', '0', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(78, 'copyright_text', 'Copyright © 2020 NewsTime24 - All Rights Reserved.', 'en', '2023-06-25 08:38:53', '2023-06-25 08:49:09'),
(79, 'signature', '<p>Best Regards</p>', 'en', '2023-06-25 08:38:53', '2023-06-25 08:49:25'),
(80, 'addthis_public_id', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(81, 'addthis_toolbox', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(82, 'adthis_option', '0', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(83, 'inbuild_comment', '1', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(84, 'disqus_comment', '0', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(85, 'disqus_short_name', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(86, 'facebook_comment', '0', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(87, 'facebook_app_id', '', 'en', '2023-06-25 08:38:53', '2023-06-25 08:38:53'),
(88, 'predefined_header', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(89, 'custom_header_style', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(90, 'custom_footer_js', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(91, 'ffmpeg_status', '0', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(92, 'facebook_client_id', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(93, 'facebook_client_secretkey', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(94, 'facebook_visibility', '0', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(95, 'facebook_callback_url', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(96, 'google_client_id', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(97, 'google_client_secretkey', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(98, 'google_visibility', '0', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(99, 'google_callback_url', '', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(100, 'preloader_option', '0', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(101, 'submit_news_status', '1', 'en', '2023-06-25 08:38:54', '2023-06-25 08:38:54'),
(102, 'version', '142', 'en', '2023-06-25 08:38:55', '2023-06-25 08:38:55'),
(103, 'status', NULL, 'en', '2023-06-25 08:49:09', '2023-06-25 08:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `icon_bg_color` varchar(191) DEFAULT NULL,
  `text_bg_color` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `url`, `icon_bg_color`, `text_bg_color`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '#', '#0061C2', '#056ED8', 'fa fa-facebook', 1, '2023-06-25 08:38:17', '2023-06-25 08:38:17'),
(2, 'Youtube', '#', '#FE031C', '#E50017', 'fa fa-youtube-play', 1, '2023-06-25 08:38:17', '2023-06-25 08:38:17'),
(3, 'Twitter', '#', '#2391FF', '#349AFF', 'fa fa-twitter', 1, '2023-06-25 08:38:17', '2023-06-25 08:38:17'),
(4, 'Linkedin', '#', '#349AFF', '#349affd9', 'fa fa-linkedin', 1, '2023-06-25 08:38:17', '2023-06-25 08:38:17'),
(5, 'Skype', '#', '#4ba3fcd9', '#4BA3FC', 'fa fa-skype', 1, '2023-06-25 08:38:18', '2023-06-25 08:38:18'),
(6, 'Pinterest', '#', '#C2000D', '#c2000dd9', 'fa fa-pinterest-square', 1, '2023-06-25 08:38:18', '2023-06-25 08:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(191) NOT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_keywords` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `sub_category_name`, `slug`, `category_id`, `language`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', 'politics', 1, 'en', NULL, NULL, '2023-06-25 08:38:56', '2023-06-25 08:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `total_hit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `total_hit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sports', 10, 1, '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(2, 'Football', 12, 1, '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(3, 'Cricket', 10, 1, '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(4, 'Education', 10, 1, '2023-06-25 08:38:47', '2023-06-25 08:38:47'),
(5, 'Business', 10, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(6, 'Technology', 10, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(7, 'Science', 10, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(8, 'Bangladesh', 2, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(9, 'World Cup', 10, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(10, 'Politics', 6, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(11, 'Computer', 2, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(12, 'Apple', 3, 1, '2023-06-25 08:38:48', '2023-06-25 08:38:48'),
(13, 'Microsoft', 3, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(14, 'Google', 4, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(15, 'Travel', 10, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(16, 'Virus', 10, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(17, 'Culture', 10, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(18, 'Culture', 10, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(19, 'Health', 10, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(20, 'Tree', 5, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(21, 'Environment', 8, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49'),
(22, 'Pollution', 6, 1, '2023-06-25 08:38:49', '2023-06-25 08:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `options`, `status`, `created_at`, `updated_at`) VALUES
(1, 'theme_one', NULL, '{\"header_style\":\"header_1\",\"footer_style\":\"footer_1\",\"primary_color\":\"#000000\",\"fonts\":\"Noto+Sans+JP\",\"mode\":null}', 1, '2023-06-25 08:39:15', '2023-06-25 08:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `theme_sections`
--

CREATE TABLE `theme_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `label` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_amount` bigint(20) UNSIGNED DEFAULT NULL,
  `section_style` varchar(191) DEFAULT NULL,
  `is_primary` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_sections`
--

INSERT INTO `theme_sections` (`id`, `theme_id`, `type`, `label`, `order`, `category_id`, `ad_id`, `post_amount`, `section_style`, `is_primary`, `status`, `language`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Primary Section', 1, NULL, NULL, 1, 'style_1', 1, 1, NULL, '2023-06-25 08:39:14', '2023-06-25 08:39:14'),
(2, 1, 3, 'latest_post', 6, NULL, NULL, NULL, NULL, 0, 1, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `dob` date NOT NULL COMMENT 'date of birth',
  `gender` tinyint(1) NOT NULL COMMENT '1 male, 2 female, 3 others',
  `password` varchar(191) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL COMMENT 'it will be array data',
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `newsletter_enable` tinyint(1) NOT NULL DEFAULT 1,
  `is_user_banned` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 banned, 1 unbanned',
  `is_password_set` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 not set, 1 set',
  `user_banned_reason` text DEFAULT NULL,
  `is_subscribe_banned` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 banned, 1 unbanned',
  `subscribe_banned_reason` text DEFAULT NULL,
  `about_us` text DEFAULT NULL,
  `social_media` longtext NOT NULL DEFAULT '' COMMENT 'it will be array data',
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 inactive user, 1 active user',
  `deactivate_reason` text DEFAULT NULL,
  `firebase_auth_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'this is for mobile app.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `dob`, `gender`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `profile_image`, `image_id`, `newsletter_enable`, `is_user_banned`, `is_password_set`, `user_banned_reason`, `is_subscribe_banned`, `subscribe_banned_reason`, `about_us`, `social_media`, `is_active`, `deactivate_reason`, `firebase_auth_id`, `created_at`, `updated_at`) VALUES
(1, 'admin@email.com', '', '0000-00-00', 0, '$2y$10$sHTQzDzsi5CorBAc4aOppeTOAXigWfkt1lLuJZe7vhePmvsayFt..', '{\"email_show\":0}', '2023-06-25 08:51:26', 'Super', 'Admin', NULL, NULL, 0, 1, 0, NULL, 1, NULL, NULL, '', 1, NULL, NULL, '2023-06-25 08:38:42', '2023-06-25 08:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_name` varchar(191) NOT NULL,
  `video_thumbnail` text NOT NULL,
  `disk` varchar(191) NOT NULL,
  `original` text NOT NULL,
  `v_144p` text DEFAULT NULL,
  `v_240p` text DEFAULT NULL,
  `v_360p` text DEFAULT NULL,
  `v_480p` text DEFAULT NULL,
  `v_720p` text DEFAULT NULL,
  `v_1080p` text DEFAULT NULL,
  `video_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_trackers`
--

CREATE TABLE `visitor_trackers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_type` tinyint(1) DEFAULT NULL COMMENT '1, home page, 2 post details, 3 page detail',
  `slug` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `source_url` varchar(191) DEFAULT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `agent_browser` varchar(191) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_trackers`
--

INSERT INTO `visitor_trackers` (`id`, `page_type`, `slug`, `url`, `source_url`, `ip`, `agent_browser`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'http://localhost/news', 'http://localhost/news/install', '::1', 'Google Chrome', NULL, '2023-06-25 08:39:16', '2023-06-25 08:39:16'),
(2, 1, NULL, 'http://localhost/news', 'http://localhost/news/', '::1', 'Google Chrome', NULL, '2023-06-25 08:42:00', '2023-06-25 08:42:00'),
(3, 1, NULL, 'http://localhost/news', 'http://localhost/news/login', '::1', 'Google Chrome', NULL, '2023-06-25 08:44:44', '2023-06-25 08:44:44'),
(4, 1, NULL, 'http://localhost/news', 'http://localhost/news/login', '::1', 'Google Chrome', NULL, '2023-06-25 08:51:26', '2023-06-25 08:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `language` varchar(191) NOT NULL DEFAULT 'en',
  `content` longtext DEFAULT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `location` int(11) NOT NULL DEFAULT 1,
  `content_type` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_custom` tinyint(1) NOT NULL DEFAULT 1,
  `ad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `poll_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `title`, `language`, `content`, `short_code`, `order`, `location`, `content_type`, `status`, `is_custom`, `ad_id`, `poll_id`, `created_at`, `updated_at`) VALUES
(1, 'Popular Posts', 'en', NULL, 'popular_posts', 1, 1, 1, 1, 1, NULL, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15'),
(2, 'Follow Us', 'en', NULL, 'follow_us', 2, 1, 5, 1, 1, NULL, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15'),
(3, 'Newsletter', 'en', NULL, 'newletter', 3, 1, 4, 1, 1, NULL, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15'),
(4, 'Popular Posts', 'en', NULL, NULL, 1, 2, 1, 1, 1, NULL, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15'),
(5, 'Newsletter', 'en', NULL, NULL, 3, 2, 4, 1, 1, NULL, NULL, '2023-06-25 08:39:15', '2023-06-25 08:39:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_foreign` (`user_id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_ad_image_id_foreign` (`ad_image_id`);

--
-- Indexes for table `ad_locations`
--
ALTER TABLE `ad_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad_locations_unique_name_unique` (`unique_name`),
  ADD KEY `ad_locations_ad_id_foreign` (`ad_id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `albums_slug_unique` (`slug`);

--
-- Indexes for table `app_intros`
--
ALTER TABLE `app_intros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_post`
--
ALTER TABLE `audio_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crons_video_id_foreign` (`video_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flag_icons`
--
ALTER TABLE `flag_icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_album_id_foreign` (`album_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_configs`
--
ALTER TABLE `language_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_parent_foreign` (`parent`),
  ADD KEY `menu_item_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_item_category_id_foreign` (`category_id`),
  ADD KEY `menu_item_page_id_foreign` (`page_id`),
  ADD KEY `menu_item_post_id_foreign` (`post_id`),
  ADD KEY `menu_item_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_locations_unique_name_unique` (`unique_name`),
  ADD KEY `menu_locations_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_image_id_foreign` (`image_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`),
  ADD KEY `persistences_user_id_foreign` (`user_id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_options_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `poll_results`
--
ALTER TABLE `poll_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_results_poll_option_id_foreign` (`poll_option_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_image_id_foreign` (`image_id`),
  ADD KEY `posts_video_thumbnail_id_foreign` (`video_thumbnail_id`),
  ADD KEY `posts_video_id_foreign` (`video_id`),
  ADD KEY `posts_visibility_status_slider_language_auth_required_index` (`visibility`,`status`,`slider`,`language`,`auth_required`),
  ADD KEY `posts_featured_breaking_recommended_editor_picks_tags_index` (`featured`,`breaking`,`recommended`,`editor_picks`,`tags`),
  ADD KEY `posts_recommended_order_featured_order_id_index` (`recommended_order`,`featured_order`,`id`),
  ADD KEY `posts_post_type_video_url_type_total_hit_index` (`post_type`,`video_url_type`,`total_hit`),
  ADD KEY `posts_created_at_updated_at_index` (`created_at`,`updated_at`),
  ADD KEY `posts_user_id_category_id_index` (`user_id`,`category_id`),
  ADD KEY `posts_sub_category_id_video_thumbnail_id_index` (`sub_category_id`,`video_thumbnail_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_answers_quiz_question_id_foreign` (`quiz_question_id`),
  ADD KEY `quiz_answers_image_id_foreign` (`image_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_questions_post_id_foreign` (`post_id`),
  ADD KEY `quiz_questions_image_id_foreign` (`image_id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_results_post_id_foreign` (`post_id`),
  ADD KEY `quiz_results_image_id_foreign` (`image_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reactions_post_id_foreign` (`post_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reminders_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rss_feeds_category_id_foreign` (`category_id`),
  ADD KEY `rss_feeds_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sub_categories_slug_unique` (`slug`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `themes_name_index` (`name`);

--
-- Indexes for table `theme_sections`
--
ALTER TABLE `theme_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_sections_ad_id_foreign` (`ad_id`),
  ADD KEY `theme_sections_category_id_foreign` (`category_id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_image_id_foreign` (`image_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_trackers`
--
ALTER TABLE `visitor_trackers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_poll_id_foreign` (`poll_id`),
  ADD KEY `votes_user_id_foreign` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `widgets_short_code_unique` (`short_code`),
  ADD KEY `widgets_ad_id_foreign` (`ad_id`),
  ADD KEY `widgets_poll_id_foreign` (`poll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ad_locations`
--
ALTER TABLE `ad_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_intros`
--
ALTER TABLE `app_intros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audio_post`
--
ALTER TABLE `audio_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crons`
--
ALTER TABLE `crons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flag_icons`
--
ALTER TABLE `flag_icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_configs`
--
ALTER TABLE `language_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_results`
--
ALTER TABLE `poll_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_sections`
--
ALTER TABLE `theme_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_trackers`
--
ALTER TABLE `visitor_trackers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activations`
--
ALTER TABLE `activations`
  ADD CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ad_image_id_foreign` FOREIGN KEY (`ad_image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ad_locations`
--
ALTER TABLE `ad_locations`
  ADD CONSTRAINT `ad_locations_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `crons`
--
ALTER TABLE `crons`
  ADD CONSTRAINT `crons_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gallery_images_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `menu_item_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD CONSTRAINT `menu_locations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `persistences`
--
ALTER TABLE `persistences`
  ADD CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_results`
--
ALTER TABLE `poll_results`
  ADD CONSTRAINT `poll_results_poll_option_id_foreign` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_video_thumbnail_id_foreign` FOREIGN KEY (`video_thumbnail_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_answers_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_questions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_results_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  ADD CONSTRAINT `rss_feeds_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `rss_feeds_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_sections`
--
ALTER TABLE `theme_sections`
  ADD CONSTRAINT `theme_sections_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theme_sections_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `widgets_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
