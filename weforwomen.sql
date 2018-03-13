-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2018 at 04:28 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weforwomen`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaignsupporter`
--

CREATE TABLE `campaignsupporter` (
  `cs_id` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL,
  `cs_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `d_id` int(50) NOT NULL,
  `fk_s_id` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL,
  `amount` int(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `getjob`
--

CREATE TABLE `getjob` (
  `g_id` int(50) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `cur_location` varchar(50) NOT NULL,
  `mobile` bigint(50) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `skills` varchar(50) NOT NULL,
  `function` varchar(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL,
  `fk_p_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `investment`
--

CREATE TABLE `investment` (
  `i_id` int(50) NOT NULL,
  `fk_s_id` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `needsupport`
--

CREATE TABLE `needsupport` (
  `s_id` int(50) NOT NULL,
  `type_of_help` varchar(50) NOT NULL,
  `duration` int(50) NOT NULL,
  `amount` int(50) NOT NULL,
  `support_desc` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `no_of_volunteer` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `postjob`
--

CREATE TABLE `postjob` (
  `p_id` int(11) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `job_field` varchar(50) NOT NULL,
  `job_type` varchar(50) NOT NULL,
  `job_desc` varchar(255) NOT NULL,
  `job_location` varchar(50) NOT NULL,
  `job_skills` varchar(50) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `salary` int(50) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `job_duration` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `r_id` int(50) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `password` varchar(255) ,
  `country` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `startcampaign`
--

CREATE TABLE `startcampaign` (
  `c_id` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `org_website` varchar(50) NOT NULL,
  `social_link` varchar(50) NOT NULL,
  `camp_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `v_id` int(50) NOT NULL,
  `fk_s_id` int(50) NOT NULL,
  `time_span` int(50) NOT NULL,
  `location` int(50) NOT NULL,
  `fk_r_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaignsupporter`
--
ALTER TABLE `campaignsupporter`
  ADD PRIMARY KEY (`cs_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `donation_ibfk_1` (`fk_s_id`),
  ADD KEY `donation_ibfk_2` (`fk_r_id`);

--
-- Indexes for table `getjob`
--
ALTER TABLE `getjob`
  ADD PRIMARY KEY (`g_id`),
  ADD KEY `fk_r_id` (`fk_r_id`),
  ADD KEY `fk_p_id` (`fk_p_id`);

--
-- Indexes for table `investment`
--
ALTER TABLE `investment`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `fk_s_id` (`fk_s_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- Indexes for table `needsupport`
--
ALTER TABLE `needsupport`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- Indexes for table `postjob`
--
ALTER TABLE `postjob`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`);

--
-- Indexes for table `startcampaign`
--
ALTER TABLE `startcampaign`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `fk_s_id` (`fk_s_id`),
  ADD KEY `fk_r_id` (`fk_r_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaignsupporter`
--
ALTER TABLE `campaignsupporter`
  MODIFY `cs_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `d_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20000;
--
-- AUTO_INCREMENT for table `getjob`
--
ALTER TABLE `getjob`
  MODIFY `g_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30001;
--
-- AUTO_INCREMENT for table `investment`
--
ALTER TABLE `investment`
  MODIFY `i_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40000;
--
-- AUTO_INCREMENT for table `needsupport`
--
ALTER TABLE `needsupport`
  MODIFY `s_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50000;
--
-- AUTO_INCREMENT for table `postjob`
--
ALTER TABLE `postjob`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60000;
--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `r_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70000;
--
-- AUTO_INCREMENT for table `startcampaign`
--
ALTER TABLE `startcampaign`
  MODIFY `c_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80000;
--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `v_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90000;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `campaignsupporter`
--
ALTER TABLE `campaignsupporter`
  ADD CONSTRAINT `campaignsupporter_ibfk_1` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`fk_s_id`) REFERENCES `needsupport` (`s_id`),
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `getjob`
--
ALTER TABLE `getjob`
  ADD CONSTRAINT `getjob_ibfk_1` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`),
  ADD CONSTRAINT `getjob_ibfk_2` FOREIGN KEY (`fk_p_id`) REFERENCES `postjob` (`p_id`);

--
-- Constraints for table `investment`
--
ALTER TABLE `investment`
  ADD CONSTRAINT `investment_ibfk_1` FOREIGN KEY (`fk_s_id`) REFERENCES `needsupport` (`s_id`),
  ADD CONSTRAINT `investment_ibfk_2` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `needsupport`
--
ALTER TABLE `needsupport`
  ADD CONSTRAINT `needsupport_ibfk_1` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `postjob`
--
ALTER TABLE `postjob`
  ADD CONSTRAINT `postjob_ibfk_1` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `startcampaign`
--
ALTER TABLE `startcampaign`
  ADD CONSTRAINT `startcampaign_ibfk_1` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`fk_s_id`) REFERENCES `needsupport` (`s_id`),
  ADD CONSTRAINT `volunteer_ibfk_2` FOREIGN KEY (`fk_r_id`) REFERENCES `register` (`r_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
