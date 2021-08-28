-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: sir_sportsCaff1947
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

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
-- Table structure for table `abc_event_refresh`
--

DROP TABLE IF EXISTS `abc_event_refresh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abc_event_refresh` (
  `id` tinyint(1) NOT NULL,
  `timer` int(15) DEFAULT NULL,
  `maint` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `timer` (`timer`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(80) DEFAULT NULL,
  `ip` varbinary(16) DEFAULT NULL,
  `failed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `failed_last` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `importance` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 yes, 0 =no',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=626 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_inplay_bet_events`
--

DROP TABLE IF EXISTS `af_inplay_bet_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_inplay_bet_events` (
  `bet_event_id` int(21) NOT NULL,
  `bradar` int(21) DEFAULT NULL,
  `bet_event_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `b_sort` int(1) NOT NULL DEFAULT '0',
  `deadline` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `ss` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0:0',
  `feat` tinyint(1) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `spid` smallint(11) DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sname` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`bet_event_id`),
  KEY `bet_event_id` (`bet_event_id`),
  KEY `cc` (`cc`),
  KEY `feat` (`feat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_inplay_bet_events_cats`
--

DROP TABLE IF EXISTS `af_inplay_bet_events_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_inplay_bet_events_cats` (
  `bet_event_cat_id` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `c_sort` int(11) NOT NULL DEFAULT '1',
  `bet_event_id` int(11) NOT NULL,
  `bet_event_cat_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `spid` int(11) NOT NULL DEFAULT '0',
  `yn` tinyint(1) DEFAULT NULL,
  `dl` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bet_event_cat_id`),
  KEY `bet_event_cat_id` (`bet_event_cat_id`),
  KEY `bet_event_id` (`bet_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_inplay_bet_options`
--

DROP TABLE IF EXISTS `af_inplay_bet_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_inplay_bet_options` (
  `bet_option_id` int(11) NOT NULL,
  `o_sort` int(11) NOT NULL DEFAULT '1',
  `bet_option_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bet_option_odd` double(10,2) NOT NULL,
  `bet_event_cat_id` int(11) NOT NULL,
  `cat_name_in_option` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `spid` int(11) NOT NULL DEFAULT '0',
  `yn` int(10) DEFAULT NULL,
  `dl` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'del on 1',
  PRIMARY KEY (`bet_option_id`),
  KEY `bet_option_id` (`bet_option_id`),
  KEY `bet_event_cat_id` (`bet_event_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_pre_bet_events`
--

DROP TABLE IF EXISTS `af_pre_bet_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_pre_bet_events` (
  `bet_event_id` int(21) NOT NULL AUTO_INCREMENT,
  `bradar` int(21) DEFAULT NULL,
  `b_sort` int(11) NOT NULL DEFAULT '0',
  `bet_event_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `deadline` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `feat` smallint(1) DEFAULT '0',
  `event_id` int(11) NOT NULL,
  `ss` int(10) DEFAULT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `spid` smallint(11) DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sname` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `img_h_id` int(10) DEFAULT NULL,
  `img_a_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`bet_event_id`),
  KEY `bet_event_id` (`bet_event_id`),
  KEY `event_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107185081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_pre_bet_events_cats`
--

DROP TABLE IF EXISTS `af_pre_bet_events_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_pre_bet_events_cats` (
  `bet_event_cat_id` int(21) NOT NULL AUTO_INCREMENT,
  `c_sort` int(11) NOT NULL DEFAULT '1',
  `bet_event_cat_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bet_event_id` int(13) NOT NULL,
  `spid` int(10) DEFAULT NULL,
  `yn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bet_event_cat_id`),
  KEY `bet_event_cat_id` (`bet_event_cat_id`),
  KEY `bet_event_id` (`bet_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=661975028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_pre_bet_events_json`
--

DROP TABLE IF EXISTS `af_pre_bet_events_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_pre_bet_events_json` (
  `bet_event_id` int(21) NOT NULL AUTO_INCREMENT,
  `full_odds` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`bet_event_id`),
  KEY `bet_event_id` (`bet_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11975408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `af_pre_bet_options`
--

DROP TABLE IF EXISTS `af_pre_bet_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `af_pre_bet_options` (
  `bet_option_id` int(22) NOT NULL AUTO_INCREMENT,
  `o_sort` int(11) NOT NULL DEFAULT '1',
  `bet_option_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bet_option_odd` double(10,2) NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bet_event_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`bet_option_id`),
  UNIQUE KEY `bet_option_id_2` (`bet_option_id`),
  KEY `bet_event_cat_id` (`bet_event_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2062788220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banlist`
--

DROP TABLE IF EXISTS `banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('IP','Email') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'IP',
  `comment` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ban_ip` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `tax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totaltax` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `originalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `totalprice` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `cart_id` varchar(100) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  KEY `idx_user` (`uid`),
  KEY `idx_membership` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `abbr` varchar(2) NOT NULL,
  `name` varchar(70) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `home` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vat` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  `sorting` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `abbrv` (`abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `code` varchar(30) NOT NULL,
  `discount` smallint(2) unsigned NOT NULL DEFAULT '0',
  `type` enum('p','a') NOT NULL DEFAULT 'p',
  `membership_id` varchar(50) NOT NULL DEFAULT '0',
  `ctype` varchar(30) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `rate` decimal(13,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`),
  KEY `name_3` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(60) NOT NULL,
  `title_he` varchar(60) NOT NULL,
  `tooltip_en` varchar(100) DEFAULT NULL,
  `tooltip_he` varchar(100) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `section` varchar(30) DEFAULT NULL,
  `sorting` int(4) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `digishop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `portfolio_id` int(11) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(40) DEFAULT NULL,
  `field_value` varchar(100) DEFAULT NULL,
  `section` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_field` (`field_id`),
  KEY `idx_digishop` (`digishop_id`),
  KEY `idx_portfolio` (`portfolio_id`),
  KEY `idx_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(100) NOT NULL,
  `name_he` varchar(100) NOT NULL,
  `subject_en` varchar(150) NOT NULL,
  `subject_he` varchar(150) NOT NULL,
  `help_en` tinytext,
  `help_he` tinytext,
  `body_en` text NOT NULL,
  `body_he` text NOT NULL,
  `type` enum('news','mailer') DEFAULT 'mailer',
  `typeid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `dir` varchar(25) NOT NULL,
  `live` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `extra_txt` varchar(100) DEFAULT NULL,
  `extra_txt2` varchar(100) DEFAULT NULL,
  `extra_txt3` varchar(100) DEFAULT NULL,
  `extra` varchar(100) DEFAULT NULL,
  `extra2` varchar(100) DEFAULT NULL,
  `extra3` text,
  `is_recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `abbr` varchar(2) DEFAULT NULL,
  `langdir` enum('ltr','rtl') DEFAULT 'ltr',
  `color` varchar(7) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `home` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plug_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mod_id` int(11) unsigned NOT NULL DEFAULT '0',
  `modalias` varchar(30) DEFAULT NULL,
  `page_slug_en` varchar(150) DEFAULT NULL,
  `page_slug_he` varchar(150) DEFAULT NULL,
  `is_content` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `plug_name` varchar(60) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `space` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `type` varchar(8) DEFAULT NULL,
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_plug_id` (`plug_id`),
  KEY `idx_mod_id` (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memberships` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(80) NOT NULL DEFAULT '',
  `title_he` varchar(80) NOT NULL,
  `description_en` varchar(150) DEFAULT NULL,
  `description_he` varchar(150) DEFAULT NULL,
  `thumb` varchar(40) DEFAULT NULL,
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `days` smallint(3) unsigned NOT NULL DEFAULT '1',
  `period` varchar(1) NOT NULL DEFAULT 'D',
  `trial` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `page_slug_en` varchar(100) DEFAULT NULL,
  `page_slug_he` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_he` varchar(100) NOT NULL,
  `mod_id` int(6) unsigned NOT NULL DEFAULT '0',
  `mod_slug` varchar(100) DEFAULT NULL,
  `caption_en` varchar(100) DEFAULT NULL,
  `caption_he` varchar(100) DEFAULT NULL,
  `content_type` varchar(20) NOT NULL DEFAULT 'page',
  `link` varchar(200) DEFAULT NULL,
  `target` varchar(15) NOT NULL DEFAULT '_blank',
  `icon` varchar(50) DEFAULT NULL,
  `cols` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `home_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_page_id` (`page_id`),
  KEY `idx_mod_id` (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_data`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `data_type_ix` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_message`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `talk_id` int(10) unsigned NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `message_fk_talk` (`talk_id`),
  KEY `message_from_id_ix` (`from_id`),
  KEY `message_to_id_ix` (`to_id`),
  KEY `message_datetime_ix` (`datetime`),
  CONSTRAINT `message_fk_talk` FOREIGN KEY (`talk_id`) REFERENCES `mirrormx_customer_chat_talk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_shared_file`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_shared_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_shared_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `upload_id` int(10) unsigned NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_file_fk_upload` (`upload_id`),
  CONSTRAINT `shared_file_fk_upload` FOREIGN KEY (`upload_id`) REFERENCES `mirrormx_customer_chat_upload` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_talk`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(32) DEFAULT NULL,
  `department_id` smallint(5) unsigned DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `talk_fk_department` (`department_id`),
  KEY `talk_owner_ix` (`owner`),
  KEY `talk_last_activity_ix` (`last_activity`),
  CONSTRAINT `talk_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_upload`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL,
  `state` varchar(16) NOT NULL,
  `files_info` text,
  `size` int(10) unsigned DEFAULT NULL,
  `progress` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_fk_message` (`message_id`),
  CONSTRAINT `upload_fk_message` FOREIGN KEY (`message_id`) REFERENCES `mirrormx_customer_chat_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_user`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `info` text,
  `roles` varchar(128) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_mail_ix` (`mail`),
  KEY `user_last_activity_ix` (`last_activity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mirrormx_customer_chat_user_department`
--

DROP TABLE IF EXISTS `mirrormx_customer_chat_user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirrormx_customer_chat_user_department` (
  `user_id` int(11) NOT NULL,
  `department_id` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `user_department_uq` (`user_id`,`department_id`),
  KEY `user_department_fk_department` (`department_id`),
  CONSTRAINT `user_department_fk_department` FOREIGN KEY (`department_id`) REFERENCES `mirrormx_customer_chat_department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_department_fk_user` FOREIGN KEY (`user_id`) REFERENCES `mirrormx_customer_chat_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_adblock`
--

DROP TABLE IF EXISTS `mod_adblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_adblock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(100) NOT NULL,
  `title_he` varchar(100) NOT NULL,
  `plugin_id` varchar(30) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_views_allowed` int(11) unsigned NOT NULL DEFAULT '0',
  `total_clicks_allowed` int(11) unsigned NOT NULL DEFAULT '0',
  `minimum_ctr` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `image` varchar(50) DEFAULT NULL,
  `image_link` varchar(100) DEFAULT NULL,
  `image_alt` varchar(100) DEFAULT NULL,
  `html` text,
  `total_views` int(11) unsigned NOT NULL DEFAULT '0',
  `total_clicks` int(11) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_comments`
--

DROP TABLE IF EXISTS `mod_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `section` varchar(20) NOT NULL,
  `vote_up` int(11) unsigned NOT NULL DEFAULT '0',
  `vote_down` int(11) NOT NULL DEFAULT '0',
  `body` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_events`
--

DROP TABLE IF EXISTS `mod_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_events` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title_en` varchar(100) NOT NULL,
  `title_he` varchar(100) NOT NULL,
  `venue_en` varchar(100) DEFAULT NULL,
  `venue_he` varchar(100) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `body_en` text,
  `body_he` text,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_email` varchar(80) DEFAULT NULL,
  `contact_phone` varchar(24) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_faq`
--

DROP TABLE IF EXISTS `mod_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_faq` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(4) unsigned NOT NULL DEFAULT '0',
  `question_en` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_he` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `answer_en` text COLLATE utf8_unicode_ci,
  `answer_he` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sorting` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ixd_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains f.a.q. data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_faq_categories`
--

DROP TABLE IF EXISTS `mod_faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_faq_categories` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(50) NOT NULL,
  `name_he` varchar(50) NOT NULL,
  `sorting` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_gallery`
--

DROP TABLE IF EXISTS `mod_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_gallery` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(60) NOT NULL,
  `title_he` varchar(60) NOT NULL,
  `slug_en` varchar(100) DEFAULT NULL,
  `slug_he` varchar(100) NOT NULL,
  `description_en` varchar(100) DEFAULT NULL,
  `description_he` varchar(100) DEFAULT NULL,
  `thumb_w` smallint(1) unsigned DEFAULT '500',
  `thumb_h` smallint(1) unsigned NOT NULL DEFAULT '500',
  `poster` varchar(60) DEFAULT NULL,
  `cols` smallint(1) unsigned NOT NULL DEFAULT '300',
  `dir` varchar(40) NOT NULL,
  `resize` varchar(30) DEFAULT NULL,
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'ebable watermark',
  `likes` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'enable like',
  `sorting` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_gallery_data`
--

DROP TABLE IF EXISTS `mod_gallery_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_gallery_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title_en` varchar(80) NOT NULL,
  `title_he` varchar(80) NOT NULL,
  `description_en` varchar(200) DEFAULT NULL,
  `description_he` varchar(200) DEFAULT NULL,
  `thumb` varchar(80) DEFAULT NULL,
  `likes` int(11) unsigned NOT NULL DEFAULT '0',
  `sorting` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_gmaps`
--

DROP TABLE IF EXISTS `mod_gmaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_gmaps` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `plugin_id` varchar(40) DEFAULT NULL,
  `lat` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `lng` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `body` tinytext,
  `zoom` tinyint(1) unsigned NOT NULL DEFAULT '12',
  `minmaxzoom` varchar(5) DEFAULT NULL,
  `layout` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `type_control` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `streetview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `style` blob,
  `pin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_timeline`
--

DROP TABLE IF EXISTS `mod_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_timeline` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `plugin_id` varchar(25) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `limiter` tinyint(1) unsigned NOT NULL DEFAULT '10',
  `showmore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxitems` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `colmode` varchar(20) DEFAULT 'dual',
  `readmore` varchar(150) DEFAULT NULL,
  `rssurl` varchar(200) DEFAULT NULL,
  `fbid` varchar(150) DEFAULT NULL,
  `fbpage` varchar(150) DEFAULT NULL,
  `fbtoken` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mod_timeline_data`
--

DROP TABLE IF EXISTS `mod_timeline_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_timeline_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'timeline id',
  `type` varchar(30) DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `title_he` varchar(100) NOT NULL,
  `body_en` text,
  `body_he` text,
  `images` blob,
  `dataurl` varchar(250) DEFAULT NULL,
  `height` smallint(3) unsigned NOT NULL DEFAULT '300',
  `readmore` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(120) NOT NULL,
  `title_he` varchar(120) NOT NULL,
  `info_en` varchar(200) DEFAULT NULL,
  `info_he` varchar(200) DEFAULT NULL,
  `modalias` varchar(60) NOT NULL,
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hascoupon` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hasfields` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(3) unsigned NOT NULL DEFAULT '0',
  `is_menu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_builder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keywords_en` varchar(200) DEFAULT NULL,
  `keywords_he` varchar(200) DEFAULT NULL,
  `description_en` text,
  `description_he` text,
  `icon` varchar(50) DEFAULT NULL,
  `ver` decimal(4,2) unsigned NOT NULL DEFAULT '1.00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(200) NOT NULL,
  `title_he` varchar(200) NOT NULL,
  `slug_en` varchar(150) DEFAULT NULL,
  `slug_he` varchar(200) DEFAULT NULL,
  `caption_en` varchar(150) DEFAULT NULL,
  `caption_he` varchar(150) DEFAULT NULL,
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `page_type` enum('normal','home','contact','login','activate','account','register','search','sitemap','profile','policy') NOT NULL DEFAULT 'normal',
  `membership_id` varchar(20) NOT NULL DEFAULT '0',
  `is_comments` tinyint(1) NOT NULL DEFAULT '0',
  `custom_bg_en` varchar(100) DEFAULT NULL,
  `custom_bg_he` varchar(100) DEFAULT NULL,
  `show_header` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `theme` varchar(60) DEFAULT NULL,
  `access` enum('Public','Registered','Membership') NOT NULL DEFAULT 'Public',
  `body_en` text,
  `body_he` text,
  `jscode` text,
  `keywords_en` varchar(200) DEFAULT NULL,
  `keywords_he` varchar(200) DEFAULT NULL,
  `description_en` text,
  `description_he` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_name` varchar(80) DEFAULT NULL,
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `idx_search` (`title_en`,`body_en`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(50) DEFAULT NULL,
  `membership_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `rate_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` varchar(4) DEFAULT NULL,
  `pp` varchar(20) NOT NULL DEFAULT 'Stripe',
  `ip` varbinary(16) DEFAULT '000.000.000.000',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_membership` (`membership_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_carousel`
--

DROP TABLE IF EXISTS `plug_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_carousel` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(100) NOT NULL,
  `title_he` varchar(100) NOT NULL,
  `body_en` text,
  `body_he` text,
  `dots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autoplay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `margin` smallint(4) unsigned NOT NULL DEFAULT '0',
  `loop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_donation`
--

DROP TABLE IF EXISTS `plug_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_donation` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `target_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `pp_email` varchar(80) NOT NULL,
  `redirect_page` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_donation_data`
--

DROP TABLE IF EXISTS `plug_donation_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_donation_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `name` varchar(80) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pp` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_newsletter`
--

DROP TABLE IF EXISTS `plug_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_poll_options`
--

DROP TABLE IF EXISTS `plug_poll_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_poll_options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) unsigned NOT NULL,
  `value` varchar(150) NOT NULL,
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_poll_questions`
--

DROP TABLE IF EXISTS `plug_poll_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_poll_questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_poll_votes`
--

DROP TABLE IF EXISTS `plug_poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_poll_votes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(11) unsigned NOT NULL,
  `voted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_option` (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_rss`
--

DROP TABLE IF EXISTS `plug_rss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_rss` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(120) NOT NULL,
  `items` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_date` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `show_desc` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `max_words` smallint(4) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_slider`
--

DROP TABLE IF EXISTS `plug_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_slider` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `layout` varchar(25) DEFAULT NULL,
  `autoplay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `autoplaySpeed` smallint(1) unsigned NOT NULL DEFAULT '1000',
  `autoplayHoverPause` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autoloop` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `height` smallint(3) unsigned NOT NULL DEFAULT '100',
  `fullscreen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_slider_data`
--

DROP TABLE IF EXISTS `plug_slider_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_slider_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `html_raw` text,
  `html` text,
  `image` varchar(60) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `attrib` varchar(60) DEFAULT NULL,
  `mode` varchar(2) NOT NULL DEFAULT 'bg',
  `sorting` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plug_yplayer`
--

DROP TABLE IF EXISTS `plug_yplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug_yplayer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `layout` varchar(10) DEFAULT NULL,
  `config` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(120) NOT NULL,
  `title_he` varchar(120) NOT NULL,
  `body_en` text,
  `body_he` text,
  `jscode` text,
  `show_title` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alt_class` varchar(30) DEFAULT NULL,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `cplugin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `info_en` varchar(150) DEFAULT NULL,
  `info_he` varchar(150) DEFAULT NULL,
  `plugalias` varchar(50) DEFAULT NULL,
  `hasconfig` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin_id` int(11) unsigned NOT NULL DEFAULT '0',
  `groups` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `icon` varchar(60) DEFAULT NULL,
  `ver` decimal(4,2) NOT NULL DEFAULT '1.00',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plugin_id` (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `mode` varchar(8) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `risk_management`
--

DROP TABLE IF EXISTS `risk_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_management` (
  `rid` int(3) NOT NULL AUTO_INCREMENT,
  `mn_b` int(4) DEFAULT '1' COMMENT 'chips min bet',
  `mx_b` int(4) DEFAULT '1000',
  `max_win` int(10) DEFAULT NULL,
  `pro_min` int(10) NOT NULL DEFAULT '1' COMMENT 'promo min bet',
  `pro_max` int(10) NOT NULL DEFAULT '1000',
  `ex_comi` int(10) NOT NULL DEFAULT '6',
  `sp_comi` int(10) NOT NULL DEFAULT '25',
  `casino_comi` int(10) NOT NULL DEFAULT '5' COMMENT 'commission',
  `ex_sagents` int(10) DEFAULT '0' COMMENT 'SA commission',
  `sa_tr_limit` int(10) DEFAULT '0' COMMENT 'SA transfer limit',
  `sup_credit` int(10) DEFAULT '0' COMMENT 'signup_chips',
  `sup_cpromo` int(10) NOT NULL DEFAULT '0' COMMENT 'signup_promo_cr',
  `fdb` int(10) DEFAULT NULL COMMENT 'first deposit bonus',
  `min_deposit` int(10) DEFAULT NULL,
  `max_deposit` int(10) DEFAULT NULL,
  `min_withdraw` decimal(10,0) DEFAULT NULL,
  `max_withdraw` int(20) DEFAULT NULL,
  `depo_comm` int(10) DEFAULT NULL COMMENT 'deposit commission',
  `wth_comm` int(10) DEFAULT NULL COMMENT 'withdrawal commission',
  `ag_min_transfer` int(4) DEFAULT NULL COMMENT 'tr_to_bet_ac',
  `sa_min_transfer` int(10) DEFAULT NULL COMMENT 'tr_to_bet_ac',
  `deadline` int(10) NOT NULL DEFAULT '500',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `idK_2` (`rid`),
  KEY `idK` (`rid`),
  KEY `mn_b` (`mn_b`),
  KEY `mx_b` (`mx_b`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_privileges`
--

DROP TABLE IF EXISTS `role_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privileges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(6) unsigned NOT NULL DEFAULT '0',
  `pid` int(6) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx` (`rid`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `site_dir` varchar(50) DEFAULT NULL,
  `site_email` varchar(50) NOT NULL,
  `theme` varchar(32) NOT NULL,
  `perpage` tinyint(2) unsigned NOT NULL,
  `backup` varchar(64) NOT NULL,
  `thumb_w` tinyint(3) unsigned NOT NULL,
  `thumb_h` tinyint(3) unsigned NOT NULL,
  `img_w` smallint(3) unsigned NOT NULL,
  `img_h` smallint(3) unsigned NOT NULL,
  `avatar_w` tinyint(2) unsigned NOT NULL,
  `avatar_h` tinyint(2) unsigned NOT NULL,
  `short_date` varchar(20) NOT NULL,
  `long_date` varchar(30) NOT NULL,
  `time_format` varchar(10) DEFAULT NULL,
  `dtz` varchar(120) DEFAULT NULL,
  `locale` varchar(200) DEFAULT NULL,
  `weekstart` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `lang` varchar(2) NOT NULL DEFAULT 'en',
  `lang_list` blob NOT NULL,
  `ploader` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `eucookie` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `offline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `offline_msg` text,
  `offline_d` date DEFAULT NULL,
  `offline_t` time DEFAULT NULL,
  `offline_info` text,
  `logo` varchar(50) DEFAULT NULL,
  `plogo` varchar(50) DEFAULT NULL,
  `showlang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showlogin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showsearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showcrumbs` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `currency` varchar(4) DEFAULT NULL,
  `enable_tax` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `file_size` int(4) unsigned NOT NULL DEFAULT '20971520',
  `file_ext` varchar(150) NOT NULL DEFAULT 'png,jpg,jpeg,bmp',
  `reg_verify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `auto_verify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notify_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `flood` int(3) unsigned NOT NULL DEFAULT '3600',
  `attempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logging` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `analytics` varchar(100) DEFAULT NULL,
  `mailer` enum('PHP','SMTP','SMAIL') DEFAULT NULL,
  `sendmail` varchar(60) DEFAULT NULL,
  `smtp_host` varchar(150) DEFAULT NULL,
  `smtp_user` varchar(50) DEFAULT NULL,
  `smtp_pass` varchar(50) DEFAULT NULL,
  `smtp_port` varchar(3) DEFAULT NULL,
  `is_ssl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inv_info` text,
  `inv_note` text,
  `system_slugs` blob,
  `url_slugs` blob,
  `social_media` blob,
  `ytapi` varchar(120) DEFAULT NULL,
  `mapapi` varchar(120) DEFAULT NULL,
  `yoyon` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `yoyov` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `noticef` text,
  `identity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_agent_request`
--

DROP TABLE IF EXISTS `sh_agent_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_agent_request` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(100) DEFAULT NULL,
  `siteurl` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fullname` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `country` text COLLATE utf8mb4_unicode_520_ci,
  `ddate` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`),
  KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_agents_credit_records`
--

DROP TABLE IF EXISTS `sh_agents_credit_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_agents_credit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_id` varchar(20) DEFAULT NULL,
  `agent_id` varchar(10) DEFAULT NULL,
  `bet_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `odd` double(10,2) DEFAULT NULL,
  `stake` double(10,2) DEFAULT NULL,
  `ab` double(10,2) DEFAULT NULL,
  `amt` double(10,2) DEFAULT NULL,
  `af` double(10,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `debit` varchar(100) DEFAULT NULL,
  `affu_id` int(101) DEFAULT NULL,
  `dt` varchar(10) DEFAULT NULL,
  `st` varchar(10) DEFAULT 'se',
  PRIMARY KEY (`id`),
  KEY `u_id` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_messages_board`
--

DROP TABLE IF EXISTS `sh_messages_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_messages_board` (
  `id` int(21) NOT NULL,
  `agent_notice` longtext,
  `super_agent` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_agent_withdraws`
--

DROP TABLE IF EXISTS `sh_sf_agent_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_agent_withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(118) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'None',
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `send_from` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `acno` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_bet_history`
--

DROP TABLE IF EXISTS `sh_sf_bet_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_bet_history` (
  `slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stake` double(10,2) NOT NULL,
  `winnings` double(10,2) NOT NULL,
  `date` int(11) NOT NULL,
  `bet_info` text COLLATE utf8mb4_unicode_520_ci,
  `odd` float(10,2) DEFAULT NULL,
  `sodd` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `event_id` int(20) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_name` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `bet_option_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bet_option_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aid` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sp` int(4) DEFAULT NULL,
  `debit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `st` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT 'se',
  `ab` float(10,2) DEFAULT NULL,
  `af` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`slip_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_brokers_contacts`
--

DROP TABLE IF EXISTS `sh_sf_brokers_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_brokers_contacts` (
  `id` int(21) NOT NULL,
  `cc` varchar(20) DEFAULT NULL,
  `mobile` varchar(21) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_deposits`
--

DROP TABLE IF EXISTS `sh_sf_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(118) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'None',
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `ac_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `account_no` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_520_ci,
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_events_scores`
--

DROP TABLE IF EXISTS `sh_sf_events_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_events_scores` (
  `bet_event_id` int(255) NOT NULL DEFAULT '0',
  `our_id` varchar(255) DEFAULT NULL,
  `spid` varchar(55) DEFAULT '0',
  `league` varchar(200) DEFAULT NULL,
  `e_name` varchar(255) DEFAULT 'Event',
  `score` varchar(255) NOT NULL DEFAULT '0-0',
  `timer` varchar(255) DEFAULT '0.0',
  `atts` varchar(255) DEFAULT '0-0',
  `dan_atts` varchar(255) DEFAULT '0-0',
  `cor` varchar(255) DEFAULT '0-0',
  `pen` varchar(255) DEFAULT '0-0',
  `on_tar` varchar(255) DEFAULT '0-0',
  `off_tar` varchar(255) DEFAULT '0-0',
  `poss` varchar(255) DEFAULT '0-0',
  `red` varchar(255) DEFAULT '0-0',
  `yelo` varchar(255) DEFAULT '0-0',
  `comm` text,
  `status` varchar(11) DEFAULT NULL,
  `img_h_id` int(10) DEFAULT NULL,
  `img_a_id` int(10) DEFAULT NULL,
  `yes` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`bet_event_id`),
  UNIQUE KEY `id` (`bet_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_images`
--

DROP TABLE IF EXISTS `sh_sf_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bet_event_id` int(12) DEFAULT NULL,
  `img_home` longblob,
  `img_away` longblob,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_inbox`
--

DROP TABLE IF EXISTS `sh_sf_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_inbox` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `send_from` varchar(21) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `name_rec` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `send_to` int(21) DEFAULT NULL,
  `support` text COLLATE utf8mb4_unicode_520_ci,
  `user` text COLLATE utf8mb4_unicode_520_ci,
  `seen` int(1) NOT NULL DEFAULT '0',
  `date_record` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `send_to` (`send_to`),
  KEY `seen` (`seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_payment_links`
--

DROP TABLE IF EXISTS `sh_sf_payment_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_payment_links` (
  `id` int(21) DEFAULT NULL,
  `paypal` varchar(200) DEFAULT NULL,
  `skrill` varchar(200) DEFAULT NULL,
  `neteller` varchar(200) DEFAULT NULL,
  `perfect_money` varchar(200) DEFAULT NULL,
  `payoneer` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_points_log`
--

DROP TABLE IF EXISTS `sh_sf_points_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_points_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` varchar(118) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'None',
  `txn_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aff_id` int(11) DEFAULT '0',
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `bf` double(10,2) DEFAULT '0.00',
  `af` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_slips`
--

DROP TABLE IF EXISTS `sh_sf_slips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_slips` (
  `slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stake` double(10,2) NOT NULL,
  `winnings` double(10,2) NOT NULL,
  `date` int(11) NOT NULL,
  `bet_info` text COLLATE utf8mb4_unicode_520_ci,
  `od` float(10,2) NOT NULL,
  `event_id` int(20) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cn` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `oid` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bn` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aid` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sp` int(4) DEFAULT NULL,
  `debit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `st` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'se',
  PRIMARY KEY (`slip_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_slips_history`
--

DROP TABLE IF EXISTS `sh_sf_slips_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_slips_history` (
  `slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stake` double(10,2) NOT NULL,
  `winnings` double(10,2) NOT NULL,
  `date` int(11) NOT NULL,
  `bet_info` text COLLATE utf8mb4_unicode_520_ci,
  `odd` float(10,2) NOT NULL,
  `sodd` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `event_id` int(20) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_name` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `bet_option_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bet_option_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aid` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sp` int(4) DEFAULT NULL,
  `debit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `st` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'se',
  PRIMARY KEY (`slip_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_tickets_history`
--

DROP TABLE IF EXISTS `sh_sf_tickets_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_tickets_history` (
  `slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stake` double(10,2) NOT NULL,
  `winnings` double(10,2) NOT NULL,
  `date` varchar(122) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bet_info` text COLLATE utf8mb4_unicode_520_ci,
  `odd` float(10,2) NOT NULL,
  `sodd` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `event_id` int(20) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_name` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  `bet_option_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bet_option_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aid` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `said` int(12) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sp` int(4) DEFAULT NULL,
  `debit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `st` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT 'se',
  PRIMARY KEY (`slip_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `slip_id` (`slip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_tickets_records`
--

DROP TABLE IF EXISTS `sh_sf_tickets_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_tickets_records` (
  `slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `stake` double(10,2) NOT NULL,
  `winnings` double(10,2) NOT NULL,
  `date` int(11) NOT NULL,
  `bet_info` text COLLATE utf8mb4_unicode_520_ci,
  `odd` float(10,2) DEFAULT NULL,
  `sodd` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `event_id` int(20) DEFAULT NULL,
  `event_name` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_name` varchar(300) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `bet_option_id` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bet_option_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aid` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `said` int(12) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sp` int(4) DEFAULT NULL,
  `debit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `st` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT 'se',
  PRIMARY KEY (`slip_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_transfers`
--

DROP TABLE IF EXISTS `sh_sf_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(118) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'None',
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `send_from` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `send_to` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_users_bank`
--

DROP TABLE IF EXISTS `sh_sf_users_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_users_bank` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `wallet_address` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_users_notice`
--

DROP TABLE IF EXISTS `sh_sf_users_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_users_notice` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `uid` int(100) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `timer` int(21) DEFAULT NULL,
  `seen` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_sf_withdraws`
--

DROP TABLE IF EXISTS `sh_sf_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_sf_withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(118) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'None',
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT '0',
  `date` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `withdrawal_details` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `send_from` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cc` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `aprov_id` int(12) DEFAULT NULL,
  `paid` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `cc` (`cc`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_slot_casino_dealers`
--

DROP TABLE IF EXISTS `sh_slot_casino_dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_slot_casino_dealers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `agent_id` varchar(20) DEFAULT NULL,
  `game_id` varchar(200) DEFAULT NULL,
  `game_name` varchar(256) DEFAULT 'horseracing',
  `stake` varchar(20) DEFAULT NULL,
  `user_win` double(10,2) DEFAULT NULL,
  `ag_win` double(10,2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL COMMENT 'tid',
  `updated_at` int(20) DEFAULT NULL,
  `admin` int(2) DEFAULT NULL COMMENT '1= no admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_users_credit_records`
--

DROP TABLE IF EXISTS `sh_users_credit_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_users_credit_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_id` varchar(20) DEFAULT NULL,
  `u_id` int(10) DEFAULT NULL,
  `bet_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `odd` double(10,2) DEFAULT NULL,
  `stake` double(10,2) DEFAULT NULL,
  `ab` double(10,2) DEFAULT NULL,
  `amt` double(10,2) DEFAULT NULL,
  `af` double(10,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `debit` varchar(100) DEFAULT NULL,
  `aid` varchar(101) DEFAULT NULL,
  `dt` varchar(10) DEFAULT NULL,
  `st` varchar(10) NOT NULL DEFAULT 'se',
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_virtual_games`
--

DROP TABLE IF EXISTS `sh_virtual_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_virtual_games` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `agent_id` varchar(20) DEFAULT NULL,
  `game_name` varchar(256) DEFAULT 'horseracing',
  `stake` varchar(20) DEFAULT NULL,
  `user_win` double(10,2) DEFAULT NULL,
  `ag_win` double(10,2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updated_at` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sh_withdraw_request_broker`
--

DROP TABLE IF EXISTS `sh_withdraw_request_broker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_withdraw_request_broker` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `paymentid` varchar(109) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(44) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mode` varchar(111) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `amount` varchar(11) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sfrom` varchar(111) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userrole` varchar(11) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `drawdate` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `u_id` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `day` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pageviews` int(11) unsigned NOT NULL DEFAULT '0',
  `uniquevisitors` int(11) unsigned DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `agid` int(10) DEFAULT NULL,
  `said` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `agid` (`agid`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trash`
--

DROP TABLE IF EXISTS `trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` varchar(15) DEFAULT NULL,
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(15) DEFAULT NULL,
  `dataset` blob,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_memberships`
--

DROP TABLE IF EXISTS `user_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_memberships` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `mid` int(11) unsigned NOT NULL DEFAULT '0',
  `activated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expire` timestamp NULL DEFAULT NULL,
  `recurring` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 = expired, 1 = active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `fname` varchar(32) NOT NULL,
  `lname` varchar(32) NOT NULL,
  `email` varchar(60) NOT NULL,
  `membership_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mem_expire` datetime DEFAULT NULL,
  `trial_used` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `memused` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `salt` varchar(25) NOT NULL,
  `hash` varchar(70) NOT NULL,
  `token` varchar(40) NOT NULL DEFAULT '0',
  `userlevel` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `real_id` varchar(255) DEFAULT NULL,
  `bod_date` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'member',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT '000.000.000.000',
  `avatar` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `country` varchar(4) DEFAULT NULL,
  `notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `access` text,
  `notes` tinytext COMMENT 'phone',
  `info` tinytext,
  `fb_link` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `stripe_cus` varchar(100) DEFAULT 'USD',
  `modaccess` varchar(150) DEFAULT NULL,
  `plugaccess` varchar(150) DEFAULT NULL,
  `active` enum('y','n','t','b','x') NOT NULL DEFAULT 'n',
  `chips` double(10,2) NOT NULL DEFAULT '0.00',
  `promo` double(10,2) NOT NULL DEFAULT '0.00',
  `max_bet` int(5) DEFAULT NULL,
  `afid` int(11) DEFAULT NULL,
  `afbal` double(10,2) DEFAULT NULL,
  `said` int(10) DEFAULT NULL,
  `sabal` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `afid` (`afid`),
  KEY `said` (`said`),
  KEY `active` (`active`),
  KEY `type` (`type`),
  KEY `created` (`created`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100767 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `www_token`
--

DROP TABLE IF EXISTS `www_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `www_token` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(111) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `serial` (`serial`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-28 16:35:56
