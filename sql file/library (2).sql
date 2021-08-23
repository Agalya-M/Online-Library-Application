-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 11:31 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `author` varchar(70) NOT NULL,
  `noofbooks` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `author`, `noofbooks`) VALUES
(8, 'Chetan Bhagat', 0),
(9, 'William Shakespeare', 0),
(10, 'Agatha Christie', 3),
(11, 'Rowling', 1),
(14, 'Daniel Kahneman', 2),
(15, 'David Robson', 2),
(19, 'Malala Yousafzai', 1),
(20, 'A P J ABDUL KALAM', 1),
(21, 'Meg Greene', 1),
(22, 'J. B. Kennedy', 1),
(23, 'Dave Evans', 1),
(24, 'Julian Shapiro', 1),
(25, 'Stephen Blumenthal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(70) DEFAULT NULL,
  `noofbooks` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryname`, `noofbooks`) VALUES
(18, 'Fiction', 4),
(19, 'Biography', 2),
(20, 'Space', 1),
(21, 'Technologies', 3),
(22, 'Personal Growth', 3),
(23, 'Engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `manage_book`
--

CREATE TABLE `manage_book` (
  `sno` int(11) NOT NULL,
  `bookname` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manage_book`
--

INSERT INTO `manage_book` (`sno`, `bookname`, `category`, `author`, `isbn`, `path`) VALUES
(16, 'I am Malala', 'Fiction', 'Malala Yousafzai', '978 0 297 87091 3', 'i-am-malala-pdf.pdf'),
(17, 'Wings of Fire', 'Biography', 'A P J ABDUL KALAM', '789 456 258 2', 'Wings of fire ( PDFDrive ).pdf'),
(18, 'MOTHER TERESA', 'Biography', 'Meg Greene', ' 0 313 32771 8', 'Mother Teresa - A Biography ( PDFDrive ).pdf'),
(19, 'Space, Time and Einstein', 'Space', 'J. B. Kennedy', ' 1 902683 66 8', 'Space, Time and Einstein ( PDFDrive ).pdf'),
(20, 'Social Media Marketing', 'Technology', 'Dave Evans', '978 0 470 63403 5', 'Social Media Marketing.pdf'),
(21, 'Web Animation using JavaScript', 'Technology', 'Julian Shapiro', ' 978 0 134 09666 7', 'Web Animation using JavaScript_ Develop & Design ( PDFDrive ).pdf'),
(22, 'JavaScript', 'Technology', 'Stephen Blumenthal', '759 45 258 3', 'JavaScript_ JavaScript For Beginners - Learn JavaScript Programming with ease in HALF THE TIME - ( PDFDrive ).pdf'),
(23, 'The Intelligence Trap', 'Personal Growth', 'David Robson', '895 456 48 5', 'The Intelligence Trap_ Why smart people do stupid things and how to make wiser decisions ( PDFDrive ).pdf'),
(24, 'Thinking ,Fast and Slow', 'Personal Growth', 'Daniel Kahneman', '9856 123 25 4', 'Thinking, Fast and Slow ( PDFDrive ).pdf'),
(25, 'Homes for the Third Age A Design Guide for Extra Care Sheltered Housing ', 'Engineering', 'David Robson', '9780203298169', 'Homes for the Third Age A Design Guide For Extra Care Sheltered Housing by David Robson (z-lib.org).pdf'),
(26, 'THE MURDER OF ROGER ACKROYD', 'Fiction', 'Agatha Christie', '456 4789 5 2', 'The Murder Of Roger Ackroyd by Agatha Christie (z-lib.org).pdf'),
(27, 'The Mysterious Affair at Styles', 'Fiction', 'Agatha Christie', '9780646418438', 'The Mysterious Affair at Styles by Agatha Christie (z-lib.org).pdf'),
(28, 'Death on the Nile', 'Fiction', 'Agatha Christie', '1579126898', 'Death on the Nile by Agatha Christie (z-lib.org).pdf'),
(29, 'HEURISTICS AND BIASES The Psychology of Intuitive Judgment', 'Personal Growth', 'Daniel Kahneman', '9780521796798', 'Heuristics and Biases The Psychology of Intuitive Judgment by Thomas Gilovich, Dale Griffin, Daniel Kahneman (z-lib.org).pdf');

-- --------------------------------------------------------

--
-- Table structure for table `student_login`
--

CREATE TABLE `student_login` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobilenumber` varchar(10) DEFAULT '0',
  `securityQuestion` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_login`
--

INSERT INTO `student_login` (`username`, `email`, `mobilenumber`, `securityQuestion`, `answer`, `password`) VALUES
('Devayani', '19cs027@kpriet.ac.in', '7896514235', 'what is the name of your first pet?', 'Dog', 'Devayani@2001'),
('Agalya', '19cs005@kpriet.ac.in', '7339148456', 'what elementary school did you attend?', 'Infant', 'Agalya@123'),
('Dhanusree', '19cs030@kpriet.ac.in', '9123548679', 'what is the name of the town where you were born?', 'Tiruppur', 'Dhanusree@123'),
('Harini', '19cs048@kpriet.ac.in', '7894561234', 'what is the name of your first pet?', 'Cat', 'Harini@2001'),
('Abitha', '19cs004@kpriet.ac.in', '7894561256', 'what is the name of the town where you were born?', 'Tiruppur', 'Abitha@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_book`
--
ALTER TABLE `manage_book`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `manage_book`
--
ALTER TABLE `manage_book`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
