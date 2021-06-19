/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : cool

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-06-19 16:23:17
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
) ENGINE=InnoDB AUTO_INCREMENT=7702 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_log
-- ----------------------------
INSERT INTO `base_sys_log` VALUES ('6498', '2021-06-16 09:35:07.364494', '2021-06-16 09:35:07.364494', null, '/', '::1', '无法获取地址信息', null);
INSERT INTO `base_sys_log` VALUES ('6499', '2021-06-16 09:37:16.159230', '2021-06-16 09:37:16.159230', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"\",\"verifyCode\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('6500', '2021-06-16 09:37:16.434026', '2021-06-16 09:37:16.434026', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6501', '2021-06-16 09:37:16.455269', '2021-06-16 09:37:16.455269', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6502', '2021-06-16 09:37:17.980114', '2021-06-16 09:37:17.980114', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6503', '2021-06-16 09:37:17.982267', '2021-06-16 09:37:17.982267', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6504', '2021-06-16 09:37:23.261294', '2021-06-16 09:37:23.261294', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6505', '2021-06-16 09:37:23.262431', '2021-06-16 09:37:23.262431', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6506', '2021-06-16 09:37:24.267386', '2021-06-16 09:37:24.267386', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6507', '2021-06-16 09:37:24.268439', '2021-06-16 09:37:24.268439', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6508', '2021-06-16 09:37:28.397772', '2021-06-16 09:37:28.397772', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6509', '2021-06-16 09:37:28.399663', '2021-06-16 09:37:28.399663', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6510', '2021-06-16 09:37:29.391910', '2021-06-16 09:37:29.391910', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6511', '2021-06-16 09:37:29.393659', '2021-06-16 09:37:29.393659', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6512', '2021-06-16 11:18:13.161328', '2021-06-16 11:18:13.161328', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6513', '2021-06-16 11:18:13.166029', '2021-06-16 11:18:13.166029', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6514', '2021-06-16 11:18:13.407359', '2021-06-16 11:18:13.407359', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6515', '2021-06-16 11:18:13.411056', '2021-06-16 11:18:13.411056', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6516', '2021-06-16 11:18:17.334418', '2021-06-16 11:18:17.334418', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6517', '2021-06-16 11:18:17.335622', '2021-06-16 11:18:17.335622', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6518', '2021-06-16 11:18:19.729472', '2021-06-16 11:18:19.729472', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6519', '2021-06-16 11:18:19.730749', '2021-06-16 11:18:19.730749', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6520', '2021-06-16 11:18:20.526942', '2021-06-16 11:18:20.526942', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6521', '2021-06-16 11:18:20.528125', '2021-06-16 11:18:20.528125', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6522', '2021-06-16 11:24:33.242814', '2021-06-16 11:24:33.242814', null, '/', '::1', '无法获取地址信息', null);
INSERT INTO `base_sys_log` VALUES ('6523', '2021-06-16 13:43:13.393936', '2021-06-16 13:43:13.393936', null, '/', '::1', '无法获取地址信息', null);
INSERT INTO `base_sys_log` VALUES ('6524', '2021-06-16 13:43:20.411825', '2021-06-16 13:43:20.411825', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"\",\"verifyCode\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('6525', '2021-06-16 13:43:20.486536', '2021-06-16 13:43:20.486536', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6526', '2021-06-16 13:43:20.509485', '2021-06-16 13:43:20.509485', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6527', '2021-06-16 13:43:21.776032', '2021-06-16 13:43:21.776032', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6528', '2021-06-16 13:43:21.777189', '2021-06-16 13:43:21.777189', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6529', '2021-06-16 13:43:21.791289', '2021-06-16 13:43:21.791289', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6530', '2021-06-16 13:43:21.792529', '2021-06-16 13:43:21.792529', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('6531', '2021-06-16 13:43:22.863391', '2021-06-16 13:43:22.863391', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6532', '2021-06-16 13:43:22.862417', '2021-06-16 13:43:22.862417', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6533', '2021-06-16 13:43:29.485444', '2021-06-16 13:43:29.485444', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6534', '2021-06-16 13:43:29.486478', '2021-06-16 13:43:29.486478', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6535', '2021-06-16 13:43:35.893193', '2021-06-16 13:43:35.893193', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6536', '2021-06-16 13:43:35.892214', '2021-06-16 13:43:35.892214', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6537', '2021-06-16 13:43:36.197533', '2021-06-16 13:43:36.197533', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6538', '2021-06-16 13:43:36.199832', '2021-06-16 13:43:36.199832', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6539', '2021-06-16 13:45:55.922193', '2021-06-16 13:45:55.922193', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6540', '2021-06-16 13:45:55.924777', '2021-06-16 13:45:55.924777', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6541', '2021-06-16 13:45:55.931885', '2021-06-16 13:45:55.931885', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6542', '2021-06-16 13:45:55.934299', '2021-06-16 13:45:55.934299', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6543', '2021-06-16 13:47:18.036710', '2021-06-16 13:47:18.036710', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6544', '2021-06-16 13:47:18.038531', '2021-06-16 13:47:18.038531', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6545', '2021-06-16 13:47:18.345814', '2021-06-16 13:47:18.345814', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6546', '2021-06-16 13:47:18.347604', '2021-06-16 13:47:18.347604', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6547', '2021-06-16 13:47:28.768469', '2021-06-16 13:47:28.768469', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6548', '2021-06-16 13:47:28.769718', '2021-06-16 13:47:28.769718', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6549', '2021-06-16 13:47:28.775274', '2021-06-16 13:47:28.775274', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6550', '2021-06-16 13:47:28.778458', '2021-06-16 13:47:28.778458', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6551', '2021-06-16 13:49:06.419946', '2021-06-16 13:49:06.419946', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6552', '2021-06-16 13:49:06.422001', '2021-06-16 13:49:06.422001', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6553', '2021-06-16 13:49:06.426686', '2021-06-16 13:49:06.426686', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6554', '2021-06-16 13:49:06.429103', '2021-06-16 13:49:06.429103', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6555', '2021-06-16 13:50:09.111472', '2021-06-16 13:50:09.111472', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6556', '2021-06-16 13:50:09.115502', '2021-06-16 13:50:09.115502', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6557', '2021-06-16 13:50:09.121178', '2021-06-16 13:50:09.121178', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6558', '2021-06-16 13:50:09.124459', '2021-06-16 13:50:09.124459', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6559', '2021-06-16 13:50:26.889296', '2021-06-16 13:50:26.889296', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6560', '2021-06-16 13:50:26.892745', '2021-06-16 13:50:26.892745', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6561', '2021-06-16 13:50:27.224258', '2021-06-16 13:50:27.224258', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6562', '2021-06-16 13:50:27.228989', '2021-06-16 13:50:27.228989', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"6\"}');
INSERT INTO `base_sys_log` VALUES ('6563', '2021-06-16 13:51:31.934467', '2021-06-16 13:51:31.934467', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6564', '2021-06-16 13:51:31.942969', '2021-06-16 13:51:31.942969', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6565', '2021-06-16 13:56:08.182496', '2021-06-16 13:56:08.182496', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6566', '2021-06-16 13:56:08.185678', '2021-06-16 13:56:08.185678', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6567', '2021-06-16 13:56:18.562539', '2021-06-16 13:56:18.562539', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-04-01 17:16:40\",\"code\":\"1001\",\"deviceId\":5,\"status\":3,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6568', '2021-06-16 13:56:18.566855', '2021-06-16 13:56:18.566855', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-04-01 17:16:40\",\"code\":\"1001\",\"deviceId\":5,\"status\":3,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6569', '2021-06-16 13:56:19.019921', '2021-06-16 13:56:19.019921', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6570', '2021-06-16 13:56:19.022268', '2021-06-16 13:56:19.022268', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6571', '2021-06-16 13:56:21.251939', '2021-06-16 13:56:21.251939', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-04-02 09:50:36\",\"code\":\"1003\",\"deviceId\":4,\"status\":1,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6572', '2021-06-16 13:56:21.256030', '2021-06-16 13:56:21.256030', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-04-02 09:50:36\",\"code\":\"1003\",\"deviceId\":4,\"status\":1,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6573', '2021-06-16 13:56:21.716658', '2021-06-16 13:56:21.716658', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6574', '2021-06-16 13:56:21.718967', '2021-06-16 13:56:21.718967', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6575', '2021-06-16 13:56:24.020685', '2021-06-16 13:56:24.020685', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-06-16 13:56:21\",\"code\":\"1003\",\"deviceId\":4,\"status\":3,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6576', '2021-06-16 13:56:24.026217', '2021-06-16 13:56:24.026217', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-06-16 13:56:21\",\"code\":\"1003\",\"deviceId\":4,\"status\":3,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6577', '2021-06-16 13:56:24.464541', '2021-06-16 13:56:24.464541', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6578', '2021-06-16 13:56:24.467061', '2021-06-16 13:56:24.467061', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6579', '2021-06-16 13:56:25.804585', '2021-06-16 13:56:25.804585', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-06-16 13:56:24\",\"code\":\"1003\",\"deviceId\":4,\"status\":4,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6580', '2021-06-16 13:56:25.808047', '2021-06-16 13:56:25.808047', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":4,\"createTime\":\"2021-04-02 09:28:49\",\"updateTime\":\"2021-06-16 13:56:24\",\"code\":\"1003\",\"deviceId\":4,\"status\":4,\"remark\":\"弄好了\",\"orderNum\":\"C6DBFF80-9352-11EB-9913-9999C28F1C19\",\"userId\":35,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":36,\"codeString\":\"蓝牙模块故障\",\"userName\":\"工程商小A\",\"maintainerName\":\"客户小A-工程商小A\"}');
INSERT INTO `base_sys_log` VALUES ('6581', '2021-06-16 13:56:26.248734', '2021-06-16 13:56:26.248734', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6582', '2021-06-16 13:56:26.252113', '2021-06-16 13:56:26.252113', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6583', '2021-06-16 13:56:28.138111', '2021-06-16 13:56:28.138111', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:18\",\"code\":\"1001\",\"deviceId\":5,\"status\":1,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6584', '2021-06-16 13:56:28.141063', '2021-06-16 13:56:28.141063', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:18\",\"code\":\"1001\",\"deviceId\":5,\"status\":1,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6585', '2021-06-16 13:56:28.610468', '2021-06-16 13:56:28.610468', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6586', '2021-06-16 13:56:28.613118', '2021-06-16 13:56:28.613118', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6587', '2021-06-16 13:56:30.019867', '2021-06-16 13:56:30.019867', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:28\",\"code\":\"1001\",\"deviceId\":5,\"status\":3,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6588', '2021-06-16 13:56:30.022300', '2021-06-16 13:56:30.022300', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:28\",\"code\":\"1001\",\"deviceId\":5,\"status\":3,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6589', '2021-06-16 13:56:30.455170', '2021-06-16 13:56:30.455170', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6590', '2021-06-16 13:56:30.458112', '2021-06-16 13:56:30.458112', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6591', '2021-06-16 13:56:32.026904', '2021-06-16 13:56:32.026904', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:30\",\"code\":\"1001\",\"deviceId\":5,\"status\":4,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6592', '2021-06-16 13:56:32.029287', '2021-06-16 13:56:32.029287', '1', '/admin/machine/workorder/update', '127.0.0.1', '本机地址', '{\"id\":2,\"createTime\":\"2021-04-01 09:50:08\",\"updateTime\":\"2021-06-16 13:56:30\",\"code\":\"1001\",\"deviceId\":5,\"status\":4,\"remark\":\"弄得还行\",\"orderNum\":\"93DA5C10-928C-11EB-AA95-D779A45BF9EA\",\"userId\":1,\"deviceName\":\"游泳馆翼闸\",\"maintainerId\":43,\"codeString\":\"摄像头故障\",\"userName\":\"超级管理员\",\"maintainerName\":\"客户2\"}');
INSERT INTO `base_sys_log` VALUES ('6593', '2021-06-16 13:56:32.469416', '2021-06-16 13:56:32.469416', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6594', '2021-06-16 13:56:32.471504', '2021-06-16 13:56:32.471504', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6595', '2021-06-16 13:56:36.408144', '2021-06-16 13:56:36.408144', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[4]}');
INSERT INTO `base_sys_log` VALUES ('6596', '2021-06-16 13:56:36.411446', '2021-06-16 13:56:36.411446', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[4]}');
INSERT INTO `base_sys_log` VALUES ('6597', '2021-06-16 13:56:48.020370', '2021-06-16 13:56:48.020370', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6598', '2021-06-16 13:56:48.022454', '2021-06-16 13:56:48.022454', '1', '/admin/machine/device/delete', '127.0.0.1', '本机地址', '{\"ids\":[5]}');
INSERT INTO `base_sys_log` VALUES ('6599', '2021-06-16 13:57:09.857151', '2021-06-16 13:57:09.857151', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6600', '2021-06-16 13:57:09.862214', '2021-06-16 13:57:09.862214', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6601', '2021-06-16 14:00:38.918825', '2021-06-16 14:00:38.918825', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6602', '2021-06-16 14:00:38.947219', '2021-06-16 14:00:38.947219', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6603', '2021-06-16 14:00:39.255291', '2021-06-16 14:00:39.255291', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6604', '2021-06-16 14:00:39.257687', '2021-06-16 14:00:39.257687', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6605', '2021-06-16 14:00:42.671574', '2021-06-16 14:00:42.671574', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6606', '2021-06-16 14:00:42.681615', '2021-06-16 14:00:42.681615', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6607', '2021-06-16 14:00:42.702950', '2021-06-16 14:00:42.702950', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6608', '2021-06-16 14:00:42.717910', '2021-06-16 14:00:42.717910', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6609', '2021-06-16 14:01:38.458798', '2021-06-16 14:01:38.458798', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6610', '2021-06-16 14:01:38.465369', '2021-06-16 14:01:38.465369', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6611', '2021-06-16 14:01:38.478837', '2021-06-16 14:01:38.478837', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6612', '2021-06-16 14:01:38.484223', '2021-06-16 14:01:38.484223', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6613', '2021-06-16 14:05:59.678088', '2021-06-16 14:05:59.678088', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6614', '2021-06-16 14:05:59.681324', '2021-06-16 14:05:59.681324', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6615', '2021-06-16 14:05:59.688276', '2021-06-16 14:05:59.688276', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6616', '2021-06-16 14:05:59.692740', '2021-06-16 14:05:59.692740', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6617', '2021-06-16 14:06:44.211286', '2021-06-16 14:06:44.211286', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6618', '2021-06-16 14:06:44.216597', '2021-06-16 14:06:44.216597', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6619', '2021-06-16 14:07:02.176134', '2021-06-16 14:07:02.176134', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6620', '2021-06-16 14:07:02.180883', '2021-06-16 14:07:02.180883', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6621', '2021-06-16 14:08:16.972626', '2021-06-16 14:08:16.972626', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6622', '2021-06-16 14:08:16.978530', '2021-06-16 14:08:16.978530', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6623', '2021-06-16 14:08:16.992335', '2021-06-16 14:08:16.992335', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6624', '2021-06-16 14:08:16.995523', '2021-06-16 14:08:16.995523', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6625', '2021-06-16 14:08:47.124037', '2021-06-16 14:08:47.124037', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6626', '2021-06-16 14:08:47.126865', '2021-06-16 14:08:47.126865', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6627', '2021-06-16 14:08:47.448090', '2021-06-16 14:08:47.448090', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6628', '2021-06-16 14:08:47.451617', '2021-06-16 14:08:47.451617', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6629', '2021-06-16 14:12:34.283570', '2021-06-16 14:12:34.283570', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6630', '2021-06-16 14:12:34.287314', '2021-06-16 14:12:34.287314', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6631', '2021-06-16 14:12:34.305603', '2021-06-16 14:12:34.305603', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6632', '2021-06-16 14:12:34.308491', '2021-06-16 14:12:34.308491', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6633', '2021-06-16 14:12:54.252173', '2021-06-16 14:12:54.252173', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6634', '2021-06-16 14:12:54.254777', '2021-06-16 14:12:54.254777', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6635', '2021-06-16 14:13:23.850698', '2021-06-16 14:13:23.850698', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6636', '2021-06-16 14:13:23.853586', '2021-06-16 14:13:23.853586', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6637', '2021-06-16 14:27:09.018041', '2021-06-16 14:27:09.018041', null, '/open/machine/mqtt/webhook', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6638', '2021-06-16 15:58:12.787079', '2021-06-16 15:58:12.787079', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYyMzgyMjIwMCwiZXhwIjoxNjI1MTE4MjAwfQ.HVBiDBT-nj-89CKJxBRtEw9tkefHYF19D7JyoD5sFp0\"}');
INSERT INTO `base_sys_log` VALUES ('6639', '2021-06-16 15:58:13.078551', '2021-06-16 15:58:13.078551', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6640', '2021-06-16 15:58:13.137308', '2021-06-16 15:58:13.137308', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6641', '2021-06-16 18:23:46.228843', '2021-06-16 18:23:46.228843', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6642', '2021-06-16 18:25:23.154674', '2021-06-16 18:25:23.154674', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6643', '2021-06-16 18:26:07.352291', '2021-06-16 18:26:07.352291', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6644', '2021-06-16 18:27:08.107018', '2021-06-16 18:27:08.107018', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6645', '2021-06-16 18:30:17.625767', '2021-06-16 18:30:17.625767', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6646', '2021-06-16 18:30:51.124034', '2021-06-16 18:30:51.124034', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6647', '2021-06-16 18:33:28.566569', '2021-06-16 18:33:28.566569', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6648', '2021-06-16 18:37:54.269051', '2021-06-16 18:37:54.269051', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6649', '2021-06-16 18:37:59.364002', '2021-06-16 18:37:59.364002', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6650', '2021-06-16 18:41:29.389433', '2021-06-16 18:41:29.389433', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6651', '2021-06-16 19:34:38.576358', '2021-06-16 19:34:38.576358', null, '/open/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no001\",\"payload\":\"04A001A5\"}');
INSERT INTO `base_sys_log` VALUES ('6652', '2021-06-17 10:44:08.884125', '2021-06-17 10:44:08.884125', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYyMzgzMDI5MiwiZXhwIjoxNjI1MTI2MjkyfQ.2wA2ECwmZTXoZ1Yy4QR-L-_kGqe3uep841A6PQQRNlg\"}');
INSERT INTO `base_sys_log` VALUES ('6653', '2021-06-17 10:44:09.083831', '2021-06-17 10:44:09.083831', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6654', '2021-06-17 10:44:09.088310', '2021-06-17 10:44:09.088310', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6655', '2021-06-17 10:44:09.232993', '2021-06-17 10:44:09.232993', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6656', '2021-06-17 10:44:09.238130', '2021-06-17 10:44:09.238130', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6657', '2021-06-17 10:44:43.137400', '2021-06-17 10:44:43.137400', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6658', '2021-06-17 10:44:43.139153', '2021-06-17 10:44:43.139153', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6659', '2021-06-17 10:44:43.453218', '2021-06-17 10:44:43.453218', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6660', '2021-06-17 10:44:43.455022', '2021-06-17 10:44:43.455022', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6661', '2021-06-17 10:52:15.513392', '2021-06-17 10:52:15.513392', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6662', '2021-06-17 10:52:15.516000', '2021-06-17 10:52:15.516000', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6663', '2021-06-17 10:52:15.518936', '2021-06-17 10:52:15.518936', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6664', '2021-06-17 10:52:15.520505', '2021-06-17 10:52:15.520505', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6665', '2021-06-17 10:52:22.155859', '2021-06-17 10:52:22.155859', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6666', '2021-06-17 10:52:22.157110', '2021-06-17 10:52:22.157110', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6667', '2021-06-17 10:52:29.986514', '2021-06-17 10:52:29.986514', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6668', '2021-06-17 10:52:29.988226', '2021-06-17 10:52:29.988226', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6669', '2021-06-17 10:52:32.881020', '2021-06-17 10:52:32.881020', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6670', '2021-06-17 10:52:32.882311', '2021-06-17 10:52:32.882311', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6671', '2021-06-17 10:52:37.164209', '2021-06-17 10:52:37.164209', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6672', '2021-06-17 10:52:37.165232', '2021-06-17 10:52:37.165232', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6673', '2021-06-17 10:52:37.202126', '2021-06-17 10:52:37.202126', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6674', '2021-06-17 10:52:37.208968', '2021-06-17 10:52:37.208968', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('6675', '2021-06-17 10:52:44.555075', '2021-06-17 10:52:44.555075', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"name\":\"游泳馆翼闸\",\"channelName\":\"通道A\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"maintainer\":35,\"status\":1,\"id\":4,\"createTime\":\"2021-03-26 00:40:46\",\"updateTime\":\"2021-06-16 14:00:27\",\"userId\":35,\"maintainerId\":36,\"params\":null,\"clientid\":\"no001\"}');
INSERT INTO `base_sys_log` VALUES ('6676', '2021-06-17 10:52:44.556837', '2021-06-17 10:52:44.556837', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"name\":\"游泳馆翼闸\",\"channelName\":\"通道A\",\"mac\":\"dsa:asd:34:dsa:asd:34:dsa:asd:34\",\"maintainer\":35,\"status\":1,\"id\":4,\"createTime\":\"2021-03-26 00:40:46\",\"updateTime\":\"2021-06-16 14:00:27\",\"userId\":35,\"maintainerId\":36,\"params\":null,\"clientid\":\"no001\"}');
INSERT INTO `base_sys_log` VALUES ('6677', '2021-06-17 10:52:44.962133', '2021-06-17 10:52:44.962133', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6678', '2021-06-17 10:52:44.964628', '2021-06-17 10:52:44.964628', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6679', '2021-06-17 10:52:45.645071', '2021-06-17 10:52:45.645071', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6680', '2021-06-17 10:52:45.646444', '2021-06-17 10:52:45.646444', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('6681', '2021-06-17 10:52:45.965027', '2021-06-17 10:52:45.965027', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6682', '2021-06-17 10:52:45.966254', '2021-06-17 10:52:45.966254', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6683', '2021-06-17 10:56:49.687268', '2021-06-17 10:56:49.687268', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6684', '2021-06-17 10:56:49.719501', '2021-06-17 10:56:49.719501', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6685', '2021-06-17 10:56:49.986075', '2021-06-17 10:56:49.986075', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6686', '2021-06-17 10:56:49.988004', '2021-06-17 10:56:49.988004', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6687', '2021-06-17 10:57:05.517378', '2021-06-17 10:57:05.517378', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6688', '2021-06-17 10:57:05.518360', '2021-06-17 10:57:05.518360', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6689', '2021-06-17 10:57:52.695290', '2021-06-17 10:57:52.695290', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6690', '2021-06-17 10:57:52.696279', '2021-06-17 10:57:52.696279', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6691', '2021-06-17 10:57:58.128934', '2021-06-17 10:57:58.128934', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6692', '2021-06-17 10:57:58.131401', '2021-06-17 10:57:58.131401', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6693', '2021-06-17 10:58:46.980813', '2021-06-17 10:58:46.980813', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6694', '2021-06-17 10:58:46.983322', '2021-06-17 10:58:46.983322', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6695', '2021-06-17 10:58:47.239606', '2021-06-17 10:58:47.239606', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6696', '2021-06-17 10:58:47.240913', '2021-06-17 10:58:47.240913', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6697', '2021-06-17 11:05:32.351787', '2021-06-17 11:05:32.351787', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6698', '2021-06-17 11:05:32.356443', '2021-06-17 11:05:32.356443', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6699', '2021-06-17 11:05:45.189150', '2021-06-17 11:05:45.189150', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6700', '2021-06-17 11:05:45.195513', '2021-06-17 11:05:45.195513', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6701', '2021-06-17 11:05:45.428954', '2021-06-17 11:05:45.428954', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6702', '2021-06-17 11:05:45.430359', '2021-06-17 11:05:45.430359', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6703', '2021-06-17 11:07:01.566098', '2021-06-17 11:07:01.566098', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6704', '2021-06-17 11:07:01.567400', '2021-06-17 11:07:01.567400', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6705', '2021-06-17 11:07:08.096796', '2021-06-17 11:07:08.096796', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6706', '2021-06-17 11:07:08.105149', '2021-06-17 11:07:08.105149', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6707', '2021-06-17 11:07:08.374621', '2021-06-17 11:07:08.374621', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6708', '2021-06-17 11:07:08.376149', '2021-06-17 11:07:08.376149', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6709', '2021-06-17 11:07:59.532765', '2021-06-17 11:07:59.532765', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6710', '2021-06-17 11:07:59.534142', '2021-06-17 11:07:59.534142', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6711', '2021-06-17 11:08:28.348486', '2021-06-17 11:08:28.348486', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6712', '2021-06-17 11:08:28.349474', '2021-06-17 11:08:28.349474', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6713', '2021-06-17 11:08:38.938332', '2021-06-17 11:08:38.938332', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6714', '2021-06-17 11:08:38.939428', '2021-06-17 11:08:38.939428', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6715', '2021-06-17 11:08:46.012335', '2021-06-17 11:08:46.012335', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6716', '2021-06-17 11:08:46.013138', '2021-06-17 11:08:46.013138', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6717', '2021-06-17 11:11:44.292143', '2021-06-17 11:11:44.292143', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6718', '2021-06-17 11:11:44.293308', '2021-06-17 11:11:44.293308', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6719', '2021-06-17 11:11:44.988487', '2021-06-17 11:11:44.988487', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6720', '2021-06-17 11:11:44.989605', '2021-06-17 11:11:44.989605', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6721', '2021-06-17 11:14:04.114425', '2021-06-17 11:14:04.114425', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6722', '2021-06-17 11:14:04.156171', '2021-06-17 11:14:04.156171', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6723', '2021-06-17 11:14:04.419743', '2021-06-17 11:14:04.419743', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6724', '2021-06-17 11:14:04.420776', '2021-06-17 11:14:04.420776', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6725', '2021-06-17 11:14:20.890460', '2021-06-17 11:14:20.890460', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6726', '2021-06-17 11:14:20.891372', '2021-06-17 11:14:20.891372', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6727', '2021-06-17 11:15:08.998892', '2021-06-17 11:15:08.998892', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6728', '2021-06-17 11:15:08.999904', '2021-06-17 11:15:08.999904', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6729', '2021-06-17 11:15:35.481130', '2021-06-17 11:15:35.481130', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6730', '2021-06-17 11:15:35.482084', '2021-06-17 11:15:35.482084', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6731', '2021-06-17 11:15:49.430389', '2021-06-17 11:15:49.430389', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6732', '2021-06-17 11:15:49.431267', '2021-06-17 11:15:49.431267', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6733', '2021-06-17 11:16:36.988096', '2021-06-17 11:16:36.988096', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6734', '2021-06-17 11:16:36.989021', '2021-06-17 11:16:36.989021', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6735', '2021-06-17 11:17:00.029729', '2021-06-17 11:17:00.029729', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6736', '2021-06-17 11:17:00.030547', '2021-06-17 11:17:00.030547', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6737', '2021-06-17 11:17:11.788796', '2021-06-17 11:17:11.788796', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6738', '2021-06-17 11:17:11.789847', '2021-06-17 11:17:11.789847', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6739', '2021-06-17 11:19:49.981477', '2021-06-17 11:19:49.981477', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6740', '2021-06-17 11:19:49.986661', '2021-06-17 11:19:49.986661', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6741', '2021-06-17 11:19:50.632909', '2021-06-17 11:19:50.632909', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6742', '2021-06-17 11:19:50.635616', '2021-06-17 11:19:50.635616', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6743', '2021-06-17 11:19:51.713018', '2021-06-17 11:19:51.713018', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6744', '2021-06-17 11:19:51.714034', '2021-06-17 11:19:51.714034', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6745', '2021-06-17 11:20:05.064215', '2021-06-17 11:20:05.064215', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6746', '2021-06-17 11:20:05.066165', '2021-06-17 11:20:05.066165', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6747', '2021-06-17 11:21:07.620184', '2021-06-17 11:21:07.620184', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6748', '2021-06-17 11:21:07.625939', '2021-06-17 11:21:07.625939', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6749', '2021-06-17 11:25:02.732100', '2021-06-17 11:25:02.732100', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6750', '2021-06-17 11:25:02.736452', '2021-06-17 11:25:02.736452', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6751', '2021-06-17 11:25:19.131302', '2021-06-17 11:25:19.131302', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6752', '2021-06-17 11:25:19.133897', '2021-06-17 11:25:19.133897', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6753', '2021-06-17 11:25:37.331979', '2021-06-17 11:25:37.331979', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6754', '2021-06-17 11:25:37.334793', '2021-06-17 11:25:37.334793', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6755', '2021-06-17 11:25:56.676277', '2021-06-17 11:25:56.676277', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6756', '2021-06-17 11:25:56.678598', '2021-06-17 11:25:56.678598', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6757', '2021-06-17 11:31:59.455106', '2021-06-17 11:31:59.455106', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6758', '2021-06-17 11:31:59.466127', '2021-06-17 11:31:59.466127', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6759', '2021-06-17 11:40:04.642614', '2021-06-17 11:40:04.642614', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6760', '2021-06-17 11:40:04.646778', '2021-06-17 11:40:04.646778', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6761', '2021-06-17 11:40:30.853916', '2021-06-17 11:40:30.853916', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6762', '2021-06-17 11:40:30.857873', '2021-06-17 11:40:30.857873', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6763', '2021-06-17 11:40:46.638598', '2021-06-17 11:40:46.638598', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6764', '2021-06-17 11:40:46.641403', '2021-06-17 11:40:46.641403', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6765', '2021-06-17 11:42:01.747194', '2021-06-17 11:42:01.747194', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6766', '2021-06-17 11:42:01.750815', '2021-06-17 11:42:01.750815', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6767', '2021-06-17 11:42:36.036450', '2021-06-17 11:42:36.036450', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6768', '2021-06-17 11:42:36.039073', '2021-06-17 11:42:36.039073', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6769', '2021-06-17 11:43:07.319438', '2021-06-17 11:43:07.319438', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6770', '2021-06-17 11:43:07.322377', '2021-06-17 11:43:07.322377', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6771', '2021-06-17 11:43:08.201712', '2021-06-17 11:43:08.201712', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6772', '2021-06-17 11:43:08.204675', '2021-06-17 11:43:08.204675', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6773', '2021-06-17 11:43:09.358559', '2021-06-17 11:43:09.358559', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6774', '2021-06-17 11:43:09.360594', '2021-06-17 11:43:09.360594', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6775', '2021-06-17 11:43:09.800554', '2021-06-17 11:43:09.800554', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6776', '2021-06-17 11:43:09.803004', '2021-06-17 11:43:09.803004', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6777', '2021-06-17 11:43:37.263725', '2021-06-17 11:43:37.263725', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6778', '2021-06-17 11:43:37.270808', '2021-06-17 11:43:37.270808', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6779', '2021-06-17 11:44:08.438325', '2021-06-17 11:44:08.438325', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6780', '2021-06-17 11:44:08.441280', '2021-06-17 11:44:08.441280', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6781', '2021-06-17 12:16:10.870326', '2021-06-17 12:16:10.870326', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6782', '2021-06-17 12:16:10.875617', '2021-06-17 12:16:10.875617', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6783', '2021-06-17 12:16:35.612593', '2021-06-17 12:16:35.612593', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6784', '2021-06-17 12:16:35.615364', '2021-06-17 12:16:35.615364', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6785', '2021-06-17 12:17:54.341993', '2021-06-17 12:17:54.341993', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6786', '2021-06-17 12:17:54.345067', '2021-06-17 12:17:54.345067', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6787', '2021-06-17 12:18:20.312407', '2021-06-17 12:18:20.312407', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6788', '2021-06-17 12:18:20.316120', '2021-06-17 12:18:20.316120', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6789', '2021-06-17 12:21:06.876064', '2021-06-17 12:21:06.876064', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6790', '2021-06-17 12:21:06.880434', '2021-06-17 12:21:06.880434', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6791', '2021-06-17 12:21:24.622569', '2021-06-17 12:21:24.622569', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6792', '2021-06-17 12:21:24.625198', '2021-06-17 12:21:24.625198', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6793', '2021-06-17 12:22:14.387226', '2021-06-17 12:22:14.387226', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6794', '2021-06-17 12:22:14.391704', '2021-06-17 12:22:14.391704', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6795', '2021-06-17 12:23:15.455021', '2021-06-17 12:23:15.455021', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6796', '2021-06-17 12:23:15.471315', '2021-06-17 12:23:15.471315', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6797', '2021-06-17 12:23:30.344524', '2021-06-17 12:23:30.344524', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6798', '2021-06-17 12:23:30.348809', '2021-06-17 12:23:30.348809', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6799', '2021-06-17 12:23:53.118941', '2021-06-17 12:23:53.118941', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6800', '2021-06-17 12:23:53.130036', '2021-06-17 12:23:53.130036', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6801', '2021-06-17 12:24:16.950928', '2021-06-17 12:24:16.950928', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6802', '2021-06-17 12:24:16.956556', '2021-06-17 12:24:16.956556', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6803', '2021-06-17 12:25:02.709479', '2021-06-17 12:25:02.709479', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6804', '2021-06-17 12:25:02.713006', '2021-06-17 12:25:02.713006', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6805', '2021-06-17 12:25:23.173881', '2021-06-17 12:25:23.173881', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6806', '2021-06-17 12:25:23.179918', '2021-06-17 12:25:23.179918', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6807', '2021-06-17 12:25:24.101818', '2021-06-17 12:25:24.101818', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6808', '2021-06-17 12:25:24.104378', '2021-06-17 12:25:24.104378', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6809', '2021-06-17 12:25:26.887556', '2021-06-17 12:25:26.887556', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6810', '2021-06-17 12:25:26.889998', '2021-06-17 12:25:26.889998', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6811', '2021-06-17 12:25:39.052513', '2021-06-17 12:25:39.052513', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6812', '2021-06-17 12:25:39.055079', '2021-06-17 12:25:39.055079', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6813', '2021-06-17 12:25:54.719045', '2021-06-17 12:25:54.719045', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6814', '2021-06-17 12:25:54.722652', '2021-06-17 12:25:54.722652', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6815', '2021-06-17 12:25:55.926079', '2021-06-17 12:25:55.926079', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6816', '2021-06-17 12:25:55.927743', '2021-06-17 12:25:55.927743', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6817', '2021-06-17 12:25:56.444464', '2021-06-17 12:25:56.444464', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6818', '2021-06-17 12:25:56.446474', '2021-06-17 12:25:56.446474', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6819', '2021-06-17 12:26:51.469153', '2021-06-17 12:26:51.469153', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6820', '2021-06-17 12:26:51.475195', '2021-06-17 12:26:51.475195', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6821', '2021-06-17 12:26:51.875161', '2021-06-17 12:26:51.875161', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6822', '2021-06-17 12:26:51.877699', '2021-06-17 12:26:51.877699', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6823', '2021-06-17 12:27:07.929934', '2021-06-17 12:27:07.929934', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6824', '2021-06-17 12:27:07.933247', '2021-06-17 12:27:07.933247', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6825', '2021-06-17 12:27:12.558462', '2021-06-17 12:27:12.558462', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6826', '2021-06-17 12:27:12.564971', '2021-06-17 12:27:12.564971', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6827', '2021-06-17 12:27:12.861580', '2021-06-17 12:27:12.861580', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6828', '2021-06-17 12:27:12.864981', '2021-06-17 12:27:12.864981', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6829', '2021-06-17 12:28:53.525997', '2021-06-17 12:28:53.525997', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6830', '2021-06-17 12:28:53.647090', '2021-06-17 12:28:53.647090', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6831', '2021-06-17 12:28:55.463681', '2021-06-17 12:28:55.463681', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6832', '2021-06-17 12:28:55.465628', '2021-06-17 12:28:55.465628', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6833', '2021-06-17 12:39:28.739631', '2021-06-17 12:39:28.739631', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6834', '2021-06-17 12:39:28.742720', '2021-06-17 12:39:28.742720', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6835', '2021-06-17 12:39:30.728644', '2021-06-17 12:39:30.728644', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6836', '2021-06-17 12:39:30.730907', '2021-06-17 12:39:30.730907', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6837', '2021-06-17 12:46:36.094169', '2021-06-17 12:46:36.094169', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYyMzg5Nzg0OCwiZXhwIjoxNjI1MTkzODQ4fQ.D1HZpu96J-iRhSeJ0UkQrbNgS14OiX4HhczJTQhSGTo\"}');
INSERT INTO `base_sys_log` VALUES ('6838', '2021-06-17 12:46:36.227040', '2021-06-17 12:46:36.227040', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6839', '2021-06-17 12:46:36.229505', '2021-06-17 12:46:36.229505', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6840', '2021-06-17 12:46:39.910935', '2021-06-17 12:46:39.910935', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6841', '2021-06-17 12:46:39.913411', '2021-06-17 12:46:39.913411', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6842', '2021-06-17 12:46:59.003256', '2021-06-17 12:46:59.003256', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6843', '2021-06-17 12:46:59.006235', '2021-06-17 12:46:59.006235', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6844', '2021-06-17 12:47:05.651526', '2021-06-17 12:47:05.651526', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6845', '2021-06-17 12:47:05.656174', '2021-06-17 12:47:05.656174', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6846', '2021-06-17 12:48:42.843515', '2021-06-17 12:48:42.843515', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6847', '2021-06-17 12:48:42.851799', '2021-06-17 12:48:42.851799', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6848', '2021-06-17 12:48:43.093074', '2021-06-17 12:48:43.093074', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6849', '2021-06-17 12:48:43.099666', '2021-06-17 12:48:43.099666', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6850', '2021-06-17 12:49:16.012899', '2021-06-17 12:49:16.012899', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6851', '2021-06-17 12:49:16.015008', '2021-06-17 12:49:16.015008', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6852', '2021-06-17 12:49:34.606080', '2021-06-17 12:49:34.606080', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6853', '2021-06-17 12:49:34.608174', '2021-06-17 12:49:34.608174', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6854', '2021-06-17 12:50:11.380597', '2021-06-17 12:50:11.380597', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6855', '2021-06-17 12:50:11.437550', '2021-06-17 12:50:11.437550', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6856', '2021-06-17 12:50:11.634336', '2021-06-17 12:50:11.634336', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6857', '2021-06-17 12:50:11.638418', '2021-06-17 12:50:11.638418', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6858', '2021-06-17 12:50:48.524380', '2021-06-17 12:50:48.524380', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6859', '2021-06-17 12:50:48.526538', '2021-06-17 12:50:48.526538', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6860', '2021-06-17 12:58:59.477259', '2021-06-17 12:58:59.477259', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6861', '2021-06-17 12:58:59.514286', '2021-06-17 12:58:59.514286', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6862', '2021-06-17 12:58:59.733822', '2021-06-17 12:58:59.733822', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6863', '2021-06-17 12:58:59.735818', '2021-06-17 12:58:59.735818', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6864', '2021-06-17 12:59:08.279559', '2021-06-17 12:59:08.279559', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6865', '2021-06-17 12:59:08.281215', '2021-06-17 12:59:08.281215', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6866', '2021-06-17 12:59:23.795650', '2021-06-17 12:59:23.795650', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6867', '2021-06-17 12:59:23.796748', '2021-06-17 12:59:23.796748', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6868', '2021-06-17 13:00:19.922350', '2021-06-17 13:00:19.922350', '1', '/admin/base/sys/menu/add', '127.0.0.1', '本机地址', '{\"parentId\":122,\"type\":1,\"name\":\"设备指令码\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/Instruct.vue\",\"icon\":\"icon-auth\"}');
INSERT INTO `base_sys_log` VALUES ('6869', '2021-06-17 13:00:19.925740', '2021-06-17 13:00:19.925740', '1', '/admin/base/sys/menu/add', '127.0.0.1', '本机地址', '{\"parentId\":122,\"type\":1,\"name\":\"设备指令码\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/Instruct.vue\",\"icon\":\"icon-auth\"}');
INSERT INTO `base_sys_log` VALUES ('6870', '2021-06-17 13:00:20.181158', '2021-06-17 13:00:20.181158', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6871', '2021-06-17 13:00:20.182122', '2021-06-17 13:00:20.182122', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6872', '2021-06-17 13:00:24.902559', '2021-06-17 13:00:24.902559', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6873', '2021-06-17 13:00:24.906698', '2021-06-17 13:00:24.906698', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6874', '2021-06-17 13:00:25.124844', '2021-06-17 13:00:25.124844', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6875', '2021-06-17 13:00:25.127625', '2021-06-17 13:00:25.127625', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6876', '2021-06-17 13:00:29.510673', '2021-06-17 13:00:29.510673', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6877', '2021-06-17 13:00:29.511949', '2021-06-17 13:00:29.511949', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6878', '2021-06-17 13:01:02.258040', '2021-06-17 13:01:02.258040', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6879', '2021-06-17 13:01:02.259311', '2021-06-17 13:01:02.259311', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6880', '2021-06-17 13:01:16.807258', '2021-06-17 13:01:16.807258', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6881', '2021-06-17 13:01:16.808286', '2021-06-17 13:01:16.808286', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6882', '2021-06-17 13:01:18.323244', '2021-06-17 13:01:18.323244', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6883', '2021-06-17 13:01:18.324442', '2021-06-17 13:01:18.324442', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6884', '2021-06-17 13:01:18.489445', '2021-06-17 13:01:18.489445', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6885', '2021-06-17 13:01:18.490885', '2021-06-17 13:01:18.490885', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6886', '2021-06-17 13:07:55.668352', '2021-06-17 13:07:55.668352', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6887', '2021-06-17 13:07:55.670248', '2021-06-17 13:07:55.670248', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6888', '2021-06-17 13:08:23.123865', '2021-06-17 13:08:23.123865', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6889', '2021-06-17 13:08:23.125555', '2021-06-17 13:08:23.125555', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6890', '2021-06-17 13:08:25.577772', '2021-06-17 13:08:25.577772', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6891', '2021-06-17 13:08:25.579048', '2021-06-17 13:08:25.579048', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6892', '2021-06-17 13:08:43.982671', '2021-06-17 13:08:43.982671', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6893', '2021-06-17 13:08:43.983850', '2021-06-17 13:08:43.983850', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6894', '2021-06-17 13:08:55.280868', '2021-06-17 13:08:55.280868', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6895', '2021-06-17 13:08:55.281969', '2021-06-17 13:08:55.281969', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6896', '2021-06-17 13:10:47.123270', '2021-06-17 13:10:47.123270', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6897', '2021-06-17 13:10:47.125620', '2021-06-17 13:10:47.125620', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6898', '2021-06-17 13:10:58.162754', '2021-06-17 13:10:58.162754', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6899', '2021-06-17 13:10:58.164700', '2021-06-17 13:10:58.164700', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6900', '2021-06-17 13:11:03.502315', '2021-06-17 13:11:03.502315', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6901', '2021-06-17 13:11:03.503536', '2021-06-17 13:11:03.503536', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6902', '2021-06-17 13:11:21.216465', '2021-06-17 13:11:21.216465', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6903', '2021-06-17 13:11:21.222340', '2021-06-17 13:11:21.222340', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6904', '2021-06-17 13:11:21.453120', '2021-06-17 13:11:21.453120', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6905', '2021-06-17 13:11:21.454519', '2021-06-17 13:11:21.454519', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6906', '2021-06-17 13:11:25.364319', '2021-06-17 13:11:25.364319', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6907', '2021-06-17 13:11:25.365431', '2021-06-17 13:11:25.365431', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6908', '2021-06-17 13:11:50.741689', '2021-06-17 13:11:50.741689', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6909', '2021-06-17 13:11:50.742657', '2021-06-17 13:11:50.742657', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6910', '2021-06-17 13:11:53.975536', '2021-06-17 13:11:53.975536', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6911', '2021-06-17 13:11:54.008359', '2021-06-17 13:11:54.008359', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6912', '2021-06-17 13:11:54.206980', '2021-06-17 13:11:54.206980', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6913', '2021-06-17 13:11:54.208476', '2021-06-17 13:11:54.208476', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6914', '2021-06-17 13:11:55.345466', '2021-06-17 13:11:55.345466', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6915', '2021-06-17 13:11:55.346339', '2021-06-17 13:11:55.346339', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"8\"}');
INSERT INTO `base_sys_log` VALUES ('6916', '2021-06-17 13:11:58.801451', '2021-06-17 13:11:58.801451', '1', '/admin/machine/instruct/update', '127.0.0.1', '本机地址', '{\"code\":\"0x8a\",\"codeString\":\"返回版本号命令：十六进制 A1,表示版本1，A2表示版本2。并且只以A开头当作校验\",\"type\":1,\"id\":8,\"createTime\":\"2021-06-17 13:03:51\",\"updateTime\":\"2021-06-17 13:03:51\"}');
INSERT INTO `base_sys_log` VALUES ('6917', '2021-06-17 13:11:58.804703', '2021-06-17 13:11:58.804703', '1', '/admin/machine/instruct/update', '127.0.0.1', '本机地址', '{\"code\":\"0x8a\",\"codeString\":\"返回版本号命令：十六进制 A1,表示版本1，A2表示版本2。并且只以A开头当作校验\",\"type\":1,\"id\":8,\"createTime\":\"2021-06-17 13:03:51\",\"updateTime\":\"2021-06-17 13:03:51\"}');
INSERT INTO `base_sys_log` VALUES ('6918', '2021-06-17 13:11:58.894326', '2021-06-17 13:11:58.894326', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6919', '2021-06-17 13:11:58.895530', '2021-06-17 13:11:58.895530', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6920', '2021-06-17 13:12:01.050615', '2021-06-17 13:12:01.050615', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6921', '2021-06-17 13:12:01.053336', '2021-06-17 13:12:01.053336', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6922', '2021-06-17 13:12:56.950883', '2021-06-17 13:12:56.950883', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6923', '2021-06-17 13:12:56.954177', '2021-06-17 13:12:56.954177', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6924', '2021-06-17 13:12:57.186697', '2021-06-17 13:12:57.186697', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6925', '2021-06-17 13:12:57.188176', '2021-06-17 13:12:57.188176', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6926', '2021-06-17 13:12:58.686357', '2021-06-17 13:12:58.686357', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('6927', '2021-06-17 13:12:58.687383', '2021-06-17 13:12:58.687383', '1', '/admin/machine/instruct/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('6928', '2021-06-17 13:13:01.404339', '2021-06-17 13:13:01.404339', '1', '/admin/machine/instruct/update', '127.0.0.1', '本机地址', '{\"code\":\"0x9a\",\"codeString\":\"发送 查询版本号命令\",\"type\":1,\"id\":7,\"createTime\":\"2021-06-17 13:03:40\",\"updateTime\":\"2021-06-17 13:03:40\"}');
INSERT INTO `base_sys_log` VALUES ('6929', '2021-06-17 13:13:01.406288', '2021-06-17 13:13:01.406288', '1', '/admin/machine/instruct/update', '127.0.0.1', '本机地址', '{\"code\":\"0x9a\",\"codeString\":\"发送 查询版本号命令\",\"type\":1,\"id\":7,\"createTime\":\"2021-06-17 13:03:40\",\"updateTime\":\"2021-06-17 13:03:40\"}');
INSERT INTO `base_sys_log` VALUES ('6930', '2021-06-17 13:13:01.493447', '2021-06-17 13:13:01.493447', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6931', '2021-06-17 13:13:01.495276', '2021-06-17 13:13:01.495276', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6932', '2021-06-17 13:14:54.925606', '2021-06-17 13:14:54.925606', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6933', '2021-06-17 13:14:54.928857', '2021-06-17 13:14:54.928857', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6934', '2021-06-17 13:15:12.247060', '2021-06-17 13:15:12.247060', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6935', '2021-06-17 13:15:12.248313', '2021-06-17 13:15:12.248313', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6936', '2021-06-17 13:19:50.787776', '2021-06-17 13:19:50.787776', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6937', '2021-06-17 13:19:50.789641', '2021-06-17 13:19:50.789641', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6938', '2021-06-17 13:19:53.612913', '2021-06-17 13:19:53.612913', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6939', '2021-06-17 13:19:53.613852', '2021-06-17 13:19:53.613852', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6940', '2021-06-17 13:19:56.615426', '2021-06-17 13:19:56.615426', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6941', '2021-06-17 13:19:56.616433', '2021-06-17 13:19:56.616433', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6942', '2021-06-17 13:20:25.998560', '2021-06-17 13:20:25.998560', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6943', '2021-06-17 13:20:25.999650', '2021-06-17 13:20:25.999650', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6944', '2021-06-17 13:20:27.717499', '2021-06-17 13:20:27.717499', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6945', '2021-06-17 13:20:27.718476', '2021-06-17 13:20:27.718476', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6946', '2021-06-17 13:21:04.246964', '2021-06-17 13:21:04.246964', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6947', '2021-06-17 13:21:04.248091', '2021-06-17 13:21:04.248091', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6948', '2021-06-17 13:21:05.557533', '2021-06-17 13:21:05.557533', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6949', '2021-06-17 13:21:05.558621', '2021-06-17 13:21:05.558621', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6950', '2021-06-17 13:21:52.411611', '2021-06-17 13:21:52.411611', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6951', '2021-06-17 13:21:52.412879', '2021-06-17 13:21:52.412879', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6952', '2021-06-17 13:21:53.970948', '2021-06-17 13:21:53.970948', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6953', '2021-06-17 13:21:53.971948', '2021-06-17 13:21:53.971948', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6954', '2021-06-17 13:23:43.880823', '2021-06-17 13:23:43.880823', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6955', '2021-06-17 13:23:43.881754', '2021-06-17 13:23:43.881754', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6956', '2021-06-17 13:23:47.113860', '2021-06-17 13:23:47.113860', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6957', '2021-06-17 13:23:47.114639', '2021-06-17 13:23:47.114639', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6958', '2021-06-17 13:24:14.602476', '2021-06-17 13:24:14.602476', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6959', '2021-06-17 13:24:14.603660', '2021-06-17 13:24:14.603660', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6960', '2021-06-17 13:26:37.954675', '2021-06-17 13:26:37.954675', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6961', '2021-06-17 13:26:37.955854', '2021-06-17 13:26:37.955854', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6962', '2021-06-17 13:27:42.952462', '2021-06-17 13:27:42.952462', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6963', '2021-06-17 13:27:42.954122', '2021-06-17 13:27:42.954122', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6964', '2021-06-17 13:27:45.279034', '2021-06-17 13:27:45.279034', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6965', '2021-06-17 13:27:45.279983', '2021-06-17 13:27:45.279983', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6966', '2021-06-17 13:27:53.128995', '2021-06-17 13:27:53.128995', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6967', '2021-06-17 13:27:53.129937', '2021-06-17 13:27:53.129937', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6968', '2021-06-17 13:27:54.200350', '2021-06-17 13:27:54.200350', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6969', '2021-06-17 13:27:54.204232', '2021-06-17 13:27:54.204232', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6970', '2021-06-17 13:27:57.323129', '2021-06-17 13:27:57.323129', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6971', '2021-06-17 13:27:57.328192', '2021-06-17 13:27:57.328192', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6972', '2021-06-17 13:27:57.728167', '2021-06-17 13:27:57.728167', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6973', '2021-06-17 13:27:57.729764', '2021-06-17 13:27:57.729764', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6974', '2021-06-17 13:27:58.882949', '2021-06-17 13:27:58.882949', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6975', '2021-06-17 13:27:58.884322', '2021-06-17 13:27:58.884322', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6976', '2021-06-17 13:29:20.759983', '2021-06-17 13:29:20.759983', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6977', '2021-06-17 13:29:20.761081', '2021-06-17 13:29:20.761081', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6978', '2021-06-17 13:29:25.174976', '2021-06-17 13:29:25.174976', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6979', '2021-06-17 13:29:25.213830', '2021-06-17 13:29:25.213830', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6980', '2021-06-17 13:29:25.540493', '2021-06-17 13:29:25.540493', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6981', '2021-06-17 13:29:25.542424', '2021-06-17 13:29:25.542424', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6982', '2021-06-17 13:29:26.931896', '2021-06-17 13:29:26.931896', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6983', '2021-06-17 13:29:26.932716', '2021-06-17 13:29:26.932716', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6984', '2021-06-17 13:30:35.551494', '2021-06-17 13:30:35.551494', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6985', '2021-06-17 13:30:35.558129', '2021-06-17 13:30:35.558129', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6986', '2021-06-17 13:30:35.880651', '2021-06-17 13:30:35.880651', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6987', '2021-06-17 13:30:35.881778', '2021-06-17 13:30:35.881778', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6988', '2021-06-17 13:30:37.043724', '2021-06-17 13:30:37.043724', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6989', '2021-06-17 13:30:37.044959', '2021-06-17 13:30:37.044959', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6990', '2021-06-17 13:32:59.089202', '2021-06-17 13:32:59.089202', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6991', '2021-06-17 13:32:59.093522', '2021-06-17 13:32:59.093522', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('6992', '2021-06-17 13:32:59.377275', '2021-06-17 13:32:59.377275', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6993', '2021-06-17 13:32:59.381036', '2021-06-17 13:32:59.381036', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6994', '2021-06-17 13:33:00.344928', '2021-06-17 13:33:00.344928', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6995', '2021-06-17 13:33:00.345733', '2021-06-17 13:33:00.345733', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('6996', '2021-06-17 13:34:08.640390', '2021-06-17 13:34:08.640390', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6997', '2021-06-17 13:34:08.642314', '2021-06-17 13:34:08.642314', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('6998', '2021-06-17 13:34:12.293452', '2021-06-17 13:34:12.293452', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('6999', '2021-06-17 13:34:12.294635', '2021-06-17 13:34:12.294635', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('7000', '2021-06-17 13:34:18.475253', '2021-06-17 13:34:18.475253', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7001', '2021-06-17 13:34:18.481897', '2021-06-17 13:34:18.481897', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7002', '2021-06-17 13:34:18.759475', '2021-06-17 13:34:18.759475', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7003', '2021-06-17 13:34:18.760798', '2021-06-17 13:34:18.760798', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7004', '2021-06-17 13:34:19.685218', '2021-06-17 13:34:19.685218', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('7005', '2021-06-17 13:34:19.686458', '2021-06-17 13:34:19.686458', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('7006', '2021-06-17 13:34:33.090586', '2021-06-17 13:34:33.090586', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7007', '2021-06-17 13:34:33.091662', '2021-06-17 13:34:33.091662', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7008', '2021-06-17 13:34:35.202435', '2021-06-17 13:34:35.202435', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"{\\\"type\\\":\\\"1\\\"}\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7009', '2021-06-17 13:34:35.203597', '2021-06-17 13:34:35.203597', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"{\\\"type\\\":\\\"1\\\"}\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7010', '2021-06-17 13:34:48.081041', '2021-06-17 13:34:48.081041', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7011', '2021-06-17 13:34:48.082098', '2021-06-17 13:34:48.082098', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7012', '2021-06-17 13:34:50.149164', '2021-06-17 13:34:50.149164', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"{\\\"type\\\":1}\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7013', '2021-06-17 13:34:50.150284', '2021-06-17 13:34:50.150284', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"{\\\"type\\\":1}\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7014', '2021-06-17 13:35:19.782054', '2021-06-17 13:35:19.782054', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7015', '2021-06-17 13:35:19.785804', '2021-06-17 13:35:19.785804', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7016', '2021-06-17 13:35:20.059363', '2021-06-17 13:35:20.059363', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7017', '2021-06-17 13:35:20.060467', '2021-06-17 13:35:20.060467', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7018', '2021-06-17 13:35:22.632163', '2021-06-17 13:35:22.632163', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7019', '2021-06-17 13:35:22.633306', '2021-06-17 13:35:22.633306', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7020', '2021-06-17 13:35:42.637540', '2021-06-17 13:35:42.637540', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7021', '2021-06-17 13:35:42.638564', '2021-06-17 13:35:42.638564', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7022', '2021-06-17 13:35:44.340520', '2021-06-17 13:35:44.340520', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7023', '2021-06-17 13:35:44.341484', '2021-06-17 13:35:44.341484', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7024', '2021-06-17 13:35:45.161908', '2021-06-17 13:35:45.161908', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7025', '2021-06-17 13:35:45.163116', '2021-06-17 13:35:45.163116', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7026', '2021-06-17 13:36:19.453710', '2021-06-17 13:36:19.453710', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7027', '2021-06-17 13:36:19.454621', '2021-06-17 13:36:19.454621', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7028', '2021-06-17 13:36:24.826513', '2021-06-17 13:36:24.826513', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7029', '2021-06-17 13:36:24.836282', '2021-06-17 13:36:24.836282', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7030', '2021-06-17 13:36:25.110382', '2021-06-17 13:36:25.110382', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7031', '2021-06-17 13:36:25.111855', '2021-06-17 13:36:25.111855', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7032', '2021-06-17 13:36:25.974938', '2021-06-17 13:36:25.974938', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7033', '2021-06-17 13:36:25.976026', '2021-06-17 13:36:25.976026', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7034', '2021-06-17 13:37:40.613154', '2021-06-17 13:37:40.613154', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7035', '2021-06-17 13:37:40.614473', '2021-06-17 13:37:40.614473', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7036', '2021-06-17 13:37:42.276949', '2021-06-17 13:37:42.276949', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7037', '2021-06-17 13:37:42.278018', '2021-06-17 13:37:42.278018', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7038', '2021-06-17 13:38:01.263215', '2021-06-17 13:38:01.263215', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7039', '2021-06-17 13:38:01.264473', '2021-06-17 13:38:01.264473', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7040', '2021-06-17 13:38:03.521019', '2021-06-17 13:38:03.521019', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":0}');
INSERT INTO `base_sys_log` VALUES ('7041', '2021-06-17 13:38:03.522472', '2021-06-17 13:38:03.522472', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":0}');
INSERT INTO `base_sys_log` VALUES ('7042', '2021-06-17 13:38:08.576937', '2021-06-17 13:38:08.576937', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7043', '2021-06-17 13:38:08.578216', '2021-06-17 13:38:08.578216', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7044', '2021-06-17 13:39:04.230516', '2021-06-17 13:39:04.230516', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7045', '2021-06-17 13:39:04.234130', '2021-06-17 13:39:04.234130', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7046', '2021-06-17 13:39:04.604903', '2021-06-17 13:39:04.604903', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7047', '2021-06-17 13:39:04.605862', '2021-06-17 13:39:04.605862', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7048', '2021-06-17 13:39:14.462267', '2021-06-17 13:39:14.462267', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7049', '2021-06-17 13:39:14.465139', '2021-06-17 13:39:14.465139', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7050', '2021-06-17 13:39:14.722032', '2021-06-17 13:39:14.722032', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7051', '2021-06-17 13:39:14.723960', '2021-06-17 13:39:14.723960', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7052', '2021-06-17 13:39:40.652590', '2021-06-17 13:39:40.652590', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7053', '2021-06-17 13:39:40.654902', '2021-06-17 13:39:40.654902', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7054', '2021-06-17 13:39:40.974655', '2021-06-17 13:39:40.974655', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7055', '2021-06-17 13:39:40.975762', '2021-06-17 13:39:40.975762', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7056', '2021-06-17 13:40:08.867626', '2021-06-17 13:40:08.867626', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7057', '2021-06-17 13:40:08.869833', '2021-06-17 13:40:08.869833', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7058', '2021-06-17 13:40:09.118512', '2021-06-17 13:40:09.118512', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7059', '2021-06-17 13:40:09.120378', '2021-06-17 13:40:09.120378', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7060', '2021-06-17 13:42:21.149072', '2021-06-17 13:42:21.149072', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7061', '2021-06-17 13:42:21.152359', '2021-06-17 13:42:21.152359', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7062', '2021-06-17 13:42:23.021617', '2021-06-17 13:42:23.021617', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7063', '2021-06-17 13:42:23.022766', '2021-06-17 13:42:23.022766', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7064', '2021-06-17 13:42:26.053982', '2021-06-17 13:42:26.053982', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7065', '2021-06-17 13:42:26.055269', '2021-06-17 13:42:26.055269', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7066', '2021-06-17 13:42:37.202734', '2021-06-17 13:42:37.202734', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7067', '2021-06-17 13:42:37.204279', '2021-06-17 13:42:37.204279', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7068', '2021-06-17 13:42:39.637677', '2021-06-17 13:42:39.637677', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7069', '2021-06-17 13:42:39.638965', '2021-06-17 13:42:39.638965', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7070', '2021-06-17 13:47:08.000056', '2021-06-17 13:47:08.000056', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7071', '2021-06-17 13:47:08.004755', '2021-06-17 13:47:08.004755', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7072', '2021-06-17 13:47:08.785765', '2021-06-17 13:47:08.785765', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7073', '2021-06-17 13:47:08.787066', '2021-06-17 13:47:08.787066', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7074', '2021-06-17 13:47:09.717531', '2021-06-17 13:47:09.717531', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7075', '2021-06-17 13:47:09.718592', '2021-06-17 13:47:09.718592', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7076', '2021-06-17 13:47:12.020898', '2021-06-17 13:47:12.020898', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7077', '2021-06-17 13:48:20.245884', '2021-06-17 13:48:20.245884', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7078', '2021-06-17 14:08:38.210149', '2021-06-17 14:08:38.210149', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7079', '2021-06-17 14:08:38.214262', '2021-06-17 14:08:38.214262', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7080', '2021-06-17 14:08:38.561814', '2021-06-17 14:08:38.561814', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7081', '2021-06-17 14:08:38.563167', '2021-06-17 14:08:38.563167', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7082', '2021-06-17 14:08:46.476588', '2021-06-17 14:08:46.476588', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7083', '2021-06-17 14:08:46.478862', '2021-06-17 14:08:46.478862', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7084', '2021-06-17 14:08:48.160928', '2021-06-17 14:08:48.160928', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7085', '2021-06-17 14:08:48.161956', '2021-06-17 14:08:48.161956', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7086', '2021-06-17 14:09:12.441493', '2021-06-17 14:09:12.441493', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7087', '2021-06-17 14:09:21.370044', '2021-06-17 14:09:21.370044', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa7\"}');
INSERT INTO `base_sys_log` VALUES ('7088', '2021-06-17 14:09:24.766742', '2021-06-17 14:09:24.766742', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7089', '2021-06-17 14:10:07.936701', '2021-06-17 14:10:07.936701', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xd5\"}');
INSERT INTO `base_sys_log` VALUES ('7090', '2021-06-17 14:10:13.002347', '2021-06-17 14:10:13.002347', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7091', '2021-06-17 14:10:21.213071', '2021-06-17 14:10:21.213071', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa7\"}');
INSERT INTO `base_sys_log` VALUES ('7092', '2021-06-17 14:10:48.128213', '2021-06-17 14:10:48.128213', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7093', '2021-06-17 14:10:48.129565', '2021-06-17 14:10:48.129565', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7094', '2021-06-17 14:10:51.533657', '2021-06-17 14:10:51.533657', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7095', '2021-06-17 14:10:51.535608', '2021-06-17 14:10:51.535608', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7096', '2021-06-17 14:10:51.881531', '2021-06-17 14:10:51.881531', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7097', '2021-06-17 14:10:51.885258', '2021-06-17 14:10:51.885258', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7098', '2021-06-17 14:10:54.077907', '2021-06-17 14:10:54.077907', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7099', '2021-06-17 14:10:54.078965', '2021-06-17 14:10:54.078965', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7100', '2021-06-17 14:11:07.565527', '2021-06-17 14:11:07.565527', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7101', '2021-06-17 14:11:07.567517', '2021-06-17 14:11:07.567517', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7102', '2021-06-17 14:11:58.290995', '2021-06-17 14:11:58.290995', '1', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7103', '2021-06-17 14:12:06.799645', '2021-06-17 14:12:06.799645', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\",\"captchaId\":\"\",\"verifyCode\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7104', '2021-06-17 14:12:06.909161', '2021-06-17 14:12:06.909161', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7105', '2021-06-17 14:12:06.937700', '2021-06-17 14:12:06.937700', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7106', '2021-06-17 14:12:10.259524', '2021-06-17 14:12:10.259524', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7107', '2021-06-17 14:12:10.272255', '2021-06-17 14:12:10.272255', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7108', '2021-06-17 14:12:16.147069', '2021-06-17 14:12:16.147069', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7109', '2021-06-17 14:12:16.155800', '2021-06-17 14:12:16.155800', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7110', '2021-06-17 14:12:16.450240', '2021-06-17 14:12:16.450240', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7111', '2021-06-17 14:12:16.460873', '2021-06-17 14:12:16.460873', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7112', '2021-06-17 14:12:40.705921', '2021-06-17 14:12:40.705921', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7113', '2021-06-17 14:12:40.707424', '2021-06-17 14:12:40.707424', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7114', '2021-06-17 14:12:40.726549', '2021-06-17 14:12:40.726549', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7115', '2021-06-17 14:12:40.731682', '2021-06-17 14:12:40.731682', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7116', '2021-06-17 14:12:50.574355', '2021-06-17 14:12:50.574355', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7117', '2021-06-17 14:12:50.580456', '2021-06-17 14:12:50.580456', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7118', '2021-06-17 14:12:50.881744', '2021-06-17 14:12:50.881744', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7119', '2021-06-17 14:12:50.890594', '2021-06-17 14:12:50.890594', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7120', '2021-06-17 14:13:33.740259', '2021-06-17 14:13:33.740259', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7121', '2021-06-17 14:13:33.751721', '2021-06-17 14:13:33.751721', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7122', '2021-06-17 14:16:39.422847', '2021-06-17 14:16:39.422847', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7123', '2021-06-17 14:16:39.425614', '2021-06-17 14:16:39.425614', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7124', '2021-06-17 14:16:39.427211', '2021-06-17 14:16:39.427211', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7125', '2021-06-17 14:16:39.429121', '2021-06-17 14:16:39.429121', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7126', '2021-06-17 14:16:45.955903', '2021-06-17 14:16:45.955903', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7127', '2021-06-17 14:16:45.963540', '2021-06-17 14:16:45.963540', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7128', '2021-06-17 14:16:50.184826', '2021-06-17 14:16:50.184826', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7129', '2021-06-17 14:16:50.192656', '2021-06-17 14:16:50.192656', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7130', '2021-06-17 14:17:10.022256', '2021-06-17 14:17:10.022256', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7131', '2021-06-17 14:17:10.029968', '2021-06-17 14:17:10.029968', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7132', '2021-06-17 14:17:10.040292', '2021-06-17 14:17:10.040292', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7133', '2021-06-17 14:17:10.045011', '2021-06-17 14:17:10.045011', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7134', '2021-06-17 14:17:12.148594', '2021-06-17 14:17:12.148594', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7135', '2021-06-17 14:17:12.156369', '2021-06-17 14:17:12.156369', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7136', '2021-06-17 14:17:32.825854', '2021-06-17 14:17:32.825854', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7137', '2021-06-17 14:17:32.838656', '2021-06-17 14:17:32.838656', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7138', '2021-06-17 14:17:42.642183', '2021-06-17 14:17:42.642183', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7139', '2021-06-17 14:17:42.647825', '2021-06-17 14:17:42.647825', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7140', '2021-06-17 14:19:14.391830', '2021-06-17 14:19:14.391830', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7141', '2021-06-17 14:19:14.398757', '2021-06-17 14:19:14.398757', '35', '/admin/machine/device/add', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"测试设备\",\"channelName\":\"通道1\",\"mac\":\"mac001\",\"maintainer\":43}');
INSERT INTO `base_sys_log` VALUES ('7142', '2021-06-17 14:19:14.684650', '2021-06-17 14:19:14.684650', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7143', '2021-06-17 14:19:14.696963', '2021-06-17 14:19:14.696963', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7144', '2021-06-17 14:19:23.606405', '2021-06-17 14:19:23.606405', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7145', '2021-06-17 14:19:23.616453', '2021-06-17 14:19:23.616453', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7146', '2021-06-17 14:20:15.765554', '2021-06-17 14:20:15.765554', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7147', '2021-06-17 14:20:15.777906', '2021-06-17 14:20:15.777906', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7148', '2021-06-17 14:20:18.210903', '2021-06-17 14:20:18.210903', '35', '/admin/base/comm/logout', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7149', '2021-06-17 14:20:21.825752', '2021-06-17 14:20:21.825752', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"\",\"verifyCode\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7150', '2021-06-17 14:20:21.878249', '2021-06-17 14:20:21.878249', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7151', '2021-06-17 14:20:21.906275', '2021-06-17 14:20:21.906275', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7152', '2021-06-17 14:20:31.653223', '2021-06-17 14:20:31.653223', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7153', '2021-06-17 14:20:31.654292', '2021-06-17 14:20:31.654292', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7154', '2021-06-17 14:21:00.103675', '2021-06-17 14:21:00.103675', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7155', '2021-06-17 14:21:00.106719', '2021-06-17 14:21:00.106719', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7156', '2021-06-17 14:21:01.758637', '2021-06-17 14:21:01.758637', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7157', '2021-06-17 14:21:01.760616', '2021-06-17 14:21:01.760616', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7158', '2021-06-17 14:21:21.867234', '2021-06-17 14:21:21.867234', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7159', '2021-06-17 14:21:21.868275', '2021-06-17 14:21:21.868275', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7160', '2021-06-17 14:21:22.180279', '2021-06-17 14:21:22.180279', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7161', '2021-06-17 14:21:22.181429', '2021-06-17 14:21:22.181429', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7162', '2021-06-17 14:21:40.441415', '2021-06-17 14:21:40.441415', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:page,machine:instruct:list,machine:instruct:info,machine:instruct:add,machine:instruct:delete,machine:instruct:update,machine:mqtt:page,machine:mqtt:list,machine:mqtt:info,machine:mqtt:add,machine:mqtt:delete,machine:mqtt:update,base:sys:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-30 16:26:24\"}');
INSERT INTO `base_sys_log` VALUES ('7163', '2021-06-17 14:21:40.442960', '2021-06-17 14:21:40.442960', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:page,machine:instruct:list,machine:instruct:info,machine:instruct:add,machine:instruct:delete,machine:instruct:update,machine:mqtt:page,machine:mqtt:list,machine:mqtt:info,machine:mqtt:add,machine:mqtt:delete,machine:mqtt:update,base:sys:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-30 16:26:24\"}');
INSERT INTO `base_sys_log` VALUES ('7164', '2021-06-17 14:22:08.858606', '2021-06-17 14:22:08.858606', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,base:sys:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-30 16:26:24\"}');
INSERT INTO `base_sys_log` VALUES ('7165', '2021-06-17 14:22:08.859812', '2021-06-17 14:22:08.859812', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,base:sys:user:list\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-03-30 16:26:24\"}');
INSERT INTO `base_sys_log` VALUES ('7166', '2021-06-17 14:22:09.528664', '2021-06-17 14:22:09.528664', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7167', '2021-06-17 14:22:09.530303', '2021-06-17 14:22:09.530303', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7168', '2021-06-17 14:22:14.787854', '2021-06-17 14:22:14.787854', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7169', '2021-06-17 14:22:14.788859', '2021-06-17 14:22:14.788859', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7170', '2021-06-17 14:22:15.106883', '2021-06-17 14:22:15.106883', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7171', '2021-06-17 14:22:15.107981', '2021-06-17 14:22:15.107981', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7172', '2021-06-17 14:22:17.883068', '2021-06-17 14:22:17.883068', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:22:08\"}');
INSERT INTO `base_sys_log` VALUES ('7173', '2021-06-17 14:22:17.884220', '2021-06-17 14:22:17.884220', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:22:08\"}');
INSERT INTO `base_sys_log` VALUES ('7174', '2021-06-17 14:22:18.141803', '2021-06-17 14:22:18.141803', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7175', '2021-06-17 14:22:18.142708', '2021-06-17 14:22:18.142708', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7176', '2021-06-17 14:22:36.464522', '2021-06-17 14:22:36.464522', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\",\"captchaId\":\"\",\"verifyCode\":\"\"}');
INSERT INTO `base_sys_log` VALUES ('7177', '2021-06-17 14:22:36.500524', '2021-06-17 14:22:36.500524', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7178', '2021-06-17 14:22:36.539974', '2021-06-17 14:22:36.539974', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7179', '2021-06-17 14:22:39.125357', '2021-06-17 14:22:39.125357', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7180', '2021-06-17 14:22:39.132672', '2021-06-17 14:22:39.132672', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7181', '2021-06-17 14:22:40.409099', '2021-06-17 14:22:40.409099', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7182', '2021-06-17 14:22:40.414243', '2021-06-17 14:22:40.414243', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7183', '2021-06-17 14:22:42.811193', '2021-06-17 14:22:42.811193', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7184', '2021-06-17 14:22:42.813368', '2021-06-17 14:22:42.813368', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7185', '2021-06-17 14:22:44.665627', '2021-06-17 14:22:44.665627', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7186', '2021-06-17 14:22:44.676477', '2021-06-17 14:22:44.676477', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7187', '2021-06-17 14:22:48.653778', '2021-06-17 14:22:48.653778', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7188', '2021-06-17 14:22:48.656968', '2021-06-17 14:22:48.656968', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7189', '2021-06-17 14:22:48.690442', '2021-06-17 14:22:48.690442', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7190', '2021-06-17 14:22:48.693457', '2021-06-17 14:22:48.693457', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7191', '2021-06-17 14:23:48.838560', '2021-06-17 14:23:48.838560', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,machine:mqtt:page\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:22:17\"}');
INSERT INTO `base_sys_log` VALUES ('7192', '2021-06-17 14:23:48.839603', '2021-06-17 14:23:48.839603', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,machine:mqtt:page\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:22:17\"}');
INSERT INTO `base_sys_log` VALUES ('7193', '2021-06-17 14:23:49.428875', '2021-06-17 14:23:49.428875', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7194', '2021-06-17 14:23:49.430100', '2021-06-17 14:23:49.430100', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7195', '2021-06-17 14:23:52.933745', '2021-06-17 14:23:52.933745', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7196', '2021-06-17 14:23:52.935209', '2021-06-17 14:23:52.935209', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7197', '2021-06-17 14:23:53.248815', '2021-06-17 14:23:53.248815', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7198', '2021-06-17 14:23:53.249579', '2021-06-17 14:23:53.249579', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7199', '2021-06-17 14:23:55.731742', '2021-06-17 14:23:55.731742', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:48\"}');
INSERT INTO `base_sys_log` VALUES ('7200', '2021-06-17 14:23:55.732727', '2021-06-17 14:23:55.732727', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:48\"}');
INSERT INTO `base_sys_log` VALUES ('7201', '2021-06-17 14:23:55.988436', '2021-06-17 14:23:55.988436', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7202', '2021-06-17 14:23:55.989453', '2021-06-17 14:23:55.989453', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7203', '2021-06-17 14:24:01.766925', '2021-06-17 14:24:01.766925', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7204', '2021-06-17 14:24:01.770409', '2021-06-17 14:24:01.770409', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7205', '2021-06-17 14:24:01.954767', '2021-06-17 14:24:01.954767', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7206', '2021-06-17 14:24:01.964525', '2021-06-17 14:24:01.964525', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7207', '2021-06-17 14:24:03.307358', '2021-06-17 14:24:03.307358', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7208', '2021-06-17 14:24:03.312272', '2021-06-17 14:24:03.312272', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7209', '2021-06-17 14:24:04.864435', '2021-06-17 14:24:04.864435', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7210', '2021-06-17 14:24:04.866306', '2021-06-17 14:24:04.866306', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7211', '2021-06-17 14:24:06.173626', '2021-06-17 14:24:06.173626', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7212', '2021-06-17 14:24:06.181641', '2021-06-17 14:24:06.181641', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7213', '2021-06-17 14:25:42.514281', '2021-06-17 14:25:42.514281', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7214', '2021-06-17 14:25:42.516224', '2021-06-17 14:25:42.516224', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7215', '2021-06-17 14:25:42.803043', '2021-06-17 14:25:42.803043', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7216', '2021-06-17 14:25:42.812421', '2021-06-17 14:25:42.812421', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7217', '2021-06-17 14:25:44.096403', '2021-06-17 14:25:44.096403', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7218', '2021-06-17 14:25:44.098482', '2021-06-17 14:25:44.098482', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7219', '2021-06-17 14:25:44.362856', '2021-06-17 14:25:44.362856', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7220', '2021-06-17 14:25:44.363762', '2021-06-17 14:25:44.363762', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7221', '2021-06-17 14:25:45.742862', '2021-06-17 14:25:45.742862', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7222', '2021-06-17 14:25:45.747763', '2021-06-17 14:25:45.747763', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7223', '2021-06-17 14:25:47.955838', '2021-06-17 14:25:47.955838', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7224', '2021-06-17 14:25:47.957693', '2021-06-17 14:25:47.957693', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7225', '2021-06-17 14:25:49.691370', '2021-06-17 14:25:49.691370', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7226', '2021-06-17 14:25:49.693532', '2021-06-17 14:25:49.693532', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7227', '2021-06-17 14:25:51.411068', '2021-06-17 14:25:51.411068', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7228', '2021-06-17 14:25:51.414159', '2021-06-17 14:25:51.414159', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7229', '2021-06-17 14:26:01.868011', '2021-06-17 14:26:01.868011', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7230', '2021-06-17 14:26:01.871626', '2021-06-17 14:26:01.871626', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7231', '2021-06-17 14:26:02.094653', '2021-06-17 14:26:02.094653', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7232', '2021-06-17 14:26:02.095464', '2021-06-17 14:26:02.095464', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7233', '2021-06-17 14:26:12.495271', '2021-06-17 14:26:12.495271', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7234', '2021-06-17 14:26:12.496089', '2021-06-17 14:26:12.496089', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7235', '2021-06-17 14:26:12.804356', '2021-06-17 14:26:12.804356', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7236', '2021-06-17 14:26:12.805892', '2021-06-17 14:26:12.805892', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7237', '2021-06-17 14:26:29.935163', '2021-06-17 14:26:29.935163', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:55\"}');
INSERT INTO `base_sys_log` VALUES ('7238', '2021-06-17 14:26:29.936421', '2021-06-17 14:26:29.936421', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:55\"}');
INSERT INTO `base_sys_log` VALUES ('7239', '2021-06-17 14:26:30.180755', '2021-06-17 14:26:30.180755', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7240', '2021-06-17 14:26:30.181715', '2021-06-17 14:26:30.181715', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7241', '2021-06-17 14:26:37.956388', '2021-06-17 14:26:37.956388', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7242', '2021-06-17 14:26:37.960395', '2021-06-17 14:26:37.960395', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7243', '2021-06-17 14:26:39.762374', '2021-06-17 14:26:39.762374', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7244', '2021-06-17 14:26:39.770616', '2021-06-17 14:26:39.770616', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7245', '2021-06-17 14:26:40.798725', '2021-06-17 14:26:40.798725', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7246', '2021-06-17 14:26:40.804998', '2021-06-17 14:26:40.804998', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7247', '2021-06-17 14:26:42.128078', '2021-06-17 14:26:42.128078', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7248', '2021-06-17 14:26:42.130454', '2021-06-17 14:26:42.130454', '35', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7249', '2021-06-17 14:26:45.834513', '2021-06-17 14:26:45.834513', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7250', '2021-06-17 14:26:45.839062', '2021-06-17 14:26:45.839062', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7251', '2021-06-17 14:26:45.841838', '2021-06-17 14:26:45.841838', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7252', '2021-06-17 14:26:45.842840', '2021-06-17 14:26:45.842840', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7253', '2021-06-17 14:26:53.663501', '2021-06-17 14:26:53.663501', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,machine:mqtt:sendmsg\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:55\"}');
INSERT INTO `base_sys_log` VALUES ('7254', '2021-06-17 14:26:53.664927', '2021-06-17 14:26:53.664927', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"设备列表\",\"parentId\":\"122\",\"orderNum\":1,\"perms\":\"machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,machine:mqtt:sendmsg\",\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:23:55\"}');
INSERT INTO `base_sys_log` VALUES ('7255', '2021-06-17 14:26:54.289809', '2021-06-17 14:26:54.289809', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7256', '2021-06-17 14:26:54.291126', '2021-06-17 14:26:54.291126', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7257', '2021-06-17 14:26:56.515910', '2021-06-17 14:26:56.515910', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7258', '2021-06-17 14:26:56.516696', '2021-06-17 14:26:56.516696', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"120\"}');
INSERT INTO `base_sys_log` VALUES ('7259', '2021-06-17 14:26:56.825150', '2021-06-17 14:26:56.825150', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7260', '2021-06-17 14:26:56.825957', '2021-06-17 14:26:56.825957', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7261', '2021-06-17 14:26:59.082417', '2021-06-17 14:26:59.082417', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:26:53\"}');
INSERT INTO `base_sys_log` VALUES ('7262', '2021-06-17 14:26:59.083753', '2021-06-17 14:26:59.083753', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备列表\",\"parentId\":\"122\",\"router\":\"\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/machine/views/device.vue\",\"icon\":\"icon-rank\",\"orderNum\":1,\"id\":120,\"createTime\":\"2021-03-24 10:11:31\",\"updateTime\":\"2021-06-17 14:26:53\"}');
INSERT INTO `base_sys_log` VALUES ('7263', '2021-06-17 14:26:59.380055', '2021-06-17 14:26:59.380055', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7264', '2021-06-17 14:26:59.380858', '2021-06-17 14:26:59.380858', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7265', '2021-06-17 14:27:01.725805', '2021-06-17 14:27:01.725805', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7266', '2021-06-17 14:27:01.734883', '2021-06-17 14:27:01.734883', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7267', '2021-06-17 14:27:20.838538', '2021-06-17 14:27:20.838538', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7268', '2021-06-17 14:27:20.846815', '2021-06-17 14:27:20.846815', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7269', '2021-06-17 14:28:04.518693', '2021-06-17 14:28:04.518693', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7270', '2021-06-17 14:28:04.528191', '2021-06-17 14:28:04.528191', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7271', '2021-06-17 14:28:06.004477', '2021-06-17 14:28:06.004477', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7272', '2021-06-17 14:28:06.010291', '2021-06-17 14:28:06.010291', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7273', '2021-06-17 14:28:07.136009', '2021-06-17 14:28:07.136009', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa8\"}');
INSERT INTO `base_sys_log` VALUES ('7274', '2021-06-17 14:28:11.296808', '2021-06-17 14:28:11.296808', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xa7\"}');
INSERT INTO `base_sys_log` VALUES ('7275', '2021-06-17 14:28:12.508947', '2021-06-17 14:28:12.508947', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xd5\"}');
INSERT INTO `base_sys_log` VALUES ('7276', '2021-06-17 14:28:12.788538', '2021-06-17 14:28:12.788538', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xd3\"}');
INSERT INTO `base_sys_log` VALUES ('7277', '2021-06-17 14:28:13.185917', '2021-06-17 14:28:13.185917', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no002\",\"code\":\"0xd2\"}');
INSERT INTO `base_sys_log` VALUES ('7278', '2021-06-17 14:28:38.061928', '2021-06-17 14:28:38.061928', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7279', '2021-06-17 14:28:38.077340', '2021-06-17 14:28:38.077340', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7280', '2021-06-18 11:02:12.364399', '2021-06-18 11:02:12.364399', null, '/app/machine/workorder/generate', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7281', '2021-06-19 09:27:54.869770', '2021-06-19 09:27:54.869770', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYyMzkxMDgyMSwiZXhwIjoxNjI1MjA2ODIxfQ.kvYztI4_846HTZrWgnMtNQ1NHCdqPnkBUxZ_Xy78cQs\"}');
INSERT INTO `base_sys_log` VALUES ('7282', '2021-06-19 09:27:55.139031', '2021-06-19 09:27:55.139031', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7283', '2021-06-19 09:27:55.141060', '2021-06-19 09:27:55.141060', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7284', '2021-06-19 09:27:58.438685', '2021-06-19 09:27:58.438685', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7285', '2021-06-19 09:27:58.440716', '2021-06-19 09:27:58.440716', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7286', '2021-06-19 09:38:34.976131', '2021-06-19 09:38:34.976131', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7287', '2021-06-19 09:38:34.980368', '2021-06-19 09:38:34.980368', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7288', '2021-06-19 09:39:29.999096', '2021-06-19 09:39:29.999096', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7289', '2021-06-19 09:39:30.001407', '2021-06-19 09:39:30.001407', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7290', '2021-06-19 09:41:32.723401', '2021-06-19 09:41:32.723401', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7291', '2021-06-19 09:41:32.726439', '2021-06-19 09:41:32.726439', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7292', '2021-06-19 09:43:48.156336', '2021-06-19 09:43:48.156336', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7293', '2021-06-19 09:43:48.159061', '2021-06-19 09:43:48.159061', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7294', '2021-06-19 09:45:32.177292', '2021-06-19 09:45:32.177292', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7295', '2021-06-19 09:45:32.180511', '2021-06-19 09:45:32.180511', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7296', '2021-06-19 09:45:34.910783', '2021-06-19 09:45:34.910783', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7297', '2021-06-19 09:45:34.913055', '2021-06-19 09:45:34.913055', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7298', '2021-06-19 09:46:00.525797', '2021-06-19 09:46:00.525797', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7299', '2021-06-19 09:46:00.534571', '2021-06-19 09:46:00.534571', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7300', '2021-06-19 09:46:00.781252', '2021-06-19 09:46:00.781252', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7301', '2021-06-19 09:46:00.783337', '2021-06-19 09:46:00.783337', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7302', '2021-06-19 09:49:31.547108', '2021-06-19 09:49:31.547108', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7303', '2021-06-19 09:49:31.551307', '2021-06-19 09:49:31.551307', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7304', '2021-06-19 09:49:33.176598', '2021-06-19 09:49:33.176598', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7305', '2021-06-19 09:49:33.178807', '2021-06-19 09:49:33.178807', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7306', '2021-06-19 09:50:40.127192', '2021-06-19 09:50:40.127192', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7307', '2021-06-19 09:50:40.130102', '2021-06-19 09:50:40.130102', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7308', '2021-06-19 09:51:03.556747', '2021-06-19 09:51:03.556747', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7309', '2021-06-19 09:51:03.559109', '2021-06-19 09:51:03.559109', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7310', '2021-06-19 09:51:08.884729', '2021-06-19 09:51:08.884729', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7311', '2021-06-19 09:51:08.887569', '2021-06-19 09:51:08.887569', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7312', '2021-06-19 09:51:08.921714', '2021-06-19 09:51:08.921714', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7313', '2021-06-19 09:51:08.926095', '2021-06-19 09:51:08.926095', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7314', '2021-06-19 09:51:08.954844', '2021-06-19 09:51:08.954844', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('7315', '2021-06-19 09:51:08.959090', '2021-06-19 09:51:08.959090', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"13\"}');
INSERT INTO `base_sys_log` VALUES ('7316', '2021-06-19 09:51:28.149015', '2021-06-19 09:51:28.149015', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7317', '2021-06-19 09:51:28.151784', '2021-06-19 09:51:28.151784', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7318', '2021-06-19 09:51:28.487934', '2021-06-19 09:51:28.487934', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7319', '2021-06-19 09:51:28.497021', '2021-06-19 09:51:28.497021', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7320', '2021-06-19 09:51:49.986565', '2021-06-19 09:51:49.986565', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7321', '2021-06-19 09:51:49.988564', '2021-06-19 09:51:49.988564', '1', '/admin/machine/workorder_code/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7322', '2021-06-19 09:51:50.316560', '2021-06-19 09:51:50.316560', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7323', '2021-06-19 09:51:50.318532', '2021-06-19 09:51:50.318532', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7324', '2021-06-19 09:52:18.374519', '2021-06-19 09:52:18.374519', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7325', '2021-06-19 09:52:18.384886', '2021-06-19 09:52:18.384886', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7326', '2021-06-19 09:52:18.414865', '2021-06-19 09:52:18.414865', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7327', '2021-06-19 09:52:18.423760', '2021-06-19 09:52:18.423760', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7328', '2021-06-19 09:52:18.440682', '2021-06-19 09:52:18.440682', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('7329', '2021-06-19 09:52:18.444077', '2021-06-19 09:52:18.444077', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"10\"}');
INSERT INTO `base_sys_log` VALUES ('7330', '2021-06-19 09:52:32.948969', '2021-06-19 09:52:32.948969', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,124,125,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119,122],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-04-01 09:10:57\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('7331', '2021-06-19 09:52:32.951418', '2021-06-19 09:52:32.951418', '1', '/admin/base/sys/role/update', '127.0.0.1', '本机地址', '{\"name\":\"总公司\",\"label\":\"admin-sys\",\"remark\":\"\",\"menuIdList\":[121,124,125,120,2,27,97,59,60,61,62,63,65,98,99,100,101,8,10,11,12,13,22,23,24,25,26,78,79,80,81,82,83,105,29,30,117,118,119,122],\"departmentIdList\":[1,11,14,15],\"relevance\":1,\"id\":10,\"createTime\":\"2021-02-26 14:15:38\",\"updateTime\":\"2021-04-01 09:10:57\",\"userId\":\"1\"}');
INSERT INTO `base_sys_log` VALUES ('7332', '2021-06-19 09:52:33.499459', '2021-06-19 09:52:33.499459', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7333', '2021-06-19 09:52:33.501522', '2021-06-19 09:52:33.501522', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7334', '2021-06-19 09:52:58.239549', '2021-06-19 09:52:58.239549', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7335', '2021-06-19 09:52:58.242610', '2021-06-19 09:52:58.242610', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7336', '2021-06-19 09:52:58.600014', '2021-06-19 09:52:58.600014', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('7337', '2021-06-19 09:52:58.602487', '2021-06-19 09:52:58.602487', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('7338', '2021-06-19 09:53:03.375588', '2021-06-19 09:53:03.375588', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7339', '2021-06-19 09:53:03.378917', '2021-06-19 09:53:03.378917', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7340', '2021-06-19 09:53:03.387397', '2021-06-19 09:53:03.387397', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('7341', '2021-06-19 09:53:03.391264', '2021-06-19 09:53:03.391264', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"123\"}');
INSERT INTO `base_sys_log` VALUES ('7342', '2021-06-19 09:53:05.343075', '2021-06-19 09:53:05.343075', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备错误码\",\"parentId\":\"122\",\"router\":null,\"keepAlive\":true,\"isShow\":false,\"viewPath\":\"cool/modules/machine/views/deviceErrorCode.vue\",\"icon\":\"icon-command\",\"orderNum\":0,\"id\":123,\"createTime\":\"2021-03-30 16:28:30\",\"updateTime\":\"2021-03-30 16:28:30\"}');
INSERT INTO `base_sys_log` VALUES ('7343', '2021-06-19 09:53:05.347346', '2021-06-19 09:53:05.347346', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"设备错误码\",\"parentId\":\"122\",\"router\":null,\"keepAlive\":true,\"isShow\":false,\"viewPath\":\"cool/modules/machine/views/deviceErrorCode.vue\",\"icon\":\"icon-command\",\"orderNum\":0,\"id\":123,\"createTime\":\"2021-03-30 16:28:30\",\"updateTime\":\"2021-03-30 16:28:30\"}');
INSERT INTO `base_sys_log` VALUES ('7344', '2021-06-19 09:53:11.664478', '2021-06-19 09:53:11.664478', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7345', '2021-06-19 09:53:11.670013', '2021-06-19 09:53:11.670013', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7346', '2021-06-19 09:53:11.880263', '2021-06-19 09:53:11.880263', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7347', '2021-06-19 09:53:11.882173', '2021-06-19 09:53:11.882173', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7348', '2021-06-19 09:53:14.279480', '2021-06-19 09:53:14.279480', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7349', '2021-06-19 09:53:14.281509', '2021-06-19 09:53:14.281509', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7350', '2021-06-19 09:54:20.150256', '2021-06-19 09:54:20.150256', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7351', '2021-06-19 09:54:20.168254', '2021-06-19 09:54:20.168254', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7352', '2021-06-19 09:55:58.879342', '2021-06-19 09:55:58.879342', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7353', '2021-06-19 09:55:58.881554', '2021-06-19 09:55:58.881554', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7354', '2021-06-19 09:56:32.364605', '2021-06-19 09:56:32.364605', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7355', '2021-06-19 09:56:32.366722', '2021-06-19 09:56:32.366722', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7356', '2021-06-19 09:56:53.435672', '2021-06-19 09:56:53.435672', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7357', '2021-06-19 09:56:53.447674', '2021-06-19 09:56:53.447674', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7358', '2021-06-19 09:56:53.679562', '2021-06-19 09:56:53.679562', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7359', '2021-06-19 09:56:53.686328', '2021-06-19 09:56:53.686328', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7360', '2021-06-19 09:56:56.995271', '2021-06-19 09:56:56.995271', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":2}');
INSERT INTO `base_sys_log` VALUES ('7361', '2021-06-19 09:56:56.997193', '2021-06-19 09:56:56.997193', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":2}');
INSERT INTO `base_sys_log` VALUES ('7362', '2021-06-19 09:56:58.652187', '2021-06-19 09:56:58.652187', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1}');
INSERT INTO `base_sys_log` VALUES ('7363', '2021-06-19 09:56:58.654264', '2021-06-19 09:56:58.654264', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1}');
INSERT INTO `base_sys_log` VALUES ('7364', '2021-06-19 09:57:07.509647', '2021-06-19 09:57:07.509647', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":2}');
INSERT INTO `base_sys_log` VALUES ('7365', '2021-06-19 09:57:07.512053', '2021-06-19 09:57:07.512053', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":2}');
INSERT INTO `base_sys_log` VALUES ('7366', '2021-06-19 09:57:13.775991', '2021-06-19 09:57:13.775991', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1}');
INSERT INTO `base_sys_log` VALUES ('7367', '2021-06-19 09:57:13.778233', '2021-06-19 09:57:13.778233', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1}');
INSERT INTO `base_sys_log` VALUES ('7368', '2021-06-19 09:57:22.517747', '2021-06-19 09:57:22.517747', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7369', '2021-06-19 09:57:22.519781', '2021-06-19 09:57:22.519781', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7370', '2021-06-19 09:57:25.151914', '2021-06-19 09:57:25.151914', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7371', '2021-06-19 09:57:25.153830', '2021-06-19 09:57:25.153830', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7372', '2021-06-19 09:57:30.603065', '2021-06-19 09:57:30.603065', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7373', '2021-06-19 09:57:30.605178', '2021-06-19 09:57:30.605178', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"query\":1,\"type\":2}');
INSERT INTO `base_sys_log` VALUES ('7374', '2021-06-19 09:57:42.341518', '2021-06-19 09:57:42.341518', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7375', '2021-06-19 09:57:42.344624', '2021-06-19 09:57:42.344624', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7376', '2021-06-19 09:57:52.201201', '2021-06-19 09:57:52.201201', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7377', '2021-06-19 09:57:52.203306', '2021-06-19 09:57:52.203306', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7378', '2021-06-19 09:58:08.049911', '2021-06-19 09:58:08.049911', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7379', '2021-06-19 09:58:08.051920', '2021-06-19 09:58:08.051920', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7380', '2021-06-19 09:58:09.584974', '2021-06-19 09:58:09.584974', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7381', '2021-06-19 09:58:09.587143', '2021-06-19 09:58:09.587143', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7382', '2021-06-19 09:58:15.050197', '2021-06-19 09:58:15.050197', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no003\",\"code\":\"0xb7\"}');
INSERT INTO `base_sys_log` VALUES ('7383', '2021-06-19 09:58:31.208310', '2021-06-19 09:58:31.208310', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no003\",\"code\":\"0x9a\"}');
INSERT INTO `base_sys_log` VALUES ('7384', '2021-06-19 09:58:37.373744', '2021-06-19 09:58:37.373744', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no003\",\"code\":\"0xa2\"}');
INSERT INTO `base_sys_log` VALUES ('7385', '2021-06-19 09:59:28.787658', '2021-06-19 09:59:28.787658', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7386', '2021-06-19 09:59:28.790290', '2021-06-19 09:59:28.790290', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7387', '2021-06-19 09:59:31.722433', '2021-06-19 09:59:31.722433', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7388', '2021-06-19 09:59:31.725721', '2021-06-19 09:59:31.725721', '1', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7389', '2021-06-19 09:59:32.648653', '2021-06-19 09:59:32.648653', '1', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"topic\":\"no003\",\"code\":\"0x9a\"}');
INSERT INTO `base_sys_log` VALUES ('7390', '2021-06-19 09:59:52.790897', '2021-06-19 09:59:52.790897', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7391', '2021-06-19 09:59:52.799763', '2021-06-19 09:59:52.799763', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7392', '2021-06-19 09:59:52.842948', '2021-06-19 09:59:52.842948', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7393', '2021-06-19 09:59:52.846327', '2021-06-19 09:59:52.846327', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7394', '2021-06-19 10:05:05.999379', '2021-06-19 10:05:05.999379', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\"}');
INSERT INTO `base_sys_log` VALUES ('7395', '2021-06-19 12:43:17.571733', '2021-06-19 12:43:17.571733', null, '/admin/base/open/login', '127.0.0.1', '本机地址', '{\"username\":\"gcsa\",\"password\":\"123456\"}');
INSERT INTO `base_sys_log` VALUES ('7396', '2021-06-19 12:43:17.706975', '2021-06-19 12:43:17.706975', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7397', '2021-06-19 12:43:17.798432', '2021-06-19 12:43:17.798432', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7398', '2021-06-19 12:43:17.799938', '2021-06-19 12:43:17.799938', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7399', '2021-06-19 12:43:20.789444', '2021-06-19 12:43:20.789444', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7400', '2021-06-19 12:43:20.790680', '2021-06-19 12:43:20.790680', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7401', '2021-06-19 12:43:21.526387', '2021-06-19 12:43:21.526387', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":4}');
INSERT INTO `base_sys_log` VALUES ('7402', '2021-06-19 12:43:21.525181', '2021-06-19 12:43:21.525181', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":4}');
INSERT INTO `base_sys_log` VALUES ('7403', '2021-06-19 12:43:21.790023', '2021-06-19 12:43:21.790023', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7404', '2021-06-19 12:43:21.791048', '2021-06-19 12:43:21.791048', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7405', '2021-06-19 12:43:22.905977', '2021-06-19 12:43:22.905977', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7406', '2021-06-19 12:43:22.906947', '2021-06-19 12:43:22.906947', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7407', '2021-06-19 12:43:24.129174', '2021-06-19 12:43:24.129174', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7408', '2021-06-19 12:43:24.130224', '2021-06-19 12:43:24.130224', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7409', '2021-06-19 12:43:25.325057', '2021-06-19 12:43:25.325057', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7410', '2021-06-19 12:43:25.326050', '2021-06-19 12:43:25.326050', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7411', '2021-06-19 12:45:57.180837', '2021-06-19 12:45:57.180837', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7412', '2021-06-19 12:45:57.183291', '2021-06-19 12:45:57.183291', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7413', '2021-06-19 12:46:34.541849', '2021-06-19 12:46:34.541849', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7414', '2021-06-19 12:46:34.544541', '2021-06-19 12:46:34.544541', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7415', '2021-06-19 12:46:36.169622', '2021-06-19 12:46:36.169622', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7416', '2021-06-19 12:46:36.171160', '2021-06-19 12:46:36.171160', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7417', '2021-06-19 12:46:37.805042', '2021-06-19 12:46:37.805042', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7418', '2021-06-19 12:46:37.806946', '2021-06-19 12:46:37.806946', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7419', '2021-06-19 12:46:38.539330', '2021-06-19 12:46:38.539330', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7420', '2021-06-19 12:46:38.540632', '2021-06-19 12:46:38.540632', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7421', '2021-06-19 12:48:13.271187', '2021-06-19 12:48:13.271187', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7422', '2021-06-19 12:48:13.272224', '2021-06-19 12:48:13.272224', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7423', '2021-06-19 12:48:22.409899', '2021-06-19 12:48:22.409899', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7424', '2021-06-19 12:48:22.411624', '2021-06-19 12:48:22.411624', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7425', '2021-06-19 12:48:36.750654', '2021-06-19 12:48:36.750654', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7426', '2021-06-19 12:48:36.751681', '2021-06-19 12:48:36.751681', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7427', '2021-06-19 12:50:20.493903', '2021-06-19 12:50:20.493903', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7428', '2021-06-19 12:50:20.494862', '2021-06-19 12:50:20.494862', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7429', '2021-06-19 12:51:15.483550', '2021-06-19 12:51:15.483550', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7430', '2021-06-19 12:51:15.484602', '2021-06-19 12:51:15.484602', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7431', '2021-06-19 12:51:19.937440', '2021-06-19 12:51:19.937440', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7432', '2021-06-19 12:51:19.938612', '2021-06-19 12:51:19.938612', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7433', '2021-06-19 12:51:20.761480', '2021-06-19 12:51:20.761480', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7434', '2021-06-19 12:51:20.762593', '2021-06-19 12:51:20.762593', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7435', '2021-06-19 12:51:21.008480', '2021-06-19 12:51:21.008480', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7436', '2021-06-19 12:51:21.009639', '2021-06-19 12:51:21.009639', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7437', '2021-06-19 12:51:22.459081', '2021-06-19 12:51:22.459081', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7438', '2021-06-19 12:51:22.460034', '2021-06-19 12:51:22.460034', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7439', '2021-06-19 12:51:23.475871', '2021-06-19 12:51:23.475871', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7440', '2021-06-19 12:51:23.476971', '2021-06-19 12:51:23.476971', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7441', '2021-06-19 12:51:25.508521', '2021-06-19 12:51:25.508521', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7442', '2021-06-19 12:51:25.509530', '2021-06-19 12:51:25.509530', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7443', '2021-06-19 12:51:29.285213', '2021-06-19 12:51:29.285213', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":4}');
INSERT INTO `base_sys_log` VALUES ('7444', '2021-06-19 12:51:29.286862', '2021-06-19 12:51:29.286862', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":4}');
INSERT INTO `base_sys_log` VALUES ('7445', '2021-06-19 12:51:29.557950', '2021-06-19 12:51:29.557950', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7446', '2021-06-19 12:51:29.559087', '2021-06-19 12:51:29.559087', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":3}');
INSERT INTO `base_sys_log` VALUES ('7447', '2021-06-19 12:51:29.919524', '2021-06-19 12:51:29.919524', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7448', '2021-06-19 12:51:29.920898', '2021-06-19 12:51:29.920898', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7449', '2021-06-19 12:51:31.631566', '2021-06-19 12:51:31.631566', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7450', '2021-06-19 12:51:31.632775', '2021-06-19 12:51:31.632775', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7451', '2021-06-19 12:51:34.057349', '2021-06-19 12:51:34.057349', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7452', '2021-06-19 12:51:34.058268', '2021-06-19 12:51:34.058268', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7453', '2021-06-19 12:51:35.614755', '2021-06-19 12:51:35.614755', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7454', '2021-06-19 12:51:35.615671', '2021-06-19 12:51:35.615671', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7455', '2021-06-19 12:51:36.391706', '2021-06-19 12:51:36.391706', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7456', '2021-06-19 12:51:36.392654', '2021-06-19 12:51:36.392654', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7457', '2021-06-19 12:51:40.256443', '2021-06-19 12:51:40.256443', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7458', '2021-06-19 12:51:40.257309', '2021-06-19 12:51:40.257309', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7459', '2021-06-19 12:51:41.836525', '2021-06-19 12:51:41.836525', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7460', '2021-06-19 12:51:41.837478', '2021-06-19 12:51:41.837478', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7461', '2021-06-19 12:51:42.959396', '2021-06-19 12:51:42.959396', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7462', '2021-06-19 12:51:42.960774', '2021-06-19 12:51:42.960774', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7463', '2021-06-19 12:52:50.029739', '2021-06-19 12:52:50.029739', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7464', '2021-06-19 12:52:50.030683', '2021-06-19 12:52:50.030683', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7465', '2021-06-19 12:53:04.045021', '2021-06-19 12:53:04.045021', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7466', '2021-06-19 12:53:04.045937', '2021-06-19 12:53:04.045937', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7467', '2021-06-19 12:53:08.894871', '2021-06-19 12:53:08.894871', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7468', '2021-06-19 12:53:08.897241', '2021-06-19 12:53:08.897241', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7469', '2021-06-19 12:53:10.251826', '2021-06-19 12:53:10.251826', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7470', '2021-06-19 12:53:10.252669', '2021-06-19 12:53:10.252669', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7471', '2021-06-19 12:53:11.338249', '2021-06-19 12:53:11.338249', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7472', '2021-06-19 12:53:11.339546', '2021-06-19 12:53:11.339546', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7473', '2021-06-19 12:53:34.343070', '2021-06-19 12:53:34.343070', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7474', '2021-06-19 12:53:34.343823', '2021-06-19 12:53:34.343823', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7475', '2021-06-19 12:53:36.271678', '2021-06-19 12:53:36.271678', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7476', '2021-06-19 12:53:36.272532', '2021-06-19 12:53:36.272532', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7477', '2021-06-19 12:53:37.247630', '2021-06-19 12:53:37.247630', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7478', '2021-06-19 12:53:37.248570', '2021-06-19 12:53:37.248570', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7479', '2021-06-19 12:53:41.607689', '2021-06-19 12:53:41.607689', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7480', '2021-06-19 12:53:41.610811', '2021-06-19 12:53:41.610811', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7481', '2021-06-19 12:53:42.958795', '2021-06-19 12:53:42.958795', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7482', '2021-06-19 12:53:42.959651', '2021-06-19 12:53:42.959651', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7483', '2021-06-19 12:53:45.254389', '2021-06-19 12:53:45.254389', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7484', '2021-06-19 12:53:45.255320', '2021-06-19 12:53:45.255320', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7485', '2021-06-19 12:53:48.767359', '2021-06-19 12:53:48.767359', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7486', '2021-06-19 12:53:48.769487', '2021-06-19 12:53:48.769487', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7487', '2021-06-19 12:53:50.206932', '2021-06-19 12:53:50.206932', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7488', '2021-06-19 12:53:50.207799', '2021-06-19 12:53:50.207799', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7489', '2021-06-19 12:54:05.775733', '2021-06-19 12:54:05.775733', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7490', '2021-06-19 12:54:05.777271', '2021-06-19 12:54:05.777271', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7491', '2021-06-19 12:54:40.982808', '2021-06-19 12:54:40.982808', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7492', '2021-06-19 12:54:40.983692', '2021-06-19 12:54:40.983692', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7493', '2021-06-19 12:54:53.174006', '2021-06-19 12:54:53.174006', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7494', '2021-06-19 12:54:53.174860', '2021-06-19 12:54:53.174860', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7495', '2021-06-19 12:54:55.054023', '2021-06-19 12:54:55.054023', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7496', '2021-06-19 12:54:55.055451', '2021-06-19 12:54:55.055451', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7497', '2021-06-19 12:54:58.344331', '2021-06-19 12:54:58.344331', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7498', '2021-06-19 12:54:58.345331', '2021-06-19 12:54:58.345331', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7499', '2021-06-19 12:55:34.682359', '2021-06-19 12:55:34.682359', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7500', '2021-06-19 12:55:34.684599', '2021-06-19 12:55:34.684599', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7501', '2021-06-19 12:57:33.213340', '2021-06-19 12:57:33.213340', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7502', '2021-06-19 12:57:33.214171', '2021-06-19 12:57:33.214171', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7503', '2021-06-19 12:57:36.576539', '2021-06-19 12:57:36.576539', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7504', '2021-06-19 12:57:36.578912', '2021-06-19 12:57:36.578912', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7505', '2021-06-19 12:57:45.596462', '2021-06-19 12:57:45.596462', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7506', '2021-06-19 12:57:45.597249', '2021-06-19 12:57:45.597249', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7507', '2021-06-19 12:58:13.380430', '2021-06-19 12:58:13.380430', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7508', '2021-06-19 12:58:13.381376', '2021-06-19 12:58:13.381376', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7509', '2021-06-19 12:58:37.115490', '2021-06-19 12:58:37.115490', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7510', '2021-06-19 12:58:37.116704', '2021-06-19 12:58:37.116704', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7511', '2021-06-19 12:58:38.431395', '2021-06-19 12:58:38.431395', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7512', '2021-06-19 12:58:38.432855', '2021-06-19 12:58:38.432855', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7513', '2021-06-19 12:58:49.272576', '2021-06-19 12:58:49.272576', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7514', '2021-06-19 12:58:49.273385', '2021-06-19 12:58:49.273385', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7515', '2021-06-19 12:59:15.961621', '2021-06-19 12:59:15.961621', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7516', '2021-06-19 12:59:15.962241', '2021-06-19 12:59:15.962241', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7517', '2021-06-19 13:00:39.112865', '2021-06-19 13:00:39.112865', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7518', '2021-06-19 13:00:39.113758', '2021-06-19 13:00:39.113758', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7519', '2021-06-19 13:00:56.700639', '2021-06-19 13:00:56.700639', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7520', '2021-06-19 13:00:56.701509', '2021-06-19 13:00:56.701509', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7521', '2021-06-19 13:01:12.023000', '2021-06-19 13:01:12.023000', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7522', '2021-06-19 13:01:12.023887', '2021-06-19 13:01:12.023887', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7523', '2021-06-19 13:01:13.987097', '2021-06-19 13:01:13.987097', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7524', '2021-06-19 13:01:13.989262', '2021-06-19 13:01:13.989262', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7525', '2021-06-19 13:01:18.276316', '2021-06-19 13:01:18.276316', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7526', '2021-06-19 13:01:18.279263', '2021-06-19 13:01:18.279263', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7527', '2021-06-19 13:01:37.231556', '2021-06-19 13:01:37.231556', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7528', '2021-06-19 13:01:37.232717', '2021-06-19 13:01:37.232717', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7529', '2021-06-19 13:03:20.444399', '2021-06-19 13:03:20.444399', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7530', '2021-06-19 13:03:20.445280', '2021-06-19 13:03:20.445280', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7531', '2021-06-19 13:03:42.413815', '2021-06-19 13:03:42.413815', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7532', '2021-06-19 13:03:42.415476', '2021-06-19 13:03:42.415476', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7533', '2021-06-19 13:04:25.848024', '2021-06-19 13:04:25.848024', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7534', '2021-06-19 13:04:25.849679', '2021-06-19 13:04:25.849679', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7535', '2021-06-19 13:05:29.778856', '2021-06-19 13:05:29.778856', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7536', '2021-06-19 13:05:29.779690', '2021-06-19 13:05:29.779690', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7537', '2021-06-19 13:05:44.786393', '2021-06-19 13:05:44.786393', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7538', '2021-06-19 13:05:44.787500', '2021-06-19 13:05:44.787500', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7539', '2021-06-19 13:05:53.429490', '2021-06-19 13:05:53.429490', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7540', '2021-06-19 13:05:53.430638', '2021-06-19 13:05:53.430638', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7541', '2021-06-19 13:06:04.298390', '2021-06-19 13:06:04.298390', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7542', '2021-06-19 13:06:04.299604', '2021-06-19 13:06:04.299604', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7543', '2021-06-19 13:06:29.975013', '2021-06-19 13:06:29.975013', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7544', '2021-06-19 13:06:29.976195', '2021-06-19 13:06:29.976195', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7545', '2021-06-19 13:06:30.202445', '2021-06-19 13:06:30.202445', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7546', '2021-06-19 13:06:30.204825', '2021-06-19 13:06:30.204825', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7547', '2021-06-19 13:06:39.575705', '2021-06-19 13:06:39.575705', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7548', '2021-06-19 13:06:39.576474', '2021-06-19 13:06:39.576474', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7549', '2021-06-19 13:06:39.616288', '2021-06-19 13:06:39.616288', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7550', '2021-06-19 13:06:39.618548', '2021-06-19 13:06:39.618548', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7551', '2021-06-19 13:06:56.535447', '2021-06-19 13:06:56.535447', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7552', '2021-06-19 13:06:56.549125', '2021-06-19 13:06:56.549125', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7553', '2021-06-19 13:06:56.583832', '2021-06-19 13:06:56.583832', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7554', '2021-06-19 13:06:56.592963', '2021-06-19 13:06:56.592963', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7555', '2021-06-19 13:08:26.643633', '2021-06-19 13:08:26.643633', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7556', '2021-06-19 13:08:26.645163', '2021-06-19 13:08:26.645163', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7557', '2021-06-19 13:08:26.659263', '2021-06-19 13:08:26.659263', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7558', '2021-06-19 13:08:26.665216', '2021-06-19 13:08:26.665216', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7559', '2021-06-19 13:08:28.443005', '2021-06-19 13:08:28.443005', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7560', '2021-06-19 13:08:28.444059', '2021-06-19 13:08:28.444059', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7561', '2021-06-19 13:08:29.419360', '2021-06-19 13:08:29.419360', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7562', '2021-06-19 13:08:29.420292', '2021-06-19 13:08:29.420292', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7563', '2021-06-19 13:08:29.423445', '2021-06-19 13:08:29.423445', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7564', '2021-06-19 13:08:29.425489', '2021-06-19 13:08:29.425489', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7565', '2021-06-19 13:09:04.637735', '2021-06-19 13:09:04.637735', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7566', '2021-06-19 13:09:04.638818', '2021-06-19 13:09:04.638818', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7567', '2021-06-19 13:09:04.848279', '2021-06-19 13:09:04.848279', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7568', '2021-06-19 13:09:04.849223', '2021-06-19 13:09:04.849223', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7569', '2021-06-19 13:10:02.862803', '2021-06-19 13:10:02.862803', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7570', '2021-06-19 13:10:02.863853', '2021-06-19 13:10:02.863853', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7571', '2021-06-19 13:10:02.875937', '2021-06-19 13:10:02.875937', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7572', '2021-06-19 13:10:02.876723', '2021-06-19 13:10:02.876723', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7573', '2021-06-19 13:11:05.516602', '2021-06-19 13:11:05.516602', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7574', '2021-06-19 13:11:05.518036', '2021-06-19 13:11:05.518036', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7575', '2021-06-19 13:11:05.761447', '2021-06-19 13:11:05.761447', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7576', '2021-06-19 13:11:05.762292', '2021-06-19 13:11:05.762292', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7577', '2021-06-19 13:11:14.742128', '2021-06-19 13:11:14.742128', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7578', '2021-06-19 13:11:14.742725', '2021-06-19 13:11:14.742725', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7579', '2021-06-19 13:11:15.056495', '2021-06-19 13:11:15.056495', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7580', '2021-06-19 13:11:15.058419', '2021-06-19 13:11:15.058419', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7581', '2021-06-19 13:11:18.954558', '2021-06-19 13:11:18.954558', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7582', '2021-06-19 13:11:30.285502', '2021-06-19 13:11:30.285502', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7583', '2021-06-19 13:11:30.287871', '2021-06-19 13:11:30.287871', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7584', '2021-06-19 13:11:30.601974', '2021-06-19 13:11:30.601974', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7585', '2021-06-19 13:11:30.603686', '2021-06-19 13:11:30.603686', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7586', '2021-06-19 13:13:14.597981', '2021-06-19 13:13:14.597981', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7587', '2021-06-19 13:13:14.599365', '2021-06-19 13:13:14.599365', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7588', '2021-06-19 13:13:14.612968', '2021-06-19 13:13:14.612968', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7589', '2021-06-19 13:13:14.621037', '2021-06-19 13:13:14.621037', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7590', '2021-06-19 13:13:45.255226', '2021-06-19 13:13:45.255226', null, '/admin/base/open/refreshToken', '127.0.0.1', '本机地址', '{\"refreshToken\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc1JlZnJlc2giOnRydWUsInJvbGVJZHMiOlsiMSJdLCJ1c2VybmFtZSI6ImFkbWluIiwidXNlcklkIjoxLCJwYXNzd29yZFZlcnNpb24iOjMsImlhdCI6MTYyNDA2NjA3NCwiZXhwIjoxNjI1MzYyMDc0fQ.KWhIzDhEd_asz6d5KOhwT-kUI9pvopMHpBHo7ucj8Fg\"}');
INSERT INTO `base_sys_log` VALUES ('7591', '2021-06-19 13:13:45.537483', '2021-06-19 13:13:45.537483', '1', '/admin/base/comm/permmenu', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7592', '2021-06-19 13:13:45.539244', '2021-06-19 13:13:45.539244', '1', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7593', '2021-06-19 13:14:24.530994', '2021-06-19 13:14:24.530994', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7594', '2021-06-19 13:14:24.532105', '2021-06-19 13:14:24.532105', '1', '/admin/machine/instruct/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7595', '2021-06-19 13:14:24.965177', '2021-06-19 13:14:24.965177', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7596', '2021-06-19 13:14:24.966173', '2021-06-19 13:14:24.966173', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7597', '2021-06-19 13:14:28.943238', '2021-06-19 13:14:28.943238', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7598', '2021-06-19 13:14:28.944186', '2021-06-19 13:14:28.944186', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7599', '2021-06-19 13:14:28.946241', '2021-06-19 13:14:28.946241', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('7600', '2021-06-19 13:14:28.947068', '2021-06-19 13:14:28.947068', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"5\"}');
INSERT INTO `base_sys_log` VALUES ('7601', '2021-06-19 13:14:33.290065', '2021-06-19 13:14:33.290065', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"游泳馆翼闸\",\"channelName\":\"通道B\",\"mac\":\"34:dsa:asd:34\",\"maintainer\":43,\"id\":5,\"createTime\":\"2021-03-26 00:41:09\",\"updateTime\":\"2021-06-16 14:00:32\",\"userId\":1,\"maintainerId\":43,\"params\":null,\"workorder\":0}');
INSERT INTO `base_sys_log` VALUES ('7602', '2021-06-19 13:14:33.291350', '2021-06-19 13:14:33.291350', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"clientid\":\"no002\",\"name\":\"游泳馆翼闸\",\"channelName\":\"通道B\",\"mac\":\"34:dsa:asd:34\",\"maintainer\":43,\"id\":5,\"createTime\":\"2021-03-26 00:41:09\",\"updateTime\":\"2021-06-16 14:00:32\",\"userId\":1,\"maintainerId\":43,\"params\":null,\"workorder\":0}');
INSERT INTO `base_sys_log` VALUES ('7603', '2021-06-19 13:14:33.738329', '2021-06-19 13:14:33.738329', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7604', '2021-06-19 13:14:33.739362', '2021-06-19 13:14:33.739362', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7605', '2021-06-19 13:14:35.160462', '2021-06-19 13:14:35.160462', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7606', '2021-06-19 13:14:35.161804', '2021-06-19 13:14:35.161804', '1', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"4\"}');
INSERT INTO `base_sys_log` VALUES ('7607', '2021-06-19 13:14:35.492970', '2021-06-19 13:14:35.492970', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7608', '2021-06-19 13:14:35.494185', '2021-06-19 13:14:35.494185', '1', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7609', '2021-06-19 13:14:38.257625', '2021-06-19 13:14:38.257625', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"clientid\":\"no001\",\"name\":\"游泳馆翼闸\",\"channelName\":\"通道A\",\"mac\":\"asd:34:dsa:asd:34\",\"maintainer\":35,\"id\":4,\"createTime\":\"2021-03-26 00:40:46\",\"updateTime\":\"2021-06-16 14:00:27\",\"userId\":1,\"maintainerId\":35,\"params\":null,\"workorder\":0}');
INSERT INTO `base_sys_log` VALUES ('7610', '2021-06-19 13:14:38.260033', '2021-06-19 13:14:38.260033', '1', '/admin/machine/device/update', '127.0.0.1', '本机地址', '{\"clientid\":\"no001\",\"name\":\"游泳馆翼闸\",\"channelName\":\"通道A\",\"mac\":\"asd:34:dsa:asd:34\",\"maintainer\":35,\"id\":4,\"createTime\":\"2021-03-26 00:40:46\",\"updateTime\":\"2021-06-16 14:00:27\",\"userId\":1,\"maintainerId\":35,\"params\":null,\"workorder\":0}');
INSERT INTO `base_sys_log` VALUES ('7611', '2021-06-19 13:14:38.526780', '2021-06-19 13:14:38.526780', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7612', '2021-06-19 13:14:38.527665', '2021-06-19 13:14:38.527665', '1', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7613', '2021-06-19 13:14:40.104715', '2021-06-19 13:14:40.104715', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7614', '2021-06-19 13:14:40.105246', '2021-06-19 13:14:40.105246', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7615', '2021-06-19 13:14:40.121887', '2021-06-19 13:14:40.121887', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7616', '2021-06-19 13:14:40.122806', '2021-06-19 13:14:40.122806', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7617', '2021-06-19 13:15:04.260037', '2021-06-19 13:15:04.260037', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7618', '2021-06-19 13:15:04.260922', '2021-06-19 13:15:04.260922', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7619', '2021-06-19 13:15:04.276174', '2021-06-19 13:15:04.276174', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7620', '2021-06-19 13:15:04.277251', '2021-06-19 13:15:04.277251', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7621', '2021-06-19 13:15:08.641282', '2021-06-19 13:15:08.641282', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7622', '2021-06-19 13:15:08.642059', '2021-06-19 13:15:08.642059', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7623', '2021-06-19 13:15:10.572611', '2021-06-19 13:15:10.572611', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7624', '2021-06-19 13:15:10.573671', '2021-06-19 13:15:10.573671', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7625', '2021-06-19 13:15:10.575260', '2021-06-19 13:15:10.575260', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7626', '2021-06-19 13:15:10.576065', '2021-06-19 13:15:10.576065', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7627', '2021-06-19 13:15:12.871781', '2021-06-19 13:15:12.871781', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7628', '2021-06-19 13:15:12.872563', '2021-06-19 13:15:12.872563', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7629', '2021-06-19 13:15:13.722806', '2021-06-19 13:15:13.722806', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7630', '2021-06-19 13:15:13.723710', '2021-06-19 13:15:13.723710', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7631', '2021-06-19 13:15:14.034383', '2021-06-19 13:15:14.034383', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7632', '2021-06-19 13:15:14.035308', '2021-06-19 13:15:14.035308', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7633', '2021-06-19 13:15:18.663183', '2021-06-19 13:15:18.663183', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"code\":\"0xa2\",\"topic\":\"no003\"}');
INSERT INTO `base_sys_log` VALUES ('7634', '2021-06-19 13:15:49.010341', '2021-06-19 13:15:49.010341', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"code\":\"0xab\",\"topic\":\"no003\"}');
INSERT INTO `base_sys_log` VALUES ('7635', '2021-06-19 13:15:56.546391', '2021-06-19 13:15:56.546391', '35', '/admin/machine/mqtt/sendmsg', '127.0.0.1', '本机地址', '{\"code\":\"0xab\",\"topic\":\"no003\"}');
INSERT INTO `base_sys_log` VALUES ('7636', '2021-06-19 13:16:01.375541', '2021-06-19 13:16:01.375541', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7637', '2021-06-19 13:16:01.376421', '2021-06-19 13:16:01.376421', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7638', '2021-06-19 13:16:28.743430', '2021-06-19 13:16:28.743430', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7639', '2021-06-19 13:16:28.744292', '2021-06-19 13:16:28.744292', '1', '/admin/base/sys/role/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7640', '2021-06-19 13:16:37.265630', '2021-06-19 13:16:37.265630', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('7641', '2021-06-19 13:16:37.269198', '2021-06-19 13:16:37.269198', '1', '/admin/base/sys/role/info', '127.0.0.1', '本机地址', '{\"id\":\"12\"}');
INSERT INTO `base_sys_log` VALUES ('7642', '2021-06-19 13:16:37.612151', '2021-06-19 13:16:37.612151', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7643', '2021-06-19 13:16:37.615106', '2021-06-19 13:16:37.615106', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7644', '2021-06-19 13:16:37.621232', '2021-06-19 13:16:37.621232', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7645', '2021-06-19 13:16:37.622260', '2021-06-19 13:16:37.622260', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7646', '2021-06-19 13:16:50.026034', '2021-06-19 13:16:50.026034', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7647', '2021-06-19 13:16:50.027543', '2021-06-19 13:16:50.027543', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7648', '2021-06-19 13:16:59.973624', '2021-06-19 13:16:59.973624', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7649', '2021-06-19 13:16:59.974572', '2021-06-19 13:16:59.974572', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7650', '2021-06-19 13:17:00.292488', '2021-06-19 13:17:00.292488', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('7651', '2021-06-19 13:17:00.293477', '2021-06-19 13:17:00.293477', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('7652', '2021-06-19 13:17:07.839866', '2021-06-19 13:17:07.839866', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户管理\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-30 16:50:27\"}');
INSERT INTO `base_sys_log` VALUES ('7653', '2021-06-19 13:17:07.842382', '2021-06-19 13:17:07.842382', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户管理\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:user:move,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-30 16:50:27\"}');
INSERT INTO `base_sys_log` VALUES ('7654', '2021-06-19 13:17:53.071967', '2021-06-19 13:17:53.071967', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户管理\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-30 16:50:27\"}');
INSERT INTO `base_sys_log` VALUES ('7655', '2021-06-19 13:17:53.074126', '2021-06-19 13:17:53.074126', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":2,\"name\":\"客户管理\",\"parentId\":null,\"orderNum\":0,\"perms\":\"base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update\",\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-03-30 16:50:27\"}');
INSERT INTO `base_sys_log` VALUES ('7656', '2021-06-19 13:17:53.659872', '2021-06-19 13:17:53.659872', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7657', '2021-06-19 13:17:53.660589', '2021-06-19 13:17:53.660589', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7658', '2021-06-19 13:17:55.135822', '2021-06-19 13:17:55.135822', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('7659', '2021-06-19 13:17:55.136657', '2021-06-19 13:17:55.136657', '1', '/admin/base/sys/menu/info', '127.0.0.1', '本机地址', '{\"id\":\"121\"}');
INSERT INTO `base_sys_log` VALUES ('7660', '2021-06-19 13:17:55.460231', '2021-06-19 13:17:55.460231', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7661', '2021-06-19 13:17:55.461268', '2021-06-19 13:17:55.461268', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7662', '2021-06-19 13:17:57.283691', '2021-06-19 13:17:57.283691', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户管理\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-06-19 13:17:53\"}');
INSERT INTO `base_sys_log` VALUES ('7663', '2021-06-19 13:17:57.284614', '2021-06-19 13:17:57.284614', '1', '/admin/base/sys/menu/update', '127.0.0.1', '本机地址', '{\"type\":1,\"name\":\"客户管理\",\"parentId\":null,\"router\":\"/user\",\"keepAlive\":true,\"isShow\":true,\"viewPath\":\"cool/modules/base/views/user.vue\",\"icon\":\"icon-user\",\"orderNum\":0,\"id\":121,\"createTime\":\"2021-03-24 17:26:18\",\"updateTime\":\"2021-06-19 13:17:53\"}');
INSERT INTO `base_sys_log` VALUES ('7664', '2021-06-19 13:17:57.565255', '2021-06-19 13:17:57.565255', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7665', '2021-06-19 13:17:57.566191', '2021-06-19 13:17:57.566191', '1', '/admin/base/sys/menu/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7666', '2021-06-19 13:17:59.635690', '2021-06-19 13:17:59.635690', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7667', '2021-06-19 13:17:59.636572', '2021-06-19 13:17:59.636572', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7668', '2021-06-19 13:17:59.638487', '2021-06-19 13:17:59.638487', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7669', '2021-06-19 13:17:59.639343', '2021-06-19 13:17:59.639343', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7670', '2021-06-19 13:18:09.680392', '2021-06-19 13:18:09.680392', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7671', '2021-06-19 13:18:09.681546', '2021-06-19 13:18:09.681546', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7672', '2021-06-19 13:18:09.697576', '2021-06-19 13:18:09.697576', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7673', '2021-06-19 13:18:09.709714', '2021-06-19 13:18:09.709714', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7674', '2021-06-19 13:18:10.847676', '2021-06-19 13:18:10.847676', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7675', '2021-06-19 13:18:10.849856', '2021-06-19 13:18:10.849856', '35', '/admin/base/sys/user/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7676', '2021-06-19 13:18:10.877176', '2021-06-19 13:18:10.877176', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7677', '2021-06-19 13:18:10.878423', '2021-06-19 13:18:10.878423', '35', '/admin/machine/device/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7678', '2021-06-19 13:19:53.285255', '2021-06-19 13:19:53.285255', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7679', '2021-06-19 13:19:53.288983', '2021-06-19 13:19:53.288983', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7680', '2021-06-19 13:19:53.293315', '2021-06-19 13:19:53.293315', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7681', '2021-06-19 13:19:53.295464', '2021-06-19 13:19:53.295464', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7682', '2021-06-19 13:21:02.376291', '2021-06-19 13:21:02.376291', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7683', '2021-06-19 13:21:04.924697', '2021-06-19 13:21:04.924697', '35', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7684', '2021-06-19 13:21:04.925793', '2021-06-19 13:21:04.925793', '35', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7685', '2021-06-19 13:21:09.470733', '2021-06-19 13:21:09.470733', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7686', '2021-06-19 13:21:09.472366', '2021-06-19 13:21:09.472366', '1', '/admin/base/sys/department/list', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7687', '2021-06-19 13:21:09.477780', '2021-06-19 13:21:09.477780', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7688', '2021-06-19 13:21:09.479975', '2021-06-19 13:21:09.479975', '1', '/admin/base/sys/user/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20,\"sort\":\"desc\",\"order\":\"createTime\"}');
INSERT INTO `base_sys_log` VALUES ('7689', '2021-06-19 13:21:20.054480', '2021-06-19 13:21:20.054480', '35', '/admin/base/comm/person', '127.0.0.1', '本机地址', null);
INSERT INTO `base_sys_log` VALUES ('7690', '2021-06-19 13:21:20.953395', '2021-06-19 13:21:20.953395', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7691', '2021-06-19 13:21:20.954717', '2021-06-19 13:21:20.954717', '35', '/admin/machine/instruct/list', '127.0.0.1', '本机地址', '{\"type\":1}');
INSERT INTO `base_sys_log` VALUES ('7692', '2021-06-19 13:21:21.263891', '2021-06-19 13:21:21.263891', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7693', '2021-06-19 13:21:21.265390', '2021-06-19 13:21:21.265390', '35', '/admin/machine/device/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10}');
INSERT INTO `base_sys_log` VALUES ('7694', '2021-06-19 13:21:23.164013', '2021-06-19 13:21:23.164013', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7695', '2021-06-19 13:21:23.165357', '2021-06-19 13:21:23.165357', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7696', '2021-06-19 13:21:24.308809', '2021-06-19 13:21:24.308809', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7697', '2021-06-19 13:21:24.310004', '2021-06-19 13:21:24.310004', '35', '/admin/machine/workorder/info', '127.0.0.1', '本机地址', '{\"id\":\"7\"}');
INSERT INTO `base_sys_log` VALUES ('7698', '2021-06-19 13:21:27.532765', '2021-06-19 13:21:27.532765', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7699', '2021-06-19 13:21:27.533955', '2021-06-19 13:21:27.533955', '35', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":10,\"status\":1}');
INSERT INTO `base_sys_log` VALUES ('7700', '2021-06-19 13:21:32.097683', '2021-06-19 13:21:32.097683', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');
INSERT INTO `base_sys_log` VALUES ('7701', '2021-06-19 13:21:32.099094', '2021-06-19 13:21:32.099094', '1', '/admin/machine/workorder/page', '127.0.0.1', '本机地址', '{\"page\":1,\"size\":20}');

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_menu
-- ----------------------------
INSERT INTO `base_sys_menu` VALUES ('1', '2019-09-11 11:14:44.000000', '2021-03-25 12:20:19.000000', null, '工作台', '/', null, '0', 'icon-workbench', '2', null, '1', '0');
INSERT INTO `base_sys_menu` VALUES ('2', '2019-09-11 11:14:47.000000', '2021-03-30 16:50:07.000000', null, '系统管理', '/sys', null, '0', 'icon-system', '3', null, '1', '1');
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
INSERT INTO `base_sys_menu` VALUES ('109', '2021-02-27 14:13:56.000000', '2021-03-30 16:50:17.000000', null, '插件管理', null, null, '0', 'icon-menu', '4', null, '1', '1');
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
INSERT INTO `base_sys_menu` VALUES ('120', '2021-03-24 10:11:31.000000', '2021-06-17 14:26:59.000000', '122', '设备列表', '', 'machine:device:page,machine:device:list,machine:device:info,machine:device:add,machine:device:delete,machine:device:update,machine:instruct:list,machine:mqtt:sendmsg', '1', 'icon-rank', '1', 'cool/modules/machine/views/device.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('121', '2021-03-24 17:26:18.000000', '2021-06-19 13:17:57.000000', null, '客户管理', '/user', 'base:sys:user:page,base:sys:user:list,base:sys:user:info,base:sys:user:add,base:sys:user:delete,base:sys:user:update,base:sys:role:list,base:sys:department:list,base:sys:department:add,base:sys:department:delete,base:sys:department:update', '1', 'icon-user', '0', 'cool/modules/base/views/user.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('122', '2021-03-30 16:25:38.000000', '2021-03-30 16:50:01.000000', null, '设备管理', null, null, '0', 'icon-dept', '2', null, '1', '1');
INSERT INTO `base_sys_menu` VALUES ('123', '2021-03-30 16:28:30.000000', '2021-06-19 09:53:05.000000', '122', '设备错误码', null, null, '1', 'icon-command', '0', 'cool/modules/machine/views/deviceErrorCode.vue', '1', '0');
INSERT INTO `base_sys_menu` VALUES ('124', '2021-03-30 16:49:42.000000', '2021-04-01 09:11:47.000000', null, '工单列表', null, 'machine:workorder:page,machine:workorder:list,machine:workorder:info,machine:workorder:add,machine:workorder:delete,machine:workorder:update', '1', 'icon-log', '1', 'cool/modules/machine/views/workorder.vue', '1', '1');
INSERT INTO `base_sys_menu` VALUES ('125', '2021-06-17 13:00:19.929390', '2021-06-17 13:00:19.929390', '122', '设备指令码', null, null, '1', 'icon-auth', '0', 'cool/modules/machine/views/Instruct.vue', '1', '1');

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
INSERT INTO `base_sys_role` VALUES ('10', '2021-02-26 14:15:38.000000', '2021-06-19 09:52:32.000000', '1', '总公司', 'admin-sys', '', '1');
INSERT INTO `base_sys_role` VALUES ('11', '2021-02-26 14:16:49.000000', '2021-04-01 09:11:33.000000', '1', '客户', 'client', null, '0');
INSERT INTO `base_sys_role` VALUES ('12', '2021-02-26 14:26:51.000000', '2021-04-01 09:11:27.000000', '1', '工程商', 'project', null, '0');
INSERT INTO `base_sys_role` VALUES ('13', '2021-02-26 14:27:58.000000', '2021-04-01 09:11:22.000000', '1', '经销商', 'dealer', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_role_department
-- ----------------------------
INSERT INTO `base_sys_role_department` VALUES ('124', '2021-04-01 09:11:22.277001', '2021-04-01 09:11:22.277001', '13', '11');
INSERT INTO `base_sys_role_department` VALUES ('125', '2021-04-01 09:11:22.310029', '2021-04-01 09:11:22.310029', '13', '14');
INSERT INTO `base_sys_role_department` VALUES ('126', '2021-04-01 09:11:22.366641', '2021-04-01 09:11:22.366641', '13', '15');
INSERT INTO `base_sys_role_department` VALUES ('127', '2021-04-01 09:11:27.861757', '2021-04-01 09:11:27.861757', '12', '14');
INSERT INTO `base_sys_role_department` VALUES ('128', '2021-04-01 09:11:27.919928', '2021-04-01 09:11:27.919928', '12', '15');
INSERT INTO `base_sys_role_department` VALUES ('129', '2021-04-01 09:11:33.852690', '2021-04-01 09:11:33.852690', '11', '15');
INSERT INTO `base_sys_role_department` VALUES ('130', '2021-06-19 09:52:35.240270', '2021-06-19 09:52:35.240270', '10', '1');
INSERT INTO `base_sys_role_department` VALUES ('131', '2021-06-19 09:52:35.279001', '2021-06-19 09:52:35.279001', '10', '11');
INSERT INTO `base_sys_role_department` VALUES ('132', '2021-06-19 09:52:35.330550', '2021-06-19 09:52:35.330550', '10', '14');
INSERT INTO `base_sys_role_department` VALUES ('133', '2021-06-19 09:52:35.371231', '2021-06-19 09:52:35.371231', '10', '15');

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
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `base_sys_role_menu` VALUES ('1254', '2021-04-01 09:11:22.132738', '2021-04-01 09:11:22.132738', '13', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1255', '2021-04-01 09:11:22.161104', '2021-04-01 09:11:22.161104', '13', '124');
INSERT INTO `base_sys_role_menu` VALUES ('1256', '2021-04-01 09:11:22.190221', '2021-04-01 09:11:22.190221', '13', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1257', '2021-04-01 09:11:22.219137', '2021-04-01 09:11:22.219137', '13', '122');
INSERT INTO `base_sys_role_menu` VALUES ('1258', '2021-04-01 09:11:27.698906', '2021-04-01 09:11:27.698906', '12', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1259', '2021-04-01 09:11:27.726997', '2021-04-01 09:11:27.726997', '12', '124');
INSERT INTO `base_sys_role_menu` VALUES ('1260', '2021-04-01 09:11:27.764875', '2021-04-01 09:11:27.764875', '12', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1261', '2021-04-01 09:11:27.793436', '2021-04-01 09:11:27.793436', '12', '122');
INSERT INTO `base_sys_role_menu` VALUES ('1262', '2021-04-01 09:11:33.719338', '2021-04-01 09:11:33.719338', '11', '124');
INSERT INTO `base_sys_role_menu` VALUES ('1263', '2021-04-01 09:11:33.748489', '2021-04-01 09:11:33.748489', '11', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1264', '2021-04-01 09:11:33.779157', '2021-04-01 09:11:33.779157', '11', '122');
INSERT INTO `base_sys_role_menu` VALUES ('1265', '2021-06-19 09:52:33.151018', '2021-06-19 09:52:33.151018', '10', '121');
INSERT INTO `base_sys_role_menu` VALUES ('1266', '2021-06-19 09:52:33.215036', '2021-06-19 09:52:33.215036', '10', '124');
INSERT INTO `base_sys_role_menu` VALUES ('1267', '2021-06-19 09:52:33.289862', '2021-06-19 09:52:33.289862', '10', '125');
INSERT INTO `base_sys_role_menu` VALUES ('1268', '2021-06-19 09:52:33.365255', '2021-06-19 09:52:33.365255', '10', '120');
INSERT INTO `base_sys_role_menu` VALUES ('1269', '2021-06-19 09:52:33.415050', '2021-06-19 09:52:33.415050', '10', '2');
INSERT INTO `base_sys_role_menu` VALUES ('1270', '2021-06-19 09:52:33.453578', '2021-06-19 09:52:33.453578', '10', '27');
INSERT INTO `base_sys_role_menu` VALUES ('1271', '2021-06-19 09:52:33.517578', '2021-06-19 09:52:33.517578', '10', '97');
INSERT INTO `base_sys_role_menu` VALUES ('1272', '2021-06-19 09:52:33.585492', '2021-06-19 09:52:33.585492', '10', '59');
INSERT INTO `base_sys_role_menu` VALUES ('1273', '2021-06-19 09:52:33.641334', '2021-06-19 09:52:33.641334', '10', '60');
INSERT INTO `base_sys_role_menu` VALUES ('1274', '2021-06-19 09:52:33.689803', '2021-06-19 09:52:33.689803', '10', '61');
INSERT INTO `base_sys_role_menu` VALUES ('1275', '2021-06-19 09:52:33.746617', '2021-06-19 09:52:33.746617', '10', '62');
INSERT INTO `base_sys_role_menu` VALUES ('1276', '2021-06-19 09:52:33.797131', '2021-06-19 09:52:33.797131', '10', '63');
INSERT INTO `base_sys_role_menu` VALUES ('1277', '2021-06-19 09:52:33.833724', '2021-06-19 09:52:33.833724', '10', '65');
INSERT INTO `base_sys_role_menu` VALUES ('1278', '2021-06-19 09:52:33.882668', '2021-06-19 09:52:33.882668', '10', '98');
INSERT INTO `base_sys_role_menu` VALUES ('1279', '2021-06-19 09:52:33.919941', '2021-06-19 09:52:33.919941', '10', '99');
INSERT INTO `base_sys_role_menu` VALUES ('1280', '2021-06-19 09:52:33.957590', '2021-06-19 09:52:33.957590', '10', '100');
INSERT INTO `base_sys_role_menu` VALUES ('1281', '2021-06-19 09:52:34.018715', '2021-06-19 09:52:34.018715', '10', '101');
INSERT INTO `base_sys_role_menu` VALUES ('1282', '2021-06-19 09:52:34.137326', '2021-06-19 09:52:34.137326', '10', '8');
INSERT INTO `base_sys_role_menu` VALUES ('1283', '2021-06-19 09:52:34.195906', '2021-06-19 09:52:34.195906', '10', '10');
INSERT INTO `base_sys_role_menu` VALUES ('1284', '2021-06-19 09:52:34.243807', '2021-06-19 09:52:34.243807', '10', '11');
INSERT INTO `base_sys_role_menu` VALUES ('1285', '2021-06-19 09:52:34.301858', '2021-06-19 09:52:34.301858', '10', '12');
INSERT INTO `base_sys_role_menu` VALUES ('1286', '2021-06-19 09:52:34.349631', '2021-06-19 09:52:34.349631', '10', '13');
INSERT INTO `base_sys_role_menu` VALUES ('1287', '2021-06-19 09:52:34.388554', '2021-06-19 09:52:34.388554', '10', '22');
INSERT INTO `base_sys_role_menu` VALUES ('1288', '2021-06-19 09:52:34.424461', '2021-06-19 09:52:34.424461', '10', '23');
INSERT INTO `base_sys_role_menu` VALUES ('1289', '2021-06-19 09:52:34.466807', '2021-06-19 09:52:34.466807', '10', '24');
INSERT INTO `base_sys_role_menu` VALUES ('1290', '2021-06-19 09:52:34.523254', '2021-06-19 09:52:34.523254', '10', '25');
INSERT INTO `base_sys_role_menu` VALUES ('1291', '2021-06-19 09:52:34.576060', '2021-06-19 09:52:34.576060', '10', '26');
INSERT INTO `base_sys_role_menu` VALUES ('1292', '2021-06-19 09:52:34.617062', '2021-06-19 09:52:34.617062', '10', '78');
INSERT INTO `base_sys_role_menu` VALUES ('1293', '2021-06-19 09:52:34.683081', '2021-06-19 09:52:34.683081', '10', '79');
INSERT INTO `base_sys_role_menu` VALUES ('1294', '2021-06-19 09:52:34.720001', '2021-06-19 09:52:34.720001', '10', '80');
INSERT INTO `base_sys_role_menu` VALUES ('1295', '2021-06-19 09:52:34.773574', '2021-06-19 09:52:34.773574', '10', '81');
INSERT INTO `base_sys_role_menu` VALUES ('1296', '2021-06-19 09:52:34.849503', '2021-06-19 09:52:34.849503', '10', '82');
INSERT INTO `base_sys_role_menu` VALUES ('1297', '2021-06-19 09:52:34.898580', '2021-06-19 09:52:34.898580', '10', '83');
INSERT INTO `base_sys_role_menu` VALUES ('1298', '2021-06-19 09:52:34.948404', '2021-06-19 09:52:34.948404', '10', '105');
INSERT INTO `base_sys_role_menu` VALUES ('1299', '2021-06-19 09:52:34.987358', '2021-06-19 09:52:34.987358', '10', '29');
INSERT INTO `base_sys_role_menu` VALUES ('1300', '2021-06-19 09:52:35.023583', '2021-06-19 09:52:35.023583', '10', '30');
INSERT INTO `base_sys_role_menu` VALUES ('1301', '2021-06-19 09:52:35.062365', '2021-06-19 09:52:35.062365', '10', '117');
INSERT INTO `base_sys_role_menu` VALUES ('1302', '2021-06-19 09:52:35.098302', '2021-06-19 09:52:35.098302', '10', '118');
INSERT INTO `base_sys_role_menu` VALUES ('1303', '2021-06-19 09:52:35.136449', '2021-06-19 09:52:35.136449', '10', '119');
INSERT INTO `base_sys_role_menu` VALUES ('1304', '2021-06-19 09:52:35.173737', '2021-06-19 09:52:35.173737', '10', '122');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of base_sys_user
-- ----------------------------
INSERT INTO `base_sys_user` VALUES ('1', '2021-02-24 21:16:41.525157', '2021-02-27 18:21:16.000000', '1', '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '3', '管理员', 'https://cool-admin-pro.oss-cn-shanghai.aliyuncs.com/app/c8128c24-d0e9-4e07-9c0d-6f65446e105b.png', '18000000000', 'team@cool-js.com', '1', '拥有最高权限的用户', null);
INSERT INTO `base_sys_user` VALUES ('31', '2021-03-25 12:23:12.000000', '2021-03-25 12:23:12.000000', '1', '云闸机管理员', 'cloudadmin', 'e10adc3949ba59abbe56e057f20f883e', '1', '云闸机管理员', '', null, null, '1', null, '1');
INSERT INTO `base_sys_user` VALUES ('35', '2021-03-26 16:27:11.899317', '2021-03-26 16:27:11.899317', '14', '工程商小A', 'gcsa', 'e10adc3949ba59abbe56e057f20f883e', '1', '工程商小A', null, null, null, '1', null, '1');
INSERT INTO `base_sys_user` VALUES ('36', '2021-03-26 16:28:09.000000', '2021-03-30 14:36:51.000000', '15', '客户小A-工程商小A', 'khagcsa', 'e10adc3949ba59abbe56e057f20f883e', '1', '客户小A-工程商小A', null, '15288889999', '123@admin.com', '1', 'nihaio ', '35');
INSERT INTO `base_sys_user` VALUES ('43', '2021-03-30 14:26:22.774932', '2021-03-30 14:26:22.000000', '15', '客户2', 'kehu2', 'e10adc3949ba59abbe56e057f20f883e', '1', '客户2', null, null, null, '1', null, '35');
INSERT INTO `base_sys_user` VALUES ('44', '2021-04-02 15:53:49.000000', '2021-04-06 15:25:35.000000', '15', '经销商A', 'jxsa', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, '13333333333', '555@556.com', '1', '小伙子帅', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `base_sys_user_role` VALUES ('53', '2021-03-26 16:27:11.977439', '2021-03-26 16:27:11.977439', '35', '12');
INSERT INTO `base_sys_user_role` VALUES ('55', '2021-03-30 09:22:28.270152', '2021-03-30 09:22:28.270152', '37', '11');
INSERT INTO `base_sys_user_role` VALUES ('56', '2021-03-30 09:23:22.987863', '2021-03-30 09:23:22.987863', '38', '11');
INSERT INTO `base_sys_user_role` VALUES ('57', '2021-03-30 09:25:32.589444', '2021-03-30 09:25:32.589444', '39', '12');
INSERT INTO `base_sys_user_role` VALUES ('58', '2021-03-30 09:27:49.933471', '2021-03-30 09:27:49.933471', '40', '12');
INSERT INTO `base_sys_user_role` VALUES ('59', '2021-03-30 09:35:17.478461', '2021-03-30 09:35:17.478461', '41', '12');
INSERT INTO `base_sys_user_role` VALUES ('60', '2021-03-30 09:36:21.774864', '2021-03-30 09:36:21.774864', '42', '10');
INSERT INTO `base_sys_user_role` VALUES ('61', '2021-03-30 14:26:22.847745', '2021-03-30 14:26:22.847745', '43', '11');
INSERT INTO `base_sys_user_role` VALUES ('62', '2021-03-30 14:36:51.697914', '2021-03-30 14:36:51.697914', '36', '11');
INSERT INTO `base_sys_user_role` VALUES ('64', '2021-04-02 10:08:10.661752', '2021-04-02 10:08:10.661752', '45', '11');
INSERT INTO `base_sys_user_role` VALUES ('68', '2021-04-06 15:25:35.986600', '2021-04-06 15:25:35.986600', '44', '13');

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
INSERT INTO `core_plugin` VALUES ('2', '2021-03-23 11:07:22.795035', '2021-06-19 12:45:55.000000', '任务与队列', 'cool官方', '邮箱：team@cool-js.com', '基于redis的任务与队列，支持分布式任务(注: 配置完redis需要重启生效)', '1.0.6', '1', '3', 'queue', null, 'queue:coolQueue', null);
INSERT INTO `core_plugin` VALUES ('3', '2021-03-23 11:07:22.799042', '2021-06-19 12:45:55.000000', 'Redis缓存', 'cool官方', '邮箱：team@cool-js.com', '替换系统的默认缓存为redis', '1.0.9', '1', '3', 'redis', '[{\n    \"label\": \"配置\",\n    \"prop\": \"redis\",\n    \"component\": {\n        \"name\": \"cl-codemirror\",\n        \"attrs\": {\n            \"placeholder\": \"{\\\"host\\\":\\\"127.0.0.1\\\",\\\"password\\\":\\\"\\\",\\\"port\\\":6379,\\\"db\\\":2}\"\n        },\n        \"props\":{\n            \"height\": \"200px\"\n        }\n    },\n    \"value\": \"{\\\"host\\\":\\\"127.0.0.1\\\",\\\"password\\\":\\\"\\\",\\\"port\\\":6379,\\\"db\\\":2}\",\n    \"props\": {\n        \"label-width\": \"80px\"\n    },\n    \"rules\": {\n        \"required\": true,\n        \"message\": \"值不能为空\"\n    }\n}]', 'redis:redisCacheHandler', 'coolCache');
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
  `userId` int(11) DEFAULT NULL COMMENT 'ID',
  `maintainerId` int(11) DEFAULT NULL COMMENT 'ID',
  `params` longtext COLLATE utf8_unicode_ci COMMENT '设备参数',
  `clientid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '设备标识',
  `workorder` int(11) NOT NULL COMMENT '对应工单 id ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_50bf8f78872cd4361024685c98` (`clientid`),
  KEY `IDX_9f0c9e0e35531a5befca29b925` (`createTime`),
  KEY `IDX_0ee311787989e037e971497b7c` (`updateTime`),
  KEY `FK_9eb58b0b777dbc2864820228ebc` (`userId`),
  KEY `FK_a6f181651d88e67e77e48b05e38` (`maintainerId`),
  CONSTRAINT `FK_9eb58b0b777dbc2864820228ebc` FOREIGN KEY (`userId`) REFERENCES `base_sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a6f181651d88e67e77e48b05e38` FOREIGN KEY (`maintainerId`) REFERENCES `base_sys_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('4', '2021-03-26 00:40:46.000000', '2021-06-19 13:14:38.000000', '游泳馆翼闸', '通道A', 'asd:34:dsa:asd:34', '1', '35', null, 'no001', '0');
INSERT INTO `device` VALUES ('5', '2021-03-26 00:41:09.000000', '2021-06-16 14:00:32.000000', '游泳馆翼闸', '通道B', '34:dsa:asd:34', '1', '43', null, 'no002', '0');
INSERT INTO `device` VALUES ('7', '2021-06-17 14:19:14.402439', '2021-06-18 16:25:26.547863', '测试设备', '通道1', 'mac001', '35', '43', null, 'no003', '0');

-- ----------------------------
-- Table structure for `device_workorder`
-- ----------------------------
DROP TABLE IF EXISTS `device_workorder`;
CREATE TABLE `device_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `deviceId` bigint(20) NOT NULL COMMENT '角色ID',
  `workorderId` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `IDX_2aa3d4574f1720ec83529873c6` (`createTime`),
  KEY `IDX_f75a731fe27bc5c0efe095eb96` (`updateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of device_workorder
-- ----------------------------

-- ----------------------------
-- Table structure for `instruct`
-- ----------------------------
DROP TABLE IF EXISTS `instruct`;
CREATE TABLE `instruct` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '指令',
  `codeString` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '指令说明',
  `type` int(11) NOT NULL COMMENT '类型 1:指令 2:上报',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_4fe1e1cc854f49a7a6d0aaac84` (`code`),
  KEY `IDX_57201d8fe40e152d53b08b2d2e` (`createTime`),
  KEY `IDX_22cfdec8b188f44f1730ff64d8` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of instruct
-- ----------------------------
INSERT INTO `instruct` VALUES ('1', '2021-06-17 13:01:59.992140', '2021-06-17 13:13:06.589123', '0xa0', '左开', '1');
INSERT INTO `instruct` VALUES ('2', '2021-06-17 13:02:18.891493', '2021-06-17 13:13:07.091330', '0xa1', '右开', '1');
INSERT INTO `instruct` VALUES ('3', '2021-06-17 13:02:34.001763', '2021-06-17 13:13:07.546449', '0xa2', '关门', '1');
INSERT INTO `instruct` VALUES ('4', '2021-06-17 13:02:50.374221', '2021-06-17 13:13:08.129988', '0xa9', '取消“消防状态”，系统一切正常，然后系统自动关门。', '1');
INSERT INTO `instruct` VALUES ('5', '2021-06-17 13:03:02.710195', '2021-06-17 13:13:08.652148', '0xaa', '备用', '1');
INSERT INTO `instruct` VALUES ('6', '2021-06-17 13:03:18.513010', '2021-06-17 13:13:09.212806', '0xab', '常开门状态的 关门', '1');
INSERT INTO `instruct` VALUES ('7', '2021-06-17 13:03:40.000000', '2021-06-17 13:03:40.000000', '0x9a', '发送 查询版本号命令', '1');
INSERT INTO `instruct` VALUES ('8', '2021-06-17 13:03:51.000000', '2021-06-17 13:03:51.000000', '0x8a', '返回版本号命令：十六进制 A1,表示版本1，A2表示版本2。并且只以A开头当作校验', '1');
INSERT INTO `instruct` VALUES ('9', '2021-06-17 13:05:21.557275', '2021-06-17 13:13:13.097001', '0xb6', '关门再开门命令0xa6的应答命令', '1');
INSERT INTO `instruct` VALUES ('10', '2021-06-17 13:05:25.681881', '2021-06-17 13:13:10.891965', '0xb7', '开机瞬间测试通行命令0xa7的应答命令', '1');
INSERT INTO `instruct` VALUES ('11', '2021-06-17 13:13:41.083065', '2021-06-17 13:13:41.083065', '0xd0', '报告红外状态改变:', '2');
INSERT INTO `instruct` VALUES ('12', '2021-06-17 13:13:52.914423', '2021-06-17 13:13:52.914423', '0xd1', '报告电机故障', '2');
INSERT INTO `instruct` VALUES ('13', '2021-06-17 13:14:10.454812', '2021-06-17 13:14:10.454812', '0xd2', '报告传感器故障', '2');
INSERT INTO `instruct` VALUES ('14', '2021-06-17 13:14:21.215343', '2021-06-17 13:14:21.215343', '0xd3', '报告温度', '2');
INSERT INTO `instruct` VALUES ('15', '2021-06-17 13:14:28.766895', '2021-06-17 13:14:28.766895', '0xd5', '上报电机开门或者关门收到阻碍', '2');
INSERT INTO `instruct` VALUES ('16', '2021-06-17 13:14:43.346601', '2021-06-17 13:14:43.346601', '0xa7', '系统因电源断开而产生的 断电开门', '2');
INSERT INTO `instruct` VALUES ('17', '2021-06-17 13:14:52.037923', '2021-06-17 13:14:52.037923', '0xa8', '系统因接收 消防信号产生的 消防开门', '2');

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

-- ----------------------------
-- Table structure for `workorder`
-- ----------------------------
DROP TABLE IF EXISTS `workorder`;
CREATE TABLE `workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '错误码',
  `status` int(11) NOT NULL COMMENT '工单状态(1.待处理 2.正在处理 3.待审核 4.处理完成 5.失效)',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `orderNum` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '工单号',
  `deviceId` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '对应设备 clientid',
  PRIMARY KEY (`id`),
  KEY `IDX_c49cf1ebe773e187a5c95a04ae` (`createTime`),
  KEY `IDX_83a4c5cfd835b378aefe58bbd2` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of workorder
-- ----------------------------
INSERT INTO `workorder` VALUES ('7', '2021-06-19 09:49:31.562717', '2021-06-19 09:49:31.562717', '0xd0', '1', null, '973882E0-D0A0-11EB-8219-CF84F7FC2289', 'no003');

-- ----------------------------
-- Table structure for `workorder_code`
-- ----------------------------
DROP TABLE IF EXISTS `workorder_code`;
CREATE TABLE `workorder_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `codeString` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '错误信息',
  `code` int(11) NOT NULL COMMENT '错误码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_f0ca84189347ba1976afca1e9b` (`code`),
  KEY `IDX_373a213ad238f8906271d697d4` (`createTime`),
  KEY `IDX_c1c2b023b53676ca5a25a2ae6c` (`updateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of workorder_code
-- ----------------------------
INSERT INTO `workorder_code` VALUES ('1', '2021-03-30 16:43:43.522118', '2021-03-30 16:43:43.522118', '摄像头故障', '0');
INSERT INTO `workorder_code` VALUES ('2', '2021-03-30 16:44:36.128118', '2021-06-17 12:58:23.527385', '光线传感器故障', '1');
INSERT INTO `workorder_code` VALUES ('3', '2021-03-30 16:44:46.781673', '2021-06-17 12:58:24.409679', '蓝牙模块故障', '2');
INSERT INTO `workorder_code` VALUES ('6', '2021-03-30 16:46:28.541284', '2021-06-17 12:58:25.928914', 'WIFI网络模块故障', '3');
