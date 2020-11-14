-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2020 at 05:20 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

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
  `project_id` int(12) NOT NULL,
  `ps_id` int(12) NOT NULL,
  `ps_name` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `coi_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `firm_project`
--

CREATE TABLE `firm_project` (
  `firm_name` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firm_project`
--

INSERT INTO `firm_project` (`firm_name`, `project_id`) VALUES
('test', 10),
('test', 15);

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
  `stakeholder_role` varchar(20) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `firm_stakeholder`
--

INSERT INTO `firm_stakeholder` (`stakeholder_AFM`, `stakeholder_name`, `stakeholder_firm`, `stakeholder_role`, `project_id`) VALUES
(133245567, 'Giorgos Mitrou', 'test', 'Technical overseer', 15),
(166235765, 'Kostas Pandazopoulos', 'test', 'Firm Shareholder', 15),
(543234111, 'Takis Karatzis', 'test', 'Firm Shareholder', 15);

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
(10, 'Egnatia Odos', '2020-11-12', '2020-12-23', 'Public Road'),
(11, 'Megalos Peripatos', '2020-11-13', '2020-12-23', 'Build sidewalks in Athens center'),
(12, 'E-gov', '2020-11-19', '2021-01-20', 'Create website with government services'),
(13, '5G network', '2020-12-23', '2021-02-23', 'Update telecommunications network'),
(14, 'Asphalt paving in Daphne', '2021-02-15', '2021-03-16', 'Pave with asphalt roads in dimos Daphne'),
(15, 'Traffic lights in Leoforos Kifisias', '2020-11-10', '2021-01-27', 'Add new traffic lights in Leoforos Kifisias'),
(16, 'Ethniki Odos Athinon Patron', '2021-04-01', '2021-06-29', 'Create new national road network'),
(17, 'Add new telephone lines', '2020-11-21', '2021-02-24', 'Installation of new telephone lines in Marousi Attiki'),
(18, 'Paint benches', '2020-11-11', '2021-01-13', 'Bench painting in Cholargos Attiki'),
(19, 'New public road', '2020-11-20', '2021-01-27', 'New public road in Platanos village');

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
-- Indexes for table `firm_project`
--
ALTER TABLE `firm_project`
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `firm_stakeholder`
--
ALTER TABLE `firm_stakeholder`
  ADD PRIMARY KEY (`stakeholder_AFM`),
  ADD KEY `project_id` (`project_id`);

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
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- Constraints for table `firm_project`
--
ALTER TABLE `firm_project`
  ADD CONSTRAINT `firm_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

--
-- Constraints for table `firm_stakeholder`
--
ALTER TABLE `firm_stakeholder`
  ADD CONSTRAINT `firm_stakeholder_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`);

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
