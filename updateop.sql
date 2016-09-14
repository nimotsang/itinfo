/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : updateop

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-13 08:11:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addressbook_company
-- ----------------------------
DROP TABLE IF EXISTS `addressbook_company`;
CREATE TABLE `addressbook_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `comments` longtext,
  `tel` varchar(20),
  `website` varchar(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressbook_company
-- ----------------------------

-- ----------------------------
-- Table structure for addressbook_persons
-- ----------------------------
DROP TABLE IF EXISTS `addressbook_persons`;
CREATE TABLE `addressbook_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `contact` varchar(150) DEFAULT NULL,
  `comment` longtext,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbook_person_company_id_dc5ea8b6_fk_addressbook_company_id` (`company_id`),
  CONSTRAINT `addressbook_person_company_id_dc5ea8b6_fk_addressbook_company_id` FOREIGN KEY (`company_id`) REFERENCES `addressbook_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressbook_persons
-- ----------------------------

-- ----------------------------
-- Table structure for appinfo_app
-- ----------------------------
DROP TABLE IF EXISTS `appinfo_app`;
CREATE TABLE `appinfo_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `language` varchar(20) NOT NULL,
  `env` varchar(255) DEFAULT NULL,
  `plugs` varchar(255) NOT NULL,
  `requires` varchar(255) NOT NULL,
  `config_file` varchar(255) NOT NULL,
  `function` varchar(255) NOT NULL,
  `teams` varchar(255) NOT NULL,
  `dev_time` date DEFAULT NULL,
  `version` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appinfo_app_name_2f06497b_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo_app
-- ----------------------------
INSERT INTO `appinfo_app` VALUES ('1', 'accountWeb', 'groovy', 'centos6.6', '无', '无', 'server.xml,Config.xml', '帐号注册及管理', '研发中心', '2016-08-15', 'v1.2', '李四', '');

-- ----------------------------
-- Table structure for appinfo_business
-- ----------------------------
DROP TABLE IF EXISTS `appinfo_business`;
CREATE TABLE `appinfo_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `documents` longtext,
  `contacts` varchar(255) NOT NULL,
  `comments` longtext,
  `architecture` varchar(100) NOT NULL,
  `online` date,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appinfo_business_name_90afe023_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo_business
-- ----------------------------
INSERT INTO `appinfo_business` VALUES ('1', '收单', '<iframe src=\"http://127.0.0.1:8000/static/js/editor/kindeditor-4.1.10/plugins/baidumap/index.html?center=121.473704%2C31.230393&zoom=11&width=558&height=360&markers=121.473704%2C31.230393&markerStyles=l%2CA\" style=\"width:560px;height:362px;\" frameborder=\"0\">\r\n</iframe>\r\n<p>\r\n	fjfhfhgh\r\neq\r\ndfd\r\nfeqwfewfdasfdsa\r\n</p>\r\n<p>\r\n	fdasfwa\r\n</p>\r\n<p>\r\n	fe\r\n</p>\r\n<p>\r\n	awfafdsa\r\n</p>', '张飞', '收单系统', 'deploy/12786998_154129434166_2.png', '2016-08-15');

-- ----------------------------
-- Table structure for appinfo_business_deploys
-- ----------------------------
DROP TABLE IF EXISTS `appinfo_business_deploys`;
CREATE TABLE `appinfo_business_deploys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `deploy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appinfo_business_deploys_business_id_7e1d7165_uniq` (`business_id`,`deploy_id`),
  KEY `appinfo_business_deploys_deploy_id_260cbedc_fk_appinfo_deploy_id` (`deploy_id`),
  CONSTRAINT `appinfo_business_dep_business_id_cdbfa0e4_fk_appinfo_business_id` FOREIGN KEY (`business_id`) REFERENCES `appinfo_business` (`id`),
  CONSTRAINT `appinfo_business_deploys_deploy_id_260cbedc_fk_appinfo_deploy_id` FOREIGN KEY (`deploy_id`) REFERENCES `appinfo_deploy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo_business_deploys
-- ----------------------------
INSERT INTO `appinfo_business_deploys` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for appinfo_deploy
-- ----------------------------
DROP TABLE IF EXISTS `appinfo_deploy`;
CREATE TABLE `appinfo_deploy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `app_id` int(11) NOT NULL,
  `paths` varchar(255) NOT NULL,
  `users` varchar(255) NOT NULL,
  `boot_scripts` varchar(255) NOT NULL,
  `ports` int(11) NOT NULL,
  `logs` varchar(255) NOT NULL,
  `documents` varchar(100) NOT NULL,
  `author` varchar(255) NOT NULL,
  `times` date DEFAULT NULL,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appinfo_deploy_name_2aabe6bf_uniq` (`name`),
  KEY `appinfo_deploy_app_id_c69eb017_uniq` (`app_id`),
  KEY `appinfo_deploy_server_id_a4675786_fk_appinfo_server_id` (`server_id`),
  CONSTRAINT `appinfo_deploy_app_id_c69eb017_fk_appinfo_app_id` FOREIGN KEY (`app_id`) REFERENCES `appinfo_app` (`id`),
  CONSTRAINT `appinfo_deploy_server_id_a4675786_fk_appinfo_server_id` FOREIGN KEY (`server_id`) REFERENCES `appinfo_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo_deploy
-- ----------------------------
INSERT INTO `appinfo_deploy` VALUES ('1', 'accountWeb部署', '1', '/home/appuser/server/accountWeb_tomcat-9012', 'appuser', 'catalina.sh {start|stop|restart}', '9012', '/home/appuser/server/accountWeb_tomcat-9012/server.log', 'deploy/README.txt', '王五', '2016-08-27', '3');

-- ----------------------------
-- Table structure for appinfo_server
-- ----------------------------
DROP TABLE IF EXISTS `appinfo_server`;
CREATE TABLE `appinfo_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `zone` varchar(20) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(25) DEFAULT NULL,
  `contact` varchar(25) DEFAULT NULL,
  `factory_phone` varchar(25) DEFAULT NULL,
  `mod` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `cpu_freq` varchar(255) DEFAULT NULL,
  `cpu_core` int(11) DEFAULT NULL,
  `mem` varchar(255) DEFAULT NULL,
  `disk` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `buy_date` date DEFAULT NULL,
  `guaranteed` smallint(6) DEFAULT NULL,
  `cabinet` varchar(20) DEFAULT NULL,
  `idc` varchar(20) DEFAULT NULL,
  `comment` longtext,
  `raid` varchar(20),
  PRIMARY KEY (`id`),
  UNIQUE KEY `appinfo_server_name_1afdfe56_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appinfo_server
-- ----------------------------
INSERT INTO `appinfo_server` VALUES ('3', 'DSWND3X', '192.168.100.13', 'DMZ', 'DSWND3X', 'DELL', '张三', '13911055074', 'R620', '实体机', 'Intel Xeon E5-2603 0 1.80GHz', '2', '4G * 4', 'SAS-HDD 600GB * 2', '1U', '2016-08-15', '1', 'U58', '东单机房', '', '1');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 部门', '7', 'add_dept');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 部门', '7', 'change_dept');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 部门', '7', 'delete_dept');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 员工信息', '8', 'add_persons');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 员工信息', '8', 'change_persons');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 员工信息', '8', 'delete_persons');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 产品信息', '9', 'add_prod');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 产品信息', '9', 'change_prod');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 产品信息', '9', 'delete_prod');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 系统更新操作记录', '10', 'add_issue');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 系统更新操作记录', '10', 'change_issue');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 系统更新操作记录', '10', 'delete_issue');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 端口映射表', '14', 'add_portmapmaps');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 端口映射表', '14', 'change_portmapmaps');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 端口映射表', '14', 'delete_portmapmaps');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 内网IP', '15', 'add_portmaplanip');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 内网IP', '15', 'change_portmaplanip');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 内网IP', '15', 'delete_portmaplanip');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 公网IP', '16', 'add_portmapwanip');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 公网IP', '16', 'change_portmapwanip');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 公网IP', '16', 'delete_portmapwanip');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 服务器信息', '17', 'add_server');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 服务器信息', '17', 'change_server');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 服务器信息', '17', 'delete_server');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 部署信息', '18', 'add_deploy');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 部署信息', '18', 'change_deploy');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 部署信息', '18', 'delete_deploy');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 业务信息', '19', 'add_business');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 业务信息', '19', 'change_business');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 业务信息', '19', 'delete_business');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 应用信息', '20', 'add_app');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 应用信息', '20', 'change_app');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 应用信息', '20', 'delete_app');
INSERT INTO `auth_permission` VALUES ('61', 'Can add pos', '21', 'add_pos');
INSERT INTO `auth_permission` VALUES ('62', 'Can change pos', '21', 'change_pos');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete pos', '21', 'delete_pos');
INSERT INTO `auth_permission` VALUES ('64', 'Can add ipaddr', '22', 'add_ipaddr');
INSERT INTO `auth_permission` VALUES ('65', 'Can change ipaddr', '22', 'change_ipaddr');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete ipaddr', '22', 'delete_ipaddr');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户信息', '23', 'add_users');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户信息', '23', 'change_users');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户信息', '23', 'delete_users');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 服务器信息', '24', 'add_dbserver');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 服务器信息', '24', 'change_dbserver');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 服务器信息', '24', 'delete_dbserver');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 表空间信息', '25', 'add_tablespace');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 表空间信息', '25', 'change_tablespace');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 表空间信息', '25', 'delete_tablespace');
INSERT INTO `auth_permission` VALUES ('76', 'Can add company', '26', 'add_company');
INSERT INTO `auth_permission` VALUES ('77', 'Can change company', '26', 'change_company');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete company', '26', 'delete_company');
INSERT INTO `auth_permission` VALUES ('79', 'Can add persons', '27', 'add_persons');
INSERT INTO `auth_permission` VALUES ('80', 'Can change persons', '27', 'change_persons');
INSERT INTO `auth_permission` VALUES ('81', 'Can delete persons', '27', 'delete_persons');
INSERT INTO `auth_permission` VALUES ('82', 'Can add 快捷链接', '28', 'add_shortcut');
INSERT INTO `auth_permission` VALUES ('83', 'Can change 快捷链接', '28', 'change_shortcut');
INSERT INTO `auth_permission` VALUES ('84', 'Can delete 快捷链接', '28', 'delete_shortcut');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$30000$0S1y9QFB31Ui$V6soMWpjw202TQeG1T2OuLll7cYn3zglKVS6pFRAsWs=', '2016-08-30 13:44:58.613000', '1', 'admin', '', '', 'fdas@fa.com', '1', '1', '2016-07-04 01:48:18.712000');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$24000$VvS2Hjtg7aIq$n/vGJRH8yCwBUqoKMTEPw3NYwpH4z+syCqm3Wh2OnIk=', null, '0', 'test', '测试', '测试', '', '1', '1', '2016-07-04 02:11:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES ('1', '2', '28');
INSERT INTO `auth_user_user_permissions` VALUES ('2', '2', '29');
INSERT INTO `auth_user_user_permissions` VALUES ('3', '2', '30');

-- ----------------------------
-- Table structure for dbinfo_dbserver
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo_dbserver`;
CREATE TABLE `dbinfo_dbserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `root_pass` varchar(20) NOT NULL,
  `oracle_pass` varchar(20) NOT NULL,
  `grid_pass` varchar(20) NOT NULL,
  `oracle_sys` varchar(20) NOT NULL,
  `comment` longtext NOT NULL,
  `pos` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbinfo_dbserver
-- ----------------------------

-- ----------------------------
-- Table structure for dbinfo_dbserver_tablespace
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo_dbserver_tablespace`;
CREATE TABLE `dbinfo_dbserver_tablespace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbserver_id` int(11) NOT NULL,
  `tablespace_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbinfo_dbserver_Tablespace_dbserver_id_63e337cf_uniq` (`dbserver_id`,`tablespace_id`),
  KEY `dbinfo_dbserver_T_tablespace_id_5cf121e5_fk_dbinfo_tablespace_id` (`tablespace_id`),
  CONSTRAINT `dbinfo_dbserver_T_tablespace_id_5cf121e5_fk_dbinfo_tablespace_id` FOREIGN KEY (`tablespace_id`) REFERENCES `dbinfo_tablespace` (`id`),
  CONSTRAINT `dbinfo_dbserver_Table_dbserver_id_978ebd74_fk_dbinfo_dbserver_id` FOREIGN KEY (`dbserver_id`) REFERENCES `dbinfo_dbserver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbinfo_dbserver_tablespace
-- ----------------------------

-- ----------------------------
-- Table structure for dbinfo_tablespace
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo_tablespace`;
CREATE TABLE `dbinfo_tablespace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_name` varchar(30) NOT NULL,
  `tb_desc` varchar(30) NOT NULL,
  `tb_size` varchar(20) NOT NULL,
  `scripts` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbinfo_tablespace
-- ----------------------------

-- ----------------------------
-- Table structure for dbinfo_tablespace_users
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo_tablespace_users`;
CREATE TABLE `dbinfo_tablespace_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablespace_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbinfo_tablespace_users_tablespace_id_dada3a37_uniq` (`tablespace_id`,`users_id`),
  KEY `dbinfo_tablespace_users_users_id_0ea2888a_fk_dbinfo_users_id` (`users_id`),
  CONSTRAINT `dbinfo_tablespace_tablespace_id_3de25c29_fk_dbinfo_tablespace_id` FOREIGN KEY (`tablespace_id`) REFERENCES `dbinfo_tablespace` (`id`),
  CONSTRAINT `dbinfo_tablespace_users_users_id_0ea2888a_fk_dbinfo_users_id` FOREIGN KEY (`users_id`) REFERENCES `dbinfo_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbinfo_tablespace_users
-- ----------------------------

-- ----------------------------
-- Table structure for dbinfo_users
-- ----------------------------
DROP TABLE IF EXISTS `dbinfo_users`;
CREATE TABLE `dbinfo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created` date NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbinfo_users
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2016-07-04 01:48:51.714000', '1', 'BOSS', '1', '已添加。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2016-07-04 01:49:12.186000', '2', 'BTS', '1', '已添加。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2016-07-04 01:49:38.586000', '1', '研发部', '1', '已添加。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2016-07-04 01:49:51.103000', '2', '合规部', '1', '已添加。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2016-07-04 01:49:59.701000', '3', '系统运维部', '1', '已添加。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2016-07-04 01:50:12.076000', '4', '产品部', '1', '已添加。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2016-07-04 01:50:36.757000', '1', '张三', '1', '已添加。', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2016-07-04 01:50:56.407000', '2', '李四', '1', '已添加。', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2016-07-04 01:51:11.518000', '3', '王五', '1', '已添加。', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2016-07-04 01:51:26.701000', '4', '赵六', '1', '已添加。', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2016-07-04 01:52:20.257000', '1', '2001', '1', '已添加。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2016-07-04 01:55:10.686000', '2', '2002', '1', '已添加。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2016-07-04 02:11:23.644000', '2', 'test', '1', '已添加。', '4', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2016-07-04 02:11:55.796000', '2', 'test', '2', '已修改 first_name，last_name，is_staff 和 user_permissions 。', '4', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2016-07-04 09:47:22.707000', '1', '2001', '2', '没有字段被修改。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2016-07-04 09:47:27.363000', '2', '2002', '2', '没有字段被修改。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2016-07-04 09:51:40.479000', '3', '2003', '1', '已添加。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2016-07-04 09:52:23.603000', '4', '2004', '1', '已添加。', '10', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2016-07-05 22:39:34.378000', '1', '203.81.23.2', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('20', '2016-07-05 22:39:52.385000', '1', '', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('21', '2016-07-05 22:40:05.111000', '2', '', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('22', '2016-07-05 22:40:58.087000', '2', '', '3', '', null, '1');
INSERT INTO `django_admin_log` VALUES ('23', '2016-07-05 22:40:58.092000', '1', '', '3', '', null, '1');
INSERT INTO `django_admin_log` VALUES ('24', '2016-07-05 22:41:36.637000', '3', '192.168.100.105', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('25', '2016-07-05 22:42:01.721000', '1', '203.81.23.2', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('26', '2016-07-05 22:46:04.325000', '1', '203.81.23.2', '3', '', null, '1');
INSERT INTO `django_admin_log` VALUES ('27', '2016-07-05 22:46:41.047000', '2', '203.81.23.2', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('28', '2016-07-06 08:18:23.879000', '2', '203.81.23.1', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('29', '2016-07-06 08:18:38.568000', '3', '203.81.23.1', '1', '已添加。', null, '1');
INSERT INTO `django_admin_log` VALUES ('30', '2016-08-15 03:06:30.209000', '1', '192.168.100.1', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2016-08-15 03:14:57.221000', '2', '192.168.250.100', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2016-08-15 03:17:57.338000', '1', 'accountWeb', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2016-08-15 03:24:42.705000', '1', '收单帐号管理系统', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2016-08-15 03:27:32.654000', '1', '收单', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2016-08-15 06:35:31.481000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2016-08-15 06:37:54.473000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2016-08-15 06:44:40.797000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2016-08-15 06:47:43.982000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2016-08-15 06:57:18.959000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2016-08-15 07:02:53.093000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2016-08-15 07:58:48.853000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"online\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2016-08-15 08:04:05.318000', '1', '收单帐号管理系统', '2', '[{\"changed\": {\"fields\": [\"documents\", \"times\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2016-08-15 08:16:07.363000', '1', '123.45.21.3', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2016-08-15 08:18:12.339000', '1', '192.168.100.12', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2016-08-15 08:18:49.602000', '1', '123.45.21.3', '1', '[{\"added\": {}}]', '14', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2016-08-15 09:11:21.534000', '1', '192.168.100.1', '2', '[{\"changed\": {\"fields\": [\"mem\", \"disk\", \"size\", \"buy_date\"]}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2016-08-15 09:16:26.553000', '2', '192.168.250.100', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2016-08-15 09:16:45.820000', '1', '192.168.100.1', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2016-08-15 09:59:46.582000', '3', '192.168.100.13', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2016-08-27 02:00:02.541000', '1', 'accountWeb部署', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2016-08-27 12:36:32.381000', '1', 'accountWeb部署', '2', '[{\"changed\": {\"fields\": [\"documents\", \"times\"]}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2016-08-27 23:02:55.896000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"online\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2016-08-28 01:16:56.784000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"online\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2016-08-28 19:39:49.482000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"online\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2016-08-28 19:47:37.625000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"online\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2016-08-28 19:49:46.422000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"documents\", \"online\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2016-08-28 19:50:31.531000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"online\", \"architecture\"]}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2016-08-28 19:50:46.466000', '1', '收单', '2', '[{\"changed\": {\"fields\": [\"online\", \"architecture\"]}}]', '19', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('26', 'addressbook', 'company');
INSERT INTO `django_content_type` VALUES ('27', 'addressbook', 'persons');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('20', 'appinfo', 'app');
INSERT INTO `django_content_type` VALUES ('19', 'appinfo', 'business');
INSERT INTO `django_content_type` VALUES ('18', 'appinfo', 'deploy');
INSERT INTO `django_content_type` VALUES ('17', 'appinfo', 'server');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('24', 'dbinfo', 'dbserver');
INSERT INTO `django_content_type` VALUES ('25', 'dbinfo', 'tablespace');
INSERT INTO `django_content_type` VALUES ('23', 'dbinfo', 'users');
INSERT INTO `django_content_type` VALUES ('22', 'ipresource', 'ipaddr');
INSERT INTO `django_content_type` VALUES ('21', 'ipresource', 'pos');
INSERT INTO `django_content_type` VALUES ('15', 'portmap', 'portmaplanip');
INSERT INTO `django_content_type` VALUES ('14', 'portmap', 'portmapmaps');
INSERT INTO `django_content_type` VALUES ('16', 'portmap', 'portmapwanip');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('28', 'shortcut', 'shortcut');
INSERT INTO `django_content_type` VALUES ('7', 'updateOp', 'dept');
INSERT INTO `django_content_type` VALUES ('10', 'updateOp', 'issue');
INSERT INTO `django_content_type` VALUES ('8', 'updateOp', 'persons');
INSERT INTO `django_content_type` VALUES ('9', 'updateOp', 'prod');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-07-04 01:47:59.208000');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2016-07-04 01:47:59.601000');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2016-07-04 01:47:59.694000');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2016-07-04 01:47:59.718000');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2016-07-04 01:47:59.816000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2016-07-04 01:47:59.860000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2016-07-04 01:47:59.905000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2016-07-04 01:47:59.921000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2016-07-04 01:47:59.965000');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2016-07-04 01:47:59.970000');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2016-07-04 01:47:59.985000');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2016-07-04 01:48:00.030000');
INSERT INTO `django_migrations` VALUES ('13', 'updateOp', '0001_initial', '2016-07-04 01:48:00.518000');
INSERT INTO `django_migrations` VALUES ('14', 'updateOp', '0002_auto_20160706_0629', '2016-07-05 22:29:37.112000');
INSERT INTO `django_migrations` VALUES ('15', 'updateOp', '0003_auto_20160706_0639', '2016-07-05 22:39:10.305000');
INSERT INTO `django_migrations` VALUES ('16', 'updateOp', '0004_auto_20160706_0646', '2016-07-05 22:46:16.832000');
INSERT INTO `django_migrations` VALUES ('17', 'updateOp', '0005_auto_20160706_0743', '2016-07-05 23:43:09.296000');
INSERT INTO `django_migrations` VALUES ('18', 'auth', '0008_alter_user_username_max_length', '2016-08-14 22:11:59.254000');
INSERT INTO `django_migrations` VALUES ('19', 'appinfo', '0001_initial', '2016-08-15 01:53:38.473000');
INSERT INTO `django_migrations` VALUES ('20', 'portmap', '0001_initial', '2016-08-15 01:53:38.906000');
INSERT INTO `django_migrations` VALUES ('21', 'appinfo', '0002_auto_20160815_1006', '2016-08-15 02:06:29.882000');
INSERT INTO `django_migrations` VALUES ('22', 'updateOp', '0002_auto_20160815_1020', '2016-08-15 02:20:53.159000');
INSERT INTO `django_migrations` VALUES ('23', 'appinfo', '0003_auto_20160815_1122', '2016-08-15 03:22:36.003000');
INSERT INTO `django_migrations` VALUES ('24', 'appinfo', '0002_auto_20160815_1547', '2016-08-15 07:49:31.222000');
INSERT INTO `django_migrations` VALUES ('25', 'appinfo', '0003_auto_20160815_1549', '2016-08-15 07:49:54.425000');
INSERT INTO `django_migrations` VALUES ('26', 'appinfo', '0002_auto_20160815_1556', '2016-08-15 07:57:04.347000');
INSERT INTO `django_migrations` VALUES ('27', 'appinfo', '0003_auto_20160815_1710', '2016-08-15 09:10:58.004000');
INSERT INTO `django_migrations` VALUES ('28', 'appinfo', '0004_auto_20160815_1721', '2016-08-15 09:21:46.375000');
INSERT INTO `django_migrations` VALUES ('29', 'appinfo', '0002_auto_20160815_1751', '2016-08-15 09:52:00.158000');
INSERT INTO `django_migrations` VALUES ('30', 'appinfo', '0003_auto_20160815_1752', '2016-08-15 09:52:36.890000');
INSERT INTO `django_migrations` VALUES ('31', 'appinfo', '0004_auto_20160815_1754', '2016-08-15 09:54:46.958000');
INSERT INTO `django_migrations` VALUES ('32', 'ipresource', '0001_initial', '2016-08-20 14:44:13.932000');
INSERT INTO `django_migrations` VALUES ('33', 'ipresource', '0002_auto_20160820_2245', '2016-08-20 14:45:36.745000');
INSERT INTO `django_migrations` VALUES ('34', 'ipresource', '0003_auto_20160821_0903', '2016-08-21 01:04:05.915000');
INSERT INTO `django_migrations` VALUES ('35', 'dbinfo', '0001_initial', '2016-08-27 00:43:38.207000');
INSERT INTO `django_migrations` VALUES ('36', 'ipresource', '0004_auto_20160827_0635', '2016-08-27 00:43:38.238000');
INSERT INTO `django_migrations` VALUES ('37', 'appinfo', '0002_auto_20160827_0941', '2016-08-27 01:41:59.235000');
INSERT INTO `django_migrations` VALUES ('38', 'dbinfo', '0002_dbserver_pos', '2016-08-27 01:41:59.430000');
INSERT INTO `django_migrations` VALUES ('39', 'appinfo', '0003_auto_20160827_2035', '2016-08-27 12:35:19.447000');
INSERT INTO `django_migrations` VALUES ('40', 'addressbook', '0001_initial', '2016-08-29 06:14:32.660000');
INSERT INTO `django_migrations` VALUES ('41', 'addressbook', '0002_auto_20160829_1452', '2016-08-29 06:52:32.804000');
INSERT INTO `django_migrations` VALUES ('42', 'shortcut', '0001_initial', '2016-08-29 06:52:33.147000');
INSERT INTO `django_migrations` VALUES ('43', 'shortcut', '0002_auto_20160829_1457', '2016-08-29 06:57:54.046000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0hcvfavif54hq7iukhcdilsyqjbbpzye', 'M2ZjNjMwNjdjNmE0MTBiZGU3NjI4ODA5ZmI0NDJjOTdkNzA5NWIyMDp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI5ZWMwN2M1MWNiNGI4ODBkMjVhM2JjMjJiMmJlMWUwMTljZWY5YTQyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2016-08-30 03:34:08.442000');
INSERT INTO `django_session` VALUES ('5zhtwscppmbdsqzqahzgraytphaes52m', 'YjNjZjg2NTkxNjVmNDYzZmE2YTQ2OGY1MGIzY2RjZmMzZTJkYzU2Yjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NTU1NGQ5YTI0YTIwMDFiMzVhN2M2OGVhZDEwNGRmYzE5ODg0OTBiIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2016-07-18 08:15:11.129000');
INSERT INTO `django_session` VALUES ('anxcfjrukgnzl59mrvfgyag3o6dd0b4f', 'M2ZjNjMwNjdjNmE0MTBiZGU3NjI4ODA5ZmI0NDJjOTdkNzA5NWIyMDp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI5ZWMwN2M1MWNiNGI4ODBkMjVhM2JjMjJiMmJlMWUwMTljZWY5YTQyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2016-09-13 13:44:58.618000');
INSERT INTO `django_session` VALUES ('avsr77r146p0rauknu4b4sq8ud9kued4', 'N2ZiZjhmYTMyNTI1ZTA2MjQ4ODQxYjBiNTY3ZTgxM2I0YzIwMjkxNTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk1NTU0ZDlhMjRhMjAwMWIzNWE3YzY4ZWFkMTA0ZGZjMTk4ODQ5MGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-08-06 04:11:18.354000');
INSERT INTO `django_session` VALUES ('rzf7nv4uxyy1l6k8m1phyqa8mkdm7l8i', 'OGZmZTdlZjY1ZjE2NGZjMDA4MWJmZjgwNTczOTIxOGRlYjEwOGE2MDp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NTU1NGQ5YTI0YTIwMDFiMzVhN2M2OGVhZDEwNGRmYzE5ODg0OTBiIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-07-19 03:31:49.171000');
INSERT INTO `django_session` VALUES ('z7bd1pkb4nv22wzhuiqi972lx52bg135', 'YjNjZjg2NTkxNjVmNDYzZmE2YTQ2OGY1MGIzY2RjZmMzZTJkYzU2Yjp7InVzZXJuYW1lIjoiYWRtaW4iLCJfYXV0aF91c2VyX2hhc2giOiI5NTU1NGQ5YTI0YTIwMDFiMzVhN2M2OGVhZDEwNGRmYzE5ODg0OTBiIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2016-07-19 10:23:28.276000');

-- ----------------------------
-- Table structure for ipresource_ipaddr
-- ----------------------------
DROP TABLE IF EXISTS `ipresource_ipaddr`;
CREATE TABLE `ipresource_ipaddr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(39) NOT NULL,
  `vlan` int(11) NOT NULL,
  `func` varchar(20) NOT NULL,
  `assign` tinyint(1) NOT NULL,
  `comment` longtext NOT NULL,
  `pos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ipresource_ipaddr_6e6e97e3` (`pos_id`),
  CONSTRAINT `ipresource_ipaddr_pos_id_18cb65d0_fk_ipresource_pos_id` FOREIGN KEY (`pos_id`) REFERENCES `ipresource_pos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipresource_ipaddr
-- ----------------------------

-- ----------------------------
-- Table structure for ipresource_pos
-- ----------------------------
DROP TABLE IF EXISTS `ipresource_pos`;
CREATE TABLE `ipresource_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ipresource_pos
-- ----------------------------

-- ----------------------------
-- Table structure for portmap_portmaplanip
-- ----------------------------
DROP TABLE IF EXISTS `portmap_portmaplanip`;
CREATE TABLE `portmap_portmaplanip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `l_ip` varchar(20) NOT NULL,
  `l_name` varchar(255) NOT NULL,
  `detail` longtext NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portmap_portmaplanip
-- ----------------------------
INSERT INTO `portmap_portmaplanip` VALUES ('1', '192.168.100.12', '反向代理', 'www.cnepay.com 反向代理到192.168.250.123\r\nmail.cnepay.com 反向代理到192.168.250.133', '');

-- ----------------------------
-- Table structure for portmap_portmapmaps
-- ----------------------------
DROP TABLE IF EXISTS `portmap_portmapmaps`;
CREATE TABLE `portmap_portmapmaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_port` int(11) NOT NULL,
  `l_port` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `l_ip_id` int(11) NOT NULL,
  `w_ip_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portmap_portmapmaps_l_ip_id_82909cfb_fk_portmap_portmaplanip_id` (`l_ip_id`),
  KEY `portmap_portmapmaps_12c7e276` (`w_ip_id`),
  CONSTRAINT `portmap_portmapmaps_l_ip_id_82909cfb_fk_portmap_portmaplanip_id` FOREIGN KEY (`l_ip_id`) REFERENCES `portmap_portmaplanip` (`id`),
  CONSTRAINT `portmap_portmapmaps_w_ip_id_0c23b186_fk_portmap_portmapwanip_id` FOREIGN KEY (`w_ip_id`) REFERENCES `portmap_portmapwanip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portmap_portmapmaps
-- ----------------------------
INSERT INTO `portmap_portmapmaps` VALUES ('1', '80', '80', 'web访问端口', '1', '1');

-- ----------------------------
-- Table structure for portmap_portmapwanip
-- ----------------------------
DROP TABLE IF EXISTS `portmap_portmapwanip`;
CREATE TABLE `portmap_portmapwanip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_ip` varchar(20) NOT NULL,
  `firewall` varchar(255) NOT NULL,
  `f_location` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of portmap_portmapwanip
-- ----------------------------
INSERT INTO `portmap_portmapwanip` VALUES ('1', '123.45.21.3', '东单出口防火墙', '东单机房', '');

-- ----------------------------
-- Table structure for shortcut_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `shortcut_shortcut`;
CREATE TABLE `shortcut_shortcut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `website` varchar(150) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shortcut_shortcut
-- ----------------------------

-- ----------------------------
-- Table structure for updateop_dept
-- ----------------------------
DROP TABLE IF EXISTS `updateop_dept`;
CREATE TABLE `updateop_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_dept
-- ----------------------------
INSERT INTO `updateop_dept` VALUES ('1', '研发部', '北京研发');
INSERT INTO `updateop_dept` VALUES ('2', '合规部', '合规');
INSERT INTO `updateop_dept` VALUES ('3', '系统运维部', '系统运维');
INSERT INTO `updateop_dept` VALUES ('4', '产品部', '产品');

-- ----------------------------
-- Table structure for updateop_issue
-- ----------------------------
DROP TABLE IF EXISTS `updateop_issue`;
CREATE TABLE `updateop_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  `content` longtext,
  `issue_type` tinyint(1) NOT NULL,
  `op_time` date DEFAULT NULL,
  `rec_user` varchar(10) DEFAULT NULL,
  `rec_time` datetime(6) NOT NULL,
  `report_to_id` int(11) NOT NULL,
  `req_from_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `updateOp_issue_b9970ed0` (`report_to_id`),
  KEY `updateOp_issue_031e8b8f` (`req_from_id`),
  CONSTRAINT `updateOp_issue_report_to_id_bffb8ec0_fk_updateOp_persons_id` FOREIGN KEY (`report_to_id`) REFERENCES `updateop_persons` (`id`),
  CONSTRAINT `updateOp_issue_req_from_id_362d7497_fk_updateOp_persons_id` FOREIGN KEY (`req_from_id`) REFERENCES `updateop_persons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_issue
-- ----------------------------
INSERT INTO `updateop_issue` VALUES ('1', '2001', '1.增加了功能一。\r\n2.修复了bug2.', '1', '2016-07-04', 'admin', '2016-07-04 09:47:22.702000', '4', '4');
INSERT INTO `updateop_issue` VALUES ('2', '2002', '1.修复bug1\r\n2.修复bug2\r\n3.修复bug3', '0', '2016-07-04', 'admin', '2016-07-04 09:47:27.359000', '3', '3');
INSERT INTO `updateop_issue` VALUES ('3', '2003', '1.新增功能一\r\n2.新增功能二\r\n3.新增功能三', '1', '2016-07-04', 'admin', '2016-07-04 09:51:40.462000', '2', '4');
INSERT INTO `updateop_issue` VALUES ('4', '2004', '范德萨范德萨范德萨范德萨飞吻饿啊发发', '1', '2016-07-04', 'admin', '2016-07-04 09:52:23.592000', '4', '3');

-- ----------------------------
-- Table structure for updateop_issue_operator
-- ----------------------------
DROP TABLE IF EXISTS `updateop_issue_operator`;
CREATE TABLE `updateop_issue_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `persons_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `updateOp_issue_operator_issue_id_7ace2876_uniq` (`issue_id`,`persons_id`),
  KEY `updateOp_issue_operat_persons_id_5d018bc8_fk_updateOp_persons_id` (`persons_id`),
  CONSTRAINT `updateOp_issue_operat_persons_id_5d018bc8_fk_updateOp_persons_id` FOREIGN KEY (`persons_id`) REFERENCES `updateop_persons` (`id`),
  CONSTRAINT `updateOp_issue_operator_issue_id_52f32af1_fk_updateOp_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `updateop_issue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_issue_operator
-- ----------------------------
INSERT INTO `updateop_issue_operator` VALUES ('1', '1', '3');
INSERT INTO `updateop_issue_operator` VALUES ('2', '2', '3');
INSERT INTO `updateop_issue_operator` VALUES ('3', '3', '2');
INSERT INTO `updateop_issue_operator` VALUES ('4', '4', '2');

-- ----------------------------
-- Table structure for updateop_issue_prod
-- ----------------------------
DROP TABLE IF EXISTS `updateop_issue_prod`;
CREATE TABLE `updateop_issue_prod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `updateOp_issue_prod_issue_id_0dcb7a53_uniq` (`issue_id`,`prod_id`),
  KEY `updateOp_issue_prod_prod_id_4cbefa54_fk_updateOp_prod_id` (`prod_id`),
  CONSTRAINT `updateOp_issue_prod_issue_id_d76d0e65_fk_updateOp_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `updateop_issue` (`id`),
  CONSTRAINT `updateOp_issue_prod_prod_id_4cbefa54_fk_updateOp_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `updateop_prod` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_issue_prod
-- ----------------------------
INSERT INTO `updateop_issue_prod` VALUES ('1', '1', '2');
INSERT INTO `updateop_issue_prod` VALUES ('2', '2', '1');
INSERT INTO `updateop_issue_prod` VALUES ('3', '2', '2');
INSERT INTO `updateop_issue_prod` VALUES ('4', '3', '1');
INSERT INTO `updateop_issue_prod` VALUES ('5', '3', '2');
INSERT INTO `updateop_issue_prod` VALUES ('6', '4', '1');

-- ----------------------------
-- Table structure for updateop_persons
-- ----------------------------
DROP TABLE IF EXISTS `updateop_persons`;
CREATE TABLE `updateop_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `isvalid` tinyint(1) NOT NULL,
  `remark` longtext NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `updateOp_persons_dept_id_4f1e2e78_fk_updateOp_dept_id` (`dept_id`),
  CONSTRAINT `updateOp_persons_dept_id_4f1e2e78_fk_updateOp_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `updateop_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_persons
-- ----------------------------
INSERT INTO `updateop_persons` VALUES ('1', '张三', '1233432324', 'fdsaf@fdas.com', '1', 'fdsfads ff发送发', '1');
INSERT INTO `updateop_persons` VALUES ('2', '李四', '1324324', 'fdasf@1fdasf.com', '1', '发 发大水奋斗', '2');
INSERT INTO `updateop_persons` VALUES ('3', '王五', '14324324', 'fdafdasf@fdasf.com', '1', '', '3');
INSERT INTO `updateop_persons` VALUES ('4', '赵六', '432143214', 'dsaf@fdas.com', '1', '', '4');

-- ----------------------------
-- Table structure for updateop_prod
-- ----------------------------
DROP TABLE IF EXISTS `updateop_prod`;
CREATE TABLE `updateop_prod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of updateop_prod
-- ----------------------------
INSERT INTO `updateop_prod` VALUES ('1', 'BOSS', '收单管理系统');
INSERT INTO `updateop_prod` VALUES ('2', 'BTS', '核心交易系统，对内部人员使用');
