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
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES (1,'cron','a:12:{i:1788232954;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1788233119;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1788233644;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1788233656;a:1:{s:27:\"acf_update_site_health_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1788234754;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1788236554;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1788270400;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1788313600;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1788313601;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1788315755;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:41:\"wp_privacy_personal_data_cleanup_requests\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1788834155;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on');
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
INSERT INTO `wp_options` VALUES (34,'active_plugins','a:1:{i:0;s:30:\"advanced-custom-fields/acf.php\";}','on');
INSERT INTO `wp_options` VALUES (35,'category_base','','on');
INSERT INTO `wp_options` VALUES (36,'ping_sites','https://rpc.pingomatic.com/','on');
INSERT INTO `wp_options` VALUES (37,'comment_max_links','2','on');
INSERT INTO `wp_options` VALUES (38,'gmt_offset','0','on');
INSERT INTO `wp_options` VALUES (39,'default_email_category','1','on');
INSERT INTO `wp_options` VALUES (40,'recently_edited','','off');
INSERT INTO `wp_options` VALUES (41,'template','csamba-theme-v0.4','on');
INSERT INTO `wp_options` VALUES (42,'stylesheet','csamba-theme-v0.4','on');
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
INSERT INTO `wp_options` VALUES (104,'fresh_site','1','off');
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
INSERT INTO `wp_options` VALUES (140,'theme_mods_twentytwentyfive','a:4:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1787713721;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (141,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"6f539b72180c8bd6c167902224690801\";s:6:\"blocks\";a:9:{s:32:\"832dc2d864d79097d8b8b493ad93453b\";s:0:\"\";s:32:\"45d3e0c4afcbd8cf25cb1ba51abfb3d7\";s:46:\":root :where(.wp-block-icon svg){width: 24px;}\";s:32:\"feca6e996f694be2d29599793228e0d7\";s:0:\"\";s:32:\"5eef131663eddaf830554df656fc2968\";s:324:\":where(.wp-block-gallery.is-layout-flex){gap: var( --wp--style--gallery-gap-default, var( --gallery-block--gutter-size, var( --wp--style--block-gap, 0.5em ) ) );}:where(.wp-block-gallery.is-layout-grid){gap: var( --wp--style--gallery-gap-default, var( --gallery-block--gutter-size, var( --wp--style--block-gap, 0.5em ) ) );}\";s:32:\"c99c05932c6685777ec5b856698fcc7d\";s:118:\":where(.wp-block-latest-posts.is-layout-flex){gap: 1.25em;}:where(.wp-block-latest-posts.is-layout-grid){gap: 1.25em;}\";s:32:\"dec8d648f30b13caec8e61374591787d\";s:120:\":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}\";s:32:\"6c35533f7a92cce94808323603db9fc8\";s:120:\":where(.wp-block-term-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-term-template.is-layout-grid){gap: 1.25em;}\";s:32:\"6a0505cd5c78a87ed77570cda43c1132\";s:102:\":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}\";s:32:\"25a66f156386551185570f72a9f7d44e\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on');
INSERT INTO `wp_options` VALUES (149,'can_compress_scripts','0','on');
INSERT INTO `wp_options` VALUES (162,'current_theme','CSamba v0.4','auto');
INSERT INTO `wp_options` VALUES (163,'theme_mods_csamba','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1787714021;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','off');
INSERT INTO `wp_options` VALUES (164,'theme_switched','','auto');
INSERT INTO `wp_options` VALUES (169,'finished_updating_comment_type','1','auto');
INSERT INTO `wp_options` VALUES (175,'_transient_health-check-site-status-result','{\"good\":19,\"recommended\":3,\"critical\":1}','on');
INSERT INTO `wp_options` VALUES (182,'_site_transient_wp_plugin_dependencies_plugin_data','a:0:{}','off');
INSERT INTO `wp_options` VALUES (183,'recently_activated','a:0:{}','off');
INSERT INTO `wp_options` VALUES (190,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/pt_BR/wordpress-7.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"7.1\";s:7:\"version\";s:3:\"7.1\";s:11:\"php_version\";s:3:\"7.4\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1788230787;s:15:\"version_checked\";s:3:\"7.1\";s:12:\"translations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (192,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1788230788;s:7:\"checked\";a:4:{s:17:\"csamba-theme-v0.4\";s:5:\"0.1.0\";s:15:\"csamba-vlovable\";s:5:\"1.0.0\";s:6:\"csamba\";s:5:\"0.1.0\";s:16:\"twentytwentyfive\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.5.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}}s:12:\"translations\";a:0:{}}','off');
INSERT INTO `wp_options` VALUES (193,'acf_first_activated_version','6.8.8','on');
INSERT INTO `wp_options` VALUES (194,'acf_site_health','{\"version\":\"6.8.8\",\"plugin_type\":\"Free\",\"update_source\":\"wordpress.org\",\"wp_version\":\"7.1\",\"mysql_version\":\"8.0.35\",\"is_multisite\":false,\"active_theme\":{\"name\":\"CSamba v0.4\",\"version\":\"0.1.0\",\"theme_uri\":\"https:\\/\\/example.com\\/csamba\",\"stylesheet\":false},\"active_plugins\":{\"advanced-custom-fields\\/acf.php\":{\"name\":\"Advanced Custom Fields\",\"version\":\"6.8.8\",\"plugin_uri\":\"https:\\/\\/www.advancedcustomfields.com\"}},\"ui_field_groups\":\"0\",\"php_field_groups\":\"0\",\"json_field_groups\":\"0\",\"rest_field_groups\":\"0\",\"all_location_rules\":[\"post_type==banda\",\"post_type==destaque\",\"post_type==evento\",\"nav_menu_item==all\"],\"field_groups_by_post_type\":[{\"post_type\":\"banda\",\"field_group_count\":1},{\"post_type\":\"destaque\",\"field_group_count\":1},{\"post_type\":\"evento\",\"field_group_count\":1}],\"number_of_fields_by_type\":{\"tab\":4,\"wysiwyg\":1,\"text\":16,\"number\":1,\"url\":17,\"message\":3,\"image\":15,\"post_object\":3,\"color_picker\":2,\"true_false\":1,\"date_picker\":1,\"time_picker\":1},\"number_of_third_party_fields_by_type\":[],\"post_types_enabled\":true,\"ui_post_types\":\"0\",\"json_post_types\":\"0\",\"ui_taxonomies\":\"0\",\"json_taxonomies\":\"0\",\"rest_api_format\":\"light\",\"admin_ui_enabled\":true,\"field_type-modal_enabled\":true,\"field_settings_tabs_enabled\":false,\"shortcode_enabled\":false,\"registered_acf_forms\":\"0\",\"json_save_paths\":1,\"json_load_paths\":1,\"ai_enabled\":false,\"schema_support\":false,\"schema_ready_objects\":{\"blocks\":0,\"post_types\":0},\"event_first_activated\":1787628856,\"last_updated\":1788230788}','off');
INSERT INTO `wp_options` VALUES (196,'acf_version','6.8.8','auto');
INSERT INTO `wp_options` VALUES (276,'theme_mods_csamba-vlovable','a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1787714018;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','off');
INSERT INTO `wp_options` VALUES (288,'theme_mods_csamba-theme-v0.4','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}','on');
INSERT INTO `wp_options` VALUES (430,'_site_transient_timeout_theme_roots','1788232587','off');
INSERT INTO `wp_options` VALUES (431,'_site_transient_theme_roots','a:5:{s:17:\"csamba-theme-v0.3\";s:7:\"/themes\";s:17:\"csamba-theme-v0.4\";s:7:\"/themes\";s:15:\"csamba-vlovable\";s:7:\"/themes\";s:6:\"csamba\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";}','off');
INSERT INTO `wp_options` VALUES (432,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1788230788;s:8:\"response\";a:1:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"6.8.9\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.6.8.9.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:67:\"https://ps.w.org/advanced-custom-fields/assets/icon.svg?rev=3207824\";s:3:\"svg\";s:67:\"https://ps.w.org/advanced-custom-fields/assets/icon.svg?rev=3207824\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=3374528\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=3374528\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.2\";s:6:\"tested\";s:3:\"7.1\";s:12:\"requires_php\";s:3:\"7.4\";s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}s:7:\"checked\";a:1:{s:30:\"advanced-custom-fields/acf.php\";s:5:\"6.8.8\";}}','off');
INSERT INTO `wp_options` VALUES (433,'_site_transient_timeout_php_check_617fc4d260191bf0de418d0d961f5a43','1788835589','off');
INSERT INTO `wp_options` VALUES (434,'_site_transient_php_check_617fc4d260191bf0de418d0d961f5a43','a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:3:\"7.4\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','off');
INSERT INTO `wp_options` VALUES (435,'_site_transient_timeout_wp_theme_files_patterns-71478100e44ba5463482f24d37caae6f','1788234280','off');
INSERT INTO `wp_options` VALUES (436,'_site_transient_wp_theme_files_patterns-71478100e44ba5463482f24d37caae6f','a:2:{s:7:\"version\";s:5:\"0.1.0\";s:8:\"patterns\";a:0:{}}','off');
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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (2,3,'_wp_page_template','default');
INSERT INTO `wp_postmeta` VALUES (3,6,'_edit_lock','1787784613:1');
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
INSERT INTO `wp_postmeta` VALUES (121,18,'csamba_subtitulo','');
INSERT INTO `wp_postmeta` VALUES (122,18,'_csamba_subtitulo','field_csamba_subtitulo');
INSERT INTO `wp_postmeta` VALUES (123,18,'csamba_slide_image','');
INSERT INTO `wp_postmeta` VALUES (124,18,'_csamba_slide_image','field_csamba_slide_image');
INSERT INTO `wp_postmeta` VALUES (125,18,'csamba_cta','Veja mais');
INSERT INTO `wp_postmeta` VALUES (126,18,'_csamba_cta','field_csamba_cta');
INSERT INTO `wp_postmeta` VALUES (127,18,'_edit_lock','1787720468:1');
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
INSERT INTO `wp_postmeta` VALUES (222,21,'_edit_lock','1787888100:1');
INSERT INTO `wp_postmeta` VALUES (223,21,'csamba_target','20');
INSERT INTO `wp_postmeta` VALUES (224,21,'_csamba_target','field_csamba_target');
INSERT INTO `wp_postmeta` VALUES (225,21,'csamba_slide_color','#ff3300');
INSERT INTO `wp_postmeta` VALUES (226,21,'_csamba_slide_color','field_csamba_slide_color');
INSERT INTO `wp_postmeta` VALUES (227,21,'csamba_slide_gradient','1');
INSERT INTO `wp_postmeta` VALUES (228,21,'_csamba_slide_gradient','field_csamba_slide_gradient');
INSERT INTO `wp_postmeta` VALUES (229,21,'csamba_subtitulo','Subtítulo');
INSERT INTO `wp_postmeta` VALUES (230,21,'_csamba_subtitulo','field_csamba_subtitulo');
INSERT INTO `wp_postmeta` VALUES (231,21,'csamba_slide_image','');
INSERT INTO `wp_postmeta` VALUES (232,21,'_csamba_slide_image','field_csamba_slide_image');
INSERT INTO `wp_postmeta` VALUES (233,21,'csamba_cta','Veja mais');
INSERT INTO `wp_postmeta` VALUES (234,21,'_csamba_cta','field_csamba_cta');
INSERT INTO `wp_postmeta` VALUES (235,22,'_edit_lock','1787722228:1');
INSERT INTO `wp_postmeta` VALUES (236,23,'_wp_attached_file','2026/08/mukifo3.webp');
INSERT INTO `wp_postmeta` VALUES (237,23,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1350;s:4:\"file\";s:20:\"2026/08/mukifo3.webp\";s:8:\"filesize\";i:195960;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"mukifo3-240x300.webp\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:11864;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"mukifo3-819x1024.webp\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:72724;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"mukifo3-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:5762;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"mukifo3-768x960.webp\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:63762;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:20:\"mukifo3-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:19618;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:20:\"mukifo3-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:53534;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:20:\"mukifo3-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7624;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (238,24,'_wp_attached_file','2026/08/mukifo.jpg');
INSERT INTO `wp_postmeta` VALUES (239,24,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1080;s:4:\"file\";s:18:\"2026/08/mukifo.jpg\";s:8:\"filesize\";i:47765;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"mukifo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7877;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"mukifo-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:32951;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"mukifo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3594;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"mukifo-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:22885;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:18:\"mukifo-520x320.jpg\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13887;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:18:\"mukifo-980x620.jpg\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28748;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:18:\"mukifo-240x160.jpg\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5996;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (240,25,'_wp_attached_file','2026/08/mukifo2.webp');
INSERT INTO `wp_postmeta` VALUES (241,25,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1080;s:6:\"height\";i:1350;s:4:\"file\";s:20:\"2026/08/mukifo2.webp\";s:8:\"filesize\";i:192696;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"mukifo2-240x300.webp\";s:5:\"width\";i:240;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:12080;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"mukifo2-819x1024.webp\";s:5:\"width\";i:819;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:66418;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"mukifo2-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:6088;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"mukifo2-768x960.webp\";s:5:\"width\";i:768;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:57678;}s:11:\"csamba-card\";a:5:{s:4:\"file\";s:20:\"mukifo2-520x320.webp\";s:5:\"width\";i:520;s:6:\"height\";i:320;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:17950;}s:11:\"csamba-hero\";a:5:{s:4:\"file\";s:20:\"mukifo2-980x620.webp\";s:5:\"width\";i:980;s:6:\"height\";i:620;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:54318;}s:12:\"csamba-thumb\";a:5:{s:4:\"file\";s:20:\"mukifo2-240x160.webp\";s:5:\"width\";i:240;s:6:\"height\";i:160;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:7428;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}');
INSERT INTO `wp_postmeta` VALUES (242,22,'_thumbnail_id','24');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
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
INSERT INTO `wp_posts` VALUES (18,1,'2026-08-26 02:01:17','2026-08-26 05:01:17','','Grupo ViroZueira é o destaque da semana','','publish','closed','closed','','18','','','2026-08-26 02:03:27','2026-08-26 05:03:27','',0,'http://csamba.local/?post_type=destaque&#038;p=18',0,'destaque','',0);
INSERT INTO `wp_posts` VALUES (19,1,'2026-08-26 02:03:20','2026-08-26 05:03:20','','Grupo ViroZueira','','inherit','closed','closed','','18-autosave-v1','','','2026-08-26 02:03:20','2026-08-26 05:03:20','',18,'http://csamba.local/?p=19',0,'revision','',0);
INSERT INTO `wp_posts` VALUES (20,1,'2026-08-26 02:05:48','2026-08-26 05:05:48','','Volto pra te ver','','publish','closed','closed','','volto-pra-te-ver','','','2026-08-26 02:05:48','2026-08-26 05:05:48','',0,'http://csamba.local/?post_type=banda&#038;p=20',0,'banda','',0);
INSERT INTO `wp_posts` VALUES (21,1,'2026-08-26 02:08:11','2026-08-26 05:08:11','','Volto pra te ver nessa quarta','','draft','closed','closed','','volto-pra-te-ver-nessa-quarta','','','2026-08-28 00:35:00','2026-08-28 03:35:00','',0,'http://csamba.local/?post_type=destaque&#038;p=21',0,'destaque','',0);
INSERT INTO `wp_posts` VALUES (22,1,'2026-08-26 02:30:13','2026-08-26 05:30:13','','Mukifo','','publish','closed','closed','','mukifo','','','2026-08-26 02:30:13','2026-08-26 05:30:13','',0,'http://csamba.local/?post_type=casa&#038;p=22',0,'casa','',0);
INSERT INTO `wp_posts` VALUES (23,1,'2026-08-26 02:28:19','2026-08-26 05:28:19','','mukifo3','','inherit','open','closed','','mukifo3','','','2026-08-26 02:28:19','2026-08-26 05:28:19','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo3.webp',0,'attachment','image/webp',0);
INSERT INTO `wp_posts` VALUES (24,1,'2026-08-26 02:28:20','2026-08-26 05:28:20','','mukifo','','inherit','open','closed','','mukifo','','','2026-08-26 02:28:20','2026-08-26 05:28:20','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo.jpg',0,'attachment','image/jpeg',0);
INSERT INTO `wp_posts` VALUES (25,1,'2026-08-26 02:28:20','2026-08-26 05:28:20','','mukifo2','','inherit','open','closed','','mukifo2','','','2026-08-26 02:28:20','2026-08-26 05:28:20','',22,'http://csamba.local/wp-content/uploads/2026/08/mukifo2.webp',0,'attachment','image/webp',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (2,2,'wp_theme','',0,1);
INSERT INTO `wp_term_taxonomy` VALUES (3,3,'wp_theme','',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Sem categoria','sem-categoria',0);
INSERT INTO `wp_terms` VALUES (2,'csamba','csamba',0);
INSERT INTO `wp_terms` VALUES (3,'csamba-theme-v0.4','csamba-theme-v0-4',0);
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
INSERT INTO `wp_usermeta` VALUES (17,1,'session_tokens','a:1:{s:64:\"ae2b6d48aa1a7ff90a013db6760eb7fd1508b7c2143a20b0b942d530577ff927\";a:4:{s:10:\"expiration\";i:1788060871;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:125:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 OPR/134.0.0.0\";s:5:\"login\";i:1787888071;}}');
INSERT INTO `wp_usermeta` VALUES (18,1,'wp_dashboard_quick_press_last_post_id','5');
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

-- Dump completed on 2026-09-01  0:22:07
