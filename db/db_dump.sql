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
-- Current Database: `class_scratchpaper`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `class_scratchpaper` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `class_scratchpaper`;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `Title` varchar(100) NOT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Publish_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES ('Harry Potter','JK Rowling',500,'2023-03-01'),('Harry Potter','JK Rowling',500,'2023-03-01');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 15:15:27
