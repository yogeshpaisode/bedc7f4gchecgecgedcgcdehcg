-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 15, 2015 at 05:48 AM
-- Server version: 5.1.26-rc-community
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nawandarfilmesdistribution`
--
CREATE DATABASE IF NOT EXISTS `nawandarfilmesdistribution` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nawandarfilmesdistribution`;

-- --------------------------------------------------------

--
-- Table structure for table `cash_payment`
--

CREATE TABLE IF NOT EXISTS `cash_payment` (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_id` int(11) DEFAULT NULL,
  `depositer_name` text,
  `amt_recv` double DEFAULT NULL,
  `amt_recv_date` date DEFAULT NULL,
  `amt_recv_time` text,
  `recv_mg` tinyint(1) DEFAULT NULL,
  `rec_other` tinyint(1) DEFAULT NULL,
  `entry_date_time` date DEFAULT NULL,
  PRIMARY KEY (`cash_id`),
  KEY `wo_id` (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cheaque_payment`
--

CREATE TABLE IF NOT EXISTS `cheaque_payment` (
  `cheaque_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_id` int(11) DEFAULT NULL,
  `cheaque_no` text,
  `bank_name` text,
  `depositer_name` text,
  `amt_recv` double DEFAULT NULL,
  `amt_recv_date` date DEFAULT NULL,
  `amt_recv_time` text,
  `recv_mg` tinyint(1) DEFAULT NULL,
  `rec_other` tinyint(1) DEFAULT NULL,
  `entry_date_time` date DEFAULT NULL,
  PRIMARY KEY (`cheaque_id`),
  KEY `wo_id` (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `members_detail`
--

CREATE TABLE IF NOT EXISTS `members_detail` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `m_name` text,
  `m_email` text,
  `m_contact` text,
  PRIMARY KEY (`m_id`),
  KEY `p_id` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movie_detail`
--

CREATE TABLE IF NOT EXISTS `movie_detail` (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_name` text,
  `mov_produces` text,
  `mov_release_Date` date DEFAULT NULL,
  `mov_bannes_img_Link` text,
  `mov_youtube_Link` text,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `neft_rtgs_payment`
--

CREATE TABLE IF NOT EXISTS `neft_rtgs_payment` (
  `nr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_id` int(11) DEFAULT NULL,
  `UTR_no` text,
  `depositer_name` text,
  `neft` tinyint(1) DEFAULT NULL,
  `rtgs` tinyint(1) DEFAULT NULL,
  `amt_recv` double DEFAULT NULL,
  `amt_recv_date` date DEFAULT NULL,
  `amt_recv_time` text,
  `recv_mg` tinyint(1) DEFAULT NULL,
  `rec_other` tinyint(1) DEFAULT NULL,
  `entry_date_time` date DEFAULT NULL,
  PRIMARY KEY (`nr_id`),
  KEY `wo_id` (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `party_detail`
--

CREATE TABLE IF NOT EXISTS `party_detail` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` text,
  `p_email` text,
  `p_password` text,
  `p_std_code` int(11) DEFAULT NULL,
  `p_office_number` text,
  `p_address` text,
  `p_state` text,
  `p_city` text,
  `p_fax` text,
  `p_country` text,
  `p_circuit` text,
  `p_circuit_region` text,
  `p_datetime_addition` date DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profit_ticket_log`
--

CREATE TABLE IF NOT EXISTS `profit_ticket_log` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_id` int(11) DEFAULT NULL,
  `ticket_sold` int(11) DEFAULT NULL,
  `total_profit` double DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `entry_date_time` date DEFAULT NULL,
  PRIMARY KEY (`pt_id`),
  KEY `wo_id` (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `screen_detail`
--

CREATE TABLE IF NOT EXISTS `screen_detail` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `s_name` text,
  `s_number` int(11) DEFAULT NULL,
  `s_seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `p_id` (`p_id`),
  KEY `t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `theater_detail`
--

CREATE TABLE IF NOT EXISTS `theater_detail` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `t_name` text,
  `t_address` text,
  `t_state` text,
  `t_city` text,
  `t_country` text,
  `t_email` text,
  `t_std_code` int(11) DEFAULT NULL,
  `t_phone_number` text,
  `t_type` text,
  `t_datetime_addition` date DEFAULT NULL,
  `t_no_Screens` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `p_id` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work_order`
--

CREATE TABLE IF NOT EXISTS `work_order` (
  `wo_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `wo_weeks` int(11) DEFAULT NULL,
  `wo_shows_perDay` int(11) DEFAULT NULL,
  `wo_unlock_key` text,
  `wo_startDate` date DEFAULT NULL,
  `wo_endDate` date DEFAULT NULL,
  `wo_mg` tinyint(1) DEFAULT NULL,
  `wo_rent` tinyint(1) DEFAULT NULL,
  `wo_sharing` tinyint(1) DEFAULT NULL,
  `wo_aggrement` tinyint(1) DEFAULT NULL,
  `wo_sent_email` tinyint(1) DEFAULT NULL,
  `wo_date_time_ofAddtion` date DEFAULT NULL,
  PRIMARY KEY (`wo_id`),
  KEY `p_id` (`p_id`),
  KEY `t_id` (`t_id`),
  KEY `s_id` (`s_id`),
  KEY `mov_id` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wo_agrrement`
--

CREATE TABLE IF NOT EXISTS `wo_agrrement` (
  `wo_aggri_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_id` int(11) DEFAULT NULL,
  `week_no` int(11) DEFAULT NULL,
  `theater_rent` double DEFAULT NULL,
  `distributer_share` int(11) DEFAULT NULL,
  `owner_share` int(11) DEFAULT NULL,
  PRIMARY KEY (`wo_aggri_id`),
  KEY `wo_id` (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cash_payment`
--
ALTER TABLE `cash_payment`
  ADD CONSTRAINT `cash_payment_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `work_order` (`wo_id`);

--
-- Constraints for table `cheaque_payment`
--
ALTER TABLE `cheaque_payment`
  ADD CONSTRAINT `cheaque_payment_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `work_order` (`wo_id`);

--
-- Constraints for table `members_detail`
--
ALTER TABLE `members_detail`
  ADD CONSTRAINT `members_detail_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `party_detail` (`p_id`);

--
-- Constraints for table `neft_rtgs_payment`
--
ALTER TABLE `neft_rtgs_payment`
  ADD CONSTRAINT `neft_rtgs_payment_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `work_order` (`wo_id`);

--
-- Constraints for table `profit_ticket_log`
--
ALTER TABLE `profit_ticket_log`
  ADD CONSTRAINT `profit_ticket_log_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `work_order` (`wo_id`);

--
-- Constraints for table `screen_detail`
--
ALTER TABLE `screen_detail`
  ADD CONSTRAINT `screen_detail_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `party_detail` (`p_id`),
  ADD CONSTRAINT `screen_detail_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `theater_detail` (`t_id`);

--
-- Constraints for table `theater_detail`
--
ALTER TABLE `theater_detail`
  ADD CONSTRAINT `theater_detail_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `party_detail` (`p_id`);

--
-- Constraints for table `work_order`
--
ALTER TABLE `work_order`
  ADD CONSTRAINT `work_order_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `party_detail` (`p_id`),
  ADD CONSTRAINT `work_order_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `theater_detail` (`t_id`),
  ADD CONSTRAINT `work_order_ibfk_3` FOREIGN KEY (`s_id`) REFERENCES `screen_detail` (`s_id`),
  ADD CONSTRAINT `work_order_ibfk_4` FOREIGN KEY (`mov_id`) REFERENCES `movie_detail` (`mov_id`);

--
-- Constraints for table `wo_agrrement`
--
ALTER TABLE `wo_agrrement`
  ADD CONSTRAINT `wo_agrrement_ibfk_1` FOREIGN KEY (`wo_id`) REFERENCES `work_order` (`wo_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
