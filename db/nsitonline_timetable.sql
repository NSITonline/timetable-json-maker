-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 24, 2015 at 12:04 AM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nsitonline_timetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `branch_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `branch_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `code`, `branch_name`) VALUES
(1, 'COE', 'Computer Engineering'),
(2, 'IT', 'Information Technology'),
(3, 'ECE', 'Electronics and Communication Engineering'),
(4, 'ICE', 'Instrumentation and Control Engineering'),
(5, 'MPAE', 'Manufacturing Processes and Automation Engineering'),
(6, 'BT', 'Bio Technology'),
(7, 'ME', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `main`
--

CREATE TABLE IF NOT EXISTS `main` (
  `id` int(11) NOT NULL,
  `branch` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `last_updated_tx` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main`
--

INSERT INTO `main` (`id`, `branch`, `sem`, `section`, `last_updated_tx`) VALUES
(1, 1, 1, 1, '2015-12-23 17:32:55'),
(2, 1, 1, 2, NULL),
(3, 1, 1, 3, NULL),
(4, 1, 2, 1, NULL),
(5, 1, 2, 2, NULL),
(6, 1, 2, 3, NULL),
(7, 1, 3, 1, NULL),
(8, 1, 3, 2, NULL),
(9, 1, 3, 3, NULL),
(10, 1, 4, 1, NULL),
(11, 1, 4, 2, NULL),
(12, 1, 4, 3, NULL),
(13, 1, 5, 1, NULL),
(14, 1, 5, 2, NULL),
(15, 1, 5, 3, NULL),
(16, 1, 6, 1, NULL),
(17, 1, 6, 2, NULL),
(18, 1, 6, 3, NULL),
(19, 1, 7, 1, NULL),
(20, 1, 7, 2, NULL),
(21, 1, 7, 3, NULL),
(22, 1, 8, 1, NULL),
(23, 1, 8, 2, NULL),
(24, 1, 8, 3, NULL),
(25, 2, 1, 1, NULL),
(26, 2, 1, 2, NULL),
(27, 2, 2, 1, NULL),
(28, 2, 2, 2, NULL),
(29, 2, 3, 1, NULL),
(30, 2, 3, 2, NULL),
(31, 2, 4, 1, NULL),
(32, 2, 4, 2, NULL),
(33, 2, 5, 1, NULL),
(34, 2, 5, 2, NULL),
(35, 2, 6, 1, NULL),
(36, 2, 6, 2, NULL),
(37, 2, 7, 1, NULL),
(38, 2, 7, 2, NULL),
(39, 2, 8, 1, NULL),
(40, 2, 8, 2, NULL),
(41, 3, 1, 1, NULL),
(42, 3, 1, 2, NULL),
(43, 3, 1, 3, NULL),
(44, 3, 2, 1, NULL),
(45, 3, 2, 2, NULL),
(46, 3, 2, 3, NULL),
(47, 3, 3, 1, NULL),
(48, 3, 3, 2, NULL),
(49, 3, 3, 3, NULL),
(50, 3, 4, 1, NULL),
(51, 3, 4, 2, NULL),
(52, 3, 4, 3, NULL),
(53, 3, 5, 1, NULL),
(54, 3, 5, 2, NULL),
(55, 3, 5, 3, NULL),
(56, 3, 6, 1, NULL),
(57, 3, 6, 2, NULL),
(58, 3, 6, 3, NULL),
(59, 3, 7, 1, NULL),
(60, 3, 7, 2, NULL),
(61, 3, 7, 3, NULL),
(62, 3, 8, 1, NULL),
(63, 3, 8, 2, NULL),
(64, 3, 8, 3, NULL),
(65, 4, 1, 1, NULL),
(66, 4, 1, 2, NULL),
(67, 4, 1, 3, NULL),
(68, 4, 2, 1, NULL),
(69, 4, 2, 2, NULL),
(70, 4, 2, 3, NULL),
(71, 4, 3, 1, NULL),
(72, 4, 3, 2, NULL),
(73, 4, 3, 3, NULL),
(74, 4, 4, 1, NULL),
(75, 4, 4, 2, NULL),
(76, 4, 4, 3, NULL),
(77, 4, 5, 1, NULL),
(78, 4, 5, 2, NULL),
(79, 4, 5, 3, NULL),
(80, 4, 6, 1, NULL),
(81, 4, 6, 2, NULL),
(82, 4, 6, 3, NULL),
(83, 4, 7, 1, NULL),
(84, 4, 7, 2, NULL),
(85, 4, 7, 3, NULL),
(86, 4, 8, 1, NULL),
(87, 4, 8, 2, NULL),
(88, 4, 8, 3, NULL),
(89, 5, 1, 1, NULL),
(90, 5, 1, 2, NULL),
(91, 5, 2, 1, NULL),
(92, 5, 2, 2, NULL),
(93, 5, 3, 1, NULL),
(94, 5, 3, 2, NULL),
(95, 5, 4, 1, NULL),
(96, 5, 4, 2, NULL),
(97, 5, 5, 1, NULL),
(98, 5, 5, 2, NULL),
(99, 5, 6, 1, NULL),
(100, 5, 6, 2, NULL),
(101, 5, 7, 1, NULL),
(102, 5, 7, 2, NULL),
(103, 5, 8, 1, NULL),
(104, 5, 8, 2, NULL),
(105, 6, 2, 1, NULL),
(106, 6, 3, 1, NULL),
(107, 6, 4, 1, NULL),
(108, 6, 5, 1, NULL),
(109, 6, 6, 1, NULL),
(110, 6, 7, 1, NULL),
(111, 6, 8, 1, NULL),
(112, 7, 1, 1, NULL),
(113, 7, 1, 2, NULL),
(114, 7, 2, 1, NULL),
(115, 7, 2, 2, NULL),
(116, 7, 3, 1, NULL),
(117, 7, 3, 2, NULL),
(118, 7, 4, 1, NULL),
(119, 7, 4, 2, NULL),
(120, 7, 5, 1, NULL),
(121, 7, 5, 2, NULL),
(122, 7, 6, 1, NULL),
(123, 7, 6, 2, NULL),
(124, 7, 7, 1, NULL),
(125, 7, 7, 2, NULL),
(126, 7, 8, 1, NULL),
(127, 7, 8, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profs`
--

CREATE TABLE IF NOT EXISTS `profs` (
  `prof_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1385 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profs`
--

INSERT INTO `profs` (`prof_id`, `code`, `name`) VALUES
(1, 'GF', 'Guest Faculty'),
(2, 'NM', 'Neha Malik'),
(3, 'AT', 'Abhishek Tevatia'),
(4, 'US', 'Umang Soni'),
(5, 'NJ', 'Nikhil Jindal'),
(6, 'NRK', 'Narender Kumar'),
(7, 'HM', 'Himanshu'),
(8, 'OPT', 'OP Thakur'),
(9, 'SS', 'Soumya Samal'),
(10, 'SK', 'Sanjeev Kumar'),
(11, 'DRG', 'DR Gupta'),
(12, 'UG', 'Usha Gautam'),
(13, 'APS', 'Apoorvi Sood'),
(14, 'RTS', 'Ritu Sibal'),
(15, 'AD', 'Akhilesh Dubey'),
(16, 'YK', 'Yatender Kumar'),
(18, 'KS', 'Khushil Saini'),
(19, 'AKD', 'AK Dubey'),
(20, 'UB', 'Urvashi Bansal'),
(24, 'SB', 'Sonika Bhatnagar'),
(26, 'RTB', 'Rohit Beniwal'),
(31, 'AK', 'Ajay Kataria'),
(32, 'SOS', 'Soumya Sasmal'),
(38, 'VM', 'Vishal Meena'),
(40, 'MT', 'Meenakshi Tiwary'),
(41, 'HK', 'Hemant Khanna'),
(51, 'JJ', 'J Jena'),
(52, 'MN', 'Manish'),
(53, 'BS', 'Bahsha Sharma'),
(54, 'MK', 'Manish Kumar'),
(55, 'NMG', 'Narmata Gangul'),
(56, 'RK', 'Ritesh Kr'),
(59, 'DN', 'Dayanand'),
(60, 'PT', 'Prateek Tyagi'),
(62, 'AVM', 'AV Muley'),
(63, 'TC', 'T Choudhary'),
(65, 'SC', 'S Chopra'),
(66, 'RMD', 'R Mehendiratta'),
(67, 'SKS', 'Satish K Sharma'),
(68, 'ANN', 'Andriya narasemhulu'),
(74, 'ARM', 'Arvind R Meena'),
(85, 'SD', 'Shilpa Dua'),
(86, 'NVS', 'Navneet Sharma'),
(87, 'VKS', 'Vicky Suri'),
(88, 'BG', 'Bhawna Gupta'),
(89, 'HSM', 'Hashmit Malik'),
(90, 'BA', 'Bhawna Agarwal'),
(91, 'JS', 'Jyotsna Singh'),
(92, 'RJNS', 'Rajneesh Sharma'),
(93, 'JRPG', 'JRP Gupta'),
(94, 'VNK', 'Vineet Kumar'),
(95, 'JSB', 'JS Barar'),
(96, 'BKS', 'BK Singh'),
(98, 'PS', 'Pragya Shilpi'),
(101, 'NTS', 'Nitisha Shrivastva'),
(103, 'KWS', 'Kanwar Singh'),
(104, 'SM', 'Shailesh Mishra'),
(106, 'MS', 'Meenakshi Singh'),
(107, 'NKP', 'Nikhil Kr Pachuri'),
(108, 'PSH', 'Piyush Saxena'),
(109, 'VYA', 'Vijayant Agarwal'),
(110, 'RSK', 'RS Khand___'),
(111, 'SNH', 'Sneha'),
(112, 'HP', 'Harish Parthasarthy'),
(113, 'ABK', 'Abhishek Kumar'),
(114, 'LC', 'Lakshika'),
(116, 'VJM', 'Vijay Mohan'),
(118, 'SHK', 'Shweta Kumari'),
(119, 'RJK', 'Rajesh Kumar'),
(120, 'HMC', 'Himanshu Chabra'),
(121, 'PNC', 'Pinaki Charaborty'),
(132, 'ADG', 'Anand Gupta'),
(133, 'SNR', 'Sunny Rai'),
(134, 'PNS', 'Parneeta Sidhu'),
(135, 'SHG', 'Shweta Gautam'),
(136, 'PNK', 'P.N Khaturia'),
(138, 'SG', 'Shweta Gautam'),
(139, 'OPS', 'OP Sharma'),
(141, 'STC', 'Satish Chand'),
(143, 'GTS', 'Geetika Sarna'),
(146, 'MNK', 'Maneesha Khanna'),
(147, 'PD', 'Pankaj Deshwal'),
(148, 'DAK', 'Dhuru Arun Kr'),
(149, 'KSS', 'Khushil Saini'),
(150, 'VEN', 'Veenu'),
(152, 'AA', 'Apoorva Agarwal'),
(154, 'RUS', 'Ritu Sibal'),
(155, 'GRS', 'Gaurav Saxena'),
(157, 'RYW', 'Rythem Walia'),
(161, 'MA', 'Meenakshi Agarwal'),
(164, 'STY', 'Savita Yadav'),
(165, 'SPC', 'Shampa Chakraverty'),
(175, 'PTK', 'Preeti Kaur'),
(177, 'SHS', 'Shrishti'),
(179, 'DPS', 'Deepak Sharma'),
(180, 'SGS', 'Sangeeta Sabharwal'),
(182, 'MPSB', 'MPS Bhatia'),
(183, 'HDT', 'Hardeo Kumar Thakur'),
(184, 'MLS', 'Mala Saraswat'),
(185, 'DYC', 'Divya Chaudhary'),
(186, 'YVS', 'Yashveer Kr. Singh'),
(188, 'SWA', 'Swati Agarwal'),
(194, 'MNC', 'Manju'),
(196, 'SBA', 'Saurabh Agarwal'),
(213, 'NK', 'Dr. Neeraj Kumar'),
(215, 'ST', 'Sanjeev Thakur'),
(216, 'PJ', 'Purnima Jain'),
(217, 'AS', 'Dr. Anjana Sarkar'),
(220, 'DG', 'Dulal Goldar'),
(228, 'HMP', 'Himanshu Payal'),
(232, 'RKS', 'RK Saluja'),
(233, 'SKC', 'Sanjay Chak'),
(235, 'DK', 'DK Singh'),
(237, 'AKB', 'Ajaya Kumar Bagi'),
(241, 'ANS', 'Dr. Anjani Singh'),
(243, 'RY', 'Dr. Ruchika Yogesh'),
(247, 'ANR', 'Andriya Narasimhulu'),
(248, 'YS', 'Yodgeshwar Sharma'),
(260, 'MG', 'Maneesha Gupta'),
(261, 'PG', 'Parul Garg'),
(262, 'BK', 'Bhuvnesh Kumar'),
(264, 'JKM', 'JK Mishra'),
(266, 'MM', 'Mamta Mishra'),
(268, 'ANJ', 'AN Jha'),
(269, 'SANG', 'Sanjay Gupta'),
(270, 'MSD', 'MS Dharmi'),
(272, 'DVG', 'DV Gadre'),
(273, 'SJS', 'Sujata Sengar'),
(275, 'MHJ', 'Mohit jain'),
(276, 'GM', 'Garima Manocha'),
(278, 'JKS', 'JK Singh'),
(280, 'LN', 'Laxmi Narayana'),
(286, 'MAS', 'Manisha Singh'),
(288, 'SKR', 'Suresh Kumar Raj'),
(293, 'DYG', 'Divya Gopal'),
(294, 'JTY', 'Jyoti Yadav'),
(301, 'VS', 'Vidya Vandana Srimali'),
(303, 'PRR', 'Prabhat Ranjan'),
(305, 'SMS', 'Smriti Srivastava'),
(306, 'VIJ', 'Vijander'),
(316, 'DU', 'D Upadhyay'),
(317, 'SKJ', 'SK Jha'),
(319, 'RS', 'Raj senani'),
(322, 'SUN', 'Sushma Nagpal'),
(328, 'MDS', 'MD Singh'),
(329, 'VNS', 'Vinay Sharma'),
(331, 'AKY', 'Anil Kumar yadav'),
(332, 'RV', 'Rakesh Verma'),
(336, 'NSG', 'Nishi Gupta'),
(338, 'TRR', 'Tarun Rawat'),
(339, 'MKP', 'MK Pandey'),
(342, 'SH', 'Sushma Hans'),
(345, 'PRA', 'Parul Arora'),
(348, 'PNM', 'Parul Narula'),
(350, 'PR', 'Poonam Rani'),
(364, 'TKR', 'Tarun Rawat'),
(365, 'SPS', 'SP Singh'),
(370, 'AG', 'Akash Gupta'),
(375, 'RCB', 'Rochak Bajpai'),
(377, 'AB', 'Ankur Bansal'),
(379, 'DPK', 'Deepika Khukreja'),
(389, 'VG', 'Vijay Gupta'),
(393, 'SC+MT', 'Sulekha Chandra+Monika Tyagi'),
(398, 'RM', 'Rajeev Mahajan'),
(399, 'AMK+YS', 'AM Khan + Yogeshwar Sharma'),
(400, 'PRK', 'Pradeep Khanna'),
(403, 'NS', 'Nandini Sharma'),
(405, 'RM+NRK', 'Rajeev Mahajan+Narendra Kumar'),
(422, 'PRG', 'Prerna Gaur'),
(425, 'DKS+VYA', 'DK Singh+Vijyant Aggarwal'),
(434, 'KG', 'Kumar Gautam'),
(450, 'RCT', 'RC Thakur'),
(452, 'GCH', 'Gopal Chaudhary'),
(456, 'KPSR', 'KPS Rana'),
(461, 'MJ', 'Manan Jani'),
(462, 'SNL', 'Sonal'),
(463, 'SJN', 'Sree Jeet Nair'),
(464, 'VKP', 'Vishal Kumar Pandey'),
(475, 'PANJ', 'Prof. An Jha'),
(481, 'SVG', 'Sivangi Aggarwal'),
(506, 'DS', 'Deeksha Sharma'),
(519, 'AMM', 'Amarjeet Malhotra'),
(521, 'KMP', 'K M Paul'),
(524, 'ANY', 'Anuradha Yadav'),
(529, 'GRI', 'Gaurav Indra'),
(531, 'RBA', 'Richa Barsainya'),
(534, 'GAG', 'Gargi'),
(547, 'ANB', 'Ankita Bansal'),
(550, 'JYT', 'Jyoti'),
(551, 'STS', 'Satish Singh'),
(552, 'ROG', 'Rolly Gupta'),
(553, 'TS', 'Tanu Shree'),
(556, 'ARK', 'Arun Kumar'),
(560, 'VKM', 'Vikas Kumar Maheshkar'),
(570, 'SKD', 'S K Dhurandher'),
(571, 'DVK', 'Devender Kumar'),
(573, 'BPK', 'Bhupender Kumar'),
(585, 'SLT', 'Sulabh tygi'),
(593, 'NKJ', 'Nikhil Jindal,SSA'),
(597, 'BPB', 'B P Bandyopadyay'),
(599, 'DL', 'Dulal Goldar'),
(602, 'RJ', 'Ranjana Jha'),
(604, 'DKS', 'DK Singh'),
(607, 'SMT', 'Sheena Mittal'),
(619, 'VEV', 'Vemulu Vijaya Vani'),
(633, 'NKS', 'Nikhil SInghal'),
(636, 'PKB', 'PK Bhuyan'),
(641, 'AM', 'Arvind Meena'),
(642, 'RSP', 'RS Parmar'),
(644, 'SRT', 'Sadeep Rathee'),
(650, 'SHM', 'Shailesh Misera'),
(653, 'PRB', 'Pramendra Bajpai');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `sub_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `subject_name` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=872 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`sub_id`, `code`, `subject_name`) VALUES
(1, 'IT-101', 'English'),
(2, 'IT-102', 'Mathematics-I'),
(3, 'IT-103', 'Physics-I'),
(4, 'IT-104', 'Chemistry'),
(5, 'IT-105', 'Manufacturing Processes'),
(6, 'IT-106', 'Engineering Drawing Lab'),
(7, 'IT-107', 'Physics-I Lab'),
(8, 'IT-108', 'Chemistry Lab'),
(9, 'IT-109', 'Workshop I'),
(10, 'IT-311', 'Multimedia and Applications'),
(11, 'IT-312', 'Software Engg.'),
(12, 'IT-313', 'Information Theory'),
(13, 'IT-314', 'Elective-1'),
(14, 'IT-315', 'Microwave Engg.'),
(15, 'IT-316', 'Multimedia Lab'),
(16, 'BT-201', 'Cell Biology'),
(17, 'BT-202', 'Biochemistry'),
(18, 'BT-203', 'Microbiology'),
(19, 'BT-204', 'Basics of Computer Sys. and Program'),
(20, 'BT-205', 'Basic Electronics and Instrumentation'),
(21, 'BT-206', 'Cell Biology Lab'),
(22, 'BT-207', 'Biochemistry and Microbiology Lab'),
(23, 'BT-208', 'Basics of Computer Sys. and Prog. Lab'),
(24, 'BT-209', 'Basic Electronics and Instrumentation Lab'),
(31, 'BT-301', 'Structural Biology'),
(32, 'BT-302', 'Immunology and Immunotechnology'),
(33, 'BT-303', 'Recombinant-DNA Technology'),
(34, 'BT-304', 'Database Management Systems'),
(35, 'BT-305', 'Chemical Engineering Principles'),
(36, 'BT-306', 'Structural Biology Lab'),
(37, 'BT-307', 'Immunology and Immunotech Lab'),
(38, 'BT-308', 'Recombinant-DNA Technology I Lab'),
(39, 'BT-309', 'Database Management Lab'),
(40, 'BT-310', 'Term Paper and Seminar'),
(47, 'BT-401', 'Computational Biology'),
(48, 'BT-402', 'Bioprocess Technology'),
(49, 'BT-403', 'Downstream Processing'),
(50, 'BT-404', 'Elective 1A; Environmental Biotech'),
(52, 'BT-405', 'Management,Actg and Cost Control'),
(53, 'BT-406', 'Computational Biology II Lab'),
(54, 'BT-407', 'Bioprocess Technology Lab'),
(55, 'BT-408', 'Downstream Processing Lab'),
(56, 'BT-409', 'Practical Training'),
(57, 'BT-410', 'Seminar'),
(64, 'COE-101', 'Humanities'),
(65, 'COE-102', 'Mathematics I'),
(66, 'COE-103', 'Physics I'),
(67, 'COE-104', 'Chemistry'),
(68, 'COE-105', 'Manufacturing Processes'),
(69, 'COE-106', 'Engineering Drawing I'),
(70, 'COE-107', 'Physics I'),
(71, 'COE-108', 'Chemistry'),
(72, 'COE-109', 'Workshop I'),
(100, 'COE-201', 'Electronics I'),
(101, 'COE-202', 'Circuits And Systems'),
(102, 'COE-203', 'Power Apparatus'),
(103, 'COE-204', 'Electrical Measurements'),
(104, 'COE-205', 'Mathematics III'),
(105, 'COE-206', 'Electronics-I'),
(106, 'COE-207', 'Power Apparatus'),
(107, 'COE-208', 'Electrical Measurements'),
(108, 'COE-209', 'Machine Drawing'),
(109, 'COE-210', 'Programming-I'),
(148, 'COE-301', 'Principles of Computer Graphics'),
(149, 'COE-302', 'Descrate Maths and Design of Alg'),
(150, 'COE-303', 'Computer System Org'),
(151, 'COE-305', 'Industrial Org. and Mana. Eco'),
(152, 'COE-306', 'Computer Systems Org'),
(153, 'COE-307', 'Linear Integrated Circuits'),
(154, 'COE-308', 'Principles of Computer Graphics'),
(155, 'COE-309', 'Programming III'),
(190, 'COE-401', 'Computer and Translator Design'),
(191, 'COE-402', 'Digital Circuits and Systems II'),
(192, 'COE-403', 'Microprocessors and Applications'),
(193, 'COE-404', 'Elective I'),
(194, 'COE-405', 'Elective II'),
(195, 'COE-406', 'Computer and Translator Design'),
(196, 'COE-407', 'Digital Circuits and Systems II'),
(197, 'COE-408', 'Electives I and II'),
(198, 'COE-409', 'Practical Training'),
(199, 'COE-410', 'System Programming Language'),
(238, 'EC-101', 'Humanities'),
(239, 'EC-102', 'Mathematics I'),
(240, 'EC-103', 'Physics I'),
(241, 'EC-104', 'Chemistry'),
(242, 'EC-105', 'Manufacturing Process'),
(243, 'EC-106', 'Engineering Drawing-I'),
(244, 'EC-107', 'Physics I'),
(245, 'EC-108', 'Chemistry'),
(246, 'EC-109', 'Workshop-I'),
(283, 'EC-201', 'Electronics I'),
(284, 'EC-202', 'Circuits and Systems I'),
(285, 'EC-203', 'Electrical Machines I'),
(286, 'EC-204', 'Electrical Measurements'),
(287, 'EC-205', 'Mathematics III'),
(288, 'EC-206', 'Electronics I'),
(289, 'EC-207', 'Electrical Machines I'),
(290, 'EC-208', 'Electrical Measurements'),
(291, 'EC-209', 'Machine Drawing'),
(292, 'EC-210', 'Programming I'),
(331, 'EC-301', 'Transmission lines & wave guides'),
(332, 'EC-302', 'Control engineering'),
(333, 'EC-303', 'Computer systems & organisations'),
(334, 'EC-304', 'Linear integrated circuits'),
(335, 'EC-305', 'Ind. Org & managerial Economics'),
(336, 'EC-306', 'Computer systems & organisations'),
(337, 'EC-307', 'Linear integrated circuits'),
(338, 'EC-308', 'Control engineering'),
(339, 'EC-309', 'Programming III'),
(367, 'EC-401', 'Microwave Engg.'),
(368, 'EC-402', 'Digital Circuits & Systems-II'),
(369, 'EC-403', 'Communication Systems'),
(370, 'EC-404', 'Digital Signal and Processing-I'),
(371, 'EC-405', 'Optical Fibers (Elective II)'),
(372, 'EC-406', '101/IV'),
(373, 'EC-407', '103/IV'),
(374, 'EC-408', '215/IV'),
(375, 'EC-410', '103/V'),
(403, 'IC-101', 'English'),
(404, 'IC-102', 'Maths'),
(405, 'IC-103', 'Physics'),
(406, 'IC-104', 'Chemistry'),
(407, 'IC-105', 'Manufacturing Processes'),
(408, 'IC-106', 'Engineering Drawing'),
(409, 'IC-107', 'Physics Lab'),
(410, 'IC-108', 'Chemistry Lab'),
(411, 'IC-109', 'Workshop'),
(448, 'IC-201', 'Electronics I'),
(449, 'IC-202', 'Circuits And Systems'),
(450, 'IC-203', 'Power Apparatus'),
(451, 'IC-204', 'Electrical Measurements'),
(452, 'IC-205', 'Mathematics III'),
(453, 'IC-206', 'Electronics-I Lab'),
(454, 'IC-207', 'Power Apparatus Lab'),
(455, 'IC-208', 'Electrical Measurements Lab'),
(456, 'IC-209', 'Machine Drawing'),
(457, 'IC-210', 'Programming-I'),
(496, 'IC-301', 'Analog Digital Comm.'),
(497, 'IC-302', 'Analytical Instt.'),
(498, 'IC-303', 'DIC-1'),
(499, 'IC-304', 'LIC'),
(500, 'IC-305', 'IOME'),
(501, 'IC-306', 'ADC Lab'),
(502, 'IC-307', 'DIC Lab'),
(503, 'IC-308', 'LIC Lab'),
(504, 'IC-309', 'Programming LAB'),
(541, 'IC-401', 'Control Systems'),
(542, 'IC-402', 'Dic II'),
(543, 'ICE-403', 'Process Control'),
(544, 'IC-404', 'Biomedical Instt'),
(545, 'IC-405', 'Microprocessor'),
(546, 'IC-406', 'Control Systems Lab 112/VI'),
(547, 'IC-407', 'Dic II Lab'),
(548, 'IC-408', 'Biomedical Instt Lab212/VI'),
(549, 'IC-410', 'Programming V'),
(607, 'IT-201', 'Data Structures'),
(608, 'IT-202', 'Digital Circuits And Systems'),
(609, 'IT-203', 'Analog Electronics'),
(610, 'IT-204', 'Engineering Mathematics'),
(611, 'IT-205', 'Organizational Management'),
(612, 'IT-206', 'Data Structures Lab'),
(613, 'IT-207', 'Digital Circuits And Systems Lab'),
(614, 'IT-208', 'Analog Electronics Lab'),
(615, 'IT-209', 'Programming I Lab'),
(637, 'IT-301', 'Design and Analysis of Algorithms'),
(638, 'IT-302', 'Object Oriented Technology'),
(639, 'IT-303', 'Microprocessor and Applications'),
(640, 'IT-304', 'ROBMS'),
(641, 'IT-305', 'Computer Networks'),
(642, 'IT-306', 'Microprocessors Lab'),
(643, 'IT-307', 'ROBMS Lab'),
(644, 'IT-308', 'Networking Lab'),
(645, 'IT-309', 'Technical and Business Communication Lab'),
(667, 'IT-401', 'Internet and Web Engineering'),
(668, 'IT-402', 'Distributed Systems and Computing'),
(669, 'IT-403', 'Computer and Transistor Design'),
(670, 'IT-404', 'Elective II'),
(671, 'IT-405', 'Advances in digital System Design'),
(672, 'IT-406', 'Internet and Web Engineering Lab'),
(673, 'IT-407', 'Distributed Systems Lab'),
(674, 'IT-408', 'Elective II Lab'),
(675, 'IT-409', 'CTD Lab'),
(676, 'IT-410', 'Minor Project'),
(699, 'ME-101', 'Humanities'),
(700, 'ME-102', 'Mathematics'),
(701, 'ME-103', 'Physics'),
(702, 'ME-104', 'Chemistry'),
(703, 'ME-105', 'Manufacturing Process'),
(704, 'ME-106', 'Engineering Drawing'),
(705, 'ME-107', 'Physics Lab'),
(706, 'ME-108', 'Chemistry Lab'),
(707, 'ME-109', 'Workshop Practice (Central Workshop)'),
(708, 'MA-101', 'Humanities'),
(709, 'MA-102', 'Mathematics'),
(710, 'MA-103', 'Physics'),
(711, 'MA-104', 'Chemistry'),
(712, 'MA-105', 'Intro to Manufacturing Processes'),
(713, 'MA-106', 'Engineering Drawing'),
(714, 'MA-107', 'Physics Lab'),
(715, 'MA-108', 'Chemistry Lab'),
(716, 'MA-109', 'Workshop'),
(750, 'MA-201', 'Machine Drawing & Graphics'),
(751, 'MA-202', 'Manufacturing Processes-I'),
(752, 'MA-203', 'Electro Mechanics'),
(753, 'MA-204', 'Analog & Digital Electronics'),
(754, 'MA-205', 'Technology & Society'),
(755, 'MA-206', 'Machine Drawing & Graphics Lab'),
(756, 'MA-207', 'Science of Materials & Manufacturing Processes Lab'),
(757, 'MA-208', 'Electro Mechanics Lab'),
(758, 'MA-209', 'Analog & Digital Electronics Lab'),
(759, 'MA-210', 'Programming-I'),
(794, 'MA-301', 'Machine Tool, CNC & Automation'),
(795, 'MA-302', 'Transducers & Measurements'),
(796, 'MA-303', 'Tool Design'),
(797, 'MA-304', 'Industrial Control Systems OR Information Systems & Data Management OR Communication Principles'),
(798, 'MA-305', 'Microprocessors & Applications'),
(799, 'MA-306', 'Machine Tools Lab'),
(800, 'MA-307', 'Tool Design Lab'),
(801, 'MA-308', 'MA-304 based Lab'),
(802, 'MA-309', 'Transducers & Measurements Lab'),
(803, 'MA-310', 'Programming-III'),
(838, 'MA-401', 'Introduction to CAD and Product design'),
(839, 'MA-402', 'Moderate methods of Manufacturing'),
(840, 'MA-403', 'Industrial Electronics'),
(841, 'MA-404', 'Elective I'),
(842, 'MA-405', 'Elective II'),
(843, 'MA-406', 'CAD Lab'),
(844, 'MA-407', 'Moderate Methods of Manufacturing Lab'),
(845, 'MA-408', 'Industrial Electronics Lab'),
(846, 'MA-409', 'Practical Training'),
(847, 'MA-410', 'Programming V (AUTOCAD)');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE IF NOT EXISTS `timetable` (
  `timetable_id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `timeslot` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `subject_code` varchar(200) DEFAULT NULL,
  `profFH` varchar(200) DEFAULT NULL,
  `profSH` varchar(200) DEFAULT NULL,
  `roomFH` varchar(200) DEFAULT NULL,
  `roomSH` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profs`
--
ALTER TABLE `profs`
  ADD PRIMARY KEY (`prof_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`sub_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`timetable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `main`
--
ALTER TABLE `main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `profs`
--
ALTER TABLE `profs`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1385;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=872;
--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `timetable_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
