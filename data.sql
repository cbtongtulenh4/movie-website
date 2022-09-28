-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: moviewebsite
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baseentity`
--

DROP TABLE IF EXISTS `baseentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baseentity` (
  `DTYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enable` bit(1) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseentity`
--

LOCK TABLES `baseentity` WRITE;
/*!40000 ALTER TABLE `baseentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cm_content` text,
  `cm_created_on` datetime DEFAULT NULL,
  `cm_ep` int(11) DEFAULT NULL,
  `cm_name_user` varchar(255) DEFAULT NULL,
  `cm_like` int(11) DEFAULT NULL,
  `numSpam` int(11) DEFAULT NULL,
  `cm_path_image` varchar(255) DEFAULT NULL,
  `cm_parent_id` bigint(20) DEFAULT NULL,
  `cm_season_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1pjtp29ylmkw0bua6m9l5ft2e` (`cm_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'hi','2022-09-09 08:46:21',10,'cbtongtulenh4',0,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,10),(2,'ff','2022-09-09 11:17:23',1,'cbtongtulenh4',1,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,22),(3,'oái ảo thật đấy','2022-09-09 11:20:05',1,'cbtongtulenh4',0,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,22),(4,'oái ảo thật đấy','2022-09-09 11:48:15',1,'cbtongtulenh4',0,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,22),(5,'hello','2022-09-09 11:53:05',1,'cbtongtulenh4',0,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,22),(6,'hay vkl','2022-09-09 12:12:55',665,'cbtongtulenh4',0,0,'1kEExUBB46-Cl_o48jJ5CuohaIQg-R1x5',0,22);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5dhgnik9p8t72kaktdb8kd8dt` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'jp','Nhật Bản');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'uda-kounosuke','Uda Kounosuke'),(2,'ishitani-megumi','Ishitani Megumi'),(3,'shimizu-junji','Shimizu Junji'),(4,'kaizawa-yukio','Kaizawa Yukio'),(5,'takenouchi-kazuhisa','Takenouchi Kazuhisa'),(6,'hosoda-mamoru','Hosoda Mamoru'),(7,'cook-justin','Cook Justin'),(8,'oda-eiichiro','Oda Eiichiro'),(9,'itou-naoyuki','Itou Naoyuki'),(10,'miyamoto-hiroaki','Miyamoto Hiroaki'),(11,'nagamine-tatsuya','Nagamine Tatsuya'),(12,'taniguchi-gorou','Taniguchi Gorou');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtoken`
--

DROP TABLE IF EXISTS `emailtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `emailtoken` (
  `id` bigint(20) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_VERIFY_USER` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtoken`
--

LOCK TABLES `emailtoken` WRITE;
/*!40000 ALTER TABLE `emailtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_movie`
--

DROP TABLE IF EXISTS `favorite_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorite_movie` (
  `user_id` bigint(20) NOT NULL,
  `tvSeason_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`tvSeason_id`),
  KEY `FK8m498le4rtvmpv09q71k1456v` (`tvSeason_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
INSERT INTO `favorite_movie` VALUES (1,22),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,22);
/*!40000 ALTER TABLE `favorite_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (21);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'vietsub','VietSub');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,NULL,9.1,'http://cdn.animevietsub.cc/data/poster/2019/09/27/animevsub-sQCBqYz9ve.jpg','Đảo Hải Tặc - One Piece');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_cast` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_category`
--

DROP TABLE IF EXISTS `movie_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_category` (
  `movie_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`category_id`),
  KEY `FKhkem46gi7yq1019e1j8hlvp9y` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_category`
--

LOCK TABLES `movie_category` WRITE;
/*!40000 ALTER TABLE `movie_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_character`
--

DROP TABLE IF EXISTS `movie_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_character` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tvSeason_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5c77u7jikekdaw1lgf1eevrcf` (`tvSeason_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_character`
--

LOCK TABLES `movie_character` WRITE;
/*!40000 ALTER TABLE `movie_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_crew`
--

DROP TABLE IF EXISTS `movie_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_crew` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_crew`
--

LOCK TABLES `movie_crew` WRITE;
/*!40000 ALTER TABLE `movie_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_entity`
--

DROP TABLE IF EXISTS `movie_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` float DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_entity`
--

LOCK TABLES `movie_entity` WRITE;
/*!40000 ALTER TABLE `movie_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_form`
--

DROP TABLE IF EXISTS `movie_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_form`
--

LOCK TABLES `movie_form` WRITE;
/*!40000 ALTER TABLE `movie_form` DISABLE KEYS */;
INSERT INTO `movie_form` VALUES (1,'anime-le','anime le'),(2,'anime-bo','anime bo');
/*!40000 ALTER TABLE `movie_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_genres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_godgo0unc42uh62v0g3yc1fps` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` VALUES (1,'anime-bo','Anime bộ'),(2,'shounen','Shounen'),(3,'super-power','Super Power'),(4,'phep-thuat','Fantasy'),(5,'drama','Drama'),(6,'hai-huoc','Comedy'),(7,'phieu-luu','Adventure'),(8,'hanh-dong','Action'),(9,'anime-le','Anime lẻ'),(10,'phim-chieu-rap','Phim chiếu rạp'),(11,'anime-sap-chieu','Anime sắp chiếu');
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_movie_seasons`
--

DROP TABLE IF EXISTS `movie_movie_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_movie_seasons` (
  `MovieEntity_id` bigint(20) NOT NULL,
  `seasons_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mp7d9ibmwom2xdln7prtwdvwj` (`seasons_id`),
  KEY `FKbqfv2pxs030ypdwh63ho6yjl4` (`MovieEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_movie_seasons`
--

LOCK TABLES `movie_movie_seasons` WRITE;
/*!40000 ALTER TABLE `movie_movie_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_movie_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_season_test`
--

DROP TABLE IF EXISTS `movie_season_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_season_test` (
  `MovieEntity_id` bigint(20) NOT NULL,
  `seasons_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_clx9h6jldse7iurj8nnx89hfy` (`seasons_id`),
  KEY `FKd9wvalfec5bls2v6l5sje08cb` (`MovieEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_season_test`
--

LOCK TABLES `movie_season_test` WRITE;
/*!40000 ALTER TABLE `movie_season_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_season_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons`
--

DROP TABLE IF EXISTS `movie_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ageLimit` int(11) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `cost` float DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `newEpisode` int(11) DEFAULT NULL,
  `seasonNumber` int(11) DEFAULT NULL,
  `showtime` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `summary` text,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  `season_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_po3f92stelg6n9tv5cb8v7nbo` (`code`),
  KEY `FKl37fqk2wgbksr1cd5ajfafvui` (`country_id`),
  KEY `FKnqljtnqkjdbv1rx1mgp3f8h8` (`form_id`),
  KEY `FKhdnkr49t13y9fmopq6uidyv4v` (`movie_id`),
  KEY `FKfy26h4kcv8uwny6f3trkaxhtp` (`season_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons`
--

LOCK TABLES `movie_seasons` WRITE;
/*!40000 ALTER TABLE `movie_seasons` DISABLE KEYS */;
INSERT INTO `movie_seasons` VALUES (1,0,'one-piece-3d2y-ace-no-shi-wo-koete-luffy-nakama-tono-chikai-i3-a2077',25,0,68,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong trận Marineford (Tổng Bộ Hải Quân), Luffy đau khổ khi mất đi người anh trai của mình – Ace và cậu nhận ra rằng mình còn những người đồng đội (nakama). Để vượt qua nỗi buồn và quyết tâm mạnh hơn nữa để bảo vệ đồng đội mình, cậu đã nhờ Rayleigh chỉ bảo và dạy cậu cách để mạnh hơn. Quá trình tập luyện của Luffy kéo dài 2 năm tại đảo Rusukaina. Một tên hải tặc khét tiếng tên Budy World (do tác giả Eiichiro Oda tự tay thiết kế) còn được biết đến với biệt danh “Kẻ Hủy Diệt Thế Giới” bị nhốt ở tầng 6 Impel Down – nhà tù lớn nhất thế giới, Budy World ăn trái ác quỷ Moa Moa (More-More: hơn nữa), nhưng không may là Budy World đã trốn thoát ra được. Một cuộc triệu tập khẩn cấp giữa Chính Quyền Thế Giới và Thất Vũ Hải về mức nguy hiểm của Budy World khi trốn ngục. Budy World đã nhắm đến mục tiêu là Boa Hancock, Budy World bắt giữ Boa Hancock để thực hiện 1 âm mưu đen tối của mình. Luffy sẽ được luyện tập cùng Rayleigh. Cũng như Luffy và Boa Hancock sẽ cùng nhau chống lại Budy World. Ngoài những nhân vật đã kể xuất hiện trong bộ đặc biệt này như Luffy, Rayleigh, Boa Hancock thì còn có thêm những nhân vật khác có mặt trong tập anime đặc biệt này như Mihawk, Perona, Buggy, Mr.3, Akainu…','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-Mps2RfaveU.jpg','One Piece 3D2Y: Ace no shi wo Koete! Luffy Nakama Tono Chikai','Cjp08BZnl-E',71879,1,1,1,18),(2,0,'one-piece-movie-5-norowareta-seiken-i3-a2061',25,0,19,NULL,NULL,NULL,'Trọn bộ HD VietSub','Luffy và phi hành đoàn đi đến hòn đảo Asuka để tìm kiếm một thanh kiếm huyền thoại đắt giá nhất hành tinh mặc dù nó chứa một lời nguyền chết người và một kho báu giá trị. Khi trở lại, cả nhóm phát hiện ra Zoro – người được giao nhiệm vụ trông tàu đã mất tích và bất ngờ bị lính thủy tấn công.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-cRbdfAZ3fG.jpg','One Piece Movie 5: Norowareta Seiken','1v66USnVnPs',52229,1,1,1,8),(3,0,'one-piece-adventure-of-nebulandia-i3-a2080',25,0,33,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong tập phim này đặc biệt này, nhóm Mũ Rơm sẽ lại chiến đấu với băng hải tặc Foxy tại Tân Thế Giới, trên một hòn đảo mang tên Nebulandia. Trong khi Zoro và Sanji đang thi thố ăn uống thì họ ăn phải một loại nấm vô dụng nên trở lên lười nhác, và cuối cùng bị tống vào một chiếc lồng. Toàn bộ kế hoạch đều do một tay quân sư tài ba Komei (nhân vật ngoại truyện) bố trí, nhằm mục đích tiêu hao sức mạnh của băng Mũ Rơm. Thủy thủ đoàn băng Mũ Rơm đã lần theo dấu vết để đi cứu đồng đội, nhưng cuối cùng lại rơi vào một miền đất lạ lẫm có tên là \"Nelulandia\", nơi quanh năm bao phủ bởi sương mù của biển, khiến cho năng lực Trái Ác Quỷ trở nên vô dụng. Thật không may đối với băng Mũ Rơm, họ đã bị tấn công bởi chiến lược tinh anh của nhà quân sư tài ba kia. Liệu băng Mũ Rơm có an toàn thoát khỏi hòn đảo kỳ bí này hay không? Nguồn : Vuighe','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-70pz3gOeM3.jpg','One Piece: Adventure of Nebulandia','qxMA4tvKD94',1340524,1,1,1,20),(4,0,'one-piece-movie-4-dead-end-no-bouken-i3-a9',25,0,36,NULL,NULL,NULL,'Trọn bộ HD VietSub','Nhóm Luffy có cuộc hành trính tới bến cảng Anabaru. Tại đây đang tổ chức một cuộc thi mà người chiến thắng sẽ có được một món tiền thưởng rất lớn nếu như giành vị trí quán quân. Nami vô cùng phấn khích và đã quyết định tham gia cuộc thi này.','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-5448.jpg','One Piece Movie 4: Dead End no Bouken','I4oOj_6kGYc',96770,1,1,1,6),(5,0,'one-piece-episode-of-sorajima-i1-a3209',25,0,45,NULL,NULL,NULL,'Trọn bộ HD VietSub','Cốt truyện xoay quanh băng Mũ Rơm trên đường đến đảo Skypeia. Sau khi tình cờ có vài manh mối về đảo trên trời, băng Mũ Rơm đã dừng chân tại đảo Jaya và vô tình gặp gỡ \"Râu Đen\" Marshall D. Teach - một kẻ cũng có tham vọng làm Vua Hải Tặc.Với sự giúp đỡ của Montblanc Cricket và Liên hợp quân núi khỉ đã đưa băng Mũ Rơm lên trên trời thành công. Sau khi lên đến đảo trên trời Skypie, băng Mũ Rơm đã vướng vào cuộc chiến tranh giành quyền làm chủ hòn đảo giữa hai tộc người Skypie và Shandia. Enel, kẻ sở hữu sức mạnh của sấm sét là người đứng đầu bên Skypie. Luffy đã đánh bại Enel và cứu Skypie khỏi thảm họa diệt vọng, cuộc chiến kết thúc.','http://cdn.animevietsub.cc/data/poster/2018/09/03/animevsub-DpjvHefjvl.jpg','One Piece: Episode of Sorajima',NULL,4383233,1,1,1,24),(6,0,'one-piece-episode-of-merry-mou-hitori-no-nakama-no-monogatari-i3-a2076',25,0,30,NULL,NULL,NULL,'Trọn bộ HD VietSub','Tập phim chia tay thuyền Merry đầy nước mắt của băng nhóm hải tặc mũ rơm','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-bRdwOYjSaN.jpg','One Piece: Episode of Merry - Mou Hitori no Nakama no Monogatari',NULL,4070233,1,1,1,17),(7,0,'one-piece-film-gold-i3-a2069',25,0,298,NULL,NULL,NULL,'Trọn bộ HD VietSub','Movie 2016 của phim One Piece Film: Gold ......','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-vOZC2Kljvj.jpg','One Piece Film: Gold','_shEgcWHC2U',246958,1,1,1,21),(8,0,'one-piece-movie-9-episode-of-chopper-plus-fuyu-ni-saku-kiseki-no-sakura-i3-a2065',25,0,5,NULL,NULL,NULL,'Trọn bộ HD VietSub','Đây là bộ phim thứ chín của seri phim One Piece Movie. Tập phim kể lại câu chuyện gia nhập băng Mũ Rơm của Tony Chopper dưới sự lãnh đạo của Luffy. Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue và rồi tiến đến Grand Line. Cậu theo dấu chân của vị vua hải tặc quá cố, Gol D. Roger, chu du từ đảo này sang đảo khác để đến với kho báu vĩ đại One Piece. Mỗi thành viên trong nhóm đều có 1 quá khứ rất đặc biệt và đáng buồn. Ngoài khả năng đặc biệt trong công việc của mình, bất cứ thành viên nào cũng có khả năng chiến đấu rất tốt.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-sFCVWEGfBy.jpg','One Piece Movie 9: Episode of Chopper Plus - Fuyu ni Saku, Kiseki no Sakura','OAlfN-VbGJI',44577,1,1,1,13),(9,0,'one-piece-nenmatsu-tokubetsu-kikaku-mugiwara-no-luffy-oyabun-torimonochou-i3-a2073',25,0,32,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong một thế giới thực tại khác tương tự như thời kỳ Edo Nhật Bản, Luffy hoạt động như một thành viên của cảnh sát. Điều này được tạo thành từ hai cuộc phiêu lưu: trong lần đầu tiên, Buggy làm cho rắc rối trong thị trấn; trong lần thứ hai, một cô gái bí ẩn tên Vivi xuất hiện. Điều này đặc biệt có một số khách mời từ các nhân vật trong suốt toàn bộ series. (phát sóng sau Episode 253) đặc biệt này có chứa một số khách mời từ các nhân vật trong suốt toàn bộ series. Một cặp thứ hai của tập phim đã được phát sóng sau khi tập phim 290, tiếp tục câu chuyện này, như là một phần của đặc biệt của năm mới.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-MNxVXzezKh.jpg','One Piece: Nenmatsu Tokubetsu Kikaku! Mugiwara no Luffy Oyabun Torimonochou',NULL,38019,1,1,1,10),(10,0,'one-piece-3d-mugiwara-chase-i3-a2067',25,0,8,NULL,NULL,NULL,'Trọn bộ HD VietSub','Movie 3D của One Piece Câu chuyện kể về một hải tặc già, một con chó ăn được trái ác quỷ tori tori, một thuyền trưởng bị lấy trộm mất chiếc mũ rơm, một kiếm khách đi lạc đường…..Xem rồi rõ','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-cbj9LHN3AQ.jpg','One Piece 3D: Mugiwara Chase',NULL,51589,1,1,1,15),(11,0,'one-piece-film-strong-world-i3-a2066',25,0,171,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau 2 năm ở Impel - Shiki đã trốn thoát bằng cách tự cắt đứt chân mình, sau đó hắn thay chân bằng 2 thanh gươm yêu quí - thành ra \"Golden Leo\" có 2 chân là 2 thanh gươm...< Sau cuộc đào tẩu làm chấn động thế giới, Shiki lại bất ngờ biến mất sau cuộc gặp với \"Râu Trắng\". Và hình ảnh cuối cùng mà ta biết đó là hắn đang ở trên một hòn đảo kì lạ với những sinh vật dị thường, chuẩn bị cho 1 kế hoạch 20 năm - \"Alright, I\'ll activate the plan 20 years from now on!!! I\'ll create the Hell on Earth !!\" 20 năm đã trôi qua kể từ ngày ấy... Một hải tặc trẻ tuổi mang tên Monkey.D.Luffy đã ra đời ...','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-CNpO1Fp0IE.jpg','One Piece Film: Strong World','3n58UPvcD7I',138363,1,2,1,14),(12,0,'one-piece-movie-7-karakuri-jou-no-mecha-kyohei-i3-a2063',25,0,23,NULL,NULL,NULL,'Trọn bộ HD VietSub','Nhóm Luffy nhặt được một chiếc hòm lạ và...','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-Kh6MZFqu9v.jpg','One Piece Movie 7: Karakuri-jou no Mecha Kyohei','P7soCjGOP14',60628,1,2,1,11),(13,0,'one-piece-movie-14-stampede-a3756',25,0,663,NULL,NULL,NULL,'Trọn bộ HD VietSub','Cuộc trưng bày lớn nhất thế giới về những tên cướp biển, bởi những tên cướp biển, dành cho những tên cướp biển — Lễ hội Cướp biển. Luffy và các thành viên còn lại của băng Mũ Rơm nhận được lời mời từ chủ nhà Buena Festa, người được mệnh danh là Bậc thầy của Lễ hội. Họ đến để tìm một địa điểm với đầy những gian hàng lộng lẫy và nhiều tên cướp biển, bao gồm cả những kẻ thuộc Thế hệ tồi tệ nhất. Nơi có điện.','http://cdn.animevietsub.cc/data/poster/2020/08/19/animevsub-A9wsds8aMB.jpg','Vua Hải Tặc: Lễ Hội Hải Tặc','_VI_72j_ErI',3556824,1,2,1,25),(14,0,'one-piece-movie-1-i3-a6',0,0,113,NULL,NULL,NULL,'Trọn bộ HD VietSub','Một tên cướp biển được gọi là Great vàng Pirate Woonan, người thu được gần 1/3 vàng của thế giới. Trong suốt một vài năm, sự tồn tại của tên cướp biển đã bị mờ, và một truyền thuyết lớn rằng ông biến mất với vàng của mình tới một hòn đảo xa xôi, những tên cướp biển tiếp tục tìm kiếm. Trên tàu Going Merry, Luffy và phi hành đoàn của mình, bị bỏ đói và trong lúc thiếu thận trọng họ bị cướp kho báu. Trong một nỗ lực để có được nó trở lại, họ phá hoại tàu nơi nghỉ ngơi, được hướng dẫn bởi một cậu bé tên là Tabio, người là một phần của băng hải tặc bắt giữ El Drago. Tình yêu El Drago với vàng đã khiến anh ta để tìm hòn đảo của Woonan, và nhờ vào bản đồ kho báu của Woonan, ông tìm thấy nó. Trong thời gian này, phi hành đoàn của Luffy đã được tách ra, và mặc dù hoàn cảnh riêng của họ, họ phải tìm cách ngăn chặn El Drago lấy đi vàng của Woonan.','http://cdn.animevietsub.cc/data/poster/2017/08/05/animevsub-poster-7780.jpg','One Piece Movie 1','eEApDotghec',215669,1,2,1,2),(15,0,'one-piece-movie-3-chinjuu-jima-no-chopper-oukoku-i2-a8',0,0,20,NULL,NULL,NULL,'Trọn bộ HD VietSub','Băng hải tặc tới được Đảo Crown, động vật ở đây có thể nói và chúng đưa Chopper lên làm vị vua mới. Thế nhưng một toán thợ săn đang truy lùng chiếc sừng huyền thoại có thể mang lại sức mạnh to lớn cho người ăn được nó. Luffy và các bạn của cậu phải ngăn chặn không cho chúng phá hủy vương quốc động vật này','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-2420.jpg','One Piece Movie 3: Chinjuu-jima no Chopper Oukoku','K65OpdS3Hsk',76726,1,2,1,5),(16,0,'one-piece-oounabara-ni-hirake-dekkai-dekkai-chichi-no-yume-i3-a2071',0,0,29,NULL,NULL,NULL,'Trọn bộ SD VietSub','Câu chuyện bắt đầu vào tàu Pirate Zap, nơi hai đồng đội của mình, Bonnie và Max, mệt mỏi và muốn thoát ra, nhưng tiếc là họ không có tiền. Ba trẻ em đang bị giam giữ trên tàu nghe lỏm họ. Người lớn nhất, Amanda, người là cha là một thợ săn kho báu chuyên nghiệp, biết được nơi của một kho tàng lớn, và cung cấp cho họ một thỏa thuận. Nếu họ giúp họ đưa ra một lối thoát sạch, họ có thể mất tất cả các kho báu mà họ muốn. Họ đồng ý, và năm người họ hầu như không thoát ra và làm cho nó vào một hòn đảo nhỏ, nơi họ gặp Luffy và phi hành đoàn của ông. Đáng tiếc là họ đã theo đuổi và Luffy và Amanda bị bắt và mang về cho ông chủ của họ, người đứng đầu của Pirates Bayan, cũng là sau khi các kho báu. Bây giờ Luffy và những người khác phải chiến đấu với hải tặc Bayan và tìm thấy những kho báu mà cha của Amanda đã để lại cho con cái của mình. Amanda, người đã luôn bực bội phiêu lưu và kho báu vì cha cô đã liên tục đi tìm kiếm cho nó, cuối cùng hiểu được cảm xúc của mình.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-uzGU1wHuzm.jpg','One Piece: Oounabara ni Hirake! Dekkai Dekkai Chichi no Yume!',NULL,77291,1,2,1,6),(17,0,'one-piece-film-red-a4484',0,0,498,NULL,NULL,NULL,'Tập PV','One Piece Film: Red là bộ phim hoạt hình anime của Nhật Bản thuộc thể loại kỳ ảo, hành động-phiêu lưu được sản xuất bởi Toei Animation. Đây là phần phim thứ mười lăm trong loạt phim điện ảnh của One Piece, dựa trên bộ truyện manga nổi tiếng cùng tên của tác giả Eiichiro Oda. Phim được công bố lần đầu tiên vào ngày 21 tháng 11, 2021 để kỷ niệm sự ra mắt của tập phim thứ 1000 của bộ anime One Piece và sau khi tập phim này được phát sóng, đoạn quảng cáo và áp phích chính thức của phim cũng chính thức được công bố. Phim dự kiến sẽ phát hành vào ngày 6 tháng 8 năm 2022. Bộ phim được giới thiệu sẽ là hành trình xoay quanh một nhân vật nữ mới cùng với Shanks \"Tóc Đỏ\".','http://cdn.animevietsub.cc/data/poster/2022/08/04/animevsub-0PY6DPdY7W.jpg','One Piece Film: Red','YAN45KAL5lg',1162517,1,2,1,26),(18,0,'one-piece-episode-of-sabo-3-kyoudai-no-kizuna-kiseki-no-saikai-to-uketsugareru-ishi-i3-a2078',0,0,95,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau 2 năm luyện tập, Băng Mũ Rơm đã hẹn cùng nhau hội ngộ tại Quần Đảo Sabaody. Họ vượt qua Đảo Người Cá và tiến đến Tân Thế Giới. Địa điểm đầu tiên sau khi qua Tân Thế Giới là Punk Hazard, tại đây họ gặp lại Trafalgar Law – thuyền trưởng băng hải tặc Heart. Trafalgar Law đề nghị với Luffy rằng 2 băng hải tặc sẽ liên minh với nhau để hạ bệ Tứ Hoàng, và việc đầu tiên để có thể hạ bệ Kaido – 1 trong các Tứ Hoàng, đó chính là tấn công Doflamingo. Họ đã đến Vương Quốc Dressrosa do Doflamingo cai trị. Nhưng 1 sự việc không lường trước, 1 cuộc thi ở Đấu Trường với phần thưởng là trái Mera-Mera mà Portgas D. Ace (anh kết nghĩa của Luffy), cũng chính là cái bẫy của Doflamingo sắp đặt sẵn. Luffy giả dạng để đi thi đấu với cái tên Lucy. Chính vào lúc đó, Ông Lính Chì đã chỉ ra “mặt tối” của Dressrosa cho mọi người thấy. Ông Lính Chì chỉ huy đội quân Người Tí Hon để giải cứu bạn bè của Người Tí Hon cũng như chống lại Doflamingo. Sau khi Luffy thi đấu qua vòng bảng, cậu bất ngờ khi người đứng trước mặt cậu lại là Sabo, người anh trai kết nghĩa khác mà cậu ngỡ anh ấy đã chết từ lâu… Phim sẽ không chỉ xoay quanh những kỉ niệm về thời thơ ấu của cả 3 nhân vật này mà sẽ còn lan sang cả những tình tiết về cuộc đoàn tụ giữa Luffy cùng Ace, tới lúc Ace bị xử tử và cả khi năng lực trái Mera Mera của Ace được trao cho Sabo.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-eiF9RNLiJs.jpg','One Piece: Episode of Sabo - 3 Kyoudai no Kizuna Kiseki no Saikai to Uketsugareru Ishi','mSnLj7DYKMw',4340695,1,2,1,19),(19,0,'one-piece-umi-no-heso-no-daibouken-hen-i3-a2070',0,0,26,NULL,NULL,NULL,'Trọn bộ SD VietSub','Special thứ nhất của One Piece.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-EaQ1HnhzYw.jpg','One Piece: Umi no Heso no Daibouken-hen',NULL,82989,1,2,1,3),(20,0,'one-piece-movie-8-episode-of-alabasta-sabaku-no-oujo-to-kaizoku-tachi-i3-a2064',0,0,12,NULL,NULL,NULL,'Trọn bộ HD VietSub','Luffy và băng Mũ Rơm giúp đỡ công chúa Vivi giải cứu đất nước đang chìm trong nội chiến của cô. Tất cả đều do một tay Crocodile – một DF user rất mạnh và tổ chức Baroque Works của hắn gây ra. Liệu họ có chống lại được Crocodile hùng mạnh hay không?','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-stUzG1qMra.jpg','One Piece Movie 8: Episode of Alabasta - Sabaku no Oujo to Kaizoku-tachi','tE6lEcnyJEE',46114,1,2,1,12),(21,0,'one-piece-episode-of-east-blue-luffy-to-4-nin-no-nakama-no-daibouken-a3603',0,0,40,NULL,NULL,NULL,'Trọn bộ HD VietSub','Kể về hành trình đáng nhớ của Luffy với 4 người đồng đội đầu tiên, Zoro, Usopp, Sanji và Nami.','http://cdn.animevietsub.cc/data/poster/2019/08/24/animevsub-qVyBxkFVkq.jpg','One Piece: Episode of East Blue - Luffy to 4-nin no Nakama no Daibouken',NULL,4097416,1,2,1,23),(22,0,'i1-vua-hai-tac-a1',0,0,72517,NULL,NULL,NULL,'Phim đang chiếu/Cập Nhật Tập 1030 VietSub','Đảo Hải Tặc - One Piece là chuyện về cậu bé Monkey D. Luffy do ăn nhầm Trái Ác Quỷ, bị biến thành người cao su và sẽ không bao giờ biết bơi. 10 năm sau sự việc đó, cậu rời quê mình và kiếm đủ 10 thành viên để thành một băng hải tặc, biệt hiệu Hải tặc Mũ Rơm. Khi đó của phiêu lưu tìm kiếm kho báu One Piece bắt đầu. Trong cuộc phiêu lưu tìm kiếm One Piece, băng Hải tặc mũ rơm phải chiến đấu với nhiều băng hải tặc xấu khác cũng muốn độc chiếm One Piece và Hải quân của Chính phủ muốn diệt trừ hải tặc. Băng Hải tặc Mũ Rơm phải trải qua biết bao nhiêu khó khăn, không lùi bước với ước mơ \"Trở thành Vua Hải Tặc và chiếm được kho báu One Piece\".','http://cdn.animevietsub.cc/data/poster/2019/09/27/animevsub-sQCBqYz9ve.jpg','Đảo Hải Tặc - One Piece','l_98K4_6UQ0',55863256,1,NULL,1,1),(23,0,'one-piece-movie-6-omatsuri-danshaku-to-himitsu-no-shima-i2-a2062',0,0,30,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau khi nhận được lời mời bí ẩn từ đảo Omatsuri, nhóm Luffy không thể khước từ những ngày thư giãn và giải trí ở đây. Nhưng ít họ biết, để tận hưởng những ngày thư giãn này, họ phải tuân theo các quy tắc của Baron Omatsuri và tham gia vào cuộc thử thách địa ngục. Nhưng liệu nó có đáng giá? Luffy có vẻ suy nghĩ như vậy ... Trên đảo Omatsuri , một cuộc gặp gỡ giữa một gia đình Hải Tặc và một cựu thuyền trưởng cướp biể vừa làm sáng tỏ một vài bí ẩn. Và nó gây ra sự quan tâm từ Robin. Đảo Omatsuri là nơi đặc thù của hoa Lily và hoa cẩm chướng. Mũ Rơm được nhắc nhở về tầm quan trọng của một tình bạn thực sự khi lòng trung thành không còn.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-LtwLR8UqaS.jpg','One Piece Movie 6: Omatsuri Danshaku to Himitsu no Shima','NVt5Gsy9VKU',58896,1,NULL,1,9),(24,0,'one-piece-film-z-i3-a2068',0,0,266,NULL,NULL,NULL,'Trọn bộ HD VietSub','Át chủ bài của Hải quân, Viên đá Daina - được so sánh ngang hàng với Vũ khí Cổ đại, đột nhiên bị lấy cắp! Và người đàn ông có sức mạnh kinh hoàng, cựu Đô Đốc Hải Quân \'Z\' sẽ là kẻ chặn đường băng Mũ Rơm! Tổng bộ Hải Quân cuối cùng cũng tiến tới việc đối phó với âm mưu đe dọa phá huỷ các End Point (Điểm Kết Thúc) tại Tân Thế Giới. Ở nơi khác, Aokiji gặp mặt băng Mũ Rơm. Và cuối cùng, Luffy và đồng đội của mình tiến lên chống lại Z và sức mạnh kinh ngạc của hắn.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-xY1tT8eCR3.jpg','One Piece Film: Z','1gGt1Mg_zSo',241046,1,NULL,1,16),(25,0,'one-piece-heart-of-gold-i3-a2079',0,0,44,NULL,NULL,NULL,'Trọn bộ HD VietSub','Tập đặc biệt giới thiệu cho One Piece Film Gold chiếu rạp vào ngày 23/07/2016 ở Nhật, Tesoro đang truy tìm một kho báu bí ẩn tên là \"Vàng Nguyên Chất\". Băng Mũ Rơm vô tình gặp được một cô gái biết vị trí cất giấu kho báu bí ẩn đó, nên họ quyết định tiến thẳng đến nơi cất giấu kho báu bí ẩn - hòn đảo huyền thoại Arukemi.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-PFOak36teZ.jpg','One Piece: Heart of Gold',NULL,87985,1,NULL,1,22),(26,0,'one-piece-mamore-saigo-no-dai-butai-i3-a2072',0,0,21,NULL,NULL,NULL,'Trọn bộ SD VietSub','Trong nhiều năm, Ex-Marine Trung Randolph và đoàn kịch của ông đã đưa ra một trò chơi trên chiếc tàu của mình. Sau khi bị mất gia đình của mình để cướp biển, Randolph muốn đưa vào vở kịch mà sẽ cung cấp cho sự can đảm cho những người cũng đã mất đi những người thân yêu của họ để những tên cướp biển. Thật không may, Randolph phải nghỉ hưu sớm và hiện tại anh đang làm hiệu suất cuối cùng của ông. Luffy và phi hành đoàn của ông đến xem vở kịch, và bằng cách nào đó quản lý để tham gia vào bản thân mình. Nhưng quá khứ từ Randolph đến một cấp dưới báo thù, với một kế hoạch diabolical người cuối cùng đã trở thành chỉ huy để chụp Randolph. Luffy và đồng đội của mình bây giờ phải chứng minh với mọi người rằng không phải tất cả những tên cướp biển là cặn bã, và bảo vệ hiệu suất tạm biệt cuối cùng của Randolph từ người chỉ huy đắng. (phát sóng sau tập 174)','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-SbM07dfyPQ.jpg','One Piece: Mamore! Saigo no Dai Butai',NULL,39022,1,NULL,1,7),(27,0,'one-piece-movie-2-nejimaki-jima-no-daibouken-i3-a7',0,0,42,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong khi băng hải tặc Mũ Rơm đang thưởng thức một ngày ấm áp tại bãi biển, thuyền của họ - Going Merry, đã bị đánh cắp. Họ không thể làm gì ngoài việc đứng nhìn, trong khi chiếc thuyền biến mất vào khoảng không. Khi đuổi theo chiếc thuyền, họ đụng phải Băng Cướp Anh Em, những kẻ có ý định đánh cắp chiếc Đồng Hồ Kim Cương trên Đảo Clockwork để trở thành băng cướp vĩ đại nhất. Sau đó, họ còn đụng độ băng hải tặc Anh Em nhà Trump, một nhóm gồm nhiều hải tặc nguy hiểm với thủ lĩnh của chúng, Bear King, kẻ đang có ý định trở thành vua hải tặc. Sau khi Nami bị bắt cóc, băng Mũ Rơm đã đi tới đảo Clockwork và thách đấu băng Anh Em nhà Trump, một trận chiến tuyệt vời tại lâu đài Trump đã diễn ra. Liệu băng hải tặc Mũ Rơm có chiến thắng và tìm lại chiếc thuyền của mình? Mời các bạn theo dõi bộ phim.','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-2897.jpg','One Piece Movie 2: Nejimaki-jima no Daibouken','wwumv_IcxJo',92177,1,NULL,1,4);
/*!40000 ALTER TABLE `movie_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_comments`
--

DROP TABLE IF EXISTS `movie_seasons_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_comments` (
  `TVSeasonEntity_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  PRIMARY KEY (`TVSeasonEntity_id`,`comments_id`),
  UNIQUE KEY `UK_o93ak2ayljiw05l6sei5pj51l` (`comments_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_comments`
--

LOCK TABLES `movie_seasons_comments` WRITE;
/*!40000 ALTER TABLE `movie_seasons_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_seasons_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_director`
--

DROP TABLE IF EXISTS `movie_seasons_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_director` (
  `tvSeasons_id` bigint(20) NOT NULL,
  `directors_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeasons_id`,`directors_id`),
  KEY `FKf3p0398klk8a3rydxane0nynx` (`directors_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_director`
--

LOCK TABLES `movie_seasons_director` WRITE;
/*!40000 ALTER TABLE `movie_seasons_director` DISABLE KEYS */;
INSERT INTO `movie_seasons_director` VALUES (1,9),(2,5),(3,1),(4,1),(7,10),(12,1),(14,3),(15,3),(17,12),(19,4),(20,7),(22,1),(22,2),(23,6),(24,8),(25,11),(27,3);
/*!40000 ALTER TABLE `movie_seasons_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_languages`
--

DROP TABLE IF EXISTS `movie_seasons_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_languages` (
  `tvSeasons_id` bigint(20) NOT NULL,
  `languages_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeasons_id`,`languages_id`),
  KEY `FKiodcyip4n93d78i36sw9d00xq` (`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_languages`
--

LOCK TABLES `movie_seasons_languages` WRITE;
/*!40000 ALTER TABLE `movie_seasons_languages` DISABLE KEYS */;
INSERT INTO `movie_seasons_languages` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1);
/*!40000 ALTER TABLE `movie_seasons_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_movie_cast`
--

DROP TABLE IF EXISTS `movie_seasons_movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_movie_cast` (
  `tvSeasons_id` bigint(20) NOT NULL,
  `cast_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeasons_id`,`cast_id`),
  KEY `FKpoup6mc21cie0i5xwn9oaeetp` (`cast_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_movie_cast`
--

LOCK TABLES `movie_seasons_movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_seasons_movie_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_seasons_movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_movie_genres`
--

DROP TABLE IF EXISTS `movie_seasons_movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_movie_genres` (
  `tvSeasons_id` bigint(20) NOT NULL,
  `genres_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeasons_id`,`genres_id`),
  KEY `FK2ox78qb31pdmx7vp6pk63aly6` (`genres_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_movie_genres`
--

LOCK TABLES `movie_seasons_movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_seasons_movie_genres` DISABLE KEYS */;
INSERT INTO `movie_seasons_movie_genres` VALUES (1,2),(1,4),(1,6),(1,7),(1,9),(2,2),(2,3),(2,4),(2,6),(2,7),(2,8),(2,9),(3,2),(3,3),(3,4),(3,6),(3,7),(3,8),(3,9),(4,2),(4,3),(4,4),(4,6),(4,7),(4,8),(4,9),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(7,2),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(8,2),(8,3),(8,4),(8,6),(8,7),(8,8),(8,9),(9,2),(9,4),(9,6),(9,7),(9,9),(10,2),(10,4),(10,6),(10,7),(10,8),(10,9),(11,2),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(12,2),(12,4),(12,6),(12,7),(12,9),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(14,2),(14,3),(14,4),(14,6),(14,7),(14,8),(14,9),(15,2),(15,3),(15,4),(15,6),(15,7),(15,8),(15,9),(16,2),(16,3),(16,4),(16,6),(16,7),(16,8),(16,9),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,11),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(19,2),(19,3),(19,4),(19,6),(19,7),(19,8),(19,9),(20,2),(20,4),(20,7),(20,8),(20,9),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(23,2),(23,4),(23,6),(23,7),(23,9),(24,2),(24,4),(24,5),(24,6),(24,7),(24,8),(24,9),(25,2),(25,4),(25,5),(25,6),(25,7),(25,8),(25,9),(26,2),(26,4),(26,6),(26,7),(26,9),(27,2),(27,3),(27,4),(27,6),(27,7),(27,8),(27,9);
/*!40000 ALTER TABLE `movie_seasons_movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_rating`
--

DROP TABLE IF EXISTS `movie_seasons_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_rating` (
  `tvSeasons_id` bigint(20) NOT NULL,
  `ratings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeasons_id`,`ratings_id`),
  KEY `FKrplp1qbfeuqrmf84bldu5nfpn` (`ratings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_rating`
--

LOCK TABLES `movie_seasons_rating` WRITE;
/*!40000 ALTER TABLE `movie_seasons_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_seasons_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_studio`
--

DROP TABLE IF EXISTS `movie_seasons_studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_studio` (
  `tvSeason_id` bigint(20) NOT NULL,
  `studios_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tvSeason_id`,`studios_id`),
  KEY `FKhqnxcbdb750jkslldlgjp3g23` (`studios_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_studio`
--

LOCK TABLES `movie_seasons_studio` WRITE;
/*!40000 ALTER TABLE `movie_seasons_studio` DISABLE KEYS */;
INSERT INTO `movie_seasons_studio` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1);
/*!40000 ALTER TABLE `movie_seasons_studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paid_movie`
--

DROP TABLE IF EXISTS `paid_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paid_movie` (
  `user_id` bigint(20) NOT NULL,
  `tvSeason_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`tvSeason_id`),
  KEY `FKsyqqesukokuxg55pca849pq19` (`tvSeason_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paid_movie`
--

LOCK TABLES `paid_movie` WRITE;
/*!40000 ALTER TABLE `paid_movie` DISABLE KEYS */;
INSERT INTO `paid_movie` VALUES (1,1),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,10);
/*!40000 ALTER TABLE `paid_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (19,18,'1sI67eqrA7w5TW8MaXoskumE6TZ9YeTO2','NewYork','cbtongtulenh4@gmail.com','male','saab');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_movie`
--

DROP TABLE IF EXISTS `quality_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quality_movie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_movie`
--

LOCK TABLES `quality_movie` WRITE;
/*!40000 ALTER TABLE `quality_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `tvSeason_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmrteih7x5aidaugd3evoo49s8` (`tvSeason_id`),
  KEY `FKkkc94w4qh1lbimfym26iwhhnf` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,1,10,19),(2,5,22,19);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user','USER'),(2,'admin','ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_genre`
--

DROP TABLE IF EXISTS `season_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `season_genre` (
  `season_id` bigint(20) NOT NULL,
  `genre_id` bigint(20) NOT NULL,
  PRIMARY KEY (`season_id`,`genre_id`),
  KEY `FK3ov009xxcqmr8di6eq8cbkenv` (`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_genre`
--

LOCK TABLES `season_genre` WRITE;
/*!40000 ALTER TABLE `season_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_rating`
--

DROP TABLE IF EXISTS `season_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `season_rating` (
  `season_id` bigint(20) NOT NULL,
  `rating_id` bigint(20) NOT NULL,
  PRIMARY KEY (`season_id`,`rating_id`),
  KEY `FKc7gb8iv3g83t8ubhrk684iyn3` (`rating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_rating`
--

LOCK TABLES `season_rating` WRITE;
/*!40000 ALTER TABLE `season_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `season_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_grx5e8qs7mo7foqsmmau2s02x` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'autumn-1999','Mùa Thu',1999),(2,'winter-2000','Mùa Đông',2000),(3,'autumn-2000','Mùa Thu',2000),(4,'winter-2001','Mùa Đông',2001),(5,'winter-2002','Mùa Đông',2002),(6,'spring-2003','Mùa Xuân',2003),(7,'autumn-2003','Mùa Thu',2003),(8,'winter-2004','Mùa Đông',2004),(9,'winter-2005','Mùa Đông',2005),(10,'autumn-2005','Mùa Thu',2005),(11,'winter-2006','Mùa Đông',2006),(12,'summer-2007','Mùa Hạ',2007),(13,'winter-2008','Mùa Đông',2008),(14,'autumn-2009','Mùa Thu',2009),(15,'winter-2011','Mùa Đông',2011),(16,'autumn-2012','Mùa Thu',2012),(17,'summer-2013','Mùa Hạ',2013),(18,'summer-2014','Mùa Hạ',2014),(19,'summer-2015','Mùa Hạ',2015),(20,'autumn-2015','Mùa Thu',2015),(21,'autumn-2016','Mùa Thu',2016),(22,'summer-2016','Mùa Hạ',2016),(23,'autumn-2017','Mùa Thu',2017),(24,'summer-2018','Mùa Hạ',2018),(25,'spring-2019','Mùa Xuân',2019),(26,'summer-2022','Mùa Hạ',2022);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `studio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i1qpw79bdr8le9iqf59knvs1f` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'toei-animation','Toei Animation');
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtitle`
--

DROP TABLE IF EXISTS `subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subtitle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtitle`
--

LOCK TABLES `subtitle` WRITE;
/*!40000 ALTER TABLE `subtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_episodes`
--

DROP TABLE IF EXISTS `tv_episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_episodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numEp` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `runtime` float DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tvSeason_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgchae7fhov0f0oar9v2b5ibp6` (`tvSeason_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_episodes`
--

LOCK TABLES `tv_episodes` WRITE;
/*!40000 ALTER TABLE `tv_episodes` DISABLE KEYS */;
INSERT INTO `tv_episodes` VALUES (1,1,'DiUKh_MjsI0',0,NULL,NULL,1),(2,1,'DiUKh_MjsI0',0,NULL,NULL,2),(3,1,'DiUKh_MjsI0',0,NULL,NULL,3),(4,1,'DiUKh_MjsI0',0,NULL,NULL,4),(5,1,'DiUKh_MjsI0',0,NULL,NULL,5),(6,1,'DiUKh_MjsI0',0,NULL,NULL,6),(7,1,'DiUKh_MjsI0',0,NULL,NULL,7),(8,1,'DiUKh_MjsI0',0,NULL,NULL,8),(9,1,'DiUKh_MjsI0',0,NULL,NULL,9),(10,1,'DiUKh_MjsI0',0,NULL,NULL,10),(11,1,'DiUKh_MjsI0',0,NULL,NULL,11),(12,1,'DiUKh_MjsI0',0,NULL,NULL,12),(13,1,'DiUKh_MjsI0',0,NULL,NULL,13),(14,1,'DiUKh_MjsI0',0,NULL,NULL,14),(15,1,'DiUKh_MjsI0',0,NULL,NULL,15),(16,1,'DiUKh_MjsI0',0,NULL,NULL,16),(17,1,'DiUKh_MjsI0',0,NULL,NULL,17),(18,1,'DiUKh_MjsI0',0,NULL,NULL,18),(19,1,'DiUKh_MjsI0',0,NULL,NULL,19),(20,1,'DiUKh_MjsI0',0,NULL,NULL,20),(21,1,'DiUKh_MjsI0',0,NULL,NULL,21),(22,1,'DiUKh_MjsI0',0,NULL,NULL,22),(23,2,'DiUKh_MjsI0',0,NULL,NULL,22),(24,3,'DiUKh_MjsI0',0,NULL,NULL,22),(25,4,'DiUKh_MjsI0',0,NULL,NULL,22),(26,5,'DiUKh_MjsI0',0,NULL,NULL,22),(27,6,'DiUKh_MjsI0',0,NULL,NULL,22),(28,7,'DiUKh_MjsI0',0,NULL,NULL,22),(29,8,'DiUKh_MjsI0',0,NULL,NULL,22),(30,9,'DiUKh_MjsI0',0,NULL,NULL,22),(31,10,'DiUKh_MjsI0',0,NULL,NULL,22),(32,11,'DiUKh_MjsI0',0,NULL,NULL,22),(33,12,'DiUKh_MjsI0',0,NULL,NULL,22),(34,13,'DiUKh_MjsI0',0,NULL,NULL,22),(35,14,'DiUKh_MjsI0',0,NULL,NULL,22),(36,15,'DiUKh_MjsI0',0,NULL,NULL,22),(37,16,'DiUKh_MjsI0',0,NULL,NULL,22),(38,17,'DiUKh_MjsI0',0,NULL,NULL,22),(39,18,'DiUKh_MjsI0',0,NULL,NULL,22),(40,19,'DiUKh_MjsI0',0,NULL,NULL,22),(41,20,'DiUKh_MjsI0',0,NULL,NULL,22),(42,21,'DiUKh_MjsI0',0,NULL,NULL,22),(43,22,'DiUKh_MjsI0',0,NULL,NULL,22),(44,23,'DiUKh_MjsI0',0,NULL,NULL,22),(45,24,'DiUKh_MjsI0',0,NULL,NULL,22),(46,25,'DiUKh_MjsI0',0,NULL,NULL,22),(47,26,'DiUKh_MjsI0',0,NULL,NULL,22),(48,27,'DiUKh_MjsI0',0,NULL,NULL,22),(49,28,'DiUKh_MjsI0',0,NULL,NULL,22),(50,29,'DiUKh_MjsI0',0,NULL,NULL,22),(51,30,'DiUKh_MjsI0',0,NULL,NULL,22),(52,31,'DiUKh_MjsI0',0,NULL,NULL,22),(53,32,'DiUKh_MjsI0',0,NULL,NULL,22),(54,33,'DiUKh_MjsI0',0,NULL,NULL,22),(55,34,'DiUKh_MjsI0',0,NULL,NULL,22),(56,35,'DiUKh_MjsI0',0,NULL,NULL,22),(57,36,'DiUKh_MjsI0',0,NULL,NULL,22),(58,37,'DiUKh_MjsI0',0,NULL,NULL,22),(59,38,'DiUKh_MjsI0',0,NULL,NULL,22),(60,39,'DiUKh_MjsI0',0,NULL,NULL,22),(61,40,'DiUKh_MjsI0',0,NULL,NULL,22),(62,41,'DiUKh_MjsI0',0,NULL,NULL,22),(63,42,'DiUKh_MjsI0',0,NULL,NULL,22),(64,43,'DiUKh_MjsI0',0,NULL,NULL,22),(65,44,'DiUKh_MjsI0',0,NULL,NULL,22),(66,45,'DiUKh_MjsI0',0,NULL,NULL,22),(67,46,'DiUKh_MjsI0',0,NULL,NULL,22),(68,47,'DiUKh_MjsI0',0,NULL,NULL,22),(69,48,'DiUKh_MjsI0',0,NULL,NULL,22),(70,49,'DiUKh_MjsI0',0,NULL,NULL,22),(71,50,'DiUKh_MjsI0',0,NULL,NULL,22),(72,51,'DiUKh_MjsI0',0,NULL,NULL,22),(73,52,'DiUKh_MjsI0',0,NULL,NULL,22),(74,53,'DiUKh_MjsI0',0,NULL,NULL,22),(75,54,'DiUKh_MjsI0',0,NULL,NULL,22),(76,55,'DiUKh_MjsI0',0,NULL,NULL,22),(77,56,'DiUKh_MjsI0',0,NULL,NULL,22),(78,57,'DiUKh_MjsI0',0,NULL,NULL,22),(79,58,'DiUKh_MjsI0',0,NULL,NULL,22),(80,59,'DiUKh_MjsI0',0,NULL,NULL,22),(81,60,'DiUKh_MjsI0',0,NULL,NULL,22),(82,61,'DiUKh_MjsI0',0,NULL,NULL,22),(83,62,'DiUKh_MjsI0',0,NULL,NULL,22),(84,63,'DiUKh_MjsI0',0,NULL,NULL,22),(85,64,'DiUKh_MjsI0',0,NULL,NULL,22),(86,65,'DiUKh_MjsI0',0,NULL,NULL,22),(87,66,'DiUKh_MjsI0',0,NULL,NULL,22),(88,67,'DiUKh_MjsI0',0,NULL,NULL,22),(89,68,'DiUKh_MjsI0',0,NULL,NULL,22),(90,69,'DiUKh_MjsI0',0,NULL,NULL,22),(91,70,'DiUKh_MjsI0',0,NULL,NULL,22),(92,71,'DiUKh_MjsI0',0,NULL,NULL,22),(93,72,'DiUKh_MjsI0',0,NULL,NULL,22),(94,73,'DiUKh_MjsI0',0,NULL,NULL,22),(95,74,'DiUKh_MjsI0',0,NULL,NULL,22),(96,75,'DiUKh_MjsI0',0,NULL,NULL,22),(97,76,'DiUKh_MjsI0',0,NULL,NULL,22),(98,77,'DiUKh_MjsI0',0,NULL,NULL,22),(99,78,'DiUKh_MjsI0',0,NULL,NULL,22),(100,79,'DiUKh_MjsI0',0,NULL,NULL,22),(101,80,'DiUKh_MjsI0',0,NULL,NULL,22),(102,81,'DiUKh_MjsI0',0,NULL,NULL,22),(103,82,'DiUKh_MjsI0',0,NULL,NULL,22),(104,83,'DiUKh_MjsI0',0,NULL,NULL,22),(105,84,'DiUKh_MjsI0',0,NULL,NULL,22),(106,85,'DiUKh_MjsI0',0,NULL,NULL,22),(107,86,'DiUKh_MjsI0',0,NULL,NULL,22),(108,87,'DiUKh_MjsI0',0,NULL,NULL,22),(109,88,'DiUKh_MjsI0',0,NULL,NULL,22),(110,89,'DiUKh_MjsI0',0,NULL,NULL,22),(111,90,'DiUKh_MjsI0',0,NULL,NULL,22),(112,91,'DiUKh_MjsI0',0,NULL,NULL,22),(113,92,'DiUKh_MjsI0',0,NULL,NULL,22),(114,93,'DiUKh_MjsI0',0,NULL,NULL,22),(115,94,'DiUKh_MjsI0',0,NULL,NULL,22),(116,95,'DiUKh_MjsI0',0,NULL,NULL,22),(117,96,'DiUKh_MjsI0',0,NULL,NULL,22),(118,97,'DiUKh_MjsI0',0,NULL,NULL,22),(119,98,'DiUKh_MjsI0',0,NULL,NULL,22),(120,99,'DiUKh_MjsI0',0,NULL,NULL,22),(121,100,'DiUKh_MjsI0',0,NULL,NULL,22),(122,101,'DiUKh_MjsI0',0,NULL,NULL,22),(123,102,'DiUKh_MjsI0',0,NULL,NULL,22),(124,103,'DiUKh_MjsI0',0,NULL,NULL,22),(125,104,'DiUKh_MjsI0',0,NULL,NULL,22),(126,105,'DiUKh_MjsI0',0,NULL,NULL,22),(127,106,'DiUKh_MjsI0',0,NULL,NULL,22),(128,107,'DiUKh_MjsI0',0,NULL,NULL,22),(129,108,'DiUKh_MjsI0',0,NULL,NULL,22),(130,109,'DiUKh_MjsI0',0,NULL,NULL,22),(131,110,'DiUKh_MjsI0',0,NULL,NULL,22),(132,111,'DiUKh_MjsI0',0,NULL,NULL,22),(133,112,'DiUKh_MjsI0',0,NULL,NULL,22),(134,113,'DiUKh_MjsI0',0,NULL,NULL,22),(135,114,'DiUKh_MjsI0',0,NULL,NULL,22),(136,115,'DiUKh_MjsI0',0,NULL,NULL,22),(137,116,'DiUKh_MjsI0',0,NULL,NULL,22),(138,117,'DiUKh_MjsI0',0,NULL,NULL,22),(139,118,'DiUKh_MjsI0',0,NULL,NULL,22),(140,119,'DiUKh_MjsI0',0,NULL,NULL,22),(141,120,'DiUKh_MjsI0',0,NULL,NULL,22),(142,121,'DiUKh_MjsI0',0,NULL,NULL,22),(143,122,'DiUKh_MjsI0',0,NULL,NULL,22),(144,123,'DiUKh_MjsI0',0,NULL,NULL,22),(145,124,'DiUKh_MjsI0',0,NULL,NULL,22),(146,125,'DiUKh_MjsI0',0,NULL,NULL,22),(147,126,'DiUKh_MjsI0',0,NULL,NULL,22),(148,127,'DiUKh_MjsI0',0,NULL,NULL,22),(149,128,'DiUKh_MjsI0',0,NULL,NULL,22),(150,129,'DiUKh_MjsI0',0,NULL,NULL,22),(151,130,'DiUKh_MjsI0',0,NULL,NULL,22),(152,131,'DiUKh_MjsI0',0,NULL,NULL,22),(153,132,'DiUKh_MjsI0',0,NULL,NULL,22),(154,133,'DiUKh_MjsI0',0,NULL,NULL,22),(155,134,'DiUKh_MjsI0',0,NULL,NULL,22),(156,135,'DiUKh_MjsI0',0,NULL,NULL,22),(157,136,'DiUKh_MjsI0',0,NULL,NULL,22),(158,137,'DiUKh_MjsI0',0,NULL,NULL,22),(159,138,'DiUKh_MjsI0',0,NULL,NULL,22),(160,139,'DiUKh_MjsI0',0,NULL,NULL,22),(161,140,'DiUKh_MjsI0',0,NULL,NULL,22),(162,141,'DiUKh_MjsI0',0,NULL,NULL,22),(163,142,'DiUKh_MjsI0',0,NULL,NULL,22),(164,143,'DiUKh_MjsI0',0,NULL,NULL,22),(165,144,'DiUKh_MjsI0',0,NULL,NULL,22),(166,145,'DiUKh_MjsI0',0,NULL,NULL,22),(167,146,'DiUKh_MjsI0',0,NULL,NULL,22),(168,147,'DiUKh_MjsI0',0,NULL,NULL,22),(169,148,'DiUKh_MjsI0',0,NULL,NULL,22),(170,149,'DiUKh_MjsI0',0,NULL,NULL,22),(171,150,'DiUKh_MjsI0',0,NULL,NULL,22),(172,151,'DiUKh_MjsI0',0,NULL,NULL,22),(173,152,'DiUKh_MjsI0',0,NULL,NULL,22),(174,153,'DiUKh_MjsI0',0,NULL,NULL,22),(175,154,'DiUKh_MjsI0',0,NULL,NULL,22),(176,155,'DiUKh_MjsI0',0,NULL,NULL,22),(177,156,'DiUKh_MjsI0',0,NULL,NULL,22),(178,157,'DiUKh_MjsI0',0,NULL,NULL,22),(179,158,'DiUKh_MjsI0',0,NULL,NULL,22),(180,159,'DiUKh_MjsI0',0,NULL,NULL,22),(181,160,'DiUKh_MjsI0',0,NULL,NULL,22),(182,161,'DiUKh_MjsI0',0,NULL,NULL,22),(183,162,'DiUKh_MjsI0',0,NULL,NULL,22),(184,163,'DiUKh_MjsI0',0,NULL,NULL,22),(185,164,'DiUKh_MjsI0',0,NULL,NULL,22),(186,165,'DiUKh_MjsI0',0,NULL,NULL,22),(187,166,'DiUKh_MjsI0',0,NULL,NULL,22),(188,167,'DiUKh_MjsI0',0,NULL,NULL,22),(189,168,'DiUKh_MjsI0',0,NULL,NULL,22),(190,169,'DiUKh_MjsI0',0,NULL,NULL,22),(191,170,'DiUKh_MjsI0',0,NULL,NULL,22),(192,171,'DiUKh_MjsI0',0,NULL,NULL,22),(193,172,'DiUKh_MjsI0',0,NULL,NULL,22),(194,173,'DiUKh_MjsI0',0,NULL,NULL,22),(195,174,'DiUKh_MjsI0',0,NULL,NULL,22),(196,175,'DiUKh_MjsI0',0,NULL,NULL,22),(197,176,'DiUKh_MjsI0',0,NULL,NULL,22),(198,177,'DiUKh_MjsI0',0,NULL,NULL,22),(199,178,'DiUKh_MjsI0',0,NULL,NULL,22),(200,179,'DiUKh_MjsI0',0,NULL,NULL,22),(201,180,'DiUKh_MjsI0',0,NULL,NULL,22),(202,181,'DiUKh_MjsI0',0,NULL,NULL,22),(203,182,'DiUKh_MjsI0',0,NULL,NULL,22),(204,183,'DiUKh_MjsI0',0,NULL,NULL,22),(205,184,'DiUKh_MjsI0',0,NULL,NULL,22),(206,185,'DiUKh_MjsI0',0,NULL,NULL,22),(207,186,'DiUKh_MjsI0',0,NULL,NULL,22),(208,187,'DiUKh_MjsI0',0,NULL,NULL,22),(209,188,'DiUKh_MjsI0',0,NULL,NULL,22),(210,189,'DiUKh_MjsI0',0,NULL,NULL,22),(211,190,'DiUKh_MjsI0',0,NULL,NULL,22),(212,191,'DiUKh_MjsI0',0,NULL,NULL,22),(213,192,'DiUKh_MjsI0',0,NULL,NULL,22),(214,193,'DiUKh_MjsI0',0,NULL,NULL,22),(215,194,'DiUKh_MjsI0',0,NULL,NULL,22),(216,195,'DiUKh_MjsI0',0,NULL,NULL,22),(217,196,'DiUKh_MjsI0',0,NULL,NULL,22),(218,197,'DiUKh_MjsI0',0,NULL,NULL,22),(219,198,'DiUKh_MjsI0',0,NULL,NULL,22),(220,199,'DiUKh_MjsI0',0,NULL,NULL,22),(221,200,'DiUKh_MjsI0',0,NULL,NULL,22),(222,201,'DiUKh_MjsI0',0,NULL,NULL,22),(223,202,'DiUKh_MjsI0',0,NULL,NULL,22),(224,203,'DiUKh_MjsI0',0,NULL,NULL,22),(225,204,'DiUKh_MjsI0',0,NULL,NULL,22),(226,205,'DiUKh_MjsI0',0,NULL,NULL,22),(227,206,'DiUKh_MjsI0',0,NULL,NULL,22),(228,207,'DiUKh_MjsI0',0,NULL,NULL,22),(229,208,'DiUKh_MjsI0',0,NULL,NULL,22),(230,209,'DiUKh_MjsI0',0,NULL,NULL,22),(231,210,'DiUKh_MjsI0',0,NULL,NULL,22),(232,211,'DiUKh_MjsI0',0,NULL,NULL,22),(233,212,'DiUKh_MjsI0',0,NULL,NULL,22),(234,213,'DiUKh_MjsI0',0,NULL,NULL,22),(235,214,'DiUKh_MjsI0',0,NULL,NULL,22),(236,215,'DiUKh_MjsI0',0,NULL,NULL,22),(237,216,'DiUKh_MjsI0',0,NULL,NULL,22),(238,217,'DiUKh_MjsI0',0,NULL,NULL,22),(239,218,'DiUKh_MjsI0',0,NULL,NULL,22),(240,219,'DiUKh_MjsI0',0,NULL,NULL,22),(241,220,'DiUKh_MjsI0',0,NULL,NULL,22),(242,221,'DiUKh_MjsI0',0,NULL,NULL,22),(243,222,'DiUKh_MjsI0',0,NULL,NULL,22),(244,223,'DiUKh_MjsI0',0,NULL,NULL,22),(245,224,'DiUKh_MjsI0',0,NULL,NULL,22),(246,225,'DiUKh_MjsI0',0,NULL,NULL,22),(247,226,'DiUKh_MjsI0',0,NULL,NULL,22),(248,227,'DiUKh_MjsI0',0,NULL,NULL,22),(249,228,'DiUKh_MjsI0',0,NULL,NULL,22),(250,229,'DiUKh_MjsI0',0,NULL,NULL,22),(251,230,'DiUKh_MjsI0',0,NULL,NULL,22),(252,231,'DiUKh_MjsI0',0,NULL,NULL,22),(253,232,'DiUKh_MjsI0',0,NULL,NULL,22),(254,233,'DiUKh_MjsI0',0,NULL,NULL,22),(255,234,'DiUKh_MjsI0',0,NULL,NULL,22),(256,235,'DiUKh_MjsI0',0,NULL,NULL,22),(257,236,'DiUKh_MjsI0',0,NULL,NULL,22),(258,237,'DiUKh_MjsI0',0,NULL,NULL,22),(259,238,'DiUKh_MjsI0',0,NULL,NULL,22),(260,239,'DiUKh_MjsI0',0,NULL,NULL,22),(261,240,'DiUKh_MjsI0',0,NULL,NULL,22),(262,241,'DiUKh_MjsI0',0,NULL,NULL,22),(263,242,'DiUKh_MjsI0',0,NULL,NULL,22),(264,243,'DiUKh_MjsI0',0,NULL,NULL,22),(265,244,'DiUKh_MjsI0',0,NULL,NULL,22),(266,245,'DiUKh_MjsI0',0,NULL,NULL,22),(267,246,'DiUKh_MjsI0',0,NULL,NULL,22),(268,247,'DiUKh_MjsI0',0,NULL,NULL,22),(269,248,'DiUKh_MjsI0',0,NULL,NULL,22),(270,249,'DiUKh_MjsI0',0,NULL,NULL,22),(271,250,'DiUKh_MjsI0',0,NULL,NULL,22),(272,251,'DiUKh_MjsI0',0,NULL,NULL,22),(273,252,'DiUKh_MjsI0',0,NULL,NULL,22),(274,253,'DiUKh_MjsI0',0,NULL,NULL,22),(275,254,'DiUKh_MjsI0',0,NULL,NULL,22),(276,255,'DiUKh_MjsI0',0,NULL,NULL,22),(277,256,'DiUKh_MjsI0',0,NULL,NULL,22),(278,257,'DiUKh_MjsI0',0,NULL,NULL,22),(279,258,'DiUKh_MjsI0',0,NULL,NULL,22),(280,259,'DiUKh_MjsI0',0,NULL,NULL,22),(281,260,'DiUKh_MjsI0',0,NULL,NULL,22),(282,261,'DiUKh_MjsI0',0,NULL,NULL,22),(283,262,'DiUKh_MjsI0',0,NULL,NULL,22),(284,263,'DiUKh_MjsI0',0,NULL,NULL,22),(285,264,'DiUKh_MjsI0',0,NULL,NULL,22),(286,265,'DiUKh_MjsI0',0,NULL,NULL,22),(287,266,'DiUKh_MjsI0',0,NULL,NULL,22),(288,267,'DiUKh_MjsI0',0,NULL,NULL,22),(289,268,'DiUKh_MjsI0',0,NULL,NULL,22),(290,269,'DiUKh_MjsI0',0,NULL,NULL,22),(291,270,'DiUKh_MjsI0',0,NULL,NULL,22),(292,271,'DiUKh_MjsI0',0,NULL,NULL,22),(293,272,'DiUKh_MjsI0',0,NULL,NULL,22),(294,273,'DiUKh_MjsI0',0,NULL,NULL,22),(295,274,'DiUKh_MjsI0',0,NULL,NULL,22),(296,275,'DiUKh_MjsI0',0,NULL,NULL,22),(297,276,'DiUKh_MjsI0',0,NULL,NULL,22),(298,277,'DiUKh_MjsI0',0,NULL,NULL,22),(299,278,'DiUKh_MjsI0',0,NULL,NULL,22),(300,279,'DiUKh_MjsI0',0,NULL,NULL,22),(301,280,'DiUKh_MjsI0',0,NULL,NULL,22),(302,281,'DiUKh_MjsI0',0,NULL,NULL,22),(303,282,'DiUKh_MjsI0',0,NULL,NULL,22),(304,283,'DiUKh_MjsI0',0,NULL,NULL,22),(305,284,'DiUKh_MjsI0',0,NULL,NULL,22),(306,285,'DiUKh_MjsI0',0,NULL,NULL,22),(307,286,'DiUKh_MjsI0',0,NULL,NULL,22),(308,287,'DiUKh_MjsI0',0,NULL,NULL,22),(309,288,'DiUKh_MjsI0',0,NULL,NULL,22),(310,289,'DiUKh_MjsI0',0,NULL,NULL,22),(311,290,'DiUKh_MjsI0',0,NULL,NULL,22),(312,291,'DiUKh_MjsI0',0,NULL,NULL,22),(313,292,'DiUKh_MjsI0',0,NULL,NULL,22),(314,293,'DiUKh_MjsI0',0,NULL,NULL,22),(315,294,'DiUKh_MjsI0',0,NULL,NULL,22),(316,295,'DiUKh_MjsI0',0,NULL,NULL,22),(317,296,'DiUKh_MjsI0',0,NULL,NULL,22),(318,297,'DiUKh_MjsI0',0,NULL,NULL,22),(319,298,'DiUKh_MjsI0',0,NULL,NULL,22),(320,299,'DiUKh_MjsI0',0,NULL,NULL,22),(321,300,'DiUKh_MjsI0',0,NULL,NULL,22),(322,301,'DiUKh_MjsI0',0,NULL,NULL,22),(323,302,'DiUKh_MjsI0',0,NULL,NULL,22),(324,303,'DiUKh_MjsI0',0,NULL,NULL,22),(325,304,'DiUKh_MjsI0',0,NULL,NULL,22),(326,305,'DiUKh_MjsI0',0,NULL,NULL,22),(327,306,'DiUKh_MjsI0',0,NULL,NULL,22),(328,307,'DiUKh_MjsI0',0,NULL,NULL,22),(329,308,'DiUKh_MjsI0',0,NULL,NULL,22),(330,309,'DiUKh_MjsI0',0,NULL,NULL,22),(331,310,'DiUKh_MjsI0',0,NULL,NULL,22),(332,311,'DiUKh_MjsI0',0,NULL,NULL,22),(333,312,'DiUKh_MjsI0',0,NULL,NULL,22),(334,313,'DiUKh_MjsI0',0,NULL,NULL,22),(335,314,'DiUKh_MjsI0',0,NULL,NULL,22),(336,315,'DiUKh_MjsI0',0,NULL,NULL,22),(337,316,'DiUKh_MjsI0',0,NULL,NULL,22),(338,317,'DiUKh_MjsI0',0,NULL,NULL,22),(339,318,'DiUKh_MjsI0',0,NULL,NULL,22),(340,319,'DiUKh_MjsI0',0,NULL,NULL,22),(341,320,'DiUKh_MjsI0',0,NULL,NULL,22),(342,321,'DiUKh_MjsI0',0,NULL,NULL,22),(343,322,'DiUKh_MjsI0',0,NULL,NULL,22),(344,323,'DiUKh_MjsI0',0,NULL,NULL,22),(345,324,'DiUKh_MjsI0',0,NULL,NULL,22),(346,325,'DiUKh_MjsI0',0,NULL,NULL,22),(347,326,'DiUKh_MjsI0',0,NULL,NULL,22),(348,327,'DiUKh_MjsI0',0,NULL,NULL,22),(349,328,'DiUKh_MjsI0',0,NULL,NULL,22),(350,329,'DiUKh_MjsI0',0,NULL,NULL,22),(351,330,'DiUKh_MjsI0',0,NULL,NULL,22),(352,331,'DiUKh_MjsI0',0,NULL,NULL,22),(353,332,'DiUKh_MjsI0',0,NULL,NULL,22),(354,333,'DiUKh_MjsI0',0,NULL,NULL,22),(355,334,'DiUKh_MjsI0',0,NULL,NULL,22),(356,335,'DiUKh_MjsI0',0,NULL,NULL,22),(357,336,'DiUKh_MjsI0',0,NULL,NULL,22),(358,337,'DiUKh_MjsI0',0,NULL,NULL,22),(359,338,'DiUKh_MjsI0',0,NULL,NULL,22),(360,339,'DiUKh_MjsI0',0,NULL,NULL,22),(361,340,'DiUKh_MjsI0',0,NULL,NULL,22),(362,341,'DiUKh_MjsI0',0,NULL,NULL,22),(363,342,'DiUKh_MjsI0',0,NULL,NULL,22),(364,343,'DiUKh_MjsI0',0,NULL,NULL,22),(365,344,'DiUKh_MjsI0',0,NULL,NULL,22),(366,345,'DiUKh_MjsI0',0,NULL,NULL,22),(367,346,'DiUKh_MjsI0',0,NULL,NULL,22),(368,347,'DiUKh_MjsI0',0,NULL,NULL,22),(369,348,'DiUKh_MjsI0',0,NULL,NULL,22),(370,349,'DiUKh_MjsI0',0,NULL,NULL,22),(371,350,'DiUKh_MjsI0',0,NULL,NULL,22),(372,351,'DiUKh_MjsI0',0,NULL,NULL,22),(373,352,'DiUKh_MjsI0',0,NULL,NULL,22),(374,353,'DiUKh_MjsI0',0,NULL,NULL,22),(375,354,'DiUKh_MjsI0',0,NULL,NULL,22),(376,355,'DiUKh_MjsI0',0,NULL,NULL,22),(377,356,'DiUKh_MjsI0',0,NULL,NULL,22),(378,357,'DiUKh_MjsI0',0,NULL,NULL,22),(379,358,'DiUKh_MjsI0',0,NULL,NULL,22),(380,359,'DiUKh_MjsI0',0,NULL,NULL,22),(381,360,'DiUKh_MjsI0',0,NULL,NULL,22),(382,361,'DiUKh_MjsI0',0,NULL,NULL,22),(383,362,'DiUKh_MjsI0',0,NULL,NULL,22),(384,363,'DiUKh_MjsI0',0,NULL,NULL,22),(385,364,'DiUKh_MjsI0',0,NULL,NULL,22),(386,365,'DiUKh_MjsI0',0,NULL,NULL,22),(387,366,'DiUKh_MjsI0',0,NULL,NULL,22),(388,367,'DiUKh_MjsI0',0,NULL,NULL,22),(389,368,'DiUKh_MjsI0',0,NULL,NULL,22),(390,369,'DiUKh_MjsI0',0,NULL,NULL,22),(391,370,'DiUKh_MjsI0',0,NULL,NULL,22),(392,371,'DiUKh_MjsI0',0,NULL,NULL,22),(393,372,'DiUKh_MjsI0',0,NULL,NULL,22),(394,373,'DiUKh_MjsI0',0,NULL,NULL,22),(395,374,'DiUKh_MjsI0',0,NULL,NULL,22),(396,375,'DiUKh_MjsI0',0,NULL,NULL,22),(397,376,'DiUKh_MjsI0',0,NULL,NULL,22),(398,377,'DiUKh_MjsI0',0,NULL,NULL,22),(399,378,'DiUKh_MjsI0',0,NULL,NULL,22),(400,379,'DiUKh_MjsI0',0,NULL,NULL,22),(401,380,'DiUKh_MjsI0',0,NULL,NULL,22),(402,381,'DiUKh_MjsI0',0,NULL,NULL,22),(403,382,'DiUKh_MjsI0',0,NULL,NULL,22),(404,383,'DiUKh_MjsI0',0,NULL,NULL,22),(405,384,'DiUKh_MjsI0',0,NULL,NULL,22),(406,385,'DiUKh_MjsI0',0,NULL,NULL,22),(407,386,'DiUKh_MjsI0',0,NULL,NULL,22),(408,387,'DiUKh_MjsI0',0,NULL,NULL,22),(409,388,'DiUKh_MjsI0',0,NULL,NULL,22),(410,389,'DiUKh_MjsI0',0,NULL,NULL,22),(411,390,'DiUKh_MjsI0',0,NULL,NULL,22),(412,391,'DiUKh_MjsI0',0,NULL,NULL,22),(413,392,'DiUKh_MjsI0',0,NULL,NULL,22),(414,393,'DiUKh_MjsI0',0,NULL,NULL,22),(415,394,'DiUKh_MjsI0',0,NULL,NULL,22),(416,395,'DiUKh_MjsI0',0,NULL,NULL,22),(417,396,'DiUKh_MjsI0',0,NULL,NULL,22),(418,397,'DiUKh_MjsI0',0,NULL,NULL,22),(419,398,'DiUKh_MjsI0',0,NULL,NULL,22),(420,399,'DiUKh_MjsI0',0,NULL,NULL,22),(421,400,'DiUKh_MjsI0',0,NULL,NULL,22),(422,401,'DiUKh_MjsI0',0,NULL,NULL,22),(423,402,'DiUKh_MjsI0',0,NULL,NULL,22),(424,403,'DiUKh_MjsI0',0,NULL,NULL,22),(425,404,'DiUKh_MjsI0',0,NULL,NULL,22),(426,405,'DiUKh_MjsI0',0,NULL,NULL,22),(427,406,'DiUKh_MjsI0',0,NULL,NULL,22),(428,407,'DiUKh_MjsI0',0,NULL,NULL,22),(429,408,'DiUKh_MjsI0',0,NULL,NULL,22),(430,409,'DiUKh_MjsI0',0,NULL,NULL,22),(431,410,'DiUKh_MjsI0',0,NULL,NULL,22),(432,411,'DiUKh_MjsI0',0,NULL,NULL,22),(433,412,'DiUKh_MjsI0',0,NULL,NULL,22),(434,413,'DiUKh_MjsI0',0,NULL,NULL,22),(435,414,'DiUKh_MjsI0',0,NULL,NULL,22),(436,415,'DiUKh_MjsI0',0,NULL,NULL,22),(437,416,'DiUKh_MjsI0',0,NULL,NULL,22),(438,417,'DiUKh_MjsI0',0,NULL,NULL,22),(439,418,'DiUKh_MjsI0',0,NULL,NULL,22),(440,419,'DiUKh_MjsI0',0,NULL,NULL,22),(441,420,'DiUKh_MjsI0',0,NULL,NULL,22),(442,421,'DiUKh_MjsI0',0,NULL,NULL,22),(443,422,'DiUKh_MjsI0',0,NULL,NULL,22),(444,423,'DiUKh_MjsI0',0,NULL,NULL,22),(445,424,'DiUKh_MjsI0',0,NULL,NULL,22),(446,425,'DiUKh_MjsI0',0,NULL,NULL,22),(447,426,'DiUKh_MjsI0',0,NULL,NULL,22),(448,427,'DiUKh_MjsI0',0,NULL,NULL,22),(449,428,'DiUKh_MjsI0',0,NULL,NULL,22),(450,429,'DiUKh_MjsI0',0,NULL,NULL,22),(451,430,'DiUKh_MjsI0',0,NULL,NULL,22),(452,431,'DiUKh_MjsI0',0,NULL,NULL,22),(453,432,'DiUKh_MjsI0',0,NULL,NULL,22),(454,433,'DiUKh_MjsI0',0,NULL,NULL,22),(455,434,'DiUKh_MjsI0',0,NULL,NULL,22),(456,435,'DiUKh_MjsI0',0,NULL,NULL,22),(457,436,'DiUKh_MjsI0',0,NULL,NULL,22),(458,437,'DiUKh_MjsI0',0,NULL,NULL,22),(459,438,'DiUKh_MjsI0',0,NULL,NULL,22),(460,439,'DiUKh_MjsI0',0,NULL,NULL,22),(461,440,'DiUKh_MjsI0',0,NULL,NULL,22),(462,441,'DiUKh_MjsI0',0,NULL,NULL,22),(463,442,'DiUKh_MjsI0',0,NULL,NULL,22),(464,443,'DiUKh_MjsI0',0,NULL,NULL,22),(465,444,'DiUKh_MjsI0',0,NULL,NULL,22),(466,445,'DiUKh_MjsI0',0,NULL,NULL,22),(467,446,'DiUKh_MjsI0',0,NULL,NULL,22),(468,447,'DiUKh_MjsI0',0,NULL,NULL,22),(469,448,'DiUKh_MjsI0',0,NULL,NULL,22),(470,449,'DiUKh_MjsI0',0,NULL,NULL,22),(471,450,'DiUKh_MjsI0',0,NULL,NULL,22),(472,451,'DiUKh_MjsI0',0,NULL,NULL,22),(473,452,'DiUKh_MjsI0',0,NULL,NULL,22),(474,453,'DiUKh_MjsI0',0,NULL,NULL,22),(475,454,'DiUKh_MjsI0',0,NULL,NULL,22),(476,455,'DiUKh_MjsI0',0,NULL,NULL,22),(477,456,'DiUKh_MjsI0',0,NULL,NULL,22),(478,457,'DiUKh_MjsI0',0,NULL,NULL,22),(479,458,'DiUKh_MjsI0',0,NULL,NULL,22),(480,459,'DiUKh_MjsI0',0,NULL,NULL,22),(481,460,'DiUKh_MjsI0',0,NULL,NULL,22),(482,461,'DiUKh_MjsI0',0,NULL,NULL,22),(483,462,'DiUKh_MjsI0',0,NULL,NULL,22),(484,463,'DiUKh_MjsI0',0,NULL,NULL,22),(485,464,'DiUKh_MjsI0',0,NULL,NULL,22),(486,465,'DiUKh_MjsI0',0,NULL,NULL,22),(487,466,'DiUKh_MjsI0',0,NULL,NULL,22),(488,467,'DiUKh_MjsI0',0,NULL,NULL,22),(489,468,'DiUKh_MjsI0',0,NULL,NULL,22),(490,469,'DiUKh_MjsI0',0,NULL,NULL,22),(491,470,'DiUKh_MjsI0',0,NULL,NULL,22),(492,471,'DiUKh_MjsI0',0,NULL,NULL,22),(493,472,'DiUKh_MjsI0',0,NULL,NULL,22),(494,473,'DiUKh_MjsI0',0,NULL,NULL,22),(495,474,'DiUKh_MjsI0',0,NULL,NULL,22),(496,475,'DiUKh_MjsI0',0,NULL,NULL,22),(497,476,'DiUKh_MjsI0',0,NULL,NULL,22),(498,477,'DiUKh_MjsI0',0,NULL,NULL,22),(499,478,'DiUKh_MjsI0',0,NULL,NULL,22),(500,479,'DiUKh_MjsI0',0,NULL,NULL,22),(501,480,'DiUKh_MjsI0',0,NULL,NULL,22),(502,481,'DiUKh_MjsI0',0,NULL,NULL,22),(503,482,'DiUKh_MjsI0',0,NULL,NULL,22),(504,483,'DiUKh_MjsI0',0,NULL,NULL,22),(505,484,'DiUKh_MjsI0',0,NULL,NULL,22),(506,485,'DiUKh_MjsI0',0,NULL,NULL,22),(507,486,'DiUKh_MjsI0',0,NULL,NULL,22),(508,487,'DiUKh_MjsI0',0,NULL,NULL,22),(509,488,'DiUKh_MjsI0',0,NULL,NULL,22),(510,489,'DiUKh_MjsI0',0,NULL,NULL,22),(511,490,'DiUKh_MjsI0',0,NULL,NULL,22),(512,491,'DiUKh_MjsI0',0,NULL,NULL,22),(513,492,'DiUKh_MjsI0',0,NULL,NULL,22),(514,493,'DiUKh_MjsI0',0,NULL,NULL,22),(515,494,'DiUKh_MjsI0',0,NULL,NULL,22),(516,495,'DiUKh_MjsI0',0,NULL,NULL,22),(517,496,'DiUKh_MjsI0',0,NULL,NULL,22),(518,497,'DiUKh_MjsI0',0,NULL,NULL,22),(519,498,'DiUKh_MjsI0',0,NULL,NULL,22),(520,499,'DiUKh_MjsI0',0,NULL,NULL,22),(521,500,'DiUKh_MjsI0',0,NULL,NULL,22),(522,501,'DiUKh_MjsI0',0,NULL,NULL,22),(523,502,'DiUKh_MjsI0',0,NULL,NULL,22),(524,503,'DiUKh_MjsI0',0,NULL,NULL,22),(525,504,'DiUKh_MjsI0',0,NULL,NULL,22),(526,505,'DiUKh_MjsI0',0,NULL,NULL,22),(527,506,'DiUKh_MjsI0',0,NULL,NULL,22),(528,507,'DiUKh_MjsI0',0,NULL,NULL,22),(529,508,'DiUKh_MjsI0',0,NULL,NULL,22),(530,509,'DiUKh_MjsI0',0,NULL,NULL,22),(531,510,'DiUKh_MjsI0',0,NULL,NULL,22),(532,511,'DiUKh_MjsI0',0,NULL,NULL,22),(533,512,'DiUKh_MjsI0',0,NULL,NULL,22),(534,513,'DiUKh_MjsI0',0,NULL,NULL,22),(535,514,'DiUKh_MjsI0',0,NULL,NULL,22),(536,515,'DiUKh_MjsI0',0,NULL,NULL,22),(537,516,'DiUKh_MjsI0',0,NULL,NULL,22),(538,517,'DiUKh_MjsI0',0,NULL,NULL,22),(539,518,'DiUKh_MjsI0',0,NULL,NULL,22),(540,519,'DiUKh_MjsI0',0,NULL,NULL,22),(541,520,'DiUKh_MjsI0',0,NULL,NULL,22),(542,521,'DiUKh_MjsI0',0,NULL,NULL,22),(543,522,'DiUKh_MjsI0',0,NULL,NULL,22),(544,523,'DiUKh_MjsI0',0,NULL,NULL,22),(545,524,'DiUKh_MjsI0',0,NULL,NULL,22),(546,525,'DiUKh_MjsI0',0,NULL,NULL,22),(547,526,'DiUKh_MjsI0',0,NULL,NULL,22),(548,527,'DiUKh_MjsI0',0,NULL,NULL,22),(549,528,'DiUKh_MjsI0',0,NULL,NULL,22),(550,529,'DiUKh_MjsI0',0,NULL,NULL,22),(551,530,'DiUKh_MjsI0',0,NULL,NULL,22),(552,531,'DiUKh_MjsI0',0,NULL,NULL,22),(553,532,'DiUKh_MjsI0',0,NULL,NULL,22),(554,533,'DiUKh_MjsI0',0,NULL,NULL,22),(555,534,'DiUKh_MjsI0',0,NULL,NULL,22),(556,535,'DiUKh_MjsI0',0,NULL,NULL,22),(557,536,'DiUKh_MjsI0',0,NULL,NULL,22),(558,537,'DiUKh_MjsI0',0,NULL,NULL,22),(559,538,'DiUKh_MjsI0',0,NULL,NULL,22),(560,539,'DiUKh_MjsI0',0,NULL,NULL,22),(561,540,'DiUKh_MjsI0',0,NULL,NULL,22),(562,541,'DiUKh_MjsI0',0,NULL,NULL,22),(563,542,'DiUKh_MjsI0',0,NULL,NULL,22),(564,543,'DiUKh_MjsI0',0,NULL,NULL,22),(565,544,'DiUKh_MjsI0',0,NULL,NULL,22),(566,545,'DiUKh_MjsI0',0,NULL,NULL,22),(567,546,'DiUKh_MjsI0',0,NULL,NULL,22),(568,547,'DiUKh_MjsI0',0,NULL,NULL,22),(569,548,'DiUKh_MjsI0',0,NULL,NULL,22),(570,549,'DiUKh_MjsI0',0,NULL,NULL,22),(571,550,'DiUKh_MjsI0',0,NULL,NULL,22),(572,551,'DiUKh_MjsI0',0,NULL,NULL,22),(573,552,'DiUKh_MjsI0',0,NULL,NULL,22),(574,553,'DiUKh_MjsI0',0,NULL,NULL,22),(575,554,'DiUKh_MjsI0',0,NULL,NULL,22),(576,555,'DiUKh_MjsI0',0,NULL,NULL,22),(577,556,'DiUKh_MjsI0',0,NULL,NULL,22),(578,557,'DiUKh_MjsI0',0,NULL,NULL,22),(579,558,'DiUKh_MjsI0',0,NULL,NULL,22),(580,559,'DiUKh_MjsI0',0,NULL,NULL,22),(581,560,'DiUKh_MjsI0',0,NULL,NULL,22),(582,561,'DiUKh_MjsI0',0,NULL,NULL,22),(583,562,'DiUKh_MjsI0',0,NULL,NULL,22),(584,563,'DiUKh_MjsI0',0,NULL,NULL,22),(585,564,'DiUKh_MjsI0',0,NULL,NULL,22),(586,565,'DiUKh_MjsI0',0,NULL,NULL,22),(587,566,'DiUKh_MjsI0',0,NULL,NULL,22),(588,567,'DiUKh_MjsI0',0,NULL,NULL,22),(589,568,'DiUKh_MjsI0',0,NULL,NULL,22),(590,569,'DiUKh_MjsI0',0,NULL,NULL,22),(591,570,'DiUKh_MjsI0',0,NULL,NULL,22),(592,571,'DiUKh_MjsI0',0,NULL,NULL,22),(593,572,'DiUKh_MjsI0',0,NULL,NULL,22),(594,573,'DiUKh_MjsI0',0,NULL,NULL,22),(595,574,'DiUKh_MjsI0',0,NULL,NULL,22),(596,575,'DiUKh_MjsI0',0,NULL,NULL,22),(597,576,'DiUKh_MjsI0',0,NULL,NULL,22),(598,577,'DiUKh_MjsI0',0,NULL,NULL,22),(599,578,'DiUKh_MjsI0',0,NULL,NULL,22),(600,579,'DiUKh_MjsI0',0,NULL,NULL,22),(601,580,'DiUKh_MjsI0',0,NULL,NULL,22),(602,581,'DiUKh_MjsI0',0,NULL,NULL,22),(603,582,'DiUKh_MjsI0',0,NULL,NULL,22),(604,583,'DiUKh_MjsI0',0,NULL,NULL,22),(605,584,'DiUKh_MjsI0',0,NULL,NULL,22),(606,585,'DiUKh_MjsI0',0,NULL,NULL,22),(607,586,'DiUKh_MjsI0',0,NULL,NULL,22),(608,587,'DiUKh_MjsI0',0,NULL,NULL,22),(609,588,'DiUKh_MjsI0',0,NULL,NULL,22),(610,589,'DiUKh_MjsI0',0,NULL,NULL,22),(611,590,'DiUKh_MjsI0',0,NULL,NULL,22),(612,591,'DiUKh_MjsI0',0,NULL,NULL,22),(613,592,'DiUKh_MjsI0',0,NULL,NULL,22),(614,593,'DiUKh_MjsI0',0,NULL,NULL,22),(615,594,'DiUKh_MjsI0',0,NULL,NULL,22),(616,595,'DiUKh_MjsI0',0,NULL,NULL,22),(617,596,'DiUKh_MjsI0',0,NULL,NULL,22),(618,597,'DiUKh_MjsI0',0,NULL,NULL,22),(619,598,'DiUKh_MjsI0',0,NULL,NULL,22),(620,599,'DiUKh_MjsI0',0,NULL,NULL,22),(621,600,'DiUKh_MjsI0',0,NULL,NULL,22),(622,601,'DiUKh_MjsI0',0,NULL,NULL,22),(623,602,'DiUKh_MjsI0',0,NULL,NULL,22),(624,603,'DiUKh_MjsI0',0,NULL,NULL,22),(625,604,'DiUKh_MjsI0',0,NULL,NULL,22),(626,605,'DiUKh_MjsI0',0,NULL,NULL,22),(627,606,'DiUKh_MjsI0',0,NULL,NULL,22),(628,607,'DiUKh_MjsI0',0,NULL,NULL,22),(629,608,'DiUKh_MjsI0',0,NULL,NULL,22),(630,609,'DiUKh_MjsI0',0,NULL,NULL,22),(631,610,'DiUKh_MjsI0',0,NULL,NULL,22),(632,611,'DiUKh_MjsI0',0,NULL,NULL,22),(633,612,'DiUKh_MjsI0',0,NULL,NULL,22),(634,613,'DiUKh_MjsI0',0,NULL,NULL,22),(635,614,'DiUKh_MjsI0',0,NULL,NULL,22),(636,615,'DiUKh_MjsI0',0,NULL,NULL,22),(637,616,'DiUKh_MjsI0',0,NULL,NULL,22),(638,617,'DiUKh_MjsI0',0,NULL,NULL,22),(639,618,'DiUKh_MjsI0',0,NULL,NULL,22),(640,619,'DiUKh_MjsI0',0,NULL,NULL,22),(641,620,'DiUKh_MjsI0',0,NULL,NULL,22),(642,621,'DiUKh_MjsI0',0,NULL,NULL,22),(643,622,'DiUKh_MjsI0',0,NULL,NULL,22),(644,623,'DiUKh_MjsI0',0,NULL,NULL,22),(645,624,'DiUKh_MjsI0',0,NULL,NULL,22),(646,625,'DiUKh_MjsI0',0,NULL,NULL,22),(647,626,'DiUKh_MjsI0',0,NULL,NULL,22),(648,627,'DiUKh_MjsI0',0,NULL,NULL,22),(649,628,'DiUKh_MjsI0',0,NULL,NULL,22),(650,629,'DiUKh_MjsI0',0,NULL,NULL,22),(651,630,'DiUKh_MjsI0',0,NULL,NULL,22),(652,631,'DiUKh_MjsI0',0,NULL,NULL,22),(653,632,'DiUKh_MjsI0',0,NULL,NULL,22),(654,633,'DiUKh_MjsI0',0,NULL,NULL,22),(655,634,'DiUKh_MjsI0',0,NULL,NULL,22),(656,635,'DiUKh_MjsI0',0,NULL,NULL,22),(657,636,'DiUKh_MjsI0',0,NULL,NULL,22),(658,637,'DiUKh_MjsI0',0,NULL,NULL,22),(659,638,'DiUKh_MjsI0',0,NULL,NULL,22),(660,639,'DiUKh_MjsI0',0,NULL,NULL,22),(661,640,'DiUKh_MjsI0',0,NULL,NULL,22),(662,641,'DiUKh_MjsI0',0,NULL,NULL,22),(663,642,'DiUKh_MjsI0',0,NULL,NULL,22),(664,643,'DiUKh_MjsI0',0,NULL,NULL,22),(665,644,'DiUKh_MjsI0',0,NULL,NULL,22),(666,645,'DiUKh_MjsI0',0,NULL,NULL,22),(667,646,'DiUKh_MjsI0',0,NULL,NULL,22),(668,647,'DiUKh_MjsI0',0,NULL,NULL,22),(669,648,'DiUKh_MjsI0',0,NULL,NULL,22),(670,649,'DiUKh_MjsI0',0,NULL,NULL,22),(671,650,'DiUKh_MjsI0',0,NULL,NULL,22),(672,651,'DiUKh_MjsI0',0,NULL,NULL,22),(673,652,'DiUKh_MjsI0',0,NULL,NULL,22),(674,653,'DiUKh_MjsI0',0,NULL,NULL,22),(675,654,'DiUKh_MjsI0',0,NULL,NULL,22),(676,655,'DiUKh_MjsI0',0,NULL,NULL,22),(677,656,'DiUKh_MjsI0',0,NULL,NULL,22),(678,657,'DiUKh_MjsI0',0,NULL,NULL,22),(679,658,'DiUKh_MjsI0',0,NULL,NULL,22),(680,659,'DiUKh_MjsI0',0,NULL,NULL,22),(681,660,'DiUKh_MjsI0',0,NULL,NULL,22),(682,661,'DiUKh_MjsI0',0,NULL,NULL,22),(683,662,'DiUKh_MjsI0',0,NULL,NULL,22),(684,663,'DiUKh_MjsI0',0,NULL,NULL,22),(685,664,'DiUKh_MjsI0',0,NULL,NULL,22),(686,665,'DiUKh_MjsI0',0,NULL,NULL,22),(687,666,'DiUKh_MjsI0',0,NULL,NULL,22),(688,667,'DiUKh_MjsI0',0,NULL,NULL,22),(689,668,'DiUKh_MjsI0',0,NULL,NULL,22),(690,669,'DiUKh_MjsI0',0,NULL,NULL,22),(691,670,'DiUKh_MjsI0',0,NULL,NULL,22),(692,671,'DiUKh_MjsI0',0,NULL,NULL,22),(693,672,'DiUKh_MjsI0',0,NULL,NULL,22),(694,673,'DiUKh_MjsI0',0,NULL,NULL,22),(695,674,'DiUKh_MjsI0',0,NULL,NULL,22),(696,675,'DiUKh_MjsI0',0,NULL,NULL,22),(697,676,'DiUKh_MjsI0',0,NULL,NULL,22),(698,677,'DiUKh_MjsI0',0,NULL,NULL,22),(699,678,'DiUKh_MjsI0',0,NULL,NULL,22),(700,679,'DiUKh_MjsI0',0,NULL,NULL,22),(701,680,'DiUKh_MjsI0',0,NULL,NULL,22),(702,681,'DiUKh_MjsI0',0,NULL,NULL,22),(703,682,'DiUKh_MjsI0',0,NULL,NULL,22),(704,683,'DiUKh_MjsI0',0,NULL,NULL,22),(705,684,'DiUKh_MjsI0',0,NULL,NULL,22),(706,685,'DiUKh_MjsI0',0,NULL,NULL,22),(707,686,'DiUKh_MjsI0',0,NULL,NULL,22),(708,687,'DiUKh_MjsI0',0,NULL,NULL,22),(709,688,'DiUKh_MjsI0',0,NULL,NULL,22),(710,689,'DiUKh_MjsI0',0,NULL,NULL,22),(711,690,'DiUKh_MjsI0',0,NULL,NULL,22),(712,691,'DiUKh_MjsI0',0,NULL,NULL,22),(713,692,'DiUKh_MjsI0',0,NULL,NULL,22),(714,693,'DiUKh_MjsI0',0,NULL,NULL,22),(715,694,'DiUKh_MjsI0',0,NULL,NULL,22),(716,695,'DiUKh_MjsI0',0,NULL,NULL,22),(717,696,'DiUKh_MjsI0',0,NULL,NULL,22),(718,697,'DiUKh_MjsI0',0,NULL,NULL,22),(719,698,'DiUKh_MjsI0',0,NULL,NULL,22),(720,699,'DiUKh_MjsI0',0,NULL,NULL,22),(721,700,'DiUKh_MjsI0',0,NULL,NULL,22),(722,701,'DiUKh_MjsI0',0,NULL,NULL,22),(723,702,'DiUKh_MjsI0',0,NULL,NULL,22),(724,703,'DiUKh_MjsI0',0,NULL,NULL,22),(725,704,'DiUKh_MjsI0',0,NULL,NULL,22),(726,705,'DiUKh_MjsI0',0,NULL,NULL,22),(727,706,'DiUKh_MjsI0',0,NULL,NULL,22),(728,707,'DiUKh_MjsI0',0,NULL,NULL,22),(729,708,'DiUKh_MjsI0',0,NULL,NULL,22),(730,709,'DiUKh_MjsI0',0,NULL,NULL,22),(731,710,'DiUKh_MjsI0',0,NULL,NULL,22),(732,711,'DiUKh_MjsI0',0,NULL,NULL,22),(733,712,'DiUKh_MjsI0',0,NULL,NULL,22),(734,713,'DiUKh_MjsI0',0,NULL,NULL,22),(735,714,'DiUKh_MjsI0',0,NULL,NULL,22),(736,715,'DiUKh_MjsI0',0,NULL,NULL,22),(737,716,'DiUKh_MjsI0',0,NULL,NULL,22),(738,717,'DiUKh_MjsI0',0,NULL,NULL,22),(739,718,'DiUKh_MjsI0',0,NULL,NULL,22),(740,719,'DiUKh_MjsI0',0,NULL,NULL,22),(741,720,'DiUKh_MjsI0',0,NULL,NULL,22),(742,721,'DiUKh_MjsI0',0,NULL,NULL,22),(743,722,'DiUKh_MjsI0',0,NULL,NULL,22),(744,723,'DiUKh_MjsI0',0,NULL,NULL,22),(745,724,'DiUKh_MjsI0',0,NULL,NULL,22),(746,725,'DiUKh_MjsI0',0,NULL,NULL,22),(747,726,'DiUKh_MjsI0',0,NULL,NULL,22),(748,727,'DiUKh_MjsI0',0,NULL,NULL,22),(749,728,'DiUKh_MjsI0',0,NULL,NULL,22),(750,729,'DiUKh_MjsI0',0,NULL,NULL,22),(751,730,'DiUKh_MjsI0',0,NULL,NULL,22),(752,731,'DiUKh_MjsI0',0,NULL,NULL,22),(753,732,'DiUKh_MjsI0',0,NULL,NULL,22),(754,733,'DiUKh_MjsI0',0,NULL,NULL,22),(755,734,'DiUKh_MjsI0',0,NULL,NULL,22),(756,735,'DiUKh_MjsI0',0,NULL,NULL,22),(757,736,'DiUKh_MjsI0',0,NULL,NULL,22),(758,737,'DiUKh_MjsI0',0,NULL,NULL,22),(759,738,'DiUKh_MjsI0',0,NULL,NULL,22),(760,739,'DiUKh_MjsI0',0,NULL,NULL,22),(761,740,'DiUKh_MjsI0',0,NULL,NULL,22),(762,741,'DiUKh_MjsI0',0,NULL,NULL,22),(763,742,'DiUKh_MjsI0',0,NULL,NULL,22),(764,743,'DiUKh_MjsI0',0,NULL,NULL,22),(765,744,'DiUKh_MjsI0',0,NULL,NULL,22),(766,745,'DiUKh_MjsI0',0,NULL,NULL,22),(767,746,'DiUKh_MjsI0',0,NULL,NULL,22),(768,747,'DiUKh_MjsI0',0,NULL,NULL,22),(769,748,'DiUKh_MjsI0',0,NULL,NULL,22),(770,749,'DiUKh_MjsI0',0,NULL,NULL,22),(771,750,'DiUKh_MjsI0',0,NULL,NULL,22),(772,751,'DiUKh_MjsI0',0,NULL,NULL,22),(773,752,'DiUKh_MjsI0',0,NULL,NULL,22),(774,753,'DiUKh_MjsI0',0,NULL,NULL,22),(775,754,'DiUKh_MjsI0',0,NULL,NULL,22),(776,755,'DiUKh_MjsI0',0,NULL,NULL,22),(777,756,'DiUKh_MjsI0',0,NULL,NULL,22),(778,757,'DiUKh_MjsI0',0,NULL,NULL,22),(779,758,'DiUKh_MjsI0',0,NULL,NULL,22),(780,759,'DiUKh_MjsI0',0,NULL,NULL,22),(781,760,'DiUKh_MjsI0',0,NULL,NULL,22),(782,761,'DiUKh_MjsI0',0,NULL,NULL,22),(783,762,'DiUKh_MjsI0',0,NULL,NULL,22),(784,763,'DiUKh_MjsI0',0,NULL,NULL,22),(785,764,'DiUKh_MjsI0',0,NULL,NULL,22),(786,765,'DiUKh_MjsI0',0,NULL,NULL,22),(787,766,'DiUKh_MjsI0',0,NULL,NULL,22),(788,767,'DiUKh_MjsI0',0,NULL,NULL,22),(789,768,'DiUKh_MjsI0',0,NULL,NULL,22),(790,769,'DiUKh_MjsI0',0,NULL,NULL,22),(791,770,'DiUKh_MjsI0',0,NULL,NULL,22),(792,771,'DiUKh_MjsI0',0,NULL,NULL,22),(793,772,'DiUKh_MjsI0',0,NULL,NULL,22),(794,773,'DiUKh_MjsI0',0,NULL,NULL,22),(795,774,'DiUKh_MjsI0',0,NULL,NULL,22),(796,775,'DiUKh_MjsI0',0,NULL,NULL,22),(797,776,'DiUKh_MjsI0',0,NULL,NULL,22),(798,777,'DiUKh_MjsI0',0,NULL,NULL,22),(799,778,'DiUKh_MjsI0',0,NULL,NULL,22),(800,779,'DiUKh_MjsI0',0,NULL,NULL,22),(801,780,'DiUKh_MjsI0',0,NULL,NULL,22),(802,781,'DiUKh_MjsI0',0,NULL,NULL,22),(803,782,'DiUKh_MjsI0',0,NULL,NULL,22),(804,783,'DiUKh_MjsI0',0,NULL,NULL,22),(805,784,'DiUKh_MjsI0',0,NULL,NULL,22),(806,785,'DiUKh_MjsI0',0,NULL,NULL,22),(807,786,'DiUKh_MjsI0',0,NULL,NULL,22),(808,787,'DiUKh_MjsI0',0,NULL,NULL,22),(809,788,'DiUKh_MjsI0',0,NULL,NULL,22),(810,789,'DiUKh_MjsI0',0,NULL,NULL,22),(811,790,'DiUKh_MjsI0',0,NULL,NULL,22),(812,791,'DiUKh_MjsI0',0,NULL,NULL,22),(813,792,'DiUKh_MjsI0',0,NULL,NULL,22),(814,793,'DiUKh_MjsI0',0,NULL,NULL,22),(815,794,'DiUKh_MjsI0',0,NULL,NULL,22),(816,795,'DiUKh_MjsI0',0,NULL,NULL,22),(817,796,'DiUKh_MjsI0',0,NULL,NULL,22),(818,797,'DiUKh_MjsI0',0,NULL,NULL,22),(819,798,'DiUKh_MjsI0',0,NULL,NULL,22),(820,799,'DiUKh_MjsI0',0,NULL,NULL,22),(821,800,'DiUKh_MjsI0',0,NULL,NULL,22),(822,801,'DiUKh_MjsI0',0,NULL,NULL,22),(823,802,'DiUKh_MjsI0',0,NULL,NULL,22),(824,803,'DiUKh_MjsI0',0,NULL,NULL,22),(825,804,'DiUKh_MjsI0',0,NULL,NULL,22),(826,805,'DiUKh_MjsI0',0,NULL,NULL,22),(827,806,'DiUKh_MjsI0',0,NULL,NULL,22),(828,807,'DiUKh_MjsI0',0,NULL,NULL,22),(829,808,'DiUKh_MjsI0',0,NULL,NULL,22),(830,809,'DiUKh_MjsI0',0,NULL,NULL,22),(831,810,'DiUKh_MjsI0',0,NULL,NULL,22),(832,811,'DiUKh_MjsI0',0,NULL,NULL,22),(833,812,'DiUKh_MjsI0',0,NULL,NULL,22),(834,813,'DiUKh_MjsI0',0,NULL,NULL,22),(835,814,'DiUKh_MjsI0',0,NULL,NULL,22),(836,815,'DiUKh_MjsI0',0,NULL,NULL,22),(837,816,'DiUKh_MjsI0',0,NULL,NULL,22),(838,817,'DiUKh_MjsI0',0,NULL,NULL,22),(839,818,'DiUKh_MjsI0',0,NULL,NULL,22),(840,819,'DiUKh_MjsI0',0,NULL,NULL,22),(841,820,'DiUKh_MjsI0',0,NULL,NULL,22),(842,821,'DiUKh_MjsI0',0,NULL,NULL,22),(843,822,'DiUKh_MjsI0',0,NULL,NULL,22),(844,823,'DiUKh_MjsI0',0,NULL,NULL,22),(845,824,'DiUKh_MjsI0',0,NULL,NULL,22),(846,825,'DiUKh_MjsI0',0,NULL,NULL,22),(847,826,'DiUKh_MjsI0',0,NULL,NULL,22),(848,827,'DiUKh_MjsI0',0,NULL,NULL,22),(849,828,'DiUKh_MjsI0',0,NULL,NULL,22),(850,829,'DiUKh_MjsI0',0,NULL,NULL,22),(851,830,'DiUKh_MjsI0',0,NULL,NULL,22),(852,831,'DiUKh_MjsI0',0,NULL,NULL,22),(853,832,'DiUKh_MjsI0',0,NULL,NULL,22),(854,833,'DiUKh_MjsI0',0,NULL,NULL,22),(855,834,'DiUKh_MjsI0',0,NULL,NULL,22),(856,835,'DiUKh_MjsI0',0,NULL,NULL,22),(857,836,'DiUKh_MjsI0',0,NULL,NULL,22),(858,837,'DiUKh_MjsI0',0,NULL,NULL,22),(859,838,'DiUKh_MjsI0',0,NULL,NULL,22),(860,839,'DiUKh_MjsI0',0,NULL,NULL,22),(861,840,'DiUKh_MjsI0',0,NULL,NULL,22),(862,841,'DiUKh_MjsI0',0,NULL,NULL,22),(863,842,'DiUKh_MjsI0',0,NULL,NULL,22),(864,843,'DiUKh_MjsI0',0,NULL,NULL,22),(865,844,'DiUKh_MjsI0',0,NULL,NULL,22),(866,845,'DiUKh_MjsI0',0,NULL,NULL,22),(867,846,'DiUKh_MjsI0',0,NULL,NULL,22),(868,847,'DiUKh_MjsI0',0,NULL,NULL,22),(869,848,'DiUKh_MjsI0',0,NULL,NULL,22),(870,849,'DiUKh_MjsI0',0,NULL,NULL,22),(871,850,'DiUKh_MjsI0',0,NULL,NULL,22),(872,851,'DiUKh_MjsI0',0,NULL,NULL,22),(873,852,'DiUKh_MjsI0',0,NULL,NULL,22),(874,853,'DiUKh_MjsI0',0,NULL,NULL,22),(875,854,'DiUKh_MjsI0',0,NULL,NULL,22),(876,855,'DiUKh_MjsI0',0,NULL,NULL,22),(877,856,'DiUKh_MjsI0',0,NULL,NULL,22),(878,857,'DiUKh_MjsI0',0,NULL,NULL,22),(879,858,'DiUKh_MjsI0',0,NULL,NULL,22),(880,859,'DiUKh_MjsI0',0,NULL,NULL,22),(881,860,'DiUKh_MjsI0',0,NULL,NULL,22),(882,861,'DiUKh_MjsI0',0,NULL,NULL,22),(883,862,'DiUKh_MjsI0',0,NULL,NULL,22),(884,863,'DiUKh_MjsI0',0,NULL,NULL,22),(885,864,'DiUKh_MjsI0',0,NULL,NULL,22),(886,865,'DiUKh_MjsI0',0,NULL,NULL,22),(887,866,'DiUKh_MjsI0',0,NULL,NULL,22),(888,867,'DiUKh_MjsI0',0,NULL,NULL,22),(889,868,'DiUKh_MjsI0',0,NULL,NULL,22),(890,869,'DiUKh_MjsI0',0,NULL,NULL,22),(891,870,'DiUKh_MjsI0',0,NULL,NULL,22),(892,871,'DiUKh_MjsI0',0,NULL,NULL,22),(893,872,'DiUKh_MjsI0',0,NULL,NULL,22),(894,873,'DiUKh_MjsI0',0,NULL,NULL,22),(895,874,'DiUKh_MjsI0',0,NULL,NULL,22),(896,875,'DiUKh_MjsI0',0,NULL,NULL,22),(897,876,'DiUKh_MjsI0',0,NULL,NULL,22),(898,877,'DiUKh_MjsI0',0,NULL,NULL,22),(899,878,'DiUKh_MjsI0',0,NULL,NULL,22),(900,879,'DiUKh_MjsI0',0,NULL,NULL,22),(901,880,'DiUKh_MjsI0',0,NULL,NULL,22),(902,881,'DiUKh_MjsI0',0,NULL,NULL,22),(903,882,'DiUKh_MjsI0',0,NULL,NULL,22),(904,883,'DiUKh_MjsI0',0,NULL,NULL,22),(905,884,'DiUKh_MjsI0',0,NULL,NULL,22),(906,885,'DiUKh_MjsI0',0,NULL,NULL,22),(907,886,'DiUKh_MjsI0',0,NULL,NULL,22),(908,887,'DiUKh_MjsI0',0,NULL,NULL,22),(909,888,'DiUKh_MjsI0',0,NULL,NULL,22),(910,889,'DiUKh_MjsI0',0,NULL,NULL,22),(911,890,'DiUKh_MjsI0',0,NULL,NULL,22),(912,891,'DiUKh_MjsI0',0,NULL,NULL,22),(913,892,'DiUKh_MjsI0',0,NULL,NULL,22),(914,893,'DiUKh_MjsI0',0,NULL,NULL,22),(915,894,'DiUKh_MjsI0',0,NULL,NULL,22),(916,895,'DiUKh_MjsI0',0,NULL,NULL,22),(917,896,'DiUKh_MjsI0',0,NULL,NULL,22),(918,897,'DiUKh_MjsI0',0,NULL,NULL,22),(919,898,'DiUKh_MjsI0',0,NULL,NULL,22),(920,899,'DiUKh_MjsI0',0,NULL,NULL,22),(921,900,'DiUKh_MjsI0',0,NULL,NULL,22),(922,901,'DiUKh_MjsI0',0,NULL,NULL,22),(923,902,'DiUKh_MjsI0',0,NULL,NULL,22),(924,903,'DiUKh_MjsI0',0,NULL,NULL,22),(925,904,'DiUKh_MjsI0',0,NULL,NULL,22),(926,905,'DiUKh_MjsI0',0,NULL,NULL,22),(927,906,'DiUKh_MjsI0',0,NULL,NULL,22),(928,907,'DiUKh_MjsI0',0,NULL,NULL,22),(929,908,'DiUKh_MjsI0',0,NULL,NULL,22),(930,909,'DiUKh_MjsI0',0,NULL,NULL,22),(931,910,'DiUKh_MjsI0',0,NULL,NULL,22),(932,911,'DiUKh_MjsI0',0,NULL,NULL,22),(933,912,'DiUKh_MjsI0',0,NULL,NULL,22),(934,913,'DiUKh_MjsI0',0,NULL,NULL,22),(935,914,'DiUKh_MjsI0',0,NULL,NULL,22),(936,915,'DiUKh_MjsI0',0,NULL,NULL,22),(937,916,'DiUKh_MjsI0',0,NULL,NULL,22),(938,917,'DiUKh_MjsI0',0,NULL,NULL,22),(939,918,'DiUKh_MjsI0',0,NULL,NULL,22),(940,919,'DiUKh_MjsI0',0,NULL,NULL,22),(941,920,'DiUKh_MjsI0',0,NULL,NULL,22),(942,921,'DiUKh_MjsI0',0,NULL,NULL,22),(943,922,'DiUKh_MjsI0',0,NULL,NULL,22),(944,923,'DiUKh_MjsI0',0,NULL,NULL,22),(945,924,'DiUKh_MjsI0',0,NULL,NULL,22),(946,925,'DiUKh_MjsI0',0,NULL,NULL,22),(947,926,'DiUKh_MjsI0',0,NULL,NULL,22),(948,927,'DiUKh_MjsI0',0,NULL,NULL,22),(949,928,'DiUKh_MjsI0',0,NULL,NULL,22),(950,929,'DiUKh_MjsI0',0,NULL,NULL,22),(951,930,'DiUKh_MjsI0',0,NULL,NULL,22),(952,931,'DiUKh_MjsI0',0,NULL,NULL,22),(953,932,'DiUKh_MjsI0',0,NULL,NULL,22),(954,933,'DiUKh_MjsI0',0,NULL,NULL,22),(955,934,'DiUKh_MjsI0',0,NULL,NULL,22),(956,935,'DiUKh_MjsI0',0,NULL,NULL,22),(957,936,'DiUKh_MjsI0',0,NULL,NULL,22),(958,937,'DiUKh_MjsI0',0,NULL,NULL,22),(959,938,'DiUKh_MjsI0',0,NULL,NULL,22),(960,939,'DiUKh_MjsI0',0,NULL,NULL,22),(961,940,'DiUKh_MjsI0',0,NULL,NULL,22),(962,941,'DiUKh_MjsI0',0,NULL,NULL,22),(963,942,'DiUKh_MjsI0',0,NULL,NULL,22),(964,943,'DiUKh_MjsI0',0,NULL,NULL,22),(965,944,'DiUKh_MjsI0',0,NULL,NULL,22),(966,945,'DiUKh_MjsI0',0,NULL,NULL,22),(967,946,'DiUKh_MjsI0',0,NULL,NULL,22),(968,947,'DiUKh_MjsI0',0,NULL,NULL,22),(969,948,'DiUKh_MjsI0',0,NULL,NULL,22),(970,949,'DiUKh_MjsI0',0,NULL,NULL,22),(971,950,'DiUKh_MjsI0',0,NULL,NULL,22),(972,951,'DiUKh_MjsI0',0,NULL,NULL,22),(973,952,'DiUKh_MjsI0',0,NULL,NULL,22),(974,953,'DiUKh_MjsI0',0,NULL,NULL,22),(975,954,'DiUKh_MjsI0',0,NULL,NULL,22),(976,955,'DiUKh_MjsI0',0,NULL,NULL,22),(977,956,'DiUKh_MjsI0',0,NULL,NULL,22),(978,957,'DiUKh_MjsI0',0,NULL,NULL,22),(979,958,'DiUKh_MjsI0',0,NULL,NULL,22),(980,959,'DiUKh_MjsI0',0,NULL,NULL,22),(981,960,'DiUKh_MjsI0',0,NULL,NULL,22),(982,961,'DiUKh_MjsI0',0,NULL,NULL,22),(983,962,'DiUKh_MjsI0',0,NULL,NULL,22),(984,963,'DiUKh_MjsI0',0,NULL,NULL,22),(985,964,'DiUKh_MjsI0',0,NULL,NULL,22),(986,965,'DiUKh_MjsI0',0,NULL,NULL,22),(987,966,'DiUKh_MjsI0',0,NULL,NULL,22),(988,967,'DiUKh_MjsI0',0,NULL,NULL,22),(989,968,'DiUKh_MjsI0',0,NULL,NULL,22),(990,969,'DiUKh_MjsI0',0,NULL,NULL,22),(991,970,'DiUKh_MjsI0',0,NULL,NULL,22),(992,971,'DiUKh_MjsI0',0,NULL,NULL,22),(993,972,'DiUKh_MjsI0',0,NULL,NULL,22),(994,973,'DiUKh_MjsI0',0,NULL,NULL,22),(995,974,'DiUKh_MjsI0',0,NULL,NULL,22),(996,975,'DiUKh_MjsI0',0,NULL,NULL,22),(997,976,'DiUKh_MjsI0',0,NULL,NULL,22),(998,977,'DiUKh_MjsI0',0,NULL,NULL,22),(999,978,'DiUKh_MjsI0',0,NULL,NULL,22),(1000,979,'DiUKh_MjsI0',0,NULL,NULL,22),(1001,980,'DiUKh_MjsI0',0,NULL,NULL,22),(1002,981,'DiUKh_MjsI0',0,NULL,NULL,22),(1003,982,'DiUKh_MjsI0',0,NULL,NULL,22),(1004,983,'DiUKh_MjsI0',0,NULL,NULL,22),(1005,984,'DiUKh_MjsI0',0,NULL,NULL,22),(1006,985,'DiUKh_MjsI0',0,NULL,NULL,22),(1007,986,'DiUKh_MjsI0',0,NULL,NULL,22),(1008,987,'DiUKh_MjsI0',0,NULL,NULL,22),(1009,988,'DiUKh_MjsI0',0,NULL,NULL,22),(1010,989,'DiUKh_MjsI0',0,NULL,NULL,22),(1011,990,'DiUKh_MjsI0',0,NULL,NULL,22),(1012,991,'DiUKh_MjsI0',0,NULL,NULL,22),(1013,992,'DiUKh_MjsI0',0,NULL,NULL,22),(1014,993,'DiUKh_MjsI0',0,NULL,NULL,22),(1015,994,'DiUKh_MjsI0',0,NULL,NULL,22),(1016,995,'DiUKh_MjsI0',0,NULL,NULL,22),(1017,996,'DiUKh_MjsI0',0,NULL,NULL,22),(1018,997,'DiUKh_MjsI0',0,NULL,NULL,22),(1019,998,'DiUKh_MjsI0',0,NULL,NULL,22),(1020,999,'DiUKh_MjsI0',0,NULL,NULL,22),(1021,1000,'DiUKh_MjsI0',0,NULL,NULL,22),(1022,1001,'DiUKh_MjsI0',0,NULL,NULL,22),(1023,1002,'DiUKh_MjsI0',0,NULL,NULL,22),(1024,1003,'DiUKh_MjsI0',0,NULL,NULL,22),(1025,1004,'DiUKh_MjsI0',0,NULL,NULL,22),(1026,1005,'DiUKh_MjsI0',0,NULL,NULL,22),(1027,1006,'DiUKh_MjsI0',0,NULL,NULL,22),(1028,1007,'DiUKh_MjsI0',0,NULL,NULL,22),(1029,1008,'DiUKh_MjsI0',0,NULL,NULL,22),(1030,1009,'DiUKh_MjsI0',0,NULL,NULL,22),(1031,1010,'DiUKh_MjsI0',0,NULL,NULL,22),(1032,1011,'DiUKh_MjsI0',0,NULL,NULL,22),(1033,1012,'DiUKh_MjsI0',0,NULL,NULL,22),(1034,1013,'DiUKh_MjsI0',0,NULL,NULL,22),(1035,1014,'DiUKh_MjsI0',0,NULL,NULL,22),(1036,1015,'DiUKh_MjsI0',0,NULL,NULL,22),(1037,1016,'DiUKh_MjsI0',0,NULL,NULL,22),(1038,1017,'DiUKh_MjsI0',0,NULL,NULL,22),(1039,1018,'DiUKh_MjsI0',0,NULL,NULL,22),(1040,1019,'DiUKh_MjsI0',0,NULL,NULL,22),(1041,1020,'DiUKh_MjsI0',0,NULL,NULL,22),(1042,1021,'DiUKh_MjsI0',0,NULL,NULL,22),(1043,1022,'DiUKh_MjsI0',0,NULL,NULL,22),(1044,1023,'DiUKh_MjsI0',0,NULL,NULL,22),(1045,1024,'DiUKh_MjsI0',0,NULL,NULL,22),(1046,1025,'DiUKh_MjsI0',0,NULL,NULL,22),(1047,1026,'DiUKh_MjsI0',0,NULL,NULL,22),(1048,1027,'DiUKh_MjsI0',0,NULL,NULL,22),(1049,1028,'DiUKh_MjsI0',0,NULL,NULL,22),(1050,1029,'DiUKh_MjsI0',0,NULL,NULL,22),(1051,1030,'DiUKh_MjsI0',0,NULL,NULL,22),(1052,1,'DiUKh_MjsI0',0,NULL,NULL,23),(1053,1,'DiUKh_MjsI0',0,NULL,NULL,24),(1054,1,'DiUKh_MjsI0',0,NULL,NULL,25),(1055,1,'DiUKh_MjsI0',0,NULL,NULL,26),(1056,1,'DiUKh_MjsI0',0,NULL,NULL,27);
/*!40000 ALTER TABLE `tv_episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_images`
--

DROP TABLE IF EXISTS `tv_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_images`
--

LOCK TABLES `tv_images` WRITE;
/*!40000 ALTER TABLE `tv_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season_cast`
--

DROP TABLE IF EXISTS `tv_season_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season_cast` (
  `tv_season_id` bigint(20) NOT NULL,
  `cast_id` bigint(20) NOT NULL,
  KEY `FKm6lluh5d9pd6b5cakuf9s77ka` (`cast_id`),
  KEY `FKrs4gn0iryvsqg31dt7hs4e5yt` (`tv_season_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_cast`
--

LOCK TABLES `tv_season_cast` WRITE;
/*!40000 ALTER TABLE `tv_season_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season_country`
--

DROP TABLE IF EXISTS `tv_season_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season_country` (
  `tv_season_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  KEY `FKamequt5fkm14bkdo0nuhg0f9y` (`country_id`),
  KEY `FK56s4rgvu97l9gbvowglvbti5r` (`tv_season_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_country`
--

LOCK TABLES `tv_season_country` WRITE;
/*!40000 ALTER TABLE `tv_season_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season_crew`
--

DROP TABLE IF EXISTS `tv_season_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season_crew` (
  `tv_season_id` bigint(20) NOT NULL,
  `crew_id` bigint(20) NOT NULL,
  KEY `FKnmt3h2vfjfnk5vukqk6cwvh2n` (`crew_id`),
  KEY `FKavkrgy79k47hrdhlbn7naahth` (`tv_season_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_crew`
--

LOCK TABLES `tv_season_crew` WRITE;
/*!40000 ALTER TABLE `tv_season_crew` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season_language`
--

DROP TABLE IF EXISTS `tv_season_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season_language` (
  `tv_season_id` bigint(20) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tv_season_id`,`language_id`),
  KEY `FK62jye49lm4dtjh3tx3kpyulp6` (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_language`
--

LOCK TABLES `tv_season_language` WRITE;
/*!40000 ALTER TABLE `tv_season_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season_subtitle`
--

DROP TABLE IF EXISTS `tv_season_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season_subtitle` (
  `tv_season_id` bigint(20) NOT NULL,
  `subtitle_id` bigint(20) NOT NULL,
  KEY `FKm823ffn4pv376clhwxhjsq3dh` (`subtitle_id`),
  KEY `FKpqjlh9ronav81emtc02bf2xxa` (`tv_season_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_subtitle`
--

LOCK TABLES `tv_season_subtitle` WRITE;
/*!40000 ALTER TABLE `tv_season_subtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`),
  KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tv_season`
--

DROP TABLE IF EXISTS `user_tv_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_tv_season` (
  `user_id` bigint(20) NOT NULL,
  `tv_season_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`tv_season_id`),
  KEY `FKbdqffxii0r7ffetgsw8enryl6` (`tv_season_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tv_season`
--

LOCK TABLES `user_tv_season` WRITE;
/*!40000 ALTER TABLE `user_tv_season` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tv_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5q3e9303ap1wvtia6sft7ht1s` (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,_binary '','1000:574fd0fb4691432b1b0fdff03cdd633f:301c6c4680b982711f390e94bd593cc63946deafb621b2ca8cff217bb3490cbb3d1ec5cd5af25a5e5bcf5c46c202ae2d0b0a2cee51c28481f76b4a2d00b53613',_binary '','cbtongtulenh4',19);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_roles` (
  `users_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (18,1),(19,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-28  0:44:58
