/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : competitionmanager

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-12-08 22:18:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cm_admins
-- ----------------------------
DROP TABLE IF EXISTS `cm_admins`;
CREATE TABLE `cm_admins` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(255) DEFAULT NULL,
  `ad_num` varchar(255) DEFAULT NULL,
  `ad_password` varchar(255) DEFAULT NULL,
  `ad_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_admins
-- ----------------------------
INSERT INTO `cm_admins` VALUES ('1', '教务处负责人', 'admin', '21232f297a57a5a743894a0e4a801fc3', '男');

-- ----------------------------
-- Table structure for cm_awardhierarchies
-- ----------------------------
DROP TABLE IF EXISTS `cm_awardhierarchies`;
CREATE TABLE `cm_awardhierarchies` (
  `awardHie_id` int(11) NOT NULL AUTO_INCREMENT,
  `awardHie_descr` varchar(255) DEFAULT NULL,
  `awardHie_name` varchar(255) DEFAULT NULL,
  `awardHie_standard_award_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardHie_id`),
  KEY `FK_6944amw08hyd5a7bp8tgsyqsr` (`awardHie_standard_award_id`),
  CONSTRAINT `FK_6944amw08hyd5a7bp8tgsyqsr` FOREIGN KEY (`awardHie_standard_award_id`) REFERENCES `cm_awardstandards` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_awardhierarchies
-- ----------------------------
INSERT INTO `cm_awardhierarchies` VALUES ('1', '团体赛', '国际竞赛一等奖（最高奖）', '1');
INSERT INTO `cm_awardhierarchies` VALUES ('2', '个人赛', '国际竞赛一等奖（最高奖）', '2');
INSERT INTO `cm_awardhierarchies` VALUES ('3', '团体赛', '国际竞赛二等奖', '3');
INSERT INTO `cm_awardhierarchies` VALUES ('4', '个人赛', '国际竞赛二等奖', '4');
INSERT INTO `cm_awardhierarchies` VALUES ('5', '团体赛', '国家级竞赛一等奖（最高奖）', '3');
INSERT INTO `cm_awardhierarchies` VALUES ('6', '个人赛', '国家级竞赛一等奖（最高奖）', '4');
INSERT INTO `cm_awardhierarchies` VALUES ('7', '团体赛', '国际竞赛三等奖', '5');
INSERT INTO `cm_awardhierarchies` VALUES ('8', '个人赛', '国际竞赛三等奖', '6');
INSERT INTO `cm_awardhierarchies` VALUES ('9', '团体赛', '国家级竞赛二等奖', '5');
INSERT INTO `cm_awardhierarchies` VALUES ('10', '个人赛', '国家级竞赛二等奖', '6');
INSERT INTO `cm_awardhierarchies` VALUES ('11', '团体赛', '国家级竞赛三等奖', '7');
INSERT INTO `cm_awardhierarchies` VALUES ('12', '个人赛', '国家级竞赛三等奖', '8');
INSERT INTO `cm_awardhierarchies` VALUES ('13', '团体赛', '省部级竞赛一等奖（最高奖）', '7');
INSERT INTO `cm_awardhierarchies` VALUES ('14', '个人赛', '省部级竞赛一等奖（最高奖）', '8');
INSERT INTO `cm_awardhierarchies` VALUES ('15', '团体赛', '省部级竞赛二等奖', '9');
INSERT INTO `cm_awardhierarchies` VALUES ('16', '个人赛', '省部级竞赛二等奖', '10');
INSERT INTO `cm_awardhierarchies` VALUES ('17', '团体赛', '校级学科竞赛一等奖（最高奖）', '11');
INSERT INTO `cm_awardhierarchies` VALUES ('18', '个人赛', '校级学科竞赛一等奖（最高奖）', '12');
INSERT INTO `cm_awardhierarchies` VALUES ('19', '团体赛', '省部级竞赛三等奖', '13');
INSERT INTO `cm_awardhierarchies` VALUES ('20', '个人赛', '省部级竞赛三等奖', '14');
INSERT INTO `cm_awardhierarchies` VALUES ('21', '团体赛', '校级学科竞赛二等奖', '13');
INSERT INTO `cm_awardhierarchies` VALUES ('22', '个人赛', '校级学科竞赛二等奖', '14');
INSERT INTO `cm_awardhierarchies` VALUES ('26', '个人赛', '未获奖', '15');
INSERT INTO `cm_awardhierarchies` VALUES ('27', '团体赛', '未获奖', '15');
INSERT INTO `cm_awardhierarchies` VALUES ('29', 'null', '国际奖', null);
INSERT INTO `cm_awardhierarchies` VALUES ('30', '', '全国奖', '15');
INSERT INTO `cm_awardhierarchies` VALUES ('31', '', '省级奖', '1');
INSERT INTO `cm_awardhierarchies` VALUES ('32', '', '校级奖', '1');

-- ----------------------------
-- Table structure for cm_awardrecords
-- ----------------------------
DROP TABLE IF EXISTS `cm_awardrecords`;
CREATE TABLE `cm_awardrecords` (
  `awardRecor_id` int(11) NOT NULL AUTO_INCREMENT,
  `awardRecor_coachTeacher` varchar(255) DEFAULT NULL,
  `awardRecor_manager` int(11) DEFAULT NULL,
  `awardRecor_picturePath` varchar(255) DEFAULT NULL,
  `awardRecor_reason` varchar(255) DEFAULT NULL,
  `awardRecor_score` int(11) DEFAULT NULL,
  `awardRecor_status` int(11) DEFAULT NULL,
  `awardRecor_stuMoney` varchar(255) DEFAULT NULL,
  `awardRecor_teaMoney` varchar(255) DEFAULT NULL,
  `awardRecor_team` varchar(255) DEFAULT NULL,
  `awardRecor_time` datetime DEFAULT NULL,
  `awardRecor_unit` varchar(255) DEFAULT NULL,
  `awardRecor_awadHie_awardHie_id` int(11) DEFAULT NULL,
  `awardRecor_competition_compe_id` int(11) DEFAULT NULL,
  `awardRecor_signUp_signUp_id` int(11) DEFAULT NULL,
  `awardRecor_student_stu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardRecor_id`),
  KEY `FK_2lowgxgdgbpm15su17s42yo6o` (`awardRecor_awadHie_awardHie_id`),
  KEY `FK_9wuypiigrtkft3unru2dsmxd6` (`awardRecor_competition_compe_id`),
  KEY `FK_4uwxm1866lncwfus3gwpka0wo` (`awardRecor_signUp_signUp_id`),
  KEY `FK_c3m2t5a1wngkvne4oxlbwk3is` (`awardRecor_student_stu_id`),
  CONSTRAINT `FK_2lowgxgdgbpm15su17s42yo6o` FOREIGN KEY (`awardRecor_awadHie_awardHie_id`) REFERENCES `cm_awardhierarchies` (`awardHie_id`),
  CONSTRAINT `FK_4uwxm1866lncwfus3gwpka0wo` FOREIGN KEY (`awardRecor_signUp_signUp_id`) REFERENCES `cm_signups` (`signUp_id`),
  CONSTRAINT `FK_9wuypiigrtkft3unru2dsmxd6` FOREIGN KEY (`awardRecor_competition_compe_id`) REFERENCES `cm_competitions` (`compe_id`),
  CONSTRAINT `FK_c3m2t5a1wngkvne4oxlbwk3is` FOREIGN KEY (`awardRecor_student_stu_id`) REFERENCES `cm_students` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_awardrecords
-- ----------------------------
INSERT INTO `cm_awardrecords` VALUES ('1', '李士勇', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '0', '0', null, '2016-10-02 00:00:00', '无', '26', '1', '1', '1');
INSERT INTO `cm_awardrecords` VALUES ('2', '李士勇', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '0', '0', null, '2016-10-02 00:00:00', '无', '26', '1', '2', '2');
INSERT INTO `cm_awardrecords` VALUES ('3', '李士勇', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '2', '4', '500', '1000', null, '2016-10-02 00:00:00', '河南科技学院信息工程学院学院办公室515', '14', '1', '3', '3');
INSERT INTO `cm_awardrecords` VALUES ('4', '吕莹莹', null, 'UploadFile/_75562682-d56f-4970-bb9a-af4b9577a188.png', null, '2', '1', '500', '1000', null, '2016-10-02 00:00:00', '河南科技学院信息工程学院学院办公室515', '14', '1', '4', '5');
INSERT INTO `cm_awardrecords` VALUES ('5', '王建平', null, 'UploadFile/_75562682-d56f-4970-bb9a-af4b9577a188.png', null, '1', '1', '100', '200', null, '2016-10-02 00:00:00', '河南科技学院信息工程学院学院办公室515', '20', '1', '5', '6');
INSERT INTO `cm_awardrecords` VALUES ('6', '李士勇', null, 'UploadFile/_75562682-d56f-4970-bb9a-af4b9577a188.png', null, '3', '1', '3000', '6000', null, '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '2', '1', '3', '3');
INSERT INTO `cm_awardrecords` VALUES ('7', '吕莹莹', null, 'UploadFile/_6a36b175-689e-456e-a8f4-a48a3a34031b.png', null, '1', '4', '0', '0', null, '2016-10-02 00:00:00', '无', '26', '1', '4', '5');
INSERT INTO `cm_awardrecords` VALUES ('8', '华老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '3', '4', '500', '1000', null, '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '14', '3', '6', '1');
INSERT INTO `cm_awardrecords` VALUES ('9', '实根老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '0', '0', null, '2016-10-02 16:39:03', '河南省新乡市红旗区河南科技学院', '26', '3', '7', '2');
INSERT INTO `cm_awardrecords` VALUES ('10', '刘老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '2', '4', '500', '1000', null, '2016-10-02 16:39:36', '河南省新乡市红旗区河南科技学院', '14', '3', '8', '3');
INSERT INTO `cm_awardrecords` VALUES ('11', '牛老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '300', '500', null, '2016-10-02 16:39:50', '河南省新乡市红旗区河南科技学院', '16', '3', '9', '4');
INSERT INTO `cm_awardrecords` VALUES ('12', '范老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '2', '1', '100', '200', null, '2016-10-02 16:39:57', '河南省新乡市红旗区河南科技学院', '20', '3', '10', '5');
INSERT INTO `cm_awardrecords` VALUES ('13', '帅老师', '1', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '2', '1', '1000', '2000', '天下无敌', '2016-10-02 16:40:19', '河南省新乡市红旗区河南科技学院', '13', '2', '12', '7');
INSERT INTO `cm_awardrecords` VALUES ('14', '帅老师', '0', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '1000', '2000', '天下无敌', '2016-10-02 16:40:29', '河南省新乡市红旗区河南科技学院', '13', '2', '11', '6');
INSERT INTO `cm_awardrecords` VALUES ('15', '宋老师', '1', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '0', '0', '伐木累', '2016-10-02 00:00:00', '无', '27', '2', '13', '8');
INSERT INTO `cm_awardrecords` VALUES ('16', '宋老师', '0', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '1', '0', '0', '伐木累', '2016-10-02 00:00:00', '无', '27', '2', '14', '9');
INSERT INTO `cm_awardrecords` VALUES ('17', '财路组合', '1', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '300', '500', '组合', '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '17', '4', '19', '14');
INSERT INTO `cm_awardrecords` VALUES ('18', '财路组合', '0', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '300', '500', '组合', '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '17', '4', '20', '15');
INSERT INTO `cm_awardrecords` VALUES ('19', '雪老师', '1', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '200', '300', '天下无敌2', '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '21', '4', '17', '12');
INSERT INTO `cm_awardrecords` VALUES ('20', '雪老师', '0', 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '200', '300', '天下无敌2', '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '21', '4', '18', '13');
INSERT INTO `cm_awardrecords` VALUES ('21', '丁老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '200', '300', null, '2016-10-02 00:00:00', '河南省新乡市红旗区河南科技学院', '18', '4', '15', '10');
INSERT INTO `cm_awardrecords` VALUES ('22', '黄老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '1', '2', '0', '0', null, '2016-10-02 00:00:00', '无', '26', '4', '16', '11');
INSERT INTO `cm_awardrecords` VALUES ('23', '刘老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '3', '1', '800', '1500', null, '2016-10-02 00:00:00', '123123123123', '10', '3', '8', '3');
INSERT INTO `cm_awardrecords` VALUES ('24', '华老师', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '3', '1', '500', '1000', null, '2016-10-02 00:00:00', '123123123', '12', '3', '6', '1');
INSERT INTO `cm_awardrecords` VALUES ('25', '12', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '0', '1', '0', '0', null, '2016-10-03 08:32:41', null, '26', '5', '21', '17');
INSERT INTO `cm_awardrecords` VALUES ('26', '123', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '0', '1', '0', '0', null, '2016-10-03 08:32:46', null, '26', '5', '22', '18');
INSERT INTO `cm_awardrecords` VALUES ('27', '12', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '0', '1', '0', '0', null, '2016-10-03 00:00:00', '无', '26', '5', '23', '20');
INSERT INTO `cm_awardrecords` VALUES ('28', '高国红', null, 'UploadFile/_54bc7eff-b346-4d9f-ac4a-16e8f0d1af3e.jpg', null, '10', '1', '3000', '6000', null, '2016-10-03 00:00:00', 'bng', '2', '5', '26', '2');
INSERT INTO `cm_awardrecords` VALUES ('29', '刘阳老师', null, 'UploadFile/_75562682-d56f-4970-bb9a-af4b9577a188.png', null, '1', '1', '500', '1000', null, '2016-10-03 00:00:00', '河南科技学院信息工程学院未来小组', '15', '14', '31', '3');
INSERT INTO `cm_awardrecords` VALUES ('30', '实根老师', null, 'UploadFile/_6ce2fe20-82cd-4482-b63c-1af6ddc529f2.jpg', null, '1', '1', '500', '1000', null, '2016-10-03 00:00:00', '河南科技学院信息工程学院未来小组', '14', '14', '30', '2');
INSERT INTO `cm_awardrecords` VALUES ('31', '杜鹃老师', null, null, null, '0', '1', '0', '0', null, '2016-10-03 00:00:00', '无', '26', '14', '29', '1');
INSERT INTO `cm_awardrecords` VALUES ('32', '赵硕老师', '1', 'UploadFile/_3a5431de-2e85-4b3d-85cf-44676b606136.jpg', null, '1', '4', '1000', '2000', '天下无敌', '2016-10-03 00:00:00', '河南科技学院信息工程学院未来小组', '13', '14', '34', '7');
INSERT INTO `cm_awardrecords` VALUES ('33', '赵硕老师', '0', 'UploadFile/_2bc1481f-552d-4287-a036-91a2ad038f4e.jpg', null, '1', '4', '1000', '2000', '天下无敌', '2016-10-03 00:00:00', '20151554111', '13', '14', '35', '8');
INSERT INTO `cm_awardrecords` VALUES ('34', '凡阳老师', '1', null, null, '0', '1', '0', '0', 'love', '2016-10-03 00:00:00', '无', '27', '14', '32', '5');
INSERT INTO `cm_awardrecords` VALUES ('35', '凡阳老师', '0', null, null, '0', '1', '0', '0', 'love', '2016-10-03 00:00:00', '无', '27', '14', '33', '6');
INSERT INTO `cm_awardrecords` VALUES ('36', '赵硕老师', '1', 'UploadFile/_481c58c4-9b14-4673-a2b8-f3a17df9649b.jpeg', null, '2', '1', '1500', '3000', '天下无敌', '2016-10-03 00:00:00', '河南科技虚夜安', '5', '14', '34', '7');
INSERT INTO `cm_awardrecords` VALUES ('37', '赵硕老师', '0', 'UploadFile/_5e0e8926-9017-4317-92f4-ceaead29df53.jpg', null, '2', '1', '1000', '2000', '天下无敌', '2016-10-03 00:00:00', '20151554111', '5', '14', '35', '8');
INSERT INTO `cm_awardrecords` VALUES ('38', '实根老师', null, null, null, '0', '4', '0', '0', null, '2016-10-03 00:00:00', '无', '26', '14', '30', '2');
INSERT INTO `cm_awardrecords` VALUES ('39', '张小三', '1', 'UploadFile/_9b9038aa-e525-4b5c-ba4d-6f432019bfee.png', null, '5', '1', '300', '500', 'team', '2016-10-04 08:21:59', null, '17', '15', '36', '4');
INSERT INTO `cm_awardrecords` VALUES ('40', '张小三', '0', 'UploadFile/_b4c36ef0-7b93-435f-a8ef-4c5adbc1265f.png', null, '5', '1', '300', '500', 'team', '2016-10-04 08:22:08', null, '17', '15', '37', '15');
INSERT INTO `cm_awardrecords` VALUES ('41', '王魏老师', null, 'UploadFile/_d4cd04d1-bd7a-442c-8f67-947ccbc53220.png', null, '1', '1', '500', '1000', null, '2016-10-04 00:00:00', '123123123', '14', '16', '38', '13');
INSERT INTO `cm_awardrecords` VALUES ('42', '秋芳老师', '1', 'UploadFile/_9c9e7475-a3c4-4815-9030-b290802858ca.png', null, '1', '1', '1000', '2000', 'love111', '2016-10-04 00:00:00', '123123123', '13', '16', '39', '14');
INSERT INTO `cm_awardrecords` VALUES ('43', '秋芳老师', '0', 'UploadFile/_4e66838d-004d-4924-8137-518b86dc11bf.png', null, '1', '1', '1000', '2000', 'love111', '2016-10-04 00:00:00', '123123', '13', '16', '40', '16');
INSERT INTO `cm_awardrecords` VALUES ('44', '昭君老师1', null, 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '2', '4', '200', '300', null, '2016-10-04 00:00:00', '河南省新乡市河南科技学院信息工程学院', '18', '17', '41', '29');
INSERT INTO `cm_awardrecords` VALUES ('45', '秀娟老师', null, 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '0', '1', '0', '0', null, '2016-10-04 00:00:00', '河南省新乡市河南科技学院信息工程学院', '26', '17', '42', '28');
INSERT INTO `cm_awardrecords` VALUES ('46', '亚非老师', null, 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '0', '1', '0', '0', null, '2016-10-04 00:00:00', '河南省新乡市河南科技学院信息工程学院', '26', '17', '43', '27');
INSERT INTO `cm_awardrecords` VALUES ('47', '白老师', '1', 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '1', '4', '300', '500', '环境美化', '2016-10-04 00:00:00', '河南省新乡市河南科技学院信息工程学院', '17', '17', '44', '26');
INSERT INTO `cm_awardrecords` VALUES ('48', '白老师', '0', 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '1', '4', '300', '500', '环境美化', '2016-10-04 00:00:00', '河南省新乡市河南科技学院信息工程学院', '17', '17', '45', '25');
INSERT INTO `cm_awardrecords` VALUES ('49', '王老师', '1', null, null, '0', '1', '0', '0', '团队无敌', '2016-10-04 00:00:00', '无', '27', '17', '46', '24');
INSERT INTO `cm_awardrecords` VALUES ('50', '王老师', '0', null, null, '0', '1', '0', '0', '团队无敌', '2016-10-04 00:00:00', '无', '27', '17', '47', '23');
INSERT INTO `cm_awardrecords` VALUES ('51', '白老师', '1', 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '1', '1', '1500', '3000', '环境美化', '2016-10-05 00:00:00', '河南省新乡市河南科技学院信息工程学院', '9', '17', '44', '26');
INSERT INTO `cm_awardrecords` VALUES ('52', '白老师', '0', 'UploadFile/_25165c46-c057-4f66-8436-637325602b36.jpg', null, '1', '1', '1500', '3000', '环境美化', '2016-10-05 00:00:00', '', '7', '17', '45', '25');
INSERT INTO `cm_awardrecords` VALUES ('53', '昭君老师1', null, 'UploadFile/_6a36b175-689e-456e-a8f4-a48a3a34031b.png', null, '1', '1', '500', '1000', null, '2016-10-05 00:00:00', '', '14', '17', '41', '29');

-- ----------------------------
-- Table structure for cm_awardstandards
-- ----------------------------
DROP TABLE IF EXISTS `cm_awardstandards`;
CREATE TABLE `cm_awardstandards` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT,
  `award_stuMoney` varchar(255) DEFAULT NULL,
  `award_teaMoney` varchar(255) DEFAULT NULL,
  `award_type` varchar(255) DEFAULT NULL,
  `award_awardHierarchy_awardHie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`award_id`),
  KEY `FK_b32pibij99cata5q2w8bq55km` (`award_awardHierarchy_awardHie_id`),
  CONSTRAINT `FK_b32pibij99cata5q2w8bq55km` FOREIGN KEY (`award_awardHierarchy_awardHie_id`) REFERENCES `cm_awardhierarchies` (`awardHie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_awardstandards
-- ----------------------------
INSERT INTO `cm_awardstandards` VALUES ('1', '5000', '10000', '团体赛（国际竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('2', '3000', '6000', '个人赛（国际竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('3', '3000', '6000', '团体赛（国际竞赛二等奖、国家级竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('4', '1500', '3000', '个人赛（国际竞赛二等奖、国际竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('5', '1500', '3000', '团体赛（国际竞赛三等奖、国家级竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('6', '800', '1500', '个人赛（国际竞赛三等奖、国家级竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('7', '1000', '2000', '团体赛（国家级竞赛三等奖、省部级竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('8', '500', '1000', '个人赛（国家级竞赛三等奖、省部级竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('9', '600', '1000', '团体赛(省部级竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('10', '300', '500', '个人赛(省部级竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('11', '300', '500', '团体赛（校级学科竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('12', '200', '300', '个人赛（校级学科竞赛一等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('13', '200', '300', '团队赛（省部级竞赛三等奖、校级学科竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('14', '100', '200', '个人赛（省部级竞赛三等奖、校级学科竞赛二等奖）', null);
INSERT INTO `cm_awardstandards` VALUES ('15', '0', '0', '未获奖', null);

-- ----------------------------
-- Table structure for cm_competitionhierarchies
-- ----------------------------
DROP TABLE IF EXISTS `cm_competitionhierarchies`;
CREATE TABLE `cm_competitionhierarchies` (
  `compeHie_id` int(11) NOT NULL AUTO_INCREMENT,
  `compeHie_descr` varchar(255) DEFAULT NULL,
  `compeHie_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`compeHie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_competitionhierarchies
-- ----------------------------
INSERT INTO `cm_competitionhierarchies` VALUES ('1', '', '国家级');
INSERT INTO `cm_competitionhierarchies` VALUES ('2', null, '省级');
INSERT INTO `cm_competitionhierarchies` VALUES ('3', '', '校级');

-- ----------------------------
-- Table structure for cm_competitionnames
-- ----------------------------
DROP TABLE IF EXISTS `cm_competitionnames`;
CREATE TABLE `cm_competitionnames` (
  `compeName_id` int(11) NOT NULL AUTO_INCREMENT,
  `compeName_descr` varchar(255) DEFAULT NULL,
  `compeName_name` varchar(255) DEFAULT NULL,
  `compeName_reason` varchar(255) DEFAULT NULL,
  `compeName_status` varchar(255) DEFAULT NULL,
  `compeName_compeHierarchy_compeHie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`compeName_id`),
  KEY `FK_r70g2wn3hma69mxrxik03mdxf` (`compeName_compeHierarchy_compeHie_id`),
  CONSTRAINT `FK_r70g2wn3hma69mxrxik03mdxf` FOREIGN KEY (`compeName_compeHierarchy_compeHie_id`) REFERENCES `cm_competitionhierarchies` (`compeHie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_competitionnames
-- ----------------------------
INSERT INTO `cm_competitionnames` VALUES ('1', '蓝桥杯全国软件和信息技术专业人才大赛是一个面向全国大学生的专业性学科年度赛事。大赛本着“立足行业、突出实践、广泛参与、促进就业”的宗旨，着力于为行业提供公正、科学的全国性信息技术人才选拔和培养平台，培养和提升当代大学生的创新和实践能力。\r\n蓝桥杯大赛是全国规模最大的专业赛事，包括北大、清华等在内的全国31个省市自治区1200多所院校参加，每年参赛人数超过30000人。', '蓝桥杯', null, '2', '1');
INSERT INTO `cm_competitionnames` VALUES ('2', '欢迎参加世界上规模最大的数学建模竞赛 -- 一次参赛，终生受益！', '数学建模', null, '2', '2');
INSERT INTO `cm_competitionnames` VALUES ('3', '机器人大赛是各种关于机器人比赛的总称，大致包括机器人足球赛、灭火竞赛和综合竞赛。中国机器人大赛，一般是在上世纪末兴起的。在短短七、八年的时间里，机器人大赛的发展是一', '机器人大赛', null, '2', '2');
INSERT INTO `cm_competitionnames` VALUES ('4', '蓝桥杯竞赛。', '蓝桥杯1', '竞赛存在', '0', '2');
INSERT INTO `cm_competitionnames` VALUES ('5', '奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛', '奥林匹克数学竞赛', null, '2', '3');
INSERT INTO `cm_competitionnames` VALUES ('6', '1', '1', '看看能不能看到未通过原因', '0', '1');
INSERT INTO `cm_competitionnames` VALUES ('7', 'erghrthjntrjythjkmutkmyukmuyjjtuyjntyjnhyt6h65yh65tyhrt', 'ewtgfergttreg', null, '1', '3');
INSERT INTO `cm_competitionnames` VALUES ('8', '123', '123', null, '1', '1');
INSERT INTO `cm_competitionnames` VALUES ('9', '女女版', ' 你把vn', null, '1', '2');
INSERT INTO `cm_competitionnames` VALUES ('10', '额为更好地GV额外的价位高', '数学竞赛', null, '1', '3');
INSERT INTO `cm_competitionnames` VALUES ('11', 'retert', 'trgt', null, '1', '1');
INSERT INTO `cm_competitionnames` VALUES ('12', '1123123', '31231', null, '1', '1');
INSERT INTO `cm_competitionnames` VALUES ('13', 'qweqwe', 'eqweqwe', null, '1', '1');
INSERT INTO `cm_competitionnames` VALUES ('14', 'xcvxcv', 'xcvxcv', null, '1', '2');
INSERT INTO `cm_competitionnames` VALUES ('15', 'xcvxcv', 'xcvxcv', null, '1', '2');
INSERT INTO `cm_competitionnames` VALUES ('16', 'rtyhujni', 'ybhbh', null, '1', '1');
INSERT INTO `cm_competitionnames` VALUES ('17', '第二届食品大赛即将开始~~~', '食品大赛', null, '2', '2');
INSERT INTO `cm_competitionnames` VALUES ('18', 'asdadadas', 'Acm团队赛', null, '2', '3');
INSERT INTO `cm_competitionnames` VALUES ('19', '测试测试测试测试测试', '测试竞赛第二阶段', null, '2', '2');
INSERT INTO `cm_competitionnames` VALUES ('20', '全国大学生节能减排社会实践与科技竞赛是由教育部高等教育司主办、唯一由高等教育司办公室主抓的全国大学生学科竞赛。该竞赛充分体现了“节能减排、绿色能源”的主题，紧密围绕国家能源与环境政策，紧密结合国家重大需求，在教育部的直接领导和广大高校的积极协作下，起点高、规模大、精品多，覆盖面广，是一项具有导向性、示范性和群众性的全国大学生竞赛，得到了各省教育厅、各高校的高度重视。本活动每年举办一次。', '节能减排', null, '2', '3');
INSERT INTO `cm_competitionnames` VALUES ('21', '最后测试个人竞赛完整流程。', '测试个人', null, '2', '3');

-- ----------------------------
-- Table structure for cm_competitions
-- ----------------------------
DROP TABLE IF EXISTS `cm_competitions`;
CREATE TABLE `cm_competitions` (
  `compe_id` int(11) NOT NULL AUTO_INCREMENT,
  `compe_digest` varchar(255) DEFAULT NULL,
  `compe_endTime` datetime DEFAULT NULL,
  `compe_manager` varchar(255) DEFAULT NULL,
  `compe_money` varchar(255) DEFAULT NULL,
  `compe_nextClassGroup` int(11) DEFAULT NULL,
  `compe_nextClassPerson` int(11) DEFAULT NULL,
  `compe_program` varchar(255) DEFAULT NULL,
  `compe_reason` varchar(255) DEFAULT NULL,
  `compe_requestDate` datetime DEFAULT NULL,
  `compe_startTime` datetime DEFAULT NULL,
  `compe_status` int(11) DEFAULT NULL,
  `compe_type` int(11) DEFAULT NULL,
  `compe_compeName_compeName_id` int(11) DEFAULT NULL,
  `compe_department_de_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`compe_id`),
  KEY `FK_hnp8xnou43hgm80r7i41ews06` (`compe_compeName_compeName_id`),
  KEY `FK_63m4uclp9gp5uhf2kumms1mhd` (`compe_department_de_id`),
  CONSTRAINT `FK_63m4uclp9gp5uhf2kumms1mhd` FOREIGN KEY (`compe_department_de_id`) REFERENCES `cm_departments` (`de_id`),
  CONSTRAINT `FK_hnp8xnou43hgm80r7i41ews06` FOREIGN KEY (`compe_compeName_compeName_id`) REFERENCES `cm_competitionnames` (`compeName_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_competitions
-- ----------------------------
INSERT INTO `cm_competitions` VALUES ('1', '蓝桥社保（www.lanbaoshebao.com），是蓝桥为广大学子提供的就业后社保服务平台。社保平台以“互联网+”驱动，企业及个人用户通过网络以订单方式发出人事代理、档案、社保、公积金、商保等服务需求申请，全部社保业务在线完成，高效、便捷地进行社保业务处理。', '2016-10-01 00:00:00', '高国红', '3000', '-1', '18', '/UploadFile/蓝桥杯大赛竞赛方案_6db747be-02a0-47e8-9270-73c9fc06893a.docx', null, '2016-10-02 00:00:00', '2016-10-13 00:00:00', '3', '2', '1', '1');
INSERT INTO `cm_competitions` VALUES ('2', '数学建模比赛', '2016-10-01 00:00:00', '包东鹅', '3000', '17', '-1', '/UploadFile/面试_9aac16db-07f3-4b53-9c99-e95589d7f60f.docx', null, '2016-10-02 00:00:00', '2016-10-14 00:00:00', '3', '1', '2', '8');
INSERT INTO `cm_competitions` VALUES ('3', '奥数竞赛', '2016-10-01 00:00:00', '奥数老师', '3000', '-1', '18', '/UploadFile/流水记事_a7ce4ee5-185e-4c79-907f-f04457605f68.txt', null, '2016-09-25 00:00:00', '2016-10-12 00:00:00', '3', '2', '5', '8');
INSERT INTO `cm_competitions` VALUES ('4', '机器人大赛分为团队赛和个人赛，都是好的竞赛。', '2016-10-01 00:00:00', '白林峰', '3000', '17', '18', null, null, '2016-10-02 00:00:00', '2016-10-26 00:00:00', '3', '3', '3', '1');
INSERT INTO `cm_competitions` VALUES ('5', '1', '2016-09-27 00:00:00', '1', '1', '-1', '18', null, null, '2016-09-27 00:00:00', '2016-10-05 00:00:00', '2', '2', '2', '8');
INSERT INTO `cm_competitions` VALUES ('6', 'awsdcfewsfewrgfer5tg5r', '2016-10-10 00:00:00', 'rfsdbghtrdhty', 'ewgrertger', '-1', '-1', null, null, '2016-10-10 00:00:00', '2016-10-03 00:00:00', '2', '1', '2', '1');
INSERT INTO `cm_competitions` VALUES ('7', 'esfceswfgvregfver', '2016-10-19 00:00:00', 'qwrdfw3erd3ewrfd', 'sadfesfcw', '-1', '-1', '/UploadFile/使用说明_a712a27d-27f7-4dc7-874f-dd26dde9de26.txt', '123', '2016-10-09 00:00:00', '2016-10-04 00:00:00', '0', '1', '2', '1');
INSERT INTO `cm_competitions` VALUES ('8', '稳定风格', '2016-10-11 00:00:00', '地方', '3000', '-1', '-1', '/UploadFile/baidu_jgylogo3_eaa46d24-1909-4b4d-a45d-4e89e0786b8c.gif', '请输入未通过原因', '2016-10-10 00:00:00', '2016-10-03 00:00:00', '0', '2', '2', '8');
INSERT INTO `cm_competitions` VALUES ('9', 'ewrwetr', '2016-10-04 00:00:00', 'fet', '1213', '-1', '-1', '/UploadFile/1111_fbbe4b51-c2fc-4420-b6aa-4192df5c6b1f.png', null, '2016-10-03 00:00:00', '2016-10-03 00:00:00', '1', '2', '2', '8');
INSERT INTO `cm_competitions` VALUES ('10', '能不能上传附件？', '2016-10-15 00:00:00', '能不能上传附件？', '123123', '-1', '-1', '/UploadFile/aaaaaaaaaaaaa_1d3ff1c7-fe2a-4581-9893-1a0ee04c88ce.jpg', null, '2016-10-03 00:00:00', '2016-10-07 00:00:00', '1', '2', '2', '8');
INSERT INTO `cm_competitions` VALUES ('11', '俄方热吻退热贴如同跳太5图546英又6一', '2016-10-07 00:00:00', '大丈夫', '58', '-1', '-1', '/UploadFile/_a3b1fe5d-a9e8-4054-9f5d-a04b9b2f613f.txt', null, '2016-10-04 00:00:00', '2016-10-09 00:00:00', '1', '1', '3', '1');
INSERT INTO `cm_competitions` VALUES ('12', 'fhnu', '2016-10-04 00:00:00', 'tyy', 'tyn', '-1', '-1', '/UploadFile/_d159a1b2-6307-47c8-8816-a365d09d1c2f.sql', null, '2016-10-18 00:00:00', '2016-10-10 00:00:00', '1', '2', '1', '8');
INSERT INTO `cm_competitions` VALUES ('13', 'fhnu', '2016-10-04 00:00:00', 'tyy', 'tyn', '-1', '-1', '/UploadFile/_edcdb073-fc2c-4f10-974a-ae6e03bab3d7.docx', null, '2016-10-18 00:00:00', '2016-10-10 00:00:00', '1', '2', '1', '8');
INSERT INTO `cm_competitions` VALUES ('14', '食品大赛~~ ', '2016-10-01 00:00:00', '人凯迪', '3000', '5', '6', '/UploadFile/_2b9adb71-01ce-403a-adf2-8c37daff7811.txt', null, '2016-10-03 00:00:00', '2016-10-14 00:00:00', '2', '3', '17', '12');
INSERT INTO `cm_competitions` VALUES ('15', '2312313', '2016-10-01 00:00:00', '孙悟空', '500', '17', '-1', null, null, '2016-10-04 00:00:00', '2016-10-05 00:00:00', '2', '1', '18', '1');
INSERT INTO `cm_competitions` VALUES ('16', '123123', '2016-10-01 00:00:00', '测试第二阶段', '30000', '13', '14', null, null, '2016-10-04 00:00:00', '2016-10-14 00:00:00', '2', '3', '19', '12');
INSERT INTO `cm_competitions` VALUES ('17', '经过预赛、复赛的重重选拔，资环学院2011级、2012级本科生代表队突出重围，进入决赛。正方辩手就产业化带来的种种效益来陈述己方观点，反方则由产业化潜在的弊端进行反驳，申明“产业化是必由之路，但绝非‘唯一’目标”的立场。在随后的申辩环节，双方辩友以立论驳论相结合的方式，层层深入挖掘辩题，展开激烈交锋，引发场下观众阵阵掌声。接下来的自由辩论环节再一次将比赛气氛推入高潮，双方辩友你来我往，唇枪舌战。', '2016-10-01 00:00:00', '节能师', '3000', '13', '14', null, null, '2016-10-04 00:00:00', '2016-10-07 00:00:00', '2', '3', '20', '5');
INSERT INTO `cm_competitions` VALUES ('18', '最后测试个人竞赛完整流程。', '2016-10-16 00:00:00', '个人', '30000', '-1', '-1', '/UploadFile/_4e5b813a-d514-4673-8ec7-99f331cc59e4.docx', null, '2016-10-05 00:00:00', '2016-10-14 00:00:00', '2', '2', '21', '1');

-- ----------------------------
-- Table structure for cm_demanagers
-- ----------------------------
DROP TABLE IF EXISTS `cm_demanagers`;
CREATE TABLE `cm_demanagers` (
  `depM_id` int(11) NOT NULL AUTO_INCREMENT,
  `depM_name` varchar(255) DEFAULT NULL,
  `depM_num` varchar(255) DEFAULT NULL,
  `depM_password` varchar(255) DEFAULT NULL,
  `depM_phoneNum` varchar(255) DEFAULT NULL,
  `depM_sex` varchar(255) DEFAULT NULL,
  `depM_department_de_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`depM_id`),
  KEY `FK_p60r4lhxnc4rgc6md0lmg6tr4` (`depM_department_de_id`),
  CONSTRAINT `FK_p60r4lhxnc4rgc6md0lmg6tr4` FOREIGN KEY (`depM_department_de_id`) REFERENCES `cm_departments` (`de_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_demanagers
-- ----------------------------
INSERT INTO `cm_demanagers` VALUES ('1', '信工学院1', '101', '38b3eff8baf56627478ec76a704e9b52', '304011112', '男', '1');
INSERT INTO `cm_demanagers` VALUES ('2', '数学学院', '202', '854d6fae5ee42911677c739ee1734486', '3040112', '男', '8');
INSERT INTO `cm_demanagers` VALUES ('3', '生科学院', '303', '	11b9842e0a271ff252c1903e7132cd68', '3040113', '男', '3');
INSERT INTO `cm_demanagers` VALUES ('4', '食品学院', '404', '4f4adcbf8c6f66dcfc8a3282ac2bf10a', '3040114', '女', '12');
INSERT INTO `cm_demanagers` VALUES ('5', '资环学院', '505', 'e8c0653fea13f91bf3c48159f7c24f78', '3040115', '男', '5');

-- ----------------------------
-- Table structure for cm_departments
-- ----------------------------
DROP TABLE IF EXISTS `cm_departments`;
CREATE TABLE `cm_departments` (
  `de_id` int(11) NOT NULL AUTO_INCREMENT,
  `de_descr` varchar(255) DEFAULT NULL,
  `de_name` varchar(255) DEFAULT NULL,
  `de_depM_depM_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`de_id`),
  KEY `FK_d4vsycyv6oauwn7yqff1gdune` (`de_depM_depM_id`),
  CONSTRAINT `FK_d4vsycyv6oauwn7yqff1gdune` FOREIGN KEY (`de_depM_depM_id`) REFERENCES `cm_demanagers` (`depM_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_departments
-- ----------------------------
INSERT INTO `cm_departments` VALUES ('1', '信工学院', '信息工程学院', null);
INSERT INTO `cm_departments` VALUES ('2', '机电学院', '机电学院', null);
INSERT INTO `cm_departments` VALUES ('3', null, '生命科技学院', null);
INSERT INTO `cm_departments` VALUES ('4', null, '动物科技学院', null);
INSERT INTO `cm_departments` VALUES ('5', null, '资源与环境学院', null);
INSERT INTO `cm_departments` VALUES ('6', null, '软件学院', null);
INSERT INTO `cm_departments` VALUES ('7', null, '艺术学院', null);
INSERT INTO `cm_departments` VALUES ('8', null, '数学科学学院', null);
INSERT INTO `cm_departments` VALUES ('9', null, '体育学院', null);
INSERT INTO `cm_departments` VALUES ('10', null, '高等职业技术学院', null);
INSERT INTO `cm_departments` VALUES ('11', null, '经济与管理学院', null);
INSERT INTO `cm_departments` VALUES ('12', null, '食品学院', null);
INSERT INTO `cm_departments` VALUES ('13', null, '园艺园林学院', null);
INSERT INTO `cm_departments` VALUES ('15', null, '化学化工学院', null);
INSERT INTO `cm_departments` VALUES ('16', null, '教育科学学院', null);
INSERT INTO `cm_departments` VALUES ('17', null, '服装学院', null);
INSERT INTO `cm_departments` VALUES ('18', null, '外语学院', null);
INSERT INTO `cm_departments` VALUES ('19', null, '马克思主义教育学院', null);
INSERT INTO `cm_departments` VALUES ('20', null, '新科学院', null);

-- ----------------------------
-- Table structure for cm_notifications
-- ----------------------------
DROP TABLE IF EXISTS `cm_notifications`;
CREATE TABLE `cm_notifications` (
  `noti_id` int(11) NOT NULL AUTO_INCREMENT,
  `noti_content` varchar(255) DEFAULT NULL,
  `noti_time` datetime DEFAULT NULL,
  `noti_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_notifications
-- ----------------------------
INSERT INTO `cm_notifications` VALUES ('1', '<p>机器人大赛 机器人大赛是各种关于机器人比赛的总称，大致包括机器人足球赛、&hellip;&hellip; ，开始报名啦~~</p>\r\n', '2016-10-02 15:44:59', '机器人大赛开始报名了');
INSERT INTO `cm_notifications` VALUES ('2', '<p>欢迎参加世界上规模最大的数学建模竞赛 -- 一次参赛，终生受&hellip;&hellip;</p>\r\n', '2016-10-02 15:45:32', '数学建模大赛开始报名啦~~~');
INSERT INTO `cm_notifications` VALUES ('3', '<p>奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学竞赛奥林匹克数学&hellip;&hellip;</p>\r\n', '2016-10-02 15:45:54', '奥林扑克数学竞赛');
INSERT INTO `cm_notifications` VALUES ('4', '<p>第二届食品大赛开始啦~大家快来报名~~~~</p>\r\n', '2016-10-03 23:07:02', '第二届食品大赛开始啦~');
INSERT INTO `cm_notifications` VALUES ('5', '<p>资环学院大赛开始报名~资环学院大赛开始报名~资环学院大赛开始报名~</p>\r\n', '2016-10-04 21:10:59', '资环学院大赛开始报名~');

-- ----------------------------
-- Table structure for cm_signups
-- ----------------------------
DROP TABLE IF EXISTS `cm_signups`;
CREATE TABLE `cm_signups` (
  `signUp_id` int(11) NOT NULL AUTO_INCREMENT,
  `nextClass` int(11) DEFAULT NULL,
  `signUP_time` datetime DEFAULT NULL,
  `signUP_type` int(11) DEFAULT NULL,
  `signUp_registerRecord` int(11) DEFAULT NULL,
  `signUp_status` int(11) DEFAULT NULL,
  `signUp_teacher` varchar(255) DEFAULT NULL,
  `signUp_team` varchar(255) DEFAULT NULL,
  `singUp_manager` int(11) DEFAULT NULL,
  `singnup_type` int(11) DEFAULT NULL,
  `signUp_competition_compe_id` int(11) DEFAULT NULL,
  `signUp_student_stu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`signUp_id`),
  KEY `FK_df7n8lxnchbekslvatcrsklv0` (`signUp_competition_compe_id`),
  KEY `FK_8d6w4vwc18x0yr4y4akgbow7o` (`signUp_student_stu_id`),
  CONSTRAINT `FK_8d6w4vwc18x0yr4y4akgbow7o` FOREIGN KEY (`signUp_student_stu_id`) REFERENCES `cm_students` (`stu_id`),
  CONSTRAINT `FK_df7n8lxnchbekslvatcrsklv0` FOREIGN KEY (`signUp_competition_compe_id`) REFERENCES `cm_competitions` (`compe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_signups
-- ----------------------------
INSERT INTO `cm_signups` VALUES ('1', '1', '2016-10-02 00:23:17', null, '1', '2', '李士勇', null, null, '2', '1', '1');
INSERT INTO `cm_signups` VALUES ('2', '1', '2016-10-02 00:25:58', null, '1', '3', '李士勇', null, null, '2', '1', '2');
INSERT INTO `cm_signups` VALUES ('3', '1', '2016-10-02 00:26:23', null, '1', '2', '李士勇', null, null, '2', '1', '3');
INSERT INTO `cm_signups` VALUES ('4', '1', '2016-10-02 00:26:46', null, '1', '3', '吕莹莹', null, null, '2', '1', '5');
INSERT INTO `cm_signups` VALUES ('5', '1', '2016-10-02 00:27:19', null, '1', '3', '王建平', null, null, '2', '1', '6');
INSERT INTO `cm_signups` VALUES ('6', '1', '2016-10-02 16:12:27', null, '1', '2', '华老师', null, null, '2', '3', '1');
INSERT INTO `cm_signups` VALUES ('7', '1', '2016-10-02 16:13:04', null, '1', '2', '实根老师', null, null, '2', '3', '2');
INSERT INTO `cm_signups` VALUES ('8', '1', '2016-10-02 16:13:25', null, '1', '2', '刘老师', null, null, '2', '3', '3');
INSERT INTO `cm_signups` VALUES ('9', '1', '2016-10-02 16:13:53', null, '1', '2', '牛老师', null, null, '2', '3', '4');
INSERT INTO `cm_signups` VALUES ('10', '1', '2016-10-02 16:14:16', null, '1', '2', '范老师', null, null, '2', '3', '5');
INSERT INTO `cm_signups` VALUES ('11', '1', '2016-10-02 16:16:28', null, '1', '2', '帅老师', '天下无敌', '0', '1', '2', '6');
INSERT INTO `cm_signups` VALUES ('12', '1', '2016-10-02 16:16:28', null, '1', '2', '帅老师', '天下无敌', '1', '1', '2', '7');
INSERT INTO `cm_signups` VALUES ('13', '1', '2016-10-02 16:17:38', null, '1', '3', '宋老师', '伐木累', '1', '1', '2', '8');
INSERT INTO `cm_signups` VALUES ('14', '1', '2016-10-02 16:17:38', null, '1', '2', '宋老师', '伐木累', '0', '1', '2', '9');
INSERT INTO `cm_signups` VALUES ('15', '0', '2016-10-02 16:18:49', null, '0', '3', '丁老师', null, null, '2', '4', '10');
INSERT INTO `cm_signups` VALUES ('16', '1', '2016-10-02 16:19:25', null, '1', '3', '黄老师', null, null, '2', '4', '11');
INSERT INTO `cm_signups` VALUES ('17', '1', '2016-10-02 16:21:50', null, '1', '2', '雪老师', '天下无敌2', '1', '1', '4', '12');
INSERT INTO `cm_signups` VALUES ('18', '1', '2016-10-02 16:21:50', null, '1', '3', '雪老师', '天下无敌2', '0', '1', '4', '13');
INSERT INTO `cm_signups` VALUES ('19', '1', '2016-10-02 16:22:48', null, '1', '2', '财路组合', '组合', '1', '1', '4', '14');
INSERT INTO `cm_signups` VALUES ('20', '1', '2016-10-02 16:22:48', null, '1', '2', '财路组合', '组合', '0', '1', '4', '15');
INSERT INTO `cm_signups` VALUES ('21', '1', '2016-10-03 08:30:37', null, '1', '2', '12', null, null, '2', '5', '17');
INSERT INTO `cm_signups` VALUES ('22', '1', '2016-10-03 08:31:10', null, '1', '2', '123', null, null, '2', '5', '18');
INSERT INTO `cm_signups` VALUES ('23', '1', '2016-10-03 08:31:53', null, '1', '2', '12', null, null, '2', '5', '20');
INSERT INTO `cm_signups` VALUES ('24', null, '2016-10-03 08:34:17', null, '0', '1', '121212', null, null, '2', '5', '24');
INSERT INTO `cm_signups` VALUES ('25', null, '2016-10-03 08:38:09', null, '0', '1', '12', null, null, '2', '5', '26');
INSERT INTO `cm_signups` VALUES ('26', '1', '2016-10-03 11:00:10', null, '1', '2', '高国红', null, null, '2', '5', '2');
INSERT INTO `cm_signups` VALUES ('27', null, '2016-10-03 15:33:27', null, '0', '1', '耳题额头', null, null, '2', '1', '10');
INSERT INTO `cm_signups` VALUES ('28', null, '2016-10-03 15:34:31', null, '0', '1', '的我的', null, null, '2', '5', '10');
INSERT INTO `cm_signups` VALUES ('29', '1', '2016-10-03 23:07:58', null, '1', '2', '杜鹃老师', null, null, '2', '14', '1');
INSERT INTO `cm_signups` VALUES ('30', '1', '2016-10-03 23:08:51', null, '1', '2', '实根老师', null, null, '2', '14', '2');
INSERT INTO `cm_signups` VALUES ('31', '1', '2016-10-03 23:09:27', null, '1', '2', '刘阳老师', null, null, '2', '14', '3');
INSERT INTO `cm_signups` VALUES ('32', '1', '2016-10-03 23:10:49', null, '1', '2', '凡阳老师', 'love', '1', '1', '14', '5');
INSERT INTO `cm_signups` VALUES ('33', '1', '2016-10-03 23:10:49', null, '1', '2', '凡阳老师', 'love', '0', '1', '14', '6');
INSERT INTO `cm_signups` VALUES ('34', '1', '2016-10-03 23:12:22', null, '1', '2', '赵硕老师', '天下无敌', '1', '1', '14', '7');
INSERT INTO `cm_signups` VALUES ('35', '1', '2016-10-03 23:12:22', null, '1', '2', '赵硕老师', '天下无敌', '0', '1', '14', '8');
INSERT INTO `cm_signups` VALUES ('36', '0', '2016-10-04 08:20:52', null, '0', '2', '张小三', 'team', '1', '1', '15', '4');
INSERT INTO `cm_signups` VALUES ('37', '0', '2016-10-04 08:20:52', null, '0', '2', '张小三', 'team', '0', '1', '15', '15');
INSERT INTO `cm_signups` VALUES ('38', '0', '2016-10-04 09:05:30', null, '0', '2', '王魏老师', null, null, '2', '16', '13');
INSERT INTO `cm_signups` VALUES ('39', '0', '2016-10-04 09:07:17', null, '0', '2', '秋芳老师', 'love111', '1', '1', '16', '14');
INSERT INTO `cm_signups` VALUES ('40', '0', '2016-10-04 09:07:17', null, '0', '2', '秋芳老师', 'love111', '0', '1', '16', '16');
INSERT INTO `cm_signups` VALUES ('41', '1', '2016-10-04 00:00:00', null, '1', '2', '昭君老师1', null, null, '2', '17', '29');
INSERT INTO `cm_signups` VALUES ('42', '1', '2016-10-04 21:14:13', null, '1', '3', '秀娟老师', null, null, '2', '17', '28');
INSERT INTO `cm_signups` VALUES ('43', '1', '2016-10-04 21:14:37', null, '1', '3', '亚非老师', null, null, '2', '17', '27');
INSERT INTO `cm_signups` VALUES ('44', '1', '2016-10-04 21:16:24', null, '1', '2', '白老师', '环境美化', '1', '1', '17', '26');
INSERT INTO `cm_signups` VALUES ('45', '1', '2016-10-04 21:16:24', null, '1', '2', '白老师', '环境美化', '0', '1', '17', '25');
INSERT INTO `cm_signups` VALUES ('46', '1', '2016-10-04 21:17:55', null, '1', '2', '王老师', '团队无敌', '1', '1', '17', '24');
INSERT INTO `cm_signups` VALUES ('47', '1', '2016-10-04 21:17:55', null, '1', '2', '王老师', '团队无敌', '0', '1', '17', '23');

-- ----------------------------
-- Table structure for cm_students
-- ----------------------------
DROP TABLE IF EXISTS `cm_students`;
CREATE TABLE `cm_students` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_class` varchar(255) DEFAULT NULL,
  `stu_grade` varchar(255) DEFAULT NULL,
  `stu_idCard` varchar(255) DEFAULT NULL,
  `stu_major` varchar(255) DEFAULT NULL,
  `stu_name` varchar(255) DEFAULT NULL,
  `stu_num` varchar(255) DEFAULT NULL,
  `stu_password` varchar(255) DEFAULT NULL,
  `stu_phone` varchar(255) DEFAULT NULL,
  `stu_sex` varchar(255) DEFAULT NULL,
  `stu_department_de_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FK_qc1us9kxmyw7puvpitwfs8soy` (`stu_department_de_id`),
  CONSTRAINT `FK_qc1us9kxmyw7puvpitwfs8soy` FOREIGN KEY (`stu_department_de_id`) REFERENCES `cm_departments` (`de_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_students
-- ----------------------------
INSERT INTO `cm_students` VALUES ('1', '教育151', '2014级', '410822199511263000', '教育科学技术', '刘杜娟', '20141515302', '1f61c344a7cb5a0c9b92aea130dd6322', '15560236959', '女', '7');
INSERT INTO `cm_students` VALUES ('2', '计科131', '2013级', '410822199511263000', '计算机科学与技术', '王石根', '20131514111', '82ca1dcd4ee9008ba403d251a5dae724', '15560236959', '男', '1');
INSERT INTO `cm_students` VALUES ('3', '计科143', '2014级', '410822199511263001', '计算机科学与技术', '刘阳阳1', '20141515306', '202cb962ac59075b964b07152d234b70', '15560236959', '男', '1');
INSERT INTO `cm_students` VALUES ('4', '物联152', '2014', 'fbgfdbfd', '计算机科学与技术', 'gfdgfdghfd', '20141554203', 'af46dce5b7fa2471f72098b4791f8b80', '15237312815', '男', '5');
INSERT INTO `cm_students` VALUES ('5', '物联131', '2011级', '410822199511263003', '计算机科学与技术', '凡羊羊', '20131554119', '0a3850a61604fe71ed54eabc3671408f', '15560236959', '男', '5');
INSERT INTO `cm_students` VALUES ('6', '计科131 ', '2010级', '410822199511263000', '计算机科学与技术', '时帅帅', '20131514116', '4195f708cb0fd1f95dca005b25195026', '15560236959', '男', '5');
INSERT INTO `cm_students` VALUES ('7', '信工141', '2014级', '410822199511263000', '计算机科学与技术', '赵硕', '20141524112', '1d382b02e858a21341abd75f8fe69208', '15560236959', '男', '5');
INSERT INTO `cm_students` VALUES ('8', '物联151', '2014级', '410822199511263000', '计算机科学与技术', '宋民举', '20151554111', 'f710c4b97c352d36395c01c5407ba13f', '15560236959', '男', '5');
INSERT INTO `cm_students` VALUES ('9', '计科151', '2014级', '410822199511263000', '计算机科学与技术', '焦祥宇', '20151514109', '6a7e8eb40d1e990fea5075a66b978286', '15560236959', '男', '1');
INSERT INTO `cm_students` VALUES ('10', '计科151', '2014级', '410822199511263000', '计算机科学与技术', '丁赵雷', '20151514110', '230b5d846c258db2cb2f87a1d567cd2a', '18233333333', '男', '1');
INSERT INTO `cm_students` VALUES ('11', '物联131', '2014级', '410822199511263000', '教育科学技术', '黄佳佳', '20131554120', '132b30d164ce8f3bba5b05aac94e262c', '15560236959', '男', '3');
INSERT INTO `cm_students` VALUES ('12', '计科141', '2014级', '410822199511263000', '计算机科学与技术', '张雪', '20141514129', '0eb303db160f7f10a43468fc316e2006', '15560236959', '女', '1');
INSERT INTO `cm_students` VALUES ('13', '计科142', '2014级', '410822199511263000', '教育科学技术', '王伟', '20141514207', '795a0d134de97d11d49fb8ddbd753587', '15560236959', '男', '1');
INSERT INTO `cm_students` VALUES ('14', '计科142', '2014级', '410822199511263000', '计算机科学与技术', '彩秋放', '20141514216', 'c1c229f1ecb2c928472198dba885184b', '15560236959', '男', '3');
INSERT INTO `cm_students` VALUES ('15', '物联141', '2014级', '410822199511263000', '计算机科学与技术', '卢保', '20141554123', 'a7c0401ba2f8905c8bec284dd110c2fe', '15237312825', '男', '3');
INSERT INTO `cm_students` VALUES ('16', '物联151', '2014级', '410822199511263000', '教育科学技术', '高猛', '20151554114', '7b9404bfe3d7dab2245d9e17a4d59b77', '15560236959', '男', '1');
INSERT INTO `cm_students` VALUES ('17', '计科152', '2014级', '410822199511263000', '计算机科学与技术', '陈宗远', '20151514213', '830b87158cdcfa77b506d6ad27036c2d', '155212222222', '男', '1');
INSERT INTO `cm_students` VALUES ('18', '信工131', '2014级', '410822199511263000', '计算机科学与技术', '宋子庆', '20131524108', 'a670936b094067752fb0f1d84fcca14f', '123', '男', '2');
INSERT INTO `cm_students` VALUES ('19', '计科141', '2014级', '410822199511263000', '教育科学技术', '韩健健', '2014210111', '24cdc504941fef11a47d170452ac4f00', null, '男', '3');
INSERT INTO `cm_students` VALUES ('20', '计科141', '2014级', '410822199511263000', '计算机科学与技术', '刘国坤', '20140724211', '853e7de169e6819c9117a686aae228e9', '12121', '男', '9');
INSERT INTO `cm_students` VALUES ('21', '计科151', '2014级', '410822199511263000', '计算机科学与技术', '倪露露', '20151514101', 'd716d7b29a46bd7dae6ed42635f858ca', null, '女', '10');
INSERT INTO `cm_students` VALUES ('22', '计科131', '2014级', '410822199511263000', '计算机科学与技术', '张梦鸽', '20131514125', '17d679d31890e4856abb2c56f9133ad8', null, '女', '8');
INSERT INTO `cm_students` VALUES ('23', '物联131', '2014级', '410822199511263000', '计算机科学与技术', '廖  红', '20131554128', '2ac04e23599e0dad4f1f64cd173347b7', '15560236959', '女', '8');
INSERT INTO `cm_students` VALUES ('24', '计科134', '2014级', '410822199511263000', '计算机科学与技术', '王孟鸽', '20131515216', '63110af002886624b8954d23f806be65', '15560236959', '女', '8');
INSERT INTO `cm_students` VALUES ('25', '产品131', '2014级', '410822199511263000', '艺术学院', '李智', '20130494126', '6c45093ba451c5ed41c43aba0916206c', '15560236959', '女', '8');
INSERT INTO `cm_students` VALUES ('26', '教育151', '2014级', '410822199511263000', '教育科学技术', '白瑞娟', '20151534104', '5de02b7a099d1e1bfc05b7f476c6ace1', '15560236959', '女', '7');
INSERT INTO `cm_students` VALUES ('27', '教育151', '2014级', '410822199511263000', '教育科学技术', '常亚飞', '20151534108', '5da987b3820735d458ab96c3ffa583cd', '15560236959', '女', '7');
INSERT INTO `cm_students` VALUES ('28', '计科153', '2014级', '410822199511263000', '教育科学技术', '尹秀娟', '20151515131', '920f0eb8399b8ab5745f503fb73ae8e7', '15560236959', '女', '15');
INSERT INTO `cm_students` VALUES ('29', '物联151', '2014级', '410822199511263000', '教育科学技术', '孙昭君', '20150124110', 'f32549220e89fe23db4330c295abc6ae', '15560236959', '女', '5');
