/*
Navicat MySQL Data Transfer

Source Server         : 82.156.12.15
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : cool

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-03-26 15:58:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_app_space_info`
-- ----------------------------
DROP TABLE IF EXISTS `base_app_space_info`;
CREATE TABLE `base_app_space_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `classifyId` bigint(20) DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`),
  KEY `IDX_4aed04cbfa2ecdc01485b86e51` (`createTime`),
  KEY `IDX_abd5de4a4895eb253a5cabb20f` (`updateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_app_space_info
-- ----------------------------

-- ----------------------------
-- Table structure for `base_app_space_type`
-- ----------------------------
DROP TABLE IF EXISTS `base_app_space_type`;
CREATE TABLE `base_app_space_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `name` varchar(255) NOT NULL COMMENT '类别名称',
  `parentId` tinyint(4) DEFAULT NULL COMMENT '父分类ID',
  PRIMARY KEY (`id`),
  KEY `IDX_5e8376603f89fdf3e7bb05103a` (`createTime`),
  KEY `IDX_500ea9e8b2c5c08c9b86a0667e` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_app_space_type
-- ----------------------------
INSERT INTO `base_app_space_type` VALUES ('1', '2021-02-26 14:07:48.867045', '2021-02-26 14:07:48.867045', 'a', null);
INSERT INTO `base_app_space_type` VALUES ('2', '2021-02-26 14:07:52.285531', '2021-02-26 14:07:52.285531', 'b', null);

-- ----------------------------
-- Table structure for `base_sys_conf`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_conf`;
CREATE TABLE `base_sys_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `cKey` varchar(255) NOT NULL COMMENT '配置键',
  `cValue` varchar(255) NOT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_9be195d27767b4485417869c3a` (`cKey`),
  KEY `IDX_905208f206a3ff9fd513421971` (`createTime`),
  KEY `IDX_4c6f27f6ecefe51a5a196a047a` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_conf
-- ----------------------------
INSERT INTO `base_sys_conf` VALUES ('1', '2021-02-25 14:23:26.810981', '2021-02-25 14:23:26.810981', 'logKeep', '31');

-- ----------------------------
-- Table structure for `base_sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_department`;
CREATE TABLE `base_sys_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `parentId` bigint(20) DEFAULT NULL COMMENT '上级部门ID',
  `orderNum` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `IDX_be4c53cd671384fa588ca9470a` (`createTime`),
  KEY `IDX_ca1473a793961ec55bc0c8d268` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_department
-- ----------------------------
INSERT INTO `base_sys_department` VALUES ('1', '2021-02-24 21:17:11.971397', '2021-03-24 12:57:52.000000', '云闸机管理系统A', null, '0');
INSERT INTO `base_sys_department` VALUES ('11', '2021-02-26 14:17:06.690613', '2021-03-24 13:05:17.000000', '经销商', '1', '0');
INSERT INTO `base_sys_department` VALUES ('14', '2021-03-24 14:54:07.458354', '2021-03-24 14:54:07.458354', '工程商', '11', '0');
INSERT INTO `base_sys_department` VALUES ('15', '2021-03-24 14:54:15.704903', '2021-03-24 14:54:15.704903', '客户', '14', '0');

-- ----------------------------
-- Table structure for `base_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_log`;
CREATE TABLE `base_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `action` varchar(100) NOT NULL COMMENT '行为',
  `ip` varchar(50) DEFAULT NULL COMMENT 'ip',
  `ipAddr` varchar(50) DEFAULT NULL COMMENT 'ip地址',
  `params` text COMMENT '参数',
  PRIMARY KEY (`id`),
  KEY `IDX_51a2caeb5713efdfcb343a8772` (`userId`),
  KEY `IDX_938f886fb40e163db174b7f6c3` (`action`),
  KEY `IDX_24e18767659f8c7142580893f2` (`ip`),
  KEY `IDX_a03a27f75cf8d502b3060823e1` (`ipAddr`),
  KEY `IDX_c9382b76219a1011f7b8e7bcd1` (`createTime`),
  KEY `IDX_bfd44e885b470da43bcc39aaa7` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2119 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_log
-- ----------------------------
INSERT INTO `base_sys_log` VALUES ('1', '2021-03-24 13:04:20.250210', '2021-03-24 13:04:20.250210', '1', '/admin/base/sys/log/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2', '2021-03-24 13:04:20.251469', '2021-03-24 13:04:20.251469', '1', '/admin/base/sys/log/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('3', '2021-03-24 13:04:52.394090', '2021-03-24 13:04:52.394090', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('4', '2021-03-24 13:04:52.394730', '2021-03-24 13:04:52.394730', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('5', '2021-03-24 13:04:52.729599', '2021-03-24 13:04:52.729599', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6', '2021-03-24 13:04:52.728778', '2021-03-24 13:04:52.728778', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7', '2021-03-24 13:04:52.734833', '2021-03-24 13:04:52.734833', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('8', '2021-03-24 13:04:52.735892', '2021-03-24 13:04:52.735892', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('9', '2021-03-24 13:05:17.654520', '2021-03-24 13:05:17.654520', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":11,\"parentId\":1,\"name\":\"经销商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('10', '2021-03-24 13:05:17.655649', '2021-03-24 13:05:17.655649', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":11,\"parentId\":1,\"name\":\"经销商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('11', '2021-03-24 13:05:17.901248', '2021-03-24 13:05:17.901248', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('12', '2021-03-24 13:05:17.901868', '2021-03-24 13:05:17.901868', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('13', '2021-03-24 13:05:24.442210', '2021-03-24 13:05:24.442210', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":12,\"parentId\":1,\"name\":\"工程商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('14', '2021-03-24 13:05:24.442927', '2021-03-24 13:05:24.442927', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":12,\"parentId\":1,\"name\":\"工程商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('15', '2021-03-24 13:05:24.863549', '2021-03-24 13:05:24.863549', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('16', '2021-03-24 13:05:24.864187', '2021-03-24 13:05:24.864187', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('17', '2021-03-24 13:05:30.230692', '2021-03-24 13:05:30.230692', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":13,\"parentId\":1,\"name\":\"客户\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('18', '2021-03-24 13:05:30.231424', '2021-03-24 13:05:30.231424', '1', '/admin/base/sys/department/update', '127.0.0.1', '本机地址', '{\"id\":13,\"parentId\":1,\"name\":\"客户\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('19', '2021-03-24 13:05:30.636789', '2021-03-24 13:05:30.636789', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('20', '2021-03-24 13:05:30.637441', '2021-03-24 13:05:30.637441', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('21', '2021-03-24 13:05:48.222335', '2021-03-24 13:05:48.222335', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('22', '2021-03-24 13:05:48.224152', '2021-03-24 13:05:48.224152', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('23', '2021-03-24 13:05:49.404823', '2021-03-24 13:05:49.404823', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('24', '2021-03-24 13:05:49.408905', '2021-03-24 13:05:49.408905', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('25', '2021-03-24 13:05:58.370721', '2021-03-24 13:05:58.370721', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('26', '2021-03-24 13:05:58.371769', '2021-03-24 13:05:58.371769', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('27', '2021-03-24 13:05:58.698658', '2021-03-24 13:05:58.698658', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('28', '2021-03-24 13:05:58.699855', '2021-03-24 13:05:58.699855', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('29', '2021-03-24 13:05:58.705394', '2021-03-24 13:05:58.705394', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('30', '2021-03-24 13:05:58.707599', '2021-03-24 13:05:58.707599', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('31', '2021-03-24 13:06:54.655209', '2021-03-24 13:06:54.655209', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[13],\"relevance\":1,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-02-26 14:16:49\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('32', '2021-03-24 13:06:54.656394', '2021-03-24 13:06:54.656394', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[13],\"relevance\":1,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-02-26 14:16:49\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('33', '2021-03-24 13:06:54.889146', '2021-03-24 13:06:54.889146', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('34', '2021-03-24 13:06:54.891529', '2021-03-24 13:06:54.891529', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('35', '2021-03-24 13:06:57.862869', '2021-03-24 13:06:57.862869', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('36', '2021-03-24 13:06:57.863787', '2021-03-24 13:06:57.863787', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('37', '2021-03-24 13:06:58.172628', '2021-03-24 13:06:58.172628', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('38', '2021-03-24 13:06:58.173766', '2021-03-24 13:06:58.173766', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('39', '2021-03-24 13:06:58.187286', '2021-03-24 13:06:58.187286', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('40', '2021-03-24 13:06:58.188340', '2021-03-24 13:06:58.188340', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('41', '2021-03-24 13:07:03.476392', '2021-03-24 13:07:03.476392', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('42', '2021-03-24 13:07:03.477432', '2021-03-24 13:07:03.477432', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('43', '2021-03-24 13:07:03.479169', '2021-03-24 13:07:03.479169', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('44', '2021-03-24 13:07:03.480078', '2021-03-24 13:07:03.480078', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('45', '2021-03-24 13:07:03.501416', '2021-03-24 13:07:03.501416', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('46', '2021-03-24 13:07:03.502667', '2021-03-24 13:07:03.502667', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('47', '2021-03-24 13:07:26.058235', '2021-03-24 13:07:26.058235', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[12],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 12:56:56\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('48', '2021-03-24 13:07:26.059333', '2021-03-24 13:07:26.059333', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[12],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 12:56:56\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('49', '2021-03-24 13:07:26.493262', '2021-03-24 13:07:26.493262', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('50', '2021-03-24 13:07:26.494274', '2021-03-24 13:07:26.494274', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('51', '2021-03-24 13:07:28.352184', '2021-03-24 13:07:28.352184', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('52', '2021-03-24 13:07:28.353104', '2021-03-24 13:07:28.353104', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('53', '2021-03-24 13:07:28.670973', '2021-03-24 13:07:28.670973', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('54', '2021-03-24 13:07:28.671818', '2021-03-24 13:07:28.671818', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('55', '2021-03-24 13:07:28.676177', '2021-03-24 13:07:28.676177', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('56', '2021-03-24 13:07:28.677546', '2021-03-24 13:07:28.677546', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('57', '2021-03-24 13:07:40.367026', '2021-03-24 13:07:40.367026', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[11],\"relevance\":1,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 12:57:30\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('58', '2021-03-24 13:07:40.368010', '2021-03-24 13:07:40.368010', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[11],\"relevance\":1,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 12:57:30\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('59', '2021-03-24 13:07:40.620162', '2021-03-24 13:07:40.620162', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('60', '2021-03-24 13:07:40.620973', '2021-03-24 13:07:40.620973', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('61', '2021-03-24 13:08:02.221774', '2021-03-24 13:08:02.221774', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('62', '2021-03-24 13:08:02.223632', '2021-03-24 13:08:02.223632', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('63', '2021-03-24 13:08:02.925067', '2021-03-24 13:08:02.925067', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('64', '2021-03-24 13:08:02.925789', '2021-03-24 13:08:02.925789', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('65', '2021-03-24 13:08:13.521320', '2021-03-24 13:08:13.521320', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('66', '2021-03-24 13:08:13.525556', '2021-03-24 13:08:13.525556', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('67', '2021-03-24 13:08:13.527811', '2021-03-24 13:08:13.527811', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"28\"}');
INSERT INTO `base_sys_log` VALUES ('68', '2021-03-24 13:08:13.528626', '2021-03-24 13:08:13.528626', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"28\"}');
INSERT INTO `base_sys_log` VALUES ('69', '2021-03-24 13:08:23.172840', '2021-03-24 13:08:23.172840', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('70', '2021-03-24 13:08:23.174219', '2021-03-24 13:08:23.174219', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('71', '2021-03-24 13:08:58.040465', '2021-03-24 13:08:58.040465', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('72', '2021-03-24 13:09:03.946892', '2021-03-24 13:09:03.946892', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('73', '2021-03-24 13:09:09.118347', '2021-03-24 13:09:09.118347', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaoqin\",\"password\":\"123456\",\"captchaId\":\"0d64e570-8c5f-11eb-a7f5-3b760724aae2\",\"verifyCode\":\"1907\"}');
INSERT INTO `base_sys_log` VALUES ('74', '2021-03-24 13:09:09.165623', '2021-03-24 13:09:09.165623', '27', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('75', '2021-03-24 13:09:09.182922', '2021-03-24 13:09:09.182922', '27', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('76', '2021-03-24 13:09:57.536347', '2021-03-24 13:09:57.536347', '27', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('77', '2021-03-24 13:10:42.936728', '2021-03-24 13:10:42.936728', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('78', '2021-03-24 13:10:47.573788', '2021-03-24 13:10:47.573788', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"4865e070-8c5f-11eb-a7f5-3b760724aae2\",\"verifyCode\":\"2651\"}');
INSERT INTO `base_sys_log` VALUES ('79', '2021-03-24 13:10:47.612144', '2021-03-24 13:10:47.612144', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('80', '2021-03-24 13:10:47.633641', '2021-03-24 13:10:47.633641', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('81', '2021-03-24 13:10:52.074131', '2021-03-24 13:10:52.074131', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('82', '2021-03-24 13:10:52.075428', '2021-03-24 13:10:52.075428', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('83', '2021-03-24 14:41:21.550323', '2021-03-24 14:41:21.550323', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('84', '2021-03-24 14:41:21.615005', '2021-03-24 14:41:21.615005', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('85', '2021-03-24 14:41:23.145260', '2021-03-24 14:41:23.145260', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('86', '2021-03-24 14:41:32.226955', '2021-03-24 14:41:32.226955', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('87', '2021-03-24 14:41:32.229859', '2021-03-24 14:41:32.229859', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('88', '2021-03-24 14:41:32.477503', '2021-03-24 14:41:32.477503', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('89', '2021-03-24 14:42:59.045893', '2021-03-24 14:42:59.045893', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('90', '2021-03-24 14:42:59.047759', '2021-03-24 14:42:59.047759', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('91', '2021-03-24 14:43:13.446542', '2021-03-24 14:43:13.446542', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('92', '2021-03-24 14:43:13.447695', '2021-03-24 14:43:13.447695', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('93', '2021-03-24 14:43:13.742699', '2021-03-24 14:43:13.742699', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('94', '2021-03-24 14:43:13.743899', '2021-03-24 14:43:13.743899', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('95', '2021-03-24 14:43:26.438642', '2021-03-24 14:43:26.438642', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 10:11:31\"}');
INSERT INTO `base_sys_log` VALUES ('96', '2021-03-24 14:43:26.440789', '2021-03-24 14:43:26.440789', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 10:11:31\"}');
INSERT INTO `base_sys_log` VALUES ('97', '2021-03-24 14:43:26.685249', '2021-03-24 14:43:26.685249', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('98', '2021-03-24 14:43:26.687153', '2021-03-24 14:43:26.687153', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('99', '2021-03-24 14:43:43.380173', '2021-03-24 14:43:43.380173', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('100', '2021-03-24 14:43:43.383198', '2021-03-24 14:43:43.383198', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('101', '2021-03-24 14:43:43.702826', '2021-03-24 14:43:43.702826', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('102', '2021-03-24 14:43:43.704100', '2021-03-24 14:43:43.704100', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('103', '2021-03-24 14:43:53.115624', '2021-03-24 14:43:53.115624', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('104', '2021-03-24 14:43:53.116716', '2021-03-24 14:43:53.116716', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('105', '2021-03-24 14:43:53.416234', '2021-03-24 14:43:53.416234', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('106', '2021-03-24 14:43:53.417565', '2021-03-24 14:43:53.417565', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('107', '2021-03-24 14:43:58.128041', '2021-03-24 14:43:58.128041', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":0,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 10:11:31\"}');
INSERT INTO `base_sys_log` VALUES ('108', '2021-03-24 14:43:58.129140', '2021-03-24 14:43:58.129140', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":0,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 10:11:31\"}');
INSERT INTO `base_sys_log` VALUES ('109', '2021-03-24 14:43:58.377008', '2021-03-24 14:43:58.377008', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('110', '2021-03-24 14:43:58.377895', '2021-03-24 14:43:58.377895', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('111', '2021-03-24 14:44:06.596650', '2021-03-24 14:44:06.596650', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('112', '2021-03-24 14:44:06.600475', '2021-03-24 14:44:06.600475', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('113', '2021-03-24 14:44:06.917608', '2021-03-24 14:44:06.917608', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('114', '2021-03-24 14:44:06.919228', '2021-03-24 14:44:06.919228', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('115', '2021-03-24 14:44:07.997449', '2021-03-24 14:44:07.997449', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('116', '2021-03-24 14:44:07.998343', '2021-03-24 14:44:07.998343', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('117', '2021-03-24 14:44:21.684011', '2021-03-24 14:44:21.684011', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":0,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('118', '2021-03-24 14:44:21.685207', '2021-03-24 14:44:21.685207', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":0,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('119', '2021-03-24 14:44:22.011099', '2021-03-24 14:44:22.011099', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":1,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('120', '2021-03-24 14:44:22.012257', '2021-03-24 14:44:22.012257', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":1,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('121', '2021-03-24 14:44:22.017462', '2021-03-24 14:44:22.017462', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":null,\"status\":0,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('122', '2021-03-24 14:44:22.018590', '2021-03-24 14:44:22.018590', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":null,\"status\":0,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('123', '2021-03-24 14:44:22.051282', '2021-03-24 14:44:22.051282', '1', '/admin/task/info/log', '127.0.0.1', '本机地址', '{\"size\":\"10\",\"page\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('124', '2021-03-24 14:44:35.659085', '2021-03-24 14:44:35.659085', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('125', '2021-03-24 14:44:37.297479', '2021-03-24 14:44:37.297479', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('126', '2021-03-24 14:44:46.280384', '2021-03-24 14:44:46.280384', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaolv\",\"password\":\"123456\",\"captchaId\":\"66bd2300-8c6c-11eb-bd08-7b3a32cb5d3f\",\"verifyCode\":\"6610\"}');
INSERT INTO `base_sys_log` VALUES ('127', '2021-03-24 14:44:46.537232', '2021-03-24 14:44:46.537232', '26', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('128', '2021-03-24 14:44:46.644403', '2021-03-24 14:44:46.644403', '26', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('129', '2021-03-24 14:44:47.912426', '2021-03-24 14:44:47.912426', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('130', '2021-03-24 14:44:47.919333', '2021-03-24 14:44:47.919333', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('131', '2021-03-24 14:44:56.078921', '2021-03-24 14:44:56.078921', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('132', '2021-03-24 14:44:56.084274', '2021-03-24 14:44:56.084274', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('133', '2021-03-24 14:44:56.330038', '2021-03-24 14:44:56.330038', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('134', '2021-03-24 14:44:56.336332', '2021-03-24 14:44:56.336332', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('135', '2021-03-24 14:44:56.487074', '2021-03-24 14:44:56.487074', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('136', '2021-03-24 14:44:56.492197', '2021-03-24 14:44:56.492197', '26', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('137', '2021-03-24 14:44:59.845752', '2021-03-24 14:44:59.845752', '26', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('138', '2021-03-24 14:45:06.356311', '2021-03-24 14:45:06.356311', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('139', '2021-03-24 14:45:10.163353', '2021-03-24 14:45:10.163353', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"780f0920-8c6c-11eb-bd08-7b3a32cb5d3f\",\"verifyCode\":\"4421\"}');
INSERT INTO `base_sys_log` VALUES ('140', '2021-03-24 14:45:10.202632', '2021-03-24 14:45:10.202632', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('141', '2021-03-24 14:45:10.222585', '2021-03-24 14:45:10.222585', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('142', '2021-03-24 14:45:15.776886', '2021-03-24 14:45:15.776886', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('143', '2021-03-24 14:45:24.319184', '2021-03-24 14:45:24.319184', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('144', '2021-03-24 14:45:24.320158', '2021-03-24 14:45:24.320158', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('145', '2021-03-24 14:45:25.848043', '2021-03-24 14:45:25.848043', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('146', '2021-03-24 14:45:25.850108', '2021-03-24 14:45:25.850108', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('147', '2021-03-24 14:45:26.171779', '2021-03-24 14:45:26.171779', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('148', '2021-03-24 14:45:26.172742', '2021-03-24 14:45:26.172742', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('149', '2021-03-24 14:45:34.467737', '2021-03-24 14:45:34.467737', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('150', '2021-03-24 14:45:34.469336', '2021-03-24 14:45:34.469336', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('151', '2021-03-24 14:45:39.733076', '2021-03-24 14:45:39.733076', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('152', '2021-03-24 14:45:39.733987', '2021-03-24 14:45:39.733987', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('153', '2021-03-24 14:45:40.045941', '2021-03-24 14:45:40.045941', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('154', '2021-03-24 14:45:40.046842', '2021-03-24 14:45:40.046842', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('155', '2021-03-24 14:45:40.051100', '2021-03-24 14:45:40.051100', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('156', '2021-03-24 14:45:40.052404', '2021-03-24 14:45:40.052404', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('157', '2021-03-24 14:45:50.672087', '2021-03-24 14:45:50.672087', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('158', '2021-03-24 14:45:50.672946', '2021-03-24 14:45:50.672946', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('159', '2021-03-24 14:45:50.674787', '2021-03-24 14:45:50.674787', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('160', '2021-03-24 14:45:50.675864', '2021-03-24 14:45:50.675864', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('161', '2021-03-24 14:45:50.707885', '2021-03-24 14:45:50.707885', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('162', '2021-03-24 14:45:50.709186', '2021-03-24 14:45:50.709186', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('163', '2021-03-24 14:46:03.825968', '2021-03-24 14:46:03.825968', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaoqing\",\"password\":\"123456\",\"captchaId\":\"7dac90f0-8c6c-11eb-bd08-7b3a32cb5d3f\",\"verifyCode\":\"4872\"}');
INSERT INTO `base_sys_log` VALUES ('164', '2021-03-24 14:46:03.869918', '2021-03-24 14:46:03.869918', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('165', '2021-03-24 14:46:14.723102', '2021-03-24 14:46:14.723102', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaoqin\",\"password\":\"123456\",\"captchaId\":\"9a56f9c0-8c6c-11eb-bd08-7b3a32cb5d3f\",\"verifyCode\":\"2227\"}');
INSERT INTO `base_sys_log` VALUES ('166', '2021-03-24 14:46:14.768361', '2021-03-24 14:46:14.768361', '27', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('167', '2021-03-24 14:46:15.085460', '2021-03-24 14:46:15.085460', '27', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('168', '2021-03-24 14:46:16.651313', '2021-03-24 14:46:16.651313', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('169', '2021-03-24 14:46:16.656876', '2021-03-24 14:46:16.656876', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('170', '2021-03-24 14:46:21.791242', '2021-03-24 14:46:21.791242', '27', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('171', '2021-03-24 14:46:21.796944', '2021-03-24 14:46:21.796944', '27', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('172', '2021-03-24 14:46:23.668428', '2021-03-24 14:46:23.668428', '27', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('173', '2021-03-24 14:46:23.674118', '2021-03-24 14:46:23.674118', '27', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('174', '2021-03-24 14:49:53.322743', '2021-03-24 14:49:53.322743', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('175', '2021-03-24 14:49:53.324008', '2021-03-24 14:49:53.324008', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('176', '2021-03-24 14:50:02.998651', '2021-03-24 14:50:02.998651', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('177', '2021-03-24 14:50:02.999590', '2021-03-24 14:50:02.999590', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('178', '2021-03-24 14:50:03.308719', '2021-03-24 14:50:03.308719', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('179', '2021-03-24 14:50:03.309480', '2021-03-24 14:50:03.309480', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('180', '2021-03-24 14:50:20.152233', '2021-03-24 14:50:20.152233', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('181', '2021-03-24 14:50:20.154065', '2021-03-24 14:50:20.154065', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('182', '2021-03-24 14:50:20.167100', '2021-03-24 14:50:20.167100', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('183', '2021-03-24 14:50:20.169684', '2021-03-24 14:50:20.169684', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('184', '2021-03-24 14:50:22.509626', '2021-03-24 14:50:22.509626', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-workbench\",\"orderNum\":1,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2019-11-18 15:56:36\"}');
INSERT INTO `base_sys_log` VALUES ('185', '2021-03-24 14:50:22.510868', '2021-03-24 14:50:22.510868', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-workbench\",\"orderNum\":1,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2019-11-18 15:56:36\"}');
INSERT INTO `base_sys_log` VALUES ('186', '2021-03-24 14:50:22.975752', '2021-03-24 14:50:22.975752', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('187', '2021-03-24 14:50:22.976799', '2021-03-24 14:50:22.976799', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('188', '2021-03-24 14:50:36.052881', '2021-03-24 14:50:36.052881', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('189', '2021-03-24 14:50:36.053965', '2021-03-24 14:50:36.053965', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('190', '2021-03-24 14:50:36.361534', '2021-03-24 14:50:36.361534', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('191', '2021-03-24 14:50:36.362402', '2021-03-24 14:50:36.362402', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('192', '2021-03-24 14:50:39.081541', '2021-03-24 14:50:39.081541', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":true,\"icon\":\"icon-workbench\",\"orderNum\":1,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 14:50:22\"}');
INSERT INTO `base_sys_log` VALUES ('193', '2021-03-24 14:50:39.082912', '2021-03-24 14:50:39.082912', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":true,\"icon\":\"icon-workbench\",\"orderNum\":1,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 14:50:22\"}');
INSERT INTO `base_sys_log` VALUES ('194', '2021-03-24 14:50:39.353040', '2021-03-24 14:50:39.353040', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('195', '2021-03-24 14:50:39.354962', '2021-03-24 14:50:39.354962', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('196', '2021-03-24 14:50:57.698249', '2021-03-24 14:50:57.698249', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":0,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('197', '2021-03-24 14:50:57.699053', '2021-03-24 14:50:57.699053', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":0,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('198', '2021-03-24 14:50:58.028302', '2021-03-24 14:50:58.028302', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":1,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('199', '2021-03-24 14:50:58.029898', '2021-03-24 14:50:58.029898', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":1,\"status\":1,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('200', '2021-03-24 14:50:58.034120', '2021-03-24 14:50:58.034120', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":null,\"status\":0,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('201', '2021-03-24 14:50:58.035593', '2021-03-24 14:50:58.035593', '1', '/admin/task/info/page', '127.0.0.1', '本机地址', '{\"type\":null,\"status\":0,\"size\":10,\"page\":1,\"total\":0}');
INSERT INTO `base_sys_log` VALUES ('202', '2021-03-24 14:50:58.167739', '2021-03-24 14:50:58.167739', '1', '/admin/task/info/log', '127.0.0.1', '本机地址', '{\"size\":\"10\",\"page\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('203', '2021-03-24 14:51:07.683659', '2021-03-24 14:51:07.683659', '1', '/admin/base/plugin/info/list', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('204', '2021-03-24 14:51:17.770120', '2021-03-24 14:51:17.770120', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('205', '2021-03-24 14:51:17.770896', '2021-03-24 14:51:17.770896', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('206', '2021-03-24 14:51:39.479572', '2021-03-24 14:51:39.479572', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('207', '2021-03-24 14:51:39.480324', '2021-03-24 14:51:39.480324', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('208', '2021-03-24 14:51:39.497279', '2021-03-24 14:51:39.497279', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"47\"}');
INSERT INTO `base_sys_log` VALUES ('209', '2021-03-24 14:51:39.498562', '2021-03-24 14:51:39.498562', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"47\"}');
INSERT INTO `base_sys_log` VALUES ('210', '2021-03-24 14:51:41.293401', '2021-03-24 14:51:41.293401', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"框架教程\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-task\",\"orderNum\":4,\"id\":47,\"createTime\":\"2019-11-08 09:35:08\",\"updateTime\":\"2021-02-27 17:16:35\"}');
INSERT INTO `base_sys_log` VALUES ('211', '2021-03-24 14:51:41.294622', '2021-03-24 14:51:41.294622', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"框架教程\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-task\",\"orderNum\":4,\"id\":47,\"createTime\":\"2019-11-08 09:35:08\",\"updateTime\":\"2021-02-27 17:16:35\"}');
INSERT INTO `base_sys_log` VALUES ('212', '2021-03-24 14:51:41.763809', '2021-03-24 14:51:41.763809', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('213', '2021-03-24 14:51:41.765305', '2021-03-24 14:51:41.765305', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('214', '2021-03-24 14:52:11.172839', '2021-03-24 14:52:11.172839', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('215', '2021-03-24 14:52:11.173793', '2021-03-24 14:52:11.173793', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('216', '2021-03-24 14:53:44.819949', '2021-03-24 14:53:44.819949', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('217', '2021-03-24 14:53:44.822478', '2021-03-24 14:53:44.822478', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('218', '2021-03-24 14:53:54.133931', '2021-03-24 14:53:54.133931', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,12,13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('219', '2021-03-24 14:53:54.134803', '2021-03-24 14:53:54.134803', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,12,13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('220', '2021-03-24 14:53:55.647925', '2021-03-24 14:53:55.647925', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('221', '2021-03-24 14:53:55.648809', '2021-03-24 14:53:55.648809', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('222', '2021-03-24 14:54:07.454167', '2021-03-24 14:54:07.454167', '1', '/admin/base/sys/department/add', '127.0.0.1', '本机地址', '{\"parentId\":11,\"name\":\"工程商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('223', '2021-03-24 14:54:07.454971', '2021-03-24 14:54:07.454971', '1', '/admin/base/sys/department/add', '127.0.0.1', '本机地址', '{\"parentId\":11,\"name\":\"工程商\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('224', '2021-03-24 14:54:07.859921', '2021-03-24 14:54:07.859921', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('225', '2021-03-24 14:54:07.861135', '2021-03-24 14:54:07.861135', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('226', '2021-03-24 14:54:15.701937', '2021-03-24 14:54:15.701937', '1', '/admin/base/sys/department/add', '127.0.0.1', '本机地址', '{\"parentId\":14,\"name\":\"客户\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('227', '2021-03-24 14:54:15.702821', '2021-03-24 14:54:15.702821', '1', '/admin/base/sys/department/add', '127.0.0.1', '本机地址', '{\"parentId\":14,\"name\":\"客户\",\"orderNum\":0}');
INSERT INTO `base_sys_log` VALUES ('228', '2021-03-24 14:54:16.094960', '2021-03-24 14:54:16.094960', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('229', '2021-03-24 14:54:16.095799', '2021-03-24 14:54:16.095799', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('230', '2021-03-24 14:54:20.049688', '2021-03-24 14:54:20.049688', '1', '/admin/base/sys/department/delete', '127.0.0.1', '本机地址', '{\"ids\":[12],\"deleteUser\":true}');
INSERT INTO `base_sys_log` VALUES ('231', '2021-03-24 14:54:20.050720', '2021-03-24 14:54:20.050720', '1', '/admin/base/sys/department/delete', '127.0.0.1', '本机地址', '{\"ids\":[12],\"deleteUser\":true}');
INSERT INTO `base_sys_log` VALUES ('232', '2021-03-24 14:54:20.478432', '2021-03-24 14:54:20.478432', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('233', '2021-03-24 14:54:20.480587', '2021-03-24 14:54:20.480587', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('234', '2021-03-24 14:54:21.158590', '2021-03-24 14:54:21.158590', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('235', '2021-03-24 14:54:21.159645', '2021-03-24 14:54:21.159645', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[13],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('236', '2021-03-24 14:54:23.208196', '2021-03-24 14:54:23.208196', '1', '/admin/base/sys/department/delete', '127.0.0.1', '本机地址', '{\"ids\":[13],\"deleteUser\":true}');
INSERT INTO `base_sys_log` VALUES ('237', '2021-03-24 14:54:23.209039', '2021-03-24 14:54:23.209039', '1', '/admin/base/sys/department/delete', '127.0.0.1', '本机地址', '{\"ids\":[13],\"deleteUser\":true}');
INSERT INTO `base_sys_log` VALUES ('238', '2021-03-24 14:54:23.460399', '2021-03-24 14:54:23.460399', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('239', '2021-03-24 14:54:23.461419', '2021-03-24 14:54:23.461419', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('240', '2021-03-24 14:54:23.934309', '2021-03-24 14:54:23.934309', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('241', '2021-03-24 14:54:23.935241', '2021-03-24 14:54:23.935241', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('242', '2021-03-24 14:54:30.376882', '2021-03-24 14:54:30.376882', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('243', '2021-03-24 14:54:30.377808', '2021-03-24 14:54:30.377808', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('244', '2021-03-24 14:54:31.933221', '2021-03-24 14:54:31.933221', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('245', '2021-03-24 14:54:31.934497', '2021-03-24 14:54:31.934497', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('246', '2021-03-24 14:54:33.354125', '2021-03-24 14:54:33.354125', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('247', '2021-03-24 14:54:33.355145', '2021-03-24 14:54:33.355145', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('248', '2021-03-24 14:54:34.079721', '2021-03-24 14:54:34.079721', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('249', '2021-03-24 14:54:34.080654', '2021-03-24 14:54:34.080654', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('250', '2021-03-24 14:54:44.142360', '2021-03-24 14:54:44.142360', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('251', '2021-03-24 14:54:44.143245', '2021-03-24 14:54:44.143245', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('252', '2021-03-24 14:54:44.460125', '2021-03-24 14:54:44.460125', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('253', '2021-03-24 14:54:44.461183', '2021-03-24 14:54:44.461183', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('254', '2021-03-24 14:55:04.087761', '2021-03-24 14:55:04.087761', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"小绿\",\"nickName\":\"小绿\",\"username\":\"xiaolv\",\"roleIdList\":[12],\"status\":1,\"departmentId\":14}');
INSERT INTO `base_sys_log` VALUES ('255', '2021-03-24 14:55:04.088558', '2021-03-24 14:55:04.088558', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"小绿\",\"nickName\":\"小绿\",\"username\":\"xiaolv\",\"roleIdList\":[12],\"status\":1,\"departmentId\":14}');
INSERT INTO `base_sys_log` VALUES ('256', '2021-03-24 14:55:04.352691', '2021-03-24 14:55:04.352691', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('257', '2021-03-24 14:55:04.353577', '2021-03-24 14:55:04.353577', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('258', '2021-03-24 14:55:05.650702', '2021-03-24 14:55:05.650702', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('259', '2021-03-24 14:55:05.651482', '2021-03-24 14:55:05.651482', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('260', '2021-03-24 14:55:10.364108', '2021-03-24 14:55:10.364108', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('261', '2021-03-24 14:55:10.365484', '2021-03-24 14:55:10.365484', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('262', '2021-03-24 14:55:36.864660', '2021-03-24 14:55:36.864660', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"departmentId\":15,\"name\":\"小蓝\",\"nickName\":\"小蓝\",\"username\":\"xiaolan\",\"roleIdList\":[11],\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('263', '2021-03-24 14:55:36.865686', '2021-03-24 14:55:36.865686', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"departmentId\":15,\"name\":\"小蓝\",\"nickName\":\"小蓝\",\"username\":\"xiaolan\",\"roleIdList\":[11],\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('264', '2021-03-24 14:55:37.316112', '2021-03-24 14:55:37.316112', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('265', '2021-03-24 14:55:37.317583', '2021-03-24 14:55:37.317583', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('266', '2021-03-24 14:55:38.392510', '2021-03-24 14:55:38.392510', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('267', '2021-03-24 14:55:38.393468', '2021-03-24 14:55:38.393468', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('268', '2021-03-24 14:55:39.094530', '2021-03-24 14:55:39.094530', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('269', '2021-03-24 14:55:39.095404', '2021-03-24 14:55:39.095404', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('270', '2021-03-24 14:55:39.546882', '2021-03-24 14:55:39.546882', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('271', '2021-03-24 14:55:39.547759', '2021-03-24 14:55:39.547759', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('272', '2021-03-24 14:55:40.543949', '2021-03-24 14:55:40.543949', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('273', '2021-03-24 14:55:40.545326', '2021-03-24 14:55:40.545326', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('274', '2021-03-24 14:55:45.026360', '2021-03-24 14:55:45.026360', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('275', '2021-03-24 14:55:48.304741', '2021-03-24 14:55:48.304741', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('276', '2021-03-24 14:55:53.546243', '2021-03-24 14:55:53.546243', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"f6b086e0-8c6d-11eb-bd08-7b3a32cb5d3f\",\"verifyCode\":\"1060\"}');
INSERT INTO `base_sys_log` VALUES ('277', '2021-03-24 14:55:53.575714', '2021-03-24 14:55:53.575714', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('278', '2021-03-24 14:55:53.593157', '2021-03-24 14:55:53.593157', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('279', '2021-03-24 14:55:55.895300', '2021-03-24 14:55:55.895300', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('280', '2021-03-24 14:55:55.896036', '2021-03-24 14:55:55.896036', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('281', '2021-03-24 14:56:14.816017', '2021-03-24 14:56:14.816017', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('282', '2021-03-24 14:56:14.818640', '2021-03-24 14:56:14.818640', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('283', '2021-03-24 14:56:15.327886', '2021-03-24 14:56:15.327886', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('284', '2021-03-24 14:56:15.328730', '2021-03-24 14:56:15.328730', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('285', '2021-03-24 14:56:17.806672', '2021-03-24 14:56:17.806672', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('286', '2021-03-24 14:56:17.807584', '2021-03-24 14:56:17.807584', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('287', '2021-03-24 14:56:48.420110', '2021-03-24 14:56:48.420110', '1', '/admin/space/type/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('288', '2021-03-24 14:56:48.421637', '2021-03-24 14:56:48.421637', '1', '/admin/space/type/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('289', '2021-03-24 14:56:48.777925', '2021-03-24 14:56:48.777925', '1', '/admin/space/info/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":12,\"total\":0,\"classifyId\":null}');
INSERT INTO `base_sys_log` VALUES ('290', '2021-03-24 14:56:48.778981', '2021-03-24 14:56:48.778981', '1', '/admin/space/info/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":12,\"total\":0,\"classifyId\":null}');
INSERT INTO `base_sys_log` VALUES ('291', '2021-03-24 14:56:49.049597', '2021-03-24 14:56:49.049597', '1', '/admin/space/type/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('292', '2021-03-24 14:56:49.052770', '2021-03-24 14:56:49.052770', '1', '/admin/space/type/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('293', '2021-03-24 14:56:49.110058', '2021-03-24 14:56:49.110058', '1', '/admin/space/info/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":12,\"total\":0,\"classifyId\":null}');
INSERT INTO `base_sys_log` VALUES ('294', '2021-03-24 14:56:49.110927', '2021-03-24 14:56:49.110927', '1', '/admin/space/info/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":12,\"total\":0,\"classifyId\":null}');
INSERT INTO `base_sys_log` VALUES ('295', '2021-03-24 14:56:50.397389', '2021-03-24 14:56:50.397389', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('296', '2021-03-24 14:56:50.398088', '2021-03-24 14:56:50.398088', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('297', '2021-03-24 14:56:50.403429', '2021-03-24 14:56:50.403429', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('298', '2021-03-24 14:56:50.404610', '2021-03-24 14:56:50.404610', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('299', '2021-03-24 14:56:50.640828', '2021-03-24 14:56:50.640828', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('300', '2021-03-24 14:56:50.641628', '2021-03-24 14:56:50.641628', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('301', '2021-03-24 14:56:51.297517', '2021-03-24 14:56:51.297517', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('302', '2021-03-24 14:56:51.298456', '2021-03-24 14:56:51.298456', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('303', '2021-03-24 14:58:26.614210', '2021-03-24 14:58:26.614210', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('304', '2021-03-24 14:58:26.615772', '2021-03-24 14:58:26.615772', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('305', '2021-03-24 14:58:26.629799', '2021-03-24 14:58:26.629799', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('306', '2021-03-24 14:58:26.631419', '2021-03-24 14:58:26.631419', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('307', '2021-03-24 14:58:26.677333', '2021-03-24 14:58:26.677333', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('308', '2021-03-24 14:58:26.678960', '2021-03-24 14:58:26.678960', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('309', '2021-03-24 14:58:46.962397', '2021-03-24 14:58:46.962397', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('310', '2021-03-24 14:58:46.963607', '2021-03-24 14:58:46.963607', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('311', '2021-03-24 14:58:50.017831', '2021-03-24 14:58:50.017831', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('312', '2021-03-24 14:58:50.019203', '2021-03-24 14:58:50.019203', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('313', '2021-03-24 15:00:24.016133', '2021-03-24 15:00:24.016133', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('314', '2021-03-24 15:00:24.017335', '2021-03-24 15:00:24.017335', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('315', '2021-03-24 15:00:24.802430', '2021-03-24 15:00:24.802430', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('316', '2021-03-24 15:00:24.804013', '2021-03-24 15:00:24.804013', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('317', '2021-03-24 15:00:30.644342', '2021-03-24 15:00:30.644342', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('318', '2021-03-24 15:00:30.645839', '2021-03-24 15:00:30.645839', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"keyWord\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('319', '2021-03-24 15:08:31.597869', '2021-03-24 15:08:31.597869', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('320', '2021-03-24 15:08:31.599654', '2021-03-24 15:08:31.599654', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('321', '2021-03-24 15:08:31.723346', '2021-03-24 15:08:31.723346', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('322', '2021-03-24 15:08:31.738704', '2021-03-24 15:08:31.738704', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('323', '2021-03-24 15:09:13.858883', '2021-03-24 15:09:13.858883', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('324', '2021-03-24 15:09:13.860083', '2021-03-24 15:09:13.860083', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('325', '2021-03-24 15:09:33.690597', '2021-03-24 15:09:33.690597', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('326', '2021-03-24 15:09:33.691902', '2021-03-24 15:09:33.691902', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('327', '2021-03-24 15:10:01.554224', '2021-03-24 15:10:01.554224', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('328', '2021-03-24 15:10:01.555674', '2021-03-24 15:10:01.555674', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('329', '2021-03-24 15:10:02.522987', '2021-03-24 15:10:02.522987', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('330', '2021-03-24 15:10:02.523918', '2021-03-24 15:10:02.523918', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('331', '2021-03-24 15:10:13.412626', '2021-03-24 15:10:13.412626', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('332', '2021-03-24 15:10:13.413973', '2021-03-24 15:10:13.413973', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('333', '2021-03-24 15:13:17.468124', '2021-03-24 15:13:17.468124', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('334', '2021-03-24 15:13:17.483042', '2021-03-24 15:13:17.483042', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('335', '2021-03-24 15:14:56.968043', '2021-03-24 15:14:56.968043', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('336', '2021-03-24 15:14:56.970318', '2021-03-24 15:14:56.970318', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('337', '2021-03-24 15:17:05.283372', '2021-03-24 15:17:05.283372', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('338', '2021-03-24 15:17:05.284906', '2021-03-24 15:17:05.284906', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('339', '2021-03-24 15:19:13.207165', '2021-03-24 15:19:13.207165', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('340', '2021-03-24 15:19:13.210367', '2021-03-24 15:19:13.210367', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('341', '2021-03-24 15:19:52.650139', '2021-03-24 15:19:52.650139', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('342', '2021-03-24 15:19:52.651030', '2021-03-24 15:19:52.651030', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('343', '2021-03-24 15:44:40.977993', '2021-03-24 15:44:40.977993', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('344', '2021-03-24 15:44:40.979355', '2021-03-24 15:44:40.979355', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('345', '2021-03-24 15:48:11.034728', '2021-03-24 15:48:11.034728', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('346', '2021-03-24 15:48:11.047483', '2021-03-24 15:48:11.047483', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('347', '2021-03-24 15:48:45.097450', '2021-03-24 15:48:45.097450', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('348', '2021-03-24 15:48:45.098978', '2021-03-24 15:48:45.098978', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('349', '2021-03-24 15:49:07.582442', '2021-03-24 15:49:07.582442', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('350', '2021-03-24 15:49:07.583671', '2021-03-24 15:49:07.583671', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('351', '2021-03-24 15:49:34.619976', '2021-03-24 15:49:34.619976', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('352', '2021-03-24 15:49:34.621977', '2021-03-24 15:49:34.621977', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('353', '2021-03-24 15:50:00.910926', '2021-03-24 15:50:00.910926', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('354', '2021-03-24 15:50:00.912651', '2021-03-24 15:50:00.912651', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('355', '2021-03-24 15:50:14.248633', '2021-03-24 15:50:14.248633', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('356', '2021-03-24 15:50:14.249751', '2021-03-24 15:50:14.249751', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('357', '2021-03-24 15:50:16.097553', '2021-03-24 15:50:16.097553', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('358', '2021-03-24 15:50:16.098368', '2021-03-24 15:50:16.098368', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('359', '2021-03-24 15:50:16.758627', '2021-03-24 15:50:16.758627', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('360', '2021-03-24 15:50:16.759880', '2021-03-24 15:50:16.759880', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('361', '2021-03-24 16:36:34.428799', '2021-03-24 16:36:34.428799', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('362', '2021-03-24 16:36:34.432267', '2021-03-24 16:36:34.432267', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('363', '2021-03-24 16:37:05.835886', '2021-03-24 16:37:05.835886', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('364', '2021-03-24 16:37:05.837294', '2021-03-24 16:37:05.837294', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('365', '2021-03-24 16:38:10.692791', '2021-03-24 16:38:10.692791', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('366', '2021-03-24 16:38:10.695221', '2021-03-24 16:38:10.695221', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('367', '2021-03-24 16:41:32.801197', '2021-03-24 16:41:32.801197', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('368', '2021-03-24 16:41:32.804410', '2021-03-24 16:41:32.804410', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('369', '2021-03-24 16:48:27.431545', '2021-03-24 16:48:27.431545', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('370', '2021-03-24 16:48:27.433296', '2021-03-24 16:48:27.433296', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('371', '2021-03-24 16:48:27.440999', '2021-03-24 16:48:27.440999', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMTEiXSwidXNlcm5hbWUiOiJ4aWFvcWluIiwidXNlcklkIjoyNywicGFzc3dvcmRWZXJzaW9uIjoxLCJpYXQiOjE2MTY1NjgzNzQsImV4cCI6MTYxNzg2NDM3NH0.JXLZRRCrFonYA4UZwdqUOr2iK_0UyR_X1rCdUZhPO38\"}');
INSERT INTO `base_sys_log` VALUES ('372', '2021-03-24 16:48:27.581288', '2021-03-24 16:48:27.581288', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('373', '2021-03-24 16:48:27.587627', '2021-03-24 16:48:27.587627', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('374', '2021-03-24 16:48:42.259794', '2021-03-24 16:48:42.259794', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('375', '2021-03-24 16:48:42.261894', '2021-03-24 16:48:42.261894', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('376', '2021-03-24 16:48:42.297956', '2021-03-24 16:48:42.297956', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('377', '2021-03-24 16:48:42.303792', '2021-03-24 16:48:42.303792', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('378', '2021-03-24 16:49:29.726497', '2021-03-24 16:49:29.726497', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('379', '2021-03-24 16:49:29.728438', '2021-03-24 16:49:29.728438', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('380', '2021-03-24 16:49:29.759708', '2021-03-24 16:49:29.759708', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('381', '2021-03-24 16:49:29.767265', '2021-03-24 16:49:29.767265', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('382', '2021-03-24 16:49:32.462277', '2021-03-24 16:49:32.462277', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('383', '2021-03-24 16:49:32.463379', '2021-03-24 16:49:32.463379', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('384', '2021-03-24 16:49:32.505347', '2021-03-24 16:49:32.505347', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('385', '2021-03-24 16:49:32.512457', '2021-03-24 16:49:32.512457', '27', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('386', '2021-03-24 16:49:39.610592', '2021-03-24 16:49:39.610592', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('387', '2021-03-24 16:49:39.611720', '2021-03-24 16:49:39.611720', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('388', '2021-03-24 16:49:43.191271', '2021-03-24 16:49:43.191271', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('389', '2021-03-24 16:49:43.192577', '2021-03-24 16:49:43.192577', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('390', '2021-03-24 16:49:54.235484', '2021-03-24 16:49:54.235484', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('391', '2021-03-24 16:49:54.236455', '2021-03-24 16:49:54.236455', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('392', '2021-03-24 16:50:00.332186', '2021-03-24 16:50:00.332186', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('393', '2021-03-24 16:50:00.333058', '2021-03-24 16:50:00.333058', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('394', '2021-03-24 16:54:06.786551', '2021-03-24 16:54:06.786551', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('395', '2021-03-24 16:54:06.787740', '2021-03-24 16:54:06.787740', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('396', '2021-03-24 16:54:26.811857', '2021-03-24 16:54:26.811857', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('397', '2021-03-24 16:54:26.812781', '2021-03-24 16:54:26.812781', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('398', '2021-03-24 16:54:27.820689', '2021-03-24 16:54:27.820689', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('399', '2021-03-24 16:54:27.821957', '2021-03-24 16:54:27.821957', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('400', '2021-03-24 16:54:28.133699', '2021-03-24 16:54:28.133699', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('401', '2021-03-24 16:54:28.135255', '2021-03-24 16:54:28.135255', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('402', '2021-03-24 16:54:29.051309', '2021-03-24 16:54:29.051309', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('403', '2021-03-24 16:54:29.053357', '2021-03-24 16:54:29.053357', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('404', '2021-03-24 16:54:29.319850', '2021-03-24 16:54:29.319850', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('405', '2021-03-24 16:54:29.320768', '2021-03-24 16:54:29.320768', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('406', '2021-03-24 16:54:29.547278', '2021-03-24 16:54:29.547278', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('407', '2021-03-24 16:54:29.548813', '2021-03-24 16:54:29.548813', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('408', '2021-03-24 16:54:30.245804', '2021-03-24 16:54:30.245804', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('409', '2021-03-24 16:54:30.247260', '2021-03-24 16:54:30.247260', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('410', '2021-03-24 16:54:30.482811', '2021-03-24 16:54:30.482811', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('411', '2021-03-24 16:54:30.484904', '2021-03-24 16:54:30.484904', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('412', '2021-03-24 16:54:30.830684', '2021-03-24 16:54:30.830684', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('413', '2021-03-24 16:54:30.831698', '2021-03-24 16:54:30.831698', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('414', '2021-03-24 16:54:31.665971', '2021-03-24 16:54:31.665971', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('415', '2021-03-24 16:54:31.666842', '2021-03-24 16:54:31.666842', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('416', '2021-03-24 16:54:31.951724', '2021-03-24 16:54:31.951724', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('417', '2021-03-24 16:54:31.953152', '2021-03-24 16:54:31.953152', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('418', '2021-03-24 16:54:33.186109', '2021-03-24 16:54:33.186109', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('419', '2021-03-24 16:54:33.187001', '2021-03-24 16:54:33.187001', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('420', '2021-03-24 16:54:33.917832', '2021-03-24 16:54:33.917832', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('421', '2021-03-24 16:54:33.918665', '2021-03-24 16:54:33.918665', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('422', '2021-03-24 16:54:34.239433', '2021-03-24 16:54:34.239433', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('423', '2021-03-24 16:54:34.240465', '2021-03-24 16:54:34.240465', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('424', '2021-03-24 16:54:35.282650', '2021-03-24 16:54:35.282650', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('425', '2021-03-24 16:54:35.283519', '2021-03-24 16:54:35.283519', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('426', '2021-03-24 16:54:35.860843', '2021-03-24 16:54:35.860843', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('427', '2021-03-24 16:54:35.861823', '2021-03-24 16:54:35.861823', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('428', '2021-03-24 16:54:36.883414', '2021-03-24 16:54:36.883414', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('429', '2021-03-24 16:54:36.884469', '2021-03-24 16:54:36.884469', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('430', '2021-03-24 16:54:37.153198', '2021-03-24 16:54:37.153198', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('431', '2021-03-24 16:54:37.154575', '2021-03-24 16:54:37.154575', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('432', '2021-03-24 16:54:37.511017', '2021-03-24 16:54:37.511017', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('433', '2021-03-24 16:54:37.512047', '2021-03-24 16:54:37.512047', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('434', '2021-03-24 16:54:38.124537', '2021-03-24 16:54:38.124537', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('435', '2021-03-24 16:54:38.125603', '2021-03-24 16:54:38.125603', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('436', '2021-03-24 16:54:38.391616', '2021-03-24 16:54:38.391616', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('437', '2021-03-24 16:54:38.392519', '2021-03-24 16:54:38.392519', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('438', '2021-03-24 16:54:38.511283', '2021-03-24 16:54:38.511283', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('439', '2021-03-24 16:54:38.513725', '2021-03-24 16:54:38.513725', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('440', '2021-03-24 16:54:39.306023', '2021-03-24 16:54:39.306023', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('441', '2021-03-24 16:54:39.307713', '2021-03-24 16:54:39.307713', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('442', '2021-03-24 16:54:39.650270', '2021-03-24 16:54:39.650270', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('443', '2021-03-24 16:54:39.651684', '2021-03-24 16:54:39.651684', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('444', '2021-03-24 16:54:40.392783', '2021-03-24 16:54:40.392783', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('445', '2021-03-24 16:54:40.393549', '2021-03-24 16:54:40.393549', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('446', '2021-03-24 16:54:47.209766', '2021-03-24 16:54:47.209766', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('447', '2021-03-24 16:54:47.211755', '2021-03-24 16:54:47.211755', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('448', '2021-03-24 16:54:48.046477', '2021-03-24 16:54:48.046477', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('449', '2021-03-24 16:54:48.047453', '2021-03-24 16:54:48.047453', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('450', '2021-03-24 16:54:49.604826', '2021-03-24 16:54:49.604826', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('451', '2021-03-24 16:54:49.605607', '2021-03-24 16:54:49.605607', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('452', '2021-03-24 16:54:51.852620', '2021-03-24 16:54:51.852620', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('453', '2021-03-24 16:54:51.853431', '2021-03-24 16:54:51.853431', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('454', '2021-03-24 16:55:07.052138', '2021-03-24 16:55:07.052138', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('455', '2021-03-24 16:55:07.053033', '2021-03-24 16:55:07.053033', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('456', '2021-03-24 16:55:09.465255', '2021-03-24 16:55:09.465255', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('457', '2021-03-24 16:55:09.466405', '2021-03-24 16:55:09.466405', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('458', '2021-03-24 16:55:11.031983', '2021-03-24 16:55:11.031983', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('459', '2021-03-24 16:55:11.033006', '2021-03-24 16:55:11.033006', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('460', '2021-03-24 16:59:10.802214', '2021-03-24 16:59:10.802214', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYxNjU2ODk1MywiZXhwIjoxNjE3ODY0OTUzfQ.vdpfFXx2-jyW6Pk2-XNiJ5N02ILaG8B4FtT5Bg3Lt2E\"}');
INSERT INTO `base_sys_log` VALUES ('461', '2021-03-24 16:59:11.066515', '2021-03-24 16:59:11.066515', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('462', '2021-03-24 16:59:11.070998', '2021-03-24 16:59:11.070998', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('463', '2021-03-24 16:59:11.126106', '2021-03-24 16:59:11.126106', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('464', '2021-03-24 16:59:11.127134', '2021-03-24 16:59:11.127134', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('465', '2021-03-24 16:59:11.468165', '2021-03-24 16:59:11.468165', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('466', '2021-03-24 16:59:11.469067', '2021-03-24 16:59:11.469067', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('467', '2021-03-24 16:59:12.116656', '2021-03-24 16:59:12.116656', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('468', '2021-03-24 16:59:12.117579', '2021-03-24 16:59:12.117579', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('469', '2021-03-24 16:59:12.386219', '2021-03-24 16:59:12.386219', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('470', '2021-03-24 16:59:12.387188', '2021-03-24 16:59:12.387188', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('471', '2021-03-24 16:59:12.657099', '2021-03-24 16:59:12.657099', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('472', '2021-03-24 16:59:12.658042', '2021-03-24 16:59:12.658042', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('473', '2021-03-24 16:59:40.303820', '2021-03-24 16:59:40.303820', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('474', '2021-03-24 16:59:40.305011', '2021-03-24 16:59:40.305011', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('475', '2021-03-24 16:59:40.311074', '2021-03-24 16:59:40.311074', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('476', '2021-03-24 16:59:40.322516', '2021-03-24 16:59:40.322516', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('477', '2021-03-24 16:59:40.323608', '2021-03-24 16:59:40.323608', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('478', '2021-03-24 16:59:40.324629', '2021-03-24 16:59:40.324629', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('479', '2021-03-24 17:01:11.879675', '2021-03-24 17:01:11.879675', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[120,98,99,100,101,2,27,97],\"departmentIdList\":[],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 13:07:26\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('480', '2021-03-24 17:01:11.880988', '2021-03-24 17:01:11.880988', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[120,98,99,100,101,2,27,97],\"departmentIdList\":[],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 13:07:26\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('481', '2021-03-24 17:01:12.142231', '2021-03-24 17:01:12.142231', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('482', '2021-03-24 17:01:12.143117', '2021-03-24 17:01:12.143117', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('483', '2021-03-24 17:01:16.551334', '2021-03-24 17:01:16.551334', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('484', '2021-03-24 17:01:16.552395', '2021-03-24 17:01:16.552395', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('485', '2021-03-24 17:01:30.781093', '2021-03-24 17:01:30.781093', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('486', '2021-03-24 17:01:30.782070', '2021-03-24 17:01:30.782070', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('487', '2021-03-24 17:01:30.784242', '2021-03-24 17:01:30.784242', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"30\"}');
INSERT INTO `base_sys_log` VALUES ('488', '2021-03-24 17:01:30.785148', '2021-03-24 17:01:30.785148', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"30\"}');
INSERT INTO `base_sys_log` VALUES ('489', '2021-03-24 17:02:09.548582', '2021-03-24 17:02:09.548582', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('490', '2021-03-24 17:02:13.085046', '2021-03-24 17:02:13.085046', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('491', '2021-03-24 17:02:19.709170', '2021-03-24 17:02:19.709170', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaolv\",\"password\":\"123456\",\"captchaId\":\"9f921ba0-8c7f-11eb-aa21-532bfdae3858\",\"verifyCode\":\"5802\"}');
INSERT INTO `base_sys_log` VALUES ('492', '2021-03-24 17:02:20.013707', '2021-03-24 17:02:20.013707', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('493', '2021-03-24 17:02:20.058441', '2021-03-24 17:02:20.058441', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('494', '2021-03-24 17:02:23.467995', '2021-03-24 17:02:23.467995', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('495', '2021-03-24 17:02:23.475605', '2021-03-24 17:02:23.475605', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('496', '2021-03-24 17:02:28.305702', '2021-03-24 17:02:28.305702', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('497', '2021-03-24 17:02:28.310471', '2021-03-24 17:02:28.310471', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('498', '2021-03-24 17:02:29.692252', '2021-03-24 17:02:29.692252', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('499', '2021-03-24 17:02:29.697904', '2021-03-24 17:02:29.697904', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('500', '2021-03-24 17:02:31.256935', '2021-03-24 17:02:31.256935', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('501', '2021-03-24 17:02:31.261781', '2021-03-24 17:02:31.261781', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('502', '2021-03-24 17:02:34.433424', '2021-03-24 17:02:34.433424', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('503', '2021-03-24 17:02:34.438792', '2021-03-24 17:02:34.438792', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('504', '2021-03-24 17:02:38.806254', '2021-03-24 17:02:38.806254', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('505', '2021-03-24 17:02:38.811437', '2021-03-24 17:02:38.811437', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('506', '2021-03-24 17:04:00.759551', '2021-03-24 17:04:00.759551', '29', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('507', '2021-03-24 17:04:00.768430', '2021-03-24 17:04:00.768430', '29', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('508', '2021-03-24 17:04:45.047600', '2021-03-24 17:04:45.047600', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('509', '2021-03-24 17:04:45.054293', '2021-03-24 17:04:45.054293', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('510', '2021-03-24 17:04:46.851601', '2021-03-24 17:04:46.851601', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('511', '2021-03-24 17:04:46.856806', '2021-03-24 17:04:46.856806', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('512', '2021-03-24 17:06:46.398930', '2021-03-24 17:06:46.398930', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('513', '2021-03-24 17:06:46.404669', '2021-03-24 17:06:46.404669', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('514', '2021-03-24 17:06:48.210112', '2021-03-24 17:06:48.210112', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('515', '2021-03-24 17:06:48.217047', '2021-03-24 17:06:48.217047', '29', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('516', '2021-03-24 17:22:25.449132', '2021-03-24 17:22:25.449132', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('517', '2021-03-24 17:22:25.451897', '2021-03-24 17:22:25.451897', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('518', '2021-03-24 17:22:27.804747', '2021-03-24 17:22:27.804747', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('519', '2021-03-24 17:22:27.806959', '2021-03-24 17:22:27.806959', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('520', '2021-03-24 17:22:30.327700', '2021-03-24 17:22:30.327700', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('521', '2021-03-24 17:22:30.332081', '2021-03-24 17:22:30.332081', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('522', '2021-03-24 17:22:32.343428', '2021-03-24 17:22:32.343428', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('523', '2021-03-24 17:22:32.347990', '2021-03-24 17:22:32.347990', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('524', '2021-03-24 17:22:39.333707', '2021-03-24 17:22:39.333707', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('525', '2021-03-24 17:22:39.339145', '2021-03-24 17:22:39.339145', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('526', '2021-03-24 17:22:44.702205', '2021-03-24 17:22:44.702205', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('527', '2021-03-24 17:22:44.715497', '2021-03-24 17:22:44.715497', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('528', '2021-03-24 17:22:47.658190', '2021-03-24 17:22:47.658190', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('529', '2021-03-24 17:22:47.662995', '2021-03-24 17:22:47.662995', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('530', '2021-03-24 17:22:49.596568', '2021-03-24 17:22:49.596568', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('531', '2021-03-24 17:22:49.600157', '2021-03-24 17:22:49.600157', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('532', '2021-03-24 17:22:55.095672', '2021-03-24 17:22:55.095672', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('533', '2021-03-24 17:22:55.107868', '2021-03-24 17:22:55.107868', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('534', '2021-03-24 17:22:55.372178', '2021-03-24 17:22:55.372178', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('535', '2021-03-24 17:22:55.379443', '2021-03-24 17:22:55.379443', '29', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('536', '2021-03-24 17:22:57.311714', '2021-03-24 17:22:57.311714', '29', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('537', '2021-03-24 17:22:57.316029', '2021-03-24 17:22:57.316029', '29', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('538', '2021-03-24 17:22:59.682503', '2021-03-24 17:22:59.682503', '29', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('539', '2021-03-24 17:23:01.609159', '2021-03-24 17:23:01.609159', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('540', '2021-03-24 17:24:25.863947', '2021-03-24 17:24:25.863947', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"87bfe770-8c82-11eb-aa21-532bfdae3858\",\"verifyCode\":\"0684\"}');
INSERT INTO `base_sys_log` VALUES ('541', '2021-03-24 17:24:25.890665', '2021-03-24 17:24:25.890665', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('542', '2021-03-24 17:24:26.128031', '2021-03-24 17:24:26.128031', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('543', '2021-03-24 17:24:31.739401', '2021-03-24 17:24:31.739401', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('544', '2021-03-24 17:24:31.740525', '2021-03-24 17:24:31.740525', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('545', '2021-03-24 17:24:31.750973', '2021-03-24 17:24:31.750973', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('546', '2021-03-24 17:24:31.751779', '2021-03-24 17:24:31.751779', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('547', '2021-03-24 17:24:40.195158', '2021-03-24 17:24:40.195158', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('548', '2021-03-24 17:24:40.196896', '2021-03-24 17:24:40.196896', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('549', '2021-03-24 17:24:55.688412', '2021-03-24 17:24:55.688412', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('550', '2021-03-24 17:24:55.689690', '2021-03-24 17:24:55.689690', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('551', '2021-03-24 17:24:59.091564', '2021-03-24 17:24:59.091564', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('552', '2021-03-24 17:24:59.092330', '2021-03-24 17:24:59.092330', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('553', '2021-03-24 17:25:42.153492', '2021-03-24 17:25:42.153492', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('554', '2021-03-24 17:25:42.154337', '2021-03-24 17:25:42.154337', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('555', '2021-03-24 17:26:18.885468', '2021-03-24 17:26:18.885468', '1', '/admin/base/sys/menu/add', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\"}');
INSERT INTO `base_sys_log` VALUES ('556', '2021-03-24 17:26:18.886484', '2021-03-24 17:26:18.886484', '1', '/admin/base/sys/menu/add', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\"}');
INSERT INTO `base_sys_log` VALUES ('557', '2021-03-24 17:26:19.119493', '2021-03-24 17:26:19.119493', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('558', '2021-03-24 17:26:19.120297', '2021-03-24 17:26:19.120297', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('559', '2021-03-24 17:26:25.267630', '2021-03-24 17:26:25.267630', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('560', '2021-03-24 17:26:25.268381', '2021-03-24 17:26:25.268381', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('561', '2021-03-24 17:26:25.586906', '2021-03-24 17:26:25.586906', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('562', '2021-03-24 17:26:25.587676', '2021-03-24 17:26:25.587676', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('563', '2021-03-24 17:26:28.509857', '2021-03-24 17:26:28.509857', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 14:43:58\"}');
INSERT INTO `base_sys_log` VALUES ('564', '2021-03-24 17:26:28.510828', '2021-03-24 17:26:28.510828', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 14:43:58\"}');
INSERT INTO `base_sys_log` VALUES ('565', '2021-03-24 17:26:28.763532', '2021-03-24 17:26:28.763532', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('566', '2021-03-24 17:26:28.764904', '2021-03-24 17:26:28.764904', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('567', '2021-03-24 17:26:30.313846', '2021-03-24 17:26:30.313846', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('568', '2021-03-24 17:26:30.318598', '2021-03-24 17:26:30.318598', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('569', '2021-03-24 17:26:30.510677', '2021-03-24 17:26:30.510677', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('570', '2021-03-24 17:26:30.511862', '2021-03-24 17:26:30.511862', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('571', '2021-03-24 17:26:48.456093', '2021-03-24 17:26:48.456093', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('572', '2021-03-24 17:26:48.456814', '2021-03-24 17:26:48.456814', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('573', '2021-03-24 17:26:48.458290', '2021-03-24 17:26:48.458290', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('574', '2021-03-24 17:26:48.459185', '2021-03-24 17:26:48.459185', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('575', '2021-03-24 17:26:51.242348', '2021-03-24 17:26:51.242348', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":true,\"icon\":\"icon-workbench\",\"orderNum\":2,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 14:50:39\"}');
INSERT INTO `base_sys_log` VALUES ('576', '2021-03-24 17:26:51.243435', '2021-03-24 17:26:51.243435', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":true,\"icon\":\"icon-workbench\",\"orderNum\":2,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 14:50:39\"}');
INSERT INTO `base_sys_log` VALUES ('577', '2021-03-24 17:26:51.492652', '2021-03-24 17:26:51.492652', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('578', '2021-03-24 17:26:51.493490', '2021-03-24 17:26:51.493490', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('579', '2021-03-24 17:27:00.500322', '2021-03-24 17:27:00.500322', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('580', '2021-03-24 17:27:00.504678', '2021-03-24 17:27:00.504678', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('581', '2021-03-24 17:27:00.690347', '2021-03-24 17:27:00.690347', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('582', '2021-03-24 17:27:00.691131', '2021-03-24 17:27:00.691131', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('583', '2021-03-24 17:27:01.473685', '2021-03-24 17:27:01.473685', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('584', '2021-03-24 17:27:01.474662', '2021-03-24 17:27:01.474662', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('585', '2021-03-24 17:27:01.504919', '2021-03-24 17:27:01.504919', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('586', '2021-03-24 17:27:01.506822', '2021-03-24 17:27:01.506822', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('587', '2021-03-24 17:27:14.133233', '2021-03-24 17:27:14.133233', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('588', '2021-03-24 17:27:14.134767', '2021-03-24 17:27:14.134767', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('589', '2021-03-24 17:27:19.995826', '2021-03-24 17:27:19.995826', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('590', '2021-03-24 17:27:19.996839', '2021-03-24 17:27:19.996839', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('591', '2021-03-24 17:27:20.003788', '2021-03-24 17:27:20.003788', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('592', '2021-03-24 17:27:20.004847', '2021-03-24 17:27:20.004847', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('593', '2021-03-24 17:28:09.296723', '2021-03-24 17:28:09.296723', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('594', '2021-03-24 17:28:09.299966', '2021-03-24 17:28:09.299966', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('595', '2021-03-24 17:28:17.152190', '2021-03-24 17:28:17.152190', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('596', '2021-03-24 17:28:17.153709', '2021-03-24 17:28:17.153709', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('597', '2021-03-24 17:28:17.156729', '2021-03-24 17:28:17.156729', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('598', '2021-03-24 17:28:17.157550', '2021-03-24 17:28:17.157550', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('599', '2021-03-24 17:28:17.187891', '2021-03-24 17:28:17.187891', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('600', '2021-03-24 17:28:17.191539', '2021-03-24 17:28:17.191539', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('601', '2021-03-24 17:28:49.990998', '2021-03-24 17:28:49.990998', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120,98,99,100,101,2,27,97],\"departmentIdList\":[],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 17:01:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('602', '2021-03-24 17:28:49.992126', '2021-03-24 17:28:49.992126', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120,98,99,100,101,2,27,97],\"departmentIdList\":[],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 17:01:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('603', '2021-03-24 17:28:50.422053', '2021-03-24 17:28:50.422053', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('604', '2021-03-24 17:28:50.422833', '2021-03-24 17:28:50.422833', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('605', '2021-03-24 17:28:52.229554', '2021-03-24 17:28:52.229554', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('606', '2021-03-24 17:28:52.230348', '2021-03-24 17:28:52.230348', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('607', '2021-03-24 17:28:52.551076', '2021-03-24 17:28:52.551076', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('608', '2021-03-24 17:28:52.551880', '2021-03-24 17:28:52.551880', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('609', '2021-03-24 17:28:52.555288', '2021-03-24 17:28:52.555288', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('610', '2021-03-24 17:28:52.556809', '2021-03-24 17:28:52.556809', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('611', '2021-03-24 17:28:58.576987', '2021-03-24 17:28:58.576987', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('612', '2021-03-24 17:28:58.577864', '2021-03-24 17:28:58.577864', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('613', '2021-03-24 17:28:58.581360', '2021-03-24 17:28:58.581360', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('614', '2021-03-24 17:28:58.582695', '2021-03-24 17:28:58.582695', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('615', '2021-03-24 17:28:58.606987', '2021-03-24 17:28:58.606987', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('616', '2021-03-24 17:28:58.607894', '2021-03-24 17:28:58.607894', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('617', '2021-03-24 17:29:01.163951', '2021-03-24 17:29:01.163951', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('618', '2021-03-24 17:29:01.164680', '2021-03-24 17:29:01.164680', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('619', '2021-03-24 17:29:01.477916', '2021-03-24 17:29:01.477916', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('620', '2021-03-24 17:29:01.478654', '2021-03-24 17:29:01.478654', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('621', '2021-03-24 17:29:01.482432', '2021-03-24 17:29:01.482432', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('622', '2021-03-24 17:29:01.484237', '2021-03-24 17:29:01.484237', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('623', '2021-03-24 17:29:04.261837', '2021-03-24 17:29:04.261837', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 13:07:40\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('624', '2021-03-24 17:29:04.263550', '2021-03-24 17:29:04.263550', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 13:07:40\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('625', '2021-03-24 17:29:04.493656', '2021-03-24 17:29:04.493656', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('626', '2021-03-24 17:29:04.494469', '2021-03-24 17:29:04.494469', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('627', '2021-03-24 17:29:06.869990', '2021-03-24 17:29:06.869990', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('628', '2021-03-24 17:29:06.870686', '2021-03-24 17:29:06.870686', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('629', '2021-03-24 17:29:07.188139', '2021-03-24 17:29:07.188139', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('630', '2021-03-24 17:29:07.188800', '2021-03-24 17:29:07.188800', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('631', '2021-03-24 17:29:07.190140', '2021-03-24 17:29:07.190140', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('632', '2021-03-24 17:29:07.190776', '2021-03-24 17:29:07.190776', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('633', '2021-03-24 17:34:30.989842', '2021-03-24 17:34:30.989842', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('634', '2021-03-24 17:34:32.092042', '2021-03-24 17:34:32.092042', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('635', '2021-03-24 17:34:36.598456', '2021-03-24 17:34:36.598456', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"xiaolan\",\"password\":\"123456\",\"captchaId\":\"234f3fa0-8c84-11eb-aa21-532bfdae3858\",\"verifyCode\":\"3757\"}');
INSERT INTO `base_sys_log` VALUES ('636', '2021-03-24 17:34:36.645127', '2021-03-24 17:34:36.645127', '30', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('637', '2021-03-24 17:34:36.663551', '2021-03-24 17:34:36.663551', '30', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('638', '2021-03-24 17:34:38.110444', '2021-03-24 17:34:38.110444', '30', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('639', '2021-03-24 17:34:38.117519', '2021-03-24 17:34:38.117519', '30', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('640', '2021-03-24 17:34:42.631732', '2021-03-24 17:34:42.631732', '30', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('641', '2021-03-24 17:34:43.424425', '2021-03-24 17:34:43.424425', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('642', '2021-03-24 17:34:47.724549', '2021-03-24 17:34:47.724549', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"2a105fe0-8c84-11eb-aa21-532bfdae3858\",\"verifyCode\":\"9267\"}');
INSERT INTO `base_sys_log` VALUES ('643', '2021-03-24 17:34:47.749883', '2021-03-24 17:34:47.749883', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('644', '2021-03-24 17:34:47.772954', '2021-03-24 17:34:47.772954', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('645', '2021-03-25 12:19:04.310172', '2021-03-25 12:19:04.310172', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('646', '2021-03-25 12:19:06.798810', '2021-03-25 12:19:06.798810', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"3be458f0-8d21-11eb-943d-cf931213114c\",\"verifyCode\":\"4416\"}');
INSERT INTO `base_sys_log` VALUES ('647', '2021-03-25 12:19:06.839974', '2021-03-25 12:19:06.839974', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('648', '2021-03-25 12:19:06.858832', '2021-03-25 12:19:06.858832', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('649', '2021-03-25 12:19:08.716179', '2021-03-25 12:19:08.716179', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('650', '2021-03-25 12:19:08.714580', '2021-03-25 12:19:08.714580', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('651', '2021-03-25 12:19:08.743746', '2021-03-25 12:19:08.743746', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('652', '2021-03-25 12:19:08.745867', '2021-03-25 12:19:08.745867', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('653', '2021-03-25 12:19:24.026986', '2021-03-25 12:19:24.026986', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[30]}');
INSERT INTO `base_sys_log` VALUES ('654', '2021-03-25 12:19:24.028687', '2021-03-25 12:19:24.028687', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[30]}');
INSERT INTO `base_sys_log` VALUES ('655', '2021-03-25 12:19:24.262051', '2021-03-25 12:19:24.262051', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('656', '2021-03-25 12:19:24.265381', '2021-03-25 12:19:24.265381', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('657', '2021-03-25 12:19:25.624337', '2021-03-25 12:19:25.624337', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[29]}');
INSERT INTO `base_sys_log` VALUES ('658', '2021-03-25 12:19:25.626204', '2021-03-25 12:19:25.626204', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[29]}');
INSERT INTO `base_sys_log` VALUES ('659', '2021-03-25 12:19:26.151027', '2021-03-25 12:19:26.151027', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('660', '2021-03-25 12:19:26.152107', '2021-03-25 12:19:26.152107', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('661', '2021-03-25 12:19:27.676448', '2021-03-25 12:19:27.676448', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[28]}');
INSERT INTO `base_sys_log` VALUES ('662', '2021-03-25 12:19:27.677623', '2021-03-25 12:19:27.677623', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[28]}');
INSERT INTO `base_sys_log` VALUES ('663', '2021-03-25 12:19:28.126732', '2021-03-25 12:19:28.126732', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('664', '2021-03-25 12:19:28.127872', '2021-03-25 12:19:28.127872', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('665', '2021-03-25 12:19:29.733347', '2021-03-25 12:19:29.733347', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[24]}');
INSERT INTO `base_sys_log` VALUES ('666', '2021-03-25 12:19:29.734365', '2021-03-25 12:19:29.734365', '1', '/admin/base/sys/user/delete', '127.0.0.1', '本机地址', '{\"ids\":[24]}');
INSERT INTO `base_sys_log` VALUES ('667', '2021-03-25 12:19:30.138509', '2021-03-25 12:19:30.138509', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('668', '2021-03-25 12:19:30.139466', '2021-03-25 12:19:30.139466', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('669', '2021-03-25 12:19:34.682676', '2021-03-25 12:19:34.682676', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('670', '2021-03-25 12:19:34.683674', '2021-03-25 12:19:34.683674', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('671', '2021-03-25 12:19:42.069003', '2021-03-25 12:19:42.069003', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('672', '2021-03-25 12:19:42.069855', '2021-03-25 12:19:42.069855', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('673', '2021-03-25 12:19:44.952485', '2021-03-25 12:19:44.952485', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('674', '2021-03-25 12:19:44.953459', '2021-03-25 12:19:44.953459', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('675', '2021-03-25 12:19:45.259877', '2021-03-25 12:19:45.259877', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('676', '2021-03-25 12:19:45.260918', '2021-03-25 12:19:45.260918', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('677', '2021-03-25 12:19:51.281527', '2021-03-25 12:19:51.281527', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('678', '2021-03-25 12:19:51.282876', '2021-03-25 12:19:51.282876', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('679', '2021-03-25 12:19:51.559682', '2021-03-25 12:19:51.559682', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('680', '2021-03-25 12:19:51.561620', '2021-03-25 12:19:51.561620', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('681', '2021-03-25 12:20:06.514318', '2021-03-25 12:20:06.514318', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('682', '2021-03-25 12:20:06.515171', '2021-03-25 12:20:06.515171', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('683', '2021-03-25 12:20:06.837404', '2021-03-25 12:20:06.837404', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"97\"}');
INSERT INTO `base_sys_log` VALUES ('684', '2021-03-25 12:20:06.838468', '2021-03-25 12:20:06.838468', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"97\"}');
INSERT INTO `base_sys_log` VALUES ('685', '2021-03-25 12:20:09.273262', '2021-03-25 12:20:09.273262', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"用户列表\",\"parentId\":\"27\",\"router\":\"/sys/user\",\"keepAlive\":true,\"isShow\":false,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":97,\"createTime\":\"1900-01-20 14:14:02\",\"updateTime\":\"2021-03-09 11:03:09\"}');
INSERT INTO `base_sys_log` VALUES ('686', '2021-03-25 12:20:09.274855', '2021-03-25 12:20:09.274855', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"用户列表\",\"parentId\":\"27\",\"router\":\"/sys/user\",\"keepAlive\":true,\"isShow\":false,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":97,\"createTime\":\"1900-01-20 14:14:02\",\"updateTime\":\"2021-03-09 11:03:09\"}');
INSERT INTO `base_sys_log` VALUES ('687', '2021-03-25 12:20:09.528757', '2021-03-25 12:20:09.528757', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('688', '2021-03-25 12:20:09.530690', '2021-03-25 12:20:09.530690', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('689', '2021-03-25 12:20:17.185313', '2021-03-25 12:20:17.185313', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('690', '2021-03-25 12:20:17.186233', '2021-03-25 12:20:17.186233', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('691', '2021-03-25 12:20:17.491405', '2021-03-25 12:20:17.491405', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('692', '2021-03-25 12:20:17.492437', '2021-03-25 12:20:17.492437', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('693', '2021-03-25 12:20:19.532600', '2021-03-25 12:20:19.532600', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-workbench\",\"orderNum\":2,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 17:26:51\"}');
INSERT INTO `base_sys_log` VALUES ('694', '2021-03-25 12:20:19.533653', '2021-03-25 12:20:19.533653', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":0,\"name\":\"工作台\",\"parentId\":null,\"isShow\":false,\"icon\":\"icon-workbench\",\"orderNum\":2,\"id\":1,\"createTime\":\"2019-09-11 11:14:44\",\"updateTime\":\"2021-03-24 17:26:51\"}');
INSERT INTO `base_sys_log` VALUES ('695', '2021-03-25 12:20:19.794677', '2021-03-25 12:20:19.794677', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('696', '2021-03-25 12:20:19.797060', '2021-03-25 12:20:19.797060', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('697', '2021-03-25 12:20:24.648340', '2021-03-25 12:20:24.648340', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('698', '2021-03-25 12:20:24.649248', '2021-03-25 12:20:24.649248', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('699', '2021-03-25 12:20:28.106151', '2021-03-25 12:20:28.106151', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('700', '2021-03-25 12:20:28.107041', '2021-03-25 12:20:28.107041', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('701', '2021-03-25 12:20:28.108734', '2021-03-25 12:20:28.108734', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('702', '2021-03-25 12:20:28.109548', '2021-03-25 12:20:28.109548', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('703', '2021-03-25 12:20:28.142102', '2021-03-25 12:20:28.142102', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('704', '2021-03-25 12:20:28.152343', '2021-03-25 12:20:28.152343', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('705', '2021-03-25 12:20:34.793739', '2021-03-25 12:20:34.793739', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-24 13:04:12\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('706', '2021-03-25 12:20:34.795000', '2021-03-25 12:20:34.795000', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-24 13:04:12\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('707', '2021-03-25 12:20:35.208556', '2021-03-25 12:20:35.208556', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('708', '2021-03-25 12:20:35.209616', '2021-03-25 12:20:35.209616', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('709', '2021-03-25 12:20:37.368386', '2021-03-25 12:20:37.368386', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('710', '2021-03-25 12:20:37.369207', '2021-03-25 12:20:37.369207', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('711', '2021-03-25 12:20:37.682544', '2021-03-25 12:20:37.682544', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('712', '2021-03-25 12:20:37.683534', '2021-03-25 12:20:37.683534', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('713', '2021-03-25 12:20:37.698615', '2021-03-25 12:20:37.698615', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('714', '2021-03-25 12:20:37.699752', '2021-03-25 12:20:37.699752', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('715', '2021-03-25 12:21:11.453048', '2021-03-25 12:21:11.453048', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 17:28:50\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('716', '2021-03-25 12:21:11.455749', '2021-03-25 12:21:11.455749', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[],\"relevance\":1,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-24 17:28:50\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('717', '2021-03-25 12:21:11.704737', '2021-03-25 12:21:11.704737', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('718', '2021-03-25 12:21:11.705600', '2021-03-25 12:21:11.705600', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('719', '2021-03-25 12:21:14.786590', '2021-03-25 12:21:14.786590', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('720', '2021-03-25 12:21:14.790112', '2021-03-25 12:21:14.790112', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('721', '2021-03-25 12:21:18.040067', '2021-03-25 12:21:18.040067', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('722', '2021-03-25 12:21:18.043512', '2021-03-25 12:21:18.043512', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('723', '2021-03-25 12:21:24.717978', '2021-03-25 12:21:24.717978', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('724', '2021-03-25 12:21:24.718921', '2021-03-25 12:21:24.718921', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('725', '2021-03-25 12:21:28.827745', '2021-03-25 12:21:28.827745', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('726', '2021-03-25 12:21:28.828773', '2021-03-25 12:21:28.828773', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('727', '2021-03-25 12:21:29.140867', '2021-03-25 12:21:29.140867', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('728', '2021-03-25 12:21:29.141724', '2021-03-25 12:21:29.141724', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('729', '2021-03-25 12:22:02.904750', '2021-03-25 12:22:02.904750', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('730', '2021-03-25 12:22:02.906026', '2021-03-25 12:22:02.906026', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('731', '2021-03-25 12:22:03.610329', '2021-03-25 12:22:03.610329', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('732', '2021-03-25 12:22:03.611070', '2021-03-25 12:22:03.611070', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('733', '2021-03-25 12:22:07.904710', '2021-03-25 12:22:07.904710', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('734', '2021-03-25 12:22:07.905621', '2021-03-25 12:22:07.905621', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('735', '2021-03-25 12:22:07.910263', '2021-03-25 12:22:07.910263', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('736', '2021-03-25 12:22:07.911748', '2021-03-25 12:22:07.911748', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('737', '2021-03-25 12:22:07.914852', '2021-03-25 12:22:07.914852', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('738', '2021-03-25 12:22:07.916112', '2021-03-25 12:22:07.916112', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('739', '2021-03-25 12:22:11.111312', '2021-03-25 12:22:11.111312', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('740', '2021-03-25 12:22:11.112154', '2021-03-25 12:22:11.112154', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('741', '2021-03-25 12:22:11.437771', '2021-03-25 12:22:11.437771', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('742', '2021-03-25 12:22:11.438886', '2021-03-25 12:22:11.438886', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('743', '2021-03-25 12:22:11.441883', '2021-03-25 12:22:11.441883', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('744', '2021-03-25 12:22:11.442963', '2021-03-25 12:22:11.442963', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('745', '2021-03-25 12:22:14.211896', '2021-03-25 12:22:14.211896', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('746', '2021-03-25 12:22:14.213978', '2021-03-25 12:22:14.213978', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('747', '2021-03-25 12:22:14.226188', '2021-03-25 12:22:14.226188', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('748', '2021-03-25 12:22:14.227332', '2021-03-25 12:22:14.227332', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('749', '2021-03-25 12:22:14.237213', '2021-03-25 12:22:14.237213', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('750', '2021-03-25 12:22:14.238349', '2021-03-25 12:22:14.238349', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('751', '2021-03-25 12:22:22.643081', '2021-03-25 12:22:22.643081', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('752', '2021-03-25 12:22:22.643886', '2021-03-25 12:22:22.643886', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('753', '2021-03-25 12:22:27.978334', '2021-03-25 12:22:27.978334', '1', '/admin/base/comm/uploadMode', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('754', '2021-03-25 12:22:28.265320', '2021-03-25 12:22:28.265320', '1', '/admin/base/comm/upload', '127.0.0.1', '本机地址', '{\"key\":\"app/微信图片_20200821105001.jpg\"}');
INSERT INTO `base_sys_log` VALUES ('755', '2021-03-25 12:22:40.705022', '2021-03-25 12:22:40.705022', '1', '/admin/base/comm/uploadMode', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('756', '2021-03-25 12:22:41.064388', '2021-03-25 12:22:41.064388', '1', '/admin/base/comm/upload', '127.0.0.1', '本机地址', '{\"key\":\"app/微信图片_20200821105001.jpg\"}');
INSERT INTO `base_sys_log` VALUES ('757', '2021-03-25 12:23:12.014139', '2021-03-25 12:23:12.014139', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"headImg\":\"\",\"name\":\"云闸机管理员\",\"nickName\":\"云闸机管理员\",\"username\":\"云闸机管理员\",\"roleIdList\":[10],\"status\":1,\"departmentId\":1}');
INSERT INTO `base_sys_log` VALUES ('758', '2021-03-25 12:23:12.015304', '2021-03-25 12:23:12.015304', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"headImg\":\"\",\"name\":\"云闸机管理员\",\"nickName\":\"云闸机管理员\",\"username\":\"云闸机管理员\",\"roleIdList\":[10],\"status\":1,\"departmentId\":1}');
INSERT INTO `base_sys_log` VALUES ('759', '2021-03-25 12:23:12.496990', '2021-03-25 12:23:12.496990', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('760', '2021-03-25 12:23:12.498102', '2021-03-25 12:23:12.498102', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('761', '2021-03-25 12:23:58.804462', '2021-03-25 12:23:58.804462', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('762', '2021-03-25 12:23:58.805260', '2021-03-25 12:23:58.805260', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('763', '2021-03-25 12:23:59.108830', '2021-03-25 12:23:59.108830', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('764', '2021-03-25 12:23:59.110233', '2021-03-25 12:23:59.110233', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('765', '2021-03-25 12:24:02.146405', '2021-03-25 12:24:02.146405', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('766', '2021-03-25 12:24:02.148080', '2021-03-25 12:24:02.148080', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('767', '2021-03-25 12:24:02.804414', '2021-03-25 12:24:02.804414', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('768', '2021-03-25 12:24:02.805275', '2021-03-25 12:24:02.805275', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('769', '2021-03-25 12:24:04.041252', '2021-03-25 12:24:04.041252', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('770', '2021-03-25 12:24:04.042730', '2021-03-25 12:24:04.042730', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('771', '2021-03-25 12:24:04.516992', '2021-03-25 12:24:04.516992', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('772', '2021-03-25 12:24:04.517663', '2021-03-25 12:24:04.517663', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('773', '2021-03-25 12:24:06.086398', '2021-03-25 12:24:06.086398', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('774', '2021-03-25 12:24:06.087292', '2021-03-25 12:24:06.087292', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('775', '2021-03-25 12:24:29.113165', '2021-03-25 12:24:29.113165', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('776', '2021-03-25 12:24:29.113927', '2021-03-25 12:24:29.113927', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('777', '2021-03-25 12:24:29.425495', '2021-03-25 12:24:29.425495', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('778', '2021-03-25 12:24:29.426377', '2021-03-25 12:24:29.426377', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('779', '2021-03-25 12:24:45.617691', '2021-03-25 12:24:45.617691', '1', '/admin/base/sys/user/update', '127.0.0.1', '本机地址', '{\"headImg\":\"\",\"name\":\"云闸机管理员\",\"nickName\":\"云闸机管理员\",\"username\":\"cloudadmin\",\"roleIdList\":[10],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":31,\"createTime\":\"2021-03-25 12:23:12\",\"updateTime\":\"2021-03-25 12:23:12\",\"departmentId\":\"1\",\"pid\":\"1\",\"passwordV\":1,\"departmentName\":\"云闸机管理系统A\"}');
INSERT INTO `base_sys_log` VALUES ('780', '2021-03-25 12:24:45.619230', '2021-03-25 12:24:45.619230', '1', '/admin/base/sys/user/update', '127.0.0.1', '本机地址', '{\"headImg\":\"\",\"name\":\"云闸机管理员\",\"nickName\":\"云闸机管理员\",\"username\":\"cloudadmin\",\"roleIdList\":[10],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":31,\"createTime\":\"2021-03-25 12:23:12\",\"updateTime\":\"2021-03-25 12:23:12\",\"departmentId\":\"1\",\"pid\":\"1\",\"passwordV\":1,\"departmentName\":\"云闸机管理系统A\"}');
INSERT INTO `base_sys_log` VALUES ('781', '2021-03-25 12:24:45.867379', '2021-03-25 12:24:45.867379', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('782', '2021-03-25 12:24:45.868860', '2021-03-25 12:24:45.868860', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('783', '2021-03-25 12:24:57.189287', '2021-03-25 12:24:57.189287', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('784', '2021-03-25 12:25:02.205736', '2021-03-25 12:25:02.205736', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"cloudadmin\",\"password\":\"123456\",\"captchaId\":\"0e37e240-8d22-11eb-943d-cf931213114c\",\"verifyCode\":\"5205\"}');
INSERT INTO `base_sys_log` VALUES ('785', '2021-03-25 12:25:02.232397', '2021-03-25 12:25:02.232397', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('786', '2021-03-25 12:25:02.249791', '2021-03-25 12:25:02.249791', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('787', '2021-03-25 12:25:04.387298', '2021-03-25 12:25:04.387298', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('788', '2021-03-25 12:25:04.392621', '2021-03-25 12:25:04.392621', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('789', '2021-03-25 12:25:04.712854', '2021-03-25 12:25:04.712854', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('790', '2021-03-25 12:25:04.718936', '2021-03-25 12:25:04.718936', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('791', '2021-03-25 12:25:06.365482', '2021-03-25 12:25:06.365482', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('792', '2021-03-25 12:25:06.371570', '2021-03-25 12:25:06.371570', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('793', '2021-03-25 12:25:14.514757', '2021-03-25 12:25:14.514757', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('794', '2021-03-25 12:25:14.523254', '2021-03-25 12:25:14.523254', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('795', '2021-03-25 12:26:04.470627', '2021-03-25 12:26:04.470627', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('796', '2021-03-25 12:26:04.471962', '2021-03-25 12:26:04.471962', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('797', '2021-03-25 12:26:04.481371', '2021-03-25 12:26:04.481371', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('798', '2021-03-25 12:26:04.482651', '2021-03-25 12:26:04.482651', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('799', '2021-03-25 12:26:04.484994', '2021-03-25 12:26:04.484994', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('800', '2021-03-25 12:26:04.485914', '2021-03-25 12:26:04.485914', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('801', '2021-03-25 12:26:06.953520', '2021-03-25 12:26:06.953520', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('802', '2021-03-25 12:26:06.954414', '2021-03-25 12:26:06.954414', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('803', '2021-03-25 12:26:07.275436', '2021-03-25 12:26:07.275436', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('804', '2021-03-25 12:26:07.276217', '2021-03-25 12:26:07.276217', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('805', '2021-03-25 12:26:07.277822', '2021-03-25 12:26:07.277822', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('806', '2021-03-25 12:26:07.278831', '2021-03-25 12:26:07.278831', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('807', '2021-03-25 12:26:25.660401', '2021-03-25 12:26:25.660401', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:20:34\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('808', '2021-03-25 12:26:25.661401', '2021-03-25 12:26:25.661401', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:20:34\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('809', '2021-03-25 12:26:25.925600', '2021-03-25 12:26:25.925600', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('810', '2021-03-25 12:26:25.929494', '2021-03-25 12:26:25.929494', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('811', '2021-03-25 12:26:33.709570', '2021-03-25 12:26:33.709570', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('812', '2021-03-25 12:26:33.718352', '2021-03-25 12:26:33.718352', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('813', '2021-03-25 12:26:38.771784', '2021-03-25 12:26:38.771784', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('814', '2021-03-25 12:26:38.775467', '2021-03-25 12:26:38.775467', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('815', '2021-03-25 12:26:38.969472', '2021-03-25 12:26:38.969472', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('816', '2021-03-25 12:26:38.975596', '2021-03-25 12:26:38.975596', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('817', '2021-03-25 12:26:39.009433', '2021-03-25 12:26:39.009433', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('818', '2021-03-25 12:26:39.016478', '2021-03-25 12:26:39.016478', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('819', '2021-03-25 12:26:42.862499', '2021-03-25 12:26:42.862499', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('820', '2021-03-25 12:26:42.870019', '2021-03-25 12:26:42.870019', '31', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('821', '2021-03-25 12:26:47.655822', '2021-03-25 12:26:47.655822', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('822', '2021-03-25 12:26:47.656628', '2021-03-25 12:26:47.656628', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('823', '2021-03-25 12:26:47.970210', '2021-03-25 12:26:47.970210', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('824', '2021-03-25 12:26:47.971017', '2021-03-25 12:26:47.971017', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('825', '2021-03-25 12:26:47.972547', '2021-03-25 12:26:47.972547', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('826', '2021-03-25 12:26:47.974720', '2021-03-25 12:26:47.974720', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('827', '2021-03-25 12:27:30.976719', '2021-03-25 12:27:30.976719', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('828', '2021-03-25 12:27:30.978060', '2021-03-25 12:27:30.978060', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('829', '2021-03-25 12:27:31.236765', '2021-03-25 12:27:31.236765', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('830', '2021-03-25 12:27:31.237609', '2021-03-25 12:27:31.237609', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('831', '2021-03-25 12:27:32.969593', '2021-03-25 12:27:32.969593', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('832', '2021-03-25 12:27:32.970539', '2021-03-25 12:27:32.970539', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('833', '2021-03-25 12:27:34.477807', '2021-03-25 12:27:34.477807', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('834', '2021-03-25 12:27:34.478739', '2021-03-25 12:27:34.478739', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('835', '2021-03-25 12:27:36.929002', '2021-03-25 12:27:36.929002', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('836', '2021-03-25 12:27:36.930376', '2021-03-25 12:27:36.930376', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('837', '2021-03-25 12:27:37.685483', '2021-03-25 12:27:37.685483', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('838', '2021-03-25 12:27:37.686497', '2021-03-25 12:27:37.686497', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('839', '2021-03-25 12:27:38.939328', '2021-03-25 12:27:38.939328', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('840', '2021-03-25 12:27:38.940682', '2021-03-25 12:27:38.940682', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('841', '2021-03-25 12:27:39.621746', '2021-03-25 12:27:39.621746', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('842', '2021-03-25 12:27:39.622582', '2021-03-25 12:27:39.622582', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('843', '2021-03-25 12:27:40.771942', '2021-03-25 12:27:40.771942', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('844', '2021-03-25 12:27:40.772900', '2021-03-25 12:27:40.772900', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('845', '2021-03-25 12:27:48.911325', '2021-03-25 12:27:48.911325', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('846', '2021-03-25 12:27:48.912474', '2021-03-25 12:27:48.912474', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('847', '2021-03-25 12:27:54.470207', '2021-03-25 12:27:54.470207', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('848', '2021-03-25 12:27:54.471030', '2021-03-25 12:27:54.471030', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('849', '2021-03-25 12:27:55.063359', '2021-03-25 12:27:55.063359', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('850', '2021-03-25 12:27:55.065247', '2021-03-25 12:27:55.065247', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('851', '2021-03-25 12:27:57.049594', '2021-03-25 12:27:57.049594', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('852', '2021-03-25 12:27:57.050422', '2021-03-25 12:27:57.050422', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('853', '2021-03-25 12:27:58.280740', '2021-03-25 12:27:58.280740', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('854', '2021-03-25 12:27:58.281988', '2021-03-25 12:27:58.281988', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('855', '2021-03-25 12:28:17.292449', '2021-03-25 12:28:17.292449', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"工程商小A\",\"nickName\":\"工程商小A\",\"username\":\"gcsa\",\"roleIdList\":[12],\"status\":1,\"departmentId\":14}');
INSERT INTO `base_sys_log` VALUES ('856', '2021-03-25 12:28:17.293445', '2021-03-25 12:28:17.293445', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"工程商小A\",\"nickName\":\"工程商小A\",\"username\":\"gcsa\",\"roleIdList\":[12],\"status\":1,\"departmentId\":14}');
INSERT INTO `base_sys_log` VALUES ('857', '2021-03-25 12:28:17.554435', '2021-03-25 12:28:17.554435', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('858', '2021-03-25 12:28:17.555904', '2021-03-25 12:28:17.555904', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('859', '2021-03-25 12:28:29.333009', '2021-03-25 12:28:29.333009', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('860', '2021-03-25 12:28:35.673565', '2021-03-25 12:28:35.673565', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\",\"captchaId\":\"8caa2f20-8d22-11eb-943d-cf931213114c\",\"verifyCode\":\"9345\"}');
INSERT INTO `base_sys_log` VALUES ('861', '2021-03-25 12:28:35.732353', '2021-03-25 12:28:35.732353', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('862', '2021-03-25 12:28:35.758093', '2021-03-25 12:28:35.758093', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('863', '2021-03-25 12:28:38.541000', '2021-03-25 12:28:38.541000', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('864', '2021-03-25 12:28:38.542687', '2021-03-25 12:28:38.542687', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('865', '2021-03-25 12:28:44.059029', '2021-03-25 12:28:44.059029', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('866', '2021-03-25 12:28:44.060976', '2021-03-25 12:28:44.060976', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('867', '2021-03-25 12:28:45.221322', '2021-03-25 12:28:45.221322', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('868', '2021-03-25 12:28:45.223591', '2021-03-25 12:28:45.223591', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('869', '2021-03-25 12:28:51.374268', '2021-03-25 12:28:51.374268', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('870', '2021-03-25 12:28:51.375197', '2021-03-25 12:28:51.375197', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('871', '2021-03-25 12:28:51.726615', '2021-03-25 12:28:51.726615', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('872', '2021-03-25 12:28:51.728014', '2021-03-25 12:28:51.728014', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('873', '2021-03-25 12:28:51.737648', '2021-03-25 12:28:51.737648', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('874', '2021-03-25 12:28:51.739516', '2021-03-25 12:28:51.739516', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('875', '2021-03-25 12:29:39.385534', '2021-03-25 12:29:39.385534', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('876', '2021-03-25 12:29:39.390663', '2021-03-25 12:29:39.390663', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('877', '2021-03-25 12:29:41.671327', '2021-03-25 12:29:41.671327', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('878', '2021-03-25 12:29:41.675268', '2021-03-25 12:29:41.675268', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('879', '2021-03-25 12:29:42.866767', '2021-03-25 12:29:42.866767', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('880', '2021-03-25 12:29:42.873536', '2021-03-25 12:29:42.873536', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('881', '2021-03-25 12:29:49.018504', '2021-03-25 12:29:49.018504', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('882', '2021-03-25 12:29:49.019674', '2021-03-25 12:29:49.019674', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('883', '2021-03-25 12:29:49.044894', '2021-03-25 12:29:49.044894', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('884', '2021-03-25 12:29:49.050019', '2021-03-25 12:29:49.050019', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('885', '2021-03-25 12:30:05.830279', '2021-03-25 12:30:05.830279', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('886', '2021-03-25 12:30:05.831476', '2021-03-25 12:30:05.831476', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('887', '2021-03-25 12:30:08.524111', '2021-03-25 12:30:08.524111', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('888', '2021-03-25 12:30:08.525863', '2021-03-25 12:30:08.525863', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('889', '2021-03-25 12:30:10.442079', '2021-03-25 12:30:10.442079', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('890', '2021-03-25 12:30:10.443560', '2021-03-25 12:30:10.443560', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('891', '2021-03-25 12:30:10.964673', '2021-03-25 12:30:10.964673', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('892', '2021-03-25 12:30:10.967566', '2021-03-25 12:30:10.967566', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('893', '2021-03-25 12:30:14.022049', '2021-03-25 12:30:14.022049', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('894', '2021-03-25 12:30:14.023004', '2021-03-25 12:30:14.023004', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('895', '2021-03-25 12:30:14.322644', '2021-03-25 12:30:14.322644', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('896', '2021-03-25 12:30:14.323680', '2021-03-25 12:30:14.323680', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('897', '2021-03-25 12:30:16.841939', '2021-03-25 12:30:16.841939', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":null,\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('898', '2021-03-25 12:30:16.843883', '2021-03-25 12:30:16.843883', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":null,\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-24 17:26:18\"}');
INSERT INTO `base_sys_log` VALUES ('899', '2021-03-25 12:30:17.086884', '2021-03-25 12:30:17.086884', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('900', '2021-03-25 12:30:17.088414', '2021-03-25 12:30:17.088414', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('901', '2021-03-25 12:30:19.894578', '2021-03-25 12:30:19.894578', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('902', '2021-03-25 12:30:19.895447', '2021-03-25 12:30:19.895447', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('903', '2021-03-25 12:30:20.197039', '2021-03-25 12:30:20.197039', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('904', '2021-03-25 12:30:20.198411', '2021-03-25 12:30:20.198411', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('905', '2021-03-25 12:30:23.792569', '2021-03-25 12:30:23.792569', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('906', '2021-03-25 12:30:23.793666', '2021-03-25 12:30:23.793666', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('907', '2021-03-25 12:30:24.052872', '2021-03-25 12:30:24.052872', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('908', '2021-03-25 12:30:24.053942', '2021-03-25 12:30:24.053942', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('909', '2021-03-25 12:30:26.759917', '2021-03-25 12:30:26.759917', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('910', '2021-03-25 12:30:26.760960', '2021-03-25 12:30:26.760960', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('911', '2021-03-25 12:30:27.078016', '2021-03-25 12:30:27.078016', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('912', '2021-03-25 12:30:27.078945', '2021-03-25 12:30:27.078945', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('913', '2021-03-25 12:30:38.983155', '2021-03-25 12:30:38.983155', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('914', '2021-03-25 12:30:38.984011', '2021-03-25 12:30:38.984011', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-24 17:26:28\"}');
INSERT INTO `base_sys_log` VALUES ('915', '2021-03-25 12:30:39.244374', '2021-03-25 12:30:39.244374', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('916', '2021-03-25 12:30:39.245189', '2021-03-25 12:30:39.245189', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('917', '2021-03-25 12:30:41.093045', '2021-03-25 12:30:41.093045', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('918', '2021-03-25 12:30:41.093912', '2021-03-25 12:30:41.093912', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('919', '2021-03-25 12:30:41.400479', '2021-03-25 12:30:41.400479', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('920', '2021-03-25 12:30:41.402250', '2021-03-25 12:30:41.402250', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('921', '2021-03-25 12:30:43.197567', '2021-03-25 12:30:43.197567', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:30:38\"}');
INSERT INTO `base_sys_log` VALUES ('922', '2021-03-25 12:30:43.198682', '2021-03-25 12:30:43.198682', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:30:38\"}');
INSERT INTO `base_sys_log` VALUES ('923', '2021-03-25 12:30:43.460344', '2021-03-25 12:30:43.460344', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('924', '2021-03-25 12:30:43.461177', '2021-03-25 12:30:43.461177', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('925', '2021-03-25 12:30:48.089270', '2021-03-25 12:30:48.089270', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('926', '2021-03-25 12:30:52.645287', '2021-03-25 12:30:52.645287', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('927', '2021-03-25 12:30:52.650300', '2021-03-25 12:30:52.650300', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('928', '2021-03-25 12:30:54.089748', '2021-03-25 12:30:54.089748', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('929', '2021-03-25 12:30:54.091768', '2021-03-25 12:30:54.091768', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('930', '2021-03-25 12:30:56.498106', '2021-03-25 12:30:56.498106', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('931', '2021-03-25 12:30:56.502700', '2021-03-25 12:30:56.502700', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('932', '2021-03-25 12:30:57.735837', '2021-03-25 12:30:57.735837', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('933', '2021-03-25 12:30:57.738031', '2021-03-25 12:30:57.738031', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('934', '2021-03-25 12:30:59.859895', '2021-03-25 12:30:59.859895', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('935', '2021-03-25 12:30:59.862431', '2021-03-25 12:30:59.862431', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('936', '2021-03-25 12:31:03.739018', '2021-03-25 12:31:03.739018', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('937', '2021-03-25 12:31:03.741049', '2021-03-25 12:31:03.741049', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('938', '2021-03-25 12:31:05.291601', '2021-03-25 12:31:05.291601', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('939', '2021-03-25 12:31:05.294978', '2021-03-25 12:31:05.294978', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('940', '2021-03-25 12:31:10.626252', '2021-03-25 12:31:10.626252', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('941', '2021-03-25 12:31:10.627179', '2021-03-25 12:31:10.627179', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('942', '2021-03-25 12:31:10.952041', '2021-03-25 12:31:10.952041', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('943', '2021-03-25 12:31:10.952990', '2021-03-25 12:31:10.952990', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('944', '2021-03-25 12:31:10.957059', '2021-03-25 12:31:10.957059', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('945', '2021-03-25 12:31:10.959202', '2021-03-25 12:31:10.959202', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('946', '2021-03-25 12:31:24.144262', '2021-03-25 12:31:24.144262', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('947', '2021-03-25 12:31:24.146784', '2021-03-25 12:31:24.146784', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('948', '2021-03-25 12:31:24.331575', '2021-03-25 12:31:24.331575', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('949', '2021-03-25 12:31:24.340114', '2021-03-25 12:31:24.340114', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('950', '2021-03-25 12:31:24.352056', '2021-03-25 12:31:24.352056', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('951', '2021-03-25 12:31:24.370464', '2021-03-25 12:31:24.370464', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('952', '2021-03-25 12:31:25.749020', '2021-03-25 12:31:25.749020', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('953', '2021-03-25 12:31:25.752200', '2021-03-25 12:31:25.752200', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('954', '2021-03-25 12:31:28.167320', '2021-03-25 12:31:28.167320', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('955', '2021-03-25 12:31:28.170911', '2021-03-25 12:31:28.170911', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('956', '2021-03-25 12:31:30.086595', '2021-03-25 12:31:30.086595', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('957', '2021-03-25 12:31:30.092618', '2021-03-25 12:31:30.092618', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('958', '2021-03-25 12:31:30.997353', '2021-03-25 12:31:30.997353', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('959', '2021-03-25 12:31:31.004952', '2021-03-25 12:31:31.004952', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('960', '2021-03-25 12:31:35.899165', '2021-03-25 12:31:35.899165', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('961', '2021-03-25 12:31:35.906640', '2021-03-25 12:31:35.906640', '31', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('962', '2021-03-25 12:31:35.915140', '2021-03-25 12:31:35.915140', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('963', '2021-03-25 12:31:35.917669', '2021-03-25 12:31:35.917669', '31', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('964', '2021-03-25 12:31:57.241034', '2021-03-25 12:31:57.241034', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('965', '2021-03-25 12:31:57.241863', '2021-03-25 12:31:57.241863', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('966', '2021-03-25 12:31:57.242942', '2021-03-25 12:31:57.242942', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('967', '2021-03-25 12:31:57.267875', '2021-03-25 12:31:57.267875', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('968', '2021-03-25 12:31:57.269001', '2021-03-25 12:31:57.269001', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('969', '2021-03-25 12:31:57.275776', '2021-03-25 12:31:57.275776', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('970', '2021-03-25 12:32:04.400402', '2021-03-25 12:32:04.400402', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,98,99,100,59,101,60,61,62,63,65,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:26:25\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('971', '2021-03-25 12:32:04.411600', '2021-03-25 12:32:04.411600', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,98,99,100,59,101,60,61,62,63,65,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:26:25\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('972', '2021-03-25 12:32:04.811708', '2021-03-25 12:32:04.811708', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('973', '2021-03-25 12:32:04.821268', '2021-03-25 12:32:04.821268', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('974', '2021-03-25 12:32:08.299984', '2021-03-25 12:32:08.299984', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('975', '2021-03-25 12:32:08.307356', '2021-03-25 12:32:08.307356', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('976', '2021-03-25 12:32:08.610457', '2021-03-25 12:32:08.610457', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('977', '2021-03-25 12:32:08.611208', '2021-03-25 12:32:08.611208', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('978', '2021-03-25 12:32:08.623046', '2021-03-25 12:32:08.623046', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('979', '2021-03-25 12:32:08.623613', '2021-03-25 12:32:08.623613', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('980', '2021-03-25 12:32:18.370874', '2021-03-25 12:32:18.370874', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,98,99,100,59,101,60,61,62,63,65,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:04\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('981', '2021-03-25 12:32:18.380361', '2021-03-25 12:32:18.380361', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,98,99,100,59,101,60,61,62,63,65,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:04\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('982', '2021-03-25 12:32:18.626777', '2021-03-25 12:32:18.626777', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('983', '2021-03-25 12:32:18.636320', '2021-03-25 12:32:18.636320', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('984', '2021-03-25 12:32:20.165706', '2021-03-25 12:32:20.165706', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('985', '2021-03-25 12:32:20.170221', '2021-03-25 12:32:20.170221', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('986', '2021-03-25 12:32:20.481513', '2021-03-25 12:32:20.481513', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('987', '2021-03-25 12:32:20.487512', '2021-03-25 12:32:20.487512', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('988', '2021-03-25 12:32:22.701250', '2021-03-25 12:32:22.701250', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('989', '2021-03-25 12:32:22.703188', '2021-03-25 12:32:22.703188', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('990', '2021-03-25 12:32:25.630240', '2021-03-25 12:32:25.630240', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('991', '2021-03-25 12:32:25.632817', '2021-03-25 12:32:25.632817', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('992', '2021-03-25 12:32:26.610675', '2021-03-25 12:32:26.610675', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('993', '2021-03-25 12:32:26.615937', '2021-03-25 12:32:26.615937', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('994', '2021-03-25 12:32:26.626512', '2021-03-25 12:32:26.626512', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('995', '2021-03-25 12:32:26.632040', '2021-03-25 12:32:26.632040', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('996', '2021-03-25 12:32:28.407327', '2021-03-25 12:32:28.407327', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('997', '2021-03-25 12:32:28.518957', '2021-03-25 12:32:28.518957', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('998', '2021-03-25 12:32:30.855652', '2021-03-25 12:32:30.855652', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('999', '2021-03-25 12:32:30.857634', '2021-03-25 12:32:30.857634', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1000', '2021-03-25 12:32:35.784259', '2021-03-25 12:32:35.784259', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1001', '2021-03-25 12:32:35.790492', '2021-03-25 12:32:35.790492', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1002', '2021-03-25 12:32:37.023129', '2021-03-25 12:32:37.023129', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1003', '2021-03-25 12:32:37.028328', '2021-03-25 12:32:37.028328', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1004', '2021-03-25 12:32:37.345432', '2021-03-25 12:32:37.345432', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1005', '2021-03-25 12:32:37.354582', '2021-03-25 12:32:37.354582', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1006', '2021-03-25 12:32:37.365971', '2021-03-25 12:32:37.365971', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1007', '2021-03-25 12:32:37.373507', '2021-03-25 12:32:37.373507', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1008', '2021-03-25 12:32:41.030722', '2021-03-25 12:32:41.030722', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,61,62,63,98,65,99,100,59,101,60,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:18\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1009', '2021-03-25 12:32:41.042201', '2021-03-25 12:32:41.042201', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,61,62,63,98,65,99,100,59,101,60,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:18\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1010', '2021-03-25 12:32:41.285615', '2021-03-25 12:32:41.285615', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1011', '2021-03-25 12:32:41.291889', '2021-03-25 12:32:41.291889', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1012', '2021-03-25 12:32:42.905289', '2021-03-25 12:32:42.905289', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1013', '2021-03-25 12:32:42.907339', '2021-03-25 12:32:42.907339', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1014', '2021-03-25 12:32:43.126895', '2021-03-25 12:32:43.126895', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1015', '2021-03-25 12:32:43.135828', '2021-03-25 12:32:43.135828', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1016', '2021-03-25 12:32:44.557586', '2021-03-25 12:32:44.557586', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1017', '2021-03-25 12:32:44.558946', '2021-03-25 12:32:44.558946', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1018', '2021-03-25 12:32:46.027489', '2021-03-25 12:32:46.027489', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1019', '2021-03-25 12:32:46.028671', '2021-03-25 12:32:46.028671', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1020', '2021-03-25 12:32:46.707382', '2021-03-25 12:32:46.707382', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1021', '2021-03-25 12:32:49.611988', '2021-03-25 12:32:49.611988', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1022', '2021-03-25 12:32:49.614180', '2021-03-25 12:32:49.614180', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1023', '2021-03-25 12:32:55.559734', '2021-03-25 12:32:55.559734', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1024', '2021-03-25 12:32:55.565569', '2021-03-25 12:32:55.565569', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1025', '2021-03-25 12:33:11.078851', '2021-03-25 12:33:11.078851', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1026', '2021-03-25 12:33:11.084558', '2021-03-25 12:33:11.084558', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1027', '2021-03-25 12:33:11.261141', '2021-03-25 12:33:11.261141', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1028', '2021-03-25 12:33:11.267910', '2021-03-25 12:33:11.267910', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1029', '2021-03-25 12:33:11.281110', '2021-03-25 12:33:11.281110', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1030', '2021-03-25 12:33:11.286695', '2021-03-25 12:33:11.286695', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1031', '2021-03-25 12:33:13.679828', '2021-03-25 12:33:13.679828', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1032', '2021-03-25 12:33:13.685221', '2021-03-25 12:33:13.685221', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1033', '2021-03-25 12:33:14.867597', '2021-03-25 12:33:14.867597', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1034', '2021-03-25 12:33:16.907288', '2021-03-25 12:33:16.907288', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1035', '2021-03-25 12:33:16.914273', '2021-03-25 12:33:16.914273', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1036', '2021-03-25 12:33:28.563682', '2021-03-25 12:33:28.563682', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1037', '2021-03-25 12:33:28.578615', '2021-03-25 12:33:28.578615', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1038', '2021-03-25 12:33:38.120692', '2021-03-25 12:33:38.120692', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1039', '2021-03-25 12:33:41.691862', '2021-03-25 12:33:41.691862', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1040', '2021-03-25 12:33:41.722594', '2021-03-25 12:33:41.722594', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1041', '2021-03-25 12:33:45.306432', '2021-03-25 12:33:45.306432', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1042', '2021-03-25 12:33:45.309309', '2021-03-25 12:33:45.309309', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1043', '2021-03-25 12:33:49.658482', '2021-03-25 12:33:49.658482', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1044', '2021-03-25 12:34:10.691423', '2021-03-25 12:34:10.691423', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1045', '2021-03-25 12:34:10.692748', '2021-03-25 12:34:10.692748', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1046', '2021-03-25 12:34:10.724048', '2021-03-25 12:34:10.724048', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1047', '2021-03-25 12:34:10.725996', '2021-03-25 12:34:10.725996', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1048', '2021-03-25 12:34:15.895195', '2021-03-25 12:34:15.895195', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:30:43\"}');
INSERT INTO `base_sys_log` VALUES ('1049', '2021-03-25 12:34:15.896656', '2021-03-25 12:34:15.896656', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:30:43\"}');
INSERT INTO `base_sys_log` VALUES ('1050', '2021-03-25 12:34:16.388127', '2021-03-25 12:34:16.388127', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1051', '2021-03-25 12:34:16.389084', '2021-03-25 12:34:16.389084', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1052', '2021-03-25 12:34:25.483119', '2021-03-25 12:34:25.483119', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1053', '2021-03-25 12:34:25.488109', '2021-03-25 12:34:25.488109', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1054', '2021-03-25 12:34:28.274232', '2021-03-25 12:34:28.274232', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1055', '2021-03-25 12:34:28.279892', '2021-03-25 12:34:28.279892', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1056', '2021-03-25 12:34:28.291812', '2021-03-25 12:34:28.291812', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1057', '2021-03-25 12:34:28.297290', '2021-03-25 12:34:28.297290', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1058', '2021-03-25 12:34:33.800989', '2021-03-25 12:34:33.800989', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1059', '2021-03-25 12:34:33.807947', '2021-03-25 12:34:33.807947', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1060', '2021-03-25 12:34:37.147797', '2021-03-25 12:34:37.147797', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1061', '2021-03-25 12:34:37.155703', '2021-03-25 12:34:37.155703', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1062', '2021-03-25 12:34:38.733737', '2021-03-25 12:34:38.733737', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1063', '2021-03-25 12:34:38.735254', '2021-03-25 12:34:38.735254', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1064', '2021-03-25 12:34:38.739948', '2021-03-25 12:34:38.739948', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1065', '2021-03-25 12:34:38.760766', '2021-03-25 12:34:38.760766', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1066', '2021-03-25 12:34:38.766027', '2021-03-25 12:34:38.766027', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1067', '2021-03-25 12:34:38.767742', '2021-03-25 12:34:38.767742', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1068', '2021-03-25 12:35:05.766608', '2021-03-25 12:35:05.766608', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,2,27,97,100,59,101,61,60,62,63,98,65,99,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:41\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1069', '2021-03-25 12:35:05.782136', '2021-03-25 12:35:05.782136', '31', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,2,27,97,100,59,101,61,60,62,63,98,65,99,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:32:41\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1070', '2021-03-25 12:35:06.190390', '2021-03-25 12:35:06.190390', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1071', '2021-03-25 12:35:06.199707', '2021-03-25 12:35:06.199707', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1072', '2021-03-25 12:35:07.233576', '2021-03-25 12:35:07.233576', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1073', '2021-03-25 12:35:07.241366', '2021-03-25 12:35:07.241366', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1074', '2021-03-25 12:35:07.572489', '2021-03-25 12:35:07.572489', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1075', '2021-03-25 12:35:07.574037', '2021-03-25 12:35:07.574037', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1076', '2021-03-25 12:35:07.587166', '2021-03-25 12:35:07.587166', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1077', '2021-03-25 12:35:07.588168', '2021-03-25 12:35:07.588168', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1078', '2021-03-25 12:35:21.860323', '2021-03-25 12:35:21.860323', '1', '/admin/base/sys/param/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1079', '2021-03-25 12:35:21.861386', '2021-03-25 12:35:21.861386', '1', '/admin/base/sys/param/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1080', '2021-03-25 12:35:34.282468', '2021-03-25 12:35:34.282468', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1081', '2021-03-25 12:35:34.283331', '2021-03-25 12:35:34.283331', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1082', '2021-03-25 12:35:34.589038', '2021-03-25 12:35:34.589038', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1083', '2021-03-25 12:35:34.589901', '2021-03-25 12:35:34.589901', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1084', '2021-03-25 12:35:34.615236', '2021-03-25 12:35:34.615236', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1085', '2021-03-25 12:35:34.618060', '2021-03-25 12:35:34.618060', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1086', '2021-03-25 12:35:37.213279', '2021-03-25 12:35:37.213279', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:35:05\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1087', '2021-03-25 12:35:37.215150', '2021-03-25 12:35:37.215150', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:35:05\",\"userId\":\"31\"}');
INSERT INTO `base_sys_log` VALUES ('1088', '2021-03-25 12:35:37.481957', '2021-03-25 12:35:37.481957', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1089', '2021-03-25 12:35:37.483598', '2021-03-25 12:35:37.483598', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1090', '2021-03-25 12:35:43.443688', '2021-03-25 12:35:43.443688', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1091', '2021-03-25 12:35:43.445459', '2021-03-25 12:35:43.445459', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1092', '2021-03-25 12:35:43.714001', '2021-03-25 12:35:43.714001', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1093', '2021-03-25 12:35:43.722707', '2021-03-25 12:35:43.722707', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1094', '2021-03-25 12:35:52.407801', '2021-03-25 12:35:52.407801', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1095', '2021-03-25 12:35:52.408521', '2021-03-25 12:35:52.408521', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1096', '2021-03-25 12:35:52.724700', '2021-03-25 12:35:52.724700', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1097', '2021-03-25 12:35:52.725364', '2021-03-25 12:35:52.725364', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1098', '2021-03-25 12:35:52.728563', '2021-03-25 12:35:52.728563', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1099', '2021-03-25 12:35:52.729493', '2021-03-25 12:35:52.729493', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1100', '2021-03-25 12:36:06.193399', '2021-03-25 12:36:06.193399', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1101', '2021-03-25 12:36:06.195694', '2021-03-25 12:36:06.195694', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1102', '2021-03-25 12:36:06.453132', '2021-03-25 12:36:06.453132', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1103', '2021-03-25 12:36:06.462109', '2021-03-25 12:36:06.462109', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1104', '2021-03-25 12:36:09.778168', '2021-03-25 12:36:09.778168', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1105', '2021-03-25 12:36:13.644845', '2021-03-25 12:36:13.644845', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1106', '2021-03-25 12:36:13.647113', '2021-03-25 12:36:13.647113', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1107', '2021-03-25 12:36:25.727775', '2021-03-25 12:36:25.727775', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1108', '2021-03-25 12:36:25.728583', '2021-03-25 12:36:25.728583', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1109', '2021-03-25 12:36:29.325833', '2021-03-25 12:36:29.325833', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1110', '2021-03-25 12:36:29.326515', '2021-03-25 12:36:29.326515', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1111', '2021-03-25 12:36:29.341807', '2021-03-25 12:36:29.341807', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1112', '2021-03-25 12:36:29.342535', '2021-03-25 12:36:29.342535', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1113', '2021-03-25 12:36:32.424216', '2021-03-25 12:36:32.424216', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:34:15\"}');
INSERT INTO `base_sys_log` VALUES ('1114', '2021-03-25 12:36:32.426610', '2021-03-25 12:36:32.426610', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:34:15\"}');
INSERT INTO `base_sys_log` VALUES ('1115', '2021-03-25 12:36:32.684270', '2021-03-25 12:36:32.684270', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1116', '2021-03-25 12:36:32.685049', '2021-03-25 12:36:32.685049', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1117', '2021-03-25 12:36:35.707617', '2021-03-25 12:36:35.707617', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1118', '2021-03-25 12:36:35.711715', '2021-03-25 12:36:35.711715', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1119', '2021-03-25 12:36:35.917704', '2021-03-25 12:36:35.917704', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1120', '2021-03-25 12:36:35.918505', '2021-03-25 12:36:35.918505', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1121', '2021-03-25 12:36:48.405022', '2021-03-25 12:36:48.405022', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1122', '2021-03-25 12:36:48.405971', '2021-03-25 12:36:48.405971', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1123', '2021-03-25 12:36:48.407525', '2021-03-25 12:36:48.407525', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1124', '2021-03-25 12:36:48.408257', '2021-03-25 12:36:48.408257', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1125', '2021-03-25 12:36:52.233753', '2021-03-25 12:36:52.233753', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1126', '2021-03-25 12:36:52.235379', '2021-03-25 12:36:52.235379', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1127', '2021-03-25 12:36:52.255971', '2021-03-25 12:36:52.255971', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1128', '2021-03-25 12:36:52.256648', '2021-03-25 12:36:52.256648', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1129', '2021-03-25 12:36:53.738174', '2021-03-25 12:36:53.738174', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1130', '2021-03-25 12:36:53.738910', '2021-03-25 12:36:53.738910', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1131', '2021-03-25 12:36:54.077027', '2021-03-25 12:36:54.077027', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1132', '2021-03-25 12:36:54.077713', '2021-03-25 12:36:54.077713', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1133', '2021-03-25 12:36:56.700280', '2021-03-25 12:36:56.700280', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1134', '2021-03-25 12:36:56.702595', '2021-03-25 12:36:56.702595', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1135', '2021-03-25 12:36:56.942812', '2021-03-25 12:36:56.942812', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1136', '2021-03-25 12:36:56.943804', '2021-03-25 12:36:56.943804', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1137', '2021-03-25 12:36:56.969665', '2021-03-25 12:36:56.969665', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1138', '2021-03-25 12:36:56.971431', '2021-03-25 12:36:56.971431', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1139', '2021-03-25 12:36:59.016022', '2021-03-25 12:36:59.016022', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1140', '2021-03-25 12:36:59.017102', '2021-03-25 12:36:59.017102', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1141', '2021-03-25 12:37:00.797663', '2021-03-25 12:37:00.797663', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1142', '2021-03-25 12:37:00.798429', '2021-03-25 12:37:00.798429', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1143', '2021-03-25 12:37:01.110257', '2021-03-25 12:37:01.110257', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1144', '2021-03-25 12:37:01.111009', '2021-03-25 12:37:01.111009', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1145', '2021-03-25 12:37:17.905542', '2021-03-25 12:37:17.905542', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:30:16\"}');
INSERT INTO `base_sys_log` VALUES ('1146', '2021-03-25 12:37:17.906272', '2021-03-25 12:37:17.906272', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:30:16\"}');
INSERT INTO `base_sys_log` VALUES ('1147', '2021-03-25 12:37:18.169172', '2021-03-25 12:37:18.169172', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1148', '2021-03-25 12:37:18.169963', '2021-03-25 12:37:18.169963', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1149', '2021-03-25 12:37:19.752779', '2021-03-25 12:37:19.752779', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1150', '2021-03-25 12:37:19.756363', '2021-03-25 12:37:19.756363', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1151', '2021-03-25 12:37:19.953718', '2021-03-25 12:37:19.953718', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1152', '2021-03-25 12:37:19.954449', '2021-03-25 12:37:19.954449', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1153', '2021-03-25 12:37:19.995134', '2021-03-25 12:37:19.995134', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1154', '2021-03-25 12:37:19.997195', '2021-03-25 12:37:19.997195', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1155', '2021-03-25 12:37:22.643383', '2021-03-25 12:37:22.643383', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1156', '2021-03-25 12:37:22.644605', '2021-03-25 12:37:22.644605', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1157', '2021-03-25 12:37:31.646304', '2021-03-25 12:37:31.646304', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1158', '2021-03-25 12:37:31.648973', '2021-03-25 12:37:31.648973', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1159', '2021-03-25 12:37:31.863744', '2021-03-25 12:37:31.863744', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1160', '2021-03-25 12:37:31.873118', '2021-03-25 12:37:31.873118', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1161', '2021-03-25 12:37:32.605195', '2021-03-25 12:37:32.605195', '31', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1162', '2021-03-25 12:37:32.613915', '2021-03-25 12:37:32.613915', '31', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1163', '2021-03-25 12:37:33.978675', '2021-03-25 12:37:33.978675', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1164', '2021-03-25 12:37:33.985795', '2021-03-25 12:37:33.985795', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1165', '2021-03-25 12:37:33.996752', '2021-03-25 12:37:33.996752', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1166', '2021-03-25 12:37:34.003494', '2021-03-25 12:37:34.003494', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1167', '2021-03-25 12:37:40.075357', '2021-03-25 12:37:40.075357', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1168', '2021-03-25 12:37:40.077970', '2021-03-25 12:37:40.077970', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1169', '2021-03-25 12:37:41.440665', '2021-03-25 12:37:41.440665', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1170', '2021-03-25 12:37:41.443307', '2021-03-25 12:37:41.443307', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1171', '2021-03-25 12:37:43.527652', '2021-03-25 12:37:43.527652', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1172', '2021-03-25 12:37:43.529403', '2021-03-25 12:37:43.529403', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1173', '2021-03-25 12:37:44.938230', '2021-03-25 12:37:44.938230', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1174', '2021-03-25 12:37:44.942257', '2021-03-25 12:37:44.942257', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1175', '2021-03-25 12:37:47.868499', '2021-03-25 12:37:47.868499', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1176', '2021-03-25 12:37:47.872444', '2021-03-25 12:37:47.872444', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1177', '2021-03-25 12:37:48.737485', '2021-03-25 12:37:48.737485', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1178', '2021-03-25 12:37:48.744965', '2021-03-25 12:37:48.744965', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1179', '2021-03-25 12:38:10.538609', '2021-03-25 12:38:10.538609', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1180', '2021-03-25 12:38:10.539222', '2021-03-25 12:38:10.539222', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1181', '2021-03-25 12:38:10.548449', '2021-03-25 12:38:10.548449', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1182', '2021-03-25 12:38:10.558840', '2021-03-25 12:38:10.558840', '31', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1183', '2021-03-25 12:38:10.563117', '2021-03-25 12:38:10.563117', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1184', '2021-03-25 12:38:10.564534', '2021-03-25 12:38:10.564534', '31', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1185', '2021-03-25 12:38:19.965227', '2021-03-25 12:38:19.965227', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1186', '2021-03-25 12:38:19.967090', '2021-03-25 12:38:19.967090', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1187', '2021-03-25 12:38:23.690400', '2021-03-25 12:38:23.690400', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1188', '2021-03-25 12:38:23.694216', '2021-03-25 12:38:23.694216', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1189', '2021-03-25 12:38:26.392482', '2021-03-25 12:38:26.392482', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1190', '2021-03-25 12:38:26.396049', '2021-03-25 12:38:26.396049', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1191', '2021-03-25 12:38:38.610148', '2021-03-25 12:38:38.610148', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1192', '2021-03-25 12:38:38.610874', '2021-03-25 12:38:38.610874', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1193', '2021-03-25 12:38:45.063917', '2021-03-25 12:38:45.063917', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1194', '2021-03-25 12:38:45.064601', '2021-03-25 12:38:45.064601', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1195', '2021-03-25 12:38:45.373458', '2021-03-25 12:38:45.373458', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1196', '2021-03-25 12:38:45.374337', '2021-03-25 12:38:45.374337', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1197', '2021-03-25 12:38:45.376096', '2021-03-25 12:38:45.376096', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1198', '2021-03-25 12:38:45.378537', '2021-03-25 12:38:45.378537', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1199', '2021-03-25 12:38:57.803096', '2021-03-25 12:38:57.803096', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[1,11,14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 12:21:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1200', '2021-03-25 12:38:57.805707', '2021-03-25 12:38:57.805707', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":1,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[1,11,14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 12:21:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1201', '2021-03-25 12:38:58.047877', '2021-03-25 12:38:58.047877', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1202', '2021-03-25 12:38:58.049277', '2021-03-25 12:38:58.049277', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1203', '2021-03-25 12:39:03.320720', '2021-03-25 12:39:03.320720', '31', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1204', '2021-03-25 12:39:03.322271', '2021-03-25 12:39:03.322271', '31', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1205', '2021-03-25 12:39:03.553927', '2021-03-25 12:39:03.553927', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1206', '2021-03-25 12:39:03.561637', '2021-03-25 12:39:03.561637', '31', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1207', '2021-03-25 12:39:04.471589', '2021-03-25 12:39:04.471589', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1208', '2021-03-25 12:39:04.478018', '2021-03-25 12:39:04.478018', '31', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1209', '2021-03-25 12:39:04.489329', '2021-03-25 12:39:04.489329', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1210', '2021-03-25 12:39:04.494657', '2021-03-25 12:39:04.494657', '31', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1211', '2021-03-25 12:39:05.039863', '2021-03-25 12:39:05.039863', '31', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1212', '2021-03-25 12:39:05.051222', '2021-03-25 12:39:05.051222', '31', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1213', '2021-03-25 12:39:12.365295', '2021-03-25 12:39:12.365295', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1214', '2021-03-25 12:39:12.378091', '2021-03-25 12:39:12.378091', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1215', '2021-03-25 12:39:15.964349', '2021-03-25 12:39:15.964349', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1216', '2021-03-25 12:39:15.967941', '2021-03-25 12:39:15.967941', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1217', '2021-03-25 12:44:58.690100', '2021-03-25 12:44:58.690100', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1218', '2021-03-25 12:44:58.696140', '2021-03-25 12:44:58.696140', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1219', '2021-03-25 12:45:01.329051', '2021-03-25 12:45:01.329051', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1220', '2021-03-25 12:45:01.331222', '2021-03-25 12:45:01.331222', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1221', '2021-03-25 12:45:05.977732', '2021-03-25 12:45:05.977732', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1222', '2021-03-25 12:45:05.983167', '2021-03-25 12:45:05.983167', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1223', '2021-03-25 12:45:08.268676', '2021-03-25 12:45:08.268676', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1224', '2021-03-25 12:45:08.275789', '2021-03-25 12:45:08.275789', '32', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1225', '2021-03-25 17:33:48.510801', '2021-03-25 17:33:48.510801', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('1226', '2021-03-25 17:33:51.639872', '2021-03-25 17:33:51.639872', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"33c09770-8d4d-11eb-8543-9f1fe3295e77\",\"verifyCode\":\"0287\"}');
INSERT INTO `base_sys_log` VALUES ('1227', '2021-03-25 17:33:51.720811', '2021-03-25 17:33:51.720811', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1228', '2021-03-25 17:33:51.738154', '2021-03-25 17:33:51.738154', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1229', '2021-03-25 17:33:53.548452', '2021-03-25 17:33:53.548452', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1230', '2021-03-25 17:33:53.549425', '2021-03-25 17:33:53.549425', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1231', '2021-03-25 17:33:53.577608', '2021-03-25 17:33:53.577608', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1232', '2021-03-25 17:33:53.579092', '2021-03-25 17:33:53.579092', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1233', '2021-03-25 17:34:08.651416', '2021-03-25 17:34:08.651416', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1234', '2021-03-25 17:34:08.652298', '2021-03-25 17:34:08.652298', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1235', '2021-03-25 17:34:11.557332', '2021-03-25 17:34:11.557332', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1236', '2021-03-25 17:34:11.558359', '2021-03-25 17:34:11.558359', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1237', '2021-03-25 17:34:11.857443', '2021-03-25 17:34:11.857443', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1238', '2021-03-25 17:34:11.858477', '2021-03-25 17:34:11.858477', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1239', '2021-03-25 17:34:29.343700', '2021-03-25 17:34:29.343700', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1240', '2021-03-25 17:34:29.345378', '2021-03-25 17:34:29.345378', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1241', '2021-03-25 17:34:29.603558', '2021-03-25 17:34:29.603558', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1242', '2021-03-25 17:34:29.604588', '2021-03-25 17:34:29.604588', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1243', '2021-03-25 17:34:33.997491', '2021-03-25 17:34:33.997491', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1244', '2021-03-25 17:34:33.998479', '2021-03-25 17:34:33.998479', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1245', '2021-03-25 17:34:34.317662', '2021-03-25 17:34:34.317662', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1246', '2021-03-25 17:34:34.318611', '2021-03-25 17:34:34.318611', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1247', '2021-03-25 17:34:51.946485', '2021-03-25 17:34:51.946485', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1248', '2021-03-25 17:34:51.947665', '2021-03-25 17:34:51.947665', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1249', '2021-03-25 17:35:01.462713', '2021-03-25 17:35:01.462713', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1250', '2021-03-25 17:35:01.463779', '2021-03-25 17:35:01.463779', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 12:37:17\"}');
INSERT INTO `base_sys_log` VALUES ('1251', '2021-03-25 17:35:01.973323', '2021-03-25 17:35:01.973323', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1252', '2021-03-25 17:35:01.974111', '2021-03-25 17:35:01.974111', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1253', '2021-03-25 17:35:03.990696', '2021-03-25 17:35:03.990696', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1254', '2021-03-25 17:35:03.991890', '2021-03-25 17:35:03.991890', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1255', '2021-03-25 17:35:04.304729', '2021-03-25 17:35:04.304729', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1256', '2021-03-25 17:35:04.306859', '2021-03-25 17:35:04.306859', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1257', '2021-03-25 17:35:06.503973', '2021-03-25 17:35:06.503973', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:01\"}');
INSERT INTO `base_sys_log` VALUES ('1258', '2021-03-25 17:35:06.505997', '2021-03-25 17:35:06.505997', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:01\"}');
INSERT INTO `base_sys_log` VALUES ('1259', '2021-03-25 17:35:06.748105', '2021-03-25 17:35:06.748105', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1260', '2021-03-25 17:35:06.748991', '2021-03-25 17:35:06.748991', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1261', '2021-03-25 17:35:22.332605', '2021-03-25 17:35:22.332605', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMTIiXSwidXNlcm5hbWUiOiJnY3NhIiwidXNlcklkIjozMiwicGFzc3dvcmRWZXJzaW9uIjoxLCJpYXQiOjE2MTY2NDY1MTUsImV4cCI6MTYxNzk0MjUxNX0.neoXkfgn2O3lh6Xf9rkyqdo2UfRiQpYf5fUOXTGo3h4\"}');
INSERT INTO `base_sys_log` VALUES ('1262', '2021-03-25 17:35:22.371483', '2021-03-25 17:35:22.371483', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1263', '2021-03-25 17:35:22.373590', '2021-03-25 17:35:22.373590', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1264', '2021-03-25 17:35:28.774547', '2021-03-25 17:35:28.774547', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1265', '2021-03-25 17:35:28.780618', '2021-03-25 17:35:28.780618', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1266', '2021-03-25 17:35:29.535557', '2021-03-25 17:35:29.535557', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1267', '2021-03-25 17:35:29.538369', '2021-03-25 17:35:29.538369', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1268', '2021-03-25 17:35:39.034971', '2021-03-25 17:35:39.034971', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1269', '2021-03-25 17:35:39.048653', '2021-03-25 17:35:39.048653', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1270', '2021-03-25 17:35:40.637027', '2021-03-25 17:35:40.637027', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1271', '2021-03-25 17:35:40.643344', '2021-03-25 17:35:40.643344', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1272', '2021-03-25 17:35:42.571723', '2021-03-25 17:35:42.571723', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1273', '2021-03-25 17:35:42.575769', '2021-03-25 17:35:42.575769', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1274', '2021-03-25 17:35:48.707787', '2021-03-25 17:35:48.707787', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1275', '2021-03-25 17:35:48.708679', '2021-03-25 17:35:48.708679', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1276', '2021-03-25 17:35:49.008955', '2021-03-25 17:35:49.008955', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1277', '2021-03-25 17:35:49.009903', '2021-03-25 17:35:49.009903', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1278', '2021-03-25 17:36:11.173668', '2021-03-25 17:36:11.173668', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1279', '2021-03-25 17:36:11.174710', '2021-03-25 17:36:11.174710', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update,base:sys:department:order\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1280', '2021-03-25 17:36:20.325522', '2021-03-25 17:36:20.325522', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1281', '2021-03-25 17:36:20.327640', '2021-03-25 17:36:20.327640', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:info,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1282', '2021-03-25 17:36:25.670456', '2021-03-25 17:36:25.670456', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1283', '2021-03-25 17:36:25.671976', '2021-03-25 17:36:25.671976', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:page,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1284', '2021-03-25 17:36:30.917883', '2021-03-25 17:36:30.917883', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1285', '2021-03-25 17:36:30.919236', '2021-03-25 17:36:30.919236', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:35:06\"}');
INSERT INTO `base_sys_log` VALUES ('1286', '2021-03-25 17:36:31.410911', '2021-03-25 17:36:31.410911', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1287', '2021-03-25 17:36:31.412163', '2021-03-25 17:36:31.412163', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1288', '2021-03-25 17:36:40.579200', '2021-03-25 17:36:40.579200', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1289', '2021-03-25 17:36:40.582731', '2021-03-25 17:36:40.582731', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1290', '2021-03-25 17:36:45.486091', '2021-03-25 17:36:45.486091', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1291', '2021-03-25 17:36:45.491215', '2021-03-25 17:36:45.491215', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1292', '2021-03-25 17:36:47.092037', '2021-03-25 17:36:47.092037', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1293', '2021-03-25 17:36:47.092858', '2021-03-25 17:36:47.092858', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1294', '2021-03-25 17:36:47.397155', '2021-03-25 17:36:47.397155', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1295', '2021-03-25 17:36:47.398259', '2021-03-25 17:36:47.398259', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1296', '2021-03-25 17:36:49.142554', '2021-03-25 17:36:49.142554', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:30\"}');
INSERT INTO `base_sys_log` VALUES ('1297', '2021-03-25 17:36:49.143594', '2021-03-25 17:36:49.143594', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:30\"}');
INSERT INTO `base_sys_log` VALUES ('1298', '2021-03-25 17:36:49.404666', '2021-03-25 17:36:49.404666', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1299', '2021-03-25 17:36:49.405486', '2021-03-25 17:36:49.405486', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1300', '2021-03-25 17:36:52.617674', '2021-03-25 17:36:52.617674', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1301', '2021-03-25 17:36:52.619542', '2021-03-25 17:36:52.619542', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1302', '2021-03-25 17:36:54.180223', '2021-03-25 17:36:54.180223', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1303', '2021-03-25 17:36:54.187901', '2021-03-25 17:36:54.187901', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1304', '2021-03-25 17:36:54.197382', '2021-03-25 17:36:54.197382', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1305', '2021-03-25 17:36:54.203122', '2021-03-25 17:36:54.203122', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1306', '2021-03-25 17:37:00.497253', '2021-03-25 17:37:00.497253', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1307', '2021-03-25 17:37:00.503784', '2021-03-25 17:37:00.503784', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1308', '2021-03-25 17:37:01.182741', '2021-03-25 17:37:01.182741', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1309', '2021-03-25 17:37:01.188810', '2021-03-25 17:37:01.188810', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1310', '2021-03-25 17:37:02.127976', '2021-03-25 17:37:02.127976', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1311', '2021-03-25 17:37:02.136642', '2021-03-25 17:37:02.136642', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1312', '2021-03-25 17:37:02.437258', '2021-03-25 17:37:02.437258', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1313', '2021-03-25 17:37:02.442160', '2021-03-25 17:37:02.442160', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1314', '2021-03-25 17:37:03.504792', '2021-03-25 17:37:03.504792', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1315', '2021-03-25 17:37:03.509643', '2021-03-25 17:37:03.509643', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1316', '2021-03-25 17:37:43.284156', '2021-03-25 17:37:43.284156', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1317', '2021-03-25 17:37:43.289807', '2021-03-25 17:37:43.289807', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1318', '2021-03-25 17:37:45.300450', '2021-03-25 17:37:45.300450', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1319', '2021-03-25 17:37:45.306318', '2021-03-25 17:37:45.306318', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[1,11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1320', '2021-03-25 17:37:48.343018', '2021-03-25 17:37:48.343018', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1321', '2021-03-25 17:37:48.346792', '2021-03-25 17:37:48.346792', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1322', '2021-03-25 17:38:26.471579', '2021-03-25 17:38:26.471579', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1323', '2021-03-25 17:38:26.472535', '2021-03-25 17:38:26.472535', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1324', '2021-03-25 17:38:26.490471', '2021-03-25 17:38:26.490471', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1325', '2021-03-25 17:38:26.493211', '2021-03-25 17:38:26.493211', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1326', '2021-03-25 17:38:41.384385', '2021-03-25 17:38:41.384385', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1327', '2021-03-25 17:38:41.385355', '2021-03-25 17:38:41.385355', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1328', '2021-03-25 17:38:56.261472', '2021-03-25 17:38:56.261472', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1329', '2021-03-25 17:38:56.262586', '2021-03-25 17:38:56.262586', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1330', '2021-03-25 17:38:56.534282', '2021-03-25 17:38:56.534282', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1331', '2021-03-25 17:38:56.536513', '2021-03-25 17:38:56.536513', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1332', '2021-03-25 17:39:00.754848', '2021-03-25 17:39:00.754848', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1333', '2021-03-25 17:39:00.757145', '2021-03-25 17:39:00.757145', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1334', '2021-03-25 17:39:01.063018', '2021-03-25 17:39:01.063018', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1335', '2021-03-25 17:39:01.061508', '2021-03-25 17:39:01.061508', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1336', '2021-03-25 17:39:09.514644', '2021-03-25 17:39:09.514644', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1337', '2021-03-25 17:39:09.515637', '2021-03-25 17:39:09.515637', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1338', '2021-03-25 17:39:33.439751', '2021-03-25 17:39:33.439751', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1339', '2021-03-25 17:39:33.443768', '2021-03-25 17:39:33.443768', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户列表\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:36:49\"}');
INSERT INTO `base_sys_log` VALUES ('1340', '2021-03-25 17:39:33.910053', '2021-03-25 17:39:33.910053', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1341', '2021-03-25 17:39:33.911514', '2021-03-25 17:39:33.911514', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1342', '2021-03-25 17:39:35.482220', '2021-03-25 17:39:35.482220', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1343', '2021-03-25 17:39:35.483174', '2021-03-25 17:39:35.483174', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1344', '2021-03-25 17:39:35.796571', '2021-03-25 17:39:35.796571', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1345', '2021-03-25 17:39:35.797887', '2021-03-25 17:39:35.797887', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1346', '2021-03-25 17:39:40.197689', '2021-03-25 17:39:40.197689', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:39:33\"}');
INSERT INTO `base_sys_log` VALUES ('1347', '2021-03-25 17:39:40.198852', '2021-03-25 17:39:40.198852', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户列表\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-25 17:39:33\"}');
INSERT INTO `base_sys_log` VALUES ('1348', '2021-03-25 17:39:40.452698', '2021-03-25 17:39:40.452698', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1349', '2021-03-25 17:39:40.453945', '2021-03-25 17:39:40.453945', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1350', '2021-03-25 17:39:49.861397', '2021-03-25 17:39:49.861397', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1351', '2021-03-25 17:39:49.871295', '2021-03-25 17:39:49.871295', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1352', '2021-03-25 17:39:51.168381', '2021-03-25 17:39:51.168381', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1353', '2021-03-25 17:39:51.174065', '2021-03-25 17:39:51.174065', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1354', '2021-03-25 17:39:51.212990', '2021-03-25 17:39:51.212990', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1355', '2021-03-25 17:39:51.218303', '2021-03-25 17:39:51.218303', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1356', '2021-03-25 17:39:52.483450', '2021-03-25 17:39:52.483450', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1357', '2021-03-25 17:39:52.492029', '2021-03-25 17:39:52.492029', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1358', '2021-03-25 17:40:00.735220', '2021-03-25 17:40:00.735220', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1359', '2021-03-25 17:40:00.739927', '2021-03-25 17:40:00.739927', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1360', '2021-03-25 17:40:01.656109', '2021-03-25 17:40:01.656109', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1361', '2021-03-25 17:40:01.665272', '2021-03-25 17:40:01.665272', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1362', '2021-03-25 17:40:01.921246', '2021-03-25 17:40:01.921246', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1363', '2021-03-25 17:40:01.931283', '2021-03-25 17:40:01.931283', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1364', '2021-03-25 17:40:02.495922', '2021-03-25 17:40:02.495922', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1365', '2021-03-25 17:40:02.502419', '2021-03-25 17:40:02.502419', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1366', '2021-03-25 17:40:03.124829', '2021-03-25 17:40:03.124829', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1367', '2021-03-25 17:40:03.130515', '2021-03-25 17:40:03.130515', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1368', '2021-03-25 17:40:03.378711', '2021-03-25 17:40:03.378711', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1369', '2021-03-25 17:40:03.383883', '2021-03-25 17:40:03.383883', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1370', '2021-03-25 17:40:03.723179', '2021-03-25 17:40:03.723179', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1371', '2021-03-25 17:40:03.729412', '2021-03-25 17:40:03.729412', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1372', '2021-03-25 17:40:04.302961', '2021-03-25 17:40:04.302961', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1373', '2021-03-25 17:40:04.307760', '2021-03-25 17:40:04.307760', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1374', '2021-03-25 17:40:04.557679', '2021-03-25 17:40:04.557679', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1375', '2021-03-25 17:40:04.563363', '2021-03-25 17:40:04.563363', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1376', '2021-03-25 17:40:04.569756', '2021-03-25 17:40:04.569756', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1377', '2021-03-25 17:40:04.603461', '2021-03-25 17:40:04.603461', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1378', '2021-03-25 17:40:05.092976', '2021-03-25 17:40:05.092976', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1379', '2021-03-25 17:40:05.098291', '2021-03-25 17:40:05.098291', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1380', '2021-03-25 17:40:08.897115', '2021-03-25 17:40:08.897115', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1381', '2021-03-25 17:40:08.904492', '2021-03-25 17:40:08.904492', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1382', '2021-03-25 17:44:49.580826', '2021-03-25 17:44:49.580826', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('1383', '2021-03-25 17:44:52.666883', '2021-03-25 17:44:52.666883', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1384', '2021-03-25 17:44:55.567061', '2021-03-25 17:44:55.567061', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('1385', '2021-03-25 17:45:26.887851', '2021-03-25 17:45:26.887851', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1386', '2021-03-25 17:45:26.894447', '2021-03-25 17:45:26.894447', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1387', '2021-03-25 17:45:27.984636', '2021-03-25 17:45:27.984636', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1388', '2021-03-25 17:45:27.990822', '2021-03-25 17:45:27.990822', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1389', '2021-03-25 17:45:43.869191', '2021-03-25 17:45:43.869191', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1390', '2021-03-25 17:45:43.874088', '2021-03-25 17:45:43.874088', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1391', '2021-03-25 17:45:45.308257', '2021-03-25 17:45:45.308257', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1392', '2021-03-25 17:45:45.316958', '2021-03-25 17:45:45.316958', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1393', '2021-03-25 17:46:19.431549', '2021-03-25 17:46:19.431549', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1394', '2021-03-25 17:46:19.433216', '2021-03-25 17:46:19.433216', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1395', '2021-03-25 17:46:21.166441', '2021-03-25 17:46:21.166441', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1396', '2021-03-25 17:46:21.167589', '2021-03-25 17:46:21.167589', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1397', '2021-03-25 17:46:25.879227', '2021-03-25 17:46:25.879227', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1398', '2021-03-25 17:46:25.880233', '2021-03-25 17:46:25.880233', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1399', '2021-03-25 17:46:46.529848', '2021-03-25 17:46:46.529848', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"客户小绿\",\"nickName\":\"客户小绿\",\"username\":\"客户小绿\",\"roleIdList\":[11],\"status\":1,\"departmentId\":15}');
INSERT INTO `base_sys_log` VALUES ('1400', '2021-03-25 17:46:46.531509', '2021-03-25 17:46:46.531509', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"客户小绿\",\"nickName\":\"客户小绿\",\"username\":\"客户小绿\",\"roleIdList\":[11],\"status\":1,\"departmentId\":15}');
INSERT INTO `base_sys_log` VALUES ('1401', '2021-03-25 17:46:47.072047', '2021-03-25 17:46:47.072047', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1402', '2021-03-25 17:46:47.074141', '2021-03-25 17:46:47.074141', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1403', '2021-03-25 17:46:52.254378', '2021-03-25 17:46:52.254378', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1404', '2021-03-25 17:46:52.255460', '2021-03-25 17:46:52.255460', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1405', '2021-03-25 17:46:52.569701', '2021-03-25 17:46:52.569701', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1406', '2021-03-25 17:46:52.570628', '2021-03-25 17:46:52.570628', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1407', '2021-03-25 17:46:59.970773', '2021-03-25 17:46:59.970773', '1', '/admin/base/sys/user/update', '127.0.0.1', '本机地址', '{\"headImg\":null,\"name\":\"客户小绿\",\"nickName\":\"客户小绿\",\"username\":\"khxiaolv\",\"roleIdList\":[11],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":33,\"createTime\":\"2021-03-25 17:46:46\",\"updateTime\":\"2021-03-25 17:46:46\",\"departmentId\":\"15\",\"pid\":\"1\",\"passwordV\":1,\"departmentName\":\"客户\"}');
INSERT INTO `base_sys_log` VALUES ('1408', '2021-03-25 17:46:59.973165', '2021-03-25 17:46:59.973165', '1', '/admin/base/sys/user/update', '127.0.0.1', '本机地址', '{\"headImg\":null,\"name\":\"客户小绿\",\"nickName\":\"客户小绿\",\"username\":\"khxiaolv\",\"roleIdList\":[11],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":33,\"createTime\":\"2021-03-25 17:46:46\",\"updateTime\":\"2021-03-25 17:46:46\",\"departmentId\":\"15\",\"pid\":\"1\",\"passwordV\":1,\"departmentName\":\"客户\"}');
INSERT INTO `base_sys_log` VALUES ('1409', '2021-03-25 17:47:00.223287', '2021-03-25 17:47:00.223287', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1410', '2021-03-25 17:47:00.224668', '2021-03-25 17:47:00.224668', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1411', '2021-03-25 17:47:07.148542', '2021-03-25 17:47:07.148542', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"khxiaolv\",\"password\":\"123456\",\"captchaId\":\"c15794c0-8d4e-11eb-b994-25dce257495a\",\"verifyCode\":\"1510\"}');
INSERT INTO `base_sys_log` VALUES ('1412', '2021-03-25 17:47:07.176080', '2021-03-25 17:47:07.176080', '33', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1413', '2021-03-25 17:47:07.436655', '2021-03-25 17:47:07.436655', '33', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1414', '2021-03-25 17:47:09.370458', '2021-03-25 17:47:09.370458', '33', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1415', '2021-03-25 17:47:09.376802', '2021-03-25 17:47:09.376802', '33', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1416', '2021-03-25 21:46:35.266105', '2021-03-25 21:46:35.266105', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1417', '2021-03-25 21:46:35.279359', '2021-03-25 21:46:35.279359', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1418', '2021-03-25 21:46:35.854236', '2021-03-25 21:46:35.854236', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1419', '2021-03-25 21:46:35.861184', '2021-03-25 21:46:35.861184', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1420', '2021-03-25 21:46:35.958207', '2021-03-25 21:46:35.958207', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1421', '2021-03-25 21:46:35.982470', '2021-03-25 21:46:35.982470', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1422', '2021-03-25 21:52:08.229460', '2021-03-25 21:52:08.229460', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1423', '2021-03-25 21:52:08.243036', '2021-03-25 21:52:08.243036', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1424', '2021-03-25 21:52:10.644592', '2021-03-25 21:52:10.644592', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1425', '2021-03-25 21:52:10.650903', '2021-03-25 21:52:10.650903', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1426', '2021-03-25 21:52:19.506816', '2021-03-25 21:52:19.506816', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1427', '2021-03-25 21:52:19.512153', '2021-03-25 21:52:19.512153', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1428', '2021-03-25 21:52:23.460256', '2021-03-25 21:52:23.460256', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1429', '2021-03-25 21:52:23.465593', '2021-03-25 21:52:23.465593', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1430', '2021-03-25 21:52:23.804242', '2021-03-25 21:52:23.804242', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1431', '2021-03-25 21:52:23.812593', '2021-03-25 21:52:23.812593', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1432', '2021-03-25 21:52:23.911138', '2021-03-25 21:52:23.911138', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1433', '2021-03-25 21:52:23.917334', '2021-03-25 21:52:23.917334', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1434', '2021-03-25 21:52:56.841163', '2021-03-25 21:52:56.841163', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 12:38:57\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1435', '2021-03-25 21:52:56.848120', '2021-03-25 21:52:56.848120', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 12:38:57\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1436', '2021-03-25 21:52:57.126069', '2021-03-25 21:52:57.126069', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1437', '2021-03-25 21:52:57.135403', '2021-03-25 21:52:57.135403', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1438', '2021-03-25 21:53:06.569026', '2021-03-25 21:53:06.569026', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1439', '2021-03-25 21:53:06.579525', '2021-03-25 21:53:06.579525', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1440', '2021-03-25 21:53:27.184692', '2021-03-25 21:53:27.184692', '27', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1441', '2021-03-25 21:53:28.352763', '2021-03-25 21:53:28.352763', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('1442', '2021-03-25 21:53:36.514784', '2021-03-25 21:53:36.514784', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\",\"captchaId\":\"7a0c9d40-8d71-11eb-a28e-0deefbf03a90\",\"verifyCode\":\"1651\"}');
INSERT INTO `base_sys_log` VALUES ('1443', '2021-03-25 21:53:36.613554', '2021-03-25 21:53:36.613554', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1444', '2021-03-25 21:53:36.653215', '2021-03-25 21:53:36.653215', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1445', '2021-03-25 21:53:38.860412', '2021-03-25 21:53:38.860412', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1446', '2021-03-25 21:53:38.864192', '2021-03-25 21:53:38.864192', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1447', '2021-03-25 21:53:39.182486', '2021-03-25 21:53:39.182486', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1448', '2021-03-25 21:53:39.189044', '2021-03-25 21:53:39.189044', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1449', '2021-03-25 21:53:40.498078', '2021-03-25 21:53:40.498078', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1450', '2021-03-25 21:53:40.502638', '2021-03-25 21:53:40.502638', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1451', '2021-03-25 21:53:42.760490', '2021-03-25 21:53:42.760490', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1452', '2021-03-25 21:53:42.765678', '2021-03-25 21:53:42.765678', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1453', '2021-03-25 21:53:45.523226', '2021-03-25 21:53:45.523226', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1454', '2021-03-25 21:53:45.528056', '2021-03-25 21:53:45.528056', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1455', '2021-03-25 21:55:08.142758', '2021-03-25 21:55:08.142758', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1456', '2021-03-25 21:55:08.147353', '2021-03-25 21:55:08.147353', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1457', '2021-03-25 21:55:08.215104', '2021-03-25 21:55:08.215104', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1458', '2021-03-25 21:55:08.223495', '2021-03-25 21:55:08.223495', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1459', '2021-03-25 21:55:08.311586', '2021-03-25 21:55:08.311586', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1460', '2021-03-25 21:55:08.317321', '2021-03-25 21:55:08.317321', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1461', '2021-03-25 21:55:36.289655', '2021-03-25 21:55:36.289655', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[11,14,15],\"relevance\":0,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 17:29:04\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1462', '2021-03-25 21:55:36.295196', '2021-03-25 21:55:36.295196', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[11,14,15],\"relevance\":0,\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-24 17:29:04\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1463', '2021-03-25 21:55:36.838910', '2021-03-25 21:55:36.838910', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1464', '2021-03-25 21:55:36.846727', '2021-03-25 21:55:36.846727', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1465', '2021-03-25 21:55:39.574887', '2021-03-25 21:55:39.574887', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1466', '2021-03-25 21:55:39.579755', '2021-03-25 21:55:39.579755', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1467', '2021-03-25 21:55:39.909888', '2021-03-25 21:55:39.909888', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1468', '2021-03-25 21:55:39.927143', '2021-03-25 21:55:39.927143', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1469', '2021-03-25 21:55:40.003826', '2021-03-25 21:55:40.003826', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1470', '2021-03-25 21:55:40.008189', '2021-03-25 21:55:40.008189', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1471', '2021-03-25 21:55:47.798599', '2021-03-25 21:55:47.798599', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1472', '2021-03-25 21:55:47.803002', '2021-03-25 21:55:47.803002', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1473', '2021-03-25 21:55:47.849709', '2021-03-25 21:55:47.849709', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1474', '2021-03-25 21:55:47.854862', '2021-03-25 21:55:47.854862', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1475', '2021-03-25 21:55:47.917458', '2021-03-25 21:55:47.917458', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1476', '2021-03-25 21:55:47.925291', '2021-03-25 21:55:47.925291', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1477', '2021-03-25 21:56:00.996548', '2021-03-25 21:56:00.996548', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-24 13:06:54\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1478', '2021-03-25 21:56:01.003081', '2021-03-25 21:56:01.003081', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-24 13:06:54\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1479', '2021-03-25 21:56:01.533492', '2021-03-25 21:56:01.533492', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1480', '2021-03-25 21:56:01.548156', '2021-03-25 21:56:01.548156', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1481', '2021-03-25 21:56:04.574366', '2021-03-25 21:56:04.574366', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1482', '2021-03-25 21:56:04.579620', '2021-03-25 21:56:04.579620', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1483', '2021-03-25 21:56:04.932529', '2021-03-25 21:56:04.932529', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1484', '2021-03-25 21:56:04.937289', '2021-03-25 21:56:04.937289', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1485', '2021-03-25 21:56:04.963333', '2021-03-25 21:56:04.963333', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1486', '2021-03-25 21:56:04.967418', '2021-03-25 21:56:04.967418', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1487', '2021-03-25 21:56:11.013574', '2021-03-25 21:56:11.013574', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:35:37\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1488', '2021-03-25 21:56:11.019268', '2021-03-25 21:56:11.019268', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 12:35:37\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1489', '2021-03-25 21:56:11.310037', '2021-03-25 21:56:11.310037', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1490', '2021-03-25 21:56:11.320067', '2021-03-25 21:56:11.320067', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1491', '2021-03-25 22:02:31.666010', '2021-03-25 22:02:31.666010', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1492', '2021-03-25 22:02:31.670177', '2021-03-25 22:02:31.670177', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1493', '2021-03-25 22:02:33.277710', '2021-03-25 22:02:33.277710', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1494', '2021-03-25 22:02:33.282186', '2021-03-25 22:02:33.282186', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1495', '2021-03-25 22:02:42.687968', '2021-03-25 22:02:42.687968', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1496', '2021-03-25 22:02:42.692197', '2021-03-25 22:02:42.692197', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1497', '2021-03-25 22:08:10.439056', '2021-03-25 22:08:10.439056', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1498', '2021-03-25 22:08:10.443907', '2021-03-25 22:08:10.443907', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1499', '2021-03-25 22:08:10.454646', '2021-03-25 22:08:10.454646', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1500', '2021-03-25 22:08:10.459845', '2021-03-25 22:08:10.459845', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1501', '2021-03-25 22:08:10.506548', '2021-03-25 22:08:10.506548', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1502', '2021-03-25 22:08:10.512964', '2021-03-25 22:08:10.512964', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1503', '2021-03-25 22:08:17.068067', '2021-03-25 22:08:17.068067', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1504', '2021-03-25 22:08:17.073055', '2021-03-25 22:08:17.073055', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1505', '2021-03-25 22:08:17.400858', '2021-03-25 22:08:17.400858', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1506', '2021-03-25 22:08:17.413208', '2021-03-25 22:08:17.413208', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1507', '2021-03-25 22:08:17.505733', '2021-03-25 22:08:17.505733', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1508', '2021-03-25 22:08:17.509520', '2021-03-25 22:08:17.509520', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1509', '2021-03-25 22:13:51.419543', '2021-03-25 22:13:51.419543', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1510', '2021-03-25 22:13:51.419543', '2021-03-25 22:13:51.419543', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1511', '2021-03-25 22:13:52.873875', '2021-03-25 22:13:52.873875', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1512', '2021-03-25 22:13:52.880385', '2021-03-25 22:13:52.880385', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1513', '2021-03-25 22:18:34.313001', '2021-03-25 22:18:34.313001', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1514', '2021-03-25 22:18:34.317369', '2021-03-25 22:18:34.317369', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1515', '2021-03-25 22:18:34.343203', '2021-03-25 22:18:34.343203', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1516', '2021-03-25 22:18:34.350256', '2021-03-25 22:18:34.350256', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1517', '2021-03-25 22:22:14.208275', '2021-03-25 22:22:14.208275', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1518', '2021-03-25 22:22:14.211951', '2021-03-25 22:22:14.211951', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1519', '2021-03-25 22:22:14.511022', '2021-03-25 22:22:14.511022', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1520', '2021-03-25 22:22:14.516899', '2021-03-25 22:22:14.516899', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1521', '2021-03-25 22:31:46.875410', '2021-03-25 22:31:46.875410', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1522', '2021-03-25 22:31:46.879158', '2021-03-25 22:31:46.879158', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1523', '2021-03-25 22:31:46.929298', '2021-03-25 22:31:46.929298', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1524', '2021-03-25 22:31:46.935953', '2021-03-25 22:31:46.935953', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1525', '2021-03-25 22:32:11.482577', '2021-03-25 22:32:11.482577', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1526', '2021-03-25 22:32:11.489184', '2021-03-25 22:32:11.489184', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1527', '2021-03-25 22:32:11.787658', '2021-03-25 22:32:11.787658', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1528', '2021-03-25 22:32:11.795929', '2021-03-25 22:32:11.795929', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1529', '2021-03-25 22:32:48.437548', '2021-03-25 22:32:48.437548', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1530', '2021-03-25 22:32:48.443414', '2021-03-25 22:32:48.443414', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1531', '2021-03-25 22:32:48.456344', '2021-03-25 22:32:48.456344', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1532', '2021-03-25 22:32:48.462303', '2021-03-25 22:32:48.462303', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1533', '2021-03-25 22:33:53.669079', '2021-03-25 22:33:53.669079', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1534', '2021-03-25 22:33:53.673858', '2021-03-25 22:33:53.673858', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1535', '2021-03-25 22:33:53.736056', '2021-03-25 22:33:53.736056', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1536', '2021-03-25 22:33:53.741993', '2021-03-25 22:33:53.741993', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1537', '2021-03-25 22:34:19.971057', '2021-03-25 22:34:19.971057', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1538', '2021-03-25 22:34:19.975960', '2021-03-25 22:34:19.975960', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1539', '2021-03-25 22:34:20.274596', '2021-03-25 22:34:20.274596', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1540', '2021-03-25 22:34:20.283062', '2021-03-25 22:34:20.283062', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1541', '2021-03-25 22:34:37.635466', '2021-03-25 22:34:37.635466', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1542', '2021-03-25 22:34:37.639748', '2021-03-25 22:34:37.639748', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1543', '2021-03-25 22:34:37.648999', '2021-03-25 22:34:37.648999', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1544', '2021-03-25 22:34:37.655401', '2021-03-25 22:34:37.655401', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1545', '2021-03-25 22:35:54.667871', '2021-03-25 22:35:54.667871', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1546', '2021-03-25 22:35:54.678870', '2021-03-25 22:35:54.678870', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1547', '2021-03-25 22:37:18.224086', '2021-03-25 22:37:18.224086', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1548', '2021-03-25 22:37:18.336338', '2021-03-25 22:37:18.336338', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1549', '2021-03-25 22:37:49.530651', '2021-03-25 22:37:49.530651', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1550', '2021-03-25 22:37:49.536030', '2021-03-25 22:37:49.536030', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1551', '2021-03-25 22:38:45.927952', '2021-03-25 22:38:45.927952', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1552', '2021-03-25 22:38:45.971164', '2021-03-25 22:38:45.971164', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1553', '2021-03-25 22:40:11.102091', '2021-03-25 22:40:11.102091', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1554', '2021-03-25 22:40:11.109369', '2021-03-25 22:40:11.109369', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1555', '2021-03-25 22:45:23.847324', '2021-03-25 22:45:23.847324', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1556', '2021-03-25 22:45:23.864680', '2021-03-25 22:45:23.864680', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1557', '2021-03-25 22:46:52.317819', '2021-03-25 22:46:52.317819', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1558', '2021-03-25 22:46:52.371663', '2021-03-25 22:46:52.371663', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1559', '2021-03-25 22:47:32.859645', '2021-03-25 22:47:32.859645', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1560', '2021-03-25 22:47:32.865225', '2021-03-25 22:47:32.865225', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1561', '2021-03-25 22:47:39.139068', '2021-03-25 22:47:39.139068', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1562', '2021-03-25 22:47:39.141370', '2021-03-25 22:47:39.141370', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1563', '2021-03-25 22:47:39.222542', '2021-03-25 22:47:39.222542', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1564', '2021-03-25 22:47:39.225754', '2021-03-25 22:47:39.225754', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1565', '2021-03-25 22:47:53.520537', '2021-03-25 22:47:53.520537', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1566', '2021-03-25 22:47:53.524618', '2021-03-25 22:47:53.524618', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1567', '2021-03-25 22:47:53.833152', '2021-03-25 22:47:53.833152', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1568', '2021-03-25 22:47:53.837870', '2021-03-25 22:47:53.837870', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1569', '2021-03-25 22:49:07.551609', '2021-03-25 22:49:07.551609', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1570', '2021-03-25 22:49:07.563553', '2021-03-25 22:49:07.563553', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1571', '2021-03-25 22:49:07.946296', '2021-03-25 22:49:07.946296', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1572', '2021-03-25 22:49:07.952678', '2021-03-25 22:49:07.952678', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1573', '2021-03-25 22:49:08.080547', '2021-03-25 22:49:08.080547', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1574', '2021-03-25 22:49:08.085686', '2021-03-25 22:49:08.085686', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1575', '2021-03-25 22:49:12.056098', '2021-03-25 22:49:12.056098', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1576', '2021-03-25 22:49:12.067383', '2021-03-25 22:49:12.067383', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1577', '2021-03-25 22:51:16.329564', '2021-03-25 22:51:16.329564', '32', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1578', '2021-03-25 22:51:16.340574', '2021-03-25 22:51:16.340574', '32', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1579', '2021-03-25 22:51:16.752222', '2021-03-25 22:51:16.752222', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1580', '2021-03-25 22:51:16.758373', '2021-03-25 22:51:16.758373', '32', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1581', '2021-03-25 22:51:16.862092', '2021-03-25 22:51:16.862092', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1582', '2021-03-25 22:51:16.869064', '2021-03-25 22:51:16.869064', '32', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1583', '2021-03-25 22:51:22.376412', '2021-03-25 22:51:22.376412', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1584', '2021-03-25 22:51:22.388474', '2021-03-25 22:51:22.388474', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1585', '2021-03-25 22:51:22.806895', '2021-03-25 22:51:22.806895', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1586', '2021-03-25 22:51:22.812014', '2021-03-25 22:51:22.812014', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1587', '2021-03-25 22:51:22.945888', '2021-03-25 22:51:22.945888', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1588', '2021-03-25 22:51:22.954340', '2021-03-25 22:51:22.954340', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1589', '2021-03-25 22:51:37.640695', '2021-03-25 22:51:37.640695', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1590', '2021-03-25 22:51:37.646302', '2021-03-25 22:51:37.646302', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1591', '2021-03-25 22:51:41.209797', '2021-03-25 22:51:41.209797', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1592', '2021-03-25 22:51:41.215521', '2021-03-25 22:51:41.215521', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1593', '2021-03-25 22:51:41.225639', '2021-03-25 22:51:41.225639', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1594', '2021-03-25 22:51:41.237083', '2021-03-25 22:51:41.237083', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1595', '2021-03-25 22:51:41.353587', '2021-03-25 22:51:41.353587', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1596', '2021-03-25 22:51:41.359113', '2021-03-25 22:51:41.359113', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1597', '2021-03-25 22:51:53.933018', '2021-03-25 22:51:53.933018', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 21:52:56\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1598', '2021-03-25 22:51:53.941699', '2021-03-25 22:51:53.941699', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 21:52:56\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1599', '2021-03-25 22:51:54.476673', '2021-03-25 22:51:54.476673', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1600', '2021-03-25 22:51:54.481691', '2021-03-25 22:51:54.481691', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1601', '2021-03-25 22:51:56.896456', '2021-03-25 22:51:56.896456', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1602', '2021-03-25 22:51:56.904930', '2021-03-25 22:51:56.904930', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1603', '2021-03-25 22:51:57.247626', '2021-03-25 22:51:57.247626', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1604', '2021-03-25 22:51:57.253445', '2021-03-25 22:51:57.253445', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1605', '2021-03-25 22:51:57.283673', '2021-03-25 22:51:57.283673', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1606', '2021-03-25 22:51:57.293254', '2021-03-25 22:51:57.293254', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1607', '2021-03-25 22:52:04.807809', '2021-03-25 22:52:04.807809', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1608', '2021-03-25 22:52:04.812737', '2021-03-25 22:52:04.812737', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1609', '2021-03-25 22:52:04.821020', '2021-03-25 22:52:04.821020', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1610', '2021-03-25 22:52:04.826054', '2021-03-25 22:52:04.826054', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1611', '2021-03-25 22:52:04.843070', '2021-03-25 22:52:04.843070', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1612', '2021-03-25 22:52:04.849392', '2021-03-25 22:52:04.849392', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1613', '2021-03-25 22:52:12.810154', '2021-03-25 22:52:12.810154', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1614', '2021-03-25 22:52:12.816046', '2021-03-25 22:52:12.816046', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1615', '2021-03-25 22:52:13.166537', '2021-03-25 22:52:13.166537', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1616', '2021-03-25 22:52:13.172680', '2021-03-25 22:52:13.172680', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1617', '2021-03-25 22:52:13.264596', '2021-03-25 22:52:13.264596', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1618', '2021-03-25 22:52:13.270846', '2021-03-25 22:52:13.270846', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1619', '2021-03-25 22:52:26.221712', '2021-03-25 22:52:26.221712', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[15],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-25 21:56:01\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1620', '2021-03-25 22:52:26.227713', '2021-03-25 22:52:26.227713', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[15],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-25 21:56:01\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1621', '2021-03-25 22:52:26.508250', '2021-03-25 22:52:26.508250', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1622', '2021-03-25 22:52:26.517491', '2021-03-25 22:52:26.517491', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1623', '2021-03-25 22:52:28.822889', '2021-03-25 22:52:28.822889', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1624', '2021-03-25 22:52:28.829877', '2021-03-25 22:52:28.829877', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1625', '2021-03-25 22:52:29.209984', '2021-03-25 22:52:29.209984', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1626', '2021-03-25 22:52:29.217852', '2021-03-25 22:52:29.217852', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1627', '2021-03-25 22:52:29.244457', '2021-03-25 22:52:29.244457', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1628', '2021-03-25 22:52:29.251677', '2021-03-25 22:52:29.251677', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1629', '2021-03-25 22:53:24.651584', '2021-03-25 22:53:24.651584', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1630', '2021-03-25 22:53:24.726217', '2021-03-25 22:53:24.726217', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1631', '2021-03-25 22:53:25.325968', '2021-03-25 22:53:25.325968', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1632', '2021-03-25 22:53:25.339235', '2021-03-25 22:53:25.339235', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1633', '2021-03-25 22:53:30.096709', '2021-03-25 22:53:30.096709', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1634', '2021-03-25 22:53:30.106568', '2021-03-25 22:53:30.106568', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1635', '2021-03-25 22:53:30.198723', '2021-03-25 22:53:30.198723', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1636', '2021-03-25 22:53:30.203487', '2021-03-25 22:53:30.203487', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('1637', '2021-03-25 22:53:30.399169', '2021-03-25 22:53:30.399169', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1638', '2021-03-25 22:53:30.404692', '2021-03-25 22:53:30.404692', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1639', '2021-03-25 22:53:43.812448', '2021-03-25 22:53:43.812448', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[11,14,15],\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-25 21:55:36\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1640', '2021-03-25 22:53:43.816952', '2021-03-25 22:53:43.816952', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"relevance\":0,\"name\":\"经销商\",\"label\":\"dealer\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[11,14,15],\"id\":13,\"createTime\":\"2021-02-26 14:27:58\",\"updateTime\":\"2021-03-25 21:55:36\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1641', '2021-03-25 22:53:44.093179', '2021-03-25 22:53:44.093179', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1642', '2021-03-25 22:53:44.099510', '2021-03-25 22:53:44.099510', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1643', '2021-03-25 22:53:46.157240', '2021-03-25 22:53:46.157240', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1644', '2021-03-25 22:53:46.162614', '2021-03-25 22:53:46.162614', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1645', '2021-03-25 22:53:46.496028', '2021-03-25 22:53:46.496028', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1646', '2021-03-25 22:53:46.503493', '2021-03-25 22:53:46.503493', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1647', '2021-03-25 22:53:46.584352', '2021-03-25 22:53:46.584352', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1648', '2021-03-25 22:53:46.589231', '2021-03-25 22:53:46.589231', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('1649', '2021-03-25 22:53:56.253361', '2021-03-25 22:53:56.253361', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"relevance\":0,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 22:51:54\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1650', '2021-03-25 22:53:56.260301', '2021-03-25 22:53:56.260301', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"工程商\",\"label\":\"project\",\"remark\":null,\"menuIdList\":[121,120],\"departmentIdList\":[14,15],\"relevance\":0,\"id\":12,\"createTime\":\"2021-02-26 14:26:51\",\"updateTime\":\"2021-03-25 22:51:54\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1651', '2021-03-25 22:53:56.540211', '2021-03-25 22:53:56.540211', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1652', '2021-03-25 22:53:56.546727', '2021-03-25 22:53:56.546727', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1653', '2021-03-25 22:53:58.873384', '2021-03-25 22:53:58.873384', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1654', '2021-03-25 22:53:58.878130', '2021-03-25 22:53:58.878130', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"11\"}');
INSERT INTO `base_sys_log` VALUES ('1655', '2021-03-25 22:53:59.263609', '2021-03-25 22:53:59.263609', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1656', '2021-03-25 22:53:59.273492', '2021-03-25 22:53:59.273492', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1657', '2021-03-25 22:53:59.286870', '2021-03-25 22:53:59.286870', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1658', '2021-03-25 22:53:59.293044', '2021-03-25 22:53:59.293044', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1659', '2021-03-25 22:54:05.646015', '2021-03-25 22:54:05.646015', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[15],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-25 22:52:26\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1660', '2021-03-25 22:54:05.651140', '2021-03-25 22:54:05.651140', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"客户\",\"label\":\"client\",\"remark\":null,\"menuIdList\":[120],\"departmentIdList\":[15],\"relevance\":0,\"id\":11,\"createTime\":\"2021-02-26 14:16:49\",\"updateTime\":\"2021-03-25 22:52:26\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1661', '2021-03-25 22:54:05.911962', '2021-03-25 22:54:05.911962', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1662', '2021-03-25 22:54:05.923159', '2021-03-25 22:54:05.923159', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1663', '2021-03-25 22:54:07.570902', '2021-03-25 22:54:07.570902', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1664', '2021-03-25 22:54:07.580718', '2021-03-25 22:54:07.580718', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('1665', '2021-03-25 22:54:07.922618', '2021-03-25 22:54:07.922618', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1666', '2021-03-25 22:54:07.928150', '2021-03-25 22:54:07.928150', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1667', '2021-03-25 22:54:07.939727', '2021-03-25 22:54:07.939727', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1668', '2021-03-25 22:54:07.943500', '2021-03-25 22:54:07.943500', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1669', '2021-03-25 22:54:15.545757', '2021-03-25 22:54:15.545757', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 21:56:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1670', '2021-03-25 22:54:15.551140', '2021-03-25 22:54:15.551140', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-03-25 21:56:11\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1671', '2021-03-25 22:54:15.839385', '2021-03-25 22:54:15.839385', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1672', '2021-03-25 22:54:15.868121', '2021-03-25 22:54:15.868121', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1673', '2021-03-25 22:55:33.754110', '2021-03-25 22:55:33.754110', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1674', '2021-03-25 22:55:33.760771', '2021-03-25 22:55:33.760771', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1675', '2021-03-25 23:09:29.512112', '2021-03-25 23:09:29.512112', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYxNjY3Njg3OCwiZXhwIjoxNjE3OTcyODc4fQ.Vv0LzYAoNYThWx_AXBedxnQMlUjMYEmDbTrCf31KMHg\"}');
INSERT INTO `base_sys_log` VALUES ('1676', '2021-03-25 23:09:29.748975', '2021-03-25 23:09:29.748975', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1677', '2021-03-25 23:09:29.754120', '2021-03-25 23:09:29.754120', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1678', '2021-03-25 23:09:29.901201', '2021-03-25 23:09:29.901201', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1679', '2021-03-25 23:09:29.911640', '2021-03-25 23:09:29.911640', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1680', '2021-03-25 23:09:32.603749', '2021-03-25 23:09:32.603749', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1681', '2021-03-25 23:09:32.610884', '2021-03-25 23:09:32.610884', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1682', '2021-03-25 23:09:32.927790', '2021-03-25 23:09:32.927790', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1683', '2021-03-25 23:09:32.935285', '2021-03-25 23:09:32.935285', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1684', '2021-03-25 23:09:39.151566', '2021-03-25 23:09:39.151566', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1685', '2021-03-25 23:09:39.155737', '2021-03-25 23:09:39.155737', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"33\"}');
INSERT INTO `base_sys_log` VALUES ('1686', '2021-03-25 23:09:39.171471', '2021-03-25 23:09:39.171471', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1687', '2021-03-25 23:09:39.175931', '2021-03-25 23:09:39.175931', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1688', '2021-03-25 23:10:55.749011', '2021-03-25 23:10:55.749011', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"32\"}');
INSERT INTO `base_sys_log` VALUES ('1689', '2021-03-25 23:10:55.755490', '2021-03-25 23:10:55.755490', '1', '/admin/base/sys/user/info', '127.0.0.1', '本机地址', '{\"id\":\"32\"}');
INSERT INTO `base_sys_log` VALUES ('1690', '2021-03-25 23:10:55.780441', '2021-03-25 23:10:55.780441', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1691', '2021-03-25 23:10:55.787166', '2021-03-25 23:10:55.787166', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1692', '2021-03-25 23:11:08.143135', '2021-03-25 23:11:08.143135', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1693', '2021-03-25 23:11:08.148476', '2021-03-25 23:11:08.148476', '32', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1694', '2021-03-25 23:11:31.633033', '2021-03-25 23:11:31.633033', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1695', '2021-03-25 23:11:31.642983', '2021-03-25 23:11:31.642983', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1696', '2021-03-25 23:11:40.767914', '2021-03-25 23:11:40.767914', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1697', '2021-03-25 23:11:40.773469', '2021-03-25 23:11:40.773469', '1', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1698', '2021-03-25 23:12:10.344761', '2021-03-25 23:12:10.344761', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"经销商小王\",\"nickName\":\"经销商小王\",\"username\":\"jxsxiaowang\",\"roleIdList\":[13],\"status\":1,\"departmentId\":11}');
INSERT INTO `base_sys_log` VALUES ('1699', '2021-03-25 23:12:10.352635', '2021-03-25 23:12:10.352635', '1', '/admin/base/sys/user/add', '127.0.0.1', '本机地址', '{\"name\":\"经销商小王\",\"nickName\":\"经销商小王\",\"username\":\"jxsxiaowang\",\"roleIdList\":[13],\"status\":1,\"departmentId\":11}');
INSERT INTO `base_sys_log` VALUES ('1700', '2021-03-25 23:12:10.963374', '2021-03-25 23:12:10.963374', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1701', '2021-03-25 23:12:10.970543', '2021-03-25 23:12:10.970543', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"departmentIds\":[11,14,15],\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1702', '2021-03-25 23:12:42.877019', '2021-03-25 23:12:42.877019', null, '/admin/base/open/captcha', '127.0.0.1', '本机地址', '{\"height\":\"36\",\"width\":\"110\"}');
INSERT INTO `base_sys_log` VALUES ('1703', '2021-03-25 23:12:49.313523', '2021-03-25 23:12:49.313523', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"jxsxiaowang\",\"password\":\"123456\",\"captchaId\":\"8bf6cac0-8d7c-11eb-8327-ef95608ce805\",\"verifyCode\":\"9213\"}');
INSERT INTO `base_sys_log` VALUES ('1704', '2021-03-25 23:12:49.421400', '2021-03-25 23:12:49.421400', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1705', '2021-03-25 23:12:49.552545', '2021-03-25 23:12:49.552545', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1706', '2021-03-25 23:12:51.755654', '2021-03-25 23:12:51.755654', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1707', '2021-03-25 23:12:51.760712', '2021-03-25 23:12:51.760712', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1708', '2021-03-25 23:12:52.074875', '2021-03-25 23:12:52.074875', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1709', '2021-03-25 23:12:52.079273', '2021-03-25 23:12:52.079273', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1710', '2021-03-25 23:12:58.636765', '2021-03-25 23:12:58.636765', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1711', '2021-03-25 23:12:58.641961', '2021-03-25 23:12:58.641961', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1712', '2021-03-25 23:13:09.115405', '2021-03-25 23:13:09.115405', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1713', '2021-03-25 23:13:09.123048', '2021-03-25 23:13:09.123048', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1714', '2021-03-25 23:35:12.084217', '2021-03-25 23:35:12.084217', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1715', '2021-03-25 23:35:12.089146', '2021-03-25 23:35:12.089146', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1716', '2021-03-25 23:35:12.605133', '2021-03-25 23:35:12.605133', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1717', '2021-03-25 23:35:29.046194', '2021-03-25 23:35:29.046194', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1718', '2021-03-25 23:35:29.063217', '2021-03-25 23:35:29.063217', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1719', '2021-03-25 23:35:31.518916', '2021-03-25 23:35:31.518916', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1720', '2021-03-25 23:35:31.523832', '2021-03-25 23:35:31.523832', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1721', '2021-03-25 23:35:36.030168', '2021-03-25 23:35:36.030168', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1722', '2021-03-25 23:35:36.035173', '2021-03-25 23:35:36.035173', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1723', '2021-03-25 23:35:36.350994', '2021-03-25 23:35:36.350994', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1724', '2021-03-25 23:35:36.356716', '2021-03-25 23:35:36.356716', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1725', '2021-03-25 23:35:56.958774', '2021-03-25 23:35:56.958774', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1726', '2021-03-25 23:35:56.964594', '2021-03-25 23:35:56.964594', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('1727', '2021-03-26 00:12:04.077760', '2021-03-26 00:12:04.077760', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1728', '2021-03-26 00:12:04.098578', '2021-03-26 00:12:04.098578', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1729', '2021-03-26 00:22:14.068479', '2021-03-26 00:22:14.068479', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1730', '2021-03-26 00:22:22.551562', '2021-03-26 00:22:22.551562', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1731', '2021-03-26 00:22:22.601790', '2021-03-26 00:22:22.601790', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1732', '2021-03-26 00:23:04.658426', '2021-03-26 00:23:04.658426', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1733', '2021-03-26 00:23:04.663681', '2021-03-26 00:23:04.663681', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1734', '2021-03-26 00:23:11.591167', '2021-03-26 00:23:11.591167', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[1]}');
INSERT INTO `base_sys_log` VALUES ('1735', '2021-03-26 00:23:11.595357', '2021-03-26 00:23:11.595357', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[1]}');
INSERT INTO `base_sys_log` VALUES ('1736', '2021-03-26 00:23:11.826263', '2021-03-26 00:23:11.826263', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1737', '2021-03-26 00:23:11.833999', '2021-03-26 00:23:11.833999', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1738', '2021-03-26 00:23:52.626571', '2021-03-26 00:23:52.626571', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸机场\",\"channelName\":\"channel yi zha\",\"mac\":\"44:56:44:56:44:56:44:5ab\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1739', '2021-03-26 00:23:52.631924', '2021-03-26 00:23:52.631924', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸机场\",\"channelName\":\"channel yi zha\",\"mac\":\"44:56:44:56:44:56:44:5ab\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1740', '2021-03-26 00:23:52.861700', '2021-03-26 00:23:52.861700', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1741', '2021-03-26 00:23:52.865695', '2021-03-26 00:23:52.865695', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1742', '2021-03-26 00:24:00.866230', '2021-03-26 00:24:00.866230', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1743', '2021-03-26 00:24:00.873438', '2021-03-26 00:24:00.873438', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1744', '2021-03-26 00:26:41.129026', '2021-03-26 00:26:41.129026', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1745', '2021-03-26 00:26:41.131746', '2021-03-26 00:26:41.131746', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1746', '2021-03-26 00:26:42.963865', '2021-03-26 00:26:42.963865', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1747', '2021-03-26 00:26:42.968742', '2021-03-26 00:26:42.968742', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1748', '2021-03-26 00:27:50.942432', '2021-03-26 00:27:50.942432', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1749', '2021-03-26 00:27:50.945891', '2021-03-26 00:27:50.945891', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1750', '2021-03-26 00:31:24.451741', '2021-03-26 00:31:24.451741', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1751', '2021-03-26 00:31:24.456943', '2021-03-26 00:31:24.456943', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1752', '2021-03-26 00:31:54.925878', '2021-03-26 00:31:54.925878', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1753', '2021-03-26 00:31:54.933636', '2021-03-26 00:31:54.933636', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1754', '2021-03-26 00:33:12.805971', '2021-03-26 00:33:12.805971', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1755', '2021-03-26 00:33:12.814761', '2021-03-26 00:33:12.814761', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1756', '2021-03-26 00:33:15.370314', '2021-03-26 00:33:15.370314', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1757', '2021-03-26 00:33:15.380351', '2021-03-26 00:33:15.380351', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1758', '2021-03-26 00:34:58.427960', '2021-03-26 00:34:58.427960', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1759', '2021-03-26 00:34:58.432183', '2021-03-26 00:34:58.432183', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1760', '2021-03-26 00:35:19.890308', '2021-03-26 00:35:19.890308', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1761', '2021-03-26 00:35:19.894041', '2021-03-26 00:35:19.894041', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1762', '2021-03-26 00:35:47.155166', '2021-03-26 00:35:47.155166', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1763', '2021-03-26 00:35:47.158877', '2021-03-26 00:35:47.158877', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"翼闸车站\",\"channelName\":\"channel2233\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1764', '2021-03-26 00:35:47.386025', '2021-03-26 00:35:47.386025', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1765', '2021-03-26 00:35:47.389471', '2021-03-26 00:35:47.389471', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1766', '2021-03-26 00:37:38.570899', '2021-03-26 00:37:38.570899', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1767', '2021-03-26 00:37:38.574750', '2021-03-26 00:37:38.574750', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1768', '2021-03-26 00:37:49.944152', '2021-03-26 00:37:49.944152', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"1223\",\"channelName\":\"12\",\"mac\":\"2213\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1769', '2021-03-26 00:37:49.951904', '2021-03-26 00:37:49.951904', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"1223\",\"channelName\":\"12\",\"mac\":\"2213\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1770', '2021-03-26 00:40:24.192019', '2021-03-26 00:40:24.192019', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1771', '2021-03-26 00:40:30.323642', '2021-03-26 00:40:30.323642', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1772', '2021-03-26 00:40:30.399809', '2021-03-26 00:40:30.399809', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1773', '2021-03-26 00:40:32.532016', '2021-03-26 00:40:32.532016', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1774', '2021-03-26 00:40:32.536785', '2021-03-26 00:40:32.536785', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1775', '2021-03-26 00:40:32.652680', '2021-03-26 00:40:32.652680', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1776', '2021-03-26 00:40:32.656775', '2021-03-26 00:40:32.656775', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1777', '2021-03-26 00:40:35.651433', '2021-03-26 00:40:35.651433', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1778', '2021-03-26 00:40:35.655362', '2021-03-26 00:40:35.655362', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1779', '2021-03-26 00:40:46.239428', '2021-03-26 00:40:46.239428', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"213\",\"channelName\":\"123\",\"mac\":\"123123\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1780', '2021-03-26 00:40:46.244438', '2021-03-26 00:40:46.244438', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"213\",\"channelName\":\"123\",\"mac\":\"123123\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1781', '2021-03-26 00:40:46.452570', '2021-03-26 00:40:46.452570', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1782', '2021-03-26 00:40:46.456510', '2021-03-26 00:40:46.456510', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1783', '2021-03-26 00:41:09.976395', '2021-03-26 00:41:09.976395', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"sad\",\"channelName\":\"asddasd\",\"mac\":\"asdad\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1784', '2021-03-26 00:41:09.979370', '2021-03-26 00:41:09.979370', '1', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"name\":\"sad\",\"channelName\":\"asddasd\",\"mac\":\"asdad\",\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('1785', '2021-03-26 00:41:10.206332', '2021-03-26 00:41:10.206332', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1786', '2021-03-26 00:41:10.209262', '2021-03-26 00:41:10.209262', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1787', '2021-03-26 00:41:30.581603', '2021-03-26 00:41:30.581603', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1788', '2021-03-26 00:41:30.585969', '2021-03-26 00:41:30.585969', '34', '/admin/base/sys/role/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1789', '2021-03-26 00:41:39.576967', '2021-03-26 00:41:39.576967', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('1790', '2021-03-26 00:41:39.583415', '2021-03-26 00:41:39.583415', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('1791', '2021-03-26 00:42:13.273135', '2021-03-26 00:42:13.273135', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1792', '2021-03-26 00:42:13.278790', '2021-03-26 00:42:13.278790', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1793', '2021-03-26 00:43:48.902918', '2021-03-26 00:43:48.902918', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1794', '2021-03-26 00:44:01.548767', '2021-03-26 00:44:01.548767', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1795', '2021-03-26 00:44:01.553693', '2021-03-26 00:44:01.553693', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1796', '2021-03-26 00:44:10.553926', '2021-03-26 00:44:10.553926', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1797', '2021-03-26 00:44:18.348943', '2021-03-26 00:44:18.348943', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1798', '2021-03-26 00:44:18.365710', '2021-03-26 00:44:18.365710', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1799', '2021-03-26 00:44:21.383163', '2021-03-26 00:44:21.383163', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1800', '2021-03-26 00:44:21.388265', '2021-03-26 00:44:21.388265', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1801', '2021-03-26 00:47:13.440867', '2021-03-26 00:47:13.440867', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1802', '2021-03-26 00:51:21.197495', '2021-03-26 00:51:21.197495', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1803', '2021-03-26 00:51:21.251541', '2021-03-26 00:51:21.251541', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1804', '2021-03-26 00:51:37.051433', '2021-03-26 00:51:37.051433', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1805', '2021-03-26 00:51:37.066995', '2021-03-26 00:51:37.066995', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1806', '2021-03-26 00:51:39.809784', '2021-03-26 00:51:39.809784', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1807', '2021-03-26 00:51:39.821124', '2021-03-26 00:51:39.821124', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1808', '2021-03-26 00:51:46.855595', '2021-03-26 00:51:46.855595', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1809', '2021-03-26 00:51:46.864316', '2021-03-26 00:51:46.864316', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1810', '2021-03-26 00:51:51.265845', '2021-03-26 00:51:51.265845', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1811', '2021-03-26 00:51:51.272647', '2021-03-26 00:51:51.272647', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1812', '2021-03-26 00:51:53.275156', '2021-03-26 00:51:53.275156', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1813', '2021-03-26 00:51:53.284157', '2021-03-26 00:51:53.284157', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1814', '2021-03-26 00:52:20.105988', '2021-03-26 00:52:20.105988', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1815', '2021-03-26 00:52:20.119099', '2021-03-26 00:52:20.119099', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1816', '2021-03-26 00:52:22.851668', '2021-03-26 00:52:22.851668', '1', '/admin/base/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1817', '2021-03-26 00:52:22.894562', '2021-03-26 00:52:22.894562', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1818', '2021-03-26 00:52:22.899900', '2021-03-26 00:52:22.899900', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1819', '2021-03-26 00:52:30.903046', '2021-03-26 00:52:30.903046', '1', '/admin/base/sys/param/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1820', '2021-03-26 00:52:30.909228', '2021-03-26 00:52:30.909228', '1', '/admin/base/sys/param/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1821', '2021-03-26 00:52:58.776889', '2021-03-26 00:52:58.776889', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1822', '2021-03-26 00:52:58.781764', '2021-03-26 00:52:58.781764', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1823', '2021-03-26 00:53:01.710632', '2021-03-26 00:53:01.710632', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1824', '2021-03-26 00:53:01.714560', '2021-03-26 00:53:01.714560', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1825', '2021-03-26 00:53:01.787558', '2021-03-26 00:53:01.787558', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1826', '2021-03-26 00:53:01.808152', '2021-03-26 00:53:01.808152', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1827', '2021-03-26 00:53:19.515067', '2021-03-26 00:53:19.515067', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,base:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:36:32\"}');
INSERT INTO `base_sys_log` VALUES ('1828', '2021-03-26 00:53:19.519212', '2021-03-26 00:53:19.519212', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":null,\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,base:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-25 12:36:32\"}');
INSERT INTO `base_sys_log` VALUES ('1829', '2021-03-26 00:53:20.280709', '2021-03-26 00:53:20.280709', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1830', '2021-03-26 00:53:20.284315', '2021-03-26 00:53:20.284315', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1831', '2021-03-26 00:53:27.809430', '2021-03-26 00:53:27.809430', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1832', '2021-03-26 00:53:27.837280', '2021-03-26 00:53:27.837280', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1833', '2021-03-26 00:53:30.872634', '2021-03-26 00:53:30.872634', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1834', '2021-03-26 00:53:30.878519', '2021-03-26 00:53:30.878519', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1835', '2021-03-26 00:53:30.957550', '2021-03-26 00:53:30.957550', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1836', '2021-03-26 00:53:30.961587', '2021-03-26 00:53:30.961587', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1837', '2021-03-26 00:53:36.535790', '2021-03-26 00:53:36.535790', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1838', '2021-03-26 00:53:36.545406', '2021-03-26 00:53:36.545406', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1839', '2021-03-26 00:53:36.554053', '2021-03-26 00:53:36.554053', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1840', '2021-03-26 00:53:36.559231', '2021-03-26 00:53:36.559231', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1841', '2021-03-26 00:53:39.855060', '2021-03-26 00:53:39.855060', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 00:53:19\"}');
INSERT INTO `base_sys_log` VALUES ('1842', '2021-03-26 00:53:39.863555', '2021-03-26 00:53:39.863555', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"views/device/index.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 00:53:19\"}');
INSERT INTO `base_sys_log` VALUES ('1843', '2021-03-26 00:53:40.718138', '2021-03-26 00:53:40.718138', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1844', '2021-03-26 00:53:40.721968', '2021-03-26 00:53:40.721968', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1845', '2021-03-26 00:53:43.637387', '2021-03-26 00:53:43.637387', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1846', '2021-03-26 00:53:43.647060', '2021-03-26 00:53:43.647060', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1847', '2021-03-26 00:53:44.562631', '2021-03-26 00:53:44.562631', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1848', '2021-03-26 00:53:44.570213', '2021-03-26 00:53:44.570213', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1849', '2021-03-26 00:53:44.674248', '2021-03-26 00:53:44.674248', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1850', '2021-03-26 00:53:44.678973', '2021-03-26 00:53:44.678973', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1851', '2021-03-26 00:53:45.828968', '2021-03-26 00:53:45.828968', '34', '/admin/base/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1852', '2021-03-26 00:53:45.889034', '2021-03-26 00:53:45.889034', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1853', '2021-03-26 00:53:45.894097', '2021-03-26 00:53:45.894097', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1854', '2021-03-26 00:54:41.957661', '2021-03-26 00:54:41.957661', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1855', '2021-03-26 00:54:41.961758', '2021-03-26 00:54:41.961758', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1856', '2021-03-26 00:54:42.020803', '2021-03-26 00:54:42.020803', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1857', '2021-03-26 00:54:42.024011', '2021-03-26 00:54:42.024011', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1858', '2021-03-26 00:55:06.753942', '2021-03-26 00:55:06.753942', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1859', '2021-03-26 00:55:11.868278', '2021-03-26 00:55:11.868278', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1860', '2021-03-26 00:55:11.998583', '2021-03-26 00:55:11.998583', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1861', '2021-03-26 00:55:14.503835', '2021-03-26 00:55:14.503835', '1', '/admin/base/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1862', '2021-03-26 00:55:14.543058', '2021-03-26 00:55:14.543058', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1863', '2021-03-26 00:55:14.546841', '2021-03-26 00:55:14.546841', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1864', '2021-03-26 00:55:42.821986', '2021-03-26 00:55:42.821986', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1865', '2021-03-26 00:55:43.096547', '2021-03-26 00:55:43.096547', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1866', '2021-03-26 00:55:48.722892', '2021-03-26 00:55:48.722892', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1867', '2021-03-26 00:55:48.744077', '2021-03-26 00:55:48.744077', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1868', '2021-03-26 00:55:50.353534', '2021-03-26 00:55:50.353534', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1869', '2021-03-26 00:55:50.358248', '2021-03-26 00:55:50.358248', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1870', '2021-03-26 00:55:50.427912', '2021-03-26 00:55:50.427912', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1871', '2021-03-26 00:55:50.433162', '2021-03-26 00:55:50.433162', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1872', '2021-03-26 01:04:45.805941', '2021-03-26 01:04:45.805941', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1873', '2021-03-26 01:04:58.315319', '2021-03-26 01:04:58.315319', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1874', '2021-03-26 01:04:58.338591', '2021-03-26 01:04:58.338591', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1875', '2021-03-26 01:05:04.720011', '2021-03-26 01:05:04.720011', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1876', '2021-03-26 01:05:04.727482', '2021-03-26 01:05:04.727482', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1877', '2021-03-26 01:05:08.364433', '2021-03-26 01:05:08.364433', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1878', '2021-03-26 01:05:08.371053', '2021-03-26 01:05:08.371053', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1879', '2021-03-26 01:05:08.448244', '2021-03-26 01:05:08.448244', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1880', '2021-03-26 01:05:08.455713', '2021-03-26 01:05:08.455713', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1881', '2021-03-26 01:06:30.329030', '2021-03-26 01:06:30.329030', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1882', '2021-03-26 01:06:30.340959', '2021-03-26 01:06:30.340959', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1883', '2021-03-26 01:06:30.668233', '2021-03-26 01:06:30.668233', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1884', '2021-03-26 01:06:30.675521', '2021-03-26 01:06:30.675521', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1885', '2021-03-26 01:06:33.791862', '2021-03-26 01:06:33.791862', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1886', '2021-03-26 01:06:33.795708', '2021-03-26 01:06:33.795708', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1887', '2021-03-26 01:06:33.814707', '2021-03-26 01:06:33.814707', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1888', '2021-03-26 01:06:33.818959', '2021-03-26 01:06:33.818959', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1889', '2021-03-26 01:08:01.571210', '2021-03-26 01:08:01.571210', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1890', '2021-03-26 01:08:01.580834', '2021-03-26 01:08:01.580834', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1891', '2021-03-26 01:08:01.864256', '2021-03-26 01:08:01.864256', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1892', '2021-03-26 01:08:01.870736', '2021-03-26 01:08:01.870736', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1893', '2021-03-26 01:08:04.690627', '2021-03-26 01:08:04.690627', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1894', '2021-03-26 01:08:04.693899', '2021-03-26 01:08:04.693899', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1895', '2021-03-26 01:08:04.709735', '2021-03-26 01:08:04.709735', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1896', '2021-03-26 01:08:04.714604', '2021-03-26 01:08:04.714604', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1897', '2021-03-26 01:08:13.732731', '2021-03-26 01:08:13.732731', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 00:53:39\"}');
INSERT INTO `base_sys_log` VALUES ('1898', '2021-03-26 01:08:13.746145', '2021-03-26 01:08:13.746145', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 00:53:39\"}');
INSERT INTO `base_sys_log` VALUES ('1899', '2021-03-26 01:08:14.643016', '2021-03-26 01:08:14.643016', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1900', '2021-03-26 01:08:14.647011', '2021-03-26 01:08:14.647011', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1901', '2021-03-26 01:08:22.830845', '2021-03-26 01:08:22.830845', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1902', '2021-03-26 01:08:22.886484', '2021-03-26 01:08:22.886484', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1903', '2021-03-26 01:08:23.188488', '2021-03-26 01:08:23.188488', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1904', '2021-03-26 01:08:23.192543', '2021-03-26 01:08:23.192543', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1905', '2021-03-26 01:08:24.176971', '2021-03-26 01:08:24.176971', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1906', '2021-03-26 01:08:24.189006', '2021-03-26 01:08:24.189006', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1907', '2021-03-26 01:08:24.345179', '2021-03-26 01:08:24.345179', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1908', '2021-03-26 01:08:24.380523', '2021-03-26 01:08:24.380523', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1909', '2021-03-26 01:08:25.879445', '2021-03-26 01:08:25.879445', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1910', '2021-03-26 01:08:26.762181', '2021-03-26 01:08:26.762181', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1911', '2021-03-26 01:08:27.050497', '2021-03-26 01:08:27.050497', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1912', '2021-03-26 01:08:27.249647', '2021-03-26 01:08:27.249647', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1913', '2021-03-26 01:08:27.461013', '2021-03-26 01:08:27.461013', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1914', '2021-03-26 01:08:27.636003', '2021-03-26 01:08:27.636003', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1915', '2021-03-26 01:08:47.422470', '2021-03-26 01:08:47.422470', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1916', '2021-03-26 01:08:47.430921', '2021-03-26 01:08:47.430921', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1917', '2021-03-26 01:08:47.733019', '2021-03-26 01:08:47.733019', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1918', '2021-03-26 01:08:47.740645', '2021-03-26 01:08:47.740645', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1919', '2021-03-26 01:08:51.069392', '2021-03-26 01:08:51.069392', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1920', '2021-03-26 01:08:51.077124', '2021-03-26 01:08:51.077124', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1921', '2021-03-26 01:08:51.170274', '2021-03-26 01:08:51.170274', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1922', '2021-03-26 01:08:51.175245', '2021-03-26 01:08:51.175245', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('1923', '2021-03-26 01:09:06.522755', '2021-03-26 01:09:06.522755', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1924', '2021-03-26 01:09:06.527726', '2021-03-26 01:09:06.527726', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1925', '2021-03-26 01:09:06.830398', '2021-03-26 01:09:06.830398', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1926', '2021-03-26 01:09:06.834511', '2021-03-26 01:09:06.834511', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1927', '2021-03-26 01:09:15.003330', '2021-03-26 01:09:15.003330', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/deviceq\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:08:13\"}');
INSERT INTO `base_sys_log` VALUES ('1928', '2021-03-26 01:09:15.008527', '2021-03-26 01:09:15.008527', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/deviceq\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:08:13\"}');
INSERT INTO `base_sys_log` VALUES ('1929', '2021-03-26 01:09:15.439524', '2021-03-26 01:09:15.439524', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1930', '2021-03-26 01:09:15.445957', '2021-03-26 01:09:15.445957', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1931', '2021-03-26 01:09:18.739148', '2021-03-26 01:09:18.739148', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1932', '2021-03-26 01:09:18.816058', '2021-03-26 01:09:18.816058', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1933', '2021-03-26 01:09:19.173532', '2021-03-26 01:09:19.173532', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1934', '2021-03-26 01:09:19.178556', '2021-03-26 01:09:19.178556', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1935', '2021-03-26 01:09:20.321243', '2021-03-26 01:09:20.321243', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1936', '2021-03-26 01:09:20.324644', '2021-03-26 01:09:20.324644', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1937', '2021-03-26 01:09:20.419948', '2021-03-26 01:09:20.419948', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1938', '2021-03-26 01:09:20.424645', '2021-03-26 01:09:20.424645', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1939', '2021-03-26 01:09:21.352184', '2021-03-26 01:09:21.352184', null, '/iceq', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1940', '2021-03-26 01:09:33.409098', '2021-03-26 01:09:33.409098', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYxNjY4NDk2OSwiZXhwIjoxNjE3OTgwOTY5fQ.J7uUxxAEMJMJQjWXX5CoLQWwl4PVVZuD73vA2vX9H-k\"}');
INSERT INTO `base_sys_log` VALUES ('1941', '2021-03-26 01:09:33.498567', '2021-03-26 01:09:33.498567', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1942', '2021-03-26 01:09:33.507013', '2021-03-26 01:09:33.507013', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1943', '2021-03-26 01:09:33.817207', '2021-03-26 01:09:33.817207', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1944', '2021-03-26 01:09:33.823296', '2021-03-26 01:09:33.823296', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1945', '2021-03-26 01:09:34.922008', '2021-03-26 01:09:34.922008', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1946', '2021-03-26 01:09:34.926494', '2021-03-26 01:09:34.926494', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1947', '2021-03-26 01:09:35.008317', '2021-03-26 01:09:35.008317', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1948', '2021-03-26 01:09:35.018121', '2021-03-26 01:09:35.018121', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1949', '2021-03-26 01:09:41.898494', '2021-03-26 01:09:41.898494', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1950', '2021-03-26 01:09:41.914491', '2021-03-26 01:09:41.914491', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1951', '2021-03-26 01:09:42.258683', '2021-03-26 01:09:42.258683', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1952', '2021-03-26 01:09:42.264815', '2021-03-26 01:09:42.264815', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1953', '2021-03-26 01:09:42.392594', '2021-03-26 01:09:42.392594', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1954', '2021-03-26 01:09:42.400824', '2021-03-26 01:09:42.400824', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1955', '2021-03-26 01:09:48.137138', '2021-03-26 01:09:48.137138', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1956', '2021-03-26 01:09:48.145663', '2021-03-26 01:09:48.145663', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1957', '2021-03-26 01:09:48.443626', '2021-03-26 01:09:48.443626', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1958', '2021-03-26 01:09:48.448336', '2021-03-26 01:09:48.448336', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1959', '2021-03-26 01:10:01.937531', '2021-03-26 01:10:01.937531', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1960', '2021-03-26 01:10:01.942080', '2021-03-26 01:10:01.942080', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1961', '2021-03-26 01:10:06.113855', '2021-03-26 01:10:06.113855', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1962', '2021-03-26 01:10:06.120157', '2021-03-26 01:10:06.120157', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1963', '2021-03-26 01:10:06.422477', '2021-03-26 01:10:06.422477', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1964', '2021-03-26 01:10:06.426717', '2021-03-26 01:10:06.426717', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1965', '2021-03-26 01:10:13.469842', '2021-03-26 01:10:13.469842', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:09:15\"}');
INSERT INTO `base_sys_log` VALUES ('1966', '2021-03-26 01:10:13.474689', '2021-03-26 01:10:13.474689', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:09:15\"}');
INSERT INTO `base_sys_log` VALUES ('1967', '2021-03-26 01:10:14.008279', '2021-03-26 01:10:14.008279', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1968', '2021-03-26 01:10:14.012730', '2021-03-26 01:10:14.012730', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1969', '2021-03-26 01:10:23.285963', '2021-03-26 01:10:23.285963', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1970', '2021-03-26 01:10:23.335450', '2021-03-26 01:10:23.335450', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1971', '2021-03-26 01:10:23.714018', '2021-03-26 01:10:23.714018', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1972', '2021-03-26 01:10:23.718012', '2021-03-26 01:10:23.718012', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1973', '2021-03-26 01:10:23.801179', '2021-03-26 01:10:23.801179', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1974', '2021-03-26 01:10:23.805814', '2021-03-26 01:10:23.805814', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1975', '2021-03-26 01:10:24.720581', '2021-03-26 01:10:24.720581', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1976', '2021-03-26 01:10:24.725422', '2021-03-26 01:10:24.725422', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1977', '2021-03-26 01:10:24.813306', '2021-03-26 01:10:24.813306', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1978', '2021-03-26 01:10:24.816538', '2021-03-26 01:10:24.816538', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1979', '2021-03-26 01:10:27.839732', '2021-03-26 01:10:27.839732', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1980', '2021-03-26 01:10:27.848008', '2021-03-26 01:10:27.848008', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1981', '2021-03-26 01:10:28.167563', '2021-03-26 01:10:28.167563', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1982', '2021-03-26 01:10:28.171672', '2021-03-26 01:10:28.171672', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1983', '2021-03-26 01:10:28.260855', '2021-03-26 01:10:28.260855', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1984', '2021-03-26 01:10:28.265343', '2021-03-26 01:10:28.265343', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('1985', '2021-03-26 01:10:33.074216', '2021-03-26 01:10:33.074216', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1986', '2021-03-26 01:10:33.078652', '2021-03-26 01:10:33.078652', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1987', '2021-03-26 01:10:33.163666', '2021-03-26 01:10:33.163666', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1988', '2021-03-26 01:10:33.167377', '2021-03-26 01:10:33.167377', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('1989', '2021-03-26 01:10:46.117045', '2021-03-26 01:10:46.117045', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1990', '2021-03-26 01:10:46.120829', '2021-03-26 01:10:46.120829', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1991', '2021-03-26 01:10:48.636350', '2021-03-26 01:10:48.636350', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1992', '2021-03-26 01:10:48.645350', '2021-03-26 01:10:48.645350', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('1993', '2021-03-26 01:10:48.934241', '2021-03-26 01:10:48.934241', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1994', '2021-03-26 01:10:48.939001', '2021-03-26 01:10:48.939001', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1995', '2021-03-26 01:10:55.788780', '2021-03-26 01:10:55.788780', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:10:13\"}');
INSERT INTO `base_sys_log` VALUES ('1996', '2021-03-26 01:10:55.793661', '2021-03-26 01:10:55.793661', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:10:13\"}');
INSERT INTO `base_sys_log` VALUES ('1997', '2021-03-26 01:10:56.216052', '2021-03-26 01:10:56.216052', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1998', '2021-03-26 01:10:56.226389', '2021-03-26 01:10:56.226389', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('1999', '2021-03-26 01:11:00.231302', '2021-03-26 01:11:00.231302', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2000', '2021-03-26 01:11:00.244113', '2021-03-26 01:11:00.244113', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2001', '2021-03-26 01:11:00.560634', '2021-03-26 01:11:00.560634', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2002', '2021-03-26 01:11:00.566323', '2021-03-26 01:11:00.566323', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2003', '2021-03-26 01:11:01.566599', '2021-03-26 01:11:01.566599', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2004', '2021-03-26 01:11:01.571848', '2021-03-26 01:11:01.571848', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2005', '2021-03-26 01:11:01.682494', '2021-03-26 01:11:01.682494', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2006', '2021-03-26 01:11:01.701381', '2021-03-26 01:11:01.701381', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2007', '2021-03-26 01:11:02.930390', '2021-03-26 01:11:02.930390', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2008', '2021-03-26 01:11:08.236488', '2021-03-26 01:11:08.236488', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2009', '2021-03-26 01:11:08.287104', '2021-03-26 01:11:08.287104', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2010', '2021-03-26 01:11:08.580806', '2021-03-26 01:11:08.580806', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2011', '2021-03-26 01:11:08.584655', '2021-03-26 01:11:08.584655', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2012', '2021-03-26 01:11:10.919727', '2021-03-26 01:11:10.919727', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2013', '2021-03-26 01:11:10.929641', '2021-03-26 01:11:10.929641', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2014', '2021-03-26 01:11:11.008823', '2021-03-26 01:11:11.008823', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2015', '2021-03-26 01:11:11.013451', '2021-03-26 01:11:11.013451', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2016', '2021-03-26 01:11:15.767262', '2021-03-26 01:11:15.767262', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2017', '2021-03-26 01:11:15.779844', '2021-03-26 01:11:15.779844', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2018', '2021-03-26 01:11:16.070807', '2021-03-26 01:11:16.070807', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2019', '2021-03-26 01:11:16.075494', '2021-03-26 01:11:16.075494', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2020', '2021-03-26 01:11:20.976615', '2021-03-26 01:11:20.976615', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:10:55\"}');
INSERT INTO `base_sys_log` VALUES ('2021', '2021-03-26 01:11:20.981391', '2021-03-26 01:11:20.981391', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:10:55\"}');
INSERT INTO `base_sys_log` VALUES ('2022', '2021-03-26 01:11:21.560956', '2021-03-26 01:11:21.560956', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2023', '2021-03-26 01:11:21.565066', '2021-03-26 01:11:21.565066', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2024', '2021-03-26 01:11:25.885002', '2021-03-26 01:11:25.885002', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2025', '2021-03-26 01:11:25.956738', '2021-03-26 01:11:25.956738', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2026', '2021-03-26 01:11:26.352557', '2021-03-26 01:11:26.352557', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2027', '2021-03-26 01:11:26.357249', '2021-03-26 01:11:26.357249', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2028', '2021-03-26 01:11:29.644263', '2021-03-26 01:11:29.644263', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2029', '2021-03-26 01:11:29.647477', '2021-03-26 01:11:29.647477', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2030', '2021-03-26 01:11:29.745676', '2021-03-26 01:11:29.745676', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2031', '2021-03-26 01:11:29.749713', '2021-03-26 01:11:29.749713', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2032', '2021-03-26 01:11:38.414352', '2021-03-26 01:11:38.414352', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2033', '2021-03-26 01:11:38.422365', '2021-03-26 01:11:38.422365', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2034', '2021-03-26 01:11:39.199551', '2021-03-26 01:11:39.199551', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2035', '2021-03-26 01:11:39.208492', '2021-03-26 01:11:39.208492', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2036', '2021-03-26 01:11:41.746460', '2021-03-26 01:11:41.746460', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2037', '2021-03-26 01:11:41.757940', '2021-03-26 01:11:41.757940', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2038', '2021-03-26 01:11:55.093367', '2021-03-26 01:11:55.093367', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2039', '2021-03-26 01:11:55.097812', '2021-03-26 01:11:55.097812', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2040', '2021-03-26 01:11:55.120183', '2021-03-26 01:11:55.120183', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2041', '2021-03-26 01:11:55.124953', '2021-03-26 01:11:55.124953', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2042', '2021-03-26 01:12:17.914634', '2021-03-26 01:12:17.914634', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2043', '2021-03-26 01:12:17.919220', '2021-03-26 01:12:17.919220', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2044', '2021-03-26 01:12:18.215300', '2021-03-26 01:12:18.215300', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2045', '2021-03-26 01:12:18.219301', '2021-03-26 01:12:18.219301', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2046', '2021-03-26 01:12:26.821790', '2021-03-26 01:12:26.821790', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:11:21\"}');
INSERT INTO `base_sys_log` VALUES ('2047', '2021-03-26 01:12:26.826908', '2021-03-26 01:12:26.826908', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:11:21\"}');
INSERT INTO `base_sys_log` VALUES ('2048', '2021-03-26 01:12:27.271535', '2021-03-26 01:12:27.271535', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2049', '2021-03-26 01:12:27.275757', '2021-03-26 01:12:27.275757', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2050', '2021-03-26 01:12:31.446848', '2021-03-26 01:12:31.446848', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2051', '2021-03-26 01:12:31.450525', '2021-03-26 01:12:31.450525', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2052', '2021-03-26 01:12:34.002163', '2021-03-26 01:12:34.002163', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2053', '2021-03-26 01:12:34.012604', '2021-03-26 01:12:34.012604', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2054', '2021-03-26 01:12:34.355376', '2021-03-26 01:12:34.355376', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2055', '2021-03-26 01:12:34.361465', '2021-03-26 01:12:34.361465', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2056', '2021-03-26 01:12:34.902131', '2021-03-26 01:12:34.902131', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2057', '2021-03-26 01:12:34.906364', '2021-03-26 01:12:34.906364', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2058', '2021-03-26 01:12:35.036924', '2021-03-26 01:12:35.036924', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2059', '2021-03-26 01:12:35.041416', '2021-03-26 01:12:35.041416', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2060', '2021-03-26 01:12:36.572153', '2021-03-26 01:12:36.572153', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2061', '2021-03-26 01:12:37.378075', '2021-03-26 01:12:37.378075', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2062', '2021-03-26 01:12:37.665555', '2021-03-26 01:12:37.665555', null, '/ice', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2063', '2021-03-26 01:12:41.904537', '2021-03-26 01:12:41.904537', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2064', '2021-03-26 01:12:41.956944', '2021-03-26 01:12:41.956944', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2065', '2021-03-26 01:12:42.267644', '2021-03-26 01:12:42.267644', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2066', '2021-03-26 01:12:42.271878', '2021-03-26 01:12:42.271878', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2067', '2021-03-26 01:12:43.805667', '2021-03-26 01:12:43.805667', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2068', '2021-03-26 01:12:43.812394', '2021-03-26 01:12:43.812394', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2069', '2021-03-26 01:12:46.770220', '2021-03-26 01:12:46.770220', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2070', '2021-03-26 01:12:46.773766', '2021-03-26 01:12:46.773766', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2071', '2021-03-26 01:12:46.788292', '2021-03-26 01:12:46.788292', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2072', '2021-03-26 01:12:46.791832', '2021-03-26 01:12:46.791832', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2073', '2021-03-26 01:12:56.047372', '2021-03-26 01:12:56.047372', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:12:26\"}');
INSERT INTO `base_sys_log` VALUES ('2074', '2021-03-26 01:12:56.053369', '2021-03-26 01:12:56.053369', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":null,\"router\":\"/device\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-dept\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-26 01:12:26\"}');
INSERT INTO `base_sys_log` VALUES ('2075', '2021-03-26 01:12:56.540971', '2021-03-26 01:12:56.540971', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2076', '2021-03-26 01:12:56.544571', '2021-03-26 01:12:56.544571', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2077', '2021-03-26 01:12:58.029966', '2021-03-26 01:12:58.029966', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2078', '2021-03-26 01:12:58.035705', '2021-03-26 01:12:58.035705', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2079', '2021-03-26 01:12:58.102707', '2021-03-26 01:12:58.102707', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('2080', '2021-03-26 01:12:58.108843', '2021-03-26 01:12:58.108843', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('2081', '2021-03-26 15:07:10.902702', '2021-03-26 15:07:10.902702', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYxNjY5MjE3MywiZXhwIjoxNjE3OTg4MTczfQ.AGRBkiVFbmDfp_jSAvo-AE3wZpI67vQ6AbPxAFLXYws\"}');
INSERT INTO `base_sys_log` VALUES ('2082', '2021-03-26 15:07:11.013113', '2021-03-26 15:07:11.013113', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2083', '2021-03-26 15:07:11.022241', '2021-03-26 15:07:11.022241', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2084', '2021-03-26 15:07:11.454577', '2021-03-26 15:07:11.454577', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2085', '2021-03-26 15:07:11.470059', '2021-03-26 15:07:11.470059', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2086', '2021-03-26 15:07:15.531866', '2021-03-26 15:07:15.531866', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2087', '2021-03-26 15:07:15.537612', '2021-03-26 15:07:15.537612', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2088', '2021-03-26 15:07:15.545224', '2021-03-26 15:07:15.545224', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('2089', '2021-03-26 15:07:15.552216', '2021-03-26 15:07:15.552216', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('2090', '2021-03-26 15:07:15.793492', '2021-03-26 15:07:15.793492', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2091', '2021-03-26 15:07:15.799591', '2021-03-26 15:07:15.799591', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2092', '2021-03-26 15:07:28.460367', '2021-03-26 15:07:28.460367', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMTMiXSwidXNlcm5hbWUiOiJqeHN4aWFvd2FuZyIsInVzZXJJZCI6MzQsInBhc3N3b3JkVmVyc2lvbiI6MSwiaWF0IjoxNjE2Njg1MTY5LCJleHAiOjE2MTc5ODExNjl9.7paaoa5oUMqLRoSu-pWBhBlAYfPkX-ccMmXcHEj9TOg\"}');
INSERT INTO `base_sys_log` VALUES ('2093', '2021-03-26 15:07:29.183865', '2021-03-26 15:07:29.183865', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2094', '2021-03-26 15:07:29.203805', '2021-03-26 15:07:29.203805', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2095', '2021-03-26 15:07:32.617546', '2021-03-26 15:07:32.617546', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2096', '2021-03-26 15:07:32.623284', '2021-03-26 15:07:32.623284', '34', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2097', '2021-03-26 15:07:32.717951', '2021-03-26 15:07:32.717951', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2098', '2021-03-26 15:07:32.723990', '2021-03-26 15:07:32.723990', '34', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('2099', '2021-03-26 15:07:34.882501', '2021-03-26 15:07:34.882501', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2100', '2021-03-26 15:07:34.895585', '2021-03-26 15:07:34.895585', '34', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('2101', '2021-03-26 15:07:36.665111', '2021-03-26 15:07:36.665111', '34', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2102', '2021-03-26 15:07:36.676058', '2021-03-26 15:07:36.676058', '34', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2103', '2021-03-26 15:07:43.188480', '2021-03-26 15:07:43.188480', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2104', '2021-03-26 15:07:43.196957', '2021-03-26 15:07:43.196957', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2105', '2021-03-26 15:07:49.761470', '2021-03-26 15:07:49.761470', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2106', '2021-03-26 15:07:49.770562', '2021-03-26 15:07:49.770562', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2107', '2021-03-26 15:07:50.066896', '2021-03-26 15:07:50.066896', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2108', '2021-03-26 15:07:50.070981', '2021-03-26 15:07:50.070981', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2109', '2021-03-26 15:08:06.881769', '2021-03-26 15:08:06.881769', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2110', '2021-03-26 15:08:06.885750', '2021-03-26 15:08:06.885750', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2111', '2021-03-26 15:08:06.952355', '2021-03-26 15:08:06.952355', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2112', '2021-03-26 15:08:06.958689', '2021-03-26 15:08:06.958689', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('2113', '2021-03-26 15:09:06.347058', '2021-03-26 15:09:06.347058', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2114', '2021-03-26 15:09:06.352811', '2021-03-26 15:09:06.352811', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2115', '2021-03-26 15:10:50.706797', '2021-03-26 15:10:50.706797', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2116', '2021-03-26 15:10:50.767525', '2021-03-26 15:10:50.767525', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2117', '2021-03-26 15:10:51.085280', '2021-03-26 15:10:51.085280', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('2118', '2021-03-26 15:10:51.089206', '2021-03-26 15:10:51.089206', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);

-- ----------------------------
-- Table structure for `base_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_menu`;
CREATE TABLE `base_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `router` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0：目录 1：菜单 2：按钮',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `orderNum` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `viewPath` varchar(255) DEFAULT NULL COMMENT '视图地址',
  `keepAlive` tinyint(4) NOT NULL DEFAULT '1' COMMENT '路由缓存',
  `isShow` tinyint(4) NOT NULL DEFAULT '1' COMMENT '父菜单名称',
  PRIMARY KEY (`id`),
  KEY `IDX_05e3d6a56604771a6da47ebf8e` (`createTime`),
  KEY `IDX_d5203f18daaf7c3fe0ab34497f` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_menu
-- ----------------------------
INSERT INTO `base_sys_menu` VALUES ('1', '2019-09-11 11:14:44.000000', '2021-03-25 12:20:19.000000', null, '工作台', '/', null, '0', 'icon-workbench', '2', null, '1', '0');
INSERT INTO `base_sys_menu` VALUES ('2', '2019-09-11 11:14:47.000000', '2021-02-27 17:16:05.000000', null, '系统管理', '/sys', null, '0', 'icon-system', '2', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('8', '1900-01-20 23:19:57.000000', '2021-03-08 22:59:12.000000', '27', '菜单列表', '/sys/menu', null, '1', 'icon-menu', '2', 'cool/modules/base/views/menu.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('10', '1900-01-20 00:19:27.325000', '1900-01-20 00:19:27.325000', '8', '新增', null, 'base:sys:menu:add', '2', null, '1', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('11', '1900-01-20 00:19:51.101000', '1900-01-20 00:19:51.101000', '8', '删除', null, 'base:sys:menu:delete', '2', null, '2', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('12', '1900-01-20 00:20:05.150000', '1900-01-20 00:20:05.150000', '8', '修改', null, 'base:sys:menu:update', '2', null, '3', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('13', '1900-01-20 00:20:19.341000', '1900-01-20 00:20:19.341000', '8', '查询', null, 'base:sys:menu:page,base:sys:menu:list,base:sys:menu:info', '2', null, '4', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('22', '2019-09-12 00:34:01.000000', '2021-03-08 22:59:23.000000', '27', '角色列表', '/sys/role', null, '1', 'icon-common', '3', 'cool/modules/base/views/role.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('23', '1900-01-20 00:34:23.459000', '1900-01-20 00:34:23.459000', '22', '新增', null, 'base:sys:role:add', '2', null, '1', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('24', '1900-01-20 00:34:40.523000', '1900-01-20 00:34:40.523000', '22', '删除', null, 'base:sys:role:delete', '2', null, '2', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('25', '1900-01-20 00:34:53.306000', '1900-01-20 00:34:53.306000', '22', '修改', null, 'base:sys:role:update', '2', null, '3', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('26', '1900-01-20 00:35:05.024000', '1900-01-20 00:35:05.024000', '22', '查询', null, 'base:sys:role:page,base:sys:role:list,base:sys:role:info', '2', null, '4', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('27', '2019-09-12 15:52:44.000000', '2019-09-15 22:11:56.000000', '2', '权限管理', null, null, '0', 'icon-auth', '1', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('29', '2019-09-12 17:35:51.000000', '2021-03-08 23:01:39.000000', '105', '请求日志', '/sys/log', null, '1', 'icon-log', '1', 'cool/modules/base/views/log.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('30', '2019-09-12 17:37:03.000000', '2021-03-03 10:16:26.000000', '29', '权限', null, 'base:sys:log:page,base:sys:log:clear,base:sys:log:getKeep,base:sys:log:setKeep', '2', null, '1', null, '0', '1');
INSERT INTO `base_sys_menu` VALUES ('43', '2019-11-07 14:22:34.000000', '2021-03-08 23:02:51.000000', '45', 'crud 示例', '/crud', null, '1', 'icon-favor', '1', 'cool/modules/demo/views/crud.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('45', '2019-11-07 22:36:57.000000', '2019-11-11 15:21:10.000000', '1', '组件库', '/ui-lib', null, '0', 'icon-common', '2', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('47', '2019-11-08 09:35:08.000000', '2021-03-24 14:51:41.000000', null, '框架教程', '/tutorial', null, '0', 'icon-task', '4', null, '1', '0');
INSERT INTO `base_sys_menu` VALUES ('48', '2019-11-08 09:35:53.000000', '2021-03-03 11:03:21.000000', '47', '文档', '/tutorial/doc', null, '1', 'icon-log', '0', 'https://admin.cool-js.com', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('49', '2019-11-09 22:11:13.000000', '2021-03-09 09:50:46.000000', '45', 'quill 富文本编辑器', '/editor-quill', null, '1', 'icon-favor', '2', 'cool/modules/demo/views/editor-quill.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('59', '2019-11-18 16:50:27.000000', '2019-11-18 16:50:27.000000', '97', '部门列表', null, 'base:sys:department:list', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('60', '2019-11-18 16:50:45.000000', '2019-11-18 16:50:45.000000', '97', '新增部门', null, 'base:sys:department:add', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('61', '2019-11-18 16:50:59.000000', '2019-11-18 16:50:59.000000', '97', '更新部门', null, 'base:sys:department:update', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('62', '2019-11-18 16:51:13.000000', '2019-11-18 16:51:13.000000', '97', '删除部门', null, 'base:sys:department:delete', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('63', '2019-11-18 17:49:35.000000', '2019-11-18 17:49:35.000000', '97', '部门排序', null, 'base:sys:department:order', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('65', '2019-11-18 23:59:21.000000', '2019-11-18 23:59:21.000000', '97', '用户转移', null, 'base:sys:user:move', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('78', '2019-12-10 13:27:56.000000', '2021-02-27 17:08:53.000000', '2', '参数配置', null, null, '0', 'icon-common', '4', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('79', '1900-01-20 13:29:33.000000', '2021-03-08 23:01:48.000000', '78', '参数列表', '/sys/param', null, '1', 'icon-menu', '0', 'cool/modules/base/views/param.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('80', '1900-01-20 13:29:50.146000', '1900-01-20 13:29:50.146000', '79', '新增', null, 'base:sys:param:add', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('81', '1900-01-20 13:30:10.030000', '1900-01-20 13:30:10.030000', '79', '修改', null, 'base:sys:param:info,base:sys:param:update', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('82', '1900-01-20 13:30:25.791000', '1900-01-20 13:30:25.791000', '79', '删除', null, 'base:sys:param:delete', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('83', '1900-01-20 13:30:40.469000', '1900-01-20 13:30:40.469000', '79', '查看', null, 'base:sys:param:page,base:sys:param:list,base:sys:param:info', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('84', '2020-07-25 16:21:30.000000', '2020-07-25 16:21:30.000000', null, '通用', null, null, '0', 'icon-radioboxfill', '99', null, '1', '0');
INSERT INTO `base_sys_menu` VALUES ('85', '2020-07-25 16:22:14.000000', '2021-03-03 10:36:00.000000', '84', '图片上传', null, 'space:info:page,space:info:list,space:info:info,space:info:add,space:info:delete,space:info:update,space:type:page,space:type:list,space:type:info,space:type:add,space:type:delete,space:type:update', '2', null, '1', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('86', '2020-08-12 09:56:27.000000', '2021-03-08 23:03:03.000000', '45', '文件上传', '/upload', null, '1', 'icon-favor', '3', 'cool/modules/demo/views/upload.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('90', '1900-01-20 10:26:58.615000', '1900-01-20 10:26:58.615000', '84', '客服聊天', null, 'base:app:im:message:read,base:app:im:message:page,base:app:im:session:page,base:app:im:session:list,base:app:im:session:unreadCount,base:app:im:session:delete', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('96', '2021-01-12 14:12:20.000000', '2021-03-08 23:02:40.000000', '1', '组件预览', '/demo', null, '1', 'icon-favor', '0', 'cool/modules/demo/views/demo.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('97', '1900-01-20 14:14:02.000000', '2021-03-25 12:20:09.000000', '27', '用户列表', '/sys/user', null, '1', 'icon-user', '0', 'cool/modules/base/views/user.vue', '1', '0');
INSERT INTO `base_sys_menu` VALUES ('98', '1900-01-20 14:14:13.528000', '1900-01-20 14:14:13.528000', '97', '新增', null, 'base:sys:user:add', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('99', '1900-01-20 14:14:22.823000', '1900-01-20 14:14:22.823000', '97', '删除', null, 'base:sys:user:delete', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('100', '1900-01-20 14:14:33.973000', '1900-01-20 14:14:33.973000', '97', '修改', null, 'base:sys:user:delete,base:sys:user:update', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('101', '2021-01-12 14:14:51.000000', '2021-01-12 14:14:51.000000', '97', '查询', null, 'base:sys:user:page,base:sys:user:list,base:sys:user:info', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('105', '2021-01-21 10:42:55.000000', '2021-01-21 10:42:55.000000', '2', '监控管理', null, null, '0', 'icon-rank', '6', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('109', '2021-02-27 14:13:56.000000', '2021-02-27 17:09:19.000000', null, '插件管理', null, null, '0', 'icon-menu', '3', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('110', '2021-02-27 14:14:13.000000', '2021-03-08 23:01:30.000000', '109', '插件列表', '/plugin', null, '1', 'icon-menu', '0', 'cool/modules/base/views/plugin.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('111', '2021-02-27 14:24:41.877000', '2021-02-27 14:24:41.877000', '110', '编辑', null, 'base:plugin:info:info,base:plugin:info:update', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('112', '2021-02-27 14:24:52.159000', '2021-02-27 14:24:52.159000', '110', '列表', null, 'base:plugin:info:list', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('113', '2021-02-27 14:25:02.066000', '2021-02-27 14:25:02.066000', '110', '删除', null, 'base:plugin:info:delete', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('114', '2021-02-27 16:36:59.322000', '2021-02-27 16:36:59.322000', '110', '保存配置', null, 'base:plugin:info:config', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('115', '2021-02-27 16:38:21.000000', '2021-02-27 18:18:22.000000', '110', '获取配置', null, 'base:plugin:info:getConfig', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('116', '2021-02-27 17:57:42.000000', '2021-02-27 18:19:35.000000', '110', '开启、关闭', null, 'base:plugin:info:enable', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('117', '2021-03-05 10:58:25.000000', '2021-03-05 10:58:25.000000', null, '任务管理', null, null, '0', 'icon-activity', '5', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('118', '2021-03-05 10:59:42.000000', '2021-03-05 10:59:42.000000', '117', '任务列表', '/task', null, '1', 'icon-menu', '0', 'cool/modules/task/views/task.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('119', '2021-03-05 11:00:00.000000', '2021-03-05 11:00:00.000000', '118', '权限', null, 'task:info:page,task:info:list,task:info:info,task:info:add,task:info:delete,task:info:update,task:info:stop,task:info:start,task:info:once,task:info:log', '2', null, '0', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('120', '2021-03-24 10:11:31.000000', '2021-03-26 01:12:56.000000', null, '设备列表', '/device', 'machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,base:user:list', '1', 'icon-dept', '1', 'cool/modules/machine/views/device.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('121', '2021-03-24 17:26:18.000000', '2021-03-25 17:39:40.000000', null, '客户列表', '/user', 'base:sys:user:page,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update', '1', 'icon-user', '0', 'cool/modules/base/views/user.vue', '1', '1');

-- ----------------------------
-- Table structure for `base_sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_param`;
CREATE TABLE `base_sys_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `keyName` varchar(255) NOT NULL COMMENT '键位',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `data` text NOT NULL COMMENT '数据',
  `dataType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据类型 0:字符串 1：数组 2：键值对',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_cf19b5e52d8c71caa9c4534454` (`keyName`),
  KEY `IDX_7bcb57371b481d8e2d66ddeaea` (`createTime`),
  KEY `IDX_479122e3bf464112f7a7253dac` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_param
-- ----------------------------
INSERT INTO `base_sys_param` VALUES ('1', '2021-02-26 13:53:05.000000', '2021-03-03 17:50:04.000000', 'text', '富文本参数', '<p><strong class=\"ql-size-huge\">111xxxxx2222<span class=\"ql-cursor\">﻿﻿</span></strong></p>', '0', null);
INSERT INTO `base_sys_param` VALUES ('2', '2021-02-26 13:53:18.000000', '2021-02-26 13:53:18.000000', 'json', 'JSON参数', '{\n    code: 111\n}', '0', null);

-- ----------------------------
-- Table structure for `base_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role`;
CREATE TABLE `base_sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `userId` varchar(255) NOT NULL COMMENT '用户ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `label` varchar(50) DEFAULT NULL COMMENT '角色标签',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `relevance` int(11) NOT NULL DEFAULT '1' COMMENT '数据权限是否关联上下级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_469d49a5998170e9550cf113da` (`name`),
  UNIQUE KEY `IDX_f3f24fbbccf00192b076e549a7` (`label`),
  KEY `IDX_6f01184441dec49207b41bfd92` (`createTime`),
  KEY `IDX_d64ca209f3fc52128d9b20e97b` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_role
-- ----------------------------
INSERT INTO `base_sys_role` VALUES ('1', '2021-02-24 21:18:39.682358', '2021-02-24 21:18:39.682358', '1', '超管', 'admin', '最高权限的角色', '1');
INSERT INTO `base_sys_role` VALUES ('10', '2021-02-26 14:15:38.000000', '2021-03-25 22:54:15.000000', '1', '总公司', 'admin-sys', '', '1');
INSERT INTO `base_sys_role` VALUES ('11', '2021-02-26 14:16:49.000000', '2021-03-25 22:54:05.000000', '1', '客户', 'client', null, '0');
INSERT INTO `base_sys_role` VALUES ('12', '2021-02-26 14:26:51.000000', '2021-03-25 22:53:56.000000', '1', '工程商', 'project', null, '0');
INSERT INTO `base_sys_role` VALUES ('13', '2021-02-26 14:27:58.000000', '2021-03-25 22:53:43.000000', '1', '经销商', 'dealer', null, '0');

-- ----------------------------
-- Table structure for `base_sys_role_department`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role_department`;
CREATE TABLE `base_sys_role_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `roleId` bigint(20) NOT NULL COMMENT '角色ID',
  `departmentId` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`),
  KEY `IDX_e881a66f7cce83ba431cf20194` (`createTime`),
  KEY `IDX_cbf48031efee5d0de262965e53` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_role_department
-- ----------------------------
INSERT INTO `base_sys_role_department` VALUES ('97', '2021-03-25 22:53:43.968850', '2021-03-25 22:53:43.968850', '13', '11');
INSERT INTO `base_sys_role_department` VALUES ('98', '2021-03-25 22:53:44.006641', '2021-03-25 22:53:44.006641', '13', '14');
INSERT INTO `base_sys_role_department` VALUES ('99', '2021-03-25 22:53:44.159447', '2021-03-25 22:53:44.159447', '13', '15');
INSERT INTO `base_sys_role_department` VALUES ('100', '2021-03-25 22:53:56.436925', '2021-03-25 22:53:56.436925', '12', '14');
INSERT INTO `base_sys_role_department` VALUES ('101', '2021-03-25 22:53:56.576056', '2021-03-25 22:53:56.576056', '12', '15');
INSERT INTO `base_sys_role_department` VALUES ('102', '2021-03-25 22:54:05.787026', '2021-03-25 22:54:05.787026', '11', '15');
INSERT INTO `base_sys_role_department` VALUES ('103', '2021-03-25 22:54:16.883798', '2021-03-25 22:54:16.883798', '10', '1');
INSERT INTO `base_sys_role_department` VALUES ('104', '2021-03-25 22:54:16.907425', '2021-03-25 22:54:16.907425', '10', '11');
INSERT INTO `base_sys_role_department` VALUES ('105', '2021-03-25 22:54:16.929126', '2021-03-25 22:54:16.929126', '10', '14');
INSERT INTO `base_sys_role_department` VALUES ('106', '2021-03-25 22:54:16.952520', '2021-03-25 22:54:16.952520', '10', '15');

-- ----------------------------
-- Table structure for `base_sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role_menu`;
CREATE TABLE `base_sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `roleId` bigint(20) NOT NULL COMMENT '角色ID',
  `menuId` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `IDX_3641f81d4201c524a57ce2aa54` (`createTime`),
  KEY `IDX_f860298298b26e7a697be36e5b` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_role_menu
-- ----------------------------
INSERT INTO `base_sys_role_menu` VALUES ('1', '2021-02-26 12:00:18.240154', '2021-02-26 12:00:18.240154', '8', '1');
INSERT INTO `base_sys_role_menu` VALUES ('2', '2021-02-26 12:00:18.342131', '2021-02-26 12:00:18.342131', '8', '96');
INSERT INTO `base_sys_role_menu` VALUES ('3', '2021-02-26 12:00:18.444143', '2021-02-26 12:00:18.444143', '8', '45');
INSERT INTO `base_sys_role_menu` VALUES ('4', '2021-02-26 12:00:18.545490', '2021-02-26 12:00:18.545490', '8', '43');
INSERT INTO `base_sys_role_menu` VALUES ('5', '2021-02-26 12:00:18.649626', '2021-02-26 12:00:18.649626', '8', '49');
INSERT INTO `base_sys_role_menu` VALUES ('6', '2021-02-26 12:00:18.752369', '2021-02-26 12:00:18.752369', '8', '86');
INSERT INTO `base_sys_role_menu` VALUES ('7', '2021-02-26 12:00:18.856023', '2021-02-26 12:00:18.856023', '8', '2');
INSERT INTO `base_sys_role_menu` VALUES ('8', '2021-02-26 12:00:18.956131', '2021-02-26 12:00:18.956131', '8', '27');
INSERT INTO `base_sys_role_menu` VALUES ('9', '2021-02-26 12:00:19.071490', '2021-02-26 12:00:19.071490', '8', '97');
INSERT INTO `base_sys_role_menu` VALUES ('10', '2021-02-26 12:00:19.171745', '2021-02-26 12:00:19.171745', '8', '59');
INSERT INTO `base_sys_role_menu` VALUES ('11', '2021-02-26 12:00:19.274495', '2021-02-26 12:00:19.274495', '8', '60');
INSERT INTO `base_sys_role_menu` VALUES ('12', '2021-02-26 12:00:19.374610', '2021-02-26 12:00:19.374610', '8', '61');
INSERT INTO `base_sys_role_menu` VALUES ('13', '2021-02-26 12:00:19.474750', '2021-02-26 12:00:19.474750', '8', '62');
INSERT INTO `base_sys_role_menu` VALUES ('14', '2021-02-26 12:00:19.573369', '2021-02-26 12:00:19.573369', '8', '63');
INSERT INTO `base_sys_role_menu` VALUES ('15', '2021-02-26 12:00:19.674242', '2021-02-26 12:00:19.674242', '8', '65');
INSERT INTO `base_sys_role_menu` VALUES ('16', '2021-02-26 12:00:19.772886', '2021-02-26 12:00:19.772886', '8', '98');
INSERT INTO `base_sys_role_menu` VALUES ('17', '2021-02-26 12:00:19.874134', '2021-02-26 12:00:19.874134', '8', '99');
INSERT INTO `base_sys_role_menu` VALUES ('18', '2021-02-26 12:00:19.972728', '2021-02-26 12:00:19.972728', '8', '100');
INSERT INTO `base_sys_role_menu` VALUES ('19', '2021-02-26 12:00:20.085877', '2021-02-26 12:00:20.085877', '8', '101');
INSERT INTO `base_sys_role_menu` VALUES ('20', '2021-02-26 12:00:20.192887', '2021-02-26 12:00:20.192887', '8', '8');
INSERT INTO `base_sys_role_menu` VALUES ('21', '2021-02-26 12:00:20.293747', '2021-02-26 12:00:20.293747', '8', '10');
INSERT INTO `base_sys_role_menu` VALUES ('22', '2021-02-26 12:00:20.393491', '2021-02-26 12:00:20.393491', '8', '11');
INSERT INTO `base_sys_role_menu` VALUES ('23', '2021-02-26 12:00:20.495110', '2021-02-26 12:00:20.495110', '8', '12');
INSERT INTO `base_sys_role_menu` VALUES ('24', '2021-02-26 12:00:20.594083', '2021-02-26 12:00:20.594083', '8', '13');
INSERT INTO `base_sys_role_menu` VALUES ('25', '2021-02-26 12:00:20.695727', '2021-02-26 12:00:20.695727', '8', '22');
INSERT INTO `base_sys_role_menu` VALUES ('26', '2021-02-26 12:00:20.794729', '2021-02-26 12:00:20.794729', '8', '23');
INSERT INTO `base_sys_role_menu` VALUES ('27', '2021-02-26 12:00:20.895601', '2021-02-26 12:00:20.895601', '8', '24');
INSERT INTO `base_sys_role_menu` VALUES ('28', '2021-02-26 12:00:20.994972', '2021-02-26 12:00:20.994972', '8', '25');
INSERT INTO `base_sys_role_menu` VALUES ('29', '2021-02-26 12:00:21.110384', '2021-02-26 12:00:21.110384', '8', '26');
INSERT INTO `base_sys_role_menu` VALUES ('30', '2021-02-26 12:00:21.210970', '2021-02-26 12:00:21.210970', '8', '69');
INSERT INTO `base_sys_role_menu` VALUES ('31', '2021-02-26 12:00:21.311852', '2021-02-26 12:00:21.311852', '8', '70');
INSERT INTO `base_sys_role_menu` VALUES ('32', '2021-02-26 12:00:21.411591', '2021-02-26 12:00:21.411591', '8', '71');
INSERT INTO `base_sys_role_menu` VALUES ('33', '2021-02-26 12:00:21.513584', '2021-02-26 12:00:21.513584', '8', '72');
INSERT INTO `base_sys_role_menu` VALUES ('34', '2021-02-26 12:00:21.612212', '2021-02-26 12:00:21.612212', '8', '73');
INSERT INTO `base_sys_role_menu` VALUES ('35', '2021-02-26 12:00:21.712720', '2021-02-26 12:00:21.712720', '8', '74');
INSERT INTO `base_sys_role_menu` VALUES ('36', '2021-02-26 12:00:21.812839', '2021-02-26 12:00:21.812839', '8', '75');
INSERT INTO `base_sys_role_menu` VALUES ('37', '2021-02-26 12:00:21.913321', '2021-02-26 12:00:21.913321', '8', '76');
INSERT INTO `base_sys_role_menu` VALUES ('38', '2021-02-26 12:00:22.013970', '2021-02-26 12:00:22.013970', '8', '77');
INSERT INTO `base_sys_role_menu` VALUES ('39', '2021-02-26 12:00:22.144879', '2021-02-26 12:00:22.144879', '8', '78');
INSERT INTO `base_sys_role_menu` VALUES ('40', '2021-02-26 12:00:22.246707', '2021-02-26 12:00:22.246707', '8', '79');
INSERT INTO `base_sys_role_menu` VALUES ('41', '2021-02-26 12:00:22.347579', '2021-02-26 12:00:22.347579', '8', '80');
INSERT INTO `base_sys_role_menu` VALUES ('42', '2021-02-26 12:00:22.446947', '2021-02-26 12:00:22.446947', '8', '81');
INSERT INTO `base_sys_role_menu` VALUES ('43', '2021-02-26 12:00:22.547082', '2021-02-26 12:00:22.547082', '8', '82');
INSERT INTO `base_sys_role_menu` VALUES ('44', '2021-02-26 12:00:22.647197', '2021-02-26 12:00:22.647197', '8', '83');
INSERT INTO `base_sys_role_menu` VALUES ('45', '2021-02-26 12:00:22.748089', '2021-02-26 12:00:22.748089', '8', '105');
INSERT INTO `base_sys_role_menu` VALUES ('46', '2021-02-26 12:00:22.847814', '2021-02-26 12:00:22.847814', '8', '102');
INSERT INTO `base_sys_role_menu` VALUES ('47', '2021-02-26 12:00:22.949071', '2021-02-26 12:00:22.949071', '8', '103');
INSERT INTO `base_sys_role_menu` VALUES ('48', '2021-02-26 12:00:23.047353', '2021-02-26 12:00:23.047353', '8', '29');
INSERT INTO `base_sys_role_menu` VALUES ('49', '2021-02-26 12:00:23.147826', '2021-02-26 12:00:23.147826', '8', '30');
INSERT INTO `base_sys_role_menu` VALUES ('50', '2021-02-26 12:00:23.246800', '2021-02-26 12:00:23.246800', '8', '47');
INSERT INTO `base_sys_role_menu` VALUES ('51', '2021-02-26 12:00:23.349541', '2021-02-26 12:00:23.349541', '8', '48');
INSERT INTO `base_sys_role_menu` VALUES ('52', '2021-02-26 12:00:23.463177', '2021-02-26 12:00:23.463177', '8', '84');
INSERT INTO `base_sys_role_menu` VALUES ('53', '2021-02-26 12:00:23.564096', '2021-02-26 12:00:23.564096', '8', '90');
INSERT INTO `base_sys_role_menu` VALUES ('54', '2021-02-26 12:00:23.663815', '2021-02-26 12:00:23.663815', '8', '85');
INSERT INTO `base_sys_role_menu` VALUES ('55', '2021-02-26 12:01:05.971978', '2021-02-26 12:01:05.971978', '9', '1');
INSERT INTO `base_sys_role_menu` VALUES ('56', '2021-02-26 12:01:06.085568', '2021-02-26 12:01:06.085568', '9', '96');
INSERT INTO `base_sys_role_menu` VALUES ('57', '2021-02-26 12:01:06.198271', '2021-02-26 12:01:06.198271', '9', '45');
INSERT INTO `base_sys_role_menu` VALUES ('58', '2021-02-26 12:01:06.309736', '2021-02-26 12:01:06.309736', '9', '43');
INSERT INTO `base_sys_role_menu` VALUES ('59', '2021-02-26 12:01:06.410785', '2021-02-26 12:01:06.410785', '9', '49');
INSERT INTO `base_sys_role_menu` VALUES ('60', '2021-02-26 12:01:06.510712', '2021-02-26 12:01:06.510712', '9', '86');
INSERT INTO `base_sys_role_menu` VALUES ('61', '2021-02-26 12:01:06.612457', '2021-02-26 12:01:06.612457', '9', '2');
INSERT INTO `base_sys_role_menu` VALUES ('62', '2021-02-26 12:01:06.710397', '2021-02-26 12:01:06.710397', '9', '27');
INSERT INTO `base_sys_role_menu` VALUES ('63', '2021-02-26 12:01:06.809104', '2021-02-26 12:01:06.809104', '9', '97');
INSERT INTO `base_sys_role_menu` VALUES ('64', '2021-02-26 12:01:06.907088', '2021-02-26 12:01:06.907088', '9', '59');
INSERT INTO `base_sys_role_menu` VALUES ('65', '2021-02-26 12:01:07.009988', '2021-02-26 12:01:07.009988', '9', '60');
INSERT INTO `base_sys_role_menu` VALUES ('66', '2021-02-26 12:01:07.122372', '2021-02-26 12:01:07.122372', '9', '61');
INSERT INTO `base_sys_role_menu` VALUES ('67', '2021-02-26 12:01:07.223694', '2021-02-26 12:01:07.223694', '9', '62');
INSERT INTO `base_sys_role_menu` VALUES ('68', '2021-02-26 12:01:07.325022', '2021-02-26 12:01:07.325022', '9', '63');
INSERT INTO `base_sys_role_menu` VALUES ('69', '2021-02-26 12:01:07.425209', '2021-02-26 12:01:07.425209', '9', '65');
INSERT INTO `base_sys_role_menu` VALUES ('70', '2021-02-26 12:01:07.522081', '2021-02-26 12:01:07.522081', '9', '98');
INSERT INTO `base_sys_role_menu` VALUES ('71', '2021-02-26 12:01:07.622775', '2021-02-26 12:01:07.622775', '9', '99');
INSERT INTO `base_sys_role_menu` VALUES ('72', '2021-02-26 12:01:07.721181', '2021-02-26 12:01:07.721181', '9', '100');
INSERT INTO `base_sys_role_menu` VALUES ('73', '2021-02-26 12:01:07.819589', '2021-02-26 12:01:07.819589', '9', '101');
INSERT INTO `base_sys_role_menu` VALUES ('74', '2021-02-26 12:01:07.920497', '2021-02-26 12:01:07.920497', '9', '8');
INSERT INTO `base_sys_role_menu` VALUES ('75', '2021-02-26 12:01:08.018875', '2021-02-26 12:01:08.018875', '9', '10');
INSERT INTO `base_sys_role_menu` VALUES ('76', '2021-02-26 12:01:08.135192', '2021-02-26 12:01:08.135192', '9', '11');
INSERT INTO `base_sys_role_menu` VALUES ('77', '2021-02-26 12:01:08.246405', '2021-02-26 12:01:08.246405', '9', '12');
INSERT INTO `base_sys_role_menu` VALUES ('78', '2021-02-26 12:01:08.346661', '2021-02-26 12:01:08.346661', '9', '13');
INSERT INTO `base_sys_role_menu` VALUES ('79', '2021-02-26 12:01:08.448436', '2021-02-26 12:01:08.448436', '9', '22');
INSERT INTO `base_sys_role_menu` VALUES ('80', '2021-02-26 12:01:08.547496', '2021-02-26 12:01:08.547496', '9', '23');
INSERT INTO `base_sys_role_menu` VALUES ('81', '2021-02-26 12:01:08.648457', '2021-02-26 12:01:08.648457', '9', '24');
INSERT INTO `base_sys_role_menu` VALUES ('82', '2021-02-26 12:01:08.750564', '2021-02-26 12:01:08.750564', '9', '25');
INSERT INTO `base_sys_role_menu` VALUES ('83', '2021-02-26 12:01:08.851783', '2021-02-26 12:01:08.851783', '9', '26');
INSERT INTO `base_sys_role_menu` VALUES ('84', '2021-02-26 12:01:08.950898', '2021-02-26 12:01:08.950898', '9', '69');
INSERT INTO `base_sys_role_menu` VALUES ('85', '2021-02-26 12:01:09.061982', '2021-02-26 12:01:09.061982', '9', '70');
INSERT INTO `base_sys_role_menu` VALUES ('86', '2021-02-26 12:01:09.165258', '2021-02-26 12:01:09.165258', '9', '71');
INSERT INTO `base_sys_role_menu` VALUES ('87', '2021-02-26 12:01:09.266177', '2021-02-26 12:01:09.266177', '9', '72');
INSERT INTO `base_sys_role_menu` VALUES ('88', '2021-02-26 12:01:09.366427', '2021-02-26 12:01:09.366427', '9', '73');
INSERT INTO `base_sys_role_menu` VALUES ('89', '2021-02-26 12:01:09.467877', '2021-02-26 12:01:09.467877', '9', '74');
INSERT INTO `base_sys_role_menu` VALUES ('90', '2021-02-26 12:01:09.568526', '2021-02-26 12:01:09.568526', '9', '75');
INSERT INTO `base_sys_role_menu` VALUES ('91', '2021-02-26 12:01:09.668052', '2021-02-26 12:01:09.668052', '9', '76');
INSERT INTO `base_sys_role_menu` VALUES ('92', '2021-02-26 12:01:09.766367', '2021-02-26 12:01:09.766367', '9', '77');
INSERT INTO `base_sys_role_menu` VALUES ('93', '2021-02-26 12:01:09.866170', '2021-02-26 12:01:09.866170', '9', '78');
INSERT INTO `base_sys_role_menu` VALUES ('94', '2021-02-26 12:01:09.963037', '2021-02-26 12:01:09.963037', '9', '79');
INSERT INTO `base_sys_role_menu` VALUES ('95', '2021-02-26 12:01:10.082046', '2021-02-26 12:01:10.082046', '9', '80');
INSERT INTO `base_sys_role_menu` VALUES ('96', '2021-02-26 12:01:10.185024', '2021-02-26 12:01:10.185024', '9', '81');
INSERT INTO `base_sys_role_menu` VALUES ('97', '2021-02-26 12:01:10.283787', '2021-02-26 12:01:10.283787', '9', '82');
INSERT INTO `base_sys_role_menu` VALUES ('98', '2021-02-26 12:01:10.382883', '2021-02-26 12:01:10.382883', '9', '83');
INSERT INTO `base_sys_role_menu` VALUES ('99', '2021-02-26 12:01:10.481150', '2021-02-26 12:01:10.481150', '9', '105');
INSERT INTO `base_sys_role_menu` VALUES ('100', '2021-02-26 12:01:10.579579', '2021-02-26 12:01:10.579579', '9', '102');
INSERT INTO `base_sys_role_menu` VALUES ('101', '2021-02-26 12:01:10.679489', '2021-02-26 12:01:10.679489', '9', '103');
INSERT INTO `base_sys_role_menu` VALUES ('102', '2021-02-26 12:01:10.777496', '2021-02-26 12:01:10.777496', '9', '29');
INSERT INTO `base_sys_role_menu` VALUES ('103', '2021-02-26 12:01:10.878292', '2021-02-26 12:01:10.878292', '9', '30');
INSERT INTO `base_sys_role_menu` VALUES ('104', '2021-02-26 12:01:10.977354', '2021-02-26 12:01:10.977354', '9', '47');
INSERT INTO `base_sys_role_menu` VALUES ('105', '2021-02-26 12:01:11.097786', '2021-02-26 12:01:11.097786', '9', '48');
INSERT INTO `base_sys_role_menu` VALUES ('106', '2021-02-26 12:01:11.201390', '2021-02-26 12:01:11.201390', '9', '84');
INSERT INTO `base_sys_role_menu` VALUES ('107', '2021-02-26 12:01:11.302120', '2021-02-26 12:01:11.302120', '9', '90');
INSERT INTO `base_sys_role_menu` VALUES ('108', '2021-02-26 12:01:11.402751', '2021-02-26 12:01:11.402751', '9', '85');
INSERT INTO `base_sys_role_menu` VALUES ('1121', '2021-03-25 22:53:43.900904', '2021-03-25 22:53:43.900904', '13', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1122', '2021-03-25 22:53:43.929786', '2021-03-25 22:53:43.929786', '13', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1123', '2021-03-25 22:53:56.372605', '2021-03-25 22:53:56.372605', '12', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1124', '2021-03-25 22:53:56.400678', '2021-03-25 22:53:56.400678', '12', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1125', '2021-03-25 22:54:05.743795', '2021-03-25 22:54:05.743795', '11', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1126', '2021-03-25 22:54:15.651674', '2021-03-25 22:54:15.651674', '10', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1127', '2021-03-25 22:54:15.679500', '2021-03-25 22:54:15.679500', '10', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1128', '2021-03-25 22:54:15.709713', '2021-03-25 22:54:15.709713', '10', '2');
INSERT INTO `base_sys_role_menu` VALUES ('1129', '2021-03-25 22:54:15.746670', '2021-03-25 22:54:15.746670', '10', '27');
INSERT INTO `base_sys_role_menu` VALUES ('1130', '2021-03-25 22:54:15.951551', '2021-03-25 22:54:15.951551', '10', '97');
INSERT INTO `base_sys_role_menu` VALUES ('1131', '2021-03-25 22:54:16.037515', '2021-03-25 22:54:16.037515', '10', '59');
INSERT INTO `base_sys_role_menu` VALUES ('1132', '2021-03-25 22:54:16.073103', '2021-03-25 22:54:16.073103', '10', '60');
INSERT INTO `base_sys_role_menu` VALUES ('1133', '2021-03-25 22:54:16.115203', '2021-03-25 22:54:16.115203', '10', '61');
INSERT INTO `base_sys_role_menu` VALUES ('1134', '2021-03-25 22:54:16.152099', '2021-03-25 22:54:16.152099', '10', '62');
INSERT INTO `base_sys_role_menu` VALUES ('1135', '2021-03-25 22:54:16.181918', '2021-03-25 22:54:16.181918', '10', '63');
INSERT INTO `base_sys_role_menu` VALUES ('1136', '2021-03-25 22:54:16.207667', '2021-03-25 22:54:16.207667', '10', '65');
INSERT INTO `base_sys_role_menu` VALUES ('1137', '2021-03-25 22:54:16.233939', '2021-03-25 22:54:16.233939', '10', '98');
INSERT INTO `base_sys_role_menu` VALUES ('1138', '2021-03-25 22:54:16.263834', '2021-03-25 22:54:16.263834', '10', '99');
INSERT INTO `base_sys_role_menu` VALUES ('1139', '2021-03-25 22:54:16.288506', '2021-03-25 22:54:16.288506', '10', '100');
INSERT INTO `base_sys_role_menu` VALUES ('1140', '2021-03-25 22:54:16.316385', '2021-03-25 22:54:16.316385', '10', '101');
INSERT INTO `base_sys_role_menu` VALUES ('1141', '2021-03-25 22:54:16.342815', '2021-03-25 22:54:16.342815', '10', '8');
INSERT INTO `base_sys_role_menu` VALUES ('1142', '2021-03-25 22:54:16.373468', '2021-03-25 22:54:16.373468', '10', '10');
INSERT INTO `base_sys_role_menu` VALUES ('1143', '2021-03-25 22:54:16.398335', '2021-03-25 22:54:16.398335', '10', '11');
INSERT INTO `base_sys_role_menu` VALUES ('1144', '2021-03-25 22:54:16.427138', '2021-03-25 22:54:16.427138', '10', '12');
INSERT INTO `base_sys_role_menu` VALUES ('1145', '2021-03-25 22:54:16.453832', '2021-03-25 22:54:16.453832', '10', '13');
INSERT INTO `base_sys_role_menu` VALUES ('1146', '2021-03-25 22:54:16.479971', '2021-03-25 22:54:16.479971', '10', '22');
INSERT INTO `base_sys_role_menu` VALUES ('1147', '2021-03-25 22:54:16.502717', '2021-03-25 22:54:16.502717', '10', '23');
INSERT INTO `base_sys_role_menu` VALUES ('1148', '2021-03-25 22:54:16.524949', '2021-03-25 22:54:16.524949', '10', '24');
INSERT INTO `base_sys_role_menu` VALUES ('1149', '2021-03-25 22:54:16.547136', '2021-03-25 22:54:16.547136', '10', '25');
INSERT INTO `base_sys_role_menu` VALUES ('1150', '2021-03-25 22:54:16.568422', '2021-03-25 22:54:16.568422', '10', '26');
INSERT INTO `base_sys_role_menu` VALUES ('1151', '2021-03-25 22:54:16.592324', '2021-03-25 22:54:16.592324', '10', '78');
INSERT INTO `base_sys_role_menu` VALUES ('1152', '2021-03-25 22:54:16.615771', '2021-03-25 22:54:16.615771', '10', '79');
INSERT INTO `base_sys_role_menu` VALUES ('1153', '2021-03-25 22:54:16.638529', '2021-03-25 22:54:16.638529', '10', '80');
INSERT INTO `base_sys_role_menu` VALUES ('1154', '2021-03-25 22:54:16.661251', '2021-03-25 22:54:16.661251', '10', '81');
INSERT INTO `base_sys_role_menu` VALUES ('1155', '2021-03-25 22:54:16.684685', '2021-03-25 22:54:16.684685', '10', '82');
INSERT INTO `base_sys_role_menu` VALUES ('1156', '2021-03-25 22:54:16.705581', '2021-03-25 22:54:16.705581', '10', '83');
INSERT INTO `base_sys_role_menu` VALUES ('1157', '2021-03-25 22:54:16.726761', '2021-03-25 22:54:16.726761', '10', '105');
INSERT INTO `base_sys_role_menu` VALUES ('1158', '2021-03-25 22:54:16.749833', '2021-03-25 22:54:16.749833', '10', '29');
INSERT INTO `base_sys_role_menu` VALUES ('1159', '2021-03-25 22:54:16.777745', '2021-03-25 22:54:16.777745', '10', '30');
INSERT INTO `base_sys_role_menu` VALUES ('1160', '2021-03-25 22:54:16.805590', '2021-03-25 22:54:16.805590', '10', '117');
INSERT INTO `base_sys_role_menu` VALUES ('1161', '2021-03-25 22:54:16.829583', '2021-03-25 22:54:16.829583', '10', '118');
INSERT INTO `base_sys_role_menu` VALUES ('1162', '2021-03-25 22:54:16.852101', '2021-03-25 22:54:16.852101', '10', '119');

-- ----------------------------
-- Table structure for `base_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_user`;
CREATE TABLE `base_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `departmentId` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `passwordV` int(11) NOT NULL DEFAULT '1' COMMENT '密码版本, 作用是改完密码，让原来的token失效',
  `nickName` varchar(255) DEFAULT NULL COMMENT '昵称',
  `headImg` varchar(255) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1：启用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级人员ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_469ad55973f5b98930f6ad627b` (`username`),
  KEY `IDX_0cf944da378d70a94f5fefd803` (`departmentId`),
  KEY `IDX_9ec6d7ac6337eafb070e4881a8` (`phone`),
  KEY `IDX_ca8611d15a63d52aa4e292e46a` (`createTime`),
  KEY `IDX_a0f2f19cee18445998ece93ddd` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_user
-- ----------------------------
INSERT INTO `base_sys_user` VALUES ('1', '2021-02-24 21:16:41.525157', '2021-02-27 18:21:16.000000', '1', '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3', '管理员', 'https://cool-admin-pro.oss-cn-shanghai.aliyuncs.com/app/c8128c24-d0e9-4e07-9c0d-6f65446e105b.png', '18000000000', 'team@cool-js.com', '1', '拥有最高权限的用户', null);
INSERT INTO `base_sys_user` VALUES ('31', '2021-03-25 12:23:12.000000', '2021-03-25 12:23:12.000000', '1', '云闸机管理员', 'cloudadmin', 'e10adc3949ba59abbe56e057f20f883e', '1', '云闸机管理员', '', null, null, '1', null, '1');
INSERT INTO `base_sys_user` VALUES ('32', '2021-03-25 12:28:17.304311', '2021-03-25 12:28:17.304311', '14', '工程商小A', 'gcsa', 'e10adc3949ba59abbe56e057f20f883e', '1', '工程商小A', null, null, null, '1', null, '1');
INSERT INTO `base_sys_user` VALUES ('33', '2021-03-25 17:46:46.000000', '2021-03-25 17:46:46.000000', '15', '客户小绿', 'khxiaolv', 'e10adc3949ba59abbe56e057f20f883e', '1', '客户小绿', null, null, null, '1', null, '1');
INSERT INTO `base_sys_user` VALUES ('34', '2021-03-25 23:12:10.419769', '2021-03-25 23:12:10.419769', '11', '经销商小王', 'jxsxiaowang', 'e10adc3949ba59abbe56e057f20f883e', '1', '经销商小王', null, null, null, '1', null, '1');

-- ----------------------------
-- Table structure for `base_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_user_role`;
CREATE TABLE `base_sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `userId` bigint(20) NOT NULL COMMENT '用户ID',
  `roleId` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `IDX_fa9555e03e42fce748c9046b1c` (`createTime`),
  KEY `IDX_3e36c0d2b1a4c659c6b4fc64b3` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_user_role
-- ----------------------------
INSERT INTO `base_sys_user_role` VALUES ('1', '2021-02-24 22:03:11.665805', '2021-02-24 22:03:11.665805', '1', '1');
INSERT INTO `base_sys_user_role` VALUES ('2', '2021-02-25 11:03:55.325988', '2021-02-25 11:03:55.325988', '2', '1');
INSERT INTO `base_sys_user_role` VALUES ('3', '2021-02-25 14:30:57.295150', '2021-02-25 14:30:57.295150', '3', '1');
INSERT INTO `base_sys_user_role` VALUES ('4', '2021-02-25 14:39:32.975014', '2021-02-25 14:39:32.975014', '4', '1');
INSERT INTO `base_sys_user_role` VALUES ('5', '2021-02-25 14:40:56.812948', '2021-02-25 14:40:56.812948', '5', '1');
INSERT INTO `base_sys_user_role` VALUES ('6', '2021-02-25 14:44:08.436555', '2021-02-25 14:44:08.436555', '6', '1');
INSERT INTO `base_sys_user_role` VALUES ('7', '2021-02-25 14:46:17.409232', '2021-02-25 14:46:17.409232', '7', '1');
INSERT INTO `base_sys_user_role` VALUES ('8', '2021-02-25 14:47:47.211749', '2021-02-25 14:47:47.211749', '8', '1');
INSERT INTO `base_sys_user_role` VALUES ('9', '2021-02-25 14:48:11.734024', '2021-02-25 14:48:11.734024', '9', '1');
INSERT INTO `base_sys_user_role` VALUES ('10', '2021-02-25 14:50:48.288616', '2021-02-25 14:50:48.288616', '10', '1');
INSERT INTO `base_sys_user_role` VALUES ('11', '2021-02-25 14:51:32.123884', '2021-02-25 14:51:32.123884', '11', '1');
INSERT INTO `base_sys_user_role` VALUES ('12', '2021-02-25 15:46:26.356943', '2021-02-25 15:46:26.356943', '12', '1');
INSERT INTO `base_sys_user_role` VALUES ('13', '2021-02-25 15:56:43.475155', '2021-02-25 15:56:43.475155', '13', '1');
INSERT INTO `base_sys_user_role` VALUES ('14', '2021-02-25 16:03:14.417784', '2021-02-25 16:03:14.417784', '14', '1');
INSERT INTO `base_sys_user_role` VALUES ('16', '2021-02-25 16:22:11.200152', '2021-02-25 16:22:11.200152', '16', '1');
INSERT INTO `base_sys_user_role` VALUES ('17', '2021-02-25 17:44:37.635550', '2021-02-25 17:44:37.635550', '15', '1');
INSERT INTO `base_sys_user_role` VALUES ('19', '2021-02-25 17:51:00.554812', '2021-02-25 17:51:00.554812', '18', '1');
INSERT INTO `base_sys_user_role` VALUES ('21', '2021-02-25 17:54:41.375113', '2021-02-25 17:54:41.375113', '17', '1');
INSERT INTO `base_sys_user_role` VALUES ('22', '2021-02-25 17:55:49.385301', '2021-02-25 17:55:49.385301', '20', '1');
INSERT INTO `base_sys_user_role` VALUES ('24', '2021-02-25 17:58:35.452363', '2021-02-25 17:58:35.452363', '22', '1');
INSERT INTO `base_sys_user_role` VALUES ('27', '2021-02-25 21:25:55.005236', '2021-02-25 21:25:55.005236', '19', '1');
INSERT INTO `base_sys_user_role` VALUES ('28', '2021-02-26 13:50:05.633242', '2021-02-26 13:50:05.633242', '21', '8');
INSERT INTO `base_sys_user_role` VALUES ('29', '2021-02-26 13:50:17.836990', '2021-02-26 13:50:17.836990', '23', '8');
INSERT INTO `base_sys_user_role` VALUES ('38', '2021-02-26 14:36:08.899046', '2021-02-26 14:36:08.899046', '26', '13');
INSERT INTO `base_sys_user_role` VALUES ('39', '2021-02-26 14:36:13.149510', '2021-02-26 14:36:13.149510', '25', '13');
INSERT INTO `base_sys_user_role` VALUES ('40', '2021-02-26 14:36:20.737073', '2021-02-26 14:36:20.737073', '27', '11');
INSERT INTO `base_sys_user_role` VALUES ('42', '2021-02-26 14:36:53.481478', '2021-02-26 14:36:53.481478', '24', '12');
INSERT INTO `base_sys_user_role` VALUES ('43', '2021-02-26 14:36:58.477817', '2021-02-26 14:36:58.477817', '28', '12');
INSERT INTO `base_sys_user_role` VALUES ('44', '2021-02-26 14:36:58.577114', '2021-02-26 14:36:58.577114', '28', '10');
INSERT INTO `base_sys_user_role` VALUES ('45', '2021-03-24 14:55:04.161942', '2021-03-24 14:55:04.161942', '29', '12');
INSERT INTO `base_sys_user_role` VALUES ('46', '2021-03-24 14:55:36.930007', '2021-03-24 14:55:36.930007', '30', '11');
INSERT INTO `base_sys_user_role` VALUES ('48', '2021-03-25 12:24:45.741154', '2021-03-25 12:24:45.741154', '31', '10');
INSERT INTO `base_sys_user_role` VALUES ('49', '2021-03-25 12:28:17.356671', '2021-03-25 12:28:17.356671', '32', '12');
INSERT INTO `base_sys_user_role` VALUES ('51', '2021-03-25 17:47:00.106072', '2021-03-25 17:47:00.106072', '33', '11');
INSERT INTO `base_sys_user_role` VALUES ('52', '2021-03-25 23:12:10.466827', '2021-03-25 23:12:10.466827', '34', '13');

-- ----------------------------
-- Table structure for `core_config`
-- ----------------------------
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE `core_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `cKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '配置键 唯一性',
  `cValue` text COLLATE utf8_unicode_ci NOT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_fd61f44f8fc57eaf4694a4fd56` (`cKey`),
  KEY `IDX_bd838f3b2d5bfa596c57412646` (`createTime`),
  KEY `IDX_ad74623a3e9a43335eac8d1154` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_config
-- ----------------------------
INSERT INTO `core_config` VALUES ('1', '2021-03-23 13:22:42.617506', '2021-03-23 13:22:42.617506', 'redis.redis', '{\n    \"host\": \"127.0.0.1\",\n    \"password\": \"\",\n    \"port\": 6379,\n    \"db\": 2\n}');

-- ----------------------------
-- Table structure for `core_module`
-- ----------------------------
DROP TABLE IF EXISTS `core_module`;
CREATE TABLE `core_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '模块名称',
  `dbInit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否初始化数据库 0：否 1：是',
  `allConfig` text COLLATE utf8_unicode_ci COMMENT '配置所有',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_bb5e1af48c40f92cf059d45d56` (`name`),
  KEY `IDX_b3a06b55a1bbed1dbf9110ba5f` (`createTime`),
  KEY `IDX_3660f389f2b8204a9ae3d0da08` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_module
-- ----------------------------
INSERT INTO `core_module` VALUES ('1', '2021-03-23 11:07:22.488803', '2021-03-23 11:07:22.488803', 'base', '1', '{\"name\":\"权限管理\",\"description\":\"基础的权限管理功能，包括登录，权限校验\",\"middlewares\":[\"baseAuthorityMiddleware\",\"baseLogMiddleware\"]}');
INSERT INTO `core_module` VALUES ('2', '2021-03-23 11:07:22.551728', '2021-03-23 11:07:22.551728', 'demo', '0', '{\"name\":\"测试模块\",\"description\":\"演示示例\",\"middlewares\":[]}');
INSERT INTO `core_module` VALUES ('3', '2021-03-23 11:07:22.627762', '2021-03-23 11:07:22.627762', 'space', '0', '{\"name\":\"文件空间\",\"description\":\"上传和管理文件资源\",\"middlewares\":[]}');
INSERT INTO `core_module` VALUES ('4', '2021-03-23 11:07:22.692689', '2021-03-23 11:07:22.692689', 'task', '1', '{\"name\":\"任务调度\",\"description\":\"任务调度模块，支持分布式任务，由redis整个集群的任务\",\"middlewares\":[]}');
INSERT INTO `core_module` VALUES ('5', '2021-03-23 17:24:54.074859', '2021-03-23 17:24:54.074859', 'device', '0', '{\"name\":\"设备模块\",\"description\":\"演示示例\",\"middlewares\":[]}');
INSERT INTO `core_module` VALUES ('6', '2021-03-23 17:30:45.207996', '2021-03-23 17:30:45.207996', 'machine', '0', '{\"name\":\"设备模块\",\"description\":\"演示示例\",\"middlewares\":[]}');

-- ----------------------------
-- Table structure for `core_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `core_plugin`;
CREATE TABLE `core_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '作者',
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系方式',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT '功能描述',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '版本号',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用 0：否 1：是',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:缺少配置 1:可用 2: 配置错误 3:未知错误',
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '命名空间',
  `view` text COLLATE utf8_unicode_ci COMMENT '页面信息',
  `providerId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实例ID',
  `replaceProvider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '替换的实例',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_eecfe4f7cae1c102745ffccb9d` (`name`),
  KEY `IDX_851967f56db40707b8a55914d7` (`createTime`),
  KEY `IDX_b9880bb45d647eba03fc3052c4` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_plugin
-- ----------------------------
INSERT INTO `core_plugin` VALUES ('1', '2021-03-23 11:07:22.793438', '2021-03-23 13:23:22.000000', '阿里云OSS', 'cool官方', '邮箱：team@cool-js.com', '将文件上传到阿里云oss，前端签名直传方式', '1.0.12', '0', '0', 'oss', '[{\n    \"label\": \"accessKeyId\",\n    \"prop\": \"accessKeyId\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"阿里云accessKeyId\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"130px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"accessKeySecret\",\n    \"prop\": \"accessKeySecret\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"阿里云accessKeySecret\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"130px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"bucket\",\n    \"prop\": \"bucket\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"阿里云oss的bucket\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"130px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"endpoint\",\n    \"prop\": \"endpoint\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"阿里云oss的endpoint\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"130px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"timeout\",\n    \"prop\": \"timeout\",\n    \"value\": \"3600s\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"阿里云oss的timeout\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"130px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}]', 'oss:ossFileHandler', 'coolFile');
INSERT INTO `core_plugin` VALUES ('2', '2021-03-23 11:07:22.795035', '2021-03-26 15:06:52.000000', '任务与队列', 'cool官方', '邮箱：team@cool-js.com', '基于redis的任务与队列，支持分布式任务(注: 配置完redis需要重启生效)', '1.0.6', '1', '3', 'queue', null, 'queue:coolQueue', null);
INSERT INTO `core_plugin` VALUES ('3', '2021-03-23 11:07:22.799042', '2021-03-26 15:06:52.000000', 'Redis缓存', 'cool官方', '邮箱：team@cool-js.com', '替换系统的默认缓存为redis', '1.0.9', '1', '3', 'redis', '[{\n    \"label\": \"配置\",\n    \"prop\": \"redis\",\n    \"component\": {\n        \"name\": \"cl-codemirror\",\n        \"attrs\": {\n            \"placeholder\": \"{\\\"host\\\":\\\"127.0.0.1\\\",\\\"password\\\":\\\"\\\",\\\"port\\\":6379,\\\"db\\\":2}\"\n        },\n        \"props\":{\n            \"height\": \"200px\"\n        }\n    },\n    \"value\": \"{\\\"host\\\":\\\"127.0.0.1\\\",\\\"password\\\":\\\"\\\",\\\"port\\\":6379,\\\"db\\\":2}\",\n    \"props\": {\n        \"label-width\": \"80px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}]', 'redis:redisCacheHandler', 'coolCache');
INSERT INTO `core_plugin` VALUES ('4', '2021-03-23 11:07:22.805164', '2021-03-23 13:23:19.000000', '支付宝支付', 'cool官方', '邮箱：team@cool-js.com', '方便集成支付宝支付的sdk', '1.0.3', '0', '0', 'alipay', '[{\n    \"label\": \"appId\",\n    \"prop\": \"appId\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"支付宝应用ID\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"notifyUrl\",\n    \"prop\": \"notifyUrl\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"支付回调地址\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"沙箱环境\",\n    \"prop\": \"sandbox\",\n    \"value\": \"0\",\n    \"component\": {\n        \"name\": \"el-radio-group\",\n        \"options\": [{\n                \"label\": \"关闭\",\n                \"value\": \"0\"\n            },\n            {\n                \"label\": \"开启\",\n                \"value\": \"1\"\n            }\n        ]\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"signType\",\n    \"prop\": \"signType\",\n    \"value\": \"RSA2\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"异步回调地址\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"公钥\",\n    \"prop\": \"rsaPublic\",\n    \"component\": {\n        \"name\": \"cl-upload\",\n        \"attrs\": {\n            \"placeholder\": \"支付宝公钥\"\n        },\n        \"props\": {\n            \"list-type\": \"text\",\n            \"accept\": \"*\",\n            \"limit\": 1\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    }\n}, {\n    \"label\": \"私钥\",\n    \"prop\": \"rsaPrivate\",\n    \"component\": {\n        \"name\": \"cl-upload\",\n        \"attrs\": {\n            \"placeholder\": \"支付宝私钥\"\n        },\n        \"props\": {\n            \"list-type\": \"text\",\n            \"accept\": \"*\",\n            \"limit\": 1\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    }\n}]', 'alipay:sdk', null);
INSERT INTO `core_plugin` VALUES ('5', '2021-03-23 11:07:22.812964', '2021-03-23 13:23:19.000000', '微信支付', 'cool官方', '邮箱：team@cool-js.com', '基于tenpay的微信支付', '1.0.12', '0', '0', 'wxpay', '[{\n    \"label\": \"appid\",\n    \"prop\": \"appid\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"微信应用ID\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"mchid\",\n    \"prop\": \"mchid\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"微信商户ID\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"partnerKey\",\n    \"prop\": \"partnerKey\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"微信商户秘钥\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"notify_url\",\n    \"prop\": \"notify_url\",\n    \"component\": {\n        \"name\": \"el-input\",\n        \"attrs\": {\n            \"placeholder\": \"异步回调地址\"\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}, {\n    \"label\": \"证书\",\n    \"prop\": \"pfx\",\n    \"component\": {\n        \"name\": \"cl-upload\",\n        \"attrs\": {\n            \"placeholder\": \"证书\"\n        },\n        \"props\": {\n            \"list-type\": \"text\",\n            \"accept\": \"*\",\n            \"limit\": 1\n        }\n    },\n    \"props\": {\n        \"label-width\": \"100px\"\n    }\n}]', 'wxpay:sdk', null);

-- ----------------------------
-- Table structure for `demo_app_goods`
-- ----------------------------
DROP TABLE IF EXISTS `demo_app_goods`;
CREATE TABLE `demo_app_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pic` varchar(255) NOT NULL COMMENT '图片',
  `price` decimal(5,2) NOT NULL COMMENT '价格',
  `type` tinyint(4) NOT NULL COMMENT '分类',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `IDX_de2b99b64158bb4030487d7475` (`createTime`),
  KEY `IDX_f84cff6dc28b1a5dcc53856e66` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of demo_app_goods
-- ----------------------------
INSERT INTO `demo_app_goods` VALUES ('1', '2021-03-02 17:22:10.687462', '2021-03-02 17:22:10.687462', 'cool-mall商城', 'https://docs.cool-js.com/mall/show05.jpeg', '20.00', '0', '0');

-- ----------------------------
-- Table structure for `device`
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '设备名称',
  `channelName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '通道名称',
  `mac` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'MAC地址',
  `status` int(11) NOT NULL COMMENT '设备状态（1:在线，2:离线）',
  `userId` int(11) DEFAULT NULL COMMENT 'ID',
  `maintainerId` int(11) DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`),
  KEY `IDX_9f0c9e0e35531a5befca29b925` (`createTime`),
  KEY `IDX_0ee311787989e037e971497b7c` (`updateTime`),
  KEY `FK_9eb58b0b777dbc2864820228ebc` (`userId`),
  KEY `FK_a6f181651d88e67e77e48b05e38` (`maintainerId`),
  CONSTRAINT `FK_9eb58b0b777dbc2864820228ebc` FOREIGN KEY (`userId`) REFERENCES `base_sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a6f181651d88e67e77e48b05e38` FOREIGN KEY (`maintainerId`) REFERENCES `base_sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('2', '2021-03-26 00:23:52.644216', '2021-03-26 00:23:52.644216', '翼闸机场', 'channel yi zha', '44:56:44:56:44:56:44:5ab', '1', null, null);
INSERT INTO `device` VALUES ('3', '2021-03-26 00:35:47.168204', '2021-03-26 00:35:47.168204', '翼闸车站', 'channel2233', 'dsa:asd:34:dsa:asd:34:dsa:asd:34', '1', null, null);
INSERT INTO `device` VALUES ('4', '2021-03-26 00:40:46.256127', '2021-03-26 00:40:46.256127', '213', '123', '123123', '1', null, null);
INSERT INTO `device` VALUES ('5', '2021-03-26 00:41:09.988350', '2021-03-26 00:41:09.988350', 'sad', 'asddasd', 'asdad', '1', '1', null);

-- ----------------------------
-- Table structure for `task_info`
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `jobId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务ID',
  `repeatConf` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '任务配置',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `cron` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'cron',
  `limit` int(11) DEFAULT NULL COMMENT '最大执行次数 不传为无限次',
  `every` int(11) DEFAULT NULL COMMENT '每间隔多少毫秒执行一次 如果cron设置了 这项设置就无效',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0:停止 1：运行',
  `startDate` datetime DEFAULT NULL COMMENT '开始时间',
  `endDate` datetime DEFAULT NULL COMMENT '结束时间',
  `data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据',
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '执行的service实例ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:系统 1：用户',
  `nextRunTime` datetime DEFAULT NULL COMMENT '下一次执行时间',
  `taskType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:cron 1：时间间隔',
  PRIMARY KEY (`id`),
  KEY `IDX_6ced02f467e59bd6306b549bb0` (`createTime`),
  KEY `IDX_2adc6f9c241391126f27dac145` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_info
-- ----------------------------
INSERT INTO `task_info` VALUES ('1', '2021-03-10 14:25:13.381172', '2021-03-10 14:25:19.011000', null, '{\"count\":1,\"type\":1,\"limit\":5,\"name\":\"每秒执行,总共5次\",\"taskType\":1,\"every\":1000,\"service\":\"taskDemoService.test()\",\"status\":1,\"id\":1,\"createTime\":\"2021-03-10 14:25:13\",\"updateTime\":\"2021-03-10 14:25:13\",\"jobId\":1}', '每秒执行,总共5次', null, '5', '1000', null, '0', null, null, null, 'taskDemoService.test()', '1', '2021-03-10 14:25:18', '1');
INSERT INTO `task_info` VALUES ('2', '2021-03-10 14:25:53.000000', '2021-03-24 12:52:19.494481', null, '{\"count\":1,\"id\":2,\"createTime\":\"2021-03-10 14:25:53\",\"updateTime\":\"2021-03-24 12:52:17\",\"name\":\"cron任务，5秒执行一次\",\"cron\":\"0/5 * * * * ? \",\"status\":1,\"service\":\"taskDemoService.test()\",\"type\":\"1\",\"taskType\":0,\"jobId\":2}', 'cron任务，5秒执行一次', '0/5 * * * * ? ', null, null, null, '0', null, null, null, 'taskDemoService.test()', '1', null, '0');

-- ----------------------------
-- Table structure for `task_log`
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `taskId` bigint(20) DEFAULT NULL COMMENT '任务ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:失败 1：成功',
  `detail` text COLLATE utf8_unicode_ci COMMENT '详情描述',
  PRIMARY KEY (`id`),
  KEY `IDX_b9af0e100be034924b270aab31` (`createTime`),
  KEY `IDX_8857d8d43d38bebd7159af1fa6` (`updateTime`),
  KEY `IDX_1142dfec452e924b346f060fda` (`taskId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of task_log
-- ----------------------------
INSERT INTO `task_log` VALUES ('1', '2021-03-10 14:25:14.020930', '2021-03-10 14:25:14.020930', '1', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('2', '2021-03-10 14:25:15.012030', '2021-03-10 14:25:15.012030', '1', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('3', '2021-03-10 14:25:16.011443', '2021-03-10 14:25:16.011443', '1', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('4', '2021-03-10 14:25:17.009939', '2021-03-10 14:25:17.009939', '1', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('5', '2021-03-10 14:25:18.010410', '2021-03-10 14:25:18.010410', '1', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('6', '2021-03-10 14:25:55.012816', '2021-03-10 14:25:55.012816', '2', '1', '');
INSERT INTO `task_log` VALUES ('7', '2021-03-10 14:26:00.011880', '2021-03-10 14:26:00.011880', '2', '1', '');
INSERT INTO `task_log` VALUES ('8', '2021-03-10 14:26:05.016832', '2021-03-10 14:26:05.016832', '2', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('9', '2021-03-10 14:26:10.011763', '2021-03-10 14:26:10.011763', '2', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('10', '2021-03-10 14:26:15.010246', '2021-03-10 14:26:15.010246', '2', '1', '\"任务执行成功\"');
INSERT INTO `task_log` VALUES ('11', '2021-03-23 14:06:25.022211', '2021-03-23 14:06:25.022211', '2', '1', '\"任务执行成功\"');
