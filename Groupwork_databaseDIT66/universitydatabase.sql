-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2024 at 07:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `AssignmentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `AssignmentTitle` varchar(15) NOT NULL,
  `DueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`AssignmentID`, `CourseID`, `AssignmentTitle`, `DueDate`) VALUES
(401, 201, 'Homework 1', '2024-02-15'),
(402, 202, 'Homework 2', '2024-02-20'),
(403, 203, 'Homework 3', '2024-02-25'),
(404, 204, 'Homework 4', '0000-00-00'),
(405, 205, 'Homework 5', '0000-00-00'),
(406, 206, 'Homework 6', '0000-00-00'),
(407, 207, 'Homework 7', '0000-00-00'),
(408, 208, 'Homework 8', '0000-00-00'),
(409, 209, 'Homework 9', '0000-00-00'),
(410, 210, 'Homework 10', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `ScheduleID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `AttendanceDate` date DEFAULT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`AttendanceID`, `ScheduleID`, `StudentID`, `AttendanceDate`, `Status`) VALUES
(801, 701, 1001, '2024-03-01', 'Present'),
(802, 702, 1002, '2024-03-02', 'Absent'),
(803, 703, 1003, '2024-03-03', 'Present'),
(804, 704, 1004, '2024-03-04', 'Present'),
(805, 705, 1005, '2024-03-05', 'Absent'),
(806, 706, 1006, '2024-03-06', 'Present'),
(807, 707, 1007, '2024-03-07', 'Present'),
(808, 708, 1008, '2024-03-08', 'Absent'),
(809, 709, 1009, '2024-03-09', 'Present'),
(810, 710, 1010, '2024-03-10', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `ClassroomID` int(11) NOT NULL,
  `BuildingName` varchar(20) NOT NULL,
  `RoomNo` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`ClassroomID`, `BuildingName`, `RoomNo`, `Capacity`) VALUES
(601, 'Main Building', 101, 30),
(602, 'Science Block', 102, 25),
(603, 'Engineering Block', 103, 35),
(604, 'Library Building', 104, 20),
(605, 'Administration Block', 105, 30),
(606, 'Lecture Hall A', 106, 15),
(607, 'Lecture Hall B', 107, 35),
(608, 'Arts Building', 108, 20),
(609, 'Gymnasium', 109, 20),
(610, 'Student Center', 110, 25);

-- --------------------------------------------------------

--
-- Table structure for table `clubmemberships`
--

CREATE TABLE `clubmemberships` (
  `MembershipID` int(11) NOT NULL,
  `ClubID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `JoinDate` date DEFAULT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubmemberships`
--

INSERT INTO `clubmemberships` (`MembershipID`, `ClubID`, `StudentID`, `JoinDate`, `Role`) VALUES
(1201, 1101, 1001, '2023-08-01', 'President'),
(1202, 1102, 1002, '2023-09-01', 'Member'),
(1203, 1103, 1003, '2023-10-01', 'Treasurer'),
(1204, 1104, 1004, '2023-08-02', 'President'),
(1205, 1105, 1005, '2023-09-02', 'Member'),
(1206, 1106, 1006, '2023-10-02', 'Treasurer'),
(1207, 1107, 1007, '2023-08-03', 'President'),
(1208, 1108, 1008, '2023-09-03', 'Member'),
(1209, 1109, 1009, '2023-10-03', 'Treasurer'),
(1210, 1110, 1010, '2023-08-04', 'President');

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `ClubID` int(11) NOT NULL,
  `ClubName` varchar(20) NOT NULL,
  `AdvisorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`ClubID`, `ClubName`, `AdvisorID`) VALUES
(1101, 'Computer Club', 101),
(1102, 'Drama Club', 102),
(1103, 'Science Club', 103),
(1104, 'Debate Club', 104),
(1105, 'Music Club', 105),
(1106, 'Art and Design Club', 106),
(1107, 'Robotics Club', 107),
(1108, 'Photography Club', 108),
(1109, 'Environmental Club', 109),
(1110, 'Entrepreneurship Clu', 110);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `Cname` varchar(20) NOT NULL,
  `Credits` decimal(10,2) DEFAULT NULL,
  `ProfessorID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `Cname`, `Credits`, `ProfessorID`, `DepartmentID`) VALUES
(201, 'Database', 3.00, 101, 1),
(202, 'Calculus', 4.00, 102, 2),
(203, 'Physics 101', 3.00, 103, 3),
(204, 'World History', 2.00, 104, 4),
(205, 'Statics', 1.50, 105, 5),
(206, 'Design', 3.00, 106, 6),
(207, 'Graphic', 2.50, 107, 7),
(208, 'Structure', 4.00, 108, 8),
(209, 'Linear Algebra', 4.00, 109, 9),
(210, 'Strength', 2.00, 110, 10);

-- --------------------------------------------------------

--
-- Table structure for table `courseschedules`
--

CREATE TABLE `courseschedules` (
  `ScheduleID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `ClassroomID` int(11) NOT NULL,
  `DayOfWeek` varchar(20) NOT NULL,
  `StartTime` varchar(10) NOT NULL,
  `EndTime` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseschedules`
--

INSERT INTO `courseschedules` (`ScheduleID`, `CourseID`, `ClassroomID`, `DayOfWeek`, `StartTime`, `EndTime`) VALUES
(701, 201, 601, 'Monday', '9:00', '11:00'),
(702, 202, 602, 'Tuesday', '10:00', '12:00'),
(703, 203, 603, 'Wednesday', '11:00', '13:00'),
(704, 204, 604, 'Thursday', '8:00', '11:00'),
(705, 205, 605, 'Friday', '10:30', '12:30'),
(706, 206, 606, 'Saturday', '14:00', '18:00'),
(707, 207, 607, 'Monday', '10:00', '13.35'),
(708, 208, 608, 'Tuesday', '10:30', '12:00'),
(709, 209, 609, 'Wednesday', '11:00', '13:00'),
(710, 210, 610, 'Thursday', '9:30', '11:30');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `Dname` varchar(40) NOT NULL,
  `DeanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `Dname`, `DeanID`) VALUES
(1, 'Computer Science', 101),
(2, 'Mathematics', 102),
(3, 'Physics', 103),
(4, 'Graphic designer', 104),
(5, 'Business Administration', 105),
(6, 'Mechanical Engineering', 106),
(7, 'Biology', 107),
(8, 'English', 108),
(9, 'Chemistry', 109),
(10, 'Economics', 110);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `EnrollmentDate` date DEFAULT NULL,
  `Grade` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`, `Grade`) VALUES
(301, 1001, 201, '2024-01-10', 'A'),
(302, 1002, 202, '2024-01-11', 'B'),
(303, 1003, 203, '2024-01-12', 'C'),
(304, 1004, 204, '2024-01-13', 'B+'),
(305, 1005, 205, '2024-01-14', 'A'),
(306, 1006, 206, '2024-01-15', 'C+'),
(307, 1007, 207, '2024-01-16', 'D'),
(308, 1008, 208, '2024-01-17', 'F'),
(309, 1009, 209, '2024-01-18', 'B'),
(310, 1010, 210, '2024-01-19', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `ExamID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `ExamDate` date DEFAULT NULL,
  `Duration` varchar(10) NOT NULL,
  `ExamType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`ExamID`, `CourseID`, `ExamDate`, `Duration`, `ExamType`) VALUES
(901, 201, '2024-05-10', '2:00', 'Midterm'),
(902, 202, '2024-05-11', '2:30', 'Final'),
(903, 203, '2024-05-12', '1:45', 'Midterm'),
(904, 204, '2024-05-13', '2:00', 'Midterm'),
(905, 205, '2024-05-14', '2:30', 'Final'),
(906, 206, '2024-05-15', '1:45', 'Midterm'),
(907, 207, '2024-05-16', '2:00', 'Midterm'),
(908, 208, '2024-05-17', '2:30', 'Final'),
(909, 209, '2024-05-18', '1:45', 'Midterm'),
(910, 210, '2024-05-19', '2:00', 'Midterm');

-- --------------------------------------------------------

--
-- Table structure for table `librarybooks`
--

CREATE TABLE `librarybooks` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Author` varchar(30) NOT NULL,
  `ISBN` varchar(15) NOT NULL,
  `PublishedYear` int(11) NOT NULL,
  `AvailableCopies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `librarybooks`
--

INSERT INTO `librarybooks` (`BookID`, `Title`, `Author`, `ISBN`, `PublishedYear`, `AvailableCopies`) VALUES
(1301, 'Database Systems', 'Navathe', '978-0132145107', 2020, 5),
(1302, 'Advanced Mathematics', 'Stewart', '978-0470458365', 2019, 3),
(1303, 'Physics for Engineers', 'Serway', '978-1337553292', 2018, 4),
(1304, 'Introduction to Machine Learning', 'Tom Mitchell', '978-0132145107', 2017, 3),
(1305, 'Digital Marketing Strategies', 'Philip Kotler', '978-0470458365', 2016, 2),
(1306, 'Principles of Economics', 'N. Gregory Mankiw', '978-1337553292', 2015, 2),
(1307, 'Shakespearean Literature', 'Harold Bloom', '978-0132145107', 2014, 1),
(1308, 'Modern Art: A History', 'H. H. Arnason', '978-0470458365', 2013, 1),
(1309, 'Data Analytics with Python', 'Wes McKinney', '978-1337553292', 2012, 3),
(1310, 'Global Politics: An Overview', 'Andrew Heywood', '978-0132145107', 2011, 6);

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `ProfessorID` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `HireDate` date DEFAULT NULL,
  `DepartmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`ProfessorID`, `Fname`, `Lname`, `HireDate`, `DepartmentID`) VALUES
(101, 'John', 'Doe', '2010-08-15', 1),
(102, 'Jane', 'Smith', '2012-09-01', 2),
(103, 'Alice', 'Johnson', '2015-06-20', 3),
(104, 'Emma', 'Edward', '2010-08-16', 4),
(105, 'Deamn', 'Callor', '2012-09-02', 5),
(106, 'Jake', 'Chan', '2015-06-21', 6),
(107, 'Miller', 'Dean', '2010-08-17', 7),
(108, 'Ellie', 'Goulding', '2012-09-03', 8),
(109, 'Chale', 'Chaplin', '2015-06-22', 9),
(110, 'Bruno', 'Mar', '2010-08-18', 10);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `ResultID` int(11) NOT NULL,
  `ExamID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Score` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`ResultID`, `ExamID`, `StudentID`, `Score`) VALUES
(1001, 901, 1001, 85.50),
(1002, 902, 1002, 90.00),
(1003, 903, 1003, 88.00),
(1004, 904, 1004, 69.00),
(1005, 905, 1005, 72.00),
(1006, 906, 1006, 81.00),
(1007, 907, 1007, 74.00),
(1008, 908, 1008, 94.00),
(1009, 909, 1009, 99.50),
(1010, 910, 1010, 79.50);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int(11) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(10) NOT NULL,
  `DepartmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Fname`, `Lname`, `DateOfBirth`, `Gender`, `DepartmentID`) VALUES
(1001, 'Michael', 'Brown', '2000-05-20', 'Male', 1),
(1002, 'Sarah', 'Davis', '1999-12-15', 'Female', 2),
(1003, 'David', 'Wilson', '2001-03-10', 'Male', 1),
(1004, 'Panny', 'Blue', '2000-05-21', 'Female', 5),
(1005, 'Mortos', 'Red', '1999-12-16', 'Male', 3),
(1006, 'Kissy', 'Black', '2001-03-11', 'Female', 4),
(1007, 'Yorn', 'Green', '2000-05-22', 'Male', 8),
(1008, 'Jessi', 'White', '1999-12-17', 'Female', 6),
(1009, 'Sage', 'Yellow', '2001-03-12', 'Female', 9),
(1010, 'Rayna', 'Gray', '2000-05-23', 'Female', 7),
(1011, 'Gekko', 'Pink', '2000-05-21', 'Male', 10),
(1012, 'Deadrock', 'Violet', '1999-12-16', 'Female', 7),
(1013, 'Jett', 'Lack', '2001-03-11', 'Female', 5),
(1014, 'Peak', 'Side', '2000-05-22', 'Male', 10),
(1015, 'Krinak', 'Mouse', '1999-12-17', 'Female', 8),
(1016, 'Ball', 'Dumbo', '2001-03-12', 'Male', 9),
(1017, 'Nuna', 'Karma', '2000-05-23', 'Female', 4),
(1018, 'Sabrina', 'Simon', '1999-12-18', 'Female', 3),
(1019, 'Alex', 'Chalot', '2001-03-13', 'Male', 6),
(1020, 'Emma', 'Pan', '2000-05-24', 'Female', 2);

-- --------------------------------------------------------

--
-- Table structure for table `submissionids`
--

CREATE TABLE `submissionids` (
  `SubmissionID` int(11) NOT NULL,
  `AssignmentID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `SubmissionDate` date DEFAULT NULL,
  `Grade` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submissionids`
--

INSERT INTO `submissionids` (`SubmissionID`, `AssignmentID`, `StudentID`, `SubmissionDate`, `Grade`) VALUES
(501, 401, 1001, '2024-02-14', 'A'),
(502, 402, 1002, '2024-02-19', 'B+'),
(503, 403, 1013, '2024-02-24', 'B+'),
(504, 404, 1004, '2024-02-29', 'C'),
(505, 405, 1005, '0000-00-00', 'B'),
(506, 406, 1012, '0000-00-00', 'C'),
(507, 407, 1007, '0000-00-00', 'C+'),
(508, 408, 1008, '0000-00-00', 'A'),
(509, 409, 1018, '0000-00-00', 'A'),
(510, 410, 1010, '0000-00-00', 'D+');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`AssignmentID`),
  ADD KEY `g7` (`CourseID`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `g12` (`ScheduleID`),
  ADD KEY `g13` (`StudentID`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`ClassroomID`);

--
-- Indexes for table `clubmemberships`
--
ALTER TABLE `clubmemberships`
  ADD PRIMARY KEY (`MembershipID`),
  ADD KEY `17` (`ClubID`),
  ADD KEY `18` (`StudentID`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`ClubID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `g3` (`ProfessorID`),
  ADD KEY `g4` (`DepartmentID`);

--
-- Indexes for table `courseschedules`
--
ALTER TABLE `courseschedules`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `g10` (`CourseID`),
  ADD KEY `g11` (`ClassroomID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD KEY `g5` (`StudentID`),
  ADD KEY `g6` (`CourseID`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`ExamID`),
  ADD KEY `14` (`CourseID`);

--
-- Indexes for table `librarybooks`
--
ALTER TABLE `librarybooks`
  ADD PRIMARY KEY (`BookID`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`ProfessorID`),
  ADD KEY `g1` (`DepartmentID`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`ResultID`),
  ADD KEY `15` (`ExamID`),
  ADD KEY `16` (`StudentID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `g2` (`DepartmentID`);

--
-- Indexes for table `submissionids`
--
ALTER TABLE `submissionids`
  ADD PRIMARY KEY (`SubmissionID`),
  ADD KEY `g8` (`AssignmentID`),
  ADD KEY `g9` (`StudentID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `g7` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `g12` FOREIGN KEY (`ScheduleID`) REFERENCES `courseschedules` (`ScheduleID`),
  ADD CONSTRAINT `g13` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`);

--
-- Constraints for table `clubmemberships`
--
ALTER TABLE `clubmemberships`
  ADD CONSTRAINT `17` FOREIGN KEY (`ClubID`) REFERENCES `clubs` (`ClubID`),
  ADD CONSTRAINT `18` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `g3` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`),
  ADD CONSTRAINT `g4` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `courseschedules`
--
ALTER TABLE `courseschedules`
  ADD CONSTRAINT `g10` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  ADD CONSTRAINT `g11` FOREIGN KEY (`ClassroomID`) REFERENCES `classrooms` (`ClassroomID`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `g5` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`),
  ADD CONSTRAINT `g6` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `14` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `professors`
--
ALTER TABLE `professors`
  ADD CONSTRAINT `g1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `15` FOREIGN KEY (`ExamID`) REFERENCES `exams` (`ExamID`),
  ADD CONSTRAINT `16` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `g2` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `submissionids`
--
ALTER TABLE `submissionids`
  ADD CONSTRAINT `g8` FOREIGN KEY (`AssignmentID`) REFERENCES `assignments` (`AssignmentID`),
  ADD CONSTRAINT `g9` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
