-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 01:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `project_id` int(12) NOT NULL,
  `ps_id` int(12) NOT NULL,
  `ps_name` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `coi_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conflicts`
--

INSERT INTO `conflicts` (`project_id`, `ps_id`, `ps_name`, `project_name`, `coi_description`) VALUES
(8, 1, 'John Smith', 'Public Road', 'Wife is on the firm board');

-- --------------------------------------------------------

--
-- Table structure for table `firm_project`
--

CREATE TABLE `firm_project` (
  `firm_name` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `firm_representatives`
--

CREATE TABLE `firm_representatives` (
  `fr_AFM` int(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firm_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `firm_stakeholder`
--

CREATE TABLE `firm_stakeholder` (
  `stakeholder_AFM` int(9) NOT NULL,
  `stakeholder_name` varchar(20) NOT NULL,
  `stakeholder_firm` varchar(20) NOT NULL,
  `stakeholder_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Project 1', '2020-10-27', '0000-00-00', ''),
(2, '2', '2020-10-27', '0000-00-00', ''),
(3, 'asdfasdf', '2020-10-27', '0000-00-00', ''),
(4, 'asdfasf', '2020-10-27', '0000-00-00', 'desc'),
(5, 'asdfasdfsed', '0000-00-00', '2020-10-26', '2020-11-12'),
(6, 'test project', '0000-00-00', '2020-11-10', '2020-11-26'),
(7, 'asdf', '2020-11-03', '2020-11-18', 'asdfasdfsdf'),
(8, 'Public Road', '2020-11-04', '2020-11-12', 'Road'),
(9, 'Egnatia Odos', '2020-11-11', '2020-11-27', 'dromos sti makedonia');

-- --------------------------------------------------------

--
-- Table structure for table `ps_projects`
--

CREATE TABLE `ps_projects` (
  `ps_AFM` int(9) NOT NULL,
  `project_id` int(12) NOT NULL,
  `ps_name` varchar(20) NOT NULL,
  `project_name` varchar(20) NOT NULL,
  `ps_role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `public_servants`
--

CREATE TABLE `public_servants` (
  `ps_AFM` int(9) NOT NULL,
  `ps_name` varchar(50) NOT NULL,
  `ps_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `public_servants`
--

INSERT INTO `public_servants` (`ps_AFM`, `ps_name`, `ps_role`) VALUES
(1, 'John Smit', 'overseer');

-- --------------------------------------------------------

--
-- Table structure for table `stakeholder_projects`
--

CREATE TABLE `stakeholder_projects` (
  `stakeholder_AFM` int(9) NOT NULL,
  `project_id` int(11) NOT NULL,
  `stakeholder_name` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD PRIMARY KEY (`project_id`,`ps_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `project_id_2` (`project_id`);

--
-- Indexes for table `firm_stakeholder`
--
ALTER TABLE `firm_stakeholder`
  ADD PRIMARY KEY (`stakeholder_AFM`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `ps_projects`
--
ALTER TABLE `ps_projects`
  ADD PRIMARY KEY (`ps_AFM`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `public_servants`
--
ALTER TABLE `public_servants`
  ADD PRIMARY KEY (`ps_AFM`);

--
-- Indexes for table `stakeholder_projects`
--
ALTER TABLE `stakeholder_projects`
  ADD PRIMARY KEY (`stakeholder_AFM`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD CONSTRAINT `conflicts_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `conflicts_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `public_servants` (`ps_AFM`);

--
-- Constraints for table `ps_projects`
--
ALTER TABLE `ps_projects`
  ADD CONSTRAINT `ps_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `ps_projects_ibfk_2` FOREIGN KEY (`ps_AFM`) REFERENCES `public_servants` (`ps_AFM`);

--
-- Constraints for table `stakeholder_projects`
--
ALTER TABLE `stakeholder_projects`
  ADD CONSTRAINT `stakeholder_projects_ibfk_1` FOREIGN KEY (`stakeholder_AFM`) REFERENCES `firm_stakeholder` (`stakeholder_AFM`),
  ADD CONSTRAINT `stakeholder_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
