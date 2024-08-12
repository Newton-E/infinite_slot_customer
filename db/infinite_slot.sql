-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2024 at 09:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infinite_slot`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `adminId` int(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(50) NOT NULL,
  `store_postion` varchar(50) NOT NULL,
  `staff` int(100) NOT NULL,
  `origine_state` varchar(100) NOT NULL,
  `state_lga` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `position` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` int(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `adminId`, `fname`, `sname`, `img`, `email`, `phone`, `store_postion`, `staff`, `origine_state`, `state_lga`, `address`, `position`, `password`, `code`, `status`) VALUES
(1, 8768, 'Sd', 'Haruna', 'user.png', 'abubakarsd.harunasadiq@gmail.com', 2147483647, 'owner', 6, 'Adamawa', 'Ganye', 'wagi street Anambra', 'admin', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified'),
(3, 831247, 'Ishhaq', 'Jamilu', 'user.png', 'ismeeboy@gmail.com', 2147483647, 'owner', 3, 'FCT', 'Gwagwalada', 'wagi street Anambra', '2', '$2y$10$9LTSL0sPewQWUFwRzEEXOO8xjDNRRcjcy9iRqUW4liZ7U9hiy/v2G', 0, 'verified'),
(11, 175661, 'Abubakar Sd Haruna', 'sdharuna', 'user.png', 'abubakarsd1.harunasadiq@gmail.com', 0, '', 0, '', '', '', '2', '$2y$10$ZqFfE2NukebP7DJV/716POMmiuBZjhZSiLKh7qTvgVHoaBJbuRiaS', 175661, 'not verified');

-- --------------------------------------------------------

--
-- Table structure for table `alert_notification`
--

CREATE TABLE `alert_notification` (
  `id` int(11) NOT NULL,
  `vend_id` varchar(20) NOT NULL,
  `noti_icon` varchar(100) NOT NULL,
  `alert_type` varchar(100) NOT NULL,
  `alert_msg` varchar(255) NOT NULL,
  `alert_page_link` varchar(255) NOT NULL,
  `alert_status` int(11) NOT NULL,
  `alert_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert_notification`
--

INSERT INTO `alert_notification` (`id`, `vend_id`, `noti_icon`, `alert_type`, `alert_msg`, `alert_page_link`, `alert_status`, `alert_date`) VALUES
(148, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(149, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(150, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(151, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(152, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(153, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51'),
(154, '629369', '<i class=\"bi bi-exclamation-circle text-warning\"></i>', 'Stock Alert', 'Product stock is less than stock alert', 'product-alert.php', 1, '2023-07-17 10:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categ_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categ_id`, `category_name`, `cat_slug`) VALUES
(1, 'Laptops', 'laptops'),
(2, 'Desktop PC', 'desktop-pc'),
(3, 'Tablets', 'tablets'),
(4, 'Smart Phones', 'Smart Phones'),
(5, 'Mouse', 'Shoes'),
(6, 'Keyboard ', 'Abaya'),
(7, 'Gamepad ', 'Kids Accessories'),
(8, 'USB', 'Home Gadget'),
(9, 'Wrist Watch', 'Watch');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_address`
--

CREATE TABLE `checkout_address` (
  `id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_address`
--

INSERT INTO `checkout_address` (`id`, `user_id`, `address`, `status`, `date_added`) VALUES
(6, 801039, 'No1', 0, '2024-05-25 20:37:24'),
(7, 801039, 'N2', 0, '2024-06-28 19:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_payment_type`
--

CREATE TABLE `checkout_payment_type` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `pay_type` varchar(20) NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `card_expired_date` varchar(20) NOT NULL,
  `card_csv` int(10) NOT NULL,
  `paystatus` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_payment_type`
--

INSERT INTO `checkout_payment_type` (`id`, `user_id`, `pay_type`, `card_number`, `card_name`, `card_expired_date`, `card_csv`, `paystatus`, `status`) VALUES
(4, '801039', 'paystack', '4556 6767 7665 6566', 'ABUBAKAR HARUNA Abdulmalik', '05 / 34', 233, 0, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order`
--

CREATE TABLE `invoice_order` (
  `order_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `invoiceCodex` int(50) NOT NULL,
  `order_date` date NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `cname` varchar(250) NOT NULL,
  `cphoneNumber` varchar(50) NOT NULL,
  `c_state` text NOT NULL,
  `c_address` text NOT NULL,
  `online_cid` int(11) NOT NULL,
  `subTotalx` decimal(10,2) NOT NULL,
  `status` varchar(250) NOT NULL,
  `choice` varchar(50) NOT NULL,
  `r_amount` decimal(10,2) NOT NULL,
  `cchange` decimal(10,2) NOT NULL,
  `fnote` text NOT NULL,
  `tax` varchar(100) NOT NULL,
  `disAmount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_order`
--

INSERT INTO `invoice_order` (`order_id`, `store_id`, `invoiceCodex`, `order_date`, `ctype`, `cname`, `cphoneNumber`, `c_state`, `c_address`, `online_cid`, `subTotalx`, `status`, `choice`, `r_amount`, `cchange`, `fnote`, `tax`, `disAmount`) VALUES
(801, 629369, 280621937, '2024-08-12', 'online', 'Abubakar Sd Harun', '2147483647', 'Ekiti', 'N2', 801039, 22001.60, 'Paid', 'PayStack Gateway', 22001.60, 0.00, '', '0', '0'),
(802, 629369, 234649170, '2024-08-12', 'online', 'Abubakar Sd Harun', '2147483647', 'Ekiti', 'N2', 801039, 22001.60, 'Paid', 'PayStack Gateway', 22001.60, 0.00, '', '0', '0'),
(803, 629369, 968824732, '2024-08-12', 'online', 'Abubakar Sd Harun', '2147483647', 'Ekiti', 'N2', 801039, 22001.60, 'Paid', 'PayStack Gateway', 22001.60, 0.00, '', '0', '0'),
(804, 629369, 888238278, '2024-08-12', 'online', 'Abubakar Sd Harun', '2147483647', 'Ekiti', 'N2', 801039, 22001.60, 'Paid', 'PayStack Gateway', 22001.60, 0.00, '', '0', '0'),
(805, 629369, 10120994, '2024-08-12', 'online', 'Abubakar Sd Harun', '2147483647', 'Kaduna', 'No1', 801039, 40395.00, 'Paid', 'PayStack Gateway', 40395.00, 0.00, '', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item`
--

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `product_code` int(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_purchase`
--

CREATE TABLE `invoice_purchase` (
  `purchase_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `purchase_invoice_code` int(50) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `subTotalx` int(50) DEFAULT NULL,
  `shipping` int(50) DEFAULT NULL,
  `tax` int(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `fnote` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_purchase`
--

INSERT INTO `invoice_purchase` (`purchase_id`, `store_id`, `purchase_invoice_code`, `purchase_date`, `supplier`, `subTotalx`, `shipping`, `tax`, `status`, `fnote`) VALUES
(790, 629369, 535379, '2023-04-28', 4, 2741032, 38830, 1150, 'Received', 'f'),
(792, 629369, 472954, '2023-05-01', 4, 1360653, 553, 150, 'Orderd', 'fg'),
(793, 629369, 369229, '2023-08-01', 6, 76078, 678, 500, 'Orderd', 'ggh');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_purchase_item`
--

CREATE TABLE `invoice_purchase_item` (
  `purchase_item_id` int(11) NOT NULL,
  `purchase_id` int(20) NOT NULL,
  `purchase_invoice_id` int(11) NOT NULL,
  `product_code` int(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `invoice_purchase_item`
--

INSERT INTO `invoice_purchase_item` (`purchase_item_id`, `purchase_id`, `purchase_invoice_id`, `product_code`, `qty`, `price`, `tax`, `subtotal`) VALUES
(75, 790, 535379, 344099, 1, 180000.00, '200', 180270.00),
(76, 790, 535379, 474825, 1, 160000.00, '500', 160580.00),
(77, 790, 535379, 769024, 1, 279.00, '500', 1779.00),
(78, 791, 212031, 344099, 3, 180000.00, '1', 540071.00),
(79, 792, 472954, 344099, 4, 180000.00, '500', 720570.00),
(80, 792, 472954, 474825, 4, 160000.00, '3', 640083.00),
(81, 793, 369229, 750219, 7, 10700.00, '678', 76078.00);

-- --------------------------------------------------------

--
-- Table structure for table `ngn_banks`
--

CREATE TABLE `ngn_banks` (
  `id` int(11) NOT NULL,
  `bank_icon` varchar(50) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `bank_shot_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ngn_banks`
--

INSERT INTO `ngn_banks` (`id`, `bank_icon`, `bank_name`, `bank_shot_name`) VALUES
(1, 'Access_Bank_Nigeria.png', 'Access Bank Nigeria', 'ABN'),
(2, 'First-Bank-logo.png', 'First Bank', 'FB'),
(3, 'jaiz-bank-logo.png', 'jaiz bank', 'Jaiz'),
(4, 'uba.png', 'United Bank of Africa', 'uba');

-- --------------------------------------------------------

--
-- Table structure for table `packaged_orders`
--

CREATE TABLE `packaged_orders` (
  `pid` int(11) NOT NULL,
  `packageID` int(100) NOT NULL,
  `warehouseID` int(50) NOT NULL,
  `storeID` int(100) NOT NULL,
  `orderID` int(100) NOT NULL,
  `total_price` int(100) NOT NULL,
  `order_date` datetime NOT NULL,
  `shipping_time` datetime NOT NULL,
  `approval_status` int(11) NOT NULL,
  `shipping_status` int(11) NOT NULL,
  `customer_received_status` int(11) NOT NULL,
  `customer_recieved_data` datetime NOT NULL,
  `customer_rating` int(50) NOT NULL,
  `data_send` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `prodcode` int(20) NOT NULL,
  `name` text NOT NULL,
  `market_price` double NOT NULL,
  `cost_price` double NOT NULL,
  `fprice` double NOT NULL,
  `stock_alert` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `order_tax` double NOT NULL,
  `pro_details` varchar(500) NOT NULL,
  `pro_discriptions` longtext NOT NULL,
  `date_view` date NOT NULL DEFAULT current_timestamp(),
  `view_counter` int(11) NOT NULL,
  `buy_counter` int(11) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `store_id`, `prodcode`, `name`, `market_price`, `cost_price`, `fprice`, `stock_alert`, `stock`, `order_tax`, `pro_details`, `pro_discriptions`, `date_view`, `view_counter`, `buy_counter`, `add_date`) VALUES
(1, 1, 0, 0, 2342, 'DELL Inspiron 15 7000 15.6', 899, 1500, 0, 3, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(2, 1, 0, 0, 1234, 'MICROSOFT Surface Pro 4 & Typecover - 128 GB', 799, 500, 0, 50, 100, 0, '', '', '2023-01-15', 1, 5, '2021-07-29 00:00:00'),
(3, 1, 0, 0, 4232, 'DELL Inspiron 15 5000 15.6', 599, 1000, 0, 6, 100, 0, '', '', '2023-01-15', 1, 4, '2021-07-29 00:00:00'),
(4, 1, 0, 0, 7633, 'LENOVO Ideapad 320s-14IKB 14\" Laptop - Grey', 399, 700, 0, 2, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(5, 3, 0, 0, 5634, 'APPLE 9.7\" iPad - 32 GB, Gold', 339, 750, 0, 6, 100, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(6, 1, 0, 0, 9984, 'DELL Inspiron 15 5000 15', 449.99, 500, 0, 5, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(7, 3, 0, 0, 0, 'APPLE 10.5\" iPad Pro - 64 GB, Space Grey (2017)', 619, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(8, 1, 0, 0, 0, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', 549.99, 0, 0, 7, 100, 0, '', '', '2023-01-15', 4, 0, '2021-07-29 00:00:00'),
(9, 2, 0, 0, 0, 'PC SPECIALIST Vortex Core Lite Gaming PC', 599.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(10, 2, 0, 0, 0, 'DELL Inspiron 5675 Gaming PC - Recon Blue', 599.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(11, 2, 0, 0, 0, 'HP Barebones OMEN X 900-099nn Gaming PC', 489.98, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(12, 2, 0, 0, 0, 'ACER Aspire GX-781 Gaming PC', 749.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(13, 2, 0, 0, 0, 'HP Pavilion Power 580-015na Gaming PC', 799.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(14, 2, 0, 0, 0, 'LENOVO Legion Y520 Gaming PC', 899.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 3, 0, '2021-07-29 00:00:00'),
(15, 2, 0, 0, 0, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', 999.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(16, 2, 0, 0, 0, 'PC SPECIALIST Vortex Core II Gaming PC', 649.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(17, 3, 0, 0, 0, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', 49.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 4, 0, '2021-07-29 00:00:00'),
(18, 3, 0, 0, 0, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 16 GB, Black', 79.99, 0, 0, 10, 100, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(19, 3, 0, 0, 0, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 32 GB, Black', 99.99, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(20, 3, 0, 0, 0, 'APPLE 9.7\" iPad - 32 GB, Space Grey', 339, 0, 0, 0, 100, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(27, 1, 0, 0, 0, 'Dell XPS 15 9560', 1599, 0, 0, 0, 100, 0, '', '', '2023-01-15', 9, 0, '2021-07-29 00:00:00'),
(91, 1, 2, 629369, 344099, '15.6\" PA156 Laptop Computer Win10 Intel N5095 16G 128G/256G/512G Notebook Netbook Backlit Keyboard WIFI HD BT4.0 USB3.0 3.0MP', 170000, 180000, 5000, 50, 100, 70, '', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i13.28af439eU0nIWd\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i15.28af439eU0nIWd\">Keyboards:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Backlit Keyboard\">Backlit Keyboard</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery Capacity?mAh?:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4500\">4500</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Network Communiction:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LAN,WIFI\">LAN,WIFI</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Touch Screen:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Expandable storage:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"YES\">YES</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Interface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"M.2\">M.2</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"DDR4\">DDR4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thermal Design Power:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5W\">5W</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Brand:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel\">Intel</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphic Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Integrated\">Integrated</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Max Turbo Frequency:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2.9\">2.9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Base Frequency (GHz)4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2.0\">2.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Cores:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4\">4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery lifetime:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"up to 4 - 6 hour\">up to 4 - 6 hour</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard language:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"English\">English</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard backlit type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Monochrome\">Monochrome</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Interfaces:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wi-Fi 4 (802.11n 2,4 GHz / 5 GHz)\">Wi-Fi 4 (802.11n 2,4 GHz / 5 GHz)</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen surface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"MATT\">MATT</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">CPU Brand/Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Celeron N5100\">Intel Celeron N5100</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Weight (Battery Included):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;2.0Kg\">&ge;2.0Kg</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen Refresh Rate:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"60Hz\">60Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Video Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"12GB\">12GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Dimensions (WxHxD):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"360*238*18mm\">360*238*18mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Body Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RAM:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"12GB\">12GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1080\">1920x1080</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth,Camera,Backlit Keyboard\">bluetooth,Camera,Backlit Keyboard</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Average Battery Life(in hours):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4-5 hours\">4-5 hours</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thickness:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15mm- 18mm\">15mm- 18mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"512GB\">512GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2*USB3.0\">2*USB3.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Ratio:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16:9\">16:9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Optical Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"None\">None</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15.6&quot;\">15.6\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Card Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Ultra HD Graphics 600\">Intel Ultra HD Graphics 600</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Slim Laptop\">Slim Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SZCHENXIN\">SZCHENXIN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Black\">Black</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16G+128G/256G/512G\">16G+128G/256G/512G</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LED Lights\">LED Lights</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Front 3.0MP\">Front 3.0MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth4.0\">Bluetooth4.0</span></li>\n</ul>', '2023-04-06', 0, 5, '2023-04-06 14:56:06'),
(92, 1, 1, 629369, 474825, '10.1 inch IPS 1920*1200 Pipo W10 2 in 1 Tablet PC Win10 6G RAM 64G ROM Celeron N4120 Quad-core WIFI BT 5.0 HD Computer Netbook', 150000, 160000, 400, 50, 100, 80, '', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i13.135614eawi32kM\">Second Webcam Pixels:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Front Webcam Pixels:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2MP\">2MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Standby Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"36\">36</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Working Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6-7\">6-7</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3-4\">3-4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery lifetime:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15000 - 20000H\">15000 - 20000H</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Google Play:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Second Webcam,Front Webcam Pixels\">Second Webcam,Front Webcam Pixels</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Net Weight:&nbsp;</span><span class=\"property-desc line-limit-length\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer; display: inline-block; max-width: inherit; font-size: 14px; color: #151515; vertical-align: bottom;\" title=\"&gt;500g\">&gt;500g</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Cell Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4000mAh\">4000mAh</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Extend Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB,Earphone Jack,TF card\">USB,Earphone Jack,TF card</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Tablet Storage Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"64GB\">64GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Core:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Quad Core\">Quad Core</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10.1&quot;\">10.1\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ULTRA SLIM,Dual Cameras\">ULTRA SLIM,Dual Cameras</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6GB\">6GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Celeron\">Intel Celeron</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Touch Screen Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Capacitive Screen\">Capacitive Screen</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1200\">1920x1200</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Manufacture:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel\">Intel</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Network&nbsp;:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"WIFI\">WIFI</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Supporting Language:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"English,Russian,Spanish,Swedish,Portuguese,Turkish,Italian,German,Chinese,French,Japanese,Polish,Ukrainian,Greek,Hebrew\">English,Russian,Spanish,Swedish,Portuguese,Turkish,Italian,German,Chinese,French,Japanese,Polish,Ukrainian,Greek,Hebrew</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SZCHENXIN\">SZCHENXIN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">szchenxin Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"W10\">W10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Item Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Tablet PC\">Tablet PC</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Front 2MP Back 5MP\">Front 2MP Back 5MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Black_Dark Blue ( Metal Back Cover )\">Black_Dark Blue ( Metal Back Cover )</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6G RAM 64G ROM\">6G RAM 64G ROM</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"BT5.0\">BT5.0</span></li>\n</ul>', '2023-04-06', 2, 6, '2023-04-06 14:59:54'),
(93, 1, 1, 629369, 769024, '15.6Inch For Intel i5-6200U Gaming laptop 256GB SSD IPS Screen Keyboard Backlight Fingerprint Unlock game Notebook', 269696.39, 279, 6000, 50, 91, 1000, '', '<div class=\"instore-info-container\">\n<div class=\"instore-info-rcmds\">\n<div class=\"simple-card-container\">\n<div class=\"simple-card-price\">&nbsp;307,381.30</div>\n</div>\n<div class=\"simple-card-container\">\n<div class=\"img-container\"><a href=\"https://www.aliexpress.com/item/1005004564998075.html?gps-id=pcDetailBottomMoreThisSeller&amp;scm=1007.13339.291025.0&amp;scm_id=1007.13339.291025.0&amp;scm-url=1007.13339.291025.0&amp;pvid=988a4d27-0fdc-44db-898c-a6491fe71aa7&amp;_t=gps-id:pcDetailBottomMoreThisSeller,scm-url:1007.13339.291025.0,pvid:988a4d27-0fdc-44db-898c-a6491fe71aa7,tpp_buckets:668%232846%238115%232000&amp;pdp_npi=3%40dis%21NGN%21346822.98%21339888.18%21%21%21%21%21%402101ead816807895106953934eb3a4%2112000029639497737%21rec%21NG%212334966288\"><img class=\"simple-card-img\" src=\"https://ae01.alicdn.com/kf/S7ddcbfdc21a5469ca53e56ca38f3f755N/5700U-15-6-Inch-AMD-Ryzen-7-5700U-Gaming-Laptops-Max-Ram-64GB-DDR4-MAX-Rom.jpg_480x480q90.jpg_.webp\" alt=\"5700U 15.6 Inch AMD Ryzen 7 5700U Gaming Laptops Max Ram 64GB DDR4 MAX Rom 4TB SSD Windows10 11 Pro Notebook Bluetooth WIFI\" /></a></div>\n<div class=\"simple-card-price\">NGN 339,888.18</div>\n</div>\n<div class=\"simple-card-container\">\n<div class=\"img-container\"><a href=\"https://www.aliexpress.com/item/1005002542016167.html?gps-id=pcDetailBottomMoreThisSeller&amp;scm=1007.13339.291025.0&amp;scm_id=1007.13339.291025.0&amp;scm-url=1007.13339.291025.0&amp;pvid=988a4d27-0fdc-44db-898c-a6491fe71aa7&amp;_t=gps-id:pcDetailBottomMoreThisSeller,scm-url:1007.13339.291025.0,pvid:988a4d27-0fdc-44db-898c-a6491fe71aa7,tpp_buckets:668%232846%238115%232000&amp;pdp_npi=3%40dis%21NGN%21376494.14%21338846.11%21%21%21%21%21%402101ead816807895106953934eb3a4%2112000021066804943%21rec%21NG%212334966288\"><img class=\"simple-card-img\" src=\"https://ae01.alicdn.com/kf/H993453a9db46429d8637b4b07406d515A/15-6-Intel-Core-I5-I7-1065G7-Touch-Bar-Laptop-16GB-128GB-256GB-512GB-1T-SSD.jpg_480x480q90.jpg_.webp\" alt=\"15.6&quot; Intel Core I5 I7-1065G7 Touch Bar Laptop 16GB 128GB/256GB/512GB/1T SSD Windows 10 Backlit keyboard 2.4G+5G Wifi Laptops\" /></a></div>\n<div class=\"simple-card-price\">NGN 338,846.11</div>\n</div>\n</div>\n</div>\n<div class=\"product-detail-tab\">\n<div class=\"detail-extend-tab\">\n<div class=\"detail-tab-bar\">\n<ul class=\"tab-lists avoid-user-select\">\n<li class=\"tab-item\" data-aplus-clk=\"x4_49f4bf94\" data-spm-anchor-id=\"a2g0o.detail.0.i3.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\">DESCRIPTION</span></div>\n</li>\n<li class=\"tab-item\" data-aplus-clk=\"x5_364399e5\" data-spm-anchor-id=\"a2g0o.detail.0.i4.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\">CUSTOMER REVIEWS<span class=\"fdbc-num\">&nbsp;(0)&lrm;</span></span></div>\n</li>\n<li class=\"tab-item active\" data-aplus-clk=\"x6_9a85dd3\" data-spm-anchor-id=\"a2g0o.detail.0.i5.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\" data-spm-anchor-id=\"a2g0o.detail.0.i10.11261d582kFN2A\">SPECIFICATIONS</span></div>\n</li>\n</ul>\n</div>\n<div class=\"tab-content\">\n<div>&nbsp;</div>\n<div>\n<div class=\"product-specs\" data-pl=\"product-specs\">\n<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.11261d582kFN2A\">CPU Brand/Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Core i5-6200U\">Intel Core i5-6200U</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Weight (Battery Included):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;2.0Kg\">&ge;2.0Kg</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen Refresh Rate:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"60Hz\">60Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Video Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Main memory allocated memory\">Main memory allocated memory</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Dimensions (WxHxD):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"375*245*22mm\">375*245*22mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Body Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Metal\">Metal</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RAM:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"8GB\">8GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1080\">1920x1080</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Average Battery Life(in hours):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4-6 hours\">4-6 hours</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thickness:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;20mm\">&ge;20mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"512GB\">512GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Card Reader,3.5 mm Audio Jack,2*USB3.0,HDMI,RJ-45\">Card Reader,3.5 mm Audio Jack,2*USB3.0,HDMI,RJ-45</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Ratio:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16:9\">16:9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Optical Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"None\">None</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15.6&quot;\">15.6\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Card Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel HD Graphics 620\">Intel HD Graphics 620</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Laptop\">Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"BOBARRY\">BOBARRY</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Item Condition:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"New\">New</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Model Number:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"i5 6200U\">i5 6200U</span></li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n</div>', '2023-04-06', 3, 1, '2023-04-06 15:06:48'),
(94, 1, 1, 629369, 750219, 'KOOTION X15 M.2 SSD 256GB 512GB 1TB SSD Solid State Drive M2 SSD M.2 NVMe PCIe Internal Hard Disk For Laptop Desktop MSI Dell HP', 10600, 10700, 50, 50, 96, 500, '', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.59406fe4UTsPnt\">Max Sequential Write:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2100Mbps\">2100Mbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Max Sequential Read:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3000Mbps\">3000Mbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Transport Protocol:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NVME\">NVME</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bus Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCIe 3.0x4\">PCIe 3.0x4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RGB:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"YES\">YES</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Cooling Fin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Nand Flash Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"TLC\">TLC</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Controller:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"other\">other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCI-E\">PCI-E</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCI Express,M.2 2280,M.2 (M)\">PCI Express,M.2 2280,M.2 (M)</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Application:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Desktop,Laptop\">Desktop,Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"KOOTION\">KOOTION</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Internal\">Internal</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n</ul>', '2023-04-06', 7, 3, '2023-04-06 15:10:33'),
(95, 7, 1, 629369, 639775, 'USB C to Dual HDMI-Compatible VGA, USB C Hub Docking Station Dual Monitors For Dell XPS HP Elitebook Lenovo Acer Chromebook Asus', 6407.79, 7000.8, 200, 20, 92, 58, '', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.4fc55040sV9rAj\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Length:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10cm\">10cm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Width:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5inch\">5inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Aluminum\">Aluminum</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Model Number:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ZU-5IN1\">ZU-5IN1</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ZUIDID\">ZUIDID</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE,FCC,RoHS\">CE,FCC,RoHS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Laptop Docking Stations\">Laptop Docking Stations</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Gray\">Gray</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Aluminum,Aluminum alloy\">Aluminum,Aluminum alloy</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"58mm*52mm*12mm/2.28*2.05*0.47inch\">58mm*52mm*12mm/2.28*2.05*0.47inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Length of Cable:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"100mm/3.94inch\">100mm/3.94inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB Type C male port\">USB Type C male port</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-1:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"HDMI max support 4K 30Hz\">HDMI max support 4K 30Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-2:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"HDMI max support 4K 30Hz\">HDMI max support 4K 30Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-3:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB Type C PD Charging Port\">USB Type C PD Charging Port</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB 3.0, Speed up to 5Gbps\">USB 3.0, Speed up to 5Gbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-5:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"VGA max support 1080p 60Hz\">VGA max support 1080p 60Hz</span></li>\n</ul>', '2023-04-06', 4, 0, '2023-04-06 15:28:16'),
(96, 4, 8, 629369, 316449, '2023 New Global Version i13 Pro Max 6.7 Inch Smartphones 16GB+512G 5000mAh 5G Network Unlock Cell Phone Dual SIM Android Phone', 33682.65, 38682.65, 1000, 50, 100, 600, '', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i12.4bb958baCjAfkH\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Phones\">Phones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"FANHUN\">FANHUN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n</ul>', '2023-04-06', 2, 0, '2023-04-06 15:33:19'),
(100, 7, 1, 629369, 865033, '2023 new i7s TWS Wireless Bluetooth Headset Bluetooth 5.0 In-ear Sports Headset with microphone for Xiaomi Android iphone Huawei', 3000, 4000, 200, 50, 92, 50, '', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.931d165cLW370u\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Category:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Earphones &amp; Headphones\">Earphones &amp; Headphones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Method:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Charging case\">Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package List:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"User Manual,Charger,Charging case\">User Manual,Charger,Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Is wireless:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Waterproof:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Active Noise-Cancellation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Volume Control:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Control Button:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Vocalism Principle:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Communication:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wireless\">Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"In-ear\">In-ear</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LS\">LS</span></li>\n</ul>', '2023-04-06', 2, 0, '2023-04-06 17:44:56'),
(101, 7, 1, 629369, 211818, '2023 new X10P TWS Wireless Bluetooth Headset 9D Stereo Game Fever Earplug waterproof band 3500mAh mobile power for smart phones', 5000, 6000, 200, 50, 97, 10, '', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.5a1244181n4r2n\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Category:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Earphones &amp; Headphones\">Earphones &amp; Headphones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Method:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Charging case\">Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Impedance Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"up to 32 ?\">up to 32 ?</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth Version:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5.0\">5.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package List:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"User Manual,Charger,Charging case\">User Manual,Charger,Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Codecs:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NONE\">NONE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">With Microphone:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Is wireless:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support APP:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support Memory Card:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Waterproof:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Resistance:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"32&Omega;\">32&Omega;</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Line Length:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"0m\">0m</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Frequency Response Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"20 - 20000Hz\">20 - 20000Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Sensitivity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"120dB\">120dB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Plug Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NONE\">NONE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Function:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"for Video Game,Common Headphone,Sport,For Mobile Phone\">for Video Game,Common Headphone,Sport,For Mobile Phone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Active Noise-Cancellation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Volume Control:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Control Button:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Vocalism Principle:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Connectors:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Lightning\">Lightning</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Communication:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wireless\">Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Ear Hook\">Ear Hook</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LS\">LS</span></li>\n</ul>', '2023-04-06', 7, 0, '2023-04-06 17:49:05');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `store_id`, `prodcode`, `name`, `market_price`, `cost_price`, `fprice`, `stock_alert`, `stock`, `order_tax`, `pro_details`, `pro_discriptions`, `date_view`, `view_counter`, `buy_counter`, `add_date`) VALUES
(102, 1, 1, 629369, 256143, 'Wireless Mouse Bluetooth RGB Rechargeable Mouse Wireless Computer Silent Mause LED Backlit Ergonomic Gaming Mouse For Laptop PC', 5000, 7000, 500, 50, 97, 100, '', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.324052072FEAMS\">Time to market:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"May-13\">May-13</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Gross Weight:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"0.15g\">0.15g</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operation Mode:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Opto-electronic\">Opto-electronic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Power Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Rechargeable\">Rechargeable</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Buttons:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4\">4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Rollers:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1 pcs\">1 pcs</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hand Orientation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Right\">Right</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3D,Mini\">3D,Mini</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">DPI:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1600\">1600</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth Wireless\">Bluetooth Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"kankeirr\">kankeirr</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Application:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"For laptop, desktop,office use\">For laptop, desktop,office use</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wi-Fi Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10m\">10m</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature1:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"silent mouse,noiseless mouse,mouse gaming\">silent mouse,noiseless mouse,mouse gaming</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature2:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wifi mouse,wireless mouse rechargeable\">wifi mouse,wireless mouse rechargeable</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature3:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless computer mouse,usb mouse,USB mice\">wireless computer mouse,usb mouse,USB mice</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"mause usb pc,Mouse Wireless,USB Mice\">mause usb pc,Mouse Wireless,USB Mice</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature5:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"optical mouse,wireless rechargeable mouse\">optical mouse,wireless rechargeable mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature6:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth mouse,mouse bluetooth,laptop mouse\">Bluetooth mouse,mouse bluetooth,laptop mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature7:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless mouse rgb, mouse wireless rgb\">wireless mouse rgb, mouse wireless rgb</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature8:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"RGB Rechargeable Mouse,RGB Computer mouse\">RGB Rechargeable Mouse,RGB Computer mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature9:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"computer mouse .wireless mouse computer\">computer mouse .wireless mouse computer</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature10:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless mause rgb,laptop accessories\">wireless mause rgb,laptop accessories</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Drop shipping\">Drop shipping</span></li>\n</ul>', '2023-04-06', 2, 0, '2023-04-06 18:06:00'),
(103, 6, 2, 629369, 879669, 'Wireless Keyboard Only Cover for Logitech K380 Wireless Colorful US Soft Silicone Film Case Slim Thin in Korean / English', 3500, 5700, 1000, 50, 100, 200, '', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i12.2bb6c83fqTYFlj\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Function:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Dustproof,waterproof\">Dustproof,waterproof</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Silicone\">Silicone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Products Status:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"STOCK\">STOCk</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ONLENY\">ONLENY</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Silicone\">Silicone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Multiple colour\">Multiple colour</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Shape:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"A variety of styles\">A variety of styles</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 18:10:12'),
(115, 1, 1, 629369, 281041, '10 Steps Laptop Stand', 3399, 5000, 4500, 20, 100, 500, '', '<header class=\"-pvs -bb\">\n<h2 class=\"-fs20 -m -phm -pvxs\">Product details</h2>\n</header>\n<div class=\"markup -mhm -pvl -oxa -sc\">Product Description:<br />Introducing our innovative and optimized laptop stand, designed to enhance your typing experience and provide ultimate stability. Our stand features silicone anti-slip pads that enhance friction and prevent slipping, ensuring high-frequency typing without any shaking or falling off.<br />The hollow heat dissipation design promotes air circulation, allowing for faster heat dissipation and creating a comfortable environment for both work and entertainment.<br />With its ergonomic design, our stand improves sitting posture by raising the equipment and adjusting the perspective. This helps keep the cervical spine relaxed, reducing strain on the waist and making your office experience more comfortable.<br />Our stand offers 10 levels of angle adjustment, catering to users of different heights. It has a minimum support height of 80mm and a maximum support height of 195mm, ensuring there is always a height that suits your perspective.<br />The stand is expandable and fully supports oversized laptops, providing stability like a mountain even during intense typing sessions.<br />In addition to its innovative features, our stand is also highly portable. Its foldable design allows for easy storage in a bag, making it as compact as a folding fan.<br />Features:<br />Enlarged and widened size for stronger compatibility with 10-17 inch laptops and tabletsTen-level height adjustment for a wider range of adaptationAnti-slip design with silicone pads for stable placement and no shaking or falling offLightweight and easy to carry, weighing only 0.2kgMade of high-quality materials for durability and stabilityAdjustable viewing angle for personalized comfortDouble triangle support design for enhanced stabilityHollow bottom for efficient heat dissipation and increased air circulationFoldable and portable, comes with a storage bag for easy carrying and storageSuitable for most laptops and tabletsIdeal for various environments, including offices and homesSpecifications:<br />Color: whiteAdjustable: YesPackage includes: 1 laptop stand and 1 storage bag</div>', '2024-05-21', 3, 0, '2024-05-21 08:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`brand_id`, `brand_name`, `date_add`) VALUES
(1, 'HP', '2023-01-13 01:26:22'),
(2, 'Lenovo', '2023-01-13 01:26:22'),
(3, 'Canon', '2023-04-08 12:13:48'),
(4, 'Dell', '2023-04-08 12:13:48'),
(5, 'LG', '2023-04-08 12:14:37'),
(6, 'oraimo', '2023-04-08 12:14:37'),
(7, 'SAMSUNG ', '2023-04-08 12:15:51'),
(8, 'Apple', '2023-04-08 12:15:51'),
(9, 'Tecno', '2023-04-08 12:16:08'),
(10, 'Infinix', '2023-04-08 12:16:08'),
(11, 'Itel', '2023-04-08 12:16:32'),
(12, 'Opo', '2023-04-08 12:16:32'),
(13, 'Philips', '2023-04-08 12:16:57'),
(14, 'Sharp', '2023-04-08 12:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `id` int(11) NOT NULL,
  `storeID` int(20) NOT NULL,
  `product_id` int(30) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `img_structure` varchar(50) NOT NULL,
  `date_post` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_img`
--

INSERT INTO `product_img` (`id`, `storeID`, `product_id`, `image_name`, `img_structure`, `date_post`) VALUES
(225, 629369, 344099, 'd4966e9754.webp', '', '2023-04-06 14:56:57'),
(226, 629369, 344099, 'e488041f49.webp', '', '2023-04-06 14:56:57'),
(227, 629369, 344099, 'bf450caaa7.webp', '', '2023-04-06 14:56:57'),
(228, 629369, 474825, '10c7336128.webp', '', '2023-04-06 15:02:48'),
(229, 629369, 474825, '05a6cd6b2d.webp', '', '2023-04-06 15:02:48'),
(230, 629369, 474825, 'c8cac1d7a3.webp', '', '2023-04-06 15:02:48'),
(231, 629369, 474825, '31846fc1fc.webp', '', '2023-04-06 15:02:48'),
(232, 629369, 474825, '2014dd38b6.webp', '', '2023-04-06 15:02:48'),
(233, 629369, 474825, '6461dc4dd0.webp', '', '2023-04-06 15:02:48'),
(234, 629369, 769024, '39e57f4d20.webp', '', '2023-04-06 15:09:13'),
(235, 629369, 769024, '5c75952d7d.webp', '', '2023-04-06 15:09:13'),
(236, 629369, 769024, 'b976610d74.webp', '', '2023-04-06 15:09:13'),
(237, 629369, 769024, '56e0a5cec9.webp', '', '2023-04-06 15:09:13'),
(238, 629369, 769024, '7ca77cd9d9.webp', '', '2023-04-06 15:09:13'),
(239, 629369, 750219, 'b018a65eff.jpg', '', '2023-04-06 15:17:27'),
(240, 629369, 750219, '39ec9ee4f7.jpg', '', '2023-04-06 15:17:27'),
(241, 629369, 750219, '0711db485d.jpg', '', '2023-04-06 15:17:27'),
(242, 629369, 750219, '9bda56facf.jpg', '', '2023-04-06 15:17:27'),
(243, 629369, 750219, '3da4de8e14.jpg', '', '2023-04-06 15:17:27'),
(245, 629369, 639775, 'f47719de67.webp', '', '2023-04-06 15:30:06'),
(247, 629369, 639775, '2285df3292.webp', '', '2023-04-06 15:30:06'),
(248, 629369, 639775, '4828b680f0.webp', '', '2023-04-06 15:30:06'),
(249, 629369, 316449, '7bd2f773c9.webp', '', '2023-04-06 15:36:02'),
(250, 629369, 316449, 'b960103f27.webp', '', '2023-04-06 15:36:02'),
(251, 629369, 316449, 'f1c106a613.webp', '', '2023-04-06 15:36:02'),
(252, 629369, 316449, 'f050d19a1b.webp', '', '2023-04-06 15:36:02'),
(259, 629369, 865033, '7a848dda66.webp', '', '2023-04-06 17:46:39'),
(260, 629369, 865033, '6add6e536f.webp', '', '2023-04-06 17:46:39'),
(261, 629369, 865033, '4c520008be.webp', '', '2023-04-06 17:46:39'),
(262, 629369, 865033, '6fd05f0678.webp', '', '2023-04-06 17:46:39'),
(263, 629369, 865033, 'c5836e61b0.webp', '', '2023-04-06 17:46:39'),
(264, 629369, 211818, 'b3ab78a757.webp', '', '2023-04-06 17:50:36'),
(265, 629369, 211818, '76e84bc02f.webp', '', '2023-04-06 17:50:36'),
(266, 629369, 211818, '9efb3d1741.webp', '', '2023-04-06 17:50:36'),
(267, 629369, 211818, '5e1cc4a3e4.webp', '', '2023-04-06 17:50:36'),
(268, 629369, 211818, 'f963152a38.webp', '', '2023-04-06 17:50:36'),
(269, 629369, 211818, '67a43612cc.webp', '', '2023-04-06 17:50:36'),
(270, 629369, 256143, '6a38e4edaa.webp', '', '2023-04-06 18:06:38'),
(271, 629369, 256143, 'ec57e256c4.webp', '', '2023-04-06 18:06:38'),
(272, 629369, 256143, '09bdde8fe9.webp', '', '2023-04-06 18:06:38'),
(273, 629369, 256143, 'aaf61645f8.webp', '', '2023-04-06 18:06:38'),
(274, 629369, 256143, 'bc33412f05.webp', '', '2023-04-06 18:06:38'),
(276, 629369, 879669, '039453cefa.webp', '', '2023-04-06 18:11:23'),
(277, 629369, 879669, '16a14c4feb.webp', '', '2023-04-06 18:11:23'),
(278, 629369, 879669, '11c529d22d.webp', '', '2023-04-06 18:11:23'),
(279, 629369, 879669, '703bfc5a2b.webp', '', '2023-04-06 18:11:23'),
(280, 629369, 879669, '91cf8ce987.webp', '', '2023-04-06 18:11:23'),
(285, 629369, 639775, '27c212b3f0.webp', '', '2023-04-08 12:11:53'),
(286, 629369, 639775, '5d1815ea05.webp', '', '2023-04-08 12:11:53'),
(287, 629369, 316449, '41514379e0.webp', '', '2023-04-08 12:19:49'),
(288, 629369, 316449, '6302eca793.webp', '', '2023-04-08 12:19:49'),
(289, 629369, 879669, 'c7f44d506e.webp', '', '2023-04-08 15:50:34'),
(306, 629369, 281041, '612cc2d951.jpg', '', '2024-05-21 08:36:32'),
(307, 629369, 281041, '63dd7baab3.jpg', '', '2024-05-21 08:36:32'),
(308, 629369, 281041, '8f19044965.jpg', '', '2024-05-21 08:36:32'),
(309, 629369, 281041, '4fb96d2e30.jpg', '', '2024-05-21 08:36:32'),
(310, 629369, 281041, '42c71b53e3.jpg', '', '2024-05-21 08:36:32'),
(311, 629369, 281041, '049c172630.jpg', '', '2024-05-21 08:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_qty`
--

CREATE TABLE `product_qty` (
  `id` int(11) NOT NULL,
  `vendorID` varchar(20) NOT NULL,
  `productID` varchar(50) NOT NULL,
  `stockQTY` int(100) NOT NULL,
  `alertqty` int(100) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_qty`
--

INSERT INTO `product_qty` (`id`, `vendorID`, `productID`, `stockQTY`, `alertqty`, `status`, `date_added`) VALUES
(148, '629369', '750219', 2, 50, 1, '2023-07-17 10:52:51'),
(149, '629369', '639775', 0, 20, 1, '2023-07-17 10:52:51'),
(150, '629369', '316449', 0, 50, 1, '2023-07-17 10:52:51'),
(151, '629369', '865033', 0, 50, 1, '2023-07-17 10:52:51'),
(152, '629369', '211818', 0, 50, 1, '2023-07-17 10:52:51'),
(153, '629369', '256143', 0, 50, 1, '2023-07-17 10:52:51'),
(154, '629369', '879669', 0, 50, 1, '2023-07-17 10:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `discount` int(50) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `max_usage` int(11) DEFAULT NULL,
  `current_usage` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `code`, `discount`, `valid_from`, `valid_to`, `max_usage`, `current_usage`) VALUES
(1, '456435', 10, '2023-09-23', '2023-09-28', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `retailers_db`
--

CREATE TABLE `retailers_db` (
  `id` int(11) NOT NULL,
  `adminId` int(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(50) NOT NULL,
  `store_postion` varchar(50) NOT NULL,
  `staff` int(100) NOT NULL,
  `origine_state` varchar(100) NOT NULL,
  `state_lga` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `position` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` int(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retailers_db`
--

INSERT INTO `retailers_db` (`id`, `adminId`, `fname`, `sname`, `img`, `email`, `phone`, `store_postion`, `staff`, `origine_state`, `state_lga`, `address`, `position`, `password`, `code`, `status`) VALUES
(1, 8768, 'Sd', 'Haruna', 'user.png', 'abubakarsd.harunasadiq@gmail.com', 2147483647, 'owner', 6, 'Adamawa', 'Ganye', 'wagi street Anambra', 'admin', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified'),
(3, 831247, 'Ishhaq', 'Jamilu', 'user.png', 'ismeeboy@gmail.com', 2147483647, 'owner', 3, 'FCT', 'Gwagwalada', 'wagi street Anambra', '2', '$2y$10$9LTSL0sPewQWUFwRzEEXOO8xjDNRRcjcy9iRqUW4liZ7U9hiy/v2G', 0, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_info`
--

CREATE TABLE `shipping_info` (
  `id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `shipping_method` int(11) NOT NULL,
  `phone_number` int(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip_code` int(50) NOT NULL,
  `map_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_info`
--

INSERT INTO `shipping_info` (`id`, `user_id`, `shipping_method`, `phone_number`, `state`, `address`, `zip_code`, `map_url`) VALUES
(2, 801039, 1, 2147483647, 'Kaduna', 'No1', 3434434, 'https://www.google.com/maps?q=9.060352,7.4481664');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `vendorID` int(50) NOT NULL,
  `storeID` int(50) NOT NULL,
  `storeName` varchar(100) NOT NULL,
  `storeTyple` varchar(50) NOT NULL,
  `storeEmail` varchar(255) NOT NULL,
  `StorePhone` varchar(50) NOT NULL,
  `storeState` varchar(50) NOT NULL,
  `storeCity` varchar(50) NOT NULL,
  `LGA` varchar(50) NOT NULL,
  `storeAddress` varchar(255) NOT NULL,
  `storeLink` varchar(500) NOT NULL,
  `storeFB` varchar(255) NOT NULL,
  `storeTW` varchar(255) NOT NULL,
  `storeINS` varchar(255) NOT NULL,
  `cac_eg_number` varchar(100) NOT NULL,
  `nin_number` int(100) NOT NULL,
  `guarantors_name` varchar(100) NOT NULL,
  `phone_number` int(50) NOT NULL,
  `store_position` varchar(50) NOT NULL,
  `guarantors_nin` int(100) NOT NULL,
  `gstate_of_Origin` varchar(50) NOT NULL,
  `glga` varchar(50) NOT NULL,
  `store_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `vendorID`, `storeID`, `storeName`, `storeTyple`, `storeEmail`, `StorePhone`, `storeState`, `storeCity`, `LGA`, `storeAddress`, `storeLink`, `storeFB`, `storeTW`, `storeINS`, `cac_eg_number`, `nin_number`, `guarantors_name`, `phone_number`, `store_position`, `guarantors_nin`, `gstate_of_Origin`, `glga`, `store_active`) VALUES
(1, 8768, 629369, 'Blessed Obino Computer', 'sales', 'Obino@gmail.com', '08036484114', 'Kaduna', 'Zaria', 'Sabon Gari', 'Kowa store, Opposite ABU north gate, Samaru Zaria.', 'http://localhost:8081/inewton/admin/info-settings.php', 'facebook.com', 'twitter.com', 'instagram.com', '54643634634', 4534532, 'Mr Mga', 23423432, 'owner', 2147483647, 'Kaduna', 'Sabon Gari', 2),
(2, 87688, 475696, '', '', '', '', '', '', '', '', '', '', '', '', '76546686', 22545865, 'Mr Mga', 7087567, 'share holder', 675746, 'Kaduna', 'Sabon Gari', 2),
(3, 831247, 564625, 'Inewton Electronics Services', 'sales', 'inewton@gmail.com', '08145665011', 'Kaduna', '', '', 'No 10 wall Road, Danraka Samaru, Zaria', 'googlemap.com', 'facebook.com/user', 'twitter.com/user', 'instaram.com/user', '8455775734', 2147483647, 'Mr Mga', 54645344, 'share holder', 2147483647, 'Jigawa', 'Kaugama', 2);

-- --------------------------------------------------------

--
-- Table structure for table `store_buyers`
--

CREATE TABLE `store_buyers` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `buyingCount` int(11) NOT NULL,
  `date_buy` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_buyers`
--

INSERT INTO `store_buyers` (`id`, `buyer_id`, `store_id`, `buyingCount`, `date_buy`) VALUES
(8, 801039, 629369, 5, '2024-08-12 19:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

CREATE TABLE `store_orders` (
  `ordersid` int(11) NOT NULL,
  `order_code` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_price` int(50) NOT NULL,
  `taxes_amt` int(50) NOT NULL,
  `discount_amt` int(50) NOT NULL,
  `pay_status` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `packag_status` int(11) NOT NULL,
  `date_order` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_orders`
--

INSERT INTO `store_orders` (`ordersid`, `order_code`, `user_id`, `product_id`, `qty`, `product_price`, `taxes_amt`, `discount_amt`, `pay_status`, `order_status`, `packag_status`, `date_order`) VALUES
(82, 8431032, 801039, 769024, 5, 279, 0, 0, 1, 0, 0, '2024-08-12 19:53:46'),
(83, 6163292, 801039, 211818, 3, 6000, 0, 0, 1, 0, 0, '2024-08-12 19:54:06'),
(84, 2197870, 801039, 256143, 3, 7000, 0, 0, 1, 0, 0, '2024-08-12 19:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `store_rating`
--

CREATE TABLE `store_rating` (
  `ratID` int(11) NOT NULL,
  `store_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `order_id` int(50) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `store_stars` int(50) NOT NULL,
  `store_rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_supplier`
--

CREATE TABLE `store_supplier` (
  `sup_id` int(11) NOT NULL,
  `store_id` int(20) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_email` varchar(100) NOT NULL,
  `supplier_phone` varchar(50) NOT NULL,
  `supplier_country` varchar(50) NOT NULL,
  `supplier_city` varchar(50) NOT NULL,
  `discrict` varchar(50) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `sup_date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_supplier`
--

INSERT INTO `store_supplier` (`sup_id`, `store_id`, `supplier_name`, `supplier_email`, `supplier_phone`, `supplier_country`, `supplier_city`, `discrict`, `supplier_address`, `sup_date_add`) VALUES
(4, 629369, 'ABUBAKAR HARUNA Abdulmalik', 'abubakarsd.harunasadiq@gmail.com', '09068008764', 'Nigeria', 'Lagos', 'Ijo', 'No 57 Use, Abuja, Nigeria', '2023-05-02 21:32:08'),
(6, 629369, 'Nelson Banisa', 'nelson@gmail.com', '09068008764', 'Nigeria', 'Kaduna', 'Kaduna North', 'No 57 Use, Abuja, Nigeria', '2023-05-03 08:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `compareid` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `compared_prod_id` int(50) NOT NULL,
  `data_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_compare`
--

INSERT INTO `tbl_compare` (`compareid`, `user_id`, `product_id`, `compared_prod_id`, `data_add`) VALUES
(31, '801039', '281041', 344099, '2024-05-25 20:30:52'),
(32, '801039', '281041', 769024, '2024-05-25 20:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dispatcher`
--

CREATE TABLE `tbl_dispatcher` (
  `dispID` int(11) NOT NULL,
  `dispUserID` varchar(50) NOT NULL,
  `Fname` varchar(100) NOT NULL,
  `Sname` varchar(100) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `disp_state` varchar(50) NOT NULL,
  `disp_city` varchar(50) NOT NULL,
  `disp_lga` varchar(50) NOT NULL,
  `disp_status` int(11) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_dispatcher`
--

INSERT INTO `tbl_dispatcher` (`dispID`, `dispUserID`, `Fname`, `Sname`, `phone_num`, `disp_state`, `disp_city`, `disp_lga`, `disp_status`, `add_date`) VALUES
(1, 'dip-978325', 'Usman', 'Usman', '90988747', 'Kaduna', 'Zaria', 'Sabon Gari', 1, '2023-06-10 12:36:55'),
(2, 'dip-978334', 'Rapher', 'Owecho', '90680087', 'Kaduna', 'Zaria', 'Sabon Gari', 1, '2023-06-10 20:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dispatcher_docs`
--

CREATE TABLE `tbl_dispatcher_docs` (
  `docID` int(11) NOT NULL,
  `dispID` varchar(50) NOT NULL,
  `NIN` varchar(50) NOT NULL,
  `disp_photo_alfe` varchar(255) NOT NULL,
  `disp_photo_full` varchar(255) NOT NULL,
  `means_of_id_name` varchar(255) NOT NULL,
  `means_of_id_file` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `guarantor_name` varchar(100) NOT NULL,
  `guarantor_number` int(50) NOT NULL,
  `guarantor_NIN` int(50) NOT NULL,
  `guarantor_address` varchar(255) NOT NULL,
  `guarantor_photo` varchar(255) NOT NULL,
  `time_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_dispatcher_docs`
--

INSERT INTO `tbl_dispatcher_docs` (`docID`, `dispID`, `NIN`, `disp_photo_alfe`, `disp_photo_full`, `means_of_id_name`, `means_of_id_file`, `address`, `guarantor_name`, `guarantor_number`, `guarantor_NIN`, `guarantor_address`, `guarantor_photo`, `time_add`) VALUES
(0, 'dip-978325', '99878787887', 'prof.jpg', 'prof09089787.jpg', '', '', 'No 5', 'Haruna', 0, 0, '', '', '2023-06-10 12:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehouse`
--

CREATE TABLE `tbl_warehouse` (
  `wid` int(11) NOT NULL,
  `warehouseID` int(50) NOT NULL,
  `warehousename` varchar(50) NOT NULL,
  `wsate` varchar(50) NOT NULL,
  `wcity` varchar(50) NOT NULL,
  `wlga` varchar(50) NOT NULL,
  `discrete` varchar(50) NOT NULL,
  `waddress` varchar(255) NOT NULL,
  `wmap` varchar(255) NOT NULL,
  `wfrontView` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `addDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_warehouse`
--

INSERT INTO `tbl_warehouse` (`wid`, `warehouseID`, `warehousename`, `wsate`, `wcity`, `wlga`, `discrete`, `waddress`, `wmap`, `wfrontView`, `status`, `addDate`) VALUES
(1, 988954, 'Inewton Electronics Services', 'Kaduna', 'Zaria', 'Sabon Gari', 'Samaru', 'No 7 War road, danraka samaru zaria', 'fgff', 'Forum-Shopfront.jpg', 0, '2023-06-11 10:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `wishid` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `data_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_wishlist`
--

INSERT INTO `tbl_wishlist` (`wishid`, `user_id`, `product_id`, `data_add`) VALUES
(13, '801039', '211818', '2024-03-20 18:00:34'),
(14, '801039', '316449', '2024-03-20 18:00:36'),
(15, '801039', '879669', '2024-03-20 18:00:38'),
(16, '801039', '865033', '2024-03-21 16:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `tb_criteria`
--

CREATE TABLE `tb_criteria` (
  `id` int(11) NOT NULL,
  `criteria_name` varchar(50) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_criteria`
--

INSERT INTO `tb_criteria` (`id`, `criteria_name`, `add_date`) VALUES
(1, 'Summary', '2024-03-26 20:32:52'),
(2, 'General', '2024-03-26 20:32:52'),
(3, 'Multimedia', '2024-03-27 13:31:26'),
(4, 'Performance', '2024-03-27 13:31:26'),
(5, 'Design', '2024-03-27 13:32:03'),
(6, 'Display', '2024-03-27 13:32:03'),
(7, 'Storage', '2024-03-27 13:32:38'),
(8, 'Camera', '2024-03-27 13:32:38'),
(9, 'Battery', '2024-03-27 13:33:20'),
(10, 'PRICE & RATING', '2024-03-27 16:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_specification`
--

CREATE TABLE `tb_product_specification` (
  `id` int(11) NOT NULL,
  `storeID` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `spec_id` int(50) NOT NULL,
  `specification_details` varchar(100) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_product_specification`
--

INSERT INTO `tb_product_specification` (`id`, `storeID`, `product_id`, `spec_id`, `specification_details`, `add_date`) VALUES
(10, 629369, 281041, 3, 'Hexa Core', '2024-05-21 08:45:28'),
(11, 629369, 281041, 7, '3,174 mAh', '2024-05-21 08:45:28'),
(12, 629369, 281041, 6, 'Dual 12-megapixel', '2024-05-21 08:45:28'),
(13, 629369, 281041, 5, '64 GB', '2024-05-21 08:45:28'),
(14, 629369, 281041, 4, '6.5-inch', '2024-05-21 08:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `tb_shipping_method`
--

CREATE TABLE `tb_shipping_method` (
  `id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL,
  `method_discription` varchar(100) NOT NULL,
  `delivery_time` varchar(50) NOT NULL,
  `handling_fee` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_shipping_method`
--

INSERT INTO `tb_shipping_method` (`id`, `method_name`, `method_discription`, `delivery_time`, `handling_fee`) VALUES
(1, 'Express Delivery', 'Get what you ordered outside the shipping period and get it fats at your door step', '1 - 2 days', 3000),
(2, 'Standard Delivery', 'You can get your ordered product within the week period', '2 - 5 days', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `tb_specification`
--

CREATE TABLE `tb_specification` (
  `id` int(11) NOT NULL,
  `spec_name` varchar(50) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  `data_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_specification`
--

INSERT INTO `tb_specification` (`id`, `spec_name`, `criteria_id`, `data_add`) VALUES
(1, 'Quick charging', 1, '2024-03-26 20:28:52'),
(2, 'Operating system', 2, '2024-03-26 20:28:52'),
(3, 'Performance', 1, '2024-03-27 16:17:36'),
(4, 'Display', 1, '2024-03-27 16:17:36'),
(5, 'Storage', 1, '2024-03-27 16:17:58'),
(6, 'Camera', 1, '2024-03-27 16:17:58'),
(7, 'Battery', 1, '2024-03-27 16:18:38'),
(8, 'Sim slots', 2, '2024-03-27 16:18:38'),
(9, 'Launch date', 2, '2024-03-27 16:19:11'),
(10, 'Sim size', 2, '2024-03-27 16:19:11'),
(11, 'Network', 2, '2024-03-27 16:19:41'),
(12, 'Fingerprint sensor', 2, '2024-03-27 16:19:41'),
(13, 'Loudspeaker', 3, '2024-03-27 16:20:13'),
(14, 'FM radio', 3, '2024-03-27 16:20:13'),
(15, 'Headphone jack', 3, '2024-03-27 16:20:44'),
(16, 'Processor', 4, '2024-03-27 16:20:44'),
(17, 'Graphics', 4, '2024-03-27 16:21:19'),
(18, 'Architecture', 4, '2024-03-27 16:21:19'),
(19, 'RAM', 4, '2024-03-27 16:21:44'),
(20, 'Build material', 5, '2024-03-27 16:21:44'),
(21, 'Thickness', 5, '2024-03-27 16:22:12'),
(22, 'Width', 5, '2024-03-27 16:22:12'),
(23, 'Height', 5, '2024-03-27 16:22:32'),
(24, 'Weight', 5, '2024-03-27 16:22:32'),
(25, 'Waterproof', 5, '2024-03-27 16:22:56'),
(26, 'Colors', 5, '2024-03-27 16:22:56'),
(27, 'Display type', 6, '2024-03-27 16:23:41'),
(28, 'Pixel density', 6, '2024-03-27 16:23:41'),
(29, 'Screen protection', 6, '2024-03-27 16:24:00'),
(30, 'Screen size', 6, '2024-03-27 16:24:00'),
(31, 'Screen resolution', 6, '2024-03-27 16:24:27'),
(32, 'Touch screen', 6, '2024-03-27 16:24:27'),
(33, 'Internal memory', 7, '2024-03-27 16:25:03'),
(34, 'Expandable memory', 7, '2024-03-27 16:25:03'),
(35, 'Settings', 8, '2024-03-27 16:25:27'),
(36, 'Aperture', 8, '2024-03-27 16:25:27'),
(37, 'Camera features', 8, '2024-03-27 16:25:49'),
(38, 'Image resolution', 8, '2024-03-27 16:25:49'),
(39, 'Sensor', 8, '2024-03-27 16:26:16'),
(40, 'Autofocus', 8, '2024-03-27 16:26:16'),
(41, 'Shooting modes', 8, '2024-03-27 16:26:37'),
(42, 'Optical image stabilisation', 8, '2024-03-27 16:26:37'),
(43, 'Flash', 8, '2024-03-27 16:26:47'),
(44, 'Talktime', 9, '2024-03-27 16:27:13'),
(46, 'Wireless charging', 9, '2024-03-27 16:27:31'),
(47, 'Type', 9, '2024-03-27 16:27:31'),
(48, 'Capacity', 9, '2024-03-27 16:27:58'),
(49, 'Price', 10, '2024-03-27 16:33:10'),
(50, 'Rating', 10, '2024-03-27 16:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `userid` int(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `lga` varchar(100) NOT NULL,
  `zip_code` int(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `other_phone` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `position` varchar(20) NOT NULL,
  `date_creat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `userid`, `fullname`, `state`, `City`, `lga`, `zip_code`, `address`, `email`, `phone`, `other_phone`, `image`, `password`, `code`, `status`, `position`, `date_creat`) VALUES
(16, 801039, 'Abubakar Sd Harun', 'Kaduna', 'Zaria', 'Sabon Gari', 3434434, 'No 5 School Road Malali Kaduna', 'abubakarsd.harunasadiq@gmail.com', '09068008764', '', 'user.png', '$2y$10$hiY4d6dK2pjL2X7n9fcyUuuJnnlCwXiiFkRpZum1vAMIaVAo.N7wW', 0, 'verified', 'admin', '2022-05-31 19:12:55'),
(17, 517545, 'Israel ', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', 'israelefu090@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:17:27'),
(18, 226890, 'Sd Haruna', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', 'intelsiabubakar1@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:21:02'),
(19, 301473, 'Israel ', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', 'israelefu59@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:22:22'),
(20, 139964, 'Muhammad Usman Iliyasu', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', 'muhammadusmanili&5@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 139964, 'not verified', '', '2022-06-25 09:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `wallet_id` varchar(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `trans_type` int(11) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `trans_reference` varchar(100) NOT NULL,
  `date_transact` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `wallet_id`, `amount`, `trans_type`, `destination`, `trans_reference`, `date_transact`) VALUES
(34, '8367595445', '1500', 1, '7687648897', '', '2023-07-09 19:43:54'),
(35, '8367595445', '1200', 1, '7687648897', '', '2023-07-09 19:46:44'),
(36, '7687648897', '1200', 2, '8367595445', '', '2023-07-09 19:46:44'),
(37, '8367595445', '1200', 1, '7687648897', '838515', '2023-07-09 19:54:09'),
(38, '7687648897', '1200', 2, '8367595445', '838515', '2023-07-09 19:54:09'),
(39, '7687648897', '1500', 1, '8367595445', '551244', '2023-07-09 20:34:06'),
(40, '8367595445', '1500', 2, '7687648897', '551244', '2023-07-09 20:34:06'),
(41, '8367595445', '6000', 1, '7687648897', '764003', '2023-07-17 19:54:48'),
(42, '7687648897', '6000', 2, '8367595445', '764003', '2023-07-17 19:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `users_bank_accounts`
--

CREATE TABLE `users_bank_accounts` (
  `b_id` int(11) NOT NULL,
  `userId` int(50) NOT NULL,
  `bank_shot_name` varchar(50) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `add_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_bank_accounts`
--

INSERT INTO `users_bank_accounts` (`b_id`, `userId`, `bank_shot_name`, `account_name`, `account_number`, `status`, `add_date`) VALUES
(1, 992190, 'Jaiz', 'Haruna Sadiq', '0002559146', 'active', '0000-00-00 00:00:00'),
(3, 8768, 'Jaiz', 'Abubakar sd Haruna', '0002559146', 'active', '0000-00-00 00:00:00'),
(4, 8768, 'uba', 'Abubakar Haruna Abdulmalik', '3274857683', 'active', '0000-00-00 00:00:00'),
(5, 831247, 'Jaiz', 'HarunaAbubakar Abdulmalik', '0002559146', 'active', '0000-00-00 00:00:00'),
(6, 8768, 'FB', 'Sd haruna', '2187364893', 'active', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vend_documents`
--

CREATE TABLE `vend_documents` (
  `id` int(11) NOT NULL,
  `vendorID` int(50) NOT NULL,
  `document_type` varchar(50) NOT NULL,
  `document` varchar(100) NOT NULL,
  `date_post` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vend_documents`
--

INSERT INTO `vend_documents` (`id`, `vendorID`, `document_type`, `document`, `date_post`) VALUES
(1, 992190, 'CAC', 'Asset_1b.png', '2022-11-05 15:59:09'),
(2, 992190, 'Notional Identity', 'receipt.jpg', '2022-11-05 15:59:47'),
(3, 992190, 'Proof of address', '599-Converted.png', '2022-11-05 16:00:02'),
(4, 992190, 'Store Front View', 'b2b-marketplace-background.ec971d4c.jpg', '2022-11-05 17:16:05'),
(5, 992190, 'Store Logo', 'icons.png', '2022-11-05 17:16:39'),
(6, 8768, 'Notional Identity', 'Animated.jpg', '2022-12-06 02:09:28'),
(7, 8768, 'Proof of address', 'web-design-best-practices.jpg', '2022-12-06 02:10:16'),
(8, 8768, 'Store Front View', 'handbill.jpg', '2022-12-06 02:10:48'),
(9, 8768, 'Store Logo', 'Screenshot 2022-11-23 204901.jpg', '2022-12-06 02:11:13'),
(10, 8768, 'CAC Reg Slip', '324232502_1103371177084261_786574209326728363_n.jpg', '2023-01-15 10:13:48'),
(11, 831247, 'Notional Identity', '274154924_4635856916511709_5999944345239427290_n.jpg', '2023-02-26 15:31:26'),
(12, 831247, 'Proof of address', 'Books.jpg', '2023-02-26 15:31:45'),
(13, 831247, 'Store Front View', '322368852_744293154028626_7706420177866187661_n.jpg', '2023-02-26 15:32:17'),
(14, 831247, 'Store Logo', 'images (2) (17).jpeg', '2023-02-26 15:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `wallet_id` varchar(255) NOT NULL,
  `user_id` int(50) NOT NULL,
  `ballance` int(255) NOT NULL,
  `status` int(11) NOT NULL,
  `date_join` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `wallet_id`, `user_id`, `ballance`, `status`, `date_join`) VALUES
(30, '8367595445', 8768, 2600, 1, '2022-05-31 19:14:22'),
(31, '7687648897', 831247, 7500, 1, '2023-07-09 17:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `id` int(11) NOT NULL,
  `workid` int(30) NOT NULL,
  `user_id` int(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `device_type_id` int(11) NOT NULL,
  `problem_id` int(11) NOT NULL,
  `other_problem` varchar(255) NOT NULL,
  `seriall_num` varchar(50) NOT NULL,
  `device_model` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `pay_status` varchar(50) NOT NULL,
  `service_cost` int(50) NOT NULL,
  `drop_service_cost` int(50) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `email_noti` varchar(50) NOT NULL,
  `text_noti` varchar(50) NOT NULL,
  `call_noti` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  `work_progress` int(11) NOT NULL,
  `work_testing` int(11) NOT NULL,
  `work_complete` int(11) NOT NULL,
  `add_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work`
--

INSERT INTO `work` (`id`, `workid`, `user_id`, `device_id`, `device_type_id`, `problem_id`, `other_problem`, `seriall_num`, `device_model`, `color`, `pay_status`, `service_cost`, `drop_service_cost`, `service_name`, `email_noti`, `text_noti`, `call_noti`, `status`, `progress`, `work_progress`, `work_testing`, `work_complete`, `add_date`) VALUES
(118, 187087, 566094, 1, 2, 4, '', 'Ghjjhgg', 'kk', 'Black', 'Paid', 400, 400, 'PickUp by our Agent', 'email me', 'text me', 'call me', 2, 1, 0, 0, 0, '2022-05-19 20:02:16'),
(119, 187341, 566094, 1, 1, 1, 'Gg', '', '', '', 'not paid', 500, 0, 'PickUp by our Agent', 'email_noti', 'text_noti', 'call_noti', 2, 1, 0, 0, 0, '2022-05-31 18:52:27'),
(120, 788158, 801039, 1, 1, 1, '', '09068008764', 'vv43', 'Red', 'not paid', 400, 400, 'PickUp by our Agent', 'email_noti', 'text_noti', 'call_noti', 2, 1, 0, 0, 0, '2022-12-11 02:31:33'),
(121, 478232, 801039, 3, 12, 0, '', '', '', ' ', 'not paid', 0, 500, 'I\'ll Drop it myself', 'email me', 'text me', 'call me', 2, 1, 0, 0, 0, '2022-12-11 02:32:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alert_notification`
--
ALTER TABLE `alert_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indexes for table `checkout_address`
--
ALTER TABLE `checkout_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_payment_type`
--
ALTER TABLE `checkout_payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_order`
--
ALTER TABLE `invoice_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `invoice_purchase`
--
ALTER TABLE `invoice_purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `invoice_purchase_item`
--
ALTER TABLE `invoice_purchase_item`
  ADD PRIMARY KEY (`purchase_item_id`);

--
-- Indexes for table `packaged_orders`
--
ALTER TABLE `packaged_orders`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_qty`
--
ALTER TABLE `product_qty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retailers_db`
--
ALTER TABLE `retailers_db`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_buyers`
--
ALTER TABLE `store_buyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_orders`
--
ALTER TABLE `store_orders`
  ADD PRIMARY KEY (`ordersid`);

--
-- Indexes for table `store_supplier`
--
ALTER TABLE `store_supplier`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`compareid`);

--
-- Indexes for table `tbl_dispatcher`
--
ALTER TABLE `tbl_dispatcher`
  ADD PRIMARY KEY (`dispID`);

--
-- Indexes for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`wishid`);

--
-- Indexes for table `tb_criteria`
--
ALTER TABLE `tb_criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_product_specification`
--
ALTER TABLE `tb_product_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_shipping_method`
--
ALTER TABLE `tb_shipping_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_specification`
--
ALTER TABLE `tb_specification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users_bank_accounts`
--
ALTER TABLE `users_bank_accounts`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `vend_documents`
--
ALTER TABLE `vend_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `alert_notification`
--
ALTER TABLE `alert_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `checkout_address`
--
ALTER TABLE `checkout_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checkout_payment_type`
--
ALTER TABLE `checkout_payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_order`
--
ALTER TABLE `invoice_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=806;

--
-- AUTO_INCREMENT for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `invoice_purchase`
--
ALTER TABLE `invoice_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=794;

--
-- AUTO_INCREMENT for table `invoice_purchase_item`
--
ALTER TABLE `invoice_purchase_item`
  MODIFY `purchase_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `packaged_orders`
--
ALTER TABLE `packaged_orders`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `product_qty`
--
ALTER TABLE `product_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `retailers_db`
--
ALTER TABLE `retailers_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_buyers`
--
ALTER TABLE `store_buyers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `store_orders`
--
ALTER TABLE `store_orders`
  MODIFY `ordersid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `store_supplier`
--
ALTER TABLE `store_supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `compareid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_dispatcher`
--
ALTER TABLE `tbl_dispatcher`
  MODIFY `dispID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `wishid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_criteria`
--
ALTER TABLE `tb_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_product_specification`
--
ALTER TABLE `tb_product_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_shipping_method`
--
ALTER TABLE `tb_shipping_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_specification`
--
ALTER TABLE `tb_specification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users_bank_accounts`
--
ALTER TABLE `users_bank_accounts`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vend_documents`
--
ALTER TABLE `vend_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
