CREATE DATABASE  IF NOT EXISTS `adventurecollections` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `adventurecollections`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: adventurecollections
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `animations`
--

DROP TABLE IF EXISTS `animations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animations` (
  `animation_id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `scene_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `animation` text NOT NULL,
  UNIQUE KEY `animation_id_UNIQUE` (`animation_id`),
  KEY `character_id_idx` (`character_id`),
  KEY `scene_id_idx` (`scene_id`),
  CONSTRAINT `character_animations` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scene_animations` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animations`
--

LOCK TABLES `animations` WRITE;
/*!40000 ALTER TABLE `animations` DISABLE KEYS */;
/*!40000 ALTER TABLE `animations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(120) NOT NULL,
  `book_description` text NOT NULL,
  `current_scene` int(11) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  KEY `current_scene_idx` (`current_scene`),
  CONSTRAINT `current_scene` FOREIGN KEY (`current_scene`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Emil And The Detectives','Emil And The Detectives is a children\'s novel, published on 1929 and was written by Erich Kastner. It tells the story of a young boy named Emil who was on his way to Berlin, to deliver the money that his mother has given him to his grandmother. Unfortunately, it was stolen by a man whom he met on his trip. Join Emil, as he solves the crime together with his friends.',1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camera` (
  `camera_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  PRIMARY KEY (`camera_position_id`),
  UNIQUE KEY `camera_position_id_UNIQUE` (`camera_position_id`),
  KEY `scene_id_idx` (`scene_id`),
  CONSTRAINT `scene_camera` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_dialogues`
--

DROP TABLE IF EXISTS `character_dialogues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_dialogues` (
  `dialogue_id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `scene_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `dialogue_text` text NOT NULL,
  `dialogue_audio` text,
  PRIMARY KEY (`dialogue_id`),
  UNIQUE KEY `dialogue_id_UNIQUE` (`dialogue_id`),
  KEY `character_id_idx` (`character_id`),
  KEY `scene_id_idx` (`scene_id`),
  CONSTRAINT `character_dialogues` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scene_dialogues` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_dialogues`
--

LOCK TABLES `character_dialogues` WRITE;
/*!40000 ALTER TABLE `character_dialogues` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_dialogues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_positions`
--

DROP TABLE IF EXISTS `character_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_positions` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `scene_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  UNIQUE KEY `position_id_UNIQUE` (`position_id`),
  KEY `character_id_idx` (`character_id`),
  KEY `scene_id_idx` (`scene_id`),
  CONSTRAINT `characters_position` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scene_position` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_positions`
--

LOCK TABLES `character_positions` WRITE;
/*!40000 ALTER TABLE `character_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dialogue_box` text,
  `character_object` text NOT NULL,
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `character_id_UNIQUE` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text NOT NULL,
  `item_image` text NOT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `inventory_id_UNIQUE` (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene_type`
--

DROP TABLE IF EXISTS `scene_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scene_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene_type`
--

LOCK TABLES `scene_type` WRITE;
/*!40000 ALTER TABLE `scene_type` DISABLE KEYS */;
INSERT INTO `scene_type` VALUES (1,'Dialogues'),(2,'Interactions');
/*!40000 ALTER TABLE `scene_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenes`
--

DROP TABLE IF EXISTS `scenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenes` (
  `scene_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `chapter_number` int(11) NOT NULL,
  `scene_number` int(11) NOT NULL,
  `flow_number` int(11) NOT NULL,
  `setting_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`scene_id`),
  UNIQUE KEY `scene_id_UNIQUE` (`scene_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `settings_id_idx` (`setting_id`),
  KEY `type_id_idx` (`type_id`),
  CONSTRAINT `book_scenes` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scene_settings` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`setting_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scene_types` FOREIGN KEY (`type_id`) REFERENCES `scene_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenes`
--

LOCK TABLES `scenes` WRITE;
/*!40000 ALTER TABLE `scenes` DISABLE KEYS */;
INSERT INTO `scenes` VALUES (1,1,1,1,1,2,1),(2,1,1,1,2,2,2),(3,1,1,1,3,2,1),(4,1,1,1,4,2,2),(5,1,1,2,1,1,1),(6,1,1,2,2,1,2),(7,1,1,2,3,1,1),(8,1,1,2,4,1,2),(9,1,1,2,5,1,1);
/*!40000 ALTER TABLE `scenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Emil\'s Room','C:\\AdventureCollections\\Settings\\EmilsRoom'),(2,'Kitchen','C:\\AdventureCollections\\Settings\\Kitchen');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-15 14:25:10
