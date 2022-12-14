/*
Navicat MySQL Data Transfer

Source Server         : aliyun_books
Source Server Version : 80018
Source Host           : 47.106.243.172:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2019-11-15 06:10:36
*/



-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catId` int(10) DEFAULT NULL,
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `book_desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `book_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `visit_count` bigint(20) DEFAULT '103',
  `update_time` datetime NOT NULL,
  `soft_cat` int(10) DEFAULT '0',
  `soft_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uniq_name_author` (`book_name`,`author`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for `book_content`
-- ----------------------------
DROP TABLE IF EXISTS `book_content`;
CREATE TABLE `book_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `index_id` bigint(20) DEFAULT NULL,
  `index_num` int(5) NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_bookid_indexnum` (`book_id`,`index_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3162213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book_content
-- ----------------------------

-- ----------------------------
-- Table structure for `book_crawl`
-- ----------------------------
DROP TABLE IF EXISTS `book_crawl`;
CREATE TABLE `book_crawl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crawl_web_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `crawl_web_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `crawl_web_code` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book_crawl
-- ----------------------------
INSERT INTO `book_crawl` VALUES ('1', '?????????', 'm.biqudao.com', '1', '0');
INSERT INTO `book_crawl` VALUES ('2', '?????????', 'm.biquta.com', '2', '0');

-- ----------------------------
-- Table structure for `book_index`
-- ----------------------------
DROP TABLE IF EXISTS `book_index`;
CREATE TABLE `book_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `index_num` int(5) NOT NULL,
  `index_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_bookid_indexNum` (`book_id`,`index_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3577216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of book_index
-- ----------------------------


-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` tinyint(2) NOT NULL DEFAULT '10',
  `get_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `req_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '???????????????URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `fb_order`
-- ----------------------------
DROP TABLE IF EXISTS `fb_order`;
CREATE TABLE `fb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `mcht_id` bigint(20) NOT NULL COMMENT '??????id',
  `sn` char(10) DEFAULT NULL COMMENT 'QR??????',
  `fb_merchant_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '???????????????',
  `merchant_order_sn` varchar(32) NOT NULL COMMENT '???????????????????????????',
  `order_sn` varchar(32) DEFAULT NULL COMMENT '???????????????',
  `platform_order_no` varchar(32) DEFAULT NULL COMMENT '??????????????????',
  `trade_no` varchar(32) DEFAULT NULL COMMENT '????????????',
  `order_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '???????????????1???????????????2??????????????????3??????????????????4???????????????',
  `fn_coupon` decimal(12,2) DEFAULT '0.00' COMMENT '?????????????????????',
  `red_packet` decimal(12,2) DEFAULT '0.00' COMMENT '????????????',
  `total_fee` decimal(12,2) NOT NULL COMMENT '????????????(???)',
  `order_price` decimal(12,2) DEFAULT NULL COMMENT '????????????',
  `fee` decimal(12,2) DEFAULT NULL COMMENT '?????????(???)',
  `body` varchar(512) DEFAULT NULL COMMENT '???????????????????????????',
  `attach` varchar(512) DEFAULT NULL COMMENT '????????????',
  `store_id` bigint(20) NOT NULL COMMENT '?????????????????????id',
  `cashier_id` bigint(16) DEFAULT NULL COMMENT '????????????????????????id',
  `device_no` varchar(32) DEFAULT NULL COMMENT '???????????????',
  `user_id` varchar(32) NOT NULL COMMENT '??????????????????????????????open_id??????????????????????????????buyer_user_id???',
  `user_logon_id` varchar(32) DEFAULT NULL COMMENT '????????????????????????',
  `pay_time` datetime DEFAULT NULL COMMENT '?????????????????????',
  `pay_channel` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '????????????:1?????????2????????????3??????',
  `no_cash_coupon_fee` decimal(10,2) DEFAULT NULL COMMENT '????????????????????????(???)',
  `cash_coupon_fee` decimal(10,0) DEFAULT NULL COMMENT '????????????????????????(???)',
  `cash_fee` decimal(10,2) DEFAULT NULL COMMENT '????????????????????????(???)',
  `sign` varchar(100) DEFAULT NULL COMMENT '??????',
  `options` varchar(1000) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime NOT NULL COMMENT '????????????',
  `push_time` datetime DEFAULT NULL COMMENT '????????????',
  `push_ip` varchar(100) DEFAULT NULL COMMENT '??????IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_merchant_order_sn` (`merchant_order_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=351227604617007122 DEFAULT CHARSET=utf8 COMMENT='??????-???????????????';

-- ----------------------------
-- Records of fb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `screen_bullet`
-- ----------------------------
DROP TABLE IF EXISTS `screen_bullet`;
CREATE TABLE `screen_bullet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) NOT NULL,
  `screen_bullet` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of screen_bullet
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '????????????ID??????????????????0',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `order_num` int(11) DEFAULT NULL COMMENT '??????',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '????????????  -1????????????  0?????????',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '?????????', '1', '1');
INSERT INTO `sys_dept` VALUES ('7', '6', '????????????', '1', '1');
INSERT INTO `sys_dept` VALUES ('8', '6', '????????????', '2', '1');
INSERT INTO `sys_dept` VALUES ('9', '0', '?????????', '2', '1');
INSERT INTO `sys_dept` VALUES ('10', '9', '????????????', '1', '1');
INSERT INTO `sys_dept` VALUES ('11', '0', '?????????', '3', '1');
INSERT INTO `sys_dept` VALUES ('12', '11', '????????????', '1', '1');
INSERT INTO `sys_dept` VALUES ('13', '0', '?????????', '5', '1');
INSERT INTO `sys_dept` VALUES ('14', '13', '????????????', '1', '1');
INSERT INTO `sys_dept` VALUES ('15', '13', '????????????', '2', '1');
INSERT INTO `sys_dept` VALUES ('16', '13', '????????????', '13', '1');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '??????????????????',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '????????????',
  `create_by` int(64) DEFAULT NULL COMMENT '?????????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` bigint(64) DEFAULT NULL COMMENT '?????????',
  `update_date` datetime DEFAULT NULL COMMENT '????????????',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '????????????',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='?????????';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '??????', '0', 'del_flag', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '??????', '1', 'show_hide', '??????/??????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '??????', '0', 'show_hide', '??????/??????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '???', '1', 'yes_no', '???/???', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '???', '0', 'yes_no', '???/???', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '??????', 'red', 'color', '?????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '??????', 'green', 'color', '?????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '??????', 'blue', 'color', '?????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '??????', 'yellow', 'color', '?????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '??????', 'orange', 'color', '?????????', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '????????????', 'default', 'theme', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '????????????', 'cerulean', 'theme', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '????????????', 'readable', 'theme', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '????????????', 'united', 'theme', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat??????', 'flat', 'theme', '????????????', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '??????', '1', 'sys_area_type', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '??????????????????', '2', 'sys_area_type', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '??????', '3', 'sys_area_type', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '??????', '4', 'sys_area_type', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '??????', '1', 'sys_office_type', '????????????', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '??????', '2', 'sys_office_type', '????????????', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '??????', '3', 'sys_office_type', '????????????', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '??????', '4', 'sys_office_type', '????????????', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '?????????', '1', 'sys_office_common', '??????????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '?????????', '2', 'sys_office_common', '??????????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '?????????', '3', 'sys_office_common', '??????????????????', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '??????', '1', 'sys_office_grade', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '??????', '2', 'sys_office_grade', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '??????', '3', 'sys_office_grade', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '??????', '4', 'sys_office_grade', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '????????????', '1', 'sys_data_scope', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '???????????????????????????', '2', 'sys_data_scope', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '??????????????????', '3', 'sys_data_scope', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '???????????????????????????', '4', 'sys_data_scope', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '??????????????????', '5', 'sys_data_scope', '????????????', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '???????????????', '8', 'sys_data_scope', '????????????', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '???????????????', '9', 'sys_data_scope', '????????????', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '????????????', '1', 'sys_user_type', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '????????????', '2', 'sys_user_type', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '????????????', '3', 'sys_user_type', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '????????????', 'basic', 'cms_theme', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '????????????', 'blue', 'cms_theme', '????????????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '????????????', 'red', 'cms_theme', '????????????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '????????????', 'article', 'cms_module', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '????????????', 'picture', 'cms_module', '????????????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '????????????', 'download', 'cms_module', '????????????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '????????????', 'link', 'cms_module', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '????????????', 'special', 'cms_module', '????????????', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '??????????????????', '0', 'cms_show_modes', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '?????????????????????', '1', 'cms_show_modes', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '?????????????????????', '2', 'cms_show_modes', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '??????', '0', 'cms_del_flag', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '??????', '1', 'cms_del_flag', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '??????', '2', 'cms_del_flag', '????????????', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '???????????????', '1', 'cms_posid', '?????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '?????????????????????', '2', 'cms_posid', '?????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '??????', '1', 'cms_guestbook', '???????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '??????', '2', 'cms_guestbook', '???????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '??????', '3', 'cms_guestbook', '???????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '??????', '4', 'cms_guestbook', '???????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '??????', '1', 'oa_leave_type', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '??????', '2', 'oa_leave_type', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '??????', '3', 'oa_leave_type', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '??????', '4', 'oa_leave_type', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '??????', '5', 'oa_leave_type', '????????????', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '????????????', '1', 'sys_log_type', '????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '????????????', '2', 'sys_log_type', '????????????', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '????????????', 'leave', 'act_type', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '??????????????????', 'test_audit', 'act_type', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '??????1', '1', 'act_category', '????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '??????2', '2', 'act_category', '????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '????????????', 'crud', 'gen_category', '??????????????????', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '??????????????????????????????', 'crud_many', 'gen_category', '??????????????????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '?????????', 'tree', 'gen_category', '??????????????????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '????????????', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '????????????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '????????????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '????????????', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '????????????', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '????????????', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '????????????', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '????????????', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '?????????', 'input', 'gen_show_type', '??????????????????', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '?????????', 'textarea', 'gen_show_type', '??????????????????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '?????????', 'select', 'gen_show_type', '??????????????????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '?????????', 'checkbox', 'gen_show_type', '??????????????????', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '?????????', 'radiobox', 'gen_show_type', '??????????????????', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '????????????', 'dateselect', 'gen_show_type', '??????????????????', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '????????????', 'userselect', 'gen_show_type', '??????????????????', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '????????????', 'officeselect', 'gen_show_type', '??????????????????', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '????????????', 'areaselect', 'gen_show_type', '??????????????????', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java??????', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java??????', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '????????????', 'dao', 'gen_category', '??????????????????', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '???', '1', 'sex', '??????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '???', '2', 'sex', '??????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java??????', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java??????', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java??????', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java??????', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '????????????', '1', 'oa_notify_type', '??????????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '????????????', '2', 'oa_notify_type', '??????????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '????????????', '3', 'oa_notify_type', '??????????????????', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '??????', '0', 'oa_notify_status', '??????????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '??????', '1', 'oa_notify_status', '??????????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '??????', '0', 'oa_notify_read', '??????????????????', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '??????', '1', 'oa_notify_read', '??????????????????', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '??????', '0', 'oa_notify_status', '??????????????????', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '??????', '1', 'del_flag', '????????????', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('121', '??????', 'code', 'hobby', '??????', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('122', '??????', 'painting', 'hobby', '??????', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('142', '0', '/files/658554ff-cd62-4ca2-936d-62e35f8af5ef.png', '2019-11-01 16:13:39');
INSERT INTO `sys_file` VALUES ('143', '0', '/files/de40bb48-c278-4360-9ee6-80b464419255.png', '2019-11-01 16:14:24');
INSERT INTO `sys_file` VALUES ('144', '0', '/files/8b0737fb-e68d-4162-a066-05f1f3f66b0f.png', '2019-11-02 19:42:03');
INSERT INTO `sys_file` VALUES ('145', '0', '/files/1006a87c-ee4e-4e97-8bcd-2b5cf861b826.png', '2019-11-02 19:42:28');
INSERT INTO `sys_file` VALUES ('146', '0', '/files/d7834c20-0e29-4c92-8d0a-9b1297b6e5b8.png', '2019-11-02 19:43:05');
INSERT INTO `sys_file` VALUES ('147', '0', '/files/6e5d38de-4366-459a-a498-7e418e746f62.png', '2019-11-02 19:45:59');
INSERT INTO `sys_file` VALUES ('148', '0', '/files/e34d60a9-6bde-48c0-ac4c-64a5ddffcdd4.jpg', '2019-11-02 19:54:49');
INSERT INTO `sys_file` VALUES ('149', '0', '/files/545579fa-ab81-42e2-8bfa-13ebdc7a137d.png', '2019-11-09 10:39:05');
INSERT INTO `sys_file` VALUES ('150', '1', '/files/fe0fe8db-495f-4c23-8c74-744399f5c1af.txt', '2019-11-09 17:28:31');
INSERT INTO `sys_file` VALUES ('151', '99', '/files/1a710af4-a766-4ed8-b8e9-2ec5ef25df6b.sql', '2019-11-09 17:42:59');
INSERT INTO `sys_file` VALUES ('152', '99', '/files/3a984623-4d2c-4122-9b47-6054eb670dc9.sql', '2019-11-09 17:43:04');
INSERT INTO `sys_file` VALUES ('153', '0', '/files/2019/11/09/44eddafe-1c58-4710-a2ba-3f88d0e77958.png', '2019-11-09 18:29:26');

-- ----------------------------
-- Table structure for `sys_gen_columns`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_columns`;
CREATE TABLE `sys_gen_columns` (
  `id` varchar(36) NOT NULL COMMENT '??????',
  `table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '??????',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '??????',
  `column_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '?????????',
  `column_comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '?????????',
  `page_type` tinyint(2) DEFAULT '1' COMMENT '?????????????????????1???????????? 2???????????? 3????????? 4???????????? 5?????????????????????????????? 6??????????????????????????????',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '??????????????????????????????????????????????????????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_gen_columns
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_table`;
CREATE TABLE `sys_gen_table` (
  `id` bigint(20) NOT NULL COMMENT '??????',
  `table_name` varchar(64) NOT NULL COMMENT '??????',
  `class_name` varchar(100) NOT NULL COMMENT '???????????????',
  `comments` varchar(500) NOT NULL COMMENT '?????????',
  `category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '?????????0???????????????1?????????',
  `package_name` varchar(500) DEFAULT NULL COMMENT '???????????????',
  `module_name` varchar(30) DEFAULT NULL COMMENT '???????????????',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '??????????????????',
  `function_name` varchar(200) DEFAULT NULL COMMENT '?????????????????????????????????',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '???????????????????????????????????????????????????????????????xx?????????',
  `author` varchar(50) DEFAULT NULL COMMENT '??????????????????',
  `src_dir` varchar(1000) DEFAULT NULL COMMENT 'src??????',
  `options` varchar(1000) DEFAULT NULL COMMENT '??????????????????',
  `create_by` bigint(20) NOT NULL COMMENT '?????????',
  `create_date` datetime NOT NULL COMMENT '????????????',
  `update_by` bigint(20) NOT NULL COMMENT '?????????',
  `update_date` datetime NOT NULL COMMENT '????????????',
  `remarks` varchar(500) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='???????????????';

-- ----------------------------
-- Records of sys_gen_table
-- ----------------------------
INSERT INTO `sys_gen_table` VALUES ('1', '??????', '1', '1', '0', null, null, null, null, null, null, null, null, '1', '2019-10-24 18:21:24', '1', '2019-10-24 18:21:35', null);

-- ----------------------------
-- Table structure for `sys_gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gen_table_column`;
CREATE TABLE `sys_gen_table_column` (
  `id` bigint(20) NOT NULL COMMENT '??????',
  `table_id` bigint(20) NOT NULL COMMENT '???id',
  `column_name` varchar(64) NOT NULL COMMENT '??????',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '?????????????????????',
  `column_type` varchar(100) NOT NULL COMMENT '??????',
  `column_label` varchar(50) DEFAULT NULL COMMENT '????????????',
  `comments` varchar(500) NOT NULL COMMENT '???????????????',
  `attr_name` varchar(200) NOT NULL COMMENT '???????????????',
  `attr_type` varchar(200) NOT NULL COMMENT '??????????????????',
  `is_pk` char(1) DEFAULT NULL COMMENT '????????????',
  `is_null` char(1) DEFAULT NULL COMMENT '???????????????',
  `is_insert` char(1) DEFAULT NULL COMMENT '??????????????????',
  `is_update` char(1) DEFAULT NULL COMMENT '??????????????????',
  `is_list` char(1) DEFAULT NULL COMMENT '??????????????????',
  `is_query` char(1) DEFAULT NULL COMMENT '??????????????????',
  `query_type` varchar(200) DEFAULT NULL COMMENT '????????????',
  `is_edit` char(1) DEFAULT NULL COMMENT '??????????????????',
  `show_type` varchar(200) DEFAULT NULL COMMENT '????????????',
  `options` varchar(1000) DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '??????id',
  `username` varchar(50) DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) DEFAULT NULL COMMENT '????????????',
  `time` int(11) DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) DEFAULT NULL COMMENT '????????????',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP??????',
  `gmt_create` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1157', '1', 'admin', '??????????????????', '654', 'com.java2nb.system.controller.LoginController.index()', null, '127.0.0.1', '2019-11-15 06:01:32');
INSERT INTO `sys_log` VALUES ('1158', '-1', '????????????????????????', '??????', '147', 'com.java2nb.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2019-11-15 06:05:53');
INSERT INTO `sys_log` VALUES ('1159', '1', 'admin', '??????', '164', 'com.java2nb.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2019-11-15 06:05:58');
INSERT INTO `sys_log` VALUES ('1160', '1', 'admin', '??????????????????', '558', 'com.java2nb.system.controller.LoginController.index()', null, '127.0.0.1', '2019-11-15 06:05:59');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) DEFAULT NULL COMMENT '????????????',
  `order_num` int(11) DEFAULT NULL COMMENT '??????',
  `gmt_create` datetime DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COMMENT='????????????';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('209', '0', '????????????', '', '', '0', 'fa fa-folder-o', '20', null, null);
INSERT INTO `sys_menu` VALUES ('211', '209', '????????????', 'books/bookCrawl', 'books:bookCrawl:bookCrawl', '1', '', '1', null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) DEFAULT NULL COMMENT '??????',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '????????????id',
  `gmt_create` datetime DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='??????';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '??????????????????', 'admin', '??????????????????', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES ('59', '????????????', null, '??????????????????', null, null, null);
INSERT INTO `sys_role` VALUES ('60', '????????????', null, 'ceshi', null, null, null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4047 DEFAULT CHARSET=utf8 COMMENT='???????????????????????????';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2084', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('2085', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('2086', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('2087', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('2088', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('2089', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('2090', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('2243', '48', '72');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('2974', '57', '93');
INSERT INTO `sys_role_menu` VALUES ('2975', '57', '99');
INSERT INTO `sys_role_menu` VALUES ('2976', '57', '95');
INSERT INTO `sys_role_menu` VALUES ('2977', '57', '101');
INSERT INTO `sys_role_menu` VALUES ('2978', '57', '96');
INSERT INTO `sys_role_menu` VALUES ('2979', '57', '94');
INSERT INTO `sys_role_menu` VALUES ('2980', '57', '-1');
INSERT INTO `sys_role_menu` VALUES ('2981', '58', '93');
INSERT INTO `sys_role_menu` VALUES ('2982', '58', '99');
INSERT INTO `sys_role_menu` VALUES ('2983', '58', '95');
INSERT INTO `sys_role_menu` VALUES ('2984', '58', '101');
INSERT INTO `sys_role_menu` VALUES ('2985', '58', '96');
INSERT INTO `sys_role_menu` VALUES ('2986', '58', '94');
INSERT INTO `sys_role_menu` VALUES ('2987', '58', '-1');
INSERT INTO `sys_role_menu` VALUES ('3232', '59', '98');
INSERT INTO `sys_role_menu` VALUES ('3233', '59', '101');
INSERT INTO `sys_role_menu` VALUES ('3234', '59', '99');
INSERT INTO `sys_role_menu` VALUES ('3235', '59', '95');
INSERT INTO `sys_role_menu` VALUES ('3236', '59', '90');
INSERT INTO `sys_role_menu` VALUES ('3237', '59', '89');
INSERT INTO `sys_role_menu` VALUES ('3238', '59', '88');
INSERT INTO `sys_role_menu` VALUES ('3239', '59', '87');
INSERT INTO `sys_role_menu` VALUES ('3240', '59', '86');
INSERT INTO `sys_role_menu` VALUES ('3241', '59', '68');
INSERT INTO `sys_role_menu` VALUES ('3242', '59', '60');
INSERT INTO `sys_role_menu` VALUES ('3243', '59', '59');
INSERT INTO `sys_role_menu` VALUES ('3244', '59', '58');
INSERT INTO `sys_role_menu` VALUES ('3245', '59', '51');
INSERT INTO `sys_role_menu` VALUES ('3246', '59', '76');
INSERT INTO `sys_role_menu` VALUES ('3247', '59', '75');
INSERT INTO `sys_role_menu` VALUES ('3248', '59', '74');
INSERT INTO `sys_role_menu` VALUES ('3249', '59', '62');
INSERT INTO `sys_role_menu` VALUES ('3250', '59', '56');
INSERT INTO `sys_role_menu` VALUES ('3251', '59', '55');
INSERT INTO `sys_role_menu` VALUES ('3252', '59', '15');
INSERT INTO `sys_role_menu` VALUES ('3253', '59', '26');
INSERT INTO `sys_role_menu` VALUES ('3254', '59', '25');
INSERT INTO `sys_role_menu` VALUES ('3255', '59', '24');
INSERT INTO `sys_role_menu` VALUES ('3256', '59', '14');
INSERT INTO `sys_role_menu` VALUES ('3257', '59', '13');
INSERT INTO `sys_role_menu` VALUES ('3258', '59', '12');
INSERT INTO `sys_role_menu` VALUES ('3259', '59', '61');
INSERT INTO `sys_role_menu` VALUES ('3260', '59', '22');
INSERT INTO `sys_role_menu` VALUES ('3261', '59', '21');
INSERT INTO `sys_role_menu` VALUES ('3262', '59', '20');
INSERT INTO `sys_role_menu` VALUES ('3263', '59', '83');
INSERT INTO `sys_role_menu` VALUES ('3264', '59', '81');
INSERT INTO `sys_role_menu` VALUES ('3265', '59', '80');
INSERT INTO `sys_role_menu` VALUES ('3266', '59', '79');
INSERT INTO `sys_role_menu` VALUES ('3267', '59', '71');
INSERT INTO `sys_role_menu` VALUES ('3268', '59', '97');
INSERT INTO `sys_role_menu` VALUES ('3269', '59', '96');
INSERT INTO `sys_role_menu` VALUES ('3270', '59', '94');
INSERT INTO `sys_role_menu` VALUES ('3271', '59', '93');
INSERT INTO `sys_role_menu` VALUES ('3272', '59', '85');
INSERT INTO `sys_role_menu` VALUES ('3273', '59', '84');
INSERT INTO `sys_role_menu` VALUES ('3274', '59', '50');
INSERT INTO `sys_role_menu` VALUES ('3275', '59', '49');
INSERT INTO `sys_role_menu` VALUES ('3276', '59', '73');
INSERT INTO `sys_role_menu` VALUES ('3277', '59', '7');
INSERT INTO `sys_role_menu` VALUES ('3278', '59', '6');
INSERT INTO `sys_role_menu` VALUES ('3279', '59', '2');
INSERT INTO `sys_role_menu` VALUES ('3280', '59', '3');
INSERT INTO `sys_role_menu` VALUES ('3281', '59', '78');
INSERT INTO `sys_role_menu` VALUES ('3282', '59', '1');
INSERT INTO `sys_role_menu` VALUES ('3283', '59', '-1');
INSERT INTO `sys_role_menu` VALUES ('3773', '60', '92');
INSERT INTO `sys_role_menu` VALUES ('3774', '60', '57');
INSERT INTO `sys_role_menu` VALUES ('3775', '60', '30');
INSERT INTO `sys_role_menu` VALUES ('3776', '60', '29');
INSERT INTO `sys_role_menu` VALUES ('3777', '60', '28');
INSERT INTO `sys_role_menu` VALUES ('3778', '60', '104');
INSERT INTO `sys_role_menu` VALUES ('3779', '60', '48');
INSERT INTO `sys_role_menu` VALUES ('3780', '60', '76');
INSERT INTO `sys_role_menu` VALUES ('3781', '60', '75');
INSERT INTO `sys_role_menu` VALUES ('3782', '60', '74');
INSERT INTO `sys_role_menu` VALUES ('3783', '60', '62');
INSERT INTO `sys_role_menu` VALUES ('3784', '60', '56');
INSERT INTO `sys_role_menu` VALUES ('3785', '60', '55');
INSERT INTO `sys_role_menu` VALUES ('3786', '60', '15');
INSERT INTO `sys_role_menu` VALUES ('3787', '60', '26');
INSERT INTO `sys_role_menu` VALUES ('3788', '60', '25');
INSERT INTO `sys_role_menu` VALUES ('3789', '60', '24');
INSERT INTO `sys_role_menu` VALUES ('3790', '60', '14');
INSERT INTO `sys_role_menu` VALUES ('3791', '60', '13');
INSERT INTO `sys_role_menu` VALUES ('3792', '60', '12');
INSERT INTO `sys_role_menu` VALUES ('3793', '60', '61');
INSERT INTO `sys_role_menu` VALUES ('3794', '60', '22');
INSERT INTO `sys_role_menu` VALUES ('3795', '60', '21');
INSERT INTO `sys_role_menu` VALUES ('3796', '60', '20');
INSERT INTO `sys_role_menu` VALUES ('3797', '60', '83');
INSERT INTO `sys_role_menu` VALUES ('3798', '60', '81');
INSERT INTO `sys_role_menu` VALUES ('3799', '60', '80');
INSERT INTO `sys_role_menu` VALUES ('3800', '60', '79');
INSERT INTO `sys_role_menu` VALUES ('3801', '60', '71');
INSERT INTO `sys_role_menu` VALUES ('3802', '60', '27');
INSERT INTO `sys_role_menu` VALUES ('3803', '60', '91');
INSERT INTO `sys_role_menu` VALUES ('3804', '60', '77');
INSERT INTO `sys_role_menu` VALUES ('3805', '60', '73');
INSERT INTO `sys_role_menu` VALUES ('3806', '60', '7');
INSERT INTO `sys_role_menu` VALUES ('3807', '60', '6');
INSERT INTO `sys_role_menu` VALUES ('3808', '60', '2');
INSERT INTO `sys_role_menu` VALUES ('3809', '60', '3');
INSERT INTO `sys_role_menu` VALUES ('3810', '60', '78');
INSERT INTO `sys_role_menu` VALUES ('3811', '60', '1');
INSERT INTO `sys_role_menu` VALUES ('3812', '60', '-1');
INSERT INTO `sys_role_menu` VALUES ('3997', '1', '210');
INSERT INTO `sys_role_menu` VALUES ('3998', '1', '208');
INSERT INTO `sys_role_menu` VALUES ('3999', '1', '207');
INSERT INTO `sys_role_menu` VALUES ('4000', '1', '206');
INSERT INTO `sys_role_menu` VALUES ('4001', '1', '205');
INSERT INTO `sys_role_menu` VALUES ('4002', '1', '204');
INSERT INTO `sys_role_menu` VALUES ('4003', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('4004', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('4005', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('4006', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('4007', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('4008', '1', '104');
INSERT INTO `sys_role_menu` VALUES ('4009', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('4010', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('4011', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('4012', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('4013', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('4014', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('4015', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('4016', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4017', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('4018', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('4019', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('4020', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('4021', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('4022', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('4023', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('4024', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('4025', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('4026', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('4027', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('4028', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('4029', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('4030', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('4031', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('4032', '1', '203');
INSERT INTO `sys_role_menu` VALUES ('4033', '1', '202');
INSERT INTO `sys_role_menu` VALUES ('4034', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('4035', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('4036', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('4037', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('4038', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('4039', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('4040', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('4041', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4042', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('4043', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('4044', '1', '211');
INSERT INTO `sys_role_menu` VALUES ('4045', '1', '209');
INSERT INTO `sys_role_menu` VALUES ('4046', '1', '-1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '?????????',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '??????',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) DEFAULT NULL COMMENT '?????????',
  `status` tinyint(255) DEFAULT NULL COMMENT '?????? 0:?????????1:??????',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '????????????id',
  `gmt_create` datetime DEFAULT NULL COMMENT '????????????',
  `gmt_modified` datetime DEFAULT NULL COMMENT '????????????',
  `sex` bigint(32) DEFAULT NULL COMMENT '??????',
  `birth` datetime DEFAULT NULL COMMENT '????????????',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '????????????',
  `hobby` varchar(255) DEFAULT NULL COMMENT '??????',
  `province` varchar(255) DEFAULT NULL COMMENT '??????',
  `city` varchar(255) DEFAULT NULL COMMENT '????????????',
  `district` varchar(255) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '???????????????', 'd1e2292b8991e896b272a37e1c9be3ad', '6', 'admin@example.com', '17699999999', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2017-12-14 00:00:00', '148', 'ccc', '122;121;', '?????????', '??????????????????', '?????????');


-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='???????????????????????????';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('106', '124', '1');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('113', '131', '48');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('123', '130', '1');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('125', '132', '52');
INSERT INTO `sys_user_role` VALUES ('126', '132', '49');
INSERT INTO `sys_user_role` VALUES ('127', '123', '48');
INSERT INTO `sys_user_role` VALUES ('132', '36', '48');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_ref_book`
-- ----------------------------
DROP TABLE IF EXISTS `user_ref_book`;
CREATE TABLE `user_ref_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `book_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_ref_book
-- ----------------------------

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('212', '209', '????????????', 'books/book', 'books:book:book', '1', '', '2', NULL, NULL);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES ('4087', '1', '212');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('203', '202', '????????????', 'test/order', 'test:order:order', '3', '', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('75', '73', '??????', 'system/sysDept/remove', 'system:sysDept:remove', '2', NULL, '2', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('6', '3', '????????????', 'sys/user/', 'sys:user:user', '3', 'fa fa-user', '3', '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('7', '3', '????????????', 'sys/role', 'sys:role:role', '3', 'fa fa-paw', '3', '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('92', '91', '????????????', 'sys/online', '', '3', 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('2', '3', '????????????', 'sys/menu/', 'sys:menu:menu', '3', 'fa fa-th-list', '2', '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('27', '91', '????????????', 'common/log', 'common:log', '3', 'fa fa-warning', '3', '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('48', '77', '????????????', 'common/generator', 'common:generator', '3', 'fa fa-code', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('76', '73', '??????', '/system/sysDept/edit', 'system:sysDept:edit', '2', NULL, '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('74', '73', '??????', '/system/sysDept/add', 'system:sysDept:add', '2', NULL, '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('73', '3', '????????????', '/system/sysDept', 'system:sysDept:sysDept', '3', 'fa fa-users', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('104', '77', 'swagger', '/swagger-ui.html', '', '3', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('57', '91', '????????????', '/druid/index.html', '', '3', 'fa fa-caret-square-o-right', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('71', '3', '????????????', '/common/sysFile', 'common:sysFile:sysFile', '3', 'fa fa-folder-open', '2', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('81', '78', '??????', '/common/dict/remove', 'common:dict:remove', '2', '', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('80', '78', '??????', '/common/dict/edit', 'common:dict:edit', '2', NULL, '2', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('83', '78', '????????????', '/common/dict/batchRemove', 'common:dict:batchRemove', '2', '', '4', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('79', '78', '??????', '/common/dict/add', 'common:dict:add', '2', NULL, '2', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('78', '3', '????????????', '/common/dict', 'common:dict:dict', '3', 'fa fa-book', '3', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('12', '6', '??????', '', 'sys:user:add', '2', '', '3', '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('202', '3', '????????????', '', '', '3', 'fa fa-s15', '12', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('204', '203', '??????', '', 'test:order:add', '2', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('205', '203', '??????', '', 'test:order:edit', '2', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('13', '6', '??????', '', 'sys:user:edit', '2', '', '3', '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('91', '3', '????????????', '', '', '3', 'fa fa-video-camera', '4', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('206', '203', '??????', '', 'test:order:remove', '2', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('207', '203', '????????????', '', 'test:order:batchRemove', '2', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('208', '203', '??????', '', 'test:order:detail', '2', '', '3', NULL, NULL);

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('3', '3', '????????????', '', '', '3', 'fa fa-bars', '3', '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('77', '3', '????????????', '', '', '3', 'fa fa-gear', '5', NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('21', '2', '??????', '', 'sys:menu:edit', '2', '', '3', '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('62', '7', '????????????', '', 'sys:role:batchRemove', '2', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('61', '2', '????????????', '', 'sys:menu:batchRemove', '2', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('56', '7', '??????', '', 'sys:role:remove', '2', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('55', '7', '??????', '', 'sys:role:edit', '2', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('15', '7', '??????', '', 'sys:role:add', '2', '', '3', '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('20', '2', '??????', '', 'sys:menu:add', '2', '', '3', '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('26', '6', '????????????', '', 'sys:user:resetPwd', '2', '', '3', '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('24', '6', '????????????', '', 'sys:user:batchRemove', '2', '', '3', '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('22', '2', '??????', '', 'sys:menu:remove', '2', '', '3', '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('14', '6', '??????', NULL, 'sys:user:remove', '2', NULL, '3', '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('30', '27', '??????', NULL, 'sys:log:clear', '2', NULL, '3', '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('29', '27', '??????', NULL, 'sys:log:remove', '2', NULL, '3', '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('28', '27', '??????', NULL, 'sys:log:list', '2', NULL, '3', '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`, `gmt_create`, `gmt_modified`) VALUES ('25', '6', '??????', NULL, 'sys:user:disable', '2', NULL, '3', '2017-08-14 17:27:43', NULL);


INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('123', '????????????', '1', 'novel_category', '????????????', '1', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('124', '????????????', '2', 'novel_category', '????????????', '2', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('125', '????????????', '3', 'novel_category', '????????????', '3', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('126', '????????????', '4', 'novel_category', '????????????', '4', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('127', '????????????', '5', 'novel_category', '????????????', '5', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('128', '????????????', '6', 'novel_category', '????????????', '6', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_dict` (`id`, `name`, `value`, `type`, `description`, `sort`, `parent_id`, `create_by`, `create_date`, `update_by`, `update_date`, `remarks`, `del_flag`) VALUES ('129', '????????????', '7', 'novel_category', '????????????', '7', NULL, NULL, NULL, NULL, NULL, '', NULL);

alter table user_ref_book add column `index_num` int(5);



DROP TABLE IF EXISTS `book_parse_log`;
CREATE TABLE `book_parse_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_url` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `book_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_key_bookurl` (`book_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `book_update_time_log`;
CREATE TABLE `book_update_time_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_cat_id` int(11) NOT NULL,
  `last_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_key_catid` (`book_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

INSERT INTO `book_update_time_log` VALUES ('1', '1', NOW());
INSERT INTO `book_update_time_log` VALUES ('2', '2', NOW());
INSERT INTO `book_update_time_log` VALUES ('3', '3', NOW());
INSERT INTO `book_update_time_log` VALUES ('4', '4', NOW());
INSERT INTO `book_update_time_log` VALUES ('5', '5', NOW());
INSERT INTO `book_update_time_log` VALUES ('6', '6', NOW());
INSERT INTO `book_update_time_log` VALUES ('7', '7', NOW());

ALTER  TABLE  book_parse_log  drop  INDEX  uq_key_bookurl;
