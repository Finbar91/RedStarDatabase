CREATE DATABASE  IF NOT EXISTS `Red_Star_FC` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Red_Star_FC`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: Red_Star_FC
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `BookID` varchar(5) NOT NULL,
  `BookDate` date DEFAULT NULL,
  `BookSTime` time DEFAULT NULL,
  `BookFTime` time DEFAULT NULL,
  `CustID` varchar(5) NOT NULL,
  `FacilityID` varchar(5) NOT NULL,
  `StaffID` varchar(5) NOT NULL,
  PRIMARY KEY (`BookID`),
  KEY `fk_Booking_Customer_idx` (`CustID`),
  KEY `fk_Booking_Facility1_idx` (`FacilityID`),
  KEY `fk_Booking_Staff1_idx` (`StaffID`),
  CONSTRAINT `fk_Booking_Customer` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Facility1` FOREIGN KEY (`FacilityID`) REFERENCES `Facility` (`FacilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_Staff1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('B1001','2017-09-11','06:00:00','07:00:00','A1001','F1001','S1001'),('B1002','2017-09-12','06:00:00','07:00:00','A1002','F1001','S1002'),('B1003','2017-09-13','06:00:00','07:00:00','A1003','F1001','S1003'),('B1004','2017-09-14','06:00:00','07:00:00','A1004','F1001','S1004'),('B1005','2017-09-11','06:00:00','07:00:00','A1005','F1001','S1005'),('B1006','2017-09-12','08:00:00','09:00:00','A1006','F1002','S1001'),('B1007','2017-09-13','08:00:00','09:00:00','A1007','F1002','S1002'),('B1008','2017-09-14','08:00:00','09:00:00','A1008','F1002','S1003'),('B1009','2017-09-11','08:00:00','09:00:00','A1009','F1002','S1004'),('B1010','2017-09-12','08:00:00','09:00:00','A1010','F1002','S1005'),('B1011','2017-09-13','07:00:00','08:00:00','A1011','F1003','S1001'),('B1012','2017-09-14','07:00:00','08:00:00','A1012','F1003','S1002'),('B1013','2017-09-11','07:00:00','08:00:00','A1013','F1003','S1003'),('B1014','2017-09-12','07:00:00','08:00:00','A1014','F1003','S1004'),('B1015','2017-09-13','07:00:00','08:00:00','A1015','F1003','S1005'),('B1016','2017-09-14','08:00:00','12:00:00','A1016','F1004','S1001'),('B1017','2017-09-11','08:00:00','12:00:00','A1017','F1004','S1002'),('B1018','2017-09-12','08:00:00','12:00:00','A1018','F1004','S1003'),('B1019','2017-09-13','08:00:00','12:00:00','A1019','F1004','S1004'),('B1020','2017-09-14','08:00:00','12:00:00','A1020','F1004','S1005');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustID` varchar(5) NOT NULL,
  `CustFName` char(15) DEFAULT NULL,
  `CustLName` char(15) DEFAULT NULL,
  `CustAddr1` varchar(30) DEFAULT NULL,
  `CustAddr2` varchar(30) DEFAULT NULL,
  `CustEmail` varchar(30) DEFAULT NULL,
  `CustPhoneNo` int(11) DEFAULT NULL,
  `Member` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('A1001','Ray','Roche','123 Hyde Road','Dunmore','Ray1@hotmail.com',897889876,1),('A1002','Thomas','Lyons','12 Hurley Lane','Tramore','Tomo@hotmail.com',876123432,0),('A1003','Barry','Egan','7 Johns Hill','Waterford','Barry@gmail.com',831345487,1),('A1004','Warren','Roche','89 Glen Cove','Waterford','Warren76@gmail.com',854560098,0),('A1005','Quentin','Tarantino','65 Bills Park','Kilmeaden','Q92@hotmail.com',871903987,0),('A1006','Andy','Reid','34 Earls Place','Waterford','Andy@gmail.com',891339664,1),('A1007','Harry','Young','122 Uluru Park ','Tramore','HarHar@gmail.com',861099002,0),('A1008','Paul','Rohan','33 Oaks Place','Woodstown','Rohan@hotmail.com',872179209,1),('A1009','Mick','Orpen','33 Old Road','Ballygunner','Mo@hotmail.com',837895972,1),('A1010','Roman','Weaver','88 Park Road','Waterford','Roman@gmail.com ',873106627,0),('A1011','Theo','Garcia','123 Riverwalk','Tramore','Theo@hotmail.com ',884532711,0),('A1012','Lyle','Salas','22 Hunts Hill','Dunmore','Lyle@gmail.com',858957767,0),('A1013','Fred','Todd','66 York Street','Kilmeaden','Fred@hotmail.com ',892844084,0),('A1014','Daniel','Briggs','123 The Glen ','Waterford','Daniel@gmail.com ',862907103,0),('A1015','Damian','Shaffer','56 The Folly','Ballygunner','Damian@gmail.com ',891165541,0),('A1016','Clinton','Sosa','73 Willow Row','Tramore','Clinton@hotmail.com ',853167307,0),('A1017','Cornell','Martin','95 Phillips Hill','Waterford','Cornell@hotmail.com ',877654911,0),('A1018','Chong','Chan','754 Earls Row','Kilmeaden','Chong@gmail.com ',894233273,0),('A1019','Raleigh','Pennington','34 The Igloo','Ballygunner','Raleigh@hotmail.com ',878667327,0),('A1020','Luke','Mahoney','7 Church Row ','Waterford','Luke@hotmail.com',882348765,0);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facility`
--

DROP TABLE IF EXISTS `Facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facility` (
  `FacilityID` varchar(5) NOT NULL,
  `FacilityDesc` char(15) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facility`
--

LOCK TABLES `Facility` WRITE;
/*!40000 ALTER TABLE `Facility` DISABLE KEYS */;
INSERT INTO `Facility` VALUES ('F1001','Quarter Pitch',40.00),('F1002','Half Pitch',55.00),('F1003','Full Pitch',75.00),('F1004','Clubhouse',250.00);
/*!40000 ALTER TABLE `Facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Member` (
  `MemberID` varchar(5) NOT NULL,
  `MemberFName` char(15) DEFAULT NULL,
  `MemberLName` char(15) DEFAULT NULL,
  `MemberEmail` varchar(30) DEFAULT NULL,
  `MemberPhoneNo` int(11) DEFAULT NULL,
  `MemberAddr1` varchar(30) DEFAULT NULL,
  `MemberAddr2` varchar(30) DEFAULT NULL,
  `MemberTypeID` varchar(5) NOT NULL,
  PRIMARY KEY (`MemberID`),
  KEY `fk_Member_MembershipType1_idx` (`MemberTypeID`),
  CONSTRAINT `fk_Member_MembershipType1` FOREIGN KEY (`MemberTypeID`) REFERENCES `MembershipType` (`MemberTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES ('M1001','Ray','Roche','Ray1@hotmail.com',897889876,'123 Hyde Road','Dunmore','T1001'),('M1002','Barry','Egan','Barry@gmail.com',831345487,'7 Johns Hill','Waterford','T1001'),('M1003','Andy','Reid','Andy@gmail.com',891339664,'34 Earls Place','Waterford','T1002'),('M1004','Paul','Rohan','Rohan@hotmail.com',872179209,'33 Oaks Place','Woodstown','T1003'),('M1005','Mick','Orpen','Mo@hotmail.com',837895972,'33 Old Road','Ballygunner','T1003'),('M1006','Richard','Carr','richard.carr@gmail',872179208,'44 Igloo Street','Waterford','T1001'),('M1007','Jacob','Wilson','jacob.wilson@gmail',872179210,'88 Nuns Lane','Ballygunner','T1001'),('M1008','Christian','Springer','christian.springer@gmail',872179211,'9 Jupiter Road','Woodstown','T1001'),('M1009','Dan','Langdon','dan.langdon@gmail',837895973,'126 Barber Street','Waterford','T1001'),('M1010','Dominic','Sharp','dominic.sharp@gmail',837895974,'33 Earl Street','Waterford','T1001'),('M1011','Carl','McGrath','carl.mcgrath@gmail',837895975,'55 Regency Row','Woodstown','T1002'),('M1012','Sebastian','Marshall','sebastian.marshall@gmail',837895976,'67 Ball Street','Dunmore','T1002'),('M1013','Eric','Stewart','eric.stewart@gmail',837895977,'68 Hunter Park','Ballygunner','T1002'),('M1014','Harry','Graham','harry.graham@gmail',831345467,'983 Polo Row','Dunmore','T1002'),('M1015','Warren','Davidson','warren.davidson@gmail',831345488,'23 Wilkins Court','Waterford','T1002'),('M1016','James','Oliver','james.oliver@gmail',831345489,'234 Kings Slip','Dunmore','T1002'),('M1017','Joseph','Payne','joseph.payne@gmail',831345490,'123 Nolan Street','Dunmore','T1003'),('M1018','Sean','Chapman','sean.chapman@gmail',891339634,'45 Tibot Avenue','Ballygunner','T1003'),('M1019','Evan','Coleman','evan.coleman@gmail',891339665,'67 Sesame Street','Ballygunner','T1003'),('M1020','Justin','Davies','justin.davies@gmail',891339666,'23 Pointer Lane','Ballygunner','T1003');
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembershipType`
--

DROP TABLE IF EXISTS `MembershipType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembershipType` (
  `MemberTypeID` varchar(5) NOT NULL,
  `MemberTypeDescr` varchar(30) DEFAULT NULL,
  `AnnualFee` decimal(10,2) DEFAULT NULL,
  `DueDate` date DEFAULT NULL,
  PRIMARY KEY (`MemberTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembershipType`
--

LOCK TABLES `MembershipType` WRITE;
/*!40000 ALTER TABLE `MembershipType` DISABLE KEYS */;
INSERT INTO `MembershipType` VALUES ('T1001','Player',200.00,'2017-09-16'),('T1002','Manager/ Coach',125.00,'2017-09-16'),('T1003','Other',75.00,'2017-09-16');
/*!40000 ALTER TABLE `MembershipType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `PayID` varchar(5) NOT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `DatePaid` date DEFAULT NULL,
  `CustID` varchar(5) DEFAULT NULL,
  `MemberID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PayID`),
  KEY `fk_Payment_Customer1_idx` (`CustID`),
  KEY `fk_Payment_Member1_idx` (`MemberID`),
  CONSTRAINT `fk_Payment_Customer1` FOREIGN KEY (`CustID`) REFERENCES `Customer` (`CustID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_Member1` FOREIGN KEY (`MemberID`) REFERENCES `Member` (`MemberID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES ('P1001',40.00,'2017-09-11','A1001',NULL),('P1002',40.00,'2017-09-12','A1002',NULL),('P1003',40.00,'2017-09-13','A1003',NULL),('P1004',40.00,'2017-09-14','A1004',NULL),('P1005',40.00,'2017-09-15','A1005',NULL),('P1006',55.00,'2017-09-16','A1006',NULL),('P1007',55.00,'2017-09-17','A1007',NULL),('P1008',55.00,'2017-09-18','A1008',NULL),('P1009',55.00,'2017-09-19','A1009',NULL),('P1010',55.00,'2017-09-20','A1010',NULL),('P1011',75.00,'2017-09-21','A1011',NULL),('P1012',75.00,'2017-09-22','A1012',NULL),('P1013',75.00,'2017-09-23','A1013',NULL),('P1014',75.00,'2017-09-24','A1014',NULL),('P1015',75.00,'2017-09-25','A1015',NULL),('P1016',250.00,'2017-09-26','A1016',NULL),('P1017',250.00,'2017-09-27','A1017',NULL),('P1018',250.00,'2017-09-28','A1018',NULL),('P1019',250.00,'2017-09-29','A1019',NULL),('P1020',250.00,'2017-09-30','A1020',NULL),('P1021',200.00,'2017-09-11',NULL,'M1001'),('P1022',200.00,'2017-09-12',NULL,'M1002'),('P1023',125.00,'2017-09-13',NULL,'M1003'),('P1024',75.00,'2017-09-14',NULL,'M1004'),('P1025',75.00,'2017-09-15',NULL,'M1005'),('P1026',200.00,'2017-09-16',NULL,'M1006'),('P1027',200.00,'2017-09-17',NULL,'M1007'),('P1028',200.00,'2017-09-18',NULL,'M1008'),('P1029',200.00,'2017-09-19',NULL,'M1009'),('P1030',200.00,'2017-09-20',NULL,'M1010'),('P1031',125.00,'2017-09-21',NULL,'M1011'),('P1032',125.00,'2017-09-22',NULL,'M1012'),('P1033',125.00,'2017-09-23',NULL,'M1013'),('P1034',125.00,'2017-09-24',NULL,'M1014'),('P1035',125.00,'2017-09-25',NULL,'M1015'),('P1036',125.00,'2017-09-26',NULL,'M1016'),('P1037',75.00,'2017-09-27',NULL,'M1017'),('P1038',75.00,'2017-09-28',NULL,'M1018'),('P1039',75.00,'2017-09-29',NULL,'M1019'),('P1040',75.00,'2017-09-30',NULL,'M1020');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `StaffID` varchar(5) NOT NULL,
  `StaffFName` char(15) DEFAULT NULL,
  `StaffLName` char(15) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('S1001','Billy','Murphy'),('S1002','Jamie','Sisley'),('S1003','Dan','Smith'),('S1004','Kim','Dalton'),('S1005','Walt','Longmire');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!50001 DROP VIEW IF EXISTS `booking_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `booking_details` AS SELECT 
 1 AS `Customer_First_Name`,
 1 AS `Customer_Last_Name`,
 1 AS `Booking_Identity`,
 1 AS `Booking_Date`,
 1 AS `Booking_Start_Time`,
 1 AS `Booking_Finish_Time`,
 1 AS `Staff_Identity`,
 1 AS `Staff_First_Name`,
 1 AS `Staff_Last_Name`,
 1 AS `Facility_Identity`,
 1 AS `Facility_Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bookings_before_8`
--

DROP TABLE IF EXISTS `bookings_before_8`;
/*!50001 DROP VIEW IF EXISTS `bookings_before_8`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookings_before_8` AS SELECT 
 1 AS `Booking_Identity_No`,
 1 AS `Booking_Date`,
 1 AS `Booking_Start_Time`,
 1 AS `Booking_Finish_Time`,
 1 AS `Customer_Identity_Number`,
 1 AS `Facility_Identity_Number`,
 1 AS `Staff_Identity_Number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_booking_view`
--

DROP TABLE IF EXISTS `customer_booking_view`;
/*!50001 DROP VIEW IF EXISTS `customer_booking_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_booking_view` AS SELECT 
 1 AS `Booking_Identity_Number`,
 1 AS `Booking_Date`,
 1 AS `Book_Start_Time`,
 1 AS `Book_Finish_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highest_payments`
--

DROP TABLE IF EXISTS `highest_payments`;
/*!50001 DROP VIEW IF EXISTS `highest_payments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `highest_payments` AS SELECT 
 1 AS `Payment_Identity_Number`,
 1 AS `Amount`,
 1 AS `DatePaid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `booking_details`
--

/*!50001 DROP VIEW IF EXISTS `booking_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booking_details` AS select `customer`.`CustFName` AS `Customer_First_Name`,`customer`.`CustLName` AS `Customer_Last_Name`,`booking`.`BookID` AS `Booking_Identity`,`booking`.`BookDate` AS `Booking_Date`,`booking`.`BookSTime` AS `Booking_Start_Time`,`booking`.`BookFTime` AS `Booking_Finish_Time`,`staff`.`StaffID` AS `Staff_Identity`,`staff`.`StaffFName` AS `Staff_First_Name`,`staff`.`StaffLName` AS `Staff_Last_Name`,`facility`.`FacilityID` AS `Facility_Identity`,`facility`.`FacilityDesc` AS `Facility_Description` from (((`customer` join `booking` on((`booking`.`CustID` = `customer`.`CustID`))) join `facility` on((`booking`.`FacilityID` = `facility`.`FacilityID`))) join `staff` on((`booking`.`StaffID` = `staff`.`StaffID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bookings_before_8`
--

/*!50001 DROP VIEW IF EXISTS `bookings_before_8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookings_before_8` AS select `booking`.`BookID` AS `Booking_Identity_No`,`booking`.`BookDate` AS `Booking_Date`,`booking`.`BookSTime` AS `Booking_Start_Time`,`booking`.`BookFTime` AS `Booking_Finish_Time`,`booking`.`CustID` AS `Customer_Identity_Number`,`booking`.`FacilityID` AS `Facility_Identity_Number`,`booking`.`StaffID` AS `Staff_Identity_Number` from `booking` where (`booking`.`BookFTime` <= '8:00') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_booking_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_booking_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_booking_view` AS select `booking`.`BookID` AS `Booking_Identity_Number`,`booking`.`BookDate` AS `Booking_Date`,`booking`.`BookSTime` AS `Book_Start_Time`,`booking`.`BookFTime` AS `Book_Finish_Time` from `booking` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_payments`
--

/*!50001 DROP VIEW IF EXISTS `highest_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_payments` AS select `payment`.`PayID` AS `Payment_Identity_Number`,`payment`.`Amount` AS `Amount`,`payment`.`DatePaid` AS `DatePaid` from `payment` order by `payment`.`Amount` desc limit 10 */;
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

-- Dump completed on 2017-12-08 13:50:18
