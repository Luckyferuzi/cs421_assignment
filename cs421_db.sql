-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2025 at 03:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs421_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `program` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `program`) VALUES
(1, 'khalifa feruzi', 'Software Engineering'),
(2, 'fadhili mjala', 'Software Engineering'),
(3, 'kabipe', 'Software Engineering'),
(4, 'lutfia suleiman', 'Software Engineering'),
(5, 'daud ally', 'Software Engineering'),
(6, 'Peter Parker', 'Software Engineering'),
(7, 'Sarah juma', 'Software Engineering'),
(8, 'Tomas makululin', 'Software Engineering'),
(9, 'Emma Watson', 'Software Engineering'),
(10, 'James Bond', 'Software Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(150) NOT NULL,
  `academic_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `academic_year`) VALUES
(1, 'Principles of Programming Languages(CP 111)', 1),
(2, 'Development Perspectives(DS 102)', 1),
(3, 'Mathematical Foundations of Information Security-(IA 112)', 1),
(4, 'Introduction to Information Technology(IT 111)', 1),
(5, 'Communication Skills(LG 102)', 1),
(6, 'Discrete Mathematics for ICT(MT1111)', 1),
(7, 'Calculus(MT 1112)', 1),
(8, 'Linear Algebra for ICT(MT 1117)', 1),
(9, 'Introduction to Computer Networking(CN 121)', 1),
(10, 'Introduction to Database systems(CP 121)', 1),
(11, 'Introduction to High Level Programming(CP 123)', 1),
(12, 'Introduction to Software Engineering(CS 123)', 1),
(13, 'Introduction to IT Security(IA 124)', 1),
(14, 'Numerical Analysis for ICT(MT 1211)', 1),
(15, 'Introduction to Probability and Statistics(ST 1210)', 1),
(16, 'Computer Networking Protocols(CN 211)', 2),
(17, 'Introduction To Linux/Unix Systems(CP 211)', 2),
(18, 'Systems Analysis and Design(CP 212)', 2),
(19, 'Data Structures and Algorithms Analysis(CP 213)', 2),
(20, 'Computational Theory(CP 214)', 2),
(21, 'Object Oriented Programming in Java(CP 215)', 2),
(22, 'Industrial Practical Training I(CS 131)', 2),
(23, 'Computer Organization and Architecture I(CT 211)', 2),
(24, 'Internet Programming And Application I(CP 221)', 2),
(25, 'Open Source Technologies(CP 222)', 2),
(26, 'Object-Oriented Systems Design(CP 223)', 2),
(27, 'Database Management Systems(CP 224)', 2),
(28, 'Software Testing and Quality Assurance(CP 225)', 2),
(29, 'Operating Systems(CP 226)', 2),
(30, 'ICT Research Methods(IS 221)', 2),
(31, 'Internet Programming and Applications II(CP 311)', 3),
(32, 'Python Programming(CP 312)', 3),
(33, 'Mobile Applications Development(CP 313)', 3),
(34, 'Selected Topics in Software Engineering(CP 316)', 3),
(35, 'Computer Graphics(CP 318)', 3),
(36, 'Industrial Practical Training II(CS 231)', 3),
(37, 'ICT Entrepreneurship(EME 314)', 3),
(38, 'Mathematical Logic and Formal Semantics(MT 3111)', 3),
(39, 'Distributed Database Systems(CP 321)', 3),
(40, 'Data Mining and Warehousing(CP 322)', 3),
(41, 'Web Framework Development Using Javascript(CP 323)', 3),
(42, 'Compiler Technology(CP 324)', 3),
(43, 'Advanced Java Programming(CS 321)', 3),
(44, 'Information and Communication Systems Security(IA 321)', 3),
(45, 'ICT Project Management(BT 413)', 4),
(46, 'Distributed Computing(CP 314)', 4),
(47, 'C# Programming(CP 412)', 4),
(48, 'Industrial Practical Training III(CS 332)', 4),
(49, 'Software Reverse Engineering(CS 411)', 4),
(50, 'Software Engineering Project I(CS 431)', 4),
(51, 'Computer Maintenance(CT 312)', 4),
(52, 'Human Computer Interaction(IM 411)', 4),
(53, 'Professional Ethics and Conduct Core(SI 311)', 4),
(54, 'Software Deployment and Management(CS 421)', 4),
(55, 'Big Data Analysis(CS 329)', 4),
(56, 'Software Engineering Project II(CS 432)', 4),
(57, 'Artificial Intelligence(CP 422)', 4),
(58, 'System Administration and Management(CP 423)', 4),
(59, 'Cloud Computing(CP 424)', 4),
(60, 'Foundations of Data Science(CG 222)', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
