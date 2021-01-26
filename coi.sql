-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 06:51 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coi`
--

-- --------------------------------------------------------

--
-- Table structure for table `conflicts`
--

CREATE TABLE `conflicts` (
  `project_id` int(9) NOT NULL,
  `ps_AFM` int(9) NOT NULL,
  `coi_description` varchar(500) NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conflicts`
--

INSERT INTO `conflicts` (`project_id`, `ps_AFM`, `coi_description`, `status`) VALUES
(10, 123456789, 'asdf', 'approved'),
(10, 144322567, 'wife on firm board', 'rejected'),
(11, 144322567, 'working on team project', 'approved'),
(13, 555123567, 'firm director', 'pending'),
(15, 157533211, 'on project team', 'rejected'),
(16, 123456789, 'on firm board', 'approved'),
(17, 144322567, 'Director of the firm', 'approved'),
(19, 555123567, 'my brother is on the firm board', 'pending'),
(24, 144322567, 'on firm board', 'rejected');

-- --------------------------------------------------------

--
-- Table structure for table `firms`
--

CREATE TABLE `firms` (
  `firm_id` int(9) NOT NULL,
  `firm_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firms`
--

INSERT INTO `firms` (`firm_id`, `firm_name`) VALUES
(1, 'AKTOR'),
(4, 'ELGEKA'),
(5, 'INTRAKAT'),
(27, 'NEWFIRM'),
(25, 'TECSOFT');

-- --------------------------------------------------------

--
-- Table structure for table `firms_projects`
--

CREATE TABLE `firms_projects` (
  `firm_id` int(9) NOT NULL COMMENT '9',
  `project_id` int(9) NOT NULL,
  `date_applied` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firms_projects`
--

INSERT INTO `firms_projects` (`firm_id`, `project_id`, `date_applied`) VALUES
(1, 10, '2020-12-29'),
(1, 11, '2021-01-05'),
(1, 12, '2021-01-05'),
(1, 13, '2020-12-29'),
(1, 14, '2021-01-05'),
(1, 17, '2021-01-07'),
(4, 15, '2021-01-11'),
(4, 16, '2021-01-11'),
(5, 10, '2021-01-11'),
(5, 11, '2021-01-05'),
(5, 12, '2021-01-11'),
(5, 14, '2021-01-05'),
(5, 19, '2021-01-10');

-- --------------------------------------------------------

--
-- Table structure for table `firm_representatives`
--

CREATE TABLE `firm_representatives` (
  `fr_AFM` int(9) NOT NULL,
  `firm_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firm_representatives`
--

INSERT INTO `firm_representatives` (`fr_AFM`, `firm_id`) VALUES
(155432111, 1),
(156432111, 4),
(444333111, 5),
(333654745, 25);

-- --------------------------------------------------------

--
-- Table structure for table `firm_stakeholders`
--

CREATE TABLE `firm_stakeholders` (
  `stakeholder_AFM` int(9) NOT NULL,
  `stakeholder_name` varchar(50) NOT NULL,
  `firm_id` int(11) NOT NULL,
  `stakeholder_role` varchar(50) NOT NULL,
  `project_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firm_stakeholders`
--

INSERT INTO `firm_stakeholders` (`stakeholder_AFM`, `stakeholder_name`, `firm_id`, `stakeholder_role`, `project_id`) VALUES
(133222666, 'Petros Sxinas', 5, 'Project Manager', 11),
(233145666, 'Pavlos Diogenous', 1, 'Shareholder in the company', 13),
(534222666, 'Giannis Mitrou', 5, 'Programmer', 11),
(555111333, 'Giannis Sxinas', 1, 'board director', 10);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `user_AFM` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_AFM`, `message`, `created_at`) VALUES
(6, 555444333, 'Inserted TECSOFT into the firms table.', '2020-12-17 19:34:21'),
(7, 167222135, 'Inserted 156432111into the Firm representatives table', '2020-12-19 19:16:20'),
(8, 167222135, 'Set conflict status to approved', '2020-12-19 19:22:17'),
(9, 167222135, 'Set 28 conflict status to rejected', '2020-12-19 19:25:59'),
(10, 167222135, 'Inserted New Traffic Lights into the projects table', '2020-12-19 19:29:49'),
(12, 123456789, 'Disclosed conflict of interest \"also working on the project for the firm\" for project with id = 12', '2020-12-19 19:36:05'),
(18, 144322567, '144322567 has logged in.', '2020-12-19 20:03:21'),
(19, 144322567, '144322567 has logged out.', '2020-12-19 20:03:22'),
(20, 333654745, '333654745 has logged in.', '2020-12-19 20:06:37'),
(21, 333654745, 'Applied for project 16', '2020-12-19 20:06:43'),
(22, 333654745, '333654745 has logged out.', '2020-12-19 20:10:34'),
(23, 555444333, '555444333 has logged in.', '2020-12-21 13:25:33'),
(24, 155432111, '155432111 has logged in.', '2020-12-22 14:17:36'),
(25, 155432111, '155432111 has logged out.', '2020-12-22 14:17:52'),
(26, 444333111, '444333111 has logged in.', '2020-12-22 14:18:01'),
(27, 444333111, '444333111 has logged out.', '2020-12-22 14:18:13'),
(30, 155432111, '155432111 has logged in.', '2020-12-22 14:22:33'),
(31, 155432111, 'Applied for project 14', '2020-12-22 14:32:20'),
(32, 155432111, 'Applied for project 11', '2020-12-22 14:55:22'),
(33, 155432111, '155432111 has logged out.', '2020-12-22 14:56:59'),
(36, 555123567, '555123567 has logged in.', '2020-12-26 13:53:14'),
(37, 555123567, '555123567 has logged out.', '2020-12-26 13:53:29'),
(38, 144322567, '144322567 has logged in.', '2020-12-26 13:53:41'),
(39, 144322567, '144322567 has logged out.', '2020-12-26 13:56:25'),
(40, 123456789, '123456789 has logged in.', '2020-12-26 13:56:36'),
(41, 123456789, '123456789 has logged out.', '2020-12-26 13:56:43'),
(42, 167222135, '167222135 has logged in.', '2020-12-26 13:56:54'),
(43, 167222135, '167222135 has logged out.', '2020-12-26 14:23:28'),
(44, 144322567, '144322567 has logged in.', '2020-12-26 14:23:48'),
(45, 144322567, '144322567 has logged out.', '2020-12-26 14:24:57'),
(46, 167222135, '167222135 has logged in.', '2020-12-26 14:25:12'),
(47, 144322567, '144322567 has logged in.', '2020-12-29 17:55:13'),
(48, 144322567, 'Disclosed conflict of interest \"wife on firm board\" for project with id = 10', '2020-12-29 18:02:50'),
(49, 144322567, 'Disclosed conflict of interest \"wife on firm board\" for project with id = 10', '2020-12-29 18:11:12'),
(50, 144322567, 'Disclosed conflict of interest \"wife on firm board\" for project with id = 10', '2020-12-29 18:25:03'),
(51, 144322567, 'Disclosed conflict of interest \"working on team project\" for project with id = 11', '2020-12-29 18:52:54'),
(52, 144322567, '144322567 has logged out.', '2020-12-29 19:03:19'),
(53, 156432111, '156432111 has logged in.', '2020-12-29 19:03:57'),
(54, 156432111, 'Applied for project 10', '2020-12-29 19:05:36'),
(55, 155432111, '155432111 has logged in.', '2020-12-29 19:58:32'),
(56, 155432111, 'Applied for project 13', '2020-12-29 20:02:08'),
(57, 144322567, '144322567 has logged in.', '2020-12-29 21:42:40'),
(58, 167222135, '167222135 has logged in.', '2021-01-05 16:20:34'),
(59, 167222135, 'Inserted 123456789 into the public servants table', '2021-01-05 16:40:56'),
(60, 167222135, '167222135 has logged out.', '2021-01-05 16:42:40'),
(61, 333654745, '333654745 has logged in.', '2021-01-05 16:43:03'),
(62, 333654745, '333654745 has logged out.', '2021-01-05 17:34:27'),
(63, 155432111, '155432111 has logged in.', '2021-01-05 17:34:54'),
(64, 155432111, 'Applied for project 11', '2021-01-05 17:35:39'),
(65, 155432111, 'Applied for project 12', '2021-01-05 17:35:50'),
(66, 155432111, '155432111 has logged out.', '2021-01-05 17:36:00'),
(73, 123456789, '123456789 has logged in.', '2021-01-05 17:47:53'),
(74, 123456789, 'Disclosed conflict of interest \"asdf\" for project with id = 10', '2021-01-05 17:48:05'),
(75, 123456789, '123456789 has logged out.', '2021-01-05 17:57:48'),
(76, 144322567, '144322567 has logged in.', '2021-01-05 17:58:18'),
(77, 144322567, '144322567 has logged out.', '2021-01-05 17:59:07'),
(78, 167222135, '167222135 has logged in.', '2021-01-05 17:59:45'),
(79, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-05 18:08:13'),
(80, 167222135, 'Set conflict with id = 10 ps_AFM 144322567 status to rejected', '2021-01-05 18:09:40'),
(81, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-05 18:17:48'),
(82, 167222135, 'Set conflict with id = 10 ps_AFM 144322567 status to approved', '2021-01-05 18:17:51'),
(83, 167222135, 'Set conflict with id = 11 ps_AFM 144322567 status to rejected', '2021-01-05 18:18:37'),
(84, 167222135, 'Set conflict with id = 10 ps_AFM 144322567 status to rejected', '2021-01-05 18:18:39'),
(85, 167222135, 'Set conflict with id = 10 ps_AFM 144322567 status to approved', '2021-01-05 18:18:40'),
(86, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-05 18:18:41'),
(87, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to rejected', '2021-01-05 18:18:41'),
(88, 167222135, 'Inserted 555123567 into the public servants table', '2021-01-05 18:19:21'),
(89, 167222135, '167222135 has logged in.', '2021-01-06 16:21:51'),
(90, 167222135, 'Inserted 422123666 into the public servants table', '2021-01-06 16:24:03'),
(91, 167222135, 'Inserted 144322567 into the public servants table', '2021-01-06 16:32:32'),
(92, 167222135, 'Inserted 123456789 into the public servants table', '2021-01-06 16:33:19'),
(93, 167222135, 'Inserted 422123666 into the public servants table', '2021-01-06 16:38:26'),
(94, 167222135, 'Inserted 144322567 into the public servants table', '2021-01-06 16:41:48'),
(95, 167222135, 'Inserted 422123666 into the public servants table', '2021-01-06 16:47:43'),
(96, 167222135, 'Inserted 156432111 into the firm representatives table', '2021-01-06 17:08:47'),
(97, 167222135, '167222135 has logged in.', '2021-01-06 17:17:18'),
(98, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to rejected', '2021-01-06 17:46:23'),
(99, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-06 17:46:25'),
(100, 167222135, 'Set conflict with id = 10 ps_AFM 144322567 status to rejected', '2021-01-06 17:46:26'),
(101, 167222135, 'Set conflict with id = 11 ps_AFM 144322567 status to approved', '2021-01-06 17:46:27'),
(102, 167222135, '167222135 has logged out.', '2021-01-06 17:48:42'),
(103, 555444333, '555444333 has logged in.', '2021-01-06 17:49:09'),
(104, 555444333, 'Inserted 157533211 into the public servants table', '2021-01-06 17:49:27'),
(105, 555444333, '555444333 has logged out.', '2021-01-06 17:49:40'),
(106, 157533211, '157533211 has logged in.', '2021-01-06 17:49:56'),
(107, 157533211, 'Disclosed conflict of interest \"on project team\" for project with id = 15', '2021-01-06 17:50:09'),
(108, 157533211, '157533211 has logged out.', '2021-01-06 17:50:19'),
(109, 167222135, '167222135 has logged in.', '2021-01-06 17:50:35'),
(110, 167222135, 'Set conflict with id = 15 ps_AFM 157533211 status to rejected', '2021-01-06 17:50:41'),
(111, 167222135, 'Set conflict with id = 15 ps_AFM 157533211 status to approved', '2021-01-06 17:50:43'),
(112, 167222135, '167222135 has logged out.', '2021-01-06 17:51:05'),
(113, 555123567, '555123567 has logged in.', '2021-01-06 17:54:13'),
(114, 555123567, '555123567 has logged out.', '2021-01-06 17:54:17'),
(115, 167222135, '167222135 has logged in.', '2021-01-06 17:54:27'),
(116, 167222135, 'Inserted 555123567 into the public servants table', '2021-01-06 17:54:40'),
(117, 167222135, 'Inserted 555123567 into the public servants table', '2021-01-06 17:55:01'),
(118, 167222135, '167222135 has logged out.', '2021-01-06 17:55:05'),
(119, 555123567, '555123567 has logged in.', '2021-01-06 17:55:18'),
(120, 555123567, 'Disclosed conflict of interest \"firm director\" for project with id = 13', '2021-01-06 17:55:37'),
(121, 555123567, '555123567 has logged out.', '2021-01-06 18:13:50'),
(122, 167222135, '167222135 has logged in.', '2021-01-06 18:14:04'),
(123, 167222135, 'Deleted public servant422123666 assinged on project =  from database.', '2021-01-06 18:16:07'),
(124, 167222135, 'Inserted 144322567 into the public servants table', '2021-01-06 18:17:15'),
(125, 555123567, '555123567 has logged in.', '2021-01-07 16:27:55'),
(126, 555123567, 'Disclosed conflict of interest \"my brother is on the firm board\" for project with id = 19', '2021-01-07 16:29:06'),
(127, 555123567, '555123567 has logged out.', '2021-01-07 16:29:48'),
(128, 157533211, '157533211 has logged in.', '2021-01-07 16:29:59'),
(129, 157533211, '157533211 has logged out.', '2021-01-07 16:30:08'),
(130, 144322567, '144322567 has logged in.', '2021-01-07 16:30:20'),
(131, 144322567, '144322567 has logged out.', '2021-01-07 16:31:10'),
(132, 123456789, '123456789 has logged in.', '2021-01-07 16:31:22'),
(133, 123456789, '123456789 has logged out.', '2021-01-07 16:31:31'),
(134, 555444333, '555444333 has logged in.', '2021-01-07 16:31:41'),
(135, 555444333, 'Inserted 157533211 into the public servants table', '2021-01-07 16:32:16'),
(136, 555444333, 'Deleted public servant 144322567 assigned on project =  from database.', '2021-01-07 16:32:48'),
(137, 555444333, 'Deleted public servant 144322567 assigned on project =  from database.', '2021-01-07 16:34:50'),
(138, 555444333, 'Inserted 144322567 into the public servants table', '2021-01-07 16:35:03'),
(139, 555444333, 'Inserted 123456789 into the public servants table', '2021-01-07 16:35:30'),
(140, 555444333, 'Inserted 123456789 into the public servants table', '2021-01-07 16:35:49'),
(141, 555444333, 'Inserted 144322567 into the public servants table', '2021-01-07 16:36:36'),
(142, 555444333, 'Inserted 157533211 into the public servants table', '2021-01-07 16:39:06'),
(143, 555444333, 'Inserted 422123666 into the public servants table', '2021-01-07 16:39:32'),
(144, 555444333, 'Inserted New Roadproject into the projects table', '2021-01-07 16:52:32'),
(145, 555444333, '555444333 has logged out.', '2021-01-07 16:58:36'),
(146, 555123567, '555123567 has logged in.', '2021-01-07 16:58:39'),
(147, 555123567, '555123567 has logged out.', '2021-01-07 16:58:45'),
(148, 144322567, '144322567 has logged in.', '2021-01-07 16:58:58'),
(149, 144322567, 'Disclosed conflict of interest \"Director of the firm\" for project with id = 17', '2021-01-07 17:02:08'),
(150, 144322567, '144322567 has logged out.', '2021-01-07 17:02:35'),
(151, 555444333, '555444333 has logged in.', '2021-01-07 17:03:06'),
(152, 555444333, 'Set conflict with id = 15 ps_AFM 157533211 status to approved', '2021-01-07 17:03:54'),
(153, 555444333, 'Set conflict with id = 15 ps_AFM 157533211 status to rejected', '2021-01-07 17:03:55'),
(154, 555444333, 'Set conflict with id = 17 ps_AFM 144322567 status to approved', '2021-01-07 17:03:57'),
(155, 555444333, 'Set conflict with id = 17 ps_AFM 144322567 status to approved', '2021-01-07 17:05:19'),
(156, 555444333, 'Set conflict with id = 10 ps_AFM 123456789 status to rejected', '2021-01-07 17:08:04'),
(157, 555444333, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-07 17:08:07'),
(158, 555444333, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-07 17:08:12'),
(159, 555444333, '555444333 has logged out.', '2021-01-07 17:10:27'),
(160, 155432111, '155432111 has logged in.', '2021-01-07 17:10:39'),
(161, 155432111, 'Applied for project 17', '2021-01-07 17:12:07'),
(162, 155432111, '155432111 has logged out.', '2021-01-07 17:14:39'),
(163, 167222135, '167222135 has logged in.', '2021-01-07 17:14:51'),
(164, 167222135, 'Inserted 444333111 into the firm representatives table', '2021-01-07 17:18:44'),
(165, 167222135, '167222135 has logged in.', '2021-01-07 17:25:35'),
(166, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to rejected', '2021-01-07 17:25:39'),
(167, 167222135, 'Set conflict with id = 10 ps_AFM 123456789 status to approved', '2021-01-07 17:25:43'),
(168, 123456789, '123456789 has logged in.', '2021-01-10 13:47:12'),
(169, 123456789, 'Disclosed conflict of interest \"on firm board\" for project with id = 16', '2021-01-10 13:47:29'),
(170, 123456789, '123456789 has logged out.', '2021-01-10 13:47:57'),
(171, 167222135, '167222135 has logged in.', '2021-01-10 13:48:08'),
(172, 167222135, 'Set conflict with id = 16 ps_AFM 123456789 status to approved', '2021-01-10 13:48:20'),
(173, 167222135, 'Deleted public servant 123456789 assigned on project =  from database.', '2021-01-10 13:48:39'),
(174, 167222135, 'Inserted 123456789 into the public servants table', '2021-01-10 13:48:57'),
(175, 167222135, '167222135 has logged out.', '2021-01-10 13:49:05'),
(176, 123456789, '123456789 has logged in.', '2021-01-10 13:49:13'),
(177, 123456789, '123456789 has logged out.', '2021-01-10 13:49:29'),
(178, 167222135, '167222135 has logged in.', '2021-01-10 13:49:41'),
(179, 167222135, 'Inserted asdfsadf into the firms table.', '2021-01-10 13:51:11'),
(180, 167222135, '167222135 has logged out.', '2021-01-10 13:51:36'),
(181, 444333111, '444333111 has logged in.', '2021-01-10 13:51:55'),
(182, 444333111, 'Applied for project 19', '2021-01-10 13:52:02'),
(183, 444333111, 'Inserted 432786555 into the stakeholders table', '2021-01-10 13:53:00'),
(184, 444333111, 'Deleted 432786555 from the firm stakeholders table', '2021-01-10 13:53:05'),
(185, 444333111, 'Inserted 534222666 into the stakeholders table', '2021-01-10 13:53:24'),
(186, 444333111, '444333111 has logged out.', '2021-01-10 14:02:32'),
(187, 555444333, '555444333 has logged in.', '2021-01-10 14:02:35'),
(188, 167222135, '167222135 has logged in.', '2021-01-11 13:06:30'),
(189, 167222135, '167222135 has logged out.', '2021-01-11 13:06:44'),
(190, 167222135, '167222135 has logged in.', '2021-01-11 13:07:47'),
(191, 167222135, '167222135 has logged out.', '2021-01-11 13:09:59'),
(192, 167222135, '167222135 has logged in.', '2021-01-11 13:10:18'),
(193, 167222135, '167222135 has logged out.', '2021-01-11 13:15:26'),
(194, 155432111, '155432111 has logged in.', '2021-01-11 13:15:29'),
(195, 155432111, '155432111 has logged out.', '2021-01-11 13:15:48'),
(196, 155432111, '155432111 has logged in.', '2021-01-11 13:17:42'),
(197, 155432111, '155432111 has logged out.', '2021-01-11 13:20:39'),
(198, 167222135, '167222135 has logged in.', '2021-01-11 13:21:01'),
(199, 167222135, '167222135 has logged out.', '2021-01-11 13:21:25'),
(202, 167222135, '167222135 has logged in.', '2021-01-11 13:22:15'),
(204, 167222135, '167222135 has logged out.', '2021-01-11 13:22:48'),
(207, 167222135, '167222135 has logged in.', '2021-01-11 13:29:26'),
(208, 167222135, 'Inserted Renovate public squareproject into the projects table', '2021-01-11 13:30:16'),
(209, 167222135, 'Inserted 144322567 into the public servants table', '2021-01-11 13:30:59'),
(210, 167222135, '167222135 has logged out.', '2021-01-11 13:31:03'),
(211, 144322567, '144322567 has logged in.', '2021-01-11 13:31:17'),
(212, 144322567, 'Disclosed conflict of interest \"on firm board\" for project with id = 24', '2021-01-11 13:31:26'),
(213, 144322567, '144322567 has logged out.', '2021-01-11 13:31:28'),
(214, 144322567, '144322567 has logged in.', '2021-01-11 13:31:37'),
(215, 144322567, '144322567 has logged out.', '2021-01-11 13:31:47'),
(216, 167222135, '167222135 has logged in.', '2021-01-11 13:31:50'),
(217, 167222135, 'Set conflict with id = 24 ps_AFM 144322567 status to rejected', '2021-01-11 13:31:55'),
(218, 167222135, 'Deleted public servant 123456789 assigned on project =  from database.', '2021-01-11 13:34:09'),
(219, 167222135, '167222135 has logged out.', '2021-01-11 13:43:38'),
(237, 156432111, '156432111 has logged in.', '2021-01-11 13:59:23'),
(238, 444333111, '444333111 has logged in.', '2021-01-11 14:01:10'),
(239, 444333111, '444333111 has logged in.', '2021-01-11 14:02:30'),
(240, 444333111, '444333111 has logged out.', '2021-01-11 14:02:59'),
(241, 444333111, '444333111 has logged in.', '2021-01-11 14:03:05'),
(242, 444333111, '444333111 has logged out.', '2021-01-11 14:03:31'),
(243, 444333111, '444333111 has logged in.', '2021-01-11 14:03:35'),
(244, 444333111, 'Applied for project 10', '2021-01-11 14:05:04'),
(245, 444333111, 'Applied for project 12', '2021-01-11 14:05:33'),
(246, 444333111, '444333111 has logged out.', '2021-01-11 14:11:41'),
(247, 167222135, '167222135 has logged in.', '2021-01-11 14:12:14'),
(248, 167222135, 'Inserted NEWFIRM into the firms table.', '2021-01-11 14:12:35'),
(249, 167222135, 'Inserted 1236566777 into the firm representatives table', '2021-01-11 14:13:38'),
(250, 167222135, 'Deleted 1236566777 from the firm representatives table', '2021-01-11 14:13:44'),
(251, 167222135, 'Inserted 1236566777 into the firm representatives table', '2021-01-11 14:14:01'),
(252, 167222135, '167222135 has logged out.', '2021-01-11 14:14:05'),
(253, 1236566777, '1236566777 has logged in.', '2021-01-11 14:14:15'),
(254, 1236566777, '1236566777 has logged out.', '2021-01-11 14:14:19'),
(255, 156432111, '156432111 has logged in.', '2021-01-11 14:14:35'),
(256, 156432111, 'Applied for project 15', '2021-01-11 14:15:07'),
(257, 156432111, 'Applied for project 16', '2021-01-11 14:15:25'),
(258, 156432111, 'Inserted 166333222 into the stakeholders table', '2021-01-11 14:15:39'),
(259, 156432111, 'Deleted 166333222 from the firm stakeholders table', '2021-01-11 14:15:43'),
(260, 1236566777, '1236566777 has logged in.', '2021-01-11 15:04:54'),
(261, 1236566777, '1236566777 has logged out.', '2021-01-11 15:04:59'),
(262, 167222135, '167222135 has logged in.', '2021-01-11 15:05:11'),
(263, 167222135, 'Deleted 1236566777 from the firm representatives table', '2021-01-11 15:05:19'),
(264, 167222135, '167222135 has logged out.', '2021-01-11 15:05:20'),
(265, 1236566777, '1236566777 has logged in.', '2021-01-11 15:05:30'),
(266, 167222135, '167222135 has logged in.', '2021-01-26 17:48:03'),
(267, 167222135, 'Inserted 555123567 into the public servants table', '2021-01-26 17:50:11'),
(268, 167222135, 'Deleted public servant 555123567 assigned on project =  from database.', '2021-01-26 17:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(12) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_start_date` date NOT NULL,
  `project_end_date` date NOT NULL,
  `project_desc` varchar(1000) NOT NULL CHECK (`project_start_date` < `project_end_date` and `project_start_date` > '2019-01-01')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `project_name`, `project_start_date`, `project_end_date`, `project_desc`) VALUES
(10, 'Egnatia Odos', '2020-11-25', '2021-06-08', 'Build public road in Macedonia'),
(11, '5G Network', '2020-11-17', '2020-12-31', 'Improve network capabilities to include 5G'),
(12, 'Replace asphalt', '2020-11-18', '2021-04-19', 'New asphalting of public road in Marousi Attikis'),
(13, 'Megalos Peripatos', '2020-11-16', '2021-05-25', 'Create sidewalk in Athens center'),
(14, 'Christmas decoration', '2020-12-03', '2021-01-26', 'Christmas decoration for Athens center'),
(15, 'Public square renovation', '2020-12-03', '2021-06-18', 'Public square renovation in village Karydia Aitoloakarnanias'),
(16, 'New military aircraft', '2020-11-11', '2021-12-22', 'Create new military aircraft for the army'),
(17, 'Build a new street', '2020-12-15', '2021-05-04', 'Building new street'),
(18, 'Renovate building', '2020-12-15', '2021-02-24', 'Building Renovation in Athens Center'),
(19, 'New Cables', '2020-12-18', '2021-06-22', 'Underground cables'),
(22, 'New Traffic Lights', '2020-12-23', '2021-01-28', 'New Traffic Lights in Athens center'),
(23, 'New Road', '2021-01-08', '2021-07-15', 'building a new road'),
(24, 'Renovate public square', '2021-01-12', '2021-02-24', 'renovate public square');

-- --------------------------------------------------------

--
-- Table structure for table `public_servants`
--

CREATE TABLE `public_servants` (
  `ps_AFM` int(9) NOT NULL,
  `project_id` int(9) NOT NULL,
  `ps_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `public_servants`
--

INSERT INTO `public_servants` (`ps_AFM`, `project_id`, `ps_role`) VALUES
(123456789, 17, 'technical overseer'),
(123456789, 22, 'Financial advisor'),
(144322567, 11, 'economical overseer'),
(144322567, 12, 'Overseer'),
(144322567, 14, 'financial advisor'),
(144322567, 17, 'overseer'),
(144322567, 24, 'technical overseer'),
(157533211, 15, 'overseer'),
(157533211, 18, 'mechanical advisor'),
(157533211, 22, 'technical overseer'),
(422123666, 13, 'communications facilitator'),
(422123666, 16, 'Mechanical Advisor'),
(422123666, 19, 'technical overseer'),
(555123567, 13, 'financial advisor'),
(555123567, 19, 'financial advisor');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `AFM` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`AFM`, `name`, `password`, `user_type`, `created_at`) VALUES
(123456789, 'Kostas Petrakopoulos', '$2y$10$F./KHQ12KSxoJsP4jXMYueDO3CKWQ9sYxFN2s3IpHow/QthkSHrzq', 'PS', '2020-12-02 19:00:24'),
(144322567, 'Ioannis Ioannou', '$2y$10$Se6mDR8UeQbNWhDf0I6z1uuDsd0y9SRHmFQ7jlfK78j4QLVVeAg9.', 'PS', '2020-12-03 01:05:22'),
(155432111, 'Giannis Papadopoulos', '$2y$10$uIQVfiYUos87HBERGdPPyOlJZzFovf4e4bsELtVGSZlKB8xtubNY.', 'FR', '2020-12-02 18:49:59'),
(156432111, 'Orestis Kanakis', '$2y$10$FeN1bcjnHxb/05JmLseE/.hes1FR1vk9UMGoC5xVNd4GrC/nd8y0q', 'FR', '2020-12-02 19:29:56'),
(157533211, 'Thomas Lambrou', '$2y$10$ckGg0oguRYVnDEA9vlAAL.TIa0VzAv3gzaq8PnqewHzGTs6DWaaIK', 'PS', '2021-01-06 19:47:34'),
(167222135, 'Thanos Giannakis', '$2y$10$XJj.JD60361vyy5r8Ke2heHoFmtkT2r.lqoZU.XNAxkOH54nFooZG', 'GO', '2020-12-02 19:32:43'),
(333654745, 'Giannis Stekas', '$2y$10$LiMFP56Q3BJV/m.bnZdsQOhWMEwcp/6qITto.WAuOCuE5WWzyhdpK', 'FR', '2020-12-15 19:45:16'),
(422123666, 'Lambros Konstas', '$2y$10$TyV/hTQKFi23SNOoaf3OQO3w/FLOYtyLms06nIyks0TQvmGFB.1GW', 'PS', '2020-12-18 19:28:59'),
(444333111, 'Ilias Petrou', '$2y$10$MMgkooPsa1cUQ1cABB8fFuAX3T4KIKzBLxG9XAO8E/4DLb31Al6o.', 'FR', '2020-12-15 19:43:57'),
(555123567, 'Takis Bougas', '$2y$10$BB91J798m27lYFECAwrl3OqIUtdV8bjryO1YP0KQGvMgKfRnnnmsa', 'PS', '2020-12-16 17:10:17'),
(555444333, 'George Efremoglou', '$2y$10$omH9lAXWSz3ewai6HDFTe.QET2FyMrrtvNmtBC3iXYzzjmwfUvZQO', 'GO', '2020-12-15 18:22:23'),
(1236566777, 'New FR', '$2y$10$OE6xL4iWpA0dzQw5r/MuF.zvmRpHnaObyve4U9W55w9jHUVOuvBry', 'FR', '2021-01-11 16:13:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD PRIMARY KEY (`project_id`,`ps_AFM`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `ps_AFM` (`ps_AFM`);

--
-- Indexes for table `firms`
--
ALTER TABLE `firms`
  ADD PRIMARY KEY (`firm_id`),
  ADD UNIQUE KEY `firm_name` (`firm_name`);

--
-- Indexes for table `firms_projects`
--
ALTER TABLE `firms_projects`
  ADD PRIMARY KEY (`firm_id`,`project_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `firm_id` (`firm_id`);

--
-- Indexes for table `firm_representatives`
--
ALTER TABLE `firm_representatives`
  ADD PRIMARY KEY (`fr_AFM`),
  ADD KEY `firm_id` (`firm_id`);

--
-- Indexes for table `firm_stakeholders`
--
ALTER TABLE `firm_stakeholders`
  ADD PRIMARY KEY (`stakeholder_AFM`,`project_id`),
  ADD KEY `firm_id` (`firm_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_AFM` (`user_AFM`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `public_servants`
--
ALTER TABLE `public_servants`
  ADD PRIMARY KEY (`ps_AFM`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`AFM`),
  ADD UNIQUE KEY `username` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `firms`
--
ALTER TABLE `firms`
  MODIFY `firm_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD CONSTRAINT `conflicts_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `conflicts_ibfk_2` FOREIGN KEY (`ps_AFM`) REFERENCES `users` (`AFM`);

--
-- Constraints for table `firms_projects`
--
ALTER TABLE `firms_projects`
  ADD CONSTRAINT `firms_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `firms_projects_ibfk_2` FOREIGN KEY (`firm_id`) REFERENCES `firms` (`firm_id`);

--
-- Constraints for table `firm_representatives`
--
ALTER TABLE `firm_representatives`
  ADD CONSTRAINT `firm_representatives_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `firms` (`firm_id`),
  ADD CONSTRAINT `firm_representatives_ibfk_2` FOREIGN KEY (`fr_AFM`) REFERENCES `users` (`AFM`);

--
-- Constraints for table `firm_stakeholders`
--
ALTER TABLE `firm_stakeholders`
  ADD CONSTRAINT `firm_stakeholders_ibfk_2` FOREIGN KEY (`firm_id`) REFERENCES `firms` (`firm_id`),
  ADD CONSTRAINT `firm_stakeholders_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`user_AFM`) REFERENCES `users` (`AFM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `public_servants`
--
ALTER TABLE `public_servants`
  ADD CONSTRAINT `public_servants_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `public_servants_ibfk_2` FOREIGN KEY (`ps_AFM`) REFERENCES `users` (`AFM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
