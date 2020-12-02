-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 12:38 AM
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
  `conflict_id` int(9) NOT NULL,
  `project_id` int(9) NOT NULL,
  `ps_AFM` int(9) NOT NULL,
  `coi_description` varchar(500) NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conflicts`
--

INSERT INTO `conflicts` (`conflict_id`, `project_id`, `ps_AFM`, `coi_description`, `status`) VALUES
(16, 10, 123456789, 'wife on firm board', 'rejected'),
(18, 11, 144322567, 'I am project manager for this project on the firm', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `firm`
--

CREATE TABLE `firm` (
  `firm_id` int(9) NOT NULL,
  `firm_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firm`
--

INSERT INTO `firm` (`firm_id`, `firm_name`) VALUES
(1, 'AKTOR');

-- --------------------------------------------------------

--
-- Table structure for table `firms_projects`
--

CREATE TABLE `firms_projects` (
  `firm_id` int(9) NOT NULL COMMENT '9',
  `project_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firms_projects`
--

INSERT INTO `firms_projects` (`firm_id`, `project_id`) VALUES
(1, 10),
(1, 13),
(1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `firm_representatives`
--

CREATE TABLE `firm_representatives` (
  `fr_AFM` int(9) NOT NULL,
  `firm_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(233145666, 'Pavlos Diogenous', 1, 'Shareholder in the company', 13),
(555111333, 'Giannis Sxinas', 1, 'board director', 10);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(12) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_start_date` date NOT NULL,
  `project_end_date` date NOT NULL,
  `project_desc` varchar(1000) NOT NULL
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
(16, 'New military aircraft', '2020-11-11', '2021-12-22', 'Create new military aircraft for the army');

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
(123456789, 10, 'technical overseer'),
(144322567, 11, 'economical overseer');

-- --------------------------------------------------------

--
-- Table structure for table `stakeholders_projects`
--

CREATE TABLE `stakeholders_projects` (
  `stakeholder_AFM` int(9) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(167222135, 'Thanos Giannakis', '$2y$10$XJj.JD60361vyy5r8Ke2heHoFmtkT2r.lqoZU.XNAxkOH54nFooZG', 'GO', '2020-12-02 19:32:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD PRIMARY KEY (`conflict_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `ps_AFM` (`ps_AFM`);

--
-- Indexes for table `firm`
--
ALTER TABLE `firm`
  ADD PRIMARY KEY (`firm_id`);

--
-- Indexes for table `firms_projects`
--
ALTER TABLE `firms_projects`
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
  ADD PRIMARY KEY (`stakeholder_AFM`),
  ADD KEY `firm_id` (`firm_id`),
  ADD KEY `project_id` (`project_id`);

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
  ADD PRIMARY KEY (`ps_AFM`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `stakeholders_projects`
--
ALTER TABLE `stakeholders_projects`
  ADD PRIMARY KEY (`stakeholder_AFM`,`project_id`),
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
-- AUTO_INCREMENT for table `conflicts`
--
ALTER TABLE `conflicts`
  MODIFY `conflict_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `firm`
--
ALTER TABLE `firm`
  MODIFY `firm_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `firms_projects_ibfk_2` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`);

--
-- Constraints for table `firm_representatives`
--
ALTER TABLE `firm_representatives`
  ADD CONSTRAINT `firm_representatives_ibfk_1` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`),
  ADD CONSTRAINT `firm_representatives_ibfk_2` FOREIGN KEY (`fr_AFM`) REFERENCES `users` (`AFM`);

--
-- Constraints for table `firm_stakeholders`
--
ALTER TABLE `firm_stakeholders`
  ADD CONSTRAINT `firm_stakeholders_ibfk_2` FOREIGN KEY (`firm_id`) REFERENCES `firm` (`firm_id`),
  ADD CONSTRAINT `firm_stakeholders_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `public_servants`
--
ALTER TABLE `public_servants`
  ADD CONSTRAINT `public_servants_ibfk_1` FOREIGN KEY (`ps_AFM`) REFERENCES `users` (`AFM`),
  ADD CONSTRAINT `public_servants_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `stakeholders_projects`
--
ALTER TABLE `stakeholders_projects`
  ADD CONSTRAINT `stakeholders_projects_ibfk_1` FOREIGN KEY (`stakeholder_AFM`) REFERENCES `firm_stakeholders` (`stakeholder_AFM`),
  ADD CONSTRAINT `stakeholders_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
