-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 15, 2024 at 02:08 PM
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
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `Name` varchar(17) DEFAULT NULL,
  `Regd` varchar(15) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Done',
  `washes` int(4) NOT NULL DEFAULT 40,
  `rack` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `roomno` varchar(10) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `hostel` varchar(20) DEFAULT NULL,
  `hashed_pass` varchar(256) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`Name`, `Regd`, `email`, `contact`, `status`, `washes`, `rack`, `gender`, `section`, `roomno`, `batch`, `hostel`, `hashed_pass`, `last_updated`) VALUES
('Kalyanram Poonamalli', 'AP22110010101', 'kalyanram_poonamalli@srmap.edu.in', '9493912237', 'Done', 27, 0, 'Male', 'B', '102', '2026', 'Krishna', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 12:06:16'),
('Navaneeth Krishna', 'AP22110011253', 'navaneethkrishna_bondada@srmap.edu.in', '9182181223', 'Done', 22, 0, 'Male', 'T', '723', '2026', 'Vedavathi', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 17:12:36'),
('Rohan Gupta', 'AP22110011255', 'rohangupta@srmap.edu.in', '7890123456', 'Pending', 37, 0, 'Male', 'X', '343', '2023', 'Ganga', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:23:09'),
('Arjun Singh', 'AP22110011256', 'arjunsingh@srmap.edu.in', '8901234567', 'Pending', 18, 0, 'Male', 'S', '1343', '2026', 'Vedavati', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:16:24'),
('Priya Patel', 'AP22110011257', 'priyapatel@srmap.edu.in', '9012345678', 'Done', 0, 0, 'Female', 'J', '733', '2025', 'Krishna', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:16:24'),
('Karan Mehta', 'AP22110011259', 'karanmehta@srmap.edu.in', '0123456789', 'Done', 0, 0, 'Male', 'C', '1733', '2025', 'Ganga', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:57:29'),
('Sneha Reddy', 'AP22110011260', 'snehareddy@srmap.edu.in', '6789012345', 'Done', 27, 0, 'Female', 'D', '145', '2026', 'Krishna', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 14:04:39'),
('Rajesh Kumar', 'AP22110011261', 'rajeshkumar@srmap.edu.in', '4567890123', 'Done', 26, 0, 'Male', 'U', '1145', '2025', 'Ganga', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:16:24'),
('Divya Singh', 'AP22110011262', 'divyasingh@srmap.edu.in', '5678901234', 'Pending', 19, 0, 'Female', 'G', '1545', '2026', 'Krishna', '$2y$10$SNX7DUUkMldiAp0miKIwa.4eiMe8.wlKi/dPYty4Vl2a8Pynqh8Hm', '2024-05-11 11:51:37');

--
-- Triggers `info`
--
DELIMITER $$
CREATE TRIGGER `update_last_updated` BEFORE UPDATE ON `info` FOR EACH ROW BEGIN
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_laundry_status_log` AFTER UPDATE ON `info` FOR EACH ROW BEGIN
    IF OLD.status != NEW.status THEN
        IF OLD.status = 'Done' AND NEW.status = 'Pending' THEN
            INSERT INTO laundry_log (regd, previous_status, new_status, message)
            VALUES (NEW.Regd, OLD.status, NEW.status, 'Status changed from Done to Pending');
        ELSEIF OLD.status = 'Pending' AND NEW.status = 'Done' THEN
            INSERT INTO laundry_log (regd, previous_status, new_status, message)
            VALUES (NEW.Regd, OLD.status, NEW.status, 'Status changed from Pending to Done');
        ELSE
            INSERT INTO laundry_log (regd, previous_status, new_status, message)
            VALUES (NEW.Regd, OLD.status, NEW.status, 'Status updated');
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laundry_log`
--

CREATE TABLE `laundry_log` (
  `id` int(11) NOT NULL,
  `regd` varchar(15) DEFAULT NULL,
  `previous_status` varchar(20) DEFAULT NULL,
  `new_status` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laundry_log`
--

INSERT INTO `laundry_log` (`id`, `regd`, `previous_status`, `new_status`, `message`, `timestamp`) VALUES
(1, 'AP22110011255', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:23:09'),
(2, 'AP22110011259', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 11:23:53'),
(3, 'AP22110011260', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:50:03'),
(4, 'AP22110011260', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 11:50:14'),
(5, 'AP22110011260', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:51:06'),
(6, 'AP22110011262', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:51:37'),
(7, 'AP22110011259', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:52:53'),
(8, 'AP22110011259', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 11:55:00'),
(9, 'AP22110011259', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:55:04'),
(10, 'AP22110011259', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 11:56:50'),
(11, 'AP22110011259', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 11:57:27'),
(12, 'AP22110011259', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 11:57:29'),
(13, 'AP22110011253', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 12:03:45'),
(14, 'AP22110011253', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 12:03:52'),
(15, 'AP22110011253', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 12:06:01'),
(16, 'AP22110010101', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 12:06:16'),
(17, 'AP22110011253', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 12:12:03'),
(18, 'AP22110011260', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 12:13:39'),
(19, 'AP22110011260', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 12:14:14'),
(20, 'AP22110011253', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 12:51:35'),
(21, 'AP22110011253', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 12:53:06'),
(22, 'AP22110011260', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 14:04:39'),
(23, 'AP22110011253', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 16:32:15'),
(24, 'AP22110011253', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 16:32:41'),
(25, 'AP22110011253', 'Done', 'Pending', 'Status changed from Done to Pending', '2024-05-11 17:11:48'),
(26, 'AP22110011253', 'Pending', 'Done', 'Status changed from Pending to Done', '2024-05-11 17:12:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laundry_log`
--
ALTER TABLE `laundry_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laundry_log`
--
ALTER TABLE `laundry_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
