-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 02:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message_text`) VALUES
(19, 0, 'ahaha'),
(20, 0, 'real'),
(21, 1, 'asd'),
(22, 1, 'ds'),
(23, 1, 'asdas'),
(24, 1, 'asdas'),
(25, 1, 'asdas'),
(26, 1, 'asda'),
(27, 1, 'asd'),
(28, 1, 'asdas'),
(29, 1, 'asdas'),
(30, 1, 'asdsad'),
(31, 1, 'asd'),
(32, 1, 'asdas'),
(33, 1, 'asd'),
(34, 1, 'asdas'),
(35, 1, 'asdas'),
(36, 1, 'asdas'),
(37, 1, 'asdsa'),
(38, 1, 'asda'),
(39, 1, 'das'),
(40, 1, 'asdas'),
(41, 1, 'asdas'),
(42, 1, 'asdas'),
(43, 1, 'asdas'),
(44, 1, 'ahah'),
(45, 1, 'ahaha'),
(46, 1, 'asdas'),
(47, 1, 'asdas'),
(48, 1, 'asdas'),
(49, 1, 'asdas'),
(50, 1, 'asd'),
(51, 1, 'das'),
(52, 1, 'asdas'),
(53, 1, ''),
(54, 1, 'asdas'),
(55, 1, 'asdas'),
(56, 1, 'asdasd'),
(57, 1, 'yo'),
(58, 1, 'sup'),
(59, 1, 'what happend'),
(60, 1, 'nothing'),
(61, 1, ''),
(62, 1, 'asdas'),
(63, 1, 'asdas'),
(64, 1, 'asdas'),
(65, 1, 'asdas'),
(66, 1, 'asd'),
(67, 1, 'asdas'),
(68, 1, 'asdsa'),
(69, 1, 'asdas'),
(70, 1, 'dsa'),
(71, 1, 'sasdsa'),
(72, 1, 'asdas'),
(73, 1, 'asdsad'),
(74, 1, 'adas'),
(75, 1, 'asdasd'),
(76, 1, 'yess'),
(77, 1, 'sadas'),
(78, 1, 'asdas'),
(79, 1, 'asdas'),
(80, 1, 'asdwqe'),
(81, 1, 'hey'),
(82, 1, 'yo'),
(83, 1, 'what up'),
(84, 1, 'wasdsa'),
(85, 1, 'asdas'),
(86, 1, 'asdas'),
(87, 1, 'asdas'),
(88, 0, 'asda'),
(89, 0, 'asd'),
(90, 0, 'asda'),
(91, 0, 'asdas'),
(92, 0, 'asda'),
(93, 0, 'asd'),
(94, 0, 'asd'),
(95, 0, 'asd'),
(96, 0, 'asdas'),
(97, 0, 'asda'),
(98, 0, 'asdas'),
(99, 0, 'asd'),
(100, 0, 'asd'),
(101, 0, 'hiii'),
(102, 0, 'asd'),
(103, 0, 'wqewqe'),
(104, 2, 'asdas'),
(105, 2, 'asda'),
(106, 2, 'asdas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `password`, `fullname`, `birthday`, `gender`) VALUES
(0, 'asdasd', 'asdasdasd@email.com', 'asdasdasd', 'asdasd asdasd', '2024-02-06', 'male'),
(2, 'doe', 'john@doe.com', 'asdasd', 'John', '2024-01-11', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
