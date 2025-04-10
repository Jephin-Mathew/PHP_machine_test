-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 05:22 PM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `machine_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`) VALUES
(1, 'Adarsh'),
(2, 'Arjun'),
(3, 'Sam'),
(4, 'Naveen'),
(5, 'Anoop'),
(6, 'Anu'),
(7, 'Jay'),
(8, 'suraj'),
(9, 'Jeff');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','shipped','delivered','canceled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `total_amount`, `status`) VALUES
(1, 1, '2025-02-01', 100.00, 'delivered'),
(2, 1, '2025-03-01', 200.00, 'shipped'),
(3, 2, '2025-01-15', 150.00, 'canceled'),
(4, 2, '2025-02-20', 300.00, 'pending'),
(5, 3, '2025-03-10', 250.00, 'delivered'),
(6, 3, '2025-01-05', 400.00, 'canceled'),
(7, 4, '2025-02-18', 120.00, 'shipped'),
(8, 5, '2025-03-22', 180.00, 'pending'),
(9, 1, '2025-03-15', 250.00, 'delivered'),
(10, 1, '2025-04-01', 180.00, 'pending'),
(11, 4, '2025-03-05', 150.00, 'delivered'),
(12, 4, '2025-03-25', 170.00, 'shipped'),
(13, 5, '2025-02-12', 130.00, 'pending'),
(14, 5, '2025-03-18', 140.00, 'shipped'),
(15, 5, '2025-03-30', 160.00, 'delivered'),
(16, 6, '2025-03-10', 90.00, 'shipped'),
(17, 7, '2025-03-20', 110.00, 'delivered'),
(18, 8, '2025-02-28', 75.00, 'pending'),
(19, 9, '2025-01-18', 120.00, 'delivered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
