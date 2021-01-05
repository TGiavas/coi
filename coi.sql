-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 07:20 PM
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
(10, 123456789, 'asdf', 'rejected'),
(10, 144322567, 'wife on firm board', 'approved'),
(11, 144322567, 'working on team project', 'rejected');

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
(5, 11, '2021-01-05'),
(5, 14, '2021-01-05');

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
(156432111, 1),
(444333111, 1),
(666343321, 5),
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
(28, 666343321, '666343321 has logged in.', '2020-12-22 14:18:21'),
(29, 666343321, '666343321 has logged out.', '2020-12-22 14:22:24'),
(30, 155432111, '155432111 has logged in.', '2020-12-22 14:22:33'),
(31, 155432111, 'Applied for project 14', '2020-12-22 14:32:20'),
(32, 155432111, 'Applied for project 11', '2020-12-22 14:55:22'),
(33, 155432111, '155432111 has logged out.', '2020-12-22 14:56:59'),
(34, 666343321, '666343321 has logged in.', '2020-12-22 14:57:10'),
(35, 666343321, 'Applied for project 12', '2020-12-22 14:57:20'),
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
(67, 666343321, '666343321 has logged in.', '2021-01-05 17:36:17'),
(68, 666343321, 'Applied for project 11', '2021-01-05 17:39:52'),
(69, 666343321, 'Applied for project 14', '2021-01-05 17:42:35'),
(70, 666343321, 'Inserted 567111333 into the stakeholders table', '2021-01-05 17:44:53'),
(71, 666343321, 'Inserted 133222666 into the stakeholders table', '2021-01-05 17:46:56'),
(72, 666343321, '666343321 has logged out.', '2021-01-05 17:47:38'),
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
(88, 167222135, 'Inserted 555123567 into the public servants table', '2021-01-05 18:19:21');

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
(22, 'New Traffic Lights', '2020-12-23', '2021-01-28', 'New Traffic Lights in Athens center');

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
(123456789, 10, 'financial advisor'),
(144322567, 10, 'technical overseer'),
(144322567, 11, 'economical overseer'),
(144322567, 14, 'overseer'),
(555123567, 17, 'overseer');

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
(167222135, 'Thanos Giannakis', '$2y$10$XJj.JD60361vyy5r8Ke2heHoFmtkT2r.lqoZU.XNAxkOH54nFooZG', 'GO', '2020-12-02 19:32:43'),
(333654745, 'Giannis Stekas', '$2y$10$LiMFP56Q3BJV/m.bnZdsQOhWMEwcp/6qITto.WAuOCuE5WWzyhdpK', 'FR', '2020-12-15 19:45:16'),
(422123666, 'Lambros Konstas', '$2y$10$TyV/hTQKFi23SNOoaf3OQO3w/FLOYtyLms06nIyks0TQvmGFB.1GW', 'PS', '2020-12-18 19:28:59'),
(444333111, 'Ilias Petrou', '$2y$10$MMgkooPsa1cUQ1cABB8fFuAX3T4KIKzBLxG9XAO8E/4DLb31Al6o.', 'FR', '2020-12-15 19:43:57'),
(555123567, 'Takis Bougas', '$2y$10$BB91J798m27lYFECAwrl3OqIUtdV8bjryO1YP0KQGvMgKfRnnnmsa', 'PS', '2020-12-16 17:10:17'),
(555444333, 'George Efremoglou', '$2y$10$omH9lAXWSz3ewai6HDFTe.QET2FyMrrtvNmtBC3iXYzzjmwfUvZQO', 'GO', '2020-12-15 18:22:23'),
(666343321, 'Petros Rousos', '$2y$10$eDNznYwDlJYTqgrx6yuHoeydhwBFIgZMpG6kBtwgdftqnHP74xLcq', 'FR', '2020-12-15 19:28:29');

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
  ADD PRIMARY KEY (`ps_AFM`,`project_id`);

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
  MODIFY `firm_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD CONSTRAINT `conflicts_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `conflicts_ibfk_2` FOREIGN KEY (`ps_AFM`) REFERENCES `public_servants` (`ps_AFM`);

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
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`user_AFM`) REFERENCES `users` (`AFM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
