-- MySQL dump 10.13  Distrib 5.7.19, for Linux (i686)
--
-- Host: localhost    Database: mindanchor
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` longtext NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,1,'tag 标题','内容','2017-08-10 10:35:35'),(2,2,'第二位','内容2','2017-08-10 10:36:20'),(3,1,'第一位','内容3','2017-08-10 10:36:52'),(4,1,'junit','content','2017-08-10 10:41:01'),(5,1,'junit','content','2017-08-10 10:41:15'),(7,1,'网页','rt','2017-08-10 11:07:17'),(8,1,'','','2017-08-10 11:07:19'),(9,1,'新tag','rt','2017-08-10 11:19:01'),(10,1,'junit','content','2017-08-10 13:27:25'),(11,1,'junit','content','2017-08-10 13:28:06'),(12,5,'勇气','很多想法是因为没勇气才会诞生的，而当人累的时候，就更懦弱了。很多时候我会被没勇气的想法占据，这个标签在这时就能发挥出他的作用了。','2017-08-10 10:24:05'),(13,5,'同层','有一些想法，明明不应该处于那个重要的层次，但却霸占了那个珍贵的位子。','2017-08-10 10:55:22'),(14,5,'节点','有一些行为是比较重要的，会导致很不同的走向，决策这些的时候，也是需要标记的时候。','2017-08-10 10:56:26'),(15,5,'动画','如无意外，动画会伴随我直到死亡。','2017-08-10 11:44:16'),(16,5,'抑制','因为知道冲动的后果，从而做出更符合本虚无所想的选择。','2017-08-10 22:02:11'),(17,5,'计划','对短期内的计划。','2017-08-10 22:02:41'),(18,5,'gap','处在空挡，用娱乐等待某样东西','2017-08-11 01:36:16'),(19,5,'异常','世界向我提出了问题','2017-08-12 07:44:20'),(20,5,'世界线','有很多选择，可以深刻影响到未来，尽管我也不可能知道真相，但一个个不同的世界线确实在不同的选择中。\r\n选择什么？','2017-08-15 17:12:08');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagitem`
--

DROP TABLE IF EXISTS `tagitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `tagid_idx` (`tagid`),
  KEY `userid_idx` (`userid`),
  KEY `taskid_idx` (`taskid`),
  CONSTRAINT `tagid1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `taskid1` FOREIGN KEY (`taskid`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagitem`
--

LOCK TABLES `tagitem` WRITE;
/*!40000 ALTER TABLE `tagitem` DISABLE KEYS */;
INSERT INTO `tagitem` VALUES (1,1,11,52,'2017-08-10 15:00:32'),(2,1,10,52,'2017-08-10 15:00:32'),(3,5,14,54,'2017-08-10 10:57:53'),(4,5,15,56,'2017-08-10 11:45:49'),(5,5,16,57,'2017-08-10 22:04:41'),(6,5,17,58,'2017-08-10 22:06:54'),(7,5,17,59,'2017-08-11 00:13:33'),(8,5,17,60,'2017-08-11 00:59:29'),(9,5,12,60,'2017-08-11 00:59:29'),(10,5,18,61,'2017-08-11 01:37:44'),(11,5,18,62,'2017-08-11 04:12:39'),(12,5,15,62,'2017-08-11 04:12:39'),(13,5,17,63,'2017-08-11 04:47:09'),(14,5,17,64,'2017-08-11 08:29:29'),(15,5,12,64,'2017-08-11 08:29:29'),(16,5,17,65,'2017-08-11 09:28:10'),(17,5,16,65,'2017-08-11 09:28:10'),(18,5,12,66,'2017-08-11 10:53:23'),(19,5,17,67,'2017-08-11 22:16:19'),(20,5,13,67,'2017-08-11 22:16:19'),(21,5,17,68,'2017-08-12 00:17:33'),(22,5,16,68,'2017-08-12 00:17:33'),(23,5,13,68,'2017-08-12 00:17:33'),(24,5,18,69,'2017-08-12 01:26:18'),(25,5,16,69,'2017-08-12 01:26:18'),(26,5,13,69,'2017-08-12 01:26:18'),(27,5,16,70,'2017-08-12 05:06:30'),(28,5,12,70,'2017-08-12 05:06:30'),(29,5,16,71,'2017-08-12 07:36:31'),(30,5,19,72,'2017-08-12 07:44:40'),(31,5,19,73,'2017-08-12 08:11:01'),(32,5,17,73,'2017-08-12 08:11:01'),(33,5,12,73,'2017-08-12 08:11:02'),(34,5,18,74,'2017-08-12 09:31:22'),(35,5,16,74,'2017-08-12 09:31:22'),(36,5,12,74,'2017-08-12 09:31:22'),(37,5,17,75,'2017-08-12 14:23:32'),(38,5,16,75,'2017-08-12 14:23:32'),(39,5,15,75,'2017-08-12 14:23:32'),(40,5,19,77,'2017-08-12 23:28:12'),(41,5,15,78,'2017-08-13 01:18:33'),(42,5,17,79,'2017-08-13 01:53:26'),(43,5,19,80,'2017-08-13 04:18:30'),(44,5,18,81,'2017-08-13 05:23:51'),(45,5,16,81,'2017-08-13 05:23:51'),(46,5,12,81,'2017-08-13 05:23:51'),(47,5,13,82,'2017-08-13 05:44:35'),(48,5,16,83,'2017-08-13 07:08:31'),(49,5,13,83,'2017-08-13 07:08:31'),(50,5,17,84,'2017-08-13 09:18:30'),(51,5,16,84,'2017-08-13 09:18:30'),(52,5,13,84,'2017-08-13 09:18:30'),(53,5,17,85,'2017-08-13 10:32:07'),(54,5,16,85,'2017-08-13 10:32:07'),(55,5,13,85,'2017-08-13 10:32:07'),(56,5,18,86,'2017-08-13 12:33:26'),(57,5,16,86,'2017-08-13 12:33:26'),(58,5,13,86,'2017-08-13 12:33:26'),(59,5,17,88,'2017-08-13 14:39:04'),(60,5,12,88,'2017-08-13 14:39:04'),(61,5,16,89,'2017-08-13 15:32:20'),(62,5,13,89,'2017-08-13 15:32:20'),(63,5,19,91,'2017-08-13 15:35:39'),(64,5,19,92,'2017-08-14 00:18:50'),(65,5,14,92,'2017-08-14 00:18:50'),(66,5,17,93,'2017-08-14 00:30:03'),(67,5,13,93,'2017-08-14 00:30:03'),(68,5,17,94,'2017-08-14 01:53:46'),(69,5,13,94,'2017-08-14 01:53:46'),(70,5,17,95,'2017-08-14 06:33:37'),(71,5,13,95,'2017-08-14 06:33:37'),(72,5,17,96,'2017-08-14 09:33:53'),(73,5,14,96,'2017-08-14 09:33:53'),(74,5,17,97,'2017-08-14 11:35:52'),(75,5,15,97,'2017-08-14 11:35:52'),(76,5,17,98,'2017-08-14 11:36:40'),(77,5,15,98,'2017-08-14 11:36:40'),(78,5,13,99,'2017-08-14 13:37:15'),(79,5,16,100,'2017-08-14 23:46:34'),(80,5,13,100,'2017-08-14 23:46:34'),(81,5,17,101,'2017-08-15 00:52:00'),(82,5,18,102,'2017-08-15 02:07:30'),(83,5,16,102,'2017-08-15 02:07:30'),(84,5,17,103,'2017-08-15 04:10:54'),(85,5,16,103,'2017-08-15 04:10:54'),(86,5,13,103,'2017-08-15 04:10:54'),(87,5,16,104,'2017-08-15 04:58:52'),(88,5,13,104,'2017-08-15 04:58:52'),(89,5,17,105,'2017-08-15 10:17:46'),(90,5,16,105,'2017-08-15 10:17:46'),(91,5,14,106,'2017-08-15 13:13:03'),(92,5,17,107,'2017-08-15 15:27:36'),(93,5,15,107,'2017-08-15 15:27:36'),(94,5,17,108,'2017-08-15 15:28:38'),(95,5,20,109,'2017-08-15 17:15:42'),(96,5,14,109,'2017-08-15 17:15:42'),(97,5,20,110,'2017-08-15 17:16:45'),(98,5,20,111,'2017-08-15 17:18:59'),(99,5,20,112,'2017-08-15 17:19:59'),(100,5,20,113,'2017-08-15 17:21:51'),(101,5,19,114,'2017-08-15 17:29:48'),(102,5,17,115,'2017-08-16 02:50:29'),(103,5,15,115,'2017-08-16 02:50:29'),(104,5,17,116,'2017-08-16 04:45:19'),(105,5,14,117,'2017-08-16 07:02:19'),(106,5,20,118,'2017-08-16 09:23:37'),(107,5,18,118,'2017-08-16 09:23:37'),(108,5,13,119,'2017-08-16 09:55:40'),(109,5,12,119,'2017-08-16 09:55:40'),(110,5,18,120,'2017-08-16 11:11:00'),(111,5,16,120,'2017-08-16 11:11:01'),(112,5,15,121,'2017-08-16 13:32:34'),(113,5,12,122,'2017-08-16 15:13:02'),(114,5,19,123,'2017-08-16 16:35:27'),(115,5,18,123,'2017-08-16 16:35:27'),(116,5,16,123,'2017-08-16 16:35:27'),(117,5,17,125,'2017-08-16 17:28:24'),(118,5,12,125,'2017-08-16 17:28:24'),(119,5,16,126,'2017-08-16 18:17:40'),(120,5,16,127,'2017-08-17 03:43:32'),(121,5,12,127,'2017-08-17 03:43:32'),(122,5,17,128,'2017-08-17 04:42:02'),(123,5,17,129,'2017-08-17 06:23:28'),(124,5,13,130,'2017-08-17 08:32:26'),(125,5,12,130,'2017-08-17 08:32:26'),(126,5,18,131,'2017-08-17 11:15:16'),(127,5,12,131,'2017-08-17 11:15:16'),(128,5,16,132,'2017-08-17 14:47:58'),(129,5,13,132,'2017-08-17 14:47:58'),(130,5,12,134,'2017-08-17 17:34:52'),(131,5,14,135,'2017-08-17 18:23:24'),(132,5,16,136,'2017-08-17 20:12:14'),(133,5,17,137,'2017-08-17 22:21:00'),(134,5,12,138,'2017-08-17 23:21:24'),(135,5,18,139,'2017-08-18 00:38:32'),(136,5,19,140,'2017-08-18 06:11:07'),(137,5,14,140,'2017-08-18 06:11:07'),(138,5,14,141,'2017-08-18 06:11:55'),(139,5,13,142,'2017-08-18 08:11:14'),(140,5,12,143,'2017-08-18 08:34:38'),(141,5,17,144,'2017-08-18 09:44:16'),(142,5,16,144,'2017-08-18 09:44:16'),(143,5,14,144,'2017-08-18 09:44:16'),(144,5,13,145,'2017-08-18 12:00:16'),(145,5,15,146,'2017-08-18 12:59:11'),(146,5,12,147,'2017-08-18 13:47:22'),(147,5,13,148,'2017-08-18 18:27:12'),(148,5,20,149,'2017-08-18 19:30:42'),(149,5,12,150,'2017-08-18 21:54:20'),(150,5,16,151,'2017-08-18 23:34:08'),(151,5,13,151,'2017-08-18 23:34:08'),(152,5,19,152,'2017-08-19 07:52:07'),(153,5,12,154,'2017-08-19 13:29:50'),(154,5,20,155,'2017-08-19 19:05:11'),(155,5,16,155,'2017-08-19 19:05:11'),(156,5,19,156,'2017-08-19 23:20:28'),(157,5,12,157,'2017-08-19 23:21:14'),(158,5,20,158,'2017-08-20 10:41:39'),(159,5,14,158,'2017-08-20 10:41:39'),(160,5,14,159,'2017-08-20 13:10:42'),(161,5,20,160,'2017-08-20 19:58:55'),(162,5,14,160,'2017-08-20 19:58:55'),(163,5,12,161,'2017-08-21 10:57:42'),(164,5,16,162,'2017-08-21 11:40:26'),(165,5,12,162,'2017-08-21 11:40:26'),(166,5,14,163,'2017-08-21 15:46:15'),(167,5,14,164,'2017-08-21 19:06:14'),(168,5,14,165,'2017-08-21 21:37:45'),(169,5,16,166,'2017-08-22 00:16:51'),(170,5,12,166,'2017-08-22 00:16:51'),(171,5,17,167,'2017-08-22 14:18:29'),(172,5,12,167,'2017-08-22 14:18:29'),(173,5,16,168,'2017-08-22 15:43:24'),(174,5,15,168,'2017-08-22 15:43:24'),(175,5,12,169,'2017-08-22 17:18:12'),(176,5,12,170,'2017-08-22 23:54:27'),(177,5,20,171,'2017-08-23 02:30:00'),(178,5,16,172,'2017-08-23 03:10:29'),(179,5,12,172,'2017-08-23 03:10:29'),(180,5,12,174,'2017-08-23 03:29:54'),(181,5,17,175,'2017-08-23 15:40:20'),(182,5,15,175,'2017-08-23 15:40:20'),(183,5,13,176,'2017-08-23 16:39:20'),(184,5,12,176,'2017-08-23 16:39:20'),(185,5,16,177,'2017-08-23 17:03:04'),(186,5,14,178,'2017-08-23 21:34:31'),(187,5,14,179,'2017-08-24 23:15:00'),(188,5,12,179,'2017-08-24 23:15:00'),(189,5,14,180,'2017-08-24 23:42:37'),(190,5,20,181,'2017-08-25 00:43:06'),(191,5,14,181,'2017-08-25 00:43:06'),(192,5,17,182,'2017-08-25 20:44:29'),(193,5,20,183,'2017-08-25 22:40:43'),(194,5,15,183,'2017-08-25 22:40:43'),(195,5,20,184,'2017-08-25 23:12:41'),(196,5,12,185,'2017-08-26 20:47:47'),(197,5,16,186,'2017-08-26 21:07:33'),(198,5,12,186,'2017-08-26 21:07:33'),(199,5,17,187,'2017-08-26 22:31:19'),(200,5,14,188,'2017-08-26 23:03:34'),(201,5,17,189,'2017-08-27 00:52:10'),(202,5,13,189,'2017-08-27 00:52:10'),(203,5,12,189,'2017-08-27 00:52:10'),(204,5,17,190,'2017-08-27 03:30:47'),(205,5,16,190,'2017-08-27 03:30:47'),(206,5,12,191,'2017-08-27 21:38:56'),(207,5,13,192,'2017-08-27 22:17:04'),(208,5,16,193,'2017-08-27 23:24:30'),(209,5,16,194,'2017-08-28 05:52:20'),(210,5,17,195,'2017-08-28 05:52:42'),(211,5,14,195,'2017-08-28 05:52:42'),(212,5,14,196,'2017-08-29 00:59:09'),(213,5,14,197,'2017-08-31 09:58:40'),(214,5,14,198,'2017-08-31 10:03:07'),(215,5,14,202,'2017-09-01 05:56:51'),(216,5,14,203,'2017-09-01 11:37:10'),(217,5,14,204,'2017-09-02 13:52:45'),(218,5,14,205,'2017-09-03 12:44:14'),(219,5,12,205,'2017-09-03 12:44:14'),(220,5,20,206,'2017-09-03 13:11:34'),(221,5,17,206,'2017-09-03 13:11:34'),(222,5,14,207,'2017-09-04 04:38:48'),(223,5,17,208,'2017-09-04 04:39:35'),(224,5,20,209,'2017-09-04 04:40:57'),(225,5,14,209,'2017-09-04 04:40:57'),(226,5,16,210,'2017-09-04 08:54:20'),(227,5,17,211,'2017-09-04 16:04:02'),(228,5,14,212,'2017-09-04 17:25:19'),(229,5,12,212,'2017-09-04 17:25:19'),(230,5,14,213,'2017-09-04 21:32:19'),(231,5,16,214,'2017-09-05 18:12:44'),(232,5,13,214,'2017-09-05 18:12:44'),(233,5,16,215,'2017-09-06 15:44:50'),(234,5,15,215,'2017-09-06 15:44:50'),(235,5,12,215,'2017-09-06 15:44:50'),(236,5,14,216,'2017-09-06 16:45:53'),(237,5,17,217,'2017-09-07 17:25:06'),(238,5,19,218,'2017-09-07 21:24:30'),(239,5,19,219,'2017-09-08 17:33:12');
/*!40000 ALTER TABLE `tagitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '是哪个用户(userid)的任务',
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  `costmindenergy` int(10) unsigned DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `block` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_idx` (`userid`),
  CONSTRAINT `id` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'2017-07-28 19:45:59',10,'test title','test content',0),(2,1,'2017-07-28 19:45:59',10,'test title','test content',0),(3,1,'2017-07-28 19:46:35',10,'test title','test content',0),(4,1,'2017-07-28 19:46:35',10,'test title','test content',0),(5,1,'2017-07-28 22:06:11',10,'test title','test content',0),(6,1,'2017-07-28 22:11:05',15,'ç¬¬ä¸ä¸ªæ é¢','åå®¹',0),(7,1,'2017-07-28 22:12:01',15,'<Mistna@bbs.ngacn.cc>: å°±1.4çæ¬çæ¨±è²è½®åï¼æç°å¨æ¯sï¼ä¸ªäººæè§ss','åå®¹',0),(8,1,'2017-07-28 22:16:57',15,'樱色轮回，我现在是s，个人感觉ss','FDF',0),(17,1,'2017-07-28 23:52:24',10,'实验一下','fdsf',0),(18,1,'2017-07-28 23:53:05',15,'起始位置是什么？','rt',0),(19,1,'2017-08-01 01:22:37',15,'消耗掉体力值','rt',0),(20,1,'2017-08-01 01:32:31',15,'ts1','ttt',0),(21,1,'2017-08-01 01:32:34',15,'','',0),(22,1,'2017-08-01 01:32:36',15,'','',0),(23,1,'2017-08-01 01:32:40',15,'','',0),(24,1,'2017-08-01 01:32:42',15,'','',0),(25,1,'2017-08-01 01:32:43',15,'','',0),(26,1,'2017-08-01 03:43:42',15,'','',0),(27,1,'2017-08-01 03:43:45',15,'','',0),(28,1,'2017-08-01 03:43:48',15,'','',0),(29,1,'2017-08-01 03:43:51',15,'','',0),(30,1,'2017-08-01 22:39:12',15,'','',0),(31,1,'2017-08-01 22:39:33',15,'','',0),(32,1,'2017-08-01 22:39:36',15,'','',0),(33,1,'2017-08-01 22:41:19',15,'','',0),(34,1,'2017-08-01 22:41:22',15,'','',0),(35,1,'2017-08-01 22:46:03',15,'','',0),(36,1,'2017-08-01 22:53:38',10,'test title','test content',0),(37,1,'2017-08-01 23:09:59',15,'','',0),(38,1,'2017-08-01 23:10:20',15,'','',0),(39,1,'2017-08-01 23:10:28',15,'','',0),(40,1,'2017-08-01 23:11:23',15,'','',0),(41,1,'2017-08-01 23:14:53',15,'','',0),(42,1,'2017-08-01 23:18:32',15,'','',0),(43,1,'2017-08-01 23:20:53',15,'','',0),(44,1,'2017-08-02 00:27:31',15,'','',0),(45,1,'2017-08-02 00:28:07',15,'','',0),(46,1,'2017-08-02 02:13:28',15,'','',0),(47,1,'2017-08-10 08:05:44',15,'','',0),(48,1,'2017-08-10 14:38:16',15,'','',0),(49,1,'2017-08-10 14:40:07',15,'','',0),(50,1,'2017-08-10 14:58:38',10,'test title','test content',0),(51,1,'2017-08-10 14:59:51',10,'test title','test content',0),(52,1,'2017-08-10 15:00:32',15,'测试tag','测试tag',0),(53,4,'2017-08-10 06:50:38',15,'啊啊啊','我是一只土拨鼠',0),(54,5,'2017-08-10 10:57:53',15,'Mind Anchor 开站了！','rt，希望能让我整理我的想法，让每一个想法都处在应有的位置',0),(55,5,'2017-08-10 11:44:51',10,'三人行必有我妹','跟拖',1),(56,5,'2017-08-10 11:45:49',10,'三人行必有我妹','跟to love一样，无修动画会不经意露出胸部',0),(57,5,'2017-08-10 22:04:41',15,'睡觉时无意间醒了，但继续闭眼等待另一段睡眠','当时过早醒的话，后面的事情都会很麻烦。',0),(58,5,'2017-08-10 22:06:54',15,'实现task的tag，content，加入删除（block）功能','复习英语，并且查询一下校招日期',0),(59,5,'2017-08-11 00:13:33',15,'如计划一样，mind anchor项目有所进展','rt',0),(60,5,'2017-08-11 00:59:29',15,'心跳的感觉好强，下午去锻炼一下','rt',0),(61,5,'2017-08-11 01:37:44',15,'等妈拿饭，迟到快2小时了','期间用娱乐等待，要是准备好红薯，情况会好一点。',0),(62,5,'2017-08-11 04:12:39',10,'玩了游戏vbf，看了动画三人行必有我妹','因为gap太长了3个多小时，让我只用娱乐填补这个gap，不好',0),(63,5,'2017-08-11 04:47:08',10,'上传了新程序到服务器，session或cookie好像有问题','tooltip在手机上也不能正确显示',0),(64,5,'2017-08-11 08:29:29',15,'锻炼的时候不集中，缺乏勇气','rt',0),(65,5,'2017-08-11 09:28:10',15,'撸了一管，因为看到喜欢的本子系列出了新作','有点无视计划（复习英语）的意思',0),(66,5,'2017-08-11 10:53:23',15,'晚上精神不怎么好，感觉像箍着似得','rt',0),(67,5,'2017-08-11 22:16:19',15,'修改体力bug，让手机也能看tooltip','早上又考虑怎么玩崩坏3了，同层了',0),(68,5,'2017-08-12 00:17:33',15,'又进行了娱乐活动，期间同层了几次','rt',0),(69,5,'2017-08-12 01:26:18',15,'又装了崩坏3，感觉自己又想发展一下崩坏3，但同层的概念阻止了我','rt',0),(70,5,'2017-08-12 05:06:30',15,'睡了一觉，硬了，但控制起来。精神有点问题。','',0),(71,5,'2017-08-12 07:36:31',15,'锻炼了一发，感觉眼睛不能接受强光','目前在学英语+spring',0),(72,5,'2017-08-12 07:44:40',15,'感觉光线让我无法集中，是因为天黑我背后没光吗？','显示器也不怎么好，有钱就换掉吧',0),(73,5,'2017-08-12 08:11:01',15,'买了瓶维生素ad，不知道有没有帮助','晚上感觉有点畏光',0),(74,5,'2017-08-12 09:31:22',15,'感觉没啥好做的，于是想撸一管','这是一个gap',0),(75,5,'2017-08-12 14:23:32',15,'睡不着（因为中午睡了），起床无数欲望闪过，最后决定看动画','rt',0),(76,5,'2017-08-12 23:27:37',15,'早上居然没带钥匙出去买东西，只好叫妈回来','感觉问题挺严重。',1),(77,5,'2017-08-12 23:28:12',15,'早上居然没带钥匙出去买东西，只好叫妈回来','感觉问题挺严重，接下来要计划做出一些事弥补',0),(78,5,'2017-08-13 01:18:33',15,'看了三人行必有我妹，挺有意思的。','虽然无法集中连续地观看，但还是觉得好有意思',0),(79,5,'2017-08-13 01:53:26',15,'看了一章spring tutorial，感觉没有实践还是搞不懂每种技术的用处','那要怎么干呢？',0),(80,5,'2017-08-13 04:18:30',15,'又睡了一觉，不知道是不是好事','能让我更集中吗？',0),(81,5,'2017-08-13 05:23:51',15,'频繁地看微信，可是微信不可能拯救我','rt',0),(82,5,'2017-08-13 05:44:35',15,'又跑去打崩坏3了，不知道是不是同层了','rt',0),(83,5,'2017-08-13 07:08:31',15,'无法控制地打了崩坏3一个半小时','不过14号，泳装就拿到了，到时就没有顾虑了',0),(84,5,'2017-08-13 09:18:30',15,'又sb看lol比赛（因为偶然看到走A的文章+之前在打崩坏3），浪费几个小时','加上吃完饭有点头痛',0),(85,5,'2017-08-13 10:32:07',15,'打了游戏看了比赛，打乱我节奏，没有锻炼和这代码','rt',0),(86,5,'2017-08-13 12:33:26',15,'洗澡时，感觉又软弱了，考虑怎么打崩坏3','打崩坏3还不如打galgame',0),(87,5,'2017-08-13 13:40:11',15,'spring的converter会自动运用（大概是看到字段名字一样类型不一样就尝试转换吧）','rt',0),(88,5,'2017-08-13 14:39:04',15,'在看英语书自私的基因，希望能看久一点','rt',0),(89,5,'2017-08-13 15:32:20',15,'看英语看得好慢哦，期间还想撸管，但忍住了','Curiously, peace-time appeals for individuals tomake some small sacrifice in the rate at which they increase theirstandard of living seem to be less effective than war-time appeals forindividuals to lay down their lives',0),(90,5,'2017-08-13 15:35:11',15,'鼻炎有点严重，估计得再去几趟医院','好痒',1),(91,5,'2017-08-13 15:35:39',15,'鼻炎有点严重，估计得再去几趟医院','好痒',0),(92,5,'2017-08-14 00:18:50',15,'鼻子好痒，决定戴个口罩试试，能不能减轻症状','可能是空气问题',0),(93,5,'2017-08-14 00:30:03',15,'为了泳装，一大早就醒来登录崩坏3','感觉可能会失控，失去节奏',0),(94,5,'2017-08-14 01:53:46',15,'打了一个小时崩坏3，又陷入那种为了一点没意思的奖励而努力的循环','接下来写chrome extension，不知道要不要继续月卡签到好',0),(95,5,'2017-08-14 06:33:37',15,'搞了一下午的chrome插件，还行，好过打一下午游戏','但成果不大，除了知道flick这个词什么意思之外',0),(96,5,'2017-08-14 09:33:53',15,'做出了屏蔽关键字的chrome 插件了','集中精力搞成一件事',0),(97,5,'2017-08-14 11:35:52',15,'撸了菲特新出的本子，啊，美好的结局呀','但节奏被打乱这点需要注意',0),(98,5,'2017-08-14 11:36:40',15,'之后看看三人行必有我妹，嗯，缓一缓撸管综合征','之后要计划一下',0),(99,5,'2017-08-14 13:37:15',15,'又看智障知乎上跟我毫无关系的文章','微软怎么样跟我屁事',0),(100,5,'2017-08-14 23:46:34',15,'早上起来又想玩崩坏3，但要忍住','玩崩坏3这个想法是被游戏公司巧妙诱惑，这点要时刻清楚',0),(101,5,'2017-08-15 00:52:00',15,'因为昨晚没洗澡，起来顺便锻炼了一发','节奏不错',0),(102,5,'2017-08-15 02:07:30',15,'又在三体相关的知乎讨论上消耗时间，这帮人讨论不出像本虚无这么有意思的结果','但我也不能为止打乱节奏',0),(103,5,'2017-08-15 04:10:54',15,'搞了半天aop的错误，发现要导入aspectjweaver这个包，当然错误信息中的java.lang.NoClassDefFoundError: org/aspectj/weaver 也很重要','不过错误信息太多了，没点经验看不出有用的，像noclassdeffounderror这个就不知道',0),(104,5,'2017-08-15 04:58:52',15,'打了快一小时的崩坏3','不知道有没有打乱我节奏',0),(105,5,'2017-08-15 10:17:46',15,'睡醒后去背单词，背得好慢','但总算保住了节奏',0),(106,5,'2017-08-15 13:13:03',15,'发现pdf里的注释功能不错，要多用用','不知道能不能跟evernote或onenote无缝对接',0),(107,5,'2017-08-15 15:27:36',15,'看了辉夜大小姐，接下来学一遍ssm','节奏不能断',0),(108,5,'2017-08-15 15:28:38',15,'找到了本新ssm书，不知道能不能讲到重要的事情','看英文书多一会有点头痛',0),(109,5,'2017-08-15 17:15:42',15,'增加新tag：世界线，这是一个面向未来的tag','我似乎对未来有很多不一样的期待，但最终我只有一个未来。\r\n所以这个tag用来检索我的不同期待到底应该重视哪一些。',0),(110,5,'2017-08-15 17:16:45',15,'感觉练一手打字+熟练一个编辑器也不错','https://www.zhihu.com/question/27021761\r\n主要理由是似乎可以降低打字对自己的注意力的占用，速度反而不是重点。',0),(111,5,'2017-08-15 17:18:59',15,'使用带小红点的键盘','https://item.jd.com/931835.html\r\n我用过笔记本上的小红点，似乎代替简单的操作是没问题的，这款键盘最低价200左右，那时应该就可以入手了，看看双11怎么说。',0),(112,5,'2017-08-15 17:19:59',15,'花多点时间，有组织，有目的地学习使用idea','似乎这是个不错的选择？',0),(113,5,'2017-08-15 17:21:51',15,'研究组织术，如泡学等','虽然我应该没什么地方能运用组织术，但了解一下社会上的人通常采取什么手段感觉也挺重要。',0),(114,5,'2017-08-15 17:29:48',15,'依然感觉头脑就像带了头盔一样','但简单、低成本的手段应该是无法搞好了，习惯一下吧，也不是很影响',0),(115,5,'2017-08-16 02:50:29',15,'早上起来在微信嘲讽了一下耀明，但用词，表达的意思不怎么样','接下来先看看动画',0),(116,5,'2017-08-16 04:45:19',15,'明天弄一份简历','开始准备求职',0),(117,5,'2017-08-16 07:02:19',15,'开始写按键精灵领取崩坏3的夏日藏宝图的奖励','不知道是好是坏',0),(118,5,'2017-08-16 09:23:37',15,'从6点搞到9点的按键精灵','感觉用按键精灵开发还是不太适用，主要是找图出了问题',0),(119,5,'2017-08-16 09:55:40',15,'因为浪费4个小时在崩坏3，节奏有点乱','但收获也是有的，那就是按键精灵能适用的场景不大',0),(120,5,'2017-08-16 11:11:00',15,'在看bilibili平板版的时候，明显抑制住了','没有消耗太多时间就出来了',0),(121,5,'2017-08-16 13:32:34',15,'看路哥装逼，除了刚开头考50分和搭公交让座的桥段外，其他装逼手段都不错','当然，事情也不会发展得很有意思',0),(122,5,'2017-08-16 15:13:02',15,'又在debug，又是需要导入包才能用的功能（而教程有没怎么说明这方面），但我的debug的方向也很差','应该有方向地判断是服务器还是客户端的错误（而chrome的网络交换表明客户端是正确发送了信息的）',0),(123,5,'2017-08-16 16:35:27',15,'有向崩坏3腐化的倾向','又加入了舰团',0),(124,5,'2017-08-16 17:10:28',15,'对json格式的转换处理','当然是导入包，然后spring框架会自动转换json变成对象然后传入controller里面',0),(125,5,'2017-08-16 17:28:24',15,'为了逃避学spring mvc，我选择来一段睡前锻炼','明明今天springmvc没有啥进展，不过锻炼还是可以的',0),(126,5,'2017-08-16 18:17:40',15,'在洗澡时又考虑怎么玩崩坏3，但我有意识地去抑制住它','因为这个游戏不值得花那么多时间，虽然有美少女，但被制作成一点奖励花大量时间，而有意思的机制不多',0),(127,5,'2017-08-17 03:43:32',15,'早上起来随便看了几眼网页就开始正事了','就是刷牙洗脸之类',0),(128,5,'2017-08-17 04:42:02',15,'现在准备做简历上传找工作了','有什么有效的办法吗？',0),(129,5,'2017-08-17 06:23:28',15,'写完了简历，发现大学的碌碌无为需要补锅了','采取更有勇气的行为',0),(130,5,'2017-08-17 08:32:26',15,'因为深渊结算，今天打了2小时崩坏3','不能乱节奏呀',0),(131,5,'2017-08-17 11:15:16',15,'没什么理由就又躺在床上看平板了','可能是等饭的原因，也可能是没啥勇气',0),(132,5,'2017-08-17 14:47:58',15,'睡了一觉，醒来后又偶然搜起了av','真无聊',0),(133,5,'2017-08-17 16:51:19',15,'深渊打了10层居然还降级，应该是忘记隐身了','嗯，半小时的劳动成果',0),(134,5,'2017-08-17 17:34:52',15,'意志薄弱，又跑去下了点av','正职工作进展不大',0),(135,5,'2017-08-17 18:23:24',15,'我想了个学spring的方法，记录关键字，然后回忆关键字是怎么用的','点技能计划',0),(136,5,'2017-08-17 20:12:14',15,'又研究了一遍idea是怎么部署web项目的，还有要把文件夹mark as resource，idea才知道要部署到服务器','还有就是mark as resource后，spring mvc才能用到resource里面的文件',0),(137,5,'2017-08-17 22:21:00',15,'看了看找工作的状况，下一步我应该怎么做？','找一份3、4000的工作，应该还是可以的，但要计划一个',0),(138,5,'2017-08-17 23:21:24',15,'浑浑噩噩想计划，最后还是看回pdf','不知道能不能快点吃饭',0),(139,5,'2017-08-18 00:38:32',15,'等饭的时候跑去打崩坏3，又浪费一个小时','心存侥幸',0),(140,5,'2017-08-18 06:11:07',15,'有点傻，因为睡眠混乱，现在睡了5小时就醒了','这样干不是会导致学不进东西吗？',0),(141,5,'2017-08-18 06:11:55',15,'感觉比较好的做法是午睡一次不能超过1小时半，这样晚上的睡眠就不会太过延后','晚上睡觉的时候也主义醒的时间',0),(142,5,'2017-08-18 08:11:14',15,'醒来后，为了应对疲惫感，锻炼了一发','然后就跑去打崩坏3。。。',0),(143,5,'2017-08-18 08:34:38',15,'又在打游戏了，还想着之后还打，好颓废','感觉要完全卸载才行，毕竟只是游戏里的东西',0),(144,5,'2017-08-18 09:44:16',15,'因为想撸管，就强迫自己看完一章书才能撸','确实草草看完了',0),(145,5,'2017-08-18 12:00:16',15,'又在微信群搞无聊的事情，太关注这些无关的东西','还写了遍文章，没人看',0),(146,5,'2017-08-18 12:59:11',15,'一边看三人行必有我妹，一边发微信，时间过得好浪费','只是看动画不就好了吗',0),(147,5,'2017-08-18 13:47:22',15,'失去了勇气，一直看微信那些没啥用的东西','每一点时间都是可以利用的资源',0),(148,5,'2017-08-18 18:27:12',15,'又浪费时间在崩坏3这个游戏上了，其他的事情其实更应该做','我不能把崩坏3那么急眼',0),(149,5,'2017-08-18 19:30:42',15,'决定打够3000游骑兵拿到黑轩辕就不再玩崩坏3了，一天一小时都是浪费的游戏时间','无论之后如何，都不再玩了',0),(150,5,'2017-08-18 21:54:20',15,'感觉有点逃避学spring，又撸了管','要有撸完管立刻写代码的精神力',0),(151,5,'2017-08-18 23:34:08',15,'因为祖婆来了，所以干了一些其他事','但没有立刻反应过来',0),(152,5,'2017-08-19 07:52:07',15,'继续混乱的睡眠状态','起床又打崩坏3',0),(153,5,'2017-08-19 11:49:04',15,'事务管理的代码怎么写？','xx失去了勇气',0),(154,5,'2017-08-19 13:29:50',15,'感觉睡眠缺少让我的想法变形了','rt',0),(155,5,'2017-08-19 19:05:11',15,'又颓废了一两天，圣女也s了，明天拿到黑轩辕就真的卸载了','不应该这么干的',0),(156,5,'2017-08-19 23:20:28',15,'失眠让我失去了不少勇气，不过比以前好的是，现在我在这个状态是做服务器的事，而不是打游戏','rt',0),(157,5,'2017-08-19 23:21:14',15,'因为失眠，我有点不想来这里写东西，不过还是要强迫自己来写','因为这么做才是好的',0),(158,5,'2017-08-20 10:41:39',15,'我妈想买楼这件事一定要处理好','不存在闭眼情况',0),(159,5,'2017-08-20 13:10:42',15,'成功把爬虫上传到服务器运行','没有用合适的关键字查资料，导致了浪费时间，这点谨记',0),(160,5,'2017-08-20 19:58:55',15,'终于把崩坏3刷出黑轩辕了，不要再玩了','在游戏里跟美少女玩，和面对无聊的现实，假如本虚无有勇气的话，我会怎么做？',0),(161,5,'2017-08-21 10:57:42',15,'本虚无睡了挺长的一觉，会恢复勇气吗？','结束无法控制的美梦',0),(162,5,'2017-08-21 11:40:26',15,'刚刚我又想去玩平板的时候，我的勇气又让我去进行有意义的活动','比如研究mybatis的事务',0),(163,5,'2017-08-21 15:46:15',15,'嗯，打开哔哩哔哩客户端是个挺严重的问题','不能这么做',0),(164,5,'2017-08-21 19:06:14',15,'终于把书上的代码跑通了，这次我回忆一下要怎么做。','还有其他几条死路，和不对的处理死路',0),(165,5,'2017-08-21 21:37:45',15,'查了六级成绩，发了装逼微信','可是这些都没什么用，重要的东西都在Mind Anchor的标签里面',0),(166,5,'2017-08-22 00:16:51',15,'跑通了书上的项目，但可能要花很多时间才能研究一遍所有的技术细节','这没啥关系，但我太不专注了',0),(167,5,'2017-08-22 14:18:29',15,'昨天没什么理由地放弃了锻炼，也放弃了背英语','因为我减少了在mindanchor写东西的勇气了吗？今天不能这么样',0),(168,5,'2017-08-22 15:43:24',15,'进行了一番冗长乏味的娱乐后，开始工作了','甚至连动画片都没有看',0),(169,5,'2017-08-22 17:18:12',15,'怠慢','rt',0),(170,5,'2017-08-22 23:54:27',15,'教邓俊升算法教了2小时','因为我丧失了勇气，想做些其他事，逃避专注',0),(171,5,'2017-08-23 02:30:00',15,'为了在台风中装逼，特地往微信里发了一条关于美少女的朋友圈','不知道这个思路会有多少危害？',0),(172,5,'2017-08-23 03:10:29',15,'刚刚我抑制了一次看微信的冲动，非常的有勇气','这是合理的，我应该更专注',0),(173,5,'2017-08-23 03:29:06',15,'刚刚debug水平上涨了一下','',1),(174,5,'2017-08-23 03:29:54',15,'刚刚debug水平上涨了一下','刻意用脑子思考了原因，虽然没成功，但有个思路还是接近答案的',0),(175,5,'2017-08-23 15:40:20',15,'醒来后看了集动画','接下来思考该干什么',0),(176,5,'2017-08-23 16:39:20',15,'看了一下贴吧上的无聊帖子','这样是不可能得到拯救的',0),(177,5,'2017-08-23 17:03:04',15,'满脑子杂念','又在想鸡巴事',0),(178,5,'2017-08-23 21:34:31',15,'这次debug没有自己看之前成功的项目呀','当然，只怪这东西太邪乎',0),(179,5,'2017-08-24 23:15:00',15,'昨天因为去骂班主任，所以没怎么往这里写东西','这次的经验就是提醒了我，这帮围观群众基本是sb',0),(180,5,'2017-08-24 23:42:37',15,'学会用上maven下载document，查看java的api的用途','嗯，这些技巧根本没有做出努力尝试去学',0),(181,5,'2017-08-25 00:43:06',15,'现在发现当个月光族其实问题就非常大了','分期付款买东西问题就更严重了\r\n',0),(182,5,'2017-08-25 20:44:29',15,'早上锻炼洗澡，然后看了看b站','嗯，有腐化的气息',0),(183,5,'2017-08-25 22:40:43',15,'动漫圈真是恶心，真不想接触动漫圈','不符合本虚无的追求',0),(184,5,'2017-08-25 23:12:41',15,'原先我以为前端没什么用，现在发现那个在线ps网站其实就是前端技术的应用吧','感觉这东西好像还行的样子',0),(185,5,'2017-08-26 20:47:47',15,'昨天做得那么差，今天不能做得更好吗？','这不是为了逃避坏处，是为了符合我的想法',0),(186,5,'2017-08-26 21:07:33',15,'有点勇气，抑制一大早起来就娱乐的心态','好，+1分',0),(187,5,'2017-08-26 22:31:19',15,'锻炼然后洗澡了一发，然后研究适配器（adapter）','+1分',0),(188,5,'2017-08-26 23:03:34',15,'用new window同时看一个pdf的不同之处，工厂后处理器的后，是指back，援助的意思（我猜的）','不错，有启发意义',0),(189,5,'2017-08-27 00:52:10',15,'中午有点腐化，在打完游戏后，居然还想持续娱乐','现在收拾心情，专注复习',0),(190,5,'2017-08-27 03:30:47',15,'睡了一觉，醒来要复习一下前面所学','不能这么干',0),(191,5,'2017-08-27 21:38:55',15,'最近一软弱起来，都不想在mindanchor里写东西','这样完全不好呀',0),(192,5,'2017-08-27 22:17:04',15,'锻炼洗澡了一发，中午会爆电磁炮','可是就算爆电磁炮，他也不是跟我其他重要事情同层面的东西',0),(193,5,'2017-08-27 23:24:30',15,'我，因为想到了今天的碌碌无为，于是平板都没有玩就从床上爬起来了','+1分',0),(194,5,'2017-08-28 05:52:20',15,'脑中一直觉得这做后台好蠢，这种想法让我不能集中精神','我应该集中精神',0),(195,5,'2017-08-28 05:52:42',15,'把forum项目接入mybatis','嗯嗯',0),(196,5,'2017-08-29 00:59:09',15,'mybatis的延迟加载真的屌，debug，print时都会触发出来','厉害，更厉害的是我居然发现了，嗯我掌握了正确的方法',0),(197,5,'2017-08-31 09:58:40',15,'果然就算是坚持写mind anchor也是很难的','嗯，我又回来了',0),(198,5,'2017-08-31 10:03:07',15,'注册了CF的账号，好像明天有比赛','不知道我对这事的行为是怎么样的',0),(199,6,'2017-08-31 23:12:48',15,'hhh','hhh',0),(200,6,'2017-08-31 23:13:10',15,'hhh','hhhh',0),(201,6,'2017-08-31 23:13:35',15,'nnnnnn','hbbbh',0),(202,5,'2017-09-01 05:56:51',15,'修复一个mybatis的bug，因为是xml文件，有点难以看出一个xml文件怎么调用另一个xml文件的方法','rt',0),(203,5,'2017-09-01 11:37:10',15,'打了一次cf，发觉自己把自己思维控制得太急了','嗯，真菜',0),(204,5,'2017-09-02 13:52:45',15,'CGI原来是一个服务器的样子，就是调用某段程序然后获取他的标准输出，然后返回到browser里','这时最重要的特征了',0),(205,5,'2017-09-03 12:44:14',15,'当初是什么原因，让我坚持写了一个多星期mindanchor？','现在又是什么原因，让我坚持不下来？',0),(206,5,'2017-09-03 13:11:34',15,'今晚的主题是研究concurrent','嗯',0),(207,5,'2017-09-04 04:38:48',15,'今天出门犯了几个错误','在走廊大声说话，没看班导师是在上课的时间打电话，打电话时处理得也不好，万一对方是小气的人，没感受到我的歉意就有麻烦了',0),(208,5,'2017-09-04 04:39:35',15,'晚上看看能不能醒来打cf','这次要采取更有效的思考模式',0),(209,5,'2017-09-04 04:40:57',15,'爽哥叫我去做学校项目的后台，我答应了','不知道这事最后会发展成什么样',0),(210,5,'2017-09-04 08:54:20',15,'不知道为啥，很想打lol','但这种活动明显没有好处，甚至还有坏处',0),(211,5,'2017-09-04 16:04:02',15,'开始做完cf的virtual contest，学习正确的思路和代码','之后复习多线程',0),(212,5,'2017-09-04 17:25:19',15,'打cf感觉好难思考呀，打到一半就不想打了，没有勇气','睡眠不足吗？还装了lol',0),(213,5,'2017-09-04 21:32:19',15,'cf打得那么惨后，又跑去打lol，结果又被自己的操作惊呆了。最后退了两个微信群聊','慢慢等待，ai的出现，可能是本虚无这一生的主旋律了',0),(214,5,'2017-09-05 18:12:44',15,'看书看着看着又想撸管，于是强迫自己看完30页再说','撸管不应该有那么高的优先度',0),(215,5,'2017-09-06 15:44:50',15,'一直想着娱乐，好懦弱呀','想看动画，不想工作，写代码',0),(216,5,'2017-09-06 16:45:53',15,'我发现，编程写的没用代码，其实就跟小学数学似得，并不能满足我现实的需求','但我的心态要求代码有用，这个思想可能不怎么好',0),(217,5,'2017-09-07 17:25:06',15,'今天五点起床，吃速食面做早餐','今天的主题是完成java多线程一章',0),(218,5,'2017-09-07 21:24:30',15,'早起锻炼了一发，不够集中精神，而且现在对mind Anchor也不大上心了','rt',0),(219,5,'2017-09-08 17:33:12',15,'起床了，鼻子好塞','嗯，啥原因？',0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `premindenergytime` datetime NOT NULL,
  `premindenergy` int(11) NOT NULL,
  `maxmindenergy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'test1','aaa','2017-07-24 16:46:53','2017-08-10 13:12:01',100,100),(2,'vuce','fdfdf','2017-07-29 23:18:34','2017-07-29 15:18:00',100,0),(3,'nill','rrr','2017-07-29 23:20:40','2017-07-29 15:18:00',100,100),(4,'icchhp','111111','2017-08-10 06:49:17','2017-08-10 10:48:00',85,100),(5,'mind','mind','2017-08-10 10:13:55','2017-09-08 21:30:01',85,100),(6,'test','test','2017-08-31 23:11:32','2017-09-01 03:12:01',55,100);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-08 22:54:33
