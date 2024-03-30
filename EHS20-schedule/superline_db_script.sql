CREATE DATABASE  IF NOT EXISTS `superline` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `superline`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: superline
-- ------------------------------------------------------
-- Server version	8.3.0

SET GLOBAL log_bin_trust_function_creators = 1;

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
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ehs_user_id` int unsigned NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agents_ehs_user_id_index` (`ehs_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_request_token`
--

DROP TABLE IF EXISTS `api_request_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_request_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience` (
  `audience_groupId` bigint NOT NULL AUTO_INCREMENT COMMENT '受眾 id',
  `description` varchar(120) DEFAULT NULL COMMENT '受眾描述(名稱)',
  `audience_count` int DEFAULT NULL COMMENT '受眾人數',
  `expire_at` datetime DEFAULT NULL COMMENT '過期時間',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `created_by` int DEFAULT NULL COMMENT '建立者',
  `status` tinyint DEFAULT '1' COMMENT '狀態 1=有效, 2=已刪除',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`audience_groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=9984456256180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='受眾表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audience_clients`
--

DROP TABLE IF EXISTS `audience_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience_clients` (
  `audience_groupId` bigint NOT NULL COMMENT '受眾 id',
  `customer_id` int NOT NULL COMMENT '客代',
  PRIMARY KEY (`audience_groupId`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='受眾-客戶, 對應表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audience_temp`
--

DROP TABLE IF EXISTS `audience_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience_temp` (
  `customer_id` int NOT NULL COMMENT '客代',
  `tx_key` varchar(50) NOT NULL COMMENT '交易Key, 分辨批次使用',
  PRIMARY KEY (`customer_id`,`tx_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暫存表, 提供 csv 匯入客代';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calculate_hash_clients`
--

DROP TABLE IF EXISTS `calculate_hash_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculate_hash_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='臨時性任務用，儲存 clients 計算手機 hash 進度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'token',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'secret',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatrooms`
--

DROP TABLE IF EXISTS `chatrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatrooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  `unread` int unsigned NOT NULL DEFAULT '0',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `chatrooms_channel_id_index` (`channel_id`),
  KEY `chatrooms_user_id_index` (`user_id`),
  KEY `chatrooms_client_id_index` (`client_id`),
  KEY `chatrooms_uuid_index` (`uuid`),
  KEY `chatrooms_updated_at_index` (`updated_at`),
  CONSTRAINT `chatrooms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatrooms_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chatrooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_customerid_log`
--

DROP TABLE IF EXISTS `client_customerid_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_customerid_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `ori_customer_id` int unsigned DEFAULT NULL,
  `new_customer_id` int unsigned DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_daily_metrics`
--

DROP TABLE IF EXISTS `client_daily_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_daily_metrics` (
  `year` smallint NOT NULL COMMENT '年',
  `month` smallint NOT NULL COMMENT '月',
  `day` smallint NOT NULL COMMENT '日',
  `bind_count` int NOT NULL DEFAULT '0' COMMENT '當日綁定手機好友數',
  `follow_count` int NOT NULL DEFAULT '0' COMMENT '當日追蹤好友數',
  `unfollow_count` int NOT NULL DEFAULT '0' COMMENT '當日封鎖好友數',
  `client_total` int NOT NULL DEFAULT '0' COMMENT '好友總數',
  `bind_total` int NOT NULL DEFAULT '0' COMMENT '已綁定手機好友數',
  `client_block_total` int NOT NULL DEFAULT '0' COMMENT '已封鎖好友數',
  `bind_block_total` int NOT NULL DEFAULT '0' COMMENT '已綁定手機的好友封鎖數',
  `client_valid_total` int NOT NULL DEFAULT '0' COMMENT '有效好友數',
  `bind_valid_total` int NOT NULL DEFAULT '0' COMMENT '綁定有效好友數'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_tag`
--

DROP TABLE IF EXISTS `client_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_tag` (
  `tagid` int unsigned NOT NULL,
  `clientid` int unsigned NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `started_at` datetime NOT NULL,
  `expired_at` datetime NOT NULL,
  UNIQUE KEY `UK_client_tag` (`tagid`,`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_tags`
--

DROP TABLE IF EXISTS `client_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_chatroom_id` int DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1001',
  `line_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_tags_client_id_index` (`client_id`),
  KEY `client_tags_customer_id_index` (`customer_id`),
  KEY `client_tags_name_index` (`name`),
  KEY `idx_started_expired` (`started_at`,`expired_at`),
  CONSTRAINT `client_tags_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_user`
--

DROP TABLE IF EXISTS `client_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_user_user_id_index` (`user_id`),
  KEY `client_user_client_id_index` (`client_id`),
  CONSTRAINT `client_user_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_user_log`
--

DROP TABLE IF EXISTS `client_user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_user_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `ori_user_id` int unsigned NOT NULL,
  `new_user_id` int unsigned NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `profile_id` int unsigned NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '即將棄用,不要再select',
  `hash_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mask_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summarized_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '反正規化後的訊息(json)',
  `verify` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `binding_at` timestamp NULL DEFAULT NULL COMMENT '手機綁定時間',
  PRIMARY KEY (`id`),
  KEY `clients_customer_id_index` (`customer_id`),
  KEY `clients_profile_id_index` (`profile_id`),
  KEY `clients_disabled_index` (`disabled`),
  KEY `clients_created_at_index` (`created_at`),
  KEY `clients_nickname_index` (`nickname`),
  KEY `clients_hash_phone_index` (`hash_phone`),
  KEY `clients_phone_index` (`phone`),
  CONSTRAINT `clients_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_data`
--

DROP TABLE IF EXISTS `combo_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comboId` varchar(50) DEFAULT NULL COMMENT '組合結構表 Id',
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '標題',
  `altText` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL COMMENT '狀態, 0=刪除, 1=啟用, 2=停用',
  `data` longtext COMMENT '內容',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `created_by` int DEFAULT NULL COMMENT '建立者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Combo FlexMessage 模版內容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_material`
--

DROP TABLE IF EXISTS `combo_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_material` (
  `uuid` varchar(255) NOT NULL COMMENT '素材 uuid ',
  `comboId` varchar(50) DEFAULT NULL COMMENT '模板 Id',
  `type` tinyint NOT NULL COMMENT '素材類型',
  `status` tinyint NOT NULL COMMENT '狀態(0=不啟用, 1=啟用, 2=已刪除)',
  `path` varchar(100) NOT NULL COMMENT '素材檔案相對路徑',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `created_by` int NOT NULL COMMENT '建立者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
  `updated_by` int NOT NULL COMMENT '更新者'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='模板素材';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_schema`
--

DROP TABLE IF EXISTS `combo_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_schema` (
  `comboId` varchar(50) NOT NULL COMMENT '流水號 Id',
  `schema` text COMMENT '模板結構',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint unsigned NOT NULL COMMENT '狀態, 0=刪除, 1=啟用, 2=停用',
  `schemaSpec` varchar(1000) DEFAULT NULL COMMENT '模板屬性規範',
  `sort` tinyint unsigned DEFAULT NULL COMMENT '排序',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `created_by` int DEFAULT NULL COMMENT '建立者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`comboId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Combo FlexMessage 模版結構表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '即將棄用,不要再select',
  `ehs_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_ehs_user_id_index` (`ehs_user_id`),
  KEY `customers_customer_id_index` (`customer_id`),
  KEY `customers_mobile_index` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers_import_check`
--

DROP TABLE IF EXISTS `customers_import_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_import_check` (
  `customer_id` int NOT NULL COMMENT '客代',
  `guid` varchar(50) NOT NULL COMMENT 'guid',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`customer_id`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='客戶名單檢查';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_addition_history`
--

DROP TABLE IF EXISTS `event_addition_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_addition_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL DEFAULT '0',
  `rate_id` int NOT NULL COMMENT '獎項設定id',
  `addition_qty` int NOT NULL COMMENT '加碼數量',
  `created_at` datetime NOT NULL COMMENT '建立時間',
  `created_by` int NOT NULL COMMENT '建立人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='活動加碼紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_award_rate`
--

DROP TABLE IF EXISTS `event_award_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_award_rate` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event_id` int NOT NULL COMMENT '活動id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '獎項名稱',
  `type` int NOT NULL DEFAULT '0' COMMENT '獎項類型',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '中獎訊息',
  `win_rate` double NOT NULL COMMENT '中獎機率',
  `qty` int DEFAULT '0',
  `addition_qty` int DEFAULT '0' COMMENT '加碼數量',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `created_by` int NOT NULL DEFAULT '0' COMMENT '建立人員',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
  `updated_by` int NOT NULL DEFAULT '0' COMMENT '更新人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_award_setting`
--

DROP TABLE IF EXISTS `event_award_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_award_setting` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '獎項ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '獎項名稱',
  `qty` smallint DEFAULT NULL COMMENT '獎項數量',
  `type` smallint NOT NULL COMMENT '獎項類型（序號、銘謝惠顧）',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用於存儲中獎訊息',
  `is_limit` tinyint(1) NOT NULL COMMENT '是否有限量',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `created_by` int NOT NULL DEFAULT '0' COMMENT '建立人員',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
  `updated_by` int NOT NULL DEFAULT '0' COMMENT '更新人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_award_sn`
--

DROP TABLE IF EXISTS `event_award_sn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_award_sn` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int NOT NULL DEFAULT '0',
  `rate_id` int NOT NULL,
  `available` tinyint(1) NOT NULL,
  `sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_main_info`
--

DROP TABLE IF EXISTS `event_main_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_main_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '活動 Id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動名稱',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活動描述',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'GUID',
  `event_type` int NOT NULL COMMENT '活動類型',
  `start_date` datetime NOT NULL COMMENT '活動開始時間',
  `end_date` datetime NOT NULL COMMENT '活動結束時間',
  `is_enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否啟用此活動',
  `is_del` smallint NOT NULL DEFAULT '0' COMMENT '是否虛擬刪除',
  `is_repeated_draws` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可重複抽獎',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `created_by` int NOT NULL DEFAULT '0' COMMENT '建立人員',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
  `updated_by` int NOT NULL DEFAULT '0' COMMENT '更新人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_picture`
--

DROP TABLE IF EXISTS `event_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_picture` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `event_id` int NOT NULL COMMENT '活動 Id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '圖片路徑',
  `location` int NOT NULL COMMENT '圖片位置',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `created_by` int NOT NULL DEFAULT '0' COMMENT '建立人員',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新時間',
  `updated_by` int NOT NULL DEFAULT '0' COMMENT '更新人員',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_records`
--

DROP TABLE IF EXISTS `event_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `line_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int NOT NULL,
  `setting_id` int NOT NULL,
  `sn_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `functions`
--

DROP TABLE IF EXISTS `functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functions` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '功能Id',
  `ParentId` int DEFAULT NULL COMMENT '父層Id',
  `Enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否啟用',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '功能名稱',
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能描述',
  `Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能選單ICON',
  `Url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能的Url',
  `Sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `CreatedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int NOT NULL,
  `ModifiedTime` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_template_messages`
--

DROP TABLE IF EXISTS `group_template_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_template_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint unsigned DEFAULT NULL,
  `headline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_reserved` tinyint DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '1: 單一 2: 群族',
  `status` tinyint DEFAULT NULL COMMENT '狀態:(0:關閉,1:開啟,2:刪除)',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ib_stream_log`
--

DROP TABLE IF EXISTS `ib_stream_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ib_stream_log` (
  `activity_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ib_stream_message`
--

DROP TABLE IF EXISTS `ib_stream_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ib_stream_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `type` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ib_stream_users`
--

DROP TABLE IF EXISTS `ib_stream_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ib_stream_users` (
  `activity_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `verify_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagemap_video`
--

DROP TABLE IF EXISTS `imagemap_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagemap_video` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `imagemap_id` bigint unsigned DEFAULT NULL,
  `movie_id` bigint unsigned DEFAULT NULL,
  `original_content_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `preview_image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `x` int DEFAULT NULL,
  `y` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `link_uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagemaps`
--

DROP TABLE IF EXISTS `imagemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagemaps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned DEFAULT NULL,
  `template_message_id` bigint unsigned DEFAULT NULL,
  `type` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_size_width` int DEFAULT NULL,
  `base_size_height` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` tinyint NOT NULL DEFAULT '1',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images_new`
--

DROP TABLE IF EXISTS `images_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images_new` (
  `uuid` varchar(255) NOT NULL COMMENT '圖檔uuid / 圖檔名稱',
  `type` tinyint NOT NULL COMMENT '圖檔類型(早安圖,節日圖...)',
  `status` tinyint NOT NULL COMMENT '狀態(0=不啟用, 1=啟用, 2=已刪除)',
  `tag` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '標籤(提供搜尋使用)',
  `linkUrl` varchar(100) DEFAULT NULL COMMENT '點擊圖片後連結',
  `path` varchar(100) NOT NULL COMMENT '相對路徑',
  `start_time` datetime DEFAULT NULL COMMENT '圖片可使用時間(開始)',
  `end_time` datetime DEFAULT NULL COMMENT '圖片可使用時間(結束)',
  `created_at` datetime NOT NULL COMMENT '建立時間',
  `created_by` int NOT NULL COMMENT '建立者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  `referenceId` varchar(50) DEFAULT NULL COMMENT '參考 Id',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='圖片(早安圖,節日圖...)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images_type`
--

DROP TABLE IF EXISTS `images_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images_type` (
  `id` int NOT NULL COMMENT '流水號',
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL COMMENT '圖庫類型',
  `canLink` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否允許連結',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='圖庫類型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insight_demographic`
--

DROP TABLE IF EXISTS `insight_demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insight_demographic` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` char(8) NOT NULL,
  `query_date` date NOT NULL,
  `available` tinyint(1) NOT NULL,
  `ages` text,
  `genders` text,
  `areas` text,
  `app_types` text,
  `subscription_periods` text,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2807 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insight_followers`
--

DROP TABLE IF EXISTS `insight_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insight_followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` char(8) NOT NULL,
  `query_date` date NOT NULL,
  `status` char(14) NOT NULL,
  `followers` int unsigned DEFAULT NULL,
  `targeted_reaches` int unsigned DEFAULT NULL,
  `blocks` int unsigned DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2817 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insight_interaction`
--

DROP TABLE IF EXISTS `insight_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insight_interaction` (
  `uuid` varchar(255) NOT NULL COMMENT '發送訊息時的 request Id',
  `delivered` int DEFAULT NULL COMMENT '已發送',
  `uniqueImpression` int DEFAULT NULL COMMENT '開封訊息的人數 (至少開啟一則bubble)',
  `uniqueClick` int DEFAULT NULL COMMENT '打開 url 的人數',
  `uniqueMediaPlayed` int DEFAULT NULL COMMENT '觀看影音的人數',
  `uniqueMediaPlayed100Percent` int DEFAULT NULL COMMENT '觀看影音並完整看完的人數',
  `messages` text COMMENT '訊息中各 bubble 的統計資訊',
  `clicks` text COMMENT '訊息中 url 被開啟的資訊',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間(應等於訊息發送時間)',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='insight boradcast or narrowcast 訊息分析資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insight_message_delivery`
--

DROP TABLE IF EXISTS `insight_message_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insight_message_delivery` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` char(8) NOT NULL COMMENT '分店編號',
  `query_date` date NOT NULL COMMENT '查詢日期',
  `status` char(14) NOT NULL COMMENT '狀態(Ready/ unready/ out_of_service)',
  `broadcast` int unsigned DEFAULT NULL COMMENT 'Number of broadcast messages',
  `targeting` int unsigned DEFAULT NULL COMMENT 'Number of targeted/segmented messages',
  `auto_response` int unsigned DEFAULT NULL COMMENT 'Number of auto-response messages',
  `welcome_response` int unsigned DEFAULT NULL COMMENT 'Number of greeting messages',
  `chat` int unsigned DEFAULT NULL COMMENT 'Number of Manager Chat screen',
  `api_broadcast` int unsigned DEFAULT NULL COMMENT 'Number of Send broadcast message Messaging API operation',
  `api_push` int unsigned DEFAULT NULL COMMENT 'Number of Send push message Messaging API operation',
  `api_multicast` int unsigned DEFAULT NULL COMMENT 'Number of Send multicast message Messaging API operation.',
  `api_narrowcast` int unsigned DEFAULT NULL COMMENT 'Number of Send narrowcast message Messaging API operation',
  `api_reply` int unsigned DEFAULT NULL COMMENT 'Number of Send reply message Messaging API operation',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2817 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_process`
--

DROP TABLE IF EXISTS `job_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_process` (
  `job_name` varchar(255) NOT NULL,
  `process_column` varchar(255) NOT NULL,
  `process_data` varchar(255) DEFAULT NULL,
  `is_done` bit(1) NOT NULL DEFAULT b'0',
  `is_repeatable` bit(1) DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_messages`
--

DROP TABLE IF EXISTS `leave_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` int DEFAULT '0' COMMENT '0:指定區間訊息 1:預設假日訊息 2:預設上班日訊息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_msgs`
--

DROP TABLE IF EXISTS `leave_msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_msgs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `repeat_day_id` int NOT NULL COMMENT '對應重複日期ID',
  `type` tinyint(1) NOT NULL COMMENT '類型: 1: 文字 / 2: 卡片',
  `content` text NOT NULL COMMENT '內容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `line_official_account`
--

DROP TABLE IF EXISTS `line_official_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_official_account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account` char(50) NOT NULL,
  `password` text NOT NULL,
  `name` char(20) NOT NULL,
  `token` text NOT NULL,
  `status` tinyint NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_log` (
  `user_id` int unsigned NOT NULL,
  `login_date` datetime NOT NULL,
  `logout_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `collection_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `media_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '新版欄位-media url',
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1663 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_audios`
--

DROP TABLE IF EXISTS `message_audios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_audios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_combo`
--

DROP TABLE IF EXISTS `message_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_combo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` json DEFAULT NULL COMMENT '資料內容',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '建立時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='訊息子表-MessageCombo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_files`
--

DROP TABLE IF EXISTS `message_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_images`
--

DROP TABLE IF EXISTS `message_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_jsons`
--

DROP TABLE IF EXISTS `message_jsons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_jsons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=latin1 COMMENT='新版-message格式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_locations`
--

DROP TABLE IF EXISTS `message_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_stickers`
--

DROP TABLE IF EXISTS `message_stickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_stickers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticker_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_texts`
--

DROP TABLE IF EXISTS `message_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6742 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_videos`
--

DROP TABLE IF EXISTS `message_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chatroom_id` int unsigned NOT NULL,
  `profile_id` int unsigned NOT NULL,
  `messageable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageable_id` bigint unsigned NOT NULL,
  `reply_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'from line server',
  `sent` tinyint(1) NOT NULL DEFAULT '1',
  `group` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `messages_messageable_type_messageable_id_index` (`messageable_type`,`messageable_id`) USING BTREE,
  KEY `messages_chatroom_id_index` (`chatroom_id`) USING BTREE,
  KEY `messages_profile_id_index` (`profile_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_height` int DEFAULT NULL,
  `video_width` int DEFAULT NULL,
  `azure_asset_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `azure_job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `azure_streaming_locator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `azure_transform_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `azure_state` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `updated_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `para_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `para_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `para_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pending_clients`
--

DROP TABLE IF EXISTS `pending_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_clients` (
  `client_id` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='臨時性任務用，儲存待處理客戶目前執行進度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品圖 uuid /圖片名稱',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相對路徑',
  `status` tinyint DEFAULT NULL COMMENT '狀態',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `created_by` int DEFAULT NULL COMMENT '建立者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品圖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_images_map`
--

DROP TABLE IF EXISTS `product_images_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleNo` int NOT NULL COMMENT '商品銷售編號',
  `product_imageId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品圖 uuid',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_imageId` (`product_imageId`),
  KEY `idx_saleNo` (`saleNo`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_new`
--

DROP TABLE IF EXISTS `product_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_new` (
  `saleNo` bigint unsigned NOT NULL COMMENT '銷售編號',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名稱',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '文案',
  `keyword` varchar(100) DEFAULT NULL COMMENT '關鍵搜尋字',
  `status` tinyint DEFAULT '0' COMMENT '狀態 0=停用,1=啟用,2=刪除',
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`saleNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表(from excel)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sheet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `outbound_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int unsigned NOT NULL,
  `vendor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `line_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Default name',
  `picture_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_message` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `repeat_days`
--

DROP TABLE IF EXISTS `repeat_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repeat_days` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '類型：0: 不重複 / 1: day / 2: week / 3: month / 4: year',
  `spacing` int DEFAULT NULL COMMENT '間隔數',
  `days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '重複日期',
  `start_at` datetime NOT NULL COMMENT '循環開始時間',
  `end_at` datetime NOT NULL COMMENT '循環結束時間',
  `repeat_end_at` date DEFAULT NULL COMMENT '重複結束時間',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rich_menu_master`
--

DROP TABLE IF EXISTS `rich_menu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rich_menu_master` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rich_menu_master_new`
--

DROP TABLE IF EXISTS `rich_menu_master_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rich_menu_master_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='圖文選單主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rich_menu_slave`
--

DROP TABLE IF EXISTS `rich_menu_slave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rich_menu_slave` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `master_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chatBarText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areas` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rich_menu_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rich_menu_alias_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `urls` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rich_menu_slave_new`
--

DROP TABLE IF EXISTS `rich_menu_slave_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rich_menu_slave_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master_id` int NOT NULL,
  `chatBarText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `colActions` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_functions`
--

DROP TABLE IF EXISTS `role_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_functions` (
  `RoleId` int NOT NULL COMMENT '角色Id',
  `FunctionId` int NOT NULL COMMENT '功能Id',
  `AccessLevel` int NOT NULL DEFAULT '1' COMMENT '功能存取等級',
  PRIMARY KEY (`RoleId`,`FunctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT '角色Id',
  `Enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '角色啟用狀態',
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名稱',
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `Sort` int NOT NULL,
  `CreatedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int NOT NULL,
  `ModifiedTime` datetime DEFAULT NULL,
  `ModifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stickers`
--

DROP TABLE IF EXISTS `stickers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stickers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int unsigned NOT NULL,
  `sticker_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stickers_new`
--

DROP TABLE IF EXISTS `stickers_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stickers_new` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int unsigned NOT NULL,
  `sticker_id` int unsigned NOT NULL,
  `disabled` bit(1) DEFAULT b'0' COMMENT '是否停用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_activity`
--

DROP TABLE IF EXISTS `stream_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_activity` (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '直播活動編號',
  `name` varchar(500) NOT NULL COMMENT '活動名稱',
  `description` varchar(1000) DEFAULT NULL COMMENT '活動說明',
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '直播連結',
  `type` smallint NOT NULL COMMENT '直播類型',
  `start_time` datetime NOT NULL COMMENT '活動開始時間',
  `end_time` datetime NOT NULL COMMENT '活動結束時間',
  `live_start` datetime NOT NULL COMMENT '直播開始時間',
  `live_end` datetime NOT NULL COMMENT '直播結束時間',
  `created_at` datetime NOT NULL COMMENT '建立時間',
  `created_by` int NOT NULL COMMENT '建立人員',
  `updated_at` datetime DEFAULT NULL COMMENT '修改時間',
  `updated_by` int DEFAULT NULL COMMENT '修改人員',
  `disable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否停用',
  `is_limit_consumer` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否僅限有客代使用者進入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='直播活動';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_admin`
--

DROP TABLE IF EXISTS `stream_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_admin` (
  `client_id` int NOT NULL,
  `line_user_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='直播管理員';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_log`
--

DROP TABLE IF EXISTS `stream_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_log` (
  `activity_id` varchar(255) NOT NULL COMMENT '活動編號',
  `line_user_id` varchar(255) NOT NULL,
  `type` smallint NOT NULL COMMENT '紀錄類型',
  `created_at` datetime NOT NULL COMMENT '建立時間',
  KEY `idx_stream_log_activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='直播紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_message`
--

DROP TABLE IF EXISTS `stream_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '訊息編號',
  `activity_id` varchar(255) NOT NULL COMMENT '活動編號',
  `line_user_id` varchar(255) DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `text` varchar(2000) NOT NULL COMMENT '訊息文字',
  `created_at` datetime NOT NULL COMMENT '建立時間',
  `parent_id` bigint DEFAULT NULL COMMENT '所回覆的訊息編號',
  `type` smallint NOT NULL DEFAULT '1' COMMENT '發送者類型',
  `is_del` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已刪除 0-未刪除 1-已刪除',
  `updated_at` datetime DEFAULT NULL COMMENT '異動時間',
  `updated_by` int DEFAULT NULL COMMENT '異動人員',
  PRIMARY KEY (`id`),
  KEY `activityid_index` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155618 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='直播訊息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_message_record`
--

DROP TABLE IF EXISTS `stream_message_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_message_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_id` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stream_created` (`stream_id`,`created_at`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='發送直播通知訊息紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_phrase`
--

DROP TABLE IF EXISTS `stream_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_phrase` (
  `activity_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '直播活動編號',
  `phrase` varchar(200) NOT NULL COMMENT '活動快速片語',
  `is_notice_agent` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否通知專員'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='直播快速片語';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stream_product`
--

DROP TABLE IF EXISTS `stream_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_product` (
  `activity_id` varchar(255) NOT NULL COMMENT '直播活動編號',
  `sale_no` bigint NOT NULL COMMENT '商品銷編',
  `link` varchar(255) NOT NULL COMMENT '結帳連結',
  `sort` int NOT NULL DEFAULT '0' COMMENT '產品排序'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='直播商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ready` tinyint NOT NULL DEFAULT '0' COMMENT '0: draft, 1: ready',
  `sent` tinyint NOT NULL DEFAULT '0' COMMENT '0: unsent, 1: sent',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reservation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msg_sent` int unsigned DEFAULT NULL COMMENT '已發送數',
  `msg_total` int unsigned DEFAULT NULL COMMENT '總發送數',
  `line_api_output` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '發送回傳值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `line_rid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_items`
--

DROP TABLE IF EXISTS `template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_items` (
  `id` varchar(255) NOT NULL,
  `template_id` int NOT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `text` text,
  `url` varchar(2000) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_message_actions`
--

DROP TABLE IF EXISTS `template_message_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_message_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_message_column_id` int unsigned DEFAULT NULL,
  `template_message_id` int unsigned DEFAULT NULL,
  `action_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '類型',
  `label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '標籤',
  `data` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'postback data',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回應內容',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '給客戶貼標',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_message_columns`
--

DROP TABLE IF EXISTS `template_message_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_message_columns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_message_id` int unsigned DEFAULT NULL,
  `thumbnailImageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '標題',
  `text` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '選項類型(1:單選,2:複選)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_messages`
--

DROP TABLE IF EXISTS `template_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned DEFAULT NULL,
  `group_template_message_id` int NOT NULL COMMENT '群族編號',
  `group_template_message_sort` int NOT NULL COMMENT '群族中排序',
  `thumbnailImageUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '標題',
  `title` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主標',
  `text` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文字',
  `altText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '無法顯示時的替代文字',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '類型',
  `option_display_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '選項呈現形式',
  `option_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '選項類型(1:單選,2:複選)',
  `snapshot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_reserved` tinyint unsigned DEFAULT '0' COMMENT '是否預約發送(0:否,1:是)',
  `status` tinyint DEFAULT NULL COMMENT '狀態:(0:關閉,1:開啟,2:刪除)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT 'text, photo',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_message_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_pending`
--

DROP TABLE IF EXISTS `user_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_pending` (
  `userId` int NOT NULL AUTO_INCREMENT COMMENT '待確認的使用者',
  `type` tinyint DEFAULT NULL COMMENT '狀態, 0=不存在, 1=待確認',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  `updated_by` int DEFAULT NULL COMMENT '異動者',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `UserId` int NOT NULL COMMENT '使用者識別欄位',
  `RoleId` int NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`UserId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int unsigned NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'agent',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint NOT NULL DEFAULT '0' COMMENT '1: 帳號禁用',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_source` tinyint DEFAULT '0' COMMENT '1:Fugo,2:MI',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auth` int NOT NULL DEFAULT '0' COMMENT 'msa沒用(勿用),舊版登入有用到而已',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_profile_id_index` (`profile_id`),
  KEY `users_account_index` (`account`),
  CONSTRAINT `users_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_chatrooms_current`
--

DROP TABLE IF EXISTS `v_chatrooms_current`;
/*!50001 DROP VIEW IF EXISTS `v_chatrooms_current`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_chatrooms_current` AS SELECT 
 1 AS `chatroom_id`,
 1 AS `client_id`,
 1 AS `user_id`,
 1 AS `profile_id_user`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_client_tags_crurrent`
--

DROP TABLE IF EXISTS `v_client_tags_crurrent`;
/*!50001 DROP VIEW IF EXISTS `v_client_tags_crurrent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_client_tags_crurrent` AS SELECT 
 1 AS `id`,
 1 AS `client_id`,
 1 AS `customer_id`,
 1 AS `client_id_current`,
 1 AS `line_user_id_current`,
 1 AS `chatroom_id_current`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_client_tags_crurrent_for_clientid`
--

DROP TABLE IF EXISTS `v_client_tags_crurrent_for_clientid`;
/*!50001 DROP VIEW IF EXISTS `v_client_tags_crurrent_for_clientid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_client_tags_crurrent_for_clientid` AS SELECT 
 1 AS `id`,
 1 AS `client_id`,
 1 AS `customer_id`,
 1 AS `client_id_current`,
 1 AS `line_user_id_current`,
 1 AS `chatroom_id_current`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_clients_profiles`
--

DROP TABLE IF EXISTS `v_clients_profiles`;
/*!50001 DROP VIEW IF EXISTS `v_clients_profiles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_clients_profiles` AS SELECT 
 1 AS `client_id`,
 1 AS `customer_id`,
 1 AS `profile_id`,
 1 AS `nickname`,
 1 AS `disabled`,
 1 AS `line_user_id`,
 1 AS `picture_url`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_imagemaps`
--

DROP TABLE IF EXISTS `v_imagemaps`;
/*!50001 DROP VIEW IF EXISTS `v_imagemaps`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_imagemaps` AS SELECT 
 1 AS `imagemap_id`,
 1 AS `task_id`,
 1 AS `template_message_id`,
 1 AS `type`,
 1 AS `base_size_width`,
 1 AS `base_size_height`,
 1 AS `movie_id`,
 1 AS `original_content_url`,
 1 AS `preview_image_url`,
 1 AS `link_uri`,
 1 AS `label`,
 1 AS `x`,
 1 AS `y`,
 1 AS `width`,
 1 AS `height`,
 1 AS `pic_url`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_template_message_actions_columns`
--

DROP TABLE IF EXISTS `v_template_message_actions_columns`;
/*!50001 DROP VIEW IF EXISTS `v_template_message_actions_columns`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_template_message_actions_columns` AS SELECT 
 1 AS `template_message_actions_id`,
 1 AS `template_message_column_id`,
 1 AS `template_message_id`,
 1 AS `action_type`,
 1 AS `label`,
 1 AS `data`,
 1 AS `uri`,
 1 AS `text`,
 1 AS `response`,
 1 AS `tag`,
 1 AS `column_thumbnailImageUrl`,
 1 AS `column_imageUrl`,
 1 AS `column_title`,
 1 AS `column_text`,
 1 AS `column_option_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_test_only`
--

DROP TABLE IF EXISTS `v_test_only`;
/*!50001 DROP VIEW IF EXISTS `v_test_only`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_test_only` AS SELECT 
 1 AS `chatroom_id`,
 1 AS `profile_id`,
 1 AS `test`,
 1 AS `987654321`,
 1 AS `Name_exp_5`,
 1 AS `1`,
 1 AS `Y`,
 1 AS `NOW()`,
 1 AS `My_exp_NOW()`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT '富購客代',
  `client_id` int unsigned DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_no` int unsigned DEFAULT NULL,
  `option_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `option_type` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '選項類型(1:單選,2:複選)',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wayne_test`
--

DROP TABLE IF EXISTS `wayne_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wayne_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=477459 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wayne_test2`
--

DROP TABLE IF EXISTS `wayne_test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wayne_test2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=795160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webapi_event`
--

DROP TABLE IF EXISTS `webapi_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapi_event` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '活動 Id',
  `event_type` tinyint DEFAULT NULL COMMENT '對應活動的類型',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '活動名稱',
  `keyword` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '提供觸發的關鍵字',
  `status` tinyint DEFAULT NULL COMMENT '狀態 0=刪除, 1=停用(準備中), 2=啟用(發布)',
  `event_start` datetime DEFAULT NULL COMMENT '活動開始時間',
  `event_end` datetime DEFAULT NULL COMMENT '活動結束時間',
  `created_by` int DEFAULT NULL COMMENT '建立者',
  `created_at` datetime DEFAULT NULL COMMENT '建立時間',
  `updated_by` int DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='同框照活動';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webapi_event_types`
--

DROP TABLE IF EXISTS `webapi_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapi_event_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `trigger_action_type` tinyint DEFAULT NULL COMMENT '1=Message , 2=Postback',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='webapi 活動類型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webapi_merge_image`
--

DROP TABLE IF EXISTS `webapi_merge_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webapi_merge_image` (
  `uuid` varchar(50) NOT NULL,
  `event_id` int DEFAULT NULL COMMENT '同框照活動的Id',
  `path` varchar(100) DEFAULT NULL COMMENT '同框照圖片路徑',
  `x` int DEFAULT NULL COMMENT '提供合併的 X 定位點',
  `y` int DEFAULT NULL COMMENT '提供合併的 Y 定位點',
  `merge_width` int DEFAULT NULL COMMENT '提供合併的寬度',
  `merge_height` int DEFAULT NULL COMMENT '提供合併的高度',
  `created_by` int DEFAULT NULL COMMENT '創建者',
  `created_at` datetime DEFAULT NULL COMMENT '創建時間',
  PRIMARY KEY (`uuid`),
  KEY `IDX_webapi_merge_image_event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同框照圖片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webhook_event`
--

DROP TABLE IF EXISTS `webhook_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook_event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_redelivery` bit(1) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `supplementary_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_webhook_event_id` (`webhook_event_id`),
  KEY `idx_timestamp` (`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1364 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `working_day`
--

DROP TABLE IF EXISTS `working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_day` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `IsHoliday` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2698 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'superline'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` FUNCTION `SPLIT_STR`(x VARCHAR(255) CHARACTER SET utf8mb4, delim VARCHAR(12), pos INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos), CHAR_LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1), delim, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_agents_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_agents_add`(OUT id int, IN ehsUserId int, IN account nvarchar(255), IN agentName nvarchar(255), IN agentId varchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/11
    -- Description : 新增使用者
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

    INSERT INTO agents (ehs_user_id, email, agent_name, agent_id)
    VALUES (ehsUserId, account, agentName, agentId);

    SET id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_agents_get_agent_by_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_agents_get_agent_by_account`(IN account nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/11
  -- Description : 依據 account 取得 agent
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    ehs_user_id,
    email,
    agent_name,
    agent_id,
    created_at,
    updated_at
  FROM agents
  WHERE email = account;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_agents_get_by_ehsUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_agents_get_by_ehsUserId`(IN ehsUserId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/30
  -- Description : 依據 ehsUserId 取得 agent
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    ehs_user_id,
    email,
    agent_name,
    agent_id,
    created_at,
    updated_at
  FROM agents
  WHERE ehs_user_id = ehsUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_agents_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_agents_update`(IN id int, IN Account nvarchar(255), IN AgentName nvarchar(255), IN AgentId varchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : Ben
    -- Create date : 2023/09/05
    -- Description : 更新專員資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

UPDATE agents set agents.email = Account, agents.agent_name = AgentName, agents.agent_id = AgentId
WHERE agents.id = Id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_add`(IN `@audienceGroupId` BIGINT, IN `@descriptionName` NVARCHAR(120), IN `@audienceCount` INT, IN `@expireAt` DATETIME, IN `@createdAt` DATETIME, IN `@createdBy` INT)
BEGIN
    INSERT INTO audience (audience_groupId,description, audience_count, expire_at, created_at, created_by)
VALUES (`@audienceGroupId`,`@descriptionName`,`@audienceCount`,`@expireAt`,`@createdAt`,`@createdBy`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_clients_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_clients_add`(IN txKey VARCHAR(50), IN audienceGroupId BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/10/18
  -- Description : 依 audience_temp 中客戶, 篩選有效名單, 並新增到 audience_client 表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --              
  -- ==========================================================================================

  INSERT IGNORE INTO audience_clients (audience_groupId, customer_id)
  SELECT audienceGroupId,c.customer_id
  FROM clients AS c
  INNER JOIN audience_temp AS a ON c.customer_id = a.customer_id
  INNER JOIN profiles AS p ON c.profile_id = p.id
  WHERE a.tx_key = txKey;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_delete_by_audienceGroupId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_delete_by_audienceGroupId`(IN audienceGroupId INT)
BEGIN
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_get`(IN offset int, IN pagesize int, OUT Total int)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2023/10/16
  -- Description : 取出受眾資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               [2023/10/18] - yisu       - 增加篩選 status = 1(啟用)
  -- ==========================================================================================
  SET Total := (SELECT COUNT(*) FROM audience WHERE audience.status = 1);

  SELECT audience.audience_groupId,
  audience.description,
  audience.audience_count,
  audience.expire_at,
  audience.created_at,
  audience.created_by,
  createdUser.name AS createdUserName
  FROM audience
  LEFT JOIN users AS createdUser ON audience.created_by = createdUser.id
  WHERE audience.status = 1
  ORDER BY audience.created_at DESC
  LIMIT pagesize
  OFFSET offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_get_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_get_v2`(IN audienceCollection VARCHAR(600))
    COMMENT '依傳入的 audienceId 集合撈選受眾'
BEGIN
SELECT audience.audience_groupId,
  audience.description,
  audience.audience_count,
  audience.expire_at,
  audience.created_at,
  audience.created_by,
  createdUser.name AS createdUserName
  FROM audience
  LEFT JOIN users AS createdUser ON audience.created_by = createdUser.id
  WHERE FIND_IN_SET(audience_groupId,audienceCollection);

 -- ==========================================================================================
    -- example:
    -- audienceCollection = '4694116573239,1170740576425,8013004202913,8101599282116,5954899830058'
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_temp_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_temp_delete`(IN `@guid` text)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2023/10/11
  -- Description : 清空暫存表單
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
    DELETE FROM audience_temp  WHERE tx_key=`@guid`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_temp_getLineUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_temp_getLineUserId`(IN `@guid` text)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2023/10/12
  -- Description : 取得 user_line_id
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               [2023/10/17] - [YISU]     - [增加撈選 CustomerId]
  -- ==========================================================================================
SELECT c.profile_id ,p.line_user_id,c.customer_id as customerId
FROM clients AS c
INNER JOIN audience_temp AS a ON c.customer_id = a.customer_id
INNER JOIN profiles AS p ON c.profile_id = p.id
WHERE a.tx_key=`@guid`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_audience_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_audience_update`(IN audienceGroupId BIGINT, IN newDescription NVARCHAR(120), IN addCount INT, IN newStatus TINYINT, IN updatedBy INT, IN updatedAt TIMESTAMP)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/10/17
  -- Description : 更新受眾資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               [2023/10/18] - [YISU]     - 增加 status , update_at, update_by
  -- ==========================================================================================
  UPDATE audience
  SET 
    description = IF(newDescription IS NOT NULL AND newDescription != '' , newDescription , audience.description),
    audience_count = IF(addCount IS NOT NULL AND addCount != 0 , audience.audience_count + addCount , audience.audience_count),
    status = IF(newStatus IS NOT NULL AND newStatus != 0 , newStatus , audience.status),
    updated_by = updatedBy,
    updated_at = updatedAt
  WHERE audience_groupId = audienceGroupId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_channels_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_channels_get`(IN channelId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 取得 channel 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    name,
    slug,
    token,
    secret,
    created_at,
    updated_at
  FROM channels
  WHERE id = channelId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_add`(OUT id int, IN clientId int, IN userId int, IN channelId int, IN uid varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 新增聊天室
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  INSERT INTO chatrooms (channel_id, user_id, client_id, uuid)
    VALUES (channelId, userId, clientId, uid);

  SET id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_assign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_assign`(IN UserId int, IN ClientId int, IN UpdateDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/28
  -- Description : 重新指派使用者
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE chatrooms
  SET chatrooms.user_id = UserId,
      chatrooms.updated_at = UpdateDate
  WHERE chatrooms.client_id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_clear_unread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_clear_unread`(IN UUID nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/17
  -- Description : 清除聊天室已讀數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE chatrooms
  SET chatrooms.unread = 0
  WHERE chatrooms.uuid = UUID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_get_by_clientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_get_by_clientId`(IN clientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依據 clientId 取得聊天室
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    channel_id,
    user_id,
    client_id,
    unread,
    uuid,
    created_at,
    updated_at
  FROM chatrooms
  WHERE client_id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_update`(IN chatroomId int, IN userId int, IN channelId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 更新聊天室
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE chatrooms
  SET user_id = userId,
      channel_id = channelId
  WHERE id = chatroomId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_update_unread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_update_unread`(IN UUID nvarchar(255), IN Count int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/17
  -- Description : 更新聊天室已讀數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE chatrooms
  SET chatrooms.unread = chatrooms.unread + Count
  WHERE chatrooms.uuid = UUID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_chatrooms_update_updated_at` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_chatrooms_update_updated_at`(IN ChatroomId int, IN UpdateDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/09
  -- Description : 更新聊天室最後交談時間
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE chatrooms
  SET chatrooms.updated_at = UpdateDate
  WHERE chatrooms.id = ChatroomId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_add`(OUT Id int, IN ProfileId int, IN Nick text CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben
  -- Create date : 2023/05/25
  -- Description : create clients (commandtext => stored procedure)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO clients (profile_id, nickname)
    VALUES (ProfileId, Nick);

  SET Id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_add_v2`(OUT Id int,IN CustomerId int, IN ProfileId int, IN Nick text CHARACTER SET utf8mb4)
BEGIN
	INSERT INTO clients (customer_id,profile_id, nickname)
    VALUES (CustomerId,ProfileId, Nick);

	SET Id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_count_by_customerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_count_by_customerId`(IN customerId int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/03/30
    -- Description : 取得相同客代的用戶數量
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT
        COUNT(id) AS count
    FROM clients
    WHERE customer_id = customerId and disabled = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_count_by_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_count_by_phone`(IN phoneNumber varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/30
  -- Description : 取得相同電話的用戶數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    COUNT(id) AS count
  FROM clients
  WHERE phone = phoneNumber;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_binding_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_binding_count`(IN bindingDate DATE)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/12
    -- Description : 取得client綁定人數 by 起訖
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COUNT(*) AS 'count'
    FROM clients
    WHERE DATE(binding_at) = bindingDate;
    -- ==========================================================================================
    -- example:
    -- CALL usp_clients_get_binding_count('2023-04-28');
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_binding_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_binding_report`(IN startDate date, IN endDate date)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/24
    -- Description : 依據指定時間範圍，取得該時間範圍內綁定的客戶
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-11-27 : art refs #40489 依照綁定日期排序、日期顯示到秒
    -- ==========================================================================================
    SELECT c.binding_at as `Date`,
           p.line_user_id as LineUserId,
           c.customer_id as CustomerId
    FROM clients c
             inner join profiles p on c.profile_id = p.id
    WHERE c.binding_at IS NOT NULL
      AND c.customer_id IS NOT NULL
      AND DATE(c.binding_at) BETWEEN startDate AND endDate
    ORDER BY c.binding_at;
    -- ==========================================================================================
    -- example:
    -- CALL usp_clients_get_binding_report('2023-10-17', '2023-10-19');
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_bind_total_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_bind_total_count`(IN queryDate varchar(10))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/16
    -- Description : 取得截至某日期之前，綁定好友總數 
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COALESCE(
                   SUM(CASE WHEN c.customer_id > 0 THEN 1 ELSE 0 END), 0
               ) AS 'BindClientsTotal'
    FROM clients c
    WHERE DATE(c.binding_at) <= queryDate;
    -- ==========================================================================================
    -- exmaple: 
    -- call usp_clients_get_bind_total_count('2023-10-15')
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_blocked_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_blocked_count`(IN queryDate varchar(10))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/16
    -- Description : 取得截至某日期之前，封鎖好友數，已綁定封鎖好友數 
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COALESCE(
                   SUM(CASE WHEN (c.disabled = true OR u.role = 'ob.block') AND (c.customer_id > 0) THEN 1 ELSE 0 END),
                   0
               ) AS 'bindClientsBlocked',
           COALESCE(
                   SUM(CASE WHEN c.disabled = true OR u.role = 'ob.block' THEN 1 ELSE 0 END), 0
               ) AS 'clientsBlocked'
    FROM clients c
             LEFT JOIN client_user cu ON cu.client_id = c.id
             LEFT JOIN users u ON cu.user_id = u.id
    WHERE DATE(c.updated_at) <= queryDate;
    -- ==========================================================================================
    -- exmaple: 
    -- call usp_clients_get_blocked_count('2023-10-15')
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_binding_at` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_binding_at`(IN startDate datetime, IN endDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/10
  -- Description : 取得綁定客戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-07-14 [art] : 取得 line_user_id
  -- 2023-10-31 [art] : 新增 hash_phone, mask_phone
  -- 2024-02-02 [art] : remove phone
  -- ==========================================================================================
  SELECT
    c.id,
    c.customer_id,
    c.profile_id,
    p.line_user_id,
    c.nickname,
    c.remark,
    c.hash_phone,
    c.mask_phone,
    c.summarized_info,
    c.verify,
    c.disabled,
    c.created_at,
    c.updated_at,
    c.binding_at
  FROM clients c
  inner join profiles p on c.profile_id = p.id
  WHERE (c.created_at < endDate
  AND startDate <= c.created_at)
  AND c.customer_id IS NOT NULL
  AND c.binding_at IS NOT NULL;
-- ==========================================================================================
-- example:
-- call usp_clients_get_by_binding_at('2023-04-18 11:00:00','2023-04-18 12:00:00');
-- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_condition_customerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_condition_customerId`(OUT recordCount int, IN rowNumber int, IN pageSize int, IN keyword int, IN account varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art.huang
  -- Create date : 2023/06/14
  -- Description : search clients by condition for customerId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31 [art] 新增 hash_phone, mask_phone
  -- 2023/12/12 Ben select add c.disabled
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================
  SET @cnt := (SELECT
      COUNT(*)
    FROM clients AS c
      INNER JOIN client_user cu
        ON c.id = cu.client_id
      INNER JOIN users u
        ON cu.user_id = u.id
    WHERE (account = ''
    OR u.account = account)
    AND (keyword = ''
    OR c.customer_id = keyword));

  SET recordCount = @cnt;

  SELECT
    c.id,
    c.nickname,
    c.hash_phone,
    c.mask_phone,
    c.customer_id,
    c.created_at,
    c.disabled,
    u.account AS user_account,
    u.phone AS user_ext
  FROM clients AS c
    INNER JOIN client_user cu
      ON c.id = cu.client_id
    INNER JOIN users u
      ON cu.user_id = u.id
  WHERE (account = ''
  OR u.account = account)
  AND (keyword = ''
  OR c.customer_id = keyword)
  ORDER BY c.created_at DESC, c.id DESC
  LIMIT pageSize OFFSET rowNumber;

# ===============================================================
#  example:
#     call usp_clients_get_by_condition_customerId(@count, 0,10,'28011230',''); SELECT @count;
# ===============================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_condition_nickname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_condition_nickname`(OUT recordCount int, IN rowNumber int, IN pageSize int, IN keyword nvarchar(255), IN account varchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : art.huang
    -- Create date : 2023/06/15
    -- Description : search clients by condition for nickname
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-06-15 [art] 改用 LIMIT , OFFSET ，移除 rownumber 迴圈計算, 新增第二排序 clients.id desc
    -- 2023-10-31 [art] 新增 hash_phone, mask_phone
    -- 2023/12/12 Ben select add clients.disabled
    -- 2024-02-02 [art] remove phone
    -- ==========================================================================================
    SET @cnt := (SELECT
                     COUNT(*)
                 FROM clients
                          INNER JOIN client_user
                                     ON clients.id = client_user.client_id
                          INNER JOIN users
                                     ON client_user.user_id = users.id
                 WHERE (account = ''
                     OR users.account = account)
                   AND (keyword = ''
                     OR clients.nickname LIKE CONCAT('%', keyword, '%')));


    SELECT
        clients.id,
        clients.nickname,
        clients.hash_phone,
        clients.mask_phone,
        clients.customer_id,
        clients.created_at,
        clients.disabled,
        users.account AS user_account,
        users.phone AS user_ext
    FROM clients
             INNER JOIN client_user
                        ON clients.id = client_user.client_id
             INNER JOIN users
                        ON client_user.user_id = users.id
    WHERE (account = ''
        OR users.account = account)
      AND (keyword = ''
        OR clients.nickname LIKE CONCAT('%', keyword, '%'))
    ORDER BY clients.created_at DESC, clients.id DESC
    LIMIT pageSize OFFSET rowNumber;

    SET recordCount = @cnt;

    # ===============================================================
#  example:
#    call usp_clients_get_by_condition_nickname(@count,,0,10,'name',''); SELECT @count;
#    call usp_clients_get_by_condition_nickname(@count,600,10,'name',''); SELECT @count;
#    call usp_clients_get_by_condition_nickname(@count,0,10,'name','molly.lin'); SELECT @count;
#    call usp_clients_get_by_condition_nickname(@count,50,10,'name','molly.lin'); SELECT @count;
# CALL usp_clients_get_by_condition_nickname(@count, 600,10,'name','');  SELECT @count;
# ===============================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_condition_phone_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_condition_phone_v2`(OUT recordCount int, IN rowNumber int, IN pageSize int, IN keyword varchar(255), IN account varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art.huang
  -- Create date : 2023/06/14
  -- Description : search clients by condition for phone
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31 [art] 新增 hash_phone, mask_phone
  -- 2023-11-01 [wayne] change search hash phone
  -- 2023/12/12 Ben select add c.disabled
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================
  SET @cnt := (SELECT
      COUNT(*)
    FROM clients AS c
      INNER JOIN client_user cu
        ON c.id = cu.client_id
      INNER JOIN users u
        ON cu.user_id = u.id
    WHERE (account = ''
    OR u.account = account)
    AND (keyword = ''
    OR c.hash_phone = keyword));
  SET recordCount = @cnt;

  SELECT
    c.id,
    c.nickname,
    c.hash_phone,
    c.mask_phone,
    c.customer_id,
    c.created_at,
    c.disabled,
    u.account AS user_account,
    u.phone AS user_ext
  FROM clients AS c
    INNER JOIN client_user cu
      ON c.id = cu.client_id
    INNER JOIN users u
      ON cu.user_id = u.id
  WHERE (account = ''
  OR u.account = account)
  AND (keyword = ''
  OR c.hash_phone = keyword)
  ORDER BY c.created_at DESC, c.id DESC
  LIMIT pageSize OFFSET rowNumber;

# ===============================================================
#  example:
#     call usp_clients_get_by_condition_phone_v2(@count, 0,10,'','molly.lin'); SELECT @count;
#     call usp_clients_get_by_condition_phone_v2(@count, 0,10,'0979575134','molly.lin'); SELECT @count;
#     call usp_clients_get_by_condition_phone_v2(@count, 100,10,'',''); SELECT @count;
#     call usp_clients_get_by_condition_phone_v2(@count, 0,10,'0953548521',''); SELECT @count;
# ===============================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_customerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_customerId`(IN customerId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/11
  -- Description : 取得 clients 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31 : [art] 新增 hash_phone , mask_phone
  -- 2024-02-02 : [art] remove phone
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    profile_id,
    nickname,
    remark,
    mask_phone,
    hash_phone,
    summarized_info,
    verify,
    disabled,
    created_at,
    updated_at,
    binding_at
  FROM clients
  WHERE customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_customerId_hash_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_customerId_hash_phone`(IN customerId int, IN hashPhone varchar(255))
BEGIN

    -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/12/08
  -- Description : 取得 clients 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    profile_id,
    nickname,
    remark,
    mask_phone,
    hash_phone,
    summarized_info,
    verify,
    disabled,
    created_at,
    updated_at,
    binding_at
  FROM clients
  WHERE clients.customer_id = customerId OR (hashPhone<>'' AND clients.hash_phone = hashPhone);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_hash_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_hash_phone`(IN hashPhone varchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/11/01
    -- Description : 取得 clients 資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2024-02-02 [art] remove phone
    -- ==========================================================================================
    SELECT
        id,
        customer_id,
        profile_id,
        nickname,
        remark,
        mask_phone,
        hash_phone,
        summarized_info,
        verify,
        disabled,
        created_at,
        updated_at,
        binding_at
    FROM clients
    WHERE hash_phone = hashPhone;
    -- ==========================================================================================
-- example:
-- call usp_clients_get_by_hash_phone('cc74eebf625a7de0da56ad8ed846b211dbf8b44c745c03a8aa538b8209bcf2bb');
-- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_id`(IN clientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 取得 client
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31 [art] 新增 hash_phone, mask_phone
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    profile_id,
    nickname,
    remark,
    hash_phone,
    mask_phone,
    summarized_info,
    verify,
    disabled,
    created_at,
    updated_at
  FROM clients
  WHERE id = clientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_mobile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_mobile`(IN mobile varchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/09/01
    -- Description : 取得 clients 資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-10-31 : [art] 新增 hash_phone , mask_phone
    -- 2024-02-02 : [art] remove phone
    -- ==========================================================================================
    SELECT
        id,
        customer_id,
        profile_id,
        nickname,
        remark,
        mask_phone,
        hash_phone,
        summarized_info,
        verify,
        disabled,
        created_at,
        updated_at,
        binding_at
    FROM clients
    WHERE phone = mobile;
-- ==========================================================================================
-- example:
-- call usp_clients_get_by_mobile('0912345678');
-- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_nickName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_nickName`(IN Keyword NVARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/08/31
  -- Description : 取得使用者的客戶資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31: art 增加 hash_phone, mask_phone
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================

  SELECT
    clients.id,
    clients.customer_id,
    clients.profile_id,
    clients.nickname,
    clients.remark,
    clients.mask_phone,
    clients.hash_phone,
    clients.summarized_info,
    clients.verify,
    clients.disabled,
    clients.created_at,
    clients.updated_at
FROM client_user
INNER JOIN clients ON clients.id = client_user.client_id
WHERE clients.nickname LIKE CONCAT('%', Keyword, '%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_by_profileId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_by_profileId`(IN profileId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依據 profile id 取得用戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-26 [art] 增加 binding_at
  -- 2023-10-31 [art] 增加 hash_phone, mask_phone
  -- 2024-02-22 [art] remove phone
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    profile_id,
    nickname,
    remark,
    hash_phone,
    mask_phone,
    summarized_info,
    verify,
    disabled,
    created_at,
    updated_at,
    binding_at
  FROM clients
  WHERE profile_id = profileId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_chat_periods` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_chat_periods`(IN startDate datetime, IN endDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/06/05
  -- Description : 取得客戶聊天起訖時間
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    clients.customer_id,
    clients.profile_id,
    ids.min,
    ids.max
  FROM clients
    JOIN (SELECT
        profile_id,
        MIN(created_at) AS min,
        MAX(created_at) AS max
      FROM messages
      WHERE messages.created_at BETWEEN startDate AND endDate
      GROUP BY profile_id) AS ids
      ON ids.profile_id = clients.profile_id
  WHERE clients.customer_id > 0;
-- ==========================================================================================
-- example:
-- call usp_clients_get_chat_periods('2023-04-18 00:00:00','2023-04-19 00:00:00');
-- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_multicast_lineUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_multicast_lineUserId`(IN userId INT, IN clientIdList TEXT, IN multiAll BIT)
BEGIN
-- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/16
  -- Description : multiAll = true  => 依 userId 取得此 user 底下所有 client 的 LineUserId
  --               multiAll = false => 依 userId 並篩選傳入的 clientIdList 的 LineUserId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT profiles.line_user_id as lineUserId 
  FROM (
    SELECT * FROM client_user
    WHERE 
      (multiAll = TRUE AND user_id = userId)
      OR
      (multiAll = FALSE AND user_id = userId AND FIND_IN_SET(client_id,clientIdList))
  ) temp
  LEFT JOIN clients ON temp.client_id = clients.id
  LEFT JOIN profiles ON clients.profile_id = profiles.id
  WHERE clients.disabled = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_get_total_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_get_total_count`(IN queryDate varchar(10))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/16
    -- Description : 取得截至某日期之前，好友總數
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COALESCE(COUNT(c.id),0) AS 'ClientsTotal'
    FROM clients c
    WHERE DATE(c.created_at) <= queryDate;
    -- ==========================================================================================
    -- exmaple: 
    -- call usp_clients_get_total_count('2023-10-15')
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_has_binding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_has_binding`(IN customerId INT, IN notClientId INT)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/12
    -- Description : 判斷客代是否已經有綁定給clients
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT IF(
               EXISTS (SELECT 1
                       FROM clients
                       WHERE customer_id = customerId
                         AND id <> notClientId
                         AND disabled = 0),
               1,
               0
           ) AS result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_has_binding_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_has_binding_phone`(IN hashPhone varchar(255), IN notClientId int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/25
    -- Description : 判斷手機是否已經有綁定給clients
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-11-01 art  移除 hashPhone <> '' 的篩選條件
    -- ==========================================================================================
    SELECT IF(
                   EXISTS (SELECT 1
                           FROM clients
                           WHERE hash_phone = hashPhone
                             AND id <> notClientId
                             AND disabled = 0),
                   1,
                   0
               ) AS result;
    -- ==========================================================================================
    -- example:
    -- call usp_clients_has_binding_phone('8fa4e868489b423c92e0bfc4a469b51d98d32ea3edef6bb283795023a5425ac3', 63);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_search`(IN rowNumber int, IN pageSize int, IN keyword nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : ben.wu
  -- Create date : 2023/06/01
  -- Description : 客戶管理查詢
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SET @cnt := (SELECT
      COUNT(*)
    FROM clients AS c
      INNER JOIN client_user cu
        ON c.id = cu.client_id
      INNER JOIN users u
        ON cu.user_id = u.id
    WHERE (keyword = ''
    OR CASE WHEN LENGTH(keyword) >= 9 THEN c.phone = keyword WHEN LENGTH(keyword) = 8 THEN c.customer_id = keyword ELSE c.nickname LIKE CONCAT('%', keyword, '%') END));


  SELECT
    *
  FROM (SELECT
      @cnt AS count,
      @rownum := @rownum + 1 AS rownum,
      c.id,
      c.nickname,
      c.phone,
      c.customer_id,
      u.account AS user_account,
      u.phone AS user_ext
    FROM clients AS c
           INNER JOIN client_user cu
             ON c.id = cu.client_id
           INNER JOIN users u
             ON cu.user_id = u.id,
         (SELECT
             @rownum := 0) r
    WHERE (keyword = ''
    OR CASE WHEN LENGTH(keyword) >= 9 THEN c.phone = keyword WHEN LENGTH(keyword) = 8 THEN c.customer_id = keyword ELSE c.nickname LIKE CONCAT('%', keyword, '%') END)
    ORDER BY c.created_at DESC) result
  WHERE result.rownum > rowNumber
  LIMIT pageSize;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_search_by_userId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_search_by_userId`(IN UserId INT, IN Keyword NVARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/07/21
  -- Description : 取得使用者的客戶資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-31: art 增加 hash_phone, mask_phone
  -- 2024-02-02 [art] remove phone
  -- ==========================================================================================

  SELECT
    clients.id,
    clients.customer_id,
    clients.profile_id,
    clients.nickname,
    clients.remark,
    clients.hash_phone,
    clients.mask_phone,
    clients.summarized_info,
    clients.verify,
    clients.disabled,
    clients.created_at,
    clients.updated_at
FROM client_user
INNER JOIN clients ON clients.id = client_user.client_id
WHERE client_user.user_id = UserId AND clients.nickname LIKE CONCAT('%', Keyword, '%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update`(IN clientId int, IN phoneNumber varchar(255), IN customerId int,
                                    IN phoneBindingAt datetime, IN disable bit)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 更新 client
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-16: art: 增加 update_at 更新時間
  -- ==========================================================================================
  UPDATE clients
  SET phone = phoneNumber,
      customer_id = customerId,
      binding_at = phoneBindingAt,
      disabled = Disable,
      updated_at = NOW()
  WHERE id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_by_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_by_edit`(IN ClientId int, IN CustomerId int, IN NickName text CHARACTER SET utf8mb4, IN Phone text CHARACTER SET utf8mb4, IN Remark text CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/05/08
  -- Description : 更新客戶資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/06/19        Ben       調整參數不是null的話才要更新該欄位
  -- ==========================================================================================

  UPDATE clients
  SET clients.customer_id = IF(CustomerId IS NOT NULL, CustomerId, clients.customer_id),
      clients.nickname = IF(NickName IS NOT NULL, NickName, clients.nickname),
      clients.remark = IF(Remark IS NOT NULL, Remark, clients.remark),
      clients.phone = IF(Phone IS NOT NULL, IF(Phone LIKE '%*%', clients.phone, Phone), clients.phone),
      clients.updated_at = NOW()
  WHERE clients.id = ClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_by_edit_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_by_edit_v2`(IN ClientId int, IN CustomerId int,
                                                                    IN NickName text CHARACTER SET utf8mb4, IN Phone text CHARACTER SET utf8mb4, IN maskPhone text CHARACTER SET utf8mb4,
                                                                    IN hashPhone text CHARACTER SET utf8mb4, IN Remark text CHARACTER SET utf8mb4)
BEGIN
    -- ==========================================================================================
    -- Author      : Ben Wu
    -- Create date : 2023/05/08
    -- Description : 更新客戶資訊
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    --                2023/06/19        Ben       調整參數不是null的話才要更新該欄位
    -- 2023-10-25 : [art] : refs #39965 新增 maskPhone, hashPhone 欄位
    -- ==========================================================================================

    UPDATE clients
    SET clients.customer_id = IF(CustomerId IS NOT NULL, CustomerId, clients.customer_id),
        clients.nickname    = IF(NickName IS NOT NULL, NickName, clients.nickname),
        clients.remark      = IF(Remark IS NOT NULL, Remark, clients.remark),
        clients.phone       = IF(Phone IS NOT NULL, IF(Phone LIKE '%*%', clients.phone, Phone), clients.phone),
        clients.mask_phone  = IF(maskPhone IS NOT NULL, maskPhone, clients.mask_phone),
        clients.hash_phone  = IF(hashPhone IS NOT NULL, hashPhone, clients.hash_phone),
        clients.updated_at  = NOW()
    WHERE clients.id = ClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_by_edit_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_by_edit_v3`(IN ClientId int, IN CustomerId int,
                                                                    IN NickName text CHARACTER SET utf8mb4,  IN maskPhone text CHARACTER SET utf8mb4,
                                                                    IN hashPhone text CHARACTER SET utf8mb4, IN Remark text CHARACTER SET utf8mb4)
BEGIN
    -- ==========================================================================================
    -- Author      : Ben Wu
    -- Create date : 2023/05/08
    -- Description : 更新客戶資訊
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023/06/19 Ben 調整參數不是null的話才要更新該欄位
    -- 2023-10-25 [art] refs #39965 新增 maskPhone, hashPhone 欄位
    -- 2024-02-02 [art] remove phone
    -- ==========================================================================================

    UPDATE clients
    SET clients.customer_id = IF(CustomerId IS NOT NULL, CustomerId, clients.customer_id),
        clients.nickname    = IF(NickName IS NOT NULL, NickName, clients.nickname),
        clients.remark      = IF(Remark IS NOT NULL, Remark, clients.remark),
        clients.mask_phone  = IF(maskPhone IS NOT NULL, maskPhone, clients.mask_phone),
        clients.hash_phone  = IF(hashPhone IS NOT NULL, hashPhone, clients.hash_phone),
        clients.updated_at  = NOW()
    WHERE clients.id = ClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_customerid_to_zero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_customerid_to_zero`(IN CustomerId int, IN ClientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2024/01/09
  -- Description :將重複的客代設為0
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  UPDATE clients
  SET clients.customer_id = 0,
      clients.updated_at = NOW()
  WHERE clients.id <> ClientId AND clients.customer_id = CustomerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_disabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_disabled`(IN ClientId int, IN Disabled tinyint)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/16
  -- Description : 更新客戶啟用禁用
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE clients
  SET clients.disabled = Disabled,
      clients.updated_at = NOW()
  WHERE clients.id = ClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_remark` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_remark`(IN ClientId int, IN Remark text CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/05/24
  -- Description : 更新客戶備註
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE clients
  SET clients.remark = Remark,
      clients.updated_at = NOW()
  WHERE clients.id = ClientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_v2`(IN clientId int, IN phoneNumber varchar(255),
IN hashPhone varchar(255), IN maskPhone varchar(255),
IN customerId int, IN phoneBindingAt datetime,
IN disable bit)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 更新 client
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-10-16: art 增加 update_at 更新時間
  -- 2023-10-26: art 增加 hash_phone, mask_phone
  -- ==========================================================================================
  UPDATE clients
  SET phone = phoneNumber,
      hash_phone = hashPhone,
      mask_phone = maskPhone,
      customer_id = customerId,
      binding_at = phoneBindingAt,
      disabled = disable,
      updated_at = NOW()
  WHERE id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_clients_update_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_clients_update_v3`(IN clientId int, IN hashPhone varchar(255), IN maskPhone varchar(255),
                                                            IN customerId int, IN phoneBindingAt datetime,
                                                            IN disable bit)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/03/29
    -- Description : 更新 client
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-10-16: art 增加 update_at 更新時間
    -- 2023-10-26: art 增加 hash_phone, mask_phone
    -- 2024-02-22: art remove phone
    -- ==========================================================================================
    UPDATE clients
    SET hash_phone  = hashPhone,
        mask_phone  = maskPhone,
        customer_id = customerId,
        binding_at  = phoneBindingAt,
        disabled    = disable,
        updated_at  = NOW()
    WHERE id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_customerid_log_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_customerid_log_add`(IN clientId INT, IN oriCustomerId INT, IN newCustomerId INT, IN userId INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben
  -- Create date : 2023/12/27
  -- Description : 新增 client更改客代Log
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
INSERT INTO client_customerid_log (client_id, ori_customer_id, new_customer_id, created_by, created_at)
    VALUES (clientId, oriCustomerId, newCustomerId, userId, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_daily_metrics_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_daily_metrics_add`(IN queryYear int, IN queryMonth int, IN queryDay int, IN bindCount int,
                                              IN followCount int, IN unfollowCount int, IN clientTotal int,
                                              IN bindTotal int, IN clientBlockTotal int, IN bindBlockTotal int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/16
    -- Description : 新增每日好友統計資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    insert into client_daily_metrics (year, month, day, bind_count, follow_count, unfollow_count, client_total,
                                      bind_total, client_block_total, bind_block_total)
        value (queryYear, queryMonth, queryDay, bindCount, followCount, unfollowCount, clientTotal, bindTotal,
               clientBlockTotal,
               bindBlockTotal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_daily_metrics_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_daily_metrics_add_v2`(IN queryYear int, IN queryMonth int, IN queryDay int,
IN bindCount int, IN followCount int,
IN unfollowCount int, IN clientTotal int,
IN bindTotal int, IN clientBlockTotal int,
IN bindBlockTotal int, IN clientValidTotal int,
IN bindValidTotal int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/10/16
  -- Description : 新增每日好友統計資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-11-14 : art refs #40489 新增 client_valid_total, bind_valid_total
  -- ==========================================================================================
  INSERT INTO client_daily_metrics (year, month, day, bind_count, follow_count, unfollow_count, client_total,
  bind_total, client_block_total, bind_block_total, client_valid_total,
  bind_valid_total)
    VALUE (queryYear, queryMonth, queryDay, bindCount, followCount, unfollowCount, clientTotal, bindTotal, clientBlockTotal, bindBlockTotal, clientValidTotal, bindValidTotal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_daily_metrics_get_available_year_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_daily_metrics_get_available_year_month`()
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/20
    -- Description : 取得有效的年月
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    select distinct year, month
    from client_daily_metrics
    order by year, month;
    -- ==========================================================================================
    -- example:
    -- CALL usp_client_daily_metrics_get_available_year_month();
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_daily_metrics_get_by_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_daily_metrics_get_by_range`(IN startDate datetime, IN endDate datetime)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/16
    -- Description : 取得某段期間的好友統計數據資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    select year,
           month,
           day,
           bind_count,
           follow_count,
           unfollow_count,
           client_total,
           bind_total,
           client_block_total,
           bind_block_total
    from client_daily_metrics
    WHERE CONCAT(year, '-', LPAD(month, 2, '0'), '-', LPAD(day, 2, '0')) >= startDate
      AND CONCAT(year, '-', LPAD(month, 2, '0'), '-', LPAD(day, 2, '0')) <= endDate
    order by year, month, day;
    -- ==========================================================================================
    -- example:
    -- call usp_client_daily_metrics_get_by_range('2023-10-01', '2023-10-31');
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_add`(OUT `@id` int,
IN `@clientId` int,
IN tagName nvarchar(255),
IN `@customerId` int,
IN `@lineUserId` varchar(255),
IN memo nvarchar(255),
IN `@startedAt` datetime,
IN `@expiredAt` datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/21
  -- Description : 新增 客戶標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO client_tags (client_id, name, customer_id, line_user_id, description, started_at, expired_at)
    VALUES (`@clientId`, tagName, `@customerId`, `@lineUserId`, memo, `@startedAt`, `@expiredAt`);


  SET `@id` = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_fix` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_fix`()
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/21
  -- Description : Fix client_tags Data
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               
  -- ==========================================================================================


  UPDATE client_tags
  INNER JOIN v_client_tags_crurrent vct
    ON client_tags.id = vct.id
  SET client_tags.client_id = vct.client_id_current,
      client_tags.active_chatroom_id = vct.chatroom_id_current,
      client_tags.line_user_id = vct.line_user_id_current
  WHERE vct.client_id IS NULL
  AND (vct.client_id_current IS NOT NULL
  AND vct.chatroom_id_current IS NOT NULL);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_fix_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_fix_delete`()
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/21
  -- Description : Fix client_tags Data (移除無效client_tags id)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE client_tags
    FROM client_tags
      INNER JOIN v_client_tags_crurrent vct
        ON client_tags.id = vct.id
  WHERE vct.client_id IS NULL
    AND (vct.client_id_current IS NULL
    OR vct.chatroom_id_current IS NULL);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_getByClientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_getByClientId`(IN ClientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得客戶標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    client_tags.name
  FROM client_tags
  WHERE client_tags.client_id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_get_by_clientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_get_by_clientId`(IN clientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/21
  -- Description : 取得 客戶標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    client_id,
    customer_id,
    name,
    active_chatroom_id,
    type,
    line_user_id,
    description,
    started_at,
    expired_at,
    created_at,
    updated_at
  FROM client_tags ct
  WHERE ct.client_id = clientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tags_get_by_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tags_get_by_tag`(IN inputValue nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/23
  -- Description : 取得用戶標籤關聯
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/4/19    - Wayne Chen - 改成 join
  -- ==========================================================================================

  DROP TEMPORARY TABLE IF EXISTS `tmp_usp_client_tags_get_by_tag`;

  CREATE TEMPORARY TABLE `tmp_usp_client_tags_get_by_tag` (
    `id` int NOT NULL AUTO_INCREMENT,
    `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `parameter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
  ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

  INSERT INTO tmp_usp_client_tags_get_by_tag (`tag`, `parameter`)
    SELECT
      inputValue,
      'source';

  IF (inputValue != '') THEN
    SET @a = 0;
  simple_loop:
    LOOP
      SET @a = @a + 1;
      SET @str = SPLIT_STR(inputValue, ',', @a);
      IF @str = '' THEN
        LEAVE simple_loop;
      END IF;
      INSERT INTO tmp_usp_client_tags_get_by_tag (`tag`, `parameter`)
        SELECT
          @str,
          'tag';
    END LOOP simple_loop;
  END IF;

  SELECT
    ct.id,
    ct.client_id,
    ct.customer_id,
    ct.name,
    ct.active_chatroom_id,
    ct.type,
    ct.line_user_id,
    ct.description,
    ct.started_at,
    ct.expired_at,
    ct.created_at,
    ct.updated_at
  FROM client_tags ct
    JOIN tmp_usp_client_tags_get_by_tag tmp
      ON ct.name = tmp.tag
  WHERE tmp.parameter = 'tag';

-- ==========================================================================================
-- example:
-- call usp_client_tags_get_by_tag('wayne-test');
-- call usp_client_tags_get_by_tag('wayne-test,123');
-- call usp_client_tags_get_by_tag('0701-日出鮮蛋無人維運');
-- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tag_addbyclientid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tag_addbyclientid`(IN TagId int, IN ClientId int, IN CreatedBy int, IN StartTime datetime, IN ExpireTime datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/28
  -- Description : 新增客戶貼標
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO client_tag (tagid
  , clientid
  , created_by
  , created_at
  , started_at
  , expired_at)
    VALUES (TagId, ClientId, CreatedBy, NOW(), StartTime, ExpireTime);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tag_addbycustid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tag_addbycustid`(IN TagId int, IN CustId int, IN CreatedBy int, IN StartTime datetime, IN ExpireTime datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 新增客戶貼標
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO client_tag (tagid
  , clientid
  , created_by
  , created_at
  , started_at
  , expired_at)
    VALUES (TagId, (SELECT id FROM clients WHERE customer_id = CustId), CreatedBy, NOW(), StartTime, ExpireTime);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tag_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tag_delete`(IN ClientId int, IN TagId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/05/10
  -- Description : 刪除客戶標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM client_tag
  WHERE client_tag.tagid = TagId
    AND client_tag.clientid = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_tag_getbyclientid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_tag_getbyclientid`(IN ClientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 取得客戶標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    tags.id,
    tags.name,
    tags.type
  FROM client_tag
    INNER JOIN tags
      ON client_tag.tagid = tags.id
  WHERE NOW() BETWEEN started_at AND expired_at
  AND client_tag.clientid = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_add`(OUT id int, IN clientId int, IN userId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 新增 client user 對照檔
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  INSERT INTO client_user (client_id, user_id)
    VALUES (clientId, userId);

  SET id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_assign` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_assign`(IN UserId int, IN ClientId int, IN UpdateDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/28
  -- Description : 重新指派使用者
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE client_user
  SET client_user.user_id = UserId,
      client_user.updated_at = UpdateDate
  WHERE client_user.client_id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_delete`(IN clientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 刪除 clientUser
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  DELETE
    FROM client_user
  WHERE client_id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByClientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByClientId`(IN ClientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/18
  -- Description : 取得使用者的聊天客戶列表資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.client_id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByUserId`(IN UserId int, IN PageCount int, IN LastMessageTime datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得使用者的聊天列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByUserId_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByUserId_v2`(IN UserId int, IN PageCount int, IN LastMessageTime datetime)
BEGIN

   -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得使用者的聊天列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Wayne         調整customers select方式
  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    (select customer_name from customers where customer_id = clients.customer_id LIMIT 1) as customer_name,    
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByUserId_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByUserId_v3`(IN UserId int, IN PageCount int, IN LastMessageTime datetime, OUT RecordCount int)
BEGIN

   -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得使用者的聊天列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Wayne         調整customers select方式
  --                2023/10/25      Ben           加上總筆數
  -- ==========================================================================================

  SET @cnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId);
  SET RecordCount = @cnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    (select customer_name from customers where customer_id = clients.customer_id LIMIT 1) as customer_name,    
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByUserId_v4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByUserId_v4`(IN UserId INT, IN PageCount INT, IN LastMessageTime DATETIME, OUT ValidCount INT, OUT InvalidCount INT)
BEGIN

   -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得使用者的聊天列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Wayne         調整customers select方式
  --                2023/10/25      Ben           加上總筆數
  --                2023/11/24      yisu          加上有效客戶筆數, 無效客戶筆數
  -- ==========================================================================================

  SET @validCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId AND clients.disabled = 0);

    SET @invalidCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId AND clients.disabled = 1);


  SET ValidCount = @validCnt;
  SET InvalidCount = @invalidCnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    (select customer_name from customers where customer_id = clients.customer_id LIMIT 1) as customer_name,    
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    INNER JOIN chatrooms
      ON chatrooms.user_id = client_user.user_id
      AND chatrooms.client_id = clients.id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_getByUuid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_getByUuid`(IN UUID varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/26
  -- Description : 取得使用者的聊天客戶列表資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    clients.id AS client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM chatrooms
    INNER JOIN clients
      ON clients.id = chatrooms.client_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE chatrooms.uuid = UUID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_get_by_clientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_get_by_clientId`(IN clientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依據 clientId 取得 client user 對照檔
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    user_id,
    client_id,
    created_at,
    updated_at
  FROM client_user
  WHERE client_id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_log_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_log_add`(OUT id int,
IN clientId int,
IN oldUserId int,
IN newUserId int,
IN logReason varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/06
  -- Description : 新增 clientUserLog
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO client_user_log (client_id, ori_user_id, new_user_id, reason)
    VALUES (clientId, oldUserId, newUserId, logReason);

  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_log_get_metrics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_log_get_metrics`(IN logDate DATE)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/12
    -- Description : 取得 Follow , UnFollow 人數 by 指定日期
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COUNT(DISTINCT IF(reason = 'UnFollow', client_id, NULL)) AS 'unFollow',
           COUNT(DISTINCT IF(reason = 'Follow', client_id, NULL))   AS 'follow'
    FROM client_user_log
    WHERE (reason = 'UnFollow' OR reason = 'Follow')
      AND DATE(created_at) = logDate;
    -- ==========================================================================================
    -- example:
    -- CALL usp_client_user_log_get_metrics('2023-10-12');
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_log_get_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_log_get_report`(IN reason varchar(100), IN startDate date, IN endDate date)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/24
    -- Description : 依據指定時間範圍，取得該時間範圍內符合的好友資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2024-02-19 : [art] refs #41192 移除Distinct，直接顯示日期時間
    -- ==========================================================================================
    SELECT cl.created_at  AS Date,
           p.line_user_id as LineUserId,
           c.customer_id  as CustomerId
    FROM client_user_log cl
             inner join clients c on c.id = cl.client_id
             inner join profiles p on p.id = c.profile_id
    WHERE (cl.reason = reason)
      AND DATE(cl.created_at) BETWEEN startDate AND endDate;
    -- ==========================================================================================
    -- example:
    -- CALL usp_client_user_log_get_report('Follow', '2023-01-01', '2023-12-31');
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search`(IN UserId int, IN Keyword nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/26
  -- Description : 搜尋使用者的聊天列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    clients.id AS ClientId,
    clients.nickname AS NickName,
    clients.customer_id AS CustomerId,
    customers.customer_name AS Name,
    profiles.picture_url AS AvatarUrl,
    chatrooms.uuid,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND (Keyword = ''
  OR CASE WHEN LENGTH(Keyword) = 8 THEN clients.customer_id = Keyword WHEN LENGTH(Keyword) >= 9 THEN clients.phone = Keyword ELSE clients.nickname LIKE CONCAT('%', Keyword, '%') END
  )
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_customerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_customerId`(IN UserId int, IN CustomerId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查customerId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_customerId_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_customerId_v2`(IN UserId int, IN CustomerId int, OUT RecordCount int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查customerId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  -- ==========================================================================================

  SET @cnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId);
  SET RecordCount = @cnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_customerId_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_customerId_v3`(IN UserId INT, IN CustomerId INT, OUT ValidCount INT, OUT InvalidCount INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查customerId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  --                2023/11/24      yisu          加上有效客戶筆數, 無效客戶筆數
  -- ==========================================================================================

  SET @validCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId AND clients.disabled = 0);

    SET @invalidCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId AND clients.disabled = 1);

  SET ValidCount = @validCnt;
  SET InvalidCount = @invalidCnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND clients.customer_id = CustomerId
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_nickName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_nickName`(IN UserId int, IN Keyword nvarchar(255), IN LastMessageTime datetime, IN PageCount int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查nickName
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_nickName_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_nickName_v2`(IN UserId int, IN Keyword nvarchar(255), IN LastMessageTime datetime, IN PageCount int, OUT RecordCount int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查nickName
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  -- ==========================================================================================

  SET @cnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId);
  SET RecordCount = @cnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_nickName_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_nickName_v3`(IN UserId INT, IN Keyword NVARCHAR(255), IN LastMessageTime DATETIME, IN PageCount INT, OUT ValidCount INT, OUT InvalidCount INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查nickName
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  --                2023/11/24      yisu          加上有效客戶筆數, 無效客戶筆數
  -- ==========================================================================================

  SET @validCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId AND clients.disabled = 0);

    SET @invalidCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId AND clients.disabled = 1);


  SET ValidCount = @validCnt;
  SET InvalidCount = @invalidCnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
      AND clients.nickname LIKE CONCAT('%', Keyword, '%')
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
      AND (LastMessageTime IS NULL
      OR chatrooms.updated_at <= LastMessageTime)
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_phone`(IN UserId int, IN Keyword nvarchar(255), IN LastMessageTime datetime, IN PageCount int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查phone
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  -- ==========================================================================================

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  AND clients.phone = Keyword
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_phone_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_phone_v2`(IN UserId int, IN Keyword nvarchar(255), IN LastMessageTime datetime, IN PageCount int, OUT RecordCount int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查phone
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  -- ==========================================================================================

SET @cnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.phone = Keyword);
  SET RecordCount = @cnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  AND clients.phone = Keyword
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_search_phone_v3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_search_phone_v3`(IN UserId INT, IN Keyword NVARCHAR(255), IN LastMessageTime DATETIME, IN PageCount INT, OUT ValidCount INT, OUT InvalidCount INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/06/14
  -- Description : 搜尋使用者的聊天列表 - 查phone
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/10/12      Ben           add select clients.disabled
  --                2023/10/25      Ben           加上總筆數
  --                2023/11/24      yisu          加上有效客戶筆數, 無效客戶筆數
  -- 2024-02-02 : [art] 搜尋電話改用 hashPhone
  -- ==========================================================================================

SET @validCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.hash_phone = Keyword AND clients.disabled = 0);

  SET @invalidCnt := (SELECT
    count(*)
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
  WHERE client_user.user_id = UserId
  AND clients.hash_phone = Keyword AND clients.disabled = 1);

  SET ValidCount = @validCnt;
  SET InvalidCount = @invalidCnt;

  SELECT
    client_user.client_id,
    profiles.picture_url,
    profiles.display_name,
    profiles.line_user_id,
    customers.customer_name,
    clients.customer_id,
    clients.nickname,
    clients.disabled,
    chatrooms.unread,
    chatrooms.uuid,
    chatrooms.id AS ChatroomId,
    chatrooms.updated_at AS LastMessageTime
  FROM client_user
    INNER JOIN clients
      ON clients.id = client_user.client_id
    INNER JOIN chatrooms
      ON chatrooms.client_id = client_user.client_id
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE client_user.user_id = UserId
  AND (LastMessageTime IS NULL
  OR chatrooms.updated_at <= LastMessageTime)
  AND clients.hash_phone = Keyword
  ORDER BY chatrooms.updated_at DESC
  LIMIT PageCount
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_update`(IN clientUserId int, IN clientId int, IN userId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/06
  -- Description : 更新 clientUser
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE client_user
  SET user_id = userId,
      client_id = clientId
  WHERE id = clientUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_client_user_updateByClientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_client_user_updateByClientId`(IN clientId int, IN userId int)
BEGIN
 -- ==========================================================================================
  -- Author      : Wayne
  -- Create date : 2023/11/10
  -- Description : 更新 clientUser By ClientId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE client_user
  SET user_id = userId
  WHERE client_id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_data_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_data_add`(
  OUT Id INT, IN comboId VARCHAR(50),
  IN title NVARCHAR(100), 
  IN altText NVARCHAR(400),
  IN data LONGTEXT CHARACTER SET utf8mb4,
  IN createdAt TIMESTAMP,
  IN updatedAt TIMESTAMP, 
  IN createdBy INT, 
  IN updatedBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/09/05
-- Description : save combo data
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
    insert into combo_data
      (comboId, title, altText, status, data, created_at, updated_at, created_by, updated_by)
    values 
      (comboId, title, altText, 1, data, createdAt ,updatedAt, createdBy, updatedBy);

    SET Id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_data_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_data_GetAll`()
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/09/26
-- Description : get all combo data
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  SELECT
  Id as DataId,
  comboId,
  status,
  title,
  altText,
  data,
  created_at as createdAt,
  created_by as createdBy,
  updated_at as updatedAt,
  updated_by as updatedBy
FROM combo_data
WHERE status != 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_data_GetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_data_GetById`(IN dataId INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/09/04
-- Description : get data by id
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
SELECT
  id as dataId,
  comboId,
  status,
  title,
  altText,
  data,
  created_at as createdAt,
  created_by as createdBy,
  updated_at as updatedAt,
  updated_by as updatedBy
FROM
  combo_data
WHERE
  id = dataId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_data_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_data_update`(IN dataId INT, IN title NVARCHAR(100), IN altText NVARCHAR(400), IN data LONGTEXT CHARACTER SET UTF8MB4, IN updatedAt TIMESTAMP, IN updatedBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/10/04
-- Description : update combo data
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
UPDATE combo_data
  SET combo_data.title = title,
      combo_data.altText = altText,
      combo_data.data = data,
      combo_data.updated_at = updatedAt,
      combo_data.updated_by = updatedBy
WHERE combo_data.id = dataId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_data_update_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_data_update_status`(IN dataId INT, IN newStatus TINYINT, IN updatedAt TIMESTAMP, IN updatedBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/10/04
-- Description : update combo status
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
UPDATE combo_data
  SET combo_data.status = newStatus,
      combo_data.updated_at = updatedAt,
      combo_data.updated_by = updatedBy
WHERE combo_data.id = dataId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_schema_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_schema_add`(IN comboId VARBINARY(50), IN comboSchema TEXT, IN description NVARCHAR(255), IN status TINYINT, IN comboSpec NVARCHAR(1000), IN sort INT, IN userId INT, IN createdAt TIMESTAMP)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/01
  -- Description : 新增模版
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
INSERT INTO
  combo_schema (
    comboId,
    `schema`,
    description,
    status,
    schemaSpec,
    sort,
    created_at,
    created_by,
    updated_at,
    updated_by
  )
VALUES
  (
    comboId,
    comboSchema,
    description,
    status,
    comboSpec,
    sort,
    createdAt,
    userId,
    createdAt,
    userId
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_schema_GetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_schema_GetAll`()
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/10/04
-- Description : 取得所有模版結構(排除已刪除)
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
SELECT 
  combo_schema.comboId,
  combo_schema.schema,
  combo_schema.status,
  combo_schema.description,
  combo_schema.schemaSpec,
  combo_schema.sort,
  combo_schema.created_at as createdAt,
  combo_schema.created_by as createdBy,
  combo_schema.updated_at as updatedAt,
  combo_schema.updated_by as updatedBy
  FROM combo_schema
  WHERE combo_schema.status != 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_combo_schema_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_combo_schema_update`(IN comboId VARCHAR(50), IN newComboSchema TEXT, IN newDescription NVARCHAR(255), IN newStatus TINYINT, IN newComboSpec TEXT CHARACTER SET UTF8MB4, IN newSort INT, IN userId INT, IN updatedAt TIMESTAMP)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/07
  -- Description : 更新模版
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE combo_schema
  SET  
        combo_schema.`schema` = IF(newComboSchema IS NOT NULL AND newComboSchema != '' , newComboSchema , combo_schema.`schema`),
        combo_schema.description = IF(newDescription IS NOT NULL AND newDescription != '' , newDescription , combo_schema.description),
        combo_schema.schemaSpec =  IF(newComboSpec IS NOT NULL AND newComboSpec != '' , newComboSpec , combo_schema.schemaSpec),
        combo_schema.status = newStatus,
        combo_schema.sort = newSort,
        combo_schema.updated_at = updatedAt,
        combo_schema.updated_by = userId
  WHERE combo_schema.comboId = comboId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_add`(OUT id INT, IN customerId INT, IN customerName NVARCHAR(255), IN phoneNumber VARCHAR(255), IN employeeNo INT)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/09/08
    -- Description : 新增客戶資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    insert into customers (customer_id, customer_name, mobile, ehs_user_id)
    values (customerId, customerName, phoneNumber, employeeNo);

    SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_add_v2`(OUT id int,
    IN customerId int,
    IN customerName nvarchar(255),
    IN ehsUserId int,
    IN levelName varchar(255) CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/09/08
  -- Description : 新增客戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- Update List : 2024-01-31 wayne add levelName,remove phoneNumber
  -- ==========================================================================================
  INSERT INTO customers (customer_id, customer_name,  ehs_user_id, level_name)
    VALUES (customerId, customerName, ehsUserId, levelName);

  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_get_by_customerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_get_by_customerId`(IN customerId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/11
  -- Description : 取得客戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    customer_name,
    mobile,
    ehs_user_id,
    created_at,
    updated_at
  FROM customers
  WHERE customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_get_by_customerId_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_get_by_customerId_v2`(IN customerId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/11
  -- Description : 取得客戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --             : 2024-01-31   - Wayne      - add level_name,remove mobile
  -- ==========================================================================================
  SELECT
    id,
    customer_id,
    customer_name,
    ehs_user_id,
    level_name,
    created_at,
    updated_at
  FROM customers
  WHERE customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_get_by_lineid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_get_by_lineid`(IN lineId  varchar(255))
BEGIN
SELECT 
c.id
FROM superline.profiles p
LEFT JOIN superline.clients c
ON p.id = c.profile_id
LEFT JOIN superline.customers cust
ON c.customer_id = cust.id
WHERE (1=1)
AND IFNULL(c.customer_id,0) <> 0
AND p.line_user_id = lineId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_update`(
    IN customerId int, 
    IN phoneNumber varchar(255) CHARACTER SET utf8mb4,
    IN customerName varchar(255) CHARACTER SET utf8mb4, 
    IN ehs_user_id int)
BEGIN
    -- ==========================================================================================
    -- Author      : Wayne
    -- Create date : 2023/11/09
    -- Description : 更新customers
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-12-12 [art] : 變更接收參數指定為 utf8mb4
    -- ==========================================================================================
  UPDATE customers 
  SET
    customer_name = customerName
   ,mobile = phoneNumber
   ,ehs_user_id = ehs_user_id
   ,updated_at = NOW()
  WHERE customers.customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_update_ehsUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_update_ehsUserId`(IN customerId int, IN ehsUserId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/06
  -- Description : 更新客戶資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE customers
  SET ehs_user_id = ehsUserId
  WHERE customer_id = customerId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customers_update_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customers_update_v2`(
    IN customerId int, 
    IN customerName varchar(255) CHARACTER SET utf8mb4, 
    IN ehsUserId int,
    IN levelName varchar(255) CHARACTER SET utf8mb4)
BEGIN
    -- ==========================================================================================
    -- Author      : Wayne
    -- Create date : 2024/01/31
    -- Description : 更新customers
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-12-12 [art]   : 變更接收參數指定為 utf8mb4
    -- 2024-01-31 [wayne] : add level_name,remove phoneNumber
    -- ==========================================================================================
  UPDATE customers 
  SET
    customer_name = customerName
   ,ehs_user_id = ehsUserId
   ,level_name = levelName
   ,updated_at = NOW()
  WHERE customers.customer_id = customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customer_import_check_clear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customer_import_check_clear`(IN cutoffTime TIMESTAMP)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/01/04
-- Description : 清除早於指定時間的資料
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

  DELETE FROM customers_import_check
  WHERE created_at < cutoffTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_customer_import_check_getList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_customer_import_check_getList`(IN guid VARCHAR(50))
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/01/04
-- Description : 取得客戶名單資料
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

SELECT 
  cic.customer_id as CustomerId, 
  c.disabled
FROM customers_import_check cic
LEFT JOIN clients c ON c.customer_id = cic.customer_id
WHERE cic.guid = guid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_add`(
  OUT `@id` int,
  IN `@name` varchar(255) CHARACTER SET utf8mb4,
  IN `@qty` int,
  IN `@type` int,
  IN `@message` varchar(255) CHARACTER SET utf8mb4,
  IN `@isLimit` int,
  IN `@createdBy` int,
  IN `@createdAt` datetime
  )
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2024/01/04
  -- Description : 新增獎項設定
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

    insert into event_award_setting (name, qty, type, message, is_limit, created_by, created_at) 
    values (`@name`, `@qty`, `@type`, `@message`, `@isLimit`, `@createdBy`, `@createdAt`);

    set `@id` = @@IDENTITY;
  -- ==========================================================================================
  -- example:
  -- call usp_event_award_setting_add(:id, '測試獎項:銘謝惠顧', 0, 2, '銘謝惠顧，請再接再厲!', 0, 1, now());
  -- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_delete`(IN `@awardId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/05
  -- Description : 刪除獎項設定
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    DELETE FROM event_award_setting WHERE id=`@awardId`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_get`(IN `@settingId` INT)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/04
  -- Description : 取出獎品資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT event_award_setting.id,
  event_award_setting.name,
  event_award_setting.qty,
  event_award_setting.type,
  event_award_setting.message,
  event_award_setting.is_limit
  FROM event_award_setting
  WHERE id=`@settingId`
  ORDER BY event_award_setting.created_at DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_get_by_eventId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_get_by_eventId`(IN `@eventId` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2024/01/10
    -- Description : 取得獎項設定及機率 by eventId
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

    select `@eventId` as eventId,
           r.setting_id as settingId,
           r.id as rateId,
           s.name,
           s.qty as settingQty,
           s.type,
           s.message,
           s.is_limit as isLimit,
           r.win_rate as winRate,
           r.qty,
           r.addition_qty as additionqty
    from event_award_rate r
             inner join event_award_setting s on s.id = r.setting_id
    where r.event_id = `@eventId`
    order by r.win_rate ,r.id;
    -- ==========================================================================================
    -- example:
    -- call usp_event_award_setting_get_by_eventId(35);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_get_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_get_by_name`(IN `@name` varchar(255) CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/12
  -- Description : 根據名稱取得ID
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    SELECT id FROM event_award_setting
    WHERE name COLLATE utf8mb4_unicode_ci=`@name`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_get_list`(OUT `@Total` INT,IN `@pageSize` INT, IN `@offset` INT,IN `@keyWord` varchar(255) CHARACTER SET utf8mb4 ,IN `@FilterType` INT  )
BEGIN
      -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/09
  -- Description : 取出獎品資料列表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SET `@Total` := (SELECT COUNT(*) FROM event_award_setting 
  WHERE  (event_award_setting.name COLLATE utf8mb4_unicode_ci LIKE CONCAT((`@keyWord`), '%'))
  AND (`@FilterType` = 0 OR event_award_setting.type = `@FilterType`));

  SELECT event_award_setting.id,
  event_award_setting.name,
  event_award_setting.qty,
  event_award_setting.type,
  event_award_setting.message,
  event_award_setting.is_limit 
  FROM event_award_setting
  WHERE  (event_award_setting.name COLLATE utf8mb4_unicode_ci LIKE CONCAT((`@keyWord`), '%'))
  AND (`@FilterType` = 0 OR event_award_setting.type = `@FilterType`)
  ORDER BY event_award_setting.created_at DESC
  LIMIT `@pageSize`
  OFFSET `@offset`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_setting_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_setting_update`(
  IN `@id` int,
  IN `@name` varchar(255) CHARACTER SET utf8mb4,
  IN `@qty` int,
  IN `@type` int,
  IN `@message` varchar(255) CHARACTER SET utf8mb4,
  IN `@isLimit` int,
    IN `@updatedBy` int,
    IN `@updatedAt` datetime
  )
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2024/01/04
  -- Description : 更新獎項設定
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    update event_award_setting set 
      name = `@name`,
      qty = `@qty`,
      type = `@type`,
      message = `@message`,
      is_limit = `@isLimit`,
        updated_by = `@updatedBy`,
        updated_at = `@updatedAt`
    where id = `@id`;
  -- ==========================================================================================
  -- example:
  -- call usp_event_award_setting_update(1, '測試獎項:銘謝惠顧', 0, 2, '銘謝惠顧，請再接再厲!', 0, 1, now());
  -- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_award_sn_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_award_sn_get`(IN `@eventId` INT)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/15
  -- Description : 取得活動實際剩餘數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
     SELECT a.event_id as eventId,a.setting_id as settingId, b.name,COUNT(*) as count,b.qty FROM event_award_sn a 
     JOIN event_award_setting b ON a.setting_id = b.id
     WHERE a.event_id=`@eventId` AND available=1
     GROUP BY  b.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_add`(
  OUT `@id` int,
  IN `@name` varchar(255) CHARACTER SET utf8mb4,
  IN `@description` varchar(255) CHARACTER SET utf8mb4,
  IN `@guid` varchar(255) CHARACTER SET utf8mb4,
  IN `@event_type` int,
  IN `@start_date` datetime,
  IN `@end_date` datetime,
  IN `@created_by` int,
  IN `@created_at` datetime
  )
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2024/01/05
  -- Description : 新增活動主要資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/11     Will          加入虛擬刪除欄位設定
  -- ==========================================================================================

    insert into event_main_info (name, description, guid, event_type, start_date, end_date, is_enable, created_by, created_at,is_del)
    values (`@name`, `@description`, `@guid`, `@event_type`, `@start_date`, `@end_date`, 0, `@created_by`, `@created_at`,0);

    set `@id` = @@IDENTITY;
  -- ==========================================================================================
  -- example:
  -- call usp_event_main_info_add(:id, '測試活動', '測試活動desc', 'https://liff.line.me/1654646464-xxxxxx', 1,'2024-01-01 00:00:00', '2024-01-31 23:59:59', 31, now());
  -- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_delete`(IN `@eventId` SMALLINT)
BEGIN
    -- ==========================================================================================
    -- Author      : will
    -- Create date : 2024/01/11
    -- Description : 刪除活動
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
  UPDATE event_main_info SET is_del=1
  WHERE id=`@eventId`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_get`(IN `@eventId` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2024/01/10
    -- Description : 取得活動主要資訊
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    --                2024/01/18    will          移除liffurlru8 加入guid
    -- ==========================================================================================
    select i.id,
           i.name,
           i.description,
           i.guid,
           i.event_type,
           i.start_date,
           i.end_date,
           i.start_date,
           i.created_at,
           i.created_by,
           i.updated_at,
           i.updated_at
    from event_main_info i
    where i.id = `@eventId`;
    -- ==========================================================================================
    -- example:
    -- call usp_event_main_info_get(35);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_get_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_get_list`(OUT `@Total` INT, IN `@pageSize` INT, IN `@offset` INT, IN `@keyWord` varchar(255) CHARACTER SET utf8mb4, IN `@FilterType` INT)
BEGIN
    -- ==========================================================================================
    -- Author      : will
    -- Create date : 2024/01/10
    -- Description : 取出活動資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SET `@Total` := (SELECT COUNT(*)
                     FROM event_main_info
                     WHERE (event_main_info.name COLLATE utf8mb4_unicode_ci LIKE CONCAT((`@keyWord`), '%'))
                       AND (`@FilterType` = 0 OR event_main_info.event_type = `@FilterType`)
                       AND (event_main_info.is_del = 0));
    SELECT event_main_info.id,
           event_main_info.name,
           event_main_info.description,
           event_main_info.guid,
           event_main_info.event_type,
           event_main_info.start_date,
           event_main_info.end_date,
           event_main_info.is_enable,
           cu.name as created_by_name,
           event_main_info.created_by,
           event_main_info.created_at,
           uu.name as updated_by_name,
           event_main_info.updated_by,
           event_main_info.updated_at
    FROM event_main_info
             left join users as cu on cu.id = event_main_info.created_by
             left join users as uu on uu.id = event_main_info.updated_by
    WHERE (event_main_info.name COLLATE utf8mb4_unicode_ci LIKE CONCAT((`@keyWord`), '%'))
      AND (`@FilterType` = 0 OR event_main_info.event_type = `@FilterType`)
      AND (event_main_info.is_del = 0)
    ORDER BY event_main_info.created_at DESC
    LIMIT `@pageSize` OFFSET `@offset`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_start` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_start`(IN `@eventId` INT)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/16
  -- Description : 啟用活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    UPDATE event_main_info SET is_enable=1
    WHERE id=`@eventId`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_stop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_stop`(IN `@eventId` INT)
BEGIN
  -- ==========================================================================================
  -- Author      : will
  -- Create date : 2024/01/12
  -- Description : 停止活動狀態
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    UPDATE event_main_info SET is_enable=0
    WHERE id=`@eventId`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_main_info_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_main_info_update`(
  IN `@id` int,
  IN `@name` varchar(255) CHARACTER SET utf8mb4,
  IN `@description` varchar(255) CHARACTER SET utf8mb4,
  IN `@guid` varchar(255) CHARACTER SET utf8mb4,
  IN `@event_type` int,
  IN `@start_date` datetime,
  IN `@end_date` datetime,
  IN `@is_enable` bit,
  IN `@updated_by` int,
  IN `@updated_at` datetime
  )
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2024/01/15
  -- Description : 更新活動主要資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

    update event_main_info
    set name = `@name`,
        description = `@description`,
        guid = `@guid`,
        event_type = `@event_type`,
        start_date = `@start_date`,
        end_date = `@end_date`,
        is_enable = `@is_enable`,
        updated_by = `@updated_by`,
        updated_at = `@updated_at`
    where id = `@id`;

  -- ==========================================================================================
  -- example:
  -- call usp_event_main_info_update(:id, '測試活動', '測試活動desc', 'xxxxxx', 1,'2024-02-01 00:00:00', '2024-02-11 23:59:59', 1, 31, now());
  -- ==========================================================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_event_picture_get_by_eventId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_event_picture_get_by_eventId`(IN `@eventId` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2024/01/10
    -- Description : 取得活動圖片 by eventId
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

    select p.id,
           p.event_id,
           p.path,
           p.location,
           p.created_at,
           p.created_by,
           p.updated_at,
           p.updated_by
    from event_picture p
    where p.event_id = `@eventId`
    order by id;
    -- ==========================================================================================
    -- example:
    -- call usp_event_picture_get_by_eventId(35);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_functions_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_functions_add`(IN ParentId int(11), IN Enable bit(1), IN Name nvarchar(50), IN Description nvarchar(200), IN Icon nvarchar(50), IN Url nvarchar(400), IN Sort int(11), IN CreatedBy int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 新增功能
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO functions (functions.ParentId
  , functions.Enable
  , functions.Name
  , functions.Description
  , functions.Icon
  , functions.Url
  , functions.Sort
  , functions.CreatedTime
  , functions.CreatedBy)
    VALUES (ParentId, Enable, Name, Description, Icon, Url, Sort, NOW(), CreatedBy);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_functions_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_functions_delete`(IN FunctionId int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 刪除功能
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM functions
  WHERE functions.Id = FunctionId
  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_functions_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_functions_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/27
  -- Description : 取得所有功能
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    Id,
    ParentId,
    Enable,
    Name,
    Description,
    Icon,
    Url,
    Sort,
    CreatedTime,
    CreatedBy,
    ModifiedTime,
    ModifiedBy
  FROM functions;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_functions_getMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_functions_getMenu`(IN UserId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/29
  -- Description : 取得使用者功能選單
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    f.Id,
    f.Name,
    f.Description,
    f.Icon,
    f.Url,
    f.Sort,
    rf.AccessLevel,
    f.ParentId
  FROM user_roles u
    INNER JOIN roles r
      ON u.RoleId = r.Id
      AND r.Enable = 1
    INNER JOIN role_functions rf
      ON rf.RoleId = u.RoleId
    INNER JOIN functions f
      ON f.Id = rf.FunctionId
      AND f.Enable = 1
  WHERE u.UserId = UserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_functions_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_functions_update`(IN FunctionId int(11), IN ParentId int(11), IN Enable bit(1), IN Name nvarchar(50), IN Description nvarchar(200), IN Icon nvarchar(50), IN Url nvarchar(400), IN Sort int(11), IN ModifiedBy int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 更新功能
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE functions
  SET functions.ParentId = ParentId,
      functions.Enable = Enable,
      functions.Name = Name,
      functions.Description = Description,
      functions.Icon = Icon,
      functions.Url = Url,
      functions.Sort = Sort,
      functions.ModifiedTime = NOW(),
      functions.ModifiedBy = ModifiedBy
  WHERE functions.Id = FunctionId
  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_imagemaps_video_movies_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_imagemaps_video_movies_get`(IN `@templateMessageId` int)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/30
  -- Description : 取得 imagemaps & imagemaps_video & movies
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    imagemap_id,
    task_id,
    template_message_id,
    type,
    base_size_width,
    base_size_height,
    movie_id,
    original_content_url,
    preview_image_url,
    link_uri,
    label,
    x,
    y,
    width,
    height,
    pic_url
  FROM v_imagemaps
  WHERE template_message_id = `@templateMessageId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得所有圖庫
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    id,
    info,
    src,
    href,
    category,
    disabled,
    created_at,
    updated_at
  FROM images;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_add`(IN imageId VARCHAR(50), IN type TINYINT, IN status TINYINT, IN tag NVARCHAR(50), IN linkUrl NVARCHAR(100), IN path VARCHAR(100), IN startTime TIMESTAMP, IN endTime TIMESTAMP, IN createdAt TIMESTAMP, IN createdBy INT, IN updatedAt TIMESTAMP, IN updatedBy INT)
    COMMENT '新增圖片'
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/02
  -- Description : 新增圖片
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023-09-14   -  YISU      - 增加 LinkUrl 欄位
  --               2023-09-28 : [art] parameter linkUrl varchar --> nvarchar
  -- ==========================================================================================
  INSERT INTO images_new (uuid,
  type,
  status,
  tag,
  linkUrl,
  path,
  start_time,
  end_time,
  created_at,
  created_by,
  updated_at,
  updated_by)
    VALUES (imageId, type, status, tag, linkUrl, path, startTime, endTime, createdAt, createdBy, updatedAt, updatedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_add_v2`(IN imageId VARCHAR(50), IN type TINYINT, IN status TINYINT, IN tag NVARCHAR(50), IN linkUrl NVARCHAR(100), IN path VARCHAR(100), IN startTime TIMESTAMP, IN endTime TIMESTAMP, IN createdAt TIMESTAMP, IN createdBy INT, IN updatedAt TIMESTAMP, IN updatedBy INT, IN refId VARCHAR(50))
    COMMENT '新增圖片'
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/02
  -- Description : 新增圖片
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023-09-14   -  YISU      - 增加 LinkUrl 欄位
  --               2023-09-28 : [art] parameter linkUrl varchar --> nvarchar
  -- ==========================================================================================
  INSERT INTO images_new (uuid,
  type,
  status,
  tag,
  linkUrl,
  path,
  start_time,
  end_time,
  created_at,
  created_by,
  updated_at,
  updated_by,
  referenceId)
    VALUES (imageId, type, status, tag, linkUrl, path, startTime, endTime, createdAt, createdBy, updatedAt, updatedBy,refId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/05/05
  -- Description : 取得長輩圖
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/09/14  -  yisu      - 增加 LinkUrl 欄位
  -- ==========================================================================================
  SELECT
    image.uuid,
    image.type,
    image.status,
    image.tag,
    image.linkUrl,
    image.path,
    image.start_time,
    image.end_time,
    image.created_at,
    image.created_by,
    image.updated_at,
    image.updated_by,
    users.name AS updatedUserName
  FROM images_new image
    LEFT JOIN users
      ON image.updated_by = users.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_getByType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_getByType`(IN typeId INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/02
  -- Description : 依類型取得圖片(排除已刪除(status=2))
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/23   - yisu       -  增加撈選欄位(referenceId)
  -- ==========================================================================================
  SELECT
    image.uuid,
    image.type,
    image.status,
    image.tag,
    image.linkUrl,
    image.path,
    image.start_time,
    image.end_time,
    image.created_at,
    image.created_by,
    image.updated_at,
    image.updated_by,
    image.referenceId,
    users.name AS updatedUserName
  FROM images_new image
  LEFT JOIN users ON image.updated_by = users.id
  WHERE image.status != 2  AND type = typeId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_totalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_totalCount`(IN type INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/30
  -- Description : 撈選圖片數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    COUNT(*)
  FROM images_new image
  WHERE image.type = type
  AND image.status = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_new_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_new_update`(IN imageId VARCHAR(50), IN newstatus TINYINT, IN newTag TEXT, IN newLinkUrl VARCHAR(100), IN startTime TIMESTAMP, IN endTime TIMESTAMP, IN updatedAt TIMESTAMP, IN updatedBy INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/09
  -- Description : 更新圖片
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  UPDATE images_new img
  SET status = newstatus,
      tag = newTag,
      linkUrl = newLinkUrl,
      start_time = startTime,
      end_time = endTime,
      updated_at = updatedAt,
      updated_by = updatedBy
  WHERE uuid = imageId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_images_type_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_images_type_getAll`()
BEGIN
-- ==========================================================================================
-- Author      : yisu chen
-- Create date : 2023/09/13
-- Description : 取得所有圖庫類型
-- Update List : [UpdateTime] - [UpdateBy] - [Description]

-- ==========================================================================================
SELECT id,name,title,canLink FROM images_type;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insight_demographic_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_insight_demographic_add`(OUT id bigint(20), IN store_id char(8), IN query_date date, IN available tinyint, IN ages text, IN genders text, IN areas nvarchar(2550), IN app_types text, IN subscription_periods text)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/04/11
  -- Description : 儲存 Line Insight Demographic 分析資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO insight_demographic (store_id,
  query_date,
  available,
  ages,
  genders,
  areas,
  app_types,
  subscription_periods,
  updated_at,
  created_at)
    VALUES (store_id, query_date, available, ages, genders, areas, app_types, subscription_periods, NOW(), NOW());
  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insight_followers_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_insight_followers_add`(OUT id bigint(20) UNSIGNED, IN store_id char(8), IN query_date date, IN status char(14), IN followers int(10) UNSIGNED, IN targeted_reaches int(10) UNSIGNED, IN blocks int(10) UNSIGNED)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/04/11
  -- Description : 儲存 Line Insight 指定日期的 Followers 分析資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO insight_followers (store_id,
  query_date,
  status,
  followers,
  targeted_reaches,
  blocks, updated_at,
  created_at)
    VALUES (store_id, query_date, status, followers, targeted_reaches, blocks, NOW(), NOW());
  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insight_followers_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_insight_followers_get`()
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/10/25
    -- Description : 取得最新一筆有效的insight followers
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-10-31 : [art] 修正欄位名稱與 DTO 相同
    -- ==========================================================================================
    select id,
           store_id as StoreId,
           query_date as QueryDate,
           status as Status,
           followers as Followers,
           targeted_reaches as TargetedReaches,
           blocks as Blocks,
           updated_at as UpdatedAt,
           created_at as CreatedAt
    from insight_followers
    where status = 'ready'
    order by created_at desc
    limit 1;
    -- ==========================================================================================
    -- example:
    -- CALL usp_insight_followers_get();
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insight_interaction_addOrUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_insight_interaction_addOrUpdate`(IN uuid varchar(255), IN delivered int, IN uniqueImpression int, IN uniqueClick int, IN uniqueMediaPlayed int, IN uniqueMediaPlayed100Percent int, IN messages nvarchar(2550), IN clicks nvarchar(2550), IN created_at datetime, IN updated_at datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/02
  -- Description : 儲存 Line User Interaction (使用者與訊息的互動資訊)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO insight_interaction (uuid,
  delivered,
  uniqueImpression,
  uniqueClick,
  uniqueMediaPlayed,
  uniqueMediaPlayed100Percent,
  messages,
  clicks,
  created_at,
  updated_at)
    VALUES (uuid, delivered, uniqueImpression, uniqueClick, uniqueMediaPlayed, uniqueMediaPlayed100Percent, messages, clicks, created_at, updated_at)
  ON DUPLICATE KEY
  UPDATE
  delivered = delivered,
  uniqueImpression = uniqueImpression,
  uniqueClick = uniqueClick,
  uniqueMediaPlayed = uniqueMediaPlayed,
  uniqueMediaPlayed100Percent = uniqueMediaPlayed100Percent,
  messages = messages,
  clicks = clicks,
  updated_at = updated_at;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insight_message_delivery_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_insight_message_delivery_add`(OUT id bigint(20), IN store_id char(8), IN query_date date, IN status char(14), IN broadcast int(10), IN targeting int(10), IN auto_response int(10), IN welcome_response int(10), IN chat int(10), IN api_broadcast int(10), IN api_push int(10), IN api_multicast int(10), IN api_narrowcast int(10), IN api_reply int(10))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/04/11
  -- Description : 儲存 Line Insight 指定日期的 Message Delivery 分析資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO insight_message_delivery (store_id,
  query_date,
  status,
  broadcast,
  targeting,
  auto_response,
  welcome_response,
  chat,
  api_broadcast,
  api_push,
  api_multicast,
  api_narrowcast,
  api_reply,
  updated_at,
  created_at)
    VALUES (store_id, query_date, status, broadcast, targeting, auto_response, welcome_response, chat, api_broadcast, api_push, api_multicast, api_narrowcast, api_reply, NOW(), NOW());
  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_add_custom_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_add_custom_message`(IN `@id` int,
                                                                                 IN `@content` nvarchar(255),
                                                                                 IN `@startAt` datetime,
                                                                                 IN `@endAt` datetime
)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/06
    -- Description : 新增自訂離線訊息
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    INSERT INTO `leave_messages` (`start_at`, `end_at`, `content`) VALUES (`@startAt`, `@endAt`, `@content`);
    set `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_delete_custom_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_delete_custom_message`(IN `@id` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/06
    -- Description : 虛刪除自訂離線訊息
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    UPDATE leave_messages SET deleted_at = CURRENT_TIMESTAMP WHERE `id` = `@id`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_get_by_range` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_get_by_range`(IN `@start` datetime, IN `@end` datetime)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/06/30
    -- Description : 取得離線訊息設定
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

    SELECT id,
           content,
           start_at,
           end_at,
           created_at,
           updated_at,
           deleted_at,
           type
    FROM leave_messages l
    WHERE type = 0
      and deleted_at is null
      and start_at <= `@end`
      and end_at >= `@start`
    union all
    select id,
           content,
           start_at,
           end_at,
           created_at,
           updated_at,
           deleted_at,
           type
    from leave_messages
    where type > 0
      and deleted_at is null;

    -- =================================================
-- example:
-- CALL usp_leave_messages_get_by_range('2023-07-01', '2023-07-31');
-- =================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_get_same_range_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_get_same_range_count`(
    IN `@startAt` datetime,
    IN `@endAt` datetime,
    IN `@excludeId` int
)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/06
    -- Description : 取得重複區間的數量
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT COUNT(*)
    FROM leave_messages lm
    WHERE lm.type = 0
      and lm.deleted_at is null
      AND (`@excludeId` = 0 OR lm.id != `@excludeId`)
      and `@startAt` <= lm.end_at
      AND lm.start_at <= `@endAt`;

    -- =================================================
-- example:
-- CALL usp_leave_messages_get_same_range_count('2023-07-05','2023-07-06',4);
-- =================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_update_custom_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_update_custom_message`(IN `@id` int,
                                                                                 IN `@content` nvarchar(255),
                                                                                 IN `@startAt` datetime,
                                                                                 IN `@endAt` datetime
)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/06
    -- Description : 更新自訂離線訊息
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================

    UPDATE `leave_messages` set  `start_at` = `@startAt`, `end_at` = `@endAt`, `content` = `@content` WHERE `id` = `@id`;
    -- =================================================
-- example:
-- CALL usp_leave_messages_update_custom_message(4,'XXX','2023-07-05 00:00:01','2023-07-06 23:59:59',2023,7);
-- =================================================

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_leave_messages_update_default_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_leave_messages_update_default_message`(IN `@id` int, IN `@content` nvarchar(255))
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/06
    -- Description : 更新平日或假日預設離線訊息
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    UPDATE `leave_messages` SET `content` = `@content` WHERE `id` = `@id`;

    -- =================================================
-- example:
-- CALL usp_leave_messages_update_default_message(2,'感謝您傳來訊息，VIP專員休假，將於上班時間儘快為您服務！提醒您★小心詐騙★如您接獲可疑電話或(＋886)號來電，與您索取個資或解除分期、重複扣款…等訊息，請立即拒絕答覆並掛斷電話，撥打防詐騙專線165或東森購物客服查證，若有其他服務需求，請撥打客服專線0800-013-058，東森購物祝您有美好的一天。');
-- =================================================


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_line_client_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_line_client_get`(IN ClientId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/12
  -- Description : 取得聊天室客戶相關資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023/06/15 Ben add select profiles.id , profiles.updated_at
  -- 2023-10-31 art 新增 hash_phone, mask_phone
  -- 2023/12/12 Ben select add clients.disabled
  -- 2024-02-02 art remove phone
  -- ==========================================================================================

  SELECT
    profiles.display_name,
    profiles.picture_url,
    profiles.status_message,
    profiles.line_user_id,
    profiles.id AS profile_id,
    profiles.updated_at AS profile_updated_at,
    customers.customer_name,
    clients.customer_id,
    clients.hash_phone,
    clients.mask_phone,
    clients.remark,
    clients.nickname,
    clients.disabled
  FROM clients
    INNER JOIN profiles
      ON profiles.id = clients.profile_id
    LEFT JOIN customers
      ON customers.customer_id = clients.customer_id
  WHERE clients.id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_login_log_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_login_log_add`(IN UserId int(11), IN LoginDate datetime, IN LogoutDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/26
  -- Description : 新增登入LOG
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO login_log (user_id, login_date, logout_date)
    VALUES (UserId, LoginDate, LogoutDate)
  ON DUPLICATE KEY UPDATE login_date = LoginDate, logout_date = LogoutDate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_login_log_get_by_userId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_login_log_get_by_userId`(IN userId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/26
  -- Description : 取得登出入紀錄
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    user_id,
    login_date,
    logout_date
  FROM login_log
  WHERE user_id = userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_login_log_update_logout_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_login_log_update_logout_date`(IN UserId int(11), IN LogoutDate datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/26
  -- Description : 更新登出日期
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE login_log
  SET logout_date = LogoutDate
  WHERE user_id = UserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_media_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_media_add`(OUT `@id` int, IN `@modelType` varchar(255), IN `@modelId` int, IN `@collectionName` varchar(255),
IN `@name` varchar(255), IN `@fileName` varchar(255), IN `@mimeType` varchar(255), IN `@disk` varchar(255),
IN `@size` int, IN `@manipulations` text, IN `@customProperties` text, IN `@responsiveImages` text,
IN `@orderColumn` int, IN `@updatedAt` timestamp, IN `@createdAt` timestamp, IN `@mediaUrl` varchar(2000))
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/04/11
  -- Description : add media
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================


  INSERT INTO media (model_type
  , model_id
  , collection_name
  , name
  , file_name
  , mime_type
  , disk
  , size
  , manipulations
  , custom_properties
  , responsive_images
  , order_column
  , created_at
  , updated_at
  , media_url)
    VALUES (`@modelType`, `@modelId`, `@collectionName`, `@name`, `@fileName`, `@mimeType`, `@disk`, `@size`, `@manipulations`, `@customProperties`, `@responsiveImages`, `@orderColumn`, `@createdAt`, `@updatedAt`, `@mediaUrl`);

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_media_clone_by_filename` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_media_clone_by_filename`(OUT `@id` int, IN `@filename` varchar(255), IN `@modelType` varchar(255), IN `@modelId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/31
  -- Description : clone media
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================


  INSERT INTO media (model_type
  , model_id
  , collection_name
  , name
  , file_name
  , mime_type
  , disk
  , size
  , manipulations
  , custom_properties
  , responsive_images
  , order_column
  , created_at
  , updated_at)
    SELECT
      `@modelType`,
      `@modelId`,
      collection_name,
      name,
      file_name,
      mime_type,
      disk,
      size,
      manipulations,
      custom_properties,
      responsive_images,
      order_column,
      NOW(),
      NOW()
    FROM media
    WHERE file_name = `@filename`
    LIMIT 1;

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_media_getByFilename` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_media_getByFilename`(IN `@filename` varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/04/11
  -- Description : get media
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    model_type,
    model_id,
    collection_name,
    name,
    file_name,
    mime_type,
    disk,
    size,
    manipulations,
    custom_properties,
    responsive_images,
    order_column,
    created_at,
    updated_at,
    media_url
  FROM media
  WHERE file_name = `@filename`
  LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_media_getByMessageId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_media_getByMessageId`(IN messageId int, IN modelType varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/04
  -- Description : get media by message id
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SET @modelId := (select messageable_id from messages where id = messageId);
  
  SELECT
    model_type,
    model_id,
    collection_name,
    name,
    file_name,
    mime_type,
    disk,
    size,
    manipulations,
    custom_properties,  
    responsive_images,
    order_column,
    created_at,
    updated_at,
    media_url
  FROM media
  WHERE model_id = @modelId AND model_type = modelType
  LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_add`(OUT id int,
IN chatroomId int,
IN profileId int,
IN messageableId int,
IN messageableType varchar(255),
IN replyToken varchar(255),
IN `group` varchar(255),
IN `@createdAt` datetime,
IN `@updatedAt` datetime,
IN requestId varchar(50))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 新增訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-04-13 [art] 建立、更新時間可由外部傳入
  -- 2023-06-16 [yisu] 增加 requestId 欄位, 
  -- 2023-06-17 [yisu] 目前先不寫入 requestId
  -- ==========================================================================================
  INSERT INTO messages (chatroom_id,
  profile_id,
  messageable_type,
  messageable_id,
  reply_token,
  `group`,
  created_at,
  updated_at)
    VALUES (chatroomId, profileId, messageableType, messageableId, replyToken, `group`, IFNULL(`@createdAt`, NOW()), IFNULL(`@updatedAt`, NOW()));

  SET
  id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_add_by_audience_temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_add_by_audience_temp`(IN messageType VARCHAR(255), IN messageableId BIGINT(20), IN now TIMESTAMP, IN txKey VARCHAR(50), IN streamId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/11
  -- Description : 依 audience_temp 資訊, 將訊息批次儲存至 訊息表(messages), 及直播通知訊息紀錄表(stream_message_record)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO messages 
  (
     chatroom_id,
     profile_id,
     messageable_type,
     messageable_id,
     reply_token,
     sent,
     `group`,
     created_at,
     updated_at
  )
  SELECT 
      chatrooms.id,
      clients.profile_id,
      messageType,
      messageableId,
      '',
      1,
      'Y',
      now,
      now
  FROM audience_temp
  INNER JOIN clients ON audience_temp.customer_id = clients.customer_id
  INNER JOIN chatrooms ON clients.id = chatrooms.client_id
  WHERE audience_temp.tx_key = txKey
  AND NOT EXISTS(
    SELECT 1 FROM stream_message_record WHERE stream_message_record.client_id = clients.id  
    AND stream_message_record.stream_id = streamId
    AND DATE(stream_message_record.created_at) = CURDATE()
  );


  INSERT INTO stream_message_record
  (
     stream_id,
     client_id,       
     created_at
  )
  SELECT 
    streamId,
    clients.id,
    now
  FROM audience_temp
  INNER JOIN clients ON clients.customer_id = audience_temp.customer_id
  WHERE tx_key = txKey AND NOT EXISTS(
    SELECT 1 FROM stream_message_record WHERE stream_message_record.client_id = clients.id  
    AND stream_message_record.stream_id = streamId
    AND DATE(stream_message_record.created_at) = CURDATE()
  );
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_add_by_lineUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_add_by_lineUserId`(IN lineUserIds TEXT, IN now TIMESTAMP, IN messageableType VARCHAR(255), IN messageableId BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/12
  -- Description : 依 LineUserIds 儲存 messages 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO messages (
      chatroom_id,
      profile_id,
      messageable_type,
      messageable_id,
      reply_token,
      `sent`,
      `group`,
      created_at,
      updated_at
  )
  SELECT 
    chatrooms.id,
    p.id,
    messageableType,
    messageableId,
    '',
    1,
    'Y',
    now,
    now
  FROM (
        SELECT *
        FROM profiles
        WHERE FIND_IN_SET(lineUserIds, profiles.line_user_id)
       ) AS p
  INNER JOIN clients ON clients.profile_id = p.id
  INNER JOIN chatrooms ON chatrooms.client_id = clients.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_add_by_multicast` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_add_by_multicast`(IN messageType VARCHAR(255), IN messageableId BIGINT(20), IN now TIMESTAMP, IN userId INT, IN clientIdList TEXT, IN multiAll BIT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/22
  -- Description : 將訊息批次新增至 messages 表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    INSERT INTO messages (
        chatroom_id,
        profile_id,
        messageable_type,
        messageable_id,
        reply_token,
        `sent`,
        `group`,
        created_at,
        updated_at
    )
    SELECT
      chatrooms.id,
      clients.profile_id,
      messageType,
      messageableId,
      '',
      1,
      'Y',
      now,
      now
FROM
   chatrooms JOIN clients ON clients.id = client_id
  WHERE
      clients.disabled = 0 AND(
        (multiAll = TRUE AND chatrooms.user_id = userId)
        OR
        (multiAll = FALSE AND chatrooms.user_id = userId AND FIND_IN_SET(chatrooms.client_id, clientIdList))
      );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_add_by_multicast_bak` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_add_by_multicast_bak`(IN messageType VARCHAR(255), IN messageableId BIGINT(20), IN now TIMESTAMP, IN userId INT, IN clientIdList TEXT, IN multiAll BIT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/11/22
  -- Description : 將訊息批次新增至 messages 表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
    INSERT INTO messages (
        chatroom_id,
        profile_id,
        messageable_type,
        messageable_id,
        reply_token,
        `sent`,
        `group`,
        created_at,
        updated_at
    )
    SELECT
      vc.chatroom_id,
      vcp.profile_id,
      messageType,
      messageableId,
      '',
      1,
      'Y',
      now,
      now
    FROM
        v_chatrooms_current AS vc JOIN v_clients_profiles AS vcp
        ON vc.client_id = vcp.client_id
      WHERE
          vcp.disabled = 0 AND(
            (multiAll = TRUE AND vc.user_id = userId)
            OR
            (multiAll = FALSE AND vc.user_id = userId AND FIND_IN_SET(vc.client_id, clientIdList))
          );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_getByuuId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_getByuuId`(IN UUID nvarchar(255), IN PageCount int, IN MessageId int, IN Scroll int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得聊天室對話紀錄
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023-05-09 - yisu - 增加 video , audio 撈選
  --                2023/06/02        Ben       增加加入聊天的時間判斷，防止取得以前的推播訊息
  -- ==========================================================================================

  SET @ChatroomId = (SELECT
      id
    FROM chatrooms
    WHERE chatrooms.uuid = UUID);

  SELECT
    messages.id AS messageId,
    CASE WHEN message_texts.message_id IS NOT NULL THEN message_texts.message_id WHEN message_stickers.message_id IS NOT NULL THEN message_stickers.message_id WHEN message_images.message_id IS NOT NULL THEN message_images.message_id WHEN message_videos.message_id IS NOT NULL THEN message_videos.message_id WHEN message_audios.message_id IS NOT NULL THEN message_audios.message_id END AS message_id,
    messages.profile_id,
    profiles.display_name,
    messages.messageable_type,
    messages.messageable_id,
    message_texts.text,
    message_stickers.sticker_id,
    media.file_name,
    media.id AS mediaId,
    media.media_url,
    messages.created_at,
    profiles.picture_url,
    message_jsons.content AS JsonContent,
    messages.reply_token
  FROM chatrooms
    INNER JOIN messages
      ON messages.created_at >= chatrooms.created_at
      AND (messages.chatroom_id = chatrooms.id
      OR messages.chatroom_id = 0)
      AND messages.created_at > DATE_ADD(NOW(), INTERVAL -90 DAY)
    LEFT JOIN message_texts
      ON message_texts.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageText'
    LEFT JOIN message_stickers
      ON message_stickers.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageSticker'
    LEFT JOIN message_images
      ON message_images.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageImage'
    LEFT JOIN message_videos
      ON message_videos.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageVideo'
    LEFT JOIN message_audios
      ON message_audios.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageAudio'
    LEFT JOIN media
      ON media.model_id = message_images.id
      AND media.model_type = 'App\\MessageImage'
    LEFT JOIN message_jsons
      ON message_jsons.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageJson'
    LEFT JOIN profiles
      ON profiles.id = messages.profile_id
  WHERE chatrooms.id = @ChatroomId
  AND IF(Scroll = 0,
  (MessageId = 0
  OR messages.id <= MessageId),
  (MessageId = 0
  OR messages.id >= MessageId))
  ORDER BY (CASE WHEN Scroll = 0 THEN messages.created_at END) DESC,
  (CASE WHEN Scroll = 1 THEN messages.created_at END) ASC

  LIMIT PageCount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_messages_getByuuId_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_messages_getByuuId_v2`(IN UUID nvarchar(255), IN PageCount int, IN MessageId int, IN Scroll int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得聊天室對話紀錄
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023-05-09 - yisu - 增加 video , audio 撈選
  --                2023/06/02        Ben       增加加入聊天的時間判斷，防止取得以前的推播訊息
  --                2023/01/23        yisu       增加撈選模板訊息
  -- ==========================================================================================

  SET @ChatroomId = (SELECT
      id
    FROM chatrooms
    WHERE chatrooms.uuid = UUID);

  SELECT
    messages.id AS messageId,
    CASE WHEN message_texts.message_id IS NOT NULL THEN message_texts.message_id WHEN message_stickers.message_id IS NOT NULL THEN message_stickers.message_id WHEN message_images.message_id IS NOT NULL THEN message_images.message_id WHEN message_videos.message_id IS NOT NULL THEN message_videos.message_id WHEN message_audios.message_id IS NOT NULL THEN message_audios.message_id END AS message_id,
    messages.profile_id,
    profiles.display_name,
    messages.messageable_type,
    messages.messageable_id,
    message_texts.text,
    message_stickers.sticker_id,
    media.file_name,
    media.id AS mediaId,
    media.media_url,
    messages.created_at,
    profiles.picture_url,
    message_jsons.content AS JsonContent,
    message_combo.data AS ComboData,
    messages.reply_token
  FROM chatrooms
    INNER JOIN messages
      ON messages.created_at >= chatrooms.created_at
      AND (messages.chatroom_id = chatrooms.id
      OR messages.chatroom_id = 0)
      AND messages.created_at > DATE_ADD(NOW(), INTERVAL -90 DAY)
    LEFT JOIN message_texts
      ON message_texts.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageText'
    LEFT JOIN message_stickers
      ON message_stickers.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageSticker'
    LEFT JOIN message_images
      ON message_images.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageImage'
    LEFT JOIN message_videos
      ON message_videos.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageVideo'
    LEFT JOIN message_audios
      ON message_audios.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageAudio'
    LEFT JOIN media
      ON media.model_id = message_images.id
      AND media.model_type = 'App\\MessageImage'
    LEFT JOIN message_jsons
      ON message_jsons.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageJson'
    LEFT JOIN message_combo
      ON message_combo.id = messages.messageable_id
      AND messages.messageable_type = 'App\\MessageCombo'
    LEFT JOIN profiles
      ON profiles.id = messages.profile_id
  WHERE chatrooms.id = @ChatroomId
  AND IF(Scroll = 0,
  (MessageId = 0
  OR messages.id <= MessageId),
  (MessageId = 0
  OR messages.id >= MessageId))
  ORDER BY (CASE WHEN Scroll = 0 THEN messages.created_at END) DESC,
  (CASE WHEN Scroll = 1 THEN messages.created_at END) ASC

  LIMIT PageCount;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_add_bulk_by_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_add_bulk_by_all`(IN `@messageableType` varchar(255), IN `@messageableId` bigint)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/29
  -- Description : All批量寫入Message
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================


  INSERT IGNORE INTO messages (chatroom_id
  , profile_id
  , messageable_type
  , messageable_id
  , reply_token
  , sent
  , `group`
  , created_at
  , updated_at)
    SELECT
      vcr.chatroom_id,
      vcr.profile_id_user,
      `@messageableType`,
      `@messageableId`,
      '',
      1,
      'Y',
      NOW(),
      NOW()
    FROM v_clients_profiles vcp
      JOIN v_chatrooms_current vcr
        ON vcp.client_id = vcr.client_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_add_bulk_by_clientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_add_bulk_by_clientId`(IN clientIdList VARCHAR(255))
BEGIN

INSERT INTO messages (
    chatroom_id,
    profile_id,
    messageable_type,
    messageable_id,
    reply_token,
    sent,
    `group`,
    created_at,
    updated_at
  )
SELECT
  vcr.chatroom_id,
  vcr.profile_id_user,
  `@messageableType`,
  `@messageableId`,
  '',
  1,
  'Y',
  NOW(),
  NOW()
FROM
  v_clients_profiles vcp
  JOIN v_chatrooms_current vcr ON vcp.client_id = vcr.client_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_add_bulk_by_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_add_bulk_by_tag`(IN `@tags` nvarchar(255), IN `@messageableType` varchar(255), IN `@messageableId` bigint, IN `@profileId` int, IN `@createdAt` datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/29
  -- Description : 群組批量寫入Message
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DROP TEMPORARY TABLE IF EXISTS `tmp_usp_message_addBulk`;

  CREATE TEMPORARY TABLE `tmp_usp_message_addBulk` (
    `tag` nvarchar(255) NOT NULL
  );

  IF (`@tags` != '') THEN
    SET @a = 0;
  simple_loop:
    LOOP
      SET @a = @a + 1;
      SET @str = SPLIT_STR(`@tags`, ',', @a);
      IF @str = '' THEN
        LEAVE simple_loop;
      END IF;
      INSERT INTO tmp_usp_message_addBulk (`tag`)
        SELECT
          @str;
    END LOOP simple_loop;
  END IF;

  INSERT IGNORE INTO messages (chatroom_id
  , profile_id
  , messageable_type
  , messageable_id
  , reply_token
  , sent
  , `group`
  , created_at
  , updated_at)
    SELECT
      _ct_group.active_chatroom_id,
      `@profileId`,
      `@messageableType`,
      `@messageableId`,
      '',
      1,
      'Y',
      `@createdAt`,
      `@createdAt`
    FROM (SELECT
        client_id,
        active_chatroom_id
      FROM (SELECT
          client_id,
          active_chatroom_id
        FROM client_tags ct
          JOIN tmp_usp_message_addBulk tmp
            ON ct.name = tmp.tag
            AND ct.active_chatroom_id IS NOT NULL) AS _ct
      GROUP BY client_id,
               active_chatroom_id) AS _ct_group
      JOIN v_chatrooms_current vcc
        ON _ct_group.client_id = vcc.client_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_audios_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_audios_add`(OUT `@id` int, IN `@messageId` varchar(255), IN `@createdAt` datetime, IN `@updatedAt` datetime)
BEGIN

  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/05
  -- Description : 寫入message_audios
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  INSERT INTO message_audios (message_id
  , type
  , created_at
  , updated_at)
    VALUES (`@messageId`, 'audio', IFNULL(`@createdAt`, NOW()), IFNULL(`@updatedAt`, NOW()));

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_combo_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_combo_add`(OUT `@id` INT, IN `@data` JSON, IN `@createdAt` TIMESTAMP)
BEGIN
  -- ==========================================================================================
  -- Author      : Yisu Chen
  -- Create date : 2023/10/01
  -- Description : 寫入message_combo
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

INSERT INTO message_combo 
  (data, created_at)
VALUES
  (`@data`, `@createdAt`);

    SET `@id` = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_delete`(IN messageId INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/05
  -- Description : 刪除聊天室訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  DELETE FROM messages
  WHERE id = messageId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_images_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_images_add`(OUT `@id` int, IN `@messageId` varchar(255), IN `@createdAt` datetime, IN `@updatedAt` datetime)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/29
  -- Description : 寫入message_images
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-04-13 [art] 新增建立、修改時間參數
  -- ==========================================================================================

  INSERT INTO message_images (message_id
  , type
  , created_at
  , updated_at)
    VALUES (`@messageId`, 'image', IFNULL(`@createdAt`, NOW()), IFNULL(`@updatedAt`, NOW()));

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_jsons_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_jsons_add`(OUT `@id` int, IN `@messageId` varchar(255), IN `@content` json)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/04/12
  -- Description : 寫入message_jsons
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  INSERT INTO `message_jsons` (message_id
  , content
  , created_at
  , updated_at)
    VALUES (`@messageId`, `@content`, NOW(), NOW());

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_stickers_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_stickers_add`(OUT id int, IN messageId varchar(255), IN messageType varchar(255), IN packageId varchar(255), IN stickerId varchar(255), IN createdAt datetime, IN updatedAt datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/07
  -- Description : 新增 message_stickers
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO message_stickers (message_id, type, package_id, sticker_id, created_at, updated_at)
    VALUES (messageId, messageType, packageId, stickerId, IFNULL(createdAt, NOW()), IFNULL(updatedAt, NOW()));

  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_texts_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_texts_add`(OUT `@id` int, IN `@messageId` varchar(255), IN `@text` text CHARACTER SET utf8mb4, IN `@createdAt` datetime, IN `@updatedAt` datetime)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/29
  -- Description : 寫入message_texts
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-04-13 [art] 建立、更新時間可由外部傳入
  -- ==========================================================================================

  INSERT INTO `message_texts` (message_id
  , type
  , text
  , created_at
  , updated_at)
    VALUES (`@messageId`, 'text', `@text`, IFNULL(`@createdAt`, NOW()), IFNULL(`@updatedAt`, NOW()));

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_texts_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_texts_delete`(IN messageId int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/04
  -- Description : 刪除聊天室文字訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  
  SET @messageableId := (SELECT messageable_id FROM messages WHERE id = messageId);
  
  DELETE FROM message_texts
  WHERE id = @messageableId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_texts_getByChatroomId_InTimeRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_texts_getByChatroomId_InTimeRange`(IN chatroomId int, IN min int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/12
  -- Description : 取得幾分鐘之前的聊天室訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    mt.text
  FROM messages m
    INNER JOIN message_texts mt
      ON m.messageable_id = mt.id
  WHERE m.chatroom_id = chatroomId
  AND m.messageable_type = 'App\\MessageText'
  AND mt.created_at >= DATE_SUB(NOW(), INTERVAL min MINUTE)
  ORDER BY mt.created_at DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_texts_search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_texts_search`(IN UUID varchar(255), IN Keyword nvarchar(50), IN StartTime datetime, IN EndTime datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/12
  -- Description : 聊天訊息搜尋
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023/06/07       Ben        補上Position
  -- ==========================================================================================

  SELECT
    messages.id 'MessageId',
    profiles.display_name 'Sender',
    profiles.picture_url 'Avatar',
    message_texts.text 'Text',
    message_texts.created_at 'SendTime',
    CASE WHEN LENGTH(TRIM(message_texts.message_id)) = 0 THEN 0 ELSE 1 END 'Position'
  FROM chatrooms
    INNER JOIN messages
      ON chatrooms.uuid = UUID
      AND chatrooms.id = messages.chatroom_id
    INNER JOIN message_texts
      ON message_texts.id = messages.messageable_id
    INNER JOIN profiles
      ON messages.profile_id = profiles.id
  WHERE message_texts.created_at BETWEEN StartTime AND EndTime
  AND message_texts.text LIKE Keyword;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_message_videos_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_message_videos_add`(OUT `@id` int, IN `@messageId` varchar(255), IN `@createdAt` datetime, IN `@updatedAt` datetime)
BEGIN

  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 寫入message_videos
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  INSERT INTO message_videos (message_id
  , type
  , created_at
  , updated_at)
    VALUES (`@messageId`, 'video', IFNULL(`@createdAt`, NOW()), IFNULL(`@updatedAt`, NOW()));

  SET `@id` = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_metrics_get_clients_tracking_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_metrics_get_clients_tracking_info`()
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/09/27
    -- Description : 取得客戶綁定統計資訊
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- 2023-10-16: art 修正封鎖且有客代的SQL語法
    -- ==========================================================================================
SELECT
    SUM(CASE WHEN (c.disabled = true OR u.role = 'ob.block') AND (c.customer_id > 0) THEN 1 ELSE 0 END) AS 'BindClientsBlocked',
    SUM(CASE WHEN c.disabled = true OR u.role = 'ob.block' THEN 1 ELSE 0 END) AS 'ClientsBlocked',
    SUM(CASE WHEN c.customer_id > 0 THEN 1 ELSE 0 END) AS 'BindClientsTotal',
    COUNT(c.id) AS 'ClientsTotal'
FROM clients c
         LEFT JOIN client_user cu ON cu.client_id = c.id
         LEFT JOIN users u ON cu.user_id = u.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_movies_update_published_at_by_templateMessageId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_movies_update_published_at_by_templateMessageId`(IN `@templateMessageId` int, IN `@published_at` datetime)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/30
  -- Description : 修改影片發佈日期
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE movies
  INNER JOIN v_imagemaps v
    ON movies.id = v.movie_id
  SET movies.published_at = `@published_at`
  WHERE v.template_message_id = `@templateMessageId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_images_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_images_add`(IN uuid varchar(50), IN path varchar(100), IN status tinyint, IN createdAt datetime, IN createdBy int, IN updatedAt datetime, IN updatedBy int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/02
  -- Description : 新增商品圖
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO product_images (uuid,
  path,
  status,
  created_at,
  created_by,
  updated_at,
  updated_by)
    VALUES (uuid, path, status, createdAt, createdBy, updatedAt, updatedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_images_map_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_images_map_add`(IN saleNo int, IN product_imageId varchar(50))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/02
  -- Description : 綁定商品與商品圖
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  INSERT INTO product_images_map (saleNo, product_imageId)
    VALUES (saleNo, product_imageId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_images_map_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_images_map_delete`(IN saleNo int, IN imageId varchar(50))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/22
  -- Description : 移除商品與商品圖對應關係
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  DELETE
    FROM product_images_map
  WHERE saleNo = saleNo
    AND product_imageId = imageId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_images_totalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_images_totalCount`(IN saleNo int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/30
  -- Description : 依 saleNo 獲取現有商品圖數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    COUNT(*) AS TotalCount
  FROM product_images_map map
    LEFT JOIN product_images image
      ON map.product_imageId = image.uuid
  WHERE map.saleNo = saleNo
  AND image.status = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_images_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_images_update`(IN uuid varchar(50), IN path varchar(100), IN status tinyint, IN updatedAt datetime, IN updatedBy int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/05
  -- Description : 更新商品圖
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  UPDATE product_images img
  SET path = IFNULL(path, img.path),
      status = IFNULL(status, img.status),
      updated_at = IFNULL(updatedAt, img.updated_at),
      updated_by = IFNULL(updatedBy, img.updated_by)
  WHERE img.uuid = uuid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_add`(IN saleNo int, IN name text CHARACTER SET UTF8MB4, IN description text CHARACTER SET UTF8MB4, IN keyword text CHARACTER SET UTF8MB4, IN status tinyint, IN created_at timestamp, IN created_by int, IN updated_at timestamp, IN updated_by int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/05/05
  -- Description : 新增商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO product_new (saleNo,
  name,
  description,
  keyword,
  status,
  created_at,
  created_by,
  updated_at,
  updated_by)
    VALUES (saleNo, name, description, keyword, status, created_at, created_by, updated_at, updated_by);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_add_v2`(IN inputSaleNo INT, IN name TEXT CHARACTER SET UTF8MB4, IN description TEXT CHARACTER SET UTF8MB4, IN keyword TEXT CHARACTER SET UTF8MB4, IN status TINYINT, IN created_at TIMESTAMP, IN created_by INT, IN updated_at TIMESTAMP, IN updated_by INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/05/05
  -- Description : 新增商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/11  -  yisu  - status=2(刪除), 如果又重新新增 => 更新狀態=停用, 及其他欄位更新
  -- ==========================================================================================
  DECLARE duplicate INT;
  SELECT COUNT(*) INTO duplicate FROM product_new WHERE product_new.saleNo = inputSaleNo AND product_new.status = 2;
  
  IF duplicate = 0 THEN 
    INSERT INTO product_new (
      saleNo,
      name,
      description,
      keyword,
      status,
      created_at,
      created_by,
      updated_at,
      updated_by
    )
    VALUES (
      inputSaleNo,
      name,
      description,
      keyword,
      status,
      created_at,
      created_by,
      updated_at,
      updated_by
    );
  ELSEIF duplicate = 1 THEN
    UPDATE product_new
    SET 
      status = 0,
      name = name,
      description = description,
      keyword = keyword,
      updated_by = updated_by,
      updated_at = updated_at
    WHERE product_new.saleNo = inputSaleNo;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_delete`(IN saleNo int, IN newstatus int, IN updatedBy int, IN updatedAt timestamp)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/05/18
  -- Description : 刪除商品(假刪除,改狀態)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE product_new
  SET status = newstatus,
      updated_by = updatedBy
  WHERE product_new.saleNo = saleNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_delete_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_delete_v2`(IN saleNo INT)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2024/01/17
  -- Description : 刪除商品(實際刪除)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
DELETE FROM product_new
WHERE product_new.saleNo = saleNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : yisu chen
  -- Create date : 2023/05/18
  -- Description : 取得所有商品資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023-06-12  -  yisu      - 增加撈選更新者名稱
  -- ==========================================================================================
  SELECT
    product.saleNo,
    product.name,
    product.description,
    product.keyword,
    product.status,
    product.updated_at AS UpdatedAt,
    users.name AS UpdatedUserName,
    GROUP_CONCAT(image.uuid) AS imageIds,
    GROUP_CONCAT(image.path) AS imageUrls
  FROM product_new product
    LEFT JOIN product_images_map map
      ON product.saleNo = map.saleNo
    LEFT JOIN product_images image
      ON map.product_imageId = image.uuid
    LEFT JOIN users
      ON product.updated_by = users.id
  GROUP BY product.saleNo
  ORDER BY product.created_at DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_product_new_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_product_new_update`(IN saleNo int, IN name text CHARACTER SET UTF8MB4, IN description text CHARACTER SET UTF8MB4, IN keyword text CHARACTER SET UTF8MB4, IN newstatus tinyint, IN updatedAt timestamp, IN updatedBy int)
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/05/18
  -- Description : 編輯商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE product_new
  SET name = name,
      description = description,
      keyword = keyword,
      status = newstatus,
      updated_at = updatedAt,
      updated_by = updatedBy
  WHERE product_new.saleNo = saleNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_profiles_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_profiles_add`(OUT Id int, IN LineUserId varchar(255), IN DisplayName text CHARACTER SET utf8mb4, IN PictureUrl varchar(255), IN StatusMessage text CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/25
  -- Description : create profiles
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023/05/25 [Ben] 調整參數為TEXT
  -- 2023/06/19 [art] 若資料存在就回傳 -1
  -- ==========================================================================================
  IF EXISTS (SELECT
        *
      FROM profiles
      WHERE line_user_id = LineUserId) THEN
    SET Id = -1;
  ELSE
    INSERT INTO profiles (line_user_id, display_name, picture_url, status_message)
      VALUES (LineUserId, DisplayName, PictureUrl, StatusMessage);

    SET Id = @@IDENTITY;
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_profiles_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_profiles_get`(IN ProfileId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/17
  -- Description : 取得Profile資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    profiles.id,
    profiles.line_user_id,
    profiles.display_name,
    profiles.picture_url,
    profiles.status_message,
    profiles.created_at,
    profiles.updated_at
  FROM profiles
  WHERE profiles.id = ProfileId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_profiles_get_by_lineUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_profiles_get_by_lineUserId`(IN lineUserId varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依據 lineUserId 取得 profile 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    line_user_id,
    display_name,
    picture_url,
    status_message,
    created_at,
    updated_at
  FROM profiles
  WHERE line_user_id = lineUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_profiles_get_by_profileId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_profiles_get_by_profileId`(IN profileId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/17
  -- Description : 取得 profile by id
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    line_user_id,
    display_name,
    picture_url,
    status_message,
    created_at,
    updated_at
  FROM profiles
  WHERE id = profileId;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_profiles_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_profiles_update`(IN Id int, IN DisplayName text CHARACTER SET utf8mb4, IN PictureUrl varchar(255), IN StatusMessage text CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben
  -- Create date : 2023/05/25
  -- Description : update profiles
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  UPDATE profiles
  SET display_name = DisplayName,
      picture_url = PictureUrl,
      status_message = StatusMessage,
      updated_at = NOW()
  WHERE profiles.id = Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_pushCount_by_tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_pushCount_by_tags`(IN `@tags` nvarchar(255))
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/30
  -- Description : 取得發送數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DROP TEMPORARY TABLE IF EXISTS `tmp_usp_pushCount_by_tags`;

  CREATE TEMPORARY TABLE `tmp_usp_pushCount_by_tags` (
    `tag` nvarchar(255) NOT NULL
  );

  IF (`@tags` != '') THEN
    SET @a = 0;
  simple_loop:
    LOOP
      SET @a = @a + 1;
      SET @str = SPLIT_STR(`@tags`, ',', @a);
      IF @str = '' THEN
        LEAVE simple_loop;
      END IF;
      INSERT INTO tmp_usp_pushCount_by_tags (`tag`)
        SELECT
          @str;
    END LOOP simple_loop;


    SELECT
      COUNT(*)
    FROM client_tags ct
      JOIN tmp_usp_pushCount_by_tags tmp
        ON ct.name = tmp.tag;
  ELSE

    SELECT
      COUNT(*)
    FROM v_clients_profiles vcp
      JOIN v_chatrooms_current vcr
        ON vcp.client_id = vcr.client_id;


  END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_repeat_days_leave_message_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_repeat_days_leave_message_get`(IN `@now` datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/17
  -- Description : 取得離線訊息設定
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  select lm.repeat_day_id,
         convert(r.type,SIGNED) as type,
         r.spacing,
         r.days,
         r.start_at,
         r.end_at,
         r.repeat_end_at,
         lm.content
  from repeat_days r
           inner join leave_msgs lm on r.id = lm.repeat_day_id
           inner join (
      select type, max(id) as max_id
      from repeat_days
      where (
                -- 取出目前有效的 repeatDay資料 (當前時間在 start_at , end_at 範圍之內)
                    (start_at <= `@now` and `@now` <= end_at)
                    -- 取出 type > 0 且未設定到期日(repeat_end_at)的資料
                    or (type > 0 and isnull(repeat_end_at))
                    -- 取出 type > 0 且尚未到期(now < repeat_end_at)的資料
                    or (type > 0 and `@now` <= repeat_end_at)
                )
      group by type
  ) t on r.type = t.type and r.id = t.max_id
  order by lm.repeat_day_id desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_master_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_master_create`(OUT Id INT, IN title NVARCHAR(100), IN status INT, IN createdAt TIMESTAMP, IN updatedAt TIMESTAMP, IN createdBy INT, IN updatedBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/06/30
-- Description : create richmenu master
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
    insert into rich_menu_master_new (title, status, created_at, updated_at, created_by, updated_by)
    values (title, status, createdAt, updatedAt, createdBy, updatedBy);

    SET Id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_master_getAll_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_master_getAll_v2`()
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/07/31
-- Description : get all master menus (不取得已刪除)
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

SELECT 
  master.id,
  master.title,
  master.status,
  master.created_at as createdAt,
  master.updated_at as updatedAt,
  master.created_by as createdBy,
  master.updated_by as updatedBy,
  createdUser.name AS createdUserName,
  updatedUser.name AS updatedUserName
FROM rich_menu_master_new master
LEFT JOIN users AS createdUser ON master.created_by = createdUser.id
LEFT JOIN users AS updatedUser ON master.updated_by = updatedUser.id
WHERE master.status != 0
ORDER BY createdAt DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_master_getById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_master_getById`(IN masterId INT)
BEGIN
SELECT 
  id,
  title,
  status,
  created_at as createdAt,
  updated_at as updatedAt,
  created_by as createdBy,
  updated_by as updatedBy
FROM rich_menu_master_new
WHERE id = masterId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_master_SetPublishedToPreparing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_master_SetPublishedToPreparing`()
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/08/02
-- Description : 目前 richmenu 只允許 1 組已發布, 所以新的發布後, 修改上一次發布 menu 的狀態, 
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
UPDATE rich_menu_master_new
  SET status = 1  -- 準備中
  WHERE status = 2; -- 已發布
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_master_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_master_update`(IN title NVARCHAR(100), IN masterId INT, IN userId INT, IN newStatus INT, IN updateTime TIMESTAMP)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/07/05
-- Description : update master menu
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

UPDATE rich_menu_master_new master
SET
  title = IF(title IS NOT NULL AND title != '', title, master.title),
  status = IF(newStatus IS NOT NULL, newStatus, master.status),
  updated_by = userId,
  updated_at = updateTime
WHERE id = masterId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_slave_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_slave_create`(OUT Id INT, IN masterId INT, IN barText NVARCHAR(255), IN imgPath VARCHAR(100), IN colActions MEDIUMTEXT CHARACTER SET utf8mb4, IN createdAt TIMESTAMP, IN updatedAt TIMESTAMP)
BEGIN -- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/06/30
-- Description : create richmenu slave
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
--               2024/01/30   - yisu       -  調整 colActions 字元集
-- ==========================================================================================
INSERT INTO rich_menu_slave_new (
    master_id,
    chatBarText,
    img,
    created_at,
    updated_at,
    colActions
)
VALUES
    (
        masterId,
        barText,
        imgPath,
        createdAt,
        updatedAt,
        colActions
    );

SET
    Id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_slave_getList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_slave_getList`(IN masterId INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/07/11
-- Description : 依 MasterId 取得對應的 Slave 清單
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
SELECT 
  id,
  master_id as masterId,
  chatBarText,
  img as imgPath,
  colActions,
  created_at as createdAt, 
  updated_at as updatedAt
FROM rich_menu_slave_new
WHERE master_id = masterId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_slave_remove` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_slave_remove`(IN slaveId INT, IN masterId INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/07/19
-- Description : 實際刪除 richemenu slave 資料
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  DELETE FROM rich_menu_slave_new
  WHERE id = slaveId AND master_id = masterId; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_richmenu_slave_upsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_richmenu_slave_upsert`(IN slaveId INT, IN masterId INT, IN barText NVARCHAR(255), IN imgPath VARCHAR(100), IN colActions MEDIUMTEXT CHARACTER SET utf8mb4, IN updateTime TIMESTAMP)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2023/07/06
-- Description : update richmenu slave 已有資料則更新,沒有則新增
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
--               2024/01/30   - yisu       -  調整 colActions 字元集
-- ==========================================================================================

  DECLARE rowCount INT;
  SELECT COUNT(*) INTO rowCount FROM rich_menu_slave_new WHERE id = slaveId AND master_id = masterId;
  IF rowCount > 0 THEN
    UPDATE
      rich_menu_slave_new
    SET
      chatBarText = barText,
      img = IF(imgPath IS NOT NULL AND imgPath != '', imgPath, rich_menu_slave_new.img),
      colActions = colActions,
      updated_at = updateTime
    WHERE
      id = slaveId AND master_id = masterId;
  ELSE
    INSERT INTO rich_menu_slave_new(master_id,chatBarText,img,colActions,created_at,updated_at)
    VALUES(masterId,barText,imgPath,colActions,updateTime,updateTime);
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_roles_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_roles_add`(IN Enable bit(1), IN Name nvarchar(50), IN Description nvarchar(200), IN Sort int(11), IN CreatedBy int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 新增角色
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO roles (roles.Enable
  , roles.Name
  , roles.Description
  , roles.Sort
  , roles.CreatedTime
  , roles.CreatedBy)
    VALUES (Enable, Name, Description, Sort, NOW(), CreatedBy);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_roles_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_roles_delete`(IN RoleId int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 刪除角色
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM roles
  WHERE Id = RoleId
  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_roles_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_roles_get`(IN `@RoleId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2023/11/08
  -- Description : 取得角色權限
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --
  -- ==========================================================================================


SELECT 
  Id,
  Enable,
  Name,
  Description,
  Sort,
  CreatedTime,
  CreatedBy,
  ModifiedTime,
  ModifiedBy 
FROM roles 
WHERE Id = `@RoleId`;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_roles_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_roles_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/27
  -- Description : 取得所有角色
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    Id,
    Enable,
    Name,
    Description,
    Sort,
    CreatedTime,
    CreatedBy,
    ModifiedTime,
    ModifiedBy
  FROM roles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_roles_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_roles_update`(IN RoleId int(11), IN Enable bit(1), IN Name nvarchar(50), IN Description nvarchar(200), IN Sort int(11), IN ModifiedBy int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 更新角色
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE roles
  SET roles.Enable = Enable,
      roles.Name = Name,
      roles.Description = Description,
      roles.Sort = Sort,
      roles.ModifiedTime = NOW(),
      roles.ModifiedBy = ModifiedBy
  WHERE roles.Id = RoleId
  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_role_functions_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_role_functions_add`(IN RoleId int(11), IN FunctionId int(11), IN AccessLevel int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 新增角色功能
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO role_functions (role_functions.RoleId
  , role_functions.FunctionId
  , role_functions.AccessLevel)
    VALUES (RoleId, FunctionId, AccessLevel);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_role_functions_deleteByRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_role_functions_deleteByRole`(IN RoleId int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 刪除角色功能BY RoleId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM role_functions
  WHERE role_functions.RoleId = RoleId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_role_functions_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_role_functions_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/27
  -- Description : 取得所有角色功能對應
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    RoleId,
    FunctionId,
    AccessLevel
  FROM role_functions;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stickers_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stickers_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/04/10
  -- Description : 取得所有貼圖
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023-05-03 - yisu - 表情貼圖開新表 (stickers_new), 不影響舊的
  --               2023-05-04 - yisu - 增加撈選 disabled = 0 條件
  -- ==========================================================================================

  SELECT
    id,
    package_id,
    sticker_id
  FROM stickers_new
  WHERE disabled = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_add`(IN Id VARCHAR(255), IN Name TEXT CHARACTER SET utf8mb4, IN Description TEXT CHARACTER SET utf8mb4, IN Link VARCHAR(255), IN Type SMALLINT, IN StartTime DATETIME, IN EndTime DATETIME, IN LiveStart DATETIME, IN LiveEnd DATETIME, IN CreatedTime DATETIME, IN CreatedBy INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_activity
  (
    id
   ,name
   ,description
   ,link
   ,type
   ,start_time
   ,end_time
   ,live_start
   ,live_end
   ,created_at
   ,created_by
  )
  VALUES
  (
    Id
   ,Name
   ,Description
   ,Link
   ,Type
   ,StartTime
   ,EndTime
   ,LiveStart
   ,LiveEnd
   ,CreatedTime
   ,CreatedBy
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_add_v2`(IN Id VARCHAR(255), IN Name TEXT CHARACTER SET utf8mb4, IN Description TEXT CHARACTER SET utf8mb4, IN Link VARCHAR(255), IN Type SMALLINT, IN StartTime DATETIME, IN EndTime DATETIME, IN LiveStart DATETIME, IN LiveEnd DATETIME, IN CreatedTime DATETIME, IN CreatedBy int, IN IsLimitConsumer bit)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/26   - Nick Huang - 新增客群限制類型欄位(is_limit_consumer)
  -- ====================================================== ====================================

  INSERT INTO stream_activity
  (
    id
   ,name
   ,description
   ,link
   ,type
   ,start_time
   ,end_time
   ,live_start
   ,live_end
   ,created_at
   ,created_by
   ,is_limit_consumer
  )
  VALUES
  (
    Id
   ,Name
   ,Description
   ,Link
   ,Type
   ,StartTime
   ,EndTime
   ,LiveStart
   ,LiveEnd
   ,CreatedTime
   ,CreatedBy
   ,IsLimitConsumer
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_get`(IN Id VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky HoA
  -- Create date : 2023/09/14
  -- Description : 取得直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/26   - Nick Huang - 新增客群限制類型欄位(is_limit_consumer)
  -- ==========================================================================================

  SELECT
    id,
    name,
    description,
    link,
    is_limit_consumer,
    type,
    start_time,
    end_time,
    live_start,
    live_end,
    created_at,
    created_by,
    updated_at,
    updated_by,
    disable
  FROM stream_activity
  WHERE stream_activity.id = Id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_getall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_getall`(IN Skip INT, IN Take INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 取得直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/20     Ricky Ho     新增姓名欄位
  --               2023/10/26   - Nick Huang - 新增客群限制類型欄位(is_limit_consumer)
  -- ==========================================================================================

  SELECT
    stream_activity.id,
    stream_activity.name,
    stream_activity.description,
    stream_activity.link,
    stream_activity.is_limit_consumer,
    stream_activity.type,
    stream_activity.start_time,
    stream_activity.end_time,
    stream_activity.live_start,
    stream_activity.live_end,
    stream_activity.created_at,
    stream_activity.created_by,
    stream_activity.updated_at,
    stream_activity.updated_by,
    disable,
    createuser.name AS 'CreateUser',
    updateuser.name AS 'UpdateUser'
  FROM stream_activity
  LEFT JOIN users AS createuser
  ON stream_activity.created_by = createuser.id
  LEFT JOIN users AS updateuser
  ON stream_activity.updated_by = updateuser.id
  ORDER BY created_at DESC
  LIMIT Skip, Take; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_getall_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_getall_v2`(IN `@Skip` INT, IN `@Take` INT,IN `@Keyword` nvarchar(255), IN `@IsGetEndData` bit, OUT `@Total` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 取得直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/20     Ricky Ho     新增姓名欄位
  --               2023/10/26   - Nick Huang - 新增客群限制類型欄位(is_limit_consumer)
  --               2023/11/17   - Nick Huang - 新增關鍵字查詢、新增是否查詢已結束的直播活動checkbox
  --               2024/01/17   - Nick Huang - 新增活動直播總觀看人數
  -- ==========================================================================================

  -- 取得總筆數
  SET `@Total` = (SELECT
      COUNT(id)
      FROM stream_activity
      WHERE (
          `@Keyword` = '' OR 
          stream_activity.name LIKE CONCAT('%', `@Keyword`, '%')
        ) 
        AND
        (
          `@IsGetEndData` = 1 OR 
          stream_activity.end_time > NOW()
        )
  );


  SELECT
    stream_activity.id,
    stream_activity.name,
    stream_activity.description,
    stream_activity.link,
    stream_activity.is_limit_consumer,
    stream_activity.type,
    stream_activity.start_time,
    stream_activity.end_time,
    stream_activity.live_start,
    stream_activity.live_end,
    stream_activity.created_at,
    stream_activity.created_by,
    stream_activity.updated_at,
    stream_activity.updated_by,
    disable,
    createuser.name AS 'CreateUser',
    updateuser.name AS 'UpdateUser',
    IFNULL(log.viewers, 0) AS 'viewers'
  FROM stream_activity
	LEFT JOIN users AS createuser
  ON stream_activity.created_by = createuser.id
	LEFT JOIN users AS updateuser
  ON stream_activity.updated_by = updateuser.id
	LEFT JOIN (
    SELECT activity_id, COUNT(DISTINCT line_user_id) AS 'viewers'
    FROM stream_log
    GROUP BY activity_id
  ) AS log
  ON stream_activity.id = log.activity_id
  WHERE (
      `@Keyword` = '' OR 
      stream_activity.name LIKE CONCAT('%', `@Keyword`, '%')
    ) 
    AND
    (
      `@IsGetEndData` = 1 OR 
      stream_activity.end_time > NOW()
    )
  ORDER BY created_at DESC
  LIMIT `@Skip`, `@Take`; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_update`(IN Id VARCHAR(255), IN Name TEXT CHARACTER SET utf8mb4, IN Description TEXT CHARACTER SET utf8mb4, IN Link VARCHAR(255), IN Type SMALLINT, IN StartTime DATETIME, IN EndTime DATETIME, IN LiveStart DATETIME, IN LiveEnd DATETIME, IN UpdatedTime DATETIME, IN UpdatedBy INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 修改直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE stream_activity 
  set
    stream_activity.name = Name
   ,stream_activity.description = Description
   ,stream_activity.link = Link
   ,stream_activity.type = Type
   ,stream_activity.start_time = StartTime
   ,stream_activity.end_time = EndTime
   ,stream_activity.live_start = LiveStart
   ,stream_activity.live_end = LiveEnd
   ,stream_activity.updated_at = UpdatedTime
   ,stream_activity.updated_by = UpdatedBy
  WHERE
    stream_activity.id = Id
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_activity_update_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_activity_update_v2`(IN Id VARCHAR(255), IN Name TEXT CHARACTER SET utf8mb4, IN Description TEXT CHARACTER SET utf8mb4, IN Link VARCHAR(255), IN Type SMALLINT, IN StartTime DATETIME, IN EndTime DATETIME, IN LiveStart DATETIME, IN LiveEnd DATETIME, IN UpdatedTime DATETIME, IN UpdatedBy INT, IN IsLimitConsumer bit)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 修改直播活動
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/26   - Nick Huang - 新增客群限制類型欄位(is_limit_consumer)
  -- ==========================================================================================

  UPDATE stream_activity 
  set
    stream_activity.name = Name
   ,stream_activity.description = Description
   ,stream_activity.link = Link
   ,stream_activity.type = Type
   ,stream_activity.start_time = StartTime
   ,stream_activity.end_time = EndTime
   ,stream_activity.live_start = LiveStart
   ,stream_activity.live_end = LiveEnd
   ,stream_activity.updated_at = UpdatedTime
   ,stream_activity.updated_by = UpdatedBy
   ,stream_activity.is_limit_consumer = IsLimitConsumer
  WHERE
    stream_activity.id = Id
  ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_admin_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_admin_add`(IN ClientId INT, IN LineUserId VARCHAR(255), IN CreatedTime DATETIME, IN CreatedBy INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/23
  -- Description : 新增直播管理員
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_admin
  (client_id, line_user_id, created_at, created_by)
  VALUES(ClientId, LineUserId, CreatedTime, CreatedBy);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_admin_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_admin_delete`(IN ClientId INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/23
  -- Description : 刪除直播管理員
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE FROM stream_admin
  WHERE client_id = ClientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_admin_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_admin_get`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/23
  -- Description : 取得直播管理員
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT 
    stream_admin.client_id,
    stream_admin.line_user_id,
    clients.nickname,
    profiles.picture_url,
    stream_admin.created_at
  FROM stream_admin
  LEFT JOIN clients
  ON stream_admin.client_id = clients.id
  LEFT JOIN profiles
  ON clients.profile_id = profiles.id
  ORDER BY stream_admin.created_at DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_log_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_log_add`(IN ActivityId VARCHAR(255), IN LineUserId VARCHAR(255), IN Type SMALLINT, IN CreatedTime DATETIME)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/22
  -- Description : 新增直播紀錄
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_log
  (
    activity_id
   ,line_user_id
   ,type
   ,created_at
  )
  VALUES
  (
    ActivityId
   ,LineUserId
   ,Type
   ,CreatedTime
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_log_getreport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_log_getreport`(IN ActivityId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/20
  -- Description : 取得直播觀看報表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    stream_log.line_user_id,
    clients.customer_id,
    IFNULL(profiles.display_name, stream_log.line_user_id) AS 'display_name',
    stream_log.created_at
  FROM stream_log
    LEFT JOIN profiles
    ON stream_log.line_user_id = profiles.line_user_id
    LEFT JOIN clients
    ON profiles.id = clients.profile_id
  WHERE activity_id = ActivityId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_add`(IN ActivityId VARCHAR(255), IN LineUserId VARCHAR(255), IN ProfileId INT, IN Text TEXT CHARACTER SET utf8mb4, IN CreatedTime DATETIME)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/20
  -- Description : 新增直播訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_message
  (
    activity_id
   ,line_user_id
   ,profile_id
   ,text
   ,created_at
  )
  VALUES
  (
    ActivityId
   ,LineUserId
   ,ProfileId
   ,Text
   ,CreatedTime
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_add_V2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_add_V2`(OUT Id BIGINT, IN ActivityId VARCHAR(255), IN LineUserId VARCHAR(255), IN ProfileId INT, IN Text TEXT CHARACTER SET utf8mb4, IN CreatedTime DATETIME, IN ParentId BIGINT, IN Type SMALLINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/23
  -- Description : 新增直播訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_message
  (
    activity_id
   ,line_user_id
   ,profile_id
   ,text
   ,created_at
   ,parent_id
   ,type
  )
  VALUES
  (
    ActivityId
   ,LineUserId
   ,ProfileId
   ,Text
   ,CreatedTime
   ,ParentId
   ,Type
  );

  SET Id = @@IDENTITY;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_add_V3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_add_V3`(OUT Id BIGINT, IN ActivityId VARCHAR(255), IN LineUserId VARCHAR(255), IN ProfileId INT, IN Text TEXT CHARACTER SET utf8mb4, IN CreatedTime DATETIME, IN ParentId BIGINT, IN Type SMALLINT, IN SendType TINYINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/23
  -- Description : 新增直播訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
--                  2024/02/20		Nick Huang	  新增訊息發送類型
  -- ==========================================================================================

  INSERT INTO stream_message
  (
    activity_id
   ,line_user_id
   ,profile_id
   ,text
   ,created_at
   ,parent_id
   ,type
   ,send_type
  )
  VALUES
  (
    ActivityId
   ,LineUserId
   ,ProfileId
   ,Text
   ,CreatedTime
   ,ParentId
   ,Type
   ,SendType
  );

  SET Id = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_get`(IN ActivityId VARCHAR(255), IN MessageId BIGINT, IN `Count` INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/20
  -- Description : 取得直播訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/10/23     Ricky Ho     回覆的主訊息
  --               2023/10/26     Ricky Ho     訊息類型
  --               2023/10/30     Nick Huang   增加父訊息代碼與使用者名稱
  --               2023/11/29     Nick Huang   增加父訊息的Type與父訊息頭像連結
  --               2023/12/01     Nick Huang   增加 line user id
  -- ==========================================================================================

  SELECT
    stream_message.id,
    stream_message.text,
    stream_message.created_at,
    IFNULL(profiles.display_name, stream_message.line_user_id) AS 'display_name',
    profiles.picture_url,
    stream_message.parent_id,    
    IFNULL(parent_profiles.display_name, parent_message.line_user_id) AS 'parent_display_name',
    parent_message.text AS 'parent',
    stream_message.type,
    parent_message.type AS 'parent_type',
    parent_profiles.picture_url AS 'parent_picture_url',
    stream_message.line_user_id
  FROM stream_message
    LEFT JOIN profiles
    ON stream_message.profile_id = profiles.id
    LEFT JOIN stream_message AS parent_message
    ON stream_message.parent_id = parent_message.id
    LEFT JOIN profiles AS parent_profiles 
    ON parent_message.profile_id = parent_profiles.id
  WHERE stream_message.activity_id = ActivityId
   AND  (MessageId = 0 OR stream_message.id < MessageId)
  ORDER BY stream_message.id DESC
  LIMIT Count;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_getreport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_getreport`(IN ActivityId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/10/20
  -- Description : 取得直播訊息報表
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/02/27     Nick Huang   過濾已被刪除的訊息
  -- ==========================================================================================

  SELECT
    stream_message.line_user_id,
    clients.customer_id,
    IFNULL(profiles.display_name, stream_message.line_user_id) AS 'display_name',
    stream_message.text,
    stream_message.created_at
  FROM stream_message
    LEFT JOIN profiles
    ON stream_message.profile_id = profiles.id
    LEFT JOIN clients
    ON profiles.id = clients.profile_id
  WHERE activity_id = ActivityId
    AND stream_message.is_del = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_get_single` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_get_single`(IN ActivityId VARCHAR(255), IN MessageId BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2023/10/30
  -- Description : 取得單筆直播訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/11/29     Nick Huang   增加父訊息的Type與父訊息頭像連結
  --               2023/12/01     Nick Huang   增加 line user id
  --               2024/02/27     Nick Huang   過濾已被刪除的訊息
  -- ==========================================================================================

  SELECT
    stream_message.id,
    stream_message.text,
    stream_message.created_at,
    IFNULL(profiles.display_name, stream_message.line_user_id) AS 'display_name',
    profiles.picture_url,
    stream_message.parent_id,    
    IFNULL(parent_profiles.display_name, parent_message.line_user_id) AS 'parent_display_name',
    parent_message.text AS 'parent',
    stream_message.type,
    parent_message.type AS 'parent_type',
    parent_profiles.picture_url AS 'parent_picture_url',
    stream_message.line_user_id
  FROM stream_message
    LEFT JOIN profiles
    ON stream_message.profile_id = profiles.id
    LEFT JOIN stream_message AS parent_message
    ON stream_message.parent_id = parent_message.id
    LEFT JOIN profiles AS parent_profiles 
    ON parent_message.profile_id = parent_profiles.id
  WHERE stream_message.activity_id = ActivityId
   AND  stream_message.id = MessageId
   AND stream_message.is_del = 0
   AND parent_message.is_del = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_record_getLineUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_record_getLineUserId`(IN txKey VARCHAR(50), IN streamId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : yisu
  -- Create date : 2023/12/12
  -- Description : 依上傳至 audience_temp 資料, 篩選 stream_message_record 當日尚未發送的 Line 使用者 Id
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT p.line_user_id
  FROM clients AS c
  INNER JOIN audience_temp AS a ON c.customer_id = a.customer_id
  INNER JOIN profiles AS p ON c.profile_id = p.id
  WHERE a.tx_key = txKey
  AND NOT EXISTS (
          SELECT 1 FROM stream_message_record 
          WHERE stream_message_record.client_id = c.id
          AND stream_message_record.stream_id = streamId
          AND DATE(stream_message_record.created_at) = CURDATE()
      );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_message_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_message_update`(IN `@MessageId` BIGINT(20), IN `@UpdateProfileId` INT(11) , IN `@UpdateTime` DATETIME, IN `@IsDel` BIT)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2024/02/27
  -- Description : 直播聊天室-更新訊息資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               
  -- ==========================================================================================

	UPDATE stream_message 
    SET is_del = `@IsDel`, update_at = `@UpdateTime`, update_by = `@UpdateProfileId` 
  WHERE 
     id = `@MessageId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_phrase_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_phrase_add`(IN ActivityId VARCHAR(255), IN Phrase TEXT CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動快速片語
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_phrase
  (
    activity_id
   ,phrase
  )
  VALUES
  (
    ActivityId
   ,Phrase
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_phrase_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_phrase_add_v2`(IN ActivityId VARCHAR(255), IN Phrase TEXT CHARACTER SET utf8mb4, IN IsNoticeAgent BIT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動快速片語
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/17     Nick Huang   增加「是否通知專員」欄位
  -- ==========================================================================================

  INSERT INTO stream_phrase
  (
    activity_id
   ,phrase
   ,is_notice_agent
  )
  VALUES
  (
    ActivityId
   ,Phrase
   ,IsNoticeAgent
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_phrase_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_phrase_delete`(IN ActivityId VARCHAR(255), IN Text TEXT CHARACTER SET utf8mb4)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 刪除直播活動快速片語
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE FROM stream_phrase
  WHERE stream_phrase.activity_id = ActivityId AND stream_phrase.phrase = Text;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_phrase_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_phrase_get`(IN ActivityId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 取得直播活動快速片語
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/17     Nick Huang   增加「是否通知專員」欄位
  -- ==========================================================================================

  SELECT phrase, is_notice_agent AS 'IsNoticeAgent'
  FROM stream_phrase
  WHERE stream_phrase.activity_id = ActivityId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_add`(IN ActivityId VARCHAR(255), IN SaleNo BIGINT, IN Link VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO stream_product
  (
    activity_id
   ,sale_no
   ,link
  )
  VALUES
  (
    ActivityId
   ,SaleNo
   ,Link
  );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_add_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_add_v2`(IN `@ActivityId` VARCHAR(255), IN `@SaleNo` BIGINT, IN `@Link` VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 新增直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/15     Nick Huang   新增產品排序欄位
  -- ==========================================================================================

  INSERT INTO stream_product
  (
    activity_id
   ,sale_no
   ,link
   ,sort
  )
  SELECT `@ActivityId`, `@SaleNo`, `@Link`, IFNULL(MAX(stream_product.sort), 0) + 1 FROM stream_product WHERE activity_id = `@ActivityId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_delete`(IN ActivityId VARCHAR(255), IN SaleNo BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 刪除直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE FROM stream_product
  WHERE stream_product.activity_id = ActivityId AND stream_product.sale_no = SaleNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_get`(IN ActivityId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 取得直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/15     Nick Huang   新增產品排序
  -- ==========================================================================================

  SELECT
    sale_no,
    link,
	sort
  FROM stream_product
  WHERE stream_product.activity_id = ActivityId
  ORDER BY stream_product.sort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_getinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_getinfo`(IN ActivityId VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/19
  -- Description : 取得直播商品資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/15     Nick Huang   查詢產品排序
  -- ==========================================================================================

  SELECT
    sp.sale_no,
    ANY_VALUE(sp.link) AS link,
    product.name,
    product.description,
	sp.sort,
    GROUP_CONCAT(image.path) AS imagePath
  FROM stream_product sp
    INNER JOIN product_new product
      ON sp.sale_no = product.saleNo
    LEFT JOIN product_images_map map
      ON product.saleNo = map.saleNo
    LEFT JOIN product_images image
      ON map.product_imageId = image.uuid
  WHERE sp.activity_id = ActivityId
    AND product.status = 1
  GROUP BY product.saleNo, sp.sort, product.name, product.description
  ORDER BY sp.sort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_getinfo_single` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_getinfo_single`(IN `@ActivityId` VARCHAR(255), IN `@SaleNo` BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2024/01/16
  -- Description : 取得直播單一商品詳細資訊
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    sp.sale_no,
    ANY_VALUE(sp.link) AS link,
    product.name,
    product.description,
	sp.sort,
    GROUP_CONCAT(image.path) AS imagePath
  FROM stream_product sp
    INNER JOIN product_new product
      ON sp.sale_no = product.saleNo
    LEFT JOIN product_images_map map
      ON product.saleNo = map.saleNo
    LEFT JOIN product_images image
      ON map.product_imageId = image.uuid
  WHERE sp.activity_id = `@ActivityId` 
	AND sp.sale_no = `@SaleNo`
    AND product.status = 1
  GROUP BY product.saleNo, sp.sort, product.name, product.description
  ORDER BY sp.sort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_get_single` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_get_single`(IN `@ActivityId` VARCHAR(255), IN `@SaleNo` BIGINT)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2024/01/15
  -- Description : 取得直播活動單一商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
	activity_id,
    sale_no,
    link,
	sort
  FROM stream_product
  WHERE stream_product.activity_id = `@ActivityId` AND stream_product.sale_no = `@SaleNo`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_update`(IN ActivityId VARCHAR(255), IN SaleNo BIGINT, IN Link VARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 修改直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE stream_product 
  SET stream_product.link = Link
  WHERE stream_product.activity_id = ActivityId AND stream_product.sale_no = SaleNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_stream_product_update_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_stream_product_update_v2`(IN ActivityId VARCHAR(255), IN SaleNo BIGINT, IN Link VARCHAR(255), IN Sort INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/09/14
  -- Description : 修改直播活動商品
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2024/01/15     Nick Huang   更新產品排序
  -- ==========================================================================================

  UPDATE stream_product 
  SET stream_product.link = Link, stream_product.sort = Sort
  WHERE stream_product.activity_id = ActivityId AND stream_product.sale_no = SaleNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tags_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tags_add`(IN Type int, IN Name nvarchar(255), IN Description nvarchar(255), IN CreatedBy int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 新增標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO tags (type
  , name
  , description
  , created_by
  , created_at)
    VALUES (Type, Name, Description, CreatedBy, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tags_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tags_delete`(IN Id int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 刪除標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM tags
  WHERE tags.id = Id;

  DELETE
    FROM client_tag
  WHERE client_tag.tagid = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tags_getall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tags_getall`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 取得所有標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    id,
    type,
    name,
    description,
    tags.created_by,
    tags.created_at,
    updated_by,
    updated_at,
    COUNT(client_tag.tagid) 'count'
  FROM tags
    LEFT OUTER JOIN client_tag
      ON tags.id = client_tag.tagid
  GROUP BY id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tags_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tags_update`(IN Id int, IN Name nvarchar(255), IN Description nvarchar(255), IN UpdatedBy int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ricky Ho
  -- Create date : 2023/04/25
  -- Description : 修改標籤
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE tags
  SET tags.name = Name,
      tags.description = Description,
      tags.updated_by = UpdatedBy,
      tags.updated_at = NOW()
  WHERE tags.id = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tasks_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tasks_get`(IN `@taskId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/22
  -- Description : 取得排定的 tasks
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  SELECT
    id,
    ready,
    sent,
    tags,
    reservation_time,
    msg_sent,
    msg_total,
    line_api_output,
    created_at,
    updated_at
  FROM tasks
  WHERE id = `@taskId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tasks_get_by_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tasks_get_by_time`(IN `@now` datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依時間取得排定的 tasks
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

  SELECT
    id,
    ready,
    sent,
    tags,
    reservation_time,
    msg_sent,
    msg_total,
    line_api_output,
    created_at,
    updated_at
  FROM tasks
  WHERE sent = 0
  AND ready = 1
  AND reservation_time <= DATE_FORMAT(`@now`, '%Y-%m-%d %H:%i:00');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tasks_update_msg_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tasks_update_msg_count`(IN `@taskId` int, IN `@msg_sent` int, IN `@msg_total` int, IN `@line_rid` varchar(50))
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne Chen
  -- Create date : 2023/03/29
  -- Description : 修改任務發送數量
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE tasks
  SET msg_sent = `@msg_sent`,
      msg_total = `@msg_total`,
      line_rid = `@line_rid`
  WHERE id = `@taskId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_tasks_update_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_tasks_update_status`(IN `@taskId` int, IN `@status` int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/22
  -- Description : 修改任務發送狀態
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  UPDATE tasks
  SET sent = `@status`
  WHERE id = `@taskId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_templates_get_by_template_message_ids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_templates_get_by_template_message_ids`(IN ids varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/22
  -- Description : 取得訊息
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  DROP TEMPORARY TABLE IF EXISTS `tmp_templates_get_by_template_message_ids`;

  CREATE TEMPORARY TABLE `tmp_templates_get_by_template_message_ids` (
    `id` int NOT NULL AUTO_INCREMENT,
    `templateMessageId` int NOT NULL,
    `parameter` varchar(20) NOT NULL,
    PRIMARY KEY (`id`)
  );


  IF (ids != '') THEN
    SET @a = 0;
  simple_loop:
    LOOP
      SET @a = @a + 1;
      SET @str = SPLIT_STR(ids, ',', @a);
      IF @str = '' THEN
        LEAVE simple_loop;
      END IF;
      INSERT INTO tmp_templates_get_by_template_message_ids (`templateMessageId`, `parameter`)
        SELECT
          @str,
          'templateMessageId';
    END LOOP simple_loop;
  END IF;

  SELECT
    id,
    task_id,
    type,
    img,
    url,
    txt,
    template_message_id
  FROM templates
  WHERE template_message_id IN (SELECT
      templateMessageId
    FROM tmp_templates_get_by_template_message_ids
    WHERE parameter = 'templateMessageId');
-- ==========================================================================================
-- example:
-- call usp_templates_get_by_template_message_ids('41');
-- call usp_templates_get_by_template_message_ids('41,42');
-- call usp_templates_get_by_template_message_ids('41,42,43');
-- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_template_messages_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_template_messages_get`(IN `@taskId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/22
  -- Description : 取得訊息範本
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================
  SELECT
    id,
    task_id,
    group_template_message_id,
    group_template_message_sort,
    thumbnailImageUrl,
    headline,
    title,
    text,
    altText,
    type,
    option_display_type,
    option_type,
    snapshot,
    is_reserved,
    status,
    created_at,
    updated_at
  FROM template_messages
  WHERE status = 1
  AND task_id = `@taskId`
  ORDER BY group_template_message_sort;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_template_messages_get_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_template_messages_get_by_id`(IN templateMessageId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/20
  -- Description : 取得 templateMessage
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    task_id,
    group_template_message_id,
    group_template_message_sort,
    thumbnailImageUrl,
    headline,
    title,
    text,
    altText,
    type,
    option_display_type,
    option_type,
    snapshot,
    is_reserved,
    status,
    created_at,
    updated_at
  FROM template_messages
  WHERE id = templateMessageId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_template_message_actions_columns_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_template_message_actions_columns_get`(IN `@templateMessageId` int)
BEGIN

  SELECT
    template_message_actions_id,
    template_message_column_id,
    template_message_id,
    action_type,
    label,
    data,
    uri,
    text,
    response,
    tag,
    column_thumbnailImageUrl,
    column_imageUrl,
    column_title,
    column_text,
    column_option_type
  FROM superline.v_template_message_actions_columns
  WHERE template_message_id = `@templateMessageId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_add`(OUT id int,
IN profileId int,
IN `@account` varchar(255),
IN `@name` nvarchar(255),
IN `@phone` varchar(255),
IN `@email` varchar(255),
IN `@password` varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/30
  -- Description : 新增 users
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO users (profile_id, account, name, phone, email, password, remember_token)
    VALUES (profileId, `@account`, `@name`, `@phone`, `@email`, `@password`, '');

  SET id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_checkPendingList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_checkPendingList`()
BEGIN
  -- ==========================================================================================
  -- Author      : Yisu
  -- Create date : 2023/08/22
  -- Description : 取得所有待確認使用者 (3個月無登入紀錄)
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --                2023-10-11  -  yisu      -  只檢查 role=agent 的使用者
  -- ==========================================================================================
  SELECT 
    id,
    profile_id,
    account,
    name,
    phone,
    email,
    disabled
  FROM users AS u
  LEFT JOIN login_log AS log ON log.user_id = u.id
  LEFT JOIN user_pending AS pending ON u.id = pending.userId
  WHERE disabled = 0 
  AND u.role = 'agent'
  AND (log.login_date IS NULL OR log.login_date <= DATE_SUB(NOW(),INTERVAL 3 MONTH))
  AND pending.userId IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_getAll_v2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_getAll_v2`(IN Keyword nvarchar(255), IN Offset int, IN PageSize int, OUT Total int)
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/05/19
  -- Description : 取得所有使用者 增加分頁
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- 2023-07-21 [art]   : 取得更新時間 updated_at
  -- 2023-09-28 [wayne] : 取得權限群組 role
  -- 2023-11-08 [Nick Huang] : 新增 Keyword 可查詢 Email, 移除沒用到的 select count 欄位 
  -- ==========================================================================================

  SET Total := (SELECT
      COUNT(*)
    FROM users
    WHERE (Keyword = ''
    OR name LIKE CONCAT('%', Keyword, '%')
	OR email LIKE CONCAT('%', Keyword, '%')));

  SELECT
    result.*
  FROM (SELECT
      @rownum := @rownum + 1 AS rownum,
      id,
      profile_id,
      account,
      name,
      phone,
      email,
      role,
      disabled,
      updated_at
    FROM users,
         (SELECT
             @rownum := 0) r
    WHERE (Keyword = ''
    OR name LIKE CONCAT('%', Keyword, '%')
	OR email LIKE CONCAT('%', Keyword, '%'))
    ORDER BY id) result
  WHERE result.rownum > Offset
  LIMIT PageSize;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_getByAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_getByAccount`(IN Account varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/20
  -- Description : 會員登入
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    id,
    profile_id,
    account,
    name,
    role,
    phone,
    email,
    password,
    disabled,
    remember_token,
    login_source,
    created_at,
    updated_at
  FROM users
  WHERE users.account = Account
  LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_account`(IN accountName varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/30
  -- Description : 依據 account name 取得 user
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    profile_id,
    account,
    name,
    role,
    phone,
    email,
    password,
    disabled,
    remember_token,
    login_source,
    created_at,
    updated_at
  FROM users
  WHERE account = accountName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_clientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_clientId`(IN clientId INT)
BEGIN

  -- ==========================================================================================
  -- Author      : Wayne
  -- Create date : 2023/11/10
  -- Description : 依據 clientId 取得 user
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================

    SELECT
    u.id,
    u.profile_id,
    u.account,
    u.name,
    u.role,
    u.phone,
    u.email,
    u.password,
    u.disabled,
    u.remember_token,
    u.login_source,
    u.created_at,
    u.updated_at
  FROM users u
  INNER JOIN client_user cu on u.id=cu.user_id
  WHERE cu.client_id = clientId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_condition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_condition`(IN rowNumber int, IN pageSize int, IN keyword nvarchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/05/04
  -- Description : search users by condition
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SET @cnt := (SELECT
      COUNT(*)
    FROM users
    WHERE name <> ''
    AND (keyword = ''
    OR name LIKE CONCAT('%', keyword, '%')
    OR account LIKE CONCAT('%', keyword, '%')
    OR phone LIKE CONCAT('%', keyword, '%')
    ));

  SELECT
    *
  FROM (SELECT
      @cnt AS count,
      @rownum := @rownum + 1 AS rownum,
      id,
      name,
      account,
      phone
    FROM users,
         (SELECT
             @rownum := 0) r
    WHERE name <> ''
    AND (keyword = ''
    OR name LIKE CONCAT('%', keyword, '%')
    OR account LIKE CONCAT('%', keyword, '%')
    OR phone LIKE CONCAT('%', keyword, '%')
    )

    ORDER BY id) result
  WHERE result.rownum > rowNumber
  LIMIT pageSize;

-- ==========================================================================================
-- example:
-- call usp_users_get_by_condition(0,5,'%%');
-- call usp_users_get_by_condition(0,5,'%155%');
-- call usp_users_get_by_condition(0,5,'%文%');
-- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_name`(IN AgentName NVARCHAR(255))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben
  -- Create date : 2023/07/21
  -- Description : 取得使用者
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    profile_id,
    account,
    name,
    role,
    phone,
    email,
    password,
    disabled,
    remember_token,
    login_source,
    created_at,
    updated_at
  FROM users
  WHERE name = AgentName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_role`(IN roleName varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/30
  -- Description : 依據 role name 取得 user
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    profile_id,
    account,
    name,
    role,
    phone,
    email,
    password,
    disabled,
    remember_token,
    login_source,
    created_at,
    updated_at
  FROM users
  WHERE role = roleName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_get_by_userId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_get_by_userId`(IN userId int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/03/29
  -- Description : 依據 userId 取得 user
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    profile_id,
    account,
    name,
    role,
    phone,
    email,
    password,
    disabled,
    remember_token,
    login_source,
    created_at,
    updated_at
  FROM users
  WHERE id = userId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_update`(IN `@id` int, IN `@name` nvarchar(255), IN `@phone` varchar(255))
BEGIN
  -- ==========================================================================================
  -- Author      : art.huang
  -- Create date : 2023/07/17
  -- Description : 修改使用者
  -- Update List : [UpdateTime] - [UpdateBy] - [Description
  -- ==========================================================================================

  UPDATE users u
  set u.name = `@name`,
      u.phone = `@phone`
  WHERE u.id = `@id`;
-- =====================================================================================
-- example:
-- call usp_users_update(31, 'art', '1530');
-- =====================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_users_update_disabled` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_users_update_disabled`(IN `@userId` INT, IN `@isDisabled` INT, IN `@updatedAt` TIMESTAMP)
BEGIN
  -- ==========================================================================================
  -- Author      : art.huang
  -- Create date : 2023/07/17
  -- Description : 變更 User 狀態為啟用或停用
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --               2023/09/01  -  Yisu  -  增加更新時間                   
  -- ==========================================================================================

  UPDATE users u
  set 
    u.disabled = `@isDisabled`,
    u.updated_at = `@updatedAt`
  WHERE u.id = `@userId`;
  -- =====================================================================================
-- example:
-- call usp_users_update_disabled(31, 0, now());
-- =====================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_pending_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_pending_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Yisu
  -- Create date : 2023/08/24
  -- Description : 取得待確認使用者清單(不含已刪除(type=2))
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT 
    user.id,
    pending.type,
    user.account,
    user.name,
    user.phone,
    user.email,
    pending.updated_at as updatedAt,
    pending.updated_by,
    updatedUser.name as updatedName
  FROM user_pending pending
  LEFT JOIN users user ON id = userId
  LEFT JOIN users AS updatedUser ON pending.updated_by = updatedUser.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_pending_revoke` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_pending_revoke`(IN userId int)
BEGIN
  -- ==========================================================================================
  -- Author      : Yisu
  -- Create date : 2023/08/24
  -- Description : 移除待確認資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  DELETE FROM user_pending
  WHERE user_pending.userId = userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_pending_upsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_pending_upsert`(IN userId INT, IN pendingType INT, IN updatedTime TIMESTAMP, IN updatedBy INT)
BEGIN
  -- ==========================================================================================
  -- Author      : Yisu
  -- Create date : 2023/08/22
  -- Description : 新增或更新 user_pending 資料
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  DECLARE rowCount INT;

  SELECT COUNT(*) INTO rowCount FROM user_pending WHERE user_pending.userId = userId;
  
IF rowCount > 0 THEN
  UPDATE
    user_pending
  SET
    type = pendingType,
    updated_at = updatedTime,
    updated_by = updatedBy
  WHERE
    user_pending.userId = userId;
ELSE
  INSERT INTO
    user_pending(userId, type, created_at, updated_at,updated_by)
  VALUES
    (userId, pendingType, updatedTime, updatedTime,updatedBy);

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_add`(IN UserId int(11), IN RoleId int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 新增使用者角色
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  INSERT INTO user_roles (user_roles.UserId
  , user_roles.RoleId)
    VALUES (UserId, RoleId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_delete`(IN `@RoleId` int, IN `@UserId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2023/11/08
  -- Description : 刪除使用者角色權限
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  --
  -- ==========================================================================================


DELETE FROM user_roles 
WHERE 
	user_roles.RoleId = `@RoleId` AND
	user_roles.UserId = `@UserId`;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_deleteByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_deleteByUserId`(IN UserId int(11))
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/30
  -- Description : 刪除使用者角色ByUserId
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  DELETE
    FROM user_roles
  WHERE user_roles.UserId = UserId
  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_getAll`()
BEGIN
  -- ==========================================================================================
  -- Author      : Ben Wu
  -- Create date : 2023/03/27
  -- Description : 取得所有使用者角色對應
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

  SELECT
    UserId,
    RoleId
  FROM user_roles;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_getAll_by_roleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_getAll_by_roleId`(IN `@RoleId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2023/11/08
  -- Description : 查詢有哪些使用者擁有該角色權限
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

SELECT r.UserId, r.RoleId, u.name AS UserName
FROM user_roles r
INNER JOIN users u ON r.UserId = u.id
WHERE r.RoleId = `@RoleId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_user_roles_getAll_by_userId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_user_roles_getAll_by_userId`(IN `@UserId` int)
BEGIN
  -- ==========================================================================================
  -- Author      : Nick Huang
  -- Create date : 2023/11/13
  -- Description : 查詢使用者擁有的角色權限
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]

  -- ==========================================================================================

SELECT r.UserId, r.RoleId
FROM user_roles r
INNER JOIN users u ON r.UserId = u.id
WHERE r.UserId = `@UserId`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_votes_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_votes_add`(OUT `@id` int,
IN questionNo int,
IN modelType nvarchar(255),
IN modelId int,
IN modelName nvarchar(255),
IN optionText nvarchar(255),
IN optionNo nvarchar(255),
IN optionType int,
IN clientId int,
IN customerId int,
IN createdAt datetime)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/24
  -- Description : 新增 投票
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  INSERT INTO votes (model_type, model_id, customer_id, client_id, model_name, question_no, option_no, option_text, created_at, option_type)
    VALUES (modelType, modelId, customerId, clientId, modelName, questionNo, optionNo, optionText, createdAt, optionType);

  SET `@id` = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_votes_get_by_modelId_modelType_questionNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_votes_get_by_modelId_modelType_questionNo`(IN modelId int,
IN modelType varchar(255),
IN questionNo int)
BEGIN
  -- ==========================================================================================
  -- Author      : art
  -- Create date : 2023/04/19
  -- Description : 取得 votes
  -- Update List : [UpdateTime] - [UpdateBy] - [Description]
  -- ==========================================================================================
  SELECT
    id,
    model_type,
    model_id,
    customer_id,
    client_id,
    model_name,
    question_no,
    option_no,
    option_text,
    created_at,
    option_type,
    updated_at
  FROM votes
  WHERE model_id = modelId
  AND model_type = modelType
  AND question_no = questionNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_event_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_event_create`(OUT id INT, IN eventType SMALLINT, IN name NVARCHAR(50), IN keyword NVARCHAR(100), IN status SMALLINT, IN start TIMESTAMP, IN end TIMESTAMP, IN createdAt TIMESTAMP, IN createdBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/16
-- Description : 創建活動
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  INSERT INTO webapi_event(
    event_type,
    name,
    keyword,
    status,
    created_by,
    created_at,
    updated_by,
    updated_at,
    event_start,
    event_end
  )
  VALUES(
    eventType,
    name,
    keyword,
    status,
    createdBy,
    createdAt,
    createdBy,
    createdAt,
    start,
    end
  );

  SET
    id = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_event_getList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_event_getList`()
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/07
-- Description : 取得活動列表
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
SELECT 
  webapi_event.id,
  webapi_event.name,
  webapi_event.event_type as eventType,
  webapi_event_types.trigger_action_type as eventTriggerType,
  webapi_event.status,
  webapi_event.keyword,
  webapi_event.event_start as startTime,
  webapi_event.event_end as endTime,
  webapi_event.created_by as createdBy,
  createdUser.name as createdUserName,
  webapi_event.created_at as createdAt,
  webapi_event.updated_by as updatedBy,
  updatedUser.name as updatedUserName,
  webapi_event.updated_at as updatedAt
FROM webapi_event
LEFT JOIN webapi_event_types ON webapi_event.event_type = webapi_event_types.id
LEFT JOIN users AS createdUser ON webapi_event.created_by = createdUser.id
LEFT JOIN users AS updatedUser ON webapi_event.updated_by = updatedUser.id
WHERE status != 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_event_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_event_update`(IN eventId INT, IN eventType SMALLINT, IN name NVARCHAR(50), IN keyword NVARCHAR(100), IN start TIMESTAMP, IN end TIMESTAMP, IN updatedAt TIMESTAMP, IN updatedBy INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/16
-- Description : 更新活動
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  UPDATE webapi_event event
  SET
    event.event_type = eventType,
    event.name = name,
    event.keyword = keyword,
    event.event_start = start,
    event.event_end = end,
    event.updated_at = updatedAt,
    event.updated_by = updatedBy
  WHERE event.id = eventId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_event_updateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_event_updateStatus`(IN eventId int, IN newStatus smallint)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/16
-- Description : 更新活動狀態 (用於刪除/發布/停用...)
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

  UPDATE webapi_event
  SET status = newStatus
  WHERE id = eventId and status != 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_merge_image_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_merge_image_add`(IN uuid VARCHAR(50), IN eventId INT, IN path VARCHAR(100), IN mergeX INT, IN mergeY INT, IN mergeWidth INT, IN mergeHeight INT, IN createdBy INT, IN createdAt TIMESTAMP)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/16
-- Description : 新增同框活動底圖
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  INSERT INTO webapi_merge_image(
    uuid,
    event_id,
    path,
    x,
    y,
    merge_width,
    merge_height,
    created_by,
    created_at
  )
  VALUES(
    uuid,
    eventId,
    path,
    mergeX,
    mergeY,
    mergeWidth,
    mergeHeight,
    createdBy,
    createdAt 
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_merge_image_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_merge_image_delete`(IN imageUUID VARCHAR(50), IN eventId INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/23
-- Description : 移除 webapi event - MergeImages(底框照)
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
  DELETE FROM webapi_merge_image
  WHERE (uuid = imageUUID) OR (eventId > 0 AND eventId = event_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webapi_merge_image_getByEventId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webapi_merge_image_getByEventId`(IN eventId INT)
BEGIN
-- ==========================================================================================
-- Author      : Yisu
-- Create date : 2024/02/23
-- Description : 取得 webapi event - MergeImages(底框照)
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================
SELECT 
  uuid,
  event_id,
  path,
  x,
  y,
  merge_width,
  merge_height,
  created_by,
  created_at
FROM webapi_merge_image
WHERE event_id = eventId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webhook_event_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webhook_event_add`(
    OUT `@id` int,
    IN `@eventType` varchar(255),
    IN `@webhookEventId` varchar(255),
    IN `@isRedelivery` boolean,
    IN `@timestamp` bigint,
    IN `@supplementaryInfo` varchar(255)
)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/08/01
    -- Description : 新增事件
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    insert into webhook_event (event_type, webhook_event_id, is_redelivery, timestamp, supplementary_info)
    values (`@eventType`, `@webhookEventId`, `@isRedelivery`, `@timestamp`, `@supplementaryInfo`);

    SET `@id` = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webhook_event_check_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webhook_event_check_exist`(IN `@webhookEventId` varchar(255), IN `@timestamp` bigint)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/08/01
    -- Description : 檢查是否有重複事件
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT 1
    FROM webhook_event
    WHERE webhook_event_id = `@webhookEventId`
      AND timestamp >= `@timestamp`
    LIMIT 1;
    -- ==========================================================================================
    -- example:
    -- call usp_webhook_event_check_exist('01H5PMWFPZ50ZP5YDJCDW5SHX6', 1690611834678);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_webhook_event_clear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_webhook_event_clear`(IN cutoffTime bigint)
BEGIN
-- ==========================================================================================
-- Author      : art
-- Create date : 2024/02/20
-- Description : 執行清除作業，刪除時間之前的紀錄
-- Update List : [UpdateTime] - [UpdateBy] - [Description]
-- ==========================================================================================

  DELETE FROM webhook_event WHERE timestamp < @cutoffTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_working_days_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_working_days_add`(OUT `@id` int,
                                                           IN `@date` datetime,
                                                           IN `@name` nvarchar(255),
                                                           IN `@isHoliday` bit)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/18
    -- Description : 新增工作日設定
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    INSERT INTO working_day (Date, Name, IsHoliday) VALUES (`@date`, `@name`, `@isHoliday`);
    SET `@id` = @@IDENTITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_working_days_delete_by_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_working_days_delete_by_year`(IN `@year` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/19
    -- Description : 刪除指定年度的工作日資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SET @start_date = CONCAT(`@year`, '-01-01');
    SET @end_date = CONCAT(`@year`, '-12-31');

    DELETE FROM working_day WHERE `Date` >= @start_date AND `Date` <= @end_date;
    -- ==========================================================================================
    -- example:
    -- call usp_working_days_delete_by_year(2023);
    -- call usp_working_days_delete_by_year(2024);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_working_days_get_by_month` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_working_days_get_by_month`(IN `@year` int, IN `@month` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/06/30
    -- Description : 取得工作日設定
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SELECT id, date, name, isholiday
    FROM working_day
    WHERE YEAR(`Date`) = `@year`
      AND MONTH(`Date`) = `@month`;

    -- =================================================
-- example:
-- CALL usp_working_days_get_by_month(2023, 1);
-- =================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_working_days_is_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`b2badm`@`192.168.132.77` PROCEDURE `usp_working_days_is_exist`(IN `@year` int)
BEGIN
    -- ==========================================================================================
    -- Author      : art
    -- Create date : 2023/07/19
    -- Description : 查詢是否有該年度的工作日資料
    -- Update List : [UpdateTime] - [UpdateBy] - [Description]
    -- ==========================================================================================
    SET @start_date = CONCAT(`@year`, '-01-01');
    SET @end_date = CONCAT(`@year`, '-12-31');
    
    SELECT IF((SELECT 1 FROM working_day WHERE Date >= @start_date AND Date <= @end_date LIMIT 1), 1, 0) AS 'isExist';
    -- ==========================================================================================
    -- example:
    -- call usp_working_days_is_exist(2023);
    -- call usp_working_days_is_exist(2024);
    -- ==========================================================================================
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_chatrooms_current`
--

/*!50001 DROP VIEW IF EXISTS `v_chatrooms_current`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_chatrooms_current` AS select `cr`.`id` AS `chatroom_id`,`cr`.`client_id` AS `client_id`,`u`.`id` AS `user_id`,`p`.`id` AS `profile_id_user` from ((((select `chatrooms`.`client_id` AS `client_id`,max(`chatrooms`.`updated_at`) AS `updated_at` from `chatrooms` group by `chatrooms`.`client_id`) `max_chatrooms` join `chatrooms` `cr` on(((`max_chatrooms`.`updated_at` = `cr`.`updated_at`) and (`max_chatrooms`.`client_id` = `cr`.`client_id`)))) join `users` `u` on((`cr`.`user_id` = `u`.`id`))) join `profiles` `p` on((`u`.`profile_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_client_tags_crurrent`
--

/*!50001 DROP VIEW IF EXISTS `v_client_tags_crurrent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_client_tags_crurrent` AS select `ct`.`id` AS `id`,`ct`.`client_id` AS `client_id`,`vcp`.`customer_id` AS `customer_id`,`vcp`.`client_id` AS `client_id_current`,`vcp`.`line_user_id` AS `line_user_id_current`,`vcrc`.`chatroom_id` AS `chatroom_id_current` from ((`client_tags` `ct` left join `v_clients_profiles` `vcp` on((`ct`.`customer_id` = `vcp`.`customer_id`))) left join `v_chatrooms_current` `vcrc` on((`vcp`.`client_id` = `vcrc`.`client_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_client_tags_crurrent_for_clientid`
--

/*!50001 DROP VIEW IF EXISTS `v_client_tags_crurrent_for_clientid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_client_tags_crurrent_for_clientid` AS select `ct`.`id` AS `id`,`ct`.`client_id` AS `client_id`,`vcp`.`customer_id` AS `customer_id`,`vcp`.`client_id` AS `client_id_current`,`vcp`.`line_user_id` AS `line_user_id_current`,`vcrc`.`chatroom_id` AS `chatroom_id_current` from ((`client_tags` `ct` left join `v_clients_profiles` `vcp` on((`ct`.`client_id` = `vcp`.`client_id`))) left join `v_chatrooms_current` `vcrc` on((`vcp`.`client_id` = `vcrc`.`client_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_clients_profiles`
--

/*!50001 DROP VIEW IF EXISTS `v_clients_profiles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_clients_profiles` AS select `c`.`id` AS `client_id`,`c`.`customer_id` AS `customer_id`,`c`.`profile_id` AS `profile_id`,`c`.`nickname` AS `nickname`,`c`.`disabled` AS `disabled`,`p`.`line_user_id` AS `line_user_id`,`p`.`picture_url` AS `picture_url` from (`clients` `c` join `profiles` `p` on((`c`.`profile_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_imagemaps`
--

/*!50001 DROP VIEW IF EXISTS `v_imagemaps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_imagemaps` AS select `im`.`id` AS `imagemap_id`,`im`.`task_id` AS `task_id`,`im`.`template_message_id` AS `template_message_id`,`im`.`type` AS `type`,`im`.`base_size_width` AS `base_size_width`,`im`.`base_size_height` AS `base_size_height`,`imv`.`movie_id` AS `movie_id`,`imv`.`original_content_url` AS `original_content_url`,`imv`.`preview_image_url` AS `preview_image_url`,`imv`.`link_uri` AS `link_uri`,`imv`.`label` AS `label`,`imv`.`x` AS `x`,`imv`.`y` AS `y`,`imv`.`width` AS `width`,`imv`.`height` AS `height`,`m`.`pic_url` AS `pic_url` from ((`imagemaps` `im` left join `imagemap_video` `imv` on((`im`.`id` = `imv`.`imagemap_id`))) left join `movies` `m` on((`imv`.`movie_id` = `imv`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_template_message_actions_columns`
--

/*!50001 DROP VIEW IF EXISTS `v_template_message_actions_columns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_template_message_actions_columns` AS select `tma`.`id` AS `template_message_actions_id`,`tma`.`template_message_column_id` AS `template_message_column_id`,`tma`.`template_message_id` AS `template_message_id`,`tma`.`action_type` AS `action_type`,`tma`.`label` AS `label`,`tma`.`data` AS `data`,`tma`.`uri` AS `uri`,`tma`.`text` AS `text`,`tma`.`response` AS `response`,`tma`.`tag` AS `tag`,`tmc`.`thumbnailImageUrl` AS `column_thumbnailImageUrl`,`tmc`.`imageUrl` AS `column_imageUrl`,`tmc`.`title` AS `column_title`,`tmc`.`text` AS `column_text`,`tmc`.`option_type` AS `column_option_type` from (`template_message_actions` `tma` left join `template_message_columns` `tmc` on(((`tma`.`template_message_id` = `tmc`.`template_message_id`) and (`tma`.`template_message_column_id` = `tmc`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_test_only`
--

/*!50001 DROP VIEW IF EXISTS `v_test_only`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`b2badm`@`192.168.132.77` SQL SECURITY DEFINER */
/*!50001 VIEW `v_test_only` AS select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) union all select `vc`.`chatroom_id` AS `chatroom_id`,`vcp`.`profile_id` AS `profile_id`,'test' AS `test`,987654321 AS `987654321`,'' AS `Name_exp_5`,1 AS `1`,'Y' AS `Y`,now() AS `NOW()`,now() AS `My_exp_NOW()` from (`v_chatrooms_current` `vc` join `v_clients_profiles` `vcp` on((`vcp`.`client_id` = `vc`.`client_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `profiles` VALUES 
(1,'ivHI80mdsw','super admin','assets/img/user/user-2.jpg','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(2,'K2esuvYxqM','ob.import','assets/img/user/user-13.jpg','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(3,'K2esuvYxqM','ob.listadmin','assets/img/user/user-13.jpg','',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO `users` VALUES 
(1,1,'super.admin','super admin','super.admin','','super.admin@ehs.com.tw','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',0,'NULL',0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0),
(2,2,'ob.import','ob import','ob.block','','ob.import@ehs.com.tw','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',0,'NULL',0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0),
(3,3,'ob.listadmin','ob.listadmin','ob.listadmin','','ob.listadmin@ehs.com.tw','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',1,NULL,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0);
