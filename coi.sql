-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 09:19 PM
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
CREATE DATABASE IF NOT EXISTS `coi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coi`;

-- --------------------------------------------------------

--
-- Table structure for table `conflicts`
--

CREATE TABLE `conflicts` (
  `PS_name` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `coi_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `conflicts`
--

INSERT INTO `conflicts` (`PS_name`, `project_name`, `coi_description`) VALUES
('sdfgsdfg', 'fssgdf', 'sdfgsdfg');

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
(7, 'asdf', '2020-11-03', '2020-11-18', 'asdfasdfsdf');

-- --------------------------------------------------------

--
-- Table structure for table `public_servants`
--

CREATE TABLE `public_servants` (
  `ps_ID` int(12) NOT NULL,
  `ps_name` varchar(50) NOT NULL,
  `ps_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `public_servants`
--
ALTER TABLE `public_servants`
  ADD PRIMARY KEY (`ps_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `public_servants`
--
ALTER TABLE `public_servants`
  MODIFY `ps_ID` int(12) NOT NULL AUTO_INCREMENT;
--
-- Database: `example`
--
CREATE DATABASE IF NOT EXISTS `example` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `example`;

-- --------------------------------------------------------

--
-- Table structure for table `example1`
--

CREATE TABLE `example1` (
  `anInt` int(11) NOT NULL,
  `two` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `example1`
--

INSERT INTO `example1` (`anInt`, `two`) VALUES
(1234, 0),
(1234, 0),
(12345, 0),
(12345, 0),
(666, 0);
--
-- Database: `fitness`
--
CREATE DATABASE IF NOT EXISTS `fitness` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fitness`;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `plan_name` text NOT NULL,
  `days` text NOT NULL,
  `exercises` text NOT NULL,
  `duration` text NOT NULL,
  `member` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `plan_name`, `days`, `exercises`, `duration`, `member`, `created_date`) VALUES
(1, 'John\'s Plan', '4', 'Running,Pushup', '2 hours each', '', '2017-03-05 12:53:10'),
(6, 'Azam\'s Plan', '2', 'Sleeping,Situp', '1 hour', '', '2017-03-05 15:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `created_date`) VALUES
(1, 'Tom', 'Bill', 'tom.bill@yahoo.com', '2017-03-04 15:51:39'),
(3, 'Yam', 'Nall', 'yam.nall@yahoo.com', '2017-03-04 17:06:21'),
(5, 'John', 'Buckanan', 'john@insideiim.com', '2017-03-05 08:01:21'),
(7, 'Azam', 'Ansari', 'aliazam005@gmail.com', '2017-03-05 09:37:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- Database: `gym`
--
CREATE DATABASE IF NOT EXISTS `gym` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gym`;

-- --------------------------------------------------------

--
-- Table structure for table `bmi`
--

CREATE TABLE `bmi` (
  `memberId` varchar(10) NOT NULL,
  `date` varchar(200) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cardio`
--

CREATE TABLE `cardio` (
  `memberId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `distance` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `memberId` varchar(10) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberId`, `fName`, `lName`, `address`, `phone`, `email`, `password`, `status`, `height`) VALUES
('R00000000', 'Admin', 'Admin', 'Cork Rosa Ave 12', 893254158, 'admin@admin', 'aa', 3, 180),
('R00000001', 'Trainer', 'One', 'Cork, Bishopstown 12A', 876542158, 'trainer@one', 'to', 2, 0),
('R00000002', 'Trainer', 'Two', 'Cork, Hidden Street 6', 858957845, 'trainer@two', 'tt', 2, 0),
('R00000003', 'Trainer', 'Three', 'Cork, Model Farm Road 10', 859654712, 'trainer@three', 'tt', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `dates` varchar(20) NOT NULL,
  `startTimes` smallint(6) NOT NULL,
  `trainerId` varchar(10) NOT NULL,
  `studentId` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `memberId` varchar(20) NOT NULL,
  `color` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trainerschedule`
--

CREATE TABLE `trainerschedule` (
  `trainerId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `startTime` smallint(6) NOT NULL,
  `noOfHours` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainerschedule`
--

INSERT INTO `trainerschedule` (`trainerId`, `date`, `startTime`, `noOfHours`) VALUES
('R00000001', '2014-12-12', 9, 5),
('R00000001', '2014-12-13', 11, 5),
('R00000002', '2014-12-12', 12, 5),
('R00000002', '2014-12-13', 9, 5),
('R00000003', '2014-12-12', 15, 4),
('R00000003', '2014-12-13', 13, 6);

--
-- Triggers `trainerschedule`
--
DELIMITER $$
CREATE TRIGGER `delete schedules` BEFORE DELETE ON `trainerschedule` FOR EACH ROW BEGIN 
       delete from schedules where dates = OLD.date and trainerId = OLD.trainerId;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workout`
--

CREATE TABLE `workout` (
  `memberId` varchar(10) NOT NULL,
  `date` varchar(20) NOT NULL,
  `setId` int(11) NOT NULL,
  `exerciseType` varchar(50) NOT NULL,
  `reps` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bmi`
--
ALTER TABLE `bmi`
  ADD PRIMARY KEY (`memberId`,`date`);

--
-- Indexes for table `cardio`
--
ALTER TABLE `cardio`
  ADD PRIMARY KEY (`memberId`,`date`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`dates`,`startTimes`,`trainerId`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`memberId`);

--
-- Indexes for table `trainerschedule`
--
ALTER TABLE `trainerschedule`
  ADD PRIMARY KEY (`trainerId`,`date`,`startTime`);

--
-- Indexes for table `workout`
--
ALTER TABLE `workout`
  ADD PRIMARY KEY (`memberId`,`date`,`setId`,`exerciseType`);
--
-- Database: `mathel`
--
CREATE DATABASE IF NOT EXISTS `mathel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mathel`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `message`) VALUES
(3, 'Themis', 'tgiavasoglou@gmail.com', 'Your gym is the best!'),
(4, 'Bob', 'bob@gmail.com', 'You guys are the best!'),
(5, 'Bob', 'bob@gmail.com', 'You guys are the best!'),
(6, 'tom', 'tom@gmail.com', 'Best fitness in town'),
(7, 'Maria', 'maria@gmail.com', 'I love your gym!'),
(8, 'Helen', 'helen@gmail.com', 'So friendly atmosphere!'),
(9, 'John', 'john@gmail.com', 'When can I come for a trial?'),
(10, 'Mitsos', 'mitsos@gmail.com', 'Do you guys have a trial?'),
(11, 'kostas', 'kostas@gmail.com', 'blahafaglksj;gf'),
(14, 'presentationcomm', 'presentationcomment@gmail.com', 'blah blah');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `user_id` int(10) NOT NULL,
  `image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`user_id`, `image`) VALUES
(47, 'uploads/Takis.jpeg'),
(49, 'uploads/arnsch.jpeg'),
(50, 'uploads/giannisk.jpeg'),
(51, 'uploads/magdar.jpeg'),
(54, 'uploads/kostasp.jpeg'),
(58, 'uploads/presentation.jpeg'),
(61, 'uploads/presentationtest.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `usertype` varchar(11) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `usertype`, `password`) VALUES
(5, 'themis', 'tgiavasoglou@gmail.com', 'admin', '1234'),
(13, 'xrysa.maltezou', 'xrysa.maltezou@gmail.com', 'instructor', '1234'),
(32, 'thanos.siganopoulos', 'thanos.siganopoulos@gmail.com', 'instructor', '1234'),
(33, 'helen.christou', 'helen.christou@gmail.com', 'instructor', '1234'),
(34, 'nikos.avramidis', 'nikos.avramidis@gmail.com', 'instructor', '1234'),
(36, 'marios.apostolakis', 'marios.apostolakis@gmail.com', 'instructor', '1234'),
(38, 'ioannis.oikonomou', 'ioannis.oikonomou@gmail.com', 'instructor', '1234'),
(39, 'kostas.kadaris', 'kostas.kadaris@gmail.com', 'instructor', '1234'),
(40, 'nondas.avramoglou', 'nondas.avramoglou@gmail.com', 'instructor', '1234'),
(42, 'tasos.papadopoulos', 'tpap@gmail.com', 'user', '1234'),
(43, 'mariak', 'mariak@gmail.com', 'user', '1234'),
(44, 'petrosa', 'petros.apostolopoulos@gmail.com', 'user', '1234'),
(45, 'kostas', 'kostas@gmail.com', 'user', '1234'),
(46, 'JohnPap', 'johnpap@gmail.com', 'user', '1234'),
(47, 'Takis', 'Mitrou@gmail.com', 'user', '1234'),
(48, 'lakisd', 'lakisd@gmail.com', 'user', '1234'),
(49, 'arnsch', 'arnsch@gmail.com', 'user', '1234'),
(50, 'giannisk', 'giannisk@gmail.com', 'user', '1234'),
(51, 'magdar', 'magdar@gmail.com', 'user', '1234'),
(52, 'margarita', 'margarita@gmail.com', 'admin', '1234'),
(53, 'loukas', 'loukas@gmail.com', 'admin', '1234'),
(54, 'kostasp', 'kostasp@gmail.com', 'user', '1234'),
(55, 'giannistar', 'giannistar@gmail.com', 'user', '1234'),
(56, 'feniat', 'feniat@gmail.com', 'user', '1234'),
(57, 'kostasm', 'kostasm@gmail.com', 'user', '1234'),
(61, 'presentationtest', 'presentationtest@gmail.com', 'user', '1234'),
(62, 'presentationtest2', 'presentationtest2@gmail.com', 'user', '1234'),
(63, 'mrkosmopoulospresentation', 'mrkosmopoulospresentation@gmail.com', 'user', '1234'),
(65, 'meniosf', 'meniosf@gmail.com', 'user', '1234'),
(66, 'katiad', 'katiad@gmail.com', 'user', '1234'),
(67, 'babisf', 'babisf@gmail.com', 'user', '1234'),
(68, 'nikosk', 'nikosk@gmail.com', 'user', '1234'),
(69, 'tasosk', 'tasosk@gmail.com', 'user', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `user_training`
--

CREATE TABLE `user_training` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `wt` int(11) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `muscle` varchar(11) NOT NULL,
  `toning` varchar(11) NOT NULL,
  `fitness` varchar(11) NOT NULL,
  `weights` varchar(11) NOT NULL,
  `running` varchar(11) NOT NULL,
  `cycling` varchar(11) NOT NULL,
  `groups` varchar(11) NOT NULL,
  `yoga` varchar(11) NOT NULL,
  `pilates` varchar(11) NOT NULL,
  `crossfit` varchar(11) NOT NULL,
  `kickboxing` varchar(11) NOT NULL,
  `medical` varchar(500) NOT NULL,
  `instructor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_training`
--

INSERT INTO `user_training` (`id`, `fname`, `lname`, `age`, `wt`, `gender`, `muscle`, `toning`, `fitness`, `weights`, `running`, `cycling`, `groups`, `yoga`, `pilates`, `crossfit`, `kickboxing`, `medical`, `instructor_id`) VALUES
(43, 'Maria', 'Karagianni', 24, 56, 'female', 'off', 'off', 'on', 'off', 'on', 'off', 'on', 'on', 'on', 'off', 'off', '', 13),
(44, 'Petros', 'Apostolopoulos', 26, 76, 'male', 'on', 'on', 'off', 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off', '', 32),
(46, 'John', 'Papadopoulos', 34, 125, 'male', 'off', 'on', 'on', 'off', 'off', 'off', 'on', 'off', 'on', 'off', 'off', '', 33),
(49, 'Arnold', 'Schwazeneger', 60, 120, 'male', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'off', 'on', '', 34),
(50, 'Giannis', 'Koutsomitis', 25, 67, 'male', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', '', 13),
(51, 'Magda', 'Rapti', 23, 46, 'male', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'on', 'on', 'off', 'off', '', 32),
(54, 'Kostas', 'Papadopoulos', 26, 85, 'male', 'on', 'on', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'on', '', 32),
(55, 'Giannis', 'Taramas', 21, 76, 'male', 'on', 'on', 'on', 'on', 'off', 'off', 'off', 'off', 'off', 'off', 'off', '', 32),
(56, 'Fenia', 'Tsakiri', 24, 56, 'female', 'off', 'off', 'on', 'off', 'off', 'off', 'off', 'on', 'on', 'off', 'off', '', 32),
(57, 'Kostas', 'Morfonios', 52, 125, 'male', 'on', 'on', 'on', 'on', 'off', 'on', 'off', 'off', 'off', 'off', 'off', '', 32),
(61, 'presentation', 'Test', 23, 124, 'male', 'on', 'on', 'off', 'off', 'on', 'on', 'off', 'off', 'on', 'off', 'off', 'adfasdf', 32),
(63, 'mrkosmopoulospresentation', 'mrkosmopoulospresentation', 23, 132, 'male', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', 'off', '', 32),
(69, 'Tasos', 'Karanikas', 25, 125, 'male', 'off', 'on', 'off', 'off', 'off', 'on', 'on', 'on', 'on', 'off', 'on', 'knee', 32);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_training`
--
ALTER TABLE `user_training`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_training`
--
ALTER TABLE `user_training`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"coi\",\"table\":\"projects\"},{\"db\":\"coi\",\"table\":\"public_servants\"},{\"db\":\"coi\",\"table\":\"public_servant\"},{\"db\":\"coi\",\"table\":\"conflicts\"},{\"db\":\"mathel\",\"table\":\"images\"},{\"db\":\"mathel\",\"table\":\"comments\"},{\"db\":\"mathel\",\"table\":\"user_training\"},{\"db\":\"mathel\",\"table\":\"users\"},{\"db\":\"mathel\",\"table\":\"plan\"},{\"db\":\"mathel\",\"table\":\"trainers\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('mathel', 'images', 'image'),
('mathel', 'user_training', 'fname');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'mathel', 'users', '{\"sorted_col\":\"`users`.`id`  ASC\"}', '2020-05-28 19:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-11-02 20:19:43', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `virtuagym`
--
CREATE DATABASE IF NOT EXISTS `virtuagym` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `virtuagym`;

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `exercise_name`) VALUES
(1, 'Crunch'),
(2, 'Air squat'),
(3, 'Windmill'),
(4, 'Push-up'),
(5, 'Rowing Machine'),
(6, 'Walking'),
(7, 'Running');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_instances`
--

CREATE TABLE `exercise_instances` (
  `id` int(11) NOT NULL,
  `exercise_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL COMMENT 'optional, filled when this is part of a trainingplan (day)',
  `exercise_duration` int(11) NOT NULL DEFAULT 0 COMMENT 'duration in seconds',
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise_instances`
--

INSERT INTO `exercise_instances` (`id`, `exercise_id`, `day_id`, `exercise_duration`, `order`) VALUES
(4, 1, 2, 150, 1),
(5, 2, 2, 300, 2),
(6, 3, 2, 300, 3),
(7, 4, 2, 500, 4),
(8, 4, 4, 0, 0),
(9, 5, 17, 0, 0),
(13, 4, 1, 1, 0),
(14, 5, 1, 300, 0),
(15, 6, 1, 900, 0),
(16, 7, 1, 900, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(150) NOT NULL COMMENT 'contains plan name',
  `plan_description` text NOT NULL COMMENT 'contains plan description (optional)',
  `plan_difficulty` int(1) NOT NULL DEFAULT 1 COMMENT '1=beginner,2=intermediate,3=expert',
  `user_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='contains basic plan data';

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `plan_name`, `plan_description`, `plan_difficulty`, `user_id`) VALUES
(1, 'Gideon\'s plan for March 2019', 'work out plan description', 2, 3),
(16, 'New Workout Plan', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan_days`
--

CREATE TABLE `plan_days` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL COMMENT 'id from plan table',
  `day_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'name for this day, optional',
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plan_days`
--

INSERT INTO `plan_days` (`id`, `plan_id`, `day_name`, `order`) VALUES
(1, 1, 'Day 1 - Cardio', 1),
(2, 1, 'Day 2 - Other exercises', 2),
(4, 1, 'Day 3 - Chest', 2),
(17, 1, 'Day 4 - Wings', 4),
(39, 16, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise_instances`
--
ALTER TABLE `exercise_instances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_days`
--
ALTER TABLE `plan_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exercise_instances`
--
ALTER TABLE `exercise_instances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `plan_days`
--
ALTER TABLE `plan_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
