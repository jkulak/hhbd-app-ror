-- MySQL dump 10.11
--
-- Host: localhost    Database: hhbd
-- ------------------------------------------------------
-- Server version	5.0.51b-log

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_polish_ci default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `special` tinyint(1) default NULL,
  `price` decimal(10,0) default NULL,
  `artist_id` int(11) default NULL,
  `release_date` date default NULL,
  `description` text collate utf8_polish_ci,
  `label_id` int(11) default NULL,
  `image_file_name` varchar(255) collate utf8_polish_ci default NULL,
  `image_content_type` varchar(255) collate utf8_polish_ci default NULL,
  `image_file_size` int(11) default NULL,
  `image_updated_at` datetime default NULL,
  `catalog_number` varchar(255) collate utf8_polish_ci default NULL,
  `to_be_released` varchar(255) collate utf8_polish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_polish_ci default NULL,
  `realname` varchar(255) collate utf8_polish_ci default NULL,
  `website` varchar(255) collate utf8_polish_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `description` text collate utf8_polish_ci,
  `image_file_name` varchar(255) collate utf8_polish_ci default NULL,
  `image_content_type` varchar(255) collate utf8_polish_ci default NULL,
  `image_file_size` int(11) default NULL,
  `image_updated_at` datetime default NULL,
  `concert_info` varchar(255) collate utf8_polish_ci default NULL,
  `since` date default NULL,
  `till` date default NULL,
  `special` int(11) default NULL,
  `trivia` varchar(255) collate utf8_polish_ci default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `viewed` int(11) default NULL,
  `status` int(11) default NULL,
  `old_id` int(11) default NULL,
  `image_source` varchar(255) collate utf8_polish_ci default NULL,
  `image_source_url` varchar(255) collate utf8_polish_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Dupek','','','2009-06-17 16:11:46','2009-06-17 16:11:46','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Pope','sdfsdf','fsdf','2009-06-17 17:42:21','2009-06-17 17:42:21','sfdsf','hhbd20-logo4.gif','image/gif',611,'2009-06-17 17:42:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Pope','sdfsdf','fsdf','2009-06-17 17:42:25','2009-06-17 17:42:25','sfdsf','hhbd20-logo4.gif','image/gif',611,'2009-06-17 17:42:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band_memberships`
--

DROP TABLE IF EXISTS `band_memberships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `band_memberships` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `band_id` int(11) default NULL,
  `joined` date default NULL,
  `left` date default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `status` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `band_memberships`
--

LOCK TABLES `band_memberships` WRITE;
/*!40000 ALTER TABLE `band_memberships` DISABLE KEYS */;
/*!40000 ALTER TABLE `band_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_polish_ci default NULL,
  `website` varchar(255) collate utf8_polish_ci default NULL,
  `email` varchar(255) collate utf8_polish_ci default NULL,
  `addres` varchar(255) collate utf8_polish_ci default NULL,
  `viewed` int(11) default NULL,
  `description` text collate utf8_polish_ci,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `image_file_name` varchar(255) collate utf8_polish_ci default NULL,
  `image_content_type` varchar(255) collate utf8_polish_ci default NULL,
  `image_file_size` int(11) default NULL,
  `image_updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_polish_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20090605234416'),('20090605235003'),('20090605235502'),('20090606143438'),('20090607111342'),('20090607122614'),('20090607162853'),('20090607171029'),('20090607183247'),('20090607185447'),('20090608224229'),('20090608225831'),('20090608231625'),('20090608232010'),('20090608232651'),('20090609020321'),('20090609120356'),('20090609120601'),('20090609120723'),('20090609121915'),('20090609121939'),('20090609121945'),('20090609212350'),('20090609235203'),('20090609235847'),('20090612084300'),('20090612215310'),('20090615234736'),('20090616001818'),('20090616164547'),('20090616181247'),('20090617003859');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `songs` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_polish_ci default NULL,
  `length` int(11) default NULL,
  `created_by` int(11) default NULL,
  `updated_by` int(11) default NULL,
  `description` text collate utf8_polish_ci,
  `viewed` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `acapella` tinyint(1) default NULL,
  `radio_edit` tinyint(1) default NULL,
  `instrumental` tinyint(1) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_appearances`
--

DROP TABLE IF EXISTS `track_appearances`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `track_appearances` (
  `id` int(11) NOT NULL auto_increment,
  `album_id` int(11) default NULL,
  `song_id` int(11) default NULL,
  `as_number` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `track_appearances`
--

LOCK TABLES `track_appearances` WRITE;
/*!40000 ALTER TABLE `track_appearances` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_appearances` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-06-17 17:59:10
