/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : diet

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2014-08-13 17:27:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for d_diet_master
-- ----------------------------
DROP TABLE IF EXISTS `d_diet_master`;
CREATE TABLE `d_diet_master` (
  `DAY` date NOT NULL,
  `MONTH` int(2) DEFAULT NULL,
  `YEAR` int(4) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_diet_master
-- ----------------------------
INSERT INTO `d_diet_master` VALUES ('2014-08-13', '8', '2014', '1');

-- ----------------------------
-- Table structure for d_diet_record
-- ----------------------------
DROP TABLE IF EXISTS `d_diet_record`;
CREATE TABLE `d_diet_record` (
  `ID` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `DAY` date NOT NULL,
  `TYPE` varchar(10) DEFAULT NULL,
  `TIME_START` time DEFAULT NULL,
  `TIME_END` time DEFAULT NULL,
  `SUB_TYPE` varchar(10) DEFAULT NULL,
  `DESC` varchar(300) DEFAULT NULL,
  `TXN_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_diet_record
-- ----------------------------
INSERT INTO `d_diet_record` VALUES ('00000000023', '2014-08-13', 'food', '01:05:54', '01:05:54', 'breakfast', 'test desc0', '2014-08-13 17:05:54');
INSERT INTO `d_diet_record` VALUES ('00000000024', '2014-08-13', 'food', '01:05:54', '01:05:54', 'breakfast', 'test desc1', '2014-08-13 17:05:54');
INSERT INTO `d_diet_record` VALUES ('00000000025', '2014-08-13', 'food', '01:05:54', '01:05:54', 'breakfast', 'test desc2', '2014-08-13 17:05:54');

-- ----------------------------
-- Table structure for d_user
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `ID` varchar(20) DEFAULT NULL,
  `USER_NAME` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_action_log`;
CREATE TABLE `t_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `content` varchar(128) NOT NULL,
  `add_date` datetime NOT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `actor` varchar(20) NOT NULL,
  `uri` varchar(256) DEFAULT NULL,
  `param` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_action_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_action_log_detail`;
CREATE TABLE `t_action_log_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_action_log_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `style` varchar(10) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `uri` varchar(256) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, 'SYSTEM_MENU_TREE', 'open', '0', null, '系统功能菜单树');
INSERT INTO `t_menu` VALUES ('101', '1', '系统管理', 'open', '0', null, null);
INSERT INTO `t_menu` VALUES ('201', '101', '用户管理', 'open', '0', 'system/user/list.do', null);
INSERT INTO `t_menu` VALUES ('202', '101', '角色管理', 'open', '1', 'system/role/list.do', null);
INSERT INTO `t_menu` VALUES ('203', '101', '权限管理', 'open', '2', 'system/privilege/list.do', null);
INSERT INTO `t_menu` VALUES ('204', '101', '菜单管理', 'open', '3', 'system/menu/list.do', null);
INSERT INTO `t_menu` VALUES ('205', '101', '参数管理', 'open', '4', 'system/param/list.do', null);
INSERT INTO `t_menu` VALUES ('206', '101', '系统日志', 'open', '5', 'system/log/list.do', null);
INSERT INTO `t_menu` VALUES ('207', '101', '内存数据管理', 'open', '6', 'system/data/list.do', null);

-- ----------------------------
-- Table structure for t_param
-- ----------------------------
DROP TABLE IF EXISTS `t_param`;
CREATE TABLE `t_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_param
-- ----------------------------
INSERT INTO `t_param` VALUES ('1', 'log_level', '日志信息类型');
INSERT INTO `t_param` VALUES ('2', 'user_status', '用户状态');

-- ----------------------------
-- Table structure for t_param_item
-- ----------------------------
DROP TABLE IF EXISTS `t_param_item`;
CREATE TABLE `t_param_item` (
  `param_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_param_item
-- ----------------------------
INSERT INTO `t_param_item` VALUES ('1', 'success', '信息', '1');
INSERT INTO `t_param_item` VALUES ('1', 'error', '异常', '2');
INSERT INTO `t_param_item` VALUES ('2', 'enable', '启用', '3');
INSERT INTO `t_param_item` VALUES ('2', 'disable', '禁用', '4');
INSERT INTO `t_param_item` VALUES ('2', 'online', '在线', '5');
INSERT INTO `t_param_item` VALUES ('2', 'offline', '离线', '6');

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `uri` varchar(256) DEFAULT NULL,
  `group_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES ('1', '权限列表', 'system/privilege/list.do', '权限管理');
INSERT INTO `t_privilege` VALUES ('2', '新增权限', 'system/privilege/add.do', '权限管理');
INSERT INTO `t_privilege` VALUES ('3', '修改权限', 'system/privilege/update.do', '权限管理');
INSERT INTO `t_privilege` VALUES ('4', '删除权限', 'system/privilege/remove.do', '权限管理');
INSERT INTO `t_privilege` VALUES ('5', '角色列表', 'system/role/list.do', '角色管理');
INSERT INTO `t_privilege` VALUES ('6', '新增角色', 'system/role/add.do', '角色管理');
INSERT INTO `t_privilege` VALUES ('7', '修改角色', 'system/role/update.do', '角色管理');
INSERT INTO `t_privilege` VALUES ('8', '删除角色', 'system/role/remove.do', '角色管理');
INSERT INTO `t_privilege` VALUES ('9', '参数列表', 'system/param/list.do', '参数管理');
INSERT INTO `t_privilege` VALUES ('10', '新增参数', 'system/param/add.do', '参数管理');
INSERT INTO `t_privilege` VALUES ('11', '账号列表', 'system/user/list.do', '账号管理');
INSERT INTO `t_privilege` VALUES ('12', '菜单列表', 'system/menu/list.do', '菜单管理');
INSERT INTO `t_privilege` VALUES ('13', '新增菜单树', 'system/menu/addTree.do', '菜单管理');
INSERT INTO `t_privilege` VALUES ('14', '新增菜单', 'system/menu/addMenu.do', '菜单管理');
INSERT INTO `t_privilege` VALUES ('15', '删除菜单树', 'system/menu/removeTree.do', '菜单管理');
INSERT INTO `t_privilege` VALUES ('16', '删除菜单', 'system/menu/remove.do', '菜单管理');
INSERT INTO `t_privilege` VALUES ('17', '修改参数', 'system/param/update.do', '参数管理');
INSERT INTO `t_privilege` VALUES ('18', '删除参数', 'system/param/remove.do', '参数管理');
INSERT INTO `t_privilege` VALUES ('19', '查看日志', 'system/log/list.do', '日志管理');
INSERT INTO `t_privilege` VALUES ('20', '新增账号', 'system/user/add.do', '账号管理');
INSERT INTO `t_privilege` VALUES ('21', '修改账号', 'system/user/update.do', '账号管理');
INSERT INTO `t_privilege` VALUES ('22', '删除账号', 'system/user/remove.do', '账号管理');
INSERT INTO `t_privilege` VALUES ('23', '内存数据查看', 'system/data/list.do', '内存数据管理');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '系统管理员', '拥有系统的所有权限');

-- ----------------------------
-- Table structure for t_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE `t_role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role_privilege
-- ----------------------------
INSERT INTO `t_role_privilege` VALUES ('1', '1');
INSERT INTO `t_role_privilege` VALUES ('1', '2');
INSERT INTO `t_role_privilege` VALUES ('1', '3');
INSERT INTO `t_role_privilege` VALUES ('1', '4');
INSERT INTO `t_role_privilege` VALUES ('1', '5');
INSERT INTO `t_role_privilege` VALUES ('1', '6');
INSERT INTO `t_role_privilege` VALUES ('1', '7');
INSERT INTO `t_role_privilege` VALUES ('1', '8');
INSERT INTO `t_role_privilege` VALUES ('1', '9');
INSERT INTO `t_role_privilege` VALUES ('1', '10');
INSERT INTO `t_role_privilege` VALUES ('1', '11');
INSERT INTO `t_role_privilege` VALUES ('1', '12');
INSERT INTO `t_role_privilege` VALUES ('1', '13');
INSERT INTO `t_role_privilege` VALUES ('1', '14');
INSERT INTO `t_role_privilege` VALUES ('1', '15');
INSERT INTO `t_role_privilege` VALUES ('1', '16');
INSERT INTO `t_role_privilege` VALUES ('1', '17');
INSERT INTO `t_role_privilege` VALUES ('1', '18');
INSERT INTO `t_role_privilege` VALUES ('1', '19');
INSERT INTO `t_role_privilege` VALUES ('1', '20');
INSERT INTO `t_role_privilege` VALUES ('1', '21');
INSERT INTO `t_role_privilege` VALUES ('1', '22');
INSERT INTO `t_role_privilege` VALUES ('1', '23');

-- ----------------------------
-- Table structure for t_schedule_log
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule_log`;
CREATE TABLE `t_schedule_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(50) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `schedule_status` int(2) DEFAULT NULL,
  `run_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_schedule_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_seq
-- ----------------------------
DROP TABLE IF EXISTS `t_seq`;
CREATE TABLE `t_seq` (
  `TABLE_NAME` varchar(50) NOT NULL DEFAULT '',
  `PREFIX` varchar(20) DEFAULT NULL,
  `MAX_VALUE` bigint(15) DEFAULT NULL,
  `INIT_VALUE` bigint(15) DEFAULT NULL,
  `NEXT_VALUE` bigint(15) DEFAULT NULL,
  `INCREASE` int(2) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seq
-- ----------------------------
INSERT INTO `t_seq` VALUES ('T_USER_ACTION_LOG', 'UAL', '9999999', '0', '84', '1');

-- ----------------------------
-- Table structure for t_system_paramter
-- ----------------------------
DROP TABLE IF EXISTS `t_system_paramter`;
CREATE TABLE `t_system_paramter` (
  `key` varchar(120) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_paramter
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_userid` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_action_log`;
CREATE TABLE `t_user_action_log` (
  `id` varchar(18) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `action_code` varchar(7) DEFAULT NULL,
  `operation_desc` varchar(50) DEFAULT NULL,
  `s_col_1` varchar(50) DEFAULT NULL,
  `s_col_2` varchar(50) DEFAULT NULL,
  `s_col_3` varchar(50) DEFAULT NULL,
  `s_col_4` varchar(50) DEFAULT NULL,
  `i_col_1` int(11) DEFAULT NULL,
  `i_col_2` int(11) DEFAULT NULL,
  `i_col_3` int(11) DEFAULT NULL,
  `d_col_1` datetime DEFAULT NULL,
  `d_col_2` datetime DEFAULT NULL,
  `d_col_3` datetime DEFAULT NULL,
  `input_params` varchar(600) DEFAULT NULL,
  `http_resp_code` varchar(3) DEFAULT NULL,
  `http_error_msg` varchar(600) DEFAULT NULL,
  `third_resp_data` varchar(600) DEFAULT NULL,
  `resp_data` varchar(1000) DEFAULT NULL,
  `business_result_code` int(3) DEFAULT NULL,
  `exception_info` varchar(6000) DEFAULT NULL,
  `staying_time` int(11) DEFAULT NULL COMMENT '页面停留时间 秒',
  `using_time` int(11) DEFAULT NULL COMMENT '花费时间 毫秒数',
  `comment` varchar(300) DEFAULT NULL COMMENT '模糊字段所存储信息详情 开发人员使用',
  `txn_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('2', '1');
