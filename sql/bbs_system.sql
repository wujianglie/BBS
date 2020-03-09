/*
MySQL Data Transfer
Source Host: localhost
Source Database: bbs_system
Target Host: localhost
Target Database: bbs_system
Date: 2020/3/9 19:05:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
CREATE TABLE `bbs_category` (
  `categoryId` int(11) NOT NULL auto_increment,
  `category` varchar(32) NOT NULL,
  PRIMARY KEY  (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_follow
-- ----------------------------
CREATE TABLE `bbs_follow` (
  `userId` varchar(32) NOT NULL,
  `beUserId` varchar(32) NOT NULL,
  `followDate` datetime default NULL,
  PRIMARY KEY  (`userId`,`beUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_invitation
-- ----------------------------
CREATE TABLE `bbs_invitation` (
  `invitationId` varchar(128) NOT NULL,
  `invitationMessage` varchar(2048) NOT NULL,
  `userId` varchar(32) NOT NULL,
  `plateId` int(11) default NULL,
  `categoryId` int(11) default NULL,
  `isPass` int(11) default '0',
  `isEnable` int(11) default '0',
  `isCream` int(11) default '0',
  `invitationCreate` datetime default NULL,
  `invitationModify` datetime default NULL,
  PRIMARY KEY  (`invitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_invitation_ans
-- ----------------------------
CREATE TABLE `bbs_invitation_ans` (
  `ansId` varchar(128) NOT NULL,
  `ansMessage` varchar(512) NOT NULL,
  `invitationId` varchar(128) NOT NULL,
  `userId` varchar(32) default NULL,
  `ansDate` datetime default NULL,
  PRIMARY KEY  (`ansId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_level
-- ----------------------------
CREATE TABLE `bbs_level` (
  `levelId` int(11) NOT NULL auto_increment,
  `levelMessage` varchar(8) NOT NULL,
  PRIMARY KEY  (`levelId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_plate
-- ----------------------------
CREATE TABLE `bbs_plate` (
  `plateId` int(11) NOT NULL auto_increment,
  `plateTitle` varchar(32) NOT NULL,
  `plateMessage` varchar(128) default NULL,
  `isEnable` int(11) default '0',
  PRIMARY KEY  (`plateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_store
-- ----------------------------
CREATE TABLE `bbs_store` (
  `userId` varchar(32) NOT NULL,
  `invitationId` varchar(128) NOT NULL,
  `storeDate` datetime default NULL,
  PRIMARY KEY  (`userId`,`invitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_system_ans
-- ----------------------------
CREATE TABLE `bbs_system_ans` (
  `id` varchar(128) NOT NULL,
  `systemId` varchar(32) NOT NULL,
  `userId` varchar(32) default NULL,
  `message` varchar(255) NOT NULL,
  `isRead` int(11) default '0',
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
CREATE TABLE `bbs_user` (
  `userId` varchar(32) NOT NULL,
  `userPsw` varchar(32) NOT NULL,
  `userAlice` varchar(64) NOT NULL,
  `userEmail` varchar(64) NOT NULL,
  `userSex` varchar(1) default '男',
  `userPhoto` varchar(128) default 'xxx.jpg',
  `userScore` double default '0',
  `userLevel` int(11) default '1',
  `levelDown` date default NULL,
  `userLock` date default NULL,
  `userCreateDate` date default NULL,
  `repassword` varchar(32) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bbs_level` VALUES ('1', '初级会员');
INSERT INTO `bbs_level` VALUES ('2', '中级会员');
INSERT INTO `bbs_level` VALUES ('3', '高级会员');
INSERT INTO `bbs_level` VALUES ('4', '系统管理员');
