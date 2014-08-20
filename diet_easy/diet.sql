/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : diet

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2014-08-20 17:34:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for d_diet_master
-- ----------------------------
DROP TABLE IF EXISTS `d_diet_master`;
CREATE TABLE `d_diet_master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DAY` date NOT NULL,
  `MONTH` int(2) DEFAULT NULL,
  `YEAR` int(4) DEFAULT NULL,
  `USER_ID` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `WEATHER` varchar(20) DEFAULT NULL,
  `TEMPERATURE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_diet_master
-- ----------------------------
INSERT INTO `d_diet_master` VALUES ('1', '2014-08-13', '8', '2014', 'admin', null, '阴雨', '27-30');
INSERT INTO `d_diet_master` VALUES ('3', '2014-08-20', '8', '2014', 'admin', '深圳', '中雨转阵雨', '24-29');

-- ----------------------------
-- Table structure for d_diet_record
-- ----------------------------
DROP TABLE IF EXISTS `d_diet_record`;
CREATE TABLE `d_diet_record` (
  `ID` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `MASTER_ID` int(11) DEFAULT NULL,
  `DAY` date NOT NULL,
  `TYPE` varchar(10) DEFAULT NULL,
  `TIME_START` time DEFAULT NULL,
  `TIME_END` time DEFAULT NULL,
  `SUB_TYPE` varchar(10) DEFAULT NULL,
  `DESC` varchar(300) DEFAULT NULL,
  `TXN_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_diet_record
-- ----------------------------
INSERT INTO `d_diet_record` VALUES ('00000000023', '1', '2014-08-13', 'FOOD_TYPE', '01:05:54', '01:05:54', 'BREAKFAST', 'test desc0', '2014-08-13 17:05:54');
INSERT INTO `d_diet_record` VALUES ('00000000024', '1', '2014-08-13', 'FOOD_TYPE', '01:05:54', '01:05:54', 'LUNCH', 'test desc1', '2014-08-13 17:05:54');
INSERT INTO `d_diet_record` VALUES ('00000000025', '1', '2014-08-13', 'FOOD_TYPE', '01:05:54', '01:05:54', 'DINNER', 'test desc2', '2014-08-13 17:05:54');
INSERT INTO `d_diet_record` VALUES ('00000000039', '3', '2014-08-20', 'FOOD_TYPE', '16:45:00', '17:10:00', 'BREAKFAST', '紫薯粥 煎饼 千层饼 酥饼', '2014-08-20 16:39:29');
INSERT INTO `d_diet_record` VALUES ('00000000040', '3', '2014-08-20', 'FOOD_TYPE', '20:10:00', '20:20:00', 'LUNCH', '米饭 大白菜 鸡蛋羹 胡萝卜汤', '2014-08-20 16:39:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_action_log
-- ----------------------------
INSERT INTO `t_action_log` VALUES ('1', 'success', '登录系统', '2014-08-14 14:24:13', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('2', 'success', '查看菜单树列表', '2014-08-14 14:24:20', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('3', 'success', '查询参数', '2014-08-14 14:24:47', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('4', 'success', '查看菜单树列表', '2014-08-14 14:24:48', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('5', 'success', '添加菜单', '2014-08-14 14:25:24', null, 'admin', '/de/system/menu/addMenu.do', 'name:饮食日志<br/>uri:/diet/list.do<br/>parent.id:1<br/>');
INSERT INTO `t_action_log` VALUES ('6', 'success', '修改菜单', '2014-08-14 14:25:36', null, 'admin', '/de/system/menu/updateMenu.do', 'name:饮食日志<br/>uri:diet/list.do<br/>id:208<br/>parent.id:1<br/>style:open<br/>');
INSERT INTO `t_action_log` VALUES ('7', 'success', '查询角色', '2014-08-14 14:25:37', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('8', 'success', '查询权限', '2014-08-14 14:25:38', null, 'admin', '/de/system/privilege/list.do', 'mid1:101<br/>mid2:203<br/>');
INSERT INTO `t_action_log` VALUES ('9', 'success', '新增权限', '2014-08-14 14:26:08', null, 'admin', '/de/system/privilege/add.do', 'group:饮食日志<br/>name:日志列表<br/>uri:diet/list.do<br/>');
INSERT INTO `t_action_log` VALUES ('10', 'success', '查询权限', '2014-08-14 14:26:08', null, 'admin', '/de/system/privilege/list.do', 'mid1:101<br/>mid2:203<br/>');
INSERT INTO `t_action_log` VALUES ('11', 'success', '查询角色', '2014-08-14 14:26:12', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('12', 'success', '修改角色', '2014-08-14 14:26:19', null, 'admin', '/de/system/role/update.do', 'name:系统管理员<br/>description:拥有系统的所有权限<br/>assignedPrivilegeIds:24,23,1,2,3,4,11,20,21,22,5,6,7,8,19,9,10,17,18,12,13,14,15,16<br/>_assignedPrivilegeIds:on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on<br/>id:1<br/>');
INSERT INTO `t_action_log` VALUES ('13', 'success', '查询角色', '2014-08-14 14:26:19', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('14', 'success', '登录系统', '2014-08-14 14:26:27', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('15', 'success', '登录系统', '2014-08-14 14:26:37', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('16', 'success', '查询用户', '2014-08-14 14:26:50', null, 'admin', '/de/system/user/list.do', 'mid1:101<br/>mid2:201<br/>');
INSERT INTO `t_action_log` VALUES ('17', 'success', '查询角色', '2014-08-14 14:26:51', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('18', 'success', '登录系统', '2014-08-14 14:27:21', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('19', 'success', '查看菜单树列表', '2014-08-14 14:28:33', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('20', 'success', '修改菜单', '2014-08-14 14:28:47', null, 'admin', '/de/system/menu/updateMenu.do', 'name:饮食日志<br/>uri:<br/>id:208<br/>parent.id:1<br/>style:open<br/>');
INSERT INTO `t_action_log` VALUES ('21', 'success', '添加菜单', '2014-08-14 14:29:00', null, 'admin', '/de/system/menu/addMenu.do', 'name:饮食列表<br/>uri:diet/list.do<br/>parent.id:208<br/>');
INSERT INTO `t_action_log` VALUES ('22', 'success', '查看菜单树列表', '2014-08-14 14:29:02', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('23', 'success', '查询角色', '2014-08-14 14:29:05', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('24', 'success', '查询用户', '2014-08-14 14:29:07', null, 'admin', '/de/system/user/list.do', 'mid1:101<br/>mid2:201<br/>');
INSERT INTO `t_action_log` VALUES ('25', 'success', '登录系统', '2014-08-14 14:29:14', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('26', 'success', '查询角色', '2014-08-14 14:29:22', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('27', 'success', '查询角色', '2014-08-14 14:29:25', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('28', 'success', '查询权限', '2014-08-14 14:29:30', null, 'admin', '/de/system/privilege/list.do', 'mid1:101<br/>mid2:203<br/>');
INSERT INTO `t_action_log` VALUES ('29', 'success', '查询权限', '2014-08-14 14:29:37', null, 'admin', '/de/system/privilege/list.do', 'name:<br/>group:<br/>current:1<br/>pageSize:30<br/>');
INSERT INTO `t_action_log` VALUES ('30', 'success', '查询角色', '2014-08-14 14:30:25', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('31', 'success', '查询角色', '2014-08-14 14:31:40', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('32', 'success', '查询角色', '2014-08-14 14:31:50', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('33', 'success', '修改角色', '2014-08-14 14:31:56', null, 'admin', '/de/system/role/update.do', 'name:系统管理员<br/>description:拥有系统的所有权限<br/>assignedPrivilegeIds:24,23,1,2,3,4,11,20,21,22,5,6,7,8,19,9,10,17,18,12,13,14,15,16<br/>_assignedPrivilegeIds:on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on<br/>id:1<br/>');
INSERT INTO `t_action_log` VALUES ('34', 'success', '查询角色', '2014-08-14 14:31:56', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('35', 'success', '登录系统', '2014-08-14 14:32:02', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('36', 'success', '查询角色', '2014-08-14 14:33:46', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('37', 'success', '查询权限', '2014-08-14 14:33:48', null, 'admin', '/de/system/privilege/list.do', 'mid1:101<br/>mid2:203<br/>');
INSERT INTO `t_action_log` VALUES ('38', 'success', '查询参数', '2014-08-14 14:33:49', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('39', 'success', '查看菜单树列表', '2014-08-14 14:33:51', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('40', 'success', '修改菜单', '2014-08-14 14:34:05', null, 'admin', '/de/system/menu/updateMenu.do', 'name:饮食列表<br/>uri:diet/log/list.do<br/>id:209<br/>parent.id:208<br/>style:open<br/>');
INSERT INTO `t_action_log` VALUES ('41', 'success', '查询角色', '2014-08-14 14:34:11', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('42', 'success', '查询权限', '2014-08-14 14:34:14', null, 'admin', '/de/system/privilege/list.do', 'mid1:101<br/>mid2:203<br/>');
INSERT INTO `t_action_log` VALUES ('43', 'success', '查询权限', '2014-08-14 14:34:19', null, 'admin', '/de/system/privilege/list.do', 'name:<br/>group:<br/>current:1<br/>pageSize:30<br/>');
INSERT INTO `t_action_log` VALUES ('44', 'success', '修改权限', '2014-08-14 14:34:32', null, 'admin', '/de/system/privilege/update.do', 'group:饮食日志<br/>name:日志列表<br/>uri:diet/log/list.do<br/>id:24<br/>');
INSERT INTO `t_action_log` VALUES ('45', 'success', '查询权限', '2014-08-14 14:34:32', null, 'admin', '/de/system/privilege/list.do', 'name:<br/>group:<br/>current:1<br/>pageSize:30<br/>');
INSERT INTO `t_action_log` VALUES ('46', 'success', '登录系统', '2014-08-14 14:36:03', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('47', 'success', '查询角色', '2014-08-14 14:36:08', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('48', 'success', '查询角色', '2014-08-14 14:36:16', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('49', 'success', '修改角色', '2014-08-14 14:36:23', null, 'admin', '/de/system/role/update.do', 'name:系统管理员<br/>description:拥有系统的所有权限<br/>assignedPrivilegeIds:24,23,1,2,3,4,11,20,21,22,5,6,7,8,19,9,10,17,18,12,13,14,15,16<br/>_assignedPrivilegeIds:on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on,on<br/>id:1<br/>');
INSERT INTO `t_action_log` VALUES ('50', 'success', '查询角色', '2014-08-14 14:36:23', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('51', 'success', '登录系统', '2014-08-14 14:36:35', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('52', 'success', '登录系统', '2014-08-14 14:39:39', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('53', 'success', '登录系统', '2014-08-14 14:42:08', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('54', 'success', '查看菜单树列表', '2014-08-14 14:45:37', null, 'admin', '/de/system/menu/list.do', 'mid1:101<br/>mid2:204<br/>');
INSERT INTO `t_action_log` VALUES ('55', 'success', '查询参数', '2014-08-14 14:45:39', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('56', 'success', '新增参数', '2014-08-14 14:49:53', null, 'admin', '/de/system/param/add.do', 'name:BEHAVIOR_TYPE<br/>description:行为类型<br/>items[0].name:FOOD_TYPE<br/>items[0].value:饮食<br/>items[1].name:BODY<br/>items[1].value:身体<br/>items[2].name:SHIT<br/>items[2].value:便便<br/>');
INSERT INTO `t_action_log` VALUES ('57', 'success', '查询参数', '2014-08-14 14:49:53', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('58', 'success', '新增参数', '2014-08-14 14:53:05', null, 'admin', '/de/system/param/add.do', 'name:FOOD_TYPE<br/>description:饮食类型<br/>items[0].name:BREAKFAST<br/>items[0].value:早餐<br/>items[1].name:LUNCH<br/>items[1].value:午餐<br/>items[2].name:DINNER<br/>items[2].value:晚餐<br/>items[3].name:EXTRA_MEAL<br/>items[3].value:加餐<br/>items[4].name:NIGHT<br/>items[4].value:宵夜<br/>');
INSERT INTO `t_action_log` VALUES ('59', 'success', '查询参数', '2014-08-14 14:53:05', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('60', 'success', '登录系统', '2014-08-14 14:56:24', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('61', 'success', '登录系统', '2014-08-14 15:11:37', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('62', 'success', '登录系统', '2014-08-14 15:51:41', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('63', 'success', '登录系统', '2014-08-14 16:01:03', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('64', 'success', '查询角色', '2014-08-14 16:07:15', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('65', 'success', '查询参数', '2014-08-14 16:07:16', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('66', 'success', '登录系统', '2014-08-14 16:17:16', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('67', 'success', '登录系统', '2014-08-14 16:58:04', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('68', 'success', '登录系统', '2014-08-15 10:29:48', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('69', 'success', '登录系统', '2014-08-15 10:43:44', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('70', 'success', '登录系统', '2014-08-15 11:40:20', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('71', 'success', '登录系统', '2014-08-15 14:58:00', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('72', 'success', '登录系统', '2014-08-15 15:30:42', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('73', 'success', '登录系统', '2014-08-15 16:00:39', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('74', 'success', '登录系统', '2014-08-19 11:02:03', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('75', 'success', '登录系统', '2014-08-19 11:05:41', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('76', 'success', '登录系统', '2014-08-19 12:48:40', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('77', 'success', '登录系统', '2014-08-19 14:24:52', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('78', 'success', '登录系统', '2014-08-19 16:03:00', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('79', 'success', '登录系统', '2014-08-19 16:07:54', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('80', 'success', '登录系统', '2014-08-19 16:34:32', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('81', 'success', '登录系统', '2014-08-19 16:36:20', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('82', 'success', '登录系统', '2014-08-19 16:39:47', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('83', 'success', '查询用户', '2014-08-19 16:43:59', null, 'admin', '/de/system/user/list.do', 'mid1:101<br/>mid2:201<br/>');
INSERT INTO `t_action_log` VALUES ('84', 'success', '登录系统', '2014-08-19 16:54:44', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('85', 'success', '登录系统', '2014-08-19 16:58:17', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('86', 'success', '登录系统', '2014-08-19 16:59:43', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('87', 'success', '登录系统', '2014-08-19 17:01:08', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('88', 'success', '登录系统', '2014-08-19 17:02:57', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('89', 'success', '登录系统', '2014-08-19 17:04:30', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('90', 'success', '登录系统', '2014-08-19 17:13:12', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('91', 'success', '查询参数', '2014-08-19 17:32:26', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('92', 'success', '新增参数', '2014-08-19 17:32:59', null, 'admin', '/de/system/param/add.do', 'name:CITY<br/>description:城市<br/>items[0].name:shenzhen<br/>items[0].value:深圳<br/>');
INSERT INTO `t_action_log` VALUES ('93', 'success', '查询参数', '2014-08-19 17:33:00', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('94', 'success', '登录系统', '2014-08-19 17:34:40', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('95', 'success', '登录系统', '2014-08-20 09:43:02', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('96', 'success', '登录系统', '2014-08-20 14:41:05', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('97', 'success', '查询用户', '2014-08-20 14:47:53', null, 'admin', '/de/system/user/list.do', 'mid1:101<br/>mid2:201<br/>');
INSERT INTO `t_action_log` VALUES ('98', 'success', '查询角色', '2014-08-20 14:47:54', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('99', 'success', '查询角色', '2014-08-20 14:48:35', null, 'admin', '/de/system/role/list.do', 'mid1:101<br/>mid2:202<br/>');
INSERT INTO `t_action_log` VALUES ('100', 'success', '查询参数', '2014-08-20 14:48:55', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('101', 'success', '修改参数', '2014-08-20 14:49:01', null, 'admin', '/de/system/param/update.do', 'name:CITY<br/>description:城市<br/>items[0].name:深圳<br/>items[0].value:深圳<br/>id:5<br/>');
INSERT INTO `t_action_log` VALUES ('102', 'success', '查询参数', '2014-08-20 14:49:01', null, 'admin', '/de/system/param/list.do', 'mid1:101<br/>mid2:205<br/>');
INSERT INTO `t_action_log` VALUES ('103', 'success', '登录系统', '2014-08-20 14:53:25', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('104', 'success', '登录系统', '2014-08-20 14:54:28', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('105', 'success', '登录系统', '2014-08-20 15:01:11', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('106', 'success', '登录系统', '2014-08-20 15:02:15', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('107', 'success', '登录系统', '2014-08-20 15:38:19', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('108', 'success', '登录系统', '2014-08-20 16:36:18', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('109', 'success', '登录系统', '2014-08-20 16:38:31', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('110', 'success', '登录系统', '2014-08-20 16:41:03', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('111', 'success', '登录系统', '2014-08-20 16:51:17', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('112', 'success', '登录系统', '2014-08-20 17:05:26', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('113', 'success', '登录系统', '2014-08-20 17:32:43', null, 'admin', 'system/login', 'userid:admin<br/>password:***');
INSERT INTO `t_action_log` VALUES ('114', 'success', '登录系统', '2014-08-20 17:33:51', null, 'admin', 'system/login', 'userid:admin<br/>password:***');

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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `t_menu` VALUES ('208', '1', '饮食日志', 'open', '1', '', null);
INSERT INTO `t_menu` VALUES ('209', '208', '饮食列表', 'open', '0', 'diet/log/list.do', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_param
-- ----------------------------
INSERT INTO `t_param` VALUES ('1', 'log_level', '日志信息类型');
INSERT INTO `t_param` VALUES ('2', 'user_status', '用户状态');
INSERT INTO `t_param` VALUES ('3', 'BEHAVIOR_TYPE', '行为类型');
INSERT INTO `t_param` VALUES ('4', 'FOOD_TYPE', '饮食类型');
INSERT INTO `t_param` VALUES ('5', 'CITY', '城市');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_param_item
-- ----------------------------
INSERT INTO `t_param_item` VALUES ('1', 'success', '信息', '1');
INSERT INTO `t_param_item` VALUES ('1', 'error', '异常', '2');
INSERT INTO `t_param_item` VALUES ('2', 'enable', '启用', '3');
INSERT INTO `t_param_item` VALUES ('2', 'disable', '禁用', '4');
INSERT INTO `t_param_item` VALUES ('2', 'online', '在线', '5');
INSERT INTO `t_param_item` VALUES ('2', 'offline', '离线', '6');
INSERT INTO `t_param_item` VALUES ('3', 'FOOD_TYPE', '饮食', '7');
INSERT INTO `t_param_item` VALUES ('3', 'BODY', '身体', '8');
INSERT INTO `t_param_item` VALUES ('3', 'SHIT', '便便', '9');
INSERT INTO `t_param_item` VALUES ('4', 'BREAKFAST', '早餐', '10');
INSERT INTO `t_param_item` VALUES ('4', 'LUNCH', '午餐', '11');
INSERT INTO `t_param_item` VALUES ('4', 'DINNER', '晚餐', '12');
INSERT INTO `t_param_item` VALUES ('4', 'EXTRA_MEAL', '加餐', '13');
INSERT INTO `t_param_item` VALUES ('4', 'NIGHT', '宵夜', '14');
INSERT INTO `t_param_item` VALUES ('5', '深圳', '深圳', '16');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
INSERT INTO `t_privilege` VALUES ('24', '日志列表', 'diet/log/list.do', '饮食日志');

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
INSERT INTO `t_role_privilege` VALUES ('1', '24');

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
INSERT INTO `t_seq` VALUES ('T_USER_ACTION_LOG', 'UAL', '9999999', '0', '302', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', '', '', '2014-04-13 17:07:16', '2014-08-20 17:33:51', 'online');

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
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000084', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '643', '', '2014-08-14 14:22:12');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000085', null, 'SL02S01', '管理员登录', 'tianjp', null, null, null, null, null, null, null, null, null, 'userid=tianjp;', '200', null, null, null, null, null, null, '238', 's_col_1=userid;', '2014-08-14 14:22:23');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000086', null, 'SL02S01', '管理员登录', 'tianjp', null, null, null, null, null, null, null, null, null, 'userid=tianjp;', '200', null, null, null, null, null, null, '102', 's_col_1=userid;', '2014-08-14 14:22:34');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000087', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '132', 's_col_1=userid;', '2014-08-14 14:22:41');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000088', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '99', 's_col_1=userid;', '2014-08-14 14:22:51');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000089', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '479', 's_col_1=userid;', '2014-08-14 14:24:13');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000090', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '144', '', '2014-08-14 14:24:18');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000091', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '54', '', '2014-08-14 14:24:20');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000092', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '305', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:24:20');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000093', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '215', '', '2014-08-14 14:24:47');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000094', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '134', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:24:48');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000095', 'admin', 'SM01S03', '增加菜单', null, null, null, null, null, null, null, null, null, null, 'name=饮食日志;uri=/diet/list.do;description=null;', '200', null, null, null, null, null, null, '170', '', '2014-08-14 14:25:24');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000096', 'admin', 'SM01S06', '获取菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=208;', '200', null, null, '{\"id\":208,\"style\":\"open\",\"name\":\"饮食日志\",\"pid\":1,\"uri\":\"/diet/list.do\"}', '-1', null, null, '68', '', '2014-08-14 14:25:29');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000097', 'admin', 'SM01S07', '更新菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=208;name=饮食日志;uri=diet/list.do;description=null;', '200', null, null, '{\"id\":208,\"style\":\"open\",\"name\":\"饮食日志\",\"pid\":1,\"uri\":\"diet/list.do\"}', '-1', null, null, '169', '', '2014-08-14 14:25:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000098', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '199', '', '2014-08-14 14:25:37');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000099', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=null;name=null;', '200', null, null, null, null, null, null, '213', '', '2014-08-14 14:25:38');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000100', 'admin', 'SP02S02', '新增权限', null, null, null, null, null, null, null, null, null, null, 'name=日志列表;group=饮食日志;uri=diet/list.do;', '200', null, null, null, null, null, null, '276', '', '2014-08-14 14:26:08');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000101', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=null;name=null;', '200', null, null, null, null, null, null, '121', '', '2014-08-14 14:26:08');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000102', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '106', '', '2014-08-14 14:26:12');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000103', 'admin', 'SR01S03', '修改角色', null, null, null, null, null, null, null, null, null, null, 'id=1;name=系统管理员;description=拥有系统的所有权限;', '200', null, null, null, null, null, null, '346', '', '2014-08-14 14:26:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000104', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '106', '', '2014-08-14 14:26:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000105', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '251', '', '2014-08-14 14:26:22');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000106', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '50', '', '2014-08-14 14:26:22');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000107', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '234', 's_col_1=userid;', '2014-08-14 14:26:27');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000108', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '49', '', '2014-08-14 14:26:29');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000109', 'admin', 'CD01S04', '缓存数据全部重加载', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '249', '', '2014-08-14 14:26:30');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000110', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '56', '', '2014-08-14 14:26:30');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000111', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '86', '', '2014-08-14 14:26:32');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000112', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '47', '', '2014-08-14 14:26:32');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000113', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '248', 's_col_1=userid;', '2014-08-14 14:26:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000114', 'admin', 'SU01S01', '查询用户列表', null, null, null, null, null, null, null, null, null, null, 'name=null;status=null;userid=null;', '200', null, null, null, null, null, null, '269', '', '2014-08-14 14:26:50');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000115', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '113', '', '2014-08-14 14:26:51');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000116', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '115', '', '2014-08-14 14:27:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000117', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '134', '', '2014-08-14 14:27:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000118', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '403', 's_col_1=userid;', '2014-08-14 14:27:21');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000119', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '155', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:28:33');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000120', 'admin', 'SM01S06', '获取菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=208;', '200', null, null, '{\"id\":208,\"style\":\"open\",\"name\":\"饮食日志\",\"pid\":1,\"uri\":\"diet/list.do\"}', '-1', null, null, '78', '', '2014-08-14 14:28:44');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000121', 'admin', 'SM01S07', '更新菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=208;name=饮食日志;uri=;description=null;', '200', null, null, '{\"id\":208,\"style\":\"open\",\"name\":\"饮食日志\",\"pid\":1,\"uri\":\"\"}', '-1', null, null, '409', '', '2014-08-14 14:28:47');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000122', 'admin', 'SM01S03', '增加菜单', null, null, null, null, null, null, null, null, null, null, 'name=饮食列表;uri=diet/list.do;description=null;', '200', null, null, null, null, null, null, '165', '', '2014-08-14 14:29:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000123', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '123', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:29:02');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000124', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '151', '', '2014-08-14 14:29:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000125', 'admin', 'SU01S01', '查询用户列表', null, null, null, null, null, null, null, null, null, null, 'name=null;status=null;userid=null;', '200', null, null, null, null, null, null, '172', '', '2014-08-14 14:29:07');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000126', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '344', '', '2014-08-14 14:29:10');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000127', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '224', '', '2014-08-14 14:29:10');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000128', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '202', 's_col_1=userid;', '2014-08-14 14:29:13');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000129', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '76', '', '2014-08-14 14:29:16');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000130', 'admin', 'CD01S04', '缓存数据全部重加载', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '266', '', '2014-08-14 14:29:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000131', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '57', '', '2014-08-14 14:29:18');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000132', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '112', '', '2014-08-14 14:29:22');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000133', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '97', '', '2014-08-14 14:29:25');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000134', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=null;name=null;', '200', null, null, null, null, null, null, '137', '', '2014-08-14 14:29:30');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000135', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=;name=;', '200', null, null, null, null, null, null, '145', '', '2014-08-14 14:29:37');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000136', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '218', '', '2014-08-14 14:30:25');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000137', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '116', '', '2014-08-14 14:31:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000138', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '97', '', '2014-08-14 14:31:50');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000139', 'admin', 'SR01S03', '修改角色', null, null, null, null, null, null, null, null, null, null, 'id=1;name=系统管理员;description=拥有系统的所有权限;', '200', null, null, null, null, null, null, '668', '', '2014-08-14 14:31:55');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000140', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '109', '', '2014-08-14 14:31:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000141', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '96', '', '2014-08-14 14:31:58');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000142', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '40', '', '2014-08-14 14:31:58');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000143', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '206', 's_col_1=userid;', '2014-08-14 14:32:02');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000144', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '118', '', '2014-08-14 14:33:46');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000145', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=null;name=null;', '200', null, null, null, null, null, null, '125', '', '2014-08-14 14:33:48');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000146', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '137', '', '2014-08-14 14:33:49');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000147', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '127', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:33:51');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000148', 'admin', 'SM01S06', '获取菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=209;', '200', null, null, '{\"id\":209,\"style\":\"open\",\"name\":\"饮食列表\",\"pid\":208,\"uri\":\"diet/list.do\"}', '-1', null, null, '121', '', '2014-08-14 14:33:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000149', 'admin', 'SM01S07', '更新菜单信息', null, null, null, null, null, null, null, null, null, null, 'id=209;name=饮食列表;uri=diet/log/list.do;description=null;', '200', null, null, '{\"id\":209,\"style\":\"open\",\"name\":\"饮食列表\",\"pid\":208,\"uri\":\"diet/log/list.do\"}', '-1', null, null, '133', '', '2014-08-14 14:34:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000150', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '330', '', '2014-08-14 14:34:11');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000151', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=null;name=null;', '200', null, null, null, null, null, null, '109', '', '2014-08-14 14:34:14');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000152', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=;name=;', '200', null, null, null, null, null, null, '126', '', '2014-08-14 14:34:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000153', 'admin', 'SP02S04', '修改权限', null, null, null, null, null, null, null, null, null, null, 'id=24;name=日志列表;group=饮食日志;uri=diet/log/list.do;', '200', null, null, null, null, null, null, '215', '', '2014-08-14 14:34:31');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000154', 'admin', 'SP02S01', '查询权限', null, null, null, null, null, null, null, null, null, null, 'group=;name=;', '200', null, null, null, null, null, null, '129', '', '2014-08-14 14:34:32');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000155', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '133', '', '2014-08-14 14:36:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000156', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '127', '', '2014-08-14 14:36:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000157', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '310', 's_col_1=userid;', '2014-08-14 14:36:03');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000158', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '179', '', '2014-08-14 14:36:07');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000159', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '124', '', '2014-08-14 14:36:16');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000160', 'admin', 'SR01S03', '修改角色', null, null, null, null, null, null, null, null, null, null, 'id=1;name=系统管理员;description=拥有系统的所有权限;', '200', null, null, null, null, null, null, '350', '', '2014-08-14 14:36:23');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000161', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '110', '', '2014-08-14 14:36:23');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000162', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '95', '', '2014-08-14 14:36:29');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000163', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '50', '', '2014-08-14 14:36:29');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000164', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '501', 's_col_1=userid;', '2014-08-14 14:36:35');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000165', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '130', '', '2014-08-14 14:39:35');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000166', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '116', '', '2014-08-14 14:39:35');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000167', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '506', 's_col_1=userid;', '2014-08-14 14:39:39');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000168', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '121', '', '2014-08-14 14:42:02');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000169', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '120', '', '2014-08-14 14:42:02');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000170', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '363', 's_col_1=userid;', '2014-08-14 14:42:08');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000171', 'admin', 'SM01S01', '查看菜单', null, null, null, null, null, null, null, null, null, null, 'keyword=null;current=null;pageSize=null;', '200', null, null, null, null, null, null, '201', 's_col_1=keyword;i_col_1=current;i_col_2=pageSize;', '2014-08-14 14:45:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000172', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '132', '', '2014-08-14 14:45:39');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000173', 'admin', 'SP01S02', '新增参数', null, null, null, null, null, null, null, null, null, null, 'name=BEHAVIOR_TYPE;description=行为类型;', '200', null, null, null, null, null, null, '279', '', '2014-08-14 14:49:53');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000174', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '127', '', '2014-08-14 14:49:53');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000175', 'admin', 'SP01S02', '新增参数', null, null, null, null, null, null, null, null, null, null, 'name=FOOD_TYPE;description=饮食类型;', '200', null, null, null, null, null, null, '270', '', '2014-08-14 14:53:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000176', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '125', '', '2014-08-14 14:53:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000177', 'admin', 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '103', '', '2014-08-14 14:56:20');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000178', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '121', '', '2014-08-14 14:56:20');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000179', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '289', 's_col_1=userid;', '2014-08-14 14:56:24');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000180', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '176', '', '2014-08-14 15:11:33');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000181', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '485', 's_col_1=userid;', '2014-08-14 15:11:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000182', null, 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '112', '', '2014-08-14 15:51:37');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000183', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '158', '', '2014-08-14 15:51:38');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000184', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '547', 's_col_1=userid;', '2014-08-14 15:51:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000185', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '341', '', '2014-08-14 16:00:57');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000186', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '501', 's_col_1=userid;', '2014-08-14 16:01:03');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000187', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '83', '', '2014-08-14 16:03:53');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000188', 'admin', 'CD01S02', '缓存数据详情', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '129', 's_col_1=dataName;', '2014-08-14 16:03:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000189', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '52', '', '2014-08-14 16:05:12');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000190', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '310', '', '2014-08-14 16:07:14');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000191', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '134', '', '2014-08-14 16:07:15');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000192', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '52', '', '2014-08-14 16:07:18');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000193', 'admin', 'CD01S02', '缓存数据详情', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '56', 's_col_1=dataName;', '2014-08-14 16:07:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000194', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '195', '', '2014-08-14 16:17:11');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000195', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '511', 's_col_1=userid;', '2014-08-14 16:17:16');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000196', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '44', '', '2014-08-14 16:58:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408140000197', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '236', 's_col_1=userid;', '2014-08-14 16:58:04');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000198', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '178', '', '2014-08-15 10:29:45');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000199', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '485', 's_col_1=userid;', '2014-08-15 10:29:48');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000200', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '211', '', '2014-08-15 10:43:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000201', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '307', 's_col_1=userid;', '2014-08-15 10:43:44');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000202', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '960', '', '2014-08-15 11:40:14');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000203', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '518', 's_col_1=userid;', '2014-08-15 11:40:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000204', null, 'SL03S01', '管理员登出', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '51', '', '2014-08-15 14:57:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000205', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '48', '', '2014-08-15 14:57:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000206', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '195', 's_col_1=userid;', '2014-08-15 14:58:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000207', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '759', '', '2014-08-15 15:30:33');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000208', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '76', '', '2014-08-15 15:30:38');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000209', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '307', 's_col_1=userid;', '2014-08-15 15:30:41');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000210', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '149', '', '2014-08-15 15:34:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000211', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '53', '', '2014-08-15 15:37:53');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000212', 'admin', 'CD01S02', '缓存数据详情', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '115', 's_col_1=dataName;', '2014-08-15 15:37:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000213', 'admin', 'CD01S02', '缓存数据详情', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '199', 's_col_1=dataName;', '2014-08-15 15:38:18');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000214', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '832', '', '2014-08-15 16:00:34');
INSERT INTO `t_user_action_log` VALUES ('UAL201408150000215', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '419', 's_col_1=userid;', '2014-08-15 16:00:38');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000216', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '231', '', '2014-08-19 11:01:58');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000217', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '295', 's_col_1=userid;', '2014-08-19 11:02:03');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000218', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '810', '', '2014-08-19 11:02:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000219', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '181', '', '2014-08-19 11:05:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000220', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '289', 's_col_1=userid;', '2014-08-19 11:05:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000221', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '214', '', '2014-08-19 12:48:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000222', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '389', 's_col_1=userid;', '2014-08-19 12:48:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000223', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '49', '', '2014-08-19 14:24:49');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000224', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '199', 's_col_1=userid;', '2014-08-19 14:24:52');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000225', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '1051', '', '2014-08-19 16:02:55');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000226', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '312', 's_col_1=userid;', '2014-08-19 16:03:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000227', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '169', '', '2014-08-19 16:07:51');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000228', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '288', 's_col_1=userid;', '2014-08-19 16:07:54');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000229', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '161', '', '2014-08-19 16:34:29');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000230', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '298', 's_col_1=userid;', '2014-08-19 16:34:32');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000231', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '161', '', '2014-08-19 16:36:16');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000232', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '296', 's_col_1=userid;', '2014-08-19 16:36:20');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000233', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '172', '', '2014-08-19 16:39:15');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000234', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '285', 's_col_1=userid;', '2014-08-19 16:39:47');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000235', 'admin', 'SU01S01', '查询用户列表', null, null, null, null, null, null, null, null, null, null, 'name=null;status=null;userid=null;', '200', null, null, null, null, null, null, '441', '', '2014-08-19 16:43:58');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000236', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '199', '', '2014-08-19 16:54:39');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000237', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '281', 's_col_1=userid;', '2014-08-19 16:54:43');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000238', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '176', '', '2014-08-19 16:58:13');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000239', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '581', 's_col_1=userid;', '2014-08-19 16:58:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000240', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '161', '', '2014-08-19 16:59:38');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000241', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '465', 's_col_1=userid;', '2014-08-19 16:59:43');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000242', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '172', '', '2014-08-19 17:01:02');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000243', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '290', 's_col_1=userid;', '2014-08-19 17:01:08');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000244', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '168', '', '2014-08-19 17:02:50');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000245', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '516', 's_col_1=userid;', '2014-08-19 17:02:57');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000246', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '175', '', '2014-08-19 17:04:27');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000247', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '426', 's_col_1=userid;', '2014-08-19 17:04:30');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000248', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '166', '', '2014-08-19 17:13:07');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000249', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '370', 's_col_1=userid;', '2014-08-19 17:13:12');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000250', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '245', '', '2014-08-19 17:32:26');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000251', 'admin', 'SP01S02', '新增参数', null, null, null, null, null, null, null, null, null, null, 'name=CITY;description=城市;', '200', null, null, null, null, null, null, '240', '', '2014-08-19 17:32:59');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000252', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '122', '', '2014-08-19 17:33:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000253', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '110', '', '2014-08-19 17:33:04');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000254', 'admin', 'CD01S03', '缓存数据重加载', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '155', 's_col_1=dataName;', '2014-08-19 17:33:08');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000255', 'admin', 'CD01S03', '缓存数据重加载', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '101', 's_col_1=dataName;', '2014-08-19 17:33:11');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000256', 'admin', 'CD01S03', '缓存数据重加载', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '69', 's_col_1=dataName;', '2014-08-19 17:34:36');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000257', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '153', '', '2014-08-19 17:34:37');
INSERT INTO `t_user_action_log` VALUES ('UAL201408190000258', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '394', 's_col_1=userid;', '2014-08-19 17:34:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000259', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '190', '', '2014-08-20 09:42:57');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000260', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '390', 's_col_1=userid;', '2014-08-20 09:43:01');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000261', null, 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '52', '', '2014-08-20 14:40:39');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000262', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '104', 's_col_1=userid;', '2014-08-20 14:40:52');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000263', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '83', 's_col_1=userid;', '2014-08-20 14:40:56');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000264', null, 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '254', 's_col_1=userid;', '2014-08-20 14:41:05');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000265', 'admin', 'SU01S01', '查询用户列表', null, null, null, null, null, null, null, null, null, null, 'name=null;status=null;userid=null;', '200', null, null, null, null, null, null, '172', '', '2014-08-20 14:47:53');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000266', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '212', '', '2014-08-20 14:47:54');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000267', 'admin', 'SR01S01', '查询角色', null, null, null, null, null, null, null, null, null, null, 'name=null;', '200', null, null, null, null, null, null, '95', '', '2014-08-20 14:48:34');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000268', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '166', '', '2014-08-20 14:48:55');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000269', 'admin', 'SP01S03', '修改参数', null, null, null, null, null, null, null, null, null, null, 'id=5;name=CITY;description=城市;', '200', null, null, null, null, null, null, '289', '', '2014-08-20 14:49:01');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000270', 'admin', 'SP01S01', '查询参数', null, null, null, null, null, null, null, null, null, null, 'name=null;description=null;', '200', null, null, null, null, null, null, '109', '', '2014-08-20 14:49:01');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000271', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '87', '', '2014-08-20 14:49:03');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000272', 'admin', 'CD01S03', '缓存数据重加载', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '83', 's_col_1=dataName;', '2014-08-20 14:49:06');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000273', 'admin', 'CD01S03', '缓存数据重加载', 'PARAMETER_MAP', null, null, null, null, null, null, null, null, null, 'dataName=PARAMETER_MAP;', '200', null, null, null, null, null, null, '100', 's_col_1=dataName;', '2014-08-20 14:49:10');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000274', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '165', '', '2014-08-20 14:53:04');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000275', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '57', '', '2014-08-20 14:53:15');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000276', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '203', '', '2014-08-20 14:53:21');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000277', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '426', 's_col_1=userid;', '2014-08-20 14:53:25');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000278', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '303', '', '2014-08-20 14:54:23');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000279', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '327', 's_col_1=userid;', '2014-08-20 14:54:28');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000280', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '167', '', '2014-08-20 15:01:06');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000281', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '511', 's_col_1=userid;', '2014-08-20 15:01:11');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000282', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '167', '', '2014-08-20 15:02:12');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000283', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '362', 's_col_1=userid;', '2014-08-20 15:02:15');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000284', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '170', '', '2014-08-20 15:38:15');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000285', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '334', 's_col_1=userid;', '2014-08-20 15:38:19');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000286', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '72', '', '2014-08-20 15:41:31');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000287', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '327', '', '2014-08-20 16:36:14');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000288', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '282', 's_col_1=userid;', '2014-08-20 16:36:18');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000289', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '193', '', '2014-08-20 16:38:27');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000290', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '566', 's_col_1=userid;', '2014-08-20 16:38:31');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000291', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '164', '', '2014-08-20 16:41:00');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000292', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '306', 's_col_1=userid;', '2014-08-20 16:41:03');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000293', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '164', '', '2014-08-20 16:51:14');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000294', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '333', 's_col_1=userid;', '2014-08-20 16:51:17');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000295', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '205', '', '2014-08-20 17:05:23');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000296', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '292', 's_col_1=userid;', '2014-08-20 17:05:26');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000297', 'admin', 'CD01S01', '缓存数据列表', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '71', '', '2014-08-20 17:13:34');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000298', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '166', '', '2014-08-20 17:32:40');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000299', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '314', 's_col_1=userid;', '2014-08-20 17:32:43');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000300', 'admin', 'SL01S01', '管理员登录界面', null, null, null, null, null, null, null, null, null, null, '', '200', null, null, null, null, null, null, '386', '', '2014-08-20 17:33:48');
INSERT INTO `t_user_action_log` VALUES ('UAL201408200000301', 'admin', 'SL02S01', '管理员登录', 'admin', null, null, null, null, null, null, null, null, null, 'userid=admin;', '200', null, null, null, null, null, null, '473', 's_col_1=userid;', '2014-08-20 17:33:51');

-- ----------------------------
-- Table structure for t_user_copy
-- ----------------------------
DROP TABLE IF EXISTS `t_user_copy`;
CREATE TABLE `t_user_copy` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_copy
-- ----------------------------
INSERT INTO `t_user_copy` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', null, null, '2014-04-13 17:07:16', '2014-08-05 11:38:32', 'offline');
INSERT INTO `t_user_copy` VALUES ('2', 'qqq', '3bad6af0fa4b8b330d162e19938ee981', 'wqeqwe323321', '440000', '440600', '2014-08-05 10:28:33', null, 'enable');

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
