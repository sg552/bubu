-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: bubu
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'兴趣培养',NULL,'\r\n','2012-03-15 15:10:58','2012-03-15 15:36:19');
INSERT INTO `categories` VALUES (4,'智力开发',NULL,'','2012-03-15 15:14:48','2012-03-15 15:14:48');
INSERT INTO `categories` VALUES (5,'情感培养',NULL,'','2012-03-15 15:15:01','2012-03-15 15:15:01');
INSERT INTO `categories` VALUES (6,'动手能力',NULL,'','2012-03-15 15:15:10','2012-03-15 15:15:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `generic_item_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,'323233','4234',NULL,4,'2012-03-13 15:46:38','2012-03-13 15:46:44');
INSERT INTO `comments` VALUES (5,'嗯哪。','挺好的',NULL,4,'2012-03-15 10:38:02','2012-03-15 10:38:02');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_items`
--

DROP TABLE IF EXISTS `generic_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `child_age_scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scores` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `tips` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `customer_gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_items`
--

LOCK TABLES `generic_items` WRITE;
/*!40000 ALTER TABLE `generic_items` DISABLE KEYS */;
INSERT INTO `generic_items` VALUES (1,'23','2323',32,'34','234','0','sadf','2012-03-12 15:58:11','2012-03-12 15:58:11',NULL);
INSERT INTO `generic_items` VALUES (2,'test 0313 with image ','',NULL,'','','0','','2012-03-13 08:38:49','2012-03-13 08:38:49',NULL);
INSERT INTO `generic_items` VALUES (3,'test 0313 with image2','',NULL,'','','0','','2012-03-13 08:42:04','2012-03-13 08:42:04',NULL);
INSERT INTO `generic_items` VALUES (4,'test 0313 with image -- very small origin','adfasdf33\r\n',2323,'','22~2','36','333','2012-03-13 09:25:40','2012-03-15 13:26:01','汉字');
INSERT INTO `generic_items` VALUES (5,'小飞机','asd',3,'bb','2','1','小飞机的小贴士','2012-03-15 09:29:45','2012-03-15 15:48:24','');
INSERT INTO `generic_items` VALUES (6,'小汽车','小汽车',3,'aabb','1','0','小盆友最喜欢的小汽车~','2012-03-15 15:38:48','2012-03-15 15:38:48','男孩');
INSERT INTO `generic_items` VALUES (7,'1岁男孩的小货车','1岁男孩的小货车',3,'ccc','1','0','1岁男孩的小货车 的TIPS','2012-03-15 15:49:16','2012-03-15 15:49:16','男');
INSERT INTO `generic_items` VALUES (8,'2岁男孩的气球','',3,'ddd','2','0','tips....','2012-03-15 15:49:48','2012-03-15 15:49:48','男孩');
INSERT INTO `generic_items` VALUES (11,'1岁的魔方','',4,'a2','1','0','tips...','2012-03-15 15:54:27','2012-03-15 15:54:27','男孩');
INSERT INTO `generic_items` VALUES (12,'4岁的魔方','',4,'','4','0','4岁的魔方','2012-03-15 15:54:54','2012-03-15 15:55:07','');
INSERT INTO `generic_items` VALUES (13,'7岁的九连环','',4,'','7','0','7岁的九连环','2012-03-15 15:55:25','2012-03-15 15:55:25','男孩');
INSERT INTO `generic_items` VALUES (14,'10岁的电脑','10岁的电脑',4,'','10','0','10岁的电脑','2012-03-15 15:55:54','2012-03-15 15:55:54','');
INSERT INTO `generic_items` VALUES (15,'13岁的变形金刚','13岁的变形金刚（不会在首页上显示）',4,'','13','0','13岁的变形金刚（不会在首页上显示）','2012-03-15 15:56:35','2012-03-15 17:45:36','男孩');
INSERT INTO `generic_items` VALUES (16,'5岁的魔方','',4,'','5','0','asdf','2012-03-15 17:43:24','2012-03-15 17:43:24','');
INSERT INTO `generic_items` VALUES (17,'8岁的皮球','',4,'','','0','','2012-03-15 17:43:42','2012-03-15 17:43:42','');
INSERT INTO `generic_items` VALUES (18,'11岁的玩具','',3,'','11','0','11岁的玩具','2012-03-15 17:44:00','2012-03-15 17:44:00','');
INSERT INTO `generic_items` VALUES (19,'6岁的太空飞船','',4,'','6','0','6岁的太空飞船','2012-03-15 17:44:38','2012-03-15 17:44:38','');
INSERT INTO `generic_items` VALUES (20,'12岁的文具盒(不会在首页上显示)','',4,'','12','0','12岁的文具盒12岁的文具盒12岁的文具盒','2012-03-15 17:45:03','2012-03-15 17:45:23','');
/*!40000 ALTER TABLE `generic_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generic_item_id` int(11) DEFAULT NULL,
  `itself_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itself_updated_at` datetime DEFAULT NULL,
  `itself_file_size` int(11) DEFAULT NULL,
  `itself_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,2,'image/jpeg','2012-03-13 10:13:01',113364,'brithday_cake_uml.jpg','2012-03-13 10:12:40','2012-03-13 10:13:02');
INSERT INTO `images` VALUES (4,4,'image/png','2012-03-13 13:12:47',354632,'acupuncture_points.PNG','2012-03-13 13:12:48','2012-03-13 13:12:48');
INSERT INTO `images` VALUES (5,4,'image/jpeg','2012-03-13 13:14:01',4511,'black_ball_kit.jpg','2012-03-13 13:14:02','2012-03-13 13:14:02');
INSERT INTO `images` VALUES (6,4,'image/png','2012-03-15 11:31:53',389080,'cat_cat.PNG','2012-03-15 11:31:56','2012-03-15 11:31:56');
INSERT INTO `images` VALUES (7,4,'image/png','2012-03-15 11:32:06',189407,'map2.PNG','2012-03-15 11:32:07','2012-03-15 11:32:07');
INSERT INTO `images` VALUES (8,4,'image/jpeg','2012-03-15 11:32:40',4688526,'IMG_4831.JPG','2012-03-15 11:32:54','2012-03-15 11:32:54');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rails_admin_histories`
--

DROP TABLE IF EXISTS `rails_admin_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rails_admin_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rails_admin_histories`
--

LOCK TABLES `rails_admin_histories` WRITE;
/*!40000 ALTER TABLE `rails_admin_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `rails_admin_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120312002959');
INSERT INTO `schema_migrations` VALUES ('20120312005037');
INSERT INTO `schema_migrations` VALUES ('20120312005038');
INSERT INTO `schema_migrations` VALUES ('20120312154956');
INSERT INTO `schema_migrations` VALUES ('20120312160102');
INSERT INTO `schema_migrations` VALUES ('20120313094052');
INSERT INTO `schema_migrations` VALUES ('20120313141221');
INSERT INTO `schema_migrations` VALUES ('20120313142120');
INSERT INTO `schema_migrations` VALUES ('20120314090950');
INSERT INTO `schema_migrations` VALUES ('20120315094008');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_items`
--

DROP TABLE IF EXISTS `specific_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `word_of_mouth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generic_item_id` int(11) DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_website_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_url` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_items`
--

LOCK TABLES `specific_items` WRITE;
/*!40000 ALTER TABLE `specific_items` DISABLE KEYS */;
INSERT INTO `specific_items` VALUES (1,'1212','1212','',21,'21','11','1212','2012-03-12 16:05:06','2012-03-12 16:05:06');
INSERT INTO `specific_items` VALUES (2,'33','22aa','中通',4,'乐高','淘宝','http://detail.tmall.com/item.htm?id=2224219795&cm_cat=50016771&_u=epc58k6880&source=dou','2012-03-14 08:44:29','2012-03-15 09:55:39');
INSERT INTO `specific_items` VALUES (3,'22','32','22',5,'2','a','as','2012-03-15 09:31:59','2012-03-15 09:31:59');
/*!40000 ALTER TABLE `specific_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sg552sg552@gmail.com','$2a$10$nrxvYkgQPFvCSt5zxtaiWOWrpgpzEBbm403w8XgwWN92PhF2OLJge',NULL,NULL,NULL,8,'2012-03-15 15:40:04','2012-03-15 14:11:01','192.168.56.1','192.168.56.1','2012-03-12 00:51:41','2012-03-15 15:40:04','admin');
INSERT INTO `users` VALUES (2,'haha@haha.com','$2a$10$KVCTMxPnSurngaN8.8mdtul6pX90UF6scEnWhljePeKVo4Njs4che',NULL,NULL,NULL,1,'2012-03-13 13:29:30','2012-03-13 13:29:30','192.168.56.1','192.168.56.1','2012-03-13 13:29:30','2012-03-13 13:29:30','user');
INSERT INTO `users` VALUES (3,'test0314@gmail.com','$2a$10$dTyaihUNOZdHT4YIXHt1nuqNvBrCFUJwHLj4wjKT2Ywpo/aZPvMma',NULL,NULL,NULL,1,'2012-03-14 10:08:55','2012-03-14 10:08:55','192.168.56.1','192.168.56.1','2012-03-14 10:08:55','2012-03-14 10:08:55','user');
INSERT INTO `users` VALUES (4,'test0314b@gmail.com','$2a$10$rP6DK3SDGNot.j0z/9p5Fuhmq2yiSOFwDXbhaqozpzco7kgUN2AeS',NULL,NULL,NULL,2,'2012-03-14 11:20:36','2012-03-14 10:40:17','192.168.56.1','192.168.56.1','2012-03-14 10:40:17','2012-03-14 11:20:36','user');
INSERT INTO `users` VALUES (5,'test0314c@gmail.com','$2a$10$TbtJfx0CO9eH/tNhQmqE0enWnMQHYvMnTbb4/VQdKugV.1hjJ7yPi',NULL,NULL,NULL,2,'2012-03-14 11:19:17','2012-03-14 10:42:20','192.168.56.1','192.168.56.1','2012-03-14 10:42:20','2012-03-14 11:19:17','user');
INSERT INTO `users` VALUES (6,'test0315@gmail.com','$2a$10$2xCNe3Teb9MiPPyopEqLy./4ktVYXvITu6aopfuUvqJ.ceOCFEF3i',NULL,NULL,NULL,1,'2012-03-15 14:15:31','2012-03-15 14:15:31','192.168.56.1','192.168.56.1','2012-03-15 14:15:31','2012-03-15 14:15:31','user');
INSERT INTO `users` VALUES (7,'admin@bubu.com','$2a$10$mQZiOm8Wx3/TFc5c6olGteCzm9u4UvPRUYLjUVEraNn9bhnvJSD4O',NULL,NULL,NULL,1,'2012-03-15 18:21:00','2012-03-15 18:21:00','192.168.56.1','192.168.56.1','2012-03-15 18:21:00','2012-03-15 18:21:00','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-16  2:22:04
