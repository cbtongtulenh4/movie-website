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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `cm_season_id` bigint(20) DEFAULT NULL,
  `cm_parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9476d36it5jpx54m9wbf0r69k` (`cm_season_id`),
  KEY `FK1pjtp29ylmkw0bua6m9l5ft2e` (`cm_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'uda-kounosuke','Uda Kounosuke'),(2,'ishitani-megumi','Ishitani Megumi'),(3,'shimizu-junji','Shimizu Junji'),(4,'kaizawa-yukio','Kaizawa Yukio'),(5,'takenouchi-kazuhisa','Takenouchi Kazuhisa'),(6,'hosoda-mamoru','Hosoda Mamoru'),(7,'cook-justin','Cook Justin'),(8,'oda-eiichiro','Oda Eiichiro'),(9,'itou-naoyuki','Itou Naoyuki'),(10,'miyamoto-hiroaki','Miyamoto Hiroaki'),(11,'nagamine-tatsuya','Nagamine Tatsuya'),(12,'taniguchi-gorou','Taniguchi Gorou'),(13,'yamashita-hiroyuki','Yamashita Hiroyuki'),(14,'nunokawa-yuuji','Nunokawa Yuuji'),(15,'kamegaki-hajime','Kamegaki Hajime'),(16,'murata-masahiko','Murata Masahiko'),(17,'kobayashi-tsuneo','Kobayashi Tsuneo'),(18,'abe-noriyuki','Abe Noriyuki');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  KEY `FKmuhl8cqa3sxkm5erwto6pel90` (`tvSeason_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genres` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (12);
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,NULL,9.1,'http://cdn.animevietsub.cc/data/poster/2019/09/27/animevsub-sQCBqYz9ve.jpg','One Piece - Đảo Hải Tặc'),(2,NULL,9.4,'http://cdn.animevietsub.cc/data/poster/2017/08/03/animevsub-poster-5819.jpg','Naruto: Sức Mạnh Vĩ Thú');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_form`
--

LOCK TABLES `movie_form` WRITE;
/*!40000 ALTER TABLE `movie_form` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` VALUES (1,'anime-bo','Anime bộ'),(2,'shounen','Shounen'),(3,'super-power','Super Power'),(4,'phep-thuat','Fantasy'),(5,'drama','Drama'),(6,'hai-huoc','Comedy'),(7,'phieu-luu','Adventure'),(8,'hanh-dong','Action'),(9,'anime-le','Anime lẻ'),(10,'phim-chieu-rap','Phim chiếu rạp'),(11,'anime-sap-chieu','Anime sắp chiếu'),(12,'martial-arts','Martial Arts'),(13,'sieu-nhien','Supernatural'),(14,'mystery','Mystery'),(15,'parody','Parody'),(16,'tinh-cam','Romance');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons`
--

LOCK TABLES `movie_seasons` WRITE;
/*!40000 ALTER TABLE `movie_seasons` DISABLE KEYS */;
INSERT INTO `movie_seasons` VALUES (1,0,'one-piece-mamore-saigo-no-dai-butai-i3-a2072',0,0,22,NULL,NULL,NULL,'Trọn bộ SD VietSub','Trong nhiều năm, Ex-Marine Trung Randolph và đoàn kịch của ông đã đưa ra một trò chơi trên chiếc tàu của mình. Sau khi bị mất gia đình của mình để cướp biển, Randolph muốn đưa vào vở kịch mà sẽ cung cấp cho sự can đảm cho những người cũng đã mất đi những người thân yêu của họ để những tên cướp biển. Thật không may, Randolph phải nghỉ hưu sớm và hiện tại anh đang làm hiệu suất cuối cùng của ông. Luffy và phi hành đoàn của ông đến xem vở kịch, và bằng cách nào đó quản lý để tham gia vào bản thân mình. Nhưng quá khứ từ Randolph đến một cấp dưới báo thù, với một kế hoạch diabolical người cuối cùng đã trở thành chỉ huy để chụp Randolph. Luffy và đồng đội của mình bây giờ phải chứng minh với mọi người rằng không phải tất cả những tên cướp biển là cặn bã, và bảo vệ hiệu suất tạm biệt cuối cùng của Randolph từ người chỉ huy đắng. (phát sóng sau tập 174)','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-SbM07dfyPQ.jpg','One Piece: Mamore! Saigo no Dai Butai',41337,1,NULL,1,7),(2,0,'one-piece-episode-of-merry-mou-hitori-no-nakama-no-monogatari-i3-a2076',0,0,31,NULL,NULL,NULL,'Trọn bộ HD VietSub','Tập phim chia tay thuyền Merry đầy nước mắt của băng nhóm hải tặc mũ rơm','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-bRdwOYjSaN.jpg','One Piece: Episode of Merry - Mou Hitori no Nakama no Monogatari',4072997,1,NULL,1,17),(3,0,'one-piece-movie-14-stampede-a3756',0,0,711,NULL,NULL,NULL,'Trọn bộ HD VietSub','Cuộc trưng bày lớn nhất thế giới về những tên cướp biển, bởi những tên cướp biển, dành cho những tên cướp biển — Lễ hội Cướp biển. Luffy và các thành viên còn lại của băng Mũ Rơm nhận được lời mời từ chủ nhà Buena Festa, người được mệnh danh là Bậc thầy của Lễ hội. Họ đến để tìm một địa điểm với đầy những gian hàng lộng lẫy và nhiều tên cướp biển, bao gồm cả những kẻ thuộc Thế hệ tồi tệ nhất. Nơi có điện.','http://cdn.animevietsub.cc/data/poster/2020/08/19/animevsub-A9wsds8aMB.jpg','Vua Hải Tặc: Lễ Hội Hải Tặc',3604945,1,NULL,1,25),(4,0,'one-piece-film-z-i3-a2068',0,0,297,NULL,NULL,NULL,'Trọn bộ HD VietSub','Át chủ bài của Hải quân, Viên đá Daina - được so sánh ngang hàng với Vũ khí Cổ đại, đột nhiên bị lấy cắp! Và người đàn ông có sức mạnh kinh hoàng, cựu Đô Đốc Hải Quân \'Z\' sẽ là kẻ chặn đường băng Mũ Rơm! Tổng bộ Hải Quân cuối cùng cũng tiến tới việc đối phó với âm mưu đe dọa phá huỷ các End Point (Điểm Kết Thúc) tại Tân Thế Giới. Ở nơi khác, Aokiji gặp mặt băng Mũ Rơm. Và cuối cùng, Luffy và đồng đội của mình tiến lên chống lại Z và sức mạnh kinh ngạc của hắn.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-xY1tT8eCR3.jpg','One Piece Film: Z',260942,1,NULL,1,16),(5,0,'one-piece-movie-9-episode-of-chopper-plus-fuyu-ni-saku-kiseki-no-sakura-i3-a2065',0,0,6,NULL,NULL,NULL,'Trọn bộ HD VietSub','Đây là bộ phim thứ chín của seri phim One Piece Movie. Tập phim kể lại câu chuyện gia nhập băng Mũ Rơm của Tony Chopper dưới sự lãnh đạo của Luffy. Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue và rồi tiến đến Grand Line. Cậu theo dấu chân của vị vua hải tặc quá cố, Gol D. Roger, chu du từ đảo này sang đảo khác để đến với kho báu vĩ đại One Piece. Mỗi thành viên trong nhóm đều có 1 quá khứ rất đặc biệt và đáng buồn. Ngoài khả năng đặc biệt trong công việc của mình, bất cứ thành viên nào cũng có khả năng chiến đấu rất tốt.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-sFCVWEGfBy.jpg','One Piece Movie 9: Episode of Chopper Plus - Fuyu ni Saku, Kiseki no Sakura',47929,1,NULL,1,13),(6,0,'one-piece-movie-3-chinjuu-jima-no-chopper-oukoku-i2-a8',0,0,21,NULL,NULL,NULL,'Trọn bộ HD VietSub','Băng hải tặc tới được Đảo Crown, động vật ở đây có thể nói và chúng đưa Chopper lên làm vị vua mới. Thế nhưng một toán thợ săn đang truy lùng chiếc sừng huyền thoại có thể mang lại sức mạnh to lớn cho người ăn được nó. Luffy và các bạn của cậu phải ngăn chặn không cho chúng phá hủy vương quốc động vật này','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-2420.jpg','One Piece Movie 3: Chinjuu-jima no Chopper Oukoku',82270,1,NULL,1,5),(7,0,'one-piece-episode-of-east-blue-luffy-to-4-nin-no-nakama-no-daibouken-a3603',0,0,40,NULL,NULL,NULL,'Trọn bộ HD VietSub','Kể về hành trình đáng nhớ của Luffy với 4 người đồng đội đầu tiên, Zoro, Usopp, Sanji và Nami.','http://cdn.animevietsub.cc/data/poster/2019/08/24/animevsub-qVyBxkFVkq.jpg','One Piece: Episode of East Blue - Luffy to 4-nin no Nakama no Daibouken',4101616,1,NULL,1,23),(8,0,'one-piece-oounabara-ni-hirake-dekkai-dekkai-chichi-no-yume-i3-a2071',0,0,30,NULL,NULL,NULL,'Trọn bộ SD VietSub','Câu chuyện bắt đầu vào tàu Pirate Zap, nơi hai đồng đội của mình, Bonnie và Max, mệt mỏi và muốn thoát ra, nhưng tiếc là họ không có tiền. Ba trẻ em đang bị giam giữ trên tàu nghe lỏm họ. Người lớn nhất, Amanda, người là cha là một thợ săn kho báu chuyên nghiệp, biết được nơi của một kho tàng lớn, và cung cấp cho họ một thỏa thuận. Nếu họ giúp họ đưa ra một lối thoát sạch, họ có thể mất tất cả các kho báu mà họ muốn. Họ đồng ý, và năm người họ hầu như không thoát ra và làm cho nó vào một hòn đảo nhỏ, nơi họ gặp Luffy và phi hành đoàn của ông. Đáng tiếc là họ đã theo đuổi và Luffy và Amanda bị bắt và mang về cho ông chủ của họ, người đứng đầu của Pirates Bayan, cũng là sau khi các kho báu. Bây giờ Luffy và những người khác phải chiến đấu với hải tặc Bayan và tìm thấy những kho báu mà cha của Amanda đã để lại cho con cái của mình. Amanda, người đã luôn bực bội phiêu lưu và kho báu vì cha cô đã liên tục đi tìm kiếm cho nó, cuối cùng hiểu được cảm xúc của mình.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-uzGU1wHuzm.jpg','One Piece: Oounabara ni Hirake! Dekkai Dekkai Chichi no Yume!',83733,1,NULL,1,6),(9,0,'one-piece-episode-of-sabo-3-kyoudai-no-kizuna-kiseki-no-saikai-to-uketsugareru-ishi-i3-a2078',0,0,97,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau 2 năm luyện tập, Băng Mũ Rơm đã hẹn cùng nhau hội ngộ tại Quần Đảo Sabaody. Họ vượt qua Đảo Người Cá và tiến đến Tân Thế Giới. Địa điểm đầu tiên sau khi qua Tân Thế Giới là Punk Hazard, tại đây họ gặp lại Trafalgar Law – thuyền trưởng băng hải tặc Heart. Trafalgar Law đề nghị với Luffy rằng 2 băng hải tặc sẽ liên minh với nhau để hạ bệ Tứ Hoàng, và việc đầu tiên để có thể hạ bệ Kaido – 1 trong các Tứ Hoàng, đó chính là tấn công Doflamingo. Họ đã đến Vương Quốc Dressrosa do Doflamingo cai trị. Nhưng 1 sự việc không lường trước, 1 cuộc thi ở Đấu Trường với phần thưởng là trái Mera-Mera mà Portgas D. Ace (anh kết nghĩa của Luffy), cũng chính là cái bẫy của Doflamingo sắp đặt sẵn. Luffy giả dạng để đi thi đấu với cái tên Lucy. Chính vào lúc đó, Ông Lính Chì đã chỉ ra “mặt tối” của Dressrosa cho mọi người thấy. Ông Lính Chì chỉ huy đội quân Người Tí Hon để giải cứu bạn bè của Người Tí Hon cũng như chống lại Doflamingo. Sau khi Luffy thi đấu qua vòng bảng, cậu bất ngờ khi người đứng trước mặt cậu lại là Sabo, người anh trai kết nghĩa khác mà cậu ngỡ anh ấy đã chết từ lâu… Phim sẽ không chỉ xoay quanh những kỉ niệm về thời thơ ấu của cả 3 nhân vật này mà sẽ còn lan sang cả những tình tiết về cuộc đoàn tụ giữa Luffy cùng Ace, tới lúc Ace bị xử tử và cả khi năng lực trái Mera Mera của Ace được trao cho Sabo.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-eiF9RNLiJs.jpg','One Piece: Episode of Sabo - 3 Kyoudai no Kizuna Kiseki no Saikai to Uketsugareru Ishi',4345546,1,NULL,1,19),(10,0,'one-piece-movie-7-karakuri-jou-no-mecha-kyohei-i3-a2063',0,0,26,NULL,NULL,NULL,'Trọn bộ HD VietSub','Nhóm Luffy nhặt được một chiếc hòm lạ và...','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-Kh6MZFqu9v.jpg','One Piece Movie 7: Karakuri-jou no Mecha Kyohei',64573,1,NULL,1,11),(11,0,'one-piece-movie-5-norowareta-seiken-i3-a2061',0,0,21,NULL,NULL,NULL,'Trọn bộ HD VietSub','Luffy và phi hành đoàn đi đến hòn đảo Asuka để tìm kiếm một thanh kiếm huyền thoại đắt giá nhất hành tinh mặc dù nó chứa một lời nguyền chết người và một kho báu giá trị. Khi trở lại, cả nhóm phát hiện ra Zoro – người được giao nhiệm vụ trông tàu đã mất tích và bất ngờ bị lính thủy tấn công.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-cRbdfAZ3fG.jpg','One Piece Movie 5: Norowareta Seiken',55390,1,NULL,1,8),(12,0,'one-piece-umi-no-heso-no-daibouken-hen-i3-a2070',0,0,29,NULL,NULL,NULL,'Trọn bộ SD VietSub','Special thứ nhất của One Piece.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-EaQ1HnhzYw.jpg','One Piece: Umi no Heso no Daibouken-hen',88539,1,NULL,1,3),(13,0,'one-piece-dao-hai-tac-a1',0,0,77691,NULL,NULL,NULL,'Phim đang chiếu/Cập Nhật Tập 1035 VietSub','Đảo Hải Tặc - One Piece là chuyện về cậu bé Monkey D. Luffy do ăn nhầm Trái Ác Quỷ, bị biến thành người cao su và sẽ không bao giờ biết bơi. 10 năm sau sự việc đó, cậu rời quê mình và kiếm đủ 10 thành viên để thành một băng hải tặc, biệt hiệu Hải tặc Mũ Rơm. Khi đó của phiêu lưu tìm kiếm kho báu One Piece bắt đầu. Trong cuộc phiêu lưu tìm kiếm One Piece, băng Hải tặc mũ rơm phải chiến đấu với nhiều băng hải tặc xấu khác cũng muốn độc chiếm One Piece và Hải quân của Chính phủ muốn diệt trừ hải tặc. Băng Hải tặc Mũ Rơm phải trải qua biết bao nhiêu khó khăn, không lùi bước với ước mơ \"Trở thành Vua Hải Tặc và chiếm được kho báu One Piece\".','http://cdn.animevietsub.cc/data/poster/2019/09/27/animevsub-sQCBqYz9ve.jpg','One Piece - Đảo Hải Tặc',59474131,1,NULL,1,1),(14,0,'one-piece-movie-6-omatsuri-danshaku-to-himitsu-no-shima-i2-a2062',0,0,35,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau khi nhận được lời mời bí ẩn từ đảo Omatsuri, nhóm Luffy không thể khước từ những ngày thư giãn và giải trí ở đây. Nhưng ít họ biết, để tận hưởng những ngày thư giãn này, họ phải tuân theo các quy tắc của Baron Omatsuri và tham gia vào cuộc thử thách địa ngục. Nhưng liệu nó có đáng giá? Luffy có vẻ suy nghĩ như vậy ... Trên đảo Omatsuri , một cuộc gặp gỡ giữa một gia đình Hải Tặc và một cựu thuyền trưởng cướp biể vừa làm sáng tỏ một vài bí ẩn. Và nó gây ra sự quan tâm từ Robin. Đảo Omatsuri là nơi đặc thù của hoa Lily và hoa cẩm chướng. Mũ Rơm được nhắc nhở về tầm quan trọng của một tình bạn thực sự khi lòng trung thành không còn.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-LtwLR8UqaS.jpg','One Piece Movie 6: Omatsuri Danshaku to Himitsu no Shima',62937,1,NULL,1,9),(15,0,'one-piece-adventure-of-nebulandia-i3-a2080',0,0,35,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong tập phim này đặc biệt này, nhóm Mũ Rơm sẽ lại chiến đấu với băng hải tặc Foxy tại Tân Thế Giới, trên một hòn đảo mang tên Nebulandia. Trong khi Zoro và Sanji đang thi thố ăn uống thì họ ăn phải một loại nấm vô dụng nên trở lên lười nhác, và cuối cùng bị tống vào một chiếc lồng. Toàn bộ kế hoạch đều do một tay quân sư tài ba Komei (nhân vật ngoại truyện) bố trí, nhằm mục đích tiêu hao sức mạnh của băng Mũ Rơm. Thủy thủ đoàn băng Mũ Rơm đã lần theo dấu vết để đi cứu đồng đội, nhưng cuối cùng lại rơi vào một miền đất lạ lẫm có tên là \"Nelulandia\", nơi quanh năm bao phủ bởi sương mù của biển, khiến cho năng lực Trái Ác Quỷ trở nên vô dụng. Thật không may đối với băng Mũ Rơm, họ đã bị tấn công bởi chiến lược tinh anh của nhà quân sư tài ba kia. Liệu băng Mũ Rơm có an toàn thoát khỏi hòn đảo kỳ bí này hay không? Nguồn : Vuighe','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-70pz3gOeM3.jpg','One Piece: Adventure of Nebulandia',1343917,1,NULL,1,20),(16,0,'one-piece-film-gold-i3-a2069',0,0,318,NULL,NULL,NULL,'Trọn bộ HD VietSub','Movie 2016 của phim One Piece Film: Gold ......','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-vOZC2Kljvj.jpg','One Piece Film: Gold',264422,1,NULL,1,21),(17,0,'one-piece-heart-of-gold-i3-a2079',0,0,46,NULL,NULL,NULL,'Trọn bộ HD VietSub','Tập đặc biệt giới thiệu cho One Piece Film Gold chiếu rạp vào ngày 23/07/2016 ở Nhật, Tesoro đang truy tìm một kho báu bí ẩn tên là \"Vàng Nguyên Chất\". Băng Mũ Rơm vô tình gặp được một cô gái biết vị trí cất giấu kho báu bí ẩn đó, nên họ quyết định tiến thẳng đến nơi cất giấu kho báu bí ẩn - hòn đảo huyền thoại Arukemi.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-PFOak36teZ.jpg','One Piece: Heart of Gold',93368,1,NULL,1,22),(18,0,'one-piece-film-strong-world-i3-a2066',0,0,181,NULL,NULL,NULL,'Trọn bộ HD VietSub','Sau 2 năm ở Impel - Shiki đã trốn thoát bằng cách tự cắt đứt chân mình, sau đó hắn thay chân bằng 2 thanh gươm yêu quí - thành ra \"Golden Leo\" có 2 chân là 2 thanh gươm...< Sau cuộc đào tẩu làm chấn động thế giới, Shiki lại bất ngờ biến mất sau cuộc gặp với \"Râu Trắng\". Và hình ảnh cuối cùng mà ta biết đó là hắn đang ở trên một hòn đảo kì lạ với những sinh vật dị thường, chuẩn bị cho 1 kế hoạch 20 năm - \"Alright, I\'ll activate the plan 20 years from now on!!! I\'ll create the Hell on Earth !!\" 20 năm đã trôi qua kể từ ngày ấy... Một hải tặc trẻ tuổi mang tên Monkey.D.Luffy đã ra đời ...','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-CNpO1Fp0IE.jpg','One Piece Film: Strong World',149920,1,NULL,1,14),(19,0,'one-piece-3d-mugiwara-chase-i3-a2067',0,0,8,NULL,NULL,NULL,'Trọn bộ HD VietSub','Movie 3D của One Piece Câu chuyện kể về một hải tặc già, một con chó ăn được trái ác quỷ tori tori, một thuyền trưởng bị lấy trộm mất chiếc mũ rơm, một kiếm khách đi lạc đường…..Xem rồi rõ','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-cbj9LHN3AQ.jpg','One Piece 3D: Mugiwara Chase',55427,1,NULL,1,15),(20,0,'one-piece-film-red-a4484',0,0,704,NULL,NULL,NULL,'Tập PV','One Piece Film: Red là bộ phim hoạt hình anime của Nhật Bản thuộc thể loại kỳ ảo, hành động-phiêu lưu được sản xuất bởi Toei Animation. Đây là phần phim thứ mười lăm trong loạt phim điện ảnh của One Piece, dựa trên bộ truyện manga nổi tiếng cùng tên của tác giả Eiichiro Oda. Phim được công bố lần đầu tiên vào ngày 21 tháng 11, 2021 để kỷ niệm sự ra mắt của tập phim thứ 1000 của bộ anime One Piece và sau khi tập phim này được phát sóng, đoạn quảng cáo và áp phích chính thức của phim cũng chính thức được công bố. Phim dự kiến sẽ phát hành vào ngày 6 tháng 8 năm 2022. Bộ phim được giới thiệu sẽ là hành trình xoay quanh một nhân vật nữ mới cùng với Shanks \"Tóc Đỏ\".','http://cdn.animevietsub.cc/data/poster/2022/08/04/animevsub-0PY6DPdY7W.jpg','One Piece Film: Red',1639050,1,NULL,1,26),(21,0,'one-piece-movie-4-dead-end-no-bouken-i3-a9',0,0,39,NULL,NULL,NULL,'Trọn bộ HD VietSub','Nhóm Luffy có cuộc hành trính tới bến cảng Anabaru. Tại đây đang tổ chức một cuộc thi mà người chiến thắng sẽ có được một món tiền thưởng rất lớn nếu như giành vị trí quán quân. Nami vô cùng phấn khích và đã quyết định tham gia cuộc thi này.','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-5448.jpg','One Piece Movie 4: Dead End no Bouken',103793,1,NULL,1,6),(22,0,'one-piece-movie-2-nejimaki-jima-no-daibouken-i3-a7',0,0,43,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong khi băng hải tặc Mũ Rơm đang thưởng thức một ngày ấm áp tại bãi biển, thuyền của họ - Going Merry, đã bị đánh cắp. Họ không thể làm gì ngoài việc đứng nhìn, trong khi chiếc thuyền biến mất vào khoảng không. Khi đuổi theo chiếc thuyền, họ đụng phải Băng Cướp Anh Em, những kẻ có ý định đánh cắp chiếc Đồng Hồ Kim Cương trên Đảo Clockwork để trở thành băng cướp vĩ đại nhất. Sau đó, họ còn đụng độ băng hải tặc Anh Em nhà Trump, một nhóm gồm nhiều hải tặc nguy hiểm với thủ lĩnh của chúng, Bear King, kẻ đang có ý định trở thành vua hải tặc. Sau khi Nami bị bắt cóc, băng Mũ Rơm đã đi tới đảo Clockwork và thách đấu băng Anh Em nhà Trump, một trận chiến tuyệt vời tại lâu đài Trump đã diễn ra. Liệu băng hải tặc Mũ Rơm có chiến thắng và tìm lại chiếc thuyền của mình? Mời các bạn theo dõi bộ phim.','http://cdn.animevietsub.cc/data/poster/2017/08/08/animevsub-poster-2897.jpg','One Piece Movie 2: Nejimaki-jima no Daibouken',97607,1,NULL,1,4),(23,0,'one-piece-episode-of-sorajima-i1-a3209',0,0,46,NULL,NULL,NULL,'Trọn bộ HD VietSub','Cốt truyện xoay quanh băng Mũ Rơm trên đường đến đảo Skypeia. Sau khi tình cờ có vài manh mối về đảo trên trời, băng Mũ Rơm đã dừng chân tại đảo Jaya và vô tình gặp gỡ \"Râu Đen\" Marshall D. Teach - một kẻ cũng có tham vọng làm Vua Hải Tặc.Với sự giúp đỡ của Montblanc Cricket và Liên hợp quân núi khỉ đã đưa băng Mũ Rơm lên trên trời thành công. Sau khi lên đến đảo trên trời Skypie, băng Mũ Rơm đã vướng vào cuộc chiến tranh giành quyền làm chủ hòn đảo giữa hai tộc người Skypie và Shandia. Enel, kẻ sở hữu sức mạnh của sấm sét là người đứng đầu bên Skypie. Luffy đã đánh bại Enel và cứu Skypie khỏi thảm họa diệt vọng, cuộc chiến kết thúc.','http://cdn.animevietsub.cc/data/poster/2018/09/03/animevsub-DpjvHefjvl.jpg','One Piece: Episode of Sorajima',4388871,1,NULL,1,24),(24,0,'one-piece-movie-8-episode-of-alabasta-sabaku-no-oujo-to-kaizoku-tachi-i3-a2064',0,0,15,NULL,NULL,NULL,'Trọn bộ HD VietSub','Luffy và băng Mũ Rơm giúp đỡ công chúa Vivi giải cứu đất nước đang chìm trong nội chiến của cô. Tất cả đều do một tay Crocodile – một DF user rất mạnh và tổ chức Baroque Works của hắn gây ra. Liệu họ có chống lại được Crocodile hùng mạnh hay không?','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-stUzG1qMra.jpg','One Piece Movie 8: Episode of Alabasta - Sabaku no Oujo to Kaizoku-tachi',49715,1,NULL,1,12),(25,0,'one-piece-movie-1-i3-a6',0,0,115,NULL,NULL,NULL,'Trọn bộ HD VietSub','Một tên cướp biển được gọi là Great vàng Pirate Woonan, người thu được gần 1/3 vàng của thế giới. Trong suốt một vài năm, sự tồn tại của tên cướp biển đã bị mờ, và một truyền thuyết lớn rằng ông biến mất với vàng của mình tới một hòn đảo xa xôi, những tên cướp biển tiếp tục tìm kiếm. Trên tàu Going Merry, Luffy và phi hành đoàn của mình, bị bỏ đói và trong lúc thiếu thận trọng họ bị cướp kho báu. Trong một nỗ lực để có được nó trở lại, họ phá hoại tàu nơi nghỉ ngơi, được hướng dẫn bởi một cậu bé tên là Tabio, người là một phần của băng hải tặc bắt giữ El Drago. Tình yêu El Drago với vàng đã khiến anh ta để tìm hòn đảo của Woonan, và nhờ vào bản đồ kho báu của Woonan, ông tìm thấy nó. Trong thời gian này, phi hành đoàn của Luffy đã được tách ra, và mặc dù hoàn cảnh riêng của họ, họ phải tìm cách ngăn chặn El Drago lấy đi vàng của Woonan.','http://cdn.animevietsub.cc/data/poster/2017/08/05/animevsub-poster-7780.jpg','One Piece Movie 1',233062,1,NULL,1,2),(26,0,'one-piece-3d2y-ace-no-shi-wo-koete-luffy-nakama-tono-chikai-i3-a2077',0,0,76,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong trận Marineford (Tổng Bộ Hải Quân), Luffy đau khổ khi mất đi người anh trai của mình – Ace và cậu nhận ra rằng mình còn những người đồng đội (nakama). Để vượt qua nỗi buồn và quyết tâm mạnh hơn nữa để bảo vệ đồng đội mình, cậu đã nhờ Rayleigh chỉ bảo và dạy cậu cách để mạnh hơn. Quá trình tập luyện của Luffy kéo dài 2 năm tại đảo Rusukaina. Một tên hải tặc khét tiếng tên Budy World (do tác giả Eiichiro Oda tự tay thiết kế) còn được biết đến với biệt danh “Kẻ Hủy Diệt Thế Giới” bị nhốt ở tầng 6 Impel Down – nhà tù lớn nhất thế giới, Budy World ăn trái ác quỷ Moa Moa (More-More: hơn nữa), nhưng không may là Budy World đã trốn thoát ra được. Một cuộc triệu tập khẩn cấp giữa Chính Quyền Thế Giới và Thất Vũ Hải về mức nguy hiểm của Budy World khi trốn ngục. Budy World đã nhắm đến mục tiêu là Boa Hancock, Budy World bắt giữ Boa Hancock để thực hiện 1 âm mưu đen tối của mình. Luffy sẽ được luyện tập cùng Rayleigh. Cũng như Luffy và Boa Hancock sẽ cùng nhau chống lại Budy World. Ngoài những nhân vật đã kể xuất hiện trong bộ đặc biệt này như Luffy, Rayleigh, Boa Hancock thì còn có thêm những nhân vật khác có mặt trong tập anime đặc biệt này như Mihawk, Perona, Buggy, Mr.3, Akainu…','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-Mps2RfaveU.jpg','One Piece 3D2Y: Ace no shi wo Koete! Luffy Nakama Tono Chikai',77160,1,NULL,1,18),(27,0,'one-piece-nenmatsu-tokubetsu-kikaku-mugiwara-no-luffy-oyabun-torimonochou-i3-a2073',0,0,32,NULL,NULL,NULL,'Trọn bộ HD VietSub','Trong một thế giới thực tại khác tương tự như thời kỳ Edo Nhật Bản, Luffy hoạt động như một thành viên của cảnh sát. Điều này được tạo thành từ hai cuộc phiêu lưu: trong lần đầu tiên, Buggy làm cho rắc rối trong thị trấn; trong lần thứ hai, một cô gái bí ẩn tên Vivi xuất hiện. Điều này đặc biệt có một số khách mời từ các nhân vật trong suốt toàn bộ series. (phát sóng sau Episode 253) đặc biệt này có chứa một số khách mời từ các nhân vật trong suốt toàn bộ series. Một cặp thứ hai của tập phim đã được phát sóng sau khi tập phim 290, tiếp tục câu chuyện này, như là một phần của đặc biệt của năm mới.','http://cdn.animevietsub.cc/data/poster/2017/09/17/animevsub-MNxVXzezKh.jpg','One Piece: Nenmatsu Tokubetsu Kikaku! Mugiwara no Luffy Oyabun Torimonochou',40028,1,NULL,1,10),(28,0,'naruto-nguoi-ke-thua-hoa-chi-a523',0,0,58,NULL,NULL,NULL,'Trọn bộ HD VietSub','Nói về nguy cơ nổ ra Đại chiến Ninja lần thứ 4 khi các ninja có huyết kế giới hạn ở các làng sương mù, làng đá, làng mây và làng cát bỗng nhiên bắt đầu biến mất. Các quốc gia nghi ngờ làng lá - làng duy nhất không bị ảnh hưởng - đã gây ra tai nạn trên và tung tin đồn về việc Konoha đang có kế hoạch tạo phản. Đồng thời họ điều động quân đội đến biên giới Hỏa Quốc chuẩn bị phát động tấn công. Những người đứng đầu Hỏa Quốc phải chứng minh sự trong sạch của Konoha - tìm ra nguyên nhân vụ việc, nếu không họ sẽ phải xóa xổ cả làng để giữ hòa bình thế giới.','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-14686.jpg','Naruto: Người kế thừa Hỏa chí',3213456,1,NULL,2,32),(29,0,'naruto-r2-a516',0,0,2660,NULL,NULL,NULL,'Full','Phần đầu trong hai loạt phim hoạt hình được sản xuất bởi Studio Pierrot và Aniplex đã công chiếu khắp Nhật Bản trên mạng lưới truyền hình TV Tokyo và mạng lưới hoạt hình truyền hình vệ tinh Animax vào ngày 3 tháng 10 năm 2002. Phần đầu tiên kéo dài trong 9 mùa 12 năm trước, hồ ly 9 đuôi tấn công làng ninja Mộc Diệp, Hokage Đệ Tứ đã đánh bại và phong ấn vào cậu bé Naruto.Từ đó, Naruto bị mọi người xa lánh, vậy nên cậu tìm ra cách được thừa nhận và chú ý duy nhất – qua các trò phá phách và nghịch ngợm.Câu chuyện chính bám theo sự trưởng thành và tiến bộ của Naruto và bạn cậu khi làm ninja, và nhấn mạnh mối quan hệ giữa họ và sự ảnh hưởng của quá khứ đến tính cách họ. Naruto tìm được hai người bạn đồng hành cùng là Uchiha Sasuke và Haruno Sakura, cuộc phiêu lưu bắt đầu.','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-17405.jpg','Naruto',2026843,1,NULL,2,27),(30,0,'naruto-duong-toi-ninja-a526',0,0,94,NULL,NULL,NULL,'Trọn bộ HD VietSub','Khi dòng chảy cuộc đời cứ xoay vòng, Làng Lá lại tiếp tục bị tấn công bởi những thành viên của Akatsuki(暁 - \"Dawn\"), tập hợp của những tên shinobi ghê gớm nhất: Hidan, Konan, Itachi, Kisame, Sasori, Deidara,Kakuzu! Naruto đã ngăn chặn được tất cả âm mưu ấy. Nhưng còn những cái chết liên tiếp của các \"Akatsuki\", đâu là sự thật đằng sau tất cả, kẻ nào thật sự cần phải tiêu diệt? Bí ẩn vẫn còn đấy, những thế hệ tiếp nối sẽ mãi được tôn vinh như những shinobi anh hùng trong những nhiệm vụ cam go và đầy thử thách. Vẫn không biết được khuôn mặt của cha mẹ mình, cậu cảm thấy rất cô đơn và lạc lõng...Thế nhưng người đàn ông luôn ẩn sau chiếc mặt nạ sắt bí ẩn ấy đã tiết lộ những góc khuất đen tối của Konoha, và đã tấn công Naruto và Sakura! Bây giờ những tham vọng đen tối nhất đã được phơi bày, mục đích của hắn khi lợi dụng sức mạnh Cửu Vỹ là gì?! Cùng với cả những cái bẫy giăng ra dành cho shinobi Làng Lá? Khốc liệt, và không thể bỏ qua movie này!!','http://cdn.animevietsub.cc/data/poster/2017/09/08/animevsub-51863.jpg','Naruto: Đường tới Ninja',284366,1,NULL,2,35),(31,0,'naruto-huyen-thoai-da-gelel-a519',0,0,28,NULL,NULL,NULL,'Trọn bộ HD VietSub','Câu chuyện mở đầu với trận chiến tại một bờ biển hoang vắng vào ban đêm giữa ninja làng Cát và những tên khổng lồ mặc chiếc áo giáp nâu. Những ninja làng Cát đang hoàn toàn bị thất thế trước những tên to lớn này. Đúng lúc đó Gaara và Kankuro xuất hiện để bảo vệ họ. Do lá chắn cát của Gaara quá mạnh nên những tên to lớn kia buộc phải rút lui. Họ nhìn thấy những tên ấy chạy ra một con tàu chiến giữa biển. 2 ninja quyết chèo thuyền ra để tìm hiểu rõ về con tàu ấy, mặc cho người khác khuyên ngăn, khi bóng họ và tàu khuất dần, tất cả chỉ nghe thấy tiếng kêu thất thanh và không thấy họ quay lại nữa.','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-76016.jpg','Naruto: Huyền thoại đá Gelel',62339,1,NULL,2,28),(32,0,'naruto-huyet-nguc-a525',0,0,76,NULL,NULL,NULL,'Trọn bộ HD VietSub','Bị bắt sau khi bị kết tội mưu đồ ám sát Raikage, lãnh đạo tối cao của làng Mây cũng như sát hại các ninja Thượng đẳng của làng Sương Mù và làng Đá, Naruto sau đó bị giam vào ngục Hozukijou (còn được gọi là Huyết Ngục). Mui - kẻ đứng đầu nơi này sử dụng một loại nhẫn thuật tối thượng để đánh cắp sức mạnh của những tù nhân ở đây. Naruto cũng cảm nhận được mình đang bị thế lực nào đó truy sát. Những cuộc điều tra nhằm tìm ra sự thật về kẻ sát nhân giấu mặt cũng như khẳng định sự vô tội của Naruto từ đó cũng bắt đầu.','http://cdn.animevietsub.cc/data/poster/2017/09/08/animevsub-41403.jpg','Naruto: Huyết ngục',275155,1,NULL,2,34),(33,0,'boruto-naruto-the-he-ke-tiep-r2-a517',0,0,10607,NULL,NULL,NULL,'Phim đang chiếu/Cập Nhật Tập 270 VietSub','Naruto đã đạt ước nguyện của mình trở thành Hokage và kết hôn cùng Hinata sau đó có 2 đứa con Tên là Boruto và Himawari thế là Một thế hệ mới của Ninja đã sẵn sàng để có những giai đoạn mới nối tiếp. Phần thứ 2 Naruto Shippuuden','http://cdn.animevietsub.cc/data/poster/2020/10/31/animevsub-sv6GCRbkcE.jpg','Boruto: Naruto Những Thế Hệ Kế Tiếp',9525026,1,NULL,2,37),(34,0,'naruto-ngoai-truyen-rock-lee-a528',0,0,55,NULL,NULL,NULL,'Full','Naruto SD - Rock Lee no Seishun Full-Power Ninden được làm thêm từ manga Rock Lee\'s Springtime of Youth (tác giả: Kenji Taira - là trợ lý của Masashi Kishimoto), những nhân vật hoàn toàn trong manga Naruto Shippuuden (Tác giả: Masashi Kishimoto) nhưng được vẽ lại với phong cách chibi mới. Truyện phim xoay quanh những câu chuyện ngớ ngẩn của Rock Lee - một ninja nhưng không thể sử dụng nhẫn thuật và đồng đội của cậu','http://cdn.animevietsub.cc/data/poster/2017/09/08/animevsub-36475.jpg','Naruto Ngoại Truyện: Rock Lee',91155,1,NULL,2,36),(35,0,'naruto-nhung-linh-gac-cua-nguyet-quoc-a520',0,0,24,NULL,NULL,NULL,'Trọn bộ HD VietSub','Tập phim này xoay quanh nhiệm vụ do Naruto, Kakashi, Sakura, và Lee được cử bảo vệ một hoàng tử trong chuyến đi vòng quanh thế giới','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-76017.jpg','Naruto: Những lính gác của Nguyệt Quốc',51725,1,NULL,2,29),(36,0,'naruto-suc-manh-vi-thu-movie-1-a521',0,0,28,NULL,NULL,NULL,'Trọn bộ HD VietSub','Ác quỷ Mouryou đã từng một thời gần như hủy diệt hoàn toàn thế giới , nay lại được hồi sinh một lần nữa. Để giải cứu thế giới khỏi bị hủy diệt, để phong ấn ác quỷ Mouryou chỉ có duy nhất một người làm được. Đó là nữ pháp sư Shion ở Quỷ Quốc với hai sức mạnh đặc biệt, một là phong ấn ác quỷ, hai là tiên đoán được cái chết của người khác. Nhiệm vụ lần này của Naruto là hộ tống bảo vệ nữ pháp sư, nhưng cô ấy lại tiên đoán rằng Naruto sẽ bị chết. Cách duy nhất để thoát được cái chết là phải tránh xa Shion. Thế nhưng khi rời bỏ Shion thì ác quỷ Mouryou với dã tâm độc ác sẽ tìm đến và giết Shion, khi đó thế giới sẽ bị hủy diệt. Naruto đã quyết định sẽ chiến đấu tới cùng, thách thức cả lời tiên đoán về cái chết.','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-HiDwg4s.jpg','Naruto: Sức Mạnh Vĩ Thú Movie 1',3006596,1,NULL,2,12),(37,0,'boruto-dua-con-ngo-nghich-cua-naruto-r1-a529',0,0,50,NULL,NULL,NULL,'Trọn bộ HD VietSub','Những mẩu chuyện hài hước về Naruto cùng nhóm bạn. Gồm một số chuyên mục ngắn giới thiệu về những gì liên quan đến thế giới Shinobi qua lăng kính vui nhộn nơi hậu trường, được biên tập và dẫn chuyện bởi chính các nhân vật trong phim.','http://cdn.animevietsub.cc/data/poster/2018/05/05/animevsub-RHLyxOXMN4.jpg','Boruto: Đứa Con Ngỗ Nghịch Của Naruto',85061,1,NULL,2,20),(38,0,'naruto-suc-manh-vi-thu-r2-a5',0,0,14452,NULL,NULL,NULL,'Full','Tiếp nối phần I sau khi cậu bé cùng sư phụ Jiraiya của mình đi tập luyện xa trở về làng Lá. Sau khi huấn luyện 2 năm rưỡi với Jiraiya, Naruto trở về làng Lá, đoàn tụ với những người bạn cậu đã chia tay, và lập lại Nhóm 7, giờ được gọi là Nhóm Kakashi, với Sai thế chỗ Sasuke. Tất cả những người bạn của Naruto đều đã trưởng thành và thăng cấp, có người hơn người khác. Không giống như phần đầu khi chúng chỉ đóng vai trò phụ, tổ chức Akatsuki chiếm lấy vai trò đối nghịch chính trong tham vọng thống trị thế giới.','http://cdn.animevietsub.cc/data/poster/2017/08/03/animevsub-poster-5819.jpg','Naruto: Sức Mạnh Vĩ Thú',9416833,1,NULL,2,30),(39,0,'naruto-tran-chien-cuoi-cung-a527',0,0,196,NULL,NULL,NULL,'Trọn bộ HD VietSub','Hai năm sau khi các sự kiện của cuộc Chiến tranh Thế giới Thứ tư Shinobi, mặt trăng bắt đầu đi xuống về phía Trái đất. Với trăng bây giờ là một ngôi sao băng đó sẽ phá hủy tất cả mọi thứ về tác động, Naruto phải đối phó với mối đe dọa này. Trong khi đó, Toneri Ōtsutsuki, một hậu duệ của Hamura Ōtsutsuki xác định thực hiện về di sản tổ tiên mình, xuất hiện và bắt cóc Hanabi Hyuga sau khi thất bại trong việc bắt lấy Hinata. Naruto, Hinata, Sakura, Sai, và Shikamaru được triển khai để đi giải cứu Hanabi. Ngoài ra Toneri và Hinata cùng tham gia với anh. Tại thời điểm đó, Toneri đánh cắp Byakugan Hanabi và cấy chúng trong hốc mắt trống rỗng của mình, đánh thức các Tenseigan kín bởi con cháu của Hamura trong thiên niên kỷ qua. Ông cũng thành công trong việc bắt cóc Hinata, đề nghị cô kết hôn với anh ta. Cuối cùng, Naruto đã đánh bại Toneri, dừng lại mặt trăng rơi xuống, và cứu lấy Hinata. Naruto sau đó thú nhận tình yêu của mình cho Hinata cùng với hai nụ hôn. Bộ phim kết thúc với một loạt các đèn flash-rực rỡ cùng đám cưới Naruto và Hinata và con cái của họ, Boruto và Himawari.','http://cdn.animevietsub.cc/data/poster/2017/09/08/animevsub-67631.jpg','Naruto: Trận chiến cuối cùng',190808,1,NULL,2,18),(40,0,'naruto-suc-manh-vi-thu-movie-2-kizuna-a522',0,0,19,NULL,NULL,NULL,'Trọn bộ HD VietSub','Naruto Shippuuden The Movie 2: Bonds','http://cdn.animevietsub.cc/data/poster/2021/05/18/animevsub-0bQnFewKEC.png','Naruto: Sức Mạnh Vĩ Thú Movie 2 - Kizuna',3186083,1,NULL,2,31),(41,0,'naruto-toa-thap-bi-mat-a524',0,0,64,NULL,NULL,NULL,'Trọn bộ HD VietSub','Được giao một nhiệm vụ để bắt Mukade, một ninja phản bội, Naruto Uzumaki đến di tích lịch sử nổi tiếng là \"Ouran\". Mục tiêu Mukade được xuất hiện trong phế tích, hắn giải phóng sức mạnh được phong ấn bởi Hokage đệ tứ, gây ra một luồn ánh sáng bao lấy Naruto, gửi cậu vào quá khứ 20 năm về trước. Khi tỉnh dậy, Naruto gặp được Hokage thứ tư, Minato Namikaze. (Source: Wikipedia)','http://cdn.animevietsub.cc/data/poster/2017/09/07/animevsub-23344.jpg','Naruto: Tòa tháp bị mất',3224502,1,NULL,2,33);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_director`
--

LOCK TABLES `movie_seasons_director` WRITE;
/*!40000 ALTER TABLE `movie_seasons_director` DISABLE KEYS */;
INSERT INTO `movie_seasons_director` VALUES (4,8),(6,3),(10,1),(11,5),(12,4),(13,1),(13,2),(14,6),(15,1),(16,10),(17,11),(20,12),(21,1),(22,3),(24,7),(25,3),(26,9),(32,16),(33,18),(36,14),(37,13),(38,13),(39,17),(40,15);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_languages`
--

LOCK TABLES `movie_seasons_languages` WRITE;
/*!40000 ALTER TABLE `movie_seasons_languages` DISABLE KEYS */;
INSERT INTO `movie_seasons_languages` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_movie_genres`
--

LOCK TABLES `movie_seasons_movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_seasons_movie_genres` DISABLE KEYS */;
INSERT INTO `movie_seasons_movie_genres` VALUES (1,2),(1,4),(1,6),(1,7),(1,9),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(4,2),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(5,2),(5,3),(5,4),(5,6),(5,7),(5,8),(5,9),(6,2),(6,3),(6,4),(6,6),(6,7),(6,8),(6,9),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(8,2),(8,3),(8,4),(8,6),(8,7),(8,8),(8,9),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(10,2),(10,4),(10,6),(10,7),(10,9),(11,2),(11,3),(11,4),(11,6),(11,7),(11,8),(11,9),(12,2),(12,3),(12,4),(12,6),(12,7),(12,8),(12,9),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(14,2),(14,4),(14,6),(14,7),(14,9),(15,2),(15,3),(15,4),(15,6),(15,7),(15,8),(15,9),(16,2),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(17,2),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(18,2),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(19,2),(19,4),(19,6),(19,7),(19,8),(19,9),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,11),(21,2),(21,3),(21,4),(21,6),(21,7),(21,8),(21,9),(22,2),(22,3),(22,4),(22,6),(22,7),(22,8),(22,9),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10),(24,2),(24,4),(24,7),(24,8),(24,9),(25,2),(25,3),(25,4),(25,6),(25,7),(25,8),(25,9),(26,2),(26,4),(26,6),(26,7),(26,9),(27,2),(27,4),(27,6),(27,7),(27,9),(28,2),(28,3),(28,6),(28,8),(28,9),(28,12),(29,1),(29,2),(29,3),(29,6),(29,8),(29,12),(30,2),(30,3),(30,7),(30,8),(30,9),(30,12),(31,2),(31,4),(31,5),(31,6),(31,7),(31,9),(31,13),(32,2),(32,3),(32,7),(32,8),(32,9),(32,12),(32,14),(33,1),(33,2),(33,3),(33,7),(33,8),(33,12),(34,1),(34,6),(34,8),(34,15),(35,7),(35,8),(35,9),(36,2),(36,4),(36,6),(36,7),(36,8),(36,9),(37,2),(37,3),(37,6),(37,8),(37,9),(37,12),(38,1),(38,2),(38,3),(38,6),(38,8),(38,12),(39,2),(39,3),(39,8),(39,9),(39,12),(39,16),(40,2),(40,8),(40,9),(40,12),(40,13),(41,2),(41,3),(41,6),(41,8),(41,9),(41,12);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_studio`
--

LOCK TABLES `movie_seasons_studio` WRITE;
/*!40000 ALTER TABLE `movie_seasons_studio` DISABLE KEYS */;
INSERT INTO `movie_seasons_studio` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2);
/*!40000 ALTER TABLE `movie_seasons_studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_seasons_video`
--

DROP TABLE IF EXISTS `movie_seasons_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_seasons_video` (
  `TVSeasonEntity_id` bigint(20) NOT NULL,
  `videos_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_j6f0rmykdoxb96nr6o6t9s579` (`videos_id`),
  KEY `FKl3x98v57m3y1q9bc06b1mwt6c` (`TVSeasonEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_seasons_video`
--

LOCK TABLES `movie_seasons_video` WRITE;
/*!40000 ALTER TABLE `movie_seasons_video` DISABLE KEYS */;
INSERT INTO `movie_seasons_video` VALUES (1,1),(2,2),(4,3),(6,4),(7,5),(9,6),(10,7),(11,8),(12,9),(13,10),(14,11);
/*!40000 ALTER TABLE `movie_seasons_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviecastentity_photos`
--

DROP TABLE IF EXISTS `moviecastentity_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moviecastentity_photos` (
  `MovieCastEntity_id` bigint(20) NOT NULL,
  `photos` varchar(255) DEFAULT NULL,
  KEY `FKjcdquoi4wwko0sldswmohfwk` (`MovieCastEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviecastentity_photos`
--

LOCK TABLES `moviecastentity_photos` WRITE;
/*!40000 ALTER TABLE `moviecastentity_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviecastentity_photos` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paid_movie`
--

LOCK TABLES `paid_movie` WRITE;
/*!40000 ALTER TABLE `paid_movie` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (8,NULL,'1nFM1WemIm3WFjiETcVFNGGDdWzdZTXxP',NULL,'cbtongtulenh4@gmail.com',NULL,NULL);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','ADMIN'),(2,'user','USER');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'autumn-1999','Mùa Thu',1999),(2,'winter-2000','Mùa Đông',2000),(3,'autumn-2000','Mùa Thu',2000),(4,'winter-2001','Mùa Đông',2001),(5,'winter-2002','Mùa Đông',2002),(6,'spring-2003','Mùa Xuân',2003),(7,'autumn-2003','Mùa Thu',2003),(8,'winter-2004','Mùa Đông',2004),(9,'winter-2005','Mùa Đông',2005),(10,'autumn-2005','Mùa Thu',2005),(11,'winter-2006','Mùa Đông',2006),(12,'summer-2007','Mùa Hạ',2007),(13,'winter-2008','Mùa Đông',2008),(14,'autumn-2009','Mùa Thu',2009),(15,'winter-2011','Mùa Đông',2011),(16,'autumn-2012','Mùa Thu',2012),(17,'summer-2013','Mùa Hạ',2013),(18,'summer-2014','Mùa Hạ',2014),(19,'summer-2015','Mùa Hạ',2015),(20,'autumn-2015','Mùa Thu',2015),(21,'autumn-2016','Mùa Thu',2016),(22,'summer-2016','Mùa Hạ',2016),(23,'autumn-2017','Mùa Thu',2017),(24,'summer-2018','Mùa Hạ',2018),(25,'spring-2019','Mùa Xuân',2019),(26,'summer-2022','Mùa Hạ',2022),(27,'autumn-2002','Mùa Thu',2002),(28,'summer-2005','Mùa Hạ',2005),(29,'summer-2006','Mùa Hạ',2006),(30,'winter-2007','Mùa Đông',2007),(31,'summer-2008','Mùa Hạ',2008),(32,'summer-2009','Mùa Hạ',2009),(33,'summer-2010','Mùa Hạ',2010),(34,'summer-2011','Mùa Hạ',2011),(35,'summer-2012','Mùa Hạ',2012),(36,'spring-2012','Mùa Xuân',2012),(37,'spring-2017','Mùa Xuân',2017);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'toei-animation','Toei Animation'),(2,'studio-pierrot','Studio Pierrot');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=2113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_episodes`
--

LOCK TABLES `tv_episodes` WRITE;
/*!40000 ALTER TABLE `tv_episodes` DISABLE KEYS */;
INSERT INTO `tv_episodes` VALUES (1,1,'DiUKh_MjsI0',0,NULL,NULL,1),(2,1,'DiUKh_MjsI0',0,NULL,NULL,2),(3,1,'DiUKh_MjsI0',0,NULL,NULL,3),(4,1,'DiUKh_MjsI0',0,NULL,NULL,4),(5,1,'DiUKh_MjsI0',0,NULL,NULL,5),(6,1,'DiUKh_MjsI0',0,NULL,NULL,6),(7,1,'DiUKh_MjsI0',0,NULL,NULL,7),(8,1,'DiUKh_MjsI0',0,NULL,NULL,8),(9,1,'DiUKh_MjsI0',0,NULL,NULL,9),(10,1,'DiUKh_MjsI0',0,NULL,NULL,10),(11,1,'DiUKh_MjsI0',0,NULL,NULL,11),(12,1,'DiUKh_MjsI0',0,NULL,NULL,12),(13,1,'DiUKh_MjsI0',0,NULL,NULL,13),(14,2,'DiUKh_MjsI0',0,NULL,NULL,13),(15,3,'DiUKh_MjsI0',0,NULL,NULL,13),(16,4,'DiUKh_MjsI0',0,NULL,NULL,13),(17,5,'DiUKh_MjsI0',0,NULL,NULL,13),(18,6,'DiUKh_MjsI0',0,NULL,NULL,13),(19,7,'DiUKh_MjsI0',0,NULL,NULL,13),(20,8,'DiUKh_MjsI0',0,NULL,NULL,13),(21,9,'DiUKh_MjsI0',0,NULL,NULL,13),(22,10,'DiUKh_MjsI0',0,NULL,NULL,13),(23,11,'DiUKh_MjsI0',0,NULL,NULL,13),(24,12,'DiUKh_MjsI0',0,NULL,NULL,13),(25,13,'DiUKh_MjsI0',0,NULL,NULL,13),(26,14,'DiUKh_MjsI0',0,NULL,NULL,13),(27,15,'DiUKh_MjsI0',0,NULL,NULL,13),(28,16,'DiUKh_MjsI0',0,NULL,NULL,13),(29,17,'DiUKh_MjsI0',0,NULL,NULL,13),(30,18,'DiUKh_MjsI0',0,NULL,NULL,13),(31,19,'DiUKh_MjsI0',0,NULL,NULL,13),(32,20,'DiUKh_MjsI0',0,NULL,NULL,13),(33,21,'DiUKh_MjsI0',0,NULL,NULL,13),(34,22,'DiUKh_MjsI0',0,NULL,NULL,13),(35,23,'DiUKh_MjsI0',0,NULL,NULL,13),(36,24,'DiUKh_MjsI0',0,NULL,NULL,13),(37,25,'DiUKh_MjsI0',0,NULL,NULL,13),(38,26,'DiUKh_MjsI0',0,NULL,NULL,13),(39,27,'DiUKh_MjsI0',0,NULL,NULL,13),(40,28,'DiUKh_MjsI0',0,NULL,NULL,13),(41,29,'DiUKh_MjsI0',0,NULL,NULL,13),(42,30,'DiUKh_MjsI0',0,NULL,NULL,13),(43,31,'DiUKh_MjsI0',0,NULL,NULL,13),(44,32,'DiUKh_MjsI0',0,NULL,NULL,13),(45,33,'DiUKh_MjsI0',0,NULL,NULL,13),(46,34,'DiUKh_MjsI0',0,NULL,NULL,13),(47,35,'DiUKh_MjsI0',0,NULL,NULL,13),(48,36,'DiUKh_MjsI0',0,NULL,NULL,13),(49,37,'DiUKh_MjsI0',0,NULL,NULL,13),(50,38,'DiUKh_MjsI0',0,NULL,NULL,13),(51,39,'DiUKh_MjsI0',0,NULL,NULL,13),(52,40,'DiUKh_MjsI0',0,NULL,NULL,13),(53,41,'DiUKh_MjsI0',0,NULL,NULL,13),(54,42,'DiUKh_MjsI0',0,NULL,NULL,13),(55,43,'DiUKh_MjsI0',0,NULL,NULL,13),(56,44,'DiUKh_MjsI0',0,NULL,NULL,13),(57,45,'DiUKh_MjsI0',0,NULL,NULL,13),(58,46,'DiUKh_MjsI0',0,NULL,NULL,13),(59,47,'DiUKh_MjsI0',0,NULL,NULL,13),(60,48,'DiUKh_MjsI0',0,NULL,NULL,13),(61,49,'DiUKh_MjsI0',0,NULL,NULL,13),(62,50,'DiUKh_MjsI0',0,NULL,NULL,13),(63,51,'DiUKh_MjsI0',0,NULL,NULL,13),(64,52,'DiUKh_MjsI0',0,NULL,NULL,13),(65,53,'DiUKh_MjsI0',0,NULL,NULL,13),(66,54,'DiUKh_MjsI0',0,NULL,NULL,13),(67,55,'DiUKh_MjsI0',0,NULL,NULL,13),(68,56,'DiUKh_MjsI0',0,NULL,NULL,13),(69,57,'DiUKh_MjsI0',0,NULL,NULL,13),(70,58,'DiUKh_MjsI0',0,NULL,NULL,13),(71,59,'DiUKh_MjsI0',0,NULL,NULL,13),(72,60,'DiUKh_MjsI0',0,NULL,NULL,13),(73,61,'DiUKh_MjsI0',0,NULL,NULL,13),(74,62,'DiUKh_MjsI0',0,NULL,NULL,13),(75,63,'DiUKh_MjsI0',0,NULL,NULL,13),(76,64,'DiUKh_MjsI0',0,NULL,NULL,13),(77,65,'DiUKh_MjsI0',0,NULL,NULL,13),(78,66,'DiUKh_MjsI0',0,NULL,NULL,13),(79,67,'DiUKh_MjsI0',0,NULL,NULL,13),(80,68,'DiUKh_MjsI0',0,NULL,NULL,13),(81,69,'DiUKh_MjsI0',0,NULL,NULL,13),(82,70,'DiUKh_MjsI0',0,NULL,NULL,13),(83,71,'DiUKh_MjsI0',0,NULL,NULL,13),(84,72,'DiUKh_MjsI0',0,NULL,NULL,13),(85,73,'DiUKh_MjsI0',0,NULL,NULL,13),(86,74,'DiUKh_MjsI0',0,NULL,NULL,13),(87,75,'DiUKh_MjsI0',0,NULL,NULL,13),(88,76,'DiUKh_MjsI0',0,NULL,NULL,13),(89,77,'DiUKh_MjsI0',0,NULL,NULL,13),(90,78,'DiUKh_MjsI0',0,NULL,NULL,13),(91,79,'DiUKh_MjsI0',0,NULL,NULL,13),(92,80,'DiUKh_MjsI0',0,NULL,NULL,13),(93,81,'DiUKh_MjsI0',0,NULL,NULL,13),(94,82,'DiUKh_MjsI0',0,NULL,NULL,13),(95,83,'DiUKh_MjsI0',0,NULL,NULL,13),(96,84,'DiUKh_MjsI0',0,NULL,NULL,13),(97,85,'DiUKh_MjsI0',0,NULL,NULL,13),(98,86,'DiUKh_MjsI0',0,NULL,NULL,13),(99,87,'DiUKh_MjsI0',0,NULL,NULL,13),(100,88,'DiUKh_MjsI0',0,NULL,NULL,13),(101,89,'DiUKh_MjsI0',0,NULL,NULL,13),(102,90,'DiUKh_MjsI0',0,NULL,NULL,13),(103,91,'DiUKh_MjsI0',0,NULL,NULL,13),(104,92,'DiUKh_MjsI0',0,NULL,NULL,13),(105,93,'DiUKh_MjsI0',0,NULL,NULL,13),(106,94,'DiUKh_MjsI0',0,NULL,NULL,13),(107,95,'DiUKh_MjsI0',0,NULL,NULL,13),(108,96,'DiUKh_MjsI0',0,NULL,NULL,13),(109,97,'DiUKh_MjsI0',0,NULL,NULL,13),(110,98,'DiUKh_MjsI0',0,NULL,NULL,13),(111,99,'DiUKh_MjsI0',0,NULL,NULL,13),(112,100,'DiUKh_MjsI0',0,NULL,NULL,13),(113,101,'DiUKh_MjsI0',0,NULL,NULL,13),(114,102,'DiUKh_MjsI0',0,NULL,NULL,13),(115,103,'DiUKh_MjsI0',0,NULL,NULL,13),(116,104,'DiUKh_MjsI0',0,NULL,NULL,13),(117,105,'DiUKh_MjsI0',0,NULL,NULL,13),(118,106,'DiUKh_MjsI0',0,NULL,NULL,13),(119,107,'DiUKh_MjsI0',0,NULL,NULL,13),(120,108,'DiUKh_MjsI0',0,NULL,NULL,13),(121,109,'DiUKh_MjsI0',0,NULL,NULL,13),(122,110,'DiUKh_MjsI0',0,NULL,NULL,13),(123,111,'DiUKh_MjsI0',0,NULL,NULL,13),(124,112,'DiUKh_MjsI0',0,NULL,NULL,13),(125,113,'DiUKh_MjsI0',0,NULL,NULL,13),(126,114,'DiUKh_MjsI0',0,NULL,NULL,13),(127,115,'DiUKh_MjsI0',0,NULL,NULL,13),(128,116,'DiUKh_MjsI0',0,NULL,NULL,13),(129,117,'DiUKh_MjsI0',0,NULL,NULL,13),(130,118,'DiUKh_MjsI0',0,NULL,NULL,13),(131,119,'DiUKh_MjsI0',0,NULL,NULL,13),(132,120,'DiUKh_MjsI0',0,NULL,NULL,13),(133,121,'DiUKh_MjsI0',0,NULL,NULL,13),(134,122,'DiUKh_MjsI0',0,NULL,NULL,13),(135,123,'DiUKh_MjsI0',0,NULL,NULL,13),(136,124,'DiUKh_MjsI0',0,NULL,NULL,13),(137,125,'DiUKh_MjsI0',0,NULL,NULL,13),(138,126,'DiUKh_MjsI0',0,NULL,NULL,13),(139,127,'DiUKh_MjsI0',0,NULL,NULL,13),(140,128,'DiUKh_MjsI0',0,NULL,NULL,13),(141,129,'DiUKh_MjsI0',0,NULL,NULL,13),(142,130,'DiUKh_MjsI0',0,NULL,NULL,13),(143,131,'DiUKh_MjsI0',0,NULL,NULL,13),(144,132,'DiUKh_MjsI0',0,NULL,NULL,13),(145,133,'DiUKh_MjsI0',0,NULL,NULL,13),(146,134,'DiUKh_MjsI0',0,NULL,NULL,13),(147,135,'DiUKh_MjsI0',0,NULL,NULL,13),(148,136,'DiUKh_MjsI0',0,NULL,NULL,13),(149,137,'DiUKh_MjsI0',0,NULL,NULL,13),(150,138,'DiUKh_MjsI0',0,NULL,NULL,13),(151,139,'DiUKh_MjsI0',0,NULL,NULL,13),(152,140,'DiUKh_MjsI0',0,NULL,NULL,13),(153,141,'DiUKh_MjsI0',0,NULL,NULL,13),(154,142,'DiUKh_MjsI0',0,NULL,NULL,13),(155,143,'DiUKh_MjsI0',0,NULL,NULL,13),(156,144,'DiUKh_MjsI0',0,NULL,NULL,13),(157,145,'DiUKh_MjsI0',0,NULL,NULL,13),(158,146,'DiUKh_MjsI0',0,NULL,NULL,13),(159,147,'DiUKh_MjsI0',0,NULL,NULL,13),(160,148,'DiUKh_MjsI0',0,NULL,NULL,13),(161,149,'DiUKh_MjsI0',0,NULL,NULL,13),(162,150,'DiUKh_MjsI0',0,NULL,NULL,13),(163,151,'DiUKh_MjsI0',0,NULL,NULL,13),(164,152,'DiUKh_MjsI0',0,NULL,NULL,13),(165,153,'DiUKh_MjsI0',0,NULL,NULL,13),(166,154,'DiUKh_MjsI0',0,NULL,NULL,13),(167,155,'DiUKh_MjsI0',0,NULL,NULL,13),(168,156,'DiUKh_MjsI0',0,NULL,NULL,13),(169,157,'DiUKh_MjsI0',0,NULL,NULL,13),(170,158,'DiUKh_MjsI0',0,NULL,NULL,13),(171,159,'DiUKh_MjsI0',0,NULL,NULL,13),(172,160,'DiUKh_MjsI0',0,NULL,NULL,13),(173,161,'DiUKh_MjsI0',0,NULL,NULL,13),(174,162,'DiUKh_MjsI0',0,NULL,NULL,13),(175,163,'DiUKh_MjsI0',0,NULL,NULL,13),(176,164,'DiUKh_MjsI0',0,NULL,NULL,13),(177,165,'DiUKh_MjsI0',0,NULL,NULL,13),(178,166,'DiUKh_MjsI0',0,NULL,NULL,13),(179,167,'DiUKh_MjsI0',0,NULL,NULL,13),(180,168,'DiUKh_MjsI0',0,NULL,NULL,13),(181,169,'DiUKh_MjsI0',0,NULL,NULL,13),(182,170,'DiUKh_MjsI0',0,NULL,NULL,13),(183,171,'DiUKh_MjsI0',0,NULL,NULL,13),(184,172,'DiUKh_MjsI0',0,NULL,NULL,13),(185,173,'DiUKh_MjsI0',0,NULL,NULL,13),(186,174,'DiUKh_MjsI0',0,NULL,NULL,13),(187,175,'DiUKh_MjsI0',0,NULL,NULL,13),(188,176,'DiUKh_MjsI0',0,NULL,NULL,13),(189,177,'DiUKh_MjsI0',0,NULL,NULL,13),(190,178,'DiUKh_MjsI0',0,NULL,NULL,13),(191,179,'DiUKh_MjsI0',0,NULL,NULL,13),(192,180,'DiUKh_MjsI0',0,NULL,NULL,13),(193,181,'DiUKh_MjsI0',0,NULL,NULL,13),(194,182,'DiUKh_MjsI0',0,NULL,NULL,13),(195,183,'DiUKh_MjsI0',0,NULL,NULL,13),(196,184,'DiUKh_MjsI0',0,NULL,NULL,13),(197,185,'DiUKh_MjsI0',0,NULL,NULL,13),(198,186,'DiUKh_MjsI0',0,NULL,NULL,13),(199,187,'DiUKh_MjsI0',0,NULL,NULL,13),(200,188,'DiUKh_MjsI0',0,NULL,NULL,13),(201,189,'DiUKh_MjsI0',0,NULL,NULL,13),(202,190,'DiUKh_MjsI0',0,NULL,NULL,13),(203,191,'DiUKh_MjsI0',0,NULL,NULL,13),(204,192,'DiUKh_MjsI0',0,NULL,NULL,13),(205,193,'DiUKh_MjsI0',0,NULL,NULL,13),(206,194,'DiUKh_MjsI0',0,NULL,NULL,13),(207,195,'DiUKh_MjsI0',0,NULL,NULL,13),(208,196,'DiUKh_MjsI0',0,NULL,NULL,13),(209,197,'DiUKh_MjsI0',0,NULL,NULL,13),(210,198,'DiUKh_MjsI0',0,NULL,NULL,13),(211,199,'DiUKh_MjsI0',0,NULL,NULL,13),(212,200,'DiUKh_MjsI0',0,NULL,NULL,13),(213,201,'DiUKh_MjsI0',0,NULL,NULL,13),(214,202,'DiUKh_MjsI0',0,NULL,NULL,13),(215,203,'DiUKh_MjsI0',0,NULL,NULL,13),(216,204,'DiUKh_MjsI0',0,NULL,NULL,13),(217,205,'DiUKh_MjsI0',0,NULL,NULL,13),(218,206,'DiUKh_MjsI0',0,NULL,NULL,13),(219,207,'DiUKh_MjsI0',0,NULL,NULL,13),(220,208,'DiUKh_MjsI0',0,NULL,NULL,13),(221,209,'DiUKh_MjsI0',0,NULL,NULL,13),(222,210,'DiUKh_MjsI0',0,NULL,NULL,13),(223,211,'DiUKh_MjsI0',0,NULL,NULL,13),(224,212,'DiUKh_MjsI0',0,NULL,NULL,13),(225,213,'DiUKh_MjsI0',0,NULL,NULL,13),(226,214,'DiUKh_MjsI0',0,NULL,NULL,13),(227,215,'DiUKh_MjsI0',0,NULL,NULL,13),(228,216,'DiUKh_MjsI0',0,NULL,NULL,13),(229,217,'DiUKh_MjsI0',0,NULL,NULL,13),(230,218,'DiUKh_MjsI0',0,NULL,NULL,13),(231,219,'DiUKh_MjsI0',0,NULL,NULL,13),(232,220,'DiUKh_MjsI0',0,NULL,NULL,13),(233,221,'DiUKh_MjsI0',0,NULL,NULL,13),(234,222,'DiUKh_MjsI0',0,NULL,NULL,13),(235,223,'DiUKh_MjsI0',0,NULL,NULL,13),(236,224,'DiUKh_MjsI0',0,NULL,NULL,13),(237,225,'DiUKh_MjsI0',0,NULL,NULL,13),(238,226,'DiUKh_MjsI0',0,NULL,NULL,13),(239,227,'DiUKh_MjsI0',0,NULL,NULL,13),(240,228,'DiUKh_MjsI0',0,NULL,NULL,13),(241,229,'DiUKh_MjsI0',0,NULL,NULL,13),(242,230,'DiUKh_MjsI0',0,NULL,NULL,13),(243,231,'DiUKh_MjsI0',0,NULL,NULL,13),(244,232,'DiUKh_MjsI0',0,NULL,NULL,13),(245,233,'DiUKh_MjsI0',0,NULL,NULL,13),(246,234,'DiUKh_MjsI0',0,NULL,NULL,13),(247,235,'DiUKh_MjsI0',0,NULL,NULL,13),(248,236,'DiUKh_MjsI0',0,NULL,NULL,13),(249,237,'DiUKh_MjsI0',0,NULL,NULL,13),(250,238,'DiUKh_MjsI0',0,NULL,NULL,13),(251,239,'DiUKh_MjsI0',0,NULL,NULL,13),(252,240,'DiUKh_MjsI0',0,NULL,NULL,13),(253,241,'DiUKh_MjsI0',0,NULL,NULL,13),(254,242,'DiUKh_MjsI0',0,NULL,NULL,13),(255,243,'DiUKh_MjsI0',0,NULL,NULL,13),(256,244,'DiUKh_MjsI0',0,NULL,NULL,13),(257,245,'DiUKh_MjsI0',0,NULL,NULL,13),(258,246,'DiUKh_MjsI0',0,NULL,NULL,13),(259,247,'DiUKh_MjsI0',0,NULL,NULL,13),(260,248,'DiUKh_MjsI0',0,NULL,NULL,13),(261,249,'DiUKh_MjsI0',0,NULL,NULL,13),(262,250,'DiUKh_MjsI0',0,NULL,NULL,13),(263,251,'DiUKh_MjsI0',0,NULL,NULL,13),(264,252,'DiUKh_MjsI0',0,NULL,NULL,13),(265,253,'DiUKh_MjsI0',0,NULL,NULL,13),(266,254,'DiUKh_MjsI0',0,NULL,NULL,13),(267,255,'DiUKh_MjsI0',0,NULL,NULL,13),(268,256,'DiUKh_MjsI0',0,NULL,NULL,13),(269,257,'DiUKh_MjsI0',0,NULL,NULL,13),(270,258,'DiUKh_MjsI0',0,NULL,NULL,13),(271,259,'DiUKh_MjsI0',0,NULL,NULL,13),(272,260,'DiUKh_MjsI0',0,NULL,NULL,13),(273,261,'DiUKh_MjsI0',0,NULL,NULL,13),(274,262,'DiUKh_MjsI0',0,NULL,NULL,13),(275,263,'DiUKh_MjsI0',0,NULL,NULL,13),(276,264,'DiUKh_MjsI0',0,NULL,NULL,13),(277,265,'DiUKh_MjsI0',0,NULL,NULL,13),(278,266,'DiUKh_MjsI0',0,NULL,NULL,13),(279,267,'DiUKh_MjsI0',0,NULL,NULL,13),(280,268,'DiUKh_MjsI0',0,NULL,NULL,13),(281,269,'DiUKh_MjsI0',0,NULL,NULL,13),(282,270,'DiUKh_MjsI0',0,NULL,NULL,13),(283,271,'DiUKh_MjsI0',0,NULL,NULL,13),(284,272,'DiUKh_MjsI0',0,NULL,NULL,13),(285,273,'DiUKh_MjsI0',0,NULL,NULL,13),(286,274,'DiUKh_MjsI0',0,NULL,NULL,13),(287,275,'DiUKh_MjsI0',0,NULL,NULL,13),(288,276,'DiUKh_MjsI0',0,NULL,NULL,13),(289,277,'DiUKh_MjsI0',0,NULL,NULL,13),(290,278,'DiUKh_MjsI0',0,NULL,NULL,13),(291,279,'DiUKh_MjsI0',0,NULL,NULL,13),(292,280,'DiUKh_MjsI0',0,NULL,NULL,13),(293,281,'DiUKh_MjsI0',0,NULL,NULL,13),(294,282,'DiUKh_MjsI0',0,NULL,NULL,13),(295,283,'DiUKh_MjsI0',0,NULL,NULL,13),(296,284,'DiUKh_MjsI0',0,NULL,NULL,13),(297,285,'DiUKh_MjsI0',0,NULL,NULL,13),(298,286,'DiUKh_MjsI0',0,NULL,NULL,13),(299,287,'DiUKh_MjsI0',0,NULL,NULL,13),(300,288,'DiUKh_MjsI0',0,NULL,NULL,13),(301,289,'DiUKh_MjsI0',0,NULL,NULL,13),(302,290,'DiUKh_MjsI0',0,NULL,NULL,13),(303,291,'DiUKh_MjsI0',0,NULL,NULL,13),(304,292,'DiUKh_MjsI0',0,NULL,NULL,13),(305,293,'DiUKh_MjsI0',0,NULL,NULL,13),(306,294,'DiUKh_MjsI0',0,NULL,NULL,13),(307,295,'DiUKh_MjsI0',0,NULL,NULL,13),(308,296,'DiUKh_MjsI0',0,NULL,NULL,13),(309,297,'DiUKh_MjsI0',0,NULL,NULL,13),(310,298,'DiUKh_MjsI0',0,NULL,NULL,13),(311,299,'DiUKh_MjsI0',0,NULL,NULL,13),(312,300,'DiUKh_MjsI0',0,NULL,NULL,13),(313,301,'DiUKh_MjsI0',0,NULL,NULL,13),(314,302,'DiUKh_MjsI0',0,NULL,NULL,13),(315,303,'DiUKh_MjsI0',0,NULL,NULL,13),(316,304,'DiUKh_MjsI0',0,NULL,NULL,13),(317,305,'DiUKh_MjsI0',0,NULL,NULL,13),(318,306,'DiUKh_MjsI0',0,NULL,NULL,13),(319,307,'DiUKh_MjsI0',0,NULL,NULL,13),(320,308,'DiUKh_MjsI0',0,NULL,NULL,13),(321,309,'DiUKh_MjsI0',0,NULL,NULL,13),(322,310,'DiUKh_MjsI0',0,NULL,NULL,13),(323,311,'DiUKh_MjsI0',0,NULL,NULL,13),(324,312,'DiUKh_MjsI0',0,NULL,NULL,13),(325,313,'DiUKh_MjsI0',0,NULL,NULL,13),(326,314,'DiUKh_MjsI0',0,NULL,NULL,13),(327,315,'DiUKh_MjsI0',0,NULL,NULL,13),(328,316,'DiUKh_MjsI0',0,NULL,NULL,13),(329,317,'DiUKh_MjsI0',0,NULL,NULL,13),(330,318,'DiUKh_MjsI0',0,NULL,NULL,13),(331,319,'DiUKh_MjsI0',0,NULL,NULL,13),(332,320,'DiUKh_MjsI0',0,NULL,NULL,13),(333,321,'DiUKh_MjsI0',0,NULL,NULL,13),(334,322,'DiUKh_MjsI0',0,NULL,NULL,13),(335,323,'DiUKh_MjsI0',0,NULL,NULL,13),(336,324,'DiUKh_MjsI0',0,NULL,NULL,13),(337,325,'DiUKh_MjsI0',0,NULL,NULL,13),(338,326,'DiUKh_MjsI0',0,NULL,NULL,13),(339,327,'DiUKh_MjsI0',0,NULL,NULL,13),(340,328,'DiUKh_MjsI0',0,NULL,NULL,13),(341,329,'DiUKh_MjsI0',0,NULL,NULL,13),(342,330,'DiUKh_MjsI0',0,NULL,NULL,13),(343,331,'DiUKh_MjsI0',0,NULL,NULL,13),(344,332,'DiUKh_MjsI0',0,NULL,NULL,13),(345,333,'DiUKh_MjsI0',0,NULL,NULL,13),(346,334,'DiUKh_MjsI0',0,NULL,NULL,13),(347,335,'DiUKh_MjsI0',0,NULL,NULL,13),(348,336,'DiUKh_MjsI0',0,NULL,NULL,13),(349,337,'DiUKh_MjsI0',0,NULL,NULL,13),(350,338,'DiUKh_MjsI0',0,NULL,NULL,13),(351,339,'DiUKh_MjsI0',0,NULL,NULL,13),(352,340,'DiUKh_MjsI0',0,NULL,NULL,13),(353,341,'DiUKh_MjsI0',0,NULL,NULL,13),(354,342,'DiUKh_MjsI0',0,NULL,NULL,13),(355,343,'DiUKh_MjsI0',0,NULL,NULL,13),(356,344,'DiUKh_MjsI0',0,NULL,NULL,13),(357,345,'DiUKh_MjsI0',0,NULL,NULL,13),(358,346,'DiUKh_MjsI0',0,NULL,NULL,13),(359,347,'DiUKh_MjsI0',0,NULL,NULL,13),(360,348,'DiUKh_MjsI0',0,NULL,NULL,13),(361,349,'DiUKh_MjsI0',0,NULL,NULL,13),(362,350,'DiUKh_MjsI0',0,NULL,NULL,13),(363,351,'DiUKh_MjsI0',0,NULL,NULL,13),(364,352,'DiUKh_MjsI0',0,NULL,NULL,13),(365,353,'DiUKh_MjsI0',0,NULL,NULL,13),(366,354,'DiUKh_MjsI0',0,NULL,NULL,13),(367,355,'DiUKh_MjsI0',0,NULL,NULL,13),(368,356,'DiUKh_MjsI0',0,NULL,NULL,13),(369,357,'DiUKh_MjsI0',0,NULL,NULL,13),(370,358,'DiUKh_MjsI0',0,NULL,NULL,13),(371,359,'DiUKh_MjsI0',0,NULL,NULL,13),(372,360,'DiUKh_MjsI0',0,NULL,NULL,13),(373,361,'DiUKh_MjsI0',0,NULL,NULL,13),(374,362,'DiUKh_MjsI0',0,NULL,NULL,13),(375,363,'DiUKh_MjsI0',0,NULL,NULL,13),(376,364,'DiUKh_MjsI0',0,NULL,NULL,13),(377,365,'DiUKh_MjsI0',0,NULL,NULL,13),(378,366,'DiUKh_MjsI0',0,NULL,NULL,13),(379,367,'DiUKh_MjsI0',0,NULL,NULL,13),(380,368,'DiUKh_MjsI0',0,NULL,NULL,13),(381,369,'DiUKh_MjsI0',0,NULL,NULL,13),(382,370,'DiUKh_MjsI0',0,NULL,NULL,13),(383,371,'DiUKh_MjsI0',0,NULL,NULL,13),(384,372,'DiUKh_MjsI0',0,NULL,NULL,13),(385,373,'DiUKh_MjsI0',0,NULL,NULL,13),(386,374,'DiUKh_MjsI0',0,NULL,NULL,13),(387,375,'DiUKh_MjsI0',0,NULL,NULL,13),(388,376,'DiUKh_MjsI0',0,NULL,NULL,13),(389,377,'DiUKh_MjsI0',0,NULL,NULL,13),(390,378,'DiUKh_MjsI0',0,NULL,NULL,13),(391,379,'DiUKh_MjsI0',0,NULL,NULL,13),(392,380,'DiUKh_MjsI0',0,NULL,NULL,13),(393,381,'DiUKh_MjsI0',0,NULL,NULL,13),(394,382,'DiUKh_MjsI0',0,NULL,NULL,13),(395,383,'DiUKh_MjsI0',0,NULL,NULL,13),(396,384,'DiUKh_MjsI0',0,NULL,NULL,13),(397,385,'DiUKh_MjsI0',0,NULL,NULL,13),(398,386,'DiUKh_MjsI0',0,NULL,NULL,13),(399,387,'DiUKh_MjsI0',0,NULL,NULL,13),(400,388,'DiUKh_MjsI0',0,NULL,NULL,13),(401,389,'DiUKh_MjsI0',0,NULL,NULL,13),(402,390,'DiUKh_MjsI0',0,NULL,NULL,13),(403,391,'DiUKh_MjsI0',0,NULL,NULL,13),(404,392,'DiUKh_MjsI0',0,NULL,NULL,13),(405,393,'DiUKh_MjsI0',0,NULL,NULL,13),(406,394,'DiUKh_MjsI0',0,NULL,NULL,13),(407,395,'DiUKh_MjsI0',0,NULL,NULL,13),(408,396,'DiUKh_MjsI0',0,NULL,NULL,13),(409,397,'DiUKh_MjsI0',0,NULL,NULL,13),(410,398,'DiUKh_MjsI0',0,NULL,NULL,13),(411,399,'DiUKh_MjsI0',0,NULL,NULL,13),(412,400,'DiUKh_MjsI0',0,NULL,NULL,13),(413,401,'DiUKh_MjsI0',0,NULL,NULL,13),(414,402,'DiUKh_MjsI0',0,NULL,NULL,13),(415,403,'DiUKh_MjsI0',0,NULL,NULL,13),(416,404,'DiUKh_MjsI0',0,NULL,NULL,13),(417,405,'DiUKh_MjsI0',0,NULL,NULL,13),(418,406,'DiUKh_MjsI0',0,NULL,NULL,13),(419,407,'DiUKh_MjsI0',0,NULL,NULL,13),(420,408,'DiUKh_MjsI0',0,NULL,NULL,13),(421,409,'DiUKh_MjsI0',0,NULL,NULL,13),(422,410,'DiUKh_MjsI0',0,NULL,NULL,13),(423,411,'DiUKh_MjsI0',0,NULL,NULL,13),(424,412,'DiUKh_MjsI0',0,NULL,NULL,13),(425,413,'DiUKh_MjsI0',0,NULL,NULL,13),(426,414,'DiUKh_MjsI0',0,NULL,NULL,13),(427,415,'DiUKh_MjsI0',0,NULL,NULL,13),(428,416,'DiUKh_MjsI0',0,NULL,NULL,13),(429,417,'DiUKh_MjsI0',0,NULL,NULL,13),(430,418,'DiUKh_MjsI0',0,NULL,NULL,13),(431,419,'DiUKh_MjsI0',0,NULL,NULL,13),(432,420,'DiUKh_MjsI0',0,NULL,NULL,13),(433,421,'DiUKh_MjsI0',0,NULL,NULL,13),(434,422,'DiUKh_MjsI0',0,NULL,NULL,13),(435,423,'DiUKh_MjsI0',0,NULL,NULL,13),(436,424,'DiUKh_MjsI0',0,NULL,NULL,13),(437,425,'DiUKh_MjsI0',0,NULL,NULL,13),(438,426,'DiUKh_MjsI0',0,NULL,NULL,13),(439,427,'DiUKh_MjsI0',0,NULL,NULL,13),(440,428,'DiUKh_MjsI0',0,NULL,NULL,13),(441,429,'DiUKh_MjsI0',0,NULL,NULL,13),(442,430,'DiUKh_MjsI0',0,NULL,NULL,13),(443,431,'DiUKh_MjsI0',0,NULL,NULL,13),(444,432,'DiUKh_MjsI0',0,NULL,NULL,13),(445,433,'DiUKh_MjsI0',0,NULL,NULL,13),(446,434,'DiUKh_MjsI0',0,NULL,NULL,13),(447,435,'DiUKh_MjsI0',0,NULL,NULL,13),(448,436,'DiUKh_MjsI0',0,NULL,NULL,13),(449,437,'DiUKh_MjsI0',0,NULL,NULL,13),(450,438,'DiUKh_MjsI0',0,NULL,NULL,13),(451,439,'DiUKh_MjsI0',0,NULL,NULL,13),(452,440,'DiUKh_MjsI0',0,NULL,NULL,13),(453,441,'DiUKh_MjsI0',0,NULL,NULL,13),(454,442,'DiUKh_MjsI0',0,NULL,NULL,13),(455,443,'DiUKh_MjsI0',0,NULL,NULL,13),(456,444,'DiUKh_MjsI0',0,NULL,NULL,13),(457,445,'DiUKh_MjsI0',0,NULL,NULL,13),(458,446,'DiUKh_MjsI0',0,NULL,NULL,13),(459,447,'DiUKh_MjsI0',0,NULL,NULL,13),(460,448,'DiUKh_MjsI0',0,NULL,NULL,13),(461,449,'DiUKh_MjsI0',0,NULL,NULL,13),(462,450,'DiUKh_MjsI0',0,NULL,NULL,13),(463,451,'DiUKh_MjsI0',0,NULL,NULL,13),(464,452,'DiUKh_MjsI0',0,NULL,NULL,13),(465,453,'DiUKh_MjsI0',0,NULL,NULL,13),(466,454,'DiUKh_MjsI0',0,NULL,NULL,13),(467,455,'DiUKh_MjsI0',0,NULL,NULL,13),(468,456,'DiUKh_MjsI0',0,NULL,NULL,13),(469,457,'DiUKh_MjsI0',0,NULL,NULL,13),(470,458,'DiUKh_MjsI0',0,NULL,NULL,13),(471,459,'DiUKh_MjsI0',0,NULL,NULL,13),(472,460,'DiUKh_MjsI0',0,NULL,NULL,13),(473,461,'DiUKh_MjsI0',0,NULL,NULL,13),(474,462,'DiUKh_MjsI0',0,NULL,NULL,13),(475,463,'DiUKh_MjsI0',0,NULL,NULL,13),(476,464,'DiUKh_MjsI0',0,NULL,NULL,13),(477,465,'DiUKh_MjsI0',0,NULL,NULL,13),(478,466,'DiUKh_MjsI0',0,NULL,NULL,13),(479,467,'DiUKh_MjsI0',0,NULL,NULL,13),(480,468,'DiUKh_MjsI0',0,NULL,NULL,13),(481,469,'DiUKh_MjsI0',0,NULL,NULL,13),(482,470,'DiUKh_MjsI0',0,NULL,NULL,13),(483,471,'DiUKh_MjsI0',0,NULL,NULL,13),(484,472,'DiUKh_MjsI0',0,NULL,NULL,13),(485,473,'DiUKh_MjsI0',0,NULL,NULL,13),(486,474,'DiUKh_MjsI0',0,NULL,NULL,13),(487,475,'DiUKh_MjsI0',0,NULL,NULL,13),(488,476,'DiUKh_MjsI0',0,NULL,NULL,13),(489,477,'DiUKh_MjsI0',0,NULL,NULL,13),(490,478,'DiUKh_MjsI0',0,NULL,NULL,13),(491,479,'DiUKh_MjsI0',0,NULL,NULL,13),(492,480,'DiUKh_MjsI0',0,NULL,NULL,13),(493,481,'DiUKh_MjsI0',0,NULL,NULL,13),(494,482,'DiUKh_MjsI0',0,NULL,NULL,13),(495,483,'DiUKh_MjsI0',0,NULL,NULL,13),(496,484,'DiUKh_MjsI0',0,NULL,NULL,13),(497,485,'DiUKh_MjsI0',0,NULL,NULL,13),(498,486,'DiUKh_MjsI0',0,NULL,NULL,13),(499,487,'DiUKh_MjsI0',0,NULL,NULL,13),(500,488,'DiUKh_MjsI0',0,NULL,NULL,13),(501,489,'DiUKh_MjsI0',0,NULL,NULL,13),(502,490,'DiUKh_MjsI0',0,NULL,NULL,13),(503,491,'DiUKh_MjsI0',0,NULL,NULL,13),(504,492,'DiUKh_MjsI0',0,NULL,NULL,13),(505,493,'DiUKh_MjsI0',0,NULL,NULL,13),(506,494,'DiUKh_MjsI0',0,NULL,NULL,13),(507,495,'DiUKh_MjsI0',0,NULL,NULL,13),(508,496,'DiUKh_MjsI0',0,NULL,NULL,13),(509,497,'DiUKh_MjsI0',0,NULL,NULL,13),(510,498,'DiUKh_MjsI0',0,NULL,NULL,13),(511,499,'DiUKh_MjsI0',0,NULL,NULL,13),(512,500,'DiUKh_MjsI0',0,NULL,NULL,13),(513,501,'DiUKh_MjsI0',0,NULL,NULL,13),(514,502,'DiUKh_MjsI0',0,NULL,NULL,13),(515,503,'DiUKh_MjsI0',0,NULL,NULL,13),(516,504,'DiUKh_MjsI0',0,NULL,NULL,13),(517,505,'DiUKh_MjsI0',0,NULL,NULL,13),(518,506,'DiUKh_MjsI0',0,NULL,NULL,13),(519,507,'DiUKh_MjsI0',0,NULL,NULL,13),(520,508,'DiUKh_MjsI0',0,NULL,NULL,13),(521,509,'DiUKh_MjsI0',0,NULL,NULL,13),(522,510,'DiUKh_MjsI0',0,NULL,NULL,13),(523,511,'DiUKh_MjsI0',0,NULL,NULL,13),(524,512,'DiUKh_MjsI0',0,NULL,NULL,13),(525,513,'DiUKh_MjsI0',0,NULL,NULL,13),(526,514,'DiUKh_MjsI0',0,NULL,NULL,13),(527,515,'DiUKh_MjsI0',0,NULL,NULL,13),(528,516,'DiUKh_MjsI0',0,NULL,NULL,13),(529,517,'DiUKh_MjsI0',0,NULL,NULL,13),(530,518,'DiUKh_MjsI0',0,NULL,NULL,13),(531,519,'DiUKh_MjsI0',0,NULL,NULL,13),(532,520,'DiUKh_MjsI0',0,NULL,NULL,13),(533,521,'DiUKh_MjsI0',0,NULL,NULL,13),(534,522,'DiUKh_MjsI0',0,NULL,NULL,13),(535,523,'DiUKh_MjsI0',0,NULL,NULL,13),(536,524,'DiUKh_MjsI0',0,NULL,NULL,13),(537,525,'DiUKh_MjsI0',0,NULL,NULL,13),(538,526,'DiUKh_MjsI0',0,NULL,NULL,13),(539,527,'DiUKh_MjsI0',0,NULL,NULL,13),(540,528,'DiUKh_MjsI0',0,NULL,NULL,13),(541,529,'DiUKh_MjsI0',0,NULL,NULL,13),(542,530,'DiUKh_MjsI0',0,NULL,NULL,13),(543,531,'DiUKh_MjsI0',0,NULL,NULL,13),(544,532,'DiUKh_MjsI0',0,NULL,NULL,13),(545,533,'DiUKh_MjsI0',0,NULL,NULL,13),(546,534,'DiUKh_MjsI0',0,NULL,NULL,13),(547,535,'DiUKh_MjsI0',0,NULL,NULL,13),(548,536,'DiUKh_MjsI0',0,NULL,NULL,13),(549,537,'DiUKh_MjsI0',0,NULL,NULL,13),(550,538,'DiUKh_MjsI0',0,NULL,NULL,13),(551,539,'DiUKh_MjsI0',0,NULL,NULL,13),(552,540,'DiUKh_MjsI0',0,NULL,NULL,13),(553,541,'DiUKh_MjsI0',0,NULL,NULL,13),(554,542,'DiUKh_MjsI0',0,NULL,NULL,13),(555,543,'DiUKh_MjsI0',0,NULL,NULL,13),(556,544,'DiUKh_MjsI0',0,NULL,NULL,13),(557,545,'DiUKh_MjsI0',0,NULL,NULL,13),(558,546,'DiUKh_MjsI0',0,NULL,NULL,13),(559,547,'DiUKh_MjsI0',0,NULL,NULL,13),(560,548,'DiUKh_MjsI0',0,NULL,NULL,13),(561,549,'DiUKh_MjsI0',0,NULL,NULL,13),(562,550,'DiUKh_MjsI0',0,NULL,NULL,13),(563,551,'DiUKh_MjsI0',0,NULL,NULL,13),(564,552,'DiUKh_MjsI0',0,NULL,NULL,13),(565,553,'DiUKh_MjsI0',0,NULL,NULL,13),(566,554,'DiUKh_MjsI0',0,NULL,NULL,13),(567,555,'DiUKh_MjsI0',0,NULL,NULL,13),(568,556,'DiUKh_MjsI0',0,NULL,NULL,13),(569,557,'DiUKh_MjsI0',0,NULL,NULL,13),(570,558,'DiUKh_MjsI0',0,NULL,NULL,13),(571,559,'DiUKh_MjsI0',0,NULL,NULL,13),(572,560,'DiUKh_MjsI0',0,NULL,NULL,13),(573,561,'DiUKh_MjsI0',0,NULL,NULL,13),(574,562,'DiUKh_MjsI0',0,NULL,NULL,13),(575,563,'DiUKh_MjsI0',0,NULL,NULL,13),(576,564,'DiUKh_MjsI0',0,NULL,NULL,13),(577,565,'DiUKh_MjsI0',0,NULL,NULL,13),(578,566,'DiUKh_MjsI0',0,NULL,NULL,13),(579,567,'DiUKh_MjsI0',0,NULL,NULL,13),(580,568,'DiUKh_MjsI0',0,NULL,NULL,13),(581,569,'DiUKh_MjsI0',0,NULL,NULL,13),(582,570,'DiUKh_MjsI0',0,NULL,NULL,13),(583,571,'DiUKh_MjsI0',0,NULL,NULL,13),(584,572,'DiUKh_MjsI0',0,NULL,NULL,13),(585,573,'DiUKh_MjsI0',0,NULL,NULL,13),(586,574,'DiUKh_MjsI0',0,NULL,NULL,13),(587,575,'DiUKh_MjsI0',0,NULL,NULL,13),(588,576,'DiUKh_MjsI0',0,NULL,NULL,13),(589,577,'DiUKh_MjsI0',0,NULL,NULL,13),(590,578,'DiUKh_MjsI0',0,NULL,NULL,13),(591,579,'DiUKh_MjsI0',0,NULL,NULL,13),(592,580,'DiUKh_MjsI0',0,NULL,NULL,13),(593,581,'DiUKh_MjsI0',0,NULL,NULL,13),(594,582,'DiUKh_MjsI0',0,NULL,NULL,13),(595,583,'DiUKh_MjsI0',0,NULL,NULL,13),(596,584,'DiUKh_MjsI0',0,NULL,NULL,13),(597,585,'DiUKh_MjsI0',0,NULL,NULL,13),(598,586,'DiUKh_MjsI0',0,NULL,NULL,13),(599,587,'DiUKh_MjsI0',0,NULL,NULL,13),(600,588,'DiUKh_MjsI0',0,NULL,NULL,13),(601,589,'DiUKh_MjsI0',0,NULL,NULL,13),(602,590,'DiUKh_MjsI0',0,NULL,NULL,13),(603,591,'DiUKh_MjsI0',0,NULL,NULL,13),(604,592,'DiUKh_MjsI0',0,NULL,NULL,13),(605,593,'DiUKh_MjsI0',0,NULL,NULL,13),(606,594,'DiUKh_MjsI0',0,NULL,NULL,13),(607,595,'DiUKh_MjsI0',0,NULL,NULL,13),(608,596,'DiUKh_MjsI0',0,NULL,NULL,13),(609,597,'DiUKh_MjsI0',0,NULL,NULL,13),(610,598,'DiUKh_MjsI0',0,NULL,NULL,13),(611,599,'DiUKh_MjsI0',0,NULL,NULL,13),(612,600,'DiUKh_MjsI0',0,NULL,NULL,13),(613,601,'DiUKh_MjsI0',0,NULL,NULL,13),(614,602,'DiUKh_MjsI0',0,NULL,NULL,13),(615,603,'DiUKh_MjsI0',0,NULL,NULL,13),(616,604,'DiUKh_MjsI0',0,NULL,NULL,13),(617,605,'DiUKh_MjsI0',0,NULL,NULL,13),(618,606,'DiUKh_MjsI0',0,NULL,NULL,13),(619,607,'DiUKh_MjsI0',0,NULL,NULL,13),(620,608,'DiUKh_MjsI0',0,NULL,NULL,13),(621,609,'DiUKh_MjsI0',0,NULL,NULL,13),(622,610,'DiUKh_MjsI0',0,NULL,NULL,13),(623,611,'DiUKh_MjsI0',0,NULL,NULL,13),(624,612,'DiUKh_MjsI0',0,NULL,NULL,13),(625,613,'DiUKh_MjsI0',0,NULL,NULL,13),(626,614,'DiUKh_MjsI0',0,NULL,NULL,13),(627,615,'DiUKh_MjsI0',0,NULL,NULL,13),(628,616,'DiUKh_MjsI0',0,NULL,NULL,13),(629,617,'DiUKh_MjsI0',0,NULL,NULL,13),(630,618,'DiUKh_MjsI0',0,NULL,NULL,13),(631,619,'DiUKh_MjsI0',0,NULL,NULL,13),(632,620,'DiUKh_MjsI0',0,NULL,NULL,13),(633,621,'DiUKh_MjsI0',0,NULL,NULL,13),(634,622,'DiUKh_MjsI0',0,NULL,NULL,13),(635,623,'DiUKh_MjsI0',0,NULL,NULL,13),(636,624,'DiUKh_MjsI0',0,NULL,NULL,13),(637,625,'DiUKh_MjsI0',0,NULL,NULL,13),(638,626,'DiUKh_MjsI0',0,NULL,NULL,13),(639,627,'DiUKh_MjsI0',0,NULL,NULL,13),(640,628,'DiUKh_MjsI0',0,NULL,NULL,13),(641,629,'DiUKh_MjsI0',0,NULL,NULL,13),(642,630,'DiUKh_MjsI0',0,NULL,NULL,13),(643,631,'DiUKh_MjsI0',0,NULL,NULL,13),(644,632,'DiUKh_MjsI0',0,NULL,NULL,13),(645,633,'DiUKh_MjsI0',0,NULL,NULL,13),(646,634,'DiUKh_MjsI0',0,NULL,NULL,13),(647,635,'DiUKh_MjsI0',0,NULL,NULL,13),(648,636,'DiUKh_MjsI0',0,NULL,NULL,13),(649,637,'DiUKh_MjsI0',0,NULL,NULL,13),(650,638,'DiUKh_MjsI0',0,NULL,NULL,13),(651,639,'DiUKh_MjsI0',0,NULL,NULL,13),(652,640,'DiUKh_MjsI0',0,NULL,NULL,13),(653,641,'DiUKh_MjsI0',0,NULL,NULL,13),(654,642,'DiUKh_MjsI0',0,NULL,NULL,13),(655,643,'DiUKh_MjsI0',0,NULL,NULL,13),(656,644,'DiUKh_MjsI0',0,NULL,NULL,13),(657,645,'DiUKh_MjsI0',0,NULL,NULL,13),(658,646,'DiUKh_MjsI0',0,NULL,NULL,13),(659,647,'DiUKh_MjsI0',0,NULL,NULL,13),(660,648,'DiUKh_MjsI0',0,NULL,NULL,13),(661,649,'DiUKh_MjsI0',0,NULL,NULL,13),(662,650,'DiUKh_MjsI0',0,NULL,NULL,13),(663,651,'DiUKh_MjsI0',0,NULL,NULL,13),(664,652,'DiUKh_MjsI0',0,NULL,NULL,13),(665,653,'DiUKh_MjsI0',0,NULL,NULL,13),(666,654,'DiUKh_MjsI0',0,NULL,NULL,13),(667,655,'DiUKh_MjsI0',0,NULL,NULL,13),(668,656,'DiUKh_MjsI0',0,NULL,NULL,13),(669,657,'DiUKh_MjsI0',0,NULL,NULL,13),(670,658,'DiUKh_MjsI0',0,NULL,NULL,13),(671,659,'DiUKh_MjsI0',0,NULL,NULL,13),(672,660,'DiUKh_MjsI0',0,NULL,NULL,13),(673,661,'DiUKh_MjsI0',0,NULL,NULL,13),(674,662,'DiUKh_MjsI0',0,NULL,NULL,13),(675,663,'DiUKh_MjsI0',0,NULL,NULL,13),(676,664,'DiUKh_MjsI0',0,NULL,NULL,13),(677,665,'DiUKh_MjsI0',0,NULL,NULL,13),(678,666,'DiUKh_MjsI0',0,NULL,NULL,13),(679,667,'DiUKh_MjsI0',0,NULL,NULL,13),(680,668,'DiUKh_MjsI0',0,NULL,NULL,13),(681,669,'DiUKh_MjsI0',0,NULL,NULL,13),(682,670,'DiUKh_MjsI0',0,NULL,NULL,13),(683,671,'DiUKh_MjsI0',0,NULL,NULL,13),(684,672,'DiUKh_MjsI0',0,NULL,NULL,13),(685,673,'DiUKh_MjsI0',0,NULL,NULL,13),(686,674,'DiUKh_MjsI0',0,NULL,NULL,13),(687,675,'DiUKh_MjsI0',0,NULL,NULL,13),(688,676,'DiUKh_MjsI0',0,NULL,NULL,13),(689,677,'DiUKh_MjsI0',0,NULL,NULL,13),(690,678,'DiUKh_MjsI0',0,NULL,NULL,13),(691,679,'DiUKh_MjsI0',0,NULL,NULL,13),(692,680,'DiUKh_MjsI0',0,NULL,NULL,13),(693,681,'DiUKh_MjsI0',0,NULL,NULL,13),(694,682,'DiUKh_MjsI0',0,NULL,NULL,13),(695,683,'DiUKh_MjsI0',0,NULL,NULL,13),(696,684,'DiUKh_MjsI0',0,NULL,NULL,13),(697,685,'DiUKh_MjsI0',0,NULL,NULL,13),(698,686,'DiUKh_MjsI0',0,NULL,NULL,13),(699,687,'DiUKh_MjsI0',0,NULL,NULL,13),(700,688,'DiUKh_MjsI0',0,NULL,NULL,13),(701,689,'DiUKh_MjsI0',0,NULL,NULL,13),(702,690,'DiUKh_MjsI0',0,NULL,NULL,13),(703,691,'DiUKh_MjsI0',0,NULL,NULL,13),(704,692,'DiUKh_MjsI0',0,NULL,NULL,13),(705,693,'DiUKh_MjsI0',0,NULL,NULL,13),(706,694,'DiUKh_MjsI0',0,NULL,NULL,13),(707,695,'DiUKh_MjsI0',0,NULL,NULL,13),(708,696,'DiUKh_MjsI0',0,NULL,NULL,13),(709,697,'DiUKh_MjsI0',0,NULL,NULL,13),(710,698,'DiUKh_MjsI0',0,NULL,NULL,13),(711,699,'DiUKh_MjsI0',0,NULL,NULL,13),(712,700,'DiUKh_MjsI0',0,NULL,NULL,13),(713,701,'DiUKh_MjsI0',0,NULL,NULL,13),(714,702,'DiUKh_MjsI0',0,NULL,NULL,13),(715,703,'DiUKh_MjsI0',0,NULL,NULL,13),(716,704,'DiUKh_MjsI0',0,NULL,NULL,13),(717,705,'DiUKh_MjsI0',0,NULL,NULL,13),(718,706,'DiUKh_MjsI0',0,NULL,NULL,13),(719,707,'DiUKh_MjsI0',0,NULL,NULL,13),(720,708,'DiUKh_MjsI0',0,NULL,NULL,13),(721,709,'DiUKh_MjsI0',0,NULL,NULL,13),(722,710,'DiUKh_MjsI0',0,NULL,NULL,13),(723,711,'DiUKh_MjsI0',0,NULL,NULL,13),(724,712,'DiUKh_MjsI0',0,NULL,NULL,13),(725,713,'DiUKh_MjsI0',0,NULL,NULL,13),(726,714,'DiUKh_MjsI0',0,NULL,NULL,13),(727,715,'DiUKh_MjsI0',0,NULL,NULL,13),(728,716,'DiUKh_MjsI0',0,NULL,NULL,13),(729,717,'DiUKh_MjsI0',0,NULL,NULL,13),(730,718,'DiUKh_MjsI0',0,NULL,NULL,13),(731,719,'DiUKh_MjsI0',0,NULL,NULL,13),(732,720,'DiUKh_MjsI0',0,NULL,NULL,13),(733,721,'DiUKh_MjsI0',0,NULL,NULL,13),(734,722,'DiUKh_MjsI0',0,NULL,NULL,13),(735,723,'DiUKh_MjsI0',0,NULL,NULL,13),(736,724,'DiUKh_MjsI0',0,NULL,NULL,13),(737,725,'DiUKh_MjsI0',0,NULL,NULL,13),(738,726,'DiUKh_MjsI0',0,NULL,NULL,13),(739,727,'DiUKh_MjsI0',0,NULL,NULL,13),(740,728,'DiUKh_MjsI0',0,NULL,NULL,13),(741,729,'DiUKh_MjsI0',0,NULL,NULL,13),(742,730,'DiUKh_MjsI0',0,NULL,NULL,13),(743,731,'DiUKh_MjsI0',0,NULL,NULL,13),(744,732,'DiUKh_MjsI0',0,NULL,NULL,13),(745,733,'DiUKh_MjsI0',0,NULL,NULL,13),(746,734,'DiUKh_MjsI0',0,NULL,NULL,13),(747,735,'DiUKh_MjsI0',0,NULL,NULL,13),(748,736,'DiUKh_MjsI0',0,NULL,NULL,13),(749,737,'DiUKh_MjsI0',0,NULL,NULL,13),(750,738,'DiUKh_MjsI0',0,NULL,NULL,13),(751,739,'DiUKh_MjsI0',0,NULL,NULL,13),(752,740,'DiUKh_MjsI0',0,NULL,NULL,13),(753,741,'DiUKh_MjsI0',0,NULL,NULL,13),(754,742,'DiUKh_MjsI0',0,NULL,NULL,13),(755,743,'DiUKh_MjsI0',0,NULL,NULL,13),(756,744,'DiUKh_MjsI0',0,NULL,NULL,13),(757,745,'DiUKh_MjsI0',0,NULL,NULL,13),(758,746,'DiUKh_MjsI0',0,NULL,NULL,13),(759,747,'DiUKh_MjsI0',0,NULL,NULL,13),(760,748,'DiUKh_MjsI0',0,NULL,NULL,13),(761,749,'DiUKh_MjsI0',0,NULL,NULL,13),(762,750,'DiUKh_MjsI0',0,NULL,NULL,13),(763,751,'DiUKh_MjsI0',0,NULL,NULL,13),(764,752,'DiUKh_MjsI0',0,NULL,NULL,13),(765,753,'DiUKh_MjsI0',0,NULL,NULL,13),(766,754,'DiUKh_MjsI0',0,NULL,NULL,13),(767,755,'DiUKh_MjsI0',0,NULL,NULL,13),(768,756,'DiUKh_MjsI0',0,NULL,NULL,13),(769,757,'DiUKh_MjsI0',0,NULL,NULL,13),(770,758,'DiUKh_MjsI0',0,NULL,NULL,13),(771,759,'DiUKh_MjsI0',0,NULL,NULL,13),(772,760,'DiUKh_MjsI0',0,NULL,NULL,13),(773,761,'DiUKh_MjsI0',0,NULL,NULL,13),(774,762,'DiUKh_MjsI0',0,NULL,NULL,13),(775,763,'DiUKh_MjsI0',0,NULL,NULL,13),(776,764,'DiUKh_MjsI0',0,NULL,NULL,13),(777,765,'DiUKh_MjsI0',0,NULL,NULL,13),(778,766,'DiUKh_MjsI0',0,NULL,NULL,13),(779,767,'DiUKh_MjsI0',0,NULL,NULL,13),(780,768,'DiUKh_MjsI0',0,NULL,NULL,13),(781,769,'DiUKh_MjsI0',0,NULL,NULL,13),(782,770,'DiUKh_MjsI0',0,NULL,NULL,13),(783,771,'DiUKh_MjsI0',0,NULL,NULL,13),(784,772,'DiUKh_MjsI0',0,NULL,NULL,13),(785,773,'DiUKh_MjsI0',0,NULL,NULL,13),(786,774,'DiUKh_MjsI0',0,NULL,NULL,13),(787,775,'DiUKh_MjsI0',0,NULL,NULL,13),(788,776,'DiUKh_MjsI0',0,NULL,NULL,13),(789,777,'DiUKh_MjsI0',0,NULL,NULL,13),(790,778,'DiUKh_MjsI0',0,NULL,NULL,13),(791,779,'DiUKh_MjsI0',0,NULL,NULL,13),(792,780,'DiUKh_MjsI0',0,NULL,NULL,13),(793,781,'DiUKh_MjsI0',0,NULL,NULL,13),(794,782,'DiUKh_MjsI0',0,NULL,NULL,13),(795,783,'DiUKh_MjsI0',0,NULL,NULL,13),(796,784,'DiUKh_MjsI0',0,NULL,NULL,13),(797,785,'DiUKh_MjsI0',0,NULL,NULL,13),(798,786,'DiUKh_MjsI0',0,NULL,NULL,13),(799,787,'DiUKh_MjsI0',0,NULL,NULL,13),(800,788,'DiUKh_MjsI0',0,NULL,NULL,13),(801,789,'DiUKh_MjsI0',0,NULL,NULL,13),(802,790,'DiUKh_MjsI0',0,NULL,NULL,13),(803,791,'DiUKh_MjsI0',0,NULL,NULL,13),(804,792,'DiUKh_MjsI0',0,NULL,NULL,13),(805,793,'DiUKh_MjsI0',0,NULL,NULL,13),(806,794,'DiUKh_MjsI0',0,NULL,NULL,13),(807,795,'DiUKh_MjsI0',0,NULL,NULL,13),(808,796,'DiUKh_MjsI0',0,NULL,NULL,13),(809,797,'DiUKh_MjsI0',0,NULL,NULL,13),(810,798,'DiUKh_MjsI0',0,NULL,NULL,13),(811,799,'DiUKh_MjsI0',0,NULL,NULL,13),(812,800,'DiUKh_MjsI0',0,NULL,NULL,13),(813,801,'DiUKh_MjsI0',0,NULL,NULL,13),(814,802,'DiUKh_MjsI0',0,NULL,NULL,13),(815,803,'DiUKh_MjsI0',0,NULL,NULL,13),(816,804,'DiUKh_MjsI0',0,NULL,NULL,13),(817,805,'DiUKh_MjsI0',0,NULL,NULL,13),(818,806,'DiUKh_MjsI0',0,NULL,NULL,13),(819,807,'DiUKh_MjsI0',0,NULL,NULL,13),(820,808,'DiUKh_MjsI0',0,NULL,NULL,13),(821,809,'DiUKh_MjsI0',0,NULL,NULL,13),(822,810,'DiUKh_MjsI0',0,NULL,NULL,13),(823,811,'DiUKh_MjsI0',0,NULL,NULL,13),(824,812,'DiUKh_MjsI0',0,NULL,NULL,13),(825,813,'DiUKh_MjsI0',0,NULL,NULL,13),(826,814,'DiUKh_MjsI0',0,NULL,NULL,13),(827,815,'DiUKh_MjsI0',0,NULL,NULL,13),(828,816,'DiUKh_MjsI0',0,NULL,NULL,13),(829,817,'DiUKh_MjsI0',0,NULL,NULL,13),(830,818,'DiUKh_MjsI0',0,NULL,NULL,13),(831,819,'DiUKh_MjsI0',0,NULL,NULL,13),(832,820,'DiUKh_MjsI0',0,NULL,NULL,13),(833,821,'DiUKh_MjsI0',0,NULL,NULL,13),(834,822,'DiUKh_MjsI0',0,NULL,NULL,13),(835,823,'DiUKh_MjsI0',0,NULL,NULL,13),(836,824,'DiUKh_MjsI0',0,NULL,NULL,13),(837,825,'DiUKh_MjsI0',0,NULL,NULL,13),(838,826,'DiUKh_MjsI0',0,NULL,NULL,13),(839,827,'DiUKh_MjsI0',0,NULL,NULL,13),(840,828,'DiUKh_MjsI0',0,NULL,NULL,13),(841,829,'DiUKh_MjsI0',0,NULL,NULL,13),(842,830,'DiUKh_MjsI0',0,NULL,NULL,13),(843,831,'DiUKh_MjsI0',0,NULL,NULL,13),(844,832,'DiUKh_MjsI0',0,NULL,NULL,13),(845,833,'DiUKh_MjsI0',0,NULL,NULL,13),(846,834,'DiUKh_MjsI0',0,NULL,NULL,13),(847,835,'DiUKh_MjsI0',0,NULL,NULL,13),(848,836,'DiUKh_MjsI0',0,NULL,NULL,13),(849,837,'DiUKh_MjsI0',0,NULL,NULL,13),(850,838,'DiUKh_MjsI0',0,NULL,NULL,13),(851,839,'DiUKh_MjsI0',0,NULL,NULL,13),(852,840,'DiUKh_MjsI0',0,NULL,NULL,13),(853,841,'DiUKh_MjsI0',0,NULL,NULL,13),(854,842,'DiUKh_MjsI0',0,NULL,NULL,13),(855,843,'DiUKh_MjsI0',0,NULL,NULL,13),(856,844,'DiUKh_MjsI0',0,NULL,NULL,13),(857,845,'DiUKh_MjsI0',0,NULL,NULL,13),(858,846,'DiUKh_MjsI0',0,NULL,NULL,13),(859,847,'DiUKh_MjsI0',0,NULL,NULL,13),(860,848,'DiUKh_MjsI0',0,NULL,NULL,13),(861,849,'DiUKh_MjsI0',0,NULL,NULL,13),(862,850,'DiUKh_MjsI0',0,NULL,NULL,13),(863,851,'DiUKh_MjsI0',0,NULL,NULL,13),(864,852,'DiUKh_MjsI0',0,NULL,NULL,13),(865,853,'DiUKh_MjsI0',0,NULL,NULL,13),(866,854,'DiUKh_MjsI0',0,NULL,NULL,13),(867,855,'DiUKh_MjsI0',0,NULL,NULL,13),(868,856,'DiUKh_MjsI0',0,NULL,NULL,13),(869,857,'DiUKh_MjsI0',0,NULL,NULL,13),(870,858,'DiUKh_MjsI0',0,NULL,NULL,13),(871,859,'DiUKh_MjsI0',0,NULL,NULL,13),(872,860,'DiUKh_MjsI0',0,NULL,NULL,13),(873,861,'DiUKh_MjsI0',0,NULL,NULL,13),(874,862,'DiUKh_MjsI0',0,NULL,NULL,13),(875,863,'DiUKh_MjsI0',0,NULL,NULL,13),(876,864,'DiUKh_MjsI0',0,NULL,NULL,13),(877,865,'DiUKh_MjsI0',0,NULL,NULL,13),(878,866,'DiUKh_MjsI0',0,NULL,NULL,13),(879,867,'DiUKh_MjsI0',0,NULL,NULL,13),(880,868,'DiUKh_MjsI0',0,NULL,NULL,13),(881,869,'DiUKh_MjsI0',0,NULL,NULL,13),(882,870,'DiUKh_MjsI0',0,NULL,NULL,13),(883,871,'DiUKh_MjsI0',0,NULL,NULL,13),(884,872,'DiUKh_MjsI0',0,NULL,NULL,13),(885,873,'DiUKh_MjsI0',0,NULL,NULL,13),(886,874,'DiUKh_MjsI0',0,NULL,NULL,13),(887,875,'DiUKh_MjsI0',0,NULL,NULL,13),(888,876,'DiUKh_MjsI0',0,NULL,NULL,13),(889,877,'DiUKh_MjsI0',0,NULL,NULL,13),(890,878,'DiUKh_MjsI0',0,NULL,NULL,13),(891,879,'DiUKh_MjsI0',0,NULL,NULL,13),(892,880,'DiUKh_MjsI0',0,NULL,NULL,13),(893,881,'DiUKh_MjsI0',0,NULL,NULL,13),(894,882,'DiUKh_MjsI0',0,NULL,NULL,13),(895,883,'DiUKh_MjsI0',0,NULL,NULL,13),(896,884,'DiUKh_MjsI0',0,NULL,NULL,13),(897,885,'DiUKh_MjsI0',0,NULL,NULL,13),(898,886,'DiUKh_MjsI0',0,NULL,NULL,13),(899,887,'DiUKh_MjsI0',0,NULL,NULL,13),(900,888,'DiUKh_MjsI0',0,NULL,NULL,13),(901,889,'DiUKh_MjsI0',0,NULL,NULL,13),(902,890,'DiUKh_MjsI0',0,NULL,NULL,13),(903,891,'DiUKh_MjsI0',0,NULL,NULL,13),(904,892,'DiUKh_MjsI0',0,NULL,NULL,13),(905,893,'DiUKh_MjsI0',0,NULL,NULL,13),(906,894,'DiUKh_MjsI0',0,NULL,NULL,13),(907,895,'DiUKh_MjsI0',0,NULL,NULL,13),(908,896,'DiUKh_MjsI0',0,NULL,NULL,13),(909,897,'DiUKh_MjsI0',0,NULL,NULL,13),(910,898,'DiUKh_MjsI0',0,NULL,NULL,13),(911,899,'DiUKh_MjsI0',0,NULL,NULL,13),(912,900,'DiUKh_MjsI0',0,NULL,NULL,13),(913,901,'DiUKh_MjsI0',0,NULL,NULL,13),(914,902,'DiUKh_MjsI0',0,NULL,NULL,13),(915,903,'DiUKh_MjsI0',0,NULL,NULL,13),(916,904,'DiUKh_MjsI0',0,NULL,NULL,13),(917,905,'DiUKh_MjsI0',0,NULL,NULL,13),(918,906,'DiUKh_MjsI0',0,NULL,NULL,13),(919,907,'DiUKh_MjsI0',0,NULL,NULL,13),(920,908,'DiUKh_MjsI0',0,NULL,NULL,13),(921,909,'DiUKh_MjsI0',0,NULL,NULL,13),(922,910,'DiUKh_MjsI0',0,NULL,NULL,13),(923,911,'DiUKh_MjsI0',0,NULL,NULL,13),(924,912,'DiUKh_MjsI0',0,NULL,NULL,13),(925,913,'DiUKh_MjsI0',0,NULL,NULL,13),(926,914,'DiUKh_MjsI0',0,NULL,NULL,13),(927,915,'DiUKh_MjsI0',0,NULL,NULL,13),(928,916,'DiUKh_MjsI0',0,NULL,NULL,13),(929,917,'DiUKh_MjsI0',0,NULL,NULL,13),(930,918,'DiUKh_MjsI0',0,NULL,NULL,13),(931,919,'DiUKh_MjsI0',0,NULL,NULL,13),(932,920,'DiUKh_MjsI0',0,NULL,NULL,13),(933,921,'DiUKh_MjsI0',0,NULL,NULL,13),(934,922,'DiUKh_MjsI0',0,NULL,NULL,13),(935,923,'DiUKh_MjsI0',0,NULL,NULL,13),(936,924,'DiUKh_MjsI0',0,NULL,NULL,13),(937,925,'DiUKh_MjsI0',0,NULL,NULL,13),(938,926,'DiUKh_MjsI0',0,NULL,NULL,13),(939,927,'DiUKh_MjsI0',0,NULL,NULL,13),(940,928,'DiUKh_MjsI0',0,NULL,NULL,13),(941,929,'DiUKh_MjsI0',0,NULL,NULL,13),(942,930,'DiUKh_MjsI0',0,NULL,NULL,13),(943,931,'DiUKh_MjsI0',0,NULL,NULL,13),(944,932,'DiUKh_MjsI0',0,NULL,NULL,13),(945,933,'DiUKh_MjsI0',0,NULL,NULL,13),(946,934,'DiUKh_MjsI0',0,NULL,NULL,13),(947,935,'DiUKh_MjsI0',0,NULL,NULL,13),(948,936,'DiUKh_MjsI0',0,NULL,NULL,13),(949,937,'DiUKh_MjsI0',0,NULL,NULL,13),(950,938,'DiUKh_MjsI0',0,NULL,NULL,13),(951,939,'DiUKh_MjsI0',0,NULL,NULL,13),(952,940,'DiUKh_MjsI0',0,NULL,NULL,13),(953,941,'DiUKh_MjsI0',0,NULL,NULL,13),(954,942,'DiUKh_MjsI0',0,NULL,NULL,13),(955,943,'DiUKh_MjsI0',0,NULL,NULL,13),(956,944,'DiUKh_MjsI0',0,NULL,NULL,13),(957,945,'DiUKh_MjsI0',0,NULL,NULL,13),(958,946,'DiUKh_MjsI0',0,NULL,NULL,13),(959,947,'DiUKh_MjsI0',0,NULL,NULL,13),(960,948,'DiUKh_MjsI0',0,NULL,NULL,13),(961,949,'DiUKh_MjsI0',0,NULL,NULL,13),(962,950,'DiUKh_MjsI0',0,NULL,NULL,13),(963,951,'DiUKh_MjsI0',0,NULL,NULL,13),(964,952,'DiUKh_MjsI0',0,NULL,NULL,13),(965,953,'DiUKh_MjsI0',0,NULL,NULL,13),(966,954,'DiUKh_MjsI0',0,NULL,NULL,13),(967,955,'DiUKh_MjsI0',0,NULL,NULL,13),(968,956,'DiUKh_MjsI0',0,NULL,NULL,13),(969,957,'DiUKh_MjsI0',0,NULL,NULL,13),(970,958,'DiUKh_MjsI0',0,NULL,NULL,13),(971,959,'DiUKh_MjsI0',0,NULL,NULL,13),(972,960,'DiUKh_MjsI0',0,NULL,NULL,13),(973,961,'DiUKh_MjsI0',0,NULL,NULL,13),(974,962,'DiUKh_MjsI0',0,NULL,NULL,13),(975,963,'DiUKh_MjsI0',0,NULL,NULL,13),(976,964,'DiUKh_MjsI0',0,NULL,NULL,13),(977,965,'DiUKh_MjsI0',0,NULL,NULL,13),(978,966,'DiUKh_MjsI0',0,NULL,NULL,13),(979,967,'DiUKh_MjsI0',0,NULL,NULL,13),(980,968,'DiUKh_MjsI0',0,NULL,NULL,13),(981,969,'DiUKh_MjsI0',0,NULL,NULL,13),(982,970,'DiUKh_MjsI0',0,NULL,NULL,13),(983,971,'DiUKh_MjsI0',0,NULL,NULL,13),(984,972,'DiUKh_MjsI0',0,NULL,NULL,13),(985,973,'DiUKh_MjsI0',0,NULL,NULL,13),(986,974,'DiUKh_MjsI0',0,NULL,NULL,13),(987,975,'DiUKh_MjsI0',0,NULL,NULL,13),(988,976,'DiUKh_MjsI0',0,NULL,NULL,13),(989,977,'DiUKh_MjsI0',0,NULL,NULL,13),(990,978,'DiUKh_MjsI0',0,NULL,NULL,13),(991,979,'DiUKh_MjsI0',0,NULL,NULL,13),(992,980,'DiUKh_MjsI0',0,NULL,NULL,13),(993,981,'DiUKh_MjsI0',0,NULL,NULL,13),(994,982,'DiUKh_MjsI0',0,NULL,NULL,13),(995,983,'DiUKh_MjsI0',0,NULL,NULL,13),(996,984,'DiUKh_MjsI0',0,NULL,NULL,13),(997,985,'DiUKh_MjsI0',0,NULL,NULL,13),(998,986,'DiUKh_MjsI0',0,NULL,NULL,13),(999,987,'DiUKh_MjsI0',0,NULL,NULL,13),(1000,988,'DiUKh_MjsI0',0,NULL,NULL,13),(1001,989,'DiUKh_MjsI0',0,NULL,NULL,13),(1002,990,'DiUKh_MjsI0',0,NULL,NULL,13),(1003,991,'DiUKh_MjsI0',0,NULL,NULL,13),(1004,992,'DiUKh_MjsI0',0,NULL,NULL,13),(1005,993,'DiUKh_MjsI0',0,NULL,NULL,13),(1006,994,'DiUKh_MjsI0',0,NULL,NULL,13),(1007,995,'DiUKh_MjsI0',0,NULL,NULL,13),(1008,996,'DiUKh_MjsI0',0,NULL,NULL,13),(1009,997,'DiUKh_MjsI0',0,NULL,NULL,13),(1010,998,'DiUKh_MjsI0',0,NULL,NULL,13),(1011,999,'DiUKh_MjsI0',0,NULL,NULL,13),(1012,1000,'DiUKh_MjsI0',0,NULL,NULL,13),(1013,1001,'DiUKh_MjsI0',0,NULL,NULL,13),(1014,1002,'DiUKh_MjsI0',0,NULL,NULL,13),(1015,1003,'DiUKh_MjsI0',0,NULL,NULL,13),(1016,1004,'DiUKh_MjsI0',0,NULL,NULL,13),(1017,1005,'DiUKh_MjsI0',0,NULL,NULL,13),(1018,1006,'DiUKh_MjsI0',0,NULL,NULL,13),(1019,1007,'DiUKh_MjsI0',0,NULL,NULL,13),(1020,1008,'DiUKh_MjsI0',0,NULL,NULL,13),(1021,1009,'DiUKh_MjsI0',0,NULL,NULL,13),(1022,1010,'DiUKh_MjsI0',0,NULL,NULL,13),(1023,1011,'DiUKh_MjsI0',0,NULL,NULL,13),(1024,1012,'DiUKh_MjsI0',0,NULL,NULL,13),(1025,1013,'DiUKh_MjsI0',0,NULL,NULL,13),(1026,1014,'DiUKh_MjsI0',0,NULL,NULL,13),(1027,1015,'DiUKh_MjsI0',0,NULL,NULL,13),(1028,1016,'DiUKh_MjsI0',0,NULL,NULL,13),(1029,1017,'DiUKh_MjsI0',0,NULL,NULL,13),(1030,1018,'DiUKh_MjsI0',0,NULL,NULL,13),(1031,1019,'DiUKh_MjsI0',0,NULL,NULL,13),(1032,1020,'DiUKh_MjsI0',0,NULL,NULL,13),(1033,1021,'DiUKh_MjsI0',0,NULL,NULL,13),(1034,1022,'DiUKh_MjsI0',0,NULL,NULL,13),(1035,1023,'DiUKh_MjsI0',0,NULL,NULL,13),(1036,1024,'DiUKh_MjsI0',0,NULL,NULL,13),(1037,1025,'DiUKh_MjsI0',0,NULL,NULL,13),(1038,1026,'DiUKh_MjsI0',0,NULL,NULL,13),(1039,1027,'DiUKh_MjsI0',0,NULL,NULL,13),(1040,1028,'DiUKh_MjsI0',0,NULL,NULL,13),(1041,1029,'DiUKh_MjsI0',0,NULL,NULL,13),(1042,1030,'DiUKh_MjsI0',0,NULL,NULL,13),(1043,1031,'DiUKh_MjsI0',0,NULL,NULL,13),(1044,1032,'DiUKh_MjsI0',0,NULL,NULL,13),(1045,1033,'DiUKh_MjsI0',0,NULL,NULL,13),(1046,1034,'DiUKh_MjsI0',0,NULL,NULL,13),(1047,1035,'DiUKh_MjsI0',0,NULL,NULL,13),(1048,1,'DiUKh_MjsI0',0,NULL,NULL,14),(1049,1,'DiUKh_MjsI0',0,NULL,NULL,15),(1050,1,'DiUKh_MjsI0',0,NULL,NULL,16),(1051,1,'DiUKh_MjsI0',0,NULL,NULL,17),(1052,1,'DiUKh_MjsI0',0,NULL,NULL,18),(1053,1,'DiUKh_MjsI0',0,NULL,NULL,19),(1054,1,'DiUKh_MjsI0',0,NULL,NULL,20),(1055,1,'DiUKh_MjsI0',0,NULL,NULL,21),(1056,1,'DiUKh_MjsI0',0,NULL,NULL,22),(1057,1,'DiUKh_MjsI0',0,NULL,NULL,23),(1058,1,'DiUKh_MjsI0',0,NULL,NULL,24),(1059,1,'DiUKh_MjsI0',0,NULL,NULL,25),(1060,1,'DiUKh_MjsI0',0,NULL,NULL,26),(1061,1,'DiUKh_MjsI0',0,NULL,NULL,27),(1062,1,'DiUKh_MjsI0',0,NULL,NULL,28),(1063,1,'DiUKh_MjsI0',0,NULL,NULL,29),(1064,2,'DiUKh_MjsI0',0,NULL,NULL,29),(1065,3,'DiUKh_MjsI0',0,NULL,NULL,29),(1066,4,'DiUKh_MjsI0',0,NULL,NULL,29),(1067,5,'DiUKh_MjsI0',0,NULL,NULL,29),(1068,6,'DiUKh_MjsI0',0,NULL,NULL,29),(1069,7,'DiUKh_MjsI0',0,NULL,NULL,29),(1070,8,'DiUKh_MjsI0',0,NULL,NULL,29),(1071,9,'DiUKh_MjsI0',0,NULL,NULL,29),(1072,10,'DiUKh_MjsI0',0,NULL,NULL,29),(1073,11,'DiUKh_MjsI0',0,NULL,NULL,29),(1074,12,'DiUKh_MjsI0',0,NULL,NULL,29),(1075,13,'DiUKh_MjsI0',0,NULL,NULL,29),(1076,14,'DiUKh_MjsI0',0,NULL,NULL,29),(1077,15,'DiUKh_MjsI0',0,NULL,NULL,29),(1078,16,'DiUKh_MjsI0',0,NULL,NULL,29),(1079,17,'DiUKh_MjsI0',0,NULL,NULL,29),(1080,18,'DiUKh_MjsI0',0,NULL,NULL,29),(1081,19,'DiUKh_MjsI0',0,NULL,NULL,29),(1082,20,'DiUKh_MjsI0',0,NULL,NULL,29),(1083,21,'DiUKh_MjsI0',0,NULL,NULL,29),(1084,22,'DiUKh_MjsI0',0,NULL,NULL,29),(1085,23,'DiUKh_MjsI0',0,NULL,NULL,29),(1086,24,'DiUKh_MjsI0',0,NULL,NULL,29),(1087,25,'DiUKh_MjsI0',0,NULL,NULL,29),(1088,26,'DiUKh_MjsI0',0,NULL,NULL,29),(1089,27,'DiUKh_MjsI0',0,NULL,NULL,29),(1090,28,'DiUKh_MjsI0',0,NULL,NULL,29),(1091,29,'DiUKh_MjsI0',0,NULL,NULL,29),(1092,30,'DiUKh_MjsI0',0,NULL,NULL,29),(1093,31,'DiUKh_MjsI0',0,NULL,NULL,29),(1094,32,'DiUKh_MjsI0',0,NULL,NULL,29),(1095,33,'DiUKh_MjsI0',0,NULL,NULL,29),(1096,34,'DiUKh_MjsI0',0,NULL,NULL,29),(1097,35,'DiUKh_MjsI0',0,NULL,NULL,29),(1098,36,'DiUKh_MjsI0',0,NULL,NULL,29),(1099,37,'DiUKh_MjsI0',0,NULL,NULL,29),(1100,38,'DiUKh_MjsI0',0,NULL,NULL,29),(1101,39,'DiUKh_MjsI0',0,NULL,NULL,29),(1102,40,'DiUKh_MjsI0',0,NULL,NULL,29),(1103,41,'DiUKh_MjsI0',0,NULL,NULL,29),(1104,42,'DiUKh_MjsI0',0,NULL,NULL,29),(1105,43,'DiUKh_MjsI0',0,NULL,NULL,29),(1106,44,'DiUKh_MjsI0',0,NULL,NULL,29),(1107,45,'DiUKh_MjsI0',0,NULL,NULL,29),(1108,46,'DiUKh_MjsI0',0,NULL,NULL,29),(1109,47,'DiUKh_MjsI0',0,NULL,NULL,29),(1110,48,'DiUKh_MjsI0',0,NULL,NULL,29),(1111,49,'DiUKh_MjsI0',0,NULL,NULL,29),(1112,50,'DiUKh_MjsI0',0,NULL,NULL,29),(1113,51,'DiUKh_MjsI0',0,NULL,NULL,29),(1114,52,'DiUKh_MjsI0',0,NULL,NULL,29),(1115,53,'DiUKh_MjsI0',0,NULL,NULL,29),(1116,54,'DiUKh_MjsI0',0,NULL,NULL,29),(1117,55,'DiUKh_MjsI0',0,NULL,NULL,29),(1118,56,'DiUKh_MjsI0',0,NULL,NULL,29),(1119,57,'DiUKh_MjsI0',0,NULL,NULL,29),(1120,58,'DiUKh_MjsI0',0,NULL,NULL,29),(1121,59,'DiUKh_MjsI0',0,NULL,NULL,29),(1122,60,'DiUKh_MjsI0',0,NULL,NULL,29),(1123,61,'DiUKh_MjsI0',0,NULL,NULL,29),(1124,62,'DiUKh_MjsI0',0,NULL,NULL,29),(1125,63,'DiUKh_MjsI0',0,NULL,NULL,29),(1126,64,'DiUKh_MjsI0',0,NULL,NULL,29),(1127,65,'DiUKh_MjsI0',0,NULL,NULL,29),(1128,66,'DiUKh_MjsI0',0,NULL,NULL,29),(1129,67,'DiUKh_MjsI0',0,NULL,NULL,29),(1130,68,'DiUKh_MjsI0',0,NULL,NULL,29),(1131,69,'DiUKh_MjsI0',0,NULL,NULL,29),(1132,70,'DiUKh_MjsI0',0,NULL,NULL,29),(1133,71,'DiUKh_MjsI0',0,NULL,NULL,29),(1134,72,'DiUKh_MjsI0',0,NULL,NULL,29),(1135,73,'DiUKh_MjsI0',0,NULL,NULL,29),(1136,74,'DiUKh_MjsI0',0,NULL,NULL,29),(1137,75,'DiUKh_MjsI0',0,NULL,NULL,29),(1138,76,'DiUKh_MjsI0',0,NULL,NULL,29),(1139,77,'DiUKh_MjsI0',0,NULL,NULL,29),(1140,78,'DiUKh_MjsI0',0,NULL,NULL,29),(1141,79,'DiUKh_MjsI0',0,NULL,NULL,29),(1142,80,'DiUKh_MjsI0',0,NULL,NULL,29),(1143,81,'DiUKh_MjsI0',0,NULL,NULL,29),(1144,82,'DiUKh_MjsI0',0,NULL,NULL,29),(1145,83,'DiUKh_MjsI0',0,NULL,NULL,29),(1146,84,'DiUKh_MjsI0',0,NULL,NULL,29),(1147,85,'DiUKh_MjsI0',0,NULL,NULL,29),(1148,86,'DiUKh_MjsI0',0,NULL,NULL,29),(1149,87,'DiUKh_MjsI0',0,NULL,NULL,29),(1150,88,'DiUKh_MjsI0',0,NULL,NULL,29),(1151,89,'DiUKh_MjsI0',0,NULL,NULL,29),(1152,90,'DiUKh_MjsI0',0,NULL,NULL,29),(1153,91,'DiUKh_MjsI0',0,NULL,NULL,29),(1154,92,'DiUKh_MjsI0',0,NULL,NULL,29),(1155,93,'DiUKh_MjsI0',0,NULL,NULL,29),(1156,94,'DiUKh_MjsI0',0,NULL,NULL,29),(1157,95,'DiUKh_MjsI0',0,NULL,NULL,29),(1158,96,'DiUKh_MjsI0',0,NULL,NULL,29),(1159,97,'DiUKh_MjsI0',0,NULL,NULL,29),(1160,98,'DiUKh_MjsI0',0,NULL,NULL,29),(1161,99,'DiUKh_MjsI0',0,NULL,NULL,29),(1162,100,'DiUKh_MjsI0',0,NULL,NULL,29),(1163,101,'DiUKh_MjsI0',0,NULL,NULL,29),(1164,102,'DiUKh_MjsI0',0,NULL,NULL,29),(1165,103,'DiUKh_MjsI0',0,NULL,NULL,29),(1166,104,'DiUKh_MjsI0',0,NULL,NULL,29),(1167,105,'DiUKh_MjsI0',0,NULL,NULL,29),(1168,106,'DiUKh_MjsI0',0,NULL,NULL,29),(1169,107,'DiUKh_MjsI0',0,NULL,NULL,29),(1170,108,'DiUKh_MjsI0',0,NULL,NULL,29),(1171,109,'DiUKh_MjsI0',0,NULL,NULL,29),(1172,110,'DiUKh_MjsI0',0,NULL,NULL,29),(1173,111,'DiUKh_MjsI0',0,NULL,NULL,29),(1174,112,'DiUKh_MjsI0',0,NULL,NULL,29),(1175,113,'DiUKh_MjsI0',0,NULL,NULL,29),(1176,114,'DiUKh_MjsI0',0,NULL,NULL,29),(1177,115,'DiUKh_MjsI0',0,NULL,NULL,29),(1178,116,'DiUKh_MjsI0',0,NULL,NULL,29),(1179,117,'DiUKh_MjsI0',0,NULL,NULL,29),(1180,118,'DiUKh_MjsI0',0,NULL,NULL,29),(1181,119,'DiUKh_MjsI0',0,NULL,NULL,29),(1182,120,'DiUKh_MjsI0',0,NULL,NULL,29),(1183,121,'DiUKh_MjsI0',0,NULL,NULL,29),(1184,122,'DiUKh_MjsI0',0,NULL,NULL,29),(1185,123,'DiUKh_MjsI0',0,NULL,NULL,29),(1186,124,'DiUKh_MjsI0',0,NULL,NULL,29),(1187,125,'DiUKh_MjsI0',0,NULL,NULL,29),(1188,126,'DiUKh_MjsI0',0,NULL,NULL,29),(1189,127,'DiUKh_MjsI0',0,NULL,NULL,29),(1190,128,'DiUKh_MjsI0',0,NULL,NULL,29),(1191,129,'DiUKh_MjsI0',0,NULL,NULL,29),(1192,130,'DiUKh_MjsI0',0,NULL,NULL,29),(1193,131,'DiUKh_MjsI0',0,NULL,NULL,29),(1194,132,'DiUKh_MjsI0',0,NULL,NULL,29),(1195,133,'DiUKh_MjsI0',0,NULL,NULL,29),(1196,134,'DiUKh_MjsI0',0,NULL,NULL,29),(1197,135,'DiUKh_MjsI0',0,NULL,NULL,29),(1198,136,'DiUKh_MjsI0',0,NULL,NULL,29),(1199,137,'DiUKh_MjsI0',0,NULL,NULL,29),(1200,138,'DiUKh_MjsI0',0,NULL,NULL,29),(1201,139,'DiUKh_MjsI0',0,NULL,NULL,29),(1202,140,'DiUKh_MjsI0',0,NULL,NULL,29),(1203,141,'DiUKh_MjsI0',0,NULL,NULL,29),(1204,142,'DiUKh_MjsI0',0,NULL,NULL,29),(1205,143,'DiUKh_MjsI0',0,NULL,NULL,29),(1206,144,'DiUKh_MjsI0',0,NULL,NULL,29),(1207,145,'DiUKh_MjsI0',0,NULL,NULL,29),(1208,146,'DiUKh_MjsI0',0,NULL,NULL,29),(1209,147,'DiUKh_MjsI0',0,NULL,NULL,29),(1210,148,'DiUKh_MjsI0',0,NULL,NULL,29),(1211,149,'DiUKh_MjsI0',0,NULL,NULL,29),(1212,150,'DiUKh_MjsI0',0,NULL,NULL,29),(1213,151,'DiUKh_MjsI0',0,NULL,NULL,29),(1214,152,'DiUKh_MjsI0',0,NULL,NULL,29),(1215,153,'DiUKh_MjsI0',0,NULL,NULL,29),(1216,154,'DiUKh_MjsI0',0,NULL,NULL,29),(1217,155,'DiUKh_MjsI0',0,NULL,NULL,29),(1218,156,'DiUKh_MjsI0',0,NULL,NULL,29),(1219,157,'DiUKh_MjsI0',0,NULL,NULL,29),(1220,158,'DiUKh_MjsI0',0,NULL,NULL,29),(1221,159,'DiUKh_MjsI0',0,NULL,NULL,29),(1222,160,'DiUKh_MjsI0',0,NULL,NULL,29),(1223,161,'DiUKh_MjsI0',0,NULL,NULL,29),(1224,162,'DiUKh_MjsI0',0,NULL,NULL,29),(1225,163,'DiUKh_MjsI0',0,NULL,NULL,29),(1226,164,'DiUKh_MjsI0',0,NULL,NULL,29),(1227,165,'DiUKh_MjsI0',0,NULL,NULL,29),(1228,166,'DiUKh_MjsI0',0,NULL,NULL,29),(1229,167,'DiUKh_MjsI0',0,NULL,NULL,29),(1230,168,'DiUKh_MjsI0',0,NULL,NULL,29),(1231,169,'DiUKh_MjsI0',0,NULL,NULL,29),(1232,170,'DiUKh_MjsI0',0,NULL,NULL,29),(1233,171,'DiUKh_MjsI0',0,NULL,NULL,29),(1234,172,'DiUKh_MjsI0',0,NULL,NULL,29),(1235,173,'DiUKh_MjsI0',0,NULL,NULL,29),(1236,174,'DiUKh_MjsI0',0,NULL,NULL,29),(1237,175,'DiUKh_MjsI0',0,NULL,NULL,29),(1238,176,'DiUKh_MjsI0',0,NULL,NULL,29),(1239,177,'DiUKh_MjsI0',0,NULL,NULL,29),(1240,178,'DiUKh_MjsI0',0,NULL,NULL,29),(1241,179,'DiUKh_MjsI0',0,NULL,NULL,29),(1242,180,'DiUKh_MjsI0',0,NULL,NULL,29),(1243,181,'DiUKh_MjsI0',0,NULL,NULL,29),(1244,182,'DiUKh_MjsI0',0,NULL,NULL,29),(1245,183,'DiUKh_MjsI0',0,NULL,NULL,29),(1246,184,'DiUKh_MjsI0',0,NULL,NULL,29),(1247,185,'DiUKh_MjsI0',0,NULL,NULL,29),(1248,186,'DiUKh_MjsI0',0,NULL,NULL,29),(1249,187,'DiUKh_MjsI0',0,NULL,NULL,29),(1250,188,'DiUKh_MjsI0',0,NULL,NULL,29),(1251,189,'DiUKh_MjsI0',0,NULL,NULL,29),(1252,190,'DiUKh_MjsI0',0,NULL,NULL,29),(1253,191,'DiUKh_MjsI0',0,NULL,NULL,29),(1254,192,'DiUKh_MjsI0',0,NULL,NULL,29),(1255,193,'DiUKh_MjsI0',0,NULL,NULL,29),(1256,194,'DiUKh_MjsI0',0,NULL,NULL,29),(1257,195,'DiUKh_MjsI0',0,NULL,NULL,29),(1258,196,'DiUKh_MjsI0',0,NULL,NULL,29),(1259,197,'DiUKh_MjsI0',0,NULL,NULL,29),(1260,198,'DiUKh_MjsI0',0,NULL,NULL,29),(1261,199,'DiUKh_MjsI0',0,NULL,NULL,29),(1262,200,'DiUKh_MjsI0',0,NULL,NULL,29),(1263,201,'DiUKh_MjsI0',0,NULL,NULL,29),(1264,202,'DiUKh_MjsI0',0,NULL,NULL,29),(1265,203,'DiUKh_MjsI0',0,NULL,NULL,29),(1266,204,'DiUKh_MjsI0',0,NULL,NULL,29),(1267,205,'DiUKh_MjsI0',0,NULL,NULL,29),(1268,206,'DiUKh_MjsI0',0,NULL,NULL,29),(1269,207,'DiUKh_MjsI0',0,NULL,NULL,29),(1270,208,'DiUKh_MjsI0',0,NULL,NULL,29),(1271,209,'DiUKh_MjsI0',0,NULL,NULL,29),(1272,210,'DiUKh_MjsI0',0,NULL,NULL,29),(1273,211,'DiUKh_MjsI0',0,NULL,NULL,29),(1274,212,'DiUKh_MjsI0',0,NULL,NULL,29),(1275,213,'DiUKh_MjsI0',0,NULL,NULL,29),(1276,214,'DiUKh_MjsI0',0,NULL,NULL,29),(1277,215,'DiUKh_MjsI0',0,NULL,NULL,29),(1278,216,'DiUKh_MjsI0',0,NULL,NULL,29),(1279,217,'DiUKh_MjsI0',0,NULL,NULL,29),(1280,218,'DiUKh_MjsI0',0,NULL,NULL,29),(1281,219,'DiUKh_MjsI0',0,NULL,NULL,29),(1282,220,'DiUKh_MjsI0',0,NULL,NULL,29),(1283,1,'DiUKh_MjsI0',0,NULL,NULL,30),(1284,1,'DiUKh_MjsI0',0,NULL,NULL,31),(1285,1,'DiUKh_MjsI0',0,NULL,NULL,32),(1286,1,'DiUKh_MjsI0',0,NULL,NULL,33),(1287,2,'DiUKh_MjsI0',0,NULL,NULL,33),(1288,3,'DiUKh_MjsI0',0,NULL,NULL,33),(1289,4,'DiUKh_MjsI0',0,NULL,NULL,33),(1290,5,'DiUKh_MjsI0',0,NULL,NULL,33),(1291,6,'DiUKh_MjsI0',0,NULL,NULL,33),(1292,7,'DiUKh_MjsI0',0,NULL,NULL,33),(1293,8,'DiUKh_MjsI0',0,NULL,NULL,33),(1294,9,'DiUKh_MjsI0',0,NULL,NULL,33),(1295,10,'DiUKh_MjsI0',0,NULL,NULL,33),(1296,11,'DiUKh_MjsI0',0,NULL,NULL,33),(1297,12,'DiUKh_MjsI0',0,NULL,NULL,33),(1298,13,'DiUKh_MjsI0',0,NULL,NULL,33),(1299,14,'DiUKh_MjsI0',0,NULL,NULL,33),(1300,15,'DiUKh_MjsI0',0,NULL,NULL,33),(1301,16,'DiUKh_MjsI0',0,NULL,NULL,33),(1302,17,'DiUKh_MjsI0',0,NULL,NULL,33),(1303,18,'DiUKh_MjsI0',0,NULL,NULL,33),(1304,19,'DiUKh_MjsI0',0,NULL,NULL,33),(1305,20,'DiUKh_MjsI0',0,NULL,NULL,33),(1306,21,'DiUKh_MjsI0',0,NULL,NULL,33),(1307,22,'DiUKh_MjsI0',0,NULL,NULL,33),(1308,23,'DiUKh_MjsI0',0,NULL,NULL,33),(1309,24,'DiUKh_MjsI0',0,NULL,NULL,33),(1310,25,'DiUKh_MjsI0',0,NULL,NULL,33),(1311,26,'DiUKh_MjsI0',0,NULL,NULL,33),(1312,27,'DiUKh_MjsI0',0,NULL,NULL,33),(1313,28,'DiUKh_MjsI0',0,NULL,NULL,33),(1314,29,'DiUKh_MjsI0',0,NULL,NULL,33),(1315,30,'DiUKh_MjsI0',0,NULL,NULL,33),(1316,31,'DiUKh_MjsI0',0,NULL,NULL,33),(1317,32,'DiUKh_MjsI0',0,NULL,NULL,33),(1318,33,'DiUKh_MjsI0',0,NULL,NULL,33),(1319,34,'DiUKh_MjsI0',0,NULL,NULL,33),(1320,35,'DiUKh_MjsI0',0,NULL,NULL,33),(1321,36,'DiUKh_MjsI0',0,NULL,NULL,33),(1322,37,'DiUKh_MjsI0',0,NULL,NULL,33),(1323,38,'DiUKh_MjsI0',0,NULL,NULL,33),(1324,39,'DiUKh_MjsI0',0,NULL,NULL,33),(1325,40,'DiUKh_MjsI0',0,NULL,NULL,33),(1326,41,'DiUKh_MjsI0',0,NULL,NULL,33),(1327,42,'DiUKh_MjsI0',0,NULL,NULL,33),(1328,43,'DiUKh_MjsI0',0,NULL,NULL,33),(1329,44,'DiUKh_MjsI0',0,NULL,NULL,33),(1330,45,'DiUKh_MjsI0',0,NULL,NULL,33),(1331,46,'DiUKh_MjsI0',0,NULL,NULL,33),(1332,47,'DiUKh_MjsI0',0,NULL,NULL,33),(1333,48,'DiUKh_MjsI0',0,NULL,NULL,33),(1334,49,'DiUKh_MjsI0',0,NULL,NULL,33),(1335,50,'DiUKh_MjsI0',0,NULL,NULL,33),(1336,51,'DiUKh_MjsI0',0,NULL,NULL,33),(1337,52,'DiUKh_MjsI0',0,NULL,NULL,33),(1338,53,'DiUKh_MjsI0',0,NULL,NULL,33),(1339,54,'DiUKh_MjsI0',0,NULL,NULL,33),(1340,55,'DiUKh_MjsI0',0,NULL,NULL,33),(1341,56,'DiUKh_MjsI0',0,NULL,NULL,33),(1342,57,'DiUKh_MjsI0',0,NULL,NULL,33),(1343,58,'DiUKh_MjsI0',0,NULL,NULL,33),(1344,59,'DiUKh_MjsI0',0,NULL,NULL,33),(1345,60,'DiUKh_MjsI0',0,NULL,NULL,33),(1346,61,'DiUKh_MjsI0',0,NULL,NULL,33),(1347,62,'DiUKh_MjsI0',0,NULL,NULL,33),(1348,63,'DiUKh_MjsI0',0,NULL,NULL,33),(1349,64,'DiUKh_MjsI0',0,NULL,NULL,33),(1350,65,'DiUKh_MjsI0',0,NULL,NULL,33),(1351,66,'DiUKh_MjsI0',0,NULL,NULL,33),(1352,67,'DiUKh_MjsI0',0,NULL,NULL,33),(1353,68,'DiUKh_MjsI0',0,NULL,NULL,33),(1354,69,'DiUKh_MjsI0',0,NULL,NULL,33),(1355,70,'DiUKh_MjsI0',0,NULL,NULL,33),(1356,71,'DiUKh_MjsI0',0,NULL,NULL,33),(1357,72,'DiUKh_MjsI0',0,NULL,NULL,33),(1358,73,'DiUKh_MjsI0',0,NULL,NULL,33),(1359,74,'DiUKh_MjsI0',0,NULL,NULL,33),(1360,75,'DiUKh_MjsI0',0,NULL,NULL,33),(1361,76,'DiUKh_MjsI0',0,NULL,NULL,33),(1362,77,'DiUKh_MjsI0',0,NULL,NULL,33),(1363,78,'DiUKh_MjsI0',0,NULL,NULL,33),(1364,79,'DiUKh_MjsI0',0,NULL,NULL,33),(1365,80,'DiUKh_MjsI0',0,NULL,NULL,33),(1366,81,'DiUKh_MjsI0',0,NULL,NULL,33),(1367,82,'DiUKh_MjsI0',0,NULL,NULL,33),(1368,83,'DiUKh_MjsI0',0,NULL,NULL,33),(1369,84,'DiUKh_MjsI0',0,NULL,NULL,33),(1370,85,'DiUKh_MjsI0',0,NULL,NULL,33),(1371,86,'DiUKh_MjsI0',0,NULL,NULL,33),(1372,87,'DiUKh_MjsI0',0,NULL,NULL,33),(1373,88,'DiUKh_MjsI0',0,NULL,NULL,33),(1374,89,'DiUKh_MjsI0',0,NULL,NULL,33),(1375,90,'DiUKh_MjsI0',0,NULL,NULL,33),(1376,91,'DiUKh_MjsI0',0,NULL,NULL,33),(1377,92,'DiUKh_MjsI0',0,NULL,NULL,33),(1378,93,'DiUKh_MjsI0',0,NULL,NULL,33),(1379,94,'DiUKh_MjsI0',0,NULL,NULL,33),(1380,95,'DiUKh_MjsI0',0,NULL,NULL,33),(1381,96,'DiUKh_MjsI0',0,NULL,NULL,33),(1382,97,'DiUKh_MjsI0',0,NULL,NULL,33),(1383,98,'DiUKh_MjsI0',0,NULL,NULL,33),(1384,99,'DiUKh_MjsI0',0,NULL,NULL,33),(1385,100,'DiUKh_MjsI0',0,NULL,NULL,33),(1386,101,'DiUKh_MjsI0',0,NULL,NULL,33),(1387,102,'DiUKh_MjsI0',0,NULL,NULL,33),(1388,103,'DiUKh_MjsI0',0,NULL,NULL,33),(1389,104,'DiUKh_MjsI0',0,NULL,NULL,33),(1390,105,'DiUKh_MjsI0',0,NULL,NULL,33),(1391,106,'DiUKh_MjsI0',0,NULL,NULL,33),(1392,107,'DiUKh_MjsI0',0,NULL,NULL,33),(1393,108,'DiUKh_MjsI0',0,NULL,NULL,33),(1394,109,'DiUKh_MjsI0',0,NULL,NULL,33),(1395,110,'DiUKh_MjsI0',0,NULL,NULL,33),(1396,111,'DiUKh_MjsI0',0,NULL,NULL,33),(1397,112,'DiUKh_MjsI0',0,NULL,NULL,33),(1398,113,'DiUKh_MjsI0',0,NULL,NULL,33),(1399,114,'DiUKh_MjsI0',0,NULL,NULL,33),(1400,115,'DiUKh_MjsI0',0,NULL,NULL,33),(1401,116,'DiUKh_MjsI0',0,NULL,NULL,33),(1402,117,'DiUKh_MjsI0',0,NULL,NULL,33),(1403,118,'DiUKh_MjsI0',0,NULL,NULL,33),(1404,119,'DiUKh_MjsI0',0,NULL,NULL,33),(1405,120,'DiUKh_MjsI0',0,NULL,NULL,33),(1406,121,'DiUKh_MjsI0',0,NULL,NULL,33),(1407,122,'DiUKh_MjsI0',0,NULL,NULL,33),(1408,123,'DiUKh_MjsI0',0,NULL,NULL,33),(1409,124,'DiUKh_MjsI0',0,NULL,NULL,33),(1410,125,'DiUKh_MjsI0',0,NULL,NULL,33),(1411,126,'DiUKh_MjsI0',0,NULL,NULL,33),(1412,127,'DiUKh_MjsI0',0,NULL,NULL,33),(1413,128,'DiUKh_MjsI0',0,NULL,NULL,33),(1414,129,'DiUKh_MjsI0',0,NULL,NULL,33),(1415,130,'DiUKh_MjsI0',0,NULL,NULL,33),(1416,131,'DiUKh_MjsI0',0,NULL,NULL,33),(1417,132,'DiUKh_MjsI0',0,NULL,NULL,33),(1418,133,'DiUKh_MjsI0',0,NULL,NULL,33),(1419,134,'DiUKh_MjsI0',0,NULL,NULL,33),(1420,135,'DiUKh_MjsI0',0,NULL,NULL,33),(1421,136,'DiUKh_MjsI0',0,NULL,NULL,33),(1422,137,'DiUKh_MjsI0',0,NULL,NULL,33),(1423,138,'DiUKh_MjsI0',0,NULL,NULL,33),(1424,139,'DiUKh_MjsI0',0,NULL,NULL,33),(1425,140,'DiUKh_MjsI0',0,NULL,NULL,33),(1426,141,'DiUKh_MjsI0',0,NULL,NULL,33),(1427,142,'DiUKh_MjsI0',0,NULL,NULL,33),(1428,143,'DiUKh_MjsI0',0,NULL,NULL,33),(1429,144,'DiUKh_MjsI0',0,NULL,NULL,33),(1430,145,'DiUKh_MjsI0',0,NULL,NULL,33),(1431,146,'DiUKh_MjsI0',0,NULL,NULL,33),(1432,147,'DiUKh_MjsI0',0,NULL,NULL,33),(1433,148,'DiUKh_MjsI0',0,NULL,NULL,33),(1434,149,'DiUKh_MjsI0',0,NULL,NULL,33),(1435,150,'DiUKh_MjsI0',0,NULL,NULL,33),(1436,151,'DiUKh_MjsI0',0,NULL,NULL,33),(1437,152,'DiUKh_MjsI0',0,NULL,NULL,33),(1438,153,'DiUKh_MjsI0',0,NULL,NULL,33),(1439,154,'DiUKh_MjsI0',0,NULL,NULL,33),(1440,155,'DiUKh_MjsI0',0,NULL,NULL,33),(1441,156,'DiUKh_MjsI0',0,NULL,NULL,33),(1442,157,'DiUKh_MjsI0',0,NULL,NULL,33),(1443,158,'DiUKh_MjsI0',0,NULL,NULL,33),(1444,159,'DiUKh_MjsI0',0,NULL,NULL,33),(1445,160,'DiUKh_MjsI0',0,NULL,NULL,33),(1446,161,'DiUKh_MjsI0',0,NULL,NULL,33),(1447,162,'DiUKh_MjsI0',0,NULL,NULL,33),(1448,163,'DiUKh_MjsI0',0,NULL,NULL,33),(1449,164,'DiUKh_MjsI0',0,NULL,NULL,33),(1450,165,'DiUKh_MjsI0',0,NULL,NULL,33),(1451,166,'DiUKh_MjsI0',0,NULL,NULL,33),(1452,167,'DiUKh_MjsI0',0,NULL,NULL,33),(1453,168,'DiUKh_MjsI0',0,NULL,NULL,33),(1454,169,'DiUKh_MjsI0',0,NULL,NULL,33),(1455,170,'DiUKh_MjsI0',0,NULL,NULL,33),(1456,171,'DiUKh_MjsI0',0,NULL,NULL,33),(1457,172,'DiUKh_MjsI0',0,NULL,NULL,33),(1458,173,'DiUKh_MjsI0',0,NULL,NULL,33),(1459,174,'DiUKh_MjsI0',0,NULL,NULL,33),(1460,175,'DiUKh_MjsI0',0,NULL,NULL,33),(1461,176,'DiUKh_MjsI0',0,NULL,NULL,33),(1462,177,'DiUKh_MjsI0',0,NULL,NULL,33),(1463,178,'DiUKh_MjsI0',0,NULL,NULL,33),(1464,179,'DiUKh_MjsI0',0,NULL,NULL,33),(1465,180,'DiUKh_MjsI0',0,NULL,NULL,33),(1466,181,'DiUKh_MjsI0',0,NULL,NULL,33),(1467,182,'DiUKh_MjsI0',0,NULL,NULL,33),(1468,183,'DiUKh_MjsI0',0,NULL,NULL,33),(1469,184,'DiUKh_MjsI0',0,NULL,NULL,33),(1470,185,'DiUKh_MjsI0',0,NULL,NULL,33),(1471,186,'DiUKh_MjsI0',0,NULL,NULL,33),(1472,187,'DiUKh_MjsI0',0,NULL,NULL,33),(1473,188,'DiUKh_MjsI0',0,NULL,NULL,33),(1474,189,'DiUKh_MjsI0',0,NULL,NULL,33),(1475,190,'DiUKh_MjsI0',0,NULL,NULL,33),(1476,191,'DiUKh_MjsI0',0,NULL,NULL,33),(1477,192,'DiUKh_MjsI0',0,NULL,NULL,33),(1478,193,'DiUKh_MjsI0',0,NULL,NULL,33),(1479,194,'DiUKh_MjsI0',0,NULL,NULL,33),(1480,195,'DiUKh_MjsI0',0,NULL,NULL,33),(1481,196,'DiUKh_MjsI0',0,NULL,NULL,33),(1482,197,'DiUKh_MjsI0',0,NULL,NULL,33),(1483,198,'DiUKh_MjsI0',0,NULL,NULL,33),(1484,199,'DiUKh_MjsI0',0,NULL,NULL,33),(1485,200,'DiUKh_MjsI0',0,NULL,NULL,33),(1486,201,'DiUKh_MjsI0',0,NULL,NULL,33),(1487,202,'DiUKh_MjsI0',0,NULL,NULL,33),(1488,203,'DiUKh_MjsI0',0,NULL,NULL,33),(1489,204,'DiUKh_MjsI0',0,NULL,NULL,33),(1490,205,'DiUKh_MjsI0',0,NULL,NULL,33),(1491,206,'DiUKh_MjsI0',0,NULL,NULL,33),(1492,207,'DiUKh_MjsI0',0,NULL,NULL,33),(1493,208,'DiUKh_MjsI0',0,NULL,NULL,33),(1494,209,'DiUKh_MjsI0',0,NULL,NULL,33),(1495,210,'DiUKh_MjsI0',0,NULL,NULL,33),(1496,211,'DiUKh_MjsI0',0,NULL,NULL,33),(1497,212,'DiUKh_MjsI0',0,NULL,NULL,33),(1498,213,'DiUKh_MjsI0',0,NULL,NULL,33),(1499,214,'DiUKh_MjsI0',0,NULL,NULL,33),(1500,215,'DiUKh_MjsI0',0,NULL,NULL,33),(1501,216,'DiUKh_MjsI0',0,NULL,NULL,33),(1502,217,'DiUKh_MjsI0',0,NULL,NULL,33),(1503,218,'DiUKh_MjsI0',0,NULL,NULL,33),(1504,219,'DiUKh_MjsI0',0,NULL,NULL,33),(1505,220,'DiUKh_MjsI0',0,NULL,NULL,33),(1506,221,'DiUKh_MjsI0',0,NULL,NULL,33),(1507,222,'DiUKh_MjsI0',0,NULL,NULL,33),(1508,223,'DiUKh_MjsI0',0,NULL,NULL,33),(1509,224,'DiUKh_MjsI0',0,NULL,NULL,33),(1510,225,'DiUKh_MjsI0',0,NULL,NULL,33),(1511,226,'DiUKh_MjsI0',0,NULL,NULL,33),(1512,227,'DiUKh_MjsI0',0,NULL,NULL,33),(1513,228,'DiUKh_MjsI0',0,NULL,NULL,33),(1514,229,'DiUKh_MjsI0',0,NULL,NULL,33),(1515,230,'DiUKh_MjsI0',0,NULL,NULL,33),(1516,231,'DiUKh_MjsI0',0,NULL,NULL,33),(1517,232,'DiUKh_MjsI0',0,NULL,NULL,33),(1518,233,'DiUKh_MjsI0',0,NULL,NULL,33),(1519,234,'DiUKh_MjsI0',0,NULL,NULL,33),(1520,235,'DiUKh_MjsI0',0,NULL,NULL,33),(1521,236,'DiUKh_MjsI0',0,NULL,NULL,33),(1522,237,'DiUKh_MjsI0',0,NULL,NULL,33),(1523,238,'DiUKh_MjsI0',0,NULL,NULL,33),(1524,239,'DiUKh_MjsI0',0,NULL,NULL,33),(1525,240,'DiUKh_MjsI0',0,NULL,NULL,33),(1526,241,'DiUKh_MjsI0',0,NULL,NULL,33),(1527,242,'DiUKh_MjsI0',0,NULL,NULL,33),(1528,243,'DiUKh_MjsI0',0,NULL,NULL,33),(1529,244,'DiUKh_MjsI0',0,NULL,NULL,33),(1530,245,'DiUKh_MjsI0',0,NULL,NULL,33),(1531,246,'DiUKh_MjsI0',0,NULL,NULL,33),(1532,247,'DiUKh_MjsI0',0,NULL,NULL,33),(1533,248,'DiUKh_MjsI0',0,NULL,NULL,33),(1534,249,'DiUKh_MjsI0',0,NULL,NULL,33),(1535,250,'DiUKh_MjsI0',0,NULL,NULL,33),(1536,251,'DiUKh_MjsI0',0,NULL,NULL,33),(1537,252,'DiUKh_MjsI0',0,NULL,NULL,33),(1538,253,'DiUKh_MjsI0',0,NULL,NULL,33),(1539,254,'DiUKh_MjsI0',0,NULL,NULL,33),(1540,255,'DiUKh_MjsI0',0,NULL,NULL,33),(1541,256,'DiUKh_MjsI0',0,NULL,NULL,33),(1542,257,'DiUKh_MjsI0',0,NULL,NULL,33),(1543,258,'DiUKh_MjsI0',0,NULL,NULL,33),(1544,259,'DiUKh_MjsI0',0,NULL,NULL,33),(1545,260,'DiUKh_MjsI0',0,NULL,NULL,33),(1546,261,'DiUKh_MjsI0',0,NULL,NULL,33),(1547,262,'DiUKh_MjsI0',0,NULL,NULL,33),(1548,263,'DiUKh_MjsI0',0,NULL,NULL,33),(1549,264,'DiUKh_MjsI0',0,NULL,NULL,33),(1550,265,'DiUKh_MjsI0',0,NULL,NULL,33),(1551,266,'DiUKh_MjsI0',0,NULL,NULL,33),(1552,267,'DiUKh_MjsI0',0,NULL,NULL,33),(1553,268,'DiUKh_MjsI0',0,NULL,NULL,33),(1554,269,'DiUKh_MjsI0',0,NULL,NULL,33),(1555,270,'DiUKh_MjsI0',0,NULL,NULL,33),(1556,1,'DiUKh_MjsI0',0,NULL,NULL,34),(1557,2,'DiUKh_MjsI0',0,NULL,NULL,34),(1558,3,'DiUKh_MjsI0',0,NULL,NULL,34),(1559,4,'DiUKh_MjsI0',0,NULL,NULL,34),(1560,5,'DiUKh_MjsI0',0,NULL,NULL,34),(1561,6,'DiUKh_MjsI0',0,NULL,NULL,34),(1562,7,'DiUKh_MjsI0',0,NULL,NULL,34),(1563,8,'DiUKh_MjsI0',0,NULL,NULL,34),(1564,9,'DiUKh_MjsI0',0,NULL,NULL,34),(1565,10,'DiUKh_MjsI0',0,NULL,NULL,34),(1566,11,'DiUKh_MjsI0',0,NULL,NULL,34),(1567,12,'DiUKh_MjsI0',0,NULL,NULL,34),(1568,13,'DiUKh_MjsI0',0,NULL,NULL,34),(1569,14,'DiUKh_MjsI0',0,NULL,NULL,34),(1570,15,'DiUKh_MjsI0',0,NULL,NULL,34),(1571,16,'DiUKh_MjsI0',0,NULL,NULL,34),(1572,17,'DiUKh_MjsI0',0,NULL,NULL,34),(1573,18,'DiUKh_MjsI0',0,NULL,NULL,34),(1574,19,'DiUKh_MjsI0',0,NULL,NULL,34),(1575,20,'DiUKh_MjsI0',0,NULL,NULL,34),(1576,21,'DiUKh_MjsI0',0,NULL,NULL,34),(1577,22,'DiUKh_MjsI0',0,NULL,NULL,34),(1578,23,'DiUKh_MjsI0',0,NULL,NULL,34),(1579,24,'DiUKh_MjsI0',0,NULL,NULL,34),(1580,25,'DiUKh_MjsI0',0,NULL,NULL,34),(1581,26,'DiUKh_MjsI0',0,NULL,NULL,34),(1582,27,'DiUKh_MjsI0',0,NULL,NULL,34),(1583,28,'DiUKh_MjsI0',0,NULL,NULL,34),(1584,29,'DiUKh_MjsI0',0,NULL,NULL,34),(1585,30,'DiUKh_MjsI0',0,NULL,NULL,34),(1586,31,'DiUKh_MjsI0',0,NULL,NULL,34),(1587,32,'DiUKh_MjsI0',0,NULL,NULL,34),(1588,33,'DiUKh_MjsI0',0,NULL,NULL,34),(1589,34,'DiUKh_MjsI0',0,NULL,NULL,34),(1590,35,'DiUKh_MjsI0',0,NULL,NULL,34),(1591,36,'DiUKh_MjsI0',0,NULL,NULL,34),(1592,37,'DiUKh_MjsI0',0,NULL,NULL,34),(1593,38,'DiUKh_MjsI0',0,NULL,NULL,34),(1594,39,'DiUKh_MjsI0',0,NULL,NULL,34),(1595,40,'DiUKh_MjsI0',0,NULL,NULL,34),(1596,41,'DiUKh_MjsI0',0,NULL,NULL,34),(1597,42,'DiUKh_MjsI0',0,NULL,NULL,34),(1598,43,'DiUKh_MjsI0',0,NULL,NULL,34),(1599,44,'DiUKh_MjsI0',0,NULL,NULL,34),(1600,45,'DiUKh_MjsI0',0,NULL,NULL,34),(1601,46,'DiUKh_MjsI0',0,NULL,NULL,34),(1602,47,'DiUKh_MjsI0',0,NULL,NULL,34),(1603,48,'DiUKh_MjsI0',0,NULL,NULL,34),(1604,49,'DiUKh_MjsI0',0,NULL,NULL,34),(1605,50,'DiUKh_MjsI0',0,NULL,NULL,34),(1606,51,'DiUKh_MjsI0',0,NULL,NULL,34),(1607,1,'DiUKh_MjsI0',0,NULL,NULL,35),(1608,1,'DiUKh_MjsI0',0,NULL,NULL,36),(1609,1,'DiUKh_MjsI0',0,NULL,NULL,37),(1610,1,'DiUKh_MjsI0',0,NULL,NULL,38),(1611,2,'DiUKh_MjsI0',0,NULL,NULL,38),(1612,3,'DiUKh_MjsI0',0,NULL,NULL,38),(1613,4,'DiUKh_MjsI0',0,NULL,NULL,38),(1614,5,'DiUKh_MjsI0',0,NULL,NULL,38),(1615,6,'DiUKh_MjsI0',0,NULL,NULL,38),(1616,7,'DiUKh_MjsI0',0,NULL,NULL,38),(1617,8,'DiUKh_MjsI0',0,NULL,NULL,38),(1618,9,'DiUKh_MjsI0',0,NULL,NULL,38),(1619,10,'DiUKh_MjsI0',0,NULL,NULL,38),(1620,11,'DiUKh_MjsI0',0,NULL,NULL,38),(1621,12,'DiUKh_MjsI0',0,NULL,NULL,38),(1622,13,'DiUKh_MjsI0',0,NULL,NULL,38),(1623,14,'DiUKh_MjsI0',0,NULL,NULL,38),(1624,15,'DiUKh_MjsI0',0,NULL,NULL,38),(1625,16,'DiUKh_MjsI0',0,NULL,NULL,38),(1626,17,'DiUKh_MjsI0',0,NULL,NULL,38),(1627,18,'DiUKh_MjsI0',0,NULL,NULL,38),(1628,19,'DiUKh_MjsI0',0,NULL,NULL,38),(1629,20,'DiUKh_MjsI0',0,NULL,NULL,38),(1630,21,'DiUKh_MjsI0',0,NULL,NULL,38),(1631,22,'DiUKh_MjsI0',0,NULL,NULL,38),(1632,23,'DiUKh_MjsI0',0,NULL,NULL,38),(1633,24,'DiUKh_MjsI0',0,NULL,NULL,38),(1634,25,'DiUKh_MjsI0',0,NULL,NULL,38),(1635,26,'DiUKh_MjsI0',0,NULL,NULL,38),(1636,27,'DiUKh_MjsI0',0,NULL,NULL,38),(1637,28,'DiUKh_MjsI0',0,NULL,NULL,38),(1638,29,'DiUKh_MjsI0',0,NULL,NULL,38),(1639,30,'DiUKh_MjsI0',0,NULL,NULL,38),(1640,31,'DiUKh_MjsI0',0,NULL,NULL,38),(1641,32,'DiUKh_MjsI0',0,NULL,NULL,38),(1642,33,'DiUKh_MjsI0',0,NULL,NULL,38),(1643,34,'DiUKh_MjsI0',0,NULL,NULL,38),(1644,35,'DiUKh_MjsI0',0,NULL,NULL,38),(1645,36,'DiUKh_MjsI0',0,NULL,NULL,38),(1646,37,'DiUKh_MjsI0',0,NULL,NULL,38),(1647,38,'DiUKh_MjsI0',0,NULL,NULL,38),(1648,39,'DiUKh_MjsI0',0,NULL,NULL,38),(1649,40,'DiUKh_MjsI0',0,NULL,NULL,38),(1650,41,'DiUKh_MjsI0',0,NULL,NULL,38),(1651,42,'DiUKh_MjsI0',0,NULL,NULL,38),(1652,43,'DiUKh_MjsI0',0,NULL,NULL,38),(1653,44,'DiUKh_MjsI0',0,NULL,NULL,38),(1654,45,'DiUKh_MjsI0',0,NULL,NULL,38),(1655,46,'DiUKh_MjsI0',0,NULL,NULL,38),(1656,47,'DiUKh_MjsI0',0,NULL,NULL,38),(1657,48,'DiUKh_MjsI0',0,NULL,NULL,38),(1658,49,'DiUKh_MjsI0',0,NULL,NULL,38),(1659,50,'DiUKh_MjsI0',0,NULL,NULL,38),(1660,51,'DiUKh_MjsI0',0,NULL,NULL,38),(1661,52,'DiUKh_MjsI0',0,NULL,NULL,38),(1662,53,'DiUKh_MjsI0',0,NULL,NULL,38),(1663,54,'DiUKh_MjsI0',0,NULL,NULL,38),(1664,55,'DiUKh_MjsI0',0,NULL,NULL,38),(1665,56,'DiUKh_MjsI0',0,NULL,NULL,38),(1666,57,'DiUKh_MjsI0',0,NULL,NULL,38),(1667,58,'DiUKh_MjsI0',0,NULL,NULL,38),(1668,59,'DiUKh_MjsI0',0,NULL,NULL,38),(1669,60,'DiUKh_MjsI0',0,NULL,NULL,38),(1670,61,'DiUKh_MjsI0',0,NULL,NULL,38),(1671,62,'DiUKh_MjsI0',0,NULL,NULL,38),(1672,63,'DiUKh_MjsI0',0,NULL,NULL,38),(1673,64,'DiUKh_MjsI0',0,NULL,NULL,38),(1674,65,'DiUKh_MjsI0',0,NULL,NULL,38),(1675,66,'DiUKh_MjsI0',0,NULL,NULL,38),(1676,67,'DiUKh_MjsI0',0,NULL,NULL,38),(1677,68,'DiUKh_MjsI0',0,NULL,NULL,38),(1678,69,'DiUKh_MjsI0',0,NULL,NULL,38),(1679,70,'DiUKh_MjsI0',0,NULL,NULL,38),(1680,71,'DiUKh_MjsI0',0,NULL,NULL,38),(1681,72,'DiUKh_MjsI0',0,NULL,NULL,38),(1682,73,'DiUKh_MjsI0',0,NULL,NULL,38),(1683,74,'DiUKh_MjsI0',0,NULL,NULL,38),(1684,75,'DiUKh_MjsI0',0,NULL,NULL,38),(1685,76,'DiUKh_MjsI0',0,NULL,NULL,38),(1686,77,'DiUKh_MjsI0',0,NULL,NULL,38),(1687,78,'DiUKh_MjsI0',0,NULL,NULL,38),(1688,79,'DiUKh_MjsI0',0,NULL,NULL,38),(1689,80,'DiUKh_MjsI0',0,NULL,NULL,38),(1690,81,'DiUKh_MjsI0',0,NULL,NULL,38),(1691,82,'DiUKh_MjsI0',0,NULL,NULL,38),(1692,83,'DiUKh_MjsI0',0,NULL,NULL,38),(1693,84,'DiUKh_MjsI0',0,NULL,NULL,38),(1694,85,'DiUKh_MjsI0',0,NULL,NULL,38),(1695,86,'DiUKh_MjsI0',0,NULL,NULL,38),(1696,87,'DiUKh_MjsI0',0,NULL,NULL,38),(1697,88,'DiUKh_MjsI0',0,NULL,NULL,38),(1698,89,'DiUKh_MjsI0',0,NULL,NULL,38),(1699,90,'DiUKh_MjsI0',0,NULL,NULL,38),(1700,91,'DiUKh_MjsI0',0,NULL,NULL,38),(1701,92,'DiUKh_MjsI0',0,NULL,NULL,38),(1702,93,'DiUKh_MjsI0',0,NULL,NULL,38),(1703,94,'DiUKh_MjsI0',0,NULL,NULL,38),(1704,95,'DiUKh_MjsI0',0,NULL,NULL,38),(1705,96,'DiUKh_MjsI0',0,NULL,NULL,38),(1706,97,'DiUKh_MjsI0',0,NULL,NULL,38),(1707,98,'DiUKh_MjsI0',0,NULL,NULL,38),(1708,99,'DiUKh_MjsI0',0,NULL,NULL,38),(1709,100,'DiUKh_MjsI0',0,NULL,NULL,38),(1710,101,'DiUKh_MjsI0',0,NULL,NULL,38),(1711,102,'DiUKh_MjsI0',0,NULL,NULL,38),(1712,103,'DiUKh_MjsI0',0,NULL,NULL,38),(1713,104,'DiUKh_MjsI0',0,NULL,NULL,38),(1714,105,'DiUKh_MjsI0',0,NULL,NULL,38),(1715,106,'DiUKh_MjsI0',0,NULL,NULL,38),(1716,107,'DiUKh_MjsI0',0,NULL,NULL,38),(1717,108,'DiUKh_MjsI0',0,NULL,NULL,38),(1718,109,'DiUKh_MjsI0',0,NULL,NULL,38),(1719,110,'DiUKh_MjsI0',0,NULL,NULL,38),(1720,111,'DiUKh_MjsI0',0,NULL,NULL,38),(1721,112,'DiUKh_MjsI0',0,NULL,NULL,38),(1722,113,'DiUKh_MjsI0',0,NULL,NULL,38),(1723,114,'DiUKh_MjsI0',0,NULL,NULL,38),(1724,115,'DiUKh_MjsI0',0,NULL,NULL,38),(1725,116,'DiUKh_MjsI0',0,NULL,NULL,38),(1726,117,'DiUKh_MjsI0',0,NULL,NULL,38),(1727,118,'DiUKh_MjsI0',0,NULL,NULL,38),(1728,119,'DiUKh_MjsI0',0,NULL,NULL,38),(1729,120,'DiUKh_MjsI0',0,NULL,NULL,38),(1730,121,'DiUKh_MjsI0',0,NULL,NULL,38),(1731,122,'DiUKh_MjsI0',0,NULL,NULL,38),(1732,123,'DiUKh_MjsI0',0,NULL,NULL,38),(1733,124,'DiUKh_MjsI0',0,NULL,NULL,38),(1734,125,'DiUKh_MjsI0',0,NULL,NULL,38),(1735,126,'DiUKh_MjsI0',0,NULL,NULL,38),(1736,127,'DiUKh_MjsI0',0,NULL,NULL,38),(1737,128,'DiUKh_MjsI0',0,NULL,NULL,38),(1738,129,'DiUKh_MjsI0',0,NULL,NULL,38),(1739,130,'DiUKh_MjsI0',0,NULL,NULL,38),(1740,131,'DiUKh_MjsI0',0,NULL,NULL,38),(1741,132,'DiUKh_MjsI0',0,NULL,NULL,38),(1742,133,'DiUKh_MjsI0',0,NULL,NULL,38),(1743,134,'DiUKh_MjsI0',0,NULL,NULL,38),(1744,135,'DiUKh_MjsI0',0,NULL,NULL,38),(1745,136,'DiUKh_MjsI0',0,NULL,NULL,38),(1746,137,'DiUKh_MjsI0',0,NULL,NULL,38),(1747,138,'DiUKh_MjsI0',0,NULL,NULL,38),(1748,139,'DiUKh_MjsI0',0,NULL,NULL,38),(1749,140,'DiUKh_MjsI0',0,NULL,NULL,38),(1750,141,'DiUKh_MjsI0',0,NULL,NULL,38),(1751,142,'DiUKh_MjsI0',0,NULL,NULL,38),(1752,143,'DiUKh_MjsI0',0,NULL,NULL,38),(1753,144,'DiUKh_MjsI0',0,NULL,NULL,38),(1754,145,'DiUKh_MjsI0',0,NULL,NULL,38),(1755,146,'DiUKh_MjsI0',0,NULL,NULL,38),(1756,147,'DiUKh_MjsI0',0,NULL,NULL,38),(1757,148,'DiUKh_MjsI0',0,NULL,NULL,38),(1758,149,'DiUKh_MjsI0',0,NULL,NULL,38),(1759,150,'DiUKh_MjsI0',0,NULL,NULL,38),(1760,151,'DiUKh_MjsI0',0,NULL,NULL,38),(1761,152,'DiUKh_MjsI0',0,NULL,NULL,38),(1762,153,'DiUKh_MjsI0',0,NULL,NULL,38),(1763,154,'DiUKh_MjsI0',0,NULL,NULL,38),(1764,155,'DiUKh_MjsI0',0,NULL,NULL,38),(1765,156,'DiUKh_MjsI0',0,NULL,NULL,38),(1766,157,'DiUKh_MjsI0',0,NULL,NULL,38),(1767,158,'DiUKh_MjsI0',0,NULL,NULL,38),(1768,159,'DiUKh_MjsI0',0,NULL,NULL,38),(1769,160,'DiUKh_MjsI0',0,NULL,NULL,38),(1770,161,'DiUKh_MjsI0',0,NULL,NULL,38),(1771,162,'DiUKh_MjsI0',0,NULL,NULL,38),(1772,163,'DiUKh_MjsI0',0,NULL,NULL,38),(1773,164,'DiUKh_MjsI0',0,NULL,NULL,38),(1774,165,'DiUKh_MjsI0',0,NULL,NULL,38),(1775,166,'DiUKh_MjsI0',0,NULL,NULL,38),(1776,167,'DiUKh_MjsI0',0,NULL,NULL,38),(1777,168,'DiUKh_MjsI0',0,NULL,NULL,38),(1778,169,'DiUKh_MjsI0',0,NULL,NULL,38),(1779,170,'DiUKh_MjsI0',0,NULL,NULL,38),(1780,171,'DiUKh_MjsI0',0,NULL,NULL,38),(1781,172,'DiUKh_MjsI0',0,NULL,NULL,38),(1782,173,'DiUKh_MjsI0',0,NULL,NULL,38),(1783,174,'DiUKh_MjsI0',0,NULL,NULL,38),(1784,175,'DiUKh_MjsI0',0,NULL,NULL,38),(1785,176,'DiUKh_MjsI0',0,NULL,NULL,38),(1786,177,'DiUKh_MjsI0',0,NULL,NULL,38),(1787,178,'DiUKh_MjsI0',0,NULL,NULL,38),(1788,179,'DiUKh_MjsI0',0,NULL,NULL,38),(1789,180,'DiUKh_MjsI0',0,NULL,NULL,38),(1790,181,'DiUKh_MjsI0',0,NULL,NULL,38),(1791,182,'DiUKh_MjsI0',0,NULL,NULL,38),(1792,183,'DiUKh_MjsI0',0,NULL,NULL,38),(1793,184,'DiUKh_MjsI0',0,NULL,NULL,38),(1794,185,'DiUKh_MjsI0',0,NULL,NULL,38),(1795,186,'DiUKh_MjsI0',0,NULL,NULL,38),(1796,187,'DiUKh_MjsI0',0,NULL,NULL,38),(1797,188,'DiUKh_MjsI0',0,NULL,NULL,38),(1798,189,'DiUKh_MjsI0',0,NULL,NULL,38),(1799,190,'DiUKh_MjsI0',0,NULL,NULL,38),(1800,191,'DiUKh_MjsI0',0,NULL,NULL,38),(1801,192,'DiUKh_MjsI0',0,NULL,NULL,38),(1802,193,'DiUKh_MjsI0',0,NULL,NULL,38),(1803,194,'DiUKh_MjsI0',0,NULL,NULL,38),(1804,195,'DiUKh_MjsI0',0,NULL,NULL,38),(1805,196,'DiUKh_MjsI0',0,NULL,NULL,38),(1806,197,'DiUKh_MjsI0',0,NULL,NULL,38),(1807,198,'DiUKh_MjsI0',0,NULL,NULL,38),(1808,199,'DiUKh_MjsI0',0,NULL,NULL,38),(1809,200,'DiUKh_MjsI0',0,NULL,NULL,38),(1810,201,'DiUKh_MjsI0',0,NULL,NULL,38),(1811,202,'DiUKh_MjsI0',0,NULL,NULL,38),(1812,203,'DiUKh_MjsI0',0,NULL,NULL,38),(1813,204,'DiUKh_MjsI0',0,NULL,NULL,38),(1814,205,'DiUKh_MjsI0',0,NULL,NULL,38),(1815,206,'DiUKh_MjsI0',0,NULL,NULL,38),(1816,207,'DiUKh_MjsI0',0,NULL,NULL,38),(1817,208,'DiUKh_MjsI0',0,NULL,NULL,38),(1818,209,'DiUKh_MjsI0',0,NULL,NULL,38),(1819,210,'DiUKh_MjsI0',0,NULL,NULL,38),(1820,211,'DiUKh_MjsI0',0,NULL,NULL,38),(1821,212,'DiUKh_MjsI0',0,NULL,NULL,38),(1822,213,'DiUKh_MjsI0',0,NULL,NULL,38),(1823,214,'DiUKh_MjsI0',0,NULL,NULL,38),(1824,215,'DiUKh_MjsI0',0,NULL,NULL,38),(1825,216,'DiUKh_MjsI0',0,NULL,NULL,38),(1826,217,'DiUKh_MjsI0',0,NULL,NULL,38),(1827,218,'DiUKh_MjsI0',0,NULL,NULL,38),(1828,219,'DiUKh_MjsI0',0,NULL,NULL,38),(1829,220,'DiUKh_MjsI0',0,NULL,NULL,38),(1830,221,'DiUKh_MjsI0',0,NULL,NULL,38),(1831,222,'DiUKh_MjsI0',0,NULL,NULL,38),(1832,223,'DiUKh_MjsI0',0,NULL,NULL,38),(1833,224,'DiUKh_MjsI0',0,NULL,NULL,38),(1834,225,'DiUKh_MjsI0',0,NULL,NULL,38),(1835,226,'DiUKh_MjsI0',0,NULL,NULL,38),(1836,227,'DiUKh_MjsI0',0,NULL,NULL,38),(1837,228,'DiUKh_MjsI0',0,NULL,NULL,38),(1838,229,'DiUKh_MjsI0',0,NULL,NULL,38),(1839,230,'DiUKh_MjsI0',0,NULL,NULL,38),(1840,231,'DiUKh_MjsI0',0,NULL,NULL,38),(1841,232,'DiUKh_MjsI0',0,NULL,NULL,38),(1842,233,'DiUKh_MjsI0',0,NULL,NULL,38),(1843,234,'DiUKh_MjsI0',0,NULL,NULL,38),(1844,235,'DiUKh_MjsI0',0,NULL,NULL,38),(1845,236,'DiUKh_MjsI0',0,NULL,NULL,38),(1846,237,'DiUKh_MjsI0',0,NULL,NULL,38),(1847,238,'DiUKh_MjsI0',0,NULL,NULL,38),(1848,239,'DiUKh_MjsI0',0,NULL,NULL,38),(1849,240,'DiUKh_MjsI0',0,NULL,NULL,38),(1850,241,'DiUKh_MjsI0',0,NULL,NULL,38),(1851,242,'DiUKh_MjsI0',0,NULL,NULL,38),(1852,243,'DiUKh_MjsI0',0,NULL,NULL,38),(1853,244,'DiUKh_MjsI0',0,NULL,NULL,38),(1854,245,'DiUKh_MjsI0',0,NULL,NULL,38),(1855,246,'DiUKh_MjsI0',0,NULL,NULL,38),(1856,247,'DiUKh_MjsI0',0,NULL,NULL,38),(1857,248,'DiUKh_MjsI0',0,NULL,NULL,38),(1858,249,'DiUKh_MjsI0',0,NULL,NULL,38),(1859,250,'DiUKh_MjsI0',0,NULL,NULL,38),(1860,251,'DiUKh_MjsI0',0,NULL,NULL,38),(1861,252,'DiUKh_MjsI0',0,NULL,NULL,38),(1862,253,'DiUKh_MjsI0',0,NULL,NULL,38),(1863,254,'DiUKh_MjsI0',0,NULL,NULL,38),(1864,255,'DiUKh_MjsI0',0,NULL,NULL,38),(1865,256,'DiUKh_MjsI0',0,NULL,NULL,38),(1866,257,'DiUKh_MjsI0',0,NULL,NULL,38),(1867,258,'DiUKh_MjsI0',0,NULL,NULL,38),(1868,259,'DiUKh_MjsI0',0,NULL,NULL,38),(1869,260,'DiUKh_MjsI0',0,NULL,NULL,38),(1870,261,'DiUKh_MjsI0',0,NULL,NULL,38),(1871,262,'DiUKh_MjsI0',0,NULL,NULL,38),(1872,263,'DiUKh_MjsI0',0,NULL,NULL,38),(1873,264,'DiUKh_MjsI0',0,NULL,NULL,38),(1874,265,'DiUKh_MjsI0',0,NULL,NULL,38),(1875,266,'DiUKh_MjsI0',0,NULL,NULL,38),(1876,267,'DiUKh_MjsI0',0,NULL,NULL,38),(1877,268,'DiUKh_MjsI0',0,NULL,NULL,38),(1878,269,'DiUKh_MjsI0',0,NULL,NULL,38),(1879,270,'DiUKh_MjsI0',0,NULL,NULL,38),(1880,271,'DiUKh_MjsI0',0,NULL,NULL,38),(1881,272,'DiUKh_MjsI0',0,NULL,NULL,38),(1882,273,'DiUKh_MjsI0',0,NULL,NULL,38),(1883,274,'DiUKh_MjsI0',0,NULL,NULL,38),(1884,275,'DiUKh_MjsI0',0,NULL,NULL,38),(1885,276,'DiUKh_MjsI0',0,NULL,NULL,38),(1886,277,'DiUKh_MjsI0',0,NULL,NULL,38),(1887,278,'DiUKh_MjsI0',0,NULL,NULL,38),(1888,279,'DiUKh_MjsI0',0,NULL,NULL,38),(1889,280,'DiUKh_MjsI0',0,NULL,NULL,38),(1890,281,'DiUKh_MjsI0',0,NULL,NULL,38),(1891,282,'DiUKh_MjsI0',0,NULL,NULL,38),(1892,283,'DiUKh_MjsI0',0,NULL,NULL,38),(1893,284,'DiUKh_MjsI0',0,NULL,NULL,38),(1894,285,'DiUKh_MjsI0',0,NULL,NULL,38),(1895,286,'DiUKh_MjsI0',0,NULL,NULL,38),(1896,287,'DiUKh_MjsI0',0,NULL,NULL,38),(1897,288,'DiUKh_MjsI0',0,NULL,NULL,38),(1898,289,'DiUKh_MjsI0',0,NULL,NULL,38),(1899,290,'DiUKh_MjsI0',0,NULL,NULL,38),(1900,291,'DiUKh_MjsI0',0,NULL,NULL,38),(1901,292,'DiUKh_MjsI0',0,NULL,NULL,38),(1902,293,'DiUKh_MjsI0',0,NULL,NULL,38),(1903,294,'DiUKh_MjsI0',0,NULL,NULL,38),(1904,295,'DiUKh_MjsI0',0,NULL,NULL,38),(1905,296,'DiUKh_MjsI0',0,NULL,NULL,38),(1906,297,'DiUKh_MjsI0',0,NULL,NULL,38),(1907,298,'DiUKh_MjsI0',0,NULL,NULL,38),(1908,299,'DiUKh_MjsI0',0,NULL,NULL,38),(1909,300,'DiUKh_MjsI0',0,NULL,NULL,38),(1910,301,'DiUKh_MjsI0',0,NULL,NULL,38),(1911,302,'DiUKh_MjsI0',0,NULL,NULL,38),(1912,303,'DiUKh_MjsI0',0,NULL,NULL,38),(1913,304,'DiUKh_MjsI0',0,NULL,NULL,38),(1914,305,'DiUKh_MjsI0',0,NULL,NULL,38),(1915,306,'DiUKh_MjsI0',0,NULL,NULL,38),(1916,307,'DiUKh_MjsI0',0,NULL,NULL,38),(1917,308,'DiUKh_MjsI0',0,NULL,NULL,38),(1918,309,'DiUKh_MjsI0',0,NULL,NULL,38),(1919,310,'DiUKh_MjsI0',0,NULL,NULL,38),(1920,311,'DiUKh_MjsI0',0,NULL,NULL,38),(1921,312,'DiUKh_MjsI0',0,NULL,NULL,38),(1922,313,'DiUKh_MjsI0',0,NULL,NULL,38),(1923,314,'DiUKh_MjsI0',0,NULL,NULL,38),(1924,315,'DiUKh_MjsI0',0,NULL,NULL,38),(1925,316,'DiUKh_MjsI0',0,NULL,NULL,38),(1926,317,'DiUKh_MjsI0',0,NULL,NULL,38),(1927,318,'DiUKh_MjsI0',0,NULL,NULL,38),(1928,319,'DiUKh_MjsI0',0,NULL,NULL,38),(1929,320,'DiUKh_MjsI0',0,NULL,NULL,38),(1930,321,'DiUKh_MjsI0',0,NULL,NULL,38),(1931,322,'DiUKh_MjsI0',0,NULL,NULL,38),(1932,323,'DiUKh_MjsI0',0,NULL,NULL,38),(1933,324,'DiUKh_MjsI0',0,NULL,NULL,38),(1934,325,'DiUKh_MjsI0',0,NULL,NULL,38),(1935,326,'DiUKh_MjsI0',0,NULL,NULL,38),(1936,327,'DiUKh_MjsI0',0,NULL,NULL,38),(1937,328,'DiUKh_MjsI0',0,NULL,NULL,38),(1938,329,'DiUKh_MjsI0',0,NULL,NULL,38),(1939,330,'DiUKh_MjsI0',0,NULL,NULL,38),(1940,331,'DiUKh_MjsI0',0,NULL,NULL,38),(1941,332,'DiUKh_MjsI0',0,NULL,NULL,38),(1942,333,'DiUKh_MjsI0',0,NULL,NULL,38),(1943,334,'DiUKh_MjsI0',0,NULL,NULL,38),(1944,335,'DiUKh_MjsI0',0,NULL,NULL,38),(1945,336,'DiUKh_MjsI0',0,NULL,NULL,38),(1946,337,'DiUKh_MjsI0',0,NULL,NULL,38),(1947,338,'DiUKh_MjsI0',0,NULL,NULL,38),(1948,339,'DiUKh_MjsI0',0,NULL,NULL,38),(1949,340,'DiUKh_MjsI0',0,NULL,NULL,38),(1950,341,'DiUKh_MjsI0',0,NULL,NULL,38),(1951,342,'DiUKh_MjsI0',0,NULL,NULL,38),(1952,343,'DiUKh_MjsI0',0,NULL,NULL,38),(1953,344,'DiUKh_MjsI0',0,NULL,NULL,38),(1954,345,'DiUKh_MjsI0',0,NULL,NULL,38),(1955,346,'DiUKh_MjsI0',0,NULL,NULL,38),(1956,347,'DiUKh_MjsI0',0,NULL,NULL,38),(1957,348,'DiUKh_MjsI0',0,NULL,NULL,38),(1958,349,'DiUKh_MjsI0',0,NULL,NULL,38),(1959,350,'DiUKh_MjsI0',0,NULL,NULL,38),(1960,351,'DiUKh_MjsI0',0,NULL,NULL,38),(1961,352,'DiUKh_MjsI0',0,NULL,NULL,38),(1962,353,'DiUKh_MjsI0',0,NULL,NULL,38),(1963,354,'DiUKh_MjsI0',0,NULL,NULL,38),(1964,355,'DiUKh_MjsI0',0,NULL,NULL,38),(1965,356,'DiUKh_MjsI0',0,NULL,NULL,38),(1966,357,'DiUKh_MjsI0',0,NULL,NULL,38),(1967,358,'DiUKh_MjsI0',0,NULL,NULL,38),(1968,359,'DiUKh_MjsI0',0,NULL,NULL,38),(1969,360,'DiUKh_MjsI0',0,NULL,NULL,38),(1970,361,'DiUKh_MjsI0',0,NULL,NULL,38),(1971,362,'DiUKh_MjsI0',0,NULL,NULL,38),(1972,363,'DiUKh_MjsI0',0,NULL,NULL,38),(1973,364,'DiUKh_MjsI0',0,NULL,NULL,38),(1974,365,'DiUKh_MjsI0',0,NULL,NULL,38),(1975,366,'DiUKh_MjsI0',0,NULL,NULL,38),(1976,367,'DiUKh_MjsI0',0,NULL,NULL,38),(1977,368,'DiUKh_MjsI0',0,NULL,NULL,38),(1978,369,'DiUKh_MjsI0',0,NULL,NULL,38),(1979,370,'DiUKh_MjsI0',0,NULL,NULL,38),(1980,371,'DiUKh_MjsI0',0,NULL,NULL,38),(1981,372,'DiUKh_MjsI0',0,NULL,NULL,38),(1982,373,'DiUKh_MjsI0',0,NULL,NULL,38),(1983,374,'DiUKh_MjsI0',0,NULL,NULL,38),(1984,375,'DiUKh_MjsI0',0,NULL,NULL,38),(1985,376,'DiUKh_MjsI0',0,NULL,NULL,38),(1986,377,'DiUKh_MjsI0',0,NULL,NULL,38),(1987,378,'DiUKh_MjsI0',0,NULL,NULL,38),(1988,379,'DiUKh_MjsI0',0,NULL,NULL,38),(1989,380,'DiUKh_MjsI0',0,NULL,NULL,38),(1990,381,'DiUKh_MjsI0',0,NULL,NULL,38),(1991,382,'DiUKh_MjsI0',0,NULL,NULL,38),(1992,383,'DiUKh_MjsI0',0,NULL,NULL,38),(1993,384,'DiUKh_MjsI0',0,NULL,NULL,38),(1994,385,'DiUKh_MjsI0',0,NULL,NULL,38),(1995,386,'DiUKh_MjsI0',0,NULL,NULL,38),(1996,387,'DiUKh_MjsI0',0,NULL,NULL,38),(1997,388,'DiUKh_MjsI0',0,NULL,NULL,38),(1998,389,'DiUKh_MjsI0',0,NULL,NULL,38),(1999,390,'DiUKh_MjsI0',0,NULL,NULL,38),(2000,391,'DiUKh_MjsI0',0,NULL,NULL,38),(2001,392,'DiUKh_MjsI0',0,NULL,NULL,38),(2002,393,'DiUKh_MjsI0',0,NULL,NULL,38),(2003,394,'DiUKh_MjsI0',0,NULL,NULL,38),(2004,395,'DiUKh_MjsI0',0,NULL,NULL,38),(2005,396,'DiUKh_MjsI0',0,NULL,NULL,38),(2006,397,'DiUKh_MjsI0',0,NULL,NULL,38),(2007,398,'DiUKh_MjsI0',0,NULL,NULL,38),(2008,399,'DiUKh_MjsI0',0,NULL,NULL,38),(2009,400,'DiUKh_MjsI0',0,NULL,NULL,38),(2010,401,'DiUKh_MjsI0',0,NULL,NULL,38),(2011,402,'DiUKh_MjsI0',0,NULL,NULL,38),(2012,403,'DiUKh_MjsI0',0,NULL,NULL,38),(2013,404,'DiUKh_MjsI0',0,NULL,NULL,38),(2014,405,'DiUKh_MjsI0',0,NULL,NULL,38),(2015,406,'DiUKh_MjsI0',0,NULL,NULL,38),(2016,407,'DiUKh_MjsI0',0,NULL,NULL,38),(2017,408,'DiUKh_MjsI0',0,NULL,NULL,38),(2018,409,'DiUKh_MjsI0',0,NULL,NULL,38),(2019,410,'DiUKh_MjsI0',0,NULL,NULL,38),(2020,411,'DiUKh_MjsI0',0,NULL,NULL,38),(2021,412,'DiUKh_MjsI0',0,NULL,NULL,38),(2022,413,'DiUKh_MjsI0',0,NULL,NULL,38),(2023,414,'DiUKh_MjsI0',0,NULL,NULL,38),(2024,415,'DiUKh_MjsI0',0,NULL,NULL,38),(2025,416,'DiUKh_MjsI0',0,NULL,NULL,38),(2026,417,'DiUKh_MjsI0',0,NULL,NULL,38),(2027,418,'DiUKh_MjsI0',0,NULL,NULL,38),(2028,419,'DiUKh_MjsI0',0,NULL,NULL,38),(2029,420,'DiUKh_MjsI0',0,NULL,NULL,38),(2030,421,'DiUKh_MjsI0',0,NULL,NULL,38),(2031,422,'DiUKh_MjsI0',0,NULL,NULL,38),(2032,423,'DiUKh_MjsI0',0,NULL,NULL,38),(2033,424,'DiUKh_MjsI0',0,NULL,NULL,38),(2034,425,'DiUKh_MjsI0',0,NULL,NULL,38),(2035,426,'DiUKh_MjsI0',0,NULL,NULL,38),(2036,427,'DiUKh_MjsI0',0,NULL,NULL,38),(2037,428,'DiUKh_MjsI0',0,NULL,NULL,38),(2038,429,'DiUKh_MjsI0',0,NULL,NULL,38),(2039,430,'DiUKh_MjsI0',0,NULL,NULL,38),(2040,431,'DiUKh_MjsI0',0,NULL,NULL,38),(2041,432,'DiUKh_MjsI0',0,NULL,NULL,38),(2042,433,'DiUKh_MjsI0',0,NULL,NULL,38),(2043,434,'DiUKh_MjsI0',0,NULL,NULL,38),(2044,435,'DiUKh_MjsI0',0,NULL,NULL,38),(2045,436,'DiUKh_MjsI0',0,NULL,NULL,38),(2046,437,'DiUKh_MjsI0',0,NULL,NULL,38),(2047,438,'DiUKh_MjsI0',0,NULL,NULL,38),(2048,439,'DiUKh_MjsI0',0,NULL,NULL,38),(2049,440,'DiUKh_MjsI0',0,NULL,NULL,38),(2050,441,'DiUKh_MjsI0',0,NULL,NULL,38),(2051,442,'DiUKh_MjsI0',0,NULL,NULL,38),(2052,443,'DiUKh_MjsI0',0,NULL,NULL,38),(2053,444,'DiUKh_MjsI0',0,NULL,NULL,38),(2054,445,'DiUKh_MjsI0',0,NULL,NULL,38),(2055,446,'DiUKh_MjsI0',0,NULL,NULL,38),(2056,447,'DiUKh_MjsI0',0,NULL,NULL,38),(2057,448,'DiUKh_MjsI0',0,NULL,NULL,38),(2058,449,'DiUKh_MjsI0',0,NULL,NULL,38),(2059,450,'DiUKh_MjsI0',0,NULL,NULL,38),(2060,451,'DiUKh_MjsI0',0,NULL,NULL,38),(2061,452,'DiUKh_MjsI0',0,NULL,NULL,38),(2062,453,'DiUKh_MjsI0',0,NULL,NULL,38),(2063,454,'DiUKh_MjsI0',0,NULL,NULL,38),(2064,455,'DiUKh_MjsI0',0,NULL,NULL,38),(2065,456,'DiUKh_MjsI0',0,NULL,NULL,38),(2066,457,'DiUKh_MjsI0',0,NULL,NULL,38),(2067,458,'DiUKh_MjsI0',0,NULL,NULL,38),(2068,459,'DiUKh_MjsI0',0,NULL,NULL,38),(2069,460,'DiUKh_MjsI0',0,NULL,NULL,38),(2070,461,'DiUKh_MjsI0',0,NULL,NULL,38),(2071,462,'DiUKh_MjsI0',0,NULL,NULL,38),(2072,463,'DiUKh_MjsI0',0,NULL,NULL,38),(2073,464,'DiUKh_MjsI0',0,NULL,NULL,38),(2074,465,'DiUKh_MjsI0',0,NULL,NULL,38),(2075,466,'DiUKh_MjsI0',0,NULL,NULL,38),(2076,467,'DiUKh_MjsI0',0,NULL,NULL,38),(2077,468,'DiUKh_MjsI0',0,NULL,NULL,38),(2078,469,'DiUKh_MjsI0',0,NULL,NULL,38),(2079,470,'DiUKh_MjsI0',0,NULL,NULL,38),(2080,471,'DiUKh_MjsI0',0,NULL,NULL,38),(2081,472,'DiUKh_MjsI0',0,NULL,NULL,38),(2082,473,'DiUKh_MjsI0',0,NULL,NULL,38),(2083,474,'DiUKh_MjsI0',0,NULL,NULL,38),(2084,475,'DiUKh_MjsI0',0,NULL,NULL,38),(2085,476,'DiUKh_MjsI0',0,NULL,NULL,38),(2086,477,'DiUKh_MjsI0',0,NULL,NULL,38),(2087,478,'DiUKh_MjsI0',0,NULL,NULL,38),(2088,479,'DiUKh_MjsI0',0,NULL,NULL,38),(2089,480,'DiUKh_MjsI0',0,NULL,NULL,38),(2090,481,'DiUKh_MjsI0',0,NULL,NULL,38),(2091,482,'DiUKh_MjsI0',0,NULL,NULL,38),(2092,483,'DiUKh_MjsI0',0,NULL,NULL,38),(2093,484,'DiUKh_MjsI0',0,NULL,NULL,38),(2094,485,'DiUKh_MjsI0',0,NULL,NULL,38),(2095,486,'DiUKh_MjsI0',0,NULL,NULL,38),(2096,487,'DiUKh_MjsI0',0,NULL,NULL,38),(2097,488,'DiUKh_MjsI0',0,NULL,NULL,38),(2098,489,'DiUKh_MjsI0',0,NULL,NULL,38),(2099,490,'DiUKh_MjsI0',0,NULL,NULL,38),(2100,491,'DiUKh_MjsI0',0,NULL,NULL,38),(2101,492,'DiUKh_MjsI0',0,NULL,NULL,38),(2102,493,'DiUKh_MjsI0',0,NULL,NULL,38),(2103,494,'DiUKh_MjsI0',0,NULL,NULL,38),(2104,495,'DiUKh_MjsI0',0,NULL,NULL,38),(2105,496,'DiUKh_MjsI0',0,NULL,NULL,38),(2106,497,'DiUKh_MjsI0',0,NULL,NULL,38),(2107,498,'DiUKh_MjsI0',0,NULL,NULL,38),(2108,499,'DiUKh_MjsI0',0,NULL,NULL,38),(2109,500,'DiUKh_MjsI0',0,NULL,NULL,38),(2110,1,'DiUKh_MjsI0',0,NULL,NULL,39),(2111,1,'DiUKh_MjsI0',0,NULL,NULL,40),(2112,1,'DiUKh_MjsI0',0,NULL,NULL,41);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_images`
--

LOCK TABLES `tv_images` WRITE;
/*!40000 ALTER TABLE `tv_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_season`
--

DROP TABLE IF EXISTS `tv_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tv_season` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `movie_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_tv_season` (`movie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season`
--

LOCK TABLES `tv_season` WRITE;
/*!40000 ALTER TABLE `tv_season` DISABLE KEYS */;
INSERT INTO `tv_season` VALUES (1,'a',5),(6,'b',NULL),(9,'a',8),(10,'b',8),(11,'c',8);
/*!40000 ALTER TABLE `tv_season` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_season_subtitle`
--

LOCK TABLES `tv_season_subtitle` WRITE;
/*!40000 ALTER TABLE `tv_season_subtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv_season_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvseasonentity_photos`
--

DROP TABLE IF EXISTS `tvseasonentity_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tvseasonentity_photos` (
  `TVSeasonEntity_id` bigint(20) NOT NULL,
  `photos` varchar(255) DEFAULT NULL,
  KEY `FK4gk3gh4xpcw0tsxpedr7jfomc` (`TVSeasonEntity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvseasonentity_photos`
--

LOCK TABLES `tvseasonentity_photos` WRITE;
/*!40000 ALTER TABLE `tvseasonentity_photos` DISABLE KEYS */;
INSERT INTO `tvseasonentity_photos` VALUES (1,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-j3rhAsUWuC.jpg'),(2,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-fvzAN9GD0c.png'),(3,'http://cdn.animevietsub.cc/data/big_banner/2020/08/19/animevsub-zq1sTYlOFq.jpg'),(4,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-aoqCQ9LbZg.jpg'),(5,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-uS2Wd8Qe2T.jpg'),(6,'http://cdn.animevietsub.cc/data/big_banner/2017/08/08/animevsub-big_banner-8604.jpg'),(7,'http://cdn.animevietsub.cc/data/big_banner/2019/08/24/animevsub-fJ3ZpZrD2k.jpg'),(8,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-5n2gIRIwUg.jpg'),(9,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-Ijj6eJbxrQ.jpg'),(10,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-KTP0v9BGuN.png'),(11,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-2t51ToC1AS.jpg'),(12,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-i9Gg7MXPWZ.jpg'),(13,'http://cdn.animevietsub.cc/data/banner/2022/07/31/animevsub-NxQxhIAgug.png'),(14,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-hd1GzgXQis.jpg'),(15,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-CKdpkSmWBC.jpg'),(16,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-fPqnxDhEP7.png'),(17,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-0tbARj08aK.png'),(18,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-IZuTxzGuVo.jpg'),(19,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-BlpWmN7JkN.png'),(20,'http://cdn.animevietsub.cc/data/big_banner/2022/03/04/animevsub-r81ojZwafF.jpg'),(21,'http://cdn.animevietsub.cc/data/big_banner/2017/08/08/animevsub-big_banner-1533.jpg'),(22,'http://cdn.animevietsub.cc/data/big_banner/2017/08/08/animevsub-big_banner-1957.jpg'),(23,'http://cdn.animevietsub.cc/data/big_banner/2018/08/28/animevsub-ZrvjmAV7cF.jpg'),(24,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-LL40ufJ9dM.jpg'),(25,'http://cdn.animevietsub.cc/data/big_banner/2017/08/05/animevsub-big_banner-9119.jpg'),(26,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-W48THvGfBU.jpg'),(27,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-8D7nUwWlUA.jpg'),(28,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-2GW3ia4.png'),(29,'http://cdn.animevietsub.cc/data/big_banner/2017/09/17/animevsub-iZnGrEMqHA.jpg'),(30,'http://cdn.animevietsub.cc/data/big_banner/2017/09/08/animevsub-WXrgoql.png'),(31,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-e68Gmz2.jpg'),(32,'http://cdn.animevietsub.cc/data/big_banner/2017/09/08/animevsub-hX9ROIF.jpg'),(33,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-tLLAGbI.jpg'),(34,'http://cdn.animevietsub.cc/data/big_banner/2017/09/08/animevsub-FNEQRj2.png'),(35,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-Q8i83vO.jpg'),(36,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-OiwWAW9.jpg'),(37,'http://cdn.animevietsub.cc/data/big_banner/2018/05/05/animevsub-xmnn0oz6i0.jpg'),(38,'http://cdn.animevietsub.cc/data/big_banner/2017/08/03/animevsub-big_banner-9184.jpg'),(39,'http://cdn.animevietsub.cc/data/big_banner/2017/09/08/animevsub-LeASg1X.jpg'),(40,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-sL4dF02.jpg'),(41,'http://cdn.animevietsub.cc/data/big_banner/2017/09/07/animevsub-PMVOmSr.jpg');
/*!40000 ALTER TABLE `tvseasonentity_photos` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,_binary '','1000:69c68bda8293e934af7ac1fccbe24866:2ed0d2fb25a26e77917320977c3319092bae1b605ac08280155f0e004af86ea1a9a1488f0c9b4b5952b79e66a750067f45f85d6098c05bae7c954ba0c5855362',_binary '','cbtongtulenh4',8);
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (8,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36u87ohwdp5l8ds63ga132ux9` (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,NULL,'','_VI_72j_ErI',3),(2,NULL,'','1gGt1Mg_zSo',4),(3,NULL,'','OAlfN-VbGJI',5),(4,NULL,'','K65OpdS3Hsk',6),(5,NULL,'','mSnLj7DYKMw',9),(6,NULL,'','P7soCjGOP14',10),(7,NULL,'','1v66USnVnPs',11),(8,NULL,'','l_98K4_6UQ0',13),(9,NULL,'','NVt5Gsy9VKU',14),(10,NULL,'','qxMA4tvKD94',15),(11,NULL,'','_shEgcWHC2U',16),(12,NULL,'','3n58UPvcD7I',18),(13,NULL,'','YAN45KAL5lg',20),(14,NULL,'','I4oOj_6kGYc',21),(15,NULL,'','wwumv_IcxJo',22),(16,NULL,'','tE6lEcnyJEE',24),(17,NULL,'','eEApDotghec',25),(18,NULL,'','Cjp08BZnl-E',26),(19,NULL,'','dJ12XeF6S2Y',28),(20,NULL,'','j2hiC9BmJlQ',29),(21,NULL,'','TDpYU8OmD-k',30),(22,NULL,'','HC7MbHH0FB0',32),(23,NULL,'','NnDVX0bc3eI',33),(24,NULL,'','vAuU88KX8EA',34),(25,NULL,'','ld-oqpvOBAk',37),(26,NULL,'','1dy2zPPrKD0',38),(27,NULL,'','tA3yE4_t6SY',39),(28,NULL,'','OkI3ZCEbx_E',40),(29,NULL,'','q4C4CZT8NTM',41);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-14 16:24:51
