-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2018 at 09:41 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_nabil_serri_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency_location`
--

CREATE TABLE `agency_location` (
  `agency_location_id` int(11) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `bulding` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency_location`
--

INSERT INTO `agency_location` (`agency_location_id`, `Country`, `City`, `street`, `bulding`) VALUES
(1, 'Austria', 'Vienna', 'alser strasse', '44'),
(2, 'Germany', 'Berlin', 'pirmasens', '23');

-- --------------------------------------------------------

--
-- Table structure for table `car_rental_agency`
--

CREATE TABLE `car_rental_agency` (
  `agency_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL,
  `agency_name` varchar(30) NOT NULL,
  `agency_website` varchar(75) NOT NULL,
  `agency_phoneNumber` int(11) NOT NULL,
  `fk_agency_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_rental_agency`
--

INSERT INTO `car_rental_agency` (`agency_id`, `fk_reservation_id`, `agency_name`, `agency_website`, `agency_phoneNumber`, `fk_agency_location`) VALUES
(1, 1, 'golden cars', 'www.goldencars.com', 336936969, 1),
(2, 2, 'bronze cars', 'www.bronzecars.com', 624584521, 2);

-- --------------------------------------------------------

--
-- Table structure for table `checking_center`
--

CREATE TABLE `checking_center` (
  `checking_center_id` int(11) NOT NULL,
  `fk_return_id` int(11) NOT NULL,
  `fk_checking_result` int(11) NOT NULL,
  `fk_checking_charges` int(11) NOT NULL,
  `fk_checking_center_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checking_center`
--

INSERT INTO `checking_center` (`checking_center_id`, `fk_return_id`, `fk_checking_result`, `fk_checking_charges`, `fk_checking_center_location`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `checking_charges`
--

CREATE TABLE `checking_charges` (
  `checking_charges_id` int(11) NOT NULL,
  `invoice` int(7) NOT NULL,
  `fk_payment_method` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checking_charges`
--

INSERT INTO `checking_charges` (`checking_charges_id`, `invoice`, `fk_payment_method`) VALUES
(1, 1000, 1),
(2, 500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `checking_result`
--

CREATE TABLE `checking_result` (
  `checking_result_id` int(11) NOT NULL,
  `damaged_the_car` varchar(300) NOT NULL,
  `gasoline_tank_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checking_result`
--

INSERT INTO `checking_result` (`checking_result_id`, `damaged_the_car`, `gasoline_tank_status`) VALUES
(1, 'tires need to be replaced', 'full'),
(2, 'car need to be painted', 'empty');

-- --------------------------------------------------------

--
-- Table structure for table `classname`
--

CREATE TABLE `classname` (
  `center_location_id` int(11) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `bulding` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classname`
--

INSERT INTO `classname` (`center_location_id`, `Country`, `City`, `street`, `bulding`) VALUES
(1, 'Austria', 'Vienna', 'linzer strasse', '45'),
(2, 'Germany', 'Berlin', 'lorem', '24');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fk_rent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `fk_rent_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_phoneNumber` int(11) NOT NULL,
  `customer_driver_license` enum('yes','no') DEFAULT NULL,
  `customer_F_name` varchar(30) NOT NULL,
  `customer_L_name` varchar(30) NOT NULL,
  `customer_insurance` enum('yes','no') DEFAULT NULL,
  `fk_customer_addres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_phoneNumber`, `customer_driver_license`, `customer_F_name`, `customer_L_name`, `customer_insurance`, `fk_customer_addres`) VALUES
(1, 123123123, 'yes', 'john', 'due', 'yes', 1),
(2, 321321321, 'no', 'lorem', 'ispum', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_address_id` int(11) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `bulding` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_address_id`, `Country`, `City`, `street`, `bulding`) VALUES
(1, 'Austria', 'Vienna', 'meidlinger hauptstraße', '46'),
(2, 'Germany', 'Berlin', 'zxczxc', '22');

-- --------------------------------------------------------

--
-- Table structure for table `deliver`
--

CREATE TABLE `deliver` (
  `deliver_id` int(11) NOT NULL,
  `fk_agency_id` int(11) NOT NULL,
  `deliver_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliver`
--

INSERT INTO `deliver` (`deliver_id`, `fk_agency_id`, `deliver_date`) VALUES
(1, 1, '2018-11-01 04:18:33'),
(2, 2, '2018-11-20 02:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `online_rental_agency`
--

CREATE TABLE `online_rental_agency` (
  `online_rental_agency_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `online_rental_agency_webAddres` varchar(75) NOT NULL,
  `fk_online_rental_agency_cars` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `online_rental_agency`
--

INSERT INTO `online_rental_agency` (`online_rental_agency_id`, `fk_customer_id`, `online_rental_agency_webAddres`, `fk_online_rental_agency_cars`) VALUES
(1, 1, 'www.rental.com', 1),
(2, 2, 'www.cars.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `online_rental_agency_cars`
--

CREATE TABLE `online_rental_agency_cars` (
  `online_rental_agency_cars_id` int(11) NOT NULL,
  `car_color` varchar(20) NOT NULL,
  `car_speed` int(4) NOT NULL,
  `car_gear` enum('manual','automatic') DEFAULT NULL,
  `car_year` year(4) NOT NULL,
  `car_company` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `online_rental_agency_cars`
--

INSERT INTO `online_rental_agency_cars` (`online_rental_agency_cars_id`, `car_color`, `car_speed`, `car_gear`, `car_year`, `car_company`) VALUES
(1, 'red', 150, 'manual', 0000, 'golf'),
(2, 'blue', 200, 'automatic', 0000, 'kia'),
(3, 'red', 150, 'manual', 0000, 'golf'),
(4, 'blue', 200, 'automatic', 0000, 'kia'),
(5, 'red', 150, 'manual', 1992, 'golf'),
(6, 'blue', 200, 'automatic', 2010, 'kia');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL,
  `pay` enum('cash','credit') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `pay`) VALUES
(1, 'cash'),
(2, 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_online_rental_agency_id` int(11) NOT NULL,
  `reservation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `fk_online_rental_agency_id`, `reservation_date`) VALUES
(1, 1, '2018-11-12 04:16:00'),
(2, 2, '2018-11-29 04:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL,
  `fk_client_id` int(11) NOT NULL,
  `return_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return`
--

INSERT INTO `return` (`return_id`, `fk_client_id`, `return_date`) VALUES
(1, 1, '2018-11-12 03:20:00'),
(2, 2, '2018-11-15 11:46:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency_location`
--
ALTER TABLE `agency_location`
  ADD PRIMARY KEY (`agency_location_id`);

--
-- Indexes for table `car_rental_agency`
--
ALTER TABLE `car_rental_agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_agency_location` (`fk_agency_location`);

--
-- Indexes for table `checking_center`
--
ALTER TABLE `checking_center`
  ADD PRIMARY KEY (`checking_center_id`),
  ADD KEY `fk_return_id` (`fk_return_id`),
  ADD KEY `fk_checking_result` (`fk_checking_result`),
  ADD KEY `fk_checking_charges` (`fk_checking_charges`),
  ADD KEY `fk_checking_center_location` (`fk_checking_center_location`);

--
-- Indexes for table `checking_charges`
--
ALTER TABLE `checking_charges`
  ADD PRIMARY KEY (`checking_charges_id`),
  ADD KEY `fk_payment_method` (`fk_payment_method`);

--
-- Indexes for table `checking_result`
--
ALTER TABLE `checking_result`
  ADD PRIMARY KEY (`checking_result_id`);

--
-- Indexes for table `classname`
--
ALTER TABLE `classname`
  ADD PRIMARY KEY (`center_location_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_addres` (`fk_customer_addres`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_address_id`);

--
-- Indexes for table `deliver`
--
ALTER TABLE `deliver`
  ADD PRIMARY KEY (`deliver_id`),
  ADD KEY `fk_agency_id` (`fk_agency_id`);

--
-- Indexes for table `online_rental_agency`
--
ALTER TABLE `online_rental_agency`
  ADD PRIMARY KEY (`online_rental_agency_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_online_rental_agency_cars` (`fk_online_rental_agency_cars`);

--
-- Indexes for table `online_rental_agency_cars`
--
ALTER TABLE `online_rental_agency_cars`
  ADD PRIMARY KEY (`online_rental_agency_cars_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_online_rental_agency_id` (`fk_online_rental_agency_id`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client_id` (`fk_client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency_location`
--
ALTER TABLE `agency_location`
  MODIFY `agency_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car_rental_agency`
--
ALTER TABLE `car_rental_agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `checking_center`
--
ALTER TABLE `checking_center`
  MODIFY `checking_center_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `checking_charges`
--
ALTER TABLE `checking_charges`
  MODIFY `checking_charges_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `checking_result`
--
ALTER TABLE `checking_result`
  MODIFY `checking_result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classname`
--
ALTER TABLE `classname`
  MODIFY `center_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `customer_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deliver`
--
ALTER TABLE `deliver`
  MODIFY `deliver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `online_rental_agency`
--
ALTER TABLE `online_rental_agency`
  MODIFY `online_rental_agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `online_rental_agency_cars`
--
ALTER TABLE `online_rental_agency_cars`
  MODIFY `online_rental_agency_cars_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_rental_agency`
--
ALTER TABLE `car_rental_agency`
  ADD CONSTRAINT `car_rental_agency_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `car_rental_agency_ibfk_2` FOREIGN KEY (`fk_agency_location`) REFERENCES `agency_location` (`agency_location_id`);

--
-- Constraints for table `checking_center`
--
ALTER TABLE `checking_center`
  ADD CONSTRAINT `checking_center_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `return` (`return_id`),
  ADD CONSTRAINT `checking_center_ibfk_2` FOREIGN KEY (`fk_checking_result`) REFERENCES `checking_result` (`checking_result_id`),
  ADD CONSTRAINT `checking_center_ibfk_3` FOREIGN KEY (`fk_checking_charges`) REFERENCES `checking_charges` (`checking_charges_id`),
  ADD CONSTRAINT `checking_center_ibfk_4` FOREIGN KEY (`fk_checking_center_location`) REFERENCES `classname` (`center_location_id`);

--
-- Constraints for table `checking_charges`
--
ALTER TABLE `checking_charges`
  ADD CONSTRAINT `checking_charges_ibfk_1` FOREIGN KEY (`fk_payment_method`) REFERENCES `payment_method` (`payment_method_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`fk_rent_id`) REFERENCES `deliver` (`deliver_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_addres`) REFERENCES `customer_address` (`customer_address_id`);

--
-- Constraints for table `deliver`
--
ALTER TABLE `deliver`
  ADD CONSTRAINT `deliver_ibfk_1` FOREIGN KEY (`fk_agency_id`) REFERENCES `car_rental_agency` (`agency_id`);

--
-- Constraints for table `online_rental_agency`
--
ALTER TABLE `online_rental_agency`
  ADD CONSTRAINT `online_rental_agency_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `online_rental_agency_ibfk_2` FOREIGN KEY (`fk_online_rental_agency_cars`) REFERENCES `online_rental_agency_cars` (`online_rental_agency_cars_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_online_rental_agency_id`) REFERENCES `online_rental_agency` (`online_rental_agency_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
