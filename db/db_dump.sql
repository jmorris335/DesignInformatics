-- MySQL dump 10.13  Distrib 5.7.34, for osx11.0 (x86_64)
--
-- Host: localhost    Database: Mocko_Ex
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Current Database: `Mocko_Ex`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Mocko_Ex` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `Mocko_Ex`;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` int(11) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Revision` int(11) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,111111,'Time',1),(2,222222,'Thermo',1),(3,3333,'TESTING!!!',3);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseRubric` varchar(4) NOT NULL,
  `CourseNumber` int(10) NOT NULL,
  `CourseName` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (1,'ME',8930,'Design Informatics'),(2,'ME',8180,'FEA'),(3,'ME',8720,'Optimization'),(4,'ME',8000,'Seminar');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course_uses_Book`
--

DROP TABLE IF EXISTS `Course_uses_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_uses_Book` (
  `Book_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_uses_Book`
--

LOCK TABLES `Course_uses_Book` WRITE;
/*!40000 ALTER TABLE `Course_uses_Book` DISABLE KEYS */;
INSERT INTO `Course_uses_Book` VALUES (1,1),(1,3),(2,2),(2,4),(3,1);
/*!40000 ALTER TABLE `Course_uses_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Greg','Mocko'),(2,'Hannah','Mocko'),(3,'Barbara','Mocko'),(4,'Erin','Utermarck'),(5,'William','Brown'),(6,'Heather','Brown'),(7,'Jeremy','Mac'),(8,'Chris','Brown');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person_Takes_Course`
--

DROP TABLE IF EXISTS `Person_Takes_Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person_Takes_Course` (
  `P_C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_ID` int(11) NOT NULL COMMENT 'key to person',
  `C_ID` int(11) NOT NULL COMMENT 'key to course',
  PRIMARY KEY (`P_C_ID`),
  KEY `P_ID` (`P_ID`,`C_ID`),
  KEY `Course` (`C_ID`),
  CONSTRAINT `Course` FOREIGN KEY (`C_ID`) REFERENCES `Course` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Person` FOREIGN KEY (`P_ID`) REFERENCES `Person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person_Takes_Course`
--

LOCK TABLES `Person_Takes_Course` WRITE;
/*!40000 ALTER TABLE `Person_Takes_Course` DISABLE KEYS */;
INSERT INTO `Person_Takes_Course` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,4),(5,4,1),(6,6,1);
/*!40000 ALTER TABLE `Person_Takes_Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `3DPrinterDT`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `3DPrinterDT` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `3DPrinterDT`;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Rhyan','Morgan','2021-03-27 00:00:00',NULL),(2,'Will','Hawthorne','2013-11-18 00:00:00',NULL),(3,'John','Morris','2014-03-03 00:00:00',NULL),(4,'Greg','Mocko','2012-04-29 00:00:00',NULL),(5,'Kherissa','Taylor','2017-03-06 00:00:00',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee_Has_Role`
--

DROP TABLE IF EXISTS `Employee_Has_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee_Has_Role` (
  `employee_ID` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL,
  PRIMARY KEY (`employee_ID`,`role_ID`),
  KEY `fk_Employees_has_Role_Role1_idx` (`role_ID`),
  KEY `fk_Employees_has_Role_Employees1_idx` (`employee_ID`),
  CONSTRAINT `fk_Employees_has_Role_Employees1` FOREIGN KEY (`employee_ID`) REFERENCES `Employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Role_Role1` FOREIGN KEY (`role_ID`) REFERENCES `Role` (`role_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee_Has_Role`
--

LOCK TABLES `Employee_Has_Role` WRITE;
/*!40000 ALTER TABLE `Employee_Has_Role` DISABLE KEYS */;
INSERT INTO `Employee_Has_Role` VALUES (1,1),(5,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `Employee_Has_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Parameter`
--

DROP TABLE IF EXISTS `Job_Parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job_Parameter` (
  `jobparam_ID` int(11) NOT NULL AUTO_INCREMENT,
  `jobparam_name` varchar(45) NOT NULL,
  `unit` varchar(8) NOT NULL,
  PRIMARY KEY (`jobparam_ID`,`unit`),
  KEY `fk_Job_Parameter_Unit1_idx` (`unit`),
  CONSTRAINT `fk_Job_Parameter_Unit1` FOREIGN KEY (`unit`) REFERENCES `Unit` (`unit_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Parameter`
--

LOCK TABLES `Job_Parameter` WRITE;
/*!40000 ALTER TABLE `Job_Parameter` DISABLE KEYS */;
INSERT INTO `Job_Parameter` VALUES (1,'init_bed_temp','degF'),(2,'ss_bed_temp','degF'),(3,'nozzle_speed','mm/s'),(4,'layer_height','mm'),(5,'layer_thickness','mm'),(6,'infill','percent');
/*!40000 ALTER TABLE `Job_Parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maintenance_Log`
--

DROP TABLE IF EXISTS `Maintenance_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maintenance_Log` (
  `mlog_ID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_ID` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`mlog_ID`),
  KEY `fk_Maintenance_Log_Employees1_idx` (`employee_ID`),
  CONSTRAINT `fk_Maintenance_Log_Employees1` FOREIGN KEY (`employee_ID`) REFERENCES `Employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maintenance_Log`
--

LOCK TABLES `Maintenance_Log` WRITE;
/*!40000 ALTER TABLE `Maintenance_Log` DISABLE KEYS */;
INSERT INTO `Maintenance_Log` VALUES (1,3,'2023-01-03 13:25:45','Found my SSN written on the part in sharpie. Not sure why, but had to cover it up.'),(3,4,'2023-01-31 12:03:15','Found my SSN written on the part in sharpie. Not sure why, but had to cover it up.'),(5,3,'2023-01-31 12:03:15','It was late. I was tired. I know I shouldn\'t have left my sandwhich on there, but when I realized my mistake it was too late.'),(6,4,'2023-02-04 09:00:01','Cleanliness is close to godliness');
/*!40000 ALTER TABLE `Maintenance_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Material` (
  `mat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `melt_temp` decimal(4,0) DEFAULT NULL,
  `mat_name` varchar(45) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`mat_ID`),
  KEY `fk_Material_Vendor1_idx` (`vendor_ID`),
  CONSTRAINT `fk_Material_Vendor1` FOREIGN KEY (`vendor_ID`) REFERENCES `Vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
INSERT INTO `Material` VALUES (1,126,'Nylon 12 Carbon Fiber','Black',4),(2,130,'ULTEM™ 1010 resin','Amber',4),(3,119,'ABS-M30','White',4),(4,126,'ABS-M30','Blue',4),(5,126,'ABS-M30','Grey',4),(6,126,'Polycarbonate','Clear',4);
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Material_Loaded_In_Printer`
--

DROP TABLE IF EXISTS `Material_Loaded_In_Printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Material_Loaded_In_Printer` (
  `printer_ID` int(11) NOT NULL,
  `mat_ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `volume` decimal(7,0) NOT NULL,
  PRIMARY KEY (`printer_ID`,`mat_ID`,`timestamp`),
  KEY `fk_Printer_has_Material_Material2_idx` (`mat_ID`),
  KEY `fk_Printer_has_Material_Printer2_idx` (`printer_ID`),
  CONSTRAINT `fk_Printer_has_Material_Material2` FOREIGN KEY (`mat_ID`) REFERENCES `Material` (`mat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Printer2` FOREIGN KEY (`printer_ID`) REFERENCES `Printer` (`printer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material_Loaded_In_Printer`
--

LOCK TABLES `Material_Loaded_In_Printer` WRITE;
/*!40000 ALTER TABLE `Material_Loaded_In_Printer` DISABLE KEYS */;
INSERT INTO `Material_Loaded_In_Printer` VALUES (1,4,'2023-04-25 00:00:00',1000),(2,2,'2023-04-25 00:00:00',1000),(2,3,'2023-04-25 00:00:00',1500),(2,5,'2023-04-25 00:00:00',1500);
/*!40000 ALTER TABLE `Material_Loaded_In_Printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parameter`
--

DROP TABLE IF EXISTS `Parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parameter` (
  `param_ID` int(11) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(60) NOT NULL,
  `unit` varchar(8) NOT NULL,
  PRIMARY KEY (`param_ID`,`unit`),
  KEY `fk_Parameter_Unit1_idx` (`unit`),
  CONSTRAINT `fk_Parameter_Unit1` FOREIGN KEY (`unit`) REFERENCES `Unit` (`unit_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parameter`
--

LOCK TABLES `Parameter` WRITE;
/*!40000 ALTER TABLE `Parameter` DISABLE KEYS */;
INSERT INTO `Parameter` VALUES (1,'width','mm'),(2,'height','mm'),(3,'depth','mm'),(4,'thickness','mm'),(5,'shaft_diameter','mm'),(6,'step_angle','deg'),(7,'holding_torque','Nm'),(8,'mass','g'),(9,'volume','cm3'),(10,'material','string');
/*!40000 ALTER TABLE `Parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part`
--

DROP TABLE IF EXISTS `Part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `part_ID` int(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(60) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  `printer_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`part_ID`),
  KEY `fk_Part_Vendor_idx` (`vendor_ID`),
  KEY `fk_Part_Printer1_idx` (`printer_ID`),
  CONSTRAINT `fk_Part_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `Printer` (`printer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Vendor` FOREIGN KEY (`vendor_ID`) REFERENCES `Vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part`
--

LOCK TABLES `Part` WRITE;
/*!40000 ALTER TABLE `Part` DISABLE KEYS */;
INSERT INTO `Part` VALUES (1,'bed',3,1),(2,'nozzle',4,1),(3,'x_motor',1,1),(4,'y_motor',1,1),(5,'bed_motor',1,1),(6,'feed_motor',1,1),(7,'chamber',3,1),(8,'bed',2,2),(9,'nozzle',3,2),(10,'x_motor',1,2),(11,'y_motor',1,2),(12,'bed_motor',1,2),(13,'feed_motor',1,2),(14,'chamber',4,2);
/*!40000 ALTER TABLE `Part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part_Has_Maintenance_Log`
--

DROP TABLE IF EXISTS `Part_Has_Maintenance_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part_Has_Maintenance_Log` (
  `part_ID` int(11) NOT NULL,
  `mlog_ID` int(11) NOT NULL,
  PRIMARY KEY (`part_ID`,`mlog_ID`),
  KEY `fk_Part_has_Maintenance_Log_Maintenance_Log1_idx` (`mlog_ID`),
  KEY `fk_Part_has_Maintenance_Log_Part1_idx` (`part_ID`),
  CONSTRAINT `fk_Part_has_Maintenance_Log_Maintenance_Log1` FOREIGN KEY (`mlog_ID`) REFERENCES `Maintenance_Log` (`mlog_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_has_Maintenance_Log_Part1` FOREIGN KEY (`part_ID`) REFERENCES `Part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part_Has_Maintenance_Log`
--

LOCK TABLES `Part_Has_Maintenance_Log` WRITE;
/*!40000 ALTER TABLE `Part_Has_Maintenance_Log` DISABLE KEYS */;
INSERT INTO `Part_Has_Maintenance_Log` VALUES (1,1),(3,1),(4,1),(6,1),(12,3),(13,3),(8,5),(9,5),(10,6),(11,6),(14,6);
/*!40000 ALTER TABLE `Part_Has_Maintenance_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part_Parameters`
--

DROP TABLE IF EXISTS `Part_Parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part_Parameters` (
  `param_ID` int(11) NOT NULL,
  `part_ID` int(11) NOT NULL,
  `value` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`param_ID`,`part_ID`),
  KEY `fk_Part_Parameters_has_Part_Part1_idx` (`part_ID`),
  KEY `fk_Part_Parameters_has_Part_Part_Parameters1_idx` (`param_ID`),
  CONSTRAINT `fk_Part_Parameters_has_Part_Part1` FOREIGN KEY (`part_ID`) REFERENCES `Part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Parameters_has_Part_Part_Parameters1` FOREIGN KEY (`param_ID`) REFERENCES `Parameter` (`param_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part_Parameters`
--

LOCK TABLES `Part_Parameters` WRITE;
/*!40000 ALTER TABLE `Part_Parameters` DISABLE KEYS */;
INSERT INTO `Part_Parameters` VALUES (1,1,615),(1,8,615),(2,1,615),(2,2,615),(2,8,615),(2,9,615),(4,1,3),(4,8,3),(5,3,6),(5,4,6),(5,5,6),(5,6,6),(5,10,6),(5,11,6),(5,12,6),(5,13,6),(6,3,2),(6,4,2),(6,5,2),(6,6,2),(6,10,2),(6,11,2),(6,12,2),(6,13,2),(7,3,1),(7,4,1),(7,5,1),(7,6,1),(7,10,1),(7,11,1),(7,12,1),(7,13,1),(8,3,6),(8,4,6),(8,5,6),(8,6,6),(8,10,6),(8,11,6),(8,12,6),(8,13,6),(9,7,302580),(9,14,302580);
/*!40000 ALTER TABLE `Part_Parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Job`
--

DROP TABLE IF EXISTS `Print_Job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Job` (
  `job_ID` int(11) NOT NULL AUTO_INCREMENT,
  `model` blob,
  `code` blob,
  `designer_ID` int(11) NOT NULL,
  `curator_ID` int(11) NOT NULL,
  `preparer_ID` int(11) NOT NULL,
  `printer_ID` int(11) NOT NULL,
  `mat_ID` int(11) NOT NULL,
  `job_succeeded` tinyint(4) DEFAULT NULL,
  `in_queue` tinyint(4) NOT NULL DEFAULT '1',
  `print_volume` decimal(8,0) DEFAULT NULL,
  `submission_time` datetime DEFAULT NULL,
  `print_finish_time` datetime DEFAULT NULL,
  `print_start_time` datetime DEFAULT NULL,
  `print_report` longtext,
  PRIMARY KEY (`job_ID`,`mat_ID`),
  KEY `fk_Print_Job_Employees1_idx` (`designer_ID`),
  KEY `fk_Print_Job_Printer1_idx` (`printer_ID`),
  KEY `fk_Print_Job_Employees2_idx` (`curator_ID`),
  KEY `fk_Print_Job_Employees3_idx` (`preparer_ID`),
  KEY `fk_Print_Job_Material1_idx` (`mat_ID`),
  CONSTRAINT `fk_Print_Job_Employees1` FOREIGN KEY (`designer_ID`) REFERENCES `Employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees2` FOREIGN KEY (`curator_ID`) REFERENCES `Employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees3` FOREIGN KEY (`preparer_ID`) REFERENCES `Employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Material1` FOREIGN KEY (`mat_ID`) REFERENCES `Material` (`mat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `Printer` (`printer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Job`
--

LOCK TABLES `Print_Job` WRITE;
/*!40000 ALTER TABLE `Print_Job` DISABLE KEYS */;
INSERT INTO `Print_Job` VALUES (1,_binary 'Jig (Kherissa).stl',_binary 'Jig (Kherissa).gcode',3,3,1,2,6,0,0,101,'2023-01-03 13:23:45','2023-01-03 13:54:40','2023-01-03 13:25:45','Print succeeded'),(2,_binary 'AWWT1991 v0.3.stl',_binary 'AWWT1991 v0.3.gcode',2,2,4,1,5,0,0,156,'2023-02-03 16:33:45','2023-02-04 10:36:35','2023-02-04 09:00:01','Print failed due to lack of support'),(3,_binary 'Insert (Kherissa).stl',_binary 'Insert (Kherissa).gcode',5,2,1,1,4,0,0,534,'2023-01-31 12:03:15','2023-01-31 19:29:52','2023-01-31 12:03:20','Print failed due to lack of support'),(4,_binary 'AWWT1848 v0.2 1_2.stl',_binary 'AWWT1848 v0.2 1_2.gcode',1,5,4,2,1,0,0,378,'2023-01-12 10:11:43','2023-01-12 12:40:12','2023-01-12 10:12:21','Print succeeded'),(5,_binary 'AWWT1848 v0.2 2_2.stl',_binary 'AWWT1848 v0.2 2_2.gcode',3,2,2,1,3,0,0,180,'2023-03-20 14:08:59','2023-03-23 13:09:18','2023-03-23 09:12:20','Print had some errors'),(6,_binary 'full test.stl',_binary 'full test.gcode',2,2,3,2,1,0,0,602,'2023-04-24 15:22:51','2023-04-24 16:28:31','2023-04-24 15:23:40','Print succeeded'),(7,'','',3,2,3,2,3,1,0,0,'2023-04-25 14:39:24','2023-04-25 14:48:36','2023-04-25 14:39:24',NULL),(8,'','',3,3,3,2,4,1,0,0,'2023-04-25 14:51:28','2023-04-25 15:03:44','2023-04-25 14:51:28',NULL),(9,'','',3,3,3,1,4,1,0,0,'2023-04-26 13:50:16','2023-04-26 14:03:02','2023-04-26 13:50:16',NULL),(10,'','',3,1,5,2,5,1,0,0,'2023-04-26 14:18:37','2023-04-26 14:28:26','2023-04-26 14:18:37',NULL),(11,_binary 'jig.stl',_binary 'jig.gcode',2,3,3,2,2,1,0,0,'2023-04-26 16:57:58','2023-04-26 17:11:23','2023-04-26 16:57:58','Success: Test V1 (John Morris)'),(12,_binary 'cube.stl',_binary 'cube.gcode',3,3,5,2,2,0,0,0,'2023-04-26 17:03:31','2023-04-26 17:08:13','2023-04-26 17:04:45','Failed: Test for JOB ID 2'),(13,_binary 'wrench.STL','',5,5,2,2,2,0,0,0,'2023-04-26 17:13:29','2023-04-26 17:14:59','2023-04-26 17:13:29','Failed: Test for ID 13'),(14,'','',3,5,3,2,2,0,0,0,'2023-04-26 17:19:53','2023-04-26 17:20:07','2023-04-26 17:19:53','Failed: Test V5 Job 14');
/*!40000 ALTER TABLE `Print_Job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Job_Has_Job_Parameter`
--

DROP TABLE IF EXISTS `Print_Job_Has_Job_Parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Job_Has_Job_Parameter` (
  `job_ID` int(11) NOT NULL,
  `jobparam_ID` int(11) NOT NULL,
  `value` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`job_ID`,`jobparam_ID`),
  KEY `fk_Print_Job_has_Job_Parameter_Job_Parameter1_idx` (`jobparam_ID`),
  KEY `fk_Print_Job_has_Job_Parameter_Print_Job1_idx` (`job_ID`),
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Job_Parameter1` FOREIGN KEY (`jobparam_ID`) REFERENCES `Job_Parameter` (`jobparam_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Print_Job1` FOREIGN KEY (`job_ID`) REFERENCES `Print_Job` (`job_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Job_Has_Job_Parameter`
--

LOCK TABLES `Print_Job_Has_Job_Parameter` WRITE;
/*!40000 ALTER TABLE `Print_Job_Has_Job_Parameter` DISABLE KEYS */;
INSERT INTO `Print_Job_Has_Job_Parameter` VALUES (11,2,65),(12,6,17);
/*!40000 ALTER TABLE `Print_Job_Has_Job_Parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer` (
  `printer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) DEFAULT NULL,
  `IPv6` varchar(25) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  `printer_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`printer_ID`),
  UNIQUE KEY `printer_name_UNIQUE` (`printer_name`),
  KEY `fk_Printer_Vendor1_idx` (`vendor_ID`),
  CONSTRAINT `fk_Printer_Vendor1` FOREIGN KEY (`vendor_ID`) REFERENCES `Vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer`
--

LOCK TABLES `Printer` WRITE;
/*!40000 ALTER TABLE `Printer` DISABLE KEYS */;
INSERT INTO `Printer` VALUES (1,'Main floor','2001:db8::8a2e:370:7334','F123 Composite Ready',4,'Main Composite Printer'),(2,'Main floor','2001:de8::8a2e:370:7334','F770 Industrial 3D Printer',4,'Big Grey Printer');
/*!40000 ALTER TABLE `Printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer_Can_Print_Material`
--

DROP TABLE IF EXISTS `Printer_Can_Print_Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer_Can_Print_Material` (
  `printer_ID` int(11) NOT NULL,
  `mat_ID` int(11) NOT NULL,
  PRIMARY KEY (`printer_ID`,`mat_ID`),
  KEY `fk_Printer_has_Material_Material1_idx` (`mat_ID`),
  KEY `fk_Printer_has_Material_Printer1_idx` (`printer_ID`),
  CONSTRAINT `fk_Printer_has_Material_Material1` FOREIGN KEY (`mat_ID`) REFERENCES `Material` (`mat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `Printer` (`printer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer_Can_Print_Material`
--

LOCK TABLES `Printer_Can_Print_Material` WRITE;
/*!40000 ALTER TABLE `Printer_Can_Print_Material` DISABLE KEYS */;
INSERT INTO `Printer_Can_Print_Material` VALUES (2,2),(2,3),(1,4),(2,5);
/*!40000 ALTER TABLE `Printer_Can_Print_Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer_State`
--

DROP TABLE IF EXISTS `Printer_State`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer_State` (
  `printer_ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `is_connected` tinyint(4) DEFAULT '1',
  `is_busy` tinyint(4) DEFAULT '0',
  `is_available` tinyint(4) DEFAULT '1',
  `needs_service` tinyint(4) DEFAULT '0',
  `has_error` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`printer_ID`,`timestamp`),
  KEY `fk_Network_State_Printer1_idx` (`printer_ID`),
  CONSTRAINT `fk_Network_State_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `Printer` (`printer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer_State`
--

LOCK TABLES `Printer_State` WRITE;
/*!40000 ALTER TABLE `Printer_State` DISABLE KEYS */;
INSERT INTO `Printer_State` VALUES (1,'2023-04-24 22:15:24',1,0,1,0,0),(1,'2023-04-24 22:17:24',1,0,1,0,0),(1,'2023-04-24 22:38:50',1,0,1,0,0),(1,'2023-04-25 00:00:00',1,0,1,0,0),(1,'2023-04-25 14:38:49',1,0,1,0,0),(1,'2023-04-25 14:38:50',1,0,1,0,0),(1,'2023-04-25 14:38:55',1,0,1,0,0),(1,'2023-04-25 14:38:56',1,0,1,0,0),(1,'2023-04-25 14:38:57',1,0,1,0,0),(1,'2023-04-25 14:39:11',1,0,1,0,0),(1,'2023-04-25 14:39:12',1,0,1,0,0),(1,'2023-04-25 14:39:24',1,0,1,0,0),(1,'2023-04-25 14:39:27',1,0,1,0,0),(1,'2023-04-25 14:40:05',1,0,1,0,0),(1,'2023-04-25 14:40:13',1,0,1,0,0),(1,'2023-04-25 14:41:52',1,0,1,0,0),(1,'2023-04-25 14:48:15',1,0,1,0,0),(1,'2023-04-25 14:48:36',1,0,1,0,0),(1,'2023-04-25 14:51:05',1,0,1,0,0),(1,'2023-04-25 14:51:09',1,0,1,0,0),(1,'2023-04-25 14:51:28',1,0,1,0,0),(1,'2023-04-25 14:51:30',1,0,1,0,0),(1,'2023-04-25 14:52:04',1,0,1,0,0),(1,'2023-04-25 15:03:44',1,0,1,0,0),(1,'2023-04-25 15:10:49',1,0,1,0,0),(1,'2023-04-25 15:12:59',1,0,1,0,0),(1,'2023-04-25 16:22:36',1,0,1,0,0),(1,'2023-04-25 21:07:29',1,0,1,0,0),(1,'2023-04-26 09:35:21',1,0,1,0,0),(1,'2023-04-26 09:36:06',1,0,1,0,0),(1,'2023-04-26 09:38:15',1,0,1,0,0),(1,'2023-04-26 09:39:18',1,0,1,0,0),(1,'2023-04-26 13:19:30',1,0,1,0,0),(1,'2023-04-26 13:20:12',1,0,1,0,0),(1,'2023-04-26 13:20:46',1,0,1,0,0),(1,'2023-04-26 13:21:47',1,0,1,0,0),(1,'2023-04-26 13:22:33',1,0,1,0,0),(1,'2023-04-26 13:23:24',1,0,1,0,0),(1,'2023-04-26 13:23:28',1,0,1,0,0),(1,'2023-04-26 13:25:41',1,0,1,0,0),(1,'2023-04-26 13:25:50',1,0,1,0,0),(1,'2023-04-26 13:26:07',1,0,1,0,0),(1,'2023-04-26 13:28:43',1,0,1,0,0),(1,'2023-04-26 13:29:15',1,0,1,0,0),(1,'2023-04-26 13:29:24',1,0,1,0,0),(1,'2023-04-26 13:29:29',1,0,1,0,0),(1,'2023-04-26 13:29:30',1,0,1,0,0),(1,'2023-04-26 13:29:31',1,0,1,0,0),(1,'2023-04-26 13:29:32',1,0,1,0,0),(1,'2023-04-26 13:29:34',1,0,1,0,0),(1,'2023-04-26 13:29:38',1,0,1,0,0),(1,'2023-04-26 13:29:40',1,0,1,0,0),(1,'2023-04-26 13:31:25',1,0,1,0,0),(1,'2023-04-26 13:31:26',1,0,1,0,0),(1,'2023-04-26 13:31:41',1,0,1,0,0),(1,'2023-04-26 13:32:28',1,0,1,0,0),(1,'2023-04-26 13:32:31',1,0,1,0,0),(1,'2023-04-26 13:33:15',1,0,1,0,0),(1,'2023-04-26 13:33:16',1,0,1,0,0),(1,'2023-04-26 13:33:23',1,0,1,0,0),(1,'2023-04-26 13:34:35',1,0,1,0,0),(1,'2023-04-26 13:34:37',1,0,1,0,0),(1,'2023-04-26 13:34:42',1,0,1,0,0),(1,'2023-04-26 13:34:47',1,0,1,0,0),(1,'2023-04-26 13:34:54',1,0,1,0,0),(1,'2023-04-26 13:34:59',1,0,1,0,0),(1,'2023-04-26 13:43:59',1,0,1,0,0),(1,'2023-04-26 13:50:16',1,0,1,0,0),(1,'2023-04-26 13:50:18',1,1,0,0,0),(1,'2023-04-26 14:03:02',1,1,0,0,0),(1,'2023-04-26 14:03:05',1,0,1,0,0),(1,'2023-04-26 14:18:37',1,0,1,0,0),(1,'2023-04-26 14:18:39',1,0,1,0,0),(1,'2023-04-26 14:28:26',1,0,1,0,0),(1,'2023-04-26 14:28:28',1,0,1,0,0),(1,'2023-04-26 14:28:29',1,0,1,0,0),(1,'2023-04-26 14:42:00',1,0,1,0,0),(1,'2023-04-26 14:42:15',1,0,1,0,0),(1,'2023-04-26 15:54:28',1,0,1,0,0),(1,'2023-04-26 15:56:07',1,0,1,0,0),(1,'2023-04-26 15:59:05',1,0,1,0,0),(1,'2023-04-26 16:18:14',1,0,1,0,0),(1,'2023-04-26 16:56:31',1,0,1,0,0),(1,'2023-04-26 16:57:58',1,0,1,0,0),(1,'2023-04-26 16:58:01',1,0,1,0,0),(1,'2023-04-26 17:02:59',1,0,1,0,0),(1,'2023-04-26 17:03:03',1,0,1,0,0),(1,'2023-04-26 17:03:31',1,0,1,0,0),(1,'2023-04-26 17:04:45',1,0,1,0,0),(1,'2023-04-26 17:04:50',1,0,1,0,0),(1,'2023-04-26 17:07:48',1,0,1,0,0),(1,'2023-04-26 17:07:49',1,0,1,0,0),(1,'2023-04-26 17:08:18',1,0,1,0,0),(1,'2023-04-26 17:09:09',1,0,1,0,0),(1,'2023-04-26 17:13:29',1,0,1,0,0),(1,'2023-04-26 17:13:55',1,0,1,0,0),(1,'2023-04-26 17:13:57',1,0,1,0,0),(1,'2023-04-26 17:16:33',1,0,1,0,0),(1,'2023-04-26 17:16:35',1,0,1,0,0),(1,'2023-04-26 17:16:36',1,0,1,0,0),(1,'2023-04-26 17:16:37',1,0,1,0,0),(1,'2023-04-26 17:16:38',1,0,1,0,0),(1,'2023-04-26 17:16:39',1,0,1,0,0),(1,'2023-04-26 17:16:42',1,0,1,0,0),(1,'2023-04-26 17:16:43',1,0,1,0,0),(1,'2023-04-26 17:16:44',1,0,1,0,0),(1,'2023-04-26 17:16:45',1,0,1,0,0),(1,'2023-04-26 17:16:46',1,0,1,0,0),(1,'2023-04-26 17:19:38',1,0,1,0,0),(1,'2023-04-26 17:19:39',1,0,1,0,0),(1,'2023-04-26 17:19:40',1,0,1,0,0),(1,'2023-04-26 17:19:41',1,0,1,0,0),(1,'2023-04-26 17:19:53',1,0,1,0,0),(1,'2023-04-26 17:19:56',1,0,1,0,0),(1,'2023-04-26 17:20:11',1,0,1,0,0),(1,'2023-04-28 19:52:39',1,0,1,0,0),(1,'2023-04-28 19:53:04',1,0,1,0,0),(1,'2023-04-28 19:53:43',1,0,1,0,0),(1,'2023-04-28 19:55:44',1,0,1,0,0),(1,'2023-04-28 19:57:20',1,0,1,0,0),(1,'2023-04-28 19:57:21',1,0,1,0,0),(1,'2023-05-01 15:09:22',1,0,1,0,0),(1,'2023-05-01 15:09:27',1,0,1,0,0),(1,'2023-05-02 10:48:43',1,0,1,0,0),(1,'2023-05-02 10:48:46',1,0,1,0,0),(1,'2023-05-02 10:49:33',1,0,1,0,0),(1,'2023-05-02 10:49:45',1,0,1,0,0),(1,'2023-05-02 10:55:07',1,0,1,0,0),(2,'2023-04-24 22:15:24',1,0,1,0,0),(2,'2023-04-24 22:17:24',1,0,1,0,0),(2,'2023-04-24 22:38:50',1,0,1,0,0),(2,'2023-04-25 00:00:00',1,0,1,0,0),(2,'2023-04-25 14:38:49',1,0,1,0,0),(2,'2023-04-25 14:38:50',1,0,1,0,0),(2,'2023-04-25 14:38:55',1,0,1,0,0),(2,'2023-04-25 14:38:56',1,0,1,0,0),(2,'2023-04-25 14:38:57',1,0,1,0,0),(2,'2023-04-25 14:39:11',1,0,1,0,0),(2,'2023-04-25 14:39:12',1,0,1,0,0),(2,'2023-04-25 14:39:24',1,0,1,0,0),(2,'2023-04-25 14:48:36',1,1,0,0,0),(2,'2023-04-25 14:51:05',1,0,1,0,0),(2,'2023-04-25 14:51:09',1,0,1,0,0),(2,'2023-04-25 14:51:28',1,0,1,0,0),(2,'2023-04-25 14:51:30',1,1,0,0,0),(2,'2023-04-25 14:52:04',1,1,0,0,0),(2,'2023-04-25 15:03:44',1,1,0,0,0),(2,'2023-04-25 15:10:49',1,0,1,0,0),(2,'2023-04-25 15:12:59',1,0,1,0,0),(2,'2023-04-25 16:22:36',1,0,1,0,0),(2,'2023-04-25 21:07:29',1,0,1,0,0),(2,'2023-04-26 09:35:21',1,0,1,0,0),(2,'2023-04-26 09:36:06',1,0,1,0,0),(2,'2023-04-26 09:38:15',1,0,1,0,0),(2,'2023-04-26 09:39:18',1,0,1,0,0),(2,'2023-04-26 13:19:30',1,0,1,0,0),(2,'2023-04-26 13:20:12',1,0,1,0,0),(2,'2023-04-26 13:20:46',1,0,1,0,0),(2,'2023-04-26 13:21:47',1,0,1,0,0),(2,'2023-04-26 13:22:33',1,0,1,0,0),(2,'2023-04-26 13:23:24',1,0,1,0,0),(2,'2023-04-26 13:23:28',1,0,1,0,0),(2,'2023-04-26 13:25:41',1,0,1,0,0),(2,'2023-04-26 13:25:50',1,0,1,0,0),(2,'2023-04-26 13:26:07',1,0,1,0,0),(2,'2023-04-26 13:28:43',1,0,1,0,0),(2,'2023-04-26 13:29:15',1,0,1,0,0),(2,'2023-04-26 13:29:24',1,0,1,0,0),(2,'2023-04-26 13:29:29',1,0,1,0,0),(2,'2023-04-26 13:29:30',1,0,1,0,0),(2,'2023-04-26 13:29:31',1,0,1,0,0),(2,'2023-04-26 13:29:32',1,0,1,0,0),(2,'2023-04-26 13:29:34',1,0,1,0,0),(2,'2023-04-26 13:29:38',1,0,1,0,0),(2,'2023-04-26 13:29:40',1,0,1,0,0),(2,'2023-04-26 13:31:25',1,0,1,0,0),(2,'2023-04-26 13:31:26',1,0,1,0,0),(2,'2023-04-26 13:31:41',1,0,1,0,0),(2,'2023-04-26 13:32:28',1,0,1,0,0),(2,'2023-04-26 13:32:31',1,0,1,0,0),(2,'2023-04-26 13:33:15',1,0,1,0,0),(2,'2023-04-26 13:33:16',1,0,1,0,0),(2,'2023-04-26 13:33:23',1,0,1,0,0),(2,'2023-04-26 13:34:35',1,0,1,0,0),(2,'2023-04-26 13:34:37',1,0,1,0,0),(2,'2023-04-26 13:34:42',1,0,1,0,0),(2,'2023-04-26 13:34:47',1,0,1,0,0),(2,'2023-04-26 13:34:54',1,0,1,0,0),(2,'2023-04-26 13:34:59',1,0,1,0,0),(2,'2023-04-26 13:43:59',1,0,1,0,0),(2,'2023-04-26 13:50:16',1,0,1,0,0),(2,'2023-04-26 13:50:18',1,0,1,0,0),(2,'2023-04-26 14:03:02',1,0,1,0,0),(2,'2023-04-26 14:03:05',1,0,1,0,0),(2,'2023-04-26 14:18:37',1,0,1,0,0),(2,'2023-04-26 14:18:39',1,1,0,0,0),(2,'2023-04-26 14:28:26',1,1,0,0,0),(2,'2023-04-26 14:28:28',1,0,1,0,0),(2,'2023-04-26 14:28:29',1,0,1,0,0),(2,'2023-04-26 14:42:00',1,0,1,0,0),(2,'2023-04-26 14:42:15',1,0,1,0,0),(2,'2023-04-26 15:54:28',1,0,1,0,0),(2,'2023-04-26 15:56:07',1,0,1,0,0),(2,'2023-04-26 15:59:05',1,0,1,0,0),(2,'2023-04-26 16:18:14',1,0,1,0,0),(2,'2023-04-26 16:56:31',1,0,1,0,0),(2,'2023-04-26 16:57:58',1,0,1,0,0),(2,'2023-04-26 16:58:01',1,1,0,0,0),(2,'2023-04-26 17:02:59',1,1,0,0,0),(2,'2023-04-26 17:03:03',1,1,0,0,0),(2,'2023-04-26 17:03:31',1,1,0,0,0),(2,'2023-04-26 17:04:45',1,0,1,0,0),(2,'2023-04-26 17:04:50',1,1,0,0,0),(2,'2023-04-26 17:07:27',1,0,1,0,0),(2,'2023-04-26 17:07:48',1,1,0,0,0),(2,'2023-04-26 17:07:49',1,1,0,0,0),(2,'2023-04-26 17:08:13',1,0,0,1,0),(2,'2023-04-26 17:08:18',1,0,1,0,0),(2,'2023-04-26 17:09:09',1,0,1,0,0),(2,'2023-04-26 17:09:51',1,0,1,0,0),(2,'2023-04-26 17:09:58',1,0,1,0,0),(2,'2023-04-26 17:09:59',1,0,1,0,0),(2,'2023-04-26 17:10:13',1,0,1,0,0),(2,'2023-04-26 17:10:15',1,0,1,0,0),(2,'2023-04-26 17:11:08',1,0,1,0,0),(2,'2023-04-26 17:11:23',1,0,1,0,0),(2,'2023-04-26 17:13:29',1,0,1,0,0),(2,'2023-04-26 17:13:48',1,0,0,1,0),(2,'2023-04-26 17:13:55',1,0,1,0,0),(2,'2023-04-26 17:13:57',1,0,1,0,0),(2,'2023-04-26 17:14:29',1,0,0,1,0),(2,'2023-04-26 17:14:59',1,0,0,1,0),(2,'2023-04-26 17:15:00',1,0,0,1,0),(2,'2023-04-26 17:15:01',1,0,0,1,0),(2,'2023-04-26 17:16:33',1,0,1,0,0),(2,'2023-04-26 17:16:35',1,0,1,0,0),(2,'2023-04-26 17:16:37',1,0,1,0,0),(2,'2023-04-26 17:16:38',1,0,1,0,0),(2,'2023-04-26 17:16:39',1,0,1,0,0),(2,'2023-04-26 17:16:42',1,0,1,0,0),(2,'2023-04-26 17:16:43',1,0,1,0,0),(2,'2023-04-26 17:16:44',1,0,1,0,0),(2,'2023-04-26 17:16:45',1,0,1,0,0),(2,'2023-04-26 17:16:46',1,0,1,0,0),(2,'2023-04-26 17:19:38',1,0,1,0,0),(2,'2023-04-26 17:19:39',1,0,1,0,0),(2,'2023-04-26 17:19:40',1,0,1,0,0),(2,'2023-04-26 17:19:41',1,0,1,0,0),(2,'2023-04-26 17:19:53',1,0,1,0,0),(2,'2023-04-26 17:19:56',1,1,0,0,0),(2,'2023-04-26 17:20:07',1,0,0,1,0),(2,'2023-05-02 10:54:49',1,0,1,0,0),(2,'2023-05-02 10:55:01',1,0,1,0,0),(2,'2023-05-02 10:55:04',1,0,0,1,0);
/*!40000 ALTER TABLE `Printer_State` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Designer'),(2,'Manager'),(3,'Technician'),(4,'Operator');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor`
--

DROP TABLE IF EXISTS `Sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensor` (
  `sensor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_name` varchar(45) NOT NULL,
  `part_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`sensor_ID`),
  KEY `fk_Sensor_Part1_idx` (`part_ID`),
  CONSTRAINT `fk_Sensor_Part1` FOREIGN KEY (`part_ID`) REFERENCES `Part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor`
--

LOCK TABLES `Sensor` WRITE;
/*!40000 ALTER TABLE `Sensor` DISABLE KEYS */;
INSERT INTO `Sensor` VALUES (1,'bed_thermometer',1),(2,'bed_height_NW',1),(3,'bed_height_NE',1),(4,'bed_height_SW',1),(5,'bed_height_SE',1),(6,'bed_position_z',1),(7,'nozzle_thermometer',2),(8,'nozzle_position_x',2),(9,'nozzle_position_y',2),(10,'motor_ammeter',3),(11,'motor_tachometer',3),(12,'motor_thermometer',3),(13,'motor_accelerometer',3),(14,'motor_ammeter',4),(15,'motor_tachometer',4),(16,'motor_thermometer',4),(17,'motor_accelerometer',4),(18,'motor_ammeter',5),(19,'motor_tachometer',5),(20,'motor_thermometer',5),(21,'motor_accelerometer',5),(22,'motor_ammeter',6),(23,'motor_tachometer',6),(24,'motor_thermometer',6),(25,'motor_accelerometer',6),(26,'chamber_thermometer',7),(27,'chamber_oxygen_level',7),(28,'chamber_vaccuum_level',7),(29,'bed_thermometer',8),(30,'bed_height_NW',8),(31,'bed_height_NE',8),(32,'bed_height_SW',8),(33,'bed_height_SE',8),(34,'bed_position_z',8),(35,'nozzle_thermometer',9),(36,'nozzle_position_x',9),(37,'nozzle_position_y',9),(38,'motor_ammeter',10),(39,'motor_tachometer',10),(40,'motor_thermometer',10),(41,'motor_accelerometer',10),(42,'motor_ammeter',11),(43,'motor_tachometer',11),(44,'motor_thermometer',11),(45,'motor_accelerometer',11),(46,'motor_ammeter',12),(47,'motor_tachometer',12),(48,'motor_thermometer',12),(49,'motor_accelerometer',12),(50,'motor_ammeter',13),(51,'motor_tachometer',13),(52,'motor_thermometer',13),(53,'motor_accelerometer',13),(54,'chamber_thermometer',14),(55,'chamber_oxygen_level',14),(56,'chamber_vaccuum_level',14);
/*!40000 ALTER TABLE `Sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor_Data`
--

DROP TABLE IF EXISTS `Sensor_Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensor_Data` (
  `data_ID` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `data_name` varchar(45) DEFAULT NULL,
  `value` decimal(10,0) NOT NULL,
  `unit` varchar(8) DEFAULT NULL,
  `sensor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`data_ID`),
  KEY `fk_Sensor_Data_Sensor1_idx` (`sensor_ID`),
  CONSTRAINT `fk_Sensor_Data_Sensor1` FOREIGN KEY (`sensor_ID`) REFERENCES `Sensor` (`sensor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor_Data`
--

LOCK TABLES `Sensor_Data` WRITE;
/*!40000 ALTER TABLE `Sensor_Data` DISABLE KEYS */;
INSERT INTO `Sensor_Data` VALUES (1,'2023-04-25 14:48:36','bed_thermometer(degF)',10,'degF',29),(2,'2023-04-25 14:51:30','bed_thermometer(degF)',9,'degF',29),(3,'2023-04-25 14:51:30','bed_height_NW(mm)',115,'mm',30),(4,'2023-04-25 14:51:30','bed_height_NE(mm)',20,'mm',31),(5,'2023-04-25 14:51:30','bed_height_SW(mm)',65,'mm',32),(6,'2023-04-25 14:51:30','bed_height_SE(mm)',131,'mm',33),(7,'2023-04-25 14:51:30','bed_position_z(mm)',119,'mm',34),(8,'2023-04-25 14:51:30','nozzle_thermometer(degF)',48,'degF',35),(9,'2023-04-25 14:51:30','nozzle_position_x(mm)',46,'mm',36),(10,'2023-04-25 14:51:30','nozzle_position_y(mm)',116,'mm',37),(11,'2023-04-25 14:51:30','motor_ammeter(amps)',81,'amps',38),(12,'2023-04-25 14:51:30','motor_tachometer(deg)',119,'deg',39),(13,'2023-04-25 14:51:30','motor_thermometer(degF)',51,'degF',40),(14,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',138,'mm/s2',41),(15,'2023-04-25 14:51:30','motor_ammeter(amps)',36,'amps',42),(16,'2023-04-25 14:51:30','motor_tachometer(deg)',84,'deg',43),(17,'2023-04-25 14:51:30','motor_thermometer(degF)',97,'degF',44),(18,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',112,'mm/s2',45),(19,'2023-04-25 14:51:30','motor_ammeter(amps)',23,'amps',46),(20,'2023-04-25 14:51:30','motor_tachometer(deg)',83,'deg',47),(21,'2023-04-25 14:51:30','motor_thermometer(degF)',142,'degF',48),(22,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',39,'mm/s2',49),(23,'2023-04-25 14:51:30','motor_ammeter(amps)',100,'amps',50),(24,'2023-04-25 14:51:30','motor_tachometer(deg)',70,'deg',51),(25,'2023-04-25 14:51:30','motor_thermometer(degF)',29,'degF',52),(26,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',28,'mm/s2',53),(27,'2023-04-25 14:51:30','chamber_thermometer(degF)',55,'degF',54),(28,'2023-04-25 14:51:30','chamber_oxygen_level(percent)',70,'percent',55),(29,'2023-04-25 14:51:30','chamber_vaccuum_level(percent)',109,'percent',56),(30,'2023-04-25 14:51:30','bed_thermometer(degF)',129,'degF',29),(31,'2023-04-25 14:51:30','bed_height_NW(mm)',25,'mm',30),(32,'2023-04-25 14:51:30','bed_height_NE(mm)',90,'mm',31),(33,'2023-04-25 14:51:30','bed_height_SW(mm)',105,'mm',32),(34,'2023-04-25 14:51:30','bed_height_SE(mm)',100,'mm',33),(35,'2023-04-25 14:51:30','bed_position_z(mm)',22,'mm',34),(36,'2023-04-25 14:51:30','nozzle_thermometer(degF)',62,'degF',35),(37,'2023-04-25 14:51:30','nozzle_position_x(mm)',134,'mm',36),(38,'2023-04-25 14:51:30','nozzle_position_y(mm)',36,'mm',37),(39,'2023-04-25 14:51:30','motor_ammeter(amps)',64,'amps',38),(40,'2023-04-25 14:51:30','motor_tachometer(deg)',20,'deg',39),(41,'2023-04-25 14:51:30','motor_thermometer(degF)',6,'degF',40),(42,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',126,'mm/s2',41),(43,'2023-04-25 14:51:30','motor_ammeter(amps)',65,'amps',42),(44,'2023-04-25 14:51:30','motor_tachometer(deg)',45,'deg',43),(45,'2023-04-25 14:51:30','motor_thermometer(degF)',122,'degF',44),(46,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',7,'mm/s2',45),(47,'2023-04-25 14:51:30','motor_ammeter(amps)',54,'amps',46),(48,'2023-04-25 14:51:30','motor_tachometer(deg)',97,'deg',47),(49,'2023-04-25 14:51:30','motor_thermometer(degF)',123,'degF',48),(50,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',96,'mm/s2',49),(51,'2023-04-25 14:51:30','motor_ammeter(amps)',115,'amps',50),(52,'2023-04-25 14:51:30','motor_tachometer(deg)',28,'deg',51),(53,'2023-04-25 14:51:30','motor_thermometer(degF)',15,'degF',52),(54,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',80,'mm/s2',53),(55,'2023-04-25 14:51:30','chamber_thermometer(degF)',119,'degF',54),(56,'2023-04-25 14:51:30','chamber_oxygen_level(percent)',16,'percent',55),(57,'2023-04-25 14:51:30','chamber_vaccuum_level(percent)',94,'percent',56),(58,'2023-04-25 14:51:30','bed_thermometer(degF)',58,'degF',29),(59,'2023-04-25 14:51:30','bed_height_NW(mm)',134,'mm',30),(60,'2023-04-25 14:51:30','bed_height_NE(mm)',89,'mm',31),(61,'2023-04-25 14:51:30','bed_height_SW(mm)',129,'mm',32),(62,'2023-04-25 14:51:30','bed_height_SE(mm)',60,'mm',33),(63,'2023-04-25 14:51:30','bed_position_z(mm)',142,'mm',34),(64,'2023-04-25 14:51:30','nozzle_thermometer(degF)',9,'degF',35),(65,'2023-04-25 14:51:30','nozzle_position_x(mm)',12,'mm',36),(66,'2023-04-25 14:51:30','nozzle_position_y(mm)',52,'mm',37),(67,'2023-04-25 14:51:30','motor_ammeter(amps)',134,'amps',38),(68,'2023-04-25 14:51:30','motor_tachometer(deg)',119,'deg',39),(69,'2023-04-25 14:51:30','motor_thermometer(degF)',76,'degF',40),(70,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',96,'mm/s2',41),(71,'2023-04-25 14:51:30','motor_ammeter(amps)',44,'amps',42),(72,'2023-04-25 14:51:30','motor_tachometer(deg)',87,'deg',43),(73,'2023-04-25 14:51:30','motor_thermometer(degF)',22,'degF',44),(74,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',121,'mm/s2',45),(75,'2023-04-25 14:51:30','motor_ammeter(amps)',78,'amps',46),(76,'2023-04-25 14:51:30','motor_tachometer(deg)',91,'deg',47),(77,'2023-04-25 14:51:30','motor_thermometer(degF)',106,'degF',48),(78,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',67,'mm/s2',49),(79,'2023-04-25 14:51:30','motor_ammeter(amps)',55,'amps',50),(80,'2023-04-25 14:51:30','motor_tachometer(deg)',0,'deg',51),(81,'2023-04-25 14:51:30','motor_thermometer(degF)',54,'degF',52),(82,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',128,'mm/s2',53),(83,'2023-04-25 14:51:30','chamber_thermometer(degF)',22,'degF',54),(84,'2023-04-25 14:51:30','chamber_oxygen_level(percent)',125,'percent',55),(85,'2023-04-25 14:51:30','chamber_vaccuum_level(percent)',99,'percent',56),(86,'2023-04-25 14:51:30','bed_thermometer(degF)',36,'degF',29),(87,'2023-04-25 14:51:30','bed_height_NW(mm)',1,'mm',30),(88,'2023-04-25 14:51:30','bed_height_NE(mm)',94,'mm',31),(89,'2023-04-25 14:51:30','bed_height_SW(mm)',16,'mm',32),(90,'2023-04-25 14:51:30','bed_height_SE(mm)',128,'mm',33),(91,'2023-04-25 14:51:30','bed_position_z(mm)',12,'mm',34),(92,'2023-04-25 14:51:30','nozzle_thermometer(degF)',4,'degF',35),(93,'2023-04-25 14:51:30','nozzle_position_x(mm)',125,'mm',36),(94,'2023-04-25 14:51:30','nozzle_position_y(mm)',7,'mm',37),(95,'2023-04-25 14:51:30','motor_ammeter(amps)',6,'amps',38),(96,'2023-04-25 14:51:30','motor_tachometer(deg)',62,'deg',39),(97,'2023-04-25 14:51:30','motor_thermometer(degF)',80,'degF',40),(98,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',71,'mm/s2',41),(99,'2023-04-25 14:51:30','motor_ammeter(amps)',142,'amps',42),(100,'2023-04-25 14:51:30','motor_tachometer(deg)',131,'deg',43),(101,'2023-04-25 14:51:30','motor_thermometer(degF)',83,'degF',44),(102,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',110,'mm/s2',45),(103,'2023-04-25 14:51:30','motor_ammeter(amps)',15,'amps',46),(104,'2023-04-25 14:51:30','motor_tachometer(deg)',77,'deg',47),(105,'2023-04-25 14:51:30','motor_thermometer(degF)',145,'degF',48),(106,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',17,'mm/s2',49),(107,'2023-04-25 14:51:30','motor_ammeter(amps)',32,'amps',50),(108,'2023-04-25 14:51:30','motor_tachometer(deg)',132,'deg',51),(109,'2023-04-25 14:51:30','motor_thermometer(degF)',71,'degF',52),(110,'2023-04-25 14:51:30','motor_accelerometer(mm/s2)',94,'mm/s2',53),(111,'2023-04-25 14:51:30','chamber_thermometer(degF)',35,'degF',54),(112,'2023-04-25 14:51:30','chamber_oxygen_level(percent)',61,'percent',55),(113,'2023-04-25 14:51:30','chamber_vaccuum_level(percent)',80,'percent',56),(114,'2023-04-25 14:52:04','bed_thermometer(degF)',38,'degF',29),(115,'2023-04-25 14:52:04','bed_height_NW(mm)',80,'mm',30),(116,'2023-04-25 14:52:04','bed_height_NE(mm)',103,'mm',31),(117,'2023-04-25 14:52:04','bed_height_SW(mm)',128,'mm',32),(118,'2023-04-25 14:52:04','bed_height_SE(mm)',112,'mm',33),(119,'2023-04-25 14:52:04','bed_position_z(mm)',4,'mm',34),(120,'2023-04-25 14:52:04','nozzle_thermometer(degF)',61,'degF',35),(121,'2023-04-25 14:52:04','nozzle_position_x(mm)',132,'mm',36),(122,'2023-04-25 14:52:04','nozzle_position_y(mm)',6,'mm',37),(123,'2023-04-25 14:52:04','motor_ammeter(amps)',125,'amps',38),(124,'2023-04-25 14:52:04','motor_tachometer(deg)',81,'deg',39),(125,'2023-04-25 14:52:04','motor_thermometer(degF)',145,'degF',40),(126,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',126,'mm/s2',41),(127,'2023-04-25 14:52:04','motor_ammeter(amps)',16,'amps',42),(128,'2023-04-25 14:52:04','motor_tachometer(deg)',33,'deg',43),(129,'2023-04-25 14:52:04','motor_thermometer(degF)',60,'degF',44),(130,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',106,'mm/s2',45),(131,'2023-04-25 14:52:04','motor_ammeter(amps)',83,'amps',46),(132,'2023-04-25 14:52:04','motor_tachometer(deg)',122,'deg',47),(133,'2023-04-25 14:52:04','motor_thermometer(degF)',110,'degF',48),(134,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',145,'mm/s2',49),(135,'2023-04-25 14:52:04','motor_ammeter(amps)',73,'amps',50),(136,'2023-04-25 14:52:04','motor_tachometer(deg)',90,'deg',51),(137,'2023-04-25 14:52:04','motor_thermometer(degF)',122,'degF',52),(138,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',74,'mm/s2',53),(139,'2023-04-25 14:52:04','chamber_thermometer(degF)',32,'degF',54),(140,'2023-04-25 14:52:04','chamber_oxygen_level(percent)',115,'percent',55),(141,'2023-04-25 14:52:04','chamber_vaccuum_level(percent)',142,'percent',56),(142,'2023-04-25 14:52:04','bed_thermometer(degF)',110,'degF',29),(143,'2023-04-25 14:52:04','bed_height_NW(mm)',80,'mm',30),(144,'2023-04-25 14:52:04','bed_height_NE(mm)',41,'mm',31),(145,'2023-04-25 14:52:04','bed_height_SW(mm)',38,'mm',32),(146,'2023-04-25 14:52:04','bed_height_SE(mm)',109,'mm',33),(147,'2023-04-25 14:52:04','bed_position_z(mm)',109,'mm',34),(148,'2023-04-25 14:52:04','nozzle_thermometer(degF)',76,'degF',35),(149,'2023-04-25 14:52:04','nozzle_position_x(mm)',131,'mm',36),(150,'2023-04-25 14:52:04','nozzle_position_y(mm)',58,'mm',37),(151,'2023-04-25 14:52:04','motor_ammeter(amps)',132,'amps',38),(152,'2023-04-25 14:52:04','motor_tachometer(deg)',96,'deg',39),(153,'2023-04-25 14:52:04','motor_thermometer(degF)',28,'degF',40),(154,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',136,'mm/s2',41),(155,'2023-04-25 14:52:04','motor_ammeter(amps)',1,'amps',42),(156,'2023-04-25 14:52:04','motor_tachometer(deg)',67,'deg',43),(157,'2023-04-25 14:52:04','motor_thermometer(degF)',78,'degF',44),(158,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',28,'mm/s2',45),(159,'2023-04-25 14:52:04','motor_ammeter(amps)',42,'amps',46),(160,'2023-04-25 14:52:04','motor_tachometer(deg)',106,'deg',47),(161,'2023-04-25 14:52:04','motor_thermometer(degF)',106,'degF',48),(162,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',89,'mm/s2',49),(163,'2023-04-25 14:52:04','motor_ammeter(amps)',68,'amps',50),(164,'2023-04-25 14:52:04','motor_tachometer(deg)',41,'deg',51),(165,'2023-04-25 14:52:04','motor_thermometer(degF)',64,'degF',52),(166,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',64,'mm/s2',53),(167,'2023-04-25 14:52:04','chamber_thermometer(degF)',116,'degF',54),(168,'2023-04-25 14:52:04','chamber_oxygen_level(percent)',35,'percent',55),(169,'2023-04-25 14:52:04','chamber_vaccuum_level(percent)',86,'percent',56),(170,'2023-04-25 14:52:04','bed_thermometer(degF)',19,'degF',29),(171,'2023-04-25 14:52:04','bed_height_NW(mm)',142,'mm',30),(172,'2023-04-25 14:52:04','bed_height_NE(mm)',46,'mm',31),(173,'2023-04-25 14:52:04','bed_height_SW(mm)',38,'mm',32),(174,'2023-04-25 14:52:04','bed_height_SE(mm)',57,'mm',33),(175,'2023-04-25 14:52:04','bed_position_z(mm)',32,'mm',34),(176,'2023-04-25 14:52:04','nozzle_thermometer(degF)',103,'degF',35),(177,'2023-04-25 14:52:04','nozzle_position_x(mm)',109,'mm',36),(178,'2023-04-25 14:52:04','nozzle_position_y(mm)',132,'mm',37),(179,'2023-04-25 14:52:04','motor_ammeter(amps)',134,'amps',38),(180,'2023-04-25 14:52:04','motor_tachometer(deg)',86,'deg',39),(181,'2023-04-25 14:52:04','motor_thermometer(degF)',90,'degF',40),(182,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',99,'mm/s2',41),(183,'2023-04-25 14:52:04','motor_ammeter(amps)',46,'amps',42),(184,'2023-04-25 14:52:04','motor_tachometer(deg)',26,'deg',43),(185,'2023-04-25 14:52:04','motor_thermometer(degF)',58,'degF',44),(186,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',118,'mm/s2',45),(187,'2023-04-25 14:52:04','motor_ammeter(amps)',103,'amps',46),(188,'2023-04-25 14:52:04','motor_tachometer(deg)',51,'deg',47),(189,'2023-04-25 14:52:04','motor_thermometer(degF)',3,'degF',48),(190,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',129,'mm/s2',49),(191,'2023-04-25 14:52:04','motor_ammeter(amps)',135,'amps',50),(192,'2023-04-25 14:52:04','motor_tachometer(deg)',58,'deg',51),(193,'2023-04-25 14:52:04','motor_thermometer(degF)',17,'degF',52),(194,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',93,'mm/s2',53),(195,'2023-04-25 14:52:04','chamber_thermometer(degF)',81,'degF',54),(196,'2023-04-25 14:52:04','chamber_oxygen_level(percent)',16,'percent',55),(197,'2023-04-25 14:52:04','chamber_vaccuum_level(percent)',60,'percent',56),(198,'2023-04-25 14:52:04','bed_thermometer(degF)',73,'degF',29),(199,'2023-04-25 14:52:04','bed_height_NW(mm)',142,'mm',30),(200,'2023-04-25 14:52:04','bed_height_NE(mm)',109,'mm',31),(201,'2023-04-25 14:52:04','bed_height_SW(mm)',54,'mm',32),(202,'2023-04-25 14:52:04','bed_height_SE(mm)',16,'mm',33),(203,'2023-04-25 14:52:04','bed_position_z(mm)',70,'mm',34),(204,'2023-04-25 14:52:04','nozzle_thermometer(degF)',22,'degF',35),(205,'2023-04-25 14:52:04','nozzle_position_x(mm)',71,'mm',36),(206,'2023-04-25 14:52:04','nozzle_position_y(mm)',45,'mm',37),(207,'2023-04-25 14:52:04','motor_ammeter(amps)',9,'amps',38),(208,'2023-04-25 14:52:04','motor_tachometer(deg)',70,'deg',39),(209,'2023-04-25 14:52:04','motor_thermometer(degF)',19,'degF',40),(210,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',144,'mm/s2',41),(211,'2023-04-25 14:52:04','motor_ammeter(amps)',28,'amps',42),(212,'2023-04-25 14:52:04','motor_tachometer(deg)',103,'deg',43),(213,'2023-04-25 14:52:04','motor_thermometer(degF)',17,'degF',44),(214,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',1,'mm/s2',45),(215,'2023-04-25 14:52:04','motor_ammeter(amps)',126,'amps',46),(216,'2023-04-25 14:52:04','motor_tachometer(deg)',78,'deg',47),(217,'2023-04-25 14:52:04','motor_thermometer(degF)',103,'degF',48),(218,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',86,'mm/s2',49),(219,'2023-04-25 14:52:04','motor_ammeter(amps)',20,'amps',50),(220,'2023-04-25 14:52:04','motor_tachometer(deg)',144,'deg',51),(221,'2023-04-25 14:52:04','motor_thermometer(degF)',142,'degF',52),(222,'2023-04-25 14:52:04','motor_accelerometer(mm/s2)',65,'mm/s2',53),(223,'2023-04-25 14:52:04','chamber_thermometer(degF)',41,'degF',54),(224,'2023-04-25 14:52:04','chamber_oxygen_level(percent)',129,'percent',55),(225,'2023-04-25 14:52:04','chamber_vaccuum_level(percent)',122,'percent',56),(226,'2023-04-25 15:03:44','bed_thermometer(degF)',103,'degF',29),(227,'2023-04-25 15:03:44','bed_height_NW(mm)',71,'mm',30),(228,'2023-04-25 15:03:44','bed_height_NE(mm)',38,'mm',31),(229,'2023-04-25 15:03:44','bed_height_SW(mm)',9,'mm',32),(230,'2023-04-25 15:03:44','bed_height_SE(mm)',141,'mm',33),(231,'2023-04-25 15:03:44','bed_position_z(mm)',145,'mm',34),(232,'2023-04-25 15:03:44','nozzle_thermometer(degF)',131,'degF',35),(233,'2023-04-25 15:03:44','nozzle_position_x(mm)',45,'mm',36),(234,'2023-04-25 15:03:44','nozzle_position_y(mm)',115,'mm',37),(235,'2023-04-25 15:03:44','motor_ammeter(amps)',142,'amps',38),(236,'2023-04-25 15:03:44','motor_tachometer(deg)',136,'deg',39),(237,'2023-04-25 15:03:44','motor_thermometer(degF)',58,'degF',40),(238,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',9,'mm/s2',41),(239,'2023-04-25 15:03:44','motor_ammeter(amps)',125,'amps',42),(240,'2023-04-25 15:03:44','motor_tachometer(deg)',1,'deg',43),(241,'2023-04-25 15:03:44','motor_thermometer(degF)',68,'degF',44),(242,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',26,'mm/s2',45),(243,'2023-04-25 15:03:44','motor_ammeter(amps)',145,'amps',46),(244,'2023-04-25 15:03:44','motor_tachometer(deg)',12,'deg',47),(245,'2023-04-25 15:03:44','motor_thermometer(degF)',36,'degF',48),(246,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',16,'mm/s2',49),(247,'2023-04-25 15:03:44','motor_ammeter(amps)',119,'amps',50),(248,'2023-04-25 15:03:44','motor_tachometer(deg)',4,'deg',51),(249,'2023-04-25 15:03:44','motor_thermometer(degF)',105,'degF',52),(250,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',138,'mm/s2',53),(251,'2023-04-25 15:03:44','chamber_thermometer(degF)',4,'degF',54),(252,'2023-04-25 15:03:44','chamber_oxygen_level(percent)',122,'percent',55),(253,'2023-04-25 15:03:44','chamber_vaccuum_level(percent)',28,'percent',56),(254,'2023-04-25 15:03:44','bed_thermometer(degF)',35,'degF',29),(255,'2023-04-25 15:03:44','bed_height_NW(mm)',51,'mm',30),(256,'2023-04-25 15:03:44','bed_height_NE(mm)',29,'mm',31),(257,'2023-04-25 15:03:44','bed_height_SW(mm)',96,'mm',32),(258,'2023-04-25 15:03:44','bed_height_SE(mm)',89,'mm',33),(259,'2023-04-25 15:03:44','bed_position_z(mm)',134,'mm',34),(260,'2023-04-25 15:03:44','nozzle_thermometer(degF)',39,'degF',35),(261,'2023-04-25 15:03:44','nozzle_position_x(mm)',44,'mm',36),(262,'2023-04-25 15:03:44','nozzle_position_y(mm)',42,'mm',37),(263,'2023-04-25 15:03:44','motor_ammeter(amps)',35,'amps',38),(264,'2023-04-25 15:03:44','motor_tachometer(deg)',16,'deg',39),(265,'2023-04-25 15:03:44','motor_thermometer(degF)',116,'degF',40),(266,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',60,'mm/s2',41),(267,'2023-04-25 15:03:44','motor_ammeter(amps)',138,'amps',42),(268,'2023-04-25 15:03:44','motor_tachometer(deg)',49,'deg',43),(269,'2023-04-25 15:03:44','motor_thermometer(degF)',131,'degF',44),(270,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',125,'mm/s2',45),(271,'2023-04-25 15:03:44','motor_ammeter(amps)',19,'amps',46),(272,'2023-04-25 15:03:44','motor_tachometer(deg)',103,'deg',47),(273,'2023-04-25 15:03:44','motor_thermometer(degF)',139,'degF',48),(274,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',136,'mm/s2',49),(275,'2023-04-25 15:03:44','motor_ammeter(amps)',103,'amps',50),(276,'2023-04-25 15:03:44','motor_tachometer(deg)',93,'deg',51),(277,'2023-04-25 15:03:44','motor_thermometer(degF)',52,'degF',52),(278,'2023-04-25 15:03:44','motor_accelerometer(mm/s2)',128,'mm/s2',53),(279,'2023-04-25 15:03:44','chamber_thermometer(degF)',3,'degF',54),(280,'2023-04-25 15:03:44','chamber_oxygen_level(percent)',70,'percent',55),(281,'2023-04-25 15:03:44','chamber_vaccuum_level(percent)',46,'percent',56),(282,'2023-04-26 13:50:18','bed_thermometer(degF)',36,'degF',1),(283,'2023-04-26 13:50:18','bed_height_NW(mm)',123,'mm',2),(284,'2023-04-26 13:50:18','bed_height_NE(mm)',128,'mm',3),(285,'2023-04-26 13:50:18','bed_height_SW(mm)',145,'mm',4),(286,'2023-04-26 13:50:18','bed_height_SE(mm)',71,'mm',5),(287,'2023-04-26 13:50:18','bed_position_z(mm)',29,'mm',6),(288,'2023-04-26 13:50:18','nozzle_thermometer(degF)',76,'degF',7),(289,'2023-04-26 13:50:18','nozzle_position_x(mm)',39,'mm',8),(290,'2023-04-26 13:50:18','nozzle_position_y(mm)',107,'mm',9),(291,'2023-04-26 13:50:18','motor_ammeter(amps)',10,'amps',10),(292,'2023-04-26 13:50:18','motor_tachometer(deg)',29,'deg',11),(293,'2023-04-26 13:50:18','motor_thermometer(degF)',23,'degF',12),(294,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',76,'mm/s2',13),(295,'2023-04-26 13:50:18','motor_ammeter(amps)',74,'amps',14),(296,'2023-04-26 13:50:18','motor_tachometer(deg)',54,'deg',15),(297,'2023-04-26 13:50:18','motor_thermometer(degF)',91,'degF',16),(298,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',122,'mm/s2',17),(299,'2023-04-26 13:50:18','motor_ammeter(amps)',13,'amps',18),(300,'2023-04-26 13:50:18','motor_tachometer(deg)',112,'deg',19),(301,'2023-04-26 13:50:18','motor_thermometer(degF)',134,'degF',20),(302,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',97,'mm/s2',21),(303,'2023-04-26 13:50:18','motor_ammeter(amps)',116,'amps',22),(304,'2023-04-26 13:50:18','motor_tachometer(deg)',100,'deg',23),(305,'2023-04-26 13:50:18','motor_thermometer(degF)',54,'degF',24),(306,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',60,'mm/s2',25),(307,'2023-04-26 13:50:18','chamber_thermometer(degF)',35,'degF',26),(308,'2023-04-26 13:50:18','chamber_oxygen_level(percent)',84,'percent',27),(309,'2023-04-26 13:50:18','chamber_vaccuum_level(percent)',77,'percent',28),(310,'2023-04-26 13:50:18','bed_thermometer(degF)',119,'degF',1),(311,'2023-04-26 13:50:18','bed_height_NW(mm)',135,'mm',2),(312,'2023-04-26 13:50:18','bed_height_NE(mm)',3,'mm',3),(313,'2023-04-26 13:50:18','bed_height_SW(mm)',141,'mm',4),(314,'2023-04-26 13:50:18','bed_height_SE(mm)',142,'mm',5),(315,'2023-04-26 13:50:18','bed_position_z(mm)',102,'mm',6),(316,'2023-04-26 13:50:18','nozzle_thermometer(degF)',6,'degF',7),(317,'2023-04-26 13:50:18','nozzle_position_x(mm)',51,'mm',8),(318,'2023-04-26 13:50:18','nozzle_position_y(mm)',71,'mm',9),(319,'2023-04-26 13:50:18','motor_ammeter(amps)',131,'amps',10),(320,'2023-04-26 13:50:18','motor_tachometer(deg)',54,'deg',11),(321,'2023-04-26 13:50:18','motor_thermometer(degF)',86,'degF',12),(322,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',135,'mm/s2',13),(323,'2023-04-26 13:50:18','motor_ammeter(amps)',99,'amps',14),(324,'2023-04-26 13:50:18','motor_tachometer(deg)',93,'deg',15),(325,'2023-04-26 13:50:18','motor_thermometer(degF)',74,'degF',16),(326,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',0,'mm/s2',17),(327,'2023-04-26 13:50:18','motor_ammeter(amps)',139,'amps',18),(328,'2023-04-26 13:50:18','motor_tachometer(deg)',58,'deg',19),(329,'2023-04-26 13:50:18','motor_thermometer(degF)',90,'degF',20),(330,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',144,'mm/s2',21),(331,'2023-04-26 13:50:18','motor_ammeter(amps)',9,'amps',22),(332,'2023-04-26 13:50:18','motor_tachometer(deg)',35,'deg',23),(333,'2023-04-26 13:50:18','motor_thermometer(degF)',68,'degF',24),(334,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',7,'mm/s2',25),(335,'2023-04-26 13:50:18','chamber_thermometer(degF)',71,'degF',26),(336,'2023-04-26 13:50:18','chamber_oxygen_level(percent)',118,'percent',27),(337,'2023-04-26 13:50:18','chamber_vaccuum_level(percent)',29,'percent',28),(338,'2023-04-26 13:50:18','bed_thermometer(degF)',142,'degF',1),(339,'2023-04-26 13:50:18','bed_height_NW(mm)',33,'mm',2),(340,'2023-04-26 13:50:18','bed_height_NE(mm)',9,'mm',3),(341,'2023-04-26 13:50:18','bed_height_SW(mm)',100,'mm',4),(342,'2023-04-26 13:50:18','bed_height_SE(mm)',86,'mm',5),(343,'2023-04-26 13:50:18','bed_position_z(mm)',132,'mm',6),(344,'2023-04-26 13:50:18','nozzle_thermometer(degF)',83,'degF',7),(345,'2023-04-26 13:50:18','nozzle_position_x(mm)',118,'mm',8),(346,'2023-04-26 13:50:18','nozzle_position_y(mm)',132,'mm',9),(347,'2023-04-26 13:50:18','motor_ammeter(amps)',145,'amps',10),(348,'2023-04-26 13:50:18','motor_tachometer(deg)',15,'deg',11),(349,'2023-04-26 13:50:18','motor_thermometer(degF)',39,'degF',12),(350,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',33,'mm/s2',13),(351,'2023-04-26 13:50:18','motor_ammeter(amps)',68,'amps',14),(352,'2023-04-26 13:50:18','motor_tachometer(deg)',71,'deg',15),(353,'2023-04-26 13:50:18','motor_thermometer(degF)',87,'degF',16),(354,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',126,'mm/s2',17),(355,'2023-04-26 13:50:18','motor_ammeter(amps)',19,'amps',18),(356,'2023-04-26 13:50:18','motor_tachometer(deg)',103,'deg',19),(357,'2023-04-26 13:50:18','motor_thermometer(degF)',71,'degF',20),(358,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',62,'mm/s2',21),(359,'2023-04-26 13:50:18','motor_ammeter(amps)',139,'amps',22),(360,'2023-04-26 13:50:18','motor_tachometer(deg)',84,'deg',23),(361,'2023-04-26 13:50:18','motor_thermometer(degF)',7,'degF',24),(362,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',51,'mm/s2',25),(363,'2023-04-26 13:50:18','chamber_thermometer(degF)',29,'degF',26),(364,'2023-04-26 13:50:18','chamber_oxygen_level(percent)',109,'percent',27),(365,'2023-04-26 13:50:18','chamber_vaccuum_level(percent)',1,'percent',28),(366,'2023-04-26 13:50:18','bed_thermometer(degF)',87,'degF',1),(367,'2023-04-26 13:50:18','bed_height_NW(mm)',55,'mm',2),(368,'2023-04-26 13:50:18','bed_height_NE(mm)',84,'mm',3),(369,'2023-04-26 13:50:18','bed_height_SW(mm)',3,'mm',4),(370,'2023-04-26 13:50:18','bed_height_SE(mm)',36,'mm',5),(371,'2023-04-26 13:50:18','bed_position_z(mm)',60,'mm',6),(372,'2023-04-26 13:50:18','nozzle_thermometer(degF)',51,'degF',7),(373,'2023-04-26 13:50:18','nozzle_position_x(mm)',132,'mm',8),(374,'2023-04-26 13:50:18','nozzle_position_y(mm)',6,'mm',9),(375,'2023-04-26 13:50:18','motor_ammeter(amps)',38,'amps',10),(376,'2023-04-26 13:50:18','motor_tachometer(deg)',126,'deg',11),(377,'2023-04-26 13:50:18','motor_thermometer(degF)',128,'degF',12),(378,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',113,'mm/s2',13),(379,'2023-04-26 13:50:18','motor_ammeter(amps)',29,'amps',14),(380,'2023-04-26 13:50:18','motor_tachometer(deg)',90,'deg',15),(381,'2023-04-26 13:50:18','motor_thermometer(degF)',70,'degF',16),(382,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',139,'mm/s2',17),(383,'2023-04-26 13:50:18','motor_ammeter(amps)',142,'amps',18),(384,'2023-04-26 13:50:18','motor_tachometer(deg)',86,'deg',19),(385,'2023-04-26 13:50:18','motor_thermometer(degF)',26,'degF',20),(386,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',115,'mm/s2',21),(387,'2023-04-26 13:50:18','motor_ammeter(amps)',49,'amps',22),(388,'2023-04-26 13:50:18','motor_tachometer(deg)',115,'deg',23),(389,'2023-04-26 13:50:18','motor_thermometer(degF)',49,'degF',24),(390,'2023-04-26 13:50:18','motor_accelerometer(mm/s2)',99,'mm/s2',25),(391,'2023-04-26 13:50:18','chamber_thermometer(degF)',107,'degF',26),(392,'2023-04-26 13:50:18','chamber_oxygen_level(percent)',97,'percent',27),(393,'2023-04-26 13:50:18','chamber_vaccuum_level(percent)',76,'percent',28),(394,'2023-04-26 14:03:02','bed_thermometer(degF)',139,'degF',1),(395,'2023-04-26 14:03:02','bed_height_NW(mm)',55,'mm',2),(396,'2023-04-26 14:03:02','bed_height_NE(mm)',41,'mm',3),(397,'2023-04-26 14:03:02','bed_height_SW(mm)',19,'mm',4),(398,'2023-04-26 14:03:02','bed_height_SE(mm)',77,'mm',5),(399,'2023-04-26 14:03:02','bed_position_z(mm)',26,'mm',6),(400,'2023-04-26 14:03:02','nozzle_thermometer(degF)',29,'degF',7),(401,'2023-04-26 14:03:02','nozzle_position_x(mm)',30,'mm',8),(402,'2023-04-26 14:03:02','nozzle_position_y(mm)',67,'mm',9),(403,'2023-04-26 14:03:02','motor_ammeter(amps)',28,'amps',10),(404,'2023-04-26 14:03:02','motor_tachometer(deg)',32,'deg',11),(405,'2023-04-26 14:03:02','motor_thermometer(degF)',87,'degF',12),(406,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',42,'mm/s2',13),(407,'2023-04-26 14:03:02','motor_ammeter(amps)',12,'amps',14),(408,'2023-04-26 14:03:02','motor_tachometer(deg)',73,'deg',15),(409,'2023-04-26 14:03:02','motor_thermometer(degF)',142,'degF',16),(410,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',142,'mm/s2',17),(411,'2023-04-26 14:03:02','motor_ammeter(amps)',41,'amps',18),(412,'2023-04-26 14:03:02','motor_tachometer(deg)',129,'deg',19),(413,'2023-04-26 14:03:02','motor_thermometer(degF)',48,'degF',20),(414,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',70,'mm/s2',21),(415,'2023-04-26 14:03:02','motor_ammeter(amps)',83,'amps',22),(416,'2023-04-26 14:03:02','motor_tachometer(deg)',23,'deg',23),(417,'2023-04-26 14:03:02','motor_thermometer(degF)',125,'degF',24),(418,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',58,'mm/s2',25),(419,'2023-04-26 14:03:02','chamber_thermometer(degF)',142,'degF',26),(420,'2023-04-26 14:03:02','chamber_oxygen_level(percent)',126,'percent',27),(421,'2023-04-26 14:03:02','chamber_vaccuum_level(percent)',110,'percent',28),(422,'2023-04-26 14:03:02','bed_thermometer(degF)',52,'degF',1),(423,'2023-04-26 14:03:02','bed_height_NW(mm)',109,'mm',2),(424,'2023-04-26 14:03:02','bed_height_NE(mm)',26,'mm',3),(425,'2023-04-26 14:03:02','bed_height_SW(mm)',102,'mm',4),(426,'2023-04-26 14:03:02','bed_height_SE(mm)',64,'mm',5),(427,'2023-04-26 14:03:02','bed_position_z(mm)',96,'mm',6),(428,'2023-04-26 14:03:02','nozzle_thermometer(degF)',99,'degF',7),(429,'2023-04-26 14:03:02','nozzle_position_x(mm)',42,'mm',8),(430,'2023-04-26 14:03:02','nozzle_position_y(mm)',20,'mm',9),(431,'2023-04-26 14:03:02','motor_ammeter(amps)',48,'amps',10),(432,'2023-04-26 14:03:02','motor_tachometer(deg)',44,'deg',11),(433,'2023-04-26 14:03:02','motor_thermometer(degF)',138,'degF',12),(434,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',128,'mm/s2',13),(435,'2023-04-26 14:03:02','motor_ammeter(amps)',76,'amps',14),(436,'2023-04-26 14:03:02','motor_tachometer(deg)',94,'deg',15),(437,'2023-04-26 14:03:02','motor_thermometer(degF)',100,'degF',16),(438,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',15,'mm/s2',17),(439,'2023-04-26 14:03:02','motor_ammeter(amps)',97,'amps',18),(440,'2023-04-26 14:03:02','motor_tachometer(deg)',132,'deg',19),(441,'2023-04-26 14:03:02','motor_thermometer(degF)',103,'degF',20),(442,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',71,'mm/s2',21),(443,'2023-04-26 14:03:02','motor_ammeter(amps)',23,'amps',22),(444,'2023-04-26 14:03:02','motor_tachometer(deg)',30,'deg',23),(445,'2023-04-26 14:03:02','motor_thermometer(degF)',10,'degF',24),(446,'2023-04-26 14:03:02','motor_accelerometer(mm/s2)',32,'mm/s2',25),(447,'2023-04-26 14:03:02','chamber_thermometer(degF)',105,'degF',26),(448,'2023-04-26 14:03:02','chamber_oxygen_level(percent)',12,'percent',27),(449,'2023-04-26 14:03:02','chamber_vaccuum_level(percent)',116,'percent',28),(450,'2023-04-26 14:18:39','bed_thermometer(degF)',84,'degF',29),(451,'2023-04-26 14:18:39','bed_height_NW(mm)',0,'mm',30),(452,'2023-04-26 14:18:39','bed_height_NE(mm)',113,'mm',31),(453,'2023-04-26 14:18:39','bed_height_SW(mm)',60,'mm',32),(454,'2023-04-26 14:18:39','bed_height_SE(mm)',0,'mm',33),(455,'2023-04-26 14:18:39','bed_position_z(mm)',61,'mm',34),(456,'2023-04-26 14:18:39','nozzle_thermometer(degF)',144,'degF',35),(457,'2023-04-26 14:18:39','nozzle_position_x(mm)',78,'mm',36),(458,'2023-04-26 14:18:39','nozzle_position_y(mm)',84,'mm',37),(459,'2023-04-26 14:18:39','motor_ammeter(amps)',129,'amps',38),(460,'2023-04-26 14:18:39','motor_tachometer(deg)',102,'deg',39),(461,'2023-04-26 14:18:39','motor_thermometer(degF)',128,'degF',40),(462,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',70,'mm/s2',41),(463,'2023-04-26 14:18:39','motor_ammeter(amps)',97,'amps',42),(464,'2023-04-26 14:18:39','motor_tachometer(deg)',68,'deg',43),(465,'2023-04-26 14:18:39','motor_thermometer(degF)',80,'degF',44),(466,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',96,'mm/s2',45),(467,'2023-04-26 14:18:39','motor_ammeter(amps)',84,'amps',46),(468,'2023-04-26 14:18:39','motor_tachometer(deg)',26,'deg',47),(469,'2023-04-26 14:18:39','motor_thermometer(degF)',46,'degF',48),(470,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',42,'mm/s2',49),(471,'2023-04-26 14:18:39','motor_ammeter(amps)',71,'amps',50),(472,'2023-04-26 14:18:39','motor_tachometer(deg)',119,'deg',51),(473,'2023-04-26 14:18:39','motor_thermometer(degF)',102,'degF',52),(474,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',10,'mm/s2',53),(475,'2023-04-26 14:18:39','chamber_thermometer(degF)',3,'degF',54),(476,'2023-04-26 14:18:39','chamber_oxygen_level(percent)',129,'percent',55),(477,'2023-04-26 14:18:39','chamber_vaccuum_level(percent)',3,'percent',56),(478,'2023-04-26 14:18:39','bed_thermometer(degF)',138,'degF',29),(479,'2023-04-26 14:18:39','bed_height_NW(mm)',139,'mm',30),(480,'2023-04-26 14:18:39','bed_height_NE(mm)',65,'mm',31),(481,'2023-04-26 14:18:39','bed_height_SW(mm)',35,'mm',32),(482,'2023-04-26 14:18:39','bed_height_SE(mm)',3,'mm',33),(483,'2023-04-26 14:18:39','bed_position_z(mm)',99,'mm',34),(484,'2023-04-26 14:18:39','nozzle_thermometer(degF)',113,'degF',35),(485,'2023-04-26 14:18:39','nozzle_position_x(mm)',60,'mm',36),(486,'2023-04-26 14:18:39','nozzle_position_y(mm)',77,'mm',37),(487,'2023-04-26 14:18:39','motor_ammeter(amps)',71,'amps',38),(488,'2023-04-26 14:18:39','motor_tachometer(deg)',73,'deg',39),(489,'2023-04-26 14:18:39','motor_thermometer(degF)',145,'degF',40),(490,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',113,'mm/s2',41),(491,'2023-04-26 14:18:39','motor_ammeter(amps)',76,'amps',42),(492,'2023-04-26 14:18:39','motor_tachometer(deg)',67,'deg',43),(493,'2023-04-26 14:18:39','motor_thermometer(degF)',57,'degF',44),(494,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',115,'mm/s2',45),(495,'2023-04-26 14:18:39','motor_ammeter(amps)',119,'amps',46),(496,'2023-04-26 14:18:39','motor_tachometer(deg)',20,'deg',47),(497,'2023-04-26 14:18:39','motor_thermometer(degF)',9,'degF',48),(498,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',107,'mm/s2',49),(499,'2023-04-26 14:18:39','motor_ammeter(amps)',38,'amps',50),(500,'2023-04-26 14:18:39','motor_tachometer(deg)',70,'deg',51),(501,'2023-04-26 14:18:39','motor_thermometer(degF)',106,'degF',52),(502,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',45,'mm/s2',53),(503,'2023-04-26 14:18:39','chamber_thermometer(degF)',61,'degF',54),(504,'2023-04-26 14:18:39','chamber_oxygen_level(percent)',129,'percent',55),(505,'2023-04-26 14:18:39','chamber_vaccuum_level(percent)',20,'percent',56),(506,'2023-04-26 14:18:39','bed_thermometer(degF)',29,'degF',29),(507,'2023-04-26 14:18:39','bed_height_NW(mm)',4,'mm',30),(508,'2023-04-26 14:18:39','bed_height_NE(mm)',57,'mm',31),(509,'2023-04-26 14:18:39','bed_height_SW(mm)',145,'mm',32),(510,'2023-04-26 14:18:39','bed_height_SE(mm)',60,'mm',33),(511,'2023-04-26 14:18:39','bed_position_z(mm)',97,'mm',34),(512,'2023-04-26 14:18:39','nozzle_thermometer(degF)',141,'degF',35),(513,'2023-04-26 14:18:39','nozzle_position_x(mm)',9,'mm',36),(514,'2023-04-26 14:18:39','nozzle_position_y(mm)',86,'mm',37),(515,'2023-04-26 14:18:39','motor_ammeter(amps)',90,'amps',38),(516,'2023-04-26 14:18:39','motor_tachometer(deg)',115,'deg',39),(517,'2023-04-26 14:18:39','motor_thermometer(degF)',1,'degF',40),(518,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',131,'mm/s2',41),(519,'2023-04-26 14:18:39','motor_ammeter(amps)',57,'amps',42),(520,'2023-04-26 14:18:39','motor_tachometer(deg)',122,'deg',43),(521,'2023-04-26 14:18:39','motor_thermometer(degF)',99,'degF',44),(522,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',28,'mm/s2',45),(523,'2023-04-26 14:18:39','motor_ammeter(amps)',70,'amps',46),(524,'2023-04-26 14:18:39','motor_tachometer(deg)',134,'deg',47),(525,'2023-04-26 14:18:39','motor_thermometer(degF)',0,'degF',48),(526,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',57,'mm/s2',49),(527,'2023-04-26 14:18:39','motor_ammeter(amps)',35,'amps',50),(528,'2023-04-26 14:18:39','motor_tachometer(deg)',77,'deg',51),(529,'2023-04-26 14:18:39','motor_thermometer(degF)',3,'degF',52),(530,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',48,'mm/s2',53),(531,'2023-04-26 14:18:39','chamber_thermometer(degF)',62,'degF',54),(532,'2023-04-26 14:18:39','chamber_oxygen_level(percent)',100,'percent',55),(533,'2023-04-26 14:18:39','chamber_vaccuum_level(percent)',52,'percent',56),(534,'2023-04-26 14:18:39','bed_thermometer(degF)',83,'degF',29),(535,'2023-04-26 14:18:39','bed_height_NW(mm)',81,'mm',30),(536,'2023-04-26 14:18:39','bed_height_NE(mm)',139,'mm',31),(537,'2023-04-26 14:18:39','bed_height_SW(mm)',12,'mm',32),(538,'2023-04-26 14:18:39','bed_height_SE(mm)',6,'mm',33),(539,'2023-04-26 14:18:39','bed_position_z(mm)',64,'mm',34),(540,'2023-04-26 14:18:39','nozzle_thermometer(degF)',110,'degF',35),(541,'2023-04-26 14:18:39','nozzle_position_x(mm)',97,'mm',36),(542,'2023-04-26 14:18:39','nozzle_position_y(mm)',80,'mm',37),(543,'2023-04-26 14:18:39','motor_ammeter(amps)',110,'amps',38),(544,'2023-04-26 14:18:39','motor_tachometer(deg)',121,'deg',39),(545,'2023-04-26 14:18:39','motor_thermometer(degF)',65,'degF',40),(546,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',105,'mm/s2',41),(547,'2023-04-26 14:18:39','motor_ammeter(amps)',45,'amps',42),(548,'2023-04-26 14:18:39','motor_tachometer(deg)',144,'deg',43),(549,'2023-04-26 14:18:39','motor_thermometer(degF)',74,'degF',44),(550,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',128,'mm/s2',45),(551,'2023-04-26 14:18:39','motor_ammeter(amps)',76,'amps',46),(552,'2023-04-26 14:18:39','motor_tachometer(deg)',58,'deg',47),(553,'2023-04-26 14:18:39','motor_thermometer(degF)',54,'degF',48),(554,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',115,'mm/s2',49),(555,'2023-04-26 14:18:39','motor_ammeter(amps)',25,'amps',50),(556,'2023-04-26 14:18:39','motor_tachometer(deg)',55,'deg',51),(557,'2023-04-26 14:18:39','motor_thermometer(degF)',25,'degF',52),(558,'2023-04-26 14:18:39','motor_accelerometer(mm/s2)',30,'mm/s2',53),(559,'2023-04-26 14:18:39','chamber_thermometer(degF)',13,'degF',54),(560,'2023-04-26 14:18:39','chamber_oxygen_level(percent)',110,'percent',55),(561,'2023-04-26 14:18:39','chamber_vaccuum_level(percent)',91,'percent',56),(562,'2023-04-26 14:28:26','bed_thermometer(degF)',3,'degF',29),(563,'2023-04-26 14:28:26','bed_height_NW(mm)',132,'mm',30),(564,'2023-04-26 14:28:26','bed_height_NE(mm)',68,'mm',31),(565,'2023-04-26 14:28:26','bed_height_SW(mm)',10,'mm',32),(566,'2023-04-26 14:28:26','bed_height_SE(mm)',36,'mm',33),(567,'2023-04-26 14:28:26','bed_position_z(mm)',106,'mm',34),(568,'2023-04-26 14:28:26','nozzle_thermometer(degF)',116,'degF',35),(569,'2023-04-26 14:28:26','nozzle_position_x(mm)',134,'mm',36),(570,'2023-04-26 14:28:26','nozzle_position_y(mm)',106,'mm',37),(571,'2023-04-26 14:28:26','motor_ammeter(amps)',119,'amps',38),(572,'2023-04-26 14:28:26','motor_tachometer(deg)',61,'deg',39),(573,'2023-04-26 14:28:26','motor_thermometer(degF)',64,'degF',40),(574,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',48,'mm/s2',41),(575,'2023-04-26 14:28:26','motor_ammeter(amps)',97,'amps',42),(576,'2023-04-26 14:28:26','motor_tachometer(deg)',87,'deg',43),(577,'2023-04-26 14:28:26','motor_thermometer(degF)',35,'degF',44),(578,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',77,'mm/s2',45),(579,'2023-04-26 14:28:26','motor_ammeter(amps)',109,'amps',46),(580,'2023-04-26 14:28:26','motor_tachometer(deg)',122,'deg',47),(581,'2023-04-26 14:28:26','motor_thermometer(degF)',32,'degF',48),(582,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',134,'mm/s2',49),(583,'2023-04-26 14:28:26','motor_ammeter(amps)',45,'amps',50),(584,'2023-04-26 14:28:26','motor_tachometer(deg)',116,'deg',51),(585,'2023-04-26 14:28:26','motor_thermometer(degF)',71,'degF',52),(586,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',29,'mm/s2',53),(587,'2023-04-26 14:28:26','chamber_thermometer(degF)',0,'degF',54),(588,'2023-04-26 14:28:26','chamber_oxygen_level(percent)',84,'percent',55),(589,'2023-04-26 14:28:26','chamber_vaccuum_level(percent)',51,'percent',56),(590,'2023-04-26 14:28:26','bed_thermometer(degF)',17,'degF',29),(591,'2023-04-26 14:28:26','bed_height_NW(mm)',73,'mm',30),(592,'2023-04-26 14:28:26','bed_height_NE(mm)',65,'mm',31),(593,'2023-04-26 14:28:26','bed_height_SW(mm)',28,'mm',32),(594,'2023-04-26 14:28:26','bed_height_SE(mm)',84,'mm',33),(595,'2023-04-26 14:28:26','bed_position_z(mm)',55,'mm',34),(596,'2023-04-26 14:28:26','nozzle_thermometer(degF)',139,'degF',35),(597,'2023-04-26 14:28:26','nozzle_position_x(mm)',49,'mm',36),(598,'2023-04-26 14:28:26','nozzle_position_y(mm)',60,'mm',37),(599,'2023-04-26 14:28:26','motor_ammeter(amps)',68,'amps',38),(600,'2023-04-26 14:28:26','motor_tachometer(deg)',4,'deg',39),(601,'2023-04-26 14:28:26','motor_thermometer(degF)',44,'degF',40),(602,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',125,'mm/s2',41),(603,'2023-04-26 14:28:26','motor_ammeter(amps)',73,'amps',42),(604,'2023-04-26 14:28:26','motor_tachometer(deg)',68,'deg',43),(605,'2023-04-26 14:28:26','motor_thermometer(degF)',132,'degF',44),(606,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',138,'mm/s2',45),(607,'2023-04-26 14:28:26','motor_ammeter(amps)',139,'amps',46),(608,'2023-04-26 14:28:26','motor_tachometer(deg)',41,'deg',47),(609,'2023-04-26 14:28:26','motor_thermometer(degF)',38,'degF',48),(610,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',61,'mm/s2',49),(611,'2023-04-26 14:28:26','motor_ammeter(amps)',99,'amps',50),(612,'2023-04-26 14:28:26','motor_tachometer(deg)',25,'deg',51),(613,'2023-04-26 14:28:26','motor_thermometer(degF)',142,'degF',52),(614,'2023-04-26 14:28:26','motor_accelerometer(mm/s2)',0,'mm/s2',53),(615,'2023-04-26 14:28:26','chamber_thermometer(degF)',142,'degF',54),(616,'2023-04-26 14:28:26','chamber_oxygen_level(percent)',74,'percent',55),(617,'2023-04-26 14:28:26','chamber_vaccuum_level(percent)',102,'percent',56),(618,'2023-04-26 16:58:01','bed_thermometer(degF)',134,'degF',29),(619,'2023-04-26 16:58:01','bed_height_NW(mm)',46,'mm',30),(620,'2023-04-26 16:58:01','bed_height_NE(mm)',128,'mm',31),(621,'2023-04-26 16:58:01','bed_height_SW(mm)',44,'mm',32),(622,'2023-04-26 16:58:01','bed_height_SE(mm)',60,'mm',33),(623,'2023-04-26 16:58:01','bed_position_z(mm)',13,'mm',34),(624,'2023-04-26 16:58:01','nozzle_thermometer(degF)',65,'degF',35),(625,'2023-04-26 16:58:01','nozzle_position_x(mm)',90,'mm',36),(626,'2023-04-26 16:58:01','nozzle_position_y(mm)',138,'mm',37),(627,'2023-04-26 16:58:01','motor_ammeter(amps)',60,'amps',38),(628,'2023-04-26 16:58:01','motor_tachometer(deg)',74,'deg',39),(629,'2023-04-26 16:58:01','motor_thermometer(degF)',7,'degF',40),(630,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',77,'mm/s2',41),(631,'2023-04-26 16:58:01','motor_ammeter(amps)',91,'amps',42),(632,'2023-04-26 16:58:01','motor_tachometer(deg)',128,'deg',43),(633,'2023-04-26 16:58:01','motor_thermometer(degF)',81,'degF',44),(634,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',49,'mm/s2',45),(635,'2023-04-26 16:58:01','motor_ammeter(amps)',73,'amps',46),(636,'2023-04-26 16:58:01','motor_tachometer(deg)',102,'deg',47),(637,'2023-04-26 16:58:01','motor_thermometer(degF)',39,'degF',48),(638,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',68,'mm/s2',49),(639,'2023-04-26 16:58:01','motor_ammeter(amps)',3,'amps',50),(640,'2023-04-26 16:58:01','motor_tachometer(deg)',9,'deg',51),(641,'2023-04-26 16:58:01','motor_thermometer(degF)',128,'degF',52),(642,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',80,'mm/s2',53),(643,'2023-04-26 16:58:01','chamber_thermometer(degF)',76,'degF',54),(644,'2023-04-26 16:58:01','chamber_oxygen_level(percent)',29,'percent',55),(645,'2023-04-26 16:58:01','chamber_vaccuum_level(percent)',4,'percent',56),(646,'2023-04-26 16:58:01','bed_thermometer(degF)',61,'degF',29),(647,'2023-04-26 16:58:01','bed_height_NW(mm)',110,'mm',30),(648,'2023-04-26 16:58:01','bed_height_NE(mm)',84,'mm',31),(649,'2023-04-26 16:58:01','bed_height_SW(mm)',1,'mm',32),(650,'2023-04-26 16:58:01','bed_height_SE(mm)',3,'mm',33),(651,'2023-04-26 16:58:01','bed_position_z(mm)',97,'mm',34),(652,'2023-04-26 16:58:01','nozzle_thermometer(degF)',16,'degF',35),(653,'2023-04-26 16:58:01','nozzle_position_x(mm)',78,'mm',36),(654,'2023-04-26 16:58:01','nozzle_position_y(mm)',44,'mm',37),(655,'2023-04-26 16:58:01','motor_ammeter(amps)',44,'amps',38),(656,'2023-04-26 16:58:01','motor_tachometer(deg)',110,'deg',39),(657,'2023-04-26 16:58:01','motor_thermometer(degF)',61,'degF',40),(658,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',100,'mm/s2',41),(659,'2023-04-26 16:58:01','motor_ammeter(amps)',145,'amps',42),(660,'2023-04-26 16:58:01','motor_tachometer(deg)',73,'deg',43),(661,'2023-04-26 16:58:01','motor_thermometer(degF)',90,'degF',44),(662,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',110,'mm/s2',45),(663,'2023-04-26 16:58:01','motor_ammeter(amps)',105,'amps',46),(664,'2023-04-26 16:58:01','motor_tachometer(deg)',96,'deg',47),(665,'2023-04-26 16:58:01','motor_thermometer(degF)',48,'degF',48),(666,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',33,'mm/s2',49),(667,'2023-04-26 16:58:01','motor_ammeter(amps)',141,'amps',50),(668,'2023-04-26 16:58:01','motor_tachometer(deg)',46,'deg',51),(669,'2023-04-26 16:58:01','motor_thermometer(degF)',9,'degF',52),(670,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',86,'mm/s2',53),(671,'2023-04-26 16:58:01','chamber_thermometer(degF)',42,'degF',54),(672,'2023-04-26 16:58:01','chamber_oxygen_level(percent)',138,'percent',55),(673,'2023-04-26 16:58:01','chamber_vaccuum_level(percent)',20,'percent',56),(674,'2023-04-26 16:58:01','bed_thermometer(degF)',109,'degF',29),(675,'2023-04-26 16:58:01','bed_height_NW(mm)',16,'mm',30),(676,'2023-04-26 16:58:01','bed_height_NE(mm)',144,'mm',31),(677,'2023-04-26 16:58:01','bed_height_SW(mm)',90,'mm',32),(678,'2023-04-26 16:58:01','bed_height_SE(mm)',20,'mm',33),(679,'2023-04-26 16:58:01','bed_position_z(mm)',22,'mm',34),(680,'2023-04-26 16:58:01','nozzle_thermometer(degF)',87,'degF',35),(681,'2023-04-26 16:58:01','nozzle_position_x(mm)',76,'mm',36),(682,'2023-04-26 16:58:01','nozzle_position_y(mm)',65,'mm',37),(683,'2023-04-26 16:58:01','motor_ammeter(amps)',103,'amps',38),(684,'2023-04-26 16:58:01','motor_tachometer(deg)',132,'deg',39),(685,'2023-04-26 16:58:01','motor_thermometer(degF)',138,'degF',40),(686,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',145,'mm/s2',41),(687,'2023-04-26 16:58:01','motor_ammeter(amps)',109,'amps',42),(688,'2023-04-26 16:58:01','motor_tachometer(deg)',136,'deg',43),(689,'2023-04-26 16:58:01','motor_thermometer(degF)',76,'degF',44),(690,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',94,'mm/s2',45),(691,'2023-04-26 16:58:01','motor_ammeter(amps)',65,'amps',46),(692,'2023-04-26 16:58:01','motor_tachometer(deg)',29,'deg',47),(693,'2023-04-26 16:58:01','motor_thermometer(degF)',35,'degF',48),(694,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',61,'mm/s2',49),(695,'2023-04-26 16:58:01','motor_ammeter(amps)',90,'amps',50),(696,'2023-04-26 16:58:01','motor_tachometer(deg)',15,'deg',51),(697,'2023-04-26 16:58:01','motor_thermometer(degF)',94,'degF',52),(698,'2023-04-26 16:58:01','motor_accelerometer(mm/s2)',35,'mm/s2',53),(699,'2023-04-26 16:58:01','chamber_thermometer(degF)',9,'degF',54),(700,'2023-04-26 16:58:01','chamber_oxygen_level(percent)',129,'percent',55),(701,'2023-04-26 16:58:01','chamber_vaccuum_level(percent)',125,'percent',56),(702,'2023-04-26 17:02:59','bed_thermometer(degF)',112,'degF',29),(703,'2023-04-26 17:02:59','bed_height_NW(mm)',97,'mm',30),(704,'2023-04-26 17:02:59','bed_height_NE(mm)',87,'mm',31),(705,'2023-04-26 17:02:59','bed_height_SW(mm)',138,'mm',32),(706,'2023-04-26 17:02:59','bed_height_SE(mm)',23,'mm',33),(707,'2023-04-26 17:02:59','bed_position_z(mm)',38,'mm',34),(708,'2023-04-26 17:02:59','nozzle_thermometer(degF)',46,'degF',35),(709,'2023-04-26 17:02:59','nozzle_position_x(mm)',105,'mm',36),(710,'2023-04-26 17:02:59','nozzle_position_y(mm)',7,'mm',37),(711,'2023-04-26 17:02:59','motor_ammeter(amps)',141,'amps',38),(712,'2023-04-26 17:02:59','motor_tachometer(deg)',115,'deg',39),(713,'2023-04-26 17:02:59','motor_thermometer(degF)',136,'degF',40),(714,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',99,'mm/s2',41),(715,'2023-04-26 17:02:59','motor_ammeter(amps)',84,'amps',42),(716,'2023-04-26 17:02:59','motor_tachometer(deg)',119,'deg',43),(717,'2023-04-26 17:02:59','motor_thermometer(degF)',45,'degF',44),(718,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',135,'mm/s2',45),(719,'2023-04-26 17:02:59','motor_ammeter(amps)',141,'amps',46),(720,'2023-04-26 17:02:59','motor_tachometer(deg)',119,'deg',47),(721,'2023-04-26 17:02:59','motor_thermometer(degF)',71,'degF',48),(722,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',106,'mm/s2',49),(723,'2023-04-26 17:02:59','motor_ammeter(amps)',94,'amps',50),(724,'2023-04-26 17:02:59','motor_tachometer(deg)',22,'deg',51),(725,'2023-04-26 17:02:59','motor_thermometer(degF)',17,'degF',52),(726,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',6,'mm/s2',53),(727,'2023-04-26 17:02:59','chamber_thermometer(degF)',30,'degF',54),(728,'2023-04-26 17:02:59','chamber_oxygen_level(percent)',97,'percent',55),(729,'2023-04-26 17:02:59','chamber_vaccuum_level(percent)',89,'percent',56),(730,'2023-04-26 17:02:59','bed_thermometer(degF)',142,'degF',29),(731,'2023-04-26 17:02:59','bed_height_NW(mm)',46,'mm',30),(732,'2023-04-26 17:02:59','bed_height_NE(mm)',9,'mm',31),(733,'2023-04-26 17:02:59','bed_height_SW(mm)',32,'mm',32),(734,'2023-04-26 17:02:59','bed_height_SE(mm)',32,'mm',33),(735,'2023-04-26 17:02:59','bed_position_z(mm)',42,'mm',34),(736,'2023-04-26 17:02:59','nozzle_thermometer(degF)',48,'degF',35),(737,'2023-04-26 17:02:59','nozzle_position_x(mm)',28,'mm',36),(738,'2023-04-26 17:02:59','nozzle_position_y(mm)',49,'mm',37),(739,'2023-04-26 17:02:59','motor_ammeter(amps)',29,'amps',38),(740,'2023-04-26 17:02:59','motor_tachometer(deg)',1,'deg',39),(741,'2023-04-26 17:02:59','motor_thermometer(degF)',131,'degF',40),(742,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',48,'mm/s2',41),(743,'2023-04-26 17:02:59','motor_ammeter(amps)',109,'amps',42),(744,'2023-04-26 17:02:59','motor_tachometer(deg)',142,'deg',43),(745,'2023-04-26 17:02:59','motor_thermometer(degF)',35,'degF',44),(746,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',121,'mm/s2',45),(747,'2023-04-26 17:02:59','motor_ammeter(amps)',90,'amps',46),(748,'2023-04-26 17:02:59','motor_tachometer(deg)',9,'deg',47),(749,'2023-04-26 17:02:59','motor_thermometer(degF)',64,'degF',48),(750,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',80,'mm/s2',49),(751,'2023-04-26 17:02:59','motor_ammeter(amps)',16,'amps',50),(752,'2023-04-26 17:02:59','motor_tachometer(deg)',74,'deg',51),(753,'2023-04-26 17:02:59','motor_thermometer(degF)',122,'degF',52),(754,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',28,'mm/s2',53),(755,'2023-04-26 17:02:59','chamber_thermometer(degF)',22,'degF',54),(756,'2023-04-26 17:02:59','chamber_oxygen_level(percent)',73,'percent',55),(757,'2023-04-26 17:02:59','chamber_vaccuum_level(percent)',55,'percent',56),(758,'2023-04-26 17:02:59','bed_thermometer(degF)',129,'degF',29),(759,'2023-04-26 17:02:59','bed_height_NW(mm)',129,'mm',30),(760,'2023-04-26 17:02:59','bed_height_NE(mm)',29,'mm',31),(761,'2023-04-26 17:02:59','bed_height_SW(mm)',91,'mm',32),(762,'2023-04-26 17:02:59','bed_height_SE(mm)',110,'mm',33),(763,'2023-04-26 17:02:59','bed_position_z(mm)',22,'mm',34),(764,'2023-04-26 17:02:59','nozzle_thermometer(degF)',84,'degF',35),(765,'2023-04-26 17:02:59','nozzle_position_x(mm)',139,'mm',36),(766,'2023-04-26 17:02:59','nozzle_position_y(mm)',29,'mm',37),(767,'2023-04-26 17:02:59','motor_ammeter(amps)',25,'amps',38),(768,'2023-04-26 17:02:59','motor_tachometer(deg)',13,'deg',39),(769,'2023-04-26 17:02:59','motor_thermometer(degF)',112,'degF',40),(770,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',15,'mm/s2',41),(771,'2023-04-26 17:02:59','motor_ammeter(amps)',74,'amps',42),(772,'2023-04-26 17:02:59','motor_tachometer(deg)',55,'deg',43),(773,'2023-04-26 17:02:59','motor_thermometer(degF)',23,'degF',44),(774,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',9,'mm/s2',45),(775,'2023-04-26 17:02:59','motor_ammeter(amps)',93,'amps',46),(776,'2023-04-26 17:02:59','motor_tachometer(deg)',30,'deg',47),(777,'2023-04-26 17:02:59','motor_thermometer(degF)',4,'degF',48),(778,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',67,'mm/s2',49),(779,'2023-04-26 17:02:59','motor_ammeter(amps)',141,'amps',50),(780,'2023-04-26 17:02:59','motor_tachometer(deg)',109,'deg',51),(781,'2023-04-26 17:02:59','motor_thermometer(degF)',141,'degF',52),(782,'2023-04-26 17:02:59','motor_accelerometer(mm/s2)',112,'mm/s2',53),(783,'2023-04-26 17:02:59','chamber_thermometer(degF)',144,'degF',54),(784,'2023-04-26 17:02:59','chamber_oxygen_level(percent)',38,'percent',55),(785,'2023-04-26 17:02:59','chamber_vaccuum_level(percent)',61,'percent',56),(786,'2023-04-26 17:03:03','bed_thermometer(degF)',76,'degF',29),(787,'2023-04-26 17:03:03','bed_height_NW(mm)',19,'mm',30),(788,'2023-04-26 17:03:03','bed_height_NE(mm)',32,'mm',31),(789,'2023-04-26 17:03:03','bed_height_SW(mm)',91,'mm',32),(790,'2023-04-26 17:03:03','bed_height_SE(mm)',141,'mm',33),(791,'2023-04-26 17:03:03','bed_position_z(mm)',23,'mm',34),(792,'2023-04-26 17:03:03','nozzle_thermometer(degF)',42,'degF',35),(793,'2023-04-26 17:03:03','nozzle_position_x(mm)',84,'mm',36),(794,'2023-04-26 17:03:03','nozzle_position_y(mm)',22,'mm',37),(795,'2023-04-26 17:03:03','motor_ammeter(amps)',73,'amps',38),(796,'2023-04-26 17:03:03','motor_tachometer(deg)',16,'deg',39),(797,'2023-04-26 17:03:03','motor_thermometer(degF)',38,'degF',40),(798,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',70,'mm/s2',41),(799,'2023-04-26 17:03:03','motor_ammeter(amps)',107,'amps',42),(800,'2023-04-26 17:03:03','motor_tachometer(deg)',70,'deg',43),(801,'2023-04-26 17:03:03','motor_thermometer(degF)',123,'degF',44),(802,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',126,'mm/s2',45),(803,'2023-04-26 17:03:03','motor_ammeter(amps)',68,'amps',46),(804,'2023-04-26 17:03:03','motor_tachometer(deg)',96,'deg',47),(805,'2023-04-26 17:03:03','motor_thermometer(degF)',125,'degF',48),(806,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',138,'mm/s2',49),(807,'2023-04-26 17:03:03','motor_ammeter(amps)',109,'amps',50),(808,'2023-04-26 17:03:03','motor_tachometer(deg)',73,'deg',51),(809,'2023-04-26 17:03:03','motor_thermometer(degF)',38,'degF',52),(810,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',115,'mm/s2',53),(811,'2023-04-26 17:03:03','chamber_thermometer(degF)',93,'degF',54),(812,'2023-04-26 17:03:03','chamber_oxygen_level(percent)',9,'percent',55),(813,'2023-04-26 17:03:03','chamber_vaccuum_level(percent)',7,'percent',56),(814,'2023-04-26 17:03:03','bed_thermometer(degF)',116,'degF',29),(815,'2023-04-26 17:03:03','bed_height_NW(mm)',6,'mm',30),(816,'2023-04-26 17:03:03','bed_height_NE(mm)',23,'mm',31),(817,'2023-04-26 17:03:03','bed_height_SW(mm)',93,'mm',32),(818,'2023-04-26 17:03:03','bed_height_SE(mm)',15,'mm',33),(819,'2023-04-26 17:03:03','bed_position_z(mm)',73,'mm',34),(820,'2023-04-26 17:03:03','nozzle_thermometer(degF)',112,'degF',35),(821,'2023-04-26 17:03:03','nozzle_position_x(mm)',15,'mm',36),(822,'2023-04-26 17:03:03','nozzle_position_y(mm)',67,'mm',37),(823,'2023-04-26 17:03:03','motor_ammeter(amps)',12,'amps',38),(824,'2023-04-26 17:03:03','motor_tachometer(deg)',4,'deg',39),(825,'2023-04-26 17:03:03','motor_thermometer(degF)',99,'degF',40),(826,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',3,'mm/s2',41),(827,'2023-04-26 17:03:03','motor_ammeter(amps)',68,'amps',42),(828,'2023-04-26 17:03:03','motor_tachometer(deg)',112,'deg',43),(829,'2023-04-26 17:03:03','motor_thermometer(degF)',22,'degF',44),(830,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',93,'mm/s2',45),(831,'2023-04-26 17:03:03','motor_ammeter(amps)',141,'amps',46),(832,'2023-04-26 17:03:03','motor_tachometer(deg)',138,'deg',47),(833,'2023-04-26 17:03:03','motor_thermometer(degF)',44,'degF',48),(834,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',23,'mm/s2',49),(835,'2023-04-26 17:03:03','motor_ammeter(amps)',68,'amps',50),(836,'2023-04-26 17:03:03','motor_tachometer(deg)',77,'deg',51),(837,'2023-04-26 17:03:03','motor_thermometer(degF)',70,'degF',52),(838,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',7,'mm/s2',53),(839,'2023-04-26 17:03:03','chamber_thermometer(degF)',103,'degF',54),(840,'2023-04-26 17:03:03','chamber_oxygen_level(percent)',10,'percent',55),(841,'2023-04-26 17:03:03','chamber_vaccuum_level(percent)',122,'percent',56),(842,'2023-04-26 17:03:03','bed_thermometer(degF)',131,'degF',29),(843,'2023-04-26 17:03:03','bed_height_NW(mm)',71,'mm',30),(844,'2023-04-26 17:03:03','bed_height_NE(mm)',78,'mm',31),(845,'2023-04-26 17:03:03','bed_height_SW(mm)',45,'mm',32),(846,'2023-04-26 17:03:03','bed_height_SE(mm)',51,'mm',33),(847,'2023-04-26 17:03:03','bed_position_z(mm)',74,'mm',34),(848,'2023-04-26 17:03:03','nozzle_thermometer(degF)',134,'degF',35),(849,'2023-04-26 17:03:03','nozzle_position_x(mm)',28,'mm',36),(850,'2023-04-26 17:03:03','nozzle_position_y(mm)',118,'mm',37),(851,'2023-04-26 17:03:03','motor_ammeter(amps)',118,'amps',38),(852,'2023-04-26 17:03:03','motor_tachometer(deg)',129,'deg',39),(853,'2023-04-26 17:03:03','motor_thermometer(degF)',13,'degF',40),(854,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',94,'mm/s2',41),(855,'2023-04-26 17:03:03','motor_ammeter(amps)',51,'amps',42),(856,'2023-04-26 17:03:03','motor_tachometer(deg)',39,'deg',43),(857,'2023-04-26 17:03:03','motor_thermometer(degF)',52,'degF',44),(858,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',93,'mm/s2',45),(859,'2023-04-26 17:03:03','motor_ammeter(amps)',77,'amps',46),(860,'2023-04-26 17:03:03','motor_tachometer(deg)',35,'deg',47),(861,'2023-04-26 17:03:03','motor_thermometer(degF)',94,'degF',48),(862,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',103,'mm/s2',49),(863,'2023-04-26 17:03:03','motor_ammeter(amps)',109,'amps',50),(864,'2023-04-26 17:03:03','motor_tachometer(deg)',126,'deg',51),(865,'2023-04-26 17:03:03','motor_thermometer(degF)',94,'degF',52),(866,'2023-04-26 17:03:03','motor_accelerometer(mm/s2)',141,'mm/s2',53),(867,'2023-04-26 17:03:03','chamber_thermometer(degF)',74,'degF',54),(868,'2023-04-26 17:03:03','chamber_oxygen_level(percent)',121,'percent',55),(869,'2023-04-26 17:03:03','chamber_vaccuum_level(percent)',64,'percent',56),(870,'2023-04-26 17:03:31','bed_thermometer(degF)',145,'degF',29),(871,'2023-04-26 17:03:31','bed_height_NW(mm)',33,'mm',30),(872,'2023-04-26 17:03:31','bed_height_NE(mm)',4,'mm',31),(873,'2023-04-26 17:03:31','bed_height_SW(mm)',115,'mm',32),(874,'2023-04-26 17:03:31','bed_height_SE(mm)',84,'mm',33),(875,'2023-04-26 17:03:31','bed_position_z(mm)',138,'mm',34),(876,'2023-04-26 17:03:31','nozzle_thermometer(degF)',51,'degF',35),(877,'2023-04-26 17:03:31','nozzle_position_x(mm)',122,'mm',36),(878,'2023-04-26 17:03:31','nozzle_position_y(mm)',12,'mm',37),(879,'2023-04-26 17:03:31','motor_ammeter(amps)',83,'amps',38),(880,'2023-04-26 17:03:31','motor_tachometer(deg)',112,'deg',39),(881,'2023-04-26 17:03:31','motor_thermometer(degF)',81,'degF',40),(882,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',1,'mm/s2',41),(883,'2023-04-26 17:03:31','motor_ammeter(amps)',9,'amps',42),(884,'2023-04-26 17:03:31','motor_tachometer(deg)',52,'deg',43),(885,'2023-04-26 17:03:31','motor_thermometer(degF)',60,'degF',44),(886,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',48,'mm/s2',45),(887,'2023-04-26 17:03:31','motor_ammeter(amps)',9,'amps',46),(888,'2023-04-26 17:03:31','motor_tachometer(deg)',128,'deg',47),(889,'2023-04-26 17:03:31','motor_thermometer(degF)',118,'degF',48),(890,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',65,'mm/s2',49),(891,'2023-04-26 17:03:31','motor_ammeter(amps)',83,'amps',50),(892,'2023-04-26 17:03:31','motor_tachometer(deg)',144,'deg',51),(893,'2023-04-26 17:03:31','motor_thermometer(degF)',131,'degF',52),(894,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',54,'mm/s2',53),(895,'2023-04-26 17:03:31','chamber_thermometer(degF)',122,'degF',54),(896,'2023-04-26 17:03:31','chamber_oxygen_level(percent)',51,'percent',55),(897,'2023-04-26 17:03:31','chamber_vaccuum_level(percent)',38,'percent',56),(898,'2023-04-26 17:03:31','bed_thermometer(degF)',109,'degF',29),(899,'2023-04-26 17:03:31','bed_height_NW(mm)',122,'mm',30),(900,'2023-04-26 17:03:31','bed_height_NE(mm)',103,'mm',31),(901,'2023-04-26 17:03:31','bed_height_SW(mm)',36,'mm',32),(902,'2023-04-26 17:03:31','bed_height_SE(mm)',29,'mm',33),(903,'2023-04-26 17:03:31','bed_position_z(mm)',80,'mm',34),(904,'2023-04-26 17:03:31','nozzle_thermometer(degF)',99,'degF',35),(905,'2023-04-26 17:03:31','nozzle_position_x(mm)',125,'mm',36),(906,'2023-04-26 17:03:31','nozzle_position_y(mm)',30,'mm',37),(907,'2023-04-26 17:03:31','motor_ammeter(amps)',19,'amps',38),(908,'2023-04-26 17:03:31','motor_tachometer(deg)',6,'deg',39),(909,'2023-04-26 17:03:31','motor_thermometer(degF)',22,'degF',40),(910,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',103,'mm/s2',41),(911,'2023-04-26 17:03:31','motor_ammeter(amps)',51,'amps',42),(912,'2023-04-26 17:03:31','motor_tachometer(deg)',81,'deg',43),(913,'2023-04-26 17:03:31','motor_thermometer(degF)',45,'degF',44),(914,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',97,'mm/s2',45),(915,'2023-04-26 17:03:31','motor_ammeter(amps)',77,'amps',46),(916,'2023-04-26 17:03:31','motor_tachometer(deg)',115,'deg',47),(917,'2023-04-26 17:03:31','motor_thermometer(degF)',9,'degF',48),(918,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',26,'mm/s2',49),(919,'2023-04-26 17:03:31','motor_ammeter(amps)',61,'amps',50),(920,'2023-04-26 17:03:31','motor_tachometer(deg)',15,'deg',51),(921,'2023-04-26 17:03:31','motor_thermometer(degF)',129,'degF',52),(922,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',28,'mm/s2',53),(923,'2023-04-26 17:03:31','chamber_thermometer(degF)',29,'degF',54),(924,'2023-04-26 17:03:31','chamber_oxygen_level(percent)',62,'percent',55),(925,'2023-04-26 17:03:31','chamber_vaccuum_level(percent)',25,'percent',56),(926,'2023-04-26 17:03:31','bed_thermometer(degF)',122,'degF',29),(927,'2023-04-26 17:03:31','bed_height_NW(mm)',36,'mm',30),(928,'2023-04-26 17:03:31','bed_height_NE(mm)',71,'mm',31),(929,'2023-04-26 17:03:31','bed_height_SW(mm)',138,'mm',32),(930,'2023-04-26 17:03:31','bed_height_SE(mm)',135,'mm',33),(931,'2023-04-26 17:03:31','bed_position_z(mm)',107,'mm',34),(932,'2023-04-26 17:03:31','nozzle_thermometer(degF)',23,'degF',35),(933,'2023-04-26 17:03:31','nozzle_position_x(mm)',76,'mm',36),(934,'2023-04-26 17:03:31','nozzle_position_y(mm)',26,'mm',37),(935,'2023-04-26 17:03:31','motor_ammeter(amps)',113,'amps',38),(936,'2023-04-26 17:03:31','motor_tachometer(deg)',86,'deg',39),(937,'2023-04-26 17:03:31','motor_thermometer(degF)',15,'degF',40),(938,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',90,'mm/s2',41),(939,'2023-04-26 17:03:31','motor_ammeter(amps)',10,'amps',42),(940,'2023-04-26 17:03:31','motor_tachometer(deg)',115,'deg',43),(941,'2023-04-26 17:03:31','motor_thermometer(degF)',70,'degF',44),(942,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',29,'mm/s2',45),(943,'2023-04-26 17:03:31','motor_ammeter(amps)',55,'amps',46),(944,'2023-04-26 17:03:31','motor_tachometer(deg)',61,'deg',47),(945,'2023-04-26 17:03:31','motor_thermometer(degF)',48,'degF',48),(946,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',12,'mm/s2',49),(947,'2023-04-26 17:03:31','motor_ammeter(amps)',68,'amps',50),(948,'2023-04-26 17:03:31','motor_tachometer(deg)',15,'deg',51),(949,'2023-04-26 17:03:31','motor_thermometer(degF)',71,'degF',52),(950,'2023-04-26 17:03:31','motor_accelerometer(mm/s2)',10,'mm/s2',53),(951,'2023-04-26 17:03:31','chamber_thermometer(degF)',33,'degF',54),(952,'2023-04-26 17:03:31','chamber_oxygen_level(percent)',12,'percent',55),(953,'2023-04-26 17:03:31','chamber_vaccuum_level(percent)',125,'percent',56),(954,'2023-04-26 17:04:50','bed_thermometer(degF)',15,'degF',29),(955,'2023-04-26 17:04:50','bed_height_NW(mm)',61,'mm',30),(956,'2023-04-26 17:04:50','bed_height_NE(mm)',39,'mm',31),(957,'2023-04-26 17:04:50','bed_height_SW(mm)',46,'mm',32),(958,'2023-04-26 17:04:50','bed_height_SE(mm)',22,'mm',33),(959,'2023-04-26 17:04:50','bed_position_z(mm)',19,'mm',34),(960,'2023-04-26 17:04:50','nozzle_thermometer(degF)',110,'degF',35),(961,'2023-04-26 17:04:50','nozzle_position_x(mm)',80,'mm',36),(962,'2023-04-26 17:04:50','nozzle_position_y(mm)',131,'mm',37),(963,'2023-04-26 17:04:50','motor_ammeter(amps)',123,'amps',38),(964,'2023-04-26 17:04:50','motor_tachometer(deg)',73,'deg',39),(965,'2023-04-26 17:04:50','motor_thermometer(degF)',86,'degF',40),(966,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',20,'mm/s2',41),(967,'2023-04-26 17:04:50','motor_ammeter(amps)',55,'amps',42),(968,'2023-04-26 17:04:50','motor_tachometer(deg)',52,'deg',43),(969,'2023-04-26 17:04:50','motor_thermometer(degF)',28,'degF',44),(970,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',32,'mm/s2',45),(971,'2023-04-26 17:04:50','motor_ammeter(amps)',71,'amps',46),(972,'2023-04-26 17:04:50','motor_tachometer(deg)',113,'deg',47),(973,'2023-04-26 17:04:50','motor_thermometer(degF)',41,'degF',48),(974,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',144,'mm/s2',49),(975,'2023-04-26 17:04:50','motor_ammeter(amps)',91,'amps',50),(976,'2023-04-26 17:04:50','motor_tachometer(deg)',6,'deg',51),(977,'2023-04-26 17:04:50','motor_thermometer(degF)',17,'degF',52),(978,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',61,'mm/s2',53),(979,'2023-04-26 17:04:50','chamber_thermometer(degF)',44,'degF',54),(980,'2023-04-26 17:04:50','chamber_oxygen_level(percent)',122,'percent',55),(981,'2023-04-26 17:04:50','chamber_vaccuum_level(percent)',81,'percent',56),(982,'2023-04-26 17:04:50','bed_thermometer(degF)',93,'degF',29),(983,'2023-04-26 17:04:50','bed_height_NW(mm)',136,'mm',30),(984,'2023-04-26 17:04:50','bed_height_NE(mm)',103,'mm',31),(985,'2023-04-26 17:04:50','bed_height_SW(mm)',99,'mm',32),(986,'2023-04-26 17:04:50','bed_height_SE(mm)',61,'mm',33),(987,'2023-04-26 17:04:50','bed_position_z(mm)',84,'mm',34),(988,'2023-04-26 17:04:50','nozzle_thermometer(degF)',118,'degF',35),(989,'2023-04-26 17:04:50','nozzle_position_x(mm)',118,'mm',36),(990,'2023-04-26 17:04:50','nozzle_position_y(mm)',16,'mm',37),(991,'2023-04-26 17:04:50','motor_ammeter(amps)',26,'amps',38),(992,'2023-04-26 17:04:50','motor_tachometer(deg)',44,'deg',39),(993,'2023-04-26 17:04:50','motor_thermometer(degF)',93,'degF',40),(994,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',28,'mm/s2',41),(995,'2023-04-26 17:04:50','motor_ammeter(amps)',22,'amps',42),(996,'2023-04-26 17:04:50','motor_tachometer(deg)',86,'deg',43),(997,'2023-04-26 17:04:50','motor_thermometer(degF)',138,'degF',44),(998,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',3,'mm/s2',45),(999,'2023-04-26 17:04:50','motor_ammeter(amps)',44,'amps',46),(1000,'2023-04-26 17:04:50','motor_tachometer(deg)',10,'deg',47),(1001,'2023-04-26 17:04:50','motor_thermometer(degF)',90,'degF',48),(1002,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',84,'mm/s2',49),(1003,'2023-04-26 17:04:50','motor_ammeter(amps)',22,'amps',50),(1004,'2023-04-26 17:04:50','motor_tachometer(deg)',6,'deg',51),(1005,'2023-04-26 17:04:50','motor_thermometer(degF)',55,'degF',52),(1006,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',55,'mm/s2',53),(1007,'2023-04-26 17:04:50','chamber_thermometer(degF)',20,'degF',54),(1008,'2023-04-26 17:04:50','chamber_oxygen_level(percent)',105,'percent',55),(1009,'2023-04-26 17:04:50','chamber_vaccuum_level(percent)',0,'percent',56),(1010,'2023-04-26 17:04:50','bed_thermometer(degF)',12,'degF',29),(1011,'2023-04-26 17:04:50','bed_height_NW(mm)',67,'mm',30),(1012,'2023-04-26 17:04:50','bed_height_NE(mm)',9,'mm',31),(1013,'2023-04-26 17:04:50','bed_height_SW(mm)',67,'mm',32),(1014,'2023-04-26 17:04:50','bed_height_SE(mm)',29,'mm',33),(1015,'2023-04-26 17:04:50','bed_position_z(mm)',16,'mm',34),(1016,'2023-04-26 17:04:50','nozzle_thermometer(degF)',54,'degF',35),(1017,'2023-04-26 17:04:50','nozzle_position_x(mm)',136,'mm',36),(1018,'2023-04-26 17:04:50','nozzle_position_y(mm)',3,'mm',37),(1019,'2023-04-26 17:04:50','motor_ammeter(amps)',9,'amps',38),(1020,'2023-04-26 17:04:50','motor_tachometer(deg)',89,'deg',39),(1021,'2023-04-26 17:04:50','motor_thermometer(degF)',109,'degF',40),(1022,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',122,'mm/s2',41),(1023,'2023-04-26 17:04:50','motor_ammeter(amps)',145,'amps',42),(1024,'2023-04-26 17:04:50','motor_tachometer(deg)',60,'deg',43),(1025,'2023-04-26 17:04:50','motor_thermometer(degF)',89,'degF',44),(1026,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',51,'mm/s2',45),(1027,'2023-04-26 17:04:50','motor_ammeter(amps)',138,'amps',46),(1028,'2023-04-26 17:04:50','motor_tachometer(deg)',61,'deg',47),(1029,'2023-04-26 17:04:50','motor_thermometer(degF)',36,'degF',48),(1030,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',91,'mm/s2',49),(1031,'2023-04-26 17:04:50','motor_ammeter(amps)',42,'amps',50),(1032,'2023-04-26 17:04:50','motor_tachometer(deg)',29,'deg',51),(1033,'2023-04-26 17:04:50','motor_thermometer(degF)',33,'degF',52),(1034,'2023-04-26 17:04:50','motor_accelerometer(mm/s2)',19,'mm/s2',53),(1035,'2023-04-26 17:04:50','chamber_thermometer(degF)',123,'degF',54),(1036,'2023-04-26 17:04:50','chamber_oxygen_level(percent)',106,'percent',55),(1037,'2023-04-26 17:04:50','chamber_vaccuum_level(percent)',126,'percent',56),(1038,'2023-04-26 17:07:48','bed_thermometer(degF)',131,'degF',29),(1039,'2023-04-26 17:07:48','bed_height_NW(mm)',17,'mm',30),(1040,'2023-04-26 17:07:48','bed_height_NE(mm)',23,'mm',31),(1041,'2023-04-26 17:07:48','bed_height_SW(mm)',128,'mm',32),(1042,'2023-04-26 17:07:48','bed_height_SE(mm)',80,'mm',33),(1043,'2023-04-26 17:07:48','bed_position_z(mm)',41,'mm',34),(1044,'2023-04-26 17:07:48','nozzle_thermometer(degF)',99,'degF',35),(1045,'2023-04-26 17:07:48','nozzle_position_x(mm)',67,'mm',36),(1046,'2023-04-26 17:07:48','nozzle_position_y(mm)',60,'mm',37),(1047,'2023-04-26 17:07:48','motor_ammeter(amps)',116,'amps',38),(1048,'2023-04-26 17:07:48','motor_tachometer(deg)',96,'deg',39),(1049,'2023-04-26 17:07:48','motor_thermometer(degF)',36,'degF',40),(1050,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',51,'mm/s2',41),(1051,'2023-04-26 17:07:48','motor_ammeter(amps)',73,'amps',42),(1052,'2023-04-26 17:07:48','motor_tachometer(deg)',45,'deg',43),(1053,'2023-04-26 17:07:48','motor_thermometer(degF)',131,'degF',44),(1054,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',10,'mm/s2',45),(1055,'2023-04-26 17:07:48','motor_ammeter(amps)',29,'amps',46),(1056,'2023-04-26 17:07:48','motor_tachometer(deg)',54,'deg',47),(1057,'2023-04-26 17:07:48','motor_thermometer(degF)',54,'degF',48),(1058,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',110,'mm/s2',49),(1059,'2023-04-26 17:07:48','motor_ammeter(amps)',65,'amps',50),(1060,'2023-04-26 17:07:48','motor_tachometer(deg)',131,'deg',51),(1061,'2023-04-26 17:07:48','motor_thermometer(degF)',70,'degF',52),(1062,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',35,'mm/s2',53),(1063,'2023-04-26 17:07:48','chamber_thermometer(degF)',48,'degF',54),(1064,'2023-04-26 17:07:48','chamber_oxygen_level(percent)',113,'percent',55),(1065,'2023-04-26 17:07:48','chamber_vaccuum_level(percent)',57,'percent',56),(1066,'2023-04-26 17:07:48','bed_thermometer(degF)',125,'degF',29),(1067,'2023-04-26 17:07:48','bed_height_NW(mm)',57,'mm',30),(1068,'2023-04-26 17:07:48','bed_height_NE(mm)',23,'mm',31),(1069,'2023-04-26 17:07:48','bed_height_SW(mm)',44,'mm',32),(1070,'2023-04-26 17:07:48','bed_height_SE(mm)',134,'mm',33),(1071,'2023-04-26 17:07:48','bed_position_z(mm)',57,'mm',34),(1072,'2023-04-26 17:07:48','nozzle_thermometer(degF)',129,'degF',35),(1073,'2023-04-26 17:07:48','nozzle_position_x(mm)',71,'mm',36),(1074,'2023-04-26 17:07:48','nozzle_position_y(mm)',135,'mm',37),(1075,'2023-04-26 17:07:48','motor_ammeter(amps)',60,'amps',38),(1076,'2023-04-26 17:07:48','motor_tachometer(deg)',102,'deg',39),(1077,'2023-04-26 17:07:48','motor_thermometer(degF)',144,'degF',40),(1078,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',42,'mm/s2',41),(1079,'2023-04-26 17:07:48','motor_ammeter(amps)',87,'amps',42),(1080,'2023-04-26 17:07:48','motor_tachometer(deg)',61,'deg',43),(1081,'2023-04-26 17:07:48','motor_thermometer(degF)',109,'degF',44),(1082,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',97,'mm/s2',45),(1083,'2023-04-26 17:07:48','motor_ammeter(amps)',84,'amps',46),(1084,'2023-04-26 17:07:48','motor_tachometer(deg)',83,'deg',47),(1085,'2023-04-26 17:07:48','motor_thermometer(degF)',132,'degF',48),(1086,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',97,'mm/s2',49),(1087,'2023-04-26 17:07:48','motor_ammeter(amps)',76,'amps',50),(1088,'2023-04-26 17:07:48','motor_tachometer(deg)',83,'deg',51),(1089,'2023-04-26 17:07:48','motor_thermometer(degF)',121,'degF',52),(1090,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',100,'mm/s2',53),(1091,'2023-04-26 17:07:48','chamber_thermometer(degF)',33,'degF',54),(1092,'2023-04-26 17:07:48','chamber_oxygen_level(percent)',128,'percent',55),(1093,'2023-04-26 17:07:48','chamber_vaccuum_level(percent)',144,'percent',56),(1094,'2023-04-26 17:07:48','bed_thermometer(degF)',118,'degF',29),(1095,'2023-04-26 17:07:48','bed_height_NW(mm)',126,'mm',30),(1096,'2023-04-26 17:07:48','bed_height_NE(mm)',28,'mm',31),(1097,'2023-04-26 17:07:48','bed_height_SW(mm)',45,'mm',32),(1098,'2023-04-26 17:07:48','bed_height_SE(mm)',23,'mm',33),(1099,'2023-04-26 17:07:48','bed_position_z(mm)',3,'mm',34),(1100,'2023-04-26 17:07:48','nozzle_thermometer(degF)',38,'degF',35),(1101,'2023-04-26 17:07:48','nozzle_position_x(mm)',64,'mm',36),(1102,'2023-04-26 17:07:48','nozzle_position_y(mm)',109,'mm',37),(1103,'2023-04-26 17:07:48','motor_ammeter(amps)',73,'amps',38),(1104,'2023-04-26 17:07:48','motor_tachometer(deg)',44,'deg',39),(1105,'2023-04-26 17:07:48','motor_thermometer(degF)',113,'degF',40),(1106,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',118,'mm/s2',41),(1107,'2023-04-26 17:07:48','motor_ammeter(amps)',126,'amps',42),(1108,'2023-04-26 17:07:48','motor_tachometer(deg)',16,'deg',43),(1109,'2023-04-26 17:07:48','motor_thermometer(degF)',109,'degF',44),(1110,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',1,'mm/s2',45),(1111,'2023-04-26 17:07:48','motor_ammeter(amps)',105,'amps',46),(1112,'2023-04-26 17:07:48','motor_tachometer(deg)',9,'deg',47),(1113,'2023-04-26 17:07:48','motor_thermometer(degF)',49,'degF',48),(1114,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',144,'mm/s2',49),(1115,'2023-04-26 17:07:48','motor_ammeter(amps)',81,'amps',50),(1116,'2023-04-26 17:07:48','motor_tachometer(deg)',38,'deg',51),(1117,'2023-04-26 17:07:48','motor_thermometer(degF)',119,'degF',52),(1118,'2023-04-26 17:07:48','motor_accelerometer(mm/s2)',119,'mm/s2',53),(1119,'2023-04-26 17:07:48','chamber_thermometer(degF)',87,'degF',54),(1120,'2023-04-26 17:07:48','chamber_oxygen_level(percent)',61,'percent',55),(1121,'2023-04-26 17:07:48','chamber_vaccuum_level(percent)',9,'percent',56),(1122,'2023-04-26 17:07:49','bed_thermometer(degF)',74,'degF',29),(1123,'2023-04-26 17:07:49','bed_height_NW(mm)',71,'mm',30),(1124,'2023-04-26 17:07:49','bed_height_NE(mm)',83,'mm',31),(1125,'2023-04-26 17:07:49','bed_height_SW(mm)',58,'mm',32),(1126,'2023-04-26 17:07:49','bed_height_SE(mm)',48,'mm',33),(1127,'2023-04-26 17:07:49','bed_position_z(mm)',141,'mm',34),(1128,'2023-04-26 17:07:49','nozzle_thermometer(degF)',65,'degF',35),(1129,'2023-04-26 17:07:49','nozzle_position_x(mm)',13,'mm',36),(1130,'2023-04-26 17:07:49','nozzle_position_y(mm)',81,'mm',37),(1131,'2023-04-26 17:07:49','motor_ammeter(amps)',41,'amps',38),(1132,'2023-04-26 17:07:49','motor_tachometer(deg)',116,'deg',39),(1133,'2023-04-26 17:07:49','motor_thermometer(degF)',58,'degF',40),(1134,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',138,'mm/s2',41),(1135,'2023-04-26 17:07:49','motor_ammeter(amps)',22,'amps',42),(1136,'2023-04-26 17:07:49','motor_tachometer(deg)',144,'deg',43),(1137,'2023-04-26 17:07:49','motor_thermometer(degF)',29,'degF',44),(1138,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',141,'mm/s2',45),(1139,'2023-04-26 17:07:49','motor_ammeter(amps)',49,'amps',46),(1140,'2023-04-26 17:07:49','motor_tachometer(deg)',70,'deg',47),(1141,'2023-04-26 17:07:49','motor_thermometer(degF)',55,'degF',48),(1142,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',4,'mm/s2',49),(1143,'2023-04-26 17:07:49','motor_ammeter(amps)',99,'amps',50),(1144,'2023-04-26 17:07:49','motor_tachometer(deg)',106,'deg',51),(1145,'2023-04-26 17:07:49','motor_thermometer(degF)',145,'degF',52),(1146,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',25,'mm/s2',53),(1147,'2023-04-26 17:07:49','chamber_thermometer(degF)',15,'degF',54),(1148,'2023-04-26 17:07:49','chamber_oxygen_level(percent)',1,'percent',55),(1149,'2023-04-26 17:07:49','chamber_vaccuum_level(percent)',38,'percent',56),(1150,'2023-04-26 17:07:49','bed_thermometer(degF)',115,'degF',29),(1151,'2023-04-26 17:07:49','bed_height_NW(mm)',9,'mm',30),(1152,'2023-04-26 17:07:49','bed_height_NE(mm)',3,'mm',31),(1153,'2023-04-26 17:07:49','bed_height_SW(mm)',39,'mm',32),(1154,'2023-04-26 17:07:49','bed_height_SE(mm)',1,'mm',33),(1155,'2023-04-26 17:07:49','bed_position_z(mm)',36,'mm',34),(1156,'2023-04-26 17:07:49','nozzle_thermometer(degF)',7,'degF',35),(1157,'2023-04-26 17:07:49','nozzle_position_x(mm)',105,'mm',36),(1158,'2023-04-26 17:07:49','nozzle_position_y(mm)',46,'mm',37),(1159,'2023-04-26 17:07:49','motor_ammeter(amps)',39,'amps',38),(1160,'2023-04-26 17:07:49','motor_tachometer(deg)',109,'deg',39),(1161,'2023-04-26 17:07:49','motor_thermometer(degF)',30,'degF',40),(1162,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',96,'mm/s2',41),(1163,'2023-04-26 17:07:49','motor_ammeter(amps)',134,'amps',42),(1164,'2023-04-26 17:07:49','motor_tachometer(deg)',128,'deg',43),(1165,'2023-04-26 17:07:49','motor_thermometer(degF)',17,'degF',44),(1166,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',55,'mm/s2',45),(1167,'2023-04-26 17:07:49','motor_ammeter(amps)',45,'amps',46),(1168,'2023-04-26 17:07:49','motor_tachometer(deg)',0,'deg',47),(1169,'2023-04-26 17:07:49','motor_thermometer(degF)',67,'degF',48),(1170,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',119,'mm/s2',49),(1171,'2023-04-26 17:07:49','motor_ammeter(amps)',134,'amps',50),(1172,'2023-04-26 17:07:49','motor_tachometer(deg)',116,'deg',51),(1173,'2023-04-26 17:07:49','motor_thermometer(degF)',32,'degF',52),(1174,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',109,'mm/s2',53),(1175,'2023-04-26 17:07:49','chamber_thermometer(degF)',0,'degF',54),(1176,'2023-04-26 17:07:49','chamber_oxygen_level(percent)',112,'percent',55),(1177,'2023-04-26 17:07:49','chamber_vaccuum_level(percent)',67,'percent',56),(1178,'2023-04-26 17:07:49','bed_thermometer(degF)',135,'degF',29),(1179,'2023-04-26 17:07:49','bed_height_NW(mm)',48,'mm',30),(1180,'2023-04-26 17:07:49','bed_height_NE(mm)',76,'mm',31),(1181,'2023-04-26 17:07:49','bed_height_SW(mm)',73,'mm',32),(1182,'2023-04-26 17:07:49','bed_height_SE(mm)',51,'mm',33),(1183,'2023-04-26 17:07:49','bed_position_z(mm)',99,'mm',34),(1184,'2023-04-26 17:07:49','nozzle_thermometer(degF)',100,'degF',35),(1185,'2023-04-26 17:07:49','nozzle_position_x(mm)',19,'mm',36),(1186,'2023-04-26 17:07:49','nozzle_position_y(mm)',22,'mm',37),(1187,'2023-04-26 17:07:49','motor_ammeter(amps)',17,'amps',38),(1188,'2023-04-26 17:07:49','motor_tachometer(deg)',70,'deg',39),(1189,'2023-04-26 17:07:49','motor_thermometer(degF)',20,'degF',40),(1190,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',30,'mm/s2',41),(1191,'2023-04-26 17:07:49','motor_ammeter(amps)',103,'amps',42),(1192,'2023-04-26 17:07:49','motor_tachometer(deg)',135,'deg',43),(1193,'2023-04-26 17:07:49','motor_thermometer(degF)',17,'degF',44),(1194,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',83,'mm/s2',45),(1195,'2023-04-26 17:07:49','motor_ammeter(amps)',45,'amps',46),(1196,'2023-04-26 17:07:49','motor_tachometer(deg)',35,'deg',47),(1197,'2023-04-26 17:07:49','motor_thermometer(degF)',87,'degF',48),(1198,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',87,'mm/s2',49),(1199,'2023-04-26 17:07:49','motor_ammeter(amps)',48,'amps',50),(1200,'2023-04-26 17:07:49','motor_tachometer(deg)',119,'deg',51),(1201,'2023-04-26 17:07:49','motor_thermometer(degF)',13,'degF',52),(1202,'2023-04-26 17:07:49','motor_accelerometer(mm/s2)',58,'mm/s2',53),(1203,'2023-04-26 17:07:49','chamber_thermometer(degF)',38,'degF',54),(1204,'2023-04-26 17:07:49','chamber_oxygen_level(percent)',132,'percent',55),(1205,'2023-04-26 17:07:49','chamber_vaccuum_level(percent)',4,'percent',56),(1206,'2023-04-26 17:19:56','bed_thermometer(degF)',16,'degF',29),(1207,'2023-04-26 17:19:56','bed_height_NW(mm)',144,'mm',30),(1208,'2023-04-26 17:19:56','bed_height_NE(mm)',6,'mm',31),(1209,'2023-04-26 17:19:56','bed_height_SW(mm)',76,'mm',32),(1210,'2023-04-26 17:19:56','bed_height_SE(mm)',113,'mm',33),(1211,'2023-04-26 17:19:56','bed_position_z(mm)',60,'mm',34),(1212,'2023-04-26 17:19:56','nozzle_thermometer(degF)',134,'degF',35),(1213,'2023-04-26 17:19:56','nozzle_position_x(mm)',60,'mm',36),(1214,'2023-04-26 17:19:56','nozzle_position_y(mm)',49,'mm',37),(1215,'2023-04-26 17:19:56','motor_ammeter(amps)',107,'amps',38),(1216,'2023-04-26 17:19:56','motor_tachometer(deg)',74,'deg',39),(1217,'2023-04-26 17:19:56','motor_thermometer(degF)',20,'degF',40),(1218,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',145,'mm/s2',41),(1219,'2023-04-26 17:19:56','motor_ammeter(amps)',103,'amps',42),(1220,'2023-04-26 17:19:56','motor_tachometer(deg)',77,'deg',43),(1221,'2023-04-26 17:19:56','motor_thermometer(degF)',54,'degF',44),(1222,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',139,'mm/s2',45),(1223,'2023-04-26 17:19:56','motor_ammeter(amps)',91,'amps',46),(1224,'2023-04-26 17:19:56','motor_tachometer(deg)',89,'deg',47),(1225,'2023-04-26 17:19:56','motor_thermometer(degF)',125,'degF',48),(1226,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',100,'mm/s2',49),(1227,'2023-04-26 17:19:56','motor_ammeter(amps)',12,'amps',50),(1228,'2023-04-26 17:19:56','motor_tachometer(deg)',102,'deg',51),(1229,'2023-04-26 17:19:56','motor_thermometer(degF)',84,'degF',52),(1230,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',9,'mm/s2',53),(1231,'2023-04-26 17:19:56','chamber_thermometer(degF)',68,'degF',54),(1232,'2023-04-26 17:19:56','chamber_oxygen_level(percent)',132,'percent',55),(1233,'2023-04-26 17:19:56','chamber_vaccuum_level(percent)',94,'percent',56),(1234,'2023-04-26 17:19:56','bed_thermometer(degF)',36,'degF',29),(1235,'2023-04-26 17:19:56','bed_height_NW(mm)',13,'mm',30),(1236,'2023-04-26 17:19:56','bed_height_NE(mm)',81,'mm',31),(1237,'2023-04-26 17:19:56','bed_height_SW(mm)',52,'mm',32),(1238,'2023-04-26 17:19:56','bed_height_SE(mm)',61,'mm',33),(1239,'2023-04-26 17:19:56','bed_position_z(mm)',118,'mm',34),(1240,'2023-04-26 17:19:56','nozzle_thermometer(degF)',13,'degF',35),(1241,'2023-04-26 17:19:56','nozzle_position_x(mm)',139,'mm',36),(1242,'2023-04-26 17:19:56','nozzle_position_y(mm)',23,'mm',37),(1243,'2023-04-26 17:19:56','motor_ammeter(amps)',100,'amps',38),(1244,'2023-04-26 17:19:56','motor_tachometer(deg)',67,'deg',39),(1245,'2023-04-26 17:19:56','motor_thermometer(degF)',73,'degF',40),(1246,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',90,'mm/s2',41),(1247,'2023-04-26 17:19:56','motor_ammeter(amps)',135,'amps',42),(1248,'2023-04-26 17:19:56','motor_tachometer(deg)',6,'deg',43),(1249,'2023-04-26 17:19:56','motor_thermometer(degF)',113,'degF',44),(1250,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',112,'mm/s2',45),(1251,'2023-04-26 17:19:56','motor_ammeter(amps)',41,'amps',46),(1252,'2023-04-26 17:19:56','motor_tachometer(deg)',96,'deg',47),(1253,'2023-04-26 17:19:56','motor_thermometer(degF)',125,'degF',48),(1254,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',30,'mm/s2',49),(1255,'2023-04-26 17:19:56','motor_ammeter(amps)',52,'amps',50),(1256,'2023-04-26 17:19:56','motor_tachometer(deg)',67,'deg',51),(1257,'2023-04-26 17:19:56','motor_thermometer(degF)',105,'degF',52),(1258,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',0,'mm/s2',53),(1259,'2023-04-26 17:19:56','chamber_thermometer(degF)',105,'degF',54),(1260,'2023-04-26 17:19:56','chamber_oxygen_level(percent)',28,'percent',55),(1261,'2023-04-26 17:19:56','chamber_vaccuum_level(percent)',76,'percent',56),(1262,'2023-04-26 17:19:56','bed_thermometer(degF)',119,'degF',29),(1263,'2023-04-26 17:19:56','bed_height_NW(mm)',22,'mm',30),(1264,'2023-04-26 17:19:56','bed_height_NE(mm)',80,'mm',31),(1265,'2023-04-26 17:19:56','bed_height_SW(mm)',54,'mm',32),(1266,'2023-04-26 17:19:56','bed_height_SE(mm)',44,'mm',33),(1267,'2023-04-26 17:19:56','bed_position_z(mm)',28,'mm',34),(1268,'2023-04-26 17:19:56','nozzle_thermometer(degF)',58,'degF',35),(1269,'2023-04-26 17:19:56','nozzle_position_x(mm)',73,'mm',36),(1270,'2023-04-26 17:19:56','nozzle_position_y(mm)',81,'mm',37),(1271,'2023-04-26 17:19:56','motor_ammeter(amps)',36,'amps',38),(1272,'2023-04-26 17:19:56','motor_tachometer(deg)',64,'deg',39),(1273,'2023-04-26 17:19:56','motor_thermometer(degF)',113,'degF',40),(1274,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',126,'mm/s2',41),(1275,'2023-04-26 17:19:56','motor_ammeter(amps)',89,'amps',42),(1276,'2023-04-26 17:19:56','motor_tachometer(deg)',39,'deg',43),(1277,'2023-04-26 17:19:56','motor_thermometer(degF)',112,'degF',44),(1278,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',89,'mm/s2',45),(1279,'2023-04-26 17:19:56','motor_ammeter(amps)',15,'amps',46),(1280,'2023-04-26 17:19:56','motor_tachometer(deg)',126,'deg',47),(1281,'2023-04-26 17:19:56','motor_thermometer(degF)',81,'degF',48),(1282,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',51,'mm/s2',49),(1283,'2023-04-26 17:19:56','motor_ammeter(amps)',16,'amps',50),(1284,'2023-04-26 17:19:56','motor_tachometer(deg)',26,'deg',51),(1285,'2023-04-26 17:19:56','motor_thermometer(degF)',70,'degF',52),(1286,'2023-04-26 17:19:56','motor_accelerometer(mm/s2)',54,'mm/s2',53),(1287,'2023-04-26 17:19:56','chamber_thermometer(degF)',29,'degF',54),(1288,'2023-04-26 17:19:56','chamber_oxygen_level(percent)',132,'percent',55),(1289,'2023-04-26 17:19:56','chamber_vaccuum_level(percent)',106,'percent',56);
/*!40000 ALTER TABLE `Sensor_Data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit`
--

DROP TABLE IF EXISTS `Unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Unit` (
  `unit_name` varchar(8) NOT NULL,
  `unit_group` varchar(45) DEFAULT NULL,
  `is_main` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`unit_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit`
--

LOCK TABLES `Unit` WRITE;
/*!40000 ALTER TABLE `Unit` DISABLE KEYS */;
INSERT INTO `Unit` VALUES ('amps','Current',1),('atm','Pressure',0),('cm','Length',0),('cm3','Volume',1),('deg','Radial',1),('degC','Temperature',0),('degF','Temperature',1),('degpers','Rotation',0),('ft','Length',0),('g','Mass',1),('hp','Power',0),('in','Length',0),('in/s','Velocity',0),('in3','Volume',0),('kg','Mass',0),('L','Volume',0),('lb','Force',0),('lb_ft','Torque',0),('lb_in','Torque',0),('m','Length',0),('m3','Volume',0),('mL','Volume',0),('mm','Length',1),('mm/s','Velocity',1),('mm/s2','Acceleration',1),('mm3','Volume',0),('mmHg','Pressure',0),('N','Force',1),('Nm','Torque',1),('Nmm','Torque',0),('oz','Mass',0),('Pa','Pressure',1),('percent','Proportion',1),('radians','Radial',0),('radpers','Rotation',0),('rpm','Rotation',1),('s','Time',1),('string','Category',1),('volts','Voltage',1),('watt','Power',1);
/*!40000 ALTER TABLE `Unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `vendor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`vendor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'Precision Control Inc.'),(2,'Datatronics'),(3,'Blue Ridge Printers'),(4,'Stratasys'),(5,'Ace Hardware');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02 10:55:37
