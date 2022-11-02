-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: qlphongmach
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `danh_muc_thuoc`
--

DROP TABLE IF EXISTS `danh_muc_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_muc_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc_thuoc`
--

LOCK TABLES `danh_muc_thuoc` WRITE;
/*!40000 ALTER TABLE `danh_muc_thuoc` DISABLE KEYS */;
INSERT INTO `danh_muc_thuoc` VALUES (1,_binary '',NULL,'Kháng dị ứng'),(2,_binary '',NULL,'Kháng viêm'),(3,_binary '',NULL,'Da liễu'),(4,_binary '',NULL,'Giảm đau hạ sốt'),(5,_binary '',NULL,'Thuốc Ho và Long đờm'),(6,_binary '',NULL,'Nhóm dạ dày'),(7,_binary '',NULL,'Nhóm kháng h2'),(8,_binary '',NULL,' Nhóm antacid'),(9,_binary '',NULL,'Nhóm tiêu hóa');
/*!40000 ALTER TABLE `danh_muc_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu_benh_vien`
--

DROP TABLE IF EXISTS `dich_vu_benh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu_benh_vien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `ten` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu_benh_vien`
--

LOCK TABLES `dich_vu_benh_vien` WRITE;
/*!40000 ALTER TABLE `dich_vu_benh_vien` DISABLE KEYS */;
INSERT INTO `dich_vu_benh_vien` VALUES (1,_binary '',NULL,'Khám sức khoẻ tổng quát cá nhân',1800000),(2,_binary '',NULL,'Khám sức khỏe tổng quát doanh nghiệp',1500000),(3,_binary '',NULL,'Tầm soát Ung thư',1700000),(4,_binary '',NULL,'Tầm soát Tim mạch',1600000),(5,_binary '',NULL,'Tầm soát tiêu hóa gan mật',1600000),(6,_binary '',NULL,'Khám da liễu',200000),(7,_binary '',NULL,'Chụp Xquang ngực thẳng',240000),(8,_binary '',NULL,'Nội soi da dày',1250000);
/*!40000 ALTER TABLE `dich_vu_benh_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_vi_tinh`
--

DROP TABLE IF EXISTS `don_vi_tinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_vi_tinh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_vi_tinh`
--

LOCK TABLES `don_vi_tinh` WRITE;
/*!40000 ALTER TABLE `don_vi_tinh` DISABLE KEYS */;
INSERT INTO `don_vi_tinh` VALUES (1,_binary '',NULL,'viên'),(2,_binary '',NULL,'gói'),(3,_binary '',NULL,'hộp'),(4,_binary '',NULL,'vỉ');
/*!40000 ALTER TABLE `don_vi_tinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `thanh_tien` decimal(10,0) NOT NULL,
  `tinh_trang` bit(1) NOT NULL DEFAULT b'0',
  `phieu_kham_benh_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hoa_don_phieu_kham_benh_id_10bdda2a_fk_phieu_kham_benh_id` (`phieu_kham_benh_id`),
  CONSTRAINT `hoa_don_phieu_kham_benh_id_10bdda2a_fk_phieu_kham_benh_id` FOREIGN KEY (`phieu_kham_benh_id`) REFERENCES `phieu_kham_benh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` VALUES (1,'2022-06-15 12:41:42.693000',3694012,_binary '',1),(2,'2022-08-15 16:35:39.480000',3694258,_binary '\0',7),(3,'2022-08-15 16:49:22.521000',3694504,_binary '',8),(4,'2022-03-15 16:50:32.227000',1231522,_binary '',9),(5,'2022-08-15 16:51:53.338000',1231368,_binary '\0',10),(6,'2022-03-16 16:27:11.870000',492,_binary '',11),(7,'2022-08-16 16:28:17.941000',2463044,_binary '',12),(8,'2022-08-21 18:01:59.672000',4925257,_binary '',13),(9,'2022-08-27 15:31:20.568000',3694381,_binary '\0',14),(10,'2022-08-30 02:56:19.180000',1231676,_binary '\0',15),(11,'2022-08-30 02:58:24.110000',3694012,_binary '\0',16),(12,'2022-08-30 03:11:46.805000',2462767,_binary '\0',17),(13,'2022-09-08 15:16:11.647000',6661665,_binary '',18),(14,'2022-10-08 16:02:29.063000',427333,_binary '\0',19),(15,'2022-10-08 21:09:39.931000',622666,_binary '',20),(16,'2022-10-14 23:13:45.468000',621333,_binary '\0',21),(17,'2022-10-14 23:16:10.445000',933999,_binary '\0',22),(18,'2022-10-15 00:43:54.640000',738666,_binary '\0',23);
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_kham_benh`
--

DROP TABLE IF EXISTS `lich_kham_benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_kham_benh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) DEFAULT NULL,
  `xac_thuc` bit(1) NOT NULL DEFAULT b'0',
  `ngay_kham` date NOT NULL,
  `gio_kham` time NOT NULL,
  `trieu_chung` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_kham_benh_user_id_f1d1bbd0_fk_user_id` (`user_id`),
  CONSTRAINT `lich_kham_benh_user_id_f1d1bbd0_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_kham_benh`
--

LOCK TABLES `lich_kham_benh` WRITE;
/*!40000 ALTER TABLE `lich_kham_benh` DISABLE KEYS */;
INSERT INTO `lich_kham_benh` VALUES (6,NULL,_binary '','2022-09-10','00:10:00','dau lung',6),(140,NULL,_binary '','2022-09-10','10:00:00','dau bung',9),(143,NULL,_binary '','2022-09-10','16:30:00','kham tong quat',6),(144,NULL,_binary '\0','2022-09-11','17:50:00','dau bung',6),(145,NULL,_binary '\0','2022-09-11','16:50:00','kham dinh ki',6),(146,NULL,_binary '','2022-09-11','13:48:00','dau lung',6),(149,NULL,_binary '','2022-08-31','01:50:00','kham dinh ki',9),(152,NULL,_binary '','2022-09-07','15:30:00','kham dinh ki',6),(153,NULL,_binary '','2022-09-07','14:33:00','kham tong quat',6),(154,NULL,_binary '','2022-09-02','14:29:00','DG',6),(155,NULL,_binary '','2022-09-17','17:12:00','qweqe',2),(156,NULL,_binary '\0','2022-10-19','23:00:00','aa',6),(157,NULL,_binary '','2022-10-12','03:43:00','Äa',6);
/*!40000 ALTER TABLE `lich_kham_benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_kham_benh`
--

DROP TABLE IF EXISTS `phieu_kham_benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_kham_benh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngay_kham` datetime(6) NOT NULL,
  `trieu_chung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_luan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bac_si_id` int NOT NULL,
  `benh_nhan_id` int NOT NULL,
  `dich_vu_benh_vien_id` int NOT NULL,
  `toa_thuoc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phieu_kham_benh_dich_vu_benh_vien_id_17ea7e73_fk_dich_vu` (`dich_vu_benh_vien_id`),
  KEY `phieu_kham_benh_toa_thuoc_idx` (`toa_thuoc_id`),
  KEY `fk_phieu_kham_benh_benh_nhan_id_idx` (`benh_nhan_id`),
  KEY `fk_phieu_kham_benh_bac_si_id_idx` (`bac_si_id`),
  CONSTRAINT `fk_phieu_kham_benh_bac_si_id` FOREIGN KEY (`bac_si_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_phieu_kham_benh_benh_nhan_id` FOREIGN KEY (`benh_nhan_id`) REFERENCES `user` (`id`),
  CONSTRAINT `phieu_kham_benh_dich_vu_benh_vien_id_17ea7e73_fk_dich_vu` FOREIGN KEY (`dich_vu_benh_vien_id`) REFERENCES `dich_vu_benh_vien` (`id`),
  CONSTRAINT `phieu_kham_benh_toa_thuoc` FOREIGN KEY (`toa_thuoc_id`) REFERENCES `toa_thuoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_kham_benh`
--

LOCK TABLES `phieu_kham_benh` WRITE;
/*!40000 ALTER TABLE `phieu_kham_benh` DISABLE KEYS */;
INSERT INTO `phieu_kham_benh` VALUES (1,'2022-06-15 12:41:42.670000','aaaaaaaaa','sot sieu vi',3,6,2,6),(7,'2022-08-15 16:35:39.449000','k co gi','ho co dom',3,6,1,12),(8,'2022-08-15 16:49:22.493000','asd','da lieu',3,6,1,13),(9,'2022-08-15 16:50:32.226000','xong roi vu oi','hoooooo',3,2,2,14),(10,'2022-08-15 16:51:53.310000','k co gi','ngoai khoa',3,6,2,15),(11,'2022-08-16 16:27:11.867000','covi sot','am tinh covi',3,11,1,16),(12,'2022-08-16 16:28:17.920000','k co gi aaaa','covid',3,6,2,17),(13,'2022-08-21 18:01:59.666000','k co gi','aaaa',3,2,2,18),(14,'2022-08-27 15:31:20.566000','xong roi','noi khoa',3,6,2,19),(15,'2022-08-30 02:56:19.143000','','noi khoa',3,6,1,20),(16,'2022-08-30 02:58:24.109000','alo alo','ngoai khoa',3,6,3,21),(17,'2022-08-30 03:11:46.802000','k chung','dÃ¢dadadadad',3,11,1,22),(18,'2022-09-08 15:16:11.619000','aaaaaaaaa','tai mui hong',3,6,1,23),(19,'2022-10-08 16:02:29.057000','kham tong quat','da lieu',3,6,1,24),(20,'2022-10-08 21:09:39.873000','dau bung','',3,4,1,25),(21,'2022-10-14 23:13:45.431000','aaaaaaaaa','sot',3,6,1,26),(22,'2022-10-14 23:16:10.440000','kham tong quat','ho',3,6,1,27),(23,'2022-10-15 00:43:54.620000','dau mat do','',3,10,1,28);
/*!40000 ALTER TABLE `phieu_kham_benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `ten` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_luong` int NOT NULL DEFAULT '0',
  `don_gia` decimal(10,0) NOT NULL DEFAULT '0',
  `ghi_chu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `danh_muc_id` int NOT NULL,
  `don_vi_tinh_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ten` (`ten`),
  KEY `thuoc_danh_muc_id_a8a0edd6_fk_danh_muc_thuoc_id` (`danh_muc_id`),
  KEY `thuoc_don_vi_tinh_id_5c607452_fk_don_vi_tinh_id` (`don_vi_tinh_id`),
  CONSTRAINT `thuoc_danh_muc_id_a8a0edd6_fk_danh_muc_thuoc_id` FOREIGN KEY (`danh_muc_id`) REFERENCES `danh_muc_thuoc` (`id`),
  CONSTRAINT `thuoc_don_vi_tinh_id_5c607452_fk_don_vi_tinh_id` FOREIGN KEY (`don_vi_tinh_id`) REFERENCES `don_vi_tinh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (7,_binary '','2022-10-08 15:09:45.987000','Paracetamol ',46,162000,'1231',3,3),(13,_binary '','2022-10-08 15:09:45.987000','Meloxicam',100,16000,'',9,4),(14,_binary '','2022-09-26 02:45:04.822000','Celecoxib ',11,100000,'123123',1,1);
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toa_thuoc`
--

DROP TABLE IF EXISTS `toa_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toa_thuoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `tong_tien` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toa_thuoc`
--

LOCK TABLES `toa_thuoc` WRITE;
/*!40000 ALTER TABLE `toa_thuoc` DISABLE KEYS */;
INSERT INTO `toa_thuoc` VALUES (1,'2022-08-13 15:34:20.915000',615),(2,'2022-08-13 15:34:41.522000',2463044),(3,'2022-08-13 15:37:26.537000',1231522),(4,'2022-08-14 00:35:25.489000',4925534),(5,'2022-08-14 11:00:49.857000',3694012),(6,'2022-08-15 12:41:42.637000',3694012),(12,'2022-08-15 16:35:39.414000',3694258),(13,'2022-08-15 16:49:22.459000',3694504),(14,'2022-08-15 16:50:32.042000',1231522),(15,'2022-08-15 16:51:53.279000',1231368),(16,'2022-08-16 16:27:11.855000',492),(17,'2022-08-16 16:28:17.912000',2463044),(18,'2022-08-21 18:01:59.623000',4925257),(19,'2022-08-27 15:31:20.379000',3694381),(20,'2022-08-30 02:56:19.053000',1231676),(21,'2022-08-30 02:58:24.007000',3694012),(22,'2022-08-30 03:11:46.795000',2462767),(23,'2022-09-08 15:16:11.335000',6661665),(24,'2022-10-08 16:02:28.990000',427333),(25,'2022-10-08 21:09:39.818000',622666),(26,'2022-10-14 23:13:45.307000',621333),(27,'2022-10-14 23:16:10.430000',933999),(28,'2022-10-15 00:43:54.554000',738666);
/*!40000 ALTER TABLE `toa_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toa_thuoc_detail`
--

DROP TABLE IF EXISTS `toa_thuoc_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toa_thuoc_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL DEFAULT '0',
  `don_gia` decimal(10,0) NOT NULL DEFAULT '0',
  `thuoc_id` int NOT NULL,
  `toa_thuoc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toa_thuoc_detail_thuoc_id_15bf24a1_fk_thuoc_id` (`thuoc_id`),
  KEY `toa_thuoc_detail_toa_thuoc_id_a6fbb684_fk_toa_thuoc_id` (`toa_thuoc_id`),
  CONSTRAINT `toa_thuoc_detail_thuoc_id_15bf24a1_fk_thuoc_id` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`),
  CONSTRAINT `toa_thuoc_detail_toa_thuoc_id_a6fbb684_fk_toa_thuoc_id` FOREIGN KEY (`toa_thuoc_id`) REFERENCES `toa_thuoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toa_thuoc_detail`
--

LOCK TABLES `toa_thuoc_detail` WRITE;
/*!40000 ALTER TABLE `toa_thuoc_detail` DISABLE KEYS */;
INSERT INTO `toa_thuoc_detail` VALUES (1,5,123,14,1),(2,2,1231245,7,2),(3,2,154,13,2),(4,2,123,14,2),(5,1,1231245,7,3),(6,1,154,13,3),(7,1,123,14,3),(8,4,1231245,7,4),(9,2,154,13,4),(10,2,123,14,4),(11,3,1231245,7,5),(12,1,154,13,5),(13,1,123,14,5),(14,3,1231245,7,6),(15,1,154,13,6),(16,1,123,14,6),(31,3,1231245,7,12),(32,1,154,13,12),(33,3,123,14,12),(34,3,1231245,7,13),(35,1,154,13,13),(36,5,123,14,13),(37,1,1231245,7,14),(38,1,154,13,14),(39,1,123,14,14),(40,1,1231245,7,15),(41,1,123,14,15),(42,4,123,14,16),(43,2,1231245,7,17),(44,2,154,13,17),(45,2,123,14,17),(46,4,1231245,7,18),(47,1,154,13,18),(48,1,123,14,18),(49,3,1231245,7,19),(50,1,154,13,19),(51,4,123,14,19),(52,1,1231245,7,20),(53,2,154,13,20),(54,1,123,14,20),(55,3,1231245,7,21),(56,1,154,13,21),(57,1,123,14,21),(58,2,1231245,7,22),(59,1,154,13,22),(60,1,123,14,22),(61,5,100000,14,23),(64,1,16000,13,24),(65,1,100000,14,24),(68,1,162000,7,26),(69,3,16000,13,26),(70,1,100000,14,26),(73,1,16000,13,28),(74,1,100000,14,28);
/*!40000 ALTER TABLE `toa_thuoc_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioi_tinh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,_binary '','admin','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','admin','admin','nam','admin@gmail.com','123',NULL,'ROLE_ADMIN'),(3,_binary '','bacsi','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','bacsi','bacsi','nam','bacsi@gmail.com','456',NULL,'ROLE_BACSI'),(4,_binary '','yta','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','yta','yta','nam','yta@gmail.com','789',NULL,'ROLE_YTA'),(5,_binary '','user','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','user','user','nam','user@gmail.com','123','','ROLE_USER'),(6,_binary '\0','tuan','$2a$10$Yl7Z76Sis5M.3hUppW5C.uDtAePeKlsNUIV7IJYhhFHkw5T/LCO6W','NGUYEN','VAN THANH','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(7,_binary '\0','anhtuan222001','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','NGUYEN','NGO THANH HA','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(9,_binary '\0','test','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','SU','THI NGOC TRINH','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(10,_binary '\0','_thangcudthw_','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','TRAN','VAN DUNG','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(11,_binary '\0','EnAyTi','$2a$10$MlHcji9ALB0j3T5/peJBveTEY23El/64zBnJJFKaMySXjmqZFq1X6','NGUYEN','ANH THU','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(12,_binary '\0','anhvu','$2a$10$WXuUl3usm.E/F2FS1PRvAOPvy4z3SClI2p5z1.7unqQmSadsJBY3m','HUYNH','ANH VU','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER'),(14,_binary '\0','test2','$2a$10$8z82f3/dloBwdzYvFFIIKedU00gvjadL1KslRgeli1wQUQzDphJXm','NGUYEN','TUOC','nu','beobeo222001@gmail.com','0382304927','https://res.cloudinary.com/dhldfozup/image/upload/v1662622091/uvnncsqy1zf2zuv2fwvm.jpg','ROLE_USER'),(15,_binary '\0','test566','$2a$10$H/1S1zryXk46LqLsdTsdX.pNl0wJuCOuS.TUA3vbWv4QiRv8RU9zu','NGUYEN','TUOC','nam','nguyenanhtuan222001@gmail.com','0382304927','https://res.cloudinary.com/dhldfozup/image/upload/v1665220274/nyneb5lopmv7crvd2rw8.jpg','ROLE_USER'),(16,_binary '\0','asdasd','$2a$10$9/9.zsWX6NDREkN.2osQ7ecKo4zGPvQrTaLkj4uWriNSg.OaiMB1a','NGUYEN','TUOC','nu','nguyenanhtuan222001@gmail.com','0382304927','https://res.cloudinary.com/dhldfozup/image/upload/v1665245498/jdcihzg5hbqce912x9qx.jpg','ROLE_USER'),(17,_binary '','test123','$2a$10$w2qwoe1TKC2xSfRjJH0oI.L73cevuSHm52YGp4UngSGY8YnLM9rsG','NGUYEN','TUOC','nam','beobeo222001@gmail.com','0382304927','https://res.cloudinary.com/dhldfozup/image/upload/v1666959446/QLPhongMach/f1_skho6v.jpg','ROLE_USER'),(18,_binary '','tuan1234','$2a$10$/jKK5UUDsmSS/61aLIqNFezb2AdydypZ0AMJdxgSscp5iSkVi1tha','NGUYEN','TUOC','nam','beobeo222001@gmail.com','0382304927','https://res.cloudinary.com/dhldfozup/image/upload/v1666959927/a2bi2qdu14i7vz3vb1s1.jpg','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 13:42:27
