/*
MySQL Data Transfer
Source Host: 192.168.5.101
Source Database: distributedt
Target Host: 192.168.5.101
Target Database: distributedt
Date: 2014/8/28 15:16:41
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for function_role
-- ----------------------------
DROP TABLE IF EXISTS `function_role`;
CREATE TABLE `function_role` (
  `roleid` char(24) NOT NULL,
  `functionid` char(24) NOT NULL,
  `creationdate` datetime DEFAULT NULL,
  PRIMARY KEY (`roleid`,`functionid`),
  KEY `functionid` (`functionid`),
  CONSTRAINT `function_role_ibfk_2` FOREIGN KEY (`functionid`) REFERENCES `sys_function` (`id`),
  CONSTRAINT `function_role_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `id` char(24) NOT NULL,
  `parentid` char(24) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `attributes` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `pictureURL` varchar(200) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(24) NOT NULL DEFAULT '',
  `rolename` varchar(20) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` char(1) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `regtime` datetime NOT NULL,
  `lasttime` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pictureURL` varchar(50) DEFAULT NULL,
  `schooyear` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_dept
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept` (
  `userid` char(24) NOT NULL,
  `deptid` char(24) NOT NULL,
  `creationdate` year(4) DEFAULT NULL,
  PRIMARY KEY (`userid`,`deptid`),
  KEY `deptid` (`deptid`),
  CONSTRAINT `user_dept_ibfk_2` FOREIGN KEY (`deptid`) REFERENCES `zonekey_dept` (`id`),
  CONSTRAINT `user_dept_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_range
-- ----------------------------
DROP TABLE IF EXISTS `user_range`;
CREATE TABLE `user_range` (
  `userid` char(24) NOT NULL,
  `rungid` char(24) NOT NULL,
  `creationdate` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`rungid`),
  KEY `rungid` (`rungid`),
  CONSTRAINT `user_range_ibfk_2` FOREIGN KEY (`rungid`) REFERENCES `zonekey_range` (`id`),
  CONSTRAINT `user_range_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `usereid` char(24) NOT NULL DEFAULT '',
  `roleid` char(24) NOT NULL,
  `createtime
createtime` date DEFAULT NULL,
  PRIMARY KEY (`usereid`,`roleid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`usereid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_area
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_area`;
CREATE TABLE `zonekey_area` (
  `id` char(24) NOT NULL,
  `areaid` char(24) DEFAULT NULL,
  `userid` char(24) DEFAULT NULL,
  `deptid` char(24) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `attribute` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `sort` char(1) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `userid` (`userid`),
  KEY `deptid` (`deptid`),
  CONSTRAINT `zonekey_area_ibfk_3` FOREIGN KEY (`deptid`) REFERENCES `zonekey_dept` (`id`),
  CONSTRAINT `zonekey_area_ibfk_1` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`),
  CONSTRAINT `zonekey_area_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_curriculum
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_curriculum`;
CREATE TABLE `zonekey_curriculum` (
  `id` char(24) NOT NULL,
  `curriculumbaseid` char(24) DEFAULT NULL,
  `areaid` char(24) DEFAULT NULL,
  `userid` char(24) DEFAULT NULL,
  `deptid` char(24) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `record` char(1) DEFAULT NULL,
  `live` char(1) DEFAULT NULL,
  `classniddlerecord` char(1) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `video` char(1) DEFAULT NULL,
  `classnum` char(1) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curriculumbaseid` (`curriculumbaseid`),
  KEY `areaid` (`areaid`),
  KEY `userid` (`userid`),
  KEY `deptid` (`deptid`),
  CONSTRAINT `zonekey_curriculum_ibfk_4` FOREIGN KEY (`deptid`) REFERENCES `zonekey_dept` (`id`),
  CONSTRAINT `zonekey_curriculum_ibfk_1` FOREIGN KEY (`curriculumbaseid`) REFERENCES `zonekey_curriculumbase` (`id`),
  CONSTRAINT `zonekey_curriculum_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`),
  CONSTRAINT `zonekey_curriculum_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_curriculumbase
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_curriculumbase`;
CREATE TABLE `zonekey_curriculumbase` (
  `id` char(24) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `weeksnumber` int(5) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_dept
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_dept`;
CREATE TABLE `zonekey_dept` (
  `id` char(24) NOT NULL,
  `deptid` char(24) NOT NULL,
  `areaid` char(24) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `attributes` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `Sort` char(1) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `Classyear` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `deptid` (`deptid`),
  KEY `areaid` (`areaid`),
  CONSTRAINT `zonekey_dept_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`),
  CONSTRAINT `zonekey_dept_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `zonekey_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_device
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_device`;
CREATE TABLE `zonekey_device` (
  `id` char(24) DEFAULT NULL,
  `areaid` char(24) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `MAC` varchar(48) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  KEY `areaid` (`areaid`),
  KEY `id` (`id`),
  CONSTRAINT `zonekey_device_ibfk_1` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_devicecontrol
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_devicecontrol`;
CREATE TABLE `zonekey_devicecontrol` (
  `id` char(24) NOT NULL,
  `areaid` char(24) DEFAULT NULL,
  `serviceid` char(24) DEFAULT NULL,
  `interface` varchar(50) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `parameter` varchar(50) DEFAULT NULL,
  `returncontent` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `serviceid` (`serviceid`),
  CONSTRAINT `zonekey_devicecontrol_ibfk_2` FOREIGN KEY (`serviceid`) REFERENCES `zonekey_service` (`id`),
  CONSTRAINT `zonekey_devicecontrol_ibfk_1` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_range
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_range`;
CREATE TABLE `zonekey_range` (
  `id` char(24) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `creationdate` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_resource
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_resource`;
CREATE TABLE `zonekey_resource` (
  `id` char(24) DEFAULT NULL,
  `userid` char(24) DEFAULT NULL,
  `areaid` char(24) DEFAULT NULL,
  `curriculumid` char(24) DEFAULT NULL,
  `deptid` char(24) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `floder` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  KEY `userid` (`userid`),
  KEY `curriculumid` (`curriculumid`),
  KEY `deptid` (`deptid`),
  KEY `areaid` (`areaid`),
  CONSTRAINT `zonekey_resource_ibfk_4` FOREIGN KEY (`areaid`) REFERENCES `zonekey_area` (`id`),
  CONSTRAINT `zonekey_resource_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `zonekey_resource_ibfk_2` FOREIGN KEY (`curriculumid`) REFERENCES `zonekey_curriculum` (`id`),
  CONSTRAINT `zonekey_resource_ibfk_3` FOREIGN KEY (`deptid`) REFERENCES `zonekey_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zonekey_service
-- ----------------------------
DROP TABLE IF EXISTS `zonekey_service`;
CREATE TABLE `zonekey_service` (
  `id` char(24) NOT NULL,
  `deviceid` char(24) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `extendinfo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  CONSTRAINT `zonekey_service_ibfk_1` FOREIGN KEY (`deviceid`) REFERENCES `zonekey_device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
