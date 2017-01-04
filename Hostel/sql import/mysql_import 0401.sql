-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2017 at 04:38 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hostel`
--
CREATE DATABASE IF NOT EXISTS `db_hostel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_hostel`;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `Application_PK` int(11) NOT NULL,
  `Session` varchar(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Number` varchar(10) DEFAULT NULL,
  `Block` varchar(10) NOT NULL,
  `RoomType` varchar(50) NOT NULL,
  `Price` double NOT NULL,
  `ApplyDate` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending | 1-approved | 2-cancelled | 3-rejected',
  `ApprovedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`Application_PK`, `Session`, `Username`, `Number`, `Block`, `RoomType`, `Price`, `ApplyDate`, `Status`, `ApprovedDate`) VALUES
(11, '201620171', 'wenhe', '211', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-04', 2, NULL),
(12, '2016/2017', 'ryan', '355', 'MA1', 'Double', 4, '2017-01-04', 1, '2017-01-04'),
(13, '2015/2016', 'wenhe', '211', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-04', 1, '2017-01-04'),
(14, '2016/2017', 'juliet', '108', 'MA4', 'Singleroom', 4.5, '2017-01-04', 0, NULL),
(15, '2016/2017', 'wenhe', '211', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-04', 2, NULL),
(16, '2016/2017', 'wenhe', '211', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-04', 0, NULL),
(17, '2016/2017', 'ben', '212', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-04', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_PK` int(11) NOT NULL,
  `Number` varchar(10) NOT NULL,
  `Block` varchar(10) NOT NULL,
  `Gender` int(11) NOT NULL,
  `RoomType_FK` int(11) NOT NULL,
  `Occupied` int(11) NOT NULL DEFAULT '0' COMMENT '0-unoccupied | 1-occupied',
  `CreatedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_PK`, `Number`, `Block`, `Gender`, `RoomType_FK`, `Occupied`, `CreatedDate`) VALUES
(18, '121', 'MA1', 1, 1, 0, '2017-01-04'),
(19, '122', 'MA1', 1, 1, 0, '2017-01-04'),
(20, '123', 'MA1', 1, 1, 0, '2017-01-04'),
(21, '211', 'MA1', 1, 2, 1, '2017-01-04'),
(22, '212', 'MA1', 1, 2, 1, '2017-01-04'),
(23, '213', 'MA1', 1, 2, 0, '2017-01-04'),
(24, '355', 'MA1', 1, 3, 1, '2017-01-04'),
(25, '356', 'MA1', 1, 3, 0, '2017-01-04'),
(26, '357', 'MA1', 1, 3, 0, '2017-01-04'),
(28, 'G01', 'M17', 1, 1, 0, '2017-01-04'),
(29, 'G02', 'M17', 1, 1, 0, '2017-01-04'),
(30, 'G03', 'M17', 1, 1, 0, '2017-01-04'),
(31, '111', 'M17', 1, 2, 0, '2017-01-04'),
(32, '112', 'M17', 1, 2, 0, '2017-01-04'),
(33, '113', 'M17', 1, 2, 0, '2017-01-04'),
(34, '220', 'M17', 1, 3, 0, '2017-01-04'),
(35, '221', 'M17', 1, 3, 0, '2017-01-04'),
(36, '222', 'M17', 1, 3, 0, '2017-01-04'),
(37, 'G05', 'M25', 0, 1, 0, '2017-01-04'),
(38, 'G06', 'M25', 0, 1, 0, '2017-01-04'),
(39, 'G07', 'M25', 0, 1, 0, '2017-01-04'),
(40, '101', 'M25', 0, 2, 0, '2017-01-04'),
(41, '102', 'M25', 0, 2, 0, '2017-01-04'),
(42, '103', 'M25', 0, 2, 0, '2017-01-04'),
(43, '221', 'M25', 0, 3, 0, '2017-01-04'),
(44, '222', 'M25', 0, 3, 0, '2017-01-04'),
(45, '223', 'M25', 0, 3, 0, '2017-01-04'),
(46, '108', 'MA4', 0, 1, 1, '2017-01-04'),
(47, '109', 'MA4', 0, 1, 0, '2017-01-04'),
(48, '110', 'MA4', 0, 1, 0, '2017-01-04'),
(49, '231', 'MA4', 0, 2, 0, '2017-01-04'),
(50, '232', 'MA4', 0, 2, 0, '2017-01-04'),
(51, '233', 'MA4', 0, 2, 0, '2017-01-04'),
(52, '341', 'M25', 0, 3, 0, '2017-01-04'),
(53, '342', 'MA4', 0, 3, 0, '2017-01-04'),
(54, '343', 'MA4', 0, 3, 0, '2017-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `RoomType_PK` int(11) NOT NULL,
  `Pic` varchar(25) NOT NULL DEFAULT 'default_room.jpg',
  `Type` varchar(50) NOT NULL,
  `Price` double NOT NULL,
  `Description` varchar(50) NOT NULL,
  `CreatedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`RoomType_PK`, `Pic`, `Type`, `Price`, `Description`, `CreatedDate`) VALUES
(1, 'sr 3.jpg', 'Singleroom', 4.5, 'Single room without bathroom', '2016-12-30'),
(2, 'sr bathroom 2.jpg', 'Singleroom with bathroom', 6.5, 'Single room with bathroom inside..', '2016-12-30'),
(3, 'double room3.jpg', 'Double', 4, 'Double room without bathroom', '2016-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `Session_PK` int(11) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active| 1-inactive',
  `CreatedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`Session_PK`, `Name`, `Status`, `CreatedDate`) VALUES
(5, '2015/2016', 0, '2017-01-04'),
(6, '2016/2017', 1, '2017-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Level` int(11) NOT NULL COMMENT '0-admin | 1-user',
  `Gender` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact` varchar(12) NOT NULL,
  `Id` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Pic` varchar(25) NOT NULL DEFAULT 'default.jpg',
  `CreatedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Password`, `Level`, `Gender`, `Name`, `Contact`, `Id`, `Email`, `Pic`, `CreatedDate`) VALUES
('admin', 'admin', 0, 1, 'Admin', '01232314', '', 'admin@hostel.my', 'admin1.jpg', '2016-12-30'),
('ben', 'ben', 1, 1, 'BEN', '0123345891', 'A14CS0030', 'ben@gmail.com', 'user1.jpg', '2017-01-04'),
('juliet', 'juliet', 1, 0, 'JULIET', '0174461290', 'A14KA0125', 'juliet@hotmail.com', 'user5.jpg', '2017-01-04'),
('rose', 'rose', 1, 0, 'ROSLINDA', '0181178956', 'A14KA0123', 'rose@gmail.com', 'user4.jpg', '2017-01-04'),
('ryan', 'ryan', 1, 1, 'Ryan Hoo', '0197165079', 'A14CS0035', 'hbkeong95@gmail.com', 'ryan.jpg', '2017-01-03'),
('wenhe', 'wenhe', 1, 1, 'LOH WEN HE', '0177761234', 'A14CS0047', 'wenhe@gmail.com', 'wenhe.jpg', '2017-01-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`Application_PK`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_PK`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`RoomType_PK`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Session_PK`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `Application_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `Room_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `RoomType_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `Session_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
