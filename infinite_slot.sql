-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2023 at 09:26 PM
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
-- Table structure for table `bought_items`
--

CREATE TABLE `bought_items` (
  `sn` int(11) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `tranxid` varchar(50) NOT NULL,
  `refno` varchar(50) NOT NULL,
  `userid` varchar(15) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bought_items`
--

INSERT INTO `bought_items` (`sn`, `productid`, `quantity`, `amount`, `tranxid`, `refno`, `userid`, `date`, `status`) VALUES
(1, '316449', 1, 38682, '1700531241', 's27prhumz6', '801039', '2023-11-21T01:49:54.000Z', 'paid'),
(2, '316449', 1, 38682, '1700531241', 's27prhumz6', '801039', '2023-11-21T01:49:54.000Z', 'paid'),
(3, '344099', 1, 180000, '1700534447', 'iakbgpb8rd', '801039', '2023-11-21T02:41:50.000Z', 'paid');

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
(1, 'Laptop', 'laptops'),
(2, 'Desktop', 'desktop computer'),
(3, 'Tablets', 'tablets'),
(4, 'Mouse', 'mouse'),
(5, 'Tablets', 'palmtop'),
(6, 'Gamepad', 'Kids Accessories'),
(7, 'USB', 'Home Gadget');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_address`
--

CREATE TABLE `checkout_address` (
  `sn` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_address`
--

INSERT INTO `checkout_address` (`sn`, `user_id`, `address`) VALUES
(1, '801039', 'No. 4 Musari Street Misau'),
(2, '801039', 'Gaskiya Layout Zaria');

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
  `address` text NOT NULL,
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

INSERT INTO `invoice_order` (`order_id`, `store_id`, `invoiceCodex`, `order_date`, `ctype`, `cname`, `cphoneNumber`, `address`, `online_cid`, `subTotalx`, `status`, `choice`, `r_amount`, `cchange`, `fnote`, `tax`, `disAmount`) VALUES
(793, 629369, 933739, '2023-04-20', 'online', '', '', '', 801039, 334600.00, 'Paid', 'Transfer', 334600.00, 0.00, 'Thanks for your patronage', '0.00', '5400.00');

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

--
-- Dumping data for table `invoice_order_item`
--

INSERT INTO `invoice_order_item` (`order_item_id`, `invoice_id`, `order_id`, `product_code`, `qty`, `price`, `discount`, `tax`, `subtotal`) VALUES
(80, 793, 933739, 474825, 1, 160000.00, '400', '0', 159600.00),
(81, 793, 933739, 344099, 1, 180000.00, '5000', '0', 175000.00);

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
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `sn` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `order_no` varchar(50) NOT NULL,
  `productid` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `e_date` varchar(50) NOT NULL COMMENT 'expected arrival date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `packaged_orders`
--

INSERT INTO `packaged_orders` (`pid`, `packageID`, `warehouseID`, `storeID`, `orderID`, `total_price`, `order_date`, `shipping_time`, `approval_status`, `shipping_status`, `customer_received_status`, `customer_recieved_data`, `customer_rating`, `data_send`) VALUES
(15, 336320, 988954, 629369, 647382, 395963, '2023-05-25 01:51:46', '0000-00-00 00:00:00', 1, 3, 1, '0000-00-00 00:00:00', 3, '2023-06-19 20:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `pending_order`
--

CREATE TABLE `pending_order` (
  `sn` int(11) NOT NULL,
  `productid` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `tranxid` varchar(10) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `date` varchar(50) NOT NULL,
  `moved` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pending_order`
--

INSERT INTO `pending_order` (`sn`, `productid`, `quantity`, `amount`, `tranxid`, `userid`, `date`, `moved`) VALUES
(1, '316449', 1, '38682.65', '1700530812', '801039', '21-11-2023', 0),
(2, '316449', 1, '38682', '1700531241', '801039', '21-11-2023', 0),
(3, '344099', 1, '180000', '1700534447', '801039', '21-11-2023', 0);

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
  `pro_details` longtext NOT NULL,
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
(1, 1, 4, 0, 2342, 'DELL Inspiron 15 7000 15.6', 899, 1500, 0, 3, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(2, 1, 0, 0, 1234, 'MICROSOFT Surface Pro 4 & Typecover - 128 GB', 799, 500, 0, 50, 67, 0, '', '', '2023-01-15', 1, 5, '2021-07-29 00:00:00'),
(3, 1, 0, 0, 4232, 'DELL Inspiron 15 5000 15.6', 599, 1000, 0, 6, 30, 0, '', '', '2023-01-15', 1, 4, '2021-07-29 00:00:00'),
(4, 1, 0, 0, 7633, 'LENOVO Ideapad 320s-14IKB 14\" Laptop - Grey', 399, 700, 0, 2, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(5, 3, 0, 0, 5634, 'APPLE 9.7\" iPad - 32 GB, Gold', 339, 750, 0, 6, 5, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(6, 1, 0, 0, 9984, 'DELL Inspiron 15 5000 15', 449.99, 500, 0, 5, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(7, 3, 0, 0, 0, 'APPLE 10.5\" iPad Pro - 64 GB, Space Grey (2017)', 619, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(8, 1, 0, 0, 0, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', 549.99, 0, 0, 7, 5, 0, '', '', '2023-01-15', 4, 0, '2021-07-29 00:00:00'),
(9, 2, 0, 0, 0, 'PC SPECIALIST Vortex Core Lite Gaming PC', 599.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(10, 2, 0, 0, 0, 'DELL Inspiron 5675 Gaming PC - Recon Blue', 599.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(11, 2, 0, 0, 0, 'HP Barebones OMEN X 900-099nn Gaming PC', 489.98, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(12, 2, 0, 0, 0, 'ACER Aspire GX-781 Gaming PC', 749.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(13, 2, 0, 0, 0, 'HP Pavilion Power 580-015na Gaming PC', 799.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(14, 2, 0, 0, 0, 'LENOVO Legion Y520 Gaming PC', 899.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 3, 0, '2021-07-29 00:00:00'),
(15, 2, 0, 0, 0, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', 999.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(16, 2, 0, 0, 0, 'PC SPECIALIST Vortex Core II Gaming PC', 649.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(17, 3, 0, 0, 0, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', 49.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 4, 0, '2021-07-29 00:00:00'),
(18, 3, 0, 0, 0, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 16 GB, Black', 79.99, 0, 0, 10, 5, 0, '', '', '2023-01-15', 2, 0, '2021-07-29 00:00:00'),
(19, 3, 0, 0, 0, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 32 GB, Black', 99.99, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(20, 3, 0, 0, 0, 'APPLE 9.7\" iPad - 32 GB, Space Grey', 339, 0, 0, 0, 5, 0, '', '', '2023-01-15', 1, 0, '2021-07-29 00:00:00'),
(27, 1, 0, 0, 0, 'Dell XPS 15 9560', 1599, 0, 0, 0, 5, 0, '', '', '2023-01-15', 9, 0, '2021-07-29 00:00:00'),
(91, 1, 2, 629369, 344099, '15.6\" PA156 Laptop Computer Win10 Intel N5095 16G 128G/256G/512G Notebook Netbook Backlit Keyboard WIFI HD BT4.0 USB3.0 3.0MP', 170000, 180000, 5000, 50, 79, 70, '<div class=\"sku-title\" data-spm-anchor-id=\"a2g0o.detail.1000016.i3.28af439eU0nIWd\">Processor Model:&nbsp;<span class=\"sku-title-value\">Intel Celeron</span></div>\n<ul class=\"sku-property-list\">\n<li class=\"sku-property-item selected\">\n<div class=\"sku-property-text\">Intel Celeron</div>\n</li>\n</ul>', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i13.28af439eU0nIWd\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i15.28af439eU0nIWd\">Keyboards:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Backlit Keyboard\">Backlit Keyboard</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery Capacity?mAh?:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4500\">4500</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Network Communiction:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LAN,WIFI\">LAN,WIFI</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Touch Screen:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Expandable storage:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"YES\">YES</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Interface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"M.2\">M.2</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"DDR4\">DDR4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thermal Design Power:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5W\">5W</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Brand:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel\">Intel</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphic Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Integrated\">Integrated</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Max Turbo Frequency:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2.9\">2.9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Base Frequency (GHz)4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2.0\">2.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Cores:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4\">4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery lifetime:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"up to 4 - 6 hour\">up to 4 - 6 hour</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard language:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"English\">English</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard backlit type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Monochrome\">Monochrome</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Interfaces:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wi-Fi 4 (802.11n 2,4 GHz / 5 GHz)\">Wi-Fi 4 (802.11n 2,4 GHz / 5 GHz)</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen surface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"MATT\">MATT</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">CPU Brand/Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Celeron N5100\">Intel Celeron N5100</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Weight (Battery Included):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;2.0Kg\">&ge;2.0Kg</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen Refresh Rate:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"60Hz\">60Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Video Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"12GB\">12GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Dimensions (WxHxD):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"360*238*18mm\">360*238*18mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Body Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RAM:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"12GB\">12GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1080\">1920x1080</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth,Camera,Backlit Keyboard\">bluetooth,Camera,Backlit Keyboard</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Average Battery Life(in hours):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4-5 hours\">4-5 hours</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thickness:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15mm- 18mm\">15mm- 18mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"512GB\">512GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2*USB3.0\">2*USB3.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Ratio:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16:9\">16:9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Optical Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"None\">None</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15.6&quot;\">15.6\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Card Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Ultra HD Graphics 600\">Intel Ultra HD Graphics 600</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Slim Laptop\">Slim Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SZCHENXIN\">SZCHENXIN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Black\">Black</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16G+128G/256G/512G\">16G+128G/256G/512G</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Keyboard:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LED Lights\">LED Lights</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Front 3.0MP\">Front 3.0MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth4.0\">Bluetooth4.0</span></li>\n</ul>', '2023-04-06', 2, 5, '2023-04-06 14:56:06'),
(92, 1, 1, 629369, 474825, '10.1 inch IPS 1920*1200 Pipo W10 2 in 1 Tablet PC Win10 6G RAM 64G ROM Celeron N4120 Quad-core WIFI BT 5.0 HD Computer Netbook', 150000, 160000, 400, 50, 64, 80, '<div class=\"dynamic-shipping-line dynamic-shipping-titleLayout\" data-ps=\"y\"><strong>Shipping: NGN 16,949.68</strong>&nbsp;</div>\n<div class=\"dynamic-shipping-line dynamic-shipping-contentLayout\" data-ps=\"y\">From&nbsp;China&nbsp;to&nbsp;Nigeria&nbsp;via AliExpress Standard Shipping&nbsp;</div>\n<div class=\"dynamic-shipping-line dynamic-shipping-contentLayout\" data-ps=\"y\">Estimated delivery on&nbsp;May 05&nbsp;</div>', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i13.135614eawi32kM\">Second Webcam Pixels:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Front Webcam Pixels:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2MP\">2MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Standby Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"36\">36</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Working Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6-7\">6-7</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Time(H):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3-4\">3-4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Battery lifetime:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15000 - 20000H\">15000 - 20000H</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Google Play:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Second Webcam,Front Webcam Pixels\">Second Webcam,Front Webcam Pixels</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Net Weight:&nbsp;</span><span class=\"property-desc line-limit-length\" style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer; display: inline-block; max-width: inherit; font-size: 14px; color: #151515; vertical-align: bottom;\" title=\"&gt;500g\">&gt;500g</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Cell Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4000mAh\">4000mAh</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Extend Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB,Earphone Jack,TF card\">USB,Earphone Jack,TF card</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Tablet Storage Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"64GB\">64GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Core:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Quad Core\">Quad Core</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10.1&quot;\">10.1\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ULTRA SLIM,Dual Cameras\">ULTRA SLIM,Dual Cameras</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6GB\">6GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Celeron\">Intel Celeron</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Touch Screen Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Capacitive Screen\">Capacitive Screen</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1200\">1920x1200</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Processor Manufacture:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel\">Intel</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Network&nbsp;:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"WIFI\">WIFI</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Supporting Language:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"English,Russian,Spanish,Swedish,Portuguese,Turkish,Italian,German,Chinese,French,Japanese,Polish,Ukrainian,Greek,Hebrew\">English,Russian,Spanish,Swedish,Portuguese,Turkish,Italian,German,Chinese,French,Japanese,Polish,Ukrainian,Greek,Hebrew</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SZCHENXIN\">SZCHENXIN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">szchenxin Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"W10\">W10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Item Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Tablet PC\">Tablet PC</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Camera:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Front 2MP Back 5MP\">Front 2MP Back 5MP</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Black_Dark Blue ( Metal Back Cover )\">Black_Dark Blue ( Metal Back Cover )</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Memory:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"6G RAM 64G ROM\">6G RAM 64G ROM</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"BT5.0\">BT5.0</span></li>\n</ul>', '2023-04-06', 0, 6, '2023-04-06 14:59:54'),
(93, 1, 1, 629369, 769024, '15.6Inch For Intel i5-6200U Gaming laptop 256GB SSD IPS Screen Keyboard Backlight Fingerprint Unlock game Notebook', 269696.39, 279, 6000, 50, 71, 1000, '<p align=\"start\"><strong><span data-spm-anchor-id=\"a2g0o.detail.1000023.i0.11261d582kFN2A\">Remark:</span></strong></p>\n<p>&nbsp;</p>\n<p align=\"start\"><strong>1.Buyers are responsible for the customs clearance. Any special demands, pls tell us, we\'ll try our best to help you.</strong></p>\n<p align=\"start\"><strong>2.DHL shipping to many countries cause customs tax , If you Choose DHL, the price not include DHL remote cost, custom duty, You may need arrange the custom clearance and pay for some tax, please kindly know it, many thanks.</strong></p>\n<p align=\"start\"><strong>3. when you choose DHL, if your city is remote area, you must pay remote cost.</strong></p>\n<p align=\"start\"><strong>Note:</strong></p>\n<p align=\"start\"><strong>1. The keyboard is English. we will send keyboard stickers.</strong></p>\n<p align=\"start\"><strong>2.we offer free keyboard stickers and adapter, if made mistake for them, pls feel free to contact us, we don\'t accept any dispute for the reason of them.</strong></p>\n<p align=\"start\">&nbsp;</p>', '<div class=\"instore-info-container\">\n<div class=\"instore-info-rcmds\">\n<div class=\"simple-card-container\">\n<div class=\"simple-card-price\">&nbsp;307,381.30</div>\n</div>\n<div class=\"simple-card-container\">\n<div class=\"img-container\"><a href=\"https://www.aliexpress.com/item/1005004564998075.html?gps-id=pcDetailBottomMoreThisSeller&amp;scm=1007.13339.291025.0&amp;scm_id=1007.13339.291025.0&amp;scm-url=1007.13339.291025.0&amp;pvid=988a4d27-0fdc-44db-898c-a6491fe71aa7&amp;_t=gps-id:pcDetailBottomMoreThisSeller,scm-url:1007.13339.291025.0,pvid:988a4d27-0fdc-44db-898c-a6491fe71aa7,tpp_buckets:668%232846%238115%232000&amp;pdp_npi=3%40dis%21NGN%21346822.98%21339888.18%21%21%21%21%21%402101ead816807895106953934eb3a4%2112000029639497737%21rec%21NG%212334966288\"><img class=\"simple-card-img\" src=\"https://ae01.alicdn.com/kf/S7ddcbfdc21a5469ca53e56ca38f3f755N/5700U-15-6-Inch-AMD-Ryzen-7-5700U-Gaming-Laptops-Max-Ram-64GB-DDR4-MAX-Rom.jpg_480x480q90.jpg_.webp\" alt=\"5700U 15.6 Inch AMD Ryzen 7 5700U Gaming Laptops Max Ram 64GB DDR4 MAX Rom 4TB SSD Windows10 11 Pro Notebook Bluetooth WIFI\" /></a></div>\n<div class=\"simple-card-price\">NGN 339,888.18</div>\n</div>\n<div class=\"simple-card-container\">\n<div class=\"img-container\"><a href=\"https://www.aliexpress.com/item/1005002542016167.html?gps-id=pcDetailBottomMoreThisSeller&amp;scm=1007.13339.291025.0&amp;scm_id=1007.13339.291025.0&amp;scm-url=1007.13339.291025.0&amp;pvid=988a4d27-0fdc-44db-898c-a6491fe71aa7&amp;_t=gps-id:pcDetailBottomMoreThisSeller,scm-url:1007.13339.291025.0,pvid:988a4d27-0fdc-44db-898c-a6491fe71aa7,tpp_buckets:668%232846%238115%232000&amp;pdp_npi=3%40dis%21NGN%21376494.14%21338846.11%21%21%21%21%21%402101ead816807895106953934eb3a4%2112000021066804943%21rec%21NG%212334966288\"><img class=\"simple-card-img\" src=\"https://ae01.alicdn.com/kf/H993453a9db46429d8637b4b07406d515A/15-6-Intel-Core-I5-I7-1065G7-Touch-Bar-Laptop-16GB-128GB-256GB-512GB-1T-SSD.jpg_480x480q90.jpg_.webp\" alt=\"15.6&quot; Intel Core I5 I7-1065G7 Touch Bar Laptop 16GB 128GB/256GB/512GB/1T SSD Windows 10 Backlit keyboard 2.4G+5G Wifi Laptops\" /></a></div>\n<div class=\"simple-card-price\">NGN 338,846.11</div>\n</div>\n</div>\n</div>\n<div class=\"product-detail-tab\">\n<div class=\"detail-extend-tab\">\n<div class=\"detail-tab-bar\">\n<ul class=\"tab-lists avoid-user-select\">\n<li class=\"tab-item\" data-aplus-clk=\"x4_49f4bf94\" data-spm-anchor-id=\"a2g0o.detail.0.i3.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\">DESCRIPTION</span></div>\n</li>\n<li class=\"tab-item\" data-aplus-clk=\"x5_364399e5\" data-spm-anchor-id=\"a2g0o.detail.0.i4.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\">CUSTOMER REVIEWS<span class=\"fdbc-num\">&nbsp;(0)&lrm;</span></span></div>\n</li>\n<li class=\"tab-item active\" data-aplus-clk=\"x6_9a85dd3\" data-spm-anchor-id=\"a2g0o.detail.0.i5.11261d582kFN2A\">\n<div class=\"tab-inner\"><span class=\"tab-inner-text\" data-spm-anchor-id=\"a2g0o.detail.0.i10.11261d582kFN2A\">SPECIFICATIONS</span></div>\n</li>\n</ul>\n</div>\n<div class=\"tab-content\">\n<div>&nbsp;</div>\n<div>\n<div class=\"product-specs\" data-pl=\"product-specs\">\n<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.11261d582kFN2A\">CPU Brand/Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel Core i5-6200U\">Intel Core i5-6200U</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Weight (Battery Included):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;2.0Kg\">&ge;2.0Kg</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Screen Refresh Rate:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"60Hz\">60Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Video Memory Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Main memory allocated memory\">Main memory allocated memory</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Dimensions (WxHxD):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"375*245*22mm\">375*245*22mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Body Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Metal\">Metal</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RAM:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"8GB\">8GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Panel Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"IPS\">IPS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display resolution:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1920x1080\">1920x1080</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operating System:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Windows 10\">Windows 10</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Average Battery Life(in hours):&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4-6 hours\">4-6 hours</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Thickness:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"&ge;20mm\">&ge;20mm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Capacity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"512GB\">512GB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Card Reader,3.5 mm Audio Jack,2*USB3.0,HDMI,RJ-45\">Card Reader,3.5 mm Audio Jack,2*USB3.0,HDMI,RJ-45</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Ratio:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"16:9\">16:9</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Optical Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"None\">None</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Display Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"15.6&quot;\">15.6\"</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hard Drive Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Graphics Card Model:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Intel HD Graphics 620\">Intel HD Graphics 620</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Laptop\">Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"BOBARRY\">BOBARRY</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Item Condition:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"New\">New</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Model Number:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"i5 6200U\">i5 6200U</span></li>\n</ul>\n</div>\n</div>\n</div>\n</div>\n</div>', '2023-04-06', 1, 1, '2023-04-06 15:06:48'),
(94, 1, 1, 629369, 750219, 'KOOTION X15 M.2 SSD 256GB 512GB 1TB SSD Solid State Drive M2 SSD M.2 NVMe PCIe Internal Hard Disk For Laptop Desktop MSI Dell HP', 10600, 10700, 50, 50, 9, 500, '<p><img src=\"https://ae01.alicdn.com/kf/Sa1a1f087bb4043c8a76e4ff444486224t.jpg\" alt=\"\" width=\"1500\" height=\"1500\" /></p>\n<p><img src=\"https://ae01.alicdn.com/kf/S6b6fce7dd0104fd885d18ff5c6b3730f5.jpg\" alt=\"\" width=\"1500\" height=\"1500\" /></p>\n<p><img src=\"https://ae01.alicdn.com/kf/Sd6b0fd594d84445ead41fa22983ab206b.jpg\" alt=\"\" width=\"1000\" height=\"1597\" /></p>', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.59406fe4UTsPnt\">Max Sequential Write:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"2100Mbps\">2100Mbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Max Sequential Read:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3000Mbps\">3000Mbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Transport Protocol:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NVME\">NVME</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bus Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCIe 3.0x4\">PCIe 3.0x4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">RGB:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"YES\">YES</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Cooling Fin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Nand Flash Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"TLC\">TLC</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Controller:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"other\">other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCI-E\">PCI-E</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"PCI Express,M.2 2280,M.2 (M)\">PCI Express,M.2 2280,M.2 (M)</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Application:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Desktop,Laptop\">Desktop,Laptop</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"KOOTION\">KOOTION</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Internal\">Internal</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"SSD\">SSD</span></li>\n</ul>', '2023-04-06', 1, 3, '2023-04-06 15:10:33'),
(95, 7, 1, 629369, 639775, 'USB C to Dual HDMI-Compatible VGA, USB C Hub Docking Station Dual Monitors For Dell XPS HP Elitebook Lenovo Acer Chromebook Asus', 6407.79, 7000.8, 200, 20, 12, 58, '<p style=\"font-weight: 400;\"><strong style=\"font-weight: 700 !important;\" data-spm-anchor-id=\"a2g0o.detail.1000023.i0.4fc55040sV9rAj\">Laptop Docking Station USB C to Dual HDMI-Compatible VGA, USB C Dock Hub MST Multi-Display For HP Dell XPS Lenovo Asus Macbook</strong></p>\n<p style=\"font-weight: 400;\">&nbsp;</p>\n<p style=\"font-weight: 400;\"><u><strong style=\"font-weight: 700 !important;\">Compatible</strong></u></p>\n<p style=\"font-weight: 400;\">The Compatible list, updated by EYLink Store.</p>\n<p style=\"font-weight: 400;\">* For Lenovo ThinkPad T490, T490s, T14 (14\"), T480, T480s, T580, T590, T15 (15\")</p>\n<p style=\"font-weight: 400;\">* For Lenovo ThinkPad P43s (14\"), P14s (14\"), P15s (15\"), L480, L490</p>\n<p style=\"font-weight: 400;\">* For Lenovo ThinkPad X280, X390, X13(13\")Intel, X13 Yoga(13\"), X380 Yoga(13\")</p>\n<p style=\"font-weight: 400;\">* For Lenovo ThinkPad X1 Yoga Gen 3 (14\"), X1 YOGA Gen 4 (14\"), X1 Yoga Gen 5 (14\")</p>\n<p style=\"font-weight: 400;\">* For Lenovo ThinkPad X1 Carbon Gen 6 (14\"), X1 Carbon Gen 7 (14\"), X1 Carbon Gen 8 (14\")</p>\n<p style=\"font-weight: 400;\">* For Lenovo Yoga 720/900/920 Air 12\'\' ideaPad 720S</p>\n<p style=\"font-weight: 400;\">* For Dell XPS 13 9360, XPS 13 9370, XPS 13 9380, XPS 13 7390, XPS 13 9300</p>\n<p style=\"font-weight: 400;\">* For Dell XPS 13 9365 2-in-1, XPS 13 7390 2-in-1</p>\n<p style=\"font-weight: 400;\">* For Dell XPS 15 9500, XPS 15 9575 2-in-1</p>\n<p style=\"font-weight: 400;\">* For Dell Latitude 7400 2-in-1 14\", Latitude 7200 2-in-1 12\", Latitude 7210 2-in-1 12\"</p>\n<p style=\"font-weight: 400;\">* For HP SPECTRE x360 15.6\'\', HP SPECTRE x369 13\'\'</p>\n<p style=\"font-weight: 400;\">* For HP ProBook x360 11 G7,EliteBook 830 G8,EliteBook 830 G7,EliteBook X360 830 G8</p>\n<p style=\"font-weight: 400;\">* For Asus ZenBook3U(ASUS UX390UAK)</p>\n<p style=\"font-weight: 400;\">* For Asus ZenBook Flip S(UX370UA)</p>\n<p style=\"font-weight: 400;\">* For Chromebook Acer Chromebook Spin 713, Acer Chromebook 314, 315</p>\n<p style=\"font-weight: 400;\">* For Chromebook Google Pixelbook Go, Lenovo Chromebook C340 11\", ASUS C223</p>\n<p style=\"font-weight: 400;\">* For Microsoft Surface Pro 7, Surface Pro X, Surface Go, Surface Laptop 3,Surface Book 2</p>\n<p style=\"font-weight: 400;\">* For Xiaomi Air 12.5\'\', 13.3\'\', Pro 15.6\'\'</p>\n<p style=\"font-weight: 400;\">* For Razer Blade Stealth, Razer Blade Stealth 13</p>\n<p style=\"font-weight: 400;\">* For Teclast F6 Plus</p>\n<p style=\"font-weight: 400;\">* updating...</p>\n<p style=\"font-weight: 400;\">The other windows laptops MUST require:</p>\n<p style=\"font-weight: 400;\">- The USB-C port of the laptop MUST a Thunderbolt-3 port.</p>\n<p style=\"font-weight: 400;\">- The USB-C port of the laptop is also a AC(power) port, or you don\'t want to power the laptop via this docking station.</p>\n<p style=\"font-weight: 400;\"><br /><br /></p>\n<h2 style=\"font-weight: 500;\"><u><strong style=\"font-weight: 700 !important;\">5-IN-1 USB C Docking Station Specifications</strong></u></h2>\n<p style=\"font-weight: 400;\">Color: Gray</p>\n<p style=\"font-weight: 400;\">Material: Aluminum alloy</p>\n<p style=\"font-weight: 400;\">Size: 58mm*52mm*12mm/2.28*2.05*0.47inch</p>\n<p style=\"font-weight: 400;\">Length of Cable: 100mm/3.94inch</p>\n<p style=\"font-weight: 400;\">Package Contents: 1*Docking Station</p>\n<p style=\"font-weight: 400;\">ONLY 1 Docking station in the package, other accessories are not included.</p>\n<p style=\"font-weight: 400;\">*************************************************</p>\n<p style=\"font-weight: 400;\">Interface: USB Type C male port</p>\n<p style=\"font-weight: 400;\">Port-1: HDMI max support 4K 30Hz, Downwards Compatible with 1080P, 720P etc.</p>\n<p style=\"font-weight: 400;\">Port-2: HDMI max support 4K 30Hz, Downwards Compatible with 1080P, 720P etc.</p>\n<p style=\"font-weight: 400;\">Port-3: USB Type C PD Charging Port</p>\n<p style=\"font-weight: 400;\">Port-4: USB 3.0, Speed up to 5Gbps, Power Supply Up to 5V-900mA 4.5W</p>\n<p style=\"font-weight: 400;\">Port-5: VGA max support 1080 60Hz</p>\n<p style=\"font-weight: 400;\">*************************************************</p>\n<p style=\"font-weight: 400;\">Function-1: Connect Keyboard, Mouse, USB Flash, Printer etc.</p>\n<p style=\"font-weight: 400;\">Function-2: Support USB C Power Delivery, Keep laptop the best performance</p>\n<p style=\"font-weight: 400;\">Function-3: Extend a Larger Screen via HDMI</p>\n<p style=\"font-weight: 400;\">Function-4: Connect Projector, Monitor, HD-TV, HDMI up to 4K 3840x2160 30Hz</p>\n<p style=\"font-weight: 400;\">Function-5: 2 HDMI ports, Support Mirror Mode and Extended Mode</p>\n<p style=\"font-weight: 400;\">Function-6: Support MST, Extend mode support Extend 2 monitors to show different contents on Windows</p>\n<p style=\"font-weight: 400;\">&nbsp;</p>\n<p style=\"font-weight: 400;\"><u><strong style=\"font-weight: 700 !important;\">WARNING TIPS</strong></u></p>\n<ol>\n<li style=\"font-weight: 400;\">If you are not sure whether this docking station is compatible with your laptop,</li>\n</ol>\n<p style=\"font-weight: 400;\">please tell me the model of your laptop, I am pleasure to check the compatible.</p>\n<ol start=\"2\">\n<li style=\"font-weight: 400;\">MST only support on Windows: Extend 2 monitors to show differents.</li>\n<li style=\"font-weight: 400;\">4Kx2K@30Hz support on ONLY one HDMI is connecting, the other HDMI and VGA is disconnecting.</li>\n<li style=\"font-weight: 400;\">When you use the docking station to extend monitors:</li>\n</ol>\n<p style=\"font-weight: 400;\">please connect to monitors first, and then connect to your laptop.</p>\n<p style=\"font-weight: 400;\">Not support HDMI Hot Plug.</p>\n<p style=\"font-weight: 400;\"><img src=\"https://ae01.alicdn.com/kf/Se04ada04ef5448ac85993db070094e32A.jpg\" alt=\"\" width=\"750\" height=\"1000\" /></p>\n<p style=\"font-weight: 400;\"><img src=\"https://ae01.alicdn.com/kf/S0341719004a2484b9f728ff500ae915aG.jpg\" alt=\"\" width=\"750\" height=\"1000\" /></p>', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.4fc55040sV9rAj\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Length:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10cm\">10cm</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Width:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5inch\">5inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Aluminum\">Aluminum</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Model Number:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ZU-5IN1\">ZU-5IN1</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ZUIDID\">ZUIDID</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE,FCC,RoHS\">CE,FCC,RoHS</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Laptop Docking Stations\">Laptop Docking Stations</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Gray\">Gray</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Aluminum,Aluminum alloy\">Aluminum,Aluminum alloy</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Size:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"58mm*52mm*12mm/2.28*2.05*0.47inch\">58mm*52mm*12mm/2.28*2.05*0.47inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Length of Cable:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"100mm/3.94inch\">100mm/3.94inch</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB Type C male port\">USB Type C male port</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-1:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"HDMI max support 4K 30Hz\">HDMI max support 4K 30Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-2:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"HDMI max support 4K 30Hz\">HDMI max support 4K 30Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-3:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB Type C PD Charging Port\">USB Type C PD Charging Port</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"USB 3.0, Speed up to 5Gbps\">USB 3.0, Speed up to 5Gbps</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Port-5:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"VGA max support 1080p 60Hz\">VGA max support 1080p 60Hz</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 15:28:16');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `store_id`, `prodcode`, `name`, `market_price`, `cost_price`, `fprice`, `stock_alert`, `stock`, `order_tax`, `pro_details`, `pro_discriptions`, `date_view`, `view_counter`, `buy_counter`, `add_date`) VALUES
(96, 4, 8, 629369, 316449, '2023 New Global Version i13 Pro Max 6.7 Inch Smartphones 16GB+512G 5000mAh 5G Network Unlock Cell Phone Dual SIM Android Phone', 33682.65, 38682.65, 1000, 50, 20, 600, '<p style=\"font-weight: 400;\"><span data-spm-anchor-id=\"a2g0o.detail.1000023.i0.4bb958baCjAfkH\">This is not an Apple phone, this is an Android phone made by our factory, thank you</span></p>\n<p style=\"font-weight: 400;\"><strong style=\"font-weight: 700 !important;\">Specification:</strong></p>\n<p style=\"font-weight: 400;\">1.Model No.:i13 Pro Max</p>\n<p style=\"font-weight: 400;\">2.Platform : Qualcomm 888+, Deca Core (Latest 10 Core)</p>\n<p style=\"font-weight: 400;\">3.Standby: Dual sim dual standby</p>\n<p style=\"font-weight: 400;\">4.Screen: 6.7HD+ Full Display 2280*3200</p>\n<p style=\"font-weight: 400;\">5.Speaker: 1511 Box Speaker</p>\n<p style=\"font-weight: 400;\">6.Frequency: GSM850/900/1800/1900MHz, 3G: WCDMA850/1900/2100MHz?4G LTE</p>\n<p style=\"font-weight: 400;\">7.Vibration: Support</p>\n<p style=\"font-weight: 400;\">8.Colors: Black/ Blue/White/Gold</p>\n<p style=\"font-weight: 400;\">9.Memory: 16GB RAM+512GB ROM</p>\n<p style=\"font-weight: 400;\">10.Multi Media: MP3/MP4/3GP/FM Radio/Bluetooth</p>\n<p style=\"font-weight: 400;\">11.Camera: 48MP+64MP</p>\n<p style=\"font-weight: 400;\">12.Multi Function: Full screen, Face recognition, Dual SIM, Wi-Fi, GPS,Gravity Sensor, Alarm ,Calendar ,Calculator ,Audio recorder ,Video recorder, WAP/MMS/GPRS, Image viewer,E-Book,World clock,Tasks card? rear flash</p>\n<p style=\"font-weight: 400;\">13.Languages: Muti-language support</p>\n<p style=\"font-weight: 400;\">14.Others: Android OS 11.0 System</p>\n<p style=\"font-weight: 400;\">15.Battery: 6800mAh Lithium-ion battery</p>\n<p style=\"font-weight: 400;\">16.Ultra unibody</p>\n<p style=\"font-weight: 400;\">&nbsp;</p>\n<p style=\"font-weight: 400;\"><strong style=\"font-weight: 700 !important;\">Attention:</strong></p>\n<p style=\"font-weight: 400;\">Due to the difference in light, the actual color of the phone may be slightly different from the screen and the picture. Color names are only used to distinguish between individual SKUs. Please understand that. Thank you.</p>\n<p style=\"font-weight: 400;\">&nbsp;</p>\n<p style=\"font-weight: 400;\">The battery capacity is typical of the factory laboratory, the specific charging speed, the length of use and other data, the actual situation will be slightly different due to the power cord, power adapter, ambient temperature. When the phone is completely out of power and automatically shuts down, you need to charge your phone for more than 10 minutes to boot. It is recommended to charge when the battery is less than 20% charged.</p>\n<p style=\"font-weight: 400;\">Available memory capacity is subject to preloaded software</p>\n<p style=\"font-weight: 400;\">Product images and models, data, functions, performance, specifications, etc. are for reference only. We may improve the above contents. For details, please refer to the product and product description. Unless otherwise stated, the data contained in this website are our internal test results, and the comparisons are compared with our products.</p>\n<p style=\"font-weight: 400;\">The&nbsp;mobile&nbsp;phone&nbsp;support&nbsp;&nbsp;T-mobile?AT&amp;T?Straight&nbsp;Talk?Cricket&nbsp;Wireless?Google&nbsp;Project&nbsp;Fi?Lycamobile?MetroPCS&nbsp;?MintMobile?</p>\n<p style=\"font-weight: 400;\">does&nbsp;not&nbsp;support&nbsp;the&nbsp;Telecom&nbsp;CDMA&nbsp;network.&nbsp;(For&nbsp;example&nbsp;USA&nbsp;&nbsp;operators?Verizon?Sprint?U.S&nbsp;Cellular?Boost&nbsp;Mobile?FreedomPop?Ting?</p>\n<p style=\"font-weight: 400;\">Package Included:</p>\n<p style=\"font-weight: 400;\">1 x Smartphone,</p>\n<p style=\"font-weight: 400;\">1 x Charger Adapter,</p>\n<p style=\"font-weight: 400;\">1 x Headphones,</p>\n<p style=\"font-weight: 400;\">1 x User Manual,</p>\n<p style=\"font-weight: 400;\">1 x phone case,</p>\n<p style=\"font-weight: 400;\">1 x Protection film</p>\n<p style=\"font-weight: 400;\"><img src=\"https://ae01.alicdn.com/kf/S39942681b8ca4c22b6382dddbab8d606l.jpg\" alt=\"\" width=\"640\" height=\"640\" /></p>\n<p style=\"font-weight: 400;\"><img src=\"https://ae01.alicdn.com/kf/S7e65cf74867f4baa9ee8ce048d5cc21eS.jpg\" alt=\"\" width=\"634\" height=\"634\" /></p>\n<p style=\"font-weight: 400;\"><img src=\"https://ae01.alicdn.com/kf/S4c979ec8297a4bfd9f424437ff67e3fbC.jpg\" alt=\"\" width=\"630\" height=\"630\" /></p>', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i12.4bb958baCjAfkH\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Phones\">Phones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"FANHUN\">FANHUN</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 15:33:19'),
(100, 7, 1, 629369, 865033, '2023 new i7s TWS Wireless Bluetooth Headset Bluetooth 5.0 In-ear Sports Headset with microphone for Xiaomi Android iphone Huawei', 3000, 4000, 200, 50, 5, 50, '<p><span class=\"src\"><span data-spm-anchor-id=\"a2g0o.detail.1000023.i0.931d165cLW370u\">Features:</span></span><br /><br /><span class=\"src\">1.listening to the song correct, support songs and call,</span><br /><br /><span class=\"src\">2.remind call number, the last call back, all intelligent Chinese and English voice prompts, boot, pair, shut down the phone power will be low voice prompts;</span><br /><br /><span class=\"src\">3.Power capacity will show on your Iphone, you can see the power situation anytime, do not worry about the electricity ,make your life without worry;</span><br /><br /><span class=\"src\">4.One to two connections, can be connected to two mobile phones at the same time</span><br /><br /><span class=\"src\">5.Bluetooth headset connected to the phone after the shutdown , and then open the Bluetooth headset will connect back to the phone automatically , more convenient;</span><br /><br /><span class=\"src\">6.Intelligent compatibility: support all Bluetooth mobile phone, tablet, notebook, singing it, QQ music, movies, etc., universal all mobile phone</span></p>\n<div>&nbsp;</div>\n<p><span class=\"src\"><span class=\"Apple-converted-space\">&nbsp;Note: This product does not have a retail package box! ! !</span></span></p>\n<p><br /><br /><span class=\"src\">Specification:</span><br /><br /><span class=\"src\">1.Driver: 15mm</span><br /><br /><span class=\"src\">2.Impedance: 32 OHM</span><br /><br /><span class=\"src\">3.Bluetooth version: Bluetooth v4.2 + EDR</span><br /><br /><span class=\"src\">4.Bluetooth use band: 2.4GHz</span><br /><br /><span class=\"src\">5.Power level: CLASS II</span><br /><br /><span class=\"src\">6.Output power: 30mW</span><br /><br /><span class=\"src\">7.Bluetooth distance: 10 meters barrier</span><br /><br /><span class=\"src\">8.Frequency response: 20-20000Hz</span><br /><br /><span class=\"src\">9.Operating voltage range: 3.0V-4.2V</span><br /><br /><span class=\"src\">10.Mic sensitivity: -42dB</span><br /><br /><span class=\"src\">11.With A2DP / AVRCP high quality stereo audio transmission and remote control protocol</span><br /><br /><span class=\"src\">12.Powerful noise de-noising circuit (active noise reduction)</span><br /><br /><span class=\"src\">13.switch between Chinese and English (boot does not connect Bluetooth state, press the switch 2 times, hear the tone switch successfully)</span><br /><br /><span class=\"src\">13.Talk time is about 4-5 hours</span><br /><br /><span class=\"src\">14.music time about 4-5 hours</span><br /><br /><span class=\"src\">15.Standby time is about 100 hours</span><br /><br /><br /><span class=\"src\">Package Includes:</span><br /><br /><span class=\"src\">2x mini Bluetooth Headphones(left and right earphones)</span><br /><br /><span class=\"src\">1x Charging box</span><br /><br /><span class=\"src\">1x USB Charging Cable</span><br /><br /><span class=\"src\">1x User Manual</span></p>\n<div><img src=\"https://ae01.alicdn.com/kf/S23f2e4f8f471457a9ec928b85f30301fT.jpg\" alt=\"\" width=\"512\" height=\"512\" /></div>\n<div><img src=\"https://ae01.alicdn.com/kf/S26ec5128088a412b8b0332b59e716c29h.jpg\" alt=\"\" width=\"506\" height=\"506\" /></div>', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.931d165cLW370u\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Category:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Earphones &amp; Headphones\">Earphones &amp; Headphones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Method:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Charging case\">Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package List:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"User Manual,Charger,Charging case\">User Manual,Charger,Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Is wireless:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Waterproof:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Active Noise-Cancellation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Volume Control:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Control Button:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Vocalism Principle:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Communication:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wireless\">Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"In-ear\">In-ear</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LS\">LS</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 17:44:56'),
(101, 7, 1, 629369, 211818, '2023 new X10P TWS Wireless Bluetooth Headset 9D Stereo Game Fever Earplug waterproof band 3500mAh mobile power for smart phones', 5000, 6000, 200, 50, 3, 10, '<p><span class=\"src\" data-group=\"0-0\">Product Features:<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"1-0\">1, Bluetooth V5.0, support most of bluetooth devices and lower power consumption<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"2-0\">2, 3500mAh charging case can full charge 2 earphones around 10 times, or Charge your smartphone 3 times, offer more music time.<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"3-0\">3, With waterproof technology, no need to worry about water and sweat anymore<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"4-0\">4, &nbsp;8mms dual drive units, enjoy 9D strong deep bass music sound<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"5-0\">5, Popular one button control function, support switch songs, phone call and call voice assiatant.<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><br /><span class=\"src\" data-group=\"7-0\">Products Lists:<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"8-0\">2* Bluetooth Earphones<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"9-0\">1* Charging Case<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"10-0\">1* USB Cable<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"11-0\">1* User Manual<span class=\"Apple-converted-space\">&nbsp;</span></span><br /><span class=\"src\" data-group=\"12-0\">2* Earphone Cups(L,M Size)</span></p>\n<p><span class=\"src\" data-group=\"12-0\"><img src=\"https://ae01.alicdn.com/kf/Sae92894093264b9984a33c51ba0d23c3U.jpg\" alt=\"\" width=\"535\" height=\"4391\" /></span></p>', '<ul class=\"product-specs-list util-clearfix\" data-spm-anchor-id=\"a2g0o.detail.0.i12.5a1244181n4r2n\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Plastic\">Plastic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Category:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Earphones &amp; Headphones\">Earphones &amp; Headphones</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Charging Method:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Charging case\">Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Impedance Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"up to 32 ?\">up to 32 ?</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Bluetooth Version:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"5.0\">5.0</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package List:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"User Manual,Charger,Charging case\">User Manual,Charger,Charging case</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Codecs:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NONE\">NONE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">With Microphone:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Is wireless:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support APP:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support Memory Card:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Waterproof:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Resistance:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"32&Omega;\">32&Omega;</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Line Length:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"0m\">0m</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Frequency Response Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"20 - 20000Hz\">20 - 20000Hz</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Sensitivity:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"120dB\">120dB</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Plug Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"NONE\">NONE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Function:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"for Video Game,Common Headphone,Sport,For Mobile Phone\">for Video Game,Common Headphone,Sport,For Mobile Phone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Active Noise-Cancellation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Volume Control:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Control Button:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"No\">No</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Vocalism Principle:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Other\">Other</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wireless Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Connectors:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Lightning\">Lightning</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Communication:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Wireless\">Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Ear Hook\">Ear Hook</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"LS\">LS</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 17:49:05'),
(102, 1, 1, 629369, 256143, 'Wireless Mouse Bluetooth RGB Rechargeable Mouse Wireless Computer Silent Mause LED Backlit Ergonomic Gaming Mouse For Laptop PC', 5000, 7000, 500, 50, 35, 100, '<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<div>\n<p data-spm-anchor-id=\"a2g0o.detail.1000023.i2.324052072FEAMS\">Wireless Mouse Bluetooth RGB Rechargeable Mouse Wireless Computer Silent Mause LED Backlit Ergonomic Gaming Mouse For Laptop PC</p>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div>\n<p>Note</p>\n<p>1.Bluetooth Mode System Requirement:<br />(1) iPadOS 13 or later<br />(2) iOS 13 or later<br />(3) Windows 8/ 10 or later<br />(4)Mac OS X 10.10 or later<br />(5) Android 5.0 or later.<br />2.There are two modes: Bluetooth + wireless dual mode and wireless mode, please select the correct option<br />3.When the mouse cursor can\'t locate accurate, the mouse need to be charged.<br />4.When charging, the scroll wheel is blue light.</p>\n</div>\n<div><img src=\"https://ae01.alicdn.com/kf/S8a7541f97d134bb4ac6d81ec7dd62a72g.jpg\" /></div>\n<div>\n<p>1.New Upgraded:Unique charging technology,built-in lithium battery<br />2.Silent Design:The left and right click are both silence, no sound when you click<br />3.3 kinds DPI?adjustableprovides precise positioning</p>\n</div>\n<div><img src=\"https://ae01.alicdn.com/kf/H434362cd49be4f0b9e087abaddb0e067q.jpg\" /></div>\n<div>\n<p>Item Name:2.4G Wireless Mouse&amp; Bluetooth 5.0mouse<br />Buttons: 4 buttons<br />The Max DPI:1600 DPI<br />Ajustable DPI Switch: 800 /1200 /1600DPI<br />WiFi Range: 10M<br />Battery: Rechargeable<br />Charging Cable Length: About 20cm<br />Switch Life: 10 Million Times<br />Size: 112*57*25mm<br />Support System: Windows /Mac/Android / iPadOS</p>\n</div>\n<div><img src=\"https://ae01.alicdn.com/kf/H0b97078596124a52863574b340315cf80.jpg\" /></div>\n<div>\n<p>1 x 2.4G Wireless Mouse<br />1 x USB Receiver<br />1 x Charging Cable</p>\n<p><img src=\"https://ae01.alicdn.com/kf/S5dc95066ec72429f998350ffc745ee5fF.jpg\" alt=\"\" width=\"555\" height=\"555\" /></p>\n</div>', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i11.324052072FEAMS\">Time to market:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"May-13\">May-13</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Gross Weight:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"0.15g\">0.15g</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Operation Mode:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Opto-electronic\">Opto-electronic</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Power Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Rechargeable\">Rechargeable</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Buttons:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"4\">4</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Number of Rollers:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1 pcs\">1 pcs</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Hand Orientation:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Right\">Right</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Style:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"3D,Mini\">3D,Mini</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">DPI:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"1600\">1600</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Interface Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"bluetooth\">bluetooth</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Type:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth Wireless\">Bluetooth Wireless</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"kankeirr\">kankeirr</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Certification:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"CE\">CE</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Application:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"For laptop, desktop,office use\">For laptop, desktop,office use</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Wi-Fi Range:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"10m\">10m</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature1:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"silent mouse,noiseless mouse,mouse gaming\">silent mouse,noiseless mouse,mouse gaming</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature2:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wifi mouse,wireless mouse rechargeable\">wifi mouse,wireless mouse rechargeable</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature3:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless computer mouse,usb mouse,USB mice\">wireless computer mouse,usb mouse,USB mice</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature4:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"mause usb pc,Mouse Wireless,USB Mice\">mause usb pc,Mouse Wireless,USB Mice</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature5:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"optical mouse,wireless rechargeable mouse\">optical mouse,wireless rechargeable mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature6:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Bluetooth mouse,mouse bluetooth,laptop mouse\">Bluetooth mouse,mouse bluetooth,laptop mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature7:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless mouse rgb, mouse wireless rgb\">wireless mouse rgb, mouse wireless rgb</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature8:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"RGB Rechargeable Mouse,RGB Computer mouse\">RGB Rechargeable Mouse,RGB Computer mouse</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature9:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"computer mouse .wireless mouse computer\">computer mouse .wireless mouse computer</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Feature10:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"wireless mause rgb,laptop accessories\">wireless mause rgb,laptop accessories</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Support:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Drop shipping\">Drop shipping</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 18:06:00'),
(103, 6, 2, 629369, 879669, 'Wireless Keyboard Only Cover for Logitech K380 Wireless Colorful US Soft Silicone Film Case Slim Thin in Korean / English', 3500, 5700, 1000, 50, 4, 200, '<h1 class=\"a-size-base-plus a-text-bold\" align=\"center\" data-spm-anchor-id=\"a2g0o.detail.1000023.i0.2bb6c83fqTYFlj\"><a class=\"\" href=\"https://www.aliexpress.com/item/3256804476423732.html?spm=5261.ProductManageOnline.0.0.45bd4edfcrhvcS&amp;gatewayAdapt=4itemAdapt\" target=\"_self\"><img src=\"https://ae01.alicdn.com/kf/Abf031d8566f44711843fb4edf34437bcd.jpg\" width=\"598\" height=\"598\" /></a></h1>\n<p>&nbsp;</p>\n<p class=\"a-size-base-plus a-text-bold\">About this item</p>\n<p>1,Fit for Logitech K380 Multi-Device Bluetooth-compatible Keyboard.</p>\n<p>&nbsp;</p>\n<p>2,Made with premium engineering grade durable non-toxic silicone,ultra thin won\'t hurt the screen and made it easier for typing.</p>\n<p>&nbsp;</p>\n<p>3,Soft, ultra-thin. Elaborately lower key height design to give you better type feeling, especially after long time typing, manufactured to the highest quality soft durable silicone material available. Every detail clearly printed, perfectly engineered to ensure 1:1 fit,perfectly engineered to ensure nicely fit.</p>\n<p>&nbsp;</p>\n<p>4,Each color is paints taking hand screened using silicone paint, every key is individually molded and specially printed on clear silicone for a long lasting professional lookmaking it Soft, ultra-thin and durable</p>\n<p>&nbsp;</p>\n<p>5,Provide full protection for your keyboard against liquid spill (coffee/beer/milk) and more.Engineered to fit precisely to your keyboard.Made with premium engineering grade durable silicone, ultra thin won\'t hurt the screen and made it easier for typing.</p>\n<p>&nbsp;</p>\n<p align=\"center\"><img src=\"https://ae01.alicdn.com/kf/Aa5ff1bfeb2cc4e57900e4039890bb613L.jpg\" width=\"546\" height=\"546\" /></p>\n<p>&nbsp;</p>\n<h1 class=\"a-spacing-base\"><strong><span class=\"a-text-bold\">Features:</span></strong></h1>\n<p class=\"a-spacing-base\">? Washable and reusable, dust-proof and dirt-proof</p>\n<p class=\"a-spacing-base\">? help to protect keys from daily wear and tear, water drops, coffee spills and dirts</p>\n<p class=\"a-spacing-base\">? Colorful design for fashion look,silicone material help to weaken the sound when typing</p>\n<p class=\"a-spacing-base\">? Ultra thin keyboard cover design for smooth typing</p>\n<p class=\"a-spacing-base\">? Easy to use and remove for cleaning or disinfecting</p>\n<p class=\"a-spacing-base\">?Manufactured to the Highest Quality available</p>\n<p class=\"a-spacing-base\">?Soft durable silicone material to ensure comfortable usage while typing</p>\n<p class=\"a-spacing-base\">?The characters are printed clearly on the keyboard cover.</p>\n<p><br /><br /></p>\n<p align=\"center\"><img src=\"https://ae01.alicdn.com/kf/A8723a10c2ce64a3a8e335d1b94600512a.jpg\" width=\"484\" height=\"484\" /><img src=\"https://ae01.alicdn.com/kf/Ae4364845274949c8a933c367879f83acM.jpg\" width=\"526\" height=\"526\" /></p>\n<p><br /><br /></p>\n<p><strong>Ultra Thin Silicone Keyboard Cover Compatible for Logitech K380 Multi-Device Bluetooth-compatible Keyboard Protective Skin-Pink Ink</strong></p>\n<p>&nbsp;</p>\n<ul>\n<li>\n<p>Tailor-Made: The same size as the original laptop keyboard, every key is individually molded and specially printed.</p>\n</li>\n<li>\n<p>Fully Protective: Waterproof and dustproof, protect your keyboard against spills, dust and other contaminants.</p>\n</li>\n<li>\n<p>Comfortable: Soft durable silicone material makes no difference in typing with the cover on.</p>\n</li>\n<li>\n<p>Long-lasting: Flexible, washable, easy to apply and remove for cleaning or disinfecting.</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p align=\"center\"><img src=\"https://ae01.alicdn.com/kf/A82916018a5fe4ee09ed668f82d8c9326P.jpg\" width=\"455\" height=\"455\" /></p>\n<p>&nbsp;</p>\n<p align=\"left\"><strong>&radic; Professional Key Button Design</strong></p>\n<p>&nbsp;</p>\n<p>The product design 100% fits for all key button of each computer model.</p>\n<p>&nbsp;</p>\n<p>Ultra-thin and High Transparency.</p>\n<p>&nbsp;</p>\n<p>Design to provide the full protection for your keyboard against dust spills, key wear and more.</p>\n<p>&nbsp;</p>\n<p>Each key is individually molded and specially printed on clear silicone film with durable performance.</p>\n<p><br />It keeps your keyboard always new, and its beautiful color can make your laptop more fashionable.<img src=\"https://ae01.alicdn.com/kf/A57e636eca4a5499da1c0006d7f72f5d3F.jpg\" width=\"622\" height=\"622\" /><img src=\"https://ae01.alicdn.com/kf/Ae1ce8d3c01674b178f830868d886f680G.jpg\" width=\"492\" height=\"492\" /><img src=\"https://ae01.alicdn.com/kf/Ae015c20db19c41dfa3aca966453e83a0A.jpg\" width=\"517\" height=\"517\" /><img src=\"https://ae01.alicdn.com/kf/Ad1064423075142b893d5cb69a49a232bN.jpg\" width=\"516\" height=\"480\" /><img src=\"https://ae01.alicdn.com/kf/A8389bbccb91d496a8ee205981efe963eI.jpg\" width=\"470\" height=\"776\" /><img src=\"https://ae01.alicdn.com/kf/A71c858ac1c1141658c76134c42da0ea1j.jpg\" width=\"478\" height=\"478\" /><img src=\"https://ae01.alicdn.com/kf/A758db408ea7b440aa22069b4cb2b162cK.jpg\" width=\"465\" height=\"465\" /><img src=\"https://ae01.alicdn.com/kf/A9982efcfc65d48d99bc719fac43feb51Z.jpg\" width=\"520\" height=\"520\" /><img src=\"https://ae01.alicdn.com/kf/Ad2e5eb93da4c44f9a2a07f4c9b303dd0j.jpg\" width=\"505\" height=\"505\" /><img src=\"https://ae01.alicdn.com/kf/Af4f0294f45b4480ca30bc9e5a12d52b0N.jpg\" width=\"441\" height=\"441\" /></p>', '<ul class=\"product-specs-list util-clearfix\">\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\" data-spm-anchor-id=\"a2g0o.detail.0.i12.2bb6c83fqTYFlj\">Package:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Yes\">Yes</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Function:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Dustproof,waterproof\">Dustproof,waterproof</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Silicone\">Silicone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Products Status:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"STOCK\">STOCk</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Brand Name:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"ONLENY\">ONLENY</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Origin:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Mainland China\">Mainland China</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Material:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Silicone\">Silicone</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Color:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"Multiple colour\">Multiple colour</span></li>\n<li class=\"product-prop line-limit-length\"><span class=\"property-title\">Shape:&nbsp;</span><span class=\"property-desc line-limit-length\" title=\"A variety of styles\">A variety of styles</span></li>\n</ul>', '2023-04-06', 0, 0, '2023-04-06 18:10:12');

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
(289, 629369, 879669, 'c7f44d506e.webp', '', '2023-04-08 15:50:34');

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
-- Table structure for table `shipping_info`
--

CREATE TABLE `shipping_info` (
  `sn` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` text NOT NULL,
  `address2` varchar(200) NOT NULL,
  `zip_code` varchar(15) NOT NULL,
  `shipping_method` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_info`
--

INSERT INTO `shipping_info` (`sn`, `user_id`, `fullname`, `email`, `phone`, `address1`, `address2`, `zip_code`, `shipping_method`) VALUES
(1, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(2, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'Gaskiya Layout Zaria', ' ', '0', ' '),
(3, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(4, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(5, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(6, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(7, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(8, '187736', 'mr x', 'mrx@gmail.com', '08169895827', '', ' ', '', ' '),
(9, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(10, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(11, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(12, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(13, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(14, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(15, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(16, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(17, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(18, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(19, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(20, '801039', 'Abubakar Sd Harun', 'muhdmuhd158@gmail.com', '09068008764', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(21, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(22, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(23, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(24, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(25, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(26, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(27, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(28, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', '', ' ', '0', ' '),
(29, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(30, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(31, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(32, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(33, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', '', ' ', '0', ' '),
(34, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(35, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(36, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(37, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(38, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' '),
(39, '801039', 'Muhammed Garba', 'muhdmuhd158@gmail.com', '08169895827', 'No. 4 Musari Street Misau', ' ', '0', ' ');

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
(1, 801039, 629369, 0, '2023-02-21 10:54:52'),
(2, 517545, 629369, 0, '2023-02-21 10:56:02'),
(3, 139964, 629369, 0, '2023-02-21 10:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

CREATE TABLE `store_orders` (
  `ordersid` int(11) NOT NULL,
  `order_code` varchar(25) NOT NULL,
  `user_id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `product_price` int(50) NOT NULL,
  `pay_status` int(11) NOT NULL DEFAULT 0,
  `packag_status` int(11) NOT NULL DEFAULT 0,
  `date_order` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `user_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `priority` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `file` varchar(120) NOT NULL,
  `created_at` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `updated_at` varchar(15) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `subject`, `type`, `priority`, `description`, `status`, `file`, `created_at`, `updated_at`) VALUES
(3, 801039, 'I cant checkout', 'Website problem', 'Urgent', 'please attend to my issue and I want to pay for the products\n', 'Open', ' ', '09-10-2023', ''),
(4, 801039, 'testing ticket submission', 'Partner request', 'Medium', 'I want to be your partner and sell my goods in your site', 'Open', ' ', '09-10-2023', ''),
(8, 801039, 'tewst', 'Complaint', 'High', 'yerthghg', 'Open', ' ', '08-02-2023', ''),
(9, 187736, 'I cant checkout', 'Complaint', 'High', 'ryugyagagjahhjaj', 'Open', ' ', '08-02-2023', ''),
(10, 187736, 'I cant checkout', 'Complaint', 'High', 'ryugyagagjahhjaj', 'Open', ' ', '08-02-2023', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `compareid` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `data_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_compare`
--

INSERT INTO `tbl_compare` (`compareid`, `user_id`, `product_id`, `data_add`) VALUES
(1, '801039', '474825', '2023-08-25 16:26:38'),
(2, '801039', '769024', '2023-08-25 16:27:04'),
(3, '801039', '865033', '2023-08-26 15:38:42'),
(4, '3', '750219', '2023-08-31 13:38:14'),
(5, '3', '344099', '2023-08-31 13:39:19'),
(6, '801039', '316449', '2023-02-08 23:47:47'),
(7, '801039', '750219', '2023-02-08 21:53:33');

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
(3, '801039', '865033', '2023-08-25 15:34:12'),
(4, '801039', '211818', '2023-08-25 15:34:19'),
(7, '801039', '639775', '2023-08-25 15:53:43'),
(8, '3', '750219', '2023-08-31 13:38:20'),
(9, '3', '344099', '2023-08-31 13:39:17'),
(11, '111111', '111111', '2023-10-20 06:40:08'),
(12, '801039', '316449', '2023-02-09 00:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `userid` int(20) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `lga` varchar(100) DEFAULT NULL,
  `zip_code` int(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `other_phone` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `date_creat` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `userid`, `fullname`, `state`, `City`, `lga`, `zip_code`, `address`, `address2`, `email`, `phone`, `other_phone`, `image`, `password`, `code`, `status`, `position`, `date_creat`) VALUES
(16, 801039, 'Muhammed Garba', 'Kaduna', 'Zaria', 'Sabon Gari', 0, 'No 5 School Road Malali Kaduna', 'No 5 School Road Malali Kaduna', 'muhdmuhd158@gmail.com', '08169895827', '', 'avatar.png', '$2y$10$N2hbeRtoAzmG7NXFpSR8b.EljSx9bFsD9IWelyndP5Ja1ocKA5Z56', 0, 'verified', 'admin', '2022-05-31 19:12:55'),
(17, 517545, 'Israel ', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', '', 'israelefu090@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:17:27'),
(18, 226890, 'Sd Haruna', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', '', 'intelsiabubakar1@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:21:02'),
(19, 301473, 'Israel ', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', '', 'israelefu59@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 0, 'verified', '', '2022-05-31 19:22:22'),
(20, 139964, 'Muhammad Usman Iliyasu', 'Kaduna', 'Zaria', 'Sabon Gari', 0, '', '', 'muhammadusmanili&5@gmail.com', '', '', 'user.png', '$2y$10$de0h3p8msKEjpgKQe.w2WOHOyKEFtWtxbbeCfZNt2jolv1QE9782W', 139964, 'not verified', '', '2022-06-25 09:42:28'),
(32, 187736, 'mr x', NULL, NULL, NULL, NULL, 'dfgcvbnnjkdn', NULL, 'mrx@gmail.com', '08169895827', NULL, NULL, '$2y$10$PLi2l70iI2hENpVqjXG32eDq3dtSyHUlA65EQrP2SpBjQlLjcLJSa', NULL, NULL, NULL, '2023-02-08 21:32:55');

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
-- Indexes for table `bought_items`
--
ALTER TABLE `bought_items`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categ_id`);

--
-- Indexes for table `checkout_address`
--
ALTER TABLE `checkout_address`
  ADD PRIMARY KEY (`sn`);

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
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `packaged_orders`
--
ALTER TABLE `packaged_orders`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `pending_order`
--
ALTER TABLE `pending_order`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `idx_name_search` (`name`);

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
-- Indexes for table `shipping_info`
--
ALTER TABLE `shipping_info`
  ADD PRIMARY KEY (`sn`);

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
-- AUTO_INCREMENT for table `bought_items`
--
ALTER TABLE `bought_items`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `checkout_address`
--
ALTER TABLE `checkout_address`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_order`
--
ALTER TABLE `invoice_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=794;

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
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packaged_orders`
--
ALTER TABLE `packaged_orders`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pending_order`
--
ALTER TABLE `pending_order`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;

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
-- AUTO_INCREMENT for table `shipping_info`
--
ALTER TABLE `shipping_info`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_buyers`
--
ALTER TABLE `store_buyers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `store_orders`
--
ALTER TABLE `store_orders`
  MODIFY `ordersid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `store_supplier`
--
ALTER TABLE `store_supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `compareid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `wishid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
