-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2021 at 02:56 PM
-- Server version: 8.0.22
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esbdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumers`
--

CREATE TABLE `consumers` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `consumers`
--

INSERT INTO `consumers` (`id`, `name`) VALUES
(1, 'con_1'),
(2, 'con_2'),
(3, 'con_3'),
(4, 'con_4'),
(5, 'con_wajid'),
(6, 'con_arad'),
(7, 'con_rony');

-- --------------------------------------------------------

--
-- Table structure for table `delivered`
--

CREATE TABLE `delivered` (
  `id` int NOT NULL,
  `message_id` int NOT NULL,
  `consumer_id` int NOT NULL,
  `topic_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `topic_id` int NOT NULL,
  `publisher_id` int NOT NULL,
  `message` varchar(100) NOT NULL,
  `topic_count` int NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `topic_id`, `publisher_id`, `message`, `topic_count`, `date_time`) VALUES
(80, 1, 3, 'Messi is the best player in the world', 1, '2021-12-06 01:53:37'),
(81, 1, 3, 'Messi is the new player in the world', 2, '2021-12-06 02:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(8) NOT NULL DEFAULT '00000000',
  `pass` varchar(4) NOT NULL DEFAULT '0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `phone`, `pass`) VALUES
(1, 'rony', '71800374', '2843'),
(2, 'abul', '71800374', '6666'),
(3, 'kasem', '71800374', '7855'),
(4, 'mohammed', '71800374', '0000'),
(18, 'wajid', '71800374', '0000'),
(20, 'Greg', '71800374', '0000'),
(22, 'arad', '71800374', '3578'),
(26, 'omar', '71800374', '0000'),
(27, 'ripa', '71800374', '0000'),
(31, 'arad', '71800374', '0000'),
(39, 'kamal', '55555', '0000'),
(40, 'Delete_Event', '7188888', '0000'),
(41, 'jjjjj', '71800374', '4740'),
(42, 'ggggg', '71800374', '0000'),
(43, 'ttttt', '71800374', '0000'),
(46, 'yyyyy', '71800374', '0000'),
(47, 'Abdulmuaz', '40956619', '0000');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `top_last` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `top_last`) VALUES
(1, 'football', 8),
(2, 'cricket', 4),
(4, 'basketball', 1),
(5, 'food', 9),
(10, 'tennis', 2),
(11, 'sports', 1),
(12, 'handball', 3),
(13, 'news', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumers`
--
ALTER TABLE `consumers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivered`
--
ALTER TABLE `delivered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id_idx` (`message_id`),
  ADD KEY `consumer_id_idx` (`consumer_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id_idx` (`topic_id`),
  ADD KEY `publisher_id_idx` (`publisher_id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumers`
--
ALTER TABLE `consumers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivered`
--
ALTER TABLE `delivered`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivered`
--
ALTER TABLE `delivered`
  ADD CONSTRAINT `consumer_id` FOREIGN KEY (`consumer_id`) REFERENCES `consumers` (`id`),
  ADD CONSTRAINT `message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_7_Day_Old_Messages` ON SCHEDULE EVERY 1 DAY STARTS '2021-11-12 00:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
   DELETE
FROM messages m
   WHERE datediff(now(),m.date_time)>6;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
