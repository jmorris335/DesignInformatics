<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
=======
<<<<<<< HEAD
=======
-- MySQL dump 10.13  Distrib 5.7.34, for osx11.0 (x86_64)
>>>>>>> 00e6ba74f06b01e2a2255ab45e24020e998fa81f
--
-- Host: localhost    Database: Mocko_Ex
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` int(11) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Revision` int(11) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,111111,'Time',1),(2,222222,'Thermo',1),(3,3333,'5th test of Windows Reload',3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseRubric` varchar(4) NOT NULL,
  `CourseNumber` int(10) NOT NULL,
  `CourseName` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'ME',8930,'Design Informatics'),(2,'ME',8180,'FEA'),(3,'ME',8720,'Optimization'),(4,'ME',8000,'Seminar');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_uses_book`
--

DROP TABLE IF EXISTS `course_uses_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_uses_book` (
  `Book_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_uses_book`
--

LOCK TABLES `course_uses_book` WRITE;
/*!40000 ALTER TABLE `course_uses_book` DISABLE KEYS */;
INSERT INTO `course_uses_book` VALUES (1,1),(1,3),(2,2),(2,4),(3,1);
/*!40000 ALTER TABLE `course_uses_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Greg','Mocko'),(2,'Hannah','Mocko'),(3,'Barbara','Mocko'),(4,'Erin','Utermarck'),(5,'William','Brown'),(6,'Heather','Brown'),(7,'Jeremy','Mac'),(8,'Chris','Brown');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_takes_course`
--

DROP TABLE IF EXISTS `person_takes_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_takes_course` (
  `P_C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_ID` int(11) NOT NULL COMMENT 'key to person',
  `C_ID` int(11) NOT NULL COMMENT 'key to course',
  PRIMARY KEY (`P_C_ID`),
  KEY `P_ID` (`P_ID`,`C_ID`),
  KEY `Course` (`C_ID`),
  CONSTRAINT `Course` FOREIGN KEY (`C_ID`) REFERENCES `course` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Person` FOREIGN KEY (`P_ID`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_takes_course`
--

LOCK TABLES `person_takes_course` WRITE;
/*!40000 ALTER TABLE `person_takes_course` DISABLE KEYS */;
INSERT INTO `person_takes_course` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,4),(5,4,1),(6,6,1);
/*!40000 ALTER TABLE `person_takes_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `3DPrinterDT`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `3DPrinterDT` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `3DPrinterDT`;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Rhyan','Morgan','2014-03-27 00:00:00',NULL),(2,'Will','Hawthorne','2014-09-10 00:00:00',NULL),(3,'John','Morris','2019-03-04 00:00:00',NULL),(4,'Greg','Mocko','2019-03-31 00:00:00',NULL),(5,'Kherissa','Taylor','2018-02-18 00:00:00',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_role`
--

DROP TABLE IF EXISTS `employee_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_has_role` (
  `employe_ID` int(11) NOT NULL,
  `role_ID` int(11) NOT NULL,
  PRIMARY KEY (`employe_ID`,`role_ID`),
  KEY `fk_Employees_has_Role_Role1_idx` (`role_ID`),
  KEY `fk_Employees_has_Role_Employees1_idx` (`employe_ID`),
  CONSTRAINT `fk_Employees_has_Role_Employees1` FOREIGN KEY (`employe_ID`) REFERENCES `employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_has_Role_Role1` FOREIGN KEY (`role_ID`) REFERENCES `role` (`role_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_role`
--

LOCK TABLES `employee_has_role` WRITE;
/*!40000 ALTER TABLE `employee_has_role` DISABLE KEYS */;
INSERT INTO `employee_has_role` VALUES (1,1),(5,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `employee_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_parameter`
--

DROP TABLE IF EXISTS `job_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_parameter` (
  `jobparam_ID` int(11) NOT NULL AUTO_INCREMENT,
  `jobparam_Name` varchar(45) DEFAULT NULL,
  `value` decimal(5,0) DEFAULT NULL,
  `unit` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`jobparam_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_parameter`
--

LOCK TABLES `job_parameter` WRITE;
/*!40000 ALTER TABLE `job_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_log` (
  `mlog_ID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_ID` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `notes` blob,
  PRIMARY KEY (`mlog_ID`),
  KEY `fk_Maintenance_Log_Employees1_idx` (`employee_ID`),
  CONSTRAINT `fk_Maintenance_Log_Employees1` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_log`
--

LOCK TABLES `maintenance_log` WRITE;
/*!40000 ALTER TABLE `maintenance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `mat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `melt_temp` decimal(4,0) DEFAULT NULL,
  `mat_name` varchar(45) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`mat_ID`),
  KEY `fk_Material_Vendor1_idx` (`vendor_ID`),
  CONSTRAINT `fk_Material_Vendor1` FOREIGN KEY (`vendor_ID`) REFERENCES `vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,126,'Nylon 12 Carbon Fiber','Black',4),(2,130,'ULTEM™ 1010 resin','Amber',4),(3,119,'ABS-M30','White',4),(4,126,'ABS-M30','Blue',4),(5,126,'ABS-M30','Grey',4),(6,126,'Polycarbonate','Clear',4);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_loaded_in_printer`
--

DROP TABLE IF EXISTS `material_loaded_in_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_loaded_in_printer` (
  `printer_ID` int(11) NOT NULL,
  `mat_ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `volume` decimal(7,0) NOT NULL,
  PRIMARY KEY (`printer_ID`,`mat_ID`,`timestamp`),
  KEY `fk_Printer_has_Material_Material2_idx` (`mat_ID`),
  KEY `fk_Printer_has_Material_Printer2_idx` (`printer_ID`),
  CONSTRAINT `fk_Printer_has_Material_Material2` FOREIGN KEY (`mat_ID`) REFERENCES `material` (`mat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Printer2` FOREIGN KEY (`printer_ID`) REFERENCES `printer` (`printer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_loaded_in_printer`
--

LOCK TABLES `material_loaded_in_printer` WRITE;
/*!40000 ALTER TABLE `material_loaded_in_printer` DISABLE KEYS */;
INSERT INTO `material_loaded_in_printer` VALUES (1,2,'2023-03-23 00:00:00',1000),(1,6,'2023-03-23 00:00:00',1500),(2,1,'2023-03-23 00:00:00',1000),(2,2,'2023-03-23 00:00:00',1000),(2,4,'2023-03-23 00:00:00',1000);
/*!40000 ALTER TABLE `material_loaded_in_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter` (
  `param_ID` int(11) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(60) NOT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `unit` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`param_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES (1,'width',615,'mm'),(2,'length',615,'mm'),(3,'thickness',10,'mm'),(4,'width',0,'mm'),(5,'shaft_diameter',6,'mm'),(6,'step_angle',2,'deg'),(7,'holding_torque',470,'g'),(8,'weight',6,'mm'),(9,'shaft_diameter',6,'mm'),(10,'step_angle',2,'deg'),(11,'holding_torque',470,'g'),(12,'weight',6,'mm'),(13,'shaft_diameter',6,'mm'),(14,'step_angle',2,'deg'),(15,'holding_torque',470,'g'),(16,'weight',6,'mm'),(17,'shaft_diameter',6,'mm'),(18,'step_angle',2,'deg'),(19,'holding_torque',470,'g'),(20,'weight',6,'mm'),(21,'volume',302580,'cm3'),(22,'width',615,'mm'),(23,'length',615,'mm'),(24,'thickness',10,'mm'),(25,'width',0,'mm'),(26,'shaft_diameter',6,'mm'),(27,'step_angle',2,'deg'),(28,'holding_torque',470,'g'),(29,'weight',6,'mm'),(30,'shaft_diameter',6,'mm'),(31,'step_angle',2,'deg'),(32,'holding_torque',470,'g'),(33,'weight',6,'mm'),(34,'shaft_diameter',6,'mm'),(35,'step_angle',2,'deg'),(36,'holding_torque',470,'g'),(37,'weight',6,'mm'),(38,'shaft_diameter',6,'mm'),(39,'step_angle',2,'deg'),(40,'holding_torque',470,'g'),(41,'weight',6,'mm'),(42,'volume',302580,'cm3');
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `part_ID` int(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(60) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  `printer_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`part_ID`),
  KEY `fk_Part_Vendor_idx` (`vendor_ID`),
  KEY `fk_Part_Printer1_idx` (`printer_ID`),
  CONSTRAINT `fk_Part_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `printer` (`printer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Vendor` FOREIGN KEY (`vendor_ID`) REFERENCES `vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'bed',3,1),(2,'nozzle',4,1),(3,'x_motor',1,1),(4,'y_motor',1,1),(5,'bed_motor',1,1),(6,'feed_motor',1,1),(7,'chamber',4,1),(8,'bed',2,2),(9,'nozzle',2,2),(10,'x_motor',1,2),(11,'y_motor',1,2),(12,'bed_motor',1,2),(13,'feed_motor',1,2),(14,'chamber',5,2);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_has_maintenance_log`
--

DROP TABLE IF EXISTS `part_has_maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_has_maintenance_log` (
  `part_ID` int(11) NOT NULL,
  `mlog_ID` int(11) NOT NULL,
  PRIMARY KEY (`part_ID`,`mlog_ID`),
  KEY `fk_Part_has_Maintenance_Log_Maintenance_Log1_idx` (`mlog_ID`),
  KEY `fk_Part_has_Maintenance_Log_Part1_idx` (`part_ID`),
  CONSTRAINT `fk_Part_has_Maintenance_Log_Maintenance_Log1` FOREIGN KEY (`mlog_ID`) REFERENCES `maintenance_log` (`mlog_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_has_Maintenance_Log_Part1` FOREIGN KEY (`part_ID`) REFERENCES `part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_has_maintenance_log`
--

LOCK TABLES `part_has_maintenance_log` WRITE;
/*!40000 ALTER TABLE `part_has_maintenance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_has_maintenance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_parameters`
--

DROP TABLE IF EXISTS `part_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_parameters` (
  `param_ID` int(11) NOT NULL,
  `part_ID` int(11) NOT NULL,
  PRIMARY KEY (`param_ID`,`part_ID`),
  KEY `fk_Part_Parameters_has_Part_Part1_idx` (`part_ID`),
  KEY `fk_Part_Parameters_has_Part_Part_Parameters1_idx` (`param_ID`),
  CONSTRAINT `fk_Part_Parameters_has_Part_Part1` FOREIGN KEY (`part_ID`) REFERENCES `part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Part_Parameters_has_Part_Part_Parameters1` FOREIGN KEY (`param_ID`) REFERENCES `parameter` (`param_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_parameters`
--

LOCK TABLES `part_parameters` WRITE;
/*!40000 ALTER TABLE `part_parameters` DISABLE KEYS */;
INSERT INTO `part_parameters` VALUES (1,1),(2,1),(3,1),(4,2),(5,3),(6,3),(7,3),(8,3),(9,4),(10,4),(11,4),(12,4),(13,5),(14,5),(15,5),(16,5),(17,6),(18,6),(19,6),(20,6),(21,7),(22,8),(23,8),(24,8),(25,9),(26,10),(27,10),(28,10),(29,10),(30,11),(31,11),(32,11),(33,11),(34,12),(35,12),(36,12),(37,12),(38,13),(39,13),(40,13),(41,13),(42,14);
/*!40000 ALTER TABLE `part_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_job`
--

DROP TABLE IF EXISTS `print_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_job` (
  `job_ID` int(11) NOT NULL AUTO_INCREMENT,
  `model` blob,
  `code` blob,
  `designer_ID` int(11) NOT NULL,
  `printer_ID` int(11) NOT NULL,
  `job_succeeded` tinyint(4) DEFAULT NULL,
  `material_used` decimal(2,0) DEFAULT NULL,
  `job_duration` time DEFAULT NULL,
  `curator_ID` int(11) NOT NULL,
  `preparer_ID` int(11) NOT NULL,
  PRIMARY KEY (`job_ID`),
  KEY `fk_Print_Job_Employees1_idx` (`designer_ID`),
  KEY `fk_Print_Job_Printer1_idx` (`printer_ID`),
  KEY `fk_Print_Job_Employees2_idx` (`curator_ID`),
  KEY `fk_Print_Job_Employees3_idx` (`preparer_ID`),
  CONSTRAINT `fk_Print_Job_Employees1` FOREIGN KEY (`designer_ID`) REFERENCES `employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees2` FOREIGN KEY (`curator_ID`) REFERENCES `employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Employees3` FOREIGN KEY (`preparer_ID`) REFERENCES `employee` (`employee_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `printer` (`printer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_job`
--

LOCK TABLES `print_job` WRITE;
/*!40000 ALTER TABLE `print_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `print_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `print_job_has_job_parameter`
--

DROP TABLE IF EXISTS `print_job_has_job_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_job_has_job_parameter` (
  `job_ID` int(11) NOT NULL,
  `jobparam_ID` int(11) NOT NULL,
  PRIMARY KEY (`job_ID`,`jobparam_ID`),
  KEY `fk_Print_Job_has_Job_Parameter_Job_Parameter1_idx` (`jobparam_ID`),
  KEY `fk_Print_Job_has_Job_Parameter_Print_Job1_idx` (`job_ID`),
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Job_Parameter1` FOREIGN KEY (`jobparam_ID`) REFERENCES `job_parameter` (`jobparam_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Print_Job_has_Job_Parameter_Print_Job1` FOREIGN KEY (`job_ID`) REFERENCES `print_job` (`job_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `print_job_has_job_parameter`
--

LOCK TABLES `print_job_has_job_parameter` WRITE;
/*!40000 ALTER TABLE `print_job_has_job_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `print_job_has_job_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer` (
  `printer_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) DEFAULT NULL,
  `IPv6` varchar(25) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `vendor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`printer_id`),
  KEY `fk_Printer_Vendor1_idx` (`vendor_ID`),
  CONSTRAINT `fk_Printer_Vendor1` FOREIGN KEY (`vendor_ID`) REFERENCES `vendor` (`vendor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer`
--

LOCK TABLES `printer` WRITE;
/*!40000 ALTER TABLE `printer` DISABLE KEYS */;
INSERT INTO `printer` VALUES (1,'Main floor','2001:db8::8a2e:370:7334','F123 Composite Ready',4),(2,'Main floor','2001:de8::8a2e:370:7334','F770 Industrial 3D Printer',4);
/*!40000 ALTER TABLE `printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_can_print_material`
--

DROP TABLE IF EXISTS `printer_can_print_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_can_print_material` (
  `printer_ID` int(11) NOT NULL,
  `mat_ID` int(11) NOT NULL,
  PRIMARY KEY (`printer_ID`,`mat_ID`),
  KEY `fk_Printer_has_Material_Material1_idx` (`mat_ID`),
  KEY `fk_Printer_has_Material_Printer1_idx` (`printer_ID`),
  CONSTRAINT `fk_Printer_has_Material_Material1` FOREIGN KEY (`mat_ID`) REFERENCES `material` (`mat_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Printer_has_Material_Printer1` FOREIGN KEY (`printer_ID`) REFERENCES `printer` (`printer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_can_print_material`
--

LOCK TABLES `printer_can_print_material` WRITE;
/*!40000 ALTER TABLE `printer_can_print_material` DISABLE KEYS */;
INSERT INTO `printer_can_print_material` VALUES (2,1),(1,2),(2,2),(2,4),(1,6);
/*!40000 ALTER TABLE `printer_can_print_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_state`
--

DROP TABLE IF EXISTS `printer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_state` (
  `printer_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `is_connected` tinyint(4) DEFAULT '1',
  `is_busy` tinyint(4) DEFAULT '0',
  `is_available` tinyint(4) DEFAULT '1',
  `needs_service` tinyint(4) DEFAULT '0',
  `has_error` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`printer_id`,`timestamp`),
  KEY `fk_Network_State_Printer1_idx` (`printer_id`),
  CONSTRAINT `fk_Network_State_Printer1` FOREIGN KEY (`printer_id`) REFERENCES `printer` (`printer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_state`
--

LOCK TABLES `printer_state` WRITE;
/*!40000 ALTER TABLE `printer_state` DISABLE KEYS */;
INSERT INTO `printer_state` VALUES (1,'2023-03-23 00:00:00',1,0,1,0,0),(2,'2023-03-23 00:00:00',1,0,1,0,0);
/*!40000 ALTER TABLE `printer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_ID` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Designer'),(2,'Manager'),(3,'Technician'),(4,'Operator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor` (
  `sensor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_name` varchar(45) NOT NULL,
  `part_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`sensor_ID`),
  KEY `fk_Sensor_Part1_idx` (`part_ID`),
  CONSTRAINT `fk_Sensor_Part1` FOREIGN KEY (`part_ID`) REFERENCES `part` (`part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'bed_thermometer',1),(2,'bed_height_NW',1),(3,'bed_height_NE',1),(4,'bed_height_SW',1),(5,'bed_height_SE',1),(6,'bed_position_z',1),(7,'nozzle_thermometer',2),(8,'nozzle_position_x',2),(9,'nozzle_position_y',2),(10,'motor_ammeter',3),(11,'motor_tachometer',3),(12,'motor_thermometer',3),(13,'motor_accelerometer',3),(14,'motor_ammeter',4),(15,'motor_tachometer',4),(16,'motor_thermometer',4),(17,'motor_accelerometer',4),(18,'motor_ammeter',5),(19,'motor_tachometer',5),(20,'motor_thermometer',5),(21,'motor_accelerometer',5),(22,'motor_ammeter',6),(23,'motor_tachometer',6),(24,'motor_thermometer',6),(25,'motor_accelerometer',6),(26,'chamber_thermometer',7),(27,'chamber_oxygen_level',7),(28,'chamber_vaccuum_level',7),(29,'bed_thermometer',8),(30,'bed_height_NW',8),(31,'bed_height_NE',8),(32,'bed_height_SW',8),(33,'bed_height_SE',8),(34,'bed_position_z',8),(35,'nozzle_thermometer',9),(36,'nozzle_position_x',9),(37,'nozzle_position_y',9),(38,'motor_ammeter',10),(39,'motor_tachometer',10),(40,'motor_thermometer',10),(41,'motor_accelerometer',10),(42,'motor_ammeter',11),(43,'motor_tachometer',11),(44,'motor_thermometer',11),(45,'motor_accelerometer',11),(46,'motor_ammeter',12),(47,'motor_tachometer',12),(48,'motor_thermometer',12),(49,'motor_accelerometer',12),(50,'motor_ammeter',13),(51,'motor_tachometer',13),(52,'motor_thermometer',13),(53,'motor_accelerometer',13),(54,'chamber_thermometer',14),(55,'chamber_oxygen_level',14),(56,'chamber_vaccuum_level',14);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_data`
--

DROP TABLE IF EXISTS `sensor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_data` (
  `data_ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `data_name` varchar(45) DEFAULT NULL,
  `value` decimal(10,0) NOT NULL,
  `unit` varchar(8) DEFAULT NULL,
  `sensor_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`data_ID`),
  KEY `fk_Sensor_Data_Sensor1_idx` (`sensor_ID`),
  CONSTRAINT `fk_Sensor_Data_Sensor1` FOREIGN KEY (`sensor_ID`) REFERENCES `sensor` (`sensor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_data`
--

LOCK TABLES `sensor_data` WRITE;
/*!40000 ALTER TABLE `sensor_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensor_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`vendor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Precision Control Inc.'),(2,'Datatronics'),(3,'Blue Ridge Printers'),(4,'Stratasys'),(5,'Ace Hardware');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

<<<<<<< HEAD
-- Dump completed on 2023-03-29 13:09:25
=======
-- Dump completed on 2023-03-27 14:28:43
>>>>>>> 85702ce1329de44562eda45fa457a402c4971df5
>>>>>>> 00e6ba74f06b01e2a2255ab45e24020e998fa81f
