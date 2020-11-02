-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 11:23 PM
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
-- Constraints for dumped tables
--

--
-- Constraints for table `conflicts`
--
ALTER TABLE `conflicts`
  ADD CONSTRAINT `conflicts_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `conflicts_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `public_servants` (`ps_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
