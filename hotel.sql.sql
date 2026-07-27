-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: sqlproject
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL,
  `booking_date` date DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cus_id` int NOT NULL,
  `cus_name` varchar(50) DEFAULT NULL,
  `ph_no` bigint DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `doc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`cus_id`) REFERENCES `hotel` (`ho_id`),
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`cus_id`) REFERENCES `feedback` (`feed_id`),
  CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`cus_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`cus_id`) REFERENCES `hotel` (`ho_id`),
  CONSTRAINT `customer_ibfk_6` FOREIGN KEY (`cus_id`) REFERENCES `feedback` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feed_id` int NOT NULL,
  `rating` float DEFAULT NULL,
  `comments` varchar(60) DEFAULT NULL,
  `feed_date` date DEFAULT NULL,
  PRIMARY KEY (`feed_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`feed_id`) REFERENCES `hotel` (`ho_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `ho_id` int NOT NULL,
  `ho_name` varchar(50) DEFAULT NULL,
  `loc` varchar(60) DEFAULT NULL,
  `ph` bigint DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ho_id`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ho_id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`ho_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`ho_id`) REFERENCES `feedback` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `payment_ibfk_4` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`),
  CONSTRAINT `payment_ibfk_5` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `payment_ibfk_6` FOREIGN KEY (`id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `room_name` varchar(50) DEFAULT NULL,
  `room_typr_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room_type` (`id`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `service` (`id`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `customer` (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `room_type_ibfk_1` FOREIGN KEY (`id`) REFERENCES `service` (`id`),
  CONSTRAINT `room_type_ibfk_2` FOREIGN KEY (`id`) REFERENCES `hotel` (`ho_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL,
  `ser_name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `ser_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_details`
--

DROP TABLE IF EXISTS `service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_details` (
  `id` int NOT NULL,
  `ser_date` date DEFAULT NULL,
  `remarks` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `service_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `service_details_ibfk_2` FOREIGN KEY (`id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_details`
--

LOCK TABLES `service_details` WRITE;
/*!40000 ALTER TABLE `service_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `sta_name` varchar(50) DEFAULT NULL,
  `ph_no` bigint DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `hotel` (`ho_id`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sqlproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-26 23:14:04
