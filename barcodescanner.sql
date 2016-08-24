/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : barcodescanner

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-08-24 18:20:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of activations
-- ----------------------------
INSERT INTO `activations` VALUES ('1', '1', 'iUm1HSdCEbbiq563kFRT7XYLbUpDArvM', '1', '2016-08-24 11:01:55', '2016-08-24 11:01:55', '2016-08-24 11:01:55');

-- ----------------------------
-- Table structure for dashboard__widgets
-- ----------------------------
DROP TABLE IF EXISTS `dashboard__widgets`;
CREATE TABLE `dashboard__widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `widgets` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dashboard__widgets_user_id_foreign` (`user_id`),
  CONSTRAINT `dashboard__widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dashboard__widgets
-- ----------------------------

-- ----------------------------
-- Table structure for media__files
-- ----------------------------
DROP TABLE IF EXISTS `media__files`;
CREATE TABLE `media__files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of media__files
-- ----------------------------

-- ----------------------------
-- Table structure for media__file_translations
-- ----------------------------
DROP TABLE IF EXISTS `media__file_translations`;
CREATE TABLE `media__file_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media__file_translations_file_id_locale_unique` (`file_id`,`locale`),
  KEY `media__file_translations_locale_index` (`locale`),
  CONSTRAINT `media__file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `media__files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of media__file_translations
-- ----------------------------

-- ----------------------------
-- Table structure for media__imageables
-- ----------------------------
DROP TABLE IF EXISTS `media__imageables`;
CREATE TABLE `media__imageables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of media__imageables
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menuitems
-- ----------------------------
DROP TABLE IF EXISTS `menu__menuitems`;
CREATE TABLE `menu__menuitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu__menuitems_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu__menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu__menuitems
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menuitem_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu__menuitem_translations`;
CREATE TABLE `menu__menuitem_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuitem_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menuitem_translations_menuitem_id_locale_unique` (`menuitem_id`,`locale`),
  KEY `menu__menuitem_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menuitem_translations_menuitem_id_foreign` FOREIGN KEY (`menuitem_id`) REFERENCES `menu__menuitems` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu__menuitem_translations
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menus
-- ----------------------------
DROP TABLE IF EXISTS `menu__menus`;
CREATE TABLE `menu__menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu__menus
-- ----------------------------

-- ----------------------------
-- Table structure for menu__menu_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu__menu_translations`;
CREATE TABLE `menu__menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu__menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  KEY `menu__menu_translations_locale_index` (`locale`),
  CONSTRAINT `menu__menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu__menu_translations
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_07_02_230147_migration_cartalyst_sentinel', '1');
INSERT INTO `migrations` VALUES ('2014_10_14_200250_create_settings_table', '2');
INSERT INTO `migrations` VALUES ('2014_10_15_191204_create_setting_translations_table', '2');
INSERT INTO `migrations` VALUES ('2015_06_18_170048_make_settings_value_text_field', '2');
INSERT INTO `migrations` VALUES ('2015_10_22_130947_make_settings_name_unique', '2');
INSERT INTO `migrations` VALUES ('2014_11_03_160015_create_menus_table', '3');
INSERT INTO `migrations` VALUES ('2014_11_03_160138_create_menu-translations_table', '3');
INSERT INTO `migrations` VALUES ('2014_11_03_160753_create_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('2014_11_03_160804_create_menuitem_translation_table', '3');
INSERT INTO `migrations` VALUES ('2014_12_17_185301_add_root_column_to_menus_table', '3');
INSERT INTO `migrations` VALUES ('2015_09_05_100142_add_icon_column_to_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('2016_01_26_102307_update_icon_column_on_menuitems_table', '3');
INSERT INTO `migrations` VALUES ('2014_10_26_162751_create_files_table', '4');
INSERT INTO `migrations` VALUES ('2014_10_26_162811_create_file_translations_table', '4');
INSERT INTO `migrations` VALUES ('2015_02_27_105241_create_image_links_table', '4');
INSERT INTO `migrations` VALUES ('2015_12_19_143643_add_sortable', '4');
INSERT INTO `migrations` VALUES ('2014_11_30_191858_create_pages_tables', '5');
INSERT INTO `migrations` VALUES ('2015_04_02_184200_create_widgets_table', '6');
INSERT INTO `migrations` VALUES ('2013_04_09_062329_create_revisions_table', '7');
INSERT INTO `migrations` VALUES ('2015_11_20_184604486385_create_translation_translations_table', '7');
INSERT INTO `migrations` VALUES ('2015_11_20_184604743083_create_translation_translation_translations_table', '7');
INSERT INTO `migrations` VALUES ('2015_12_01_094031_update_translation_translations_table_with_index', '7');

-- ----------------------------
-- Table structure for page__pages
-- ----------------------------
DROP TABLE IF EXISTS `page__pages`;
CREATE TABLE `page__pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of page__pages
-- ----------------------------
INSERT INTO `page__pages` VALUES ('1', '1', 'home', '2016-08-24 11:02:43', '2016-08-24 11:02:43');

-- ----------------------------
-- Table structure for page__page_translations
-- ----------------------------
DROP TABLE IF EXISTS `page__page_translations`;
CREATE TABLE `page__page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `page__page_translations_page_id_locale_unique` (`page_id`,`locale`),
  KEY `page__page_translations_locale_index` (`locale`),
  CONSTRAINT `page__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page__pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of page__page_translations
-- ----------------------------
INSERT INTO `page__page_translations` VALUES ('1', '1', 'en', 'Home page', 'home', '1', '<p><strong>You made it!</strong></p>\n<p>You&#39;ve installed AsgardCMS and are ready to proceed to the <a href=\"/en/backend\">administration area</a>.</p>\n<h2>What&#39;s next ?</h2>\n<p>Learn how you can develop modules for AsgardCMS by reading our <a href=\"https://github.com/AsgardCms/Documentation\">documentation</a>.</p>\n', 'Home page', null, null, null, null, null, '2016-08-24 11:02:43', '2016-08-24 11:02:43');

-- ----------------------------
-- Table structure for persistences
-- ----------------------------
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of persistences
-- ----------------------------
INSERT INTO `persistences` VALUES ('1', '1', 'JoMP9eUHYmJJRA7jRf5GvIzjYNF7zCom', '2016-08-24 11:10:57', '2016-08-24 11:10:57');

-- ----------------------------
-- Table structure for reminders
-- ----------------------------
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reminders
-- ----------------------------

-- ----------------------------
-- Table structure for revisions
-- ----------------------------
DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of revisions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Admin', '{\"dashboard.index\":true,\"dashboard.grid.save\":true,\"dashboard.grid.reset\":true,\"workshop.modules.index\":true,\"workshop.modules.show\":true,\"workshop.modules.disable\":true,\"workshop.modules.enable\":true,\"workshop.themes.index\":true,\"workshop.themes.show\":true,\"user.roles.index\":true,\"user.roles.create\":true,\"user.roles.store\":true,\"user.roles.edit\":true,\"user.roles.update\":true,\"user.roles.destroy\":true,\"user.users.index\":true,\"user.users.create\":true,\"user.users.store\":true,\"user.users.edit\":true,\"user.users.update\":true,\"user.users.destroy\":true,\"menu.menus.index\":true,\"menu.menus.create\":true,\"menu.menus.store\":true,\"menu.menus.edit\":true,\"menu.menus.update\":true,\"menu.menus.destroy\":true,\"menu.menuitem.index\":true,\"menu.menuitem.create\":true,\"menu.menuitem.store\":true,\"menu.menuitem.edit\":true,\"menu.menuitem.update\":true,\"menu.menuitem.destroy\":true,\"media.media.index\":true,\"media.media.create\":true,\"media.media.store\":true,\"media.media.edit\":true,\"media.media.update\":true,\"media.media.destroy\":true,\"media.media-grid.index\":true,\"media.media-grid.ckIndex\":true,\"setting.settings.index\":true,\"setting.settings.store\":true,\"setting.settings.getModuleSettings\":true,\"page.pages.index\":true,\"page.pages.create\":true,\"page.pages.store\":true,\"page.pages.edit\":true,\"page.pages.update\":true,\"page.pages.destroy\":true,\"translation.translations.index\":true,\"translation.translations.update\":true,\"translation.translations.export\":true,\"translation.translations.import\":true}', '2016-08-24 11:01:25', '2016-08-24 11:01:25');
INSERT INTO `roles` VALUES ('2', 'user', 'User', '{\"dashboard.index\":true}', '2016-08-24 11:01:25', '2016-08-24 11:01:25');

-- ----------------------------
-- Table structure for role_users
-- ----------------------------
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE `role_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_users
-- ----------------------------
INSERT INTO `role_users` VALUES ('1', '1', '2016-08-24 11:01:55', '2016-08-24 11:01:55');

-- ----------------------------
-- Table structure for setting__settings
-- ----------------------------
DROP TABLE IF EXISTS `setting__settings`;
CREATE TABLE `setting__settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plainValue` text COLLATE utf8_unicode_ci,
  `isTranslatable` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__settings_name_unique` (`name`),
  KEY `setting__settings_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of setting__settings
-- ----------------------------
INSERT INTO `setting__settings` VALUES ('1', 'core::template', 'Flatly', '0', '2016-08-24 11:02:42', '2016-08-24 11:02:42');
INSERT INTO `setting__settings` VALUES ('2', 'core::locales', '[\"en\"]', '0', '2016-08-24 11:02:43', '2016-08-24 11:02:43');

-- ----------------------------
-- Table structure for setting__setting_translations
-- ----------------------------
DROP TABLE IF EXISTS `setting__setting_translations`;
CREATE TABLE `setting__setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting__setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  KEY `setting__setting_translations_locale_index` (`locale`),
  CONSTRAINT `setting__setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `setting__settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of setting__setting_translations
-- ----------------------------

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of throttle
-- ----------------------------
INSERT INTO `throttle` VALUES ('1', null, 'global', null, '2016-08-24 11:03:24', '2016-08-24 11:03:24');
INSERT INTO `throttle` VALUES ('2', null, 'ip', '127.0.0.1', '2016-08-24 11:03:24', '2016-08-24 11:03:24');
INSERT INTO `throttle` VALUES ('3', '1', 'user', null, '2016-08-24 11:03:25', '2016-08-24 11:03:25');

-- ----------------------------
-- Table structure for translation__translations
-- ----------------------------
DROP TABLE IF EXISTS `translation__translations`;
CREATE TABLE `translation__translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translation__translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of translation__translations
-- ----------------------------

-- ----------------------------
-- Table structure for translation__translation_translations
-- ----------------------------
DROP TABLE IF EXISTS `translation__translation_translations`;
CREATE TABLE `translation__translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_trans_id_locale_unique` (`translation_id`,`locale`),
  KEY `translation__translation_translations_locale_index` (`locale`),
  CONSTRAINT `translation__translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translation__translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of translation__translation_translations
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'tranhunghl@gmail.com', '$2y$10$Md5Hh/gFKqAezZpy0V.jg.pM7zFqbxNuwtEYsQyW0iUpvLHwlj2Au', null, '2016-08-24 11:10:57', 'Tran', 'Hung', '2016-08-24 11:01:55', '2016-08-24 11:10:57');
