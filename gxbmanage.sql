-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-04-15 16:01:32
-- 服务器版本： 5.7.24
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `gxbmanage`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add device standard', 7, 'add_devicestandard'),
(20, 'Can change device standard', 7, 'change_devicestandard'),
(21, 'Can delete device standard', 7, 'delete_devicestandard'),
(22, 'Can add device template', 8, 'add_devicetemplate'),
(23, 'Can change device template', 8, 'change_devicetemplate'),
(24, 'Can delete device template', 8, 'delete_devicetemplate'),
(25, 'Can add device spec', 9, 'add_devicespec'),
(26, 'Can change device spec', 9, 'change_devicespec'),
(27, 'Can delete device spec', 9, 'delete_devicespec'),
(28, 'Can add 《机构客户》', 10, 'add_testpartner'),
(29, 'Can change 《机构客户》', 10, 'change_testpartner'),
(30, 'Can delete 《机构客户》', 10, 'delete_testpartner');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$SOrHFMTez33B$z3wWTZCc1/UOqSjw4NqP1LOIU1L3sC8je3wGGRTxuBU=', '2019-04-14 22:15:24.794000', 1, 'l00453294', '', '', 'liukang29@huawei.com', 1, 1, '2019-04-14 20:19:33.555000');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `automation_devicespec`
--

DROP TABLE IF EXISTS `automation_devicespec`;
CREATE TABLE IF NOT EXISTS `automation_devicespec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TestOrganization` varchar(20) NOT NULL,
  `TestUserName` varchar(20) NOT NULL,
  `Tel` bigint(20) NOT NULL,
  `SpecManager` varchar(20) NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `LastEditTime` datetime(6) NOT NULL,
  `IsDelete` tinyint(1) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `automation_devicespec`
--

INSERT INTO `automation_devicespec` (`id`, `TestOrganization`, `TestUserName`, `Tel`, `SpecManager`, `CreateTime`, `LastEditTime`, `IsDelete`, `Email`) VALUES
(1, '传输所', '马子晨', 16601162964, 'l00453294', '2019-04-14 20:25:00.000000', '2019-04-14 20:51:08.663000', 0, 'mazichen@ritt.cn'),
(2, '数据所', '余庆', 15600083686, 'l00453294', '2019-04-14 20:42:00.000000', '2019-04-14 22:52:35.535000', 0, 'yuqing@chinawllc.cn'),
(3, '传输所', '崔健', 17610257851, 'l00453294', '2019-04-14 23:30:00.000000', '2019-04-14 23:32:50.402000', 0, 'cuijian@ritt.cn'),
(4, '数据所', '杨政翰', 18035776362, 'l00453294', '2019-04-14 23:37:00.000000', '2019-04-14 23:38:01.398000', 0, 'yangzhenghan@chinawllc.com');

-- --------------------------------------------------------

--
-- 表的结构 `automation_devicestandard`
--

DROP TABLE IF EXISTS `automation_devicestandard`;
CREATE TABLE IF NOT EXISTS `automation_devicestandard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DevName` varchar(20) NOT NULL,
  `DevType` varchar(20) NOT NULL,
  `SimIntro` longtext NOT NULL,
  `MAC` int(11) NOT NULL,
  `IPV4` int(11) NOT NULL,
  `IPV6` int(11) NOT NULL,
  `ThroughPut` int(11) NOT NULL,
  `PacketForwarding` int(11) NOT NULL,
  `Queue` int(11) NOT NULL,
  `IsDelete` tinyint(1) NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `LastEditTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `automation_devicetemplate`
--

DROP TABLE IF EXISTS `automation_devicetemplate`;
CREATE TABLE IF NOT EXISTS `automation_devicetemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TemVersion` int(11) NOT NULL,
  `TemType` varchar(20) NOT NULL,
  `TemPath` varchar(20) DEFAULT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `LastEditTime` datetime(6) NOT NULL,
  `TemManager` varchar(20) NOT NULL,
  `IsDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `automation_testpartner`
--

DROP TABLE IF EXISTS `automation_testpartner`;
CREATE TABLE IF NOT EXISTS `automation_testpartner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TestOrganization` varchar(20) NOT NULL,
  `TestUserName` varchar(20) NOT NULL,
  `Tel` bigint(20) NOT NULL,
  `SpecManager` varchar(20) NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `LastEditTime` datetime(6) NOT NULL,
  `IsDelete` tinyint(1) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `automation_testpartner`
--

INSERT INTO `automation_testpartner` (`id`, `TestOrganization`, `TestUserName`, `Tel`, `SpecManager`, `CreateTime`, `LastEditTime`, `IsDelete`, `Email`) VALUES
(1, '传输所', '马子晨', 16601162964, 'l00453294', '2019-04-14 20:25:00.000000', '2019-04-14 20:51:08.663000', 0, 'mazichen@ritt.cn'),
(2, '数据所', '余庆', 15600083686, 'l00453294', '2019-04-14 20:42:00.000000', '2019-04-14 22:52:35.535000', 0, 'yuqing@chinawllc.cn'),
(3, '传输所', '崔健', 17610257851, 'l00453294', '2019-04-14 23:30:00.000000', '2019-04-14 23:32:50.402000', 0, 'cuijian@ritt.cn'),
(4, '数据所', '杨政翰', 18035776362, 'l00453294', '2019-04-14 23:37:00.000000', '2019-04-14 23:38:01.398000', 0, 'yangzhenghan@chinawllc.com');

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-04-14 20:25:54.671000', '1', 'DeviceSpec object', 1, '[{\"added\": {}}]', 9, 1),
(2, '2019-04-14 20:42:24.116000', '1', 'DeviceSpec object', 2, '[]', 9, 1),
(3, '2019-04-14 20:46:12.621000', '2', 'DeviceSpec object', 1, '[{\"added\": {}}]', 9, 1),
(4, '2019-04-14 20:50:19.280000', '2', 'DeviceSpec object', 2, '[{\"changed\": {\"fields\": [\"email\"]}}]', 9, 1),
(5, '2019-04-14 20:51:08.666000', '1', 'DeviceSpec object', 2, '[{\"changed\": {\"fields\": [\"email\"]}}]', 9, 1),
(6, '2019-04-14 22:04:28.444000', '2', 'DeviceSpec object', 2, '[{\"changed\": {\"fields\": [\"tel\"]}}]', 9, 1),
(7, '2019-04-14 22:52:35.539000', '2', 'deviceName:15600083686', 2, '[{\"changed\": {\"fields\": [\"Email\"]}}]', 9, 1),
(8, '2019-04-14 23:32:50.404000', '3', 'deviceName:17610257851', 1, '[{\"added\": {}}]', 9, 1),
(9, '2019-04-14 23:38:01.402000', '4', 'deviceName:18035776362', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'automation', 'devicestandard'),
(8, 'automation', 'devicetemplate'),
(9, 'automation', 'devicespec'),
(10, 'automation', 'testpartner');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-14 18:13:54.394000'),
(2, 'auth', '0001_initial', '2019-04-14 18:13:54.636000'),
(3, 'admin', '0001_initial', '2019-04-14 18:13:54.704000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-14 18:13:54.717000'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-04-14 18:13:54.761000'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-04-14 18:13:54.783000'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-04-14 18:13:54.808000'),
(8, 'auth', '0004_alter_user_username_opts', '2019-04-14 18:13:54.821000'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-04-14 18:13:54.843000'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-04-14 18:13:54.847000'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-04-14 18:13:54.860000'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-04-14 18:13:54.883000'),
(13, 'automation', '0001_initial', '2019-04-14 18:13:54.915000'),
(14, 'sessions', '0001_initial', '2019-04-14 18:13:54.937000'),
(15, 'automation', '0002_auto_20190414_1822', '2019-04-14 18:23:08.706000'),
(16, 'automation', '0003_auto_20190414_1824', '2019-04-14 18:24:37.150000'),
(17, 'automation', '0004_auto_20190414_1919', '2019-04-14 19:19:28.923000'),
(18, 'automation', '0005_auto_20190414_2024', '2019-04-14 20:24:59.349000'),
(19, 'automation', '0006_devicespec_email', '2019-04-14 20:49:09.678000'),
(20, 'automation', '0007_auto_20190414_2229', '2019-04-14 22:29:57.026000'),
(21, 'automation', '0008_auto_20190414_2250', '2019-04-14 22:51:01.885000'),
(22, 'automation', '0009_auto_20190414_2317', '2019-04-14 23:17:13.285000'),
(23, 'automation', '0010_auto_20190414_2322', '2019-04-14 23:22:42.881000'),
(24, 'automation', '0011_auto_20190414_2324', '2019-04-14 23:24:51.643000'),
(25, 'automation', '0012_auto_20190414_2325', '2019-04-14 23:25:27.633000'),
(26, 'automation', '0013_auto_20190414_2326', '2019-04-14 23:26:24.525000'),
(27, 'automation', '0014_auto_20190414_2327', '2019-04-14 23:27:50.319000'),
(28, 'automation', '0015_auto_20190414_2328', '2019-04-14 23:28:30.156000'),
(29, 'automation', '0016_auto_20190414_2336', '2019-04-14 23:36:51.780000'),
(30, 'automation', '0017_auto_20190414_2339', '2019-04-14 23:39:21.996000'),
(31, 'automation', '0018_auto_20190414_2344', '2019-04-14 23:44:12.800000');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0xr7taup2cqy6n97gl0wqwbwxsgkgp3h', 'YTMwZThkODdhYjgwYTk3NTIxOTI5YmIwMzA0OTE1NGVmNjlhOTUyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiM2JiNjJkYTkxMDkzY2I1ZDc4ZTBkOGY4NzRkODFlNWQ2YzBmMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-28 20:19:44.213000'),
('u3v249bgaxn0gpnnrxv9p7d2n0ty7xtj', 'YTMwZThkODdhYjgwYTk3NTIxOTI5YmIwMzA0OTE1NGVmNjlhOTUyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdiM2JiNjJkYTkxMDkzY2I1ZDc4ZTBkOGY4NzRkODFlNWQ2YzBmMDUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-28 22:15:24.800000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
