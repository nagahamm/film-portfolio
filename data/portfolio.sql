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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_postmeta` VALUES (48,5,'sections','a:2:{i:0;s:5:\"slate\";i:1;s:9:\"materials\";}');
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
INSERT INTO `wp_postmeta` VALUES (128,5,'sections_1_lead','実際に現場で使用した制作資料です。一部、権利上の理由で該当箇所を伏せています。');
INSERT INTO `wp_postmeta` VALUES (129,5,'_sections_1_lead','field_materials_lead');
INSERT INTO `wp_postmeta` VALUES (130,5,'sections_1_cards_0_label','ロケハン行程表');
INSERT INTO `wp_postmeta` VALUES (131,5,'_sections_1_cards_0_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (132,5,'sections_1_cards_0_label_en','Location Scouting Itinerary');
INSERT INTO `wp_postmeta` VALUES (133,5,'_sections_1_cards_0_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (134,5,'sections_1_cards_0_file','6');
INSERT INTO `wp_postmeta` VALUES (135,5,'_sections_1_cards_0_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (136,5,'sections_1_cards_0_anchor','');
INSERT INTO `wp_postmeta` VALUES (137,5,'_sections_1_cards_0_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (138,5,'sections_1_cards_0_link_words','');
INSERT INTO `wp_postmeta` VALUES (139,5,'_sections_1_cards_0_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (140,5,'sections_1_cards_1_label','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (141,5,'_sections_1_cards_1_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (142,5,'sections_1_cards_1_label_en','Shot List');
INSERT INTO `wp_postmeta` VALUES (143,5,'_sections_1_cards_1_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (144,5,'sections_1_cards_1_file','7');
INSERT INTO `wp_postmeta` VALUES (145,5,'_sections_1_cards_1_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (146,5,'sections_1_cards_1_anchor','shotlist');
INSERT INTO `wp_postmeta` VALUES (147,5,'_sections_1_cards_1_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (148,5,'sections_1_cards_1_link_words','ショットリスト');
INSERT INTO `wp_postmeta` VALUES (149,5,'_sections_1_cards_1_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (150,5,'sections_1_cards_2_label','香盤表');
INSERT INTO `wp_postmeta` VALUES (151,5,'_sections_1_cards_2_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (152,5,'sections_1_cards_2_label_en','Shooting Schedule');
INSERT INTO `wp_postmeta` VALUES (153,5,'_sections_1_cards_2_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (154,5,'sections_1_cards_2_file','8');
INSERT INTO `wp_postmeta` VALUES (155,5,'_sections_1_cards_2_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (156,5,'sections_1_cards_2_anchor','schedule');
INSERT INTO `wp_postmeta` VALUES (157,5,'_sections_1_cards_2_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (158,5,'sections_1_cards_2_link_words','香盤表');
INSERT INTO `wp_postmeta` VALUES (159,5,'_sections_1_cards_2_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (160,5,'sections_1_cards_3_label','持ち物リスト');
INSERT INTO `wp_postmeta` VALUES (161,5,'_sections_1_cards_3_label','field_materials_card_label');
INSERT INTO `wp_postmeta` VALUES (162,5,'sections_1_cards_3_label_en','Packing / Props List');
INSERT INTO `wp_postmeta` VALUES (163,5,'_sections_1_cards_3_label_en','field_materials_card_label_en');
INSERT INTO `wp_postmeta` VALUES (164,5,'sections_1_cards_3_file','9');
INSERT INTO `wp_postmeta` VALUES (165,5,'_sections_1_cards_3_file','field_materials_card_file');
INSERT INTO `wp_postmeta` VALUES (166,5,'sections_1_cards_3_anchor','');
INSERT INTO `wp_postmeta` VALUES (167,5,'_sections_1_cards_3_anchor','field_materials_card_anchor');
INSERT INTO `wp_postmeta` VALUES (168,5,'sections_1_cards_3_link_words','');
INSERT INTO `wp_postmeta` VALUES (169,5,'_sections_1_cards_3_link_words','field_materials_card_link_words');
INSERT INTO `wp_postmeta` VALUES (170,5,'sections_1_cards','4');
INSERT INTO `wp_postmeta` VALUES (171,5,'_sections_1_cards','field_materials_cards');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
