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
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_postmeta` VALUES (48,5,'sections','a:3:{i:0;s:5:\"slate\";i:1;s:5:\"craft\";i:2;s:9:\"materials\";}');
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
INSERT INTO `wp_postmeta` VALUES (72,5,'sections_0_cards_0_label','Title');
INSERT INTO `wp_postmeta` VALUES (73,5,'_sections_0_cards_0_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (74,5,'sections_0_cards_0_format','text');
INSERT INTO `wp_postmeta` VALUES (75,5,'_sections_0_cards_0_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (76,5,'sections_0_cards_0_value','エル・ドラド');
INSERT INTO `wp_postmeta` VALUES (77,5,'_sections_0_cards_0_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (78,5,'sections_0_cards_1_label','Runtime');
INSERT INTO `wp_postmeta` VALUES (79,5,'_sections_0_cards_1_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (80,5,'sections_0_cards_1_format','text');
INSERT INTO `wp_postmeta` VALUES (81,5,'_sections_0_cards_1_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (82,5,'sections_0_cards_1_value','03:05');
INSERT INTO `wp_postmeta` VALUES (83,5,'_sections_0_cards_1_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (84,5,'sections_0_cards_2_label','Genre');
INSERT INTO `wp_postmeta` VALUES (85,5,'_sections_0_cards_2_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (86,5,'sections_0_cards_2_format','text');
INSERT INTO `wp_postmeta` VALUES (87,5,'_sections_0_cards_2_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (88,5,'sections_0_cards_2_value','冒険ファンタジー(黄金の羊毛)');
INSERT INTO `wp_postmeta` VALUES (89,5,'_sections_0_cards_2_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (90,5,'sections_0_cards_3_label','Role');
INSERT INTO `wp_postmeta` VALUES (91,5,'_sections_0_cards_3_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (92,5,'sections_0_cards_3_format','text');
INSERT INTO `wp_postmeta` VALUES (93,5,'_sections_0_cards_3_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (94,5,'sections_0_cards_3_value','脚本 / 監督 / 主演(コア)\n撮影(技術) / 編集(ポスプロ)\n衣装 / 美術(小道具) / 制作進行(AD)');
INSERT INTO `wp_postmeta` VALUES (95,5,'_sections_0_cards_3_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (96,5,'sections_0_cards_4_label','Camera');
INSERT INTO `wp_postmeta` VALUES (97,5,'_sections_0_cards_4_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (98,5,'sections_0_cards_4_format','list');
INSERT INTO `wp_postmeta` VALUES (99,5,'_sections_0_cards_4_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (100,5,'sections_0_cards_4_value','iPhone 16 Pro Max(Blackmagic Camera)\nDJI Osmo Pocket 3\nInsta360 GO 3S');
INSERT INTO `wp_postmeta` VALUES (101,5,'_sections_0_cards_4_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (102,5,'sections_0_cards_5_label','Mic');
INSERT INTO `wp_postmeta` VALUES (103,5,'_sections_0_cards_5_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (104,5,'sections_0_cards_5_format','text');
INSERT INTO `wp_postmeta` VALUES (105,5,'_sections_0_cards_5_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (106,5,'sections_0_cards_5_value','DJI Mic Mini');
INSERT INTO `wp_postmeta` VALUES (107,5,'_sections_0_cards_5_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (108,5,'sections_0_cards_6_label','Location');
INSERT INTO `wp_postmeta` VALUES (109,5,'_sections_0_cards_6_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (110,5,'sections_0_cards_6_format','list');
INSERT INTO `wp_postmeta` VALUES (111,5,'_sections_0_cards_6_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (112,5,'sections_0_cards_6_value','Cedar Creek Falls\nTwin Falls\nMooloolaba Beach\nGriffith University station\nGardners Falls');
INSERT INTO `wp_postmeta` VALUES (113,5,'_sections_0_cards_6_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (114,5,'sections_0_cards_7_label','Crew');
INSERT INTO `wp_postmeta` VALUES (115,5,'_sections_0_cards_7_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (116,5,'sections_0_cards_7_format','text');
INSERT INTO `wp_postmeta` VALUES (117,5,'_sections_0_cards_7_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (118,5,'sections_0_cards_7_value','計6人');
INSERT INTO `wp_postmeta` VALUES (119,5,'_sections_0_cards_7_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (120,5,'sections_0_cards_8_label','Tools');
INSERT INTO `wp_postmeta` VALUES (121,5,'_sections_0_cards_8_label','field_slate_card_label');
INSERT INTO `wp_postmeta` VALUES (122,5,'sections_0_cards_8_format','list');
INSERT INTO `wp_postmeta` VALUES (123,5,'_sections_0_cards_8_format','field_slate_card_format');
INSERT INTO `wp_postmeta` VALUES (124,5,'sections_0_cards_8_value','DaVinci Resolve(編集・カラー)\nGoogleスプレッドシート(香盤表)\nMilanote(ショットリスト)');
INSERT INTO `wp_postmeta` VALUES (125,5,'_sections_0_cards_8_value','field_slate_card_value');
INSERT INTO `wp_postmeta` VALUES (126,5,'sections_0_cards','9');
INSERT INTO `wp_postmeta` VALUES (127,5,'_sections_0_cards','field_slate_cards');
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
INSERT INTO `wp_postmeta` VALUES (192,5,'sections_1_cards_0_title','Director');
INSERT INTO `wp_postmeta` VALUES (193,5,'_sections_1_cards_0_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (194,5,'sections_1_cards_0_label','Director');
INSERT INTO `wp_postmeta` VALUES (195,5,'_sections_1_cards_0_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (196,5,'sections_1_cards_0_text','全体演出・画コンテ策定・キャスト指示');
INSERT INTO `wp_postmeta` VALUES (197,5,'_sections_1_cards_0_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (198,5,'sections_1_cards_0_highlight','');
INSERT INTO `wp_postmeta` VALUES (199,5,'_sections_1_cards_0_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (200,5,'sections_1_cards_0_photos_0_image','10');
INSERT INTO `wp_postmeta` VALUES (201,5,'_sections_1_cards_0_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (202,5,'sections_1_cards_0_photos_0_alt','現場で指示を出す様子');
INSERT INTO `wp_postmeta` VALUES (203,5,'_sections_1_cards_0_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (204,5,'sections_1_cards_0_photos','1');
INSERT INTO `wp_postmeta` VALUES (205,5,'_sections_1_cards_0_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (206,5,'sections_1_cards_0_carousel','0');
INSERT INTO `wp_postmeta` VALUES (207,5,'_sections_1_cards_0_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (208,5,'sections_1_cards_1_title','Script');
INSERT INTO `wp_postmeta` VALUES (209,5,'_sections_1_cards_1_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (210,5,'sections_1_cards_1_label','Script');
INSERT INTO `wp_postmeta` VALUES (211,5,'_sections_1_cards_1_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (212,5,'sections_1_cards_1_text','Save the Cat等の脚本術 / Geminiとの壁打ち');
INSERT INTO `wp_postmeta` VALUES (213,5,'_sections_1_cards_1_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (214,5,'sections_1_cards_1_highlight','');
INSERT INTO `wp_postmeta` VALUES (215,5,'_sections_1_cards_1_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (216,5,'sections_1_cards_1_photos','');
INSERT INTO `wp_postmeta` VALUES (217,5,'_sections_1_cards_1_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (218,5,'sections_1_cards_1_carousel','0');
INSERT INTO `wp_postmeta` VALUES (219,5,'_sections_1_cards_1_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (220,5,'sections_1_cards_2_title','Camera');
INSERT INTO `wp_postmeta` VALUES (221,5,'_sections_1_cards_2_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (222,5,'sections_1_cards_2_label','Camera');
INSERT INTO `wp_postmeta` VALUES (223,5,'_sections_1_cards_2_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (224,5,'sections_1_cards_2_text','iPhone 16 Pro Max(Blackmagic Camera) / DJI Osmo Pocket 3 / Insta360 GO 3S');
INSERT INTO `wp_postmeta` VALUES (225,5,'_sections_1_cards_2_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (226,5,'sections_1_cards_2_highlight','iPhone 16 Pro Max(Blackmagic Camera)');
INSERT INTO `wp_postmeta` VALUES (227,5,'_sections_1_cards_2_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (228,5,'sections_1_cards_2_photos_0_image','11');
INSERT INTO `wp_postmeta` VALUES (229,5,'_sections_1_cards_2_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (230,5,'sections_1_cards_2_photos_0_alt','Blackmagic Cameraアプリでの撮影画面');
INSERT INTO `wp_postmeta` VALUES (231,5,'_sections_1_cards_2_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (232,5,'sections_1_cards_2_photos','1');
INSERT INTO `wp_postmeta` VALUES (233,5,'_sections_1_cards_2_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (234,5,'sections_1_cards_2_carousel','0');
INSERT INTO `wp_postmeta` VALUES (235,5,'_sections_1_cards_2_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (236,5,'sections_1_cards_3_title','Audio');
INSERT INTO `wp_postmeta` VALUES (237,5,'_sections_1_cards_3_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (238,5,'sections_1_cards_3_label','Audio');
INSERT INTO `wp_postmeta` VALUES (239,5,'_sections_1_cards_3_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (240,5,'sections_1_cards_3_text','DJI Mic Mini');
INSERT INTO `wp_postmeta` VALUES (241,5,'_sections_1_cards_3_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (242,5,'sections_1_cards_3_highlight','');
INSERT INTO `wp_postmeta` VALUES (243,5,'_sections_1_cards_3_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (244,5,'sections_1_cards_3_photos','');
INSERT INTO `wp_postmeta` VALUES (245,5,'_sections_1_cards_3_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (246,5,'sections_1_cards_3_carousel','0');
INSERT INTO `wp_postmeta` VALUES (247,5,'_sections_1_cards_3_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (248,5,'sections_1_cards_4_title','Edit');
INSERT INTO `wp_postmeta` VALUES (249,5,'_sections_1_cards_4_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (250,5,'sections_1_cards_4_label','Edit');
INSERT INTO `wp_postmeta` VALUES (251,5,'_sections_1_cards_4_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (252,5,'sections_1_cards_4_text','DaVinci Resolve による編集・構成');
INSERT INTO `wp_postmeta` VALUES (253,5,'_sections_1_cards_4_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (254,5,'sections_1_cards_4_highlight','');
INSERT INTO `wp_postmeta` VALUES (255,5,'_sections_1_cards_4_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (256,5,'sections_1_cards_4_photos_0_image','12');
INSERT INTO `wp_postmeta` VALUES (257,5,'_sections_1_cards_4_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (258,5,'sections_1_cards_4_photos_0_alt','DaVinci Resolveのマルチトラックタイムライン画面');
INSERT INTO `wp_postmeta` VALUES (259,5,'_sections_1_cards_4_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (260,5,'sections_1_cards_4_photos','1');
INSERT INTO `wp_postmeta` VALUES (261,5,'_sections_1_cards_4_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (262,5,'sections_1_cards_4_carousel','0');
INSERT INTO `wp_postmeta` VALUES (263,5,'_sections_1_cards_4_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (264,5,'sections_1_cards_5_title','Color');
INSERT INTO `wp_postmeta` VALUES (265,5,'_sections_1_cards_5_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (266,5,'sections_1_cards_5_label','Color');
INSERT INTO `wp_postmeta` VALUES (267,5,'_sections_1_cards_5_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (268,5,'sections_1_cards_5_text','カラーコレクション / カラーグレーディング');
INSERT INTO `wp_postmeta` VALUES (269,5,'_sections_1_cards_5_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (270,5,'sections_1_cards_5_highlight','');
INSERT INTO `wp_postmeta` VALUES (271,5,'_sections_1_cards_5_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (272,5,'sections_1_cards_5_photos_0_image','13');
INSERT INTO `wp_postmeta` VALUES (273,5,'_sections_1_cards_5_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (274,5,'sections_1_cards_5_photos_0_alt','DaVinci Resolveのカラーページ、ノードとスコープ画面');
INSERT INTO `wp_postmeta` VALUES (275,5,'_sections_1_cards_5_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (276,5,'sections_1_cards_5_photos','1');
INSERT INTO `wp_postmeta` VALUES (277,5,'_sections_1_cards_5_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (278,5,'sections_1_cards_5_carousel','0');
INSERT INTO `wp_postmeta` VALUES (279,5,'_sections_1_cards_5_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (280,5,'sections_1_cards_6_title','Acting / Main Cast');
INSERT INTO `wp_postmeta` VALUES (281,5,'_sections_1_cards_6_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (282,5,'sections_1_cards_6_label','Acting');
INSERT INTO `wp_postmeta` VALUES (283,5,'_sections_1_cards_6_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (284,5,'sections_1_cards_6_text','主演としての演技・現場でのセルフディレクション');
INSERT INTO `wp_postmeta` VALUES (285,5,'_sections_1_cards_6_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (286,5,'sections_1_cards_6_highlight','');
INSERT INTO `wp_postmeta` VALUES (287,5,'_sections_1_cards_6_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (288,5,'sections_1_cards_6_photos_0_image','14');
INSERT INTO `wp_postmeta` VALUES (289,5,'_sections_1_cards_6_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (290,5,'sections_1_cards_6_photos_0_alt','主演としての演技');
INSERT INTO `wp_postmeta` VALUES (291,5,'_sections_1_cards_6_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (292,5,'sections_1_cards_6_photos_1_image','15');
INSERT INTO `wp_postmeta` VALUES (293,5,'_sections_1_cards_6_photos_1_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (294,5,'sections_1_cards_6_photos_1_alt','現場でのセルフディレクション');
INSERT INTO `wp_postmeta` VALUES (295,5,'_sections_1_cards_6_photos_1_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (296,5,'sections_1_cards_6_photos','2');
INSERT INTO `wp_postmeta` VALUES (297,5,'_sections_1_cards_6_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (298,5,'sections_1_cards_6_carousel','0');
INSERT INTO `wp_postmeta` VALUES (299,5,'_sections_1_cards_6_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (300,5,'sections_1_cards_7_title','Art / Props');
INSERT INTO `wp_postmeta` VALUES (301,5,'_sections_1_cards_7_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (302,5,'sections_1_cards_7_label','Props');
INSERT INTO `wp_postmeta` VALUES (303,5,'_sections_1_cards_7_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (304,5,'sections_1_cards_7_text','小道具の調達・準備');
INSERT INTO `wp_postmeta` VALUES (305,5,'_sections_1_cards_7_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (306,5,'sections_1_cards_7_highlight','');
INSERT INTO `wp_postmeta` VALUES (307,5,'_sections_1_cards_7_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (308,5,'sections_1_cards_7_photos_0_image','16');
INSERT INTO `wp_postmeta` VALUES (309,5,'_sections_1_cards_7_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (310,5,'sections_1_cards_7_photos_0_alt','宝の地図の小道具');
INSERT INTO `wp_postmeta` VALUES (311,5,'_sections_1_cards_7_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (312,5,'sections_1_cards_7_photos','1');
INSERT INTO `wp_postmeta` VALUES (313,5,'_sections_1_cards_7_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (314,5,'sections_1_cards_7_carousel','1');
INSERT INTO `wp_postmeta` VALUES (315,5,'_sections_1_cards_7_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (316,5,'sections_1_cards_8_title','Wardrobe');
INSERT INTO `wp_postmeta` VALUES (317,5,'_sections_1_cards_8_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (318,5,'sections_1_cards_8_label','');
INSERT INTO `wp_postmeta` VALUES (319,5,'_sections_1_cards_8_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (320,5,'sections_1_cards_8_text','衣装の選定・買い出し');
INSERT INTO `wp_postmeta` VALUES (321,5,'_sections_1_cards_8_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (322,5,'sections_1_cards_8_highlight','');
INSERT INTO `wp_postmeta` VALUES (323,5,'_sections_1_cards_8_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (324,5,'sections_1_cards_8_photos_0_image','17');
INSERT INTO `wp_postmeta` VALUES (325,5,'_sections_1_cards_8_photos_0_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (326,5,'sections_1_cards_8_photos_0_alt','冒険の始まりと世界観を提示するアドベンチャー・探検家スタイルの衣装');
INSERT INTO `wp_postmeta` VALUES (327,5,'_sections_1_cards_8_photos_0_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (328,5,'sections_1_cards_8_photos_1_image','18');
INSERT INTO `wp_postmeta` VALUES (329,5,'_sections_1_cards_8_photos_1_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (330,5,'sections_1_cards_8_photos_1_alt','過去シーンにおける登場人物の立場・上下関係の逆転を可視化する衣装');
INSERT INTO `wp_postmeta` VALUES (331,5,'_sections_1_cards_8_photos_1_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (332,5,'sections_1_cards_8_photos_2_image','19');
INSERT INTO `wp_postmeta` VALUES (333,5,'_sections_1_cards_8_photos_2_image','field_craft_card_photo_image');
INSERT INTO `wp_postmeta` VALUES (334,5,'sections_1_cards_8_photos_2_alt','回想シーンにおける片方の記憶のみが鮮明に残る主観的歪みを表現した衣装');
INSERT INTO `wp_postmeta` VALUES (335,5,'_sections_1_cards_8_photos_2_alt','field_craft_card_photo_alt');
INSERT INTO `wp_postmeta` VALUES (336,5,'sections_1_cards_8_photos','3');
INSERT INTO `wp_postmeta` VALUES (337,5,'_sections_1_cards_8_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (338,5,'sections_1_cards_8_carousel','0');
INSERT INTO `wp_postmeta` VALUES (339,5,'_sections_1_cards_8_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (340,5,'sections_1_cards_9_title','Production / AD');
INSERT INTO `wp_postmeta` VALUES (341,5,'_sections_1_cards_9_title','field_craft_card_title');
INSERT INTO `wp_postmeta` VALUES (342,5,'sections_1_cards_9_label','AD');
INSERT INTO `wp_postmeta` VALUES (343,5,'_sections_1_cards_9_label','field_craft_card_label');
INSERT INTO `wp_postmeta` VALUES (344,5,'sections_1_cards_9_text','香盤表・ショットリスト・スケジュール管理、食事・移動手配などの制作進行');
INSERT INTO `wp_postmeta` VALUES (345,5,'_sections_1_cards_9_text','field_craft_card_text');
INSERT INTO `wp_postmeta` VALUES (346,5,'sections_1_cards_9_highlight','');
INSERT INTO `wp_postmeta` VALUES (347,5,'_sections_1_cards_9_highlight','field_craft_card_highlight');
INSERT INTO `wp_postmeta` VALUES (348,5,'sections_1_cards_9_photos','');
INSERT INTO `wp_postmeta` VALUES (349,5,'_sections_1_cards_9_photos','field_craft_card_photos');
INSERT INTO `wp_postmeta` VALUES (350,5,'sections_1_cards_9_carousel','0');
INSERT INTO `wp_postmeta` VALUES (351,5,'_sections_1_cards_9_carousel','field_craft_card_carousel');
INSERT INTO `wp_postmeta` VALUES (352,5,'sections_1_cards','10');
INSERT INTO `wp_postmeta` VALUES (353,5,'_sections_1_cards','field_craft_cards');
INSERT INTO `wp_postmeta` VALUES (354,5,'sections_2_lead','実際に現場で使用した制作資料です。一部、権利上の理由で該当箇所を伏せています。');
INSERT INTO `wp_postmeta` VALUES (355,5,'_sections_2_lead','field_materials_lead');
INSERT INTO `wp_postmeta` VALUES (356,5,'sections_2_cards_0_label','ロケハン行程表');
INSERT INTO `wp_postmeta` VALUES (357,5,'_sections_2_cards_0_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (358,5,'sections_2_cards_0_label_en','Location Scouting Itinerary');
INSERT INTO `wp_postmeta` VALUES (359,5,'_sections_2_cards_0_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (360,5,'sections_2_cards_0_file','6');
INSERT INTO `wp_postmeta` VALUES (361,5,'_sections_2_cards_0_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (362,5,'sections_2_cards_0_anchor','');
INSERT INTO `wp_postmeta` VALUES (363,5,'_sections_2_cards_0_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (364,5,'sections_2_cards_0_link_words','');
INSERT INTO `wp_postmeta` VALUES (365,5,'_sections_2_cards_0_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (366,5,'sections_2_cards_1_label','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (367,5,'_sections_2_cards_1_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (368,5,'sections_2_cards_1_label_en','Shot List');
INSERT INTO `wp_postmeta` VALUES (369,5,'_sections_2_cards_1_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (370,5,'sections_2_cards_1_file','7');
INSERT INTO `wp_postmeta` VALUES (371,5,'_sections_2_cards_1_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (372,5,'sections_2_cards_1_anchor','shotlist');
INSERT INTO `wp_postmeta` VALUES (373,5,'_sections_2_cards_1_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (374,5,'sections_2_cards_1_link_words','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (375,5,'_sections_2_cards_1_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (376,5,'sections_2_cards_2_label','香盤表');
INSERT INTO `wp_postmeta` VALUES (377,5,'_sections_2_cards_2_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (378,5,'sections_2_cards_2_label_en','Shooting Schedule');
INSERT INTO `wp_postmeta` VALUES (379,5,'_sections_2_cards_2_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (380,5,'sections_2_cards_2_file','8');
INSERT INTO `wp_postmeta` VALUES (381,5,'_sections_2_cards_2_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (382,5,'sections_2_cards_2_anchor','schedule');
INSERT INTO `wp_postmeta` VALUES (383,5,'_sections_2_cards_2_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (384,5,'sections_2_cards_2_link_words','香盤表');
INSERT INTO `wp_postmeta` VALUES (385,5,'_sections_2_cards_2_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (386,5,'sections_2_cards_3_label','持ち物リスト');
INSERT INTO `wp_postmeta` VALUES (387,5,'_sections_2_cards_3_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (388,5,'sections_2_cards_3_label_en','Packing / Props List');
INSERT INTO `wp_postmeta` VALUES (389,5,'_sections_2_cards_3_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (390,5,'sections_2_cards_3_file','9');
INSERT INTO `wp_postmeta` VALUES (391,5,'_sections_2_cards_3_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (392,5,'sections_2_cards_3_anchor','');
INSERT INTO `wp_postmeta` VALUES (393,5,'_sections_2_cards_3_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (394,5,'sections_2_cards_3_link_words','');
INSERT INTO `wp_postmeta` VALUES (395,5,'_sections_2_cards_3_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (396,5,'sections_2_cards','4');
INSERT INTO `wp_postmeta` VALUES (397,5,'_sections_2_cards','field_materials_cards');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
