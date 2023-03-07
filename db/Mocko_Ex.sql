-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 03, 2023 at 09:56 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mocko`
--

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `b_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Revision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`b_id`, `ISBN`, `Title`, `Revision`) VALUES
(1, 111111, 'Time', 1),
(2, 222222, 'Thermo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `c_id` int(11) NOT NULL,
  `CourseRubric` varchar(4) NOT NULL,
  `CourseNumber` int(10) NOT NULL,
  `CourseName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`c_id`, `CourseRubric`, `CourseNumber`, `CourseName`) VALUES
(1, 'ME', 8930, 'Design Informatics'),
(2, 'ME', 8180, 'FEA'),
(3, 'ME', 8720, 'Optimization'),
(4, 'ME', 8000, 'Seminar');

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`id`, `FirstName`, `LastName`) VALUES
(1, 'Greg', 'Mocko'),
(2, 'Hannah', 'Mocko'),
(3, 'Barbara', 'Mocko'),
(4, 'Erin', 'Utermarck'),
(5, 'William', 'Brown'),
(6, 'Heather', 'Brown'),
(7, 'Jeremy', 'Mac'),
(8, 'Chris', 'Brown');

-- --------------------------------------------------------

--
-- Table structure for table `Person_Takes_Course`
--

CREATE TABLE `Person_Takes_Course` (
  `P_C_ID` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL COMMENT 'key to person',
  `C_ID` int(11) NOT NULL COMMENT 'key to course'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Person_Takes_Course`
--

INSERT INTO `Person_Takes_Course` (`P_C_ID`, `P_ID`, `C_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 4),
(5, 4, 1),
(6, 6, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Person_Takes_Course`
--
ALTER TABLE `Person_Takes_Course`
  ADD PRIMARY KEY (`P_C_ID`),
  ADD KEY `P_ID` (`P_ID`,`C_ID`),
  ADD KEY `Course` (`C_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Person`
--
ALTER TABLE `Person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Person_Takes_Course`
--
ALTER TABLE `Person_Takes_Course`
  MODIFY `P_C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Person_Takes_Course`
--
ALTER TABLE `Person_Takes_Course`
  ADD CONSTRAINT `Course` FOREIGN KEY (`C_ID`) REFERENCES `Course` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Person` FOREIGN KEY (`P_ID`) REFERENCES `Person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
