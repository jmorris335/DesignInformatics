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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Job`
--

LOCK TABLES `Print_Job` WRITE;
/*!40000 ALTER TABLE `Print_Job` DISABLE KEYS */;
INSERT INTO `Print_Job` VALUES (1,_binary 'Jig (Kherissa).stl',_binary 'Jig (Kherissa).gcode',3,3,1,2,6,0,0,101,'2023-01-03 13:23:45','2023-01-03 13:54:40','2023-01-03 13:25:45','Print succeeded'),(2,_binary 'AWWT1991 v0.3.stl',_binary 'AWWT1991 v0.3.gcode',2,2,4,1,5,0,0,156,'2023-02-03 16:33:45','2023-02-04 10:36:35','2023-02-04 09:00:01','Print failed due to lack of support'),(3,_binary 'Insert (Kherissa).stl',_binary 'Insert (Kherissa).gcode',5,2,1,1,4,0,0,534,'2023-01-31 12:03:15','2023-01-31 19:29:52','2023-01-31 12:03:20','Print failed due to lack of support'),(4,_binary 'AWWT1848 v0.2 1_2.stl',_binary 'AWWT1848 v0.2 1_2.gcode',1,5,4,2,1,0,0,378,'2023-01-12 10:11:43','2023-01-12 12:40:12','2023-01-12 10:12:21','Print succeeded'),(5,_binary 'AWWT1848 v0.2 2_2.stl',_binary 'AWWT1848 v0.2 2_2.gcode',3,2,2,1,3,0,0,180,'2023-03-20 14:08:59','2023-03-23 13:09:18','2023-03-23 09:12:20','Print had some errors'),(6,_binary 'full test.stl',_binary 'full test.gcode',2,2,3,2,1,0,0,602,'2023-04-24 15:22:51','2023-04-24 16:28:31','2023-04-24 15:23:40','Print succeeded');
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
INSERT INTO `Printer_State` VALUES (1,'2023-04-25 00:00:00',1,0,1,0,0),(2,'2023-04-25 00:00:00',1,0,1,0,0);
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
  `data_ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `data_name` varchar(45) DEFAULT NULL,
  `value` decimal(10,0) NOT NULL,
  `unit` varchar(8) DEFAULT NULL,
  `sensor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`data_ID`),
  KEY `fk_Sensor_Data_Sensor1_idx` (`sensor_ID`),
  CONSTRAINT `fk_Sensor_Data_Sensor1` FOREIGN KEY (`sensor_ID`) REFERENCES `Sensor` (`sensor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor_Data`
--

LOCK TABLES `Sensor_Data` WRITE;
/*!40000 ALTER TABLE `Sensor_Data` DISABLE KEYS */;
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

-- Dump completed on 2023-04-24 22:12:02
