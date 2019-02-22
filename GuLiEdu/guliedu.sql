/*
Navicat MySQL Data Transfer

Source Server         : window
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : guliedu

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-07-30 08:54:00
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 轮播图信息', '7', 'add_bannerinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 轮播图信息', '7', 'change_bannerinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 轮播图信息', '7', 'delete_bannerinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifycode');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifycode');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifycode');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 城市信息', '9', 'add_cityinfo');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 城市信息', '9', 'change_cityinfo');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 城市信息', '9', 'delete_cityinfo');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 机构信息', '10', 'add_orginfo');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 机构信息', '10', 'change_orginfo');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 机构信息', '10', 'delete_orginfo');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 教师信息', '11', 'add_teacherinfo');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 教师信息', '11', 'change_teacherinfo');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 教师信息', '11', 'delete_teacherinfo');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 课程信息', '12', 'add_courseinfo');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 课程信息', '12', 'change_courseinfo');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 课程信息', '12', 'delete_courseinfo');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 章节信息', '13', 'add_lessoninfo');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 章节信息', '13', 'change_lessoninfo');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 章节信息', '13', 'delete_lessoninfo');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 资源信息', '14', 'add_sourceinfo');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 资源信息', '14', 'change_sourceinfo');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 资源信息', '14', 'delete_sourceinfo');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 视频信息', '15', 'add_videoinfo');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 视频信息', '15', 'change_videoinfo');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 视频信息', '15', 'delete_videoinfo');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 用户咨询信息', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 用户咨询信息', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 用户咨询信息', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户评论信息', '17', 'add_usercomment');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户评论信息', '17', 'change_usercomment');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户评论信息', '17', 'delete_usercomment');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 用户学习课程信息', '18', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 用户学习课程信息', '18', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 用户学习课程信息', '18', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 收藏信息', '19', 'add_userlove');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 收藏信息', '19', 'change_userlove');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 收藏信息', '19', 'delete_userlove');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息信息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息信息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息信息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('62', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('63', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('64', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('65', 'Can view 课程信息', '12', 'view_courseinfo');
INSERT INTO `auth_permission` VALUES ('66', 'Can view 章节信息', '13', 'view_lessoninfo');
INSERT INTO `auth_permission` VALUES ('67', 'Can view 资源信息', '14', 'view_sourceinfo');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 视频信息', '15', 'view_videoinfo');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 用户咨询信息', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 用户评论信息', '17', 'view_usercomment');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 用户学习课程信息', '18', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 收藏信息', '19', 'view_userlove');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户消息信息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 城市信息', '9', 'view_cityinfo');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 机构信息', '10', 'view_orginfo');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 教师信息', '11', 'view_teacherinfo');
INSERT INTO `auth_permission` VALUES ('77', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 轮播图信息', '7', 'view_bannerinfo');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 邮箱验证码', '8', 'view_emailverifycode');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can add crontab', '26', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('102', 'Can change crontab', '26', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete crontab', '26', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('104', 'Can add interval', '27', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('105', 'Can change interval', '27', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('106', 'Can delete interval', '27', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('107', 'Can add periodic task', '28', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('108', 'Can change periodic task', '28', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('109', 'Can delete periodic task', '28', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('110', 'Can add periodic tasks', '29', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('111', 'Can change periodic tasks', '29', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('112', 'Can delete periodic tasks', '29', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('113', 'Can add task state', '30', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('114', 'Can change task state', '30', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('115', 'Can delete task state', '30', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('116', 'Can add saved group result', '31', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('117', 'Can change saved group result', '31', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('118', 'Can delete saved group result', '31', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('119', 'Can add task', '32', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('120', 'Can change task', '32', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('121', 'Can delete task', '32', 'delete_taskstate');
INSERT INTO `auth_permission` VALUES ('122', 'Can add worker', '33', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('123', 'Can change worker', '33', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('124', 'Can delete worker', '33', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('125', 'Can view crontab', '26', 'view_crontabschedule');
INSERT INTO `auth_permission` VALUES ('126', 'Can view interval', '27', 'view_intervalschedule');
INSERT INTO `auth_permission` VALUES ('127', 'Can view periodic task', '28', 'view_periodictask');
INSERT INTO `auth_permission` VALUES ('128', 'Can view periodic tasks', '29', 'view_periodictasks');
INSERT INTO `auth_permission` VALUES ('129', 'Can view task state', '30', 'view_taskmeta');
INSERT INTO `auth_permission` VALUES ('130', 'Can view saved group result', '31', 'view_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('131', 'Can view task', '32', 'view_taskstate');
INSERT INTO `auth_permission` VALUES ('132', 'Can view worker', '33', 'view_workerstate');

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('16', 'OQHI', 'oqhi', '2a2a41c4dfe326e7233b71bd2fb60f6d8274c87d', '2018-07-29 15:18:41.317331');

-- ----------------------------
-- Table structure for `celery_taskmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_hidden_23fd02dc` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `celery_tasksetmeta`
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_hidden_593cfc24` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for `courses_courseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseinfo`;
CREATE TABLE `courses_courseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `study_time` int(11) NOT NULL,
  `love_num` int(11) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `study_num` int(11) NOT NULL,
  `comment_num` int(11) NOT NULL,
  `level` varchar(10) NOT NULL,
  `course_category` varchar(15) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_bull` varchar(200) DEFAULT NULL,
  `need_known` varchar(200) DEFAULT NULL,
  `teacher_tell` varchar(200) DEFAULT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseinfo_org_id_4a029e2f_fk_orgs_orginfo_id` (`org_id`),
  KEY `courses_courseinfo_teacher_id_6c344694_fk_orgs_teacherinfo_id` (`teacher_id`),
  CONSTRAINT `courses_courseinfo_org_id_4a029e2f_fk_orgs_orginfo_id` FOREIGN KEY (`org_id`) REFERENCES `orgs_orginfo` (`id`),
  CONSTRAINT `courses_courseinfo_teacher_id_6c344694_fk_orgs_teacherinfo_id` FOREIGN KEY (`teacher_id`) REFERENCES `orgs_teacherinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseinfo
-- ----------------------------
INSERT INTO `courses_courseinfo` VALUES ('1', '前端三大宝之html', 'courses/18/07/20/硅谷直聘.jpg', '10', '0', '前端必知必会', '前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会前端必知必会', '1000', '0', '初级', '前端开发', '10', '2018-07-20 16:47:00.000000', '1', '4', '前端html公告', 'html很好玩', '好好干', '0');
INSERT INTO `courses_courseinfo` VALUES ('2', '前端三大宝之css', 'courses/18/07/20/css2.1.jpg', '20', '1', '前端页面样式全靠它', '前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它前端页面样式全靠它', '2000', '0', '中级', '前端开发', '5', '2018-07-20 16:49:00.000000', '1', '4', '前端css公告', 'css很好玩', '好好干', '0');
INSERT INTO `courses_courseinfo` VALUES ('3', '前端三大宝之js', 'courses/18/07/20/JavaScript.jpg', '40', '0', 'js很牛逼', 'js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼js很牛逼', '25000', '0', '高级', '前端开发', '50', '2018-07-20 16:50:00.000000', '1', '4', '前端js公告', 'js很好玩', '好好干', '0');
INSERT INTO `courses_courseinfo` VALUES ('4', '数据库之mysql', 'courses/18/07/20/MySQL高级.jpg', '10', '1', '免费的关系型数据库，用的很多', '免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多免费的关系型数据库，用的很多', '3000', '0', '中级', '后端开发', '201', '2018-07-20 16:51:00.000000', '1', '2', 'mysql公告', 'mysql很好玩', '好好干', '0');
INSERT INTO `courses_courseinfo` VALUES ('5', 'Linux全解', 'courses/18/07/28/Linux.jpg', '0', '0', 'Linux最详细的讲解', 'Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解Linux最详细的讲解', '0', '0', '高级', '后端开发', '0', '2018-07-28 23:26:00.000000', '1', '1', null, null, null, '1');
INSERT INTO `courses_courseinfo` VALUES ('6', 'java基础', 'courses/18/07/28/093555b7945b990075.jpg', '0', '0', 'Java基础', 'Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础Java基础', '0', '0', '高级', '后端开发', '0', '2018-07-28 23:53:00.000000', '1', '2', null, null, null, '1');
INSERT INTO `courses_courseinfo` VALUES ('7', 'redis全讲', 'courses/18/07/28/redis.jpg', '100', '0', 'redis详解', 'redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解redis详解', '0', '0', '高级', '后端开发', '0', '2018-07-28 23:54:00.000000', '1', '2', null, null, null, '0');
INSERT INTO `courses_courseinfo` VALUES ('8', 'Javaweb从入门到精通', 'courses/18/07/28/JavaWeb.jpg', '0', '0', 'Javaweb从入门到精通', 'Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通Javaweb从入门到精通', '0', '0', '高级', '后端开发', '0', '2018-07-28 23:55:00.000000', '1', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for `courses_lessoninfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_lessoninfo`;
CREATE TABLE `courses_lessoninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lessoninfo_course_id_983914a1_fk_courses_courseinfo_id` (`course_id`),
  CONSTRAINT `courses_lessoninfo_course_id_983914a1_fk_courses_courseinfo_id` FOREIGN KEY (`course_id`) REFERENCES `courses_courseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lessoninfo
-- ----------------------------
INSERT INTO `courses_lessoninfo` VALUES ('1', '第一章：mysql简介', '2018-07-20 16:53:00.000000', '4');
INSERT INTO `courses_lessoninfo` VALUES ('2', '第二章：mysql索引', '2018-07-20 16:53:00.000000', '4');

-- ----------------------------
-- Table structure for `courses_sourceinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_sourceinfo`;
CREATE TABLE `courses_sourceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `download` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_sourceinfo_course_id_2cabaa0a_fk_courses_courseinfo_id` (`course_id`),
  CONSTRAINT `courses_sourceinfo_course_id_2cabaa0a_fk_courses_courseinfo_id` FOREIGN KEY (`course_id`) REFERENCES `courses_courseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_sourceinfo
-- ----------------------------
INSERT INTO `courses_sourceinfo` VALUES ('1', '开发宝典', 'sources/18/07/20/谷粒教育开发流程_-_副本.docx', '2018-07-20 16:56:00.000000', '4');

-- ----------------------------
-- Table structure for `courses_videoinfo`
-- ----------------------------
DROP TABLE IF EXISTS `courses_videoinfo`;
CREATE TABLE `courses_videoinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `study_time` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_videoinfo_lesson_id_9d62a164_fk_courses_lessoninfo_id` (`lesson_id`),
  CONSTRAINT `courses_videoinfo_lesson_id_9d62a164_fk_courses_lessoninfo_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lessoninfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_videoinfo
-- ----------------------------
INSERT INTO `courses_videoinfo` VALUES ('1', '1.1mysql简介', '10', 'http://www.atguigu.com', '2018-07-20 16:54:00.000000', '1');
INSERT INTO `courses_videoinfo` VALUES ('2', '1.2mysql安装', '20', 'http://www.atguigu.com', '2018-07-20 16:55:00.000000', '1');
INSERT INTO `courses_videoinfo` VALUES ('3', '2.1索引的简介', '8', 'http://www.atguigu.com', '2018-07-20 16:55:00.000000', '2');

-- ----------------------------
-- Table structure for `django_admin_log`
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'courseinfo');
INSERT INTO `django_content_type` VALUES ('13', 'courses', 'lessoninfo');
INSERT INTO `django_content_type` VALUES ('14', 'courses', 'sourceinfo');
INSERT INTO `django_content_type` VALUES ('15', 'courses', 'videoinfo');
INSERT INTO `django_content_type` VALUES ('26', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('27', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('28', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('29', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('30', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('31', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('32', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('33', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('16', 'operations', 'userask');
INSERT INTO `django_content_type` VALUES ('17', 'operations', 'usercomment');
INSERT INTO `django_content_type` VALUES ('18', 'operations', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operations', 'userlove');
INSERT INTO `django_content_type` VALUES ('20', 'operations', 'usermessage');
INSERT INTO `django_content_type` VALUES ('9', 'orgs', 'cityinfo');
INSERT INTO `django_content_type` VALUES ('10', 'orgs', 'orginfo');
INSERT INTO `django_content_type` VALUES ('11', 'orgs', 'teacherinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'bannerinfo');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifycode');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-07-20 15:08:29.985134');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-07-20 15:08:30.166534');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-07-20 15:08:30.729254');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-07-20 15:08:30.831874');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-07-20 15:08:30.862912');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-07-20 15:08:30.899939');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-07-20 15:08:30.948479');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-07-20 15:08:30.958981');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-07-20 15:08:30.994505');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-07-20 15:08:31.029532');
INSERT INTO `django_migrations` VALUES ('11', 'users', '0001_initial', '2018-07-20 15:08:31.884226');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-07-20 15:08:32.103382');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-07-20 15:08:32.143911');
INSERT INTO `django_migrations` VALUES ('14', 'orgs', '0001_initial', '2018-07-20 15:08:32.515675');
INSERT INTO `django_migrations` VALUES ('15', 'courses', '0001_initial', '2018-07-20 15:08:33.143195');
INSERT INTO `django_migrations` VALUES ('16', 'operations', '0001_initial', '2018-07-20 15:08:33.367993');
INSERT INTO `django_migrations` VALUES ('17', 'operations', '0002_auto_20180720_1508', '2018-07-20 15:08:34.686196');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2018-07-20 15:08:34.778841');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-07-20 15:45:13.563777');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-07-20 15:45:13.918626');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-07-20 15:45:14.192428');
INSERT INTO `django_migrations` VALUES ('22', 'captcha', '0001_initial', '2018-07-21 11:46:06.816553');
INSERT INTO `django_migrations` VALUES ('23', 'users', '0002_userprofile_is_start', '2018-07-21 14:33:07.670464');
INSERT INTO `django_migrations` VALUES ('24', 'djcelery', '0001_initial', '2018-07-21 22:27:56.579316');
INSERT INTO `django_migrations` VALUES ('25', 'djcelery', '0002_auto_20180721_2227', '2018-07-21 22:27:56.615341');
INSERT INTO `django_migrations` VALUES ('26', 'djcelery', '0003_auto_20180721_2237', '2018-07-21 22:37:38.772920');
INSERT INTO `django_migrations` VALUES ('27', 'djcelery', '0004_auto_20180721_2243', '2018-07-21 22:43:54.591057');
INSERT INTO `django_migrations` VALUES ('28', 'djcelery', '0005_auto_20180722_0018', '2018-07-22 00:19:03.296911');
INSERT INTO `django_migrations` VALUES ('29', 'courses', '0002_auto_20180725_1644', '2018-07-25 16:44:58.644716');
INSERT INTO `django_migrations` VALUES ('30', 'users', '0003_auto_20180728_0930', '2018-07-28 09:31:11.023642');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0003_courseinfo_is_banner', '2018-07-28 23:10:41.069098');
INSERT INTO `django_migrations` VALUES ('32', 'courses', '0004_auto_20180729_0048', '2018-07-29 00:48:51.742655');
INSERT INTO `django_migrations` VALUES ('33', 'orgs', '0002_auto_20180729_0048', '2018-07-29 00:48:51.782687');
INSERT INTO `django_migrations` VALUES ('34', 'djcelery', '0006_auto_20180729_0314', '2018-07-29 03:14:11.775340');

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
INSERT INTO `django_session` VALUES ('f4tgoehoaw1du7tozftzlkwelqkzyq5z', 'MjRhNDI1NzBmZWQwM2JmOTZiY2M2YjhmNTVjMDEwNTQ2NWMzNzA0Mjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MzdkMGZiN2RjMmY2ZDA1YzMyMzY2ZTVjMTk5MDhlMmFiNjFmMzdmIn0=', '2018-08-04 16:08:21.121014');

-- ----------------------------
-- Table structure for `djcelery_crontabschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_intervalschedule`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_periodictask`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` (`crontab_id`),
  KEY `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` (`interval_id`),
  CONSTRAINT `djcelery_periodictas_crontab_id_75609bab_fk_djcelery_` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_periodictas_interval_id_b426ab02_fk_djcelery_` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_periodictasks`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_taskstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_state_53543be4` (`state`),
  KEY `djcelery_taskstate_name_8af9eded` (`name`),
  KEY `djcelery_taskstate_tstamp_4c3f93a1` (`tstamp`),
  KEY `djcelery_taskstate_hidden_c3905e57` (`hidden`),
  KEY `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for `djcelery_workerstate`
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_last_heartbeat_4539b544` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------

-- ----------------------------
-- Table structure for `operations_userask`
-- ----------------------------
DROP TABLE IF EXISTS `operations_userask`;
CREATE TABLE `operations_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `course` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userask
-- ----------------------------
INSERT INTO `operations_userask` VALUES ('1', '赵丽颖', '18503595729', 'js', '2018-07-24 14:55:47.105143');
INSERT INTO `operations_userask` VALUES ('2', '刘诗诗', '12132', '萨德', '2018-07-24 14:57:29.372866');
INSERT INTO `operations_userask` VALUES ('3', '郭德纲', '18503595729', '大声道', '2018-07-24 15:20:11.676867');
INSERT INTO `operations_userask` VALUES ('4', '杨幂', '18503595729', 'IEUR有', '2018-07-24 15:38:15.391434');
INSERT INTO `operations_userask` VALUES ('5', '成龙', '18503595729', 'IEUR', '2018-07-24 15:42:52.699579');
INSERT INTO `operations_userask` VALUES ('6', '成龙', '18503595729', 'IEUR', '2018-07-24 15:42:58.584258');

-- ----------------------------
-- Table structure for `operations_usercomment`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercomment`;
CREATE TABLE `operations_usercomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `comment_course_id` int(11) NOT NULL,
  `comment_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_usercomme_comment_course_id_39dc5cdf_fk_courses_c` (`comment_course_id`),
  KEY `operations_usercomme_comment_man_id_c4c79f25_fk_users_use` (`comment_man_id`),
  CONSTRAINT `operations_usercomme_comment_course_id_39dc5cdf_fk_courses_c` FOREIGN KEY (`comment_course_id`) REFERENCES `courses_courseinfo` (`id`),
  CONSTRAINT `operations_usercomme_comment_man_id_c4c79f25_fk_users_use` FOREIGN KEY (`comment_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercomment
-- ----------------------------
INSERT INTO `operations_usercomment` VALUES ('1', 'ww wwwwww', '2018-07-27 11:02:54.890979', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('2', 'ww wwwwww', '2018-07-27 11:02:56.662750', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('3', 'ww wwwwww', '2018-07-27 11:02:56.804448', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('4', 'ww wwwwww', '2018-07-27 11:02:56.953052', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('5', 'ww wwwwww', '2018-07-27 11:02:57.099347', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('6', 'ww wwwwww', '2018-07-27 11:02:57.244565', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('7', 'ww wwwwww', '2018-07-27 11:02:57.405424', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('8', 'ww wwwwww', '2018-07-27 11:02:57.567535', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('9', 'ww wwwwww', '2018-07-27 11:02:57.734664', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('10', 'ww wwwwww', '2018-07-27 11:02:57.885280', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('11', 'ww wwwwww', '2018-07-27 11:02:58.044894', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('12', 'ww wwwwww', '2018-07-27 11:02:58.202013', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('13', 'ww wwwwww', '2018-07-27 11:02:58.357115', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('14', 'ww wwwwww', '2018-07-27 11:02:58.520806', '4', '1');
INSERT INTO `operations_usercomment` VALUES ('15', '我喜欢js', '2018-07-27 11:05:03.005091', '3', '1');

-- ----------------------------
-- Table structure for `operations_usercourse`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercourse`;
CREATE TABLE `operations_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `study_course_id` int(11) NOT NULL,
  `study_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `operations_usercourse_study_man_id_study_course_id_ca233d28_uniq` (`study_man_id`,`study_course_id`),
  KEY `operations_usercours_study_course_id_ad6771e9_fk_courses_c` (`study_course_id`),
  CONSTRAINT `operations_usercours_study_course_id_ad6771e9_fk_courses_c` FOREIGN KEY (`study_course_id`) REFERENCES `courses_courseinfo` (`id`),
  CONSTRAINT `operations_usercours_study_man_id_a1251afb_fk_users_use` FOREIGN KEY (`study_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usercourse
-- ----------------------------
INSERT INTO `operations_usercourse` VALUES ('1', '2018-07-27 09:14:09.947102', '4', '21');
INSERT INTO `operations_usercourse` VALUES ('2', '2018-07-27 09:14:58.196586', '1', '21');
INSERT INTO `operations_usercourse` VALUES ('3', '2018-07-27 09:15:28.941348', '2', '21');
INSERT INTO `operations_usercourse` VALUES ('4', '2018-07-27 10:11:53.473418', '1', '1');
INSERT INTO `operations_usercourse` VALUES ('5', '2018-07-27 10:21:13.489996', '4', '1');
INSERT INTO `operations_usercourse` VALUES ('6', '2018-07-27 11:04:45.450466', '3', '1');

-- ----------------------------
-- Table structure for `operations_userlove`
-- ----------------------------
DROP TABLE IF EXISTS `operations_userlove`;
CREATE TABLE `operations_userlove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `love_id` int(11) NOT NULL,
  `love_type` int(11) NOT NULL,
  `love_status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `love_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_userlove_love_man_id_7fb97ad4_fk_users_userprofile_id` (`love_man_id`),
  CONSTRAINT `operations_userlove_love_man_id_7fb97ad4_fk_users_userprofile_id` FOREIGN KEY (`love_man_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_userlove
-- ----------------------------
INSERT INTO `operations_userlove` VALUES ('1', '1', '1', '1', '2018-07-24 16:21:39.435352', '21');
INSERT INTO `operations_userlove` VALUES ('2', '2', '3', '1', '2018-07-25 11:05:59.775660', '21');
INSERT INTO `operations_userlove` VALUES ('3', '1', '2', '0', '2018-07-25 15:45:25.668942', '21');
INSERT INTO `operations_userlove` VALUES ('4', '4', '1', '0', '2018-07-28 11:17:41.716846', '21');
INSERT INTO `operations_userlove` VALUES ('5', '1', '3', '0', '2018-07-28 14:20:55.673541', '21');
INSERT INTO `operations_userlove` VALUES ('6', '4', '2', '1', '2018-07-28 14:35:00.143100', '21');
INSERT INTO `operations_userlove` VALUES ('7', '2', '2', '1', '2018-07-29 02:08:21.115686', '1');

-- ----------------------------
-- Table structure for `operations_usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `operations_usermessage`;
CREATE TABLE `operations_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_user` int(11) NOT NULL,
  `msg_content` varchar(100) NOT NULL,
  `msg_status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_usermessage
-- ----------------------------
INSERT INTO `operations_usermessage` VALUES ('1', '21', '欢迎登陆谷粒教育网', '1', '2018-07-28 14:57:25.002563');
INSERT INTO `operations_usermessage` VALUES ('2', '21', '欢迎登陆谷粒教育网', '1', '2018-07-28 16:25:45.526109');
INSERT INTO `operations_usermessage` VALUES ('3', '21', '欢迎登陆谷粒教育网', '1', '2018-07-28 21:39:35.675667');
INSERT INTO `operations_usermessage` VALUES ('4', '21', '欢迎登陆谷粒教育网', '1', '2018-07-29 00:20:31.499739');

-- ----------------------------
-- Table structure for `orgs_cityinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_cityinfo`;
CREATE TABLE `orgs_cityinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_cityinfo
-- ----------------------------
INSERT INTO `orgs_cityinfo` VALUES ('1', '北京', '2018-07-20 16:31:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('2', '深圳', '2018-07-20 16:31:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('3', '上海', '2018-07-20 16:31:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('4', '广州', '2018-07-20 16:32:00.000000');
INSERT INTO `orgs_cityinfo` VALUES ('5', '杭州', '2018-07-20 16:32:00.000000');

-- ----------------------------
-- Table structure for `orgs_orginfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_orginfo`;
CREATE TABLE `orgs_orginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `study_num` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `org_category` varchar(16) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `course_num` int(11) NOT NULL,
  `click_num` int(11) NOT NULL,
  `love_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgs_orginfo_city_id_9bd8455b_fk_orgs_cityinfo_id` (`city_id`),
  CONSTRAINT `orgs_orginfo_city_id_9bd8455b_fk_orgs_cityinfo_id` FOREIGN KEY (`city_id`) REFERENCES `orgs_cityinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_orginfo
-- ----------------------------
INSERT INTO `orgs_orginfo` VALUES ('1', '尚硅谷', 'orgs/18/07/29/logo_Iql6BTP.png', '2000', '北京昌平', '培训机构', '尚硅谷，让天下没有难学的技术', '<p>&nbsp; &nbsp; 尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术尚硅谷，让天下没有难学的技术<img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\"/>\r\n </p>', '100', '14', '1', '2018-07-20 16:33:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('2', '尚硅谷2', 'orgs/18/07/20/logo_ByiZmsH.png', '1000', '深圳', '培训机构', '尚硅谷2', '尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2尚硅谷2', '50', '0', '0', '2018-07-20 16:34:00.000000', '2');
INSERT INTO `orgs_orginfo` VALUES ('3', '尚硅谷3', 'orgs/18/07/23/logo.png', '3000', '上海', '培训机构', '尚硅谷3', '尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3尚硅谷3', '60', '2', '0', '2018-07-23 14:26:00.000000', '3');
INSERT INTO `orgs_orginfo` VALUES ('4', '清华大学', 'orgs/18/07/23/logo_6RIvaNs.png', '100000', '北京海淀', '高校', '中国牛逼学府', '中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府中国牛逼学府', '23', '2', '2', '2018-07-23 14:41:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('5', '阿里巴巴', 'orgs/18/07/23/logo_S43Jh2w.png', '200000', '杭州', '个人', '马云爸爸的公司', '马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司马云爸爸的公司', '56', '0', '0', '2018-07-23 14:42:00.000000', '5');
INSERT INTO `orgs_orginfo` VALUES ('6', '尚硅谷4', 'orgs/18/07/23/logo_LmduNiK.png', '5000', '北京昌平', '培训机构', '尚硅谷4', '尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4尚硅谷4', '10', '0', '0', '2018-07-23 15:03:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('7', '尚硅谷10', 'orgs/18/07/29/logo.png', '0', '上海', '培训机构', '尚硅谷10', '尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10尚硅谷10', '0', '0', '0', '2018-07-29 00:05:00.000000', '3');
INSERT INTO `orgs_orginfo` VALUES ('8', '尚硅谷11', 'orgs/18/07/29/logo_7wjeH01.png', '0', '北京海淀', '培训机构', '尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11', '尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11尚硅谷11', '0', '0', '0', '2018-07-29 00:06:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('9', '尚硅谷12', 'orgs/18/07/29/logo_NELZZlu.png', '0', '北京昌平', '培训机构', '尚硅谷12', '尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12尚硅谷12', '0', '0', '0', '2018-07-29 00:07:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('10', '尚硅谷13', 'orgs/18/07/29/logo_TtNu7C9.png', '0', '北京昌平', '培训机构', '尚硅谷13', '尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13尚硅谷13', '0', '0', '0', '2018-07-29 00:07:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('11', '尚硅谷14', 'orgs/18/07/29/logo_edxbxNu.png', '0', '北京昌平', '高校', '尚硅谷14尚硅谷14', '尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14尚硅谷14', '0', '0', '0', '2018-07-29 00:08:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('12', '尚硅谷15', 'orgs/18/07/29/logo_bQ6q04R.png', '0', '北京昌平', '培训机构', '尚硅谷15尚硅谷15', '尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15尚硅谷15', '0', '0', '0', '2018-07-29 00:08:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('13', '尚硅谷16', 'orgs/18/07/29/logo_5mBMx1j.png', '0', '北京昌平', '培训机构', '尚硅谷16尚硅谷16尚硅谷16', '尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16尚硅谷16', '0', '0', '0', '2018-07-29 00:09:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('14', '尚硅谷17', 'orgs/18/07/29/logo_zBGa6e8.png', '0', '北京昌平', '培训机构', '尚硅谷17', '尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17尚硅谷17', '0', '0', '0', '2018-07-29 00:09:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('15', '尚硅谷18', 'orgs/18/07/29/logo_RLsBiti.png', '0', '北京昌平', '培训机构', '尚硅谷18', '尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18尚硅谷18', '0', '0', '0', '2018-07-29 00:09:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('16', '尚硅谷19', 'orgs/18/07/29/logo_3FZ60CI.png', '0', '北京昌平', '培训机构', '尚硅谷19', '尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19尚硅谷19', '0', '0', '0', '2018-07-29 00:10:00.000000', '1');
INSERT INTO `orgs_orginfo` VALUES ('17', '尚硅谷20', 'orgs/18/07/29/logo_ga22IB4.png', '0', '北京昌平', '培训机构', '尚硅谷20', '尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20尚硅谷20', '0', '0', '0', '2018-07-29 00:10:00.000000', '1');

-- ----------------------------
-- Table structure for `orgs_teacherinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orgs_teacherinfo`;
CREATE TABLE `orgs_teacherinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `work_year` int(11) NOT NULL,
  `work_position` varchar(20) NOT NULL,
  `work_company` varchar(20) NOT NULL,
  `work_style` varchar(20) NOT NULL,
  `click_num` int(11) NOT NULL,
  `love_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgs_teacherinfo_org_id_ca04a5c3_fk_orgs_orginfo_id` (`org_id`),
  CONSTRAINT `orgs_teacherinfo_org_id_ca04a5c3_fk_orgs_orginfo_id` FOREIGN KEY (`org_id`) REFERENCES `orgs_orginfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orgs_teacherinfo
-- ----------------------------
INSERT INTO `orgs_teacherinfo` VALUES ('1', '宋大姐', 'teachers/18/07/20/17.jpg', '30', '3', '技术总监', '百度', '温柔耐心', '102', '11', '2018-07-20 16:36:00.000000', '1');
INSERT INTO `orgs_teacherinfo` VALUES ('2', 'weesmile', 'teachers/18/07/20/19.jpg', '30', '3', '技术总监', '阿里', '闷骚happy', '200', '100', '2018-07-20 16:37:00.000000', '1');
INSERT INTO `orgs_teacherinfo` VALUES ('3', '阿福小哥', 'teachers/18/07/20/3.jpg', '30', '3', '技术总监', '腾讯', '真正的风骚', '300', '200', '2018-07-20 16:38:00.000000', '2');
INSERT INTO `orgs_teacherinfo` VALUES ('4', '天哥哥', 'teachers/18/07/20/9.jpg', '30', '3', '技术总监', '腾讯', '社会', '400', '500', '2018-07-20 16:38:00.000000', '1');

-- ----------------------------
-- Table structure for `users_bannerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `users_bannerinfo`;
CREATE TABLE `users_bannerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_bannerinfo
-- ----------------------------
INSERT INTO `users_bannerinfo` VALUES ('1', 'banners/18/07/20/banner1.jpg', 'http://www.atguigu.com', '2018-07-20 16:21:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('2', 'banners/18/07/20/banner2.jpg', 'http://www.atguigu.com', '2018-07-20 16:22:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('3', 'banners/18/07/20/banner3.jpg', 'http://www.atguigu.com', '2018-07-20 16:22:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('4', 'banners/18/07/20/banner4.jpg', 'http://www.atguigu.com', '2018-07-20 16:22:00.000000');
INSERT INTO `users_bannerinfo` VALUES ('5', 'banners/18/07/20/banner5.jpg', 'http://www.atguigu.com', '2018-07-20 16:23:00.000000');

-- ----------------------------
-- Table structure for `users_emailverifycode`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifycode`;
CREATE TABLE `users_emailverifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifycode
-- ----------------------------
INSERT INTO `users_emailverifycode` VALUES ('1', '1316425655@qq.com', 'TGV48sQK', 'register', '2018-07-21 15:20:52.688641');
INSERT INTO `users_emailverifycode` VALUES ('2', '513908763@qq.com', 'T8NTqxty', 'register', '2018-07-22 00:25:31.456399');
INSERT INTO `users_emailverifycode` VALUES ('3', '1316425655@qq.com', 'EdvwcaM8', 'register', '2018-07-22 00:44:11.169566');
INSERT INTO `users_emailverifycode` VALUES ('4', '1316425655@qq.com', 'vPsD1HAA', 'register', '2018-07-22 00:47:49.350841');
INSERT INTO `users_emailverifycode` VALUES ('5', '1316425655@qq.com', 'EOOorVbA', 'register', '2018-07-22 01:42:11.242545');
INSERT INTO `users_emailverifycode` VALUES ('6', '1316425655@qq.com', 'HImRtWCf', 'register', '2018-07-22 01:45:59.726829');
INSERT INTO `users_emailverifycode` VALUES ('7', '1316425655@qq.com', '1exoAbPT', 'register', '2018-07-22 01:58:40.543019');
INSERT INTO `users_emailverifycode` VALUES ('8', '1316425655@qq.com', 'Wf1cEZWp', 'register', '2018-07-22 02:06:53.612158');
INSERT INTO `users_emailverifycode` VALUES ('9', '1316425655@qq.com', 'XRP54uXT', 'register', '2018-07-22 02:38:15.503298');
INSERT INTO `users_emailverifycode` VALUES ('10', '1316425655@qq.com', 'zFWAjyDL', 'register', '2018-07-22 02:45:11.544521');
INSERT INTO `users_emailverifycode` VALUES ('11', '1@1.commm', 'drEpWuhN', 'register', '2018-07-22 04:24:01.398755');
INSERT INTO `users_emailverifycode` VALUES ('12', '123@1234.com', 'gQitr8Fz', 'register', '2018-07-22 04:36:30.767011');
INSERT INTO `users_emailverifycode` VALUES ('14', '1316425655@qq.com', 'WHpJR6ro', 'forget', '2018-07-23 10:08:44.507799');
INSERT INTO `users_emailverifycode` VALUES ('15', 'ly03171629@163.com', '6Dpu1wJ7', 'register', '2018-07-23 17:43:54.284865');
INSERT INTO `users_emailverifycode` VALUES ('17', '1316425655@qq.com', 'mHNbmLCD', 'forget', '2018-07-23 21:11:00.619897');
INSERT INTO `users_emailverifycode` VALUES ('18', 'ly03171629@163.com', 'PP908KdN', 'change', '2018-07-28 09:42:24.961883');
INSERT INTO `users_emailverifycode` VALUES ('19', '1316425655@qq.com', 'v63s93bd', 'change', '2018-07-28 10:14:02.319543');
INSERT INTO `users_emailverifycode` VALUES ('22', '1316425655@qq.com', 'a7JXYRBI', 'change', '2018-07-28 10:31:24.813393');
INSERT INTO `users_emailverifycode` VALUES ('23', 'ly03171629@163.com', 'NnO0YWJ1', 'register', '2018-07-29 03:17:31.317898');
INSERT INTO `users_emailverifycode` VALUES ('24', 'ly03171629@163.com', 'duhz6XN9', 'register', '2018-07-29 14:31:02.698472');

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
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `nick_name` varchar(20) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `is_start` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$zuE46W43d3KD$eMabHTniSrYnlfZtaDJK9IzZCvqPkym23qXNzHtompA=', '2018-07-29 00:46:33.656483', '1', 'admin', '', '', '', '1', '1', '2018-07-20 15:46:14.694041', '', null, null, '男', null, '', '2018-07-20 15:46:14.694041', '0');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$36000$YYqphUIzEgA4$UpfNKzoJvpDkOUclbwIUi0zv16ru5jRTT+3dYqegZSM=', null, '0', '123@123.com', '', '', '123@123.com', '0', '1', '2018-07-21 14:37:35.592662', '', null, null, '男', null, '', '2018-07-21 14:37:35.592662', '0');
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$36000$7vC2FkDti1Ic$5fccAe5LjzGll+zHwFewxX+ztwxhCkXJEyc4DPbKfzI=', null, '0', '862700084@qq.com', '', '', '862700084@qq.com', '0', '1', '2018-07-21 16:16:00.603754', '', null, null, '男', null, '', '2018-07-21 16:16:00.604255', '1');
INSERT INTO `users_userprofile` VALUES ('18', 'pbkdf2_sha256$36000$2zXxZn58dpHb$cBbg0ZW+PNS4rQLA7HfekFByNsD1BcgeBoBBf5PU4bI=', null, '0', '1@1.commm', '', '', '1@1.commm', '0', '1', '2018-07-22 04:24:01.243622', '', null, null, '男', null, '', '2018-07-22 04:24:01.244624', '0');
INSERT INTO `users_userprofile` VALUES ('19', 'pbkdf2_sha256$36000$3hutIEeBgn8U$/MwqmD/FqlKdTkXmoi+gJtS9Ey5DieXyFc7Bvw/ppXA=', null, '0', '2@123.com', '', '', '2@123.com', '0', '1', '2018-07-22 04:33:55.608101', '', null, null, '男', null, '', '2018-07-22 04:33:55.608101', '0');
INSERT INTO `users_userprofile` VALUES ('20', 'pbkdf2_sha256$36000$nttbEVOgR0vp$u+VBgpKsyyBBtCssRejyVRiGDz/dtmqIM3y931oYY9Y=', null, '0', '123@1234.com', '', '', '123@1234.com', '0', '1', '2018-07-22 04:36:30.409783', '', null, null, '男', null, '', '2018-07-22 04:36:30.409783', '0');
INSERT INTO `users_userprofile` VALUES ('21', 'pbkdf2_sha256$36000$a7uZZv904qJf$zHieivQMzSVvJ7tdx5X2guojVSuq9hH2SckrtT4ir1g=', '2018-07-29 00:20:31.493762', '0', '1316425655@qq.com', '', '', '1316425655@qq.com', '0', '1', '2018-07-23 09:26:00.000000', '', 'wee', '2018-07-04 00:00:00.000000', '男', '北京昌平', '18503595642', '2018-07-23 09:26:00.000000', '1');
INSERT INTO `users_userprofile` VALUES ('23', 'pbkdf2_sha256$36000$Qu12wmVTvPJo$M0l5os0qEa6PcDmVYGdP0OiNYmZfQWqQPzhw/gv2cd8=', null, '0', '545609168@qq.com', '', '', '545609168@qq.com', '0', '1', '2018-07-23 17:51:45.541403', '', null, null, '男', null, '', '2018-07-23 17:51:45.541403', '0');
INSERT INTO `users_userprofile` VALUES ('25', 'pbkdf2_sha256$36000$qg7pe8g6BFBJ$FiNu6g2Wcx39wbI8SLwoZN4GZqSd5y2a+I4dAaMTk5U=', null, '0', 'ly03171629@163.com', '', '', 'ly03171629@163.com', '0', '1', '2018-07-29 14:01:12.523581', '', null, null, '男', null, '', '2018-07-29 14:01:12.523581', '0');
INSERT INTO `users_userprofile` VALUES ('26', 'pbkdf2_sha256$36000$xQzVXyQYukJ0$D6GNICDLuqowFvb3B5aYBeO7vH/uFlXyZRG550Vxx+o=', null, '0', 'an_tian_an@163.com', '', '', 'an_tian_an@163.com', '0', '1', '2018-07-29 15:05:25.592453', '', null, null, '男', null, '', '2018-07-29 15:05:25.592453', '0');
INSERT INTO `users_userprofile` VALUES ('27', 'pbkdf2_sha256$36000$SvrBURJBZkoD$aI3LUajzObGsg7E6q0RttvHsT4GO7TxeKGi1idGrA0g=', null, '0', 'aosdu@163.com', '', '', 'aosdu@163.com', '0', '1', '2018-07-29 15:08:12.138853', '', null, null, '男', null, '', '2018-07-29 15:08:12.139860', '0');
INSERT INTO `users_userprofile` VALUES ('28', 'pbkdf2_sha256$36000$A7M2s00JLvNa$XY3j6+CnSR1cvFPFgT3Ogoy6zU0xVaqCzxTD57wHJvQ=', null, '0', 'adsasda@163.com', '', '', 'adsasda@163.com', '0', '1', '2018-07-29 15:14:01.976491', '', null, null, '男', null, '', '2018-07-29 15:14:01.976491', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-07-20 16:22:39.703390', '127.0.0.1', '1', 'banners/18/07/20/banner1.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-07-20 16:22:49.733416', '127.0.0.1', '2', 'banners/18/07/20/banner2.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-07-20 16:22:58.280811', '127.0.0.1', '3', 'banners/18/07/20/banner3.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-07-20 16:23:06.296701', '127.0.0.1', '4', 'banners/18/07/20/banner4.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-07-20 16:23:16.159423', '127.0.0.1', '5', 'banners/18/07/20/banner5.jpg', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-07-20 16:31:44.099964', '127.0.0.1', '1', '北京', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-07-20 16:31:49.802099', '127.0.0.1', '2', '深圳', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-07-20 16:32:03.843995', '127.0.0.1', '3', '上海', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-07-20 16:32:09.219407', '127.0.0.1', '4', '广州', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-07-20 16:32:26.957441', '127.0.0.1', '5', '杭州', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-07-20 16:34:43.656427', '127.0.0.1', '1', '尚硅谷', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-07-20 16:36:10.350478', '127.0.0.1', '2', '尚硅谷2', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-07-20 16:37:37.272194', '127.0.0.1', '1', '宋大姐', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-07-20 16:38:08.851975', '127.0.0.1', '2', 'weesmile', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-07-20 16:38:42.646882', '127.0.0.1', '3', '阿福小哥', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-07-20 16:39:34.375316', '127.0.0.1', '4', '天哥哥', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-07-20 16:49:29.983887', '127.0.0.1', '1', '前端三大宝之html', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-07-20 16:50:39.552431', '127.0.0.1', '2', '前端三大宝之css', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-07-20 16:51:44.587354', '127.0.0.1', '3', '前端三大宝之js', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-07-20 16:53:01.476335', '127.0.0.1', '4', '数据库之mysql', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-07-20 16:53:30.698532', '127.0.0.1', '1', '第一章：mysql简介', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-07-20 16:53:42.033254', '127.0.0.1', '2', '第二章：mysql索引', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-07-20 16:55:08.151173', '127.0.0.1', '1', '1.1mysql简介', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-07-20 16:55:26.946362', '127.0.0.1', '2', '1.2mysql安装', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-07-20 16:55:51.045411', '127.0.0.1', '3', '2.1索引的简介', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-07-20 16:56:47.261255', '127.0.0.1', '1', '开发宝典', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-07-23 14:27:51.775237', '127.0.0.1', '3', '尚硅谷3', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-07-23 14:42:11.070317', '127.0.0.1', '4', '清华大学', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-07-23 14:43:16.696700', '127.0.0.1', '5', '阿里巴巴', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-07-23 15:04:20.026491', '127.0.0.1', '6', '尚硅谷4', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-07-27 10:07:47.837062', '127.0.0.1', '21', '1316425655@qq.com', 'change', '修改 last_login，image 和 phone', '6', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-07-28 23:53:10.096009', '127.0.0.1', '5', 'Linux全解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-07-28 23:54:15.575004', '127.0.0.1', '6', 'java基础', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-07-28 23:55:05.759793', '127.0.0.1', '7', 'redis全讲', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-07-28 23:56:10.777764', '127.0.0.1', '8', 'Javaweb从入门到精通', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-07-29 00:06:29.410155', '127.0.0.1', '7', '尚硅谷10', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-07-29 00:07:02.041155', '127.0.0.1', '8', '尚硅谷11', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-07-29 00:07:39.822047', '127.0.0.1', '9', '尚硅谷12', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-07-29 00:08:04.141181', '127.0.0.1', '10', '尚硅谷13', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-07-29 00:08:34.344020', '127.0.0.1', '11', '尚硅谷14', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-07-29 00:09:03.891271', '127.0.0.1', '12', '尚硅谷15', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-07-29 00:09:29.128016', '127.0.0.1', '13', '尚硅谷16', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-07-29 00:09:54.643365', '127.0.0.1', '14', '尚硅谷17', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-07-29 00:10:19.666191', '127.0.0.1', '15', '尚硅谷18', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-07-29 00:10:42.499617', '127.0.0.1', '16', '尚硅谷19', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-07-29 00:11:01.110273', '127.0.0.1', '17', '尚硅谷20', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-07-29 01:00:33.901379', '127.0.0.1', '1', '尚硅谷', 'change', '修改 image 和 detail', '10', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');

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
