-- Create or use the database
CREATE DATABASE IF NOT EXISTS blood_donation;
USE blood_donation;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Create `admin` table
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Create `tblblooddonars` table
CREATE TABLE IF NOT EXISTS `tblblooddonars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Create `tblbloodgroup` table
CREATE TABLE IF NOT EXISTS `tblbloodgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Create `tblcontactusinfo` table
CREATE TABLE IF NOT EXISTS `tblcontactusinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Create `tblcontactusquery` table
CREATE TABLE IF NOT EXISTS `tblcontactusquery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Create `tblpages` table
CREATE TABLE IF NOT EXISTS `tblpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Create `tbldependents` table
CREATE TABLE IF NOT EXISTS `tbldependents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DonorID` int(11) NOT NULL,
  `DependentName` varchar(100) DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_donor_id` FOREIGN KEY (`DonorID`) REFERENCES `tblblooddonars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Insert data into `admin` table
INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'nandini', 'nandini1012', CURRENT_TIMESTAMP);

-- Insert data into `tblblooddonars` table
INSERT INTO `tblblooddonars` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Gender`, `Age`, `BloodGroup`, `Address`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Mark', '9999857868', 'markd@gmail.com', 'Male', 27, 'O+', 'Bangalore', 'Proud to be part of this cause', '2023-06-30 20:14:16', 1),
(2, 'Stef', '41241241241', 'stef@dfdsf.com', 'Male', 34, 'AB-', 'Mysore', 'Good cause', '2023-06-30 20:48:11', 1),
(3, 'Ankitha', '42352352352', 'anki@gmail.com', 'Female', 23, 'B+', 'Bangalore', 'Great job', '2023-07-01 07:21:21', 1),
(4, 'Zayn', '35345435345', 'onedirection@asd.com', 'Male', 26, 'AB-', 'Bangalore', 'Available anytime to donate', '2023-07-01 09:00:18', 1),
(5, 'Namratha', '8569855244', 'namu@yahoo.com', 'Female', 22, 'A+', 'Raichur', 'Done', '2023-07-01 09:00:18', 1),
(6, 'Ravi', '8561234244', 'ravi@yahoo.com', 'Male', 38, 'A+', 'Raichur', 'Hoo', '2023-07-15 09:00:18', 1),
(7, 'Apeksha', '8565678244', 'appu@yahoo.com', 'Female', 42, 'O-', 'Raichur', 'Nice', '2023-07-01 09:00:18', 1);

-- Insert data into `tblbloodgroup` table
INSERT INTO `tblbloodgroup` (`id`, `BloodGroup`, `PostingDate`) VALUES
(1, 'A+', '2023-06-30 20:33:50'),
(2, 'A-', '2023-06-30 20:34:00'),
(3, 'O+', '2023-06-30 20:34:05'),
(4, 'O-', '2023-06-30 20:34:10'),
(5, 'B+', '2023-06-30 20:34:13'),
(6, 'B-', '2023-06-30 20:34:18'),
(7, 'AB+', '2023-06-30 20:34:18'),
(8, 'AB-', '2023-06-30 20:34:18');

-- Insert data into `tblcontactusinfo` table
INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Bangalore', 'nandu@gmail.com', '8585233222');

-- Insert data into `tblcontactusquery` table
INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Nandini BS', 'nandu@gmail.com', '2147483647', 'Proud to be part of it', '2023-11-15 08:02:26', 1),
(2, 'Stefan', 'stef@gmail.com', '42342342', 'We can do this', '2023-06-30 21:21:30', NULL),
(3, 'Chirag', 'chiru10@gmail.com', '75787875545', 'Will do our best', '2023-07-01 07:19:36', NULL);

-- Insert data into `tblpages` table
INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(2, 'Why Become a Donor', 'donor', '<span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"> Blood is the most precious gift that anyone can give to another person - the gift of life. A decision to donate your blood can save a life, or even several if your blood is separated into its components - red cells, platelets and plasma - which can be used individually for patients with specific conditions.</span>'),
(1, 'About Us', 'aboutus', '<span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;"> This is an online blood donation website, where you can donate blood. The donated blood is stored by the type of blood group, date of donation, and age. We can easily search and get the type of blood in the time of emergency.</span>');

-- Insert data into `tbldependents` table
INSERT INTO `tbldependents` (`id`, `DonorID`, `DependentName`, `Relationship`, `Age`) VALUES
(1, 1, 'Dependent1', 'Child', 5),
(2, 3, 'Dependent2', 'Spouse', 28);














