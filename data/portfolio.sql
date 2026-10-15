-- MySQL dump 10.13  Distrib 8.4.0, for macos14 (arm64)
--
-- Host: localhost    Database: local
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (3,6,'_wp_attached_file','el-dorado/2026-02-22__doc_01__location-scout.pdf');
INSERT INTO `wp_postmeta` VALUES (4,6,'_wp_attachment_metadata','a:1:{s:8:\"filesize\";i:1356431;}');
INSERT INTO `wp_postmeta` VALUES (5,7,'_wp_attached_file','el-dorado/2026-02-22__doc_02__shotlist.pdf');
INSERT INTO `wp_postmeta` VALUES (6,7,'_wp_attachment_metadata','a:1:{s:8:\"filesize\";i:41624907;}');
INSERT INTO `wp_postmeta` VALUES (7,8,'_wp_attached_file','el-dorado/2026-02-22__doc_03__schedule.pdf');
INSERT INTO `wp_postmeta` VALUES (8,8,'_wp_attachment_metadata','a:1:{s:8:\"filesize\";i:553654;}');
INSERT INTO `wp_postmeta` VALUES (9,9,'_wp_attached_file','el-dorado/2026-02-22__doc_04__packing-list.pdf');
INSERT INTO `wp_postmeta` VALUES (10,9,'_wp_attachment_metadata','a:1:{s:8:\"filesize\";i:449908;}');
INSERT INTO `wp_postmeta` VALUES (47,5,'_sections_layout_meta','a:2:{s:8:\"disabled\";a:0:{}s:7:\"renamed\";a:0:{}}');
INSERT INTO `wp_postmeta` VALUES (48,5,'sections','a:6:{i:0;s:5:\"watch\";i:1;s:5:\"slate\";i:2;s:5:\"craft\";i:3;s:5:\"onset\";i:4;s:9:\"materials\";i:5;s:4:\"next\";}');
INSERT INTO `wp_postmeta` VALUES (49,5,'_sections','field_work_sections');
INSERT INTO `wp_postmeta` VALUES (50,5,'locations_0_name','Cedar Creek Falls');
INSERT INTO `wp_postmeta` VALUES (51,5,'_locations_0_name','field_work_location_name');
INSERT INTO `wp_postmeta` VALUES (52,5,'locations_0_url','https://maps.app.goo.gl/M6q1nNmqyBRoQRe5A');
INSERT INTO `wp_postmeta` VALUES (53,5,'_locations_0_url','field_work_location_url');
INSERT INTO `wp_postmeta` VALUES (54,5,'locations_1_name','Twin Falls');
INSERT INTO `wp_postmeta` VALUES (55,5,'_locations_1_name','field_work_location_name');
INSERT INTO `wp_postmeta` VALUES (56,5,'locations_1_url','https://maps.app.goo.gl/bd91ZJz5NeqzHETW8');
INSERT INTO `wp_postmeta` VALUES (57,5,'_locations_1_url','field_work_location_url');
INSERT INTO `wp_postmeta` VALUES (58,5,'locations_2_name','Mooloolaba Beach');
INSERT INTO `wp_postmeta` VALUES (59,5,'_locations_2_name','field_work_location_name');
INSERT INTO `wp_postmeta` VALUES (60,5,'locations_2_url','https://maps.app.goo.gl/dCfZnMTBVSeZWFm47');
INSERT INTO `wp_postmeta` VALUES (61,5,'_locations_2_url','field_work_location_url');
INSERT INTO `wp_postmeta` VALUES (62,5,'locations_3_name','Griffith University station');
INSERT INTO `wp_postmeta` VALUES (63,5,'_locations_3_name','field_work_location_name');
INSERT INTO `wp_postmeta` VALUES (64,5,'locations_3_url','https://maps.app.goo.gl/FgETATbp4Hmb5uez9');
INSERT INTO `wp_postmeta` VALUES (65,5,'_locations_3_url','field_work_location_url');
INSERT INTO `wp_postmeta` VALUES (66,5,'locations_4_name','Gardners Falls');
INSERT INTO `wp_postmeta` VALUES (67,5,'_locations_4_name','field_work_location_name');
INSERT INTO `wp_postmeta` VALUES (68,5,'locations_4_url','https://maps.app.goo.gl/21YBKZXVhysJYKoB7');
INSERT INTO `wp_postmeta` VALUES (69,5,'_locations_4_url','field_work_location_url');
INSERT INTO `wp_postmeta` VALUES (70,5,'locations','5');
INSERT INTO `wp_postmeta` VALUES (71,5,'_locations','field_work_locations');
INSERT INTO `wp_postmeta` VALUES (172,10,'_wp_attached_file','el-dorado/2026-02-28__bts_01__director.jpg');
INSERT INTO `wp_postmeta` VALUES (173,10,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:787;s:6:\"height\";i:1400;s:4:\"file\";s:42:\"el-dorado/2026-02-28__bts_01__director.jpg\";s:8:\"filesize\";i:220476;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (174,11,'_wp_attached_file','el-dorado/2026-04-10__scr_01__blackmagic-camera-ui.jpg');
INSERT INTO `wp_postmeta` VALUES (175,11,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:644;s:6:\"height\";i:1400;s:4:\"file\";s:54:\"el-dorado/2026-04-10__scr_01__blackmagic-camera-ui.jpg\";s:8:\"filesize\";i:114747;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (176,12,'_wp_attached_file','el-dorado/2026-08-03__scr_02__timeline.jpg');
INSERT INTO `wp_postmeta` VALUES (177,12,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:42:\"el-dorado/2026-08-03__scr_02__timeline.jpg\";s:8:\"filesize\";i:138481;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (178,13,'_wp_attached_file','el-dorado/2026-08-03__scr_01__colour-grading.jpg');
INSERT INTO `wp_postmeta` VALUES (179,13,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:720;s:4:\"file\";s:48:\"el-dorado/2026-08-03__scr_01__colour-grading.jpg\";s:8:\"filesize\";i:140757;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (180,14,'_wp_attached_file','el-dorado/2026-03-14__loc_01__gardner-falls.jpg');
INSERT INTO `wp_postmeta` VALUES (181,14,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1050;s:6:\"height\";i:1400;s:4:\"file\";s:47:\"el-dorado/2026-03-14__loc_01__gardner-falls.jpg\";s:8:\"filesize\";i:356483;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (182,15,'_wp_attached_file','el-dorado/2026-03-22__bts_01__acting.jpg');
INSERT INTO `wp_postmeta` VALUES (183,15,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:787;s:6:\"height\";i:1400;s:4:\"file\";s:40:\"el-dorado/2026-03-22__bts_01__acting.jpg\";s:8:\"filesize\";i:99750;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (184,16,'_wp_attached_file','el-dorado/2026-03-14__bts_02__test.jpg');
INSERT INTO `wp_postmeta` VALUES (185,16,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1050;s:6:\"height\";i:1400;s:4:\"file\";s:38:\"el-dorado/2026-03-14__bts_02__test.jpg\";s:8:\"filesize\";i:243474;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (186,17,'_wp_attached_file','el-dorado/2026-02-28__bts_02__wardrobe.jpg');
INSERT INTO `wp_postmeta` VALUES (187,17,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:787;s:6:\"height\";i:1400;s:4:\"file\";s:42:\"el-dorado/2026-02-28__bts_02__wardrobe.jpg\";s:8:\"filesize\";i:307303;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (188,18,'_wp_attached_file','el-dorado/2026-05-21__bts_01__wardrobe.jpg');
INSERT INTO `wp_postmeta` VALUES (189,18,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:787;s:6:\"height\";i:1400;s:4:\"file\";s:42:\"el-dorado/2026-05-21__bts_01__wardrobe.jpg\";s:8:\"filesize\";i:164406;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (190,19,'_wp_attached_file','el-dorado/2026-02-28__bts_03__wardrobe.jpg');
INSERT INTO `wp_postmeta` VALUES (191,19,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:787;s:6:\"height\";i:1400;s:4:\"file\";s:42:\"el-dorado/2026-02-28__bts_03__wardrobe.jpg\";s:8:\"filesize\";i:112017;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (510,5,'runtime','03:05');
INSERT INTO `wp_postmeta` VALUES (511,5,'_runtime','field_work_runtime');
INSERT INTO `wp_postmeta` VALUES (512,5,'film_embed','https://www.instagram.com/reel/Dbk88hJSsrv/embed/');
INSERT INTO `wp_postmeta` VALUES (513,5,'_film_embed','field_work_film_embed');
INSERT INTO `wp_postmeta` VALUES (514,5,'film_video','2026-08-03__cam_04__prod.mp4');
INSERT INTO `wp_postmeta` VALUES (515,5,'_film_video','field_work_film_video');
INSERT INTO `wp_postmeta` VALUES (516,5,'film_poster','14');
INSERT INTO `wp_postmeta` VALUES (517,5,'_film_poster','field_work_film_poster');
INSERT INTO `wp_postmeta` VALUES (518,20,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-08-3-x.jpg');
INSERT INTO `wp_postmeta` VALUES (519,20,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-08-3-x.jpg\";s:8:\"filesize\";i:5847616;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (520,21,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-09-x-x.jpg');
INSERT INTO `wp_postmeta` VALUES (521,21,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-09-x-x.jpg\";s:8:\"filesize\";i:4557462;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (522,22,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-10-3-x.jpg');
INSERT INTO `wp_postmeta` VALUES (523,22,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-10-3-x.jpg\";s:8:\"filesize\";i:4734060;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (524,23,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-13-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (525,23,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-13-1-x.jpg\";s:8:\"filesize\";i:4013122;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (526,24,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-16-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (527,24,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-16-1-x.jpg\";s:8:\"filesize\";i:3601464;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (528,25,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-23-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (529,25,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-23-1-x.jpg\";s:8:\"filesize\";i:3586363;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (530,26,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-24-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (531,26,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-24-1-x.jpg\";s:8:\"filesize\";i:2208003;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (532,27,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-25-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (533,27,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-25-1-x.jpg\";s:8:\"filesize\";i:4226248;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (534,28,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-27-1-x.jpg');
INSERT INTO `wp_postmeta` VALUES (535,28,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-27-1-x.jpg\";s:8:\"filesize\";i:3551505;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (536,29,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-40-3-x.jpg');
INSERT INTO `wp_postmeta` VALUES (537,29,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-40-3-x.jpg\";s:8:\"filesize\";i:3755206;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (538,30,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-43-2-x.jpg');
INSERT INTO `wp_postmeta` VALUES (539,30,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-43-2-x.jpg\";s:8:\"filesize\";i:2715067;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (540,31,'_wp_attached_file','el-dorado/2026-08-03__cam_XX__shot-44-x-x.jpg');
INSERT INTO `wp_postmeta` VALUES (541,31,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:2160;s:6:\"height\";i:3840;s:4:\"file\";s:45:\"el-dorado/2026-08-03__cam_XX__shot-44-x-x.jpg\";s:8:\"filesize\";i:3855710;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (542,5,'sections_0_shots_0_image','20');
INSERT INTO `wp_postmeta` VALUES (543,5,'_sections_0_shots_0_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (544,5,'sections_0_shots_0_alt','ショットリスト参考画像 08-3-x');
INSERT INTO `wp_postmeta` VALUES (545,5,'_sections_0_shots_0_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (546,5,'sections_0_shots_1_image','21');
INSERT INTO `wp_postmeta` VALUES (547,5,'_sections_0_shots_1_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (548,5,'sections_0_shots_1_alt','ショットリスト参考画像 09-x-x');
INSERT INTO `wp_postmeta` VALUES (549,5,'_sections_0_shots_1_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (550,5,'sections_0_shots_2_image','22');
INSERT INTO `wp_postmeta` VALUES (551,5,'_sections_0_shots_2_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (552,5,'sections_0_shots_2_alt','ショットリスト参考画像 10-3-x');
INSERT INTO `wp_postmeta` VALUES (553,5,'_sections_0_shots_2_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (554,5,'sections_0_shots_3_image','23');
INSERT INTO `wp_postmeta` VALUES (555,5,'_sections_0_shots_3_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (556,5,'sections_0_shots_3_alt','ショットリスト参考画像 13-1-x');
INSERT INTO `wp_postmeta` VALUES (557,5,'_sections_0_shots_3_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (558,5,'sections_0_shots_4_image','24');
INSERT INTO `wp_postmeta` VALUES (559,5,'_sections_0_shots_4_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (560,5,'sections_0_shots_4_alt','ショットリスト参考画像 16-1-x');
INSERT INTO `wp_postmeta` VALUES (561,5,'_sections_0_shots_4_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (562,5,'sections_0_shots_5_image','25');
INSERT INTO `wp_postmeta` VALUES (563,5,'_sections_0_shots_5_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (564,5,'sections_0_shots_5_alt','ショットリスト参考画像 23-1-x');
INSERT INTO `wp_postmeta` VALUES (565,5,'_sections_0_shots_5_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (566,5,'sections_0_shots_6_image','26');
INSERT INTO `wp_postmeta` VALUES (567,5,'_sections_0_shots_6_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (568,5,'sections_0_shots_6_alt','ショットリスト参考画像 24-1-x');
INSERT INTO `wp_postmeta` VALUES (569,5,'_sections_0_shots_6_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (570,5,'sections_0_shots_7_image','27');
INSERT INTO `wp_postmeta` VALUES (571,5,'_sections_0_shots_7_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (572,5,'sections_0_shots_7_alt','ショットリスト参考画像 25-1-x');
INSERT INTO `wp_postmeta` VALUES (573,5,'_sections_0_shots_7_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (574,5,'sections_0_shots_8_image','28');
INSERT INTO `wp_postmeta` VALUES (575,5,'_sections_0_shots_8_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (576,5,'sections_0_shots_8_alt','ショットリスト参考画像 27-1-x');
INSERT INTO `wp_postmeta` VALUES (577,5,'_sections_0_shots_8_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (578,5,'sections_0_shots_9_image','29');
INSERT INTO `wp_postmeta` VALUES (579,5,'_sections_0_shots_9_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (580,5,'sections_0_shots_9_alt','ショットリスト参考画像 40-3-x');
INSERT INTO `wp_postmeta` VALUES (581,5,'_sections_0_shots_9_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (582,5,'sections_0_shots_10_image','30');
INSERT INTO `wp_postmeta` VALUES (583,5,'_sections_0_shots_10_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (584,5,'sections_0_shots_10_alt','ショットリスト参考画像 43-2-x');
INSERT INTO `wp_postmeta` VALUES (585,5,'_sections_0_shots_10_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (586,5,'sections_0_shots_11_image','31');
INSERT INTO `wp_postmeta` VALUES (587,5,'_sections_0_shots_11_image','field_watch_shot_image');
INSERT INTO `wp_postmeta` VALUES (588,5,'sections_0_shots_11_alt','ショットリスト参考画像 44-x-x');
INSERT INTO `wp_postmeta` VALUES (589,5,'_sections_0_shots_11_alt','field_watch_shot_alt');
INSERT INTO `wp_postmeta` VALUES (590,5,'sections_0_shots','12');
INSERT INTO `wp_postmeta` VALUES (591,5,'_sections_0_shots','field_watch_shots');
INSERT INTO `wp_postmeta` VALUES (592,5,'sections_0_stats_0_label','ショートフィルム');
INSERT INTO `wp_postmeta` VALUES (593,5,'_sections_0_stats_0_label','field_watch_stat_label');
INSERT INTO `wp_postmeta` VALUES (594,5,'sections_0_stats_0_number','5');
INSERT INTO `wp_postmeta` VALUES (595,5,'_sections_0_stats_0_number','field_watch_stat_number');
INSERT INTO `wp_postmeta` VALUES (596,5,'sections_0_stats_0_unit','本');
INSERT INTO `wp_postmeta` VALUES (597,5,'_sections_0_stats_0_unit','field_watch_stat_unit');
INSERT INTO `wp_postmeta` VALUES (598,5,'sections_0_stats_0_sub','直近1年');
INSERT INTO `wp_postmeta` VALUES (599,5,'_sections_0_stats_0_sub','field_watch_stat_sub');
INSERT INTO `wp_postmeta` VALUES (600,5,'sections_0_stats_0_url','https://www.instagram.com/nagahamm_film');
INSERT INTO `wp_postmeta` VALUES (601,5,'_sections_0_stats_0_url','field_watch_stat_url');
INSERT INTO `wp_postmeta` VALUES (602,5,'sections_0_stats_0_link_label','Filmアカウントへ');
INSERT INTO `wp_postmeta` VALUES (603,5,'_sections_0_stats_0_link_label','field_watch_stat_link_label');
INSERT INTO `wp_postmeta` VALUES (604,5,'sections_0_stats_1_label','Vlog');
INSERT INTO `wp_postmeta` VALUES (605,5,'_sections_0_stats_1_label','field_watch_stat_label');
INSERT INTO `wp_postmeta` VALUES (606,5,'sections_0_stats_1_number','40');
INSERT INTO `wp_postmeta` VALUES (607,5,'_sections_0_stats_1_number','field_watch_stat_number');
INSERT INTO `wp_postmeta` VALUES (608,5,'sections_0_stats_1_unit','本');
INSERT INTO `wp_postmeta` VALUES (609,5,'_sections_0_stats_1_unit','field_watch_stat_unit');
INSERT INTO `wp_postmeta` VALUES (610,5,'sections_0_stats_1_sub','その前1年');
INSERT INTO `wp_postmeta` VALUES (611,5,'_sections_0_stats_1_sub','field_watch_stat_sub');
INSERT INTO `wp_postmeta` VALUES (612,5,'sections_0_stats_1_url','https://www.instagram.com/nagahamm_');
INSERT INTO `wp_postmeta` VALUES (613,5,'_sections_0_stats_1_url','field_watch_stat_url');
INSERT INTO `wp_postmeta` VALUES (614,5,'sections_0_stats_1_link_label','Vlogアカウントへ');
INSERT INTO `wp_postmeta` VALUES (615,5,'_sections_0_stats_1_link_label','field_watch_stat_link_label');
INSERT INTO `wp_postmeta` VALUES (616,5,'sections_0_stats_2_label','制作期間');
INSERT INTO `wp_postmeta` VALUES (617,5,'_sections_0_stats_2_label','field_watch_stat_label');
INSERT INTO `wp_postmeta` VALUES (618,5,'sections_0_stats_2_number','6ヶ月');
INSERT INTO `wp_postmeta` VALUES (619,5,'_sections_0_stats_2_number','field_watch_stat_number');
INSERT INTO `wp_postmeta` VALUES (620,5,'sections_0_stats_2_unit','');
INSERT INTO `wp_postmeta` VALUES (621,5,'_sections_0_stats_2_unit','field_watch_stat_unit');
INSERT INTO `wp_postmeta` VALUES (622,5,'sections_0_stats_2_sub','過去最長の6ヶ月間にわたる準備(構想)・撮影・編集');
INSERT INTO `wp_postmeta` VALUES (623,5,'_sections_0_stats_2_sub','field_watch_stat_sub');
INSERT INTO `wp_postmeta` VALUES (624,5,'sections_0_stats_2_url','');
INSERT INTO `wp_postmeta` VALUES (625,5,'_sections_0_stats_2_url','field_watch_stat_url');
INSERT INTO `wp_postmeta` VALUES (626,5,'sections_0_stats_2_link_label','');
INSERT INTO `wp_postmeta` VALUES (627,5,'_sections_0_stats_2_link_label','field_watch_stat_link_label');
INSERT INTO `wp_postmeta` VALUES (628,5,'sections_0_stats','3');
INSERT INTO `wp_postmeta` VALUES (629,5,'_sections_0_stats','field_watch_stats');
INSERT INTO `wp_postmeta` VALUES (630,5,'sections_1_cards_0_label','Title');
INSERT INTO `wp_postmeta` VALUES (631,5,'_sections_1_cards_0_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (632,5,'sections_1_cards_0_format','text');
INSERT INTO `wp_postmeta` VALUES (633,5,'_sections_1_cards_0_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (634,5,'sections_1_cards_0_value','エル・ドラド');
INSERT INTO `wp_postmeta` VALUES (635,5,'_sections_1_cards_0_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (636,5,'sections_1_cards_1_label','Runtime');
INSERT INTO `wp_postmeta` VALUES (637,5,'_sections_1_cards_1_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (638,5,'sections_1_cards_1_format','text');
INSERT INTO `wp_postmeta` VALUES (639,5,'_sections_1_cards_1_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (640,5,'sections_1_cards_1_value','03:05');
INSERT INTO `wp_postmeta` VALUES (641,5,'_sections_1_cards_1_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (642,5,'sections_1_cards_2_label','Genre');
INSERT INTO `wp_postmeta` VALUES (643,5,'_sections_1_cards_2_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (644,5,'sections_1_cards_2_format','text');
INSERT INTO `wp_postmeta` VALUES (645,5,'_sections_1_cards_2_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (646,5,'sections_1_cards_2_value','冒険ファンタジー(黄金の羊毛)');
INSERT INTO `wp_postmeta` VALUES (647,5,'_sections_1_cards_2_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (648,5,'sections_1_cards_3_label','Role');
INSERT INTO `wp_postmeta` VALUES (649,5,'_sections_1_cards_3_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (650,5,'sections_1_cards_3_format','text');
INSERT INTO `wp_postmeta` VALUES (651,5,'_sections_1_cards_3_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (652,5,'sections_1_cards_3_value','脚本 / 監督 / 主演(コア)\n撮影(技術) / 編集(ポスプロ)\n衣装 / 美術(小道具) / 制作進行(AD)');
INSERT INTO `wp_postmeta` VALUES (653,5,'_sections_1_cards_3_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (654,5,'sections_1_cards_4_label','Camera');
INSERT INTO `wp_postmeta` VALUES (655,5,'_sections_1_cards_4_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (656,5,'sections_1_cards_4_format','list');
INSERT INTO `wp_postmeta` VALUES (657,5,'_sections_1_cards_4_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (658,5,'sections_1_cards_4_value','iPhone 16 Pro Max(Blackmagic Camera)\nDJI Osmo Pocket 3\nInsta360 GO 3S');
INSERT INTO `wp_postmeta` VALUES (659,5,'_sections_1_cards_4_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (660,5,'sections_1_cards_5_label','Mic');
INSERT INTO `wp_postmeta` VALUES (661,5,'_sections_1_cards_5_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (662,5,'sections_1_cards_5_format','text');
INSERT INTO `wp_postmeta` VALUES (663,5,'_sections_1_cards_5_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (664,5,'sections_1_cards_5_value','DJI Mic Mini');
INSERT INTO `wp_postmeta` VALUES (665,5,'_sections_1_cards_5_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (666,5,'sections_1_cards_6_label','Location');
INSERT INTO `wp_postmeta` VALUES (667,5,'_sections_1_cards_6_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (668,5,'sections_1_cards_6_format','list');
INSERT INTO `wp_postmeta` VALUES (669,5,'_sections_1_cards_6_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (670,5,'sections_1_cards_6_value','Cedar Creek Falls\nTwin Falls\nMooloolaba Beach\nGriffith University station\nGardners Falls');
INSERT INTO `wp_postmeta` VALUES (671,5,'_sections_1_cards_6_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (672,5,'sections_1_cards_7_label','Crew');
INSERT INTO `wp_postmeta` VALUES (673,5,'_sections_1_cards_7_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (674,5,'sections_1_cards_7_format','text');
INSERT INTO `wp_postmeta` VALUES (675,5,'_sections_1_cards_7_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (676,5,'sections_1_cards_7_value','計6人');
INSERT INTO `wp_postmeta` VALUES (677,5,'_sections_1_cards_7_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (678,5,'sections_1_cards_8_label','Tools');
INSERT INTO `wp_postmeta` VALUES (679,5,'_sections_1_cards_8_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (680,5,'sections_1_cards_8_format','list');
INSERT INTO `wp_postmeta` VALUES (681,5,'_sections_1_cards_8_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (682,5,'sections_1_cards_8_value','DaVinci Resolve(編集・カラー)\nGoogleスプレッドシート(香盤表)\nMilanote(ショットリスト)');
INSERT INTO `wp_postmeta` VALUES (683,5,'_sections_1_cards_8_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (684,5,'sections_1_cards','9');
INSERT INTO `wp_postmeta` VALUES (685,5,'_sections_1_cards','field_slate_cards');
INSERT INTO `wp_postmeta` VALUES (686,5,'sections_2_cards_0_title','Director');
INSERT INTO `wp_postmeta` VALUES (687,5,'_sections_2_cards_0_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (688,5,'sections_2_cards_0_label','Director');
INSERT INTO `wp_postmeta` VALUES (689,5,'_sections_2_cards_0_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (690,5,'sections_2_cards_0_text','全体演出・画コンテ策定・キャスト指示');
INSERT INTO `wp_postmeta` VALUES (691,5,'_sections_2_cards_0_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (692,5,'sections_2_cards_0_highlight','');
INSERT INTO `wp_postmeta` VALUES (693,5,'_sections_2_cards_0_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (694,5,'sections_2_cards_0_photos_0_image','10');
INSERT INTO `wp_postmeta` VALUES (695,5,'_sections_2_cards_0_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (696,5,'sections_2_cards_0_photos_0_alt','現場で指示を出す様子');
INSERT INTO `wp_postmeta` VALUES (697,5,'_sections_2_cards_0_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (698,5,'sections_2_cards_0_photos','1');
INSERT INTO `wp_postmeta` VALUES (699,5,'_sections_2_cards_0_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (700,5,'sections_2_cards_0_carousel','0');
INSERT INTO `wp_postmeta` VALUES (701,5,'_sections_2_cards_0_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (702,5,'sections_2_cards_1_title','Script');
INSERT INTO `wp_postmeta` VALUES (703,5,'_sections_2_cards_1_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (704,5,'sections_2_cards_1_label','Script');
INSERT INTO `wp_postmeta` VALUES (705,5,'_sections_2_cards_1_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (706,5,'sections_2_cards_1_text','Save the Cat等の脚本術 / Geminiとの壁打ち');
INSERT INTO `wp_postmeta` VALUES (707,5,'_sections_2_cards_1_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (708,5,'sections_2_cards_1_highlight','');
INSERT INTO `wp_postmeta` VALUES (709,5,'_sections_2_cards_1_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (710,5,'sections_2_cards_1_photos','');
INSERT INTO `wp_postmeta` VALUES (711,5,'_sections_2_cards_1_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (712,5,'sections_2_cards_1_carousel','0');
INSERT INTO `wp_postmeta` VALUES (713,5,'_sections_2_cards_1_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (714,5,'sections_2_cards_2_title','Camera');
INSERT INTO `wp_postmeta` VALUES (715,5,'_sections_2_cards_2_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (716,5,'sections_2_cards_2_label','Camera');
INSERT INTO `wp_postmeta` VALUES (717,5,'_sections_2_cards_2_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (718,5,'sections_2_cards_2_text','iPhone 16 Pro Max(Blackmagic Camera) / DJI Osmo Pocket 3 / Insta360 GO 3S');
INSERT INTO `wp_postmeta` VALUES (719,5,'_sections_2_cards_2_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (720,5,'sections_2_cards_2_highlight','iPhone 16 Pro Max(Blackmagic Camera)');
INSERT INTO `wp_postmeta` VALUES (721,5,'_sections_2_cards_2_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (722,5,'sections_2_cards_2_photos_0_image','11');
INSERT INTO `wp_postmeta` VALUES (723,5,'_sections_2_cards_2_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (724,5,'sections_2_cards_2_photos_0_alt','Blackmagic Cameraアプリでの撮影画面');
INSERT INTO `wp_postmeta` VALUES (725,5,'_sections_2_cards_2_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (726,5,'sections_2_cards_2_photos','1');
INSERT INTO `wp_postmeta` VALUES (727,5,'_sections_2_cards_2_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (728,5,'sections_2_cards_2_carousel','0');
INSERT INTO `wp_postmeta` VALUES (729,5,'_sections_2_cards_2_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (730,5,'sections_2_cards_3_title','Audio');
INSERT INTO `wp_postmeta` VALUES (731,5,'_sections_2_cards_3_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (732,5,'sections_2_cards_3_label','Audio');
INSERT INTO `wp_postmeta` VALUES (733,5,'_sections_2_cards_3_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (734,5,'sections_2_cards_3_text','DJI Mic Mini');
INSERT INTO `wp_postmeta` VALUES (735,5,'_sections_2_cards_3_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (736,5,'sections_2_cards_3_highlight','');
INSERT INTO `wp_postmeta` VALUES (737,5,'_sections_2_cards_3_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (738,5,'sections_2_cards_3_photos','');
INSERT INTO `wp_postmeta` VALUES (739,5,'_sections_2_cards_3_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (740,5,'sections_2_cards_3_carousel','0');
INSERT INTO `wp_postmeta` VALUES (741,5,'_sections_2_cards_3_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (742,5,'sections_2_cards_4_title','Edit');
INSERT INTO `wp_postmeta` VALUES (743,5,'_sections_2_cards_4_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (744,5,'sections_2_cards_4_label','Edit');
INSERT INTO `wp_postmeta` VALUES (745,5,'_sections_2_cards_4_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (746,5,'sections_2_cards_4_text','DaVinci Resolve による編集・構成');
INSERT INTO `wp_postmeta` VALUES (747,5,'_sections_2_cards_4_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (748,5,'sections_2_cards_4_highlight','');
INSERT INTO `wp_postmeta` VALUES (749,5,'_sections_2_cards_4_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (750,5,'sections_2_cards_4_photos_0_image','12');
INSERT INTO `wp_postmeta` VALUES (751,5,'_sections_2_cards_4_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (752,5,'sections_2_cards_4_photos_0_alt','DaVinci Resolveのマルチトラックタイムライン画面');
INSERT INTO `wp_postmeta` VALUES (753,5,'_sections_2_cards_4_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (754,5,'sections_2_cards_4_photos','1');
INSERT INTO `wp_postmeta` VALUES (755,5,'_sections_2_cards_4_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (756,5,'sections_2_cards_4_carousel','0');
INSERT INTO `wp_postmeta` VALUES (757,5,'_sections_2_cards_4_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (758,5,'sections_2_cards_5_title','Color');
INSERT INTO `wp_postmeta` VALUES (759,5,'_sections_2_cards_5_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (760,5,'sections_2_cards_5_label','Color');
INSERT INTO `wp_postmeta` VALUES (761,5,'_sections_2_cards_5_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (762,5,'sections_2_cards_5_text','カラーコレクション / カラーグレーディング');
INSERT INTO `wp_postmeta` VALUES (763,5,'_sections_2_cards_5_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (764,5,'sections_2_cards_5_highlight','');
INSERT INTO `wp_postmeta` VALUES (765,5,'_sections_2_cards_5_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (766,5,'sections_2_cards_5_photos_0_image','13');
INSERT INTO `wp_postmeta` VALUES (767,5,'_sections_2_cards_5_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (768,5,'sections_2_cards_5_photos_0_alt','DaVinci Resolveのカラーページ、ノードとスコープ画面');
INSERT INTO `wp_postmeta` VALUES (769,5,'_sections_2_cards_5_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (770,5,'sections_2_cards_5_photos','1');
INSERT INTO `wp_postmeta` VALUES (771,5,'_sections_2_cards_5_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (772,5,'sections_2_cards_5_carousel','0');
INSERT INTO `wp_postmeta` VALUES (773,5,'_sections_2_cards_5_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (774,5,'sections_2_cards_6_title','Acting / Main Cast');
INSERT INTO `wp_postmeta` VALUES (775,5,'_sections_2_cards_6_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (776,5,'sections_2_cards_6_label','Acting');
INSERT INTO `wp_postmeta` VALUES (777,5,'_sections_2_cards_6_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (778,5,'sections_2_cards_6_text','主演としての演技・現場でのセルフディレクション');
INSERT INTO `wp_postmeta` VALUES (779,5,'_sections_2_cards_6_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (780,5,'sections_2_cards_6_highlight','');
INSERT INTO `wp_postmeta` VALUES (781,5,'_sections_2_cards_6_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (782,5,'sections_2_cards_6_photos_0_image','14');
INSERT INTO `wp_postmeta` VALUES (783,5,'_sections_2_cards_6_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (784,5,'sections_2_cards_6_photos_0_alt','主演としての演技');
INSERT INTO `wp_postmeta` VALUES (785,5,'_sections_2_cards_6_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (786,5,'sections_2_cards_6_photos_1_image','15');
INSERT INTO `wp_postmeta` VALUES (787,5,'_sections_2_cards_6_photos_1_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (788,5,'sections_2_cards_6_photos_1_alt','現場でのセルフディレクション');
INSERT INTO `wp_postmeta` VALUES (789,5,'_sections_2_cards_6_photos_1_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (790,5,'sections_2_cards_6_photos','2');
INSERT INTO `wp_postmeta` VALUES (791,5,'_sections_2_cards_6_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (792,5,'sections_2_cards_6_carousel','0');
INSERT INTO `wp_postmeta` VALUES (793,5,'_sections_2_cards_6_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (794,5,'sections_2_cards_7_title','Art / Props');
INSERT INTO `wp_postmeta` VALUES (795,5,'_sections_2_cards_7_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (796,5,'sections_2_cards_7_label','Props');
INSERT INTO `wp_postmeta` VALUES (797,5,'_sections_2_cards_7_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (798,5,'sections_2_cards_7_text','小道具の調達・準備');
INSERT INTO `wp_postmeta` VALUES (799,5,'_sections_2_cards_7_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (800,5,'sections_2_cards_7_highlight','');
INSERT INTO `wp_postmeta` VALUES (801,5,'_sections_2_cards_7_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (802,5,'sections_2_cards_7_photos_0_image','16');
INSERT INTO `wp_postmeta` VALUES (803,5,'_sections_2_cards_7_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (804,5,'sections_2_cards_7_photos_0_alt','宝の地図の小道具');
INSERT INTO `wp_postmeta` VALUES (805,5,'_sections_2_cards_7_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (806,5,'sections_2_cards_7_photos','1');
INSERT INTO `wp_postmeta` VALUES (807,5,'_sections_2_cards_7_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (808,5,'sections_2_cards_7_carousel','1');
INSERT INTO `wp_postmeta` VALUES (809,5,'_sections_2_cards_7_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (810,5,'sections_2_cards_8_title','Wardrobe');
INSERT INTO `wp_postmeta` VALUES (811,5,'_sections_2_cards_8_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (812,5,'sections_2_cards_8_label','');
INSERT INTO `wp_postmeta` VALUES (813,5,'_sections_2_cards_8_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (814,5,'sections_2_cards_8_text','衣装の選定・買い出し');
INSERT INTO `wp_postmeta` VALUES (815,5,'_sections_2_cards_8_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (816,5,'sections_2_cards_8_highlight','');
INSERT INTO `wp_postmeta` VALUES (817,5,'_sections_2_cards_8_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (818,5,'sections_2_cards_8_photos_0_image','17');
INSERT INTO `wp_postmeta` VALUES (819,5,'_sections_2_cards_8_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (820,5,'sections_2_cards_8_photos_0_alt','冒険の始まりと世界観を提示するアドベンチャー・探検家スタイルの衣装');
INSERT INTO `wp_postmeta` VALUES (821,5,'_sections_2_cards_8_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (822,5,'sections_2_cards_8_photos_1_image','18');
INSERT INTO `wp_postmeta` VALUES (823,5,'_sections_2_cards_8_photos_1_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (824,5,'sections_2_cards_8_photos_1_alt','過去シーンにおける登場人物の立場・上下関係の逆転を可視化する衣装');
INSERT INTO `wp_postmeta` VALUES (825,5,'_sections_2_cards_8_photos_1_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (826,5,'sections_2_cards_8_photos_2_image','19');
INSERT INTO `wp_postmeta` VALUES (827,5,'_sections_2_cards_8_photos_2_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (828,5,'sections_2_cards_8_photos_2_alt','回想シーンにおける片方の記憶のみが鮮明に残る主観的歪みを表現した衣装');
INSERT INTO `wp_postmeta` VALUES (829,5,'_sections_2_cards_8_photos_2_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (830,5,'sections_2_cards_8_photos','3');
INSERT INTO `wp_postmeta` VALUES (831,5,'_sections_2_cards_8_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (832,5,'sections_2_cards_8_carousel','0');
INSERT INTO `wp_postmeta` VALUES (833,5,'_sections_2_cards_8_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (834,5,'sections_2_cards_9_title','Production / AD');
INSERT INTO `wp_postmeta` VALUES (835,5,'_sections_2_cards_9_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (836,5,'sections_2_cards_9_label','AD');
INSERT INTO `wp_postmeta` VALUES (837,5,'_sections_2_cards_9_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (838,5,'sections_2_cards_9_text','香盤表・ショットリスト・スケジュール管理、食事・移動手配などの制作進行');
INSERT INTO `wp_postmeta` VALUES (839,5,'_sections_2_cards_9_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (840,5,'sections_2_cards_9_highlight','');
INSERT INTO `wp_postmeta` VALUES (841,5,'_sections_2_cards_9_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (842,5,'sections_2_cards_9_photos','');
INSERT INTO `wp_postmeta` VALUES (843,5,'_sections_2_cards_9_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (844,5,'sections_2_cards_9_carousel','0');
INSERT INTO `wp_postmeta` VALUES (845,5,'_sections_2_cards_9_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (846,5,'sections_2_cards','10');
INSERT INTO `wp_postmeta` VALUES (847,5,'_sections_2_cards','field_craft_cards');
INSERT INTO `wp_postmeta` VALUES (848,5,'sections_3_rows_0_role','監督');
INSERT INTO `wp_postmeta` VALUES (849,5,'_sections_3_rows_0_role','field_onset_row_role');
INSERT INTO `wp_postmeta` VALUES (850,5,'sections_3_rows_0_problem','参考映画・アニメ等の画像共有だけでは、経験の浅いカメラマンと構図や画角(レンズ感)の認識ズレが発生した');
INSERT INTO `wp_postmeta` VALUES (851,5,'_sections_3_rows_0_problem','field_onset_row_problem');
INSERT INTO `wp_postmeta` VALUES (852,5,'sections_3_rows_0_action','参考カットが無い場合はAI画像生成で脳内イメージを具体化。演者の動作・レンズ倍率(例: iPhone 48mm / 2x)・カメラワーク(手持ちTrack)までショットリストに緻密に指定');
INSERT INTO `wp_postmeta` VALUES (853,5,'_sections_3_rows_0_action','field_onset_row_action');
INSERT INTO `wp_postmeta` VALUES (854,5,'sections_3_rows_0_result','感覚に頼らず意図通りの画を確実に再現でき、現場の迷いやテイク数を大幅削減');
INSERT INTO `wp_postmeta` VALUES (855,5,'_sections_3_rows_0_result','field_onset_row_result');
INSERT INTO `wp_postmeta` VALUES (856,5,'sections_3_rows_1_role','撮影(技術)');
INSERT INTO `wp_postmeta` VALUES (857,5,'_sections_3_rows_1_role','field_onset_row_role');
INSERT INTO `wp_postmeta` VALUES (858,5,'sections_3_rows_1_problem','前回、マイク接続ミスで3時間分の音声が未収録になり再撮影が発生した');
INSERT INTO `wp_postmeta` VALUES (859,5,'_sections_3_rows_1_problem','field_onset_row_problem');
INSERT INTO `wp_postmeta` VALUES (860,5,'sections_3_rows_1_action','撮影ごとに録音を都度チェック');
INSERT INTO `wp_postmeta` VALUES (861,5,'_sections_3_rows_1_action','field_onset_row_action');
INSERT INTO `wp_postmeta` VALUES (862,5,'sections_3_rows_1_result','ミラーリング機器接続時の音ズレに気づき外して撮影。後日の撮り直しリスクを防止');
INSERT INTO `wp_postmeta` VALUES (863,5,'_sections_3_rows_1_result','field_onset_row_result');
INSERT INTO `wp_postmeta` VALUES (864,5,'sections_3_rows_2_role','編集(ポスプロ)');
INSERT INTO `wp_postmeta` VALUES (865,5,'_sections_3_rows_2_role','field_onset_row_role');
INSERT INTO `wp_postmeta` VALUES (866,5,'sections_3_rows_2_problem','映像素材数が膨大で整理が追いつかず、編集時に目的のファイルを探し回るタイムロスが発生していた');
INSERT INTO `wp_postmeta` VALUES (867,5,'_sections_3_rows_2_problem','field_onset_row_problem');
INSERT INTO `wp_postmeta` VALUES (868,5,'sections_3_rows_2_action','映像素材を撮影単位で整理し、構成に合わせてシーケンス(タイムライン)を8つに事前分割。バックアップも徹底');
INSERT INTO `wp_postmeta` VALUES (869,5,'_sections_3_rows_2_action','field_onset_row_action');
INSERT INTO `wp_postmeta` VALUES (870,5,'sections_3_rows_2_result','先行録音した音声素材も対応シーケンスへ迷わず配置でき、素材迷子をゼロにして編集作業を劇的に効率化');
INSERT INTO `wp_postmeta` VALUES (871,5,'_sections_3_rows_2_result','field_onset_row_result');
INSERT INTO `wp_postmeta` VALUES (872,5,'sections_3_rows_3_role','制作進行');
INSERT INTO `wp_postmeta` VALUES (873,5,'_sections_3_rows_3_role','field_onset_row_role');
INSERT INTO `wp_postmeta` VALUES (874,5,'sections_3_rows_3_problem','前回、予定(21:00〜01:00)に対し03:30まで大幅超過した');
INSERT INTO `wp_postmeta` VALUES (875,5,'_sections_3_rows_3_problem','field_onset_row_problem');
INSERT INTO `wp_postmeta` VALUES (876,5,'sections_3_rows_3_action','初回撮影時にセッティングや移動時間を含めた香盤表を制作し、タイムスケジュールを可視化');
INSERT INTO `wp_postmeta` VALUES (877,5,'_sections_3_rows_3_action','field_onset_row_action');
INSERT INTO `wp_postmeta` VALUES (878,5,'sections_3_rows_3_result','当日の進行遅延を防ぐ効果を実感するも、全行程における香盤表の運用継続が新たな課題に');
INSERT INTO `wp_postmeta` VALUES (879,5,'_sections_3_rows_3_result','field_onset_row_result');
INSERT INTO `wp_postmeta` VALUES (880,5,'sections_3_rows_4_role','制作進行');
INSERT INTO `wp_postmeta` VALUES (881,5,'_sections_3_rows_4_role','field_onset_row_role');
INSERT INTO `wp_postmeta` VALUES (882,5,'sections_3_rows_4_problem','iPhoneをメインカメラとして使用するため、端末内のみで資料管理すると撮影中の確認ができず進行が停滞し、バッテリーも激しく消耗した');
INSERT INTO `wp_postmeta` VALUES (883,5,'_sections_3_rows_4_problem','field_onset_row_problem');
INSERT INTO `wp_postmeta` VALUES (884,5,'sections_3_rows_4_action','印刷した紙のショットリスト(予備含む)をメイン運用し、スマホにバックアップ保存');
INSERT INTO `wp_postmeta` VALUES (885,5,'_sections_3_rows_4_action','field_onset_row_action');
INSERT INTO `wp_postmeta` VALUES (886,5,'sections_3_rows_4_result','撮影の手を止めず電池も温存する二重体制を徹底');
INSERT INTO `wp_postmeta` VALUES (887,5,'_sections_3_rows_4_result','field_onset_row_result');
INSERT INTO `wp_postmeta` VALUES (888,5,'sections_3_rows','5');
INSERT INTO `wp_postmeta` VALUES (889,5,'_sections_3_rows','field_onset_rows');
INSERT INTO `wp_postmeta` VALUES (890,5,'sections_4_lead','実際に現場で使用した制作資料です。一部、権利上の理由で該当箇所を伏せています。');
INSERT INTO `wp_postmeta` VALUES (891,5,'_sections_4_lead','field_materials_lead');
INSERT INTO `wp_postmeta` VALUES (892,5,'sections_4_cards_0_label','ロケハン行程表');
INSERT INTO `wp_postmeta` VALUES (893,5,'_sections_4_cards_0_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (894,5,'sections_4_cards_0_label_en','Location Scouting Itinerary');
INSERT INTO `wp_postmeta` VALUES (895,5,'_sections_4_cards_0_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (896,5,'sections_4_cards_0_file','6');
INSERT INTO `wp_postmeta` VALUES (897,5,'_sections_4_cards_0_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (898,5,'sections_4_cards_0_anchor','');
INSERT INTO `wp_postmeta` VALUES (899,5,'_sections_4_cards_0_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (900,5,'sections_4_cards_0_link_words','');
INSERT INTO `wp_postmeta` VALUES (901,5,'_sections_4_cards_0_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (902,5,'sections_4_cards_1_label','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (903,5,'_sections_4_cards_1_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (904,5,'sections_4_cards_1_label_en','Shot List');
INSERT INTO `wp_postmeta` VALUES (905,5,'_sections_4_cards_1_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (906,5,'sections_4_cards_1_file','7');
INSERT INTO `wp_postmeta` VALUES (907,5,'_sections_4_cards_1_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (908,5,'sections_4_cards_1_anchor','shotlist');
INSERT INTO `wp_postmeta` VALUES (909,5,'_sections_4_cards_1_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (910,5,'sections_4_cards_1_link_words','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (911,5,'_sections_4_cards_1_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (912,5,'sections_4_cards_2_label','香盤表');
INSERT INTO `wp_postmeta` VALUES (913,5,'_sections_4_cards_2_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (914,5,'sections_4_cards_2_label_en','Shooting Schedule');
INSERT INTO `wp_postmeta` VALUES (915,5,'_sections_4_cards_2_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (916,5,'sections_4_cards_2_file','8');
INSERT INTO `wp_postmeta` VALUES (917,5,'_sections_4_cards_2_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (918,5,'sections_4_cards_2_anchor','schedule');
INSERT INTO `wp_postmeta` VALUES (919,5,'_sections_4_cards_2_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (920,5,'sections_4_cards_2_link_words','香盤表');
INSERT INTO `wp_postmeta` VALUES (921,5,'_sections_4_cards_2_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (922,5,'sections_4_cards_3_label','持ち物リスト');
INSERT INTO `wp_postmeta` VALUES (923,5,'_sections_4_cards_3_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (924,5,'sections_4_cards_3_label_en','Packing / Props List');
INSERT INTO `wp_postmeta` VALUES (925,5,'_sections_4_cards_3_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (926,5,'sections_4_cards_3_file','9');
INSERT INTO `wp_postmeta` VALUES (927,5,'_sections_4_cards_3_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (928,5,'sections_4_cards_3_anchor','');
INSERT INTO `wp_postmeta` VALUES (929,5,'_sections_4_cards_3_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (930,5,'sections_4_cards_3_link_words','');
INSERT INTO `wp_postmeta` VALUES (931,5,'_sections_4_cards_3_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (932,5,'sections_4_cards','4');
INSERT INTO `wp_postmeta` VALUES (933,5,'_sections_4_cards','field_materials_cards');
INSERT INTO `wp_postmeta` VALUES (934,5,'sections_5_rows_0_role','脚本');
INSERT INTO `wp_postmeta` VALUES (935,5,'_sections_5_rows_0_role','field_next_row_role');
INSERT INTO `wp_postmeta` VALUES (936,5,'sections_5_rows_0_problem','当初03:30あった尺を03:05まで削ったものの、見せたいショットを優先した結果これ以上短縮できず、Instagramの03:00制限を超過してリーチ機会を逃した');
INSERT INTO `wp_postmeta` VALUES (937,5,'_sections_5_rows_0_problem','field_next_row_problem');
INSERT INTO `wp_postmeta` VALUES (938,5,'sections_5_rows_0_action','編集段階で粘るのではなく、ショットリスト作成段階で03:00超過が判明した時点で大胆にカット・削ぎ落としを行う判断をする');
INSERT INTO `wp_postmeta` VALUES (939,5,'_sections_5_rows_0_action','field_next_row_action');
INSERT INTO `wp_postmeta` VALUES (940,5,'sections_5_rows_1_role','監督');
INSERT INTO `wp_postmeta` VALUES (941,5,'_sections_5_rows_1_role','field_next_row_role');
INSERT INTO `wp_postmeta` VALUES (942,5,'sections_5_rows_1_problem','撮影を任せられなかったサポートメンバーに対し、役割の意図や重要性を言語化しないまま作業依頼し、モチベーションを保てず途中離脱させてしまった');
INSERT INTO `wp_postmeta` VALUES (943,5,'_sections_5_rows_1_problem','field_next_row_problem');
INSERT INTO `wp_postmeta` VALUES (944,5,'sections_5_rows_1_action','裏方やサポート作業であっても「なぜその役割が作品制作に必要なのか」という全体像と価値を事前に言語化して共有し、全員が目的意識を持って参加できる動機付けと配慮をする');
INSERT INTO `wp_postmeta` VALUES (945,5,'_sections_5_rows_1_action','field_next_row_action');
INSERT INTO `wp_postmeta` VALUES (946,5,'sections_5_rows_2_role','撮影(技術)');
INSERT INTO `wp_postmeta` VALUES (947,5,'_sections_5_rows_2_role','field_next_row_role');
INSERT INTO `wp_postmeta` VALUES (948,5,'sections_5_rows_2_problem','録音環境の制約によりノイズや音割れが発生し、編集でノイズリダクション等のリカバリーを試みたが限界があった');
INSERT INTO `wp_postmeta` VALUES (949,5,'_sections_5_rows_2_problem','field_next_row_problem');
INSERT INTO `wp_postmeta` VALUES (950,5,'sections_5_rows_2_action','外部マイクの適切な配置と事前のゲイン(録音レベル)調整を行い、編集(ポスプロ)に依存しない「収録段階での音質確保」を最優先とする');
INSERT INTO `wp_postmeta` VALUES (951,5,'_sections_5_rows_2_action','field_next_row_action');
INSERT INTO `wp_postmeta` VALUES (952,5,'sections_5_rows_3_role','制作進行');
INSERT INTO `wp_postmeta` VALUES (953,5,'_sections_5_rows_3_role','field_next_row_role');
INSERT INTO `wp_postmeta` VALUES (954,5,'sections_5_rows_3_problem','全体の制作期間やデッドラインを設定しておらず全10回に膨大。さらに香盤表運用も途絶え帰国後も追加撮影が発生した');
INSERT INTO `wp_postmeta` VALUES (955,5,'_sections_5_rows_3_problem','field_next_row_problem');
INSERT INTO `wp_postmeta` VALUES (956,5,'sections_5_rows_3_action','企画段階で全行程の香盤表を完備し、クランクアップと完成のデッドラインを厳格に設定。逆算したスケジュール管理をする');
INSERT INTO `wp_postmeta` VALUES (957,5,'_sections_5_rows_3_action','field_next_row_action');
INSERT INTO `wp_postmeta` VALUES (958,5,'sections_5_rows','4');
INSERT INTO `wp_postmeta` VALUES (959,5,'_sections_5_rows','field_next_rows');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (4,0,'2026-10-15 08:37:25','2026-10-15 08:37:25','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2026-10-15 08:37:25','2026-10-15 08:37:25','',0,'http://film-portfolio.local/navigation/',0,'wp_navigation','',0);
INSERT INTO `wp_posts` VALUES (5,0,'2026-10-15 08:41:34','2026-10-15 08:41:34','','エル・ドラド','','publish','closed','closed','','el-dorado','','','2026-10-15 08:41:34','2026-10-15 08:41:34','',0,'http://film-portfolio.local/works/el-dorado/',0,'work','',0);
INSERT INTO `wp_posts` VALUES (6,0,'2026-10-15 08:56:46','2026-10-15 08:56:46','','2026-02-22__doc_01__location-scout','','inherit','open','closed','','2026-02-22__doc_01__location-scout','','','2026-10-15 08:56:46','2026-10-15 08:56:46','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-22__doc_01__location-scout.pdf',0,'attachment','application/pdf',0);
INSERT INTO `wp_posts` VALUES (7,0,'2026-10-15 08:56:46','2026-10-15 08:56:46','','2026-02-22__doc_02__shotlist','','inherit','open','closed','','2026-02-22__doc_02__shotlist','','','2026-10-15 08:56:46','2026-10-15 08:56:46','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-22__doc_02__shotlist.pdf',0,'attachment','application/pdf',0);
INSERT INTO `wp_posts` VALUES (8,0,'2026-10-15 08:56:46','2026-10-15 08:56:46','','2026-02-22__doc_03__schedule','','inherit','open','closed','','2026-02-22__doc_03__schedule','','','2026-10-15 08:56:46','2026-10-15 08:56:46','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-22__doc_03__schedule.pdf',0,'attachment','application/pdf',0);
INSERT INTO `wp_posts` VALUES (9,0,'2026-10-15 08:56:46','2026-10-15 08:56:46','','2026-02-22__doc_04__packing-list','','inherit','open','closed','','2026-02-22__doc_04__packing-list','','','2026-10-15 08:56:46','2026-10-15 08:56:46','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-22__doc_04__packing-list.pdf',0,'attachment','application/pdf',0);
INSERT INTO `wp_posts` VALUES (10,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-02-28__bts_01__director','','inherit','open','closed','','2026-02-28__bts_01__director','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-28__bts_01__director.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (11,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-04-10__scr_01__blackmagic-camera-ui','','inherit','open','closed','','2026-04-10__scr_01__blackmagic-camera-ui','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-04-10__scr_01__blackmagic-camera-ui.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (12,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-08-03__scr_02__timeline','','inherit','open','closed','','2026-08-03__scr_02__timeline','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__scr_02__timeline.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (13,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-08-03__scr_01__colour-grading','','inherit','open','closed','','2026-08-03__scr_01__colour-grading','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__scr_01__colour-grading.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (14,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-03-14__loc_01__gardner-falls','','inherit','open','closed','','2026-03-14__loc_01__gardner-falls','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-03-14__loc_01__gardner-falls.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (15,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-03-22__bts_01__acting','','inherit','open','closed','','2026-03-22__bts_01__acting','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-03-22__bts_01__acting.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (16,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-03-14__bts_02__test','','inherit','open','closed','','2026-03-14__bts_02__test','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-03-14__bts_02__test.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (17,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-02-28__bts_02__wardrobe','','inherit','open','closed','','2026-02-28__bts_02__wardrobe','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-28__bts_02__wardrobe.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (18,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-05-21__bts_01__wardrobe','','inherit','open','closed','','2026-05-21__bts_01__wardrobe','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-05-21__bts_01__wardrobe.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (19,0,'2026-10-15 10:02:07','2026-10-15 10:02:07','','2026-02-28__bts_03__wardrobe','','inherit','open','closed','','2026-02-28__bts_03__wardrobe','','','2026-10-15 10:02:07','2026-10-15 10:02:07','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-02-28__bts_03__wardrobe.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (20,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-08-3-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-08-3-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-08-3-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (21,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-09-x-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-09-x-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-09-x-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (22,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-10-3-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-10-3-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-10-3-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (23,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-13-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-13-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-13-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (24,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-16-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-16-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-16-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (25,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-23-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-23-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-23-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (26,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-24-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-24-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-24-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (27,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-25-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-25-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-25-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (28,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-27-1-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-27-1-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-27-1-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (29,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-40-3-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-40-3-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-40-3-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (30,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-43-2-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-43-2-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-43-2-x.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (31,0,'2026-10-15 10:07:34','2026-10-15 10:07:34','','2026-08-03__cam_XX__shot-44-x-x','','inherit','open','closed','','2026-08-03__cam_xx__shot-44-x-x','','','2026-10-15 10:07:34','2026-10-15 10:07:34','',5,'http://film-portfolio.local/wp-content/uploads/el-dorado/2026-08-03__cam_XX__shot-44-x-x.jpg',0,'attachment','image/jpeg',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint unsigned NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint unsigned NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
