-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: omop
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `omop_category`
--

DROP TABLE IF EXISTS `omop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_category`
--

LOCK TABLES `omop_category` WRITE;
/*!40000 ALTER TABLE `omop_category` DISABLE KEYS */;
INSERT INTO `omop_category` VALUES (1,'Burgers','2018-11-15 08:03:11','2018-11-15 08:03:11'),(2,'Beverages','2018-11-15 08:03:25','2018-11-15 08:03:25'),(3,'Combo Meals','2018-11-15 08:03:41','2018-11-15 08:03:41');
/*!40000 ALTER TABLE `omop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_coupon`
--

DROP TABLE IF EXISTS `omop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_coupon`
--

LOCK TABLES `omop_coupon` WRITE;
/*!40000 ALTER TABLE `omop_coupon` DISABLE KEYS */;
INSERT INTO `omop_coupon` VALUES (1,'GO2018','2018-11-15 08:01:33','2018-11-15 08:01:33','2018-11-15 08:01:33');
/*!40000 ALTER TABLE `omop_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_customer`
--

DROP TABLE IF EXISTS `omop_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_customer`
--

LOCK TABLES `omop_customer` WRITE;
/*!40000 ALTER TABLE `omop_customer` DISABLE KEYS */;
INSERT INTO `omop_customer` VALUES (1,5,'Yves Gonzaga','Manila','2018-11-16 01:54:40','2018-11-16 01:54:40'),(2,6,'Yves Gonzaga','Manila','2018-11-16 02:15:35','2018-11-16 02:15:35'),(3,7,'test','test','2018-11-19 05:03:19','2018-11-19 05:03:19'),(4,8,'test','test','2018-11-19 05:03:28','2018-11-19 05:03:28');
/*!40000 ALTER TABLE `omop_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_menu`
--

DROP TABLE IF EXISTS `omop_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_menu`
--

LOCK TABLES `omop_menu` WRITE;
/*!40000 ALTER TABLE `omop_menu` DISABLE KEYS */;
INSERT INTO `omop_menu` VALUES (1,1,1,'Hotdog','2018-11-15 08:06:57','2018-11-15 08:06:57'),(2,1,2,'Cheese Burger','2018-11-15 08:07:16','2018-11-15 08:07:16'),(3,1,3,'Fries','2018-11-15 08:07:30','2018-11-15 08:07:30'),(4,2,4,'Coke','2018-11-15 08:08:30','2018-11-15 08:08:30'),(5,2,5,'Sprite','2018-11-15 08:08:42','2018-11-15 08:08:42'),(6,2,6,'Tea','2018-11-15 08:08:51','2018-11-15 08:08:51'),(7,3,7,'Chicken Combo Meal','2018-11-15 08:09:09','2018-11-15 08:09:09'),(8,3,8,'Pork Combo Meal','2018-11-15 08:09:24','2018-11-15 08:09:24'),(9,3,9,'Fish Combo Meal','2018-11-15 08:09:37','2018-11-15 08:09:37');
/*!40000 ALTER TABLE `omop_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_migrations`
--

DROP TABLE IF EXISTS `omop_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_migrations`
--

LOCK TABLES `omop_migrations` WRITE;
/*!40000 ALTER TABLE `omop_migrations` DISABLE KEYS */;
INSERT INTO `omop_migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_11_15_031055_create_categories_table',1),(4,'2018_11_15_031356_create_menus_table',1),(5,'2018_11_15_034419_create_products_table',1),(6,'2018_11_15_072652_create_orders_table',1),(7,'2018_11_15_073158_create_coupons_table',1);
/*!40000 ALTER TABLE `omop_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_order`
--

DROP TABLE IF EXISTS `omop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  `discount` double NOT NULL,
  `coupon_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_order`
--

LOCK TABLES `omop_order` WRITE;
/*!40000 ALTER TABLE `omop_order` DISABLE KEYS */;
INSERT INTO `omop_order` VALUES (1,56.7,6.3,'1','2018-11-16 01:45:43','2018-11-16 01:45:43'),(2,56.7,6.3,'1','2018-11-16 01:46:58','2018-11-16 01:46:58'),(3,48,0,'0','2018-11-16 01:48:31','2018-11-16 01:48:31'),(4,101.7,11.3,'1','2018-11-16 01:52:19','2018-11-16 01:52:19'),(5,92.7,10.3,'1','2018-11-16 01:54:37','2018-11-16 01:54:37'),(6,43.2,4.8,'1','2018-11-16 02:15:34','2018-11-16 02:15:34'),(7,71,0,'0','2018-11-19 05:03:18','2018-11-19 05:03:18'),(8,71,0,'0','2018-11-19 05:03:27','2018-11-19 05:03:27');
/*!40000 ALTER TABLE `omop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_ordered_product`
--

DROP TABLE IF EXISTS `omop_ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_ordered_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_ordered_product`
--

LOCK TABLES `omop_ordered_product` WRITE;
/*!40000 ALTER TABLE `omop_ordered_product` DISABLE KEYS */;
INSERT INTO `omop_ordered_product` VALUES (1,5,'2018-11-16 01:54:41','2018-11-16 01:54:41'),(2,5,'2018-11-16 01:54:42','2018-11-16 01:54:42'),(3,5,'2018-11-16 01:54:42','2018-11-16 01:54:42'),(4,5,'2018-11-16 01:54:43','2018-11-16 01:54:43'),(5,5,'2018-11-16 01:54:44','2018-11-16 01:54:44'),(6,6,'2018-11-16 02:15:35','2018-11-16 02:15:35'),(7,6,'2018-11-16 02:15:35','2018-11-16 02:15:35'),(8,7,'2018-11-19 05:03:19','2018-11-19 05:03:19'),(9,7,'2018-11-19 05:03:20','2018-11-19 05:03:20'),(10,7,'2018-11-19 05:03:20','2018-11-19 05:03:20'),(11,8,'2018-11-19 05:03:28','2018-11-19 05:03:28'),(12,8,'2018-11-19 05:03:28','2018-11-19 05:03:28'),(13,8,'2018-11-19 05:03:28','2018-11-19 05:03:28');
/*!40000 ALTER TABLE `omop_ordered_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_password_resets`
--

DROP TABLE IF EXISTS `omop_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `omop_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_password_resets`
--

LOCK TABLES `omop_password_resets` WRITE;
/*!40000 ALTER TABLE `omop_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `omop_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omop_product`
--

DROP TABLE IF EXISTS `omop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_product`
--

LOCK TABLES `omop_product` WRITE;
/*!40000 ALTER TABLE `omop_product` DISABLE KEYS */;
INSERT INTO `omop_product` VALUES (1,'Hotdog','hotdog.jpg',23,'2018-11-15 07:52:30','2018-11-15 07:52:30'),(2,'Cheese Burger','hamburger.jpg',25,'2018-11-15 07:54:17','2018-11-15 07:54:17'),(3,'Fries','fries.jpg',15,'2018-11-15 07:55:08','2018-11-15 07:55:08'),(4,'Coke','coke.jpg',20,'2018-11-15 07:55:37','2018-11-15 07:55:37'),(5,'Sprite','sprite.jpg',20,'2018-11-15 07:55:58','2018-11-15 07:55:58'),(6,'Tea','tea.jpg',20,'2018-11-15 07:56:09','2018-11-15 07:56:09'),(7,'Chicken Combo Meal','chicken-combo.jpg',30,'2018-11-15 07:58:55','2018-11-15 07:58:55'),(8,'Pork Combo Meal','pork-combo.jpg',30,'2018-11-15 07:59:25','2018-11-15 07:59:25'),(9,'Fish Combo Meal','fish-combo.jpg',30,'2018-11-15 07:59:37','2018-11-15 07:59:37');
/*!40000 ALTER TABLE `omop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `omop_product_view`
--

DROP TABLE IF EXISTS `omop_product_view`;
/*!50001 DROP VIEW IF EXISTS `omop_product_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `omop_product_view` AS SELECT 
 1 AS `menud_id`,
 1 AS `menu_name`,
 1 AS `category_id`,
 1 AS `category_name`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_image`,
 1 AS `product_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `omop_users`
--

DROP TABLE IF EXISTS `omop_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `omop_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `omop_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omop_users`
--

LOCK TABLES `omop_users` WRITE;
/*!40000 ALTER TABLE `omop_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `omop_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `omop_product_view`
--

/*!50001 DROP VIEW IF EXISTS `omop_product_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`flashery`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `omop_product_view` AS select `m`.`id` AS `menud_id`,`m`.`name` AS `menu_name`,`c`.`id` AS `category_id`,`c`.`name` AS `category_name`,`p`.`id` AS `product_id`,`p`.`name` AS `product_name`,`p`.`image` AS `product_image`,`p`.`price` AS `product_price` from ((`omop_menu` `m` left join `omop_category` `c` on((`m`.`category_id` = `c`.`id`))) left join `omop_product` `p` on((`m`.`product_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19  5:44:17
