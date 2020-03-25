CREATE DATABASE  IF NOT EXISTS `refuge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `refuge`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: refuge
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Temporary view structure for view `annual donations`
--

DROP TABLE IF EXISTS `annual donations`;
/*!50001 DROP VIEW IF EXISTS `annual donations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `annual donations` AS SELECT 
 1 AS `Donation date`,
 1 AS `Donor name`,
 1 AS `Donation amount`,
 1 AS `Allocated to`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `counselor_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`counselor_id`,`visitor_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`counselor_id`) REFERENCES `counselor` (`counselor_id`) ON UPDATE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,'2019-10-07','12:00:00','12:45:00'),(1,6,'2019-10-08','02:00:00','02:45:00'),(1,11,'2019-10-09','02:30:00','03:15:00'),(1,16,'2019-10-10','03:00:00','03:45:00'),(2,2,'2019-10-07','12:00:00','12:45:00'),(2,7,'2019-10-08','02:00:00','02:45:00'),(2,12,'2019-10-09','02:30:00','03:15:00'),(2,17,'2019-10-10','03:00:00','03:45:00'),(3,3,'2019-10-07','12:00:00','12:45:00'),(3,8,'2019-10-08','02:00:00','02:45:00'),(3,13,'2019-10-09','02:30:00','03:15:00'),(3,18,'2019-10-10','03:00:00','03:45:00'),(4,4,'2019-10-07','12:00:00','12:45:00'),(4,9,'2019-10-08','02:00:00','02:45:00'),(4,14,'2019-10-09','02:30:00','03:15:00'),(4,19,'2019-10-10','03:00:00','03:45:00'),(5,5,'2019-10-07','12:00:00','12:45:00'),(5,10,'2019-10-08','02:00:00','02:45:00'),(5,15,'2019-10-09','02:30:00','03:15:00');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `employee_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `checkin_date` datetime NOT NULL,
  PRIMARY KEY (`employee_id`,`visitor_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE,
  CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
INSERT INTO `checkin` VALUES (1,1,'2019-11-02 00:00:00'),(1,4,'2019-11-05 00:00:00'),(1,6,'2019-11-06 00:00:00'),(1,10,'2019-11-06 00:00:00'),(1,14,'2019-11-07 00:00:00'),(1,18,'2019-11-08 00:00:00'),(2,2,'2018-06-06 00:00:00'),(2,7,'2019-11-06 00:00:00'),(2,11,'2019-11-07 00:00:00'),(2,15,'2019-11-07 00:00:00'),(2,19,'2019-11-08 00:00:00'),(3,3,'2019-11-04 00:00:00'),(3,5,'2019-11-06 00:00:00'),(3,8,'2019-11-06 00:00:00'),(3,12,'2019-11-07 00:00:00'),(3,16,'2019-11-08 00:00:00'),(4,9,'2019-11-06 00:00:00'),(4,13,'2019-11-07 00:00:00'),(4,17,'2019-11-08 00:00:00');
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counselor`
--

DROP TABLE IF EXISTS `counselor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counselor` (
  `counselor_id` int(11) NOT NULL AUTO_INCREMENT,
  `counselor_f_name` varchar(220) NOT NULL,
  `counselor_l_name` varchar(220) NOT NULL,
  PRIMARY KEY (`counselor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counselor`
--

LOCK TABLES `counselor` WRITE;
/*!40000 ALTER TABLE `counselor` DISABLE KEYS */;
INSERT INTO `counselor` VALUES (1,'Enrique','Iglesias'),(2,'Oprah','Winfrey'),(3,'Anthony','Cocciolo'),(4,'Vinette','Thomas'),(5,'Anthony','Hopkins');
/*!40000 ALTER TABLE `counselor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `daily entrances`
--

DROP TABLE IF EXISTS `daily entrances`;
/*!50001 DROP VIEW IF EXISTS `daily entrances`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daily entrances` AS SELECT 
 1 AS `Visitor`,
 1 AS `Time of Entry`,
 1 AS `Entrance Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donor_id` int(11) NOT NULL,
  `fund_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `donation_amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`donor_id`,`fund_id`),
  KEY `fund_id` (`fund_id`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`) ON UPDATE CASCADE,
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (1,1,'2018-10-15',30000.00),(2,2,'2019-09-01',25000.00),(3,3,'2019-09-20',33333.33),(4,3,'2019-09-19',33333.33),(5,3,'2019-10-10',1282.05),(6,4,'2019-06-06',50000.00),(7,3,'2019-06-07',2564.10),(8,3,'2019-06-08',2564.10),(9,3,'2019-06-09',2564.10),(10,3,'2019-06-10',2564.10),(11,3,'2019-06-11',2564.10),(12,3,'2019-06-12',2564.10),(13,3,'2019-06-13',2564.10),(14,3,'2019-06-14',2564.10),(15,3,'2019-06-15',2564.10),(16,3,'2019-06-16',2564.10),(17,3,'2019-06-17',2564.10),(18,3,'2019-06-18',2564.14),(19,3,'2019-06-19',1282.05);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donor_id` int(11) NOT NULL AUTO_INCREMENT,
  `donor_f_name` varchar(250) NOT NULL,
  `donor_l_name` varchar(250) NOT NULL,
  `street` varchar(220) NOT NULL,
  `city` varchar(220) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `email` varchar(220) NOT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (1,'Michael','Bloomberg','100 Avenue of the Americas','New York','NY','10001','(678) 231-4576','bigbossboy@bloomberg.com'),(2,'Hillary','Clinton','1600 Pennsylvania Ave','I Wish','DC','98101','(657) 124-9857','hclinton@cf.com'),(3,'John','Smith','988 Regular Person Lane','Lewistown','MT','59441','(406) 366-0177','jsmith@hotmail.com'),(4,'Patty','Smith','400 Kitchen Avenue','Red Hill','MI','78654','(647) 231-7689','pattylovescats@yahoo.com'),(5,'La','Croix','600 Macbook Lane','Thomspon','MA','87491','(786) 214-9087','la@croix.com'),(6,'Bill','Gates','788 Lake Washington','Seattle','WA','97686','(967) 465-9087','bgates@bmgf.com'),(7,'Kayden','Moya','277 South Glenridge Lane','Tallcaster City','TX','60950','(678) 231-4576','padme@aol.com'),(8,'Laney','Muñoz','863 W. Lake View Ave.','Fauxstead','LA','61180','(657) 124-9857','ivoibs@outlook.com'),(9,'Samara','Marín','8459 Smith Ave.','Ashpool','MN','11735','(406) 366-0177','seurat@yahoo.com'),(10,'Emilia','Márquez','9590 Pierce Avenue','Fauxburg','MI','18702','(647) 231-7689','bcevc@att.net'),(11,'Robert','Soto','78 W. Cedarwood Ave.','North Dayburg','MT','19426','(786) 214-9087','maneesh@verizon.net'),(12,'Larissa','Montoro','31 Circle Road','Fishby','CA','27012','(967) 465-9087','muzzy@aol.com'),(13,'Lydia','Lozano','9615 E. Wall St.','Casterville','WA','21093','(401) 616-0071','scotfl@optonline.net'),(14,'Tania','Ruiz','9983 Circle Avenue','Great Eastdale','OR','44133','(764) 967-2017','niknejad@outlook.com'),(15,'Phoenix','Gallego','35 Lyme Street','Capworth','NY','24012','(419) 344-9522','jfinke@msn.com'),(16,'Santiago','Cambil','278 School Street','South Wheelkarta','CO','30180','(648) 380-8858','overbom@att.net'),(17,'Virginia','Castillo','8235 Glen Eagles St.','Fauxland','PA','44691','(307) 325-9570','bruck@mac.com'),(18,'Hazel','Ramírez','2 Wintergreen Street','Southborough','DC','27330','(700) 676-6055','cremonini@aol.com'),(19,'Logan','Suárez','7166B Oak Ave.','South Sagefolk','FL','11725','(602) 599-0711','violinhi@optonline.net');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `f_name` varchar(220) NOT NULL,
  `l_name` varchar(220) NOT NULL,
  `street` varchar(220) NOT NULL,
  `city` varchar(220) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `dob` date NOT NULL,
  `ssn` varchar(12) NOT NULL,
  `email` varchar(220) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Director','Paula','Nguyen','3344 Williamsburg Avenue','Brooklyn','NY','11889','(666) 420-8989','1983-09-30','777-777-7777','pnguyen@refuge.com',NULL),(2,'Associate','Sharon','Gladwell','2803 Durbin Way','Brooklyn','NY','11221','(671) 234-5876','1989-06-25','555-555-5555','sgladwell@refuge.com',1),(3,'Associate','Michael','Balrag','666 Big Whoop Street','New York','NY','99001','(623) 123-9087','1993-09-20','111-111-1111','mbalrag@refuge.com',1),(4,'Associate','Penelope','Cruz','789 Hollywood Lane','Staten Island','NY','12131','(768) 224-5567','1990-02-10','222-222-2222','pcruz@refuge.com',1),(5,'Database Manager','Drew','Stanley','716 Knickerbocker Avenue','Brooklyn','NY','11221','(512) 621-9072','1989-06-25','444-444-4444','dstanley@refuge.com',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrance`
--

DROP TABLE IF EXISTS `entrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrance` (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` enum('main entrance','back entrance','emergency a','emergency b') NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrance`
--

LOCK TABLES `entrance` WRITE;
/*!40000 ALTER TABLE `entrance` DISABLE KEYS */;
INSERT INTO `entrance` VALUES (1,'main entrance'),(2,'back entrance'),(3,'emergency a'),(4,'emergency b');
/*!40000 ALTER TABLE `entrance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entry` (
  `entry_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`visitor_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `entry_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `entrance` (`entry_id`) ON UPDATE CASCADE,
  CONSTRAINT `entry_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
INSERT INTO `entry` VALUES (1,1,'2019-12-09 03:41:07'),(1,2,'2019-12-09 03:41:07'),(1,5,'2019-11-01 05:11:20'),(1,9,'2019-12-09 03:41:08'),(1,10,'2019-12-09 03:41:08'),(1,17,'2019-12-09 03:41:08'),(1,18,'2019-12-09 03:41:08'),(2,2,'2019-12-09 00:49:04'),(2,3,'2019-11-01 07:03:01'),(2,4,'2019-12-09 03:41:07'),(2,11,'2019-12-09 03:41:08'),(2,12,'2019-12-09 03:41:08'),(2,19,'2019-12-09 03:41:08'),(3,2,'2019-11-03 16:30:30'),(3,5,'2019-12-09 03:41:07'),(3,6,'2019-12-09 03:41:07'),(3,13,'2019-12-09 03:41:08'),(3,14,'2019-12-09 03:41:08'),(4,4,'2019-11-04 15:12:10'),(4,7,'2019-12-09 03:41:08'),(4,8,'2019-12-09 03:41:08'),(4,15,'2019-12-09 03:41:08'),(4,16,'2019-12-09 03:41:08');
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `account_name` enum('travel','food','admin','employee wellness') NOT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,1,'travel',300.00),(2,1,'employee wellness',50.00),(3,1,'food',30.28),(4,1,'food',15.10),(5,1,'food',15.50),(6,1,'food',8.95),(7,1,'admin',16.00),(8,1,'travel',350.00),(9,1,'admin',5.00),(10,1,'employee wellness',30.00),(11,1,'food',15.67),(12,1,'travel',400.00),(13,1,'employee wellness',50.00),(14,1,'food',49.93),(15,1,'food',20.49),(16,1,'food',30.30),(17,1,'admin',30.00),(18,1,'admin',5.57),(19,1,'admin',6.98),(20,1,'admin',35.00);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!50001 DROP VIEW IF EXISTS `expenses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `expenses` AS SELECT 
 1 AS `Transaction Date`,
 1 AS `Employee Name`,
 1 AS `Amount`,
 1 AS `Expense Description`,
 1 AS `Fund`,
 1 AS `Remaining Fund Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund` (
  `fund_id` int(11) NOT NULL AUTO_INCREMENT,
  `fund_name` enum('general','bill and melinda gates foundation','bloomberg foundation','clinton foundation') NOT NULL,
  `fund_amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`fund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
INSERT INTO `fund` VALUES (1,'bloomberg foundation',30000.00),(2,'clinton foundation',25000.00),(3,'general',100000.00),(4,'bill and melinda gates foundation',50000.00);
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing`
--

DROP TABLE IF EXISTS `housing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housing` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing`
--

LOCK TABLES `housing` WRITE;
/*!40000 ALTER TABLE `housing` DISABLE KEYS */;
INSERT INTO `housing` VALUES (1,'1A'),(2,'1B'),(3,'1C'),(4,'1D'),(5,'1E'),(6,'1F'),(7,'1G'),(8,'1H'),(9,'1I'),(10,'1J'),(11,'2A'),(12,'2B'),(13,'2C'),(14,'2D'),(15,'2E'),(16,'2F'),(17,'2G'),(18,'2H'),(19,'2I'),(20,'2J');
/*!40000 ALTER TABLE `housing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int(11) NOT NULL AUTO_INCREMENT,
  `meal_type` enum('breakfast','lunch','dinner') NOT NULL,
  `restriction` enum('vegetarian','vegan','gluten-free') DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (1,'breakfast',NULL),(2,'dinner','vegetarian'),(3,'lunch','gluten-free'),(4,'lunch',NULL),(5,'breakfast','vegan'),(6,'breakfast','vegetarian'),(7,'lunch','vegan'),(8,'dinner','vegan'),(9,'breakfast','gluten-free'),(10,'dinner','gluten-free'),(11,'lunch','vegetarian'),(12,'dinner',NULL);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral`
--

DROP TABLE IF EXISTS `referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral` (
  `referral_id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(220) NOT NULL,
  PRIMARY KEY (`referral_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral`
--

LOCK TABLES `referral` WRITE;
/*!40000 ALTER TABLE `referral` DISABLE KEYS */;
INSERT INTO `referral` VALUES (1,'Goodwill Industries'),(2,'Metropolitan Transportation Authority'),(3,'Duane Reade'),(4,'Starbucks Coffee'),(5,'Self'),(6,'West Village Urgent Care'),(7,'NYU Langone Health'),(8,'NYSC'),(9,'Salvation Army'),(10,'Planned Parenthood'),(11,'Westside Supermarket'),(12,'Pratt Institute'),(13,'City of New York'),(14,'Target'),(15,'Best Buy'),(16,'HousingWorks Health'),(17,'Central Park Conservancy'),(18,'Brooklyn Public Library'),(19,'New York Public Library'),(20,'Queens Public Library');
/*!40000 ALTER TABLE `referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `served`
--

DROP TABLE IF EXISTS `served`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `served` (
  `meal_id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`meal_id`,`visitor_id`),
  KEY `visitor_id` (`visitor_id`),
  CONSTRAINT `served_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`) ON UPDATE CASCADE,
  CONSTRAINT `served_ibfk_2` FOREIGN KEY (`visitor_id`) REFERENCES `visitor` (`visitor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `served`
--

LOCK TABLES `served` WRITE;
/*!40000 ALTER TABLE `served` DISABLE KEYS */;
INSERT INTO `served` VALUES (1,1,'2019-11-02 00:00:00'),(1,5,'2019-11-01 00:00:00'),(1,9,'2019-11-08 00:00:00'),(1,13,'2019-11-13 00:00:00'),(1,17,'2019-11-17 00:00:00'),(2,1,'2019-11-02 00:00:00'),(2,5,'2019-11-01 00:00:00'),(2,9,'2019-11-08 00:00:00'),(2,13,'2019-11-13 00:00:00'),(2,17,'2019-11-17 00:00:00'),(3,1,'2019-11-02 00:00:00'),(3,5,'2019-11-01 00:00:00'),(3,9,'2019-11-08 00:00:00'),(3,13,'2019-11-13 00:00:00'),(3,17,'2019-11-17 00:00:00'),(4,2,'2019-11-05 00:00:00'),(4,6,'2019-11-12 00:00:00'),(4,10,'2019-11-06 00:00:00'),(4,14,'2019-11-14 00:00:00'),(4,18,'2019-11-18 00:00:00'),(5,2,'2019-11-05 00:00:00'),(5,6,'2019-11-12 00:00:00'),(5,10,'2019-11-06 00:00:00'),(5,14,'2019-11-14 00:00:00'),(5,18,'2019-11-18 00:00:00'),(6,3,'2019-11-04 00:00:00'),(6,7,'2019-11-09 00:00:00'),(6,11,'2019-11-07 00:00:00'),(6,15,'2019-11-15 00:00:00'),(6,19,'2019-11-19 00:00:00'),(7,3,'2019-11-04 00:00:00'),(7,7,'2019-11-09 00:00:00'),(7,11,'2019-11-07 00:00:00'),(7,15,'2019-11-15 00:00:00'),(7,19,'2019-11-19 00:00:00'),(8,2,'2019-11-05 00:00:00'),(8,6,'2019-11-12 00:00:00'),(8,10,'2019-11-06 00:00:00'),(8,14,'2019-11-14 00:00:00'),(8,18,'2019-11-18 00:00:00'),(9,8,'2019-11-11 00:00:00'),(9,12,'2019-11-10 00:00:00'),(9,16,'2019-11-16 00:00:00'),(10,3,'2019-11-04 00:00:00'),(10,7,'2019-11-09 00:00:00'),(10,11,'2019-11-07 00:00:00'),(10,15,'2019-11-15 00:00:00'),(10,19,'2019-11-19 00:00:00'),(11,8,'2019-11-11 00:00:00'),(11,12,'2019-11-10 00:00:00'),(11,16,'2019-11-16 00:00:00'),(12,8,'2019-11-11 00:00:00'),(12,12,'2019-11-10 00:00:00'),(12,16,'2019-11-16 00:00:00');
/*!40000 ALTER TABLE `served` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `fund_id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `transaction_amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`fund_id`,`expense_id`),
  KEY `expense_id` (`expense_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON UPDATE CASCADE,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`expense_id`) REFERENCES `expense` (`expense_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'2019-10-29','Car rental for conference in Philadelphia',300.00),(1,7,'2019-11-04','Paper for office printer',16.00),(1,8,'2019-11-05','Flights for conference in D.C.',350.00),(1,9,'2019-11-06','Office decorations',5.00),(1,12,'2019-11-09','Car rental for Boston meeting',400.00),(1,17,'2019-11-14','Signs for front door',30.00),(1,18,'2019-11-15','Tape dispensers',5.57),(1,19,'2019-11-16','New sharpies \n',6.98),(2,2,'2019-10-30','Yoga retreat for staff',50.00),(2,10,'2019-11-07','Employee bonuses',30.00),(2,13,'2019-11-10','Gifts for employee party\n',50.00),(3,3,'2019-11-01','Staff lunch',30.28),(3,4,'2019-11-01','La Croix for staff kitchen',15.10),(3,5,'2019-11-03','Coffee for staff kitchen',15.50),(3,6,'2019-11-03','Candy for staff kitchen',8.95),(3,11,'2019-11-08','Pizza for staff and visitors',15.67),(3,14,'2019-11-11','Ice cream for friday social\n',49.93),(3,15,'2019-11-12','Staff Thanksgiving ingredients\n',20.49),(3,20,'2019-12-10','Cat food for shelter cat',35.00),(4,16,'2019-11-13','Monthly visitor food order',30.30);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usage`
--

DROP TABLE IF EXISTS `usage`;
/*!50001 DROP VIEW IF EXISTS `usage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usage` AS SELECT 
 1 AS `Visitor`,
 1 AS `Checkin Date`,
 1 AS `Assigned Counselor`,
 1 AS `Meals Eaten`,
 1 AS `Unit #`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `f_name` varchar(220) NOT NULL,
  `l_name` varchar(220) DEFAULT NULL,
  `street` varchar(220) DEFAULT NULL,
  `city` varchar(220) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `dob` date NOT NULL,
  `email` varchar(220) DEFAULT NULL,
  `referral_date` date NOT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `unit_id` (`unit_id`),
  KEY `referral_id` (`referral_id`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `housing` (`unit_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `visitor_ibfk_2` FOREIGN KEY (`referral_id`) REFERENCES `referral` (`referral_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,1,1,'Sharon','Stone','123 Washington Avenue','New York','NY','10001','(555) 231-4265','1989-05-01','sharon@sharonstone.edu','2019-11-01'),(2,2,3,'Drew','Stanley','411 14th Street','New York','NY','10001','(512) 621-9072','1990-01-01','dstanley@pratt.edu','2019-11-02'),(3,3,5,'Betty','White','1020 Hollywood Square','Los Angeles','CA','90210','(555) 555-5555','1998-07-04','betty@hollywood.com','2019-11-03'),(4,4,5,'Dax','Shepard','999 Palisade Place','San Francisco','CA','96758','(555) 101-5694','2001-02-22','dax@expert.com','2019-11-04'),(5,5,5,'Melinda','Gates','234 Lake Washington Avenue','Seattle','WA','98334','(221) 526-9087','1987-03-09','melinda@bmgf.org','2019-11-05'),(6,5,5,'Bill','Gates','234 Lake Washington Avenue','Seattle','WA','98334','(221) 526-9886','1970-01-02','bill@bmgf.org','2019-11-05'),(7,6,20,'Angel','Olson','768 Padia Street','Boston','MA','76859','(253) 566-4143','1978-07-18','studyabr@optonline.net','2017-02-28'),(8,7,19,'Ailín','Eickenhorst','8 Temple Drive','Washington','DC','54990','(443) 899-0125','1985-09-07','andersbr@comcast.net','2017-03-05'),(9,8,18,'Erna','March','9359 Carson St.','Arlington','TX','34997','(620) 536-5639','1990-10-30','denism@comcast.net','2017-03-25'),(10,20,17,'Edwin','Legates','13 Riverview Drive','Cincinnati','OH','39901','(538) 280-8697','1994-10-19','msroth@hotmail.com','2017-08-18'),(11,19,16,'Uma','Than','471 East White Rd.','Montgomery','AL','97920','(768) 426-8371','1995-04-05','kevinm@sbcglobal.net','2019-05-18'),(12,18,15,'Ninsun','Callihan','1 Applegate Dr.','Indianapolis','IN','96898','(731) 290-4426','1973-02-12','sabren@comcast.net','2017-06-24'),(13,17,14,'Katinka','Morales','7392 Livingston St.','El Paso','TX','38972','(314) 560-6049','1980-11-03','william@sbcglobal.net','2017-07-13'),(14,16,13,'Fidela','Cicone','7173 Ridgeview Road','Pittsburgh','PA','99403','(476) 290-1944','1986-09-16','oevans@att.net','2017-08-30'),(15,15,12,'Reg','Fontana','7198 Rockaway Dr.','San Antonio','TX','49971','(718) 716-4269','1988-09-03','qmacro@aol.com','2017-09-23'),(16,14,11,'Odhrán','Gurse','4 Bank Rd.','Austin','TX','59078','(605) 362-5452','1992-03-12','dmouse@outlook.com','2018-08-29'),(17,13,10,'Marcos','Mcmeeking','744 Mammoth Street','Fresno','NV','45999','(756) 975-1275','1974-08-04','kiddailey@outlook.com','2017-07-08'),(18,12,9,'Omar','Kademan','7980 Brickell Avenue','Memphis','TN','89883','(745) 651-3950','1982-04-15','dsugal@msn.com','2017-10-05'),(19,11,8,'Violet','Macleod','399 North Hill Street','Chesapeake','VA','57799','(389) 701-9522','1989-08-25','bachmann@aol.com','2018-07-29');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'refuge'
--

--
-- Dumping routines for database 'refuge'
--

--
-- Final view structure for view `annual donations`
--

/*!50001 DROP VIEW IF EXISTS `annual donations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `annual donations` AS select `donation`.`donation_date` AS `Donation date`,concat(`donor`.`donor_f_name`,' ',`donor`.`donor_l_name`) AS `Donor name`,concat('$',' ',`donation`.`donation_amount`) AS `Donation amount`,`fund`.`fund_name` AS `Allocated to` from ((`donor` join `donation` on((`donor`.`donor_id` = `donation`.`donor_id`))) join `fund` on((`donation`.`fund_id` = `fund`.`fund_id`))) where ((curdate() - interval 1 year) <= `donation`.`donation_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily entrances`
--

/*!50001 DROP VIEW IF EXISTS `daily entrances`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `daily entrances` AS select concat(`visitor`.`f_name`,' ',`visitor`.`l_name`) AS `Visitor`,`entry`.`time` AS `Time of Entry`,`entrance`.`location_name` AS `Entrance Location` from ((`visitor` join `entry` on((`visitor`.`visitor_id` = `entry`.`visitor_id`))) join `entrance` on((`entry`.`entry_id` = `entrance`.`entry_id`))) where (`entry`.`time` >= (now() - interval 1 day)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `expenses`
--

/*!50001 DROP VIEW IF EXISTS `expenses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `expenses` AS select `transaction`.`transaction_date` AS `Transaction Date`,concat(`employee`.`f_name`,' ',`employee`.`l_name`) AS `Employee Name`,concat('$',`transaction`.`transaction_amount`) AS `Amount`,`transaction`.`description` AS `Expense Description`,`fund`.`fund_name` AS `Fund`,(`fund`.`fund_amount` - `expense`.`amount`) AS `Remaining Fund Balance` from (((`transaction` join `expense` on((`transaction`.`expense_id` = `expense`.`expense_id`))) join `employee` on((`expense`.`employee_id` = `employee`.`employee_id`))) join `fund` on((`transaction`.`fund_id` = `fund`.`fund_id`))) where ((curdate() - interval 1 year) <= `transaction`.`transaction_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usage`
--

/*!50001 DROP VIEW IF EXISTS `usage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usage` AS select concat(`visitor`.`f_name`,' ',`visitor`.`l_name`) AS `Visitor`,`checkin`.`checkin_date` AS `Checkin Date`,concat(`counselor`.`counselor_f_name`,' ',`counselor`.`counselor_l_name`) AS `Assigned Counselor`,count(`served`.`meal_id`) AS `Meals Eaten`,`housing`.`unit_num` AS `Unit #` from ((((((`visitor` join `checkin` on((`visitor`.`visitor_id` = `checkin`.`visitor_id`))) join `appointment` on((`visitor`.`visitor_id` = `appointment`.`visitor_id`))) join `counselor` on((`appointment`.`counselor_id` = `counselor`.`counselor_id`))) join `served` on((`visitor`.`visitor_id` = `served`.`visitor_id`))) join `meal` on((`served`.`meal_id` = `meal`.`meal_id`))) join `housing` on((`visitor`.`unit_id` = `housing`.`unit_id`))) where (`checkin`.`checkin_date` >= (now() - interval 1 year)) group by `Visitor`,`Checkin Date`,`Assigned Counselor`,`Unit #` */;
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

-- Dump completed on 2019-12-11 13:14:44
