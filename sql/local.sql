-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: ::1    Database: local
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint unsigned NOT NULL DEFAULT '0',
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Um comentarista do WordPress','wapuu@wordpress.example','https://br.wordpress.org/','','2026-08-23 23:22:34','2026-08-24 02:22:34','Oi, isto é um comentário.\nPara iniciar a moderar, editar e excluir comentários, visite a tela Comentários no painel.\nOs avatares dos comentaristas vêm do <a href=\"https://br.gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint unsigned NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'cron','a:13:{i:1789704846;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1789705354;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1789739200;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1789744954;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1789746754;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1789782400;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1789782401;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1789784555;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:41:\"wp_privacy_personal_data_cleanup_requests\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1789787294;a:1:{s:26:\"importer_scheduled_cleanup\";a:1:{s:32:\"68ba585cb7c507adc1ede47f71277f96\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:1:{i:0;i:1319;}}}}i:1789788856;a:1:{s:27:\"acf_update_site_health_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1790043755;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1790048044;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on');
INSERT INTO `wp_options` VALUES (2,'siteurl','http://csamba.local','on');
INSERT INTO `wp_options` VALUES (3,'home','http://csamba.local','on');
INSERT INTO `wp_options` VALUES (4,'blogname','csamba','on');
INSERT INTO `wp_options` VALUES (5,'blogdescription','','on');
INSERT INTO `wp_options` VALUES (6,'users_can_register','0','on');
INSERT INTO `wp_options` VALUES (7,'admin_email','tyarajuterra@hotmail.com','on');
INSERT INTO `wp_options` VALUES (8,'start_of_week','1','on');
INSERT INTO `wp_options` VALUES (9,'use_balanceTags','0','on');
INSERT INTO `wp_options` VALUES (10,'use_smilies','1','on');
INSERT INTO `wp_options` VALUES (11,'require_name_email','1','on');
INSERT INTO `wp_options` VALUES (12,'comments_notify','1','on');
INSERT INTO `wp_options` VALUES (13,'posts_per_rss','10','on');
INSERT INTO `wp_options` VALUES (14,'rss_use_excerpt','0','on');
INSERT INTO `wp_options` VALUES (15,'mailserver_url','mail.example.com','on');
INSERT INTO `wp_options` VALUES (16,'mailserver_login','login@example.com','on');
INSERT INTO `wp_options` VALUES (17,'mailserver_pass','','on');
INSERT INTO `wp_options` VALUES (18,'mailserver_port','110','on');
INSERT INTO `wp_options` VALUES (19,'default_category','1','on');
INSERT INTO `wp_options` VALUES (20,'default_comment_status','open','on');
INSERT INTO `wp_options` VALUES (21,'default_ping_status','open','on');
INSERT INTO `wp_options` VALUES (22,'default_pingback_flag','1','on');
INSERT INTO `wp_options` VALUES (23,'posts_per_page','10','on');
INSERT INTO `wp_options` VALUES (24,'date_format','j \\d\\e F \\d\\e Y','on');
INSERT INTO `wp_options` VALUES (25,'time_format','H:i','on');
INSERT INTO `wp_options` VALUES (26,'links_updated_date_format','j \\d\\e F \\d\\e Y, H:i','on');
INSERT INTO `wp_options` VALUES (27,'comment_moderation','0','on');
INSERT INTO `wp_options` VALUES (28,'moderation_notify','1','on');
INSERT INTO `wp_options` VALUES (29,'permalink_structure','/%postname%/','on');
INSERT INTO `wp_options` VALUES (30,'rewrite_rules','a:208:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:9:\"bandas/?$\";s:25:\"index.php?post_type=banda\";s:39:\"bandas/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=banda&feed=$matches[1]\";s:34:\"bandas/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?post_type=banda&feed=$matches[1]\";s:26:\"bandas/page/([0-9]{1,})/?$\";s:43:\"index.php?post_type=banda&paged=$matches[1]\";s:7:\"casa/?$\";s:24:\"index.php?post_type=casa\";s:37:\"casa/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=casa&feed=$matches[1]\";s:32:\"casa/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=casa&feed=$matches[1]\";s:24:\"casa/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=casa&paged=$matches[1]\";s:9:\"agenda/?$\";s:26:\"index.php?post_type=evento\";s:39:\"agenda/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=evento&feed=$matches[1]\";s:34:\"agenda/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=evento&feed=$matches[1]\";s:26:\"agenda/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=evento&paged=$matches[1]\";s:9:\"coluna/?$\";s:26:\"index.php?post_type=coluna\";s:39:\"coluna/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=coluna&feed=$matches[1]\";s:34:\"coluna/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=coluna&feed=$matches[1]\";s:26:\"coluna/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=coluna&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"bandas/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"bandas/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"bandas/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"bandas/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"bandas/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"bandas/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"bandas/([^/]+)/embed/?$\";s:38:\"index.php?banda=$matches[1]&embed=true\";s:27:\"bandas/([^/]+)/trackback/?$\";s:32:\"index.php?banda=$matches[1]&tb=1\";s:47:\"bandas/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?banda=$matches[1]&feed=$matches[2]\";s:42:\"bandas/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?banda=$matches[1]&feed=$matches[2]\";s:35:\"bandas/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?banda=$matches[1]&paged=$matches[2]\";s:42:\"bandas/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?banda=$matches[1]&cpage=$matches[2]\";s:31:\"bandas/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?banda=$matches[1]&page=$matches[2]\";s:23:\"bandas/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"bandas/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"bandas/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"bandas/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"bandas/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"bandas/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:32:\"casa/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"casa/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"casa/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"casa/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"casa/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"casa/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"casa/([^/]+)/embed/?$\";s:37:\"index.php?casa=$matches[1]&embed=true\";s:25:\"casa/([^/]+)/trackback/?$\";s:31:\"index.php?casa=$matches[1]&tb=1\";s:45:\"casa/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?casa=$matches[1]&feed=$matches[2]\";s:40:\"casa/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?casa=$matches[1]&feed=$matches[2]\";s:33:\"casa/([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?casa=$matches[1]&paged=$matches[2]\";s:40:\"casa/([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?casa=$matches[1]&cpage=$matches[2]\";s:29:\"casa/([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?casa=$matches[1]&page=$matches[2]\";s:21:\"casa/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:31:\"casa/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:51:\"casa/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"casa/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:46:\"casa/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:27:\"casa/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"agenda/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"agenda/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"agenda/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"agenda/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"agenda/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"agenda/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"agenda/([^/]+)/embed/?$\";s:39:\"index.php?evento=$matches[1]&embed=true\";s:27:\"agenda/([^/]+)/trackback/?$\";s:33:\"index.php?evento=$matches[1]&tb=1\";s:47:\"agenda/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?evento=$matches[1]&feed=$matches[2]\";s:42:\"agenda/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?evento=$matches[1]&feed=$matches[2]\";s:35:\"agenda/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?evento=$matches[1]&paged=$matches[2]\";s:42:\"agenda/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?evento=$matches[1]&cpage=$matches[2]\";s:31:\"agenda/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?evento=$matches[1]&page=$matches[2]\";s:23:\"agenda/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"agenda/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"agenda/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"agenda/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"agenda/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"agenda/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"coluna/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"coluna/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"coluna/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"coluna/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"coluna/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"coluna/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"coluna/([^/]+)/embed/?$\";s:39:\"index.php?coluna=$matches[1]&embed=true\";s:27:\"coluna/([^/]+)/trackback/?$\";s:33:\"index.php?coluna=$matches[1]&tb=1\";s:47:\"coluna/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?coluna=$matches[1]&feed=$matches[2]\";s:42:\"coluna/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?coluna=$matches[1]&feed=$matches[2]\";s:35:\"coluna/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?coluna=$matches[1]&paged=$matches[2]\";s:42:\"coluna/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?coluna=$matches[1]&cpage=$matches[2]\";s:31:\"coluna/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?coluna=$matches[1]&page=$matches[2]\";s:23:\"coluna/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"coluna/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"coluna/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"coluna/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"coluna/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"coluna/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"destaque/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"destaque/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"destaque/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"destaque/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"destaque/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"destaque/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"destaque/([^/]+)/embed/?$\";s:41:\"index.php?destaque=$matches[1]&embed=true\";s:29:\"destaque/([^/]+)/trackback/?$\";s:35:\"index.php?destaque=$matches[1]&tb=1\";s:37:\"destaque/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?destaque=$matches[1]&paged=$matches[2]\";s:44:\"destaque/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?destaque=$matches[1]&cpage=$matches[2]\";s:33:\"destaque/([^/]+)(?:/([0-9]+))?/?$\";s:47:\"index.php?destaque=$matches[1]&page=$matches[2]\";s:25:\"destaque/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"destaque/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"destaque/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"destaque/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"destaque/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"destaque/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:47:\"genero/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?genero=$matches[1]&feed=$matches[2]\";s:42:\"genero/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?genero=$matches[1]&feed=$matches[2]\";s:23:\"genero/([^/]+)/embed/?$\";s:39:\"index.php?genero=$matches[1]&embed=true\";s:35:\"genero/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?genero=$matches[1]&paged=$matches[2]\";s:17:\"genero/([^/]+)/?$\";s:28:\"index.php?genero=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on');
INSERT INTO `wp_options` VALUES (31,'hack_file','0','on');
INSERT INTO `wp_options` VALUES (32,'blog_charset','UTF-8','on');
INSERT INTO `wp_options` VALUES (33,'moderation_keys','','off');
INSERT INTO `wp_options` VALUES (34,'active_plugins','a:2:{i:0;s:30:\"advanced-custom-fields/acf.php\";i:1;s:41:\"wordpress-importer/wordpress-importer.php\";}','on');
INSERT INTO `wp_options` VALUES (35,'category_base','','on');
INSERT INTO `wp_options` VALUES (36,'ping_sites','https://rpc.pingomatic.com/','on');
INSERT INTO `wp_options` VALUES (37,'comment_max_links','2','on');
INSERT INTO `wp_options` VALUES (38,'gmt_offset','0','on');
INSERT INTO `wp_options` VALUES (39,'default_email_category','1','on');
INSERT INTO `wp_options` VALUES (40,'recently_edited','','off');
INSERT INTO `wp_options` VALUES (41,'template','csamba','on');
INSERT INTO `wp_options` VALUES (42,'stylesheet','csamba','on');
INSERT INTO `wp_options` VALUES (43,'comment_registration','0','on');
INSERT INTO `wp_options` VALUES (44,'html_type','text/html','on');
INSERT INTO `wp_options` VALUES (45,'use_trackback','0','on');
INSERT INTO `wp_options` VALUES (46,'default_role','subscriber','on');
INSERT INTO `wp_options` VALUES (47,'db_version','61833','on');
INSERT INTO `wp_options` VALUES (48,'uploads_use_yearmonth_folders','1','on');
INSERT INTO `wp_options` VALUES (49,'upload_path','','on');
INSERT INTO `wp_options` VALUES (50,'blog_public','1','on');
INSERT INTO `wp_options` VALUES (51,'default_link_category','2','on');
INSERT INTO `wp_options` VALUES (52,'show_on_front','posts','on');
INSERT INTO `wp_options` VALUES (53,'tag_base','','on');
INSERT INTO `wp_options` VALUES (54,'show_avatars','1','on');
INSERT INTO `wp_options` VALUES (55,'avatar_rating','G','on');
INSERT INTO `wp_options` VALUES (56,'upload_url_path','','on');
INSERT INTO `wp_options` VALUES (57,'thumbnail_size_w','150','on');
INSERT INTO `wp_options` VALUES (58,'thumbnail_size_h','150','on');
INSERT INTO `wp_options` VALUES (59,'thumbnail_crop','1','on');
INSERT INTO `wp_options` VALUES (60,'medium_size_w','300','on');
INSERT INTO `wp_options` VALUES (61,'medium_size_h','300','on');
INSERT INTO `wp_options` VALUES (62,'avatar_default','mystery','on');
INSERT INTO `wp_options` VALUES (63,'large_size_w','1024','on');
INSERT INTO `wp_options` VALUES (64,'large_size_h','1024','on');
INSERT INTO `wp_options` VALUES (65,'image_default_link_type','none','on');
INSERT INTO `wp_options` VALUES (66,'image_default_size','','on');
INSERT INTO `wp_options` VALUES (67,'image_default_align','','on');
INSERT INTO `wp_options` VALUES (68,'close_comments_for_old_posts','0','on');
INSERT INTO `wp_options` VALUES (69,'close_comments_days_old','14','on');
INSERT INTO `wp_options` VALUES (70,'thread_comments','1','on');
INSERT INTO `wp_options` VALUES (71,'thread_comments_depth','5','on');
INSERT INTO `wp_options` VALUES (72,'page_comments','0','on');
INSERT INTO `wp_options` VALUES (73,'comments_per_page','50','on');
INSERT INTO `wp_options` VALUES (74,'default_comments_page','newest','on');
INSERT INTO `wp_options` VALUES (75,'comment_order','asc','on');
INSERT INTO `wp_options` VALUES (76,'sticky_posts','a:0:{}','on');
INSERT INTO `wp_options` VALUES (77,'widget_categories','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (78,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (79,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (80,'uninstall_plugins','a:0:{}','off');
INSERT INTO `wp_options` VALUES (81,'timezone_string','America/Sao_Paulo','on');
INSERT INTO `wp_options` VALUES (82,'page_for_posts','0','on');
INSERT INTO `wp_options` VALUES (83,'page_on_front','0','on');
INSERT INTO `wp_options` VALUES (84,'default_post_format','0','on');
INSERT INTO `wp_options` VALUES (85,'link_manager_enabled','0','on');
INSERT INTO `wp_options` VALUES (86,'finished_splitting_shared_terms','1','on');
INSERT INTO `wp_options` VALUES (87,'site_icon','0','on');
INSERT INTO `wp_options` VALUES (88,'medium_large_size_w','768','on');
INSERT INTO `wp_options` VALUES (89,'medium_large_size_h','0','on');
INSERT INTO `wp_options` VALUES (90,'wp_page_for_privacy_policy','3','on');
INSERT INTO `wp_options` VALUES (91,'show_comments_cookies_opt_in','1','on');
INSERT INTO `wp_options` VALUES (92,'admin_email_lifespan','1803090154','on');
INSERT INTO `wp_options` VALUES (93,'disallowed_keys','','off');
INSERT INTO `wp_options` VALUES (94,'comment_previously_approved','1','on');
INSERT INTO `wp_options` VALUES (95,'auto_plugin_theme_update_emails','a:0:{}','off');
INSERT INTO `wp_options` VALUES (96,'auto_update_core_dev','enabled','on');
INSERT INTO `wp_options` VALUES (97,'auto_update_core_minor','enabled','on');
INSERT INTO `wp_options` VALUES (98,'auto_update_core_major','enabled','on');
INSERT INTO `wp_options` VALUES (99,'wp_force_deactivated_plugins','a:0:{}','on');
INSERT INTO `wp_options` VALUES (100,'wp_attachment_pages_enabled','0','on');
INSERT INTO `wp_options` VALUES (101,'wp_notes_notify','1','on');
INSERT INTO `wp_options` VALUES (102,'initial_db_version','61833','on');
INSERT INTO `wp_options` VALUES (103,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','on');
INSERT INTO `wp_options` VALUES (104,'fresh_site','0','off');
INSERT INTO `wp_options` VALUES (105,'user_count','1','off');
INSERT INTO `wp_options` VALUES (106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Posts recentes</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:224:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Comentários</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arquivos</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categorias</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (107,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','auto');
INSERT INTO `wp_options` VALUES (108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto');
INSERT INTO `wp_options` VALUES (122,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:3:\"7.1\";s:5:\"files\";a:624:{i:0;s:31:\"accordion-heading/style-rtl.css\";i:1;s:35:\"accordion-heading/style-rtl.min.css\";i:2;s:27:\"accordion-heading/style.css\";i:3;s:31:\"accordion-heading/style.min.css\";i:4;s:28:\"accordion-item/style-rtl.css\";i:5;s:32:\"accordion-item/style-rtl.min.css\";i:6;s:24:\"accordion-item/style.css\";i:7;s:28:\"accordion-item/style.min.css\";i:8;s:29:\"accordion-panel/style-rtl.css\";i:9;s:33:\"accordion-panel/style-rtl.min.css\";i:10;s:25:\"accordion-panel/style.css\";i:11;s:29:\"accordion-panel/style.min.css\";i:12;s:23:\"accordion/style-rtl.css\";i:13;s:27:\"accordion/style-rtl.min.css\";i:14;s:19:\"accordion/style.css\";i:15;s:23:\"accordion/style.min.css\";i:16;s:22:\"archives/style-rtl.css\";i:17;s:26:\"archives/style-rtl.min.css\";i:18;s:18:\"archives/style.css\";i:19;s:22:\"archives/style.min.css\";i:20;s:20:\"audio/editor-rtl.css\";i:21;s:24:\"audio/editor-rtl.min.css\";i:22;s:16:\"audio/editor.css\";i:23;s:20:\"audio/editor.min.css\";i:24;s:19:\"audio/style-rtl.css\";i:25;s:23:\"audio/style-rtl.min.css\";i:26;s:15:\"audio/style.css\";i:27;s:19:\"audio/style.min.css\";i:28;s:19:\"audio/theme-rtl.css\";i:29;s:23:\"audio/theme-rtl.min.css\";i:30;s:15:\"audio/theme.css\";i:31;s:19:\"audio/theme.min.css\";i:32;s:21:\"avatar/editor-rtl.css\";i:33;s:25:\"avatar/editor-rtl.min.css\";i:34;s:17:\"avatar/editor.css\";i:35;s:21:\"avatar/editor.min.css\";i:36;s:20:\"avatar/style-rtl.css\";i:37;s:24:\"avatar/style-rtl.min.css\";i:38;s:16:\"avatar/style.css\";i:39;s:20:\"avatar/style.min.css\";i:40;s:25:\"breadcrumbs/style-rtl.css\";i:41;s:29:\"breadcrumbs/style-rtl.min.css\";i:42;s:21:\"breadcrumbs/style.css\";i:43;s:25:\"breadcrumbs/style.min.css\";i:44;s:21:\"button/editor-rtl.css\";i:45;s:25:\"button/editor-rtl.min.css\";i:46;s:17:\"button/editor.css\";i:47;s:21:\"button/editor.min.css\";i:48;s:20:\"button/style-rtl.css\";i:49;s:24:\"button/style-rtl.min.css\";i:50;s:16:\"button/style.css\";i:51;s:20:\"button/style.min.css\";i:52;s:22:\"buttons/editor-rtl.css\";i:53;s:26:\"buttons/editor-rtl.min.css\";i:54;s:18:\"buttons/editor.css\";i:55;s:22:\"buttons/editor.min.css\";i:56;s:21:\"buttons/style-rtl.css\";i:57;s:25:\"buttons/style-rtl.min.css\";i:58;s:17:\"buttons/style.css\";i:59;s:21:\"buttons/style.min.css\";i:60;s:22:\"calendar/style-rtl.css\";i:61;s:26:\"calendar/style-rtl.min.css\";i:62;s:18:\"calendar/style.css\";i:63;s:22:\"calendar/style.min.css\";i:64;s:25:\"categories/editor-rtl.css\";i:65;s:29:\"categories/editor-rtl.min.css\";i:66;s:21:\"categories/editor.css\";i:67;s:25:\"categories/editor.min.css\";i:68;s:24:\"categories/style-rtl.css\";i:69;s:28:\"categories/style-rtl.min.css\";i:70;s:20:\"categories/style.css\";i:71;s:24:\"categories/style.min.css\";i:72;s:19:\"code/editor-rtl.css\";i:73;s:23:\"code/editor-rtl.min.css\";i:74;s:15:\"code/editor.css\";i:75;s:19:\"code/editor.min.css\";i:76;s:18:\"code/style-rtl.css\";i:77;s:22:\"code/style-rtl.min.css\";i:78;s:14:\"code/style.css\";i:79;s:18:\"code/style.min.css\";i:80;s:18:\"code/theme-rtl.css\";i:81;s:22:\"code/theme-rtl.min.css\";i:82;s:14:\"code/theme.css\";i:83;s:18:\"code/theme.min.css\";i:84;s:22:\"columns/editor-rtl.css\";i:85;s:26:\"columns/editor-rtl.min.css\";i:86;s:18:\"columns/editor.css\";i:87;s:22:\"columns/editor.min.css\";i:88;s:21:\"columns/style-rtl.css\";i:89;s:25:\"columns/style-rtl.min.css\";i:90;s:17:\"columns/style.css\";i:91;s:21:\"columns/style.min.css\";i:92;s:33:\"comment-author-name/style-rtl.css\";i:93;s:37:\"comment-author-name/style-rtl.min.css\";i:94;s:29:\"comment-author-name/style.css\";i:95;s:33:\"comment-author-name/style.min.css\";i:96;s:29:\"comment-content/style-rtl.css\";i:97;s:33:\"comment-content/style-rtl.min.css\";i:98;s:25:\"comment-content/style.css\";i:99;s:29:\"comment-content/style.min.css\";i:100;s:26:\"comment-date/style-rtl.css\";i:101;s:30:\"comment-date/style-rtl.min.css\";i:102;s:22:\"comment-date/style.css\";i:103;s:26:\"comment-date/style.min.css\";i:104;s:31:\"comment-edit-link/style-rtl.css\";i:105;s:35:\"comment-edit-link/style-rtl.min.css\";i:106;s:27:\"comment-edit-link/style.css\";i:107;s:31:\"comment-edit-link/style.min.css\";i:108;s:32:\"comment-reply-link/style-rtl.css\";i:109;s:36:\"comment-reply-link/style-rtl.min.css\";i:110;s:28:\"comment-reply-link/style.css\";i:111;s:32:\"comment-reply-link/style.min.css\";i:112;s:30:\"comment-template/style-rtl.css\";i:113;s:34:\"comment-template/style-rtl.min.css\";i:114;s:26:\"comment-template/style.css\";i:115;s:30:\"comment-template/style.min.css\";i:116;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:117;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:118;s:38:\"comments-pagination-numbers/editor.css\";i:119;s:42:\"comments-pagination-numbers/editor.min.css\";i:120;s:34:\"comments-pagination/editor-rtl.css\";i:121;s:38:\"comments-pagination/editor-rtl.min.css\";i:122;s:30:\"comments-pagination/editor.css\";i:123;s:34:\"comments-pagination/editor.min.css\";i:124;s:33:\"comments-pagination/style-rtl.css\";i:125;s:37:\"comments-pagination/style-rtl.min.css\";i:126;s:29:\"comments-pagination/style.css\";i:127;s:33:\"comments-pagination/style.min.css\";i:128;s:29:\"comments-title/editor-rtl.css\";i:129;s:33:\"comments-title/editor-rtl.min.css\";i:130;s:25:\"comments-title/editor.css\";i:131;s:29:\"comments-title/editor.min.css\";i:132;s:23:\"comments/editor-rtl.css\";i:133;s:27:\"comments/editor-rtl.min.css\";i:134;s:19:\"comments/editor.css\";i:135;s:23:\"comments/editor.min.css\";i:136;s:22:\"comments/style-rtl.css\";i:137;s:26:\"comments/style-rtl.min.css\";i:138;s:18:\"comments/style.css\";i:139;s:22:\"comments/style.min.css\";i:140;s:20:\"cover/editor-rtl.css\";i:141;s:24:\"cover/editor-rtl.min.css\";i:142;s:16:\"cover/editor.css\";i:143;s:20:\"cover/editor.min.css\";i:144;s:19:\"cover/style-rtl.css\";i:145;s:23:\"cover/style-rtl.min.css\";i:146;s:15:\"cover/style.css\";i:147;s:19:\"cover/style.min.css\";i:148;s:22:\"details/editor-rtl.css\";i:149;s:26:\"details/editor-rtl.min.css\";i:150;s:18:\"details/editor.css\";i:151;s:22:\"details/editor.min.css\";i:152;s:21:\"details/style-rtl.css\";i:153;s:25:\"details/style-rtl.min.css\";i:154;s:17:\"details/style.css\";i:155;s:21:\"details/style.min.css\";i:156;s:20:\"embed/editor-rtl.css\";i:157;s:24:\"embed/editor-rtl.min.css\";i:158;s:16:\"embed/editor.css\";i:159;s:20:\"embed/editor.min.css\";i:160;s:19:\"embed/style-rtl.css\";i:161;s:23:\"embed/style-rtl.min.css\";i:162;s:15:\"embed/style.css\";i:163;s:19:\"embed/style.min.css\";i:164;s:19:\"embed/theme-rtl.css\";i:165;s:23:\"embed/theme-rtl.min.css\";i:166;s:15:\"embed/theme.css\";i:167;s:19:\"embed/theme.min.css\";i:168;s:19:\"file/editor-rtl.css\";i:169;s:23:\"file/editor-rtl.min.css\";i:170;s:15:\"file/editor.css\";i:171;s:19:\"file/editor.min.css\";i:172;s:18:\"file/style-rtl.css\";i:173;s:22:\"file/style-rtl.min.css\";i:174;s:14:\"file/style.css\";i:175;s:18:\"file/style.min.css\";i:176;s:23:\"footnotes/style-rtl.css\";i:177;s:27:\"footnotes/style-rtl.min.css\";i:178;s:19:\"footnotes/style.css\";i:179;s:23:\"footnotes/style.min.css\";i:180;s:23:\"freeform/editor-rtl.css\";i:181;s:27:\"freeform/editor-rtl.min.css\";i:182;s:19:\"freeform/editor.css\";i:183;s:23:\"freeform/editor.min.css\";i:184;s:22:\"gallery/editor-rtl.css\";i:185;s:26:\"gallery/editor-rtl.min.css\";i:186;s:18:\"gallery/editor.css\";i:187;s:22:\"gallery/editor.min.css\";i:188;s:21:\"gallery/style-rtl.css\";i:189;s:25:\"gallery/style-rtl.min.css\";i:190;s:17:\"gallery/style.css\";i:191;s:21:\"gallery/style.min.css\";i:192;s:21:\"gallery/theme-rtl.css\";i:193;s:25:\"gallery/theme-rtl.min.css\";i:194;s:17:\"gallery/theme.css\";i:195;s:21:\"gallery/theme.min.css\";i:196;s:20:\"group/editor-rtl.css\";i:197;s:24:\"group/editor-rtl.min.css\";i:198;s:16:\"group/editor.css\";i:199;s:20:\"group/editor.min.css\";i:200;s:19:\"group/style-rtl.css\";i:201;s:23:\"group/style-rtl.min.css\";i:202;s:15:\"group/style.css\";i:203;s:19:\"group/style.min.css\";i:204;s:19:\"group/theme-rtl.css\";i:205;s:23:\"group/theme-rtl.min.css\";i:206;s:15:\"group/theme.css\";i:207;s:19:\"group/theme.min.css\";i:208;s:21:\"heading/style-rtl.css\";i:209;s:25:\"heading/style-rtl.min.css\";i:210;s:17:\"heading/style.css\";i:211;s:21:\"heading/style.min.css\";i:212;s:19:\"html/editor-rtl.css\";i:213;s:23:\"html/editor-rtl.min.css\";i:214;s:15:\"html/editor.css\";i:215;s:19:\"html/editor.min.css\";i:216;s:19:\"icon/editor-rtl.css\";i:217;s:23:\"icon/editor-rtl.min.css\";i:218;s:15:\"icon/editor.css\";i:219;s:19:\"icon/editor.min.css\";i:220;s:18:\"icon/style-rtl.css\";i:221;s:22:\"icon/style-rtl.min.css\";i:222;s:14:\"icon/style.css\";i:223;s:18:\"icon/style.min.css\";i:224;s:20:\"image/editor-rtl.css\";i:225;s:24:\"image/editor-rtl.min.css\";i:226;s:16:\"image/editor.css\";i:227;s:20:\"image/editor.min.css\";i:228;s:19:\"image/style-rtl.css\";i:229;s:23:\"image/style-rtl.min.css\";i:230;s:15:\"image/style.css\";i:231;s:19:\"image/style.min.css\";i:232;s:19:\"image/theme-rtl.css\";i:233;s:23:\"image/theme-rtl.min.css\";i:234;s:15:\"image/theme.css\";i:235;s:19:\"image/theme.min.css\";i:236;s:29:\"latest-comments/style-rtl.css\";i:237;s:33:\"latest-comments/style-rtl.min.css\";i:238;s:25:\"latest-comments/style.css\";i:239;s:29:\"latest-comments/style.min.css\";i:240;s:27:\"latest-posts/editor-rtl.css\";i:241;s:31:\"latest-posts/editor-rtl.min.css\";i:242;s:23:\"latest-posts/editor.css\";i:243;s:27:\"latest-posts/editor.min.css\";i:244;s:26:\"latest-posts/style-rtl.css\";i:245;s:30:\"latest-posts/style-rtl.min.css\";i:246;s:22:\"latest-posts/style.css\";i:247;s:26:\"latest-posts/style.min.css\";i:248;s:18:\"list/style-rtl.css\";i:249;s:22:\"list/style-rtl.min.css\";i:250;s:14:\"list/style.css\";i:251;s:18:\"list/style.min.css\";i:252;s:22:\"loginout/style-rtl.css\";i:253;s:26:\"loginout/style-rtl.min.css\";i:254;s:18:\"loginout/style.css\";i:255;s:22:\"loginout/style.min.css\";i:256;s:19:\"math/editor-rtl.css\";i:257;s:23:\"math/editor-rtl.min.css\";i:258;s:15:\"math/editor.css\";i:259;s:19:\"math/editor.min.css\";i:260;s:18:\"math/style-rtl.css\";i:261;s:22:\"math/style-rtl.min.css\";i:262;s:14:\"math/style.css\";i:263;s:18:\"math/style.min.css\";i:264;s:25:\"media-text/editor-rtl.css\";i:265;s:29:\"media-text/editor-rtl.min.css\";i:266;s:21:\"media-text/editor.css\";i:267;s:25:\"media-text/editor.min.css\";i:268;s:24:\"media-text/style-rtl.css\";i:269;s:28:\"media-text/style-rtl.min.css\";i:270;s:20:\"media-text/style.css\";i:271;s:24:\"media-text/style.min.css\";i:272;s:19:\"more/editor-rtl.css\";i:273;s:23:\"more/editor-rtl.min.css\";i:274;s:15:\"more/editor.css\";i:275;s:19:\"more/editor.min.css\";i:276;s:30:\"navigation-link/editor-rtl.css\";i:277;s:34:\"navigation-link/editor-rtl.min.css\";i:278;s:26:\"navigation-link/editor.css\";i:279;s:30:\"navigation-link/editor.min.css\";i:280;s:29:\"navigation-link/style-rtl.css\";i:281;s:33:\"navigation-link/style-rtl.min.css\";i:282;s:25:\"navigation-link/style.css\";i:283;s:29:\"navigation-link/style.min.css\";i:284;s:38:\"navigation-overlay-close/style-rtl.css\";i:285;s:42:\"navigation-overlay-close/style-rtl.min.css\";i:286;s:34:\"navigation-overlay-close/style.css\";i:287;s:38:\"navigation-overlay-close/style.min.css\";i:288;s:33:\"navigation-submenu/editor-rtl.css\";i:289;s:37:\"navigation-submenu/editor-rtl.min.css\";i:290;s:29:\"navigation-submenu/editor.css\";i:291;s:33:\"navigation-submenu/editor.min.css\";i:292;s:25:\"navigation/editor-rtl.css\";i:293;s:29:\"navigation/editor-rtl.min.css\";i:294;s:21:\"navigation/editor.css\";i:295;s:25:\"navigation/editor.min.css\";i:296;s:24:\"navigation/style-rtl.css\";i:297;s:28:\"navigation/style-rtl.min.css\";i:298;s:20:\"navigation/style.css\";i:299;s:24:\"navigation/style.min.css\";i:300;s:23:\"nextpage/editor-rtl.css\";i:301;s:27:\"nextpage/editor-rtl.min.css\";i:302;s:19:\"nextpage/editor.css\";i:303;s:23:\"nextpage/editor.min.css\";i:304;s:24:\"page-list/editor-rtl.css\";i:305;s:28:\"page-list/editor-rtl.min.css\";i:306;s:20:\"page-list/editor.css\";i:307;s:24:\"page-list/editor.min.css\";i:308;s:23:\"page-list/style-rtl.css\";i:309;s:27:\"page-list/style-rtl.min.css\";i:310;s:19:\"page-list/style.css\";i:311;s:23:\"page-list/style.min.css\";i:312;s:24:\"paragraph/editor-rtl.css\";i:313;s:28:\"paragraph/editor-rtl.min.css\";i:314;s:20:\"paragraph/editor.css\";i:315;s:24:\"paragraph/editor.min.css\";i:316;s:23:\"paragraph/style-rtl.css\";i:317;s:27:\"paragraph/style-rtl.min.css\";i:318;s:19:\"paragraph/style.css\";i:319;s:23:\"paragraph/style.min.css\";i:320;s:28:\"playlist-track/style-rtl.css\";i:321;s:32:\"playlist-track/style-rtl.min.css\";i:322;s:24:\"playlist-track/style.css\";i:323;s:28:\"playlist-track/style.min.css\";i:324;s:23:\"playlist/editor-rtl.css\";i:325;s:27:\"playlist/editor-rtl.min.css\";i:326;s:19:\"playlist/editor.css\";i:327;s:23:\"playlist/editor.min.css\";i:328;s:22:\"playlist/style-rtl.css\";i:329;s:26:\"playlist/style-rtl.min.css\";i:330;s:18:\"playlist/style.css\";i:331;s:22:\"playlist/style.min.css\";i:332;s:35:\"post-author-biography/style-rtl.css\";i:333;s:39:\"post-author-biography/style-rtl.min.css\";i:334;s:31:\"post-author-biography/style.css\";i:335;s:35:\"post-author-biography/style.min.css\";i:336;s:30:\"post-author-name/style-rtl.css\";i:337;s:34:\"post-author-name/style-rtl.min.css\";i:338;s:26:\"post-author-name/style.css\";i:339;s:30:\"post-author-name/style.min.css\";i:340;s:26:\"post-author/editor-rtl.css\";i:341;s:30:\"post-author/editor-rtl.min.css\";i:342;s:22:\"post-author/editor.css\";i:343;s:26:\"post-author/editor.min.css\";i:344;s:25:\"post-author/style-rtl.css\";i:345;s:29:\"post-author/style-rtl.min.css\";i:346;s:21:\"post-author/style.css\";i:347;s:25:\"post-author/style.min.css\";i:348;s:33:\"post-comments-count/style-rtl.css\";i:349;s:37:\"post-comments-count/style-rtl.min.css\";i:350;s:29:\"post-comments-count/style.css\";i:351;s:33:\"post-comments-count/style.min.css\";i:352;s:33:\"post-comments-form/editor-rtl.css\";i:353;s:37:\"post-comments-form/editor-rtl.min.css\";i:354;s:29:\"post-comments-form/editor.css\";i:355;s:33:\"post-comments-form/editor.min.css\";i:356;s:32:\"post-comments-form/style-rtl.css\";i:357;s:36:\"post-comments-form/style-rtl.min.css\";i:358;s:28:\"post-comments-form/style.css\";i:359;s:32:\"post-comments-form/style.min.css\";i:360;s:32:\"post-comments-link/style-rtl.css\";i:361;s:36:\"post-comments-link/style-rtl.min.css\";i:362;s:28:\"post-comments-link/style.css\";i:363;s:32:\"post-comments-link/style.min.css\";i:364;s:26:\"post-content/style-rtl.css\";i:365;s:30:\"post-content/style-rtl.min.css\";i:366;s:22:\"post-content/style.css\";i:367;s:26:\"post-content/style.min.css\";i:368;s:23:\"post-date/style-rtl.css\";i:369;s:27:\"post-date/style-rtl.min.css\";i:370;s:19:\"post-date/style.css\";i:371;s:23:\"post-date/style.min.css\";i:372;s:27:\"post-excerpt/editor-rtl.css\";i:373;s:31:\"post-excerpt/editor-rtl.min.css\";i:374;s:23:\"post-excerpt/editor.css\";i:375;s:27:\"post-excerpt/editor.min.css\";i:376;s:26:\"post-excerpt/style-rtl.css\";i:377;s:30:\"post-excerpt/style-rtl.min.css\";i:378;s:22:\"post-excerpt/style.css\";i:379;s:26:\"post-excerpt/style.min.css\";i:380;s:34:\"post-featured-image/editor-rtl.css\";i:381;s:38:\"post-featured-image/editor-rtl.min.css\";i:382;s:30:\"post-featured-image/editor.css\";i:383;s:34:\"post-featured-image/editor.min.css\";i:384;s:33:\"post-featured-image/style-rtl.css\";i:385;s:37:\"post-featured-image/style-rtl.min.css\";i:386;s:29:\"post-featured-image/style.css\";i:387;s:33:\"post-featured-image/style.min.css\";i:388;s:34:\"post-navigation-link/style-rtl.css\";i:389;s:38:\"post-navigation-link/style-rtl.min.css\";i:390;s:30:\"post-navigation-link/style.css\";i:391;s:34:\"post-navigation-link/style.min.css\";i:392;s:27:\"post-template/style-rtl.css\";i:393;s:31:\"post-template/style-rtl.min.css\";i:394;s:23:\"post-template/style.css\";i:395;s:27:\"post-template/style.min.css\";i:396;s:24:\"post-terms/style-rtl.css\";i:397;s:28:\"post-terms/style-rtl.min.css\";i:398;s:20:\"post-terms/style.css\";i:399;s:24:\"post-terms/style.min.css\";i:400;s:31:\"post-time-to-read/style-rtl.css\";i:401;s:35:\"post-time-to-read/style-rtl.min.css\";i:402;s:27:\"post-time-to-read/style.css\";i:403;s:31:\"post-time-to-read/style.min.css\";i:404;s:24:\"post-title/style-rtl.css\";i:405;s:28:\"post-title/style-rtl.min.css\";i:406;s:20:\"post-title/style.css\";i:407;s:24:\"post-title/style.min.css\";i:408;s:26:\"preformatted/style-rtl.css\";i:409;s:30:\"preformatted/style-rtl.min.css\";i:410;s:22:\"preformatted/style.css\";i:411;s:26:\"preformatted/style.min.css\";i:412;s:24:\"pullquote/editor-rtl.css\";i:413;s:28:\"pullquote/editor-rtl.min.css\";i:414;s:20:\"pullquote/editor.css\";i:415;s:24:\"pullquote/editor.min.css\";i:416;s:23:\"pullquote/style-rtl.css\";i:417;s:27:\"pullquote/style-rtl.min.css\";i:418;s:19:\"pullquote/style.css\";i:419;s:23:\"pullquote/style.min.css\";i:420;s:23:\"pullquote/theme-rtl.css\";i:421;s:27:\"pullquote/theme-rtl.min.css\";i:422;s:19:\"pullquote/theme.css\";i:423;s:23:\"pullquote/theme.min.css\";i:424;s:39:\"query-pagination-numbers/editor-rtl.css\";i:425;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:426;s:35:\"query-pagination-numbers/editor.css\";i:427;s:39:\"query-pagination-numbers/editor.min.css\";i:428;s:31:\"query-pagination/editor-rtl.css\";i:429;s:35:\"query-pagination/editor-rtl.min.css\";i:430;s:27:\"query-pagination/editor.css\";i:431;s:31:\"query-pagination/editor.min.css\";i:432;s:30:\"query-pagination/style-rtl.css\";i:433;s:34:\"query-pagination/style-rtl.min.css\";i:434;s:26:\"query-pagination/style.css\";i:435;s:30:\"query-pagination/style.min.css\";i:436;s:25:\"query-title/style-rtl.css\";i:437;s:29:\"query-title/style-rtl.min.css\";i:438;s:21:\"query-title/style.css\";i:439;s:25:\"query-title/style.min.css\";i:440;s:25:\"query-total/style-rtl.css\";i:441;s:29:\"query-total/style-rtl.min.css\";i:442;s:21:\"query-total/style.css\";i:443;s:25:\"query-total/style.min.css\";i:444;s:20:\"query/editor-rtl.css\";i:445;s:24:\"query/editor-rtl.min.css\";i:446;s:16:\"query/editor.css\";i:447;s:20:\"query/editor.min.css\";i:448;s:19:\"quote/style-rtl.css\";i:449;s:23:\"quote/style-rtl.min.css\";i:450;s:15:\"quote/style.css\";i:451;s:19:\"quote/style.min.css\";i:452;s:19:\"quote/theme-rtl.css\";i:453;s:23:\"quote/theme-rtl.min.css\";i:454;s:15:\"quote/theme.css\";i:455;s:19:\"quote/theme.min.css\";i:456;s:23:\"read-more/style-rtl.css\";i:457;s:27:\"read-more/style-rtl.min.css\";i:458;s:19:\"read-more/style.css\";i:459;s:23:\"read-more/style.min.css\";i:460;s:18:\"rss/editor-rtl.css\";i:461;s:22:\"rss/editor-rtl.min.css\";i:462;s:14:\"rss/editor.css\";i:463;s:18:\"rss/editor.min.css\";i:464;s:17:\"rss/style-rtl.css\";i:465;s:21:\"rss/style-rtl.min.css\";i:466;s:13:\"rss/style.css\";i:467;s:17:\"rss/style.min.css\";i:468;s:21:\"search/editor-rtl.css\";i:469;s:25:\"search/editor-rtl.min.css\";i:470;s:17:\"search/editor.css\";i:471;s:21:\"search/editor.min.css\";i:472;s:20:\"search/style-rtl.css\";i:473;s:24:\"search/style-rtl.min.css\";i:474;s:16:\"search/style.css\";i:475;s:20:\"search/style.min.css\";i:476;s:20:\"search/theme-rtl.css\";i:477;s:24:\"search/theme-rtl.min.css\";i:478;s:16:\"search/theme.css\";i:479;s:20:\"search/theme.min.css\";i:480;s:24:\"separator/editor-rtl.css\";i:481;s:28:\"separator/editor-rtl.min.css\";i:482;s:20:\"separator/editor.css\";i:483;s:24:\"separator/editor.min.css\";i:484;s:23:\"separator/style-rtl.css\";i:485;s:27:\"separator/style-rtl.min.css\";i:486;s:19:\"separator/style.css\";i:487;s:23:\"separator/style.min.css\";i:488;s:23:\"separator/theme-rtl.css\";i:489;s:27:\"separator/theme-rtl.min.css\";i:490;s:19:\"separator/theme.css\";i:491;s:23:\"separator/theme.min.css\";i:492;s:24:\"shortcode/editor-rtl.css\";i:493;s:28:\"shortcode/editor-rtl.min.css\";i:494;s:20:\"shortcode/editor.css\";i:495;s:24:\"shortcode/editor.min.css\";i:496;s:24:\"site-logo/editor-rtl.css\";i:497;s:28:\"site-logo/editor-rtl.min.css\";i:498;s:20:\"site-logo/editor.css\";i:499;s:24:\"site-logo/editor.min.css\";i:500;s:23:\"site-logo/style-rtl.css\";i:501;s:27:\"site-logo/style-rtl.min.css\";i:502;s:19:\"site-logo/style.css\";i:503;s:23:\"site-logo/style.min.css\";i:504;s:27:\"site-tagline/editor-rtl.css\";i:505;s:31:\"site-tagline/editor-rtl.min.css\";i:506;s:23:\"site-tagline/editor.css\";i:507;s:27:\"site-tagline/editor.min.css\";i:508;s:26:\"site-tagline/style-rtl.css\";i:509;s:30:\"site-tagline/style-rtl.min.css\";i:510;s:22:\"site-tagline/style.css\";i:511;s:26:\"site-tagline/style.min.css\";i:512;s:25:\"site-title/editor-rtl.css\";i:513;s:29:\"site-title/editor-rtl.min.css\";i:514;s:21:\"site-title/editor.css\";i:515;s:25:\"site-title/editor.min.css\";i:516;s:24:\"site-title/style-rtl.css\";i:517;s:28:\"site-title/style-rtl.min.css\";i:518;s:20:\"site-title/style.css\";i:519;s:24:\"site-title/style.min.css\";i:520;s:26:\"social-link/editor-rtl.css\";i:521;s:30:\"social-link/editor-rtl.min.css\";i:522;s:22:\"social-link/editor.css\";i:523;s:26:\"social-link/editor.min.css\";i:524;s:27:\"social-links/editor-rtl.css\";i:525;s:31:\"social-links/editor-rtl.min.css\";i:526;s:23:\"social-links/editor.css\";i:527;s:27:\"social-links/editor.min.css\";i:528;s:26:\"social-links/style-rtl.css\";i:529;s:30:\"social-links/style-rtl.min.css\";i:530;s:22:\"social-links/style.css\";i:531;s:26:\"social-links/style.min.css\";i:532;s:21:\"spacer/editor-rtl.css\";i:533;s:25:\"spacer/editor-rtl.min.css\";i:534;s:17:\"spacer/editor.css\";i:535;s:21:\"spacer/editor.min.css\";i:536;s:20:\"spacer/style-rtl.css\";i:537;s:24:\"spacer/style-rtl.min.css\";i:538;s:16:\"spacer/style.css\";i:539;s:20:\"spacer/style.min.css\";i:540;s:23:\"tab-list/editor-rtl.css\";i:541;s:27:\"tab-list/editor-rtl.min.css\";i:542;s:19:\"tab-list/editor.css\";i:543;s:23:\"tab-list/editor.min.css\";i:544;s:22:\"tab-list/style-rtl.css\";i:545;s:26:\"tab-list/style-rtl.min.css\";i:546;s:18:\"tab-list/style.css\";i:547;s:22:\"tab-list/style.min.css\";i:548;s:23:\"tab-panel/style-rtl.css\";i:549;s:27:\"tab-panel/style-rtl.min.css\";i:550;s:19:\"tab-panel/style.css\";i:551;s:23:\"tab-panel/style.min.css\";i:552;s:20:\"table/editor-rtl.css\";i:553;s:24:\"table/editor-rtl.min.css\";i:554;s:16:\"table/editor.css\";i:555;s:20:\"table/editor.min.css\";i:556;s:19:\"table/style-rtl.css\";i:557;s:23:\"table/style-rtl.min.css\";i:558;s:15:\"table/style.css\";i:559;s:19:\"table/style.min.css\";i:560;s:19:\"table/theme-rtl.css\";i:561;s:23:\"table/theme-rtl.min.css\";i:562;s:15:\"table/theme.css\";i:563;s:19:\"table/theme.min.css\";i:564;s:18:\"tabs/style-rtl.css\";i:565;s:22:\"tabs/style-rtl.min.css\";i:566;s:14:\"tabs/style.css\";i:567;s:18:\"tabs/style.min.css\";i:568;s:23:\"tag-cloud/style-rtl.css\";i:569;s:27:\"tag-cloud/style-rtl.min.css\";i:570;s:19:\"tag-cloud/style.css\";i:571;s:23:\"tag-cloud/style.min.css\";i:572;s:28:\"template-part/editor-rtl.css\";i:573;s:32:\"template-part/editor-rtl.min.css\";i:574;s:24:\"template-part/editor.css\";i:575;s:28:\"template-part/editor.min.css\";i:576;s:27:\"template-part/theme-rtl.css\";i:577;s:31:\"template-part/theme-rtl.min.css\";i:578;s:23:\"template-part/theme.css\";i:579;s:27:\"template-part/theme.min.css\";i:580;s:24:\"term-count/style-rtl.css\";i:581;s:28:\"term-count/style-rtl.min.css\";i:582;s:20:\"term-count/style.css\";i:583;s:24:\"term-count/style.min.css\";i:584;s:30:\"term-description/style-rtl.css\";i:585;s:34:\"term-description/style-rtl.min.css\";i:586;s:26:\"term-description/style.css\";i:587;s:30:\"term-description/style.min.css\";i:588;s:23:\"term-name/style-rtl.css\";i:589;s:27:\"term-name/style-rtl.min.css\";i:590;s:19:\"term-name/style.css\";i:591;s:23:\"term-name/style.min.css\";i:592;s:28:\"term-template/editor-rtl.css\";i:593;s:32:\"term-template/editor-rtl.min.css\";i:594;s:24:\"term-template/editor.css\";i:595;s:28:\"term-template/editor.min.css\";i:596;s:27:\"term-template/style-rtl.css\";i:597;s:31:\"term-template/style-rtl.min.css\";i:598;s:23:\"term-template/style.css\";i:599;s:27:\"term-template/style.min.css\";i:600;s:27:\"text-columns/editor-rtl.css\";i:601;s:31:\"text-columns/editor-rtl.min.css\";i:602;s:23:\"text-columns/editor.css\";i:603;s:27:\"text-columns/editor.min.css\";i:604;s:26:\"text-columns/style-rtl.css\";i:605;s:30:\"text-columns/style-rtl.min.css\";i:606;s:22:\"text-columns/style.css\";i:607;s:26:\"text-columns/style.min.css\";i:608;s:19:\"verse/style-rtl.css\";i:609;s:23:\"verse/style-rtl.min.css\";i:610;s:15:\"verse/style.css\";i:611;s:19:\"verse/style.min.css\";i:612;s:20:\"video/editor-rtl.css\";i:613;s:24:\"video/editor-rtl.min.css\";i:614;s:16:\"video/editor.css\";i:615;s:20:\"video/editor.min.css\";i:616;s:19:\"video/style-rtl.css\";i:617;s:23:\"video/style-rtl.min.css\";i:618;s:15:\"video/style.css\";i:619;s:19:\"video/style.min.css\";i:620;s:19:\"video/theme-rtl.css\";i:621;s:23:\"video/theme-rtl.min.css\";i:622;s:15:\"video/theme.css\";i:623;s:19:\"video/theme.min.css\";}}','on');
INSERT INTO `wp_options` VALUES (129,'recovery_keys','a:0:{}','off');
INSERT INTO `wp_options` VALUES (140,'theme_mods_twentytwentyfive','a:4:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1788311059;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (141,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"6f539b72180c8bd6c167902224690801\";s:6:\"blocks\";a:9:{s:32:\"832dc2d864d79097d8b8b493ad93453b\";s:0:\"\";s:32:\"45d3e0c4afcbd8cf25cb1ba51abfb3d7\";s:46:\":root :where(.wp-block-icon svg){width: 24px;}\";s:32:\"feca6e996f694be2d29599793228e0d7\";s:0:\"\";s:32:\"5eef131663eddaf830554df656fc2968\";s:324:\":where(.wp-block-gallery.is-layout-flex){gap: var( --wp--style--gallery-gap-default, var( --gallery-block--gutter-size, var( --wp--style--block-gap, 0.5em ) ) );}:where(.wp-block-gallery.is-layout-grid){gap: var( --wp--style--gallery-gap-default, var( --gallery-block--gutter-size, var( --wp--style--block-gap, 0.5em ) ) );}\";s:32:\"c99c05932c6685777ec5b856698fcc7d\";s:118:\":where(.wp-block-latest-posts.is-layout-flex){gap: 1.25em;}:where(.wp-block-latest-posts.is-layout-grid){gap: 1.25em;}\";s:32:\"dec8d648f30b13caec8e61374591787d\";s:120:\":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}\";s:32:\"6c35533f7a92cce94808323603db9fc8\";s:120:\":where(.wp-block-term-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-term-template.is-layout-grid){gap: 1.25em;}\";s:32:\"6a0505cd5c78a87ed77570cda43c1132\";s:102:\":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}\";s:32:\"25a66f156386551185570f72a9f7d44e\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on');
INSERT INTO `wp_options` VALUES (149,'can_compress_scripts','0','on');
INSERT INTO `wp_options` VALUES (162,'current_theme','CSamba','auto');
INSERT INTO `wp_options` VALUES (163,'theme_mods_csamba','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1787714021;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','on');
INSERT INTO `wp_options` VALUES (164,'theme_switched','','auto');
INSERT INTO `wp_options` VALUES (169,'finished_updating_comment_type','1','auto');
INSERT INTO `wp_options` VALUES (175,'_transient_health-check-site-status-result','{\"good\":18,\"recommended\":4,\"critical\":1}','on');
INSERT INTO `wp_options` VALUES (182,'_site_transient_wp_plugin_dependencies_plugin_data','a:0:{}','off');
INSERT INTO `wp_options` VALUES (183,'recently_activated','a:0:{}','off');
INSERT INTO `wp_options` VALUES (193,'acf_first_activated_version','6.8.8','on');
INSERT INTO `wp_options` VALUES (194,'acf_site_health','{\"version\":\"6.8.8\",\"plugin_type\":\"Free\",\"update_source\":\"wordpress.org\",\"wp_version\":\"7.1\",\"mysql_version\":\"8.0.35\",\"is_multisite\":false,\"active_theme\":{\"name\":\"CSamba\",\"version\":\"0.1.0\",\"theme_uri\":\"https:\\/\\/example.com\\/csamba\",\"stylesheet\":false},\"active_plugins\":{\"advanced-custom-fields\\/acf.php\":{\"name\":\"Advanced Custom Fields\",\"version\":\"6.8.8\",\"plugin_uri\":\"https:\\/\\/www.advancedcustomfields.com\"},\"wordpress-importer\\/wordpress-importer.php\":{\"name\":\"WordPress Importer\",\"version\":\"0.9.6\",\"plugin_uri\":\"https:\\/\\/wordpress.org\\/plugins\\/wordpress-importer\\/\"}},\"ui_field_groups\":\"0\",\"php_field_groups\":\"0\",\"json_field_groups\":\"0\",\"rest_field_groups\":\"0\",\"all_location_rules\":[\"post_type==banda\",\"post_type==casa\",\"post_type==destaque\",\"post_type==evento\",\"nav_menu_item==all\"],\"field_groups_by_post_type\":[{\"post_type\":\"banda\",\"field_group_count\":1},{\"post_type\":\"casa\",\"field_group_count\":1},{\"post_type\":\"destaque\",\"field_group_count\":1},{\"post_type\":\"evento\",\"field_group_count\":1}],\"number_of_fields_by_type\":{\"tab\":10,\"wysiwyg\":2,\"text\":25,\"number\":1,\"url\":23,\"message\":4,\"image\":21,\"select\":2,\"textarea\":1,\"true_false\":5,\"post_object\":3,\"color_picker\":2,\"date_picker\":1,\"time_picker\":1},\"number_of_third_party_fields_by_type\":[],\"post_types_enabled\":true,\"ui_post_types\":\"0\",\"json_post_types\":\"0\",\"ui_taxonomies\":\"0\",\"json_taxonomies\":\"0\",\"rest_api_format\":\"light\",\"admin_ui_enabled\":true,\"field_type-modal_enabled\":true,\"field_settings_tabs_enabled\":false,\"shortcode_enabled\":false,\"registered_acf_forms\":\"0\",\"json_save_paths\":1,\"json_load_paths\":1,\"ai_enabled\":false,\"schema_support\":false,\"schema_ready_objects\":{\"blocks\":0,\"post_types\":0},\"event_first_activated\":1787628856,\"last_updated\":1789702456}','off');
INSERT INTO `wp_options` VALUES (196,'acf_version','6.8.8','auto');
INSERT INTO `wp_options` VALUES (276,'theme_mods_csamba-vlovable','a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1787714018;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','off');
INSERT INTO `wp_options` VALUES (288,'theme_mods_csamba-theme-v0.4','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1788311000;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','off');
INSERT INTO `wp_options` VALUES (585,'_site_transient_timeout_php_check_617fc4d260191bf0de418d0d961f5a43','1789930898','off');
INSERT INTO `wp_options` VALUES (586,'_site_transient_php_check_617fc4d260191bf0de418d0d961f5a43','a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:3:\"7.4\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','off');
INSERT INTO `wp_options` VALUES (607,'wp_calendar_block_has_published_posts','1','auto');
INSERT INTO `wp_options` VALUES (670,'_site_transient_timeout_browser_d0b827fc028233786c5becb9c0f8e812','1790219853','off');
INSERT INTO `wp_options` VALUES (671,'_site_transient_browser_d0b827fc028233786c5becb9c0f8e812','a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:9:\"135.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','off');
INSERT INTO `wp_options` VALUES (720,'_site_transient_timeout_popular_importers_519f7fbdbab54648a3d418b33ac9c2dc','1789873683','off');
INSERT INTO `wp_options` VALUES (721,'_site_transient_popular_importers_519f7fbdbab54648a3d418b33ac9c2dc','a:2:{s:9:\"importers\";a:7:{s:7:\"blogger\";a:4:{s:4:\"name\";s:7:\"Blogger\";s:11:\"description\";s:54:\"Import posts, comments, and users from a Blogger blog.\";s:11:\"plugin-slug\";s:16:\"blogger-importer\";s:11:\"importer-id\";s:7:\"blogger\";}s:9:\"wpcat2tag\";a:4:{s:4:\"name\";s:29:\"Categories and Tags Converter\";s:11:\"description\";s:71:\"Convert existing categories to tags or tags to categories, selectively.\";s:11:\"plugin-slug\";s:18:\"wpcat2tag-importer\";s:11:\"importer-id\";s:10:\"wp-cat2tag\";}s:11:\"livejournal\";a:4:{s:4:\"name\";s:11:\"LiveJournal\";s:11:\"description\";s:46:\"Import posts from LiveJournal using their API.\";s:11:\"plugin-slug\";s:20:\"livejournal-importer\";s:11:\"importer-id\";s:11:\"livejournal\";}s:11:\"movabletype\";a:4:{s:4:\"name\";s:24:\"Movable Type and TypePad\";s:11:\"description\";s:62:\"Import posts and comments from a Movable Type or TypePad blog.\";s:11:\"plugin-slug\";s:20:\"movabletype-importer\";s:11:\"importer-id\";s:2:\"mt\";}s:3:\"rss\";a:4:{s:4:\"name\";s:3:\"RSS\";s:11:\"description\";s:30:\"Import posts from an RSS feed.\";s:11:\"plugin-slug\";s:12:\"rss-importer\";s:11:\"importer-id\";s:3:\"rss\";}s:6:\"tumblr\";a:4:{s:4:\"name\";s:6:\"Tumblr\";s:11:\"description\";s:53:\"Import posts &amp; media from Tumblr using their API.\";s:11:\"plugin-slug\";s:15:\"tumblr-importer\";s:11:\"importer-id\";s:6:\"tumblr\";}s:9:\"wordpress\";a:4:{s:4:\"name\";s:9:\"WordPress\";s:11:\"description\";s:96:\"Import posts, pages, comments, custom fields, categories, and tags from a WordPress export file.\";s:11:\"plugin-slug\";s:18:\"wordpress-importer\";s:11:\"importer-id\";s:9:\"wordpress\";}}s:10:\"translated\";b:0;}','off');
INSERT INTO `wp_options` VALUES (722,'category_children','a:0:{}','auto');
INSERT INTO `wp_options` VALUES (723,'genero_children','a:0:{}','auto');
INSERT INTO `wp_options` VALUES (729,'_site_transient_timeout_theme_roots','1789703584','off');
INSERT INTO `wp_options` VALUES (730,'_site_transient_theme_roots','a:2:{s:6:\"csamba\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";}','off');
INSERT INTO `wp_options` VALUES (732,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.1.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"7.1.1\";s:7:\"version\";s:5:\"7.1.1\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-7.1.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-7.1.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-7.1.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-7.1.1-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-7.1.1-partial-0.zip\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"7.1.1\";s:7:\"version\";s:5:\"7.1.1\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:3:\"7.1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.1.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"7.1.1\";s:7:\"version\";s:5:\"7.1.1\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1789701786;s:15:\"version_checked\";s:3:\"7.1\";s:12:\"translations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (733,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1789701786;s:7:\"checked\";a:2:{s:6:\"csamba\";s:5:\"0.1.0\";s:16:\"twentytwentyfive\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.5.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}}s:12:\"translations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (734,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1789701787;s:8:\"response\";a:1:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"6.8.10\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.6.8.10.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:67:\"https://ps.w.org/advanced-custom-fields/assets/icon.svg?rev=3207824\";s:3:\"svg\";s:67:\"https://ps.w.org/advanced-custom-fields/assets/icon.svg?rev=3207824\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=3374528\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=3374528\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.2\";s:6:\"tested\";s:5:\"7.1.1\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:18:\"wordpress-importer\";s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"0.9.6\";s:7:\"updated\";s:19:\"2025-01-24 14:35:53\";s:7:\"package\";s:85:\"https://downloads.wordpress.org/translation/plugin/wordpress-importer/0.9.6/pt_BR.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:1:{s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.9.6\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.9.6.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";s:3:\"svg\";s:63:\"https://ps.w.org/wordpress-importer/assets/icon.svg?rev=2791650\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.2\";}}s:7:\"checked\";a:2:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"6.8.8\";s:41:\"wordpress-importer/wordpress-importer.php\";s:5:\"0.9.6\";}}','off');
INSERT INTO `wp_options` VALUES (738,'_site_transient_timeout_wp_theme_files_patterns-48011af841fdca71b4bd718e1f907587','1789706010','off');
INSERT INTO `wp_options` VALUES (739,'_site_transient_wp_theme_files_patterns-48011af841fdca71b4bd718e1f907587','a:2:{s:7:\"version\";s:5:\"0.1.0\";s:8:\"patterns\";a:0:{}}','off');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (3,6,'_edit_lock','1788320298:1');
INSERT INTO `wp_postmeta` VALUES (4,6,'_wp_old_slug','virozoeira');
INSERT INTO `wp_postmeta` VALUES (5,8,'_wp_attached_file','2026/08/volto-evnto2.webp');
INSERT INTO `wp_postmeta` VALUES (6,8,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1440;s:6:\"height\";i:1788;s:4:\"file\";s:25:\"2026/08/volto-evnto2.webp\";s:8:\"filesize\";i:134470;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-242x300.webp\";s:5:\"width\";i:242;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:11794;}s:5:\"large\";a:5:{s:4:\"file\";s:26:\"volto-evnto2-825x1024.webp\";s:5:\"width\";i:825;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:82758;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:5080;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-768x954.webp\";s:5:\"width\";i:768;s:6:\"height\";i:954;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:75520;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:27:\"volto-evnto2-1237x1536.webp\";s:5:\"width\";i:1237;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:146244;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:21140;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:51174;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:25:\"volto-evnto2-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7100;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (7,9,'_wp_attached_file','2026/08/volto-evnto.jpg');
INSERT INTO `wp_postmeta` VALUES (8,9,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1351;s:4:\"file\";s:23:\"2026/08/volto-evnto.jpg\";s:8:\"filesize\";i:198796;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"volto-evnto-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21433;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"volto-evnto-819x1024.jpg\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:145664;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"volto-evnto-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8351;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"volto-evnto-768x961.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:961;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:131772;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:23:\"volto-evnto-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:32726;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:23:\"volto-evnto-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:84200;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:23:\"volto-evnto-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11278;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (9,10,'_wp_attached_file','2026/08/volto-2.webp');
INSERT INTO `wp_postmeta` VALUES (10,10,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1440;s:6:\"height\";i:1800;s:4:\"file\";s:20:\"2026/08/volto-2.webp\";s:8:\"filesize\";i:77944;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"volto-2-240x300.webp\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:12188;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"volto-2-819x1024.webp\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:56702;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"volto-2-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:6220;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"volto-2-768x960.webp\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:51870;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"volto-2-1229x1536.webp\";s:5:\"width\";i:1229;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:92608;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:20:\"volto-2-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:19050;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:20:\"volto-2-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:44040;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:20:\"volto-2-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7804;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (11,11,'_wp_attached_file','2026/08/volto.jpg');
INSERT INTO `wp_postmeta` VALUES (12,11,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:790;s:4:\"file\";s:17:\"2026/08/volto.jpg\";s:8:\"filesize\";i:180391;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"volto-300x219.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:219;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:20844;}s:5:\"large\";a:5:{s:4:\"file\";s:18:\"volto-1024x749.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:749;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:172451;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"volto-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8223;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:17:\"volto-768x562.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:562;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:108405;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:17:\"volto-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:49719;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:17:\"volto-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:148556;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:17:\"volto-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12889;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (13,12,'_wp_attached_file','2026/08/virozueira-copa.jpg');
INSERT INTO `wp_postmeta` VALUES (14,12,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:841;s:6:\"height\";i:720;s:4:\"file\";s:27:\"2026/08/virozueira-copa.jpg\";s:8:\"filesize\";i:113719;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-300x257.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:257;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21124;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8396;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-768x658.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:658;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:79951;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:33602;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-841x620.jpg\";s:5:\"width\";i:841;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:83217;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:27:\"virozueira-copa-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11828;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (15,13,'_wp_attached_file','2026/08/virozueira-evento2.jpg');
INSERT INTO `wp_postmeta` VALUES (16,13,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1350;s:6:\"height\";i:1687;s:4:\"file\";s:30:\"2026/08/virozueira-evento2.jpg\";s:8:\"filesize\";i:275269;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19387;}s:5:\"large\";a:5:{s:4:\"file\";s:31:\"virozueira-evento2-819x1024.jpg\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:148928;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7466;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-768x960.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:132256;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:32:\"virozueira-evento2-1229x1536.jpg\";s:5:\"width\";i:1229;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:280389;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:37007;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:109660;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:30:\"virozueira-evento2-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10659;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (17,14,'_wp_attached_file','2026/08/virozueira-evento.jpg');
INSERT INTO `wp_postmeta` VALUES (18,14,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1350;s:6:\"height\";i:1687;s:4:\"file\";s:29:\"2026/08/virozueira-evento.jpg\";s:8:\"filesize\";i:476774;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19472;}s:5:\"large\";a:5:{s:4:\"file\";s:30:\"virozueira-evento-819x1024.jpg\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:144761;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7708;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-768x960.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:130581;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:31:\"virozueira-evento-1229x1536.jpg\";s:5:\"width\";i:1229;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:263856;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:38861;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:106665;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:29:\"virozueira-evento-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11747;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (19,15,'_wp_attached_file','2026/08/virozueira.jpg');
INSERT INTO `wp_postmeta` VALUES (20,15,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2026/08/virozueira.jpg\";s:8:\"filesize\";i:417275;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"virozueira-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:24985;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"virozueira-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:193058;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:22:\"virozueira-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7839;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:22:\"virozueira-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:120809;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:22:\"virozueira-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:40498;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:22:\"virozueira-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:120933;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:22:\"virozueira-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12194;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (21,6,'_thumbnail_id','15');
INSERT INTO `wp_postmeta` VALUES (23,6,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (24,6,'banda_bio','Com mais de 25 anos de estrada, o grupo participou de programas de grande projeção nacional, como o Cante se Puder (SBT) em 2009 e o reality musical <em class=\"eujQNb\" data-sfc-root=\"ep\" data-copy-service-computed-style=\"font-family: &quot;Google Sans&quot;, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(230, 232, 240);\">SuperStar<!--TgQPHd|||[]--></em> (Rede Globo) em 2015.');
INSERT INTO `wp_postmeta` VALUES (25,6,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (26,6,'banda_cidade','');
INSERT INTO `wp_postmeta` VALUES (27,6,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (28,6,'banda_formacao','');
INSERT INTO `wp_postmeta` VALUES (29,6,'_banda_formacao','field_banda_formacao');
INSERT INTO `wp_postmeta` VALUES (30,6,'banda_site','');
INSERT INTO `wp_postmeta` VALUES (31,6,'_banda_site','field_banda_site');
INSERT INTO `wp_postmeta` VALUES (32,6,'banda_instagram','');
INSERT INTO `wp_postmeta` VALUES (33,6,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (34,6,'banda_youtube','');
INSERT INTO `wp_postmeta` VALUES (35,6,'_banda_youtube','field_banda_youtube');
INSERT INTO `wp_postmeta` VALUES (36,6,'banda_spotify','');
INSERT INTO `wp_postmeta` VALUES (37,6,'_banda_spotify','field_banda_spotify');
INSERT INTO `wp_postmeta` VALUES (38,6,'banda_foto_1','15');
INSERT INTO `wp_postmeta` VALUES (39,6,'_banda_foto_1','field_banda_foto_1');
INSERT INTO `wp_postmeta` VALUES (40,6,'banda_foto_2','12');
INSERT INTO `wp_postmeta` VALUES (41,6,'_banda_foto_2','field_banda_foto_2');
INSERT INTO `wp_postmeta` VALUES (42,6,'banda_foto_3','');
INSERT INTO `wp_postmeta` VALUES (43,6,'_banda_foto_3','field_banda_foto_3');
INSERT INTO `wp_postmeta` VALUES (44,6,'banda_foto_4','');
INSERT INTO `wp_postmeta` VALUES (45,6,'_banda_foto_4','field_banda_foto_4');
INSERT INTO `wp_postmeta` VALUES (46,6,'banda_foto_5','');
INSERT INTO `wp_postmeta` VALUES (47,6,'_banda_foto_5','field_banda_foto_5');
INSERT INTO `wp_postmeta` VALUES (48,6,'banda_foto_6','');
INSERT INTO `wp_postmeta` VALUES (49,6,'_banda_foto_6','field_banda_foto_6');
INSERT INTO `wp_postmeta` VALUES (50,6,'banda_foto_7','');
INSERT INTO `wp_postmeta` VALUES (51,6,'_banda_foto_7','field_banda_foto_7');
INSERT INTO `wp_postmeta` VALUES (52,6,'banda_foto_8','');
INSERT INTO `wp_postmeta` VALUES (53,6,'_banda_foto_8','field_banda_foto_8');
INSERT INTO `wp_postmeta` VALUES (54,6,'banda_musica_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (55,6,'_banda_musica_titulo_1','field_banda_musica_titulo_1');
INSERT INTO `wp_postmeta` VALUES (56,6,'banda_musica_url_1','');
INSERT INTO `wp_postmeta` VALUES (57,6,'_banda_musica_url_1','field_banda_musica_url_1');
INSERT INTO `wp_postmeta` VALUES (58,6,'banda_musica_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (59,6,'_banda_musica_titulo_2','field_banda_musica_titulo_2');
INSERT INTO `wp_postmeta` VALUES (60,6,'banda_musica_url_2','');
INSERT INTO `wp_postmeta` VALUES (61,6,'_banda_musica_url_2','field_banda_musica_url_2');
INSERT INTO `wp_postmeta` VALUES (62,6,'banda_musica_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (63,6,'_banda_musica_titulo_3','field_banda_musica_titulo_3');
INSERT INTO `wp_postmeta` VALUES (64,6,'banda_musica_url_3','');
INSERT INTO `wp_postmeta` VALUES (65,6,'_banda_musica_url_3','field_banda_musica_url_3');
INSERT INTO `wp_postmeta` VALUES (66,6,'banda_musica_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (67,6,'_banda_musica_titulo_4','field_banda_musica_titulo_4');
INSERT INTO `wp_postmeta` VALUES (68,6,'banda_musica_url_4','');
INSERT INTO `wp_postmeta` VALUES (69,6,'_banda_musica_url_4','field_banda_musica_url_4');
INSERT INTO `wp_postmeta` VALUES (70,6,'banda_musica_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (71,6,'_banda_musica_titulo_5','field_banda_musica_titulo_5');
INSERT INTO `wp_postmeta` VALUES (72,6,'banda_musica_url_5','');
INSERT INTO `wp_postmeta` VALUES (73,6,'_banda_musica_url_5','field_banda_musica_url_5');
INSERT INTO `wp_postmeta` VALUES (74,6,'banda_musica_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (75,6,'_banda_musica_titulo_6','field_banda_musica_titulo_6');
INSERT INTO `wp_postmeta` VALUES (76,6,'banda_musica_url_6','');
INSERT INTO `wp_postmeta` VALUES (77,6,'_banda_musica_url_6','field_banda_musica_url_6');
INSERT INTO `wp_postmeta` VALUES (78,6,'banda_clipe_titulo_1','Virozueira - Ao Vivo no Gasômetro (completo)');
INSERT INTO `wp_postmeta` VALUES (79,6,'_banda_clipe_titulo_1','field_banda_clipe_titulo_1');
INSERT INTO `wp_postmeta` VALUES (80,6,'banda_clipe_url_1','https://www.youtube.com/watch?v=SoWoH6BP8fA');
INSERT INTO `wp_postmeta` VALUES (81,6,'_banda_clipe_url_1','field_banda_clipe_url_1');
INSERT INTO `wp_postmeta` VALUES (82,6,'banda_clipe_thumb_1','');
INSERT INTO `wp_postmeta` VALUES (83,6,'_banda_clipe_thumb_1','field_banda_clipe_thumb_1');
INSERT INTO `wp_postmeta` VALUES (84,6,'banda_clipe_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (85,6,'_banda_clipe_titulo_2','field_banda_clipe_titulo_2');
INSERT INTO `wp_postmeta` VALUES (86,6,'banda_clipe_url_2','');
INSERT INTO `wp_postmeta` VALUES (87,6,'_banda_clipe_url_2','field_banda_clipe_url_2');
INSERT INTO `wp_postmeta` VALUES (88,6,'banda_clipe_thumb_2','');
INSERT INTO `wp_postmeta` VALUES (89,6,'_banda_clipe_thumb_2','field_banda_clipe_thumb_2');
INSERT INTO `wp_postmeta` VALUES (90,6,'banda_clipe_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (91,6,'_banda_clipe_titulo_3','field_banda_clipe_titulo_3');
INSERT INTO `wp_postmeta` VALUES (92,6,'banda_clipe_url_3','');
INSERT INTO `wp_postmeta` VALUES (93,6,'_banda_clipe_url_3','field_banda_clipe_url_3');
INSERT INTO `wp_postmeta` VALUES (94,6,'banda_clipe_thumb_3','');
INSERT INTO `wp_postmeta` VALUES (95,6,'_banda_clipe_thumb_3','field_banda_clipe_thumb_3');
INSERT INTO `wp_postmeta` VALUES (96,6,'banda_clipe_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (97,6,'_banda_clipe_titulo_4','field_banda_clipe_titulo_4');
INSERT INTO `wp_postmeta` VALUES (98,6,'banda_clipe_url_4','');
INSERT INTO `wp_postmeta` VALUES (99,6,'_banda_clipe_url_4','field_banda_clipe_url_4');
INSERT INTO `wp_postmeta` VALUES (100,6,'banda_clipe_thumb_4','');
INSERT INTO `wp_postmeta` VALUES (101,6,'_banda_clipe_thumb_4','field_banda_clipe_thumb_4');
INSERT INTO `wp_postmeta` VALUES (102,6,'banda_clipe_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (103,6,'_banda_clipe_titulo_5','field_banda_clipe_titulo_5');
INSERT INTO `wp_postmeta` VALUES (104,6,'banda_clipe_url_5','');
INSERT INTO `wp_postmeta` VALUES (105,6,'_banda_clipe_url_5','field_banda_clipe_url_5');
INSERT INTO `wp_postmeta` VALUES (106,6,'banda_clipe_thumb_5','');
INSERT INTO `wp_postmeta` VALUES (107,6,'_banda_clipe_thumb_5','field_banda_clipe_thumb_5');
INSERT INTO `wp_postmeta` VALUES (108,6,'banda_clipe_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (109,6,'_banda_clipe_titulo_6','field_banda_clipe_titulo_6');
INSERT INTO `wp_postmeta` VALUES (110,6,'banda_clipe_url_6','');
INSERT INTO `wp_postmeta` VALUES (111,6,'_banda_clipe_url_6','field_banda_clipe_url_6');
INSERT INTO `wp_postmeta` VALUES (112,6,'banda_clipe_thumb_6','');
INSERT INTO `wp_postmeta` VALUES (113,6,'_banda_clipe_thumb_6','field_banda_clipe_thumb_6');
INSERT INTO `wp_postmeta` VALUES (114,18,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (115,18,'csamba_target','6');
INSERT INTO `wp_postmeta` VALUES (116,18,'_csamba_target','field_csamba_target');
INSERT INTO `wp_postmeta` VALUES (117,18,'csamba_slide_color','#7a1fd0');
INSERT INTO `wp_postmeta` VALUES (118,18,'_csamba_slide_color','field_csamba_slide_color');
INSERT INTO `wp_postmeta` VALUES (119,18,'csamba_slide_gradient','1');
INSERT INTO `wp_postmeta` VALUES (120,18,'_csamba_slide_gradient','field_csamba_slide_gradient');
INSERT INTO `wp_postmeta` VALUES (121,18,'csamba_subtitulo','é o destaque da semana');
INSERT INTO `wp_postmeta` VALUES (122,18,'_csamba_subtitulo','field_csamba_subtitulo');
INSERT INTO `wp_postmeta` VALUES (123,18,'csamba_slide_image','');
INSERT INTO `wp_postmeta` VALUES (124,18,'_csamba_slide_image','field_csamba_slide_image');
INSERT INTO `wp_postmeta` VALUES (125,18,'csamba_cta','Veja mais');
INSERT INTO `wp_postmeta` VALUES (126,18,'_csamba_cta','field_csamba_cta');
INSERT INTO `wp_postmeta` VALUES (127,18,'_edit_lock','1788320699:1');
INSERT INTO `wp_postmeta` VALUES (128,20,'_edit_lock','1787720784:1');
INSERT INTO `wp_postmeta` VALUES (129,20,'_thumbnail_id','11');
INSERT INTO `wp_postmeta` VALUES (130,20,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (131,20,'banda_bio','A música de antigamente com ânimo renovado. Com essa proposta o grupo surge no cenário portoalegrense cantando clássicos do Samba e executando preciosidades da Música Brasileira.');
INSERT INTO `wp_postmeta` VALUES (132,20,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (133,20,'banda_cidade','');
INSERT INTO `wp_postmeta` VALUES (134,20,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (135,20,'banda_formacao','');
INSERT INTO `wp_postmeta` VALUES (136,20,'_banda_formacao','field_banda_formacao');
INSERT INTO `wp_postmeta` VALUES (137,20,'banda_site','');
INSERT INTO `wp_postmeta` VALUES (138,20,'_banda_site','field_banda_site');
INSERT INTO `wp_postmeta` VALUES (139,20,'banda_instagram','');
INSERT INTO `wp_postmeta` VALUES (140,20,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (141,20,'banda_youtube','');
INSERT INTO `wp_postmeta` VALUES (142,20,'_banda_youtube','field_banda_youtube');
INSERT INTO `wp_postmeta` VALUES (143,20,'banda_spotify','');
INSERT INTO `wp_postmeta` VALUES (144,20,'_banda_spotify','field_banda_spotify');
INSERT INTO `wp_postmeta` VALUES (145,20,'banda_foto_1','11');
INSERT INTO `wp_postmeta` VALUES (146,20,'_banda_foto_1','field_banda_foto_1');
INSERT INTO `wp_postmeta` VALUES (147,20,'banda_foto_2','10');
INSERT INTO `wp_postmeta` VALUES (148,20,'_banda_foto_2','field_banda_foto_2');
INSERT INTO `wp_postmeta` VALUES (149,20,'banda_foto_3','');
INSERT INTO `wp_postmeta` VALUES (150,20,'_banda_foto_3','field_banda_foto_3');
INSERT INTO `wp_postmeta` VALUES (151,20,'banda_foto_4','');
INSERT INTO `wp_postmeta` VALUES (152,20,'_banda_foto_4','field_banda_foto_4');
INSERT INTO `wp_postmeta` VALUES (153,20,'banda_foto_5','');
INSERT INTO `wp_postmeta` VALUES (154,20,'_banda_foto_5','field_banda_foto_5');
INSERT INTO `wp_postmeta` VALUES (155,20,'banda_foto_6','');
INSERT INTO `wp_postmeta` VALUES (156,20,'_banda_foto_6','field_banda_foto_6');
INSERT INTO `wp_postmeta` VALUES (157,20,'banda_foto_7','');
INSERT INTO `wp_postmeta` VALUES (158,20,'_banda_foto_7','field_banda_foto_7');
INSERT INTO `wp_postmeta` VALUES (159,20,'banda_foto_8','');
INSERT INTO `wp_postmeta` VALUES (160,20,'_banda_foto_8','field_banda_foto_8');
INSERT INTO `wp_postmeta` VALUES (161,20,'banda_musica_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (162,20,'_banda_musica_titulo_1','field_banda_musica_titulo_1');
INSERT INTO `wp_postmeta` VALUES (163,20,'banda_musica_url_1','');
INSERT INTO `wp_postmeta` VALUES (164,20,'_banda_musica_url_1','field_banda_musica_url_1');
INSERT INTO `wp_postmeta` VALUES (165,20,'banda_musica_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (166,20,'_banda_musica_titulo_2','field_banda_musica_titulo_2');
INSERT INTO `wp_postmeta` VALUES (167,20,'banda_musica_url_2','');
INSERT INTO `wp_postmeta` VALUES (168,20,'_banda_musica_url_2','field_banda_musica_url_2');
INSERT INTO `wp_postmeta` VALUES (169,20,'banda_musica_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (170,20,'_banda_musica_titulo_3','field_banda_musica_titulo_3');
INSERT INTO `wp_postmeta` VALUES (171,20,'banda_musica_url_3','');
INSERT INTO `wp_postmeta` VALUES (172,20,'_banda_musica_url_3','field_banda_musica_url_3');
INSERT INTO `wp_postmeta` VALUES (173,20,'banda_musica_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (174,20,'_banda_musica_titulo_4','field_banda_musica_titulo_4');
INSERT INTO `wp_postmeta` VALUES (175,20,'banda_musica_url_4','');
INSERT INTO `wp_postmeta` VALUES (176,20,'_banda_musica_url_4','field_banda_musica_url_4');
INSERT INTO `wp_postmeta` VALUES (177,20,'banda_musica_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (178,20,'_banda_musica_titulo_5','field_banda_musica_titulo_5');
INSERT INTO `wp_postmeta` VALUES (179,20,'banda_musica_url_5','');
INSERT INTO `wp_postmeta` VALUES (180,20,'_banda_musica_url_5','field_banda_musica_url_5');
INSERT INTO `wp_postmeta` VALUES (181,20,'banda_musica_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (182,20,'_banda_musica_titulo_6','field_banda_musica_titulo_6');
INSERT INTO `wp_postmeta` VALUES (183,20,'banda_musica_url_6','');
INSERT INTO `wp_postmeta` VALUES (184,20,'_banda_musica_url_6','field_banda_musica_url_6');
INSERT INTO `wp_postmeta` VALUES (185,20,'banda_clipe_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (186,20,'_banda_clipe_titulo_1','field_banda_clipe_titulo_1');
INSERT INTO `wp_postmeta` VALUES (187,20,'banda_clipe_url_1','');
INSERT INTO `wp_postmeta` VALUES (188,20,'_banda_clipe_url_1','field_banda_clipe_url_1');
INSERT INTO `wp_postmeta` VALUES (189,20,'banda_clipe_thumb_1','');
INSERT INTO `wp_postmeta` VALUES (190,20,'_banda_clipe_thumb_1','field_banda_clipe_thumb_1');
INSERT INTO `wp_postmeta` VALUES (191,20,'banda_clipe_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (192,20,'_banda_clipe_titulo_2','field_banda_clipe_titulo_2');
INSERT INTO `wp_postmeta` VALUES (193,20,'banda_clipe_url_2','');
INSERT INTO `wp_postmeta` VALUES (194,20,'_banda_clipe_url_2','field_banda_clipe_url_2');
INSERT INTO `wp_postmeta` VALUES (195,20,'banda_clipe_thumb_2','');
INSERT INTO `wp_postmeta` VALUES (196,20,'_banda_clipe_thumb_2','field_banda_clipe_thumb_2');
INSERT INTO `wp_postmeta` VALUES (197,20,'banda_clipe_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (198,20,'_banda_clipe_titulo_3','field_banda_clipe_titulo_3');
INSERT INTO `wp_postmeta` VALUES (199,20,'banda_clipe_url_3','');
INSERT INTO `wp_postmeta` VALUES (200,20,'_banda_clipe_url_3','field_banda_clipe_url_3');
INSERT INTO `wp_postmeta` VALUES (201,20,'banda_clipe_thumb_3','');
INSERT INTO `wp_postmeta` VALUES (202,20,'_banda_clipe_thumb_3','field_banda_clipe_thumb_3');
INSERT INTO `wp_postmeta` VALUES (203,20,'banda_clipe_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (204,20,'_banda_clipe_titulo_4','field_banda_clipe_titulo_4');
INSERT INTO `wp_postmeta` VALUES (205,20,'banda_clipe_url_4','');
INSERT INTO `wp_postmeta` VALUES (206,20,'_banda_clipe_url_4','field_banda_clipe_url_4');
INSERT INTO `wp_postmeta` VALUES (207,20,'banda_clipe_thumb_4','');
INSERT INTO `wp_postmeta` VALUES (208,20,'_banda_clipe_thumb_4','field_banda_clipe_thumb_4');
INSERT INTO `wp_postmeta` VALUES (209,20,'banda_clipe_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (210,20,'_banda_clipe_titulo_5','field_banda_clipe_titulo_5');
INSERT INTO `wp_postmeta` VALUES (211,20,'banda_clipe_url_5','');
INSERT INTO `wp_postmeta` VALUES (212,20,'_banda_clipe_url_5','field_banda_clipe_url_5');
INSERT INTO `wp_postmeta` VALUES (213,20,'banda_clipe_thumb_5','');
INSERT INTO `wp_postmeta` VALUES (214,20,'_banda_clipe_thumb_5','field_banda_clipe_thumb_5');
INSERT INTO `wp_postmeta` VALUES (215,20,'banda_clipe_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (216,20,'_banda_clipe_titulo_6','field_banda_clipe_titulo_6');
INSERT INTO `wp_postmeta` VALUES (217,20,'banda_clipe_url_6','');
INSERT INTO `wp_postmeta` VALUES (218,20,'_banda_clipe_url_6','field_banda_clipe_url_6');
INSERT INTO `wp_postmeta` VALUES (219,20,'banda_clipe_thumb_6','');
INSERT INTO `wp_postmeta` VALUES (220,20,'_banda_clipe_thumb_6','field_banda_clipe_thumb_6');
INSERT INTO `wp_postmeta` VALUES (221,21,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (222,21,'_edit_lock','1788489185:1');
INSERT INTO `wp_postmeta` VALUES (223,21,'csamba_target','20');
INSERT INTO `wp_postmeta` VALUES (224,21,'_csamba_target','field_csamba_target');
INSERT INTO `wp_postmeta` VALUES (225,21,'csamba_slide_color','#ff3300');
INSERT INTO `wp_postmeta` VALUES (226,21,'_csamba_slide_color','field_csamba_slide_color');
INSERT INTO `wp_postmeta` VALUES (227,21,'csamba_slide_gradient','1');
INSERT INTO `wp_postmeta` VALUES (228,21,'_csamba_slide_gradient','field_csamba_slide_gradient');
INSERT INTO `wp_postmeta` VALUES (229,21,'csamba_subtitulo','Toca essa terça no Mukifo');
INSERT INTO `wp_postmeta` VALUES (230,21,'_csamba_subtitulo','field_csamba_subtitulo');
INSERT INTO `wp_postmeta` VALUES (231,21,'csamba_slide_image','');
INSERT INTO `wp_postmeta` VALUES (232,21,'_csamba_slide_image','field_csamba_slide_image');
INSERT INTO `wp_postmeta` VALUES (233,21,'csamba_cta','Veja mais');
INSERT INTO `wp_postmeta` VALUES (234,21,'_csamba_cta','field_csamba_cta');
INSERT INTO `wp_postmeta` VALUES (235,22,'_edit_lock','1788442716:1');
INSERT INTO `wp_postmeta` VALUES (236,23,'_wp_attached_file','2026/08/mukifo3.webp');
INSERT INTO `wp_postmeta` VALUES (237,23,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1350;s:4:\"file\";s:20:\"2026/08/mukifo3.webp\";s:8:\"filesize\";i:195960;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"mukifo3-240x300.webp\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:11864;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"mukifo3-819x1024.webp\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:72724;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"mukifo3-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:5762;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"mukifo3-768x960.webp\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:63762;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:20:\"mukifo3-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:19618;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:20:\"mukifo3-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:53534;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:20:\"mukifo3-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7624;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (238,24,'_wp_attached_file','2026/08/mukifo.jpg');
INSERT INTO `wp_postmeta` VALUES (239,24,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:18:\"2026/08/mukifo.jpg\";s:8:\"filesize\";i:47765;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"mukifo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7877;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"mukifo-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:32951;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"mukifo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3594;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"mukifo-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22885;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:18:\"mukifo-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13887;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:18:\"mukifo-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28748;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:18:\"mukifo-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5996;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (240,25,'_wp_attached_file','2026/08/mukifo2.webp');
INSERT INTO `wp_postmeta` VALUES (241,25,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1350;s:4:\"file\";s:20:\"2026/08/mukifo2.webp\";s:8:\"filesize\";i:192696;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"mukifo2-240x300.webp\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:12080;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"mukifo2-819x1024.webp\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:66418;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"mukifo2-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:6088;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"mukifo2-768x960.webp\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:57678;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:20:\"mukifo2-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:17950;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:20:\"mukifo2-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:54318;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:20:\"mukifo2-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7428;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (242,22,'_thumbnail_id','24');
INSERT INTO `wp_postmeta` VALUES (243,18,'csamba_descricao','Com mais de 25 anos de estrada, o grupo participou de programas de grande projeção nacional, como o Cante se Puder (SBT) em 2009 e o reality musical SuperStar (Rede Globo) em 2015.');
INSERT INTO `wp_postmeta` VALUES (244,18,'_csamba_descricao','field_csamba_descricao');
INSERT INTO `wp_postmeta` VALUES (245,21,'csamba_descricao','Show começa as 22hrs');
INSERT INTO `wp_postmeta` VALUES (246,21,'_csamba_descricao','field_csamba_descricao');
INSERT INTO `wp_postmeta` VALUES (248,22,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (249,22,'casa_descricao','— bons drinks, ceva e comidinhas\r\n— sinuca aberta nas quartas');
INSERT INTO `wp_postmeta` VALUES (250,22,'_casa_descricao','field_casa_descricao');
INSERT INTO `wp_postmeta` VALUES (251,22,'casa_tipo','');
INSERT INTO `wp_postmeta` VALUES (252,22,'_casa_tipo','field_casa_tipo');
INSERT INTO `wp_postmeta` VALUES (253,22,'casa_endereco','rua mariante');
INSERT INTO `wp_postmeta` VALUES (254,22,'_casa_endereco','field_casa_endereco');
INSERT INTO `wp_postmeta` VALUES (255,22,'casa_numero','627');
INSERT INTO `wp_postmeta` VALUES (256,22,'_casa_numero','field_casa_numero');
INSERT INTO `wp_postmeta` VALUES (257,22,'casa_complemento','');
INSERT INTO `wp_postmeta` VALUES (258,22,'_casa_complemento','field_casa_complemento');
INSERT INTO `wp_postmeta` VALUES (259,22,'casa_bairro','Rio Branco');
INSERT INTO `wp_postmeta` VALUES (260,22,'_casa_bairro','field_casa_bairro');
INSERT INTO `wp_postmeta` VALUES (261,22,'casa_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (262,22,'_casa_cidade','field_casa_cidade');
INSERT INTO `wp_postmeta` VALUES (263,22,'casa_estado','RS');
INSERT INTO `wp_postmeta` VALUES (264,22,'_casa_estado','field_casa_estado');
INSERT INTO `wp_postmeta` VALUES (265,22,'casa_cep','');
INSERT INTO `wp_postmeta` VALUES (266,22,'_casa_cep','field_casa_cep');
INSERT INTO `wp_postmeta` VALUES (267,22,'casa_maps','https://maps.app.goo.gl/egNSGqmP9XxheWup7');
INSERT INTO `wp_postmeta` VALUES (268,22,'_casa_maps','field_casa_maps');
INSERT INTO `wp_postmeta` VALUES (269,22,'casa_telefone','');
INSERT INTO `wp_postmeta` VALUES (270,22,'_casa_telefone','field_casa_telefone');
INSERT INTO `wp_postmeta` VALUES (271,22,'casa_whatsapp','');
INSERT INTO `wp_postmeta` VALUES (272,22,'_casa_whatsapp','field_casa_whatsapp');
INSERT INTO `wp_postmeta` VALUES (273,22,'casa_site','');
INSERT INTO `wp_postmeta` VALUES (274,22,'_casa_site','field_casa_site');
INSERT INTO `wp_postmeta` VALUES (275,22,'casa_instagram','https://www.instagram.com/mukifopoa/');
INSERT INTO `wp_postmeta` VALUES (276,22,'_casa_instagram','field_casa_instagram');
INSERT INTO `wp_postmeta` VALUES (277,22,'casa_facebook','');
INSERT INTO `wp_postmeta` VALUES (278,22,'_casa_facebook','field_casa_facebook');
INSERT INTO `wp_postmeta` VALUES (279,22,'casa_horarios','terça a domingo a partir das 18h');
INSERT INTO `wp_postmeta` VALUES (280,22,'_casa_horarios','field_casa_horarios');
INSERT INTO `wp_postmeta` VALUES (281,22,'casa_reservas','');
INSERT INTO `wp_postmeta` VALUES (282,22,'_casa_reservas','field_casa_reservas');
INSERT INTO `wp_postmeta` VALUES (283,22,'casa_ingressos','');
INSERT INTO `wp_postmeta` VALUES (284,22,'_casa_ingressos','field_casa_ingressos');
INSERT INTO `wp_postmeta` VALUES (285,22,'casa_acessibilidade','0');
INSERT INTO `wp_postmeta` VALUES (286,22,'_casa_acessibilidade','field_casa_acessibilidade');
INSERT INTO `wp_postmeta` VALUES (287,22,'casa_estacionamento','0');
INSERT INTO `wp_postmeta` VALUES (288,22,'_casa_estacionamento','field_casa_estacionamento');
INSERT INTO `wp_postmeta` VALUES (289,22,'casa_area_externa','0');
INSERT INTO `wp_postmeta` VALUES (290,22,'_casa_area_externa','field_casa_area_externa');
INSERT INTO `wp_postmeta` VALUES (291,22,'casa_comida','0');
INSERT INTO `wp_postmeta` VALUES (292,22,'_casa_comida','field_casa_comida');
INSERT INTO `wp_postmeta` VALUES (293,22,'casa_foto_1','25');
INSERT INTO `wp_postmeta` VALUES (294,22,'_casa_foto_1','field_casa_foto_1');
INSERT INTO `wp_postmeta` VALUES (295,22,'casa_foto_2','23');
INSERT INTO `wp_postmeta` VALUES (296,22,'_casa_foto_2','field_casa_foto_2');
INSERT INTO `wp_postmeta` VALUES (297,22,'casa_foto_3','');
INSERT INTO `wp_postmeta` VALUES (298,22,'_casa_foto_3','field_casa_foto_3');
INSERT INTO `wp_postmeta` VALUES (299,22,'casa_foto_4','');
INSERT INTO `wp_postmeta` VALUES (300,22,'_casa_foto_4','field_casa_foto_4');
INSERT INTO `wp_postmeta` VALUES (301,22,'casa_foto_5','');
INSERT INTO `wp_postmeta` VALUES (302,22,'_casa_foto_5','field_casa_foto_5');
INSERT INTO `wp_postmeta` VALUES (303,22,'casa_foto_6','');
INSERT INTO `wp_postmeta` VALUES (304,22,'_casa_foto_6','field_casa_foto_6');
INSERT INTO `wp_postmeta` VALUES (305,29,'_edit_lock','1789332760:1');
INSERT INTO `wp_postmeta` VALUES (306,29,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (307,29,'casa_descricao','Cerveja gelada e Drinks🍹\r\n🎼Música ao vivo🎼');
INSERT INTO `wp_postmeta` VALUES (308,29,'_casa_descricao','field_casa_descricao');
INSERT INTO `wp_postmeta` VALUES (309,29,'casa_tipo','');
INSERT INTO `wp_postmeta` VALUES (310,29,'_casa_tipo','field_casa_tipo');
INSERT INTO `wp_postmeta` VALUES (311,29,'casa_endereco','Rua João Alfredo');
INSERT INTO `wp_postmeta` VALUES (312,29,'_casa_endereco','field_casa_endereco');
INSERT INTO `wp_postmeta` VALUES (313,29,'casa_numero','425');
INSERT INTO `wp_postmeta` VALUES (314,29,'_casa_numero','field_casa_numero');
INSERT INTO `wp_postmeta` VALUES (315,29,'casa_complemento','');
INSERT INTO `wp_postmeta` VALUES (316,29,'_casa_complemento','field_casa_complemento');
INSERT INTO `wp_postmeta` VALUES (317,29,'casa_bairro','Cidade Baixa');
INSERT INTO `wp_postmeta` VALUES (318,29,'_casa_bairro','field_casa_bairro');
INSERT INTO `wp_postmeta` VALUES (319,29,'casa_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (320,29,'_casa_cidade','field_casa_cidade');
INSERT INTO `wp_postmeta` VALUES (321,29,'casa_estado','RS');
INSERT INTO `wp_postmeta` VALUES (322,29,'_casa_estado','field_casa_estado');
INSERT INTO `wp_postmeta` VALUES (323,29,'casa_cep','');
INSERT INTO `wp_postmeta` VALUES (324,29,'_casa_cep','field_casa_cep');
INSERT INTO `wp_postmeta` VALUES (325,29,'casa_maps','');
INSERT INTO `wp_postmeta` VALUES (326,29,'_casa_maps','field_casa_maps');
INSERT INTO `wp_postmeta` VALUES (327,29,'casa_telefone','');
INSERT INTO `wp_postmeta` VALUES (328,29,'_casa_telefone','field_casa_telefone');
INSERT INTO `wp_postmeta` VALUES (329,29,'casa_whatsapp','');
INSERT INTO `wp_postmeta` VALUES (330,29,'_casa_whatsapp','field_casa_whatsapp');
INSERT INTO `wp_postmeta` VALUES (331,29,'casa_site','');
INSERT INTO `wp_postmeta` VALUES (332,29,'_casa_site','field_casa_site');
INSERT INTO `wp_postmeta` VALUES (333,29,'casa_instagram','https://www.instagram.com/galbarearte/');
INSERT INTO `wp_postmeta` VALUES (334,29,'_casa_instagram','field_casa_instagram');
INSERT INTO `wp_postmeta` VALUES (335,29,'casa_facebook','');
INSERT INTO `wp_postmeta` VALUES (336,29,'_casa_facebook','field_casa_facebook');
INSERT INTO `wp_postmeta` VALUES (337,29,'casa_horarios','⏰Horarios: O bar abre às 20hs⏰\r\n🎼Shows: 22hs🎼');
INSERT INTO `wp_postmeta` VALUES (338,29,'_casa_horarios','field_casa_horarios');
INSERT INTO `wp_postmeta` VALUES (339,29,'casa_reservas','');
INSERT INTO `wp_postmeta` VALUES (340,29,'_casa_reservas','field_casa_reservas');
INSERT INTO `wp_postmeta` VALUES (341,29,'casa_ingressos','');
INSERT INTO `wp_postmeta` VALUES (342,29,'_casa_ingressos','field_casa_ingressos');
INSERT INTO `wp_postmeta` VALUES (343,29,'casa_acessibilidade','0');
INSERT INTO `wp_postmeta` VALUES (344,29,'_casa_acessibilidade','field_casa_acessibilidade');
INSERT INTO `wp_postmeta` VALUES (345,29,'casa_estacionamento','0');
INSERT INTO `wp_postmeta` VALUES (346,29,'_casa_estacionamento','field_casa_estacionamento');
INSERT INTO `wp_postmeta` VALUES (347,29,'casa_area_externa','0');
INSERT INTO `wp_postmeta` VALUES (348,29,'_casa_area_externa','field_casa_area_externa');
INSERT INTO `wp_postmeta` VALUES (349,29,'casa_comida','0');
INSERT INTO `wp_postmeta` VALUES (350,29,'_casa_comida','field_casa_comida');
INSERT INTO `wp_postmeta` VALUES (351,29,'casa_foto_1','');
INSERT INTO `wp_postmeta` VALUES (352,29,'_casa_foto_1','field_casa_foto_1');
INSERT INTO `wp_postmeta` VALUES (353,29,'casa_foto_2','');
INSERT INTO `wp_postmeta` VALUES (354,29,'_casa_foto_2','field_casa_foto_2');
INSERT INTO `wp_postmeta` VALUES (355,29,'casa_foto_3','');
INSERT INTO `wp_postmeta` VALUES (356,29,'_casa_foto_3','field_casa_foto_3');
INSERT INTO `wp_postmeta` VALUES (357,29,'casa_foto_4','');
INSERT INTO `wp_postmeta` VALUES (358,29,'_casa_foto_4','field_casa_foto_4');
INSERT INTO `wp_postmeta` VALUES (359,29,'casa_foto_5','');
INSERT INTO `wp_postmeta` VALUES (360,29,'_casa_foto_5','field_casa_foto_5');
INSERT INTO `wp_postmeta` VALUES (361,29,'casa_foto_6','');
INSERT INTO `wp_postmeta` VALUES (362,29,'_casa_foto_6','field_casa_foto_6');
INSERT INTO `wp_postmeta` VALUES (363,30,'_edit_lock','1789331964:1');
INSERT INTO `wp_postmeta` VALUES (364,31,'_edit_lock','1789333905:1');
INSERT INTO `wp_postmeta` VALUES (365,32,'_wp_attached_file','2026/09/Thiago-fruto.webp');
INSERT INTO `wp_postmeta` VALUES (366,32,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:820;s:4:\"file\";s:25:\"2026/09/Thiago-fruto.webp\";s:8:\"filesize\";i:81270;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:25:\"Thiago-fruto-234x300.webp\";s:5:\"width\";i:234;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:22890;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:25:\"Thiago-fruto-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:8430;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:25:\"Thiago-fruto-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:33642;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:25:\"Thiago-fruto-640x620.webp\";s:5:\"width\";i:640;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:67800;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:25:\"Thiago-fruto-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:11972;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (367,33,'_wp_attached_file','2026/09/Thiago-gal.jpg');
INSERT INTO `wp_postmeta` VALUES (368,33,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:640;s:6:\"height\";i:1136;s:4:\"file\";s:22:\"2026/09/Thiago-gal.jpg\";s:8:\"filesize\";i:89086;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"Thiago-gal-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17418;}s:5:\"large\";a:5:{s:4:\"file\";s:23:\"Thiago-gal-577x1024.jpg\";s:5:\"width\";i:577;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:112238;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:22:\"Thiago-gal-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8691;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:22:\"Thiago-gal-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:34425;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:22:\"Thiago-gal-640x620.jpg\";s:5:\"width\";i:640;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:76737;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:22:\"Thiago-gal-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11727;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (369,34,'_wp_attached_file','2026/09/Thiago.jpg');
INSERT INTO `wp_postmeta` VALUES (370,34,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:18:\"2026/09/Thiago.jpg\";s:8:\"filesize\";i:406616;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"Thiago-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:29471;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"Thiago-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:223710;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"Thiago-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8893;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"Thiago-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:140793;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:18:\"Thiago-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:44953;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:18:\"Thiago-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:129732;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:18:\"Thiago-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13334;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (371,31,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (372,31,'banda_bio','poa/rs 📍\r\n• sambista de fato! 🪕\r\n• apaixonado pela vida\r\n• pai de menina @laurahlimaa_ 👨‍👧🫶🏽');
INSERT INTO `wp_postmeta` VALUES (373,31,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (374,31,'banda_cidade','');
INSERT INTO `wp_postmeta` VALUES (375,31,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (376,31,'banda_formacao','');
INSERT INTO `wp_postmeta` VALUES (377,31,'_banda_formacao','field_banda_formacao');
INSERT INTO `wp_postmeta` VALUES (378,31,'banda_site','');
INSERT INTO `wp_postmeta` VALUES (379,31,'_banda_site','field_banda_site');
INSERT INTO `wp_postmeta` VALUES (380,31,'banda_instagram','https://www.instagram.com/thiagorlsamba/');
INSERT INTO `wp_postmeta` VALUES (381,31,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (382,31,'banda_youtube','');
INSERT INTO `wp_postmeta` VALUES (383,31,'_banda_youtube','field_banda_youtube');
INSERT INTO `wp_postmeta` VALUES (384,31,'banda_spotify','');
INSERT INTO `wp_postmeta` VALUES (385,31,'_banda_spotify','field_banda_spotify');
INSERT INTO `wp_postmeta` VALUES (386,31,'banda_foto_1','32');
INSERT INTO `wp_postmeta` VALUES (387,31,'_banda_foto_1','field_banda_foto_1');
INSERT INTO `wp_postmeta` VALUES (388,31,'banda_foto_2','');
INSERT INTO `wp_postmeta` VALUES (389,31,'_banda_foto_2','field_banda_foto_2');
INSERT INTO `wp_postmeta` VALUES (390,31,'banda_foto_3','');
INSERT INTO `wp_postmeta` VALUES (391,31,'_banda_foto_3','field_banda_foto_3');
INSERT INTO `wp_postmeta` VALUES (392,31,'banda_foto_4','');
INSERT INTO `wp_postmeta` VALUES (393,31,'_banda_foto_4','field_banda_foto_4');
INSERT INTO `wp_postmeta` VALUES (394,31,'banda_foto_5','');
INSERT INTO `wp_postmeta` VALUES (395,31,'_banda_foto_5','field_banda_foto_5');
INSERT INTO `wp_postmeta` VALUES (396,31,'banda_foto_6','');
INSERT INTO `wp_postmeta` VALUES (397,31,'_banda_foto_6','field_banda_foto_6');
INSERT INTO `wp_postmeta` VALUES (398,31,'banda_foto_7','');
INSERT INTO `wp_postmeta` VALUES (399,31,'_banda_foto_7','field_banda_foto_7');
INSERT INTO `wp_postmeta` VALUES (400,31,'banda_foto_8','');
INSERT INTO `wp_postmeta` VALUES (401,31,'_banda_foto_8','field_banda_foto_8');
INSERT INTO `wp_postmeta` VALUES (402,31,'banda_musica_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (403,31,'_banda_musica_titulo_1','field_banda_musica_titulo_1');
INSERT INTO `wp_postmeta` VALUES (404,31,'banda_musica_url_1','');
INSERT INTO `wp_postmeta` VALUES (405,31,'_banda_musica_url_1','field_banda_musica_url_1');
INSERT INTO `wp_postmeta` VALUES (406,31,'banda_musica_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (407,31,'_banda_musica_titulo_2','field_banda_musica_titulo_2');
INSERT INTO `wp_postmeta` VALUES (408,31,'banda_musica_url_2','');
INSERT INTO `wp_postmeta` VALUES (409,31,'_banda_musica_url_2','field_banda_musica_url_2');
INSERT INTO `wp_postmeta` VALUES (410,31,'banda_musica_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (411,31,'_banda_musica_titulo_3','field_banda_musica_titulo_3');
INSERT INTO `wp_postmeta` VALUES (412,31,'banda_musica_url_3','');
INSERT INTO `wp_postmeta` VALUES (413,31,'_banda_musica_url_3','field_banda_musica_url_3');
INSERT INTO `wp_postmeta` VALUES (414,31,'banda_musica_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (415,31,'_banda_musica_titulo_4','field_banda_musica_titulo_4');
INSERT INTO `wp_postmeta` VALUES (416,31,'banda_musica_url_4','');
INSERT INTO `wp_postmeta` VALUES (417,31,'_banda_musica_url_4','field_banda_musica_url_4');
INSERT INTO `wp_postmeta` VALUES (418,31,'banda_musica_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (419,31,'_banda_musica_titulo_5','field_banda_musica_titulo_5');
INSERT INTO `wp_postmeta` VALUES (420,31,'banda_musica_url_5','');
INSERT INTO `wp_postmeta` VALUES (421,31,'_banda_musica_url_5','field_banda_musica_url_5');
INSERT INTO `wp_postmeta` VALUES (422,31,'banda_musica_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (423,31,'_banda_musica_titulo_6','field_banda_musica_titulo_6');
INSERT INTO `wp_postmeta` VALUES (424,31,'banda_musica_url_6','');
INSERT INTO `wp_postmeta` VALUES (425,31,'_banda_musica_url_6','field_banda_musica_url_6');
INSERT INTO `wp_postmeta` VALUES (426,31,'banda_clipe_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (427,31,'_banda_clipe_titulo_1','field_banda_clipe_titulo_1');
INSERT INTO `wp_postmeta` VALUES (428,31,'banda_clipe_url_1','');
INSERT INTO `wp_postmeta` VALUES (429,31,'_banda_clipe_url_1','field_banda_clipe_url_1');
INSERT INTO `wp_postmeta` VALUES (430,31,'banda_clipe_thumb_1','');
INSERT INTO `wp_postmeta` VALUES (431,31,'_banda_clipe_thumb_1','field_banda_clipe_thumb_1');
INSERT INTO `wp_postmeta` VALUES (432,31,'banda_clipe_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (433,31,'_banda_clipe_titulo_2','field_banda_clipe_titulo_2');
INSERT INTO `wp_postmeta` VALUES (434,31,'banda_clipe_url_2','');
INSERT INTO `wp_postmeta` VALUES (435,31,'_banda_clipe_url_2','field_banda_clipe_url_2');
INSERT INTO `wp_postmeta` VALUES (436,31,'banda_clipe_thumb_2','');
INSERT INTO `wp_postmeta` VALUES (437,31,'_banda_clipe_thumb_2','field_banda_clipe_thumb_2');
INSERT INTO `wp_postmeta` VALUES (438,31,'banda_clipe_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (439,31,'_banda_clipe_titulo_3','field_banda_clipe_titulo_3');
INSERT INTO `wp_postmeta` VALUES (440,31,'banda_clipe_url_3','');
INSERT INTO `wp_postmeta` VALUES (441,31,'_banda_clipe_url_3','field_banda_clipe_url_3');
INSERT INTO `wp_postmeta` VALUES (442,31,'banda_clipe_thumb_3','');
INSERT INTO `wp_postmeta` VALUES (443,31,'_banda_clipe_thumb_3','field_banda_clipe_thumb_3');
INSERT INTO `wp_postmeta` VALUES (444,31,'banda_clipe_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (445,31,'_banda_clipe_titulo_4','field_banda_clipe_titulo_4');
INSERT INTO `wp_postmeta` VALUES (446,31,'banda_clipe_url_4','');
INSERT INTO `wp_postmeta` VALUES (447,31,'_banda_clipe_url_4','field_banda_clipe_url_4');
INSERT INTO `wp_postmeta` VALUES (448,31,'banda_clipe_thumb_4','');
INSERT INTO `wp_postmeta` VALUES (449,31,'_banda_clipe_thumb_4','field_banda_clipe_thumb_4');
INSERT INTO `wp_postmeta` VALUES (450,31,'banda_clipe_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (451,31,'_banda_clipe_titulo_5','field_banda_clipe_titulo_5');
INSERT INTO `wp_postmeta` VALUES (452,31,'banda_clipe_url_5','');
INSERT INTO `wp_postmeta` VALUES (453,31,'_banda_clipe_url_5','field_banda_clipe_url_5');
INSERT INTO `wp_postmeta` VALUES (454,31,'banda_clipe_thumb_5','');
INSERT INTO `wp_postmeta` VALUES (455,31,'_banda_clipe_thumb_5','field_banda_clipe_thumb_5');
INSERT INTO `wp_postmeta` VALUES (456,31,'banda_clipe_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (457,31,'_banda_clipe_titulo_6','field_banda_clipe_titulo_6');
INSERT INTO `wp_postmeta` VALUES (458,31,'banda_clipe_url_6','');
INSERT INTO `wp_postmeta` VALUES (459,31,'_banda_clipe_url_6','field_banda_clipe_url_6');
INSERT INTO `wp_postmeta` VALUES (460,31,'banda_clipe_thumb_6','');
INSERT INTO `wp_postmeta` VALUES (461,31,'_banda_clipe_thumb_6','field_banda_clipe_thumb_6');
INSERT INTO `wp_postmeta` VALUES (464,1001,'banda_bio','<p>Roberta Moura integra a cena de samba de Porto Alegre, com repertório voltado ao gênero e à música brasileira.</p><p><strong>Perfil demonstrativo:</strong> revise e complemente a biografia antes da publicação definitiva.</p>');
INSERT INTO `wp_postmeta` VALUES (465,1001,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (466,1001,'banda_cidade','Porto Alegre / RS');
INSERT INTO `wp_postmeta` VALUES (467,1001,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (468,1001,'banda_instagram','https://www.instagram.com/robertamouracantora/');
INSERT INTO `wp_postmeta` VALUES (469,1001,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (470,1002,'banda_bio','<p>Projeto de samba e pagode da cena de Porto Alegre.</p><p><strong>Perfil demonstrativo:</strong> texto criado para popular o ambiente de desenvolvimento do CSamba; revise antes da publicação definitiva.</p>');
INSERT INTO `wp_postmeta` VALUES (471,1002,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (472,1002,'banda_cidade','Porto Alegre / RS');
INSERT INTO `wp_postmeta` VALUES (473,1002,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (474,1002,'banda_instagram','https://www.instagram.com/cantor_ronaldo/');
INSERT INTO `wp_postmeta` VALUES (475,1002,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (476,1003,'banda_bio','Pagode dos Marqueza é um projeto ligado à cena de samba e pagode de Porto Alegre.\r\n\r\n<strong>Perfil demonstrativo:</strong> revise e complemente as informações oficiais antes da publicação definitiva.');
INSERT INTO `wp_postmeta` VALUES (477,1003,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (478,1003,'banda_cidade','Porto Alegre / RS');
INSERT INTO `wp_postmeta` VALUES (479,1003,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (480,1003,'banda_instagram','https://www.instagram.com/pagodedosmarqueza/');
INSERT INTO `wp_postmeta` VALUES (481,1003,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (482,1004,'banda_bio','Grupo do Bola faz parte do circuito de samba e pagode de Porto Alegre.\r\n\r\n<strong>Perfil demonstrativo:</strong> revise a biografia e acrescente formação, repertório e links oficiais quando desejar.');
INSERT INTO `wp_postmeta` VALUES (483,1004,'_banda_bio','field_banda_bio');
INSERT INTO `wp_postmeta` VALUES (484,1004,'banda_cidade','Porto Alegre / RS');
INSERT INTO `wp_postmeta` VALUES (485,1004,'_banda_cidade','field_banda_cidade');
INSERT INTO `wp_postmeta` VALUES (486,1004,'banda_instagram','https://www.instagram.com/grupodobola/');
INSERT INTO `wp_postmeta` VALUES (487,1004,'_banda_instagram','field_banda_instagram');
INSERT INTO `wp_postmeta` VALUES (488,1201,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (489,1201,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (490,1201,'evento_hora','18:00');
INSERT INTO `wp_postmeta` VALUES (491,1201,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (492,1201,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (493,1201,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (494,1202,'evento_data','20261009');
INSERT INTO `wp_postmeta` VALUES (495,1202,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (496,1202,'evento_hora','20:30');
INSERT INTO `wp_postmeta` VALUES (497,1202,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (498,1202,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (499,1202,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (500,1203,'evento_data','20261017');
INSERT INTO `wp_postmeta` VALUES (501,1203,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (502,1203,'evento_hora','21:00');
INSERT INTO `wp_postmeta` VALUES (503,1203,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (504,1203,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (505,1203,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (506,1204,'evento_data','20261025');
INSERT INTO `wp_postmeta` VALUES (507,1204,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (508,1204,'evento_hora','17:30');
INSERT INTO `wp_postmeta` VALUES (509,1204,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (510,1204,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (511,1204,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (512,1205,'evento_data','20261107');
INSERT INTO `wp_postmeta` VALUES (513,1205,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (514,1205,'evento_hora','19:00');
INSERT INTO `wp_postmeta` VALUES (515,1205,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (516,1205,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (517,1205,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (518,1206,'evento_data','20261115');
INSERT INTO `wp_postmeta` VALUES (519,1206,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (520,1206,'evento_hora','18:00');
INSERT INTO `wp_postmeta` VALUES (521,1206,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (522,1206,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (523,1206,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (524,1207,'evento_data','20261122');
INSERT INTO `wp_postmeta` VALUES (525,1207,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (526,1207,'evento_hora','18:30');
INSERT INTO `wp_postmeta` VALUES (527,1207,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (528,1207,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (529,1207,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (530,1208,'evento_data','20261129');
INSERT INTO `wp_postmeta` VALUES (531,1208,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (532,1208,'evento_hora','17:00');
INSERT INTO `wp_postmeta` VALUES (533,1208,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (534,1208,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (535,1208,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (536,1307,'_wp_attached_file','2026/09/gal.jpg');
INSERT INTO `wp_postmeta` VALUES (537,1307,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:15:\"2026/09/gal.jpg\";s:8:\"filesize\";i:129981;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:15:\"gal-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16457;}s:5:\"large\";a:5:{s:4:\"file\";s:17:\"gal-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:102558;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:15:\"gal-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5436;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:15:\"gal-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:67517;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:15:\"gal-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:25075;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:15:\"gal-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:63881;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:15:\"gal-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8043;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (538,29,'_thumbnail_id','1307');
INSERT INTO `wp_postmeta` VALUES (539,31,'_thumbnail_id','32');
INSERT INTO `wp_postmeta` VALUES (542,1106,'_edit_lock','1789334619:1');
INSERT INTO `wp_postmeta` VALUES (543,1105,'_edit_lock','1789334610:1');
INSERT INTO `wp_postmeta` VALUES (544,1310,'_wp_attached_file','2026/09/fruto.jpg');
INSERT INTO `wp_postmeta` VALUES (545,1310,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:17:\"2026/09/fruto.jpg\";s:8:\"filesize\";i:175943;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"fruto-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16358;}s:5:\"large\";a:5:{s:4:\"file\";s:19:\"fruto-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:136026;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"fruto-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4413;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:17:\"fruto-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:87215;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:17:\"fruto-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28502;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:17:\"fruto-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:81428;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:17:\"fruto-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7761;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (546,1106,'_thumbnail_id','1310');
INSERT INTO `wp_postmeta` VALUES (547,1106,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (548,1106,'casa_descricao','');
INSERT INTO `wp_postmeta` VALUES (549,1106,'_casa_descricao','field_casa_descricao');
INSERT INTO `wp_postmeta` VALUES (550,1106,'casa_tipo','');
INSERT INTO `wp_postmeta` VALUES (551,1106,'_casa_tipo','field_casa_tipo');
INSERT INTO `wp_postmeta` VALUES (552,1106,'casa_endereco','');
INSERT INTO `wp_postmeta` VALUES (553,1106,'_casa_endereco','field_casa_endereco');
INSERT INTO `wp_postmeta` VALUES (554,1106,'casa_numero','');
INSERT INTO `wp_postmeta` VALUES (555,1106,'_casa_numero','field_casa_numero');
INSERT INTO `wp_postmeta` VALUES (556,1106,'casa_complemento','');
INSERT INTO `wp_postmeta` VALUES (557,1106,'_casa_complemento','field_casa_complemento');
INSERT INTO `wp_postmeta` VALUES (558,1106,'casa_bairro','');
INSERT INTO `wp_postmeta` VALUES (559,1106,'_casa_bairro','field_casa_bairro');
INSERT INTO `wp_postmeta` VALUES (560,1106,'casa_cidade','');
INSERT INTO `wp_postmeta` VALUES (561,1106,'_casa_cidade','field_casa_cidade');
INSERT INTO `wp_postmeta` VALUES (562,1106,'casa_estado','RS');
INSERT INTO `wp_postmeta` VALUES (563,1106,'_casa_estado','field_casa_estado');
INSERT INTO `wp_postmeta` VALUES (564,1106,'casa_cep','');
INSERT INTO `wp_postmeta` VALUES (565,1106,'_casa_cep','field_casa_cep');
INSERT INTO `wp_postmeta` VALUES (566,1106,'casa_maps','');
INSERT INTO `wp_postmeta` VALUES (567,1106,'_casa_maps','field_casa_maps');
INSERT INTO `wp_postmeta` VALUES (568,1106,'casa_telefone','');
INSERT INTO `wp_postmeta` VALUES (569,1106,'_casa_telefone','field_casa_telefone');
INSERT INTO `wp_postmeta` VALUES (570,1106,'casa_whatsapp','');
INSERT INTO `wp_postmeta` VALUES (571,1106,'_casa_whatsapp','field_casa_whatsapp');
INSERT INTO `wp_postmeta` VALUES (572,1106,'casa_site','');
INSERT INTO `wp_postmeta` VALUES (573,1106,'_casa_site','field_casa_site');
INSERT INTO `wp_postmeta` VALUES (574,1106,'casa_instagram','');
INSERT INTO `wp_postmeta` VALUES (575,1106,'_casa_instagram','field_casa_instagram');
INSERT INTO `wp_postmeta` VALUES (576,1106,'casa_facebook','');
INSERT INTO `wp_postmeta` VALUES (577,1106,'_casa_facebook','field_casa_facebook');
INSERT INTO `wp_postmeta` VALUES (578,1106,'casa_horarios','');
INSERT INTO `wp_postmeta` VALUES (579,1106,'_casa_horarios','field_casa_horarios');
INSERT INTO `wp_postmeta` VALUES (580,1106,'casa_reservas','');
INSERT INTO `wp_postmeta` VALUES (581,1106,'_casa_reservas','field_casa_reservas');
INSERT INTO `wp_postmeta` VALUES (582,1106,'casa_ingressos','');
INSERT INTO `wp_postmeta` VALUES (583,1106,'_casa_ingressos','field_casa_ingressos');
INSERT INTO `wp_postmeta` VALUES (584,1106,'casa_acessibilidade','0');
INSERT INTO `wp_postmeta` VALUES (585,1106,'_casa_acessibilidade','field_casa_acessibilidade');
INSERT INTO `wp_postmeta` VALUES (586,1106,'casa_estacionamento','0');
INSERT INTO `wp_postmeta` VALUES (587,1106,'_casa_estacionamento','field_casa_estacionamento');
INSERT INTO `wp_postmeta` VALUES (588,1106,'casa_area_externa','0');
INSERT INTO `wp_postmeta` VALUES (589,1106,'_casa_area_externa','field_casa_area_externa');
INSERT INTO `wp_postmeta` VALUES (590,1106,'casa_comida','0');
INSERT INTO `wp_postmeta` VALUES (591,1106,'_casa_comida','field_casa_comida');
INSERT INTO `wp_postmeta` VALUES (592,1106,'casa_foto_1','');
INSERT INTO `wp_postmeta` VALUES (593,1106,'_casa_foto_1','field_casa_foto_1');
INSERT INTO `wp_postmeta` VALUES (594,1106,'casa_foto_2','');
INSERT INTO `wp_postmeta` VALUES (595,1106,'_casa_foto_2','field_casa_foto_2');
INSERT INTO `wp_postmeta` VALUES (596,1106,'casa_foto_3','');
INSERT INTO `wp_postmeta` VALUES (597,1106,'_casa_foto_3','field_casa_foto_3');
INSERT INTO `wp_postmeta` VALUES (598,1106,'casa_foto_4','');
INSERT INTO `wp_postmeta` VALUES (599,1106,'_casa_foto_4','field_casa_foto_4');
INSERT INTO `wp_postmeta` VALUES (600,1106,'casa_foto_5','');
INSERT INTO `wp_postmeta` VALUES (601,1106,'_casa_foto_5','field_casa_foto_5');
INSERT INTO `wp_postmeta` VALUES (602,1106,'casa_foto_6','');
INSERT INTO `wp_postmeta` VALUES (603,1106,'_casa_foto_6','field_casa_foto_6');
INSERT INTO `wp_postmeta` VALUES (604,1311,'_wp_attached_file','2026/09/Cambuca.jpg');
INSERT INTO `wp_postmeta` VALUES (605,1311,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:528;s:6:\"height\";i:528;s:4:\"file\";s:19:\"2026/09/Cambuca.jpg\";s:8:\"filesize\";i:20182;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"Cambuca-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6690;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"Cambuca-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2193;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:19:\"Cambuca-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14690;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:19:\"Cambuca-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4477;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (606,1105,'_thumbnail_id','1311');
INSERT INTO `wp_postmeta` VALUES (607,1105,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (608,1105,'casa_descricao','');
INSERT INTO `wp_postmeta` VALUES (609,1105,'_casa_descricao','field_casa_descricao');
INSERT INTO `wp_postmeta` VALUES (610,1105,'casa_tipo','');
INSERT INTO `wp_postmeta` VALUES (611,1105,'_casa_tipo','field_casa_tipo');
INSERT INTO `wp_postmeta` VALUES (612,1105,'casa_endereco','');
INSERT INTO `wp_postmeta` VALUES (613,1105,'_casa_endereco','field_casa_endereco');
INSERT INTO `wp_postmeta` VALUES (614,1105,'casa_numero','');
INSERT INTO `wp_postmeta` VALUES (615,1105,'_casa_numero','field_casa_numero');
INSERT INTO `wp_postmeta` VALUES (616,1105,'casa_complemento','');
INSERT INTO `wp_postmeta` VALUES (617,1105,'_casa_complemento','field_casa_complemento');
INSERT INTO `wp_postmeta` VALUES (618,1105,'casa_bairro','');
INSERT INTO `wp_postmeta` VALUES (619,1105,'_casa_bairro','field_casa_bairro');
INSERT INTO `wp_postmeta` VALUES (620,1105,'casa_cidade','');
INSERT INTO `wp_postmeta` VALUES (621,1105,'_casa_cidade','field_casa_cidade');
INSERT INTO `wp_postmeta` VALUES (622,1105,'casa_estado','RS');
INSERT INTO `wp_postmeta` VALUES (623,1105,'_casa_estado','field_casa_estado');
INSERT INTO `wp_postmeta` VALUES (624,1105,'casa_cep','');
INSERT INTO `wp_postmeta` VALUES (625,1105,'_casa_cep','field_casa_cep');
INSERT INTO `wp_postmeta` VALUES (626,1105,'casa_maps','');
INSERT INTO `wp_postmeta` VALUES (627,1105,'_casa_maps','field_casa_maps');
INSERT INTO `wp_postmeta` VALUES (628,1105,'casa_telefone','');
INSERT INTO `wp_postmeta` VALUES (629,1105,'_casa_telefone','field_casa_telefone');
INSERT INTO `wp_postmeta` VALUES (630,1105,'casa_whatsapp','');
INSERT INTO `wp_postmeta` VALUES (631,1105,'_casa_whatsapp','field_casa_whatsapp');
INSERT INTO `wp_postmeta` VALUES (632,1105,'casa_site','');
INSERT INTO `wp_postmeta` VALUES (633,1105,'_casa_site','field_casa_site');
INSERT INTO `wp_postmeta` VALUES (634,1105,'casa_instagram','');
INSERT INTO `wp_postmeta` VALUES (635,1105,'_casa_instagram','field_casa_instagram');
INSERT INTO `wp_postmeta` VALUES (636,1105,'casa_facebook','');
INSERT INTO `wp_postmeta` VALUES (637,1105,'_casa_facebook','field_casa_facebook');
INSERT INTO `wp_postmeta` VALUES (638,1105,'casa_horarios','');
INSERT INTO `wp_postmeta` VALUES (639,1105,'_casa_horarios','field_casa_horarios');
INSERT INTO `wp_postmeta` VALUES (640,1105,'casa_reservas','');
INSERT INTO `wp_postmeta` VALUES (641,1105,'_casa_reservas','field_casa_reservas');
INSERT INTO `wp_postmeta` VALUES (642,1105,'casa_ingressos','');
INSERT INTO `wp_postmeta` VALUES (643,1105,'_casa_ingressos','field_casa_ingressos');
INSERT INTO `wp_postmeta` VALUES (644,1105,'casa_acessibilidade','0');
INSERT INTO `wp_postmeta` VALUES (645,1105,'_casa_acessibilidade','field_casa_acessibilidade');
INSERT INTO `wp_postmeta` VALUES (646,1105,'casa_estacionamento','0');
INSERT INTO `wp_postmeta` VALUES (647,1105,'_casa_estacionamento','field_casa_estacionamento');
INSERT INTO `wp_postmeta` VALUES (648,1105,'casa_area_externa','0');
INSERT INTO `wp_postmeta` VALUES (649,1105,'_casa_area_externa','field_casa_area_externa');
INSERT INTO `wp_postmeta` VALUES (650,1105,'casa_comida','0');
INSERT INTO `wp_postmeta` VALUES (651,1105,'_casa_comida','field_casa_comida');
INSERT INTO `wp_postmeta` VALUES (652,1105,'casa_foto_1','');
INSERT INTO `wp_postmeta` VALUES (653,1105,'_casa_foto_1','field_casa_foto_1');
INSERT INTO `wp_postmeta` VALUES (654,1105,'casa_foto_2','');
INSERT INTO `wp_postmeta` VALUES (655,1105,'_casa_foto_2','field_casa_foto_2');
INSERT INTO `wp_postmeta` VALUES (656,1105,'casa_foto_3','');
INSERT INTO `wp_postmeta` VALUES (657,1105,'_casa_foto_3','field_casa_foto_3');
INSERT INTO `wp_postmeta` VALUES (658,1105,'casa_foto_4','');
INSERT INTO `wp_postmeta` VALUES (659,1105,'_casa_foto_4','field_casa_foto_4');
INSERT INTO `wp_postmeta` VALUES (660,1105,'casa_foto_5','');
INSERT INTO `wp_postmeta` VALUES (661,1105,'_casa_foto_5','field_casa_foto_5');
INSERT INTO `wp_postmeta` VALUES (662,1105,'casa_foto_6','');
INSERT INTO `wp_postmeta` VALUES (663,1105,'_casa_foto_6','field_casa_foto_6');
INSERT INTO `wp_postmeta` VALUES (664,1004,'_edit_lock','1789334196:1');
INSERT INTO `wp_postmeta` VALUES (665,1003,'_edit_lock','1789334885:1');
INSERT INTO `wp_postmeta` VALUES (666,1312,'_wp_attached_file','2026/09/bola3.jpg');
INSERT INTO `wp_postmeta` VALUES (667,1312,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1350;s:4:\"file\";s:17:\"2026/09/bola3.jpg\";s:8:\"filesize\";i:283186;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"bola3-240x300.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17140;}s:5:\"large\";a:5:{s:4:\"file\";s:18:\"bola3-819x1024.jpg\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:113295;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"bola3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7822;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:17:\"bola3-768x960.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:102671;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:17:\"bola3-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:33328;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:17:\"bola3-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:93525;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:17:\"bola3-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11023;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (668,1313,'_wp_attached_file','2026/09/752497438_18607036525060047_4305718100501582004_n.jpg');
INSERT INTO `wp_postmeta` VALUES (669,1313,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:61:\"2026/09/752497438_18607036525060047_4305718100501582004_n.jpg\";s:8:\"filesize\";i:158783;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17807;}s:5:\"large\";a:5:{s:4:\"file\";s:63:\"752497438_18607036525060047_4305718100501582004_n-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121079;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6641;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:75388;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:30316;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:86089;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:61:\"752497438_18607036525060047_4305718100501582004_n-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10021;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (670,1314,'_wp_attached_file','2026/09/bola2.jpg');
INSERT INTO `wp_postmeta` VALUES (671,1314,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:720;s:6:\"height\";i:1280;s:4:\"file\";s:17:\"2026/09/bola2.jpg\";s:8:\"filesize\";i:111332;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:17:\"bola2-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9533;}s:5:\"large\";a:5:{s:4:\"file\";s:18:\"bola2-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:59031;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"bola2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5969;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:17:\"bola2-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:25655;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:17:\"bola2-720x620.jpg\";s:5:\"width\";i:720;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:56118;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:17:\"bola2-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8066;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (672,1004,'_thumbnail_id','1313');
INSERT INTO `wp_postmeta` VALUES (673,1004,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (674,1004,'banda_formacao','');
INSERT INTO `wp_postmeta` VALUES (675,1004,'_banda_formacao','field_banda_formacao');
INSERT INTO `wp_postmeta` VALUES (676,1004,'banda_site','');
INSERT INTO `wp_postmeta` VALUES (677,1004,'_banda_site','field_banda_site');
INSERT INTO `wp_postmeta` VALUES (678,1004,'banda_youtube','');
INSERT INTO `wp_postmeta` VALUES (679,1004,'_banda_youtube','field_banda_youtube');
INSERT INTO `wp_postmeta` VALUES (680,1004,'banda_spotify','');
INSERT INTO `wp_postmeta` VALUES (681,1004,'_banda_spotify','field_banda_spotify');
INSERT INTO `wp_postmeta` VALUES (682,1004,'banda_foto_1','1314');
INSERT INTO `wp_postmeta` VALUES (683,1004,'_banda_foto_1','field_banda_foto_1');
INSERT INTO `wp_postmeta` VALUES (684,1004,'banda_foto_2','1312');
INSERT INTO `wp_postmeta` VALUES (685,1004,'_banda_foto_2','field_banda_foto_2');
INSERT INTO `wp_postmeta` VALUES (686,1004,'banda_foto_3','');
INSERT INTO `wp_postmeta` VALUES (687,1004,'_banda_foto_3','field_banda_foto_3');
INSERT INTO `wp_postmeta` VALUES (688,1004,'banda_foto_4','');
INSERT INTO `wp_postmeta` VALUES (689,1004,'_banda_foto_4','field_banda_foto_4');
INSERT INTO `wp_postmeta` VALUES (690,1004,'banda_foto_5','');
INSERT INTO `wp_postmeta` VALUES (691,1004,'_banda_foto_5','field_banda_foto_5');
INSERT INTO `wp_postmeta` VALUES (692,1004,'banda_foto_6','');
INSERT INTO `wp_postmeta` VALUES (693,1004,'_banda_foto_6','field_banda_foto_6');
INSERT INTO `wp_postmeta` VALUES (694,1004,'banda_foto_7','');
INSERT INTO `wp_postmeta` VALUES (695,1004,'_banda_foto_7','field_banda_foto_7');
INSERT INTO `wp_postmeta` VALUES (696,1004,'banda_foto_8','');
INSERT INTO `wp_postmeta` VALUES (697,1004,'_banda_foto_8','field_banda_foto_8');
INSERT INTO `wp_postmeta` VALUES (698,1004,'banda_musica_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (699,1004,'_banda_musica_titulo_1','field_banda_musica_titulo_1');
INSERT INTO `wp_postmeta` VALUES (700,1004,'banda_musica_url_1','');
INSERT INTO `wp_postmeta` VALUES (701,1004,'_banda_musica_url_1','field_banda_musica_url_1');
INSERT INTO `wp_postmeta` VALUES (702,1004,'banda_musica_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (703,1004,'_banda_musica_titulo_2','field_banda_musica_titulo_2');
INSERT INTO `wp_postmeta` VALUES (704,1004,'banda_musica_url_2','');
INSERT INTO `wp_postmeta` VALUES (705,1004,'_banda_musica_url_2','field_banda_musica_url_2');
INSERT INTO `wp_postmeta` VALUES (706,1004,'banda_musica_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (707,1004,'_banda_musica_titulo_3','field_banda_musica_titulo_3');
INSERT INTO `wp_postmeta` VALUES (708,1004,'banda_musica_url_3','');
INSERT INTO `wp_postmeta` VALUES (709,1004,'_banda_musica_url_3','field_banda_musica_url_3');
INSERT INTO `wp_postmeta` VALUES (710,1004,'banda_musica_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (711,1004,'_banda_musica_titulo_4','field_banda_musica_titulo_4');
INSERT INTO `wp_postmeta` VALUES (712,1004,'banda_musica_url_4','');
INSERT INTO `wp_postmeta` VALUES (713,1004,'_banda_musica_url_4','field_banda_musica_url_4');
INSERT INTO `wp_postmeta` VALUES (714,1004,'banda_musica_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (715,1004,'_banda_musica_titulo_5','field_banda_musica_titulo_5');
INSERT INTO `wp_postmeta` VALUES (716,1004,'banda_musica_url_5','');
INSERT INTO `wp_postmeta` VALUES (717,1004,'_banda_musica_url_5','field_banda_musica_url_5');
INSERT INTO `wp_postmeta` VALUES (718,1004,'banda_musica_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (719,1004,'_banda_musica_titulo_6','field_banda_musica_titulo_6');
INSERT INTO `wp_postmeta` VALUES (720,1004,'banda_musica_url_6','');
INSERT INTO `wp_postmeta` VALUES (721,1004,'_banda_musica_url_6','field_banda_musica_url_6');
INSERT INTO `wp_postmeta` VALUES (722,1004,'banda_clipe_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (723,1004,'_banda_clipe_titulo_1','field_banda_clipe_titulo_1');
INSERT INTO `wp_postmeta` VALUES (724,1004,'banda_clipe_url_1','');
INSERT INTO `wp_postmeta` VALUES (725,1004,'_banda_clipe_url_1','field_banda_clipe_url_1');
INSERT INTO `wp_postmeta` VALUES (726,1004,'banda_clipe_thumb_1','');
INSERT INTO `wp_postmeta` VALUES (727,1004,'_banda_clipe_thumb_1','field_banda_clipe_thumb_1');
INSERT INTO `wp_postmeta` VALUES (728,1004,'banda_clipe_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (729,1004,'_banda_clipe_titulo_2','field_banda_clipe_titulo_2');
INSERT INTO `wp_postmeta` VALUES (730,1004,'banda_clipe_url_2','');
INSERT INTO `wp_postmeta` VALUES (731,1004,'_banda_clipe_url_2','field_banda_clipe_url_2');
INSERT INTO `wp_postmeta` VALUES (732,1004,'banda_clipe_thumb_2','');
INSERT INTO `wp_postmeta` VALUES (733,1004,'_banda_clipe_thumb_2','field_banda_clipe_thumb_2');
INSERT INTO `wp_postmeta` VALUES (734,1004,'banda_clipe_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (735,1004,'_banda_clipe_titulo_3','field_banda_clipe_titulo_3');
INSERT INTO `wp_postmeta` VALUES (736,1004,'banda_clipe_url_3','');
INSERT INTO `wp_postmeta` VALUES (737,1004,'_banda_clipe_url_3','field_banda_clipe_url_3');
INSERT INTO `wp_postmeta` VALUES (738,1004,'banda_clipe_thumb_3','');
INSERT INTO `wp_postmeta` VALUES (739,1004,'_banda_clipe_thumb_3','field_banda_clipe_thumb_3');
INSERT INTO `wp_postmeta` VALUES (740,1004,'banda_clipe_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (741,1004,'_banda_clipe_titulo_4','field_banda_clipe_titulo_4');
INSERT INTO `wp_postmeta` VALUES (742,1004,'banda_clipe_url_4','');
INSERT INTO `wp_postmeta` VALUES (743,1004,'_banda_clipe_url_4','field_banda_clipe_url_4');
INSERT INTO `wp_postmeta` VALUES (744,1004,'banda_clipe_thumb_4','');
INSERT INTO `wp_postmeta` VALUES (745,1004,'_banda_clipe_thumb_4','field_banda_clipe_thumb_4');
INSERT INTO `wp_postmeta` VALUES (746,1004,'banda_clipe_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (747,1004,'_banda_clipe_titulo_5','field_banda_clipe_titulo_5');
INSERT INTO `wp_postmeta` VALUES (748,1004,'banda_clipe_url_5','');
INSERT INTO `wp_postmeta` VALUES (749,1004,'_banda_clipe_url_5','field_banda_clipe_url_5');
INSERT INTO `wp_postmeta` VALUES (750,1004,'banda_clipe_thumb_5','');
INSERT INTO `wp_postmeta` VALUES (751,1004,'_banda_clipe_thumb_5','field_banda_clipe_thumb_5');
INSERT INTO `wp_postmeta` VALUES (752,1004,'banda_clipe_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (753,1004,'_banda_clipe_titulo_6','field_banda_clipe_titulo_6');
INSERT INTO `wp_postmeta` VALUES (754,1004,'banda_clipe_url_6','');
INSERT INTO `wp_postmeta` VALUES (755,1004,'_banda_clipe_url_6','field_banda_clipe_url_6');
INSERT INTO `wp_postmeta` VALUES (756,1004,'banda_clipe_thumb_6','');
INSERT INTO `wp_postmeta` VALUES (757,1004,'_banda_clipe_thumb_6','field_banda_clipe_thumb_6');
INSERT INTO `wp_postmeta` VALUES (758,1315,'_wp_attached_file','2026/09/marquezas3.jpg');
INSERT INTO `wp_postmeta` VALUES (759,1315,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:720;s:6:\"height\";i:1280;s:4:\"file\";s:22:\"2026/09/marquezas3.jpg\";s:8:\"filesize\";i:216604;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"marquezas3-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18284;}s:5:\"large\";a:5:{s:4:\"file\";s:23:\"marquezas3-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:117547;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:22:\"marquezas3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9350;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:22:\"marquezas3-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:44477;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:22:\"marquezas3-720x620.jpg\";s:5:\"width\";i:720;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:104594;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:22:\"marquezas3-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13371;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (760,1316,'_wp_attached_file','2026/09/marquezas.jpg');
INSERT INTO `wp_postmeta` VALUES (761,1316,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:586;s:6:\"height\";i:586;s:4:\"file\";s:21:\"2026/09/marquezas.jpg\";s:8:\"filesize\";i:29127;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:21:\"marquezas-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10069;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:21:\"marquezas-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4218;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:21:\"marquezas-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18298;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:21:\"marquezas-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7204;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (762,1317,'_wp_attached_file','2026/09/marquezas2.jpg');
INSERT INTO `wp_postmeta` VALUES (763,1317,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:828;s:6:\"height\";i:1472;s:4:\"file\";s:22:\"2026/09/marquezas2.jpg\";s:8:\"filesize\";i:253820;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"marquezas2-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17476;}s:5:\"large\";a:5:{s:4:\"file\";s:23:\"marquezas2-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:120030;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:22:\"marquezas2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9420;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"marquezas2-768x1365.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1365;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:178917;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:22:\"marquezas2-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:44174;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:22:\"marquezas2-828x620.jpg\";s:5:\"width\";i:828;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:101785;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:22:\"marquezas2-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13991;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (764,1003,'_thumbnail_id','1316');
INSERT INTO `wp_postmeta` VALUES (765,1003,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (766,1003,'banda_formacao','');
INSERT INTO `wp_postmeta` VALUES (767,1003,'_banda_formacao','field_banda_formacao');
INSERT INTO `wp_postmeta` VALUES (768,1003,'banda_site','');
INSERT INTO `wp_postmeta` VALUES (769,1003,'_banda_site','field_banda_site');
INSERT INTO `wp_postmeta` VALUES (770,1003,'banda_youtube','');
INSERT INTO `wp_postmeta` VALUES (771,1003,'_banda_youtube','field_banda_youtube');
INSERT INTO `wp_postmeta` VALUES (772,1003,'banda_spotify','');
INSERT INTO `wp_postmeta` VALUES (773,1003,'_banda_spotify','field_banda_spotify');
INSERT INTO `wp_postmeta` VALUES (774,1003,'banda_foto_1','1317');
INSERT INTO `wp_postmeta` VALUES (775,1003,'_banda_foto_1','field_banda_foto_1');
INSERT INTO `wp_postmeta` VALUES (776,1003,'banda_foto_2','1315');
INSERT INTO `wp_postmeta` VALUES (777,1003,'_banda_foto_2','field_banda_foto_2');
INSERT INTO `wp_postmeta` VALUES (778,1003,'banda_foto_3','');
INSERT INTO `wp_postmeta` VALUES (779,1003,'_banda_foto_3','field_banda_foto_3');
INSERT INTO `wp_postmeta` VALUES (780,1003,'banda_foto_4','');
INSERT INTO `wp_postmeta` VALUES (781,1003,'_banda_foto_4','field_banda_foto_4');
INSERT INTO `wp_postmeta` VALUES (782,1003,'banda_foto_5','');
INSERT INTO `wp_postmeta` VALUES (783,1003,'_banda_foto_5','field_banda_foto_5');
INSERT INTO `wp_postmeta` VALUES (784,1003,'banda_foto_6','');
INSERT INTO `wp_postmeta` VALUES (785,1003,'_banda_foto_6','field_banda_foto_6');
INSERT INTO `wp_postmeta` VALUES (786,1003,'banda_foto_7','');
INSERT INTO `wp_postmeta` VALUES (787,1003,'_banda_foto_7','field_banda_foto_7');
INSERT INTO `wp_postmeta` VALUES (788,1003,'banda_foto_8','');
INSERT INTO `wp_postmeta` VALUES (789,1003,'_banda_foto_8','field_banda_foto_8');
INSERT INTO `wp_postmeta` VALUES (790,1003,'banda_musica_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (791,1003,'_banda_musica_titulo_1','field_banda_musica_titulo_1');
INSERT INTO `wp_postmeta` VALUES (792,1003,'banda_musica_url_1','');
INSERT INTO `wp_postmeta` VALUES (793,1003,'_banda_musica_url_1','field_banda_musica_url_1');
INSERT INTO `wp_postmeta` VALUES (794,1003,'banda_musica_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (795,1003,'_banda_musica_titulo_2','field_banda_musica_titulo_2');
INSERT INTO `wp_postmeta` VALUES (796,1003,'banda_musica_url_2','');
INSERT INTO `wp_postmeta` VALUES (797,1003,'_banda_musica_url_2','field_banda_musica_url_2');
INSERT INTO `wp_postmeta` VALUES (798,1003,'banda_musica_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (799,1003,'_banda_musica_titulo_3','field_banda_musica_titulo_3');
INSERT INTO `wp_postmeta` VALUES (800,1003,'banda_musica_url_3','');
INSERT INTO `wp_postmeta` VALUES (801,1003,'_banda_musica_url_3','field_banda_musica_url_3');
INSERT INTO `wp_postmeta` VALUES (802,1003,'banda_musica_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (803,1003,'_banda_musica_titulo_4','field_banda_musica_titulo_4');
INSERT INTO `wp_postmeta` VALUES (804,1003,'banda_musica_url_4','');
INSERT INTO `wp_postmeta` VALUES (805,1003,'_banda_musica_url_4','field_banda_musica_url_4');
INSERT INTO `wp_postmeta` VALUES (806,1003,'banda_musica_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (807,1003,'_banda_musica_titulo_5','field_banda_musica_titulo_5');
INSERT INTO `wp_postmeta` VALUES (808,1003,'banda_musica_url_5','');
INSERT INTO `wp_postmeta` VALUES (809,1003,'_banda_musica_url_5','field_banda_musica_url_5');
INSERT INTO `wp_postmeta` VALUES (810,1003,'banda_musica_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (811,1003,'_banda_musica_titulo_6','field_banda_musica_titulo_6');
INSERT INTO `wp_postmeta` VALUES (812,1003,'banda_musica_url_6','');
INSERT INTO `wp_postmeta` VALUES (813,1003,'_banda_musica_url_6','field_banda_musica_url_6');
INSERT INTO `wp_postmeta` VALUES (814,1003,'banda_clipe_titulo_1','');
INSERT INTO `wp_postmeta` VALUES (815,1003,'_banda_clipe_titulo_1','field_banda_clipe_titulo_1');
INSERT INTO `wp_postmeta` VALUES (816,1003,'banda_clipe_url_1','');
INSERT INTO `wp_postmeta` VALUES (817,1003,'_banda_clipe_url_1','field_banda_clipe_url_1');
INSERT INTO `wp_postmeta` VALUES (818,1003,'banda_clipe_thumb_1','');
INSERT INTO `wp_postmeta` VALUES (819,1003,'_banda_clipe_thumb_1','field_banda_clipe_thumb_1');
INSERT INTO `wp_postmeta` VALUES (820,1003,'banda_clipe_titulo_2','');
INSERT INTO `wp_postmeta` VALUES (821,1003,'_banda_clipe_titulo_2','field_banda_clipe_titulo_2');
INSERT INTO `wp_postmeta` VALUES (822,1003,'banda_clipe_url_2','');
INSERT INTO `wp_postmeta` VALUES (823,1003,'_banda_clipe_url_2','field_banda_clipe_url_2');
INSERT INTO `wp_postmeta` VALUES (824,1003,'banda_clipe_thumb_2','');
INSERT INTO `wp_postmeta` VALUES (825,1003,'_banda_clipe_thumb_2','field_banda_clipe_thumb_2');
INSERT INTO `wp_postmeta` VALUES (826,1003,'banda_clipe_titulo_3','');
INSERT INTO `wp_postmeta` VALUES (827,1003,'_banda_clipe_titulo_3','field_banda_clipe_titulo_3');
INSERT INTO `wp_postmeta` VALUES (828,1003,'banda_clipe_url_3','');
INSERT INTO `wp_postmeta` VALUES (829,1003,'_banda_clipe_url_3','field_banda_clipe_url_3');
INSERT INTO `wp_postmeta` VALUES (830,1003,'banda_clipe_thumb_3','');
INSERT INTO `wp_postmeta` VALUES (831,1003,'_banda_clipe_thumb_3','field_banda_clipe_thumb_3');
INSERT INTO `wp_postmeta` VALUES (832,1003,'banda_clipe_titulo_4','');
INSERT INTO `wp_postmeta` VALUES (833,1003,'_banda_clipe_titulo_4','field_banda_clipe_titulo_4');
INSERT INTO `wp_postmeta` VALUES (834,1003,'banda_clipe_url_4','');
INSERT INTO `wp_postmeta` VALUES (835,1003,'_banda_clipe_url_4','field_banda_clipe_url_4');
INSERT INTO `wp_postmeta` VALUES (836,1003,'banda_clipe_thumb_4','');
INSERT INTO `wp_postmeta` VALUES (837,1003,'_banda_clipe_thumb_4','field_banda_clipe_thumb_4');
INSERT INTO `wp_postmeta` VALUES (838,1003,'banda_clipe_titulo_5','');
INSERT INTO `wp_postmeta` VALUES (839,1003,'_banda_clipe_titulo_5','field_banda_clipe_titulo_5');
INSERT INTO `wp_postmeta` VALUES (840,1003,'banda_clipe_url_5','');
INSERT INTO `wp_postmeta` VALUES (841,1003,'_banda_clipe_url_5','field_banda_clipe_url_5');
INSERT INTO `wp_postmeta` VALUES (842,1003,'banda_clipe_thumb_5','');
INSERT INTO `wp_postmeta` VALUES (843,1003,'_banda_clipe_thumb_5','field_banda_clipe_thumb_5');
INSERT INTO `wp_postmeta` VALUES (844,1003,'banda_clipe_titulo_6','');
INSERT INTO `wp_postmeta` VALUES (845,1003,'_banda_clipe_titulo_6','field_banda_clipe_titulo_6');
INSERT INTO `wp_postmeta` VALUES (846,1003,'banda_clipe_url_6','');
INSERT INTO `wp_postmeta` VALUES (847,1003,'_banda_clipe_url_6','field_banda_clipe_url_6');
INSERT INTO `wp_postmeta` VALUES (848,1003,'banda_clipe_thumb_6','');
INSERT INTO `wp_postmeta` VALUES (849,1003,'_banda_clipe_thumb_6','field_banda_clipe_thumb_6');
INSERT INTO `wp_postmeta` VALUES (850,1201,'_edit_lock','1789700874:1');
INSERT INTO `wp_postmeta` VALUES (851,1201,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (852,1201,'evento_banda','');
INSERT INTO `wp_postmeta` VALUES (853,1201,'_evento_banda','field_evento_banda');
INSERT INTO `wp_postmeta` VALUES (854,1201,'evento_casa','');
INSERT INTO `wp_postmeta` VALUES (855,1201,'_evento_casa','field_evento_casa');
INSERT INTO `wp_postmeta` VALUES (856,1201,'evento_ingresso','');
INSERT INTO `wp_postmeta` VALUES (857,1201,'_evento_ingresso','field_evento_ingresso');
INSERT INTO `wp_postmeta` VALUES (860,2001,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (861,2001,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (862,2001,'evento_hora','18:00');
INSERT INTO `wp_postmeta` VALUES (863,2001,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (864,2001,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (865,2001,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (866,2001,'_csamba_import_casa_nome','Fruto Coletivo');
INSERT INTO `wp_postmeta` VALUES (867,2002,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (868,2002,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (869,2002,'evento_hora','19:00');
INSERT INTO `wp_postmeta` VALUES (870,2002,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (871,2002,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (872,2002,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (873,2002,'_csamba_import_casa_nome','Boteco Cambuca');
INSERT INTO `wp_postmeta` VALUES (874,2003,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (875,2003,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (876,2003,'evento_hora','20:00');
INSERT INTO `wp_postmeta` VALUES (877,2003,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (878,2003,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (879,2003,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (880,2003,'_csamba_import_casa_nome','Quintal do Cooler');
INSERT INTO `wp_postmeta` VALUES (881,2004,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (882,2004,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (883,2004,'evento_hora','20:30');
INSERT INTO `wp_postmeta` VALUES (884,2004,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (885,2004,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (886,2004,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (887,2004,'_csamba_import_casa_nome','Terreiro Bar');
INSERT INTO `wp_postmeta` VALUES (888,2005,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (889,2005,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (890,2005,'evento_hora','21:00');
INSERT INTO `wp_postmeta` VALUES (891,2005,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (892,2005,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (893,2005,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (894,2005,'_csamba_import_casa_nome','Gal Bar e Arte');
INSERT INTO `wp_postmeta` VALUES (895,2006,'evento_data','20260917');
INSERT INTO `wp_postmeta` VALUES (896,2006,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (897,2006,'evento_hora','22:00');
INSERT INTO `wp_postmeta` VALUES (898,2006,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (899,2006,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (900,2006,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (901,2006,'_csamba_import_casa_nome','A Palo Seco');
INSERT INTO `wp_postmeta` VALUES (902,2007,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (903,2007,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (904,2007,'evento_hora','18:30');
INSERT INTO `wp_postmeta` VALUES (905,2007,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (906,2007,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (907,2007,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (908,2007,'_csamba_import_casa_nome','Fruto Coletivo');
INSERT INTO `wp_postmeta` VALUES (909,2008,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (910,2008,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (911,2008,'evento_hora','19:30');
INSERT INTO `wp_postmeta` VALUES (912,2008,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (913,2008,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (914,2008,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (915,2008,'_csamba_import_casa_nome','Boteco Cambuca');
INSERT INTO `wp_postmeta` VALUES (916,2009,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (917,2009,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (918,2009,'evento_hora','20:00');
INSERT INTO `wp_postmeta` VALUES (919,2009,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (920,2009,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (921,2009,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (922,2009,'_csamba_import_casa_nome','JP Espetinhos');
INSERT INTO `wp_postmeta` VALUES (923,2010,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (924,2010,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (925,2010,'evento_hora','21:00');
INSERT INTO `wp_postmeta` VALUES (926,2010,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (927,2010,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (928,2010,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (929,2010,'_csamba_import_casa_nome','Gal Bar e Arte');
INSERT INTO `wp_postmeta` VALUES (930,2011,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (931,2011,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (932,2011,'evento_hora','22:00');
INSERT INTO `wp_postmeta` VALUES (933,2011,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (934,2011,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (935,2011,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (936,2011,'_csamba_import_casa_nome','Quintal do Cooler');
INSERT INTO `wp_postmeta` VALUES (937,2012,'evento_data','20260918');
INSERT INTO `wp_postmeta` VALUES (938,2012,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (939,2012,'evento_hora','23:00');
INSERT INTO `wp_postmeta` VALUES (940,2012,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (941,2012,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (942,2012,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (943,2012,'_csamba_import_casa_nome','A Palo Seco');
INSERT INTO `wp_postmeta` VALUES (944,2013,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (945,2013,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (946,2013,'evento_hora','16:00');
INSERT INTO `wp_postmeta` VALUES (947,2013,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (948,2013,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (949,2013,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (950,2013,'_csamba_import_casa_nome','Fruto Coletivo');
INSERT INTO `wp_postmeta` VALUES (951,2014,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (952,2014,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (953,2014,'evento_hora','17:30');
INSERT INTO `wp_postmeta` VALUES (954,2014,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (955,2014,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (956,2014,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (957,2014,'_csamba_import_casa_nome','Quintal do Cooler');
INSERT INTO `wp_postmeta` VALUES (958,2015,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (959,2015,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (960,2015,'evento_hora','19:00');
INSERT INTO `wp_postmeta` VALUES (961,2015,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (962,2015,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (963,2015,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (964,2015,'_csamba_import_casa_nome','Boteco Cambuca');
INSERT INTO `wp_postmeta` VALUES (965,2016,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (966,2016,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (967,2016,'evento_hora','20:30');
INSERT INTO `wp_postmeta` VALUES (968,2016,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (969,2016,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (970,2016,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (971,2016,'_csamba_import_casa_nome','Gal Bar e Arte');
INSERT INTO `wp_postmeta` VALUES (972,2017,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (973,2017,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (974,2017,'evento_hora','22:00');
INSERT INTO `wp_postmeta` VALUES (975,2017,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (976,2017,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (977,2017,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (978,2017,'_csamba_import_casa_nome','Terreiro Bar');
INSERT INTO `wp_postmeta` VALUES (979,2018,'evento_data','20260919');
INSERT INTO `wp_postmeta` VALUES (980,2018,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (981,2018,'evento_hora','23:30');
INSERT INTO `wp_postmeta` VALUES (982,2018,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (983,2018,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (984,2018,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (985,2018,'_csamba_import_casa_nome','A Palo Seco');
INSERT INTO `wp_postmeta` VALUES (986,2019,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (987,2019,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (988,2019,'evento_hora','16:00');
INSERT INTO `wp_postmeta` VALUES (989,2019,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (990,2019,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (991,2019,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (992,2019,'_csamba_import_casa_nome','JP Espetinhos');
INSERT INTO `wp_postmeta` VALUES (993,2020,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (994,2020,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (995,2020,'evento_hora','17:00');
INSERT INTO `wp_postmeta` VALUES (996,2020,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (997,2020,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (998,2020,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (999,2020,'_csamba_import_casa_nome','Fruto Coletivo');
INSERT INTO `wp_postmeta` VALUES (1000,2021,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (1001,2021,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (1002,2021,'evento_hora','18:00');
INSERT INTO `wp_postmeta` VALUES (1003,2021,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (1004,2021,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (1005,2021,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (1006,2021,'_csamba_import_casa_nome','Quintal do Cooler');
INSERT INTO `wp_postmeta` VALUES (1007,2022,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (1008,2022,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (1009,2022,'evento_hora','19:00');
INSERT INTO `wp_postmeta` VALUES (1010,2022,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (1011,2022,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (1012,2022,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (1013,2022,'_csamba_import_casa_nome','Boteco Cambuca');
INSERT INTO `wp_postmeta` VALUES (1014,2023,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (1015,2023,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (1016,2023,'evento_hora','20:30');
INSERT INTO `wp_postmeta` VALUES (1017,2023,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (1018,2023,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (1019,2023,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (1020,2023,'_csamba_import_casa_nome','Gal Bar e Arte');
INSERT INTO `wp_postmeta` VALUES (1021,2024,'evento_data','20260920');
INSERT INTO `wp_postmeta` VALUES (1022,2024,'_evento_data','field_evento_data');
INSERT INTO `wp_postmeta` VALUES (1023,2024,'evento_hora','21:30');
INSERT INTO `wp_postmeta` VALUES (1024,2024,'_evento_hora','field_evento_hora');
INSERT INTO `wp_postmeta` VALUES (1025,2024,'evento_cidade','Porto Alegre');
INSERT INTO `wp_postmeta` VALUES (1026,2024,'_evento_cidade','field_evento_cidade');
INSERT INTO `wp_postmeta` VALUES (1027,2024,'_csamba_import_casa_nome','Terreiro Bar');
INSERT INTO `wp_postmeta` VALUES (1028,2024,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1029,2024,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1030,2023,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1031,2023,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1032,2022,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1033,2022,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1034,2021,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1035,2021,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1036,2020,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1037,2020,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1038,2019,'_wp_old_date','2026-09-20');
INSERT INTO `wp_postmeta` VALUES (1039,2019,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1040,2018,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1041,2018,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1042,2017,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1043,2017,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1044,2016,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1045,2016,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1046,2015,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1047,2015,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1048,2014,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1049,2014,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1050,2013,'_wp_old_date','2026-09-19');
INSERT INTO `wp_postmeta` VALUES (1051,2013,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1052,2012,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1053,2011,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1054,2010,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1055,2009,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1056,2008,'_edit_last','1');
INSERT INTO `wp_postmeta` VALUES (1057,2007,'_edit_last','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=2025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2026-08-23 23:22:34','2026-08-24 02:22:34','<!-- wp:paragraph -->\n<p>Boas-vindas ao WordPress. Esse é o seu primeiro post. Edite-o ou exclua-o, e então comece a escrever!</p>\n<!-- /wp:paragraph -->','Olá, mundo!','','publish','open','open','','ola-mundo','','','2026-08-23 23:22:34','2026-08-24 02:22:34','',0,'http://csamba.local/?p=1',0,'post','',1);
INSERT INTO `wp_posts` VALUES (2,1,'2026-08-23 23:22:34','2026-08-24 02:22:34','<!-- wp:paragraph -->\n<p>Esta é uma página de exemplo. É diferente de um post no blog porque ela permanecerá em um lugar e aparecerá na navegação do seu site na maioria dos temas. Muitas pessoas começam com uma página que as apresenta a possíveis visitantes do site. Ela pode dizer algo assim:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>Olá! Eu sou um mensageiro de bicicleta durante o dia, ator aspirante à noite, e este é o meu site. Eu moro em São Paulo, tenho um grande cachorro chamado Rex e gosto de tomar caipirinha (e banhos de chuva).</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...ou alguma coisa assim:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>A Companhia de Miniaturas XYZ foi fundada em 1971, e desde então tem fornecido miniaturas de qualidade ao público. Localizada na cidade de Itu, a XYZ emprega mais de 2.000 pessoas e faz coisas grandiosas para a comunidade da cidade.</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como um novo usuário do WordPress, você deveria ir ao <a href=\"http://csamba.local/wp-admin/\">painel</a> para excluir essa página e criar novas páginas para o seu conteúdo. Divirta-se!</p>\n<!-- /wp:paragraph -->','Página de exemplo','','publish','closed','open','','pagina-exemplo','','','2026-08-23 23:22:34','2026-08-24 02:22:34','',0,'http://csamba.local/?page_id=2',0,'page','',0);
INSERT INTO `wp_posts` VALUES (3,1,'2026-08-23 23:22:34','2026-08-24 02:22:34','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Quem somos</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>O endereço do nosso site é: http://csamba.local.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comentários</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Quando os visitantes deixam comentários no site, coletamos os dados mostrados no formulário de comentários, além do endereço de IP e de dados do navegador do visitante, para auxiliar na detecção de spam.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Uma sequência anonimizada de caracteres criada a partir do seu e-mail (também chamada de hash) poderá ser enviada para o Gravatar para verificar se você usa o serviço. A política de privacidade do Gravatar está disponível aqui: https://automattic.com/privacy/. Depois da aprovação do seu comentário, a foto do seu perfil fica visível publicamente junto de seu comentário.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Mídia</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Se você envia imagens para o site, evite enviar as que contenham dados de localização incorporados (EXIF GPS). Visitantes podem baixar estas imagens do site e extrair delas seus dados de localização.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Ao deixar um comentário no site, você poderá optar por salvar seu nome, e-mail e site nos cookies. Isso visa seu conforto, assim você não precisará preencher seus  dados novamente quando fizer outro comentário. Estes cookies duram um ano.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Se você tem uma conta e acessa este site, um cookie temporário será criado para determinar se seu navegador aceita cookies. Ele não contém nenhum dado pessoal e será descartado quando você fechar seu navegador.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Quando você acessa sua conta no site, também criamos vários cookies para salvar os dados da sua conta e suas escolhas de exibição de tela. Cookies de login são mantidos por dois dias e cookies de opções de tela por um ano. Se você selecionar &quot;Lembrar-me&quot;, seu acesso será mantido por duas semanas. Se você se desconectar da sua conta, os cookies de login serão removidos.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Se você editar ou publicar um artigo, um cookie adicional será salvo no seu navegador. Este cookie não inclui nenhum dado pessoal e simplesmente indica o ID do post referente ao artigo que você acabou de editar. Ele expira depois de 1 dia.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Mídia incorporada de outros sites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Artigos neste site podem incluir conteúdo incorporado como, por exemplo, vídeos, imagens, artigos, etc. Conteúdos incorporados de outros sites se comportam exatamente da mesma forma como se o visitante estivesse visitando o outro site.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Estes sites podem coletar dados sobre você, usar cookies, incorporar rastreamento adicional de terceiros e monitorar sua interação com este conteúdo incorporado, incluindo sua interação com o conteúdo incorporado se você tem uma conta e está conectado com o site.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Com quem compartilhamos seus dados</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Se você solicitar uma redefinição de senha, seu endereço de IP será incluído no e-mail de redefinição de senha.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Por quanto tempo mantemos os seus dados</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Se você deixar um comentário, o comentário e os seus metadados são conservados indefinidamente. Fazemos isso para que seja possível reconhecer e aprovar automaticamente qualquer comentário posterior ao invés de retê-lo para moderação.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>Para usuários que se registram no nosso site (se houver), também guardamos as informações pessoais que fornecem no seu perfil de usuário. Todos os usuários podem ver, editar ou excluir suas informações pessoais a qualquer momento (só não é possível alterar o seu username). Os administradores de sites também podem ver e editar estas informações.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Quais os seus direitos sobre seus dados</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Se você tiver uma conta neste site ou se tiver deixado comentários, pode solicitar um arquivo exportado dos dados pessoais que mantemos sobre você, inclusive quaisquer dados que nos tenha fornecido. Também pode solicitar que removamos qualquer dado pessoal que mantemos sobre você. Isto não inclui nenhuns dados que somos obrigados a manter para propósitos administrativos, legais ou de segurança.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Para onde seus dados são enviados</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Texto sugerido: </strong>Comentários de visitantes podem ser marcados por um serviço automático de detecção de spam.</p>\n<!-- /wp:paragraph -->\n','Política de privacidade','','draft','closed','open','','politica-de-privacidade','','','2026-08-23 23:22:34','2026-08-24 02:22:34','',0,'http://csamba.local/?page_id=3',0,'page','',0);
INSERT INTO `wp_posts` VALUES (4,0,'2026-08-24 22:46:26','2026-08-25 01:46:26','<!-- wp:page-list /-->','Navegação','','publish','closed','closed','','navigation','','','2026-08-24 22:46:26','2026-08-25 01:46:26','',0,'http://csamba.local/navigation/',0,'wp_navigation','',0);
INSERT INTO `wp_posts` VALUES (6,1,'2026-08-25 01:31:08','2026-08-25 04:31:08','','ViroZueira','','publish','closed','closed','','virozueira','','','2026-08-26 01:59:31','2026-08-26 04:59:31','',0,'http://csamba.local/?post_type=banda&#038;p=6',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (7,1,'2026-08-25 01:28:48','2026-08-25 04:28:48','{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }','Custom Styles','','publish','closed','closed','','wp-global-styles-csamba','','','2026-08-25 01:28:48','2026-08-25 04:28:48','',0,'http://csamba.local/wp-global-styles-csamba/',0,'wp_global_styles','',0);
INSERT INTO `wp_posts` VALUES (8,1,'2026-08-25 23:41:16','2026-08-26 02:41:16','','volto-evnto2','','inherit','open','closed','','volto-evnto2','','','2026-08-25 23:41:16','2026-08-26 02:41:16','',6,'http://csamba.local/wp-content/uploads/2026/08/volto-evnto2.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (9,1,'2026-08-25 23:41:17','2026-08-26 02:41:17','','volto-evnto','','inherit','open','closed','','volto-evnto','','','2026-08-25 23:41:17','2026-08-26 02:41:17','',6,'http://csamba.local/wp-content/uploads/2026/08/volto-evnto.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (10,1,'2026-08-25 23:41:18','2026-08-26 02:41:18','','volto-2','','inherit','open','closed','','volto-2','','','2026-08-25 23:41:18','2026-08-26 02:41:18','',6,'http://csamba.local/wp-content/uploads/2026/08/volto-2.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (11,1,'2026-08-25 23:41:19','2026-08-26 02:41:19','','volto','','inherit','open','closed','','volto','','','2026-08-25 23:41:19','2026-08-26 02:41:19','',6,'http://csamba.local/wp-content/uploads/2026/08/volto.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (12,1,'2026-08-25 23:41:20','2026-08-26 02:41:20','','virozueira-copa','','inherit','open','closed','','virozueira-copa','','','2026-08-25 23:41:20','2026-08-26 02:41:20','',6,'http://csamba.local/wp-content/uploads/2026/08/virozueira-copa.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (13,1,'2026-08-25 23:41:20','2026-08-26 02:41:20','','virozueira-evento2','','inherit','open','closed','','virozueira-evento2','','','2026-08-25 23:41:20','2026-08-26 02:41:20','',6,'http://csamba.local/wp-content/uploads/2026/08/virozueira-evento2.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (14,1,'2026-08-25 23:41:21','2026-08-26 02:41:21','','virozueira-evento','','inherit','open','closed','','virozueira-evento','','','2026-08-25 23:41:21','2026-08-26 02:41:21','',6,'http://csamba.local/wp-content/uploads/2026/08/virozueira-evento.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (15,1,'2026-08-25 23:41:22','2026-08-26 02:41:22','','virozueira','','inherit','open','closed','','virozueira-2','','','2026-08-25 23:41:22','2026-08-26 02:41:22','',6,'http://csamba.local/wp-content/uploads/2026/08/virozueira.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (17,1,'2026-08-26 01:38:37','2026-08-26 04:38:37','{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }','Custom Styles','','publish','closed','closed','','wp-global-styles-csamba-theme-v0-4','','','2026-08-26 01:38:37','2026-08-26 04:38:37','',0,'http://csamba.local/wp-global-styles-csamba-theme-v0-4/',0,'wp_global_styles','',0);
INSERT INTO `wp_posts` VALUES (18,1,'2026-08-26 02:01:17','2026-08-26 05:01:17','','Grupo ViroZueira é o destaque da semana','','publish','closed','closed','','18','','','2026-09-02 00:43:47','2026-09-02 03:43:47','',0,'http://csamba.local/?post_type=destaque&#038;p=18',0,'destaque','',0);
INSERT INTO `wp_posts` VALUES (19,1,'2026-08-26 02:03:20','2026-08-26 05:03:20','','Grupo ViroZueira','','inherit','closed','closed','','18-autosave-v1','','','2026-08-26 02:03:20','2026-08-26 05:03:20','',18,'http://csamba.local/?p=19',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2026-08-26 02:05:48','2026-08-26 05:05:48','','Volto pra te ver','','publish','closed','closed','','volto-pra-te-ver','','','2026-08-26 02:05:48','2026-08-26 05:05:48','',0,'http://csamba.local/?post_type=banda&#038;p=20',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2026-08-26 02:08:11','2026-08-26 05:08:11','','Volto pra te ver nessa quarta','','publish','closed','closed','','volto-pra-te-ver-nessa-quarta','','','2026-09-03 23:33:05','2026-09-04 02:33:05','',0,'http://csamba.local/?post_type=destaque&#038;p=21',0,'destaque','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2026-08-26 02:30:13','2026-08-26 05:30:13','','Mukifo','','publish','closed','closed','','mukifo','','','2026-09-02 01:41:06','2026-09-02 04:41:06','',0,'http://csamba.local/?post_type=casa&#038;p=22',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (23,1,'2026-08-26 02:28:19','2026-08-26 05:28:19','','mukifo3','','inherit','open','closed','','mukifo3','','','2026-08-26 02:28:19','2026-08-26 05:28:19','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo3.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (24,1,'2026-08-26 02:28:20','2026-08-26 05:28:20','','mukifo','','inherit','open','closed','','mukifo','','','2026-08-26 02:28:20','2026-08-26 05:28:20','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (25,1,'2026-08-26 02:28:20','2026-08-26 05:28:20','','mukifo2','','inherit','open','closed','','mukifo2','','','2026-08-26 02:28:20','2026-08-26 05:28:20','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo2.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (28,1,'2026-09-03 21:21:10','2026-09-04 00:21:10','','Volto pra te ver nessa quarta','','inherit','closed','closed','','21-autosave-v1','','','2026-09-03 21:21:10','2026-09-04 00:21:10','',21,'http://csamba.local/?p=28',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (29,1,'2026-09-13 17:39:16','2026-09-13 20:39:16','','Gal Bar e Arte','','publish','closed','closed','','gal-bar-e-arte','','','2026-09-13 17:52:34','2026-09-13 20:52:34','',0,'http://csamba.local/?post_type=casa&#038;p=29',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (30,1,'2026-09-13 17:39:24','0000-00-00 00:00:00','','Rascunho automático','','auto-draft','open','open','','','','','2026-09-13 17:39:24','0000-00-00 00:00:00','',0,'http://csamba.local/?p=30',0,'post','',0);
INSERT INTO `wp_posts` VALUES (31,1,'2026-09-13 17:42:32','2026-09-13 20:42:32','','Thiago Ribeiro e amigos','','publish','closed','closed','','thiago-ribeiro-e-amigos','','','2026-09-13 18:11:45','2026-09-13 21:11:45','',0,'http://csamba.local/?post_type=banda&#038;p=31',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (32,1,'2026-09-13 17:41:54','2026-09-13 20:41:54','','Thiago-fruto','','inherit','open','closed','','thiago-fruto','','','2026-09-13 17:41:54','2026-09-13 20:41:54','',31,'http://csamba.local/wp-content/uploads/2026/09/Thiago-fruto.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (33,1,'2026-09-13 17:41:55','2026-09-13 20:41:55','','Thiago-gal','','inherit','open','closed','','thiago-gal','','','2026-09-13 17:41:55','2026-09-13 20:41:55','',31,'http://csamba.local/wp-content/uploads/2026/09/Thiago-gal.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (34,1,'2026-09-13 17:41:55','2026-09-13 20:41:55','','Thiago','','inherit','open','closed','','thiago','','','2026-09-13 17:41:55','2026-09-13 20:41:55','',31,'http://csamba.local/wp-content/uploads/2026/09/Thiago.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1001,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Roberta Moura integra a cena de samba de Porto Alegre, com repertório voltado ao gênero e à música brasileira.</p><p><strong>Perfil demonstrativo:</strong> revise e complemente a biografia antes da publicação definitiva.</p>','Roberta Moura','Samba e música brasileira em Porto Alegre.','publish','closed','closed','','roberta-moura','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=banda&amp;p=1001',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (1002,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Projeto de samba e pagode da cena de Porto Alegre.</p><p><strong>Perfil demonstrativo:</strong> texto criado para popular o ambiente de desenvolvimento do CSamba; revise antes da publicação definitiva.</p>','Pagode do Ronaldo','Pagode e samba para cantar junto.','publish','closed','closed','','pagode-do-ronaldo','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=banda&amp;p=1002',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (1003,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Pagode dos Marqueza é um projeto ligado à cena de samba e pagode de Porto Alegre.</p><p><strong>Perfil demonstrativo:</strong> revise e complemente as informações oficiais antes da publicação definitiva.</p>','Pagode dos Marqueza','Roda de pagode da cena porto-alegrense.','publish','closed','closed','','pagode-dos-marqueza','','','2026-09-13 18:19:51','2026-09-13 21:19:51','',0,'http://csamba.local/?post_type=banda&#038;p=1003',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (1004,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Grupo do Bola faz parte do circuito de samba e pagode de Porto Alegre.</p><p><strong>Perfil demonstrativo:</strong> revise a biografia e acrescente formação, repertório e links oficiais quando desejar.</p>','Grupo do Bola','Samba e pagode em Porto Alegre.','publish','closed','closed','','grupo-do-bola','','','2026-09-13 18:16:36','2026-09-13 21:16:36','',0,'http://csamba.local/?post_type=banda&#038;p=1004',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (1101,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Espaço de música ao vivo em Porto Alegre, com programação que inclui samba e pagode.</p><p>Endereço: Av. Baltazar de Oliveira Garcia, 3868 — Rubem Berta, Porto Alegre.</p><p>Instagram: <a href=\"https://www.instagram.com/quintaldocooler/\">@quintaldocooler</a></p>','Quintal do Cooler','Casa com programação de samba, pagode e música ao vivo em Porto Alegre.','publish','closed','closed','','quintal-do-cooler','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=casa&amp;p=1101',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1102,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Bar localizado na Cidade Baixa, em Porto Alegre.</p><p>Endereço: Rua Luiz Afonso, 247 — Cidade Baixa, Porto Alegre.</p><p>Instagram: <a href=\"https://www.instagram.com/terreiro.bar/\">@terreiro.bar</a></p>','Terreiro Bar Ancestral','Bar na Cidade Baixa, em Porto Alegre.','publish','closed','closed','','terreiro-bar-ancestral','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=casa&amp;p=1102',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1103,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Bar com música ao vivo na Cidade Baixa, em Porto Alegre.</p><p>Endereço: Travessa dos Venezianos, 25 — Cidade Baixa, Porto Alegre.</p><p>Instagram: <a href=\"https://www.instagram.com/apalosecocb/\">@apalosecocb</a></p>','A Palo Seco','Bar com música ao vivo na Cidade Baixa.','publish','closed','closed','','a-palo-seco','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=casa&amp;p=1103',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1104,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>Espaço porto-alegrense cuja história está ligada ao samba, aos espetinhos e ao encontro entre amigos.</p><p>Instagram: <a href=\"https://www.instagram.com/jpespetinhos/\">@jpespetinhos</a></p><p><strong>Cadastro inicial:</strong> confirme endereço e demais informações diretamente com a casa antes da publicação definitiva.</p>','JP Espetinhos','Espetinhos, encontro e samba em Porto Alegre.','publish','closed','closed','','jp-espetinhos','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=casa&amp;p=1104',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1105,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>O Boteco Cambucá fica na Cidade Baixa e tem uma proposta ligada à valorização da cultura brasileira, com destaque para cachaças artesanais, drinks e programação cultural.</p>\n<p>Endereço: Rua José do Patrocínio, 1254 — Cidade Baixa, Porto Alegre.</p>\n<p>Instagram: <a href=\"https://www.instagram.com/boteco.cambuca/\">@boteco.cambuca</a></p>','Boteco Cambucá','Boteco da Cidade Baixa dedicado a sabores brasileiros, cachaças artesanais e programação cultural.','publish','closed','closed','','boteco-cambuca','','','2026-09-13 18:13:23','2026-09-13 21:13:23','',0,'http://csamba.local/?post_type=casa&#038;p=1105',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1106,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p>O Fruto Coletivo é um bar e restaurante localizado na Cidade Baixa, em Porto Alegre, próximo à Praça Garibaldi.</p>\n<p>Endereço: Rua José do Patrocínio, 1062 — Cidade Baixa, Porto Alegre.</p>\n<p>Instagram: <a href=\"https://www.instagram.com/frutocoletivo/\">@frutocoletivo</a></p>','Fruto Coletivo','Bar e restaurante na Cidade Baixa, em Porto Alegre.','publish','closed','closed','','fruto-coletivo','','','2026-09-13 18:12:51','2026-09-13 21:12:51','',0,'http://csamba.local/?post_type=casa&#038;p=1106',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (1201,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Uma roda de samba para fechar o domingo com repertório brasileiro e clima de quintal.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Roda de Domingo — Roberta Moura','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','roda-de-domingo-roberta-moura','','','2026-09-17 00:44:31','2026-09-17 03:44:31','',0,'http://csamba.local/?post_type=evento&#038;p=1201',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1202,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Noite de pagode com repertório para cantar junto e abrir o fim de semana.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Pagode de Sexta — Pagode do Ronaldo','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','pagode-de-sexta-pagode-do-ronaldo','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1202',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1203,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Uma noite dedicada ao samba e ao pagode no coração da Cidade Baixa.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Samba na Cidade Baixa — Grupo do Bola','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','samba-na-cidade-baixa-grupo-do-bola','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1203',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1204,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Fim de tarde com Pagode dos Marqueza e repertório de samba e pagode.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Domingo dos Marqueza','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','domingo-dos-marqueza','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1204',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1205,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Evento demonstrativo para testar cards, agenda, filtros e páginas internas do CSamba.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Encontro CSamba — Roda Aberta','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','encontro-csamba-roda-aberta','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1205',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1206,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Evento demonstrativo de primavera com roda de samba e convidados.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Samba de Primavera','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','samba-de-primavera','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1206',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1207,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Evento demonstrativo para preenchimento da agenda do site.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Pagode no Quintal','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','pagode-no-quintal','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1207',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1208,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Evento demonstrativo de encerramento do mês no calendário do CSamba.</p><p>Este cadastro existe para popular e testar a agenda do CSamba. Não representa programação oficial. Confirme os dados antes de publicar como evento real.</p>','Roda de Encerramento do Mês','Evento demonstrativo para testes da agenda do CSamba.','publish','closed','closed','','roda-de-encerramento-do-mes','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=1208',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (1301,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo demonstrativo.</strong> O CSamba está preparando um guia para facilitar a descoberta de rodas, grupos, artistas e casas ligadas ao samba em Porto Alegre.</p><p>A proposta é concentrar agenda, perfis e novidades em um só lugar, valorizando a cena local e ajudando o público a encontrar onde tem samba.</p>','CSamba prepara novo guia de rodas de samba em Porto Alegre','O portal prepara uma área para reunir artistas, casas e eventos da cena local.','publish','closed','closed','','csamba-prepara-novo-guia-de-rodas-de-samba-em-porto-alegre','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1301',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1302,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo demonstrativo.</strong> Roberta Moura, Pagode do Ronaldo, Pagode dos Marqueza e Grupo do Bola passam a integrar a base inicial de artistas do CSamba.</p><p>Os perfis serão ampliados com agenda, fotos, vídeos, repertório e links oficiais.</p>','Conheça quatro nomes para acompanhar na cena de samba de Porto Alegre','Novos perfis entram no catálogo do CSamba.','publish','closed','closed','','conheca-quatro-nomes-para-acompanhar-na-cena-de-samba-de-porto-alegre','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1302',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1303,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo demonstrativo.</strong> A seção Casas foi criada para reunir espaços que recebem samba, pagode e música ao vivo em Porto Alegre.</p><p>A ideia é facilitar a consulta de programação e aproximar público, artistas e produtores.</p>','Casas de samba ganham espaço especial no CSamba','Nova seção reúne locais para quem quer encontrar música ao vivo.','publish','closed','closed','','casas-de-samba-ganham-espaco-especial-no-csamba','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1303',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1304,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo demonstrativo.</strong> A agenda do CSamba recebeu eventos fictícios para validar layout, ordenação por data e visualização dos cards.</p><p>Essas informações não representam programação oficial e devem ser substituídas ou confirmadas antes do lançamento público.</p>','Agenda CSamba começa a receber eventos de primavera','Calendário de testes ajuda a validar a nova experiência do site.','publish','closed','closed','','agenda-csamba-comeca-a-receber-eventos-de-primavera','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1304',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1305,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo editorial demonstrativo.</strong> Partido-alto, pagode, samba de raiz e releituras contemporâneas convivem na programação de uma cidade com público diverso.</p><p>O CSamba pretende refletir essa variedade nos perfis de artistas e na agenda.</p>','Do tradicional ao contemporâneo: a diversidade do samba na cidade','Portal quer abrir espaço para diferentes vertentes do gênero.','publish','closed','closed','','do-tradicional-ao-contemporaneo-a-diversidade-do-samba-na-cidade','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1305',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1306,1,'2026-09-13 15:00:00','2026-09-13 15:00:00','<p><strong>Conteúdo demonstrativo.</strong> O projeto CSamba entra em uma nova etapa de testes, agora com uma base maior de bandas, casas, eventos e notícias.</p><p>O objetivo é testar o comportamento do tema com volume de conteúdo mais próximo do cenário real.</p>','CSamba entra em fase de testes com novos perfis e agenda','Conteúdo de demonstração passa a preencher as principais áreas do projeto.','publish','closed','closed','','csamba-entra-em-fase-de-testes-com-novos-perfis-e-agenda','','','2026-09-13 15:00:00','2026-09-13 15:00:00','',0,'http://csamba.local/?post_type=post&amp;p=1306',0,'post','',0);
INSERT INTO `wp_posts` VALUES (1307,1,'2026-09-13 17:52:29','2026-09-13 20:52:29','','gal','','inherit','open','closed','','gal','','','2026-09-13 17:52:29','2026-09-13 20:52:29','',29,'http://csamba.local/wp-content/uploads/2026/09/gal.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1310,1,'2026-09-13 18:12:46','2026-09-13 21:12:46','','fruto','','inherit','open','closed','','fruto','','','2026-09-13 18:12:46','2026-09-13 21:12:46','',1106,'http://csamba.local/wp-content/uploads/2026/09/fruto.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1311,1,'2026-09-13 18:13:18','2026-09-13 21:13:18','','Cambuca','','inherit','open','closed','','cambuca','','','2026-09-13 18:13:18','2026-09-13 21:13:18','',1105,'http://csamba.local/wp-content/uploads/2026/09/Cambuca.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1312,1,'2026-09-13 18:16:12','2026-09-13 21:16:12','','bola3','','inherit','open','closed','','bola3','','','2026-09-13 18:16:12','2026-09-13 21:16:12','',1004,'http://csamba.local/wp-content/uploads/2026/09/bola3.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1313,1,'2026-09-13 18:16:12','2026-09-13 21:16:12','','752497438_18607036525060047_4305718100501582004_n','','inherit','open','closed','','752497438_18607036525060047_4305718100501582004_n','','','2026-09-13 18:16:12','2026-09-13 21:16:12','',1004,'http://csamba.local/wp-content/uploads/2026/09/752497438_18607036525060047_4305718100501582004_n.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1314,1,'2026-09-13 18:16:13','2026-09-13 21:16:13','','bola2','','inherit','open','closed','','bola2','','','2026-09-13 18:16:13','2026-09-13 21:16:13','',1004,'http://csamba.local/wp-content/uploads/2026/09/bola2.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1315,1,'2026-09-13 18:19:11','2026-09-13 21:19:11','','marquezas3','','inherit','open','closed','','marquezas3','','','2026-09-13 18:19:11','2026-09-13 21:19:11','',1003,'http://csamba.local/wp-content/uploads/2026/09/marquezas3.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1316,1,'2026-09-13 18:19:11','2026-09-13 21:19:11','','marquezas','','inherit','open','closed','','marquezas','','','2026-09-13 18:19:11','2026-09-13 21:19:11','',1003,'http://csamba.local/wp-content/uploads/2026/09/marquezas.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1317,1,'2026-09-13 18:19:12','2026-09-13 21:19:12','','marquezas2','','inherit','open','closed','','marquezas2','','','2026-09-13 18:19:12','2026-09-13 21:19:12','',1003,'http://csamba.local/wp-content/uploads/2026/09/marquezas2.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (1318,1,'2026-09-17 00:17:33','0000-00-00 00:00:00','','Rascunho automático','','auto-draft','open','open','','','','','2026-09-17 00:17:33','0000-00-00 00:00:00','',0,'http://csamba.local/?p=1318',0,'post','',0);
INSERT INTO `wp_posts` VALUES (2001,1,'2026-09-17 18:00:00','2026-09-17 18:00:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Roda de Quinta — Roberta Moura, em Fruto Coletivo. Conteúdo criado para popular e testar a agenda do CSamba.','Roda de Quinta — Roberta Moura','','publish','closed','closed','','roda-de-quinta-roberta-moura','','','2026-09-17 18:00:00','2026-09-17 18:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=2001',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2002,1,'2026-09-17 19:00:00','2026-09-17 19:00:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Samba no Cambuca, em Boteco Cambuca. Conteúdo criado para popular e testar a agenda do CSamba.','Samba no Cambuca','','publish','closed','closed','','samba-no-cambuca','','','2026-09-17 19:00:00','2026-09-17 19:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=2002',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2003,1,'2026-09-17 20:00:00','2026-09-17 20:00:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Thiago Ribeiro e Amigos, em Quintal do Cooler. Conteúdo criado para popular e testar a agenda do CSamba.','Thiago Ribeiro e Amigos','','publish','closed','closed','','thiago-ribeiro-e-amigos','','','2026-09-17 20:00:00','2026-09-17 20:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=2003',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2004,1,'2026-09-17 20:30:00','2026-09-17 20:30:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Quinta de Samba, em Terreiro Bar. Conteúdo criado para popular e testar a agenda do CSamba.','Quinta de Samba','','publish','closed','closed','','quinta-de-samba','','','2026-09-17 20:30:00','2026-09-17 20:30:00','',0,'http://csamba.local/?post_type=evento&amp;p=2004',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2005,1,'2026-09-17 21:00:00','2026-09-17 21:00:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Grupo do Bola — Ao Vivo, em Gal Bar e Arte. Conteúdo criado para popular e testar a agenda do CSamba.','Grupo do Bola — Ao Vivo','','publish','closed','closed','','grupo-do-bola-ao-vivo','','','2026-09-17 21:00:00','2026-09-17 21:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=2005',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2006,1,'2026-09-17 22:00:00','2026-09-17 22:00:00','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode dos Marqueza, em A Palo Seco. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode dos Marqueza','','publish','closed','closed','','pagode-dos-marqueza','','','2026-09-17 22:00:00','2026-09-17 22:00:00','',0,'http://csamba.local/?post_type=evento&amp;p=2006',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2007,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Sextou com Samba, em Fruto Coletivo. Conteúdo criado para popular e testar a agenda do CSamba.','Sextou com Samba','','publish','closed','closed','','sextou-com-samba','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2007',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2008,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Roberta Moura — Samba de Raiz, em Boteco Cambuca. Conteúdo criado para popular e testar a agenda do CSamba.','Roberta Moura — Samba de Raiz','','publish','closed','closed','','roberta-moura-samba-de-raiz','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2008',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2009,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode do Ronaldo, em JP Espetinhos. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode do Ronaldo','','publish','closed','closed','','pagode-do-ronaldo','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2009',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2010,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Thiago Ribeiro e Amigos, em Gal Bar e Arte. Conteúdo criado para popular e testar a agenda do CSamba.','Thiago Ribeiro e Amigos','','publish','closed','closed','','thiago-ribeiro-e-amigos-2','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2010',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2011,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Grupo do Bola, em Quintal do Cooler. Conteúdo criado para popular e testar a agenda do CSamba.','Grupo do Bola','','publish','closed','closed','','grupo-do-bola','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2011',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2012,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode dos Marqueza — Sexta Delas, em A Palo Seco. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode dos Marqueza — Sexta Delas','','publish','closed','closed','','pagode-dos-marqueza-sexta-delas','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2012',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2013,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Samba de Tarde, em Fruto Coletivo. Conteúdo criado para popular e testar a agenda do CSamba.','Samba de Tarde','','publish','closed','closed','','samba-de-tarde','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2013',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2014,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode no Quintal, em Quintal do Cooler. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode no Quintal','','publish','closed','closed','','pagode-no-quintal-2','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2014',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2015,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Roberta Moura — Roda de Samba, em Boteco Cambuca. Conteúdo criado para popular e testar a agenda do CSamba.','Roberta Moura — Roda de Samba','','publish','closed','closed','','roberta-moura-roda-de-samba','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2015',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2016,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Grupo do Bola — Sábado de Pagode, em Gal Bar e Arte. Conteúdo criado para popular e testar a agenda do CSamba.','Grupo do Bola — Sábado de Pagode','','publish','closed','closed','','grupo-do-bola-sabado-de-pagode','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2016',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2017,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode do Ronaldo, em Terreiro Bar. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode do Ronaldo','','publish','closed','closed','','pagode-do-ronaldo-2','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2017',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2018,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode dos Marqueza, em A Palo Seco. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode dos Marqueza','','publish','closed','closed','','pagode-dos-marqueza-2','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2018',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2019,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Samba de Domingo, em JP Espetinhos. Conteúdo criado para popular e testar a agenda do CSamba.','Samba de Domingo','','publish','closed','closed','','samba-de-domingo','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2019',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2020,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Roda da Roberta, em Fruto Coletivo. Conteúdo criado para popular e testar a agenda do CSamba.','Roda da Roberta','','publish','closed','closed','','roda-da-roberta','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2020',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2021,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Thiago Ribeiro — Samba no Quintal, em Quintal do Cooler. Conteúdo criado para popular e testar a agenda do CSamba.','Thiago Ribeiro — Samba no Quintal','','publish','closed','closed','','thiago-ribeiro-samba-no-quintal','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2021',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2022,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Pagode dos Marqueza, em Boteco Cambuca. Conteúdo criado para popular e testar a agenda do CSamba.','Pagode dos Marqueza','','publish','closed','closed','','pagode-dos-marqueza-3','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2022',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2023,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Grupo do Bola — Domingo em Samba, em Gal Bar e Arte. Conteúdo criado para popular e testar a agenda do CSamba.','Grupo do Bola — Domingo em Samba','','publish','closed','closed','','grupo-do-bola-domingo-em-samba','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2023',0,'evento','',0);
INSERT INTO `wp_posts` VALUES (2024,1,'2026-09-18 00:14:56','2026-09-18 03:14:56','<strong>EVENTO DEMONSTRATIVO / FICTÍCIO.</strong> Resenha do Samba, em Terreiro Bar. Conteúdo criado para popular e testar a agenda do CSamba.','Resenha do Samba','','publish','closed','closed','','resenha-do-samba','','','2026-09-18 00:14:56','2026-09-18 03:14:56','',0,'http://csamba.local/?post_type=evento&#038;p=2024',0,'evento','',0);
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
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
INSERT INTO `wp_term_relationships` VALUES (7,2,0);
INSERT INTO `wp_term_relationships` VALUES (17,3,0);
INSERT INTO `wp_term_relationships` VALUES (1001,5,0);
INSERT INTO `wp_term_relationships` VALUES (1001,6,0);
INSERT INTO `wp_term_relationships` VALUES (1002,5,0);
INSERT INTO `wp_term_relationships` VALUES (1002,7,0);
INSERT INTO `wp_term_relationships` VALUES (1003,7,0);
INSERT INTO `wp_term_relationships` VALUES (1004,5,0);
INSERT INTO `wp_term_relationships` VALUES (1004,7,0);
INSERT INTO `wp_term_relationships` VALUES (1301,4,0);
INSERT INTO `wp_term_relationships` VALUES (1302,4,0);
INSERT INTO `wp_term_relationships` VALUES (1303,4,0);
INSERT INTO `wp_term_relationships` VALUES (1304,4,0);
INSERT INTO `wp_term_relationships` VALUES (1305,4,0);
INSERT INTO `wp_term_relationships` VALUES (1306,4,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'wp_theme','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'wp_theme','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (4,4,'category','',0,6);
INSERT INTO `wp_term_taxonomy` VALUES (5,5,'genero','',0,3);
INSERT INTO `wp_term_taxonomy` VALUES (6,6,'genero','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (7,7,'genero','',0,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Sem categoria','sem-categoria',0);
INSERT INTO `wp_terms` VALUES (2,'csamba','csamba',0);
INSERT INTO `wp_terms` VALUES (3,'csamba-theme-v0.4','csamba-theme-v0-4',0);
INSERT INTO `wp_terms` VALUES (4,'Notícias','noticias',0);
INSERT INTO `wp_terms` VALUES (5,'Samba','samba',0);
INSERT INTO `wp_terms` VALUES (6,'MPB','mpb',0);
INSERT INTO `wp_terms` VALUES (7,'Pagode','pagode',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','tyaraju');
INSERT INTO `wp_usermeta` VALUES (2,1,'first_name','');
INSERT INTO `wp_usermeta` VALUES (3,1,'last_name','');
INSERT INTO `wp_usermeta` VALUES (4,1,'description','');
INSERT INTO `wp_usermeta` VALUES (5,1,'rich_editing','true');
INSERT INTO `wp_usermeta` VALUES (6,1,'syntax_highlighting','true');
INSERT INTO `wp_usermeta` VALUES (7,1,'infinite_scrolling','true');
INSERT INTO `wp_usermeta` VALUES (8,1,'comment_shortcuts','false');
INSERT INTO `wp_usermeta` VALUES (9,1,'admin_color','modern');
INSERT INTO `wp_usermeta` VALUES (10,1,'use_ssl','0');
INSERT INTO `wp_usermeta` VALUES (11,1,'show_admin_bar_front','true');
INSERT INTO `wp_usermeta` VALUES (12,1,'locale','');
INSERT INTO `wp_usermeta` VALUES (13,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `wp_usermeta` VALUES (14,1,'wp_user_level','10');
INSERT INTO `wp_usermeta` VALUES (15,1,'dismissed_wp_pointers','');
INSERT INTO `wp_usermeta` VALUES (16,1,'show_welcome_panel','1');
INSERT INTO `wp_usermeta` VALUES (17,1,'session_tokens','a:1:{s:64:\"1b2113335f70de8ac11e2e737afbfd5c6d973ef7a092dc3d204dd00284a8e4be\";a:4:{s:10:\"expiration\";i:1789787853;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 OPR/135.0.0.0\";s:5:\"login\";i:1789615053;}}');
INSERT INTO `wp_usermeta` VALUES (18,1,'wp_dashboard_quick_press_last_post_id','1318');
INSERT INTO `wp_usermeta` VALUES (19,1,'wp_persisted_preferences','a:3:{s:4:\"core\";a:2:{s:26:\"isComplementaryAreaVisible\";b:1;s:10:\"openPanels\";a:2:{i:0;s:11:\"post-status\";i:1;s:21:\"taxonomy-panel-genero\";}}s:14:\"core/edit-post\";a:3:{s:12:\"welcomeGuide\";b:0;s:19:\"metaBoxesMainIsOpen\";b:1;s:23:\"metaBoxesMainOpenHeight\";d:428.19998168945312;}s:9:\"_modified\";s:24:\"2026-08-26T05:04:09.666Z\";}');
INSERT INTO `wp_usermeta` VALUES (20,1,'wp_user-settings','libraryContent=browse');
INSERT INTO `wp_usermeta` VALUES (21,1,'wp_user-settings-time','1787713442');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'tyaraju','$wp$2y$10$sHevdn6/GflLykiqg5TqbOUtBxYzztzHysTnWDhTaCY/GjSny8pLq','tyaraju','tyarajuterra@hotmail.com','http://csamba.local','2026-08-24 02:22:34','',0,'tyaraju');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18  1:03:59
