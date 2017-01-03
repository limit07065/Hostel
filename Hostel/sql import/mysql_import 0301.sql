-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2017 at 03:58 PM
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
(7, '201520162', 'aa', '414', 'M22', 'Singleroom', 4.5, '2016-12-30', 0, NULL),
(8, '201620171', 'aa', '166', 'MA1', 'Singleroom with bathroom', 6.5, '2016-12-30', 2, NULL),
(9, '201620171', 'aa', '166', 'MA1', 'Singleroom with bathroom', 6.5, '2017-01-03', 0, NULL);

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
(1, '166', 'MA1', 1, 2, 1, '0000-00-00'),
(2, '156', 'MA1', 1, 1, 1, '0000-00-00'),
(3, '414', 'M22', 1, 1, 1, '0000-00-00'),
(4, '412', 'M22', 1, 2, 0, '0000-00-00'),
(5, '345', 'M22', 1, 3, 0, '0000-00-00');

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
(1, 'default_room.jpg', 'Singleroom', 4.5, 'Single room without bathroom', '2016-12-30'),
(2, 'default_room.jpg', 'Singleroom with bathroom', 6.5, 'Single room with bathroom inside..', '2016-12-30'),
(3, 'default_room.jpg', 'Double', 4, 'Double room, so gay~', '2016-12-30'),
(4, 'default_room.jpg', 'President Suite', 18, 'For high class people only', '2017-01-03');

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
(1, '201620171', 1, '2016-12-30'),
(2, '201520162', 0, '2016-12-30'),
(3, '201520161', 0, '2017-01-03');

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
('aa', 'aa', 1, 1, 'Loh Wen He', '0127101234', '', 'ronloh94@hotmail.com', 'default.jpg', '2016-12-30'),
('admin', 'admin', 0, 1, 'Adminnnn', '01232314', '', 'admin@hostel.my', 'default.jpg', '2016-12-30'),
('ryan', 'ryanhoo', 1, 1, 'Ryan Hoo', '0197165079', 'A14CS0035', 'hbkeong95@gmail.com', 'default.jpg', '2017-01-03');

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
  MODIFY `Application_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `Room_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `RoomType_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `Session_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
