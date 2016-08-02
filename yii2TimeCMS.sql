/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : yii2-starter-kit

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-08-02 18:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `thumbnail_base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `updater_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `published_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_author` (`author_id`),
  KEY `fk_article_updater` (`updater_id`),
  KEY `fk_article_category` (`category_id`),
  CONSTRAINT `fk_article_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_category` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_article_updater` FOREIGN KEY (`updater_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'sss', 'led', '<p>ssss</p>', '', '1', null, null, '1', '1', '0', '1470124152', '1470124152', '1470124152');

-- ----------------------------
-- Table structure for article_attachment
-- ----------------------------
DROP TABLE IF EXISTS `article_attachment`;
CREATE TABLE `article_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_attachment_article` (`article_id`),
  CONSTRAINT `fk_article_attachment_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_category_section` (`parent_id`),
  CONSTRAINT `fk_article_category_section` FOREIGN KEY (`parent_id`) REFERENCES `article_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('1', 'news', 'News', null, null, '1', '1469868534', null);
INSERT INTO `article_category` VALUES ('2', 'light', '灯', null, null, '1', '1470133011', '1470133011');

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL,
  `base_url` varchar(1024) NOT NULL,
  `path` varchar(1024) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upload_ip` varchar(15) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------

-- ----------------------------
-- Table structure for i18n_message
-- ----------------------------
DROP TABLE IF EXISTS `i18n_message`;
CREATE TABLE `i18n_message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `fk_i18n_message_source_message` FOREIGN KEY (`id`) REFERENCES `i18n_source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of i18n_message
-- ----------------------------

-- ----------------------------
-- Table structure for i18n_source_message
-- ----------------------------
DROP TABLE IF EXISTS `i18n_source_message`;
CREATE TABLE `i18n_source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of i18n_source_message
-- ----------------------------

-- ----------------------------
-- Table structure for key_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `key_storage_item`;
CREATE TABLE `key_storage_item` (
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `updated_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `idx_key_storage_item_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of key_storage_item
-- ----------------------------
INSERT INTO `key_storage_item` VALUES ('backend.layout-boxed', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.layout-collapsed-sidebar', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.layout-fixed', '0', null, null, null);
INSERT INTO `key_storage_item` VALUES ('backend.theme-skin', 'skin-blue', 'skin-blue, skin-black, skin-purple, skin-green, skin-red, skin-yellow', null, null);
INSERT INTO `key_storage_item` VALUES ('frontend.maintenance', 'disabled', 'Set it to \"true\" to turn on maintenance mode', null, null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', 'about', 'About', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', null, '1', '1469868534', '1469868534');
INSERT INTO `page` VALUES ('2', 'test', 'test', '<p \"=\"\">testmmmmmm</p>', '', '1', '1470122003', '1470124082');

-- ----------------------------
-- Table structure for rbac_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_assignment`;
CREATE TABLE `rbac_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `rbac_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_assignment
-- ----------------------------
INSERT INTO `rbac_auth_assignment` VALUES ('administrator', '1', '1469868538');
INSERT INTO `rbac_auth_assignment` VALUES ('administrator', '4', '1470132799');
INSERT INTO `rbac_auth_assignment` VALUES ('adminModel', '1', '1470126766');
INSERT INTO `rbac_auth_assignment` VALUES ('adminModel', '4', '1470132800');
INSERT INTO `rbac_auth_assignment` VALUES ('editOwnModel', '1', '1470126766');
INSERT INTO `rbac_auth_assignment` VALUES ('editOwnModel', '4', '1470132800');
INSERT INTO `rbac_auth_assignment` VALUES ('loginToBackend', '1', '1470126766');
INSERT INTO `rbac_auth_assignment` VALUES ('loginToBackend', '4', '1470132800');
INSERT INTO `rbac_auth_assignment` VALUES ('manager', '1', '1470126766');
INSERT INTO `rbac_auth_assignment` VALUES ('manager', '2', '1469868538');
INSERT INTO `rbac_auth_assignment` VALUES ('manager', '4', '1470132799');
INSERT INTO `rbac_auth_assignment` VALUES ('user', '1', '1470126766');
INSERT INTO `rbac_auth_assignment` VALUES ('user', '3', '1469868538');
INSERT INTO `rbac_auth_assignment` VALUES ('user', '4', '1470132800');

-- ----------------------------
-- Table structure for rbac_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_item`;
CREATE TABLE `rbac_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `rbac_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `rbac_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_item
-- ----------------------------
INSERT INTO `rbac_auth_item` VALUES ('/*', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/admin/*', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1470126783', '1470126783');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1470126783', '1470126783');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1470126783', '1470126783');
INSERT INTO `rbac_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1470126783', '1470126783');
INSERT INTO `rbac_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/*', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/add-child', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/create', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/delete', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/index', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/remove-child', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/update', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/item/view', '2', null, null, null, '1470126784', '1470126784');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/values', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/add', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1470126786', '1470126786');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/*', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/create', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/delete', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/index', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/update', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article-category/view', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article/*', '2', null, null, null, '1470126793', '1470126793');
INSERT INTO `rbac_auth_item` VALUES ('/article/create', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article/delete', '2', null, null, null, '1470126793', '1470126793');
INSERT INTO `rbac_auth_item` VALUES ('/article/index', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/article/update', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/cache/*', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache-key', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/cache/flush-cache-tag', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/cache/index', '2', null, null, null, '1470126793', '1470126793');
INSERT INTO `rbac_auth_item` VALUES ('/debug/*', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/*', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/connect', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager-elfinder/manager', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager/*', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-manager/index', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/*', '2', null, null, null, '1470126797', '1470126797');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/delete', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/index', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload-delete', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/upload-imperavi', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/file-storage/view', '2', null, null, null, '1470126794', '1470126794');
INSERT INTO `rbac_auth_item` VALUES ('/gii/*', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1470126780', '1470126780');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/*', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/*', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/create', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/delete', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/index', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-message/update', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/*', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/create', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/delete', '2', null, null, null, '1470126791', '1470126791');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/index', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/update', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/i18n/i18n-source-message/view', '2', null, null, null, '1470126788', '1470126788');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/*', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/create', '2', null, null, null, '1470126797', '1470126797');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/delete', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/index', '2', null, null, null, '1470126797', '1470126797');
INSERT INTO `rbac_auth_item` VALUES ('/key-storage/update', '2', null, null, null, '1470126797', '1470126797');
INSERT INTO `rbac_auth_item` VALUES ('/log/*', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/log/delete', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/log/index', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/log/view', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/page/*', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/page/create', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/page/delete', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/page/index', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/page/update', '2', null, null, null, '1470126798', '1470126798');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/*', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/account', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/avatar-delete', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/avatar-upload', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/login', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/logout', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/sign-in/profile', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/site/*', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/site/error', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/site/settings', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/system-information/*', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/system-information/index', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/timeline-event/*', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/timeline-event/index', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/user/*', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/user/create', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/user/delete', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/user/index', '2', null, null, null, '1470126800', '1470126800');
INSERT INTO `rbac_auth_item` VALUES ('/user/update', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/user/view', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/*', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/create', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/delete', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel-item/update', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/*', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/create', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/delete', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/index', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-carousel/update', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/*', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/create', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/delete', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/index', '2', null, null, null, '1470126803', '1470126803');
INSERT INTO `rbac_auth_item` VALUES ('/widget-menu/update', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/*', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/create', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/delete', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/index', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('/widget-text/update', '2', null, null, null, '1470126805', '1470126805');
INSERT INTO `rbac_auth_item` VALUES ('administrator', '1', '超级管理员', null, null, '1469868538', '1470126023');
INSERT INTO `rbac_auth_item` VALUES ('adminModel', '2', '超级管理员', null, null, '1470126731', '1470126731');
INSERT INTO `rbac_auth_item` VALUES ('editOwnModel', '2', '编辑', 'ownModelRule', null, '1469868539', '1470127865');
INSERT INTO `rbac_auth_item` VALUES ('loginToBackend', '2', null, null, null, '1469868538', '1469868538');
INSERT INTO `rbac_auth_item` VALUES ('manager', '1', null, null, null, '1469868538', '1469868538');
INSERT INTO `rbac_auth_item` VALUES ('user', '1', null, null, null, '1469868538', '1469868538');

-- ----------------------------
-- Table structure for rbac_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_item_child`;
CREATE TABLE `rbac_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `rbac_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rbac_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `rbac_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_item_child
-- ----------------------------
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/assignment/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/assignment/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/assignment/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/assignment/assign');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/assignment/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/assignment/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/assignment/revoke');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/assignment/revoke');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/assignment/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/assignment/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/add-child');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/add-child');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/remove-child');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/remove-child');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/item/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/item/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/values');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/values');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/menu/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/menu/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/route/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/route/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/route/add');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/route/add');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/route/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/route/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/route/remove');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/route/remove');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/admin/rule/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/admin/rule/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article-category/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article-category/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/article/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/article/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/cache/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/cache/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/cache/flush-cache');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/cache/flush-cache');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/cache/flush-cache-key');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/cache/flush-cache-key');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/cache/flush-cache-tag');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/cache/flush-cache-tag');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/cache/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/cache/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/db-explain');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/db-explain');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/download-mail');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/download-mail');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/toolbar');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/toolbar');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/debug/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/debug/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-manager-elfinder/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-manager-elfinder/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-manager-elfinder/connect');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-manager-elfinder/connect');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-manager-elfinder/manager');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-manager-elfinder/manager');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-manager/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-manager/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-manager/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-manager/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/upload');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/upload');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/upload-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/upload-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/upload-imperavi');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/upload-imperavi');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/file-storage/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/file-storage/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/action');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/action');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/diff');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/diff');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/preview');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/preview');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/gii/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/gii/default/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/i18n/i18n-source-message/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/i18n/i18n-source-message/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/key-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/key-storage/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/key-storage/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/key-storage/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/key-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/key-storage/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/key-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/key-storage/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/key-storage/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/key-storage/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/log/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/log/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/log/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/log/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/log/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/log/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/log/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/log/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/page/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/page/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/page/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/page/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/page/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/page/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/page/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/page/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/page/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/page/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/account');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/account');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/avatar-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/avatar-delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/avatar-upload');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/avatar-upload');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/login');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/login');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/logout');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/logout');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/sign-in/profile');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/sign-in/profile');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/site/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/site/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/site/error');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/site/error');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/site/settings');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/site/settings');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/system-information/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/system-information/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/system-information/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/system-information/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/timeline-event/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/timeline-event/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/timeline-event/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/timeline-event/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/user/view');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/user/view');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel-item/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel-item/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel-item/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel-item/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel-item/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel-item/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel-item/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel-item/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-carousel/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-carousel/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-menu/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-menu/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-menu/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-menu/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-menu/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-text/*');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-text/*');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-text/create');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-text/create');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-text/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-text/delete');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-text/index');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-text/index');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', '/widget-text/update');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', '/widget-text/update');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', 'adminModel');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', 'editOwnModel');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', 'editOwnModel');
INSERT INTO `rbac_auth_item_child` VALUES ('user', 'editOwnModel');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('adminModel', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('editOwnModel', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('manager', 'loginToBackend');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', 'manager');
INSERT INTO `rbac_auth_item_child` VALUES ('administrator', 'user');
INSERT INTO `rbac_auth_item_child` VALUES ('manager', 'user');

-- ----------------------------
-- Table structure for rbac_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_rule`;
CREATE TABLE `rbac_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rbac_auth_rule
-- ----------------------------
INSERT INTO `rbac_auth_rule` VALUES ('adminModelRule', 'O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:14:\"adminModelRule\";s:9:\"createdAt\";i:1470127704;s:9:\"updatedAt\";i:1470127894;}', '1470127704', '1470127894');
INSERT INTO `rbac_auth_rule` VALUES ('ownModelRule', 'O:29:\"common\\rbac\\rule\\OwnModelRule\":3:{s:4:\"name\";s:12:\"ownModelRule\";s:9:\"createdAt\";i:1469868538;s:9:\"updatedAt\";i:1469868538;}', '1469868538', '1469868538');

-- ----------------------------
-- Table structure for system_db_migration
-- ----------------------------
DROP TABLE IF EXISTS `system_db_migration`;
CREATE TABLE `system_db_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_db_migration
-- ----------------------------
INSERT INTO `system_db_migration` VALUES ('m000000_000000_base', '1469868521');
INSERT INTO `system_db_migration` VALUES ('m140602_111327_create_menu_table', '1469893172');
INSERT INTO `system_db_migration` VALUES ('m140703_123000_user', '1469868526');
INSERT INTO `system_db_migration` VALUES ('m140703_123055_log', '1469868526');
INSERT INTO `system_db_migration` VALUES ('m140703_123104_page', '1469868526');
INSERT INTO `system_db_migration` VALUES ('m140703_123803_article', '1469868527');
INSERT INTO `system_db_migration` VALUES ('m140703_123813_rbac', '1469868527');
INSERT INTO `system_db_migration` VALUES ('m140709_173306_widget_menu', '1469868527');
INSERT INTO `system_db_migration` VALUES ('m140709_173333_widget_text', '1469868527');
INSERT INTO `system_db_migration` VALUES ('m140712_123329_widget_carousel', '1469868527');
INSERT INTO `system_db_migration` VALUES ('m140805_084745_key_storage_item', '1469868528');
INSERT INTO `system_db_migration` VALUES ('m141012_101932_i18n_tables', '1469868528');
INSERT INTO `system_db_migration` VALUES ('m150318_213934_file_storage_item', '1469868528');
INSERT INTO `system_db_migration` VALUES ('m150414_195800_timeline_event', '1469868528');
INSERT INTO `system_db_migration` VALUES ('m150725_192740_seed_data', '1469868534');
INSERT INTO `system_db_migration` VALUES ('m150929_074021_article_attachment_order', '1469868534');
INSERT INTO `system_db_migration` VALUES ('m160203_095604_user_token', '1469868535');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_log_level` (`level`),
  KEY `idx_log_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '1', 'yii\\base\\ErrorException:2', '1469868568.9057', '[frontend][/]', 'yii\\base\\ErrorException: symlink(): Protocol error in /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php:520\nStack trace:\n#0 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/View.php(284): yii\\web\\AssetManager->getBundle()\n#5 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#6 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register()\n#7 /usr/share/nginx/html/yii2-starter-kit/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin()\n#8 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Widget.php(102): common\\widgets\\DbCarousel->run()\n#9 /usr/share/nginx/html/yii2-starter-kit/frontend/views/site/index.php(8): yii\\base\\Widget::widget()\n#10 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(325): yii\\base\\View->unknown()\n#11 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile()\n#12 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(149): yii\\base\\View->renderFile()\n#13 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(378): yii\\base\\View->render()\n#14 /usr/share/nginx/html/yii2-starter-kit/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render()\n#15 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): frontend\\controllers\\SiteController->actionIndex()\n#16 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): ::call_user_func_array:{/usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php:55}()\n#17 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#18 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction()\n#19 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction()\n#20 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest()\n#21 /usr/share/nginx/html/yii2-starter-kit/frontend/web/index.php(22): yii\\base\\Application->run()\n#22 {main}');
INSERT INTO `system_log` VALUES ('2', '2', 'yii\\debug\\Module::checkAccess', '1469868574.152', '[frontend][/favicon.ico]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('3', '2', 'yii\\debug\\Module::checkAccess', '1469868576.5747', '[frontend][/favicon.ico]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('4', '2', 'yii\\debug\\Module::checkAccess', '1469868621.9778', '[frontend][/admin]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('5', '2', 'yii\\debug\\Module::checkAccess', '1469868631.0309', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('6', '2', 'yii\\debug\\Module::checkAccess', '1469868631.0557', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('7', '2', 'yii\\debug\\Module::checkAccess', '1469868631.4102', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('8', '2', 'yii\\debug\\Module::checkAccess', '1469868631.3871', '[frontend][/assets/92b4499d/jquery.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('9', '2', 'yii\\debug\\Module::checkAccess', '1469868631.931', '[frontend][/css/style.css?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('10', '2', 'yii\\debug\\Module::checkAccess', '1469868632.0581', '[frontend][/assets/24f6999d/css/bootstrap.css]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('11', '2', 'yii\\debug\\Module::checkAccess', '1469868635.0156', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('12', '2', 'yii\\debug\\Module::checkAccess', '1469868637.5936', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('13', '2', 'yii\\debug\\Module::checkAccess', '1469868641.6065', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('14', '2', 'yii\\debug\\Module::checkAccess', '1469869001.1522', '[frontend][/admin]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('15', '2', 'yii\\debug\\Module::checkAccess', '1469869011.936', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('16', '2', 'yii\\debug\\Module::checkAccess', '1469869012.0157', '[frontend][/assets/92b4499d/jquery.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('17', '2', 'yii\\debug\\Module::checkAccess', '1469869012.1749', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('18', '2', 'yii\\debug\\Module::checkAccess', '1469869012.2232', '[frontend][/css/style.css?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('19', '2', 'yii\\debug\\Module::checkAccess', '1469869012.235', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('20', '2', 'yii\\debug\\Module::checkAccess', '1469869012.3289', '[frontend][/assets/24f6999d/css/bootstrap.css]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('21', '2', 'yii\\debug\\Module::checkAccess', '1469869015.7399', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('22', '2', 'yii\\debug\\Module::checkAccess', '1469869018.4376', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('23', '1', 'yii\\base\\ErrorException:2', '1469869450.1967', '[frontend][/]', 'yii\\base\\ErrorException: symlink(): Protocol error in /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php:520\nStack trace:\n#0 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/View.php(284): yii\\web\\AssetManager->getBundle()\n#5 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#6 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2-bootstrap/BootstrapWidgetTrait.php(73): yii\\web\\AssetBundle::register()\n#7 /usr/share/nginx/html/yii2-starter-kit/common/widgets/DbCarousel.php(82): yii\\bootstrap\\Widget->registerPlugin()\n#8 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Widget.php(102): common\\widgets\\DbCarousel->run()\n#9 /usr/share/nginx/html/yii2-starter-kit/frontend/views/site/index.php(8): yii\\base\\Widget::widget()\n#10 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(325): yii\\base\\View->unknown()\n#11 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile()\n#12 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(149): yii\\base\\View->renderFile()\n#13 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(378): yii\\base\\View->render()\n#14 /usr/share/nginx/html/yii2-starter-kit/frontend/controllers/SiteController.php(35): yii\\base\\Controller->render()\n#15 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): frontend\\controllers\\SiteController->actionIndex()\n#16 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): ::call_user_func_array:{/usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php:55}()\n#17 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#18 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction()\n#19 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction()\n#20 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest()\n#21 /usr/share/nginx/html/yii2-starter-kit/frontend/web/index.php(22): yii\\base\\Application->run()\n#22 {main}');
INSERT INTO `system_log` VALUES ('24', '2', 'yii\\debug\\Module::checkAccess', '1469869461.2657', '[frontend][/admin]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('25', '2', 'yii\\debug\\Module::checkAccess', '1469869472.0419', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('26', '2', 'yii\\debug\\Module::checkAccess', '1469869472.2707', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('27', '2', 'yii\\debug\\Module::checkAccess', '1469869472.6792', '[frontend][/assets/92b4499d/jquery.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('28', '2', 'yii\\debug\\Module::checkAccess', '1469869472.8393', '[frontend][/assets/24f6999d/css/bootstrap.css]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('29', '2', 'yii\\debug\\Module::checkAccess', '1469869472.9833', '[frontend][/css/style.css?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('30', '2', 'yii\\debug\\Module::checkAccess', '1469869473.0788', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('31', '2', 'yii\\debug\\Module::checkAccess', '1469869476.6948', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('32', '2', 'yii\\debug\\Module::checkAccess', '1469869479.536', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('33', '2', 'yii\\debug\\Module::checkAccess', '1469869545.6188', '[frontend][/admin]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('34', '2', 'yii\\debug\\Module::checkAccess', '1469869555.747', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('35', '2', 'yii\\debug\\Module::checkAccess', '1469869556.2081', '[frontend][/assets/92b4499d/jquery.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('36', '2', 'yii\\debug\\Module::checkAccess', '1469869556.4569', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('37', '2', 'yii\\debug\\Module::checkAccess', '1469869556.4818', '[frontend][/assets/24f6999d/css/bootstrap.css]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('38', '2', 'yii\\debug\\Module::checkAccess', '1469869556.5217', '[frontend][/css/style.css?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('39', '2', 'yii\\debug\\Module::checkAccess', '1469869556.8553', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('40', '2', 'yii\\debug\\Module::checkAccess', '1469869560.0992', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('41', '2', 'yii\\debug\\Module::checkAccess', '1469869563.2323', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('42', '2', 'yii\\debug\\Module::checkAccess', '1469869566.6846', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('43', '2', 'yii\\debug\\Module::checkAccess', '1469869590.2128', '[frontend][/admin/sign-in/login]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('44', '2', 'yii\\debug\\Module::checkAccess', '1469869600.201', '[frontend][/assets/24f6999d/css/bootstrap.css]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('45', '2', 'yii\\debug\\Module::checkAccess', '1469869600.0189', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('46', '2', 'yii\\debug\\Module::checkAccess', '1469869600.1174', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('47', '2', 'yii\\debug\\Module::checkAccess', '1469869600.2418', '[frontend][/assets/92b4499d/jquery.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('48', '2', 'yii\\debug\\Module::checkAccess', '1469869600.3302', '[frontend][/css/style.css?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('49', '2', 'yii\\debug\\Module::checkAccess', '1469869600.6734', '[frontend][/js/app.js?v=1469411520]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('50', '2', 'yii\\debug\\Module::checkAccess', '1469869603.6393', '[frontend][/assets/24f6999d/js/bootstrap.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('51', '2', 'yii\\debug\\Module::checkAccess', '1469869606.4262', '[frontend][/assets/f0a579dd/yii.js]', 'Access to debugger is denied due to IP address restriction. The requesting IP address is 10.0.2.2');
INSERT INTO `system_log` VALUES ('52', '1', 'yii\\base\\ErrorException:2', '1469869618.8793', '[backend][/admin/sign-in/login]', 'yii\\base\\ErrorException: symlink(): Protocol error in /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php:520\nStack trace:\n#0 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/View.php(284): yii\\web\\AssetManager->getBundle()\n#5 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#6 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/validators/RequiredValidator.php(108): yii\\web\\AssetBundle::register()\n#7 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(716): yii\\validators\\RequiredValidator->clientValidateAttribute()\n#8 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(219): yii\\widgets\\ActiveField->getClientOptions()\n#9 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(209): yii\\widgets\\ActiveField->begin()\n#10 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2-bootstrap/ActiveField.php(187): yii\\widgets\\ActiveField->render()\n#11 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(165): yii\\bootstrap\\ActiveField->render()\n#12 /usr/share/nginx/html/yii2-starter-kit/backend/views/sign-in/login.php(21): yii\\widgets\\ActiveField->__toString()\n#13 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(325): yii\\base\\View->unknown()\n#14 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile()\n#15 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(149): yii\\base\\View->renderFile()\n#16 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(378): yii\\base\\View->render()\n#17 /usr/share/nginx/html/yii2-starter-kit/backend/controllers/SignInController.php(70): yii\\base\\Controller->render()\n#18 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): backend\\controllers\\SignInController->actionLogin()\n#19 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): ::call_user_func_array:{/usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php:55}()\n#20 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#21 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction()\n#22 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction()\n#23 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest()\n#24 /usr/share/nginx/html/yii2-starter-kit/backend/web/index.php(23): yii\\base\\Application->run()\n#25 {main}');
INSERT INTO `system_log` VALUES ('53', '1', 'yii\\base\\ErrorException:2', '1469869827.7306', '[backend][/admin/sign-in/login]', 'yii\\base\\ErrorException: symlink(): Protocol error in /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php:520\nStack trace:\n#0 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/View.php(284): yii\\web\\AssetManager->getBundle()\n#5 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#6 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/validators/RequiredValidator.php(108): yii\\web\\AssetBundle::register()\n#7 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(716): yii\\validators\\RequiredValidator->clientValidateAttribute()\n#8 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(219): yii\\widgets\\ActiveField->getClientOptions()\n#9 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(209): yii\\widgets\\ActiveField->begin()\n#10 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2-bootstrap/ActiveField.php(187): yii\\widgets\\ActiveField->render()\n#11 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/widgets/ActiveField.php(165): yii\\bootstrap\\ActiveField->render()\n#12 /usr/share/nginx/html/yii2-starter-kit/backend/views/sign-in/login.php(21): yii\\widgets\\ActiveField->__toString()\n#13 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(325): yii\\base\\View->unknown()\n#14 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(247): yii\\base\\View->renderPhpFile()\n#15 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/View.php(149): yii\\base\\View->renderFile()\n#16 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(378): yii\\base\\View->render()\n#17 /usr/share/nginx/html/yii2-starter-kit/backend/controllers/SignInController.php(70): yii\\base\\Controller->render()\n#18 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): backend\\controllers\\SignInController->actionLogin()\n#19 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php(55): ::call_user_func_array:{/usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/InlineAction.php:55}()\n#20 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#21 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Module.php(454): yii\\base\\Controller->runAction()\n#22 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/web/Application.php(87): yii\\base\\Module->runAction()\n#23 /usr/share/nginx/html/yii2-starter-kit/vendor/yiisoft/yii2/base/Application.php(375): yii\\web\\Application->handleRequest()\n#24 /usr/share/nginx/html/yii2-starter-kit/backend/web/index.php(23): yii\\base\\Application->run()\n#25 {main}');
INSERT INTO `system_log` VALUES ('54', '1', 'yii\\base\\InvalidParamException', '1469893119.1168', '[console][]', 'exception \'yii\\base\\InvalidParamException\' with message \'Invalid path alias: @mdm\\admin\\migrations\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\BaseYii.php:152\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\BaseMigrateController.php(68): yii\\BaseYii::getAlias(\'@mdm\\\\admin\\\\migr...\')\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\MigrateController.php(150): yii\\console\\controllers\\BaseMigrateController->beforeAction(Object(yii\\base\\InlineAction))\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(152): yii\\console\\controllers\\MigrateController->beforeAction(Object(yii\\base\\InlineAction))\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'\', Array)\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'\', Array)\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(180): yii\\base\\Module->runAction(\'migrate\', Array)\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(147): yii\\console\\Application->runAction(\'migrate\', Array)\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#8 D:\\wamp64\\www\\yii2-starter-kit\\console\\yii(26): yii\\base\\Application->run()\n#9 {main}');
INSERT INTO `system_log` VALUES ('55', '1', 'yii\\db\\Exception', '1469893205.4329', '[console][]', 'exception \'PDOException\' with message \'SQLSTATE[42S01]: Base table or view already exists: 1050 Table \'rbac_auth_rule\' already exists\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Command.php:844\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Command.php(844): PDOStatement->execute()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Migration.php(260): yii\\db\\Command->execute()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\rbac\\migrations\\m140506_102106_rbac_init.php(60): yii\\db\\Migration->createTable(\'{{%rbac_auth_ru...\', Array, \'CHARACTER SET u...\')\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\BaseMigrateController.php(509): m140506_102106_rbac_init->up()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\BaseMigrateController.php(130): yii\\console\\controllers\\BaseMigrateController->migrateUp(\'m140506_102106_...\')\n#5 [internal function]: yii\\console\\controllers\\BaseMigrateController->actionUp(0)\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'\', Array)\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'\', Array)\n#10 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(180): yii\\base\\Module->runAction(\'migrate\', Array)\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(147): yii\\console\\Application->runAction(\'migrate\', Array)\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#13 D:\\wamp64\\www\\yii2-starter-kit\\console\\yii(26): yii\\base\\Application->run()\n#14 {main}\n\nNext exception \'yii\\db\\Exception\' with message \'SQLSTATE[42S01]: Base table or view already exists: 1050 Table \'rbac_auth_rule\' already exists\nThe SQL being executed was: CREATE TABLE `rbac_auth_rule` (\n	`name` varchar(64) NOT NULL,\n	`data` text,\n	`created_at` int(11),\n	`updated_at` int(11),\n	PRIMARY KEY (name)\n) CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Schema.php:633\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Command.php(854): yii\\db\\Schema->convertException(Object(PDOException), \'CREATE TABLE `r...\')\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\db\\Migration.php(260): yii\\db\\Command->execute()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\rbac\\migrations\\m140506_102106_rbac_init.php(60): yii\\db\\Migration->createTable(\'{{%rbac_auth_ru...\', Array, \'CHARACTER SET u...\')\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\BaseMigrateController.php(509): m140506_102106_rbac_init->up()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\controllers\\BaseMigrateController.php(130): yii\\console\\controllers\\BaseMigrateController->migrateUp(\'m140506_102106_...\')\n#5 [internal function]: yii\\console\\controllers\\BaseMigrateController->actionUp(0)\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams(Array)\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Controller.php(119): yii\\base\\Controller->runAction(\'\', Array)\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\console\\Controller->runAction(\'\', Array)\n#10 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(180): yii\\base\\Module->runAction(\'migrate\', Array)\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\console\\Application.php(147): yii\\console\\Application->runAction(\'migrate\', Array)\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\n#13 D:\\wamp64\\www\\yii2-starter-kit\\console\\yii(26): yii\\base\\Application->run()\n#14 {main}\r\nAdditional Information:\r\nArray\n(\n    [0] => 42S01\n    [1] => 1050\n    [2] => Table \'rbac_auth_rule\' already exists\n)\n');
INSERT INTO `system_log` VALUES ('56', '1', 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', '1470122053.3735', '[backend][/yii2-starter-kit-old/backend/web/sign-in/profile]', 'The message file for category \'filekit/widget\' does not exist: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh-CN/filekit/widget.php Fallback file does not exist as well: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh/filekit/widget.php');
INSERT INTO `system_log` VALUES ('57', '1', 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', '1470123499.3455', '[backend][/yii2-starter-kit-old/backend/web/sign-in/profile]', 'The message file for category \'filekit/widget\' does not exist: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh-CN/filekit/widget.php Fallback file does not exist as well: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh/filekit/widget.php');
INSERT INTO `system_log` VALUES ('58', '1', 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', '1470123505.7522', '[backend][/yii2-starter-kit-old/backend/web/sign-in/profile]', 'The message file for category \'filekit/widget\' does not exist: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh-CN/filekit/widget.php Fallback file does not exist as well: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh/filekit/widget.php');
INSERT INTO `system_log` VALUES ('59', '1', 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', '1470124141.3305', '[backend][/yii2-starter-kit-old/backend/web/article/create]', 'The message file for category \'filekit/widget\' does not exist: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh-CN/filekit/widget.php Fallback file does not exist as well: D:\\wamp64\\www\\yii2-starter-kit-old\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh/filekit/widget.php');
INSERT INTO `system_log` VALUES ('60', '1', 'yii\\base\\InvalidConfigException', '1470128914.8242', '[backend][/admin]', 'exception \'yii\\base\\InvalidConfigException\' with message \'Unable to determine the path info of the current request.\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php:736\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(677): yii\\web\\Request->resolvePathInfo()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\UrlManager.php(237): yii\\web\\Request->getPathInfo()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(179): yii\\web\\UrlManager->parseRequest(Object(yii\\web\\Request))\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(78): yii\\web\\Request->resolve()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#5 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#6 {main}');
INSERT INTO `system_log` VALUES ('61', '1', 'yii\\i18n\\PhpMessageSource::loadFallbackMessages', '1470130097.435', '[frontend][/frontend/web/user/default/index]', 'The message file for category \'filekit/widget\' does not exist: D:\\wamp64\\www\\yii2-starter-kit\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh-CN/filekit/widget.php Fallback file does not exist as well: D:\\wamp64\\www\\yii2-starter-kit\\vendor\\trntv\\yii2-file-kit\\src\\widget/messages/zh/filekit/widget.php');
INSERT INTO `system_log` VALUES ('62', '1', 'yii\\base\\InvalidConfigException', '1470130195.4082', '[backend][/admin]', 'exception \'yii\\base\\InvalidConfigException\' with message \'Unable to determine the path info of the current request.\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php:736\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(677): yii\\web\\Request->resolvePathInfo()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\UrlManager.php(237): yii\\web\\Request->getPathInfo()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(179): yii\\web\\UrlManager->parseRequest(Object(yii\\web\\Request))\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(78): yii\\web\\Request->resolve()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#5 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#6 {main}');
INSERT INTO `system_log` VALUES ('63', '1', 'yii\\base\\ErrorException:2', '1470130421.5533', '[backend][/admin]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('64', '1', 'yii\\base\\InvalidConfigException', '1470130511.0035', '[backend][/admin]', 'exception \'yii\\base\\InvalidConfigException\' with message \'Unable to determine the path info of the current request.\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php:736\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(677): yii\\web\\Request->resolvePathInfo()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\UrlManager.php(237): yii\\web\\Request->getPathInfo()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(179): yii\\web\\UrlManager->parseRequest(Object(yii\\web\\Request))\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(78): yii\\web\\Request->resolve()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#5 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#6 {main}');
INSERT INTO `system_log` VALUES ('65', '1', 'yii\\base\\ErrorException:2', '1470130532.3424', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('66', '1', 'yii\\base\\ErrorException:2', '1470130566.9258', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('67', '1', 'yii\\base\\ErrorException:2', '1470130609.5688', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('68', '1', 'yii\\base\\ErrorException:2', '1470130693.7768', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('69', '1', 'yii\\base\\ErrorException:2', '1470130758.8703', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('70', '1', 'yii\\base\\ErrorException:2', '1470130769.6128', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('71', '1', 'yii\\base\\ErrorException:2', '1470130982.4193', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('72', '1', 'yii\\base\\ErrorException:2', '1470131898.0405', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('73', '1', 'yii\\base\\ErrorException:2', '1470131965.4931', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('74', '1', 'yii\\base\\ErrorException:2', '1470132013.1235', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('75', '1', 'yii\\base\\ErrorException:2', '1470132016.565', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('76', '1', 'yii\\base\\ErrorException:2', '1470132026.0663', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'symlink(): Cannot create symlink, error code(123)\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php:520\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(458): yii\\web\\AssetManager->publishDirectory()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(183): yii\\web\\AssetManager->publish()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(266): yii\\web\\AssetBundle->publish()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetManager.php(237): yii\\web\\AssetManager->loadBundle()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(284): yii\\web\\AssetManager->getBundle()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\View.php(289): yii\\web\\View->registerAssetBundle()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\AssetBundle.php(123): yii\\web\\View->registerAssetBundle()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(202): yii\\web\\AssetBundle::register()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\widgets\\Pjax.php(142): yii\\widgets\\Pjax->registerClientScript()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Widget.php(77): yii\\widgets\\Pjax->run()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\timeline-event\\index.php(55): yii\\base\\Widget::end()\n#11 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(325): ::unknown()\n#12 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#13 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile()\n#14 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(378): yii\\base\\View->render()\n#15 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#16 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#17 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#18 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#19 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#20 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#21 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#22 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#23 {main}');
INSERT INTO `system_log` VALUES ('77', '1', 'yii\\base\\ErrorException:8', '1470132077.0203', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'Trying to get property of non-object\' in D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\layouts\\common.php:83\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(393): yii\\base\\View->renderFile()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(379): yii\\base\\Controller->renderContent()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#11 {main}');
INSERT INTO `system_log` VALUES ('78', '1', 'yii\\base\\ErrorException:8', '1470132143.848', '[backend][/yii2-starter-kit/backend/web/]', 'exception \'yii\\base\\ErrorException\' with message \'Trying to get property of non-object\' in D:\\wamp64\\www\\yii2-starter-kit\\backend\\views\\layouts\\common.php:83\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(393): yii\\base\\View->renderFile()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(379): yii\\base\\Controller->renderContent()\n#3 D:\\wamp64\\www\\yii2-starter-kit\\backend\\controllers\\TimelineEventController.php(30): yii\\base\\Controller->render()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): backend\\controllers\\TimelineEventController->actionIndex()\n#5 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): ::call_user_func_array:{D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\InlineAction.php:55}()\n#6 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams()\n#7 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction()\n#8 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction()\n#9 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest()\n#10 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#11 {main}');
INSERT INTO `system_log` VALUES ('79', '1', 'yii\\base\\InvalidConfigException', '1470132190.9519', '[backend][/admin]', 'exception \'yii\\base\\InvalidConfigException\' with message \'Unable to determine the path info of the current request.\' in D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php:736\nStack trace:\n#0 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(677): yii\\web\\Request->resolvePathInfo()\n#1 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\UrlManager.php(237): yii\\web\\Request->getPathInfo()\n#2 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Request.php(179): yii\\web\\UrlManager->parseRequest(Object(yii\\web\\Request))\n#3 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\web\\Application.php(78): yii\\web\\Request->resolve()\n#4 D:\\wamp64\\www\\yii2-starter-kit\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#5 D:\\wamp64\\www\\yii2-starter-kit\\backend\\web\\index.php(23): yii\\base\\Application->run()\n#6 {main}');

-- ----------------------------
-- Table structure for system_rbac_migration
-- ----------------------------
DROP TABLE IF EXISTS `system_rbac_migration`;
CREATE TABLE `system_rbac_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_rbac_migration
-- ----------------------------
INSERT INTO `system_rbac_migration` VALUES ('m000000_000000_base', '1469868535');
INSERT INTO `system_rbac_migration` VALUES ('m150625_214101_roles', '1469868538');
INSERT INTO `system_rbac_migration` VALUES ('m150625_215624_init_permissions', '1469868538');
INSERT INTO `system_rbac_migration` VALUES ('m151223_074604_edit_own_model', '1469868539');

-- ----------------------------
-- Table structure for timeline_event
-- ----------------------------
DROP TABLE IF EXISTS `timeline_event`;
CREATE TABLE `timeline_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of timeline_event
-- ----------------------------
INSERT INTO `timeline_event` VALUES ('1', 'frontend', 'user', 'signup', '{\"public_identity\":\"webmaster\",\"user_id\":1,\"created_at\":1469868528}', '1469868528');
INSERT INTO `timeline_event` VALUES ('2', 'frontend', 'user', 'signup', '{\"public_identity\":\"manager\",\"user_id\":2,\"created_at\":1469868528}', '1469868528');
INSERT INTO `timeline_event` VALUES ('3', 'frontend', 'user', 'signup', '{\"public_identity\":\"user\",\"user_id\":3,\"created_at\":1469868528}', '1469868528');
INSERT INTO `timeline_event` VALUES ('4', 'backend', 'user', 'signup', '{\"public_identity\":\"monlone\",\"user_id\":4,\"created_at\":1470128442}', '1470128442');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `access_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_client` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_client_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '2',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `logged_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'webmaster', '-ETE0246Vq1xm94ykN2FsXDELlN8ctrE', '270pTvcBelIHuCBUrTwoeuuqNdrY1THFjvDJsEaR', '$2y$13$Gtl2Roca.MMWT0m0xEAIK.Bna5cr.k0bM5FNB00vfeXWQVfyn1HqG', null, null, 'webmaster@example.com', '2', '1469868530', '1469868530', '1470132178');
INSERT INTO `user` VALUES ('2', 'manager', 'aNMHii1fVCyd52f_W0iSJrQAV4QlWxN-', 'hD6dz3p6IZ5Ml3mY6tLAGNftBo_nO6kAYgamuGx6', '$2y$13$YCa96Lgx/PcHbGQwJQXMH.I17mobTwEpZlXJtvDP4OLehtHe6Wc/q', null, null, 'manager@example.com', '2', '1469868532', '1469868532', null);
INSERT INTO `user` VALUES ('3', 'user', 'xleY2Wb7a3KGQCPXJByhg6Pso2NBaG6z', 'tr3DQsKcWncmRjqycqRCYczVxzg03l6qqX984jdT', '$2y$13$nuL.ZlkdQR2CsekKKFLTqexBc6AaIhrJG6SszIwFVTXJHI/VsnHMC', null, null, 'user@example.com', '2', '1469868534', '1469868534', null);
INSERT INTO `user` VALUES ('4', 'monlone', 'R2u_UZbxHjXNOB-KDFYeBNytEQS3OSQU', 'ycbeRSPxMXRxg5X-_8SNRMzeLvD1ZIteB5pNCiZx', '$2y$13$oVb1l6wkx0.Fv9HCoCkmYOO0HenIOentirKQT25NpYEqwae4NGNpq', null, null, 'monlone@163.com', '2', '1470128442', '1470132786', null);

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gender` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
INSERT INTO `user_profile` VALUES ('1', 'John', '', 'Doe', null, null, 'zh-CN', '2');
INSERT INTO `user_profile` VALUES ('2', null, null, null, null, null, 'en-US', null);
INSERT INTO `user_profile` VALUES ('3', null, null, null, null, null, 'en-US', null);
INSERT INTO `user_profile` VALUES ('4', null, null, null, null, null, 'zh-CN', null);

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(40) NOT NULL,
  `expire_at` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_token
-- ----------------------------

-- ----------------------------
-- Table structure for widget_carousel
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel`;
CREATE TABLE `widget_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_carousel
-- ----------------------------
INSERT INTO `widget_carousel` VALUES ('1', 'index', '1');

-- ----------------------------
-- Table structure for widget_carousel_item
-- ----------------------------
DROP TABLE IF EXISTS `widget_carousel_item`;
CREATE TABLE `widget_carousel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_id` int(11) NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caption` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_carousel` (`carousel_id`),
  CONSTRAINT `fk_item_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `widget_carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_carousel_item
-- ----------------------------
INSERT INTO `widget_carousel_item` VALUES ('1', '1', '', 'img/yii2-starter-kit.gif', 'image/gif', '/', null, '1', '0', null, null);

-- ----------------------------
-- Table structure for widget_menu
-- ----------------------------
DROP TABLE IF EXISTS `widget_menu`;
CREATE TABLE `widget_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `items` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_menu
-- ----------------------------
INSERT INTO `widget_menu` VALUES ('1', 'frontend-index', 'Frontend index menu', '[\n    {\n        \"label\": \"Get started with Yii2\",\n        \"url\": \"http://www.yiiframework.com\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-success\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Yii2 Starter Kit on GitHub\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-primary\\\">{label}</a>\"\n    },\n    {\n        \"label\": \"Find a bug?\",\n        \"url\": \"https://github.com/trntv/yii2-starter-kit/issues\",\n        \"options\": {\n            \"tag\": \"span\"\n        },\n        \"template\": \"<a href=\\\"{url}\\\" class=\\\"btn btn-lg btn-danger\\\">{label}</a>\"\n    }\n]', '1');

-- ----------------------------
-- Table structure for widget_text
-- ----------------------------
DROP TABLE IF EXISTS `widget_text`;
CREATE TABLE `widget_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_widget_text_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_text
-- ----------------------------
INSERT INTO `widget_text` VALUES ('1', 'backend_welcome', 'Welcome to backend', '<p>Welcome to Yii2 Starter Kit Dashboard</p>', '1', '1469868534', '1469868534');
INSERT INTO `widget_text` VALUES ('2', 'ads-example', 'Google Ads Example Block', '<div class=\"lead\">\n                <script async src=\"//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js\"></script>\n                <ins class=\"adsbygoogle\"\n                     style=\"display:block\"\n                     data-ad-client=\"ca-pub-9505937224921657\"\n                     data-ad-slot=\"2264361777\"\n                     data-ad-format=\"auto\"></ins>\n                <script>\n                (adsbygoogle = window.adsbygoogle || []).push({});\n                </script>\n            </div>', '0', '1469868534', '1469868534');
