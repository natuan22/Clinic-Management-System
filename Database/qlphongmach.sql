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
INSERT INTO `danh_muc_thuoc` VALUES (1,_binary '',NULL,'Kháng sinh'),(2,_binary '',NULL,'Kháng viêm'),(3,_binary '',NULL,'Kháng histamin'),(4,_binary '',NULL,'Giảm đau hạ sốt'),(5,_binary '',NULL,'Thuốc Ho và Long đờm'),(6,_binary '',NULL,'Nhóm dạ dày'),(7,_binary '',NULL,'Nhóm kháng h2'),(8,_binary '',NULL,' Nhóm antacid'),(9,_binary '',NULL,'Nhóm tiêu hóa');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu_benh_vien`
--

LOCK TABLES `dich_vu_benh_vien` WRITE;
/*!40000 ALTER TABLE `dich_vu_benh_vien` DISABLE KEYS */;
INSERT INTO `dich_vu_benh_vien` VALUES (1,_binary '',NULL,'Khám sức khoẻ tổng quát cá nhân',123),(2,_binary '',NULL,'Khám sức khỏe tổng quát doanh nghiệp',123),(3,_binary '',NULL,'Tầm soát Ung thư',23),(4,_binary '',NULL,'Tầm soát Tim mạch',1123),(5,_binary '',NULL,'Tầm soát tiêu hóa gan mật',123);
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
INSERT INTO `don_vi_tinh` VALUES (1,_binary '',NULL,'vien'),(2,_binary '',NULL,'goi'),(3,_binary '',NULL,'hop'),(4,_binary '',NULL,'vi');
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
  `active` bit(1) DEFAULT b'1',
  `ngay_tao` datetime(6) NOT NULL,
  `thanh_tien` decimal(10,0) NOT NULL,
  `tinh_trang` bit(1) NOT NULL DEFAULT b'0',
  `phieu_kham_benh_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hoa_don_phieu_kham_benh_id_10bdda2a_fk_phieu_kham_benh_id` (`phieu_kham_benh_id`),
  CONSTRAINT `hoa_don_phieu_kham_benh_id_10bdda2a_fk_phieu_kham_benh_id` FOREIGN KEY (`phieu_kham_benh_id`) REFERENCES `phieu_kham_benh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` VALUES (1,_binary '\0','2022-06-15 12:41:42.693000',3694012,_binary '',1),(2,_binary '\0','2022-08-15 16:35:39.480000',3694258,_binary '\0',7),(3,_binary '\0','2022-08-15 16:49:22.521000',3694504,_binary '',8),(4,_binary '\0','2022-03-15 16:50:32.227000',1231522,_binary '',9),(5,_binary '\0','2022-08-15 16:51:53.338000',1231368,_binary '\0',10),(6,_binary '\0','2022-03-16 16:27:11.870000',492,_binary '',11),(7,_binary '\0','2022-08-16 16:28:17.941000',2463044,_binary '',12),(8,NULL,'2022-08-21 18:01:59.672000',4925257,_binary '',13),(9,NULL,'2022-08-27 15:31:20.568000',3694381,_binary '\0',14),(10,NULL,'2022-08-30 02:56:19.180000',1231676,_binary '\0',15),(11,NULL,'2022-08-30 02:58:24.110000',3694012,_binary '\0',16),(12,NULL,'2022-08-30 03:11:46.805000',2462767,_binary '\0',17);
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
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `xac_thuc` bit(1) NOT NULL DEFAULT b'0',
  `ngay_kham` date NOT NULL,
  `gio_kham` time NOT NULL,
  `trieu_chung` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_kham_benh_user_id_f1d1bbd0_fk_user_id` (`user_id`),
  CONSTRAINT `lich_kham_benh_user_id_f1d1bbd0_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_kham_benh`
--

LOCK TABLES `lich_kham_benh` WRITE;
/*!40000 ALTER TABLE `lich_kham_benh` DISABLE KEYS */;
INSERT INTO `lich_kham_benh` VALUES (6,_binary '\0',NULL,_binary '','2022-09-10','00:10:00','tuan',6),(7,_binary '\0',NULL,_binary '','2022-08-27','01:33:00','test ngay',10),(140,_binary '\0',NULL,_binary '','2022-09-10','10:00:00','alo alo',9),(141,_binary '\0',NULL,_binary '','2022-08-20','15:20:00','asda',6),(143,_binary '\0',NULL,_binary '\0','2022-09-10','16:30:00','k co gi',6),(144,_binary '\0',NULL,_binary '\0','2022-09-11','17:50:00','k co gi',6),(145,_binary '\0',NULL,_binary '\0','2022-09-11','16:50:00','k co gi',6),(146,_binary '\0',NULL,_binary '\0','2022-09-11','13:48:00','test ngay',6),(147,_binary '\0',NULL,_binary '','2022-08-21','03:53:00','aaaaa',6),(148,_binary '\0',NULL,_binary '','2022-08-11','15:56:00','dddd',4),(149,_binary '\0',NULL,_binary '','2022-08-31','01:50:00','ddddddddd',9),(150,_binary '\0',NULL,_binary '','2022-09-01','13:20:00','a',6),(151,_binary '\0',NULL,_binary '','2022-09-01','20:22:00','adada',6);
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
  `active` bit(1) DEFAULT b'1',
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_kham_benh`
--

LOCK TABLES `phieu_kham_benh` WRITE;
/*!40000 ALTER TABLE `phieu_kham_benh` DISABLE KEYS */;
INSERT INTO `phieu_kham_benh` VALUES (1,NULL,'2022-06-15 12:41:42.670000','aaaaaaaaa','aaaaaaaa',3,6,2,6),(7,NULL,'2022-08-15 16:35:39.449000','k co gi','ho co dom',3,6,1,12),(8,NULL,'2022-08-15 16:49:22.493000','111111','111111111',3,6,1,13),(9,NULL,'2022-08-15 16:50:32.226000','xong roi vu oi','hoooooo',3,2,2,14),(10,NULL,'2022-08-15 16:51:53.310000','k co gi','11111',3,6,2,15),(11,NULL,'2022-08-16 16:27:11.867000','covi sot','am tinh covi',3,11,1,16),(12,NULL,'2022-08-16 16:28:17.920000','k co gi aaaa','11111',3,6,2,17),(13,NULL,'2022-08-21 18:01:59.666000','k co gi','aaaa',3,2,2,18),(14,NULL,'2022-08-27 15:31:20.566000','xong roi','ddddddd',3,6,2,19),(15,NULL,'2022-08-30 02:56:19.143000','test','',3,6,1,20),(16,NULL,'2022-08-30 02:58:24.109000','alo alo','aaaaaaaa',3,6,3,21),(17,NULL,'2022-08-30 03:11:46.802000','k chung','dÃ¢dadadadad',3,11,1,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (7,_binary '\0',NULL,'123',123123,1231245,'',3,4),(13,_binary '\0',NULL,'1234',123,154,'123123123',4,2),(14,_binary '\0',NULL,'VN01',123,123,'12313',2,2);
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
  `active` bit(1) DEFAULT b'1',
  `created_date` datetime(6) DEFAULT NULL,
  `tong_tien` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toa_thuoc`
--

LOCK TABLES `toa_thuoc` WRITE;
/*!40000 ALTER TABLE `toa_thuoc` DISABLE KEYS */;
INSERT INTO `toa_thuoc` VALUES (1,NULL,'2022-08-13 15:34:20.915000',615),(2,NULL,'2022-08-13 15:34:41.522000',2463044),(3,NULL,'2022-08-13 15:37:26.537000',1231522),(4,NULL,'2022-08-14 00:35:25.489000',4925534),(5,NULL,'2022-08-14 11:00:49.857000',3694012),(6,NULL,'2022-08-15 12:41:42.637000',3694012),(12,NULL,'2022-08-15 16:35:39.414000',3694258),(13,NULL,'2022-08-15 16:49:22.459000',3694504),(14,NULL,'2022-08-15 16:50:32.042000',1231522),(15,NULL,'2022-08-15 16:51:53.279000',1231368),(16,NULL,'2022-08-16 16:27:11.855000',492),(17,NULL,'2022-08-16 16:28:17.912000',2463044),(18,NULL,'2022-08-21 18:01:59.623000',4925257),(19,NULL,'2022-08-27 15:31:20.379000',3694381),(20,NULL,'2022-08-30 02:56:19.053000',1231676),(21,NULL,'2022-08-30 02:58:24.007000',3694012),(22,NULL,'2022-08-30 03:11:46.795000',2462767);
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
  `so_luong` int DEFAULT '0',
  `don_gia` decimal(10,0) DEFAULT '0',
  `thuoc_id` int NOT NULL,
  `toa_thuoc_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `toa_thuoc_detail_thuoc_id_15bf24a1_fk_thuoc_id` (`thuoc_id`),
  KEY `toa_thuoc_detail_toa_thuoc_id_a6fbb684_fk_toa_thuoc_id` (`toa_thuoc_id`),
  CONSTRAINT `toa_thuoc_detail_thuoc_id_15bf24a1_fk_thuoc_id` FOREIGN KEY (`thuoc_id`) REFERENCES `thuoc` (`id`),
  CONSTRAINT `toa_thuoc_detail_toa_thuoc_id_a6fbb684_fk_toa_thuoc_id` FOREIGN KEY (`toa_thuoc_id`) REFERENCES `toa_thuoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toa_thuoc_detail`
--

LOCK TABLES `toa_thuoc_detail` WRITE;
/*!40000 ALTER TABLE `toa_thuoc_detail` DISABLE KEYS */;
INSERT INTO `toa_thuoc_detail` VALUES (1,5,123,14,1),(2,2,1231245,7,2),(3,2,154,13,2),(4,2,123,14,2),(5,1,1231245,7,3),(6,1,154,13,3),(7,1,123,14,3),(8,4,1231245,7,4),(9,2,154,13,4),(10,2,123,14,4),(11,3,1231245,7,5),(12,1,154,13,5),(13,1,123,14,5),(14,3,1231245,7,6),(15,1,154,13,6),(16,1,123,14,6),(31,3,1231245,7,12),(32,1,154,13,12),(33,3,123,14,12),(34,3,1231245,7,13),(35,1,154,13,13),(36,5,123,14,13),(37,1,1231245,7,14),(38,1,154,13,14),(39,1,123,14,14),(40,1,1231245,7,15),(41,1,123,14,15),(42,4,123,14,16),(43,2,1231245,7,17),(44,2,154,13,17),(45,2,123,14,17),(46,4,1231245,7,18),(47,1,154,13,18),(48,1,123,14,18),(49,3,1231245,7,19),(50,1,154,13,19),(51,4,123,14,19),(52,1,1231245,7,20),(53,2,154,13,20),(54,1,123,14,20),(55,3,1231245,7,21),(56,1,154,13,21),(57,1,123,14,21),(58,2,1231245,7,22),(59,1,154,13,22),(60,1,123,14,22);
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
  `is_superuser` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,_binary '','admin','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','admin','admin','nam','admin@gmail.com','123',NULL,'ROLE_ADMIN',_binary '\0'),(3,_binary '','bacsi','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','bacsi','bacsi','nam','bacsi@gmail.com','456',NULL,'ROLE_BACSI',_binary '\0'),(4,_binary '','yta','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','yta','yta','nam','yta@gmail.com','789',NULL,'ROLE_YTA',_binary '\0'),(5,_binary '','user','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','user','user','nam','user@gmail.com','123','','ROLE_USER',_binary '\0'),(6,_binary '\0','tuan','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','NGUYEN','test','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0'),(7,_binary '\0','anhtuan222001','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','NGUYEN','test','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0'),(9,_binary '\0','test','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','NGUYEN','test','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0'),(10,_binary '\0','_thangcudthw_','$2a$10$5sM7eUF6QTvZyNXj6.nCJuL00KQBTeEEsn3EBHgkk0a8lw0WVRRKy','NGUYEN','test','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0'),(11,_binary '\0','EnAyTi','$2a$10$MlHcji9ALB0j3T5/peJBveTEY23El/64zBnJJFKaMySXjmqZFq1X6','NGUYEN','test','nu','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0'),(12,_binary '\0','hung','$2a$10$WXuUl3usm.E/F2FS1PRvAOPvy4z3SClI2p5z1.7unqQmSadsJBY3m','NGUYEN','test','nam','beobeo222001@gmail.com','0382304925','https://res.cloudinary.com/dhldfozup/image/upload/v1661962594/QLPhongMach/241303155_403405527801212_1699049443065349101_n_eply1a.png','ROLE_USER',_binary '\0');
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

-- Dump completed on 2022-09-04 14:42:53
