/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : python_shop

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-07-31 10:11:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authtoken_token`
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('4ea3179747b7f8863742e09e883fa11c3ff7a612', '2018-06-23 11:49:32.923353', '1');

-- ----------------------------
-- Table structure for `auth_group`
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
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add group', '1', 'add_group');
INSERT INTO `auth_permission` VALUES ('2', 'Can change group', '1', 'change_group');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete group', '1', 'delete_group');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can view group', '1', 'view_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can view content type', '3', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '4', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '4', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '4', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can view session', '4', 'view_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can add 用户', '5', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can change 用户', '5', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete 用户', '5', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can add 验证码', '6', 'add_verifycode');
INSERT INTO `auth_permission` VALUES ('21', 'Can change 验证码', '6', 'change_verifycode');
INSERT INTO `auth_permission` VALUES ('22', 'Can delete 验证码', '6', 'delete_verifycode');
INSERT INTO `auth_permission` VALUES ('23', 'Can view 用户', '5', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 验证码', '6', 'view_verifycode');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 商品类型', '7', 'add_goodscategory');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 商品类型', '7', 'change_goodscategory');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 商品类型', '7', 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 商品', '8', 'add_goods');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 商品', '8', 'change_goods');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 商品', '8', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 商品的轮播图', '9', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 商品的轮播图', '9', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 商品的轮播图', '9', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 商品品牌', '10', 'add_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 商品品牌', '10', 'change_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 商品品牌', '10', 'delete_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 首页轮播图', '11', 'add_banner');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 首页轮播图', '11', 'change_banner');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 首页轮播图', '11', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 首页轮播图', '11', 'view_banner');
INSERT INTO `auth_permission` VALUES ('41', 'Can view 商品', '8', 'view_goods');
INSERT INTO `auth_permission` VALUES ('42', 'Can view 商品类型', '7', 'view_goodscategory');
INSERT INTO `auth_permission` VALUES ('43', 'Can view 商品品牌', '10', 'view_goodscategorybrand');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 商品的轮播图', '9', 'view_goodsimage');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 订单商品详情', '12', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 订单商品详情', '12', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 订单商品详情', '12', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('48', 'Can add 订单', '13', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('49', 'Can change 订单', '13', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('50', 'Can delete 订单', '13', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('51', 'Can add 购物车', '14', 'add_shopingcart');
INSERT INTO `auth_permission` VALUES ('52', 'Can change 购物车', '14', 'change_shopingcart');
INSERT INTO `auth_permission` VALUES ('53', 'Can delete 购物车', '14', 'delete_shopingcart');
INSERT INTO `auth_permission` VALUES ('54', 'Can view 订单商品详情', '12', 'view_ordergoods');
INSERT INTO `auth_permission` VALUES ('55', 'Can view 订单', '13', 'view_orderinfo');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 购物车', '14', 'view_shopingcart');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 用户收藏', '15', 'add_userfav');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 用户收藏', '15', 'change_userfav');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 用户收藏', '15', 'delete_userfav');
INSERT INTO `auth_permission` VALUES ('60', 'Can add 用户留言', '16', 'add_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can change 用户留言', '16', 'change_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('62', 'Can delete 用户留言', '16', 'delete_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('63', 'Can add 收货地址', '17', 'add_useraddress');
INSERT INTO `auth_permission` VALUES ('64', 'Can change 收货地址', '17', 'change_useraddress');
INSERT INTO `auth_permission` VALUES ('65', 'Can delete 收货地址', '17', 'delete_useraddress');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 收货地址', '17', 'view_useraddress');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 用户收藏', '15', 'view_userfav');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 用户留言', '16', 'view_userleavingmessage');
INSERT INTO `auth_permission` VALUES ('69', 'Can add log entry', '18', 'add_log');
INSERT INTO `auth_permission` VALUES ('70', 'Can change log entry', '18', 'change_log');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete log entry', '18', 'delete_log');
INSERT INTO `auth_permission` VALUES ('72', 'Can add User Setting', '19', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('73', 'Can change User Setting', '19', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('74', 'Can delete User Setting', '19', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('75', 'Can add Bookmark', '20', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('76', 'Can change Bookmark', '20', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('77', 'Can delete Bookmark', '20', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('78', 'Can add User Widget', '21', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('79', 'Can change User Widget', '21', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('80', 'Can delete User Widget', '21', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('81', 'Can view Bookmark', '20', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can view log entry', '18', 'view_log');
INSERT INTO `auth_permission` VALUES ('83', 'Can view User Setting', '19', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('84', 'Can view User Widget', '21', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('85', 'Can add Token', '22', 'add_token');
INSERT INTO `auth_permission` VALUES ('86', 'Can change Token', '22', 'change_token');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete Token', '22', 'delete_token');
INSERT INTO `auth_permission` VALUES ('88', 'Can view Token', '22', 'view_token');
INSERT INTO `auth_permission` VALUES ('89', 'Can add 首页商品类型广告图片', '23', 'add_indexad');
INSERT INTO `auth_permission` VALUES ('90', 'Can change 首页商品类型广告图片', '23', 'change_indexad');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete 首页商品类型广告图片', '23', 'delete_indexad');
INSERT INTO `auth_permission` VALUES ('92', 'Can view 首页商品类型广告图片', '23', 'view_indexad');
INSERT INTO `auth_permission` VALUES ('93', 'Can add partial', '24', 'add_partial');
INSERT INTO `auth_permission` VALUES ('94', 'Can change partial', '24', 'change_partial');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete partial', '24', 'delete_partial');
INSERT INTO `auth_permission` VALUES ('96', 'Can add code', '25', 'add_code');
INSERT INTO `auth_permission` VALUES ('97', 'Can change code', '25', 'change_code');
INSERT INTO `auth_permission` VALUES ('98', 'Can delete code', '25', 'delete_code');
INSERT INTO `auth_permission` VALUES ('99', 'Can add user social auth', '26', 'add_usersocialauth');
INSERT INTO `auth_permission` VALUES ('100', 'Can change user social auth', '26', 'change_usersocialauth');
INSERT INTO `auth_permission` VALUES ('101', 'Can delete user social auth', '26', 'delete_usersocialauth');
INSERT INTO `auth_permission` VALUES ('102', 'Can add nonce', '27', 'add_nonce');
INSERT INTO `auth_permission` VALUES ('103', 'Can change nonce', '27', 'change_nonce');
INSERT INTO `auth_permission` VALUES ('104', 'Can delete nonce', '27', 'delete_nonce');
INSERT INTO `auth_permission` VALUES ('105', 'Can add association', '28', 'add_association');
INSERT INTO `auth_permission` VALUES ('106', 'Can change association', '28', 'change_association');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete association', '28', 'delete_association');
INSERT INTO `auth_permission` VALUES ('108', 'Can view association', '28', 'view_association');
INSERT INTO `auth_permission` VALUES ('109', 'Can view code', '25', 'view_code');
INSERT INTO `auth_permission` VALUES ('110', 'Can view nonce', '27', 'view_nonce');
INSERT INTO `auth_permission` VALUES ('111', 'Can view partial', '24', 'view_partial');
INSERT INTO `auth_permission` VALUES ('112', 'Can view user social auth', '26', 'view_usersocialauth');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('22', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('7', 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodscategorybrand');
INSERT INTO `django_content_type` VALUES ('9', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('23', 'goods', 'indexad');
INSERT INTO `django_content_type` VALUES ('4', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('28', 'social_django', 'association');
INSERT INTO `django_content_type` VALUES ('25', 'social_django', 'code');
INSERT INTO `django_content_type` VALUES ('27', 'social_django', 'nonce');
INSERT INTO `django_content_type` VALUES ('24', 'social_django', 'partial');
INSERT INTO `django_content_type` VALUES ('26', 'social_django', 'usersocialauth');
INSERT INTO `django_content_type` VALUES ('12', 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('13', 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('14', 'trade', 'shopingcart');
INSERT INTO `django_content_type` VALUES ('5', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES ('17', 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES ('15', 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES ('16', 'user_operation', 'userleavingmessage');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('18', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('19', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-23 09:46:42.637797');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-06-23 09:46:42.762804');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-06-23 09:46:43.140826');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-06-23 09:46:43.223830');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-06-23 09:46:43.231831');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-06-23 09:46:43.243832');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-06-23 09:46:43.252832');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-06-23 09:46:43.257832');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-06-23 09:46:43.265833');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-06-23 09:46:43.275833');
INSERT INTO `django_migrations` VALUES ('11', 'goods', '0001_initial', '2018-06-23 09:46:44.019876');
INSERT INTO `django_migrations` VALUES ('12', 'goods', '0002_goods_goods_nums', '2018-06-23 09:46:44.099881');
INSERT INTO `django_migrations` VALUES ('13', 'goods', '0003_auto_20180623_0943', '2018-06-23 09:46:44.160884');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-06-23 09:46:44.218887');
INSERT INTO `django_migrations` VALUES ('15', 'users', '0001_initial', '2018-06-23 09:46:44.718916');
INSERT INTO `django_migrations` VALUES ('16', 'trade', '0001_initial', '2018-06-23 09:46:45.370953');
INSERT INTO `django_migrations` VALUES ('17', 'user_operation', '0001_initial', '2018-06-23 09:46:45.860981');
INSERT INTO `django_migrations` VALUES ('18', 'user_operation', '0002_auto_20180621_1404', '2018-06-23 09:46:45.877982');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-06-23 09:46:46.377011');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-06-23 09:46:46.579022');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-06-23 09:46:46.669027');
INSERT INTO `django_migrations` VALUES ('22', 'goods', '0004_auto_20180623_0950', '2018-06-23 09:50:45.661697');
INSERT INTO `django_migrations` VALUES ('23', 'authtoken', '0001_initial', '2018-06-23 11:43:33.558799');
INSERT INTO `django_migrations` VALUES ('24', 'authtoken', '0002_auto_20160226_1747', '2018-06-23 11:43:33.709807');
INSERT INTO `django_migrations` VALUES ('25', 'goods', '0005_auto_20180623_1142', '2018-06-23 11:43:33.812813');
INSERT INTO `django_migrations` VALUES ('26', 'goods', '0006_auto_20180623_1143', '2018-06-23 11:43:33.823814');
INSERT INTO `django_migrations` VALUES ('27', 'goods', '0007_auto_20180626_1504', '2018-06-26 15:04:51.740489');
INSERT INTO `django_migrations` VALUES ('28', 'user_operation', '0003_auto_20180626_1504', '2018-06-26 15:04:51.807493');
INSERT INTO `django_migrations` VALUES ('29', 'trade', '0002_auto_20180626_1712', '2018-06-26 17:12:44.956372');
INSERT INTO `django_migrations` VALUES ('30', 'trade', '0003_auto_20180627_1023', '2018-06-27 10:23:55.149784');
INSERT INTO `django_migrations` VALUES ('31', 'trade', '0004_auto_20180627_1036', '2018-06-27 10:36:41.283604');
INSERT INTO `django_migrations` VALUES ('32', 'trade', '0005_auto_20180627_1701', '2018-06-27 17:01:36.419837');
INSERT INTO `django_migrations` VALUES ('33', 'goods', '0008_indexad', '2018-06-29 11:24:07.059927');
INSERT INTO `django_migrations` VALUES ('34', 'goods', '0009_auto_20180629_1135', '2018-06-29 11:35:52.841295');
INSERT INTO `django_migrations` VALUES ('35', 'default', '0001_initial', '2018-06-30 09:57:43.488060');
INSERT INTO `django_migrations` VALUES ('36', 'social_auth', '0001_initial', '2018-06-30 09:57:43.492060');
INSERT INTO `django_migrations` VALUES ('37', 'default', '0002_add_related_name', '2018-06-30 09:57:43.600066');
INSERT INTO `django_migrations` VALUES ('38', 'social_auth', '0002_add_related_name', '2018-06-30 09:57:43.605067');
INSERT INTO `django_migrations` VALUES ('39', 'default', '0003_alter_email_max_length', '2018-06-30 09:57:43.683071');
INSERT INTO `django_migrations` VALUES ('40', 'social_auth', '0003_alter_email_max_length', '2018-06-30 09:57:43.688071');
INSERT INTO `django_migrations` VALUES ('41', 'default', '0004_auto_20160423_0400', '2018-06-30 09:57:43.708072');
INSERT INTO `django_migrations` VALUES ('42', 'social_auth', '0004_auto_20160423_0400', '2018-06-30 09:57:43.714073');
INSERT INTO `django_migrations` VALUES ('43', 'social_auth', '0005_auto_20160727_2333', '2018-06-30 09:57:43.744074');
INSERT INTO `django_migrations` VALUES ('44', 'social_django', '0006_partial', '2018-06-30 09:57:43.802078');
INSERT INTO `django_migrations` VALUES ('45', 'social_django', '0007_code_timestamp', '2018-06-30 09:57:43.897083');
INSERT INTO `django_migrations` VALUES ('46', 'social_django', '0008_partial_timestamp', '2018-06-30 09:57:43.984088');
INSERT INTO `django_migrations` VALUES ('47', 'social_django', '0003_alter_email_max_length', '2018-06-30 09:57:43.992089');
INSERT INTO `django_migrations` VALUES ('48', 'social_django', '0002_add_related_name', '2018-06-30 09:57:43.997089');
INSERT INTO `django_migrations` VALUES ('49', 'social_django', '0001_initial', '2018-06-30 09:57:44.003089');
INSERT INTO `django_migrations` VALUES ('50', 'social_django', '0005_auto_20160727_2333', '2018-06-30 09:57:44.008090');
INSERT INTO `django_migrations` VALUES ('51', 'social_django', '0004_auto_20160423_0400', '2018-06-30 09:57:44.013090');
INSERT INTO `django_migrations` VALUES ('52', 'goods', '0010_auto_20180718_1637', '2018-07-18 16:37:30.329606');
INSERT INTO `django_migrations` VALUES ('53', 'goods', '0011_auto_20180718_2038', '2018-07-18 20:38:22.888245');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('06ql7j60t316zairvififad33jinn6c0', 'OTkxNjZhMGUzODVhMjk4N2UzNDk5NmIxYWVjNjYzYjJlNjUwZDQ4Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImdvb2RzIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-08-01 19:59:28.551729');
INSERT INTO `django_session` VALUES ('1pppah5o4zx4gwira0ab2ekae2p99hno', 'ODIzNWUxMDE1YzI1ZmE1ZTdjMjExNGI0Y2E0MTc5YmRiMDU3YzJlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19', '2018-08-01 20:03:09.761381');
INSERT INTO `django_session` VALUES ('55ts0hcfgxj5yi3rckdm4p6zegzuc6fj', 'ODIzNWUxMDE1YzI1ZmE1ZTdjMjExNGI0Y2E0MTc5YmRiMDU3YzJlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwiIl19', '2018-08-01 20:11:12.768008');
INSERT INTO `django_session` VALUES ('5hovssnrz3ojon2whz979i22p1pcyfc7', 'ZTgyODExZTMyYzYwYmY5MTcyYTM5YzVjYzhjYjUyNjA0OTA3M2RmYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RmNzM4OWRjZDljOGQxMTQxYzY3MTUzNzQ3NGFlZWRiZTM4MWU5YyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCJ9', '2018-07-09 17:39:48.731029');
INSERT INTO `django_session` VALUES ('68thw7uwic5vf7t9kh0a1whfeq51pm7i', 'NTUwNDFkZGE0NmM4OWFmYzg2OTkwMzI1OGY3Mzk4ODAwNzE4YmFkYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiYmFubmVyIl0sIiJdfQ==', '2018-08-01 20:14:13.120323');
INSERT INTO `django_session` VALUES ('ainl9ybwg2t1df2z16yr694z30dwo9d9', 'ZmMyMGM4NTNiMzMwNmU5YzJiMjBjODViMzNhOTExY2EwYzk4MzRmNDp7IndlaWJvX3N0YXRlIjoiNTY5ek9yMm9kRVBKUnFLOGVUQ0l0VDFtYWVhaVY1YUQifQ==', '2018-07-14 10:09:53.085790');
INSERT INTO `django_session` VALUES ('anjjmdbqswx6w34btwfojoxbiwmb9ewb', 'MWNjYTExOGMwZTFiN2E4ZDJmYzFlYmRlZjMzOTVhZmE2ZmFhYTMyNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2018-07-10 16:06:13.350065');
INSERT INTO `django_session` VALUES ('di2ia0441xm94eacbj3w4jp4p46z0mgz', 'NDQ3Yjg5YzU3YWU1ODA3OGI2NGU3Yzg3Zjc2NzlmOGIyZGI3NGUxZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RmNzM4OWRjZDljOGQxMTQxYzY3MTUzNzQ3NGFlZWRiZTM4MWU5YyJ9', '2018-07-11 10:14:54.563864');
INSERT INTO `django_session` VALUES ('kqrb2p1tqgiag4zs2v3qua0m4kmwpyw4', 'NmE2MzUxZGQzMGVjMWFiNTQ5NGNkNTVhMGE3Nzg3NzdiODQwMThkNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbU1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiM2RmNzM4OWRjZDljOGQxMTQxYzY3MTUzNzQ3NGFlZWRiZTM4MWU5YyJ9', '2018-07-07 17:30:28.550606');
INSERT INTO `django_session` VALUES ('rceyn09ouzdidyxrnsc5smo7ngt7ocmr', 'YzJkNjA1YzIyNmIyZTQyYzhlYmIyZWI1ODcyYmY4NDU2NTY2ZDg1Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RmNzM4OWRjZDljOGQxMTQxYzY3MTUzNzQ3NGFlZWRiZTM4MWU5YyJ9', '2018-07-13 17:06:31.889543');
INSERT INTO `django_session` VALUES ('xce8zmboaq18lobi1lv60txm8m9lpz10', 'ZGFhNWFkYWY5ODUyODY5MmEyMjM5ZWNmOTc0Mjk2YTg5YmM1YTFlZTp7IndlaWJvX3N0YXRlIjoiZ05jbkdvWnozS1VpQVROTFRJY0IyQ1J1REJHdnBxV24iLCJfYXV0aF91c2VyX2hhc2giOiIzZGY3Mzg5ZGNkOWM4ZDExNDFjNjcxNTM3NDc0YWVlZGJlMzgxZTljIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1siZ29vZHMiLCJnb29kc2NhdGVnb3J5YnJhbmQiXSwiIl0sIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-07-14 10:10:14.143995');
INSERT INTO `django_session` VALUES ('xwr9upsrv8y0z1tjvdn7nb4iz8m55wlo', 'ODQ2ZTljNjVjZGFmN2YwMWE0YWJhMzA0MmYxYzc3NjQxNzFlZGU1MTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNkZjczODlkY2Q5YzhkMTE0MWM2NzE1Mzc0NzRhZWVkYmUzODFlOWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIkxJU1RfUVVFUlkiOltbImdvb2RzIiwiZ29vZHMiXSwibz0tc29sZF9udW0uLWdvb2RzX251bXMiXX0=', '2018-07-13 17:07:48.068900');

-- ----------------------------
-- Table structure for `goods_banner`
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_banner
-- ----------------------------
INSERT INTO `goods_banner` VALUES ('1', 'banner/banner1.jpg', '1', '2018-06-29 09:51:00.000000', '1');
INSERT INTO `goods_banner` VALUES ('2', 'banner/banner2.jpg', '2', '2018-06-29 09:51:00.000000', '2');
INSERT INTO `goods_banner` VALUES ('3', 'banner/banner3.jpg', '3', '2018-06-29 09:51:00.000000', '3');

-- ----------------------------
-- Table structure for `goods_goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `goods_brief` varchar(200) DEFAULT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_desc` longtext NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `goods_nums` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES ('1', '2222222222222222', '新鲜水果甜蜜香脆单果约800克', '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '1', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/1_P_1449024889889.jpg', '1', '232', '156', '1', '1', '2018-06-23 09:47:00.000000', '20', '0');
INSERT INTO `goods_goods` VALUES ('2', '2222222222222222', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', '前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '5', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/3_P_1448945490837.jpg', '1', '106', '88', '1', '0', '2018-06-23 09:47:00.000000', '7', '0');
INSERT INTO `goods_goods` VALUES ('3', '', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/7_P_1448945104883.jpg', '1', '286', '238', '0', '0', '2018-06-23 09:47:20.262949', '15', '0');
INSERT INTO `goods_goods` VALUES ('4', '', '日本蒜蓉粉丝扇贝270克6只装', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/47_P_1448946213263.jpg', '1', '156', '108', '0', '0', '2018-06-23 09:47:20.275950', '20', '0');
INSERT INTO `goods_goods` VALUES ('5', '222222', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', '0', '10', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/10_P_1448944572085.jpg', '1', '106', '88', '0', '0', '2018-06-23 09:47:00.000000', '7', '0');
INSERT INTO `goods_goods` VALUES ('6', '', '乌拉圭进口牛肉卷特级肥牛卷', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/4_P_1448945381985.jpg', '1', '90', '75', '0', '0', '2018-06-23 09:47:20.299951', '21', '0');
INSERT INTO `goods_goods` VALUES ('7', '', '五星眼肉牛排套餐8片装原味原切生鲜牛肉', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/8_P_1448945032810.jpg', '1', '150', '125', '0', '0', '2018-06-23 09:47:20.311952', '23', '0');
INSERT INTO `goods_goods` VALUES ('8', '', '澳洲进口120天谷饲牛仔骨4份原味生鲜', '', '2', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/11_P_1448944388277.jpg', '1', '31', '26', '0', '0', '2018-06-23 09:47:20.321952', '7', '0');
INSERT INTO `goods_goods` VALUES ('9', '', '潮香村澳洲进口牛排家庭团购套餐20片', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/6_P_1448945167279.jpg', '1', '239', '199', '0', '0', '2018-06-23 09:47:20.334953', '22', '0');
INSERT INTO `goods_goods` VALUES ('10', '', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', '', '8', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/9_P_1448944791617.jpg', '1', '202', '168', '0', '0', '2018-06-23 09:47:20.346954', '20', '-1');
INSERT INTO `goods_goods` VALUES ('11', '111111111111111111111', '澳洲进口牛尾巴300g新鲜肥牛肉', '新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '7', '1', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/3_P_1448945490837.jpg', '1', '306', '255', '0', '1', '2018-06-23 09:47:00.000000', '2', '-1');
INSERT INTO `goods_goods` VALUES ('12', null, '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', '19', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/2_P_1448945810202.jpg', '1', '126', '88', '0', '0', '2018-06-23 09:47:00.000000', '7', '0');
INSERT INTO `goods_goods` VALUES ('13', '444444444444444', '澳洲进口安格斯牛切片上脑牛排1000g', '澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性', '20', '5', '2', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/5_P_1448945270390.jpg', '1', '144', '120', '0', '0', '2018-06-23 09:47:00.000000', '12', '84');
INSERT INTO `goods_goods` VALUES ('14', '帐篷出租', '帐篷出租', '帐篷出租', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/5_P_1448945270390.jpg', '1', '120', '100', '0', '0', '2018-06-23 09:47:00.000000', '21', '0');
INSERT INTO `goods_goods` VALUES ('15', '', '52度茅台集团国隆双喜酒500mlx6', '贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/16_P_1448947194687.jpg', '1', '23', '19', '0', '0', '2018-06-23 09:47:20.401957', '37', '0');
INSERT INTO `goods_goods` VALUES ('16', '', '52度水井坊臻酿八號500ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/14_P_1448947354031.jpg', '1', '43', '36', '0', '0', '2018-06-23 09:47:20.408957', '36', '0');
INSERT INTO `goods_goods` VALUES ('17', '', '53度茅台仁酒500ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/12_P_1448947547989.jpg', '1', '190', '158', '0', '0', '2018-06-23 09:47:20.417958', '32', '0');
INSERT INTO `goods_goods` VALUES ('18', '', '双响炮洋酒JimBeamwhiskey美国白占边', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/46_P_1448946598711.jpg', '1', '38', '28', '0', '0', '2018-06-23 09:47:20.423958', '29', '0');
INSERT INTO `goods_goods` VALUES ('19', '', '西夫拉姆进口洋酒小酒版', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/21_P_1448946793276.jpg', '1', '55', '46', '0', '0', '2018-06-23 09:47:20.432959', '36', '0');
INSERT INTO `goods_goods` VALUES ('20', '', '茅台53度飞天茅台500ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/15_P_1448947257324.jpg', '1', '22', '18', '0', '0', '2018-06-23 09:47:20.441959', '30', '0');
INSERT INTO `goods_goods` VALUES ('21', '', '52度兰陵·紫气东来1600mL山东名酒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/13_P_1448947460386.jpg', '1', '42', '35', '0', '0', '2018-06-23 09:47:20.451960', '29', '0');
INSERT INTO `goods_goods` VALUES ('22', '', 'JohnnieWalker尊尼获加黑牌威士忌', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/50_P_1448946543091.jpg', '1', '24', '20', '0', '0', '2018-06-23 09:47:20.463960', '36', '0');
INSERT INTO `goods_goods` VALUES ('23', '', '人头马CLUB特优香槟干邑350ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/51_P_1448946466595.jpg', '1', '31', '26', '0', '0', '2018-06-23 09:47:20.472961', '30', '0');
INSERT INTO `goods_goods` VALUES ('24', '', '张裕干红葡萄酒750ml*6支', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/17_P_1448947102246.jpg', '1', '54', '45', '0', '0', '2018-06-23 09:47:20.482962', '31', '0');
INSERT INTO `goods_goods` VALUES ('25', '', '原瓶原装进口洋酒烈酒法国云鹿XO白兰地', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/20_P_1448946850602.jpg', '1', '46', '38', '0', '0', '2018-06-23 09:47:20.488962', '29', '0');
INSERT INTO `goods_goods` VALUES ('26', '', '法国原装进口圣贝克干红葡萄酒750ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/19_P_1448946951581.jpg', '1', '82', '68', '0', '0', '2018-06-23 09:47:20.495962', '25', '0');
INSERT INTO `goods_goods` VALUES ('27', '', '法国百利威干红葡萄酒AOP级6支装', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/18_P_1448947011435.jpg', '1', '67', '56', '0', '0', '2018-06-23 09:47:20.504963', '25', '0');
INSERT INTO `goods_goods` VALUES ('28', '', '芝华士12年苏格兰威士忌700ml', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/22_P_1448946729629.jpg', '1', '71', '59', '0', '0', '2018-06-23 09:47:20.511963', '30', '0');
INSERT INTO `goods_goods` VALUES ('29', '', '深蓝伏特加巴维兰利口酒送预调酒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/45_P_1448946661303.jpg', '1', '31', '18', '0', '0', '2018-06-23 09:47:20.517964', '36', '0');
INSERT INTO `goods_goods` VALUES ('30', '', '赣南脐橙特级果10斤装', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/32_P_1448948525620.jpg', '1', '43', '36', '0', '0', '2018-06-23 09:47:20.524964', '62', '0');
INSERT INTO `goods_goods` VALUES ('31', '', '泰国菠萝蜜16-18斤1个装', '【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/30_P_1448948663450.jpg', '1', '11', '9', '0', '0', '2018-06-23 09:47:20.531964', '66', '0');
INSERT INTO `goods_goods` VALUES ('32', '', '四川双流草莓新鲜水果礼盒2盒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/31_P_1448948598947.jpg', '1', '22', '18', '0', '0', '2018-06-23 09:47:20.543965', '70', '0');
INSERT INTO `goods_goods` VALUES ('33', '33333333333333', '新鲜头茬非洲冰草冰菜', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/35_P_1448948333610.jpg', '1', '67', '56', '0', '1', '2018-06-23 09:47:00.000000', '58', '0');
INSERT INTO `goods_goods` VALUES ('34', '', '仿真蔬菜水果果蔬菜模型', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/36_P_1448948234405.jpg', '1', '6', '5', '0', '0', '2018-06-23 09:47:20.564966', '58', '0');
INSERT INTO `goods_goods` VALUES ('35', '', '现摘芭乐番石榴台湾珍珠芭乐', '海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/33_P_1448948479966.jpg', '1', '28', '23', '0', '0', '2018-06-23 09:47:20.573967', '62', '0');
INSERT INTO `goods_goods` VALUES ('36', '', '潍坊萝卜5斤/箱礼盒', '脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/34_P_1448948399009.jpg', '1', '46', '38', '0', '0', '2018-06-23 09:47:20.582967', '70', '0');
INSERT INTO `goods_goods` VALUES ('37', '', '休闲零食膨化食品焦糖/奶油/椒麻味', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/43_P_1448948762645.jpg', '1', '154', '99', '0', '0', '2018-06-23 09:47:20.590968', '74', '0');
INSERT INTO `goods_goods` VALUES ('38', '', '蒙牛未来星儿童成长牛奶骨力型190ml*15盒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/38_P_1448949220255.jpg', '1', '84', '70', '0', '0', '2018-06-23 09:47:20.598968', '105', '0');
INSERT INTO `goods_goods` VALUES ('39', '', '蒙牛特仑苏有机奶250ml×12盒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/44_P_1448948850187.jpg', '1', '70', '32', '0', '0', '2018-06-23 09:47:20.605969', '103', '0');
INSERT INTO `goods_goods` VALUES ('40', '', '1元支付测试商品', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/44_P_1448948850187.jpg', '1', '1', '1', '0', '0', '2018-06-23 09:47:20.612969', '102', '0');
INSERT INTO `goods_goods` VALUES ('41', '', '德运全脂新鲜纯牛奶1L*10盒装整箱', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/40_P_1448949038702.jpg', '1', '70', '58', '0', '0', '2018-06-23 09:47:20.619969', '103', '0');
INSERT INTO `goods_goods` VALUES ('42', '', '木糖醇红枣早餐奶即食豆奶粉538g', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/39_P_1448949115481.jpg', '1', '38', '32', '0', '0', '2018-06-23 09:47:20.626970', '106', '0');
INSERT INTO `goods_goods` VALUES ('43', '', '高钙液体奶200ml*24盒', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/41_P_1448948980358.jpg', '1', '26', '22', '0', '0', '2018-06-23 09:47:20.634970', '107', '0');
INSERT INTO `goods_goods` VALUES ('44', '', '新西兰进口全脂奶粉900g', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/37_P_1448949284365.jpg', '1', '720', '600', '0', '0', '2018-06-23 09:47:20.642971', '104', '0');
INSERT INTO `goods_goods` VALUES ('45', '', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/42_P_1448948895193.jpg', '1', '43', '36', '0', '0', '2018-06-23 09:47:20.651971', '103', '0');
INSERT INTO `goods_goods` VALUES ('46', '444444444444444', '维纳斯橄榄菜籽油5L/桶', '维纳斯橄榄菜籽油5L/桶', '0', '5', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/27_P_1448947771805.jpg', '1', '187', '156', '0', '0', '2018-06-23 09:47:00.000000', '51', '0');
INSERT INTO `goods_goods` VALUES ('47', '', '糙米450gx3包粮油米面', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/23_P_1448948070348.jpg', '1', '18', '15', '0', '0', '2018-06-23 09:47:20.666972', '41', '0');
INSERT INTO `goods_goods` VALUES ('48', '', '精炼一级大豆油5L色拉油粮油食用油', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/26_P_1448947825754.jpg', '1', '54', '45', '0', '0', '2018-06-23 09:47:20.673972', '56', '0');
INSERT INTO `goods_goods` VALUES ('49', '', '橄榄玉米油5L*2桶', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/28_P_1448947699948.jpg', '1', '31', '26', '0', '0', '2018-06-23 09:47:20.681973', '54', '0');
INSERT INTO `goods_goods` VALUES ('50', '', '山西黑米农家黑米4斤', '', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 'goods/images/24_P_1448948023823.jpg', '1', '11', '9', '0', '0', '2018-06-23 09:47:20.691973', '55', '0');
INSERT INTO `goods_goods` VALUES ('51', '444444444444444', '稻园牌稻米油粮油米糠油绿色植物油', '稻园牌稻米油粮油米糠油绿色植物油', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/25_P_1448947875346.jpg', '1', '14', '12', '0', '0', '2018-06-23 09:47:00.000000', '47', '0');
INSERT INTO `goods_goods` VALUES ('52', '2222222222222222', '融氏纯玉米胚芽油5l桶', '融氏纯玉米胚芽油5l桶', '0', '0', '0', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 'goods/images/29_P_1448947631994.jpg', '1', '14', '12', '0', '0', '2018-06-23 09:47:00.000000', '41', '0');

-- ----------------------------
-- Table structure for `goods_goodsbrand`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsbrand`;
CREATE TABLE `goods_goodsbrand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `desc` varchar(1000) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodsbrand
-- ----------------------------
INSERT INTO `goods_goodsbrand` VALUES ('1', '艾尔', 'brands/sxsp-2.jpg', '艾尔艾尔艾尔', '2018-06-29 10:56:00.000000', '1');
INSERT INTO `goods_goodsbrand` VALUES ('2', '金贷', 'brands/sxsp-1.jpg', '金贷金贷', '2018-06-29 10:56:00.000000', '24');
INSERT INTO `goods_goodsbrand` VALUES ('3', '发育宝', 'brands/sxsp-3.jpg', '发育宝发育宝', '2018-06-29 11:33:00.000000', '1');
INSERT INTO `goods_goodsbrand` VALUES ('4', 'lyfs', 'brands/lyfs-1.jpg', 'lyfs', '2018-06-29 11:33:00.000000', '24');

-- ----------------------------
-- Table structure for `goods_goodscategory`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext,
  `category_type` int(11) DEFAULT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
INSERT INTO `goods_goodscategory` VALUES ('1', '生鲜食品', 'sxsp', '', '1', '1', '2018-06-23 09:47:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('2', '精品肉类', 'jprl', '', '2', '0', '2018-06-23 09:47:12.953531', '1');
INSERT INTO `goods_goodscategory` VALUES ('3', '羊肉', 'yr', '', '3', '0', '2018-06-23 09:47:12.956531', '2');
INSERT INTO `goods_goodscategory` VALUES ('4', '禽类', 'ql', '', '3', '0', '2018-06-23 09:47:12.962531', '2');
INSERT INTO `goods_goodscategory` VALUES ('5', '猪肉', 'zr', '', '3', '0', '2018-06-23 09:47:12.965532', '2');
INSERT INTO `goods_goodscategory` VALUES ('6', '牛肉', 'nr', '', '3', '0', '2018-06-23 09:47:12.968532', '2');
INSERT INTO `goods_goodscategory` VALUES ('7', '海鲜水产', 'hxsc', '', '2', '0', '2018-06-23 09:47:12.971532', '1');
INSERT INTO `goods_goodscategory` VALUES ('8', '参鲍', 'cb', '', '3', '0', '2018-06-23 09:47:12.974532', '7');
INSERT INTO `goods_goodscategory` VALUES ('9', '鱼', 'yu', '', '3', '0', '2018-06-23 09:47:12.978532', '7');
INSERT INTO `goods_goodscategory` VALUES ('10', '虾', 'xia', '', '3', '0', '2018-06-23 09:47:12.981532', '7');
INSERT INTO `goods_goodscategory` VALUES ('11', '蟹/贝', 'xb', '', '3', '0', '2018-06-23 09:47:12.984533', '7');
INSERT INTO `goods_goodscategory` VALUES ('12', '蛋制品', 'dzp', '', '2', '0', '2018-06-23 09:47:12.987533', '1');
INSERT INTO `goods_goodscategory` VALUES ('13', '松花蛋/咸鸭蛋', 'xhd_xyd', '', '3', '0', '2018-06-23 09:47:12.990533', '12');
INSERT INTO `goods_goodscategory` VALUES ('14', '鸡蛋', 'jd', '', '3', '0', '2018-06-23 09:47:12.994533', '12');
INSERT INTO `goods_goodscategory` VALUES ('15', '叶菜类', 'ycl', '', '2', '0', '2018-06-23 09:47:12.997533', '1');
INSERT INTO `goods_goodscategory` VALUES ('16', '生菜', 'sc', '', '3', '0', '2018-06-23 09:47:13.000534', '15');
INSERT INTO `goods_goodscategory` VALUES ('17', '菠菜', 'bc', '', '3', '0', '2018-06-23 09:47:13.003534', '15');
INSERT INTO `goods_goodscategory` VALUES ('18', '圆椒', 'yj', '', '3', '0', '2018-06-23 09:47:13.006534', '15');
INSERT INTO `goods_goodscategory` VALUES ('19', '西兰花', 'xlh', '', '3', '0', '2018-06-23 09:47:13.009534', '15');
INSERT INTO `goods_goodscategory` VALUES ('20', '根茎类', 'gjl', '', '2', '0', '2018-06-23 09:47:13.012534', '1');
INSERT INTO `goods_goodscategory` VALUES ('21', '茄果类', 'qgl', '', '2', '0', '2018-06-23 09:47:13.015534', '1');
INSERT INTO `goods_goodscategory` VALUES ('22', '菌菇类', 'jgl', '', '2', '0', '2018-06-23 09:47:13.019535', '1');
INSERT INTO `goods_goodscategory` VALUES ('23', '进口生鲜', 'jksx', '', '2', '0', '2018-06-23 09:47:13.023535', '1');
INSERT INTO `goods_goodscategory` VALUES ('24', '酒水饮料', 'jsyl', '', '1', '1', '2018-06-23 09:47:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('25', '白酒', 'bk', '', '2', '0', '2018-06-23 09:47:13.032535', '24');
INSERT INTO `goods_goodscategory` VALUES ('26', '五粮液', 'wly', '', '3', '0', '2018-06-23 09:47:13.036536', '25');
INSERT INTO `goods_goodscategory` VALUES ('27', '泸州老窖', 'lzlj', '', '3', '0', '2018-06-23 09:47:13.039536', '25');
INSERT INTO `goods_goodscategory` VALUES ('28', '茅台', 'mt', '', '3', '0', '2018-06-23 09:47:13.042536', '25');
INSERT INTO `goods_goodscategory` VALUES ('29', '葡萄酒', 'ptj', '', '2', '0', '2018-06-23 09:47:13.045536', '24');
INSERT INTO `goods_goodscategory` VALUES ('30', '洋酒', 'yj', '', '2', '0', '2018-06-23 09:47:13.049536', '24');
INSERT INTO `goods_goodscategory` VALUES ('31', '啤酒', 'pj', '', '2', '0', '2018-06-23 09:47:13.052537', '24');
INSERT INTO `goods_goodscategory` VALUES ('32', '其他酒品', 'qtjp', '', '2', '0', '2018-06-23 09:47:13.055537', '24');
INSERT INTO `goods_goodscategory` VALUES ('33', '其他品牌', 'qtpp', '', '3', '0', '2018-06-23 09:47:13.059537', '32');
INSERT INTO `goods_goodscategory` VALUES ('34', '黄酒', 'hj', '', '3', '0', '2018-06-23 09:47:13.062537', '32');
INSERT INTO `goods_goodscategory` VALUES ('35', '养生酒', 'ysj', '', '3', '0', '2018-06-23 09:47:13.065537', '32');
INSERT INTO `goods_goodscategory` VALUES ('36', '饮料/水', 'yls', '', '2', '0', '2018-06-23 09:47:13.068537', '24');
INSERT INTO `goods_goodscategory` VALUES ('37', '红酒', 'hj', '', '2', '0', '2018-06-23 09:47:13.071538', '24');
INSERT INTO `goods_goodscategory` VALUES ('38', '白兰地', 'bld', '', '3', '0', '2018-06-23 09:47:13.074538', '37');
INSERT INTO `goods_goodscategory` VALUES ('39', '威士忌', 'wsj', '', '3', '0', '2018-06-23 09:47:13.077538', '37');
INSERT INTO `goods_goodscategory` VALUES ('40', '粮油副食', '粮油副食', '', '1', '1', '2018-06-23 09:47:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('41', '食用油', '食用油', '', '2', '0', '2018-06-23 09:47:13.084538', '40');
INSERT INTO `goods_goodscategory` VALUES ('42', '其他食用油', '其他食用油', '', '3', '0', '2018-06-23 09:47:13.087539', '41');
INSERT INTO `goods_goodscategory` VALUES ('43', '菜仔油', '菜仔油', '', '3', '0', '2018-06-23 09:47:13.091539', '41');
INSERT INTO `goods_goodscategory` VALUES ('44', '花生油', '花生油', '', '3', '0', '2018-06-23 09:47:13.094539', '41');
INSERT INTO `goods_goodscategory` VALUES ('45', '橄榄油', '橄榄油', '', '3', '0', '2018-06-23 09:47:13.097539', '41');
INSERT INTO `goods_goodscategory` VALUES ('46', '礼盒', '礼盒', '', '3', '0', '2018-06-23 09:47:13.100539', '41');
INSERT INTO `goods_goodscategory` VALUES ('47', '米面杂粮', '米面杂粮', '', '2', '0', '2018-06-23 09:47:13.103539', '40');
INSERT INTO `goods_goodscategory` VALUES ('48', '面粉/面条', '面粉/面条', '', '3', '0', '2018-06-23 09:47:13.106540', '47');
INSERT INTO `goods_goodscategory` VALUES ('49', '大米', '大米', '', '3', '0', '2018-06-23 09:47:13.109540', '47');
INSERT INTO `goods_goodscategory` VALUES ('50', '意大利面', '意大利面', '', '3', '0', '2018-06-23 09:47:13.112540', '47');
INSERT INTO `goods_goodscategory` VALUES ('51', '厨房调料', '厨房调料', '', '2', '0', '2018-06-23 09:47:13.115540', '40');
INSERT INTO `goods_goodscategory` VALUES ('52', '调味油/汁', '调味油/汁', '', '3', '0', '2018-06-23 09:47:13.118540', '51');
INSERT INTO `goods_goodscategory` VALUES ('53', '酱油/醋', '酱油/醋', '', '3', '0', '2018-06-23 09:47:13.121540', '51');
INSERT INTO `goods_goodscategory` VALUES ('54', '南北干货', '南北干货', '', '2', '0', '2018-06-23 09:47:13.125541', '40');
INSERT INTO `goods_goodscategory` VALUES ('55', '方便速食', '方便速食', '', '2', '0', '2018-06-23 09:47:13.129541', '40');
INSERT INTO `goods_goodscategory` VALUES ('56', '调味品', '调味品', '', '2', '0', '2018-06-23 09:47:13.132541', '40');
INSERT INTO `goods_goodscategory` VALUES ('57', '蔬菜水果', '蔬菜水果', '', '1', '1', '2018-06-23 09:47:00.000000', null);
INSERT INTO `goods_goodscategory` VALUES ('58', '有机蔬菜', '有机蔬菜', '', '2', '0', '2018-06-23 09:47:13.138541', '57');
INSERT INTO `goods_goodscategory` VALUES ('59', '西红柿', '西红柿', '', '3', '0', '2018-06-23 09:47:13.141542', '58');
INSERT INTO `goods_goodscategory` VALUES ('60', '韭菜', '韭菜', '', '3', '0', '2018-06-23 09:47:13.145542', '58');
INSERT INTO `goods_goodscategory` VALUES ('61', '青菜', '青菜', '', '3', '0', '2018-06-23 09:47:13.148542', '58');
INSERT INTO `goods_goodscategory` VALUES ('62', '精选蔬菜', '精选蔬菜', '', '2', '0', '2018-06-23 09:47:13.154542', '57');
INSERT INTO `goods_goodscategory` VALUES ('63', '甘蓝', '甘蓝', '', '3', '0', '2018-06-23 09:47:13.157543', '62');
INSERT INTO `goods_goodscategory` VALUES ('64', '胡萝卜', '胡萝卜', '', '3', '0', '2018-06-23 09:47:13.161543', '62');
INSERT INTO `goods_goodscategory` VALUES ('65', '黄瓜', '黄瓜', '', '3', '0', '2018-06-23 09:47:13.164543', '62');
INSERT INTO `goods_goodscategory` VALUES ('66', '进口水果', '进口水果', '', '2', '0', '2018-06-23 09:47:13.167543', '57');
INSERT INTO `goods_goodscategory` VALUES ('67', '火龙果', '火龙果', '', '3', '0', '2018-06-23 09:47:13.170543', '66');
INSERT INTO `goods_goodscategory` VALUES ('68', '菠萝蜜', '菠萝蜜', '', '3', '0', '2018-06-23 09:47:13.173543', '66');
INSERT INTO `goods_goodscategory` VALUES ('69', '奇异果', '奇异果', '', '3', '0', '2018-06-23 09:47:13.176544', '66');
INSERT INTO `goods_goodscategory` VALUES ('70', '国产水果', '国产水果', '', '2', '0', '2018-06-23 09:47:13.179544', '57');
INSERT INTO `goods_goodscategory` VALUES ('71', '水果礼盒', '水果礼盒', '', '3', '0', '2018-06-23 09:47:13.183544', '70');
INSERT INTO `goods_goodscategory` VALUES ('72', '苹果', '苹果', '', '3', '0', '2018-06-23 09:47:13.186544', '70');
INSERT INTO `goods_goodscategory` VALUES ('73', '雪梨', '雪梨', '', '3', '0', '2018-06-23 09:47:13.189544', '70');
INSERT INTO `goods_goodscategory` VALUES ('74', '休闲食品', '休闲食品', '', '1', '0', '2018-06-23 09:47:13.192545', null);
INSERT INTO `goods_goodscategory` VALUES ('75', '休闲零食', '休闲零食', '', '2', '0', '2018-06-23 09:47:13.195545', '74');
INSERT INTO `goods_goodscategory` VALUES ('76', '果冻', '果冻', '', '3', '0', '2018-06-23 09:47:13.198545', '75');
INSERT INTO `goods_goodscategory` VALUES ('77', '枣类', '枣类', '', '3', '0', '2018-06-23 09:47:13.202545', '75');
INSERT INTO `goods_goodscategory` VALUES ('78', '蜜饯', '蜜饯', '', '3', '0', '2018-06-23 09:47:13.212546', '75');
INSERT INTO `goods_goodscategory` VALUES ('79', '肉类零食', '肉类零食', '', '3', '0', '2018-06-23 09:47:13.216546', '75');
INSERT INTO `goods_goodscategory` VALUES ('80', '坚果炒货', '坚果炒货', '', '3', '0', '2018-06-23 09:47:13.220546', '75');
INSERT INTO `goods_goodscategory` VALUES ('81', '糖果', '糖果', '', '2', '0', '2018-06-23 09:47:13.223546', '74');
INSERT INTO `goods_goodscategory` VALUES ('82', '创意喜糖', '创意喜糖', '', '3', '0', '2018-06-23 09:47:13.227547', '81');
INSERT INTO `goods_goodscategory` VALUES ('83', '口香糖', '口香糖', '', '3', '0', '2018-06-23 09:47:13.231547', '81');
INSERT INTO `goods_goodscategory` VALUES ('84', '软糖', '软糖', '', '3', '0', '2018-06-23 09:47:13.235547', '81');
INSERT INTO `goods_goodscategory` VALUES ('85', '棒棒糖', '棒棒糖', '', '3', '0', '2018-06-23 09:47:13.238547', '81');
INSERT INTO `goods_goodscategory` VALUES ('86', '巧克力', '巧克力', '', '2', '0', '2018-06-23 09:47:13.242547', '74');
INSERT INTO `goods_goodscategory` VALUES ('87', '夹心巧克力', '夹心巧克力', '', '3', '0', '2018-06-23 09:47:13.246548', '86');
INSERT INTO `goods_goodscategory` VALUES ('88', '白巧克力', '白巧克力', '', '3', '0', '2018-06-23 09:47:13.250548', '86');
INSERT INTO `goods_goodscategory` VALUES ('89', '松露巧克力', '松露巧克力', '', '3', '0', '2018-06-23 09:47:13.254548', '86');
INSERT INTO `goods_goodscategory` VALUES ('90', '黑巧克力', '黑巧克力', '', '3', '0', '2018-06-23 09:47:13.257548', '86');
INSERT INTO `goods_goodscategory` VALUES ('91', '肉干肉脯/豆干', '肉干肉脯/豆干', '', '2', '0', '2018-06-23 09:47:13.261548', '74');
INSERT INTO `goods_goodscategory` VALUES ('92', '牛肉干', '牛肉干', '', '3', '0', '2018-06-23 09:47:13.264549', '91');
INSERT INTO `goods_goodscategory` VALUES ('93', '猪肉脯', '猪肉脯', '', '3', '0', '2018-06-23 09:47:13.267549', '91');
INSERT INTO `goods_goodscategory` VALUES ('94', '牛肉粒', '牛肉粒', '', '3', '0', '2018-06-23 09:47:13.270549', '91');
INSERT INTO `goods_goodscategory` VALUES ('95', '猪肉干', '猪肉干', '', '3', '0', '2018-06-23 09:47:13.273549', '91');
INSERT INTO `goods_goodscategory` VALUES ('96', '鱿鱼丝/鱼干', '鱿鱼丝/鱼干', '', '2', '0', '2018-06-23 09:47:13.277549', '74');
INSERT INTO `goods_goodscategory` VALUES ('97', '鱿鱼足', '鱿鱼足', '', '3', '0', '2018-06-23 09:47:13.280550', '96');
INSERT INTO `goods_goodscategory` VALUES ('98', '鱿鱼丝', '鱿鱼丝', '', '3', '0', '2018-06-23 09:47:13.283550', '96');
INSERT INTO `goods_goodscategory` VALUES ('99', '墨鱼/乌贼', '墨鱼/乌贼', '', '3', '0', '2018-06-23 09:47:13.286550', '96');
INSERT INTO `goods_goodscategory` VALUES ('100', '鱿鱼仔', '鱿鱼仔', '', '3', '0', '2018-06-23 09:47:13.289550', '96');
INSERT INTO `goods_goodscategory` VALUES ('101', '鱿鱼片', '鱿鱼片', '', '3', '0', '2018-06-23 09:47:13.292550', '96');
INSERT INTO `goods_goodscategory` VALUES ('102', '奶类食品', '奶类食品', '', '1', '0', '2018-06-23 09:47:13.295550', null);
INSERT INTO `goods_goodscategory` VALUES ('103', '进口奶品', '进口奶品', '', '2', '0', '2018-06-23 09:47:13.298551', '102');
INSERT INTO `goods_goodscategory` VALUES ('104', '国产奶品', '国产奶品', '', '2', '0', '2018-06-23 09:47:13.302551', '102');
INSERT INTO `goods_goodscategory` VALUES ('105', '奶粉', '奶粉', '', '2', '0', '2018-06-23 09:47:13.305551', '102');
INSERT INTO `goods_goodscategory` VALUES ('106', '有机奶', '有机奶', '', '2', '0', '2018-06-23 09:47:13.308551', '102');
INSERT INTO `goods_goodscategory` VALUES ('107', '原料奶', '原料奶', '', '2', '0', '2018-06-23 09:47:13.311551', '102');
INSERT INTO `goods_goodscategory` VALUES ('108', '天然干货', '天然干货', '', '1', '0', '2018-06-23 09:47:13.314552', null);
INSERT INTO `goods_goodscategory` VALUES ('109', '菌菇类', '菌菇类', '', '2', '0', '2018-06-23 09:47:13.317552', '108');
INSERT INTO `goods_goodscategory` VALUES ('110', '腌干海产', '腌干海产', '', '2', '0', '2018-06-23 09:47:13.320552', '108');
INSERT INTO `goods_goodscategory` VALUES ('111', '汤料', '汤料', '', '2', '0', '2018-06-23 09:47:13.323552', '108');
INSERT INTO `goods_goodscategory` VALUES ('112', '豆类', '豆类', '', '2', '0', '2018-06-23 09:47:13.326552', '108');
INSERT INTO `goods_goodscategory` VALUES ('113', '干菜/菜干', '干菜/菜干', '', '2', '0', '2018-06-23 09:47:13.330552', '108');
INSERT INTO `goods_goodscategory` VALUES ('114', '干果/果干', '干果/果干', '', '2', '0', '2018-06-23 09:47:13.333553', '108');
INSERT INTO `goods_goodscategory` VALUES ('115', '豆制品', '豆制品', '', '2', '0', '2018-06-23 09:47:13.337553', '108');
INSERT INTO `goods_goodscategory` VALUES ('116', '腊味', '腊味', '', '2', '0', '2018-06-23 09:47:13.341553', '108');
INSERT INTO `goods_goodscategory` VALUES ('117', '精选茗茶', '精选茗茶', '', '1', '0', '2018-06-23 09:47:13.344553', null);
INSERT INTO `goods_goodscategory` VALUES ('118', '白茶', '白茶', '', '2', '0', '2018-06-23 09:47:13.347553', '117');
INSERT INTO `goods_goodscategory` VALUES ('119', '红茶', '红茶', '', '2', '0', '2018-06-23 09:47:13.350554', '117');
INSERT INTO `goods_goodscategory` VALUES ('120', '绿茶', '绿茶', '', '2', '0', '2018-06-23 09:47:13.352554', '117');

-- ----------------------------
-- Table structure for `goods_goodsimage`
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsimage`;
CREATE TABLE `goods_goodsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_goodsimage
-- ----------------------------
INSERT INTO `goods_goodsimage` VALUES ('1', 'goods/images/1_P_1449024889889.jpg', '2018-06-23 09:47:20.226947', '1');
INSERT INTO `goods_goodsimage` VALUES ('2', 'goods/images/1_P_1449024889264.jpg', '2018-06-23 09:47:20.234947', '1');
INSERT INTO `goods_goodsimage` VALUES ('3', 'goods/images/1_P_1449024889726.jpg', '2018-06-23 09:47:20.237948', '1');
INSERT INTO `goods_goodsimage` VALUES ('4', 'goods/images/1_P_1449024889018.jpg', '2018-06-23 09:47:20.243948', '1');
INSERT INTO `goods_goodsimage` VALUES ('5', 'goods/images/1_P_1449024889287.jpg', '2018-06-23 09:47:20.246948', '1');
INSERT INTO `goods_goodsimage` VALUES ('6', 'goods/images/2_P_1448945810814.jpg', '2018-06-23 09:47:20.254948', '2');
INSERT INTO `goods_goodsimage` VALUES ('7', 'goods/images/2_P_1448945810814.jpg', '2018-06-23 09:47:20.259949', '2');
INSERT INTO `goods_goodsimage` VALUES ('8', 'goods/images/7_P_1448945104883.jpg', '2018-06-23 09:47:20.268949', '3');
INSERT INTO `goods_goodsimage` VALUES ('9', 'goods/images/7_P_1448945104734.jpg', '2018-06-23 09:47:20.272950', '3');
INSERT INTO `goods_goodsimage` VALUES ('10', 'goods/images/47_P_1448946213263.jpg', '2018-06-23 09:47:20.279950', '4');
INSERT INTO `goods_goodsimage` VALUES ('11', 'goods/images/47_P_1448946213157.jpg', '2018-06-23 09:47:20.281950', '4');
INSERT INTO `goods_goodsimage` VALUES ('12', 'goods/images/10_P_1448944572085.jpg', '2018-06-23 09:47:20.288950', '5');
INSERT INTO `goods_goodsimage` VALUES ('13', 'goods/images/10_P_1448944572532.jpg', '2018-06-23 09:47:20.294951', '5');
INSERT INTO `goods_goodsimage` VALUES ('14', 'goods/images/10_P_1448944572872.jpg', '2018-06-23 09:47:20.296951', '5');
INSERT INTO `goods_goodsimage` VALUES ('15', 'goods/images/4_P_1448945381985.jpg', '2018-06-23 09:47:20.303951', '6');
INSERT INTO `goods_goodsimage` VALUES ('16', 'goods/images/4_P_1448945381013.jpg', '2018-06-23 09:47:20.308952', '6');
INSERT INTO `goods_goodsimage` VALUES ('17', 'goods/images/8_P_1448945032810.jpg', '2018-06-23 09:47:20.315952', '7');
INSERT INTO `goods_goodsimage` VALUES ('18', 'goods/images/8_P_1448945032646.jpg', '2018-06-23 09:47:20.318952', '7');
INSERT INTO `goods_goodsimage` VALUES ('19', 'goods/images/11_P_1448944388277.jpg', '2018-06-23 09:47:20.325953', '8');
INSERT INTO `goods_goodsimage` VALUES ('20', 'goods/images/11_P_1448944388034.jpg', '2018-06-23 09:47:20.328953', '8');
INSERT INTO `goods_goodsimage` VALUES ('21', 'goods/images/11_P_1448944388201.jpg', '2018-06-23 09:47:20.331953', '8');
INSERT INTO `goods_goodsimage` VALUES ('22', 'goods/images/6_P_1448945167279.jpg', '2018-06-23 09:47:20.340953', '9');
INSERT INTO `goods_goodsimage` VALUES ('23', 'goods/images/6_P_1448945167015.jpg', '2018-06-23 09:47:20.344954', '9');
INSERT INTO `goods_goodsimage` VALUES ('24', 'goods/images/9_P_1448944791617.jpg', '2018-06-23 09:47:20.351954', '10');
INSERT INTO `goods_goodsimage` VALUES ('25', 'goods/images/9_P_1448944791129.jpg', '2018-06-23 09:47:20.353954', '10');
INSERT INTO `goods_goodsimage` VALUES ('26', 'goods/images/9_P_1448944791077.jpg', '2018-06-23 09:47:20.356954', '10');
INSERT INTO `goods_goodsimage` VALUES ('27', 'goods/images/9_P_1448944791229.jpg', '2018-06-23 09:47:20.358954', '10');
INSERT INTO `goods_goodsimage` VALUES ('28', 'goods/images/3_P_1448945490837.jpg', '2018-06-23 09:47:20.365955', '11');
INSERT INTO `goods_goodsimage` VALUES ('29', 'goods/images/5_P_1448945270390_7sQWgKP.jpg', '2018-06-23 09:47:20.368955', '11');
INSERT INTO `goods_goodsimage` VALUES ('30', 'goods/images/15_P_1448947257324_Jsd6JXk.jpg', '2018-06-23 09:47:20.374955', '12');
INSERT INTO `goods_goodsimage` VALUES ('31', 'goods/images/48_P_1448943988898.jpg', '2018-06-23 09:47:20.377956', '12');
INSERT INTO `goods_goodsimage` VALUES ('32', 'goods/images/48_P_1448943988439.jpg', '2018-06-23 09:47:20.380956', '12');
INSERT INTO `goods_goodsimage` VALUES ('33', 'goods/images/5_P_1448945270390.jpg', '2018-06-23 09:47:20.387956', '13');
INSERT INTO `goods_goodsimage` VALUES ('34', 'goods/images/5_P_1448945270067.jpg', '2018-06-23 09:47:20.389956', '13');
INSERT INTO `goods_goodsimage` VALUES ('35', 'goods/images/5_P_1448945270432.jpg', '2018-06-23 09:47:20.392956', '13');
INSERT INTO `goods_goodsimage` VALUES ('36', 'images/201705/goods_img/53_P_1495068879687.jpg', '2018-06-23 09:47:20.399957', '14');
INSERT INTO `goods_goodsimage` VALUES ('37', 'goods/images/16_P_1448947194687.jpg', '2018-06-23 09:47:20.405957', '15');
INSERT INTO `goods_goodsimage` VALUES ('38', 'goods/images/14_P_1448947354031.jpg', '2018-06-23 09:47:20.411957', '16');
INSERT INTO `goods_goodsimage` VALUES ('39', 'goods/images/14_P_1448947354433.jpg', '2018-06-23 09:47:20.414958', '16');
INSERT INTO `goods_goodsimage` VALUES ('40', 'goods/images/12_P_1448947547989.jpg', '2018-06-23 09:47:20.421958', '17');
INSERT INTO `goods_goodsimage` VALUES ('41', 'goods/images/46_P_1448946598711.jpg', '2018-06-23 09:47:20.427958', '18');
INSERT INTO `goods_goodsimage` VALUES ('42', 'goods/images/46_P_1448946598301.jpg', '2018-06-23 09:47:20.430959', '18');
INSERT INTO `goods_goodsimage` VALUES ('43', 'goods/images/21_P_1448946793276.jpg', '2018-06-23 09:47:20.436959', '19');
INSERT INTO `goods_goodsimage` VALUES ('44', 'goods/images/21_P_1448946793153.jpg', '2018-06-23 09:47:20.438959', '19');
INSERT INTO `goods_goodsimage` VALUES ('45', 'goods/images/15_P_1448947257324.jpg', '2018-06-23 09:47:20.445959', '20');
INSERT INTO `goods_goodsimage` VALUES ('46', 'goods/images/15_P_1448947257580.jpg', '2018-06-23 09:47:20.447960', '20');
INSERT INTO `goods_goodsimage` VALUES ('47', 'goods/images/13_P_1448947460386.jpg', '2018-06-23 09:47:20.455960', '21');
INSERT INTO `goods_goodsimage` VALUES ('48', 'goods/images/13_P_1448947460276.jpg', '2018-06-23 09:47:20.458960', '21');
INSERT INTO `goods_goodsimage` VALUES ('49', 'goods/images/13_P_1448947460353.jpg', '2018-06-23 09:47:20.460960', '21');
INSERT INTO `goods_goodsimage` VALUES ('50', 'goods/images/50_P_1448946543091.jpg', '2018-06-23 09:47:20.467961', '22');
INSERT INTO `goods_goodsimage` VALUES ('51', 'goods/images/50_P_1448946542182.jpg', '2018-06-23 09:47:20.470961', '22');
INSERT INTO `goods_goodsimage` VALUES ('52', 'goods/images/51_P_1448946466595.jpg', '2018-06-23 09:47:20.476961', '23');
INSERT INTO `goods_goodsimage` VALUES ('53', 'goods/images/51_P_1448946466208.jpg', '2018-06-23 09:47:20.479961', '23');
INSERT INTO `goods_goodsimage` VALUES ('54', 'goods/images/17_P_1448947102246.jpg', '2018-06-23 09:47:20.485962', '24');
INSERT INTO `goods_goodsimage` VALUES ('55', 'goods/images/20_P_1448946850602.jpg', '2018-06-23 09:47:20.492962', '25');
INSERT INTO `goods_goodsimage` VALUES ('56', 'goods/images/19_P_1448946951581.jpg', '2018-06-23 09:47:20.499962', '26');
INSERT INTO `goods_goodsimage` VALUES ('57', 'goods/images/19_P_1448946951726.jpg', '2018-06-23 09:47:20.501963', '26');
INSERT INTO `goods_goodsimage` VALUES ('58', 'goods/images/18_P_1448947011435.jpg', '2018-06-23 09:47:20.508963', '27');
INSERT INTO `goods_goodsimage` VALUES ('59', 'goods/images/22_P_1448946729629.jpg', '2018-06-23 09:47:20.515963', '28');
INSERT INTO `goods_goodsimage` VALUES ('60', 'goods/images/45_P_1448946661303.jpg', '2018-06-23 09:47:20.521964', '29');
INSERT INTO `goods_goodsimage` VALUES ('61', 'goods/images/32_P_1448948525620.jpg', '2018-06-23 09:47:20.528964', '30');
INSERT INTO `goods_goodsimage` VALUES ('62', 'goods/images/30_P_1448948663450.jpg', '2018-06-23 09:47:20.535965', '31');
INSERT INTO `goods_goodsimage` VALUES ('63', 'goods/images/30_P_1448948662571.jpg', '2018-06-23 09:47:20.537965', '31');
INSERT INTO `goods_goodsimage` VALUES ('64', 'goods/images/30_P_1448948663221.jpg', '2018-06-23 09:47:20.540965', '31');
INSERT INTO `goods_goodsimage` VALUES ('65', 'goods/images/31_P_1448948598947.jpg', '2018-06-23 09:47:20.547965', '32');
INSERT INTO `goods_goodsimage` VALUES ('66', 'goods/images/31_P_1448948598475.jpg', '2018-06-23 09:47:20.549965', '32');
INSERT INTO `goods_goodsimage` VALUES ('67', 'goods/images/35_P_1448948333610.jpg', '2018-06-23 09:47:20.556966', '33');
INSERT INTO `goods_goodsimage` VALUES ('68', 'goods/images/35_P_1448948333313.jpg', '2018-06-23 09:47:20.560966', '33');
INSERT INTO `goods_goodsimage` VALUES ('69', 'goods/images/36_P_1448948234405.jpg', '2018-06-23 09:47:20.568966', '34');
INSERT INTO `goods_goodsimage` VALUES ('70', 'goods/images/36_P_1448948234250.jpg', '2018-06-23 09:47:20.571967', '34');
INSERT INTO `goods_goodsimage` VALUES ('71', 'goods/images/33_P_1448948479966.jpg', '2018-06-23 09:47:20.577967', '35');
INSERT INTO `goods_goodsimage` VALUES ('72', 'goods/images/33_P_1448948479886.jpg', '2018-06-23 09:47:20.580967', '35');
INSERT INTO `goods_goodsimage` VALUES ('73', 'goods/images/34_P_1448948399009.jpg', '2018-06-23 09:47:20.587968', '36');
INSERT INTO `goods_goodsimage` VALUES ('74', 'goods/images/43_P_1448948762645.jpg', '2018-06-23 09:47:20.594968', '37');
INSERT INTO `goods_goodsimage` VALUES ('75', 'goods/images/38_P_1448949220255.jpg', '2018-06-23 09:47:20.602968', '38');
INSERT INTO `goods_goodsimage` VALUES ('76', 'goods/images/44_P_1448948850187.jpg', '2018-06-23 09:47:20.609969', '39');
INSERT INTO `goods_goodsimage` VALUES ('77', 'images/201511/goods_img/49_P_1448162819889.jpg', '2018-06-23 09:47:20.616969', '40');
INSERT INTO `goods_goodsimage` VALUES ('78', 'goods/images/40_P_1448949038702.jpg', '2018-06-23 09:47:20.623970', '41');
INSERT INTO `goods_goodsimage` VALUES ('79', 'goods/images/39_P_1448949115481.jpg', '2018-06-23 09:47:20.631970', '42');
INSERT INTO `goods_goodsimage` VALUES ('80', 'goods/images/41_P_1448948980358.jpg', '2018-06-23 09:47:20.639970', '43');
INSERT INTO `goods_goodsimage` VALUES ('81', 'goods/images/37_P_1448949284365.jpg', '2018-06-23 09:47:20.648971', '44');
INSERT INTO `goods_goodsimage` VALUES ('82', 'goods/images/42_P_1448948895193.jpg', '2018-06-23 09:47:20.656971', '45');
INSERT INTO `goods_goodsimage` VALUES ('83', 'goods/images/27_P_1448947771805.jpg', '2018-06-23 09:47:20.663972', '46');
INSERT INTO `goods_goodsimage` VALUES ('84', 'goods/images/23_P_1448948070348.jpg', '2018-06-23 09:47:20.670972', '47');
INSERT INTO `goods_goodsimage` VALUES ('85', 'goods/images/26_P_1448947825754.jpg', '2018-06-23 09:47:20.678973', '48');
INSERT INTO `goods_goodsimage` VALUES ('86', 'goods/images/28_P_1448947699948.jpg', '2018-06-23 09:47:20.685973', '49');
INSERT INTO `goods_goodsimage` VALUES ('87', 'goods/images/28_P_1448947699777.jpg', '2018-06-23 09:47:20.688973', '49');
INSERT INTO `goods_goodsimage` VALUES ('88', 'goods/images/24_P_1448948023823.jpg', '2018-06-23 09:47:20.695974', '50');
INSERT INTO `goods_goodsimage` VALUES ('89', 'goods/images/24_P_1448948023977.jpg', '2018-06-23 09:47:20.699974', '50');
INSERT INTO `goods_goodsimage` VALUES ('90', 'goods/images/25_P_1448947875346.jpg', '2018-06-23 09:47:20.706974', '51');
INSERT INTO `goods_goodsimage` VALUES ('91', 'goods/images/29_P_1448947631994.jpg', '2018-06-23 09:47:20.717975', '52');
INSERT INTO `goods_goodsimage` VALUES ('92', 'goods/images/6_P_1448945167279_iXZRU42.jpg', '2018-06-25 16:26:22.227992', '11');

-- ----------------------------
-- Table structure for `goods_indexad`
-- ----------------------------
DROP TABLE IF EXISTS `goods_indexad`;
CREATE TABLE `goods_indexad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` (`category_id`),
  KEY `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`),
  CONSTRAINT `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_indexad
-- ----------------------------
INSERT INTO `goods_indexad` VALUES ('1', '1', '1');
INSERT INTO `goods_indexad` VALUES ('2', '24', '2');

-- ----------------------------
-- Table structure for `social_auth_association`
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_association`;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_association
-- ----------------------------

-- ----------------------------
-- Table structure for `social_auth_code`
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_code`;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`),
  KEY `social_auth_code_timestamp_176b341f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_code
-- ----------------------------

-- ----------------------------
-- Table structure for `social_auth_nonce`
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_nonce`;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_nonce
-- ----------------------------

-- ----------------------------
-- Table structure for `social_auth_partial`
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_partial`;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`),
  KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_partial
-- ----------------------------

-- ----------------------------
-- Table structure for `social_auth_usersocialauth`
-- ----------------------------
DROP TABLE IF EXISTS `social_auth_usersocialauth`;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersoci_user_id_17d28448_fk_users_use` (`user_id`),
  CONSTRAINT `social_auth_usersoci_user_id_17d28448_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_auth_usersocialauth
-- ----------------------------
INSERT INTO `social_auth_usersocialauth` VALUES ('1', 'weibo', '1642055823', '{\"access_token\": \"2.002jtHnB0zSncna9183c6422KntlsC\", \"username\": \"\\u6768\\u5149\\u798fIT\\u8bb2\\u5e08\", \"profile_image_url\": \"http://tva2.sinaimg.cn/crop.392.130.1137.1137.50/61dfc88fjw8evqlejsnuoj21kw166n9u.jpg\", \"gender\": \"m\", \"id\": 1642055823, \"token_type\": null, \"auth_time\": 1530326379}', '1');

-- ----------------------------
-- Table structure for `trade_ordergoods`
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------
INSERT INTO `trade_ordergoods` VALUES ('8', '1', '2018-06-27 10:37:58.552024', '10', '6');
INSERT INTO `trade_ordergoods` VALUES ('9', '1', '2018-06-27 17:25:25.472574', '12', '7');
INSERT INTO `trade_ordergoods` VALUES ('10', '1', '2018-06-27 17:28:31.213197', '10', '8');
INSERT INTO `trade_ordergoods` VALUES ('11', '1', '2018-06-27 17:30:22.850583', '6', '9');
INSERT INTO `trade_ordergoods` VALUES ('12', '1', '2018-06-27 17:36:58.612219', '4', '10');
INSERT INTO `trade_ordergoods` VALUES ('13', '10', '2018-06-29 16:17:22.652856', '13', '11');
INSERT INTO `trade_ordergoods` VALUES ('14', '1', '2018-06-29 16:21:00.574321', '11', '12');
INSERT INTO `trade_ordergoods` VALUES ('15', '5', '2018-06-29 16:21:00.585321', '13', '12');
INSERT INTO `trade_ordergoods` VALUES ('16', '1', '2018-07-18 10:11:27.848756', '11', '13');
INSERT INTO `trade_ordergoods` VALUES ('17', '1', '2018-07-18 14:40:19.811484', '10', '14');

-- ----------------------------
-- Table structure for `trade_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(30) NOT NULL,
  `post_script` varchar(200) DEFAULT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `signer_name` varchar(30) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_sn` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------
INSERT INTO `trade_orderinfo` VALUES ('6', '20180627103758admin88', null, 'PAYING', '', '168', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-27 10:37:58.546023', '1');
INSERT INTO `trade_orderinfo` VALUES ('7', '20180627172525admin13', null, 'PAYING', 'ddd', '88', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-27 17:25:25.466573', '1');
INSERT INTO `trade_orderinfo` VALUES ('8', '20180627172831admin81', null, 'PAYING', '11', '168', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-27 17:28:31.204197', '1');
INSERT INTO `trade_orderinfo` VALUES ('9', '20180627173022admin85', null, 'TRADE_SUCCESS', '11', '75', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-27 17:30:22.837582', '1');
INSERT INTO `trade_orderinfo` VALUES ('10', '20180627173658admin87', '2018062721001004010200719683', 'TRADE_SUCCESS', '111', '108', '2018-06-27 17:37:36.357378', '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-27 17:36:58.603218', '1');
INSERT INTO `trade_orderinfo` VALUES ('11', '201806291617221860104225823', null, 'PAYING', '订单', '1200', null, '阿福', '18601042250', '北京市北京城区昌平区黎平一中', '2018-06-29 16:17:22.640856', '10');
INSERT INTO `trade_orderinfo` VALUES ('12', '20180629162100admin75', '2018062921001004760200692850', 'TRADE_SUCCESS', '', '855', '2018-06-29 16:28:51.344247', '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-06-29 16:21:00.566320', '1');
INSERT INTO `trade_orderinfo` VALUES ('13', '20180718101127admin64', null, 'PAYING', 'ddd', '255', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-07-18 10:11:27.841756', '1');
INSERT INTO `trade_orderinfo` VALUES ('14', '20180718144019admin70', null, 'PAYING', '1111', '168', null, '阿福哥', '18601042250', '贵州省黔东南苗族侗族自治州黎平县黎平一中', '2018-07-18 14:40:19.799483', '1');

-- ----------------------------
-- Table structure for `trade_shopingcart`
-- ----------------------------
DROP TABLE IF EXISTS `trade_shopingcart`;
CREATE TABLE `trade_shopingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_shopingcart_goods_id_ad6f7bb4_fk_goods_goods_id` (`goods_id`),
  KEY `trade_shopingcart_user_id_8a60dcf6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_shopingcart_goods_id_ad6f7bb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shopingcart_user_id_8a60dcf6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade_shopingcart
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$XnIFfHxT0X2k$WB48TMZoeGo7L+FX5JClzo3whnhYOCZcqslhBj2Vrxw=', '2018-07-18 20:12:38.872933', '1', 'admin', '杨光福IT讲师', '', '1', '1', '2018-06-23 09:48:00.000000', '杨光福', 'female', '1985-04-09', '18601042259', 'ygf@atguigu.com', '2018-06-23 09:48:00.000000');
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$36000$oUSEX78HbXbi$x2NvU3BWbkWAE4D5bc2fOxSxBsTv6/czZ+Ctfx1m+Gs=', null, '0', '18601042255', '', '', '0', '1', '2018-06-25 11:44:00.000000', null, 'female', null, '18601042255', '', '2018-06-25 14:44:00.000000');
INSERT INTO `users_userprofile` VALUES ('7', 'pbkdf2_sha256$36000$jyuii4umJZU2$T9E29RVdMkTsrkJEM63xuYrqQyDpiDmD9sdFkqLjCJ0=', null, '0', '18601042256', '', '', '0', '1', '2018-06-25 14:41:17.563385', null, 'female', null, '18601042256', null, '2018-06-25 14:41:17.563385');
INSERT INTO `users_userprofile` VALUES ('9', 'pbkdf2_sha256$36000$1Yd7DM1gwEBt$W1K4pqxt+5JRKdS7n1sS7+aUPTe/xtlfH2Mv94FmpPU=', null, '0', '18601042251', '', '', '0', '1', '2018-06-25 15:14:04.669897', null, 'female', null, '18601042251', null, '2018-06-25 15:14:04.669897');
INSERT INTO `users_userprofile` VALUES ('10', 'pbkdf2_sha256$36000$rp1giHkTRX4I$2/kLlRgWDH2PJn/OSIilRq6Yx9bag718371GiBeKgoc=', '2018-06-26 10:04:57.230677', '0', '18601042258', '', '', '0', '1', '2018-06-25 15:18:18.294404', null, 'female', null, '18601042258', null, '2018-06-25 15:18:18.294404');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `users_verifycode`
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES ('1', '3678', '18601042255', '2018-06-25 11:43:00.000000');
INSERT INTO `users_verifycode` VALUES ('2', '1166', '18601042255', '2018-06-25 10:49:14.286591');
INSERT INTO `users_verifycode` VALUES ('3', '8688', '18601042256', '2018-06-25 14:40:33.210849');
INSERT INTO `users_verifycode` VALUES ('4', '1078', '18601042251', '2018-06-25 15:13:00.000000');
INSERT INTO `users_verifycode` VALUES ('5', '5157', '18601042258', '2018-06-25 15:15:40.869400');
INSERT INTO `users_verifycode` VALUES ('6', '1533', '18601042258', '2018-06-25 15:17:17.418922');
INSERT INTO `users_verifycode` VALUES ('7', '7640', '18601042250', '2018-06-26 10:09:28.902216');
INSERT INTO `users_verifycode` VALUES ('8', '8050', '18601042250', '2018-06-27 09:04:38.073695');

-- ----------------------------
-- Table structure for `user_operation_useraddress`
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `signer_name` varchar(30) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
INSERT INTO `user_operation_useraddress` VALUES ('2', '贵州省', '黔东南苗族侗族自治州', '黎平县', '黎平一中', '阿福哥', '18601042250', '2018-06-26 15:05:06.280321', '1');
INSERT INTO `user_operation_useraddress` VALUES ('3', '北京市', '北京城区', '昌平区', '黎平一中', '阿福', '18601042250', '2018-06-29 16:16:44.729687', '10');

-- ----------------------------
-- Table structure for `user_operation_userfav`
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  KEY `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------
INSERT INTO `user_operation_userfav` VALUES ('31', '2018-06-29 14:52:07.446283', '13', '1');
INSERT INTO `user_operation_userfav` VALUES ('32', '2018-06-29 14:52:28.748502', '13', '10');

-- ----------------------------
-- Table structure for `user_operation_userleavingmessage`
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
CREATE TABLE `user_operation_userleavingmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `msg_type` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `file` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userl_user_id_70d909d6_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userl_user_id_70d909d6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_operation_userleavingmessage
-- ----------------------------
INSERT INTO `user_operation_userleavingmessage` VALUES ('3', '好吃', '1', '好吃好吃好吃', 'message/images/6_P_1448945167279_Wp43OIP.jpg', '2018-06-26 11:59:21.884313', '1');
INSERT INTO `user_operation_userleavingmessage` VALUES ('5', '11', '1', '1111', 'message/images/8_P_1448945032810_SjMTL5K.jpg', '2018-06-26 12:00:49.823343', '1');

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-06-23 09:51:38.256705', '127.0.0.1', '1', '生鲜食品', 'change', '修改 is_tab', '7', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-06-23 09:52:00.463976', '127.0.0.1', '24', '酒水饮料', 'change', '修改 is_tab', '7', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-06-23 09:52:16.019865', '127.0.0.1', '40', '粮油副食', 'change', '修改 is_tab', '7', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-06-23 09:52:23.228278', '127.0.0.1', '57', '蔬菜水果', 'change', '修改 is_tab', '7', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-06-23 11:15:03.605995', '127.0.0.1', '5', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', 'change', '修改 goods_sn，goods_brief，sold_num 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-06-23 11:16:47.592943', '127.0.0.1', '46', '维纳斯橄榄菜籽油5L/桶', 'change', '修改 goods_sn，goods_brief，sold_num 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-06-23 11:18:06.139435', '127.0.0.1', '14', '帐篷出租', 'change', '修改 goods_sn，goods_brief，goods_desc 和 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-06-23 15:26:47.648155', '127.0.0.1', '1', 'admin', 'change', '修改 last_login 和 mobile', '5', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-06-23 16:36:04.583918', '127.0.0.1', '1', 'admin', 'change', '修改 last_login 和 mobile', '5', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-06-23 17:30:28.467602', '127.0.0.1', '1', 'admin', 'change', '修改 mobile', '5', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-06-25 11:13:38.151319', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-06-25 11:18:43.411779', '127.0.0.1', '2', '18601042255', 'delete', '', '5', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-06-25 11:19:00.526758', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-06-25 11:19:35.305747', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-06-25 11:20:40.311465', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-06-25 11:29:01.356124', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-06-25 11:32:39.674611', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-06-25 11:41:23.864593', '127.0.0.1', '3', '18601042255', 'delete', '', '5', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-06-25 11:41:58.828592', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-06-25 11:43:45.006666', '127.0.0.1', '1', '3678', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-06-25 11:43:50.063955', '127.0.0.1', '5', '18601042255', 'delete', '', '5', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-06-25 14:44:19.625799', '127.0.0.1', '6', '18601042255', 'change', '修改 add_time', '5', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-06-25 15:13:24.751614', '127.0.0.1', '4', '1078', 'change', '修改 add_time', '6', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-06-25 15:13:33.027088', '127.0.0.1', '8', '18601042251', 'delete', '', '5', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-06-25 16:26:22.242992', '127.0.0.1', '11', '澳洲进口牛尾巴300g新鲜肥牛肉', 'change', '修改 goods_sn 和 goods_desc', '8', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-06-25 16:28:44.571133', '127.0.0.1', '11', '澳洲进口牛尾巴300g新鲜肥牛肉', 'change', '修改 is_hot', '8', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-06-25 16:29:32.942900', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_sn，goods_desc 和 is_hot', '8', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-06-25 16:30:00.056451', '127.0.0.1', '33', '新鲜头茬非洲冰草冰菜', 'change', '修改 goods_sn，goods_brief，goods_desc 和 is_hot', '8', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-06-25 17:13:59.340409', '127.0.0.1', null, '', 'delete', '批量删除 4 个 用户收藏', null, '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-06-26 10:45:43.160576', '127.0.0.1', '1', 'admin', 'change', '修改 last_login，name，gender 和 birthday', '5', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-06-26 10:47:24.277360', '127.0.0.1', '1', 'admin', 'change', '修改 name', '5', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-06-29 09:51:33.713294', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-06-29 09:51:41.497739', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-06-29 09:51:51.401305', '127.0.0.1', '3', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-06-29 09:55:25.315541', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 goods_sn，goods_desc 和 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-06-29 09:55:42.462521', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-06-29 09:57:38.377151', '127.0.0.1', '52', '融氏纯玉米胚芽油5l桶', 'change', '修改 goods_sn，goods_brief，goods_desc 和 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-06-29 09:57:52.204942', '127.0.0.1', '51', '稻园牌稻米油粮油米糠油绿色植物油', 'change', '修改 goods_sn，goods_brief，goods_desc 和 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-06-29 09:58:35.597424', '127.0.0.1', '51', '稻园牌稻米油粮油米糠油绿色植物油', 'change', '修改 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-06-29 09:59:35.224835', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-06-29 10:00:09.328785', '127.0.0.1', '52', '融氏纯玉米胚芽油5l桶', 'change', '修改 is_new', '8', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-06-29 10:56:48.130186', '127.0.0.1', '1', '艾尔', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-06-29 10:57:32.830742', '127.0.0.1', '2', '金贷', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-06-29 11:32:05.888314', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-06-29 11:32:14.619814', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'create', '已添加', '23', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-06-29 11:33:53.758484', '127.0.0.1', '3', '发育宝', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-06-29 11:34:25.023272', '127.0.0.1', '4', 'lyfs', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-06-29 15:08:05.230065', '127.0.0.1', '13', '澳洲进口安格斯牛切片上脑牛排1000g', 'change', '修改 goods_sn，goods_desc 和 goods_nums', '8', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-06-29 15:16:34.067169', '127.0.0.1', '13', '澳洲进口安格斯牛切片上脑牛排1000g', 'change', '修改 goods_nums', '8', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-06-29 15:19:44.972088', '127.0.0.1', '13', '澳洲进口安格斯牛切片上脑牛排1000g', 'change', '修改 goods_nums', '8', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-07-18 16:37:35.652911', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '修改 goods_brief，goods_desc 和 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-07-18 16:41:54.747730', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '修改 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-07-18 16:43:17.151443', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '修改 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-07-18 16:43:42.224878', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '没有数据变化', '8', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-07-18 20:03:09.503367', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-07-18 20:09:49.634253', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '修改 goods_front_image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-07-18 20:10:27.457416', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '没有数据变化', '8', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-07-18 20:11:12.518994', '127.0.0.1', '12', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 'change', '没有数据变化', '8', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-07-18 20:13:12.648865', '127.0.0.1', '3', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'change', '修改 image', '11', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-07-18 20:14:01.624666', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'change', '修改 image', '11', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-07-18 20:14:13.039319', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 image', '11', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
