/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : music

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 20/09/2023 19:36:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `admin` VALUES (2, 'taliyah', 'E10ADC3949BA59ABBE56E057F20F883E');
INSERT INTO `admin` VALUES (3, 'heywmn', 'E10ADC3949BA59ABBE56E057F20F883E');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '收藏类型（0歌曲1歌单）',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '歌单id',
  `create_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (12, 14, 0, 12, NULL, NULL);
INSERT INTO `collect` VALUES (15, 14, 0, 57, NULL, '2021-03-17 12:11:35');
INSERT INTO `collect` VALUES (16, 14, 0, 59, NULL, '2021-03-17 12:12:06');
INSERT INTO `collect` VALUES (17, 14, 0, 58, NULL, '2021-03-17 12:12:33');
INSERT INTO `collect` VALUES (18, 14, 0, 44, NULL, '2021-03-22 10:34:11');
INSERT INTO `collect` VALUES (19, 14, 0, 40, NULL, '2021-03-22 10:34:16');
INSERT INTO `collect` VALUES (20, 14, 0, 29, NULL, '2021-03-22 10:34:20');
INSERT INTO `collect` VALUES (21, 14, 0, 36, NULL, '2021-03-22 10:34:44');
INSERT INTO `collect` VALUES (23, 14, 0, 71, NULL, '2021-03-22 16:11:17');
INSERT INTO `collect` VALUES (25, 14, 0, 65, NULL, '2021-03-24 14:51:12');
INSERT INTO `collect` VALUES (26, 14, 0, 72, NULL, '2021-04-01 11:07:49');
INSERT INTO `collect` VALUES (28, 28, 0, 59, NULL, '2021-04-01 13:11:31');
INSERT INTO `collect` VALUES (29, 28, 0, 29, NULL, '2021-04-01 13:11:48');
INSERT INTO `collect` VALUES (30, 28, 0, 56, NULL, '2021-04-01 13:12:05');
INSERT INTO `collect` VALUES (35, 30, 0, 4, NULL, '2021-04-05 16:10:46');
INSERT INTO `collect` VALUES (37, 14, 0, 78, NULL, '2021-04-05 23:58:41');
INSERT INTO `collect` VALUES (38, 14, 0, 47, NULL, '2021-04-06 16:13:02');
INSERT INTO `collect` VALUES (39, 14, 0, 77, NULL, '2021-04-06 16:13:09');
INSERT INTO `collect` VALUES (40, 14, 0, 76, NULL, '2021-04-08 15:20:41');
INSERT INTO `collect` VALUES (41, 29, 0, 4, NULL, '2021-04-09 04:01:59');
INSERT INTO `collect` VALUES (43, 32, 0, 59, NULL, '2021-04-20 09:39:46');
INSERT INTO `collect` VALUES (46, 35, 0, 31, NULL, '2021-04-22 05:52:37');
INSERT INTO `collect` VALUES (47, 36, 0, 56, NULL, '2021-04-23 11:44:30');
INSERT INTO `collect` VALUES (52, 35, 0, 68, NULL, '2021-04-24 11:45:15');
INSERT INTO `collect` VALUES (56, 37, 0, 53, NULL, '2021-04-28 09:42:46');
INSERT INTO `collect` VALUES (57, 14, 0, 81, NULL, '2021-04-30 09:25:33');
INSERT INTO `collect` VALUES (61, 38, 0, 29, NULL, '2021-05-20 16:09:59');
INSERT INTO `collect` VALUES (63, 45, 0, 37, NULL, '2021-05-21 16:43:24');
INSERT INTO `collect` VALUES (70, 48, 0, 82, NULL, '2021-05-24 13:55:07');
INSERT INTO `collect` VALUES (87, 52, 0, 73, NULL, '2021-05-26 13:44:14');
INSERT INTO `collect` VALUES (88, 52, 0, 29, NULL, '2021-05-26 13:52:36');
INSERT INTO `collect` VALUES (89, 54, 0, 82, NULL, '2021-05-27 16:32:34');
INSERT INTO `collect` VALUES (90, 54, 0, 59, NULL, '2021-05-27 16:32:38');
INSERT INTO `collect` VALUES (91, 54, 0, 29, NULL, '2021-05-27 16:32:43');
INSERT INTO `collect` VALUES (104, 62, 0, 40, NULL, '2021-12-16 18:18:58');
INSERT INTO `collect` VALUES (106, 1, 0, 76, NULL, '2022-03-16 11:18:43');
INSERT INTO `collect` VALUES (111, 65, 0, 60, NULL, '2022-03-19 20:18:28');
INSERT INTO `collect` VALUES (112, 71, 0, 81, NULL, '2022-03-19 23:38:46');
INSERT INTO `collect` VALUES (114, 40, 0, 4, NULL, '2022-03-20 00:30:30');
INSERT INTO `collect` VALUES (116, 40, 0, 29, NULL, '2022-03-20 00:35:37');
INSERT INTO `collect` VALUES (117, 40, 0, 80, NULL, '2022-03-20 00:50:59');
INSERT INTO `collect` VALUES (119, 40, 0, 72, NULL, '2022-03-20 00:51:06');
INSERT INTO `collect` VALUES (120, 40, 0, 78, NULL, '2022-03-20 00:51:11');
INSERT INTO `collect` VALUES (121, 69, 0, 61, NULL, '2022-03-20 13:32:58');
INSERT INTO `collect` VALUES (126, 75, 0, 29, NULL, '2022-03-22 11:44:21');
INSERT INTO `collect` VALUES (127, 77, 0, 76, NULL, '2022-03-22 22:52:06');
INSERT INTO `collect` VALUES (128, 79, 0, 12, NULL, '2022-03-24 20:43:18');
INSERT INTO `collect` VALUES (129, 80, 0, 35, NULL, '2022-03-28 20:13:18');
INSERT INTO `collect` VALUES (133, 85, 0, 76, NULL, '2022-03-31 15:58:26');
INSERT INTO `collect` VALUES (134, 85, 0, 84, NULL, '2022-03-31 15:58:29');
INSERT INTO `collect` VALUES (135, 85, 0, 56, NULL, '2022-03-31 15:58:31');
INSERT INTO `collect` VALUES (136, 73, 0, 65, NULL, '2022-04-04 23:51:42');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `consumer_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '收藏类型，0歌曲1歌单',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '歌单id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `create_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `up` int(11) NULL DEFAULT 0 COMMENT '评论点赞数',
  `audit` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核是否通过',
  `audited` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已审核，0:false, 1:true',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '歌曲评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, 7, 1, NULL, 2, '红红火火恍恍惚惚', '2021-03-15 15:50:07', 12, '通过', '1');
INSERT INTO `comment` VALUES (4, 14, 1, NULL, 2, '呱呱呱呱呱呱', '2021-03-15 15:50:07', 11, '通过', '1');
INSERT INTO `comment` VALUES (6, 29, 1, NULL, 2, '喜欢喜欢', '2021-04-10 11:19:33', 4, '拒绝', '1');
INSERT INTO `comment` VALUES (10, 36, 1, NULL, 2, '1112', '2021-04-24 22:07:15', 2, '通过', '1');
INSERT INTO `comment` VALUES (11, 36, 1, NULL, 2, '2222', '2021-04-24 22:07:27', 2, '拒绝', '1');
INSERT INTO `comment` VALUES (12, 37, 1, NULL, 19, '111\n', '2021-04-28 09:21:14', 1, '通过', '1');
INSERT INTO `comment` VALUES (14, 17, 1, NULL, 2, 'nice nice ', '2021-05-09 12:01:52', 2, NULL, '0');
INSERT INTO `comment` VALUES (16, 30, 0, 66, NULL, '一杯敬朝阳，一杯敬月光', '2021-05-09 15:39:26', 0, NULL, '0');
INSERT INTO `comment` VALUES (18, 43, 0, 32, NULL, '真好', '2021-05-16 17:44:22', 2, '通过', '1');
INSERT INTO `comment` VALUES (20, 48, 1, NULL, 10, '111', '2021-05-22 17:10:15', 2, '通过', '1');
INSERT INTO `comment` VALUES (21, 14, 0, 29, NULL, '悉数惭愧，我伤你几回', '2021-05-27 14:05:39', 0, '通过', '1');
INSERT INTO `comment` VALUES (22, 14, 0, 31, NULL, '久未放晴的天空，早已乌云弥漫\n风筝在阴天飘荡着，思虑却还在复习着我们之间的过往，此时陪伴我的却只剩下一旁的寂寞，嘲笑着我的承诺懦弱。提线间回忆着我第一次和你一起放风筝，你那时还是如此的快乐，天空仿佛都被照应成温暖淡黄色，金黄的太阳下立下千年的约定，永远守护着对方。我一直以为会这样的持续下去，但后来啊，我伤害了你无数次，不断的让你伤心，让你泪流满面。曾经的誓约早已破灭，你竟毫无保留的原谅我，信任我，即使我一直错下去。无限的愧疚向我涌来，痛哭着对着曾经的誓约，忘记你对我的期待，读完最后你对我牵挂，我很快就离开你的世界', '2021-05-27 14:13:17', 1, NULL, '0');
INSERT INTO `comment` VALUES (23, 14, 0, 32, NULL, '2021，还有人在听《最长的电影》吗', '2021-05-27 14:14:25', 1, NULL, '0');
INSERT INTO `comment` VALUES (24, 44, 0, 33, NULL, '我说这首歌是迄今为止最好听的中国古风歌曲，没毛病吧？', '2021-05-27 14:20:49', 1, '通过', '1');
INSERT INTO `comment` VALUES (25, 56, 1, NULL, 2, 'wewqeqweqweqwe', '2021-10-13 16:50:40', 0, '通过', '1');
INSERT INTO `comment` VALUES (26, 1, 0, 84, NULL, '牛哇牛哇，JJ yyds', '2021-11-05 14:53:52', 2, '拒绝', '1');
INSERT INTO `comment` VALUES (28, 62, 1, NULL, 9, '敏感词\n', '2021-12-16 19:19:58', 0, NULL, '0');
INSERT INTO `comment` VALUES (29, 63, 1, NULL, 9, 's ', '2022-03-16 11:27:03', 0, '通过', '1');
INSERT INTO `comment` VALUES (30, 66, 1, NULL, 10, '0.0', '2022-03-18 12:36:48', 1, '拒绝', '1');
INSERT INTO `comment` VALUES (31, 40, 0, 4, NULL, '好听', '2022-03-20 00:31:58', 3, '通过', '1');
INSERT INTO `comment` VALUES (32, 72, 0, 74, NULL, 'I\'m a goddess with a blade.', '2022-03-20 01:04:47', 2, '通过', '1');
INSERT INTO `comment` VALUES (34, 74, 0, 4, NULL, '11', '2022-03-21 11:56:45', 0, '通过', '1');
INSERT INTO `comment` VALUES (35, 68, 1, NULL, 28, '123', '2022-03-22 18:17:46', 1, '通过', '1');
INSERT INTO `comment` VALUES (37, 87, 1, NULL, 19, 'hello\n', '2022-04-08 18:23:54', 0, '通过', '1');
INSERT INTO `comment` VALUES (46, 1, 0, 66, NULL, '清醒的人最荒唐', '2023-04-07 19:54:02', 0, '通过', '1');
INSERT INTO `comment` VALUES (47, 1, 0, 66, NULL, '好听！', '2023-04-07 23:30:27', 0, '通过', '1');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别（1男0女）',
  `phone_num` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birth` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '这个人很懒，还没有设置签名' COMMENT '签名',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前端用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES (1, 'Taliyah', '6104CCC91C5913C2DD1A8C7A1BD05A71', 0, '15528392389', 'taliyah7196@qq.com', '1999-03-19', '短暂逗留', '江苏省苏州市吴中区', '/img/avatar/1647500516777mmexport1535557322633.jpg', '70-0-4', NULL);
INSERT INTO `consumer` VALUES (2, 'Taliyah1', '123456', 0, '15528392389', 'taliyah7196@qq.com', '1999-03-19', '短暂逗留', '四川成都', '/img/avatar/defaultFemaleAvatarImg.jpg', '70-0-4', NULL);
INSERT INTO `consumer` VALUES (6, 'Taliyahx', '123456', 0, '13411111111', 'qqdd@dd.com', '1999-03-19', '短暂逗留', '山西省晋中市灵石县', '/img/avatar/1615050143889male6.jpg', '2021-03-05', NULL);
INSERT INTO `consumer` VALUES (7, 'Taliyah6', '123456', 1, '15528392389', 'taliyah7196@qq.com', '1999-03-19', '短暂逗留', '四川成都', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-03-05', NULL);
INSERT INTO `consumer` VALUES (8, 'Taliyah7', '123456', 0, '15528392389', 'taliyah7196@qq.com', '1999-03-19', '短暂逗留', '四川成都', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-03-05', NULL);
INSERT INTO `consumer` VALUES (10, 'TESTADD1', '1241', 0, '15512344321', '1231@QW.CA', '2021-03-02', 'DSA1', 'DAS1', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-03-07', NULL);
INSERT INTO `consumer` VALUES (14, 'hey', 'hey', 0, '1551232313', 'ddsa@qwe.com', '2021-03-01', 'Why baby why do you give me trouble', '北京', '/img/avatar/1620914132140tfz.jpg', '2021-03-12', NULL);
INSERT INTO `consumer` VALUES (15, 'hey1', '123', 1, 'wq123', '3123@sdre.cc', '2021-03-08', 'dsa', '天津', '/img/avatar/1618155517404300.jpg', '2021-03-12', NULL);
INSERT INTO `consumer` VALUES (16, 'hey2', '123', 1, 'wq123', '3123@sdre.cc', '2021-03-08', 'dsa', '天津', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-03-12', NULL);
INSERT INTO `consumer` VALUES (17, 'hey3', 'hey3', 0, '13333333333', 'sqe@wqw.csaa', '2021-03-01', '', '湖北省武汉市', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-03-12', NULL);
INSERT INTO `consumer` VALUES (22, 'da123', 'as', 1, '13333333333', 'ddd@ee.cc', '2021-03-09', 'd', '福建省三明市', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-03-24', NULL);
INSERT INTO `consumer` VALUES (23, 'Heywmn', 'heywmn', 0, '15528392389', 'taliyah7196@qq.com', '1999-03-19', '红红火火恍恍惚惚', '辽宁', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-03-26', NULL);
INSERT INTO `consumer` VALUES (24, 'Sasa', '123456789qqq', 0, '', '', '2021-02-08', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-03-29', NULL);
INSERT INTO `consumer` VALUES (25, 'moonyin', 'ycxycxycx.929', 0, '13076057690', '1174891618@qq.com', '1999-03-01', '', '四川省德阳市什邡市', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-03-30', NULL);
INSERT INTO `consumer` VALUES (27, 'li', '123', 1, '123', '123@qq.com', '2021-04-01', '', '北京市北京市西城区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-01', NULL);
INSERT INTO `consumer` VALUES (28, '张三', '1', 0, '123456', '123456789@qq.com', '2021-04-12', '今天的风儿甚是喧嚣', '山西省长治市潞城区', '/img/avatar/1617277124324604472b731f613072c7a955a.jpg', '2021-04-01', NULL);
INSERT INTO `consumer` VALUES (29, 'yuyu', '1234', 0, '1777777743', '8888888@qq.com', '2021-04-14', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-04-05', NULL);
INSERT INTO `consumer` VALUES (30, '159', '123456', 1, '12345678901', '1@qq.com', '2021-04-14', '', '山东省临沂市罗庄区', '/img/avatar/1620544899164彩虹猫.jpg', '2021-04-05', NULL);
INSERT INTO `consumer` VALUES (31, 'rrr', '11', 1, '2222222', '222222@qq.com', '2021-04-15', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-09', NULL);
INSERT INTO `consumer` VALUES (32, '1', '2', 1, '', '', '2021-04-30', '', '海南省海口市秀英区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-18', NULL);
INSERT INTO `consumer` VALUES (33, 'wusu', 'wusu', 0, '13890086476', '', '2000-08-18', '', '黑龙江省佳木斯市前进区', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-04-20', NULL);
INSERT INTO `consumer` VALUES (34, 'sama', 'sama', 0, '', '', '2021-04-07', '', '广东省中山市西区街道办事处', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-04-20', NULL);
INSERT INTO `consumer` VALUES (35, '11', '1', 1, '', '', '2021-04-27', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-21', NULL);
INSERT INTO `consumer` VALUES (36, '111', '111', 1, '1111', '', '2021-04-23', '', '北京市北京市东城区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-23', NULL);
INSERT INTO `consumer` VALUES (37, '11111', 'qqqqq', 1, '111', '111@qq.com', '2021-04-01', '', '吉林省松原市乾安县', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-28', NULL);
INSERT INTO `consumer` VALUES (38, 'jerry', '123', 1, '110', '131131311@qq.com', '2021-04-01', '', '广东省珠海市香洲区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-29', NULL);
INSERT INTO `consumer` VALUES (39, 'iiii', '123', 1, '123', '13@11.com', '2021-04-20', '', '辽宁省营口市西市区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-04-30', NULL);
INSERT INTO `consumer` VALUES (40, '西八1', 'xiba', 1, '13311111111', '111@dd.com', '2021-05-03', '牛逼', '海南省三亚市吉阳区', '/img/avatar/1647708005580pianduan.jpg', '2021-05-06', NULL);
INSERT INTO `consumer` VALUES (41, 'ZSSB', 'ZSSB', 0, '', '', '', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-05-09', NULL);
INSERT INTO `consumer` VALUES (42, '非与偶', '123', 1, '', '', '', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-09', NULL);
INSERT INTO `consumer` VALUES (43, '洛泼', '123', 1, '123', '123@qq.com', '2021-05-26', '', '北京市北京市平谷区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-16', NULL);
INSERT INTO `consumer` VALUES (44, 'Tali', 'taliy4h', 0, 'taliy4h', 'taliy4h@taliy4h.co', '2021-05-04', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-05-21', NULL);
INSERT INTO `consumer` VALUES (45, 'lyy', '123', 1, '', '', '2021-05-12', '', '安徽省安庆市大观区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-21', NULL);
INSERT INTO `consumer` VALUES (46, '77', '77', 1, '', '', '2021-05-02', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-22', NULL);
INSERT INTO `consumer` VALUES (47, 'qwm', 'qwm', 0, '1122121', '1207596619@qq.com', '2021-01-12', '', '重庆市重庆市北碚区', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-05-22', NULL);
INSERT INTO `consumer` VALUES (48, '123', '123456', 1, '', '', '2021-05-10', '', '广东省中山市西区街道办事处', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-22', NULL);
INSERT INTO `consumer` VALUES (49, 'test', '123456', 1, '', '', '2021-05-03', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-22', NULL);
INSERT INTO `consumer` VALUES (50, 'wys', 'zhuerchong', 1, '18883166220', '1207596619@qq.com', '2021-05-25', '', '重庆市重庆市沙坪坝区', '/img/avatar/16219288040581.jpg', '2021-05-25', NULL);
INSERT INTO `consumer` VALUES (51, 'test11', '123', 1, '', '', '2021-05-24', '', '广西壮族自治区崇左市江州区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-25', NULL);
INSERT INTO `consumer` VALUES (52, 'Moumoon', 'wys', 0, '18883166220', '1207596619@qq.com', '2021-05-26', '', '', '/img/avatar/16219980863921.jpg', '2021-05-26', NULL);
INSERT INTO `consumer` VALUES (53, 'Yellow009', 'aa991026', 1, '18381583363', '1726747166@qq.com', '1999-10-26', '', '四川省资阳市安岳县', '/img/avatar/1622096187123ea2622a68868968091c47350795eb5312276b81a.jpg', '2021-05-27', NULL);
INSERT INTO `consumer` VALUES (54, 'Jay', '123', 1, '54654564', '65456546@sd.com', '2021-05-18', '', '山东省聊城市莘县', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-27', NULL);
INSERT INTO `consumer` VALUES (55, 'jj', '123', 1, '', '', '2021-05-04', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-05-31', NULL);
INSERT INTO `consumer` VALUES (56, '1-', '1', 1, '1', '1@qq.com', '2021-10-21', '', '江西省景德镇市昌江区', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-10-13', NULL);
INSERT INTO `consumer` VALUES (57, '\'\"', '1', 0, '1', '1@qq.com', '2021-10-27', '', '江苏省苏州市吴中区', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-10-13', NULL);
INSERT INTO `consumer` VALUES (58, '‘’‘’', '\'\'', 1, '1', '1@qq.com', '2021-10-12', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2021-10-13', NULL);
INSERT INTO `consumer` VALUES (59, '\"\"', '\"\"\'', 0, '', '', '2021-09-28', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-10-13', NULL);
INSERT INTO `consumer` VALUES (60, '序与海', '123', 0, '', '', '', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-11-05', NULL);
INSERT INTO `consumer` VALUES (61, '123321', '123123', 0, '', '', '2021-12-01', '', '', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-11-18', NULL);
INSERT INTO `consumer` VALUES (62, '00101', '123456', 0, '', '', '2021-12-01', '', '广东省深圳市南山区', '/img/avatar/defaultFemaleAvatarImg.jpg', '2021-12-16', NULL);
INSERT INTO `consumer` VALUES (63, 'ljx', '123', 1, '', '', '2022-03-07', '', '', '/img/avatar/1647831338360tutu.jfif', '2022-03-16', NULL);
INSERT INTO `consumer` VALUES (64, '123456', '123', 1, '', '', '2022-03-29', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-16', NULL);
INSERT INTO `consumer` VALUES (65, 'liuhui', 'yyq2phw2', 1, '1111', '111@qq.com', '2022-03-10', '', '北京市北京市西城区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-16', NULL);
INSERT INTO `consumer` VALUES (66, '1352892331', '111', 1, '111', '1352892331@qq.com', '2022-03-23', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-18', NULL);
INSERT INTO `consumer` VALUES (67, 'admin', '1', 1, '123', '123@qq.com', '2022-03-02', '', '广东省潮州市湘桥区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-19', NULL);
INSERT INTO `consumer` VALUES (68, '123456789', '123', 1, '', '', '2022-03-09', '', '', '/img/avatar/16481338143182.jpg', '2022-03-19', NULL);
INSERT INTO `consumer` VALUES (69, 'zxy', '123456', 1, '1546646', '12321@qq.com', '2022-03-21', '', '河南省三门峡市湖滨区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-19', NULL);
INSERT INTO `consumer` VALUES (70, '1234', '123', 1, '123', '123@qq.com', '2022-03-22', '', '福建省漳州市龙文区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-19', NULL);
INSERT INTO `consumer` VALUES (71, 'a', 'a', 1, '1111111111', '1250@qq.com', '2022-03-23', '', '四川省广安市广安区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-19', NULL);
INSERT INTO `consumer` VALUES (72, 'xibaloma', 'xiba', 1, '18800000000', 'aac@cc.com', '2022-03-01', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-20', NULL);
INSERT INTO `consumer` VALUES (74, '十一', 'zxcvbnm.', 1, '', '', '2022-03-21', '', '辽宁省丹东市振安区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-21', NULL);
INSERT INTO `consumer` VALUES (75, 'qw', '123', 0, '17638128159', '2516901039@qq.com', '2022-03-22', '', '河南省驻马店市遂平县', '/img/avatar/defaultFemaleAvatarImg.jpg', '2022-03-22', NULL);
INSERT INTO `consumer` VALUES (79, '135289', '111', 1, '111', '1352892331@qq.com', '2022-03-23', '', '广东省东莞市东城街道办事处', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-24', NULL);
INSERT INTO `consumer` VALUES (81, 'lin', '54', 1, '159', '2303011987@qq.com', '2012-08-06', '', '湖北省黄石市西塞山区', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-28', NULL);
INSERT INTO `consumer` VALUES (83, '12345', '123', 0, '', '', '2022-03-01', '', '广东省中山市南区街道办事处', '/img/avatar/defaultFemaleAvatarImg.jpg', '2022-03-28', NULL);
INSERT INTO `consumer` VALUES (85, 'Limits', '123456', 1, '123', '123@qq.com', '2022-03-31', '', '', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-03-31', NULL);
INSERT INTO `consumer` VALUES (86, '312', '321', 1, '31312', '1421415@qq.com', '2022-04-11', '', '湖南省怀化市新晃侗族自治县', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-04-01', NULL);
INSERT INTO `consumer` VALUES (87, 'zzm', '123456', 1, '18239606781', '2396256573@qq.com', '2003-04-01', '', '河南省郑州市新郑市', '/img/avatar/defaultMaleAvatarImg.jpg', '2022-04-08', NULL);

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `email_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱号',
  `validate_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱验证码',
  `create_time` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码生成时间',
  `expire_time` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码失效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES (1, 'taliyah', 'taliyah7196@qq.com', 'NNEBDD', '2023-03-31 01:31:56', '2023-03-31 01:34:56');
INSERT INTO `email` VALUES (2, 'taliyah', 'taliyah7196@qq.com', '3YES5P', '2023-03-31 01:37:46', '2023-03-31 01:40:46');
INSERT INTO `email` VALUES (3, 'taliyah', 'taliyah7196@qq.com', 'ID8GYB', '2023-03-31 01:57:48', '2023-03-31 02:00:48');
INSERT INTO `email` VALUES (4, 'taliyah', 'taliyah7196@qq.com', 'B3MQLG', '2023-03-31 21:54:09', '2023-03-31 21:57:09');
INSERT INTO `email` VALUES (5, 'taliyah', 'taliyah7196@qq.com', 'DP0GZW', '2023-03-31 21:55:51', '2023-03-31 23:58:51');
INSERT INTO `email` VALUES (6, 'taliyah', 'taliyah7196@qq.com', '53BT8H', '2023-03-31 23:28:42', '2023-03-31 23:31:42');
INSERT INTO `email` VALUES (7, 'taliyah', 'taliyah7196@qq.com', '7P84QK', '2023-04-01 00:07:15', '2023-04-01 00:10:15');
INSERT INTO `email` VALUES (8, 'taliyah', 'taliyah7196@qq.com', 'HABNPE', '2023-04-01 00:10:28', '2023-04-01 00:13:28');

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_list_id` int(11) NOT NULL COMMENT '歌单id',
  `consumer_id` int(11) NOT NULL COMMENT '用户id',
  `score` int(11) NULL DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `consumer_id`(`song_list_id`, `consumer_id`) USING BTREE COMMENT '评论唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '星级评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES (1, 2, 14, 7);
INSERT INTO `evaluation` VALUES (3, 2, 1, 10);
INSERT INTO `evaluation` VALUES (5, 2, 2, 5);
INSERT INTO `evaluation` VALUES (6, 2, 6, 8);
INSERT INTO `evaluation` VALUES (7, 2, 7, 3);
INSERT INTO `evaluation` VALUES (18, 10, 14, 10);
INSERT INTO `evaluation` VALUES (21, 12, 14, 10);
INSERT INTO `evaluation` VALUES (22, 2, 29, 5);
INSERT INTO `evaluation` VALUES (25, 23, 14, 5);
INSERT INTO `evaluation` VALUES (36, 10, 29, 6);
INSERT INTO `evaluation` VALUES (38, 9, 32, 8);
INSERT INTO `evaluation` VALUES (39, 2, 32, 10);
INSERT INTO `evaluation` VALUES (42, 23, 37, 6);
INSERT INTO `evaluation` VALUES (46, 2, 22, 7);
INSERT INTO `evaluation` VALUES (47, 2, 48, 9);
INSERT INTO `evaluation` VALUES (49, 10, 48, 10);
INSERT INTO `evaluation` VALUES (50, 2, 56, 0);
INSERT INTO `evaluation` VALUES (77, 9, 62, 5);
INSERT INTO `evaluation` VALUES (79, 24, 62, 6);
INSERT INTO `evaluation` VALUES (80, 2, 63, 10);
INSERT INTO `evaluation` VALUES (81, 10, 66, 9);
INSERT INTO `evaluation` VALUES (83, 2, 40, 10);
INSERT INTO `evaluation` VALUES (85, 9, 73, 9);
INSERT INTO `evaluation` VALUES (89, 2, 74, 8);
INSERT INTO `evaluation` VALUES (90, 35, 68, 10);
INSERT INTO `evaluation` VALUES (99, 36, 78, 6);
INSERT INTO `evaluation` VALUES (100, 9, 78, 9);
INSERT INTO `evaluation` VALUES (101, 28, 84, 7);
INSERT INTO `evaluation` VALUES (108, 26, 84, 8);
INSERT INTO `evaluation` VALUES (109, 27, 84, 8);
INSERT INTO `evaluation` VALUES (110, 22, 84, 4);
INSERT INTO `evaluation` VALUES (112, 31, 84, 7);

-- ----------------------------
-- Table structure for like_records
-- ----------------------------
DROP TABLE IF EXISTS `like_records`;
CREATE TABLE `like_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of like_records
-- ----------------------------
INSERT INTO `like_records` VALUES (2, 14, 4);
INSERT INTO `like_records` VALUES (3, 14, 2);
INSERT INTO `like_records` VALUES (4, 32, 2);
INSERT INTO `like_records` VALUES (5, 32, 4);
INSERT INTO `like_records` VALUES (6, 32, 5);
INSERT INTO `like_records` VALUES (7, 32, 6);
INSERT INTO `like_records` VALUES (8, 32, 8);
INSERT INTO `like_records` VALUES (9, 36, 2);
INSERT INTO `like_records` VALUES (10, 36, 4);
INSERT INTO `like_records` VALUES (11, 37, 12);
INSERT INTO `like_records` VALUES (12, 39, 5);
INSERT INTO `like_records` VALUES (13, 39, 4);
INSERT INTO `like_records` VALUES (14, 30, 2);
INSERT INTO `like_records` VALUES (15, 43, 18);
INSERT INTO `like_records` VALUES (16, 48, 2);
INSERT INTO `like_records` VALUES (17, 48, 4);
INSERT INTO `like_records` VALUES (18, 48, 5);
INSERT INTO `like_records` VALUES (19, 48, 6);
INSERT INTO `like_records` VALUES (20, 48, 8);
INSERT INTO `like_records` VALUES (21, 48, 20);
INSERT INTO `like_records` VALUES (22, 49, 7);
INSERT INTO `like_records` VALUES (23, 49, 6);
INSERT INTO `like_records` VALUES (24, 49, 5);
INSERT INTO `like_records` VALUES (25, 49, 4);
INSERT INTO `like_records` VALUES (26, 49, 2);
INSERT INTO `like_records` VALUES (27, 49, 8);
INSERT INTO `like_records` VALUES (28, 49, 9);
INSERT INTO `like_records` VALUES (29, 49, 10);
INSERT INTO `like_records` VALUES (30, 49, 11);
INSERT INTO `like_records` VALUES (31, 49, 13);
INSERT INTO `like_records` VALUES (32, 49, 14);
INSERT INTO `like_records` VALUES (33, 49, 15);
INSERT INTO `like_records` VALUES (34, 49, 20);
INSERT INTO `like_records` VALUES (35, 14, 22);
INSERT INTO `like_records` VALUES (36, 14, 18);
INSERT INTO `like_records` VALUES (37, 14, 23);
INSERT INTO `like_records` VALUES (38, 44, 24);
INSERT INTO `like_records` VALUES (39, 44, 15);
INSERT INTO `like_records` VALUES (40, 1, 26);
INSERT INTO `like_records` VALUES (41, 60, 26);
INSERT INTO `like_records` VALUES (42, 1, 2);
INSERT INTO `like_records` VALUES (43, 63, 7);
INSERT INTO `like_records` VALUES (44, 40, 31);
INSERT INTO `like_records` VALUES (45, 72, 32);
INSERT INTO `like_records` VALUES (46, 1, 32);
INSERT INTO `like_records` VALUES (47, 73, 2);
INSERT INTO `like_records` VALUES (48, 63, 2);
INSERT INTO `like_records` VALUES (49, 63, 4);
INSERT INTO `like_records` VALUES (50, 63, 5);
INSERT INTO `like_records` VALUES (51, 63, 6);
INSERT INTO `like_records` VALUES (52, 63, 10);
INSERT INTO `like_records` VALUES (53, 63, 9);
INSERT INTO `like_records` VALUES (54, 63, 11);
INSERT INTO `like_records` VALUES (55, 63, 13);
INSERT INTO `like_records` VALUES (56, 63, 14);
INSERT INTO `like_records` VALUES (57, 63, 15);
INSERT INTO `like_records` VALUES (58, 74, 2);
INSERT INTO `like_records` VALUES (59, 74, 31);
INSERT INTO `like_records` VALUES (60, 73, 31);
INSERT INTO `like_records` VALUES (61, 68, 35);
INSERT INTO `like_records` VALUES (62, 73, 4);
INSERT INTO `like_records` VALUES (63, 48, 30);

-- ----------------------------
-- Table structure for list_song
-- ----------------------------
DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '歌曲id',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '歌单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每一个歌单包含的歌曲列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of list_song
-- ----------------------------
INSERT INTO `list_song` VALUES (1, 2, 3);
INSERT INTO `list_song` VALUES (2, 14, 2);
INSERT INTO `list_song` VALUES (16, 2, 2);
INSERT INTO `list_song` VALUES (17, 4, 2);
INSERT INTO `list_song` VALUES (21, 12, 2);
INSERT INTO `list_song` VALUES (25, 57, 2);
INSERT INTO `list_song` VALUES (26, 56, 2);
INSERT INTO `list_song` VALUES (27, 56, 9);
INSERT INTO `list_song` VALUES (32, 34, 18);
INSERT INTO `list_song` VALUES (33, 56, 10);
INSERT INTO `list_song` VALUES (34, 53, 9);
INSERT INTO `list_song` VALUES (35, 44, 2);
INSERT INTO `list_song` VALUES (36, 54, 2);
INSERT INTO `list_song` VALUES (37, 29, 2);
INSERT INTO `list_song` VALUES (38, 40, 2);
INSERT INTO `list_song` VALUES (39, 71, 10);
INSERT INTO `list_song` VALUES (40, 72, 10);
INSERT INTO `list_song` VALUES (43, 45, 23);
INSERT INTO `list_song` VALUES (44, 65, 23);
INSERT INTO `list_song` VALUES (45, 68, 23);
INSERT INTO `list_song` VALUES (46, 49, 23);
INSERT INTO `list_song` VALUES (47, 59, 23);
INSERT INTO `list_song` VALUES (48, 31, 23);
INSERT INTO `list_song` VALUES (49, 46, 23);
INSERT INTO `list_song` VALUES (50, 60, 23);
INSERT INTO `list_song` VALUES (51, 70, 2);
INSERT INTO `list_song` VALUES (52, 71, 2);
INSERT INTO `list_song` VALUES (53, 72, 2);
INSERT INTO `list_song` VALUES (54, 47, 2);
INSERT INTO `list_song` VALUES (55, 61, 2);
INSERT INTO `list_song` VALUES (56, 59, 2);
INSERT INTO `list_song` VALUES (57, 33, 2);
INSERT INTO `list_song` VALUES (60, 32, 20);
INSERT INTO `list_song` VALUES (61, 12, 20);
INSERT INTO `list_song` VALUES (62, 31, 20);
INSERT INTO `list_song` VALUES (63, 63, 20);
INSERT INTO `list_song` VALUES (64, 61, 20);
INSERT INTO `list_song` VALUES (68, 12, 22);
INSERT INTO `list_song` VALUES (69, 35, 22);
INSERT INTO `list_song` VALUES (70, 36, 22);
INSERT INTO `list_song` VALUES (71, 37, 22);
INSERT INTO `list_song` VALUES (72, 55, 22);
INSERT INTO `list_song` VALUES (73, 41, 22);
INSERT INTO `list_song` VALUES (74, 45, 22);
INSERT INTO `list_song` VALUES (75, 53, 22);
INSERT INTO `list_song` VALUES (76, 51, 22);
INSERT INTO `list_song` VALUES (77, 73, 12);
INSERT INTO `list_song` VALUES (78, 75, 12);
INSERT INTO `list_song` VALUES (79, 74, 12);
INSERT INTO `list_song` VALUES (80, 76, 12);
INSERT INTO `list_song` VALUES (81, 77, 12);
INSERT INTO `list_song` VALUES (82, 78, 12);
INSERT INTO `list_song` VALUES (84, 80, 19);
INSERT INTO `list_song` VALUES (85, 81, 19);
INSERT INTO `list_song` VALUES (86, 83, 18);
INSERT INTO `list_song` VALUES (87, 31, 37);
INSERT INTO `list_song` VALUES (89, 30, 37);
INSERT INTO `list_song` VALUES (90, 4, 37);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言内容',
  `time` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言时间',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言类型',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (4, 'test', '2023-02-08 20:09:35', '网站建议', 'test');
INSERT INTO `message` VALUES (6, '有bug', '2023-02-09 21:39:29', '问题反馈', '64334087@qq.com');
INSERT INTO `message` VALUES (7, '测试提交留言后表单是否清空', '2023-02-09 21:42:50', '问题反馈', '');
INSERT INTO `message` VALUES (14, 'test', '2023-02-15 21:08:17', '网站建议', '');

-- ----------------------------
-- Table structure for play_history
-- ----------------------------
DROP TABLE IF EXISTS `play_history`;
CREATE TABLE `play_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `song_id` int(11) NOT NULL COMMENT '歌曲id',
  `play_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '播放时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of play_history
-- ----------------------------
INSERT INTO `play_history` VALUES (1, 1, 4, '2022-04-04 15:29:17');
INSERT INTO `play_history` VALUES (2, 1, 76, '2022-04-04 15:31:38');
INSERT INTO `play_history` VALUES (3, 1, 80, '2022-03-20 01:15:53');
INSERT INTO `play_history` VALUES (4, 63, 57, '2022-03-16 11:25:09');
INSERT INTO `play_history` VALUES (5, 63, 53, '2022-03-16 11:28:30');
INSERT INTO `play_history` VALUES (6, 63, 56, '2022-03-16 11:29:31');
INSERT INTO `play_history` VALUES (7, 63, 29, '2022-03-21 10:54:19');
INSERT INTO `play_history` VALUES (8, 1, 33, '2022-03-19 21:13:04');
INSERT INTO `play_history` VALUES (9, 64, 84, '2022-03-16 15:35:07');
INSERT INTO `play_history` VALUES (10, 64, 81, '2022-03-16 15:30:09');
INSERT INTO `play_history` VALUES (11, 64, 65, '2022-03-16 15:34:21');
INSERT INTO `play_history` VALUES (12, 64, 76, '2022-03-16 15:35:08');
INSERT INTO `play_history` VALUES (13, 64, 56, '2022-03-16 15:34:55');
INSERT INTO `play_history` VALUES (14, 65, 80, '2022-03-16 19:30:41');
INSERT INTO `play_history` VALUES (15, 65, 84, '2022-03-16 19:30:57');
INSERT INTO `play_history` VALUES (16, 64, 4, '2022-03-18 01:48:48');
INSERT INTO `play_history` VALUES (17, 64, 45, '2022-03-18 01:52:16');
INSERT INTO `play_history` VALUES (18, 66, 37, '2022-03-18 12:36:13');
INSERT INTO `play_history` VALUES (19, 66, 30, '2022-03-18 12:36:59');
INSERT INTO `play_history` VALUES (20, 66, 31, '2022-03-18 12:37:41');
INSERT INTO `play_history` VALUES (21, 36, 56, '2022-03-19 18:55:57');
INSERT INTO `play_history` VALUES (22, 36, 81, '2022-03-19 19:00:07');
INSERT INTO `play_history` VALUES (23, 36, 31, '2022-03-19 19:00:24');
INSERT INTO `play_history` VALUES (24, 36, 76, '2022-03-19 19:01:32');
INSERT INTO `play_history` VALUES (25, 65, 60, '2022-03-19 20:18:23');
INSERT INTO `play_history` VALUES (26, 1, 77, '2022-03-19 23:54:33');
INSERT INTO `play_history` VALUES (27, 1, 74, '2022-03-20 01:05:12');
INSERT INTO `play_history` VALUES (28, 1, 78, '2022-03-19 21:23:16');
INSERT INTO `play_history` VALUES (29, 69, 12, '2022-03-19 22:51:44');
INSERT INTO `play_history` VALUES (30, 69, 35, '2022-03-19 22:52:12');
INSERT INTO `play_history` VALUES (31, 69, 4, '2022-03-20 13:34:01');
INSERT INTO `play_history` VALUES (32, 71, 81, '2022-03-19 23:39:21');
INSERT INTO `play_history` VALUES (33, 71, 4, '2022-03-19 23:40:20');
INSERT INTO `play_history` VALUES (34, 1, 81, '2022-03-19 23:53:16');
INSERT INTO `play_history` VALUES (35, 1, 70, '2022-03-19 23:54:29');
INSERT INTO `play_history` VALUES (36, 1, 72, '2022-03-19 23:53:56');
INSERT INTO `play_history` VALUES (37, 1, 73, '2022-03-19 23:54:14');
INSERT INTO `play_history` VALUES (38, 1, 75, '2022-03-20 00:26:15');
INSERT INTO `play_history` VALUES (39, 1, 56, '2022-03-19 23:55:59');
INSERT INTO `play_history` VALUES (40, 1, 84, '2022-03-20 00:02:28');
INSERT INTO `play_history` VALUES (41, 1, 71, '2022-03-20 00:20:03');
INSERT INTO `play_history` VALUES (42, 1, 44, '2022-03-20 00:21:51');
INSERT INTO `play_history` VALUES (43, 1, 46, '2022-03-20 00:22:35');
INSERT INTO `play_history` VALUES (44, 40, 4, '2022-03-20 00:33:28');
INSERT INTO `play_history` VALUES (45, 40, 12, '2022-03-20 00:33:37');
INSERT INTO `play_history` VALUES (46, 40, 57, '2022-03-20 00:33:08');
INSERT INTO `play_history` VALUES (47, 40, 56, '2022-03-20 00:33:14');
INSERT INTO `play_history` VALUES (48, 40, 29, '2022-03-20 00:35:35');
INSERT INTO `play_history` VALUES (49, 40, 61, '2022-03-20 00:39:24');
INSERT INTO `play_history` VALUES (50, 40, 76, '2022-03-20 00:36:39');
INSERT INTO `play_history` VALUES (51, 40, 80, '2022-03-20 00:50:56');
INSERT INTO `play_history` VALUES (52, 40, 73, '2022-03-20 00:51:02');
INSERT INTO `play_history` VALUES (53, 40, 72, '2022-03-20 00:51:04');
INSERT INTO `play_history` VALUES (54, 40, 78, '2022-03-20 00:51:10');
INSERT INTO `play_history` VALUES (55, 72, 74, '2022-03-20 01:04:21');
INSERT INTO `play_history` VALUES (56, 69, 61, '2022-03-20 13:32:26');
INSERT INTO `play_history` VALUES (57, 69, 76, '2022-03-20 13:33:21');
INSERT INTO `play_history` VALUES (58, 69, 29, '2022-03-20 13:36:32');
INSERT INTO `play_history` VALUES (59, 63, 30, '2022-03-21 10:54:15');
INSERT INTO `play_history` VALUES (60, 63, 84, '2022-03-21 10:59:14');
INSERT INTO `play_history` VALUES (61, 74, 4, '2022-03-21 11:56:21');
INSERT INTO `play_history` VALUES (62, 74, 30, '2022-03-21 11:57:49');
INSERT INTO `play_history` VALUES (63, 73, 4, '2022-04-04 22:34:40');
INSERT INTO `play_history` VALUES (64, 73, 73, '2022-03-21 22:53:19');
INSERT INTO `play_history` VALUES (65, 73, 78, '2022-03-21 22:55:39');
INSERT INTO `play_history` VALUES (66, 68, 4, '2022-03-22 02:22:11');
INSERT INTO `play_history` VALUES (67, 68, 12, '2022-03-22 02:22:08');
INSERT INTO `play_history` VALUES (68, 75, 29, '2022-03-22 11:43:37');
INSERT INTO `play_history` VALUES (69, 77, 76, '2022-03-23 00:23:49');
INSERT INTO `play_history` VALUES (70, 77, 53, '2022-03-23 00:23:53');
INSERT INTO `play_history` VALUES (71, 78, 76, '2022-03-23 22:52:34');
INSERT INTO `play_history` VALUES (72, 78, 29, '2022-03-23 22:52:51');
INSERT INTO `play_history` VALUES (73, 78, 30, '2022-03-23 22:52:54');
INSERT INTO `play_history` VALUES (74, 79, 12, '2022-03-24 20:43:16');
INSERT INTO `play_history` VALUES (75, 80, 12, '2022-03-28 20:13:04');
INSERT INTO `play_history` VALUES (76, 80, 35, '2022-03-28 20:13:10');
INSERT INTO `play_history` VALUES (77, 80, 37, '2022-03-28 20:13:40');
INSERT INTO `play_history` VALUES (78, 80, 76, '2022-03-28 20:13:48');
INSERT INTO `play_history` VALUES (79, 80, 80, '2022-03-28 20:17:16');
INSERT INTO `play_history` VALUES (80, 80, 81, '2022-03-28 20:17:16');
INSERT INTO `play_history` VALUES (81, 80, 57, '2022-03-28 20:17:28');
INSERT INTO `play_history` VALUES (82, 80, 84, '2022-03-28 20:17:33');
INSERT INTO `play_history` VALUES (83, 83, 4, '2022-03-28 22:48:47');
INSERT INTO `play_history` VALUES (84, 84, 60, '2022-03-29 15:12:53');
INSERT INTO `play_history` VALUES (85, 84, 76, '2022-03-29 15:13:00');
INSERT INTO `play_history` VALUES (86, 84, 84, '2022-03-29 15:13:07');
INSERT INTO `play_history` VALUES (87, 84, 55, '2022-03-30 09:56:48');
INSERT INTO `play_history` VALUES (88, 84, 12, '2022-03-30 09:46:05');
INSERT INTO `play_history` VALUES (89, 85, 84, '2022-03-31 15:58:58');
INSERT INTO `play_history` VALUES (90, 85, 56, '2022-03-31 15:58:59');
INSERT INTO `play_history` VALUES (91, 86, 4, '2022-04-01 10:26:06');
INSERT INTO `play_history` VALUES (92, 14, 76, '2023-02-08 23:52:54');
INSERT INTO `play_history` VALUES (93, 14, 56, '2022-04-04 16:02:46');
INSERT INTO `play_history` VALUES (94, 14, 80, '2022-04-04 16:02:50');
INSERT INTO `play_history` VALUES (95, 14, 70, '2022-04-04 16:02:57');
INSERT INTO `play_history` VALUES (96, 14, 78, '2022-04-04 16:03:00');
INSERT INTO `play_history` VALUES (97, 14, 74, '2022-04-04 16:03:06');
INSERT INTO `play_history` VALUES (98, 73, 29, '2022-04-04 22:38:06');
INSERT INTO `play_history` VALUES (99, 73, 65, '2022-04-04 22:43:26');
INSERT INTO `play_history` VALUES (100, 73, 33, '2022-04-04 23:53:36');
INSERT INTO `play_history` VALUES (101, 73, 76, '2022-04-04 23:54:18');
INSERT INTO `play_history` VALUES (102, 87, 29, '2022-04-08 18:24:10');
INSERT INTO `play_history` VALUES (103, 87, 30, '2022-04-08 18:24:49');
INSERT INTO `play_history` VALUES (104, 87, 81, '2022-04-08 18:26:12');
INSERT INTO `play_history` VALUES (105, 14, 73, '2023-02-08 23:23:03');
INSERT INTO `play_history` VALUES (106, 14, 29, '2023-02-09 20:36:39');

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别（1男0女）',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `birth` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '歌手' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (3, '周杰伦', 1, '/img/singerPic/1614323149146jay.jpg', '1979-01-18', '中国台湾', '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、原创音乐人、演员、导演、编剧，毕业于淡江中学。');
INSERT INTO `singer` VALUES (4, '陈奕迅', 1, '/img/singerPic/1615187642396eason.jpg', '1974-07-27', '中国香港', '陈奕迅（Eason Chan），1974年7月27日出生于中国香港，祖籍广东省东莞市， [1]  华语流行乐男歌手、演员、作曲人，毕业于英国金斯顿大学。');
INSERT INTO `singer` VALUES (5, '王菲', 0, '/img/singerPic/1614311811401wangfei.jpg', '1969-08-08', '中国北京', '王菲（Faye Wong），1969年8月8日出生于北京，中国流行乐女歌手、影视演员，中国国家一级演员。');
INSERT INTO `singer` VALUES (6, '邓紫棋', 0, '/img/singerPic/1614311817216gem.jpg', '1991-08-16', '中国上海', '邓紫棋（Gloria Tang Tsz-Kei），本名邓诗颖，1991年8月16日生于中国上海，4岁移居香港，中国香港女歌手、词曲创作人、音乐制作人。2008年，推出单曲《等一个他》，从而正式出道；同年，发行首张音乐EP《G.E.M.》，取得香港乐坛各大颁奖礼新人金奖。2011年，成为最年轻登香港红馆开唱的女歌手。');
INSERT INTO `singer` VALUES (7, 'IU (아이유)', 0, '/img/singerPic/1619335970143IU.jpg', '1993-05-16', '韩国', '아이유(IU)，原名为李知恩。韩国女歌手、演员、主持人。IU在2007年加入Loen Entertainment 成为练习生。15岁的时候， IU发行首张迷你专辑《Lost and Found》正式出道。而让她成为大势的是2010年的《好日子》。歌里的三段高音展示了IU优秀的唱功，该曲在众多榜单获得一位的同时也获得了MMA年度歌曲奖。');
INSERT INTO `singer` VALUES (25, '薛之谦', 1, '/img/singerPic/1615187759573xuezhiqian.jpg', '1983-07-17', '中国上海', '薛之谦（Joker Xue），1983年7月17日出生于上海，中国内地流行乐男歌手、影视演员、音乐制作人，毕业于格里昂酒店管理学院。 2005年，因参加选秀节目《我型我秀》而正式出道。2006年，发行首张同名专辑《薛之谦》，随后凭借歌曲《认真的雪》获得广泛关注。');
INSERT INTO `singer` VALUES (26, 'BLACKPINK 블랙핑크', 2, '/img/singerPic/1615187819186blackpink.jpg', '2016-08-08', '韩国', 'BLACKPINK（블랙핑크）是YG Entertainment于2016年8月8日推出的韩国女子演唱组合，由金智秀（JISOO）、金智妮（JENNIE）、朴彩英（ROSÉ）、LISA四名成员组成。组合名“BLACKPINK”在看起来很美的粉色中稍微加入了否定的意义，旨在传达出“不要只看漂亮的部分”、“看到的并不是全部”的意思。');
INSERT INTO `singer` VALUES (27, 'Pháo', 0, '/img/singerPic/1615187411336phao.jpg', '2003-03-26', '越南', 'Phao生于2003年，真名Nguyễn Diệu Huyền，也被称为“地下公主”，在《说唱王》节目中获得导师的四次选秀权后，她获得了极大的关注。 在现实生活中，Phao还是一个开朗友善的女生。她定期参加学校的集体活动以及underground音乐演出。');
INSERT INTO `singer` VALUES (28, '李荣浩', 1, '/img/singerPic/1616394376659lironghao.jpg', '1985-07-11', '中国安徽', '李荣浩，中国流行乐男歌手、音乐制作人、演员、吉他手。 2013年9月16日，发行首张专辑《模特》，凭借这张专辑提名第25届金曲奖五项大奖并获得最佳新人奖，实现了从制作人到歌手的转型。');
INSERT INTO `singer` VALUES (29, '华莎 (화사)', 0, '/img/singerPic/1615946303859huasha.jpg', '1995-07-23', '韩国全州', '安惠真，艺名华莎（Hwa Sa），1995年7月23日出生于韩国全州，韩国女歌手，女子演唱团体MAMAMOO成员。');
INSERT INTO `singer` VALUES (30, '王忻辰/苏星婕', 0, '/img/singerPic/1615946952976suxingjie.jpg', '', '中国', '国籍：中国职业：歌手代表作：《清空》《我们俩的夏天》');
INSERT INTO `singer` VALUES (31, 'Katie Sky', 0, '/img/singerPic/1615208365019Katie Sky.jpg', '1989-07-20', '英国布里斯托尔', 'Katie Sky，1989年7月20日生于英国布里斯托尔，热播专辑《Paradise》，《Evo》。');
INSERT INTO `singer` VALUES (32, '毛不易', 1, '/img/singerPic/1616395149733maobuyi.jpg', '1994-10-01', '中国黑龙江', '毛不易，男，原名王维家，黑龙江齐齐哈尔人。综艺节目《明日之子》的参赛选手，以一首逗趣的原创歌曲《如果有一天我变得很有钱》进入薛之谦盛世独秀赛道；后以一曲《消愁》实力圈粉，为大家所喜爱。');
INSERT INTO `singer` VALUES (33, ' Barbara Opsomer', 0, '/img/singerPic/1616399476885babara opsomer.jpg', '', '法国', 'Barbara Opsomer是位年轻的比利时演员及歌手。她的童年时光在祖国比利时、法国及美国各地度过。名副其实的漫游家，这位年轻姑娘的生活在2007年发生了突变，那时她第一次看奥利维尔·达罕导演的电影《玫瑰人生》。');
INSERT INTO `singer` VALUES (34, 'Mykey', 1, '/img/singerPic/1616399798298Mykey.jpg', '', '美国马里兰州', 'Mikey Ambrosino（MyKey）是来自美国马里兰州罗克维尔的独立创作歌手。他在过去两年中精心制作了他的首张专辑《 Faces》，该专辑于2017年8月发行。 Mikey完成并录制了《Faces》上的所有音乐。');
INSERT INTO `singer` VALUES (35, 'csgj', 0, '/img/singerPic/161673688967883550258_p0_master1200.jpg', '2021-03-01', '亚美尼亚', '');
INSERT INTO `singer` VALUES (37, 'K/DA', 2, '/img/singerPic/1617030190465kda.jpg', '2018-09-28', '韩国', 'K/DA是虚拟流行音乐女子组合，成员来自电子游戏《英雄联盟》主题版本的四大角色：阿狸、阿卡丽、伊芙琳、卡莎。其中伊芙琳和卡莎分别由美国歌手麦迪逊·比尔和杰拉·伯恩斯配音，阿狸和阿卡丽由韩国组合(G)I-DLE成员曺薇娟（美延）和田小娟配音。该组合由《英雄联盟》运营公司Riot Games负责开发，于英雄联盟2018赛季全球总决赛开幕式表演中首次亮相，以增强现实形式献上现场表演，献上她们第一支单曲《Pop/Stars》。该歌曲的音乐录影带被上传到YouTube后得到广泛传阅，观看次数仅一个月便突破1亿，最终突破3亿，登顶《公告牌》全球数字歌曲销量榜。');
INSERT INTO `singer` VALUES (38, 'Seraphine', 0, '/img/singerPic/1617030849083seraphine.jpg', '', '美国', 'Seraphine是一位来自洛杉矶的创作型歌手，音乐制作人。从2020年6月开始，她在社交媒体上放出陆续放出自己弹奏和翻唱的歌曲，渐渐累积出知名度。2020年9月，Seraphine宣布了她与偶像组合K/DA的合作。代表作品有《Childhood Dreams》。');
INSERT INTO `singer` VALUES (41, 'mizuki', 0, '/img/singerPic/1622109318032mizuki.png', '', '日本', '瑞葵（mizuki），日本歌手、乐队主唱。最早出道为イツエ乐队的主唱，后来参加了SawanoHiroyuki[nZk]项目，并作为其合作歌手。在2017年建立了自己的乐队——UNIDOTS，并担任主唱。');
INSERT INTO `singer` VALUES (42, '林俊杰', 1, '/img/singerPic/1636094838968linjunjie.jpg', '1981-03-27', '中国', '林俊杰（JJ Lin），1981年3月27日出生于新加坡，祖籍中国福建省厦门市同安区，华语流行乐男歌手、音乐人、潮牌主理人。');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `singer_id` int(11) NULL DEFAULT NULL COMMENT '歌手id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲名称',
  `album` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲图片',
  `lyric` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '姝岃瘝',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲地址',
  `play_count` int(11) NULL DEFAULT 0 COMMENT '播放次数',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风格标签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '歌曲' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (4, 4, '十年', 'Masters of Tributes Vol 3', NULL, '2022-03-19', '/img/songPic/1614692171624十年.jpg', '[00:00.000] 作曲 : 陈小霞\n[00:16.08]如果那两个字没有颤抖\n[00:20.06]我不会发现 我难受\n[00:23.22]怎么说出口\n[00:27.00]也不过是分手\n[00:31.54]如果对于明天没有要求\n[00:35.63]牵牵手就像旅游\n[00:38.54]成千上万个门口\n[00:42.43]总有一个人要先走\n[00:48.20]怀抱既然不能逗留\n[00:51.58]何不在离开的时候\n[00:54.51]一边享受 一边泪流\n[01:01.58]十年之前\n[01:03.54]我不认识你 你不属于我\n[01:07.33]我们还是一样\n[01:10.12]陪在一个陌生人左右\n[01:13.54]走过渐渐熟悉的街头\n[01:17.33]十年之后\n[01:19.11]我们是朋友 还可以问候\n[01:23.00]只是那种温柔\n[01:25.48]再也找不到拥抱的理由\n[01:29.27]情人最后难免沦为朋友\n[01:57.51]怀抱既然不能逗留\n[02:01.37]何不在离开的时候\n[02:04.28]一边享受 一边泪流\n[02:11.36]十年之前\n[02:13.18]我不认识你 你不属于我\n[02:16.98]我们还是一样\n[02:19.65]陪在一个陌生人左右\n[02:23.47]走过渐渐熟悉的街头\n[02:26.91]十年之后\n[02:28.79]我们是朋友 还可以问候\n[02:32.56]只是那种温柔\n[02:35.04]再也找不到拥抱的理由\n[02:38.83]情人最后难免沦为朋友\n[02:48.70]直到和你做了多年朋友\n[02:52.74]才明白我的眼泪\n[02:55.86]不是为你而流\n[02:59.90]也为别人而流', '/music/song/1614606063429陈奕迅 - 十年.mp3', 168, '粤语,流行,选项8');
INSERT INTO `song` VALUES (12, 4, '人来人往', 'Get A Life 演唱会', '2021-03-02', '2022-03-19', '/img/songPic/1614696688443人来人往.jpg', '[00:00.000] 作词 : 林夕\r\n[00:01.000] 作曲 : 陈辉阳\r\n[00:02.000]\r\n[00:13.028]朋友已走\r\n[00:15.427]刚升职的你举杯到凌晨还未够\r\n[00:21.993]用尽心机拉我手\r\n[00:26.119]缠在我颈背后\r\n[00:30.223]说你男友有事忙是借口\r\n[00:35.076]说到终于饮醉酒\r\n[00:39.244]情侣会走\r\n[00:41.673]刚失恋的你哭干眼泪前来自首\r\n[00:48.218]寂寞因此牵我手\r\n[00:52.329]除下了他手信后\r\n[00:56.488]我已得到你没有\r\n[00:59.712]但你我至少往后 成为了密友\r\n[01:05.928]闭起双眼你最挂念谁\r\n[01:09.289]眼睛张开身边竟是谁\r\n[01:12.565]感激车站里\r\n[01:14.192]尚有月台能让我们满足到落泪\r\n[01:19.112]拥不拥有也会记住谁\r\n[01:22.367]快不快乐留在身体里\r\n[01:26.060]爱若能够永不失去\r\n[01:29.377]何以你今天竟想找寻伴侣\r\n[01:35.609]\r\n[01:58.087]谁也会走\r\n[02:00.537]刚相恋的你先知我们原来未够\r\n[02:07.009]借故松开我的手\r\n[02:11.021]藏在贴纸相背后\r\n[02:15.089]我这苦心开过没有\r\n[02:18.246]但试过散心旅游\r\n[02:20.672]如何答没有\r\n[02:24.310]闭起双眼我最挂念谁\r\n[02:27.547]眼睛张开身边竟是谁\r\n[02:30.830]感激车站里\r\n[02:32.394]尚有月台曾让我们满足到落泪\r\n[02:37.287]拥不拥有也会记住谁\r\n[02:40.500]快不快乐有天总过去\r\n[02:44.123]爱若为了永不失去\r\n[02:47.356]谁勉强娱乐过谁\r\n[02:50.569]爱若难以放进手里\r\n[02:53.772]何不将这双手放进心里\r\n[03:02.729]时间会走\r\n[03:05.268]刚失恋的我开始与旁人携着手\r\n[03:11.935]但什么可以拥有\r\n[03:16.104]缠在那颈背后\r\n[03:20.393]最美丽长发未留在我手\r\n[03:25.444]我也开心饮过酒', '/music/song/1614696602013人来人往.mp3', 60, '粤语,流行');
INSERT INTO `song` VALUES (29, 3, '一路向北', '十一月的萧邦', '2021-03-08', '2022-03-20', '/img/songPic/1615190224262一路向北.jpg', '[00:00.00]一路向北 - 周杰伦 (Jay Chou)\r\n[00:12.42]词：方文山\r\n[00:24.84]曲：周杰伦\r\n[00:37.27]后视镜里的世界\r\n[00:41.12]\r\n[00:44.42]越来越远的道别\r\n[00:47.98]\r\n[00:48.90]你转身向背 侧脸还是很美\r\n[00:54.92]\r\n[00:55.44]我用眼光去追 竟听见你的泪\r\n[01:02.39]\r\n[01:05.89]在车窗外面徘徊 是我错失的机会\r\n[01:16.93]\r\n[01:17.49]你站的方位 跟我中间隔着泪\r\n[01:23.64]街景一直在后退\r\n[01:26.81]\r\n[01:27.39]你的崩溃在窗外零碎\r\n[01:31.60]我一路向北 离开有你的季节\r\n[01:37.72]\r\n[01:38.85]你说你好累 已无法再爱上谁\r\n[01:45.96]风在山路吹\r\n[01:48.73]过往的画面全都是我不对\r\n[01:53.36]\r\n[01:54.08]细数惭愧 我伤你几回\r\n[01:58.62]\r\n[02:21.17]后视镜里的世界 越来越远的道别\r\n[02:31.33]\r\n[02:32.88]你转身向背 侧脸还是很美\r\n[02:39.29]我用眼光去追 竟听见你的泪\r\n[02:45.82]\r\n[02:49.72]在车窗外面徘徊 是我错失的机会\r\n[03:00.59]\r\n[03:01.56]你站的方位 跟我中间隔着泪\r\n[03:07.46]街景一直在后退\r\n[03:10.54]\r\n[03:11.15]你的崩溃在窗外零碎\r\n[03:15.01]\r\n[03:15.53]我一路向北 离开有你的季节\r\n[03:21.64]\r\n[03:22.90]你说你好累 已无法再爱上谁\r\n[03:29.94]风在山路吹\r\n[03:32.62]过往的画面全都是我不对\r\n[03:37.39]\r\n[03:37.95]细数惭愧 我伤你几回\r\n[03:43.66]\r\n[03:44.23]我一路向北 离开有你的季节\r\n[03:50.21]\r\n[03:51.50]方向盘周围 回转着我的后悔\r\n[03:58.99]我加速超越\r\n[04:01.37]却甩不掉紧紧跟随的伤悲\r\n[04:05.87]\r\n[04:06.75]细数惭愧我 伤你几回\r\n[04:11.37]\r\n[04:13.82]停止狼狈就 让错纯粹', '/music/song/1615189488110周杰伦 - 一路向北 - 完整版.mp3', 129, '流行,华语');
INSERT INTO `song` VALUES (30, 3, '告白气球', '周杰伦的床边故事', '2021-03-08', '2022-03-19', '/img/songPic/1615192472850告白气球.jpg', '[00:00.00]告白气球 - 周杰伦 (Jay Chou)\r\n[00:07.86]词：方文山\r\n[00:15.72]曲：周杰伦\r\n[00:23.59]塞纳河畔 左岸的咖啡\r\n[00:26.16]我手一杯 品尝你的美\r\n[00:28.78]\r\n[00:29.33]留下唇印的嘴\r\n[00:31.83]\r\n[00:34.27]花店玫瑰 名字写错谁\r\n[00:36.90]告白气球 风吹到对街\r\n[00:39.29]\r\n[00:40.01]微笑在天上飞\r\n[00:42.10]\r\n[00:44.01]你说你有点难追\r\n[00:46.57]想让我知难而退\r\n[00:49.22]礼物不需挑最贵\r\n[00:51.89]只要香榭的落叶\r\n[00:54.56]喔 营造浪漫的约会\r\n[00:57.26]不害怕搞砸一切\r\n[00:59.93]拥有你就拥有全世界\r\n[01:04.10]\r\n[01:05.01]亲爱的 爱上你\r\n[01:08.17]从那天起\r\n[01:10.61]\r\n[01:11.33]甜蜜的很轻易\r\n[01:14.43]\r\n[01:15.69]亲爱的 别任性\r\n[01:18.85]你的眼睛\r\n[01:21.24]\r\n[01:21.94]在说我愿意\r\n[01:25.23]\r\n[01:48.90]塞纳河畔 左岸的咖啡\r\n[01:51.46]我手一杯 品尝你的美\r\n[01:54.43]留下唇印的嘴\r\n[01:56.63]\r\n[01:59.56]花店玫瑰 名字写错谁\r\n[02:02.14]告白气球 风吹到对街\r\n[02:04.37]\r\n[02:05.23]微笑在天上飞\r\n[02:07.49]\r\n[02:09.29]你说你有点难追\r\n[02:11.90]想让我知难而退\r\n[02:14.60]礼物不需挑最贵\r\n[02:17.26]只要香榭的落叶\r\n[02:19.93]喔 营造浪漫的约会\r\n[02:22.65]不害怕搞砸一切\r\n[02:25.27]拥有你就拥有 全世界\r\n[02:29.23]\r\n[02:30.31]亲爱的 爱上你\r\n[02:33.58]从那天起\r\n[02:36.03]\r\n[02:36.60]甜蜜的很轻易\r\n[02:39.65]\r\n[02:40.94]亲爱的 别任性\r\n[02:44.20]你的眼睛\r\n[02:46.70]\r\n[02:47.26]在说我愿意\r\n[02:50.81]\r\n[02:51.76]亲爱的 爱上你\r\n[02:54.52]\r\n[02:55.05]恋爱日记\r\n[02:57.30]\r\n[02:57.93]飘香水的回忆\r\n[03:00.72]\r\n[03:02.33]一整瓶 的梦境\r\n[03:05.42]全都有你\r\n[03:07.91]\r\n[03:08.64]搅拌在一起\r\n[03:11.39]\r\n[03:13.02]亲爱的别任性\r\n[03:16.23]你的眼睛\r\n[03:19.99]\r\n[03:21.31]在说我愿意', '/music/song/1615192421638告白气球 - 周杰伦.mp3', 64, '华语,流行');
INSERT INTO `song` VALUES (31, 3, '搁浅', '七里香', '2021-03-08', '2022-03-19', '/img/songPic/1615192953529搁浅.jpg', '[00:00.00]搁浅 - 周杰伦 (Jay Chou)\r\n[00:05.44]词：宋健彰\r\n[00:10.89]曲：周杰伦\r\n[00:16.34]久未放晴的天空\r\n[00:20.13]依旧留着你的笑容\r\n[00:24.25]哭过却无法掩埋歉疚\r\n[00:30.95]\r\n[00:31.92]风筝在阴天搁浅\r\n[00:35.33]\r\n[00:35.87]想念还在等待救援\r\n[00:39.48]\r\n[00:40.02]我拉着线复习你给的温柔\r\n[00:46.08]\r\n[00:46.67]曝晒在一旁的寂寞\r\n[00:49.99]\r\n[00:50.72]笑我给不起承诺\r\n[00:53.98]怎么会怎么会你竟原谅了我\r\n[01:00.29]\r\n[01:01.05]我只能永远读着对白\r\n[01:05.61]读着我给你的伤害\r\n[01:09.53]我原谅不了我\r\n[01:12.19]就请你当作我已不在\r\n[01:16.78]我睁开双眼看着空白\r\n[01:21.26]忘记你对我的期待\r\n[01:25.29]读完了依赖\r\n[01:27.91]我很快就离开\r\n[01:34.02]\r\n[01:54.05]久未放晴的天空\r\n[01:57.94]依旧留着你的笑容\r\n[02:01.79]\r\n[02:02.30]哭过却无法掩埋歉疚\r\n[02:08.58]\r\n[02:09.64]风筝在阴天搁浅\r\n[02:12.91]\r\n[02:13.50]想念还在等待救援\r\n[02:18.41]我拉着线复习你给的温柔\r\n[02:23.72]\r\n[02:24.29]曝晒在一旁的寂寞\r\n[02:27.55]\r\n[02:28.52]笑我给不起承诺\r\n[02:31.80]怎么会怎么会你竟原谅了我\r\n[02:38.17]\r\n[02:39.01]我只能永远读着对白\r\n[02:43.32]读着我给你的伤害\r\n[02:47.30]我原谅不了我\r\n[02:50.06]就请你当作我已不在\r\n[02:54.58]我睁开双眼看着空白\r\n[02:58.95]忘记你对我的期待\r\n[03:02.98]读完了依赖\r\n[03:05.06]\r\n[03:05.78]我很快就\r\n[03:07.91]\r\n[03:08.98]我只能永远读着对白\r\n[03:14.63]读着我给你的伤害\r\n[03:18.53]我原谅不了我\r\n[03:21.27]就请你当作我已不在\r\n[03:25.24]\r\n[03:26.10]我睁开双眼看着空白\r\n[03:30.20]忘记你对我的期待\r\n[03:34.18]读完了依赖\r\n[03:36.39]\r\n[03:37.05]我很快就离开', '/music/song/1615192900580周杰伦 - 搁浅.mp3', 40, '华语,选项8,民谣');
INSERT INTO `song` VALUES (32, 3, '最长的电影', '我很忙', '2021-03-08', '2022-03-19', '/img/songPic/1615193210812最长的电影.jpg', '[00:00.00]最长的电影 (The Longest Movie) - 周杰伦 (Jay Chou)\r\n[00:03.10]词：周杰伦\r\n[00:06.20]曲：周杰伦\r\n[00:09.30]编曲：钟兴民\r\n[00:12.40]制作人：周杰伦\r\n[00:15.50]我们的开始\r\n[00:19.35]是很长的电影\r\n[00:23.38]放映了三年\r\n[00:26.87]我票都还留着\r\n[00:31.44]冰上的芭蕾\r\n[00:35.42]脑海中还在旋转\r\n[00:40.24]望着你 慢慢忘记你\r\n[00:47.33]朦胧的时间\r\n[00:51.12]我们溜了多远\r\n[00:55.16]冰刀划的圈\r\n[00:58.66]圈起了谁改变\r\n[01:02.98]如果再重来\r\n[01:07.07]会不会稍嫌狼狈\r\n[01:11.58]爱是不是不开口才珍贵\r\n[01:18.35]再给我两分钟\r\n[01:22.33]让我把记忆结成冰\r\n[01:26.31]别融化了眼泪\r\n[01:29.31]你妆都花了要我怎么记得\r\n[01:34.21]记得你叫我忘了吧\r\n[01:38.33]记得你叫我忘了吧\r\n[01:43.05]你说你会哭\r\n[01:45.17]不是因为在乎\r\n[02:02.63]朦胧的时间\r\n[02:06.52]我们溜了多远\r\n[02:10.48]冰刀划的圈\r\n[02:13.88]圈起了谁改变\r\n[02:18.44]如果再重来\r\n[02:22.42]会不会稍嫌狼狈\r\n[02:27.10]爱是不是不开口才珍贵\r\n[02:33.69]再给我两分钟\r\n[02:37.71]让我把记忆结成冰\r\n[02:41.67]别融化了眼泪\r\n[02:44.61]你妆都花了要我怎么记得\r\n[02:49.65]记得你叫我忘了吧\r\n[02:53.60]记得你叫我忘了吧\r\n[02:58.43]你说你会哭\r\n[03:00.50]不是因为在乎\r\n[03:05.46]再给我两分钟\r\n[03:09.45]让我把记忆结成冰\r\n[03:13.38]别融化了眼泪\r\n[03:16.45]你妆都花了要我怎么记得\r\n[03:21.35]记得你叫我忘了吧\r\n[03:25.32]记得你叫我忘了吧\r\n[03:32.30]你说你会哭\r\n[03:34.23]不是因为在乎', '/music/song/1615193040208周杰伦 - 最长的电影.mp3', 42, '华语');
INSERT INTO `song` VALUES (33, 3, '青花瓷（live）', '我很忙', '2021-03-08', '2022-03-19', '/img/songPic/1615193282992最长的电影.jpg', '[00:00.00]青花瓷 - 周杰伦 (Jay Chou)\r\n[00:05.49]词：方文山\r\n[00:10.98]曲：周杰伦\r\n[00:16.47]编曲：钟兴民\r\n[00:21.97]素胚勾勒出青花笔锋浓转淡\r\n[00:26.22]瓶身描绘的牡丹一如你初妆\r\n[00:30.70]冉冉檀香透过窗心事我了然\r\n[00:35.18]宣纸上走笔至此搁一半\r\n[00:39.62]釉色渲染仕女图韵味被私藏\r\n[00:44.03]而你嫣然的一笑如含苞待放\r\n[00:48.45]你的美一缕飘散\r\n[00:50.92]去到我去不了的地方\r\n[00:57.35]天青色等烟雨 而我在等你\r\n[01:01.75]炊烟袅袅升起 隔江千万里\r\n[01:06.26]在瓶底书汉隶仿前朝的飘逸\r\n[01:10.71]就当我为遇见你伏笔\r\n[01:15.13]天青色等烟雨 而我在等你\r\n[01:19.59]月色被打捞起 晕开了结局\r\n[01:24.05]如传世的青花瓷自顾自美丽\r\n[01:27.97]你眼带笑意\r\n[01:50.72]色白花青的锦鲤跃然于碗底\r\n[01:55.17]临摹宋体落款时却惦记着你\r\n[01:59.63]你隐藏在窑烧里千年的秘密\r\n[02:04.13]极细腻犹如绣花针落地\r\n[02:08.48]帘外芭蕉惹骤雨门环惹铜绿\r\n[02:12.97]而我路过那江南小镇惹了你\r\n[02:17.33]在泼墨山水画里\r\n[02:19.88]你从墨色深处被隐去\r\n[02:26.26]天青色等烟雨 而我在等你\r\n[02:30.69]炊烟袅袅升起 隔江千万里\r\n[02:35.17]在瓶底书汉隶仿前朝的飘逸\r\n[02:39.62]就当我为遇见你伏笔\r\n[02:44.08]天青色等烟雨 而我在等你\r\n[02:48.46]月色被打捞起 晕开了结局\r\n[02:52.98]如传世的青花瓷自顾自美丽\r\n[02:56.84]你眼带笑意\r\n[03:01.79]天青色等烟雨 而我在等你\r\n[03:06.23]炊烟袅袅升起 隔江千万里\r\n[03:10.72]在瓶底书汉隶仿前朝的飘逸\r\n[03:15.15]就当我为遇见你伏笔\r\n[03:19.65]天青色等烟雨 而我在等你\r\n[03:24.05]月色被打捞起 晕开了结局\r\n[03:28.45]如传世的青花瓷自顾自美丽\r\n[03:32.40]你眼带笑意', '/music/song/1615193273179青花瓷 周杰伦.mp3', 39, '华语,流行,选项8');
INSERT INTO `song` VALUES (35, 4, '浮夸', 'U-87', '2021-03-08', '2022-03-19', '/img/songPic/1615196666825浮夸.jpg', '[00:00.00]浮夸 (Depression) - 陈奕迅 (Eason Chan)\r\n[00:09.74]词：黄伟文\r\n[00:19.48]曲：C.Y. Kong\r\n[00:29.22]有人问我 我就会讲\r\n[00:32.44]但是无人来\r\n[00:34.25]\r\n[00:36.26]我期待 到无奈\r\n[00:38.31]有话要讲 得不到装载\r\n[00:41.79]\r\n[00:42.65]我的心情犹像樽盖等被揭开\r\n[00:47.06]嘴巴却在养青苔\r\n[00:49.70]人潮内 愈文静\r\n[00:51.61]愈变得 不受理睬\r\n[00:53.92]自己要搞出意外\r\n[00:56.53]像突然地高歌\r\n[00:59.86]\r\n[01:00.38]任何地方也像开四面台\r\n[01:03.93]着最闪的衫 扮十分感慨\r\n[01:07.66]有人来拍照 要记住插袋\r\n[01:11.09]\r\n[01:11.92]你当我是浮夸吧\r\n[01:14.92]\r\n[01:15.58]夸张只因我很怕\r\n[01:18.60]\r\n[01:19.16]似木头 似石头的话\r\n[01:22.46]得到注意吗\r\n[01:24.36]\r\n[01:24.87]其实怕被忘记\r\n[01:26.87]至放大来演吧\r\n[01:30.03]很不安 怎去优雅\r\n[01:32.97]\r\n[01:33.52]世上还赞颂沉默吗\r\n[01:36.86]不够爆炸\r\n[01:39.01]\r\n[01:39.89]怎么有话题 让我夸\r\n[01:43.24]做大娱乐家\r\n[01:45.15]\r\n[01:51.53]那年十八 母校舞会\r\n[01:54.86]站着如喽罗\r\n[01:56.65]\r\n[01:58.57]那时候 我含泪\r\n[02:00.47]发誓各位 必须看到我\r\n[02:03.71]\r\n[02:05.17]在世间平凡又普通的路太多\r\n[02:08.67]\r\n[02:09.41]屋村你住哪一座\r\n[02:12.04]情爱中 工作中\r\n[02:13.92]受过的忽视太多\r\n[02:16.30]自尊已饱经跌堕\r\n[02:19.01]重视能治肚饿\r\n[02:22.71]未曾获得过 便知我为何\r\n[02:26.17]大动作很多 犯下这些错\r\n[02:29.96]搏人们看看我 算病态么\r\n[02:33.46]\r\n[02:34.25]你当我是浮夸吧\r\n[02:37.90]夸张只因我很怕\r\n[02:41.55]似木头 似石头的话\r\n[02:44.81]得到注意吗\r\n[02:46.53]\r\n[02:47.21]其实怕被忘记\r\n[02:49.37]至放大来演吧\r\n[02:51.76]\r\n[02:52.54]很不安 怎去优雅\r\n[02:55.93]世上还赞颂沉默吗\r\n[02:58.91]\r\n[02:59.55]不够爆炸\r\n[03:01.06]\r\n[03:02.22]怎么有话题 让我夸\r\n[03:05.48]做大娱乐家\r\n[03:08.25]\r\n[03:20.19]幸运儿并不多\r\n[03:23.06]\r\n[03:23.69]若然未当过就知我为何\r\n[03:27.15]用十倍苦心 做突出一个\r\n[03:30.80]正常人够我 富议论性么\r\n[03:33.99]\r\n[03:35.32]你叫我做浮夸吧\r\n[03:38.47]\r\n[03:38.98]加几声嘘声也不怕\r\n[03:41.90]\r\n[03:42.56]我在场 有闷场的话\r\n[03:45.45]\r\n[03:46.00]表演你看吗 够歇斯底里吗\r\n[03:50.22]以眼泪淋花吧\r\n[03:52.64]\r\n[03:53.66]一心只想你惊讶\r\n[03:56.17]\r\n[03:56.85]我旧时似未存在吗\r\n[03:59.78]\r\n[04:00.51]加重注码 青筋也现形\r\n[04:05.05]话我知 现在存在吗\r\n[04:08.89]\r\n[04:10.85]凝视我 别再只看天花\r\n[04:13.60]\r\n[04:18.85]我非你杯茶 也可尽情地喝吧\r\n[04:22.96]\r\n[04:24.78]别遗忘有人在 为你声沙', '/music/song/1615196615818陈奕迅 - 浮夸.mp3', 29, '粤语,摇滚,流行');
INSERT INTO `song` VALUES (36, 4, 'K歌之王 (粤语)', '打得火热', '2021-03-08', '2022-03-19', '/img/songPic/1615196860561k歌之王.jpg', '[00:00.00]K歌之王 (粤语) - 陈奕迅 (Eason Chan)\r\n[00:03.39]\r\n[00:06.78]曲：陈辉阳\r\n[00:10.18]编曲：陈辉阳\r\n[00:13.57]我唱得不够动人你别皱眉\r\n[00:19.16]\r\n[00:20.23]我愿意和你约定至死\r\n[00:25.75]我只想嬉戏唱游到下世纪\r\n[00:32.47]请你别嫌我将这煽情奉献给你\r\n[00:38.14]\r\n[00:39.50]还能凭什么\r\n[00:42.61]拥抱若未令你兴奋\r\n[00:45.72]便宜地唱出写在情歌的性感\r\n[00:51.78]还能凭什么要是爱不可感动人\r\n[00:57.78]俗套的歌词煽动你恻忍\r\n[01:04.11]谁人又相信一世一生这肤浅对白\r\n[01:10.05]来吧送给你叫几百万人流泪过的歌\r\n[01:16.09]如从未听过誓言如幸福摩天轮\r\n[01:21.77]才令我因你要呼天叫地\r\n[01:25.83]爱爱爱爱那么多\r\n[01:27.98]将我漫天心血一一抛到银河\r\n[01:34.44]\r\n[01:35.77]谁是垃圾谁不舍我难过\r\n[01:41.43]分一丁目赠我\r\n[01:44.50]\r\n[01:55.76]我唱出心里话时眼泪会流\r\n[02:01.64]\r\n[02:02.46]要是怕难过抱住我手\r\n[02:07.81]我只得千语万言放在你心\r\n[02:14.43]比渴望地老天荒更简单未算罕有\r\n[02:19.84]谁人又相信一世一生这肤浅对白\r\n[02:25.80]来吧送给你叫几百万人流泪过的歌\r\n[02:32.02]如从未听过誓言如幸福摩天轮\r\n[02:37.62]才令我因你要呼天叫地\r\n[02:41.75]爱爱爱爱那么多\r\n[02:43.95]给你用力作二十首不舍不弃\r\n[02:47.51]还附送你爱得过火\r\n[02:49.85]给你卖力唱二十首真心真意\r\n[02:53.42]米高峰都因我动容\r\n[02:56.16]无人及我\r\n[02:57.71]你怎么竟然说K歌之王是我\r\n[03:04.60]\r\n[03:08.19]我只想跟你未来浸在爱河\r\n[03:14.66]\r\n[03:15.39]而你那呵欠绝得不能绝\r\n[03:19.94]绝到溶掉我', '/music/song/1615196816349陈奕迅 - K歌之王(粤语版).mp3', 20, '粤语,摇滚,流行');
INSERT INTO `song` VALUES (37, 4, '是但求其爱', '是但求其爱', '2021-03-08', '2022-03-19', '/img/songPic/1615196971224是但求其爱.jpg', '[00:00.00]是但求其爱 - 陈奕迅 (Eason Chan)\r\n[00:00.31]词：小克\r\n[00:00.40]曲：林家谦\r\n[00:00.52]编曲：林家谦\r\n[00:00.68]监制：陈奕迅/林家谦\r\n[00:00.98]若爱是但求开心 我问\r\n[00:05.14]\r\n[00:05.80]要不要求其伤心\r\n[00:10.42]\r\n[00:24.09]论尽半生不懂爱\r\n[00:27.13]\r\n[00:29.47]回头没有心计 划未来\r\n[00:33.64]\r\n[00:34.67]才来独处 好好检讨 什么叫爱\r\n[00:40.84]\r\n[00:42.28]你 便 来\r\n[00:44.20]\r\n[00:45.08]混乱里结识到你\r\n[00:47.92]\r\n[00:50.29]浪漫叫一切 粉饰 同盼待\r\n[00:54.59]\r\n[00:55.49]某一刹骤觉 感情深得可爱\r\n[01:01.28]\r\n[01:01.96]在倾吐那刻 回响\r\n[01:06.45]\r\n[01:07.12]感情 从不是爱\r\n[01:11.02]\r\n[01:13.93]若爱是但求终身 你问\r\n[01:18.51]\r\n[01:19.03]怕只怕求其终生 被困\r\n[01:23.49]\r\n[01:24.17]你宠爱父母亲\r\n[01:26.80]我为良朋怜悯\r\n[01:29.50]怎都算是个好人\r\n[01:32.24]\r\n[01:34.62]若爱是但求衷心 我问\r\n[01:39.11]\r\n[01:39.66]要不要求其忠心\r\n[01:44.60]\r\n[01:45.24]纵双方理念多相同\r\n[01:48.21]\r\n[01:49.23]却不相融\r\n[01:50.58]\r\n[01:51.46]莫论配衬\r\n[01:53.72]\r\n[02:11.21]再 会 时\r\n[02:12.88]\r\n[02:13.90]没料到深深拥抱\r\n[02:16.64]\r\n[02:18.95]合力擦出了 火花 和意外\r\n[02:23.37]\r\n[02:24.40]某一刹幻觉 恋情可一可再\r\n[02:29.76]\r\n[02:30.67]在参透那刻 回想\r\n[02:35.07]\r\n[02:36.02]恋情全不是 爱\r\n[02:40.78]\r\n[02:42.43]若爱是但求终身 你问\r\n[02:46.99]\r\n[02:47.53]怕只怕求其终生 被困\r\n[02:52.22]\r\n[02:52.92]你工作觅满分\r\n[02:55.29]我为前途勤奋\r\n[02:57.47]\r\n[02:58.00]怎可再另有心神\r\n[03:01.68]\r\n[03:03.16]若爱是但求衷心 我问\r\n[03:07.79]\r\n[03:08.39]要不要求其忠心\r\n[03:13.87]纵双方理念多相同\r\n[03:17.05]\r\n[03:17.67]却不相融\r\n[03:19.49]\r\n[03:20.29]莫论配衬\r\n[03:22.91]\r\n[03:24.37]若爱是但求 安心\r\n[03:27.99]\r\n[03:29.37]怕只怕求其 安稳\r\n[03:33.67]\r\n[03:44.85]若爱是但求今生 抱憾\r\n[03:50.32]要不要求其他生\r\n[03:55.61]看双方各自的本能\r\n[03:58.93]\r\n[03:59.47]爱的伤痕\r\n[04:01.31]\r\n[04:01.87]极度配衬\r\n[04:04.32]\r\n[04:06.37]爱七色五味多纷陈\r\n[04:09.82]\r\n[04:10.91]更多灰尘\r\n[04:12.96]\r\n[04:14.73]落入五蕴', '/music/song/1615196961729陈奕迅 - 是但求其爱.mp3', 23, '粤语,民谣,选项8');
INSERT INTO `song` VALUES (38, 4, '遥远的她 (Live)', 'Eason & Friends 903 Id Club', '2021-03-08', '2022-03-19', '/img/songPic/1615197062836遥远的她.jpg', '[00:00.00]遥远的她 (Live) - 陈奕迅 (Eason Chan)\r\n[00:07.56]词：潘源良\r\n[00:15.13]曲：谷村新司\r\n[00:22.70]编曲：卢东尼\r\n[00:30.27]让晚风轻轻吹送了落霞\r\n[00:34.96]\r\n[00:36.17]我已习惯每个傍晚去想她\r\n[00:40.94]\r\n[00:42.89]在远方的她此刻可知道\r\n[00:48.58]\r\n[00:49.36]这段情在我心始终记挂\r\n[00:54.26]\r\n[00:55.82]在这半山那天\r\n[00:57.92]我知我知快将要别离没说话\r\n[01:01.20]\r\n[01:02.81]夜雨中\r\n[01:03.99]似听到她说不要相约纵使分隔\r\n[01:06.61]相爱不会害怕\r\n[01:08.89]遥遥万里\r\n[01:11.23]心声有否偏差\r\n[01:14.46]\r\n[01:15.77]正是让这爱\r\n[01:18.30]试出真与假\r\n[01:21.84]遥远的她\r\n[01:23.75]\r\n[01:24.42]可知我心中的说话\r\n[01:28.30]\r\n[01:29.19]热情若无变\r\n[01:31.16]哪管她沧桑变化\r\n[01:36.73]\r\n[01:49.16]但这天收到她爸爸的一封信\r\n[01:54.38]\r\n[01:55.40]信里面说血癌已带走她\r\n[01:59.96]\r\n[02:02.29]但觉得空虚的心仿佛已僵化\r\n[02:08.68]过去事像炮弹心中爆炸\r\n[02:13.48]\r\n[02:15.25]在这半山这天\r\n[02:17.46]我悲痛悲痛不已再胡乱说话\r\n[02:20.27]\r\n[02:21.58]夜雨中似听到她说不要相约\r\n[02:24.80]纵使分隔相爱不会害怕\r\n[02:27.72]遥遥万里\r\n[02:29.06]\r\n[02:29.82]心声有否偏差\r\n[02:34.29]正是让这爱\r\n[02:36.60]试出真与假\r\n[02:40.20]遥远的她\r\n[02:42.58]仿佛借风声跟我话\r\n[02:46.46]\r\n[02:47.28]热情若无变\r\n[02:48.66]\r\n[02:49.28]哪管她沧桑变化\r\n[02:52.93]\r\n[03:18.51]遥远的她\r\n[03:20.50]不可以再归家\r\n[03:24.33]\r\n[03:24.87]我在梦里却\r\n[03:26.57]\r\n[03:27.17]始终只有她\r\n[03:30.25]\r\n[03:31.09]遥远的她\r\n[03:33.19]仿佛借风声跟我话\r\n[03:36.16]\r\n[03:37.24]热情若无变\r\n[03:39.73]哪管她沧桑变化\r\n[03:43.56]遥远的她\r\n[03:45.66]不可以再归家\r\n[03:49.36]\r\n[03:50.06]我在梦里却\r\n[03:52.40]始终只有她\r\n[03:56.15]遥远的她\r\n[03:58.39]仿佛借风声跟我话\r\n[04:02.08]\r\n[04:02.71]热情若无变\r\n[04:04.88]哪管她沧桑变化\r\n[04:09.07]啊', '/music/song/1615197054204陈奕迅 - 遥远的她 (Live).mp3', 23, '粤语,流行,选项8');
INSERT INTO `song` VALUES (39, 5, '红豆', '唱游', '2021-03-08', '2022-03-19', '/img/songPic/1615197410898红豆.jpg', '[00:00.00]红豆 (Lovesick) - 王菲 (Faye Wong)\r\n[00:04.12]词：林夕\r\n[00:08.25]曲：柳重言\r\n[00:12.38]编曲：辛伟力\r\n[00:16.51]还没好好的感受\r\n[00:20.53]雪花绽放的气候\r\n[00:24.95]我们一起颤抖 会更明白\r\n[00:30.34]什么是温柔\r\n[00:33.51]还没跟你牵着手\r\n[00:37.80]走过荒芜的沙丘\r\n[00:42.05]可能从此以后\r\n[00:45.30]学会珍惜天长和地久\r\n[00:50.76]有时候 有时候\r\n[00:55.01]我会相信一切有尽头\r\n[00:59.25]相聚离开 都有时候\r\n[01:03.55]没有什么会永垂不朽\r\n[01:07.81]可是我 有时候\r\n[01:12.10]宁愿选择留恋不放手\r\n[01:16.35]等到风景都看透\r\n[01:20.72]也许你会陪我 看细水长流\r\n[01:42.20]还没为你把红豆\r\n[01:46.36]熬成缠绵的伤口\r\n[01:50.64]然后一起分享 会更明白\r\n[01:56.03]相思的哀愁\r\n[01:59.20]还没好好的感受\r\n[02:03.50]醒着亲吻的温柔\r\n[02:07.79]可能在我左右 你才追求\r\n[02:13.16]孤独的自由\r\n[02:18.47]有时候 有时候\r\n[02:22.84]我会相信一切有尽头\r\n[02:27.08]相聚离开 都有时候\r\n[02:31.37]没有什么会永垂不朽\r\n[02:35.71]可是我 有时候\r\n[02:39.93]宁愿选择留恋不放手\r\n[02:44.27]等到风景都看透\r\n[02:48.54]也许你会陪我 看细水长流\r\n[03:07.88]有时候 有时候\r\n[03:12.13]我会相信一切有尽头\r\n[03:16.37]相聚离开 都有时候\r\n[03:20.69]没有什么会永垂不朽\r\n[03:24.97]可是我 有时候\r\n[03:29.25]宁愿选择留恋不放手\r\n[03:33.55]等到风景都看透\r\n[03:37.84]也许你会陪我看细水长流', '/music/song/1615197402989红豆-王菲.mp3', 25, '华语,民谣,选项8');
INSERT INTO `song` VALUES (40, 5, '匆匆那年', '', '2021-03-08', '2022-03-19', '/img/songPic/1615197506284匆匆那年.jpg', '[00:00.00]匆匆那年 (Fleet of Time) - 王菲 (Faye Wong)\n[00:11.49]词：林夕\n[00:20.99]曲：梁翘柏\n[00:30.49]匆匆那年我们\n[00:31.74]究竟说了几遍\n[00:33.20]再见之后再拖延\n[00:36.05]可惜谁有没有\n[00:37.31]爱过不是一场\n[00:38.73]七情上面的雄辩\n[00:41.88]匆匆那年我们\n[00:43.04]一时匆忙撂下\n[00:44.40]难以承受的诺言\n[00:47.25]只有等别人兑现\n[00:52.05]\n[00:53.12]不怪那吻痕还\n[00:55.67]没积累成茧\n[00:58.46]拥抱着冬眠也没能\n[01:01.81]羽化再成仙\n[01:04.09]不怪这一段情\n[01:06.88]没空反复再排练\n[01:09.67]是岁月宽容恩赐\n[01:13.92]反悔的时间\n[01:18.38]\n[01:20.73]如果再见不能红着眼\n[01:23.77]是否还能红着脸\n[01:26.71]就像那年匆促\n[01:28.04]刻下永远一起\n[01:29.44]那样美丽的谣言\n[01:31.88]如果过去还值得眷恋\n[01:35.04]别太快冰释前嫌\n[01:37.88]谁甘心就这样\n[01:40.76]彼此无挂也无牵\n[01:43.59]我们要互相亏欠\n[01:48.32]\n[01:49.17]要不然凭何怀缅\n[01:54.10]\n[02:00.53]匆匆那年我们\n[02:01.74]见过太少世面\n[02:03.20]只爱看同一张脸\n[02:06.07]那么莫名其妙\n[02:07.37]那么讨人欢喜\n[02:08.79]闹起来又太讨厌\n[02:11.71]相爱那年活该\n[02:12.96]匆匆因为我们\n[02:14.41]不懂顽固的诺言\n[02:17.28]只是分手的前言\n[02:22.01]\n[02:23.99]不怪那天太冷\n[02:25.67]泪滴水成冰\n[02:28.54]春风也一样没\n[02:31.33]吹进凝固的照片\n[02:34.18]不怪每一个人\n[02:36.93]没能完整爱一遍\n[02:39.82]是岁月善意落下\n[02:43.90]残缺的悬念\n[02:49.10]\n[02:50.72]如果再见不能红着眼\n[02:53.81]是否还能红着脸\n[02:56.70]就像那年匆促\n[02:58.06]刻下永远一起\n[02:59.49]那样美丽的谣言\n[03:01.73]如果过去还值得眷恋\n[03:05.17]别太快冰释前嫌\n[03:07.90]谁甘心就这样\n[03:10.74]彼此无挂也无牵\n[03:12.99]如果再见不能红着眼\n[03:16.46]是否还能红着脸\n[03:19.24]就像那年匆促\n[03:20.51]刻下永远一起\n[03:21.98]那样美丽的谣言\n[03:24.32]如果过去还值得眷恋\n[03:27.68]别太快冰释前嫌\n[03:30.42]谁甘心就这样\n[03:33.20]彼此无挂也无牵\n[03:36.06]我们要互相亏欠\n[03:41.62]我们要藕断丝连', '/music/song/1615197459883王菲 - 匆匆那年.mp3', 21, '华语,流行');
INSERT INTO `song` VALUES (41, 6, '喜欢你(live)', '我是歌手第二季 第6期', '2021-03-08', '2022-03-19', '/img/songPic/1615206324027喜欢你.jpg', '[00:00.00]喜欢你 (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:04.39]词：黄家驹\r\n[00:08.79]曲：黄家驹\r\n[00:13.19]细雨带风湿透黄昏的街道\r\n[00:19.45]抹去雨水双眼无故地仰望\r\n[00:24.99]望向孤单的晚灯\r\n[00:28.33]是那伤感的记忆\r\n[00:31.75]\r\n[00:35.52]再次泛起心里无数的思念\r\n[00:41.60]以往片刻欢笑仍挂在脸上\r\n[00:47.35]愿你此刻可会知\r\n[00:50.47]是我衷心的说声\r\n[00:53.80]\r\n[00:56.06]喜欢你 那双眼动人\r\n[01:02.07]笑声更迷人\r\n[01:05.24]愿再可 轻抚你\r\n[01:11.55]那可爱面容\r\n[01:14.74]挽手说梦话\r\n[01:17.81]像昨天 你共我\r\n[01:23.84]\r\n[01:28.82]满带理想的我曾经多冲动\r\n[01:35.21]抱怨与她相爱难有自由\r\n[01:40.75]愿你此刻可会知\r\n[01:44.21]是我衷心的说声\r\n[01:48.57]\r\n[01:49.45]喜欢你 那双眼动人\r\n[01:55.66]笑声更迷人\r\n[01:58.89]愿再可 轻抚你\r\n[02:05.16]那可爱面容\r\n[02:08.31]挽手说梦话\r\n[02:11.47]像昨天 你共我\r\n[02:17.57]\r\n[02:29.60]每晚夜里自我独行\r\n[02:33.67]随处荡 多冰冷\r\n[02:39.91]\r\n[02:42.35]以往为了自我挣扎\r\n[02:46.28]从不知 她的痛苦\r\n[02:54.30]\r\n[02:59.08]喜欢你 那双眼动人\r\n[03:05.22]笑声更迷人\r\n[03:08.34]愿再可 轻抚你\r\n[03:14.63]那可爱面容\r\n[03:17.88]挽手说梦话\r\n[03:20.98]像昨天 你共我\r\n[03:28.12]哦哦哦  哦哦\r\n[03:31.30]哦哦哦  哦哦\r\n[03:34.47]哦哦哦  哦哦\r\n[03:37.67]哦哦哦  哦哦\r\n[03:40.82]哦哦哦  哦哦\r\n[03:43.97]哦哦哦  哦哦\r\n[03:47.12]哦哦哦  哦哦\r\n[03:50.26]哦哦哦  哦哦\r\n[03:53.42]哦哦哦  哦哦\r\n[03:56.58]哦哦哦  哦哦\r\n[03:59.68]哦哦哦  哦哦', '/music/song/1615206303796G_E_M_ 邓紫棋 - 喜欢你 (Live).mp3', 35, '粤语,摇滚,流行');
INSERT INTO `song` VALUES (42, 6, '泡沫', '我是歌手第二季 第1期', '2021-03-08', '2022-03-19', '/img/songPic/1615206449252泡沫.jpg', '[00:00.00]泡沫 (The Foam) (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:01.77]词：G.E.M. 邓紫棋\r\n[00:03.55]曲：G.E.M. 邓紫棋\r\n[00:05.33]编曲：Lupo Groinig\r\n[00:07.11]阳光下的泡沫 是彩色的\r\n[00:12.03]\r\n[00:13.90]就像被骗的我 是幸福的\r\n[00:19.10]\r\n[00:20.98]追究什么对错 你的谎言\r\n[00:26.23]\r\n[00:28.05]基于你还爱我\r\n[00:30.30]\r\n[00:34.41]美丽的泡沫 虽然一刹花火\r\n[00:40.04]\r\n[00:41.04]你所有承诺 虽然都太脆弱\r\n[00:47.11]\r\n[00:48.25]但爱像泡沫 如果能够看破\r\n[00:54.07]\r\n[00:55.14]有什么难过\r\n[00:57.13]\r\n[01:03.43]早该知道泡沫 一触就破\r\n[01:08.34]\r\n[01:10.41]就像已伤的心 不胜折磨\r\n[01:15.58]\r\n[01:17.14]也不是谁的错 谎言再多\r\n[01:22.70]\r\n[01:24.32]基于你还爱我\r\n[01:27.03]\r\n[01:30.98]美丽的泡沫 虽然一刹花火\r\n[01:36.78]\r\n[01:37.60]你所有承诺 虽然都太脆弱\r\n[01:43.71]\r\n[01:44.59]爱本是泡沫 如果能够看破\r\n[01:50.77]\r\n[01:51.63]有什么难过\r\n[01:53.58]\r\n[01:59.03]再美的花朵 盛开过就凋落\r\n[02:04.86]\r\n[02:05.79]再亮眼的星 一闪过就坠落\r\n[02:11.92]\r\n[02:12.85]爱本是泡沫 如果能够看破\r\n[02:18.24]\r\n[02:19.73]有什么难过 为什么难过\r\n[02:29.23]\r\n[02:34.41]有什么难过 为什么难过\r\n[02:44.02]\r\n[02:55.54]全都是泡沫 只一刹的花火\r\n[03:01.66]\r\n[03:02.22]你所有承诺 全部都太脆弱\r\n[03:08.25]\r\n[03:09.12]而你的轮廓 怪我没有看破\r\n[03:15.49]\r\n[03:16.23]才如此难过\r\n[03:18.29]\r\n[03:23.45]相爱的把握 要如何再搜索\r\n[03:29.27]\r\n[03:30.27]相拥着寂寞 难道就不寂寞\r\n[03:36.52]\r\n[03:37.38]爱本是泡沫 怪我没有看破\r\n[03:43.56]\r\n[03:44.49]才如此难过\r\n[03:46.43]\r\n[03:52.92]在雨下的泡沫 一触就破\r\n[03:57.74]\r\n[03:59.62]当初炽热的心 早已沉没\r\n[04:04.89]\r\n[04:06.76]说什么你爱我 如果骗我\r\n[04:12.12]\r\n[04:13.99]我宁愿你沉默', '/music/song/1615206438965G_E_M_ 邓紫棋 - 泡沫 (Live).mp3', 22, '华语,流行');
INSERT INTO `song` VALUES (43, 6, '你把我灌醉', '我是歌手第二季 第1期', '2021-03-08', '2022-03-19', '/img/songPic/1615206709765你把我灌醉.jpg', '[00:00.00]你把我灌醉 (Intoxicated) (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:05.09]词：姚若龙\r\n[00:10.19]曲：黄大炜\r\n[00:15.29]编曲：LUPO GROINIG\r\n[00:20.39]开 往城市边缘开\r\n[00:26.19]把车窗都摇下来\r\n[00:30.26]用速度换一点痛快\r\n[00:35.63]孤单被热闹的夜赶出来\r\n[00:42.16]却无从告白 是你留给我的悲哀\r\n[00:51.63]哦 爱 让我变得看不开\r\n[00:59.53]哦 爱 让我自找伤害\r\n[01:07.25]你把我灌醉 你让我流泪\r\n[01:15.19]扛下了所有罪 我拼命挽回\r\n[01:23.25]你把我灌醉 你让我心碎\r\n[01:31.28]爱得收不回 唔\r\n[01:41.32]\r\n[01:52.28]猜 最好最坏都猜\r\n[01:58.02]你为何离开\r\n[02:01.98]可惜永远没有答案\r\n[02:07.72]对我 你爱的太晚\r\n[02:13.96]又走的太快 我的心你不明白\r\n[02:23.65]哦 爱 让我变得看不开\r\n[02:31.31]哦 爱 让我自找伤害\r\n[02:39.25]你把我灌醉 你让我流泪\r\n[02:47.22]扛下了所有罪 我拼命挽回\r\n[02:55.22]你把我灌醉 你让我心碎\r\n[03:03.23]爱得收不回 唔\r\n[03:13.79]\r\n[03:17.97]我梦到哪里\r\n[03:19.59]你都在 怎么能忘怀\r\n[03:28.19]\r\n[03:34.23]你那神秘的笑脸 是不是说\r\n[03:43.95]放不下你 是我活该\r\n[03:47.19]\r\n[03:57.19]你把我灌醉 你让我流泪\r\n[04:05.24]扛下了所有罪 我拼命挽回\r\n[04:12.23]\r\n[04:13.52]你把我灌醉 你让我心碎\r\n[04:21.28]爱得收不回 唔', '/music/song/1615206503413G_E_M_ 邓紫棋 - 你把我灌醉 (Live).mp3', 13, '华语,选项8');
INSERT INTO `song` VALUES (44, 6, 'If I Were A Boy', '我是歌手第二季 第1期', '2021-03-08', '2022-03-19', '/img/songPic/1615206883441ifiwereaboy.jpg', '[00:00.00]If I Were A Boy (假如我是一个男孩) (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:06.32]Written by：Toby Gad/BC Jean/Glenn Ballard/Alanis Morissette\r\n[00:12.65]If I were a boy Even just for one day\r\n[00:19.98]\r\n[00:23.62]I\' roll out of bed in the morning\r\n[00:27.14]And throw on what I wanted and go\r\n[00:30.49]\r\n[00:33.86]Drink beer with the guys and chase after girls\r\n[00:42.49]\r\n[00:45.37]I\'d kick it with who I wanted\r\n[00:48.38]And I\'d never get confronted for it\r\n[00:52.22]Because they\'d stick up for me\r\n[00:54.71]\r\n[00:55.22]If I were a boy I think I could understand\r\n[01:03.38]\r\n[01:06.84]How it feels to love a girl\r\n[01:09.82]I swear I\'d be a better man\r\n[01:14.11]\r\n[01:16.48]I\'d listen to her\r\n[01:19.63]\r\n[01:21.56]Cause I know how it hurts\r\n[01:25.15]\r\n[01:28.38]When you lose the one you wanted\r\n[01:31.04]Cause he\'s taken you for granted\r\n[01:33.45]And everything you had got destroyed\r\n[01:38.00]If I were a boy I would turn off my phone\r\n[01:46.36]\r\n[01:49.86]Tell everyone its broken\r\n[01:52.48]So they think that I was sleeping alone\r\n[01:56.73]\r\n[01:59.24]I\'d put myself first And make the rules as I go\r\n[02:07.35]\r\n[02:10.98]Cause I know that she\'d be faithful\r\n[02:14.35]Waiting for me to come home to come home\r\n[02:20.57]If I were a boy I think I could understand\r\n[02:28.55]\r\n[02:32.14]How it feels to love a girl\r\n[02:35.01]I swear I\'d be a better man\r\n[02:39.19]\r\n[02:41.94]I\'d listen to her Cause I know how it hurts\r\n[02:50.45]\r\n[02:53.54]When you lose the one you wanted\r\n[02:56.31]Cause he\'s taken you for granted\r\n[02:59.07]And everything you had got destroyed\r\n[03:04.09]\r\n[03:05.68]It\'s a little too late for you to come back\r\n[03:10.77]Say its just a mistake\r\n[03:13.17]Think I forgive you like that\r\n[03:16.20]If you thought I would\r\n[03:18.29]Wait for you you thought wrong\r\n[03:25.80]\r\n[03:30.18]But you\'re just a boy You don\'t understand\r\n[03:37.43]Yea you don\'t understand\r\n[03:40.44]\r\n[03:41.76]How it feels to love a girl\r\n[03:43.86]Someday you\'ll wish you were a better man\r\n[03:48.54]\r\n[03:50.73]You don\'t listen to her\r\n[03:54.76]\r\n[03:55.77]And you don\'t care how it hurt\r\n[04:01.09]\r\n[04:02.71]Until you lose the one you wanted\r\n[04:05.63]Cause you\'ve taken her for granted\r\n[04:08.47]You lose the one you wanted\r\n[04:11.04]You\'ve taken her for granted\r\n[04:13.73]You lose the one you wanted\r\n[04:16.21]You\'ve taken her for granted\r\n[04:19.14]And everything you had got destroyed\r\n[04:27.31]\r\n[04:32.37]But you\'re just a boy', '/music/song/1615206655195G_E_M_ 邓紫棋 - If I Were A Boy (Live).mp3', 26, '欧美,流行,华语');
INSERT INTO `song` VALUES (45, 6, '失真', 'Xposed', '2021-03-08', '2022-03-19', '/img/songPic/1615206887799失真.jpg', '[00:00.00]失真 - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:05.17]词：G.E.M.邓紫棋\r\n[00:10.35]曲：Fung @goldEN\r\n[00:15.52]编曲：Lupo Groinig\r\n[00:20.70]这摄录相机\r\n[00:21.87]\r\n[00:22.58]影过你与我的心\r\n[00:24.34]\r\n[00:25.23]情深记录每一分\r\n[00:28.87]\r\n[00:31.55]但这夜镜头中\r\n[00:33.59]我却看见你转身\r\n[00:35.42]\r\n[00:36.42]留低这冰冷余温\r\n[00:40.53]\r\n[00:41.99]让我发觉天渐暗\r\n[00:45.32]\r\n[00:48.35]曾以为会直到\r\n[00:49.85]\r\n[00:50.38]永远再远也相拥\r\n[00:52.21]\r\n[00:53.87]一转眼却够钟目送\r\n[00:56.43]\r\n[00:59.42]别对白太俗套\r\n[01:00.96]\r\n[01:01.58]转角有个更加好\r\n[01:03.44]\r\n[01:04.01]心痛怎形容\r\n[01:05.69]怎形容\r\n[01:06.74]被你抛开感觉真刺痛\r\n[01:11.53]\r\n[01:16.31]过去极勇敢\r\n[01:17.49]\r\n[01:18.23]爱到冷暖也不分\r\n[01:20.10]\r\n[01:21.09]寒冬炽夏也捉紧\r\n[01:24.71]\r\n[01:27.35]但耗尽了情感\r\n[01:28.81]\r\n[01:29.38]过去再美也失真\r\n[01:31.37]\r\n[01:32.25]留低只不过残忍\r\n[01:35.85]\r\n[01:37.77]夜了谁人愿行近\r\n[01:41.95]\r\n[01:44.16]曾以为会直到\r\n[01:45.60]\r\n[01:46.13]永远再远也相拥\r\n[01:48.46]\r\n[01:49.62]一转眼却够钟目送\r\n[01:52.56]\r\n[01:55.24]别对白太俗套\r\n[01:56.64]\r\n[01:57.29]转角有个更加好\r\n[01:59.80]心痛怎形容\r\n[02:01.37]怎形容\r\n[02:02.54]被你抛开感觉真刺痛\r\n[02:07.15]\r\n[02:28.83]若有日再遇到\r\n[02:30.70]盼你看见我的好\r\n[02:32.61]\r\n[02:34.63]再次靠向这怀抱\r\n[02:36.77]\r\n[02:39.95]独个面对无数\r\n[02:41.33]\r\n[02:41.95]每个深宵与清早\r\n[02:44.45]心痛怎形容\r\n[02:45.97]怎形容\r\n[02:46.62]\r\n[02:47.17]是这孤单感觉失重\r\n[02:49.90]\r\n[02:51.36]曾以为会直到\r\n[02:52.59]\r\n[02:53.11]永远再远也相拥\r\n[02:55.28]\r\n[02:56.96]一转眼却够钟目送\r\n[02:59.22]\r\n[03:02.25]别对白太俗套\r\n[03:03.64]\r\n[03:04.25]转角有个更加好\r\n[03:06.78]心痛怎形容\r\n[03:08.29]怎形容\r\n[03:08.98]\r\n[03:09.49]被你抛开感觉真刺痛\r\n[03:14.44]谁记得褪色黑白照片中\r\n[03:17.46]\r\n[03:19.92]是哪些最深感动与青葱\r\n[03:23.22]\r\n[03:24.70]当天对焦的心再真\r\n[03:28.09]最终都一个人\r\n[03:30.38]\r\n[03:32.35]谁愿再次失陷\r\n[03:34.34]\r\n[03:35.83]原来爱情始终\r\n[03:37.13]\r\n[03:37.80]不过霎眼清风\r\n[03:39.88]\r\n[03:40.52]而这一刻我先懂', '/music/song/1615206872591G_E_M_ 邓紫棋 - 失真.mp3', 18, '粤语,摇滚');
INSERT INTO `song` VALUES (46, 6, 'Falling', '我是歌手第二季 第10期', '2021-03-08', '2022-03-19', '/img/songPic/1615207031446falling.jpg', '[00:00.00]Falling (沉沦) (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:05.04]词：Alicia Keys\r\n[00:10.08]曲：Alicia Keys\r\n[00:15.12]I keep on fallin\'\r\n[00:35.88]In and out of love with you\r\n[00:58.94]Sometimes I love ya\r\n[01:04.22]Sometimes you make me blue\r\n[01:09.58]Sometimes I feel good\r\n[01:13.45]At times I feel used\r\n[01:17.26]Lovin you darlin\'\r\n[01:20.60]Makes me so confused\r\n[01:23.64]I keep on fallin\'\r\n[01:26.65]In and out of love with you\r\n[01:31.72]I never loved someone\r\n[01:36.20]Way that I loved you\r\n[01:39.24]Oh oh oh   never felt this way\r\n[01:46.76]How do you give me so much pleasure\r\n[01:50.28]And cause me so much pain\r\n[01:54.62]Just when I think\r\n[01:58.22]I\'ve taken more than would a fool\r\n[02:02.27]I start fallin\' back in love with you\r\n[02:09.13]I keep on fallin\'\r\n[02:12.01]In and out of love with you\r\n[02:17.42]I never loved someone\r\n[02:21.61]Way that I loved you\r\n[02:24.92]Oh baby\r\n[02:26.01]I I I I\'m fallin\'\r\n[02:32.76]\r\n[02:33.94]I I I I\'m fallin\'\r\n[02:41.23]Fall fall fall fall\r\n[02:54.82]I keep on fallin\'\r\n[02:57.82]In and out of love with you\r\n[03:03.10]I never loved someone\r\n[03:07.41]Way that I loved you\r\n[03:11.20]Baby baby baby baby baby\r\n[03:12.99]Baby baby baby baby baby baby\r\n[03:15.87]Baby baby baby baby baby\r\n[03:17.50]Baby baby baby baby\r\n[03:19.73]Baby baby baby baby baby baby\r\n[03:21.58]Baby baby baby\r\n[03:22.98]I\'m fallin\'\r\n[03:24.13]Baby I\'m fallin\'\r\n[03:25.97]Baby I\'m fallin\'\r\n[03:28.63]I\'m fallin\'\r\n[03:29.93]Baby I\'m fallin\'\r\n[03:31.54]I\'m fallin\'\r\n[03:32.41]I\'m fallin\'\r\n[03:33.72]Baby I\'m fallin\'\r\n[03:47.42]I\'m fall\r\n[04:02.29]I\'m fallin\'', '/music/song/1615206970155G_E_M_ 邓紫棋 - Falling (Live).mp3', 11, '欧美,华语,流行');
INSERT INTO `song` VALUES (47, 6, 'Where Did U Go (Live)', 'G.E.M.X.X.X. Live', '2021-03-08', '2022-03-19', '/img/songPic/1615207177338wheredidyougo.jpg', '[00:00.00]Where Did U Go (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:04.77]词：G.E.M. 邓紫棋\r\n[00:09.54]曲：陶山\r\n[00:14.31]编曲：雷颂德\r\n[00:19.08]监制：雷颂德\r\n[00:23.85]曾看着同星空 闲聊吹风\r\n[00:27.09]看日出多心动\r\n[00:29.59]曾每日缠一起 傻傻讲起\r\n[00:32.86]能爱到下世纪\r\n[00:35.47]怎么你俘虏这个心 却抽身退隐\r\n[00:38.50]不再亲近\r\n[00:41.09]\r\n[00:41.83]独自苦等 仍然空等 难藏泪印\r\n[00:46.91]\r\n[00:47.67]看着 电话中短讯\r\n[00:50.70]听着 录音的口讯\r\n[00:53.58]昨天的你哪天再接近\r\n[00:57.49]\r\n[00:59.16]Tell me where did you go\r\n[01:02.00]心声都不可细诉\r\n[01:04.18]Oh tell me baby where did you hide\r\n[01:07.85]辛苦都未被谅解\r\n[01:11.16]Where did you go 数数多久不碰到\r\n[01:15.64]\r\n[01:16.63]我在每夜 彻夜狂想 where did you go\r\n[01:23.81]\r\n[01:28.51]这夜月光中 再见影纵\r\n[01:31.45]再献花多感动\r\n[01:33.56]\r\n[01:34.19]似蜜甜的心 明明开心\r\n[01:37.29]为何又骤降温\r\n[01:40.04]怎么你一下子抱紧 却一下子转身\r\n[01:42.98]不再亲近\r\n[01:45.82]\r\n[01:46.37]独自苦等 仍然空等 难藏泪印\r\n[01:51.36]\r\n[01:52.09]看着 电话中短讯\r\n[01:55.03]听着 录音的口讯\r\n[01:57.94]昨天的你哪天再接近\r\n[02:02.15]\r\n[02:04.07]Where did you go\r\n[02:06.42]心声都不可细诉\r\n[02:08.49]Oh tell me baby where did you hide\r\n[02:12.24]辛苦都未被谅解\r\n[02:15.52]Where did you go 数数多久不碰到\r\n[02:20.04]\r\n[02:21.02]我在每夜 彻夜狂想\r\n[02:25.64]\r\n[02:26.53]Where did you go where did you go\r\n[02:32.00]\r\n[02:32.86]怎会当这刻我需要你\r\n[02:35.65]你却没在我身边\r\n[02:37.58]\r\n[02:38.23]Where did you go where did you go\r\n[02:44.05]\r\n[02:44.63]这秒钟很挂牵 你却不可感觉到\r\n[02:48.98]\r\n[02:49.90]Where did you go\r\n[02:51.24]Where where did you go\r\n[02:53.33]\r\n[02:53.93]Where where did you go\r\n[02:56.85]Where where did you go\r\n[02:59.35]\r\n[03:02.08]Tell me where did you go\r\n[03:04.93]心声都不可细诉\r\n[03:07.11]Oh tell me baby where did you hide\r\n[03:10.76]辛苦都未被谅解\r\n[03:14.08]Where did you go 数数多久不碰到\r\n[03:18.45]\r\n[03:19.62]我在每夜 彻夜狂想\r\n[03:23.48]\r\n[03:25.44]Tell me where did you go\r\n[03:28.34]心声都不可细诉\r\n[03:30.62]Oh tell me baby where did you hide\r\n[03:34.17]辛苦都未被谅解\r\n[03:37.46]Where did you go 数数多久不碰到\r\n[03:41.98]\r\n[03:43.02]我在每夜 彻夜狂想 where did you go\r\n[03:50.02]\r\n[03:54.85]Tell me where did you go\r\n[03:57.60]心声都不可细诉\r\n[03:59.77]Oh tell me baby where did you hide\r\n[04:03.47]辛苦都未被谅解\r\n[04:06.73]Where did you go 数数多久不碰到\r\n[04:11.22]\r\n[04:12.25]我在每夜 彻夜狂想\r\n[04:16.18]\r\n[04:17.68]Where did you go', '/music/song/1615207142393G_E_M_ 邓紫棋 - Where Did U Go (Live).mp3', 38, '欧美,粤语,华语');
INSERT INTO `song` VALUES (48, 6, 'Halo', '在线热搜（华语）系列97', '2021-03-08', '2022-03-19', '/img/songPic/1615207321345halo.jpg', '[00:00.00]Halo - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:05.01]Remember those walls I built?\r\n[00:07.85]\r\n[00:08.63]Baby they\'re tumbling down\r\n[00:11.23]\r\n[00:11.82]They didn\'t even put up a fight\r\n[00:14.65]\r\n[00:15.20]They didn\'t even make a sound\r\n[00:17.98]\r\n[00:18.73]I found a way to let you in\r\n[00:21.98]But, I never really had a doubt\r\n[00:25.73]Standing in the light of your halo\r\n[00:29.16]I got my angel now\r\n[00:32.03]\r\n[00:32.63]It\'s like I\'ve been awakened\r\n[00:35.94]Every rule I had you breakin\'\r\n[00:39.37]It\'s the risk that I\'m taking\r\n[00:42.87]I ain\'t never gonna shut you out!\r\n[00:46.17]\r\n[00:46.70]Everywhere I\'m looking now\r\n[00:49.63]I\'m surrounded by your embrace\r\n[00:53.57]Baby, I can see your halo\r\n[00:56.76]You know you\'re my saving grace\r\n[01:00.21]You\'re everything I need and more\r\n[01:03.59]It\'s written all over your face\r\n[01:07.24]Baby, I can feel your halo\r\n[01:10.07]\r\n[01:10.59]Pray it won\'t fade away\r\n[01:13.31]\r\n[01:13.92]Halo I can feel your halo\r\n[01:19.39]\r\n[01:19.90]I can see your halo\r\n[01:22.70]\r\n[01:23.20]I can see your halo\r\n[01:26.16]Ooh\r\n[01:27.49]Hit me like a ray of sun\r\n[01:30.73]Burning through my darkest night\r\n[01:33.97]You\'re the only one that I want\r\n[01:37.16]I\'m addicted to your light\r\n[01:40.16]\r\n[01:40.70]I swore I\'d never fall again\r\n[01:44.09]But this don\'t even feel like falling\r\n[01:47.65]Gravity can\'t forget to pull me back to the ground again\r\n[01:54.19]It\'s like I\'ve been awakened\r\n[01:57.44]Every rule I had you breakin\'\r\n[02:00.94]The risk that I\'m taking\r\n[02:04.10]I\'m never gonna shut you out!\r\n[02:07.82]Everywhere I\'m looking now\r\n[02:10.74]I\'m surrounded by your embrace\r\n[02:14.43]Baby, I can see your halo\r\n[02:17.58]You know you\'re my saving grace\r\n[02:20.88]You\'re everything I need and more\r\n[02:24.21]It\'s written all over your face\r\n[02:27.75]Baby, I can feel your halo\r\n[02:30.98]I pray it won\'t fade away\r\n[02:34.49]Halo I can see your halo\r\n[02:40.42]I can see your halo\r\n[02:43.15]\r\n[02:43.71]I can see your halo\r\n[02:46.92]\r\n[02:47.82]Halo I can see your halo\r\n[02:53.46]I can see your halo\r\n[02:56.84]I can see your halo\r\n[02:59.58]Ooh\r\n[03:01.28]\r\n[03:24.24]Maybe I can feel your halo\r\n[03:27.73]\r\n[03:31.15]I can feel your halo\r\n[03:34.49]\r\n[03:37.35]And pray it won\'t fade away', '/music/song/1615207311688G_E_M_ 邓紫棋 - Halo.mp3', 17, '华语,欧美,流行');
INSERT INTO `song` VALUES (49, 6, '18 (Live)', 'Get Everybody Moving Concert 2011', '2021-03-08', '2022-03-19', '/img/songPic/1615207448495halo.jpg', '[00:00.00]18 (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:18.76]词：G.E.M.邓紫棋\r\n[00:37.52]曲：G.E.M.邓紫棋\r\n[00:56.28]回望当天贪玩大过忘形\r\n[01:03.85]连大考都竟敢放肆即兴\r\n[01:11.70]从未懂谦虚倾听 从不肯小心改正\r\n[01:19.46]曾经错对未会望清\r\n[01:27.34]而慢慢开始将稚气暂停\r\n[01:35.03]现实种种的挑战要适应\r\n[01:42.89]如顺景当然高兴 如出错虚心改正\r\n[01:50.69]而这种改变今天可见证\r\n[01:57.70]这刻我想亲身致谢\r\n[02:05.47]往昔你真心的爱锡\r\n[02:13.34]从未离开拖紧我 走过黑夜\r\n[02:22.21]而使我更学会独立些\r\n[02:28.72]这刻我想亲身致谢\r\n[02:36.32]你使我的心不再野\r\n[02:44.15]陪着成长多得你 我一再感谢\r\n[02:52.99]从今天起我真的不撒野\r\n[03:04.84]从今天起我 我真的不 撒野', '/music/song/1615207440064G_E_M_ 邓紫棋 - 18 (Live).mp3', 18, '粤语,流行,选项8');
INSERT INTO `song` VALUES (50, 6, '奇迹', 'Xposed', '2021-03-08', '2022-03-19', '/img/songPic/1615207527697失真.jpg', '[00:00.00]奇迹 - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:02.75]词：G.E.M.邓紫棋\r\n[00:05.50]曲：G.E.M.邓紫棋/Lupo Groinig\r\n[00:08.26]编曲：Lupo Groinig\r\n[00:11.01]监制：Lupo Groinig\r\n[00:13.77]愿望树下的玻璃瓶\r\n[00:21.08]埋藏我多少的曾经\r\n[00:27.52]多少孤独的深夜\r\n[00:31.02]多少眼泪沾湿\r\n[00:34.33]我闭不上的眼睛\r\n[00:37.70]\r\n[00:41.08]打开我的玻璃瓶\r\n[00:47.77]让你翻开我曾经\r\n[00:53.14]\r\n[00:54.03]虽然当我还没遇见你\r\n[00:57.34]曾经被谁伤了我的心\r\n[01:00.60]至少现在 我拥有你\r\n[01:06.26]（我和你） 一人一支翅膀相拥就能飞翔\r\n[01:12.69]（以后每） 一分一秒我都拥有你在身旁\r\n[01:19.51]（而我的） 一呼一吸都想着你\r\n[01:22.88]不能三言两语讲清晰\r\n[01:26.07]反正一哭一笑都因为你\r\n[01:29.38]我的一字一句不必怀疑\r\n[01:33.01]\r\n[01:33.95]没有了你 雨答滴答滴\r\n[01:37.26]没有了你 风也在叹息\r\n[01:40.32]没有了你 世界再美我始终如一\r\n[01:46.01]直到我终于遇见了你\r\n[01:49.39]你让我生命有了意义\r\n[01:52.70]落叶或雪迹也都美丽\r\n[01:56.14]你是我的奇迹\r\n[01:59.69]\r\n[02:01.08]我伸手对自己的倒影\r\n[02:07.76]努力画上一点笑意\r\n[02:14.07]可是无论笑得多用力\r\n[02:17.33]还遮不住眼泪的痕迹\r\n[02:20.63]直到现在 我拥有了你\r\n[02:26.58]（我和你） 一人一支翅膀相拥就能飞翔\r\n[02:32.65]（以后每） 一分一秒我都拥有你在身旁\r\n[02:38.71]（而我的） 一呼一吸都想着你\r\n[02:42.77]不能三言两语讲清晰\r\n[02:46.08]反正一哭一笑都因为你\r\n[02:49.39]我的一字一句不必怀疑\r\n[02:52.95]OH  世界再美 如果缺少了你\r\n[03:06.08]\r\n[03:07.53]这一切又有什么意义\r\n[03:10.66]春去秋来谁又会在意\r\n[03:14.03]你的出现 是我的奇迹\r\n[03:19.72]\r\n[03:20.60]没有了你 雨答滴答滴\r\n[03:23.72]没有了你 风也在叹息\r\n[03:27.04]没有了你 世界再美我始终如一\r\n[03:32.72]直到我终于遇见了你\r\n[03:36.04]你让我生命有了意义\r\n[03:39.41]落叶或雪迹也都美丽\r\n[03:42.78]你是我的奇迹', '/music/song/1615207514105G_E_M_ 邓紫棋 - 奇迹.mp3', 14, '粤语,流行,民谣');
INSERT INTO `song` VALUES (51, 6, '蝶恋花', '蝶恋花', '2021-03-08', '2022-03-19', '/img/songPic/1615207656786蝶恋花.jpg', '[00:00.00]蝶恋花 - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:10.64]词：维谷谷\r\n[00:21.28]曲：谢宇毅\r\n[00:31.92]笑容还在眼神还在往昔\r\n[00:34.37]\r\n[00:35.34]给我淡然无味枯燥年月润色\r\n[00:38.47]\r\n[00:39.41]我为那场情话那场盟誓叹息\r\n[00:42.37]\r\n[00:43.38]流泪可 化做潮汐\r\n[00:46.34]\r\n[00:47.79]每一晚花间月下前追忆你点滴\r\n[00:53.81]\r\n[00:55.77]感触恩爱竟薄似翼\r\n[01:00.32]\r\n[01:03.80]你仍沉睡我仍垂泪至死\r\n[01:06.66]\r\n[01:07.23]一双一对远飞一刹留下自己\r\n[01:10.46]\r\n[01:11.31]我在那年湖畔那船儿上记起\r\n[01:14.40]\r\n[01:15.23]谁念诗 脱俗流利\r\n[01:18.45]\r\n[01:19.80]赐给我一生跟一世厮守这天地\r\n[01:26.11]\r\n[01:27.90]纵下雨月儿仍是美\r\n[01:33.18]\r\n[01:35.96]两百岁亦陶醉\r\n[01:38.10]\r\n[01:38.69]记忆中会面团聚\r\n[01:41.90]\r\n[01:43.28]谁话我这世再没情趣\r\n[01:45.98]\r\n[01:46.72]你声音暖润似水\r\n[01:51.90]\r\n[01:53.16]同偕白发无法和你共度这生\r\n[01:56.87]\r\n[01:57.51]执子情感多刻骨震撼\r\n[02:01.24]和俗世而刀一刎双双拍翼\r\n[02:05.02]\r\n[02:05.59]别理万众的炮轰\r\n[02:08.32]\r\n[02:09.18]同偕白发情爱唯盼梦内再生\r\n[02:12.88]\r\n[02:13.75]孤清黄昏这流离的心\r\n[02:16.89]\r\n[02:17.76]期望可下辈子再次走近\r\n[02:20.92]\r\n[02:21.83]仿似蝶恋花 热吻\r\n[02:27.26]\r\n[02:45.95]你仍沉睡我仍垂泪至死\r\n[02:48.49]\r\n[02:49.30]一双一对远飞一刹留下自己\r\n[02:52.37]\r\n[02:53.15]我在那年湖畔那船儿上记起\r\n[02:56.46]\r\n[02:57.35]谁念诗 脱俗流利\r\n[03:00.47]\r\n[03:01.79]赐给我一生跟一世厮守这天地\r\n[03:08.02]\r\n[03:09.80]纵下雨月儿仍是美\r\n[03:15.32]\r\n[03:17.82]两百岁亦陶醉\r\n[03:20.08]\r\n[03:20.64]记忆中会面团聚\r\n[03:23.85]\r\n[03:25.23]谁话我这世再没情趣\r\n[03:27.92]\r\n[03:28.75]你声音暖润似水\r\n[03:32.56]\r\n[03:33.15]同偕白发无法和你共度这生\r\n[03:36.86]\r\n[03:37.73]执子情感多刻骨震撼\r\n[03:41.26]和俗世而刀一刎双双拍翼\r\n[03:44.84]\r\n[03:45.56]别理万众的炮轰\r\n[03:48.23]\r\n[03:49.10]同偕白发情爱唯盼梦内再生\r\n[03:52.82]\r\n[03:53.64]孤清黄昏这流离的心\r\n[03:56.84]\r\n[03:57.77]期望可下辈子再次走近\r\n[04:00.84]\r\n[04:01.66]仿似蝶恋花 热吻\r\n[04:05.92]\r\n[04:09.71]仿似蝶恋花 热吻', '/music/song/1615207639103G_E_M_ 邓紫棋 - 蝶恋花.mp3', 4, '粤语');
INSERT INTO `song` VALUES (52, 6, '囚鸟', '无', '2021-03-08', '2022-03-19', '/img/songPic/1615207767059halo.jpg', '[00:00.00]囚鸟 - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:08.87]词：十一郎\r\n[00:17.75]曲：张宇\r\n[00:26.62]编曲：屠颖\r\n[00:35.50]我是被你囚禁的鸟\r\n[00:39.92]已经忘了天有多高\r\n[00:43.70]\r\n[00:44.52]如果离开你给我的小小城堡\r\n[00:49.86]\r\n[00:50.48]不知还有谁能依靠\r\n[00:53.92]我是被你囚禁的鸟\r\n[00:57.68]\r\n[00:58.52]得到的爱越来越少\r\n[01:02.26]\r\n[01:03.10]看着你的笑在别人眼中燃烧\r\n[01:08.65]我却要不到一个拥抱\r\n[01:12.07]\r\n[01:14.37]我像是一个你可有可无的影子\r\n[01:19.02]\r\n[01:19.56]冷冷的看着你说谎的样子\r\n[01:23.64]这撩乱的城市容不下我的痴\r\n[01:27.67]\r\n[01:28.18]是什么让你这样迷恋这样的放肆\r\n[01:32.82]我像是一个你可有可无的影子\r\n[01:37.26]\r\n[01:38.10]和寂寞交换着悲伤的心事\r\n[01:41.56]\r\n[01:42.07]对爱无计可施\r\n[01:43.80]\r\n[01:44.34]这无味的日子\r\n[01:46.17]\r\n[01:48.49]眼泪是唯一的奢侈\r\n[01:53.74]\r\n[02:17.11]我是被你囚禁的鸟\r\n[02:20.63]\r\n[02:21.54]已经忘了天有多高\r\n[02:25.33]\r\n[02:26.06]如果离开你给我的小小城堡\r\n[02:31.35]\r\n[02:31.96]不知还有谁能依靠\r\n[02:35.17]\r\n[02:37.54]我像是一个你可有可无的影子\r\n[02:41.95]\r\n[02:42.63]冷冷的看着你说谎的样子\r\n[02:46.63]这撩乱的城市容不下我的痴\r\n[02:50.65]\r\n[02:51.21]是什么让你这样迷恋这样的放肆\r\n[02:55.84]我像是一个你可有可无的影子\r\n[03:00.18]\r\n[03:01.09]和寂寞交换着悲伤的心事\r\n[03:04.59]\r\n[03:05.12]对爱无计可施\r\n[03:06.81]\r\n[03:07.34]这无味的日子\r\n[03:09.16]\r\n[03:11.62]眼泪是唯一的奢侈\r\n[03:18.08]\r\n[03:42.02]我像是一个你可有可无的影子\r\n[03:46.61]\r\n[03:47.41]冷冷的看着你说谎的样子\r\n[03:51.35]这撩乱的城市容不下我的痴\r\n[03:55.41]\r\n[03:55.97]是什么让你这样迷恋这样的放肆\r\n[04:00.55]我像是一个你可有可无的影子\r\n[04:04.96]\r\n[04:05.90]和寂寞交换着悲伤的心事\r\n[04:09.83]对爱无计可施\r\n[04:11.50]\r\n[04:12.10]这无味的日子\r\n[04:13.92]\r\n[04:17.63]我的 眼泪是唯一的奢侈', '/music/song/1615207759477G_E_M_ 邓紫棋 - 囚鸟.mp3', 14, '华语,民谣,流行');
INSERT INTO `song` VALUES (53, 6, '马仔歌 (Live)', '在线热搜（华语）系列100', '2021-03-08', '2022-03-19', '/img/songPic/1615207854818halo.jpg', '[00:00.00]马仔歌 (Live) - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:03.26]词：邓紫棋\r\n[00:06.52]曲：James Lord Pierpont\r\n[00:09.78]银包几个零 赢输都太平\r\n[00:16.84]\r\n[00:18.00]食饱该坐定 专心睇马经\r\n[00:25.41]\r\n[00:26.68]骑师好有型 型得好冷静\r\n[00:33.47]\r\n[00:35.11]静心睇下班精英 边位可得胜\r\n[00:42.07]\r\n[00:43.10]Hey 跑跑跑 跑跑跑 小心咪跌跤\r\n[00:46.05]过两秒 转直路 终点已看得到\r\n[00:48.27]Hey Go Go Go\r\n[00:49.72]万几人叫好\r\n[00:50.88]剩数百米 这段路\r\n[00:52.34]必须冲得到', '/music/song/1615207847008G_E_M_ 邓紫棋 - 马仔歌 (Live).mp3', 47, '粤语,摇滚');
INSERT INTO `song` VALUES (54, 6, 'Do You Know', '2009年1月新歌速递', '2021-03-08', '2022-03-19', '/img/songPic/1615207949016halo.jpg', '[00:00.00]Do You Know - G.E.M. 邓紫棋 (Gem Tang)\r\n[00:06.91]词：G.E.M\r\n[00:13.82]曲：G.E.M\r\n[00:20.73]I know you are loving me wholeheartedly\r\n[00:27.71]I know I am always your one and only\r\n[00:35.33]Time proves the love of you and me\r\n[00:39.32]\r\n[00:39.94]Undoubtedly, youll stay with me eternally\r\n[00:46.50]\r\n[00:48.68]Do you know, no one can ever make me crazy\r\n[00:55.23]\r\n[00:55.79]But do you know, I\'ve been frenzy already\r\n[01:03.47]I pray for love of you and me\r\n[01:08.15]Undoubtedly, Ill stay by thee eternally\r\n[01:14.58]\r\n[01:15.20]Here you are, its whole of my heart\r\n[01:20.75]\r\n[01:21.38]I gave you from the start\r\n[01:24.12]\r\n[01:24.87]To shine you in the dark\r\n[01:29.30]Never too far, I\'m living in your heart\r\n[01:35.04]We are meant to be together forever\r\n[01:40.60]There is nothing could separate us\r\n[01:46.89]\r\n[01:59.50]I know you will cherish me earnestly\r\n[02:06.48]I know Ill be always your one and only\r\n[02:13.98]I don\'t need to be a Sleeping Beauty\r\n[02:18.72]Undoubtedly, there\'s no any Broken fantasy\r\n[02:26.02]\r\n[02:27.39]Do you know, Im adoring you affectionately\r\n[02:34.63]And do you know, i take this fancy sincerely\r\n[02:42.18]Without you Ill be drowsy\r\n[02:46.99]Undoubtedly, you\'re the only perfect one for me\r\n[02:53.97]Here you are, its whole of my heart\r\n[03:00.03]I gave you from the start\r\n[03:03.52]To shine you in the dark\r\n[03:08.14]Never too far, I\'m living in your heart\r\n[03:13.88]We are meant to be together forever\r\n[03:19.42]There is nothing could separate us\r\n[03:27.55]\r\n[03:52.44]Here you are, its whole of my heart\r\n[03:58.31]I gave you from the start\r\n[04:01.87]To shine you in the dark\r\n[04:06.36]Never too far, I\'m living in your heart\r\n[04:12.04]We are meant to be together forever\r\n[04:17.65]There is nothing could separate us', '/music/song/1615207941295G_E_M_ 邓紫棋 - Do You Know.mp3', 11, '欧美,选项8,流行');
INSERT INTO `song` VALUES (55, 4, '光辉岁月(电影《光辉岁月》主题曲)', '光辉岁月', '2021-03-08', '2022-03-19', '/img/songPic/1615208531212光辉岁月.jpg', '[00:00.00]光辉岁月 - 陈奕迅 (Eason Chan)\r\n[00:09.24]词：黄家驹\r\n[00:18.48]曲：黄家驹\r\n[00:27.73]钟声响起归家的讯号\r\n[00:30.67]\r\n[00:32.31]在他生命里 仿佛带点唏嘘\r\n[00:37.94]\r\n[00:40.90]黑色肌肤给他的意义\r\n[00:44.02]\r\n[00:45.45]是一生奉献肤色斗争中\r\n[00:50.88]\r\n[00:54.25]年月把拥有变做逝去\r\n[00:58.99]\r\n[01:00.80]疲倦的双眼带着期望\r\n[01:05.74]\r\n[01:07.42]今天只有残留的躯壳\r\n[01:10.54]\r\n[01:11.22]迎接光辉岁月\r\n[01:14.09]\r\n[01:14.60]风雨中抱紧自由\r\n[01:18.90]\r\n[01:20.83]一生经过彷徨的挣扎\r\n[01:24.64]自信可改变未来\r\n[01:27.76]问谁又能做到\r\n[01:31.51]\r\n[01:44.20]可否不分肤色的界限\r\n[01:47.39]\r\n[01:48.88]愿这土地里 不分你我高低\r\n[01:54.74]\r\n[01:57.54]缤纷色彩闪出的美丽\r\n[02:00.53]\r\n[02:02.03]是因它没有分开每种色彩\r\n[02:08.21]\r\n[02:10.76]年月把拥有变做逝去\r\n[02:15.51]\r\n[02:17.51]疲倦的双眼带着期望\r\n[02:22.25]\r\n[02:23.99]今天只有残留的躯壳\r\n[02:27.24]\r\n[02:27.80]迎接光辉岁月\r\n[02:30.98]风雨中抱紧自由\r\n[02:35.54]\r\n[02:37.41]一生经过彷徨的挣扎\r\n[02:40.59]\r\n[02:41.22]自信可改变未来\r\n[02:43.96]\r\n[02:44.52]问谁又能做到\r\n[02:47.27]\r\n[03:00.84]今天只有残留的躯壳\r\n[03:03.97]\r\n[03:04.53]迎接光辉岁月\r\n[03:07.09]\r\n[03:07.77]风雨中抱紧自由\r\n[03:12.20]\r\n[03:14.35]一生经过彷徨的挣扎\r\n[03:17.91]自信可改变未来\r\n[03:21.15]问谁又能做到', '/music/song/1615208517258陈奕迅 - 光辉岁月.mp3', 20, '华语,流行');
INSERT INTO `song` VALUES (56, 31, 'Monsters', 'Monsters', '2021-03-08', '2022-03-19', '/img/songPic/1615208636914monster.jpg', '[00:00.00]Monsters - Katie Sky\r\n[00:00.24]Lyrics by：Catherine Cheadle/The Tune Park\r\n[00:00.48]I see your monsters I see your pain\r\n[00:05.81]Tell me your problems I\'ll chase them away\r\n[00:11.21]I\'ll be your lighthouse\r\n[00:13.66]I\'ll make it okay\r\n[00:16.37]When I see your monsters\r\n[00:19.10]I\'ll stand there so brave\r\n[00:21.21]And chase them all away\r\n[00:27.64]In the dark we we\r\n[00:30.12]We stand apart we we\r\n[00:33.14]Never see that the things we need are staring right at us\r\n[00:38.63]You just wanna hide hide\r\n[00:40.87]Hide never show your smile smile\r\n[00:44.01]Stand alone when you need someone it\'s the hardest thing of all\r\n[00:48.56]That you see are the bad bad\r\n[00:51.77]Bad memories take your time and you\'ll find me\r\n[00:57.71]I see your monsters I see your pain\r\n[01:02.99]Tell me your problems I\'ll chase them away\r\n[01:08.42]I\'ll be your lighthouse I\'ll make it okay\r\n[01:13.72]When I see your monsters I\'ll stand there so brave\r\n[01:18.55]And chase them all away\r\n[01:22.24]I could see the sky sky\r\n[01:24.52]Sky beautiful tonight night\r\n[01:27.56]When you breathe why can\'t you see that the clouds are in your head\r\n[01:33.11]I would stay there there\r\n[01:35.42]There\'s no need to fear fear\r\n[01:38.48]And when you need to talk it out with someone you can trust\r\n[01:43.04]What you see are the bad bad\r\n[01:46.37]Bad memories take your time and you\'ll find me\r\n[01:52.16]I see your monsters I see your pain\r\n[01:57.57]Tell me your problems I\'ll chase them away\r\n[02:02.96]I\'ll be your lighthouse I\'ll make it okay\r\n[02:08.22]When I see your monsters I\'ll stand there so brave\r\n[02:12.90]And chase them all away\r\n[02:18.56]I\'ll chase them all away\r\n[02:27.66]You\'ve got the chance to see the light\r\n[02:33.01]Even in the darkest night\r\n[02:38.49]And I\'ll be here like you were for me\r\n[02:44.75]So just let me in\r\n[02:49.14]Cause I see your monsters I see your pain\r\n[02:54.96]Tell me your problems I\'ll chase them away\r\n[03:00.39]I\'ll be your lighthouse I\'ll make it okay\r\n[03:05.50]When I see your monsters I\'ll stand there so brave\r\n[03:11.25]I see your monsters I see your pain\r\n[03:16.74]Tell me your problems I\'ll chase them away\r\n[03:22.15]I\'ll be your lighthouse I\'ll make it okay\r\n[03:27.44]When I see your monsters I\'ll stand there so brave\r\n[03:32.09]And chase them all away', '/music/song/1615208627873Katie Sky - Monsters.mp3', 168, '欧美,摇滚,流行');
INSERT INTO `song` VALUES (57, 26, 'DONT KNOW WHAT TO DO', '', '2021-03-17', '2022-03-19', '/img/songPic/1615945574319dkwtd.jpg', '[00:00.000] 作词 : Teddy /24/ブライアン・リー/ベク・ボーン/森若香織\n[00:00.509] 作曲 : Teddy /24/ブライアン・リー/ベク・ボーン\n[00:01.18]ちょっと 誰か時間止めて\n[00:08.44]もっと 君とズレてくから\n[00:15.94]だって 笑っても嘘っぽい\n[00:23.15]もう 自分が可哀想\n[00:30.43]大丈夫って言ったけど\n[00:34.71]Don\'t know what to do without you\n[00:37.72]一人きりで描いた 君の記憶はblue\n[00:45.01]私だけ 変われない\n[00:48.85]新しい 今日なのに\n[00:52.54]すべて ダメで\n[00:54.33]無理で 苦しくて\n[00:57.07]Don\'t know what to do\n[01:00.59]Don\'t know what to do without you\n[01:07.97]I don\'t know what to do without you\n[01:15.30]I don\'t know what to do without you\n[01:27.51]You know I\n[01:28.21]Don\'t know what to do\n[01:30.15]Don\'t know what to do\n[01:31.64]みんな 失うのに出会う\n[01:38.79]きっと 私達もそうでしょ\n[01:46.09]電話とか期待して\n[01:49.65]ソワソワしちゃってバカみたい\n[01:53.45]チクタク鳴る時計の音が\n[01:58.54]やけに虚しい\n[02:01.10]平気なフリしても\n[02:05.11]Don\'t know what to do without you\n[02:08.22]鏡の中の私 映るリップはblue\n[02:15.64]私だけ 変われない\n[02:19.32]新しい 今日なのに\n[02:22.91]すべて ダメで\n[02:24.76]無理で 苦しくて\n[02:27.43]Don\'t know what to do\n[02:31.02]Don\'t know what to do without you\n[02:38.30]I don\'t know what to do without you\n[02:45.69]I don\'t know what to do without you\n[02:58.10]You know I\n[02:58.78]Don\'t know what to do\n[03:00.48]Don\'t know what to do without you\n[03:02.07]大丈夫って言ったけど\n[03:06.00]Don\'t know what to do without you\n[03:09.07]一人きりで描いた 君の記憶はblue', '/music/song/1615945519358Don\'t Know What To Do.mp3', 69, '日韩,流行,选项8');
INSERT INTO `song` VALUES (58, 29, '마리아(Maria)', '마리아', '2021-03-17', '2022-03-19', '/img/songPic/1615946623800maria.jpg', '[ti:Maria (原唱: 华莎) (Hate for what？)]\r\n[ar:Wbspo]\r\n[al:2020]\r\n[by:]\r\n[offset:0]\r\n[00:00.00]Maria (原唱: 华莎) - Wbspo\r\n[00:00.56]La li le lo lai\r\n[00:02.18]La la li le lo lai\r\n[00:04.20]La li le lo lai\r\n[00:05.88]La la li le lo lai\r\n[00:07.94]La li le lo lai\r\n[00:09.60]La la li le lo lai\r\n[00:11.64]La li le lo lai\r\n[00:13.29]La la li le lo lai\r\n[00:15.43]La li le lo lai\r\n[00:17.00]La la li le lo lai\r\n[00:19.08]La li le lo lai\r\n[00:20.73]La la li le lo lai\r\n[00:22.28]Curse me out I\'ll eat you up don\'t try to\r\n[00:25.91]Be like \"sorry\" tell me what can I do\r\n[00:29.65]What\'s all the hate for\r\n[00:31.55]I try to make things right\r\n[00:33.84]Come at me you\'ll become\r\n[00:35.81]My meal for one\r\n[00:37.93]All because I\'m lonely\r\n[00:39.72]Swallow hate like no one does\r\n[00:41.70]Don\'t have the energy to waste it on you uh uh\r\n[00:44.98]What\'s wrong with your mindset\r\n[00:46.97]Just go and don\'t mind me\r\n[00:48.89]Why are you so freaking sad\r\n[00:53.22]Maria Maria it\'s for you my dear\r\n[00:57.56]I\'m just a shining light\r\n[00:59.40]I\'m hoping you won\'t mind\r\n[01:01.42]Oh Maria it\'s for you my dear\r\n[01:04.89]You wanna battle battle me\r\n[01:07.08]But I\'m already winning\r\n[01:09.76]Yeah \r\n[01:11.74]Oh na ah ah\r\n[01:13.50]Yeah\r\n[01:15.30]Just for you my dear\r\n[01:17.20]Yeah\r\n[01:19.11]Oh na ah ah\r\n[01:20.95]Yeah\r\n[01:23.04]Beautiful it\'s Maria', '/music/song/1615946614691华莎 - 마리아(Maria).mp3', 32, '日韩,选项8,流行');
INSERT INTO `song` VALUES (59, 30, '清空', '清空', '2021-03-17', '2022-03-19', '/img/songPic/1615947051630清空.jpg', '[00:00.25]清空 - 王忻辰/苏星婕\r\n[00:02.51]词：安苏羽\r\n[00:03.48]曲：安苏羽\r\n[00:04.36]编曲：安苏羽\r\n[00:05.41]混音：LBI利比\r\n[00:06.39]制作人：安苏羽\r\n[00:07.62]监制：伍德华\r\n[00:08.65]策划：王居然\r\n[00:09.68]录音师：候天宇\r\n[00:10.93]录音棚：莫非录音棚（成都）\r\n[00:12.90]OP：音炬文化\r\n[00:14.05]女：\r\n[00:14.56]是我爱的太蠢太过天真\r\n[00:17.73]才会把你的寂寞当作契合的灵魂\r\n[00:21.27]也是我自作自受竟然那么认真\r\n[00:24.77]相信你 多轻浮的吻\r\n[00:28.71]男：\r\n[00:28.73]在爱的世界你好像还没弄懂\r\n[00:31.73]所以在花花世界应该把真心清空\r\n[00:35.20]游走于谎言之中构建起来的朦胧\r\n[00:38.74]却像是美得不可方物 还略带风度\r\n[00:42.74]当眼神开始放逐 冷漠略显无辜\r\n[00:46.35]言不由衷在乎 伤的体无完肤\r\n[00:49.88]选择放下全部 走不出的迷雾\r\n[00:54.05]对不起 是我作茧自缚\r\n[00:56.78]女：\r\n[00:57.10]是我爱的太蠢太过天真\r\n[00:59.90]才会把你的寂寞当作契合的灵魂\r\n[01:03.57]也是我自作自受竟然那么认真\r\n[01:06.93]相信你 多轻浮的吻\r\n[01:23.65]男：\r\n[01:24.81]不知道你是喜欢晴天还是喜欢雨天\r\n[01:28.14]不记得你的口味你的爱好约会时间\r\n[01:31.72]刚刚才想起好像有事不能和你见面\r\n[01:35.17]Oh baby 这次我很抱歉\r\n[01:39.05]女：\r\n[01:39.34]是我爱的太蠢太过天真\r\n[01:42.34]才会把你的寂寞当作契合的灵魂\r\n[01:45.84]也是我自作自受竟然那么认真\r\n[01:49.22]相信你 多轻浮的吻\r\n[01:53.61]我只是不明白\r\n[01:54.97]想对你不理睬\r\n[01:56.88]你的爱却像是侵蚀人的妖怪\r\n[02:00.66]游走于人心若冬季的世界\r\n[02:04.43]却还傻傻等待着花开\r\n[02:07.72]是我爱的太蠢太过天真\r\n[02:10.63]才会把你的寂寞当作契合的灵魂\r\n[02:14.13]也是我自作自受竟然那么认真\r\n[02:17.55]相信你 多轻浮的吻\r\n[02:21.47]男：\r\n[02:21.53]我只是不明白\r\n[02:23.09]想对你不理睬\r\n[02:24.97]你的爱却像是侵蚀人的妖怪\r\n[02:28.92]游走于人心若冬季的世界\r\n[02:32.59]却还傻傻等待着花开\r\n[02:35.74]女：\r\n[02:35.80]是我爱的太蠢太过天真\r\n[02:38.74]才会把你的寂寞当作契合的灵魂\r\n[02:42.38]也是我自作自受竟然那么认真\r\n[02:45.88]相信你 多轻浮的吻', '/music/song/1615947043043王忻辰 _ 苏星婕 - 清空.mp3', 97, '华语,流行,选项8');
INSERT INTO `song` VALUES (60, 28, '麻雀', '麻雀', '2021-03-22', '2022-03-19', '/img/songPic/1616394605583麻雀.jpg', '[00:00.27]麻雀 - 李荣浩\r\n[00:01.06]词：李荣浩\r\n[00:01.66]曲：李荣浩\r\n[00:02.27]编曲：李荣浩\r\n[00:03.02]制作人：李荣浩\r\n[00:03.96]吉他：李荣浩\r\n[00:04.73]贝斯：李荣浩\r\n[00:05.53]和音编写：李荣浩\r\n[00:06.63]和音：李荣浩\r\n[00:07.39]录音师：李荣浩\r\n[00:08.34]混音师：李荣浩\r\n[00:09.31]音乐制作助理：青格乐\r\n[00:10.75]录音工作室：北京一样音乐录音室\r\n[00:12.94]混音工作室：北京一样音乐录音室\r\n[00:15.04]母带后期制作人：李荣浩\r\n[00:16.61]母带后期处理工程师：周天澈\r\n[00:18.52]母带后期处理录音室：Studio21A\r\n[00:23.21]山隔壁还是山\r\n[00:25.61]都有一个伴\r\n[00:28.72]相信海枯石烂\r\n[00:31.20]也许我笨蛋\r\n[00:34.36]飞太慢会落单\r\n[00:36.84]太快会受伤\r\n[00:40.11]日子不就都这样\r\n[00:45.76]天会晴就会暗\r\n[00:48.17]我早就习惯\r\n[00:51.30]一日为了三餐\r\n[00:53.80]不至于寒酸\r\n[00:56.96]为给你取暖我把翅膀折断\r\n[01:02.25]我遭遇那些苦难\r\n[01:05.07]你却不管\r\n[01:07.62]我飞翔在乌云之中\r\n[01:11.04]你看着我无动于衷\r\n[01:13.82]有多少次波涛汹涌\r\n[01:16.65]在我 心中\r\n[01:18.80]你飞向了雪山之巅\r\n[01:22.24]我留在你回忆里面\r\n[01:25.14]你成仙我替你留守人间\r\n[01:30.70]麻雀也有明天\r\n[01:56.36]天会晴就会暗\r\n[01:58.71]我早就习惯\r\n[02:01.88]一日为了三餐\r\n[02:04.38]不至于寒酸\r\n[02:07.55]为给你取暖我把翅膀折断\r\n[02:12.84]我遭遇那些苦难\r\n[02:15.61]你却不管\r\n[02:18.21]我飞翔在乌云之中\r\n[02:21.58]你看着我无动于衷\r\n[02:24.37]有多少次波涛汹涌\r\n[02:27.27]在我 心中\r\n[02:29.50]你飞向了雪山之巅\r\n[02:32.82]我留在你回忆里面\r\n[02:35.65]你成仙我替你留守人间\r\n[02:41.14]麻雀也有明天\r\n[03:06.26]我飞翔在乌云之中\r\n[03:09.54]你看着我无动于衷\r\n[03:12.36]有多少次波涛汹涌\r\n[03:15.36]在我 心中\r\n[03:17.47]你飞向了雪山之巅\r\n[03:20.81]我留在你回忆里面\r\n[03:23.65]你成仙我替你留守人间\r\n[03:29.11]麻雀也有明天', '/music/song/1616394596526李荣浩 - 麻雀.mp3', 15, '华语,民谣,流行');
INSERT INTO `song` VALUES (61, 28, '模特', '模特', '2021-03-22', '2022-03-19', '/img/songPic/1616394690397模特.jpg', '[00:00.01]模特 - 李荣浩 (Ronghao Li)\r\n[00:00.02]词：周耀辉\r\n[00:00.03]曲：李荣浩\r\n[00:00.04]编曲：李荣浩\r\n[00:00.05]制作人：李荣浩\r\n[00:00.06]\r\n[00:31.10]穿华丽的服装 为原始的渴望而站着\r\n[00:38.47]用完美的表情 为脆弱的城市而撑着\r\n[00:45.88]我冷漠的接受 你焦急的等待也困着\r\n[00:53.24]像无数生存在橱窗里的模特\r\n[01:00.72]除了灯以外 我还能看见什么\r\n[01:04.44]除了光以外 我还能要求什么\r\n[01:08.23]除了你以外 还能倚赖哪一个\r\n[01:15.58]在千里以外 在呼喊的是什么\r\n[01:19.23]在百年以后 想回忆的是什么\r\n[01:22.96]在离开以前 能否再见那一刻\r\n[01:28.44]记得 你的眼睛将会亮着\r\n[01:33.93]我的手臂将会挥着\r\n[01:37.61]谁说世界早已没有选择\r\n[01:44.14]趁着我会喜怒你会哀乐\r\n[01:48.63]唱几分钟情歌\r\n[01:51.34]没什么 至少证明我们还活着\r\n[01:59.74]像单纯的蝴蝶 为玫瑰的甜美而飞着\r\n[02:07.02]像顽皮的小猫 为明天的好奇而睡着\r\n[02:14.43]是混乱的时代 是透明的监狱也觉得\r\n[02:21.85]是不能继续在橱窗里做模特\r\n[02:29.38]除了风以外 我还能听到什么\r\n[02:33.06]除了尘以外 我还能拒绝什么\r\n[02:36.79]除了你以外 还能倚赖哪一个\r\n[02:44.19]在千里以外 在呼喊的是什么\r\n[02:47.82]在百年以后 想回忆的是什么\r\n[02:51.54]在离开以前 能否再见那一刻\r\n[02:56.97]记得 你的眼睛将会亮着\r\n[03:02.46]我的手臂将会挥着\r\n[03:06.16]谁说世界早已没有选择\r\n[03:12.68]趁着 我会喜怒你会哀乐\r\n[03:17.21]唱几分钟情歌\r\n[03:19.98]没什么 至少证明我们还活着\r\n[03:52.59]记得 你的眼睛将会亮着\r\n[03:57.90]我的手臂将会挥着\r\n[04:01.56]谁说世界早已没有选择\r\n[04:08.13]趁着 我会喜怒你会哀乐\r\n[04:12.62]唱几分钟情歌\r\n[04:15.39]没什么 至少证明我们还活着', '/music/song/1616394678020李荣浩 - 模特.mp3', 39, '华语,流行');
INSERT INTO `song` VALUES (62, 28, '李白', '模特', '2021-03-22', '2022-03-19', '/img/songPic/1616394798896模特.jpg', '[00:00.01]李白 - 李荣浩 (Ronghao Li)\r\n[00:00.02]词：李荣浩\r\n[00:00.03]曲：李荣浩\r\n[00:00.04]编曲：李荣浩\r\n[00:00.05]制作人：李荣浩\r\n[00:00.06]\r\n[00:17.88]大部分人要我学习去看\r\n[00:20.95]世俗的眼光\r\n[00:22.91]\r\n[00:26.22]我认真学习了世俗眼光\r\n[00:29.26]世俗到天亮\r\n[00:31.08]\r\n[00:34.28]一部外国电影没听懂一句话\r\n[00:37.17]\r\n[00:38.27]看完结局才是笑话\r\n[00:40.39]\r\n[00:42.48]你看我多乖多聪明多么听话\r\n[00:45.98]多奸诈\r\n[00:47.09]\r\n[00:51.31]喝了几大碗米酒再离开是为了模仿\r\n[00:56.36]\r\n[00:59.66]一出门不小心吐的那幅是谁的书画\r\n[01:04.32]\r\n[01:07.54]你一天一口一个 亲爱的对方\r\n[01:10.56]\r\n[01:11.57]多么不流行的模样\r\n[01:13.91]\r\n[01:15.78]都应该练练书法再出门闯荡\r\n[01:18.91]\r\n[01:19.43]才会有人热情买账\r\n[01:22.14]\r\n[01:23.36]要是能重来 我要选李白\r\n[01:26.45]\r\n[01:27.40]几百年前做的好坏\r\n[01:30.09]没那么多人猜\r\n[01:31.90]要是能重来 我要选李白\r\n[01:34.74]\r\n[01:35.64]至少我还能写写诗来澎湃\r\n[01:38.08]\r\n[01:38.62]逗逗女孩\r\n[01:40.28]要是能重来 我要选李白\r\n[01:43.06]\r\n[01:44.03]创作也能到那么高端\r\n[01:46.82]被那么多人崇拜\r\n[01:49.66]\r\n[01:51.47]要是能重来\r\n[01:52.56]\r\n[01:53.99]喝了几大碗米酒再离开是为了模仿\r\n[01:59.09]\r\n[02:02.24]一出门不小心吐的那幅是谁的书画\r\n[02:07.33]\r\n[02:10.00]你一天一口一个 亲爱的对方\r\n[02:13.27]\r\n[02:14.21]多么不流行的模样\r\n[02:16.73]\r\n[02:18.43]都应该练练书法再出门闯荡\r\n[02:22.00]才会有人热情买账\r\n[02:24.68]\r\n[02:25.97]要是能重来 我要选李白\r\n[02:29.03]\r\n[02:29.94]几百年前做的好坏\r\n[02:32.64]没那么多人猜\r\n[02:34.25]要是能重来 我要选李白\r\n[02:37.33]\r\n[02:38.24]至少我还能写写诗来澎湃\r\n[02:40.72]\r\n[02:41.23]逗逗女孩\r\n[02:42.31]\r\n[02:42.85]要是能重来 我要选李白\r\n[02:45.65]\r\n[02:46.54]创作也能到那么高端\r\n[02:49.38]被那么多人崇拜\r\n[02:53.40]\r\n[02:54.07]要是能重来\r\n[02:55.49]\r\n[03:28.64]要是能重来 我要选李白\r\n[03:31.61]\r\n[03:32.52]几百年前做的好坏 没那么多人猜\r\n[03:36.82]要是能重来 我要选李白\r\n[03:39.84]\r\n[03:40.79]至少我还能写写诗来澎湃\r\n[03:43.76]逗逗女孩\r\n[03:45.25]要是能重来 我要选李白\r\n[03:48.25]\r\n[03:49.11]创作也能到那么高端\r\n[03:51.89]被那么多人崇拜\r\n[03:55.97]\r\n[03:56.72]要是能重来', '/music/song/1616394782794李荣浩 - 李白.mp3', 28, '华语,流行,民谣');
INSERT INTO `song` VALUES (63, 28, '年少有为', '耳朵', '2021-03-22', '2022-03-19', '/img/songPic/1616394991515年少有为.jpg', '[00:00.47]年少有为 - 李荣浩\r\n[00:01.17]词：李荣浩\r\n[00:01.30]曲：李荣浩\r\n[00:01.43]制作人Producer：李荣浩Ronghao Li\r\n[00:01.73]编曲Arrangement：李荣浩Ronghao Li\r\n[00:01.99]吉他Guitars：李荣浩Ronghao Li\r\n[00:02.26]贝斯Bass：李荣浩Ronghao Li\r\n[00:02.52]鼓Drums：Alex\r\n[00:02.62]和声编写Backing Vocal Arrangement：李荣浩Ronghao Li\r\n[00:03.02]和声Backing Vocal：李荣浩Ronghao Li\r\n[00:03.32]弦乐编写Strings Arrangement：李荣浩Ronghao Li\r\n[00:03.68]弦乐Strings：国际首席爱乐乐团International Master Philharmonic Orchestra\r\n[00:04.17]录音师Recording Engineer：李荣浩Ronghao Li\r\n[00:04.50]混音师Mixing Engineer：李荣浩Ronghao Li\r\n[00:04.83]录音室Recording Studio：北京一样音乐录音室Beijing Young Music Studio\r\n[00:05.43]混音室Mixing Studio：北京一样音乐录音室Beijing Young Music Studio\r\n[00:06.02]母带后期制作人Mastering Producer：李荣浩Ronghao Li\r\n[00:06.48]母带后期处理工程师Mastering Engineer：周天澈TC Z.\r\n[00:07.01]母带后期处理录音室Mastering Studio：TC Faders\r\n[00:07.44]OP：一样音乐工作室\r\n[00:07.70]SP：酷亚音乐 (深圳)有限公司 admin by One Asia Music Inc. 酷亚音乐股份有限公司\r\n[00:29.92]电视一直闪\r\n[00:33.57]联络方式都还没删\r\n[00:37.31]你待我的好\r\n[00:40.92]我却错手毁掉\r\n[00:44.58]也曾一起想\r\n[00:48.20]有个地方睡觉吃饭\r\n[00:51.82]可怎么去熬\r\n[00:53.81]日夜颠倒连头款也凑不到\r\n[00:59.30]墙板 被我砸烂\r\n[01:02.77]到现在还没修\r\n[01:06.07]一碗热的粥\r\n[01:08.18]你怕我没够\r\n[01:10.00]都留一半带走\r\n[01:12.81]给你形容\r\n[01:15.42]美好今后你常常眼睛会红\r\n[01:20.54]原来心疼我 我那时候不懂\r\n[01:27.43]假如我年少有为不自卑\r\n[01:31.81]懂得什么是珍贵\r\n[01:34.20]那些美梦\r\n[01:37.86]没给你 我一生有愧\r\n[01:41.97]假如我年少有为 知进退\r\n[01:46.26]才不会让你替我受罪\r\n[01:50.15]婚礼上 多喝几杯\r\n[01:53.36]和你现在那位\r\n[02:26.33]也曾一起想\r\n[02:29.96]有个地方睡觉吃饭\r\n[02:33.61]可怎么去熬\r\n[02:35.57]日夜颠倒连头款也凑不到\r\n[02:41.15]墙板 被我砸烂\r\n[02:44.57]到现在还没修\r\n[02:47.85]一碗热的粥\r\n[02:49.92]你怕我没够\r\n[02:51.83]都留一半带走\r\n[02:54.57]给你形容\r\n[02:57.28]美好今后你常常眼睛会红\r\n[03:02.37]原来心疼我 我那时候不懂\r\n[03:09.26]假如我年少有为不自卑\r\n[03:13.55]懂得什么是珍贵\r\n[03:16.02]那些美梦\r\n[03:19.67]没给你 我一生有愧\r\n[03:23.72]假如我年少有为 知进退\r\n[03:28.12]才不会让你替我受罪\r\n[03:32.01]婚礼上 多喝几杯\r\n[03:35.09]和你现在那位\r\n[03:41.94]假如我年少有为不自卑\r\n[03:46.23]尝过后悔的滋味\r\n[03:48.76]金钱地位\r\n[03:52.40]搏到了却好想退回\r\n[03:56.42]假如我年少有为 知进退\r\n[04:00.84]才不会让你替我受罪\r\n[04:04.70]婚礼上 多喝几杯\r\n[04:07.81]和你现在那位\r\n[04:15.30]在婚礼上 多喝几杯\r\n[04:18.79]祝我年少有为', '/music/song/1616394978009李荣浩 - 年少有为.mp3', 19, '华语,流行,选项8');
INSERT INTO `song` VALUES (64, 32, '借 (Live)', '明日之子 第11期', '2021-03-22', '2022-03-19', '/img/songPic/1616395649312借.jpg', '[00:00.00]借 (Live) - 毛不易\r\n[00:00.92]词：毛不易\r\n[00:01.85]曲：毛不易\r\n[00:02.78]编曲：陈思同 byT.Y.Z\r\n[00:03.71]音乐总监：谭伊哲\r\n[00:04.64]乐队：TYZ乐队\r\n[00:05.57]乐队队长：黄竣琮\r\n[00:06.50]键盘：韩韵/杨猛\r\n[00:07.43]鼓手：胡宇飞\r\n[00:08.36]吉他：黄竣琮/Andrew Moore（加拿大）\r\n[00:09.29]贝斯：Ryan Bradetich（美国）\r\n[00:10.21]和声：王思思/刘苪嘉/宋豪\r\n[00:11.14]打击乐：Gman\r\n[00:12.07]电脑工程：郭丁尘\r\n[00:13.00]音乐统筹：吕易秋\r\n[00:13.93]借一盏午夜街头 昏黄灯光\r\n[00:18.52]\r\n[00:20.33]照亮那坎坷路上人影一双\r\n[00:24.82]\r\n[00:26.73]借一寸三九天里 冽冽暖阳\r\n[00:31.76]\r\n[00:33.23]融这茫茫人间刺骨凉\r\n[00:38.27]\r\n[00:39.64]借一泓古老河水 九曲回肠\r\n[00:44.06]\r\n[00:45.77]带着那摇晃烛火 漂往远方\r\n[00:50.86]\r\n[00:52.57]借一段往日旋律 婉转悠扬\r\n[00:57.44]\r\n[00:58.76]把这不能说的轻轻唱\r\n[01:04.06]\r\n[01:05.29]被这风吹散的人说他爱得不深\r\n[01:11.86]被这雨淋湿的人说他不会冷\r\n[01:17.76]无边夜色到底还要蒙住多少人\r\n[01:24.52]\r\n[01:25.29]它写进眼里 他不敢承认\r\n[01:31.16]\r\n[01:59.13]借一抹临别黄昏悠悠斜阳\r\n[02:04.46]\r\n[02:06.28]为这漫漫余生添一道光\r\n[02:11.21]\r\n[02:12.30]借一句刻骨铭心来日方长\r\n[02:17.42]\r\n[02:18.93]倘若不得不天各一方\r\n[02:24.89]\r\n[02:25.70]被这风吹散的人说他爱得不深\r\n[02:31.34]\r\n[02:31.88]被这雨淋湿的人说他不会冷\r\n[02:37.85]无边夜色到底还要蒙住多少人\r\n[02:44.32]\r\n[02:45.04]它写进眼里 他不敢承认\r\n[02:50.83]可是啊 总有那风吹不散的认真\r\n[02:57.29]总有大雨也不能抹去的泪痕\r\n[03:03.41]有一天太阳会升起在某个清晨\r\n[03:09.74]\r\n[03:10.76]一道彩虹 两个人\r\n[03:15.57]\r\n[03:21.39]借一方乐土让他容身\r\n[03:25.78]\r\n[03:28.15]借他平凡一生', '/music/song/1616395615446毛不易 - 借 (Live).mp3', 18, '华语,民谣,流行');
INSERT INTO `song` VALUES (65, 32, '像我这样的人 (Live)', '明日之子 第8期', '2021-03-22', '2022-03-19', '/img/songPic/1616395750827像我这样的人.jpg', '[00:00.00]像我这样的人 (Live) - 毛不易\r\n[00:01.06]词：毛不易\r\n[00:02.13]曲：毛不易\r\n[00:03.20]编曲：郑楠\r\n[00:04.27]音乐总监：谭伊哲\r\n[00:05.34]乐队：TYZ乐队\r\n[00:06.41]乐队队长： 黄竣琮\r\n[00:07.48]键盘： 韩韵/杨猛\r\n[00:08.55]鼓手： 胡宇飞\r\n[00:09.62]吉他： 黄竣琮/Andrew Moore (加拿大)\r\n[00:10.69]贝斯： Ryan Bradetich （美国）\r\n[00:11.75]和声：宋豪/简绮琴/刘芮嘉\r\n[00:12.82]打击乐：Gman\r\n[00:13.89]电脑工程：郭丁尘\r\n[00:14.96]音乐统筹：吕易秋\r\n[00:16.04]像我这样优秀的人\r\n[00:18.87]\r\n[00:19.75]本该灿烂过一生\r\n[00:23.06]\r\n[00:24.06]怎么二十多年到头来\r\n[00:27.71]还在人海里浮沉\r\n[00:30.51]\r\n[00:31.59]像我这样聪明的人\r\n[00:34.41]\r\n[00:35.35]早就告别了单纯\r\n[00:38.12]\r\n[00:39.22]怎么还是用了一段情\r\n[00:43.07]去换一身伤痕\r\n[00:46.07]\r\n[00:47.27]像我这样迷茫的人\r\n[00:50.12]\r\n[00:51.02]像我这样寻找的人\r\n[00:53.97]\r\n[00:54.63]像我这样碌碌无为的人\r\n[00:59.00]你还见过多少人\r\n[01:01.22]\r\n[01:22.14]像我这样庸俗的人\r\n[01:24.72]\r\n[01:25.64]从不喜欢装深沉\r\n[01:28.47]\r\n[01:29.64]怎么偶尔听到老歌时\r\n[01:33.52]忽然也晃了神\r\n[01:36.13]\r\n[01:37.40]像我这样懦弱的人\r\n[01:40.37]\r\n[01:41.28]凡事都要留几分\r\n[01:43.80]\r\n[01:44.96]怎么曾经也会为了谁\r\n[01:48.95]想过奋不顾身\r\n[01:51.83]\r\n[01:53.02]像我这样迷茫的人\r\n[01:56.73]像我这样寻找的人\r\n[01:59.72]\r\n[02:00.50]像我这样碌碌无为的人\r\n[02:04.57]你还见过多少人\r\n[02:07.77]\r\n[02:08.44]像我这样孤单的人\r\n[02:12.05]像我这样傻的人\r\n[02:14.74]\r\n[02:15.92]像我这样不甘平凡的人\r\n[02:20.03]世界上有多少人\r\n[02:22.39]\r\n[02:25.80]像我这样莫名其妙的人\r\n[02:29.49]\r\n[02:30.19]会不会有人心疼', '/music/song/1616395741254毛不易 - 像我这样的人 (Live).mp3', 13, '华语,民谣,选项8');
INSERT INTO `song` VALUES (66, 32, '消愁 (Live)', '明日之子 第7期', '2021-03-22', '2022-03-19', '/img/songPic/1616395835697消愁.jpg', '[00:00.00]消愁 (Live) - 毛不易\r\n[00:03.01]词：毛不易\r\n[00:06.03]曲：毛不易\r\n[00:09.04]编曲：郑楠\r\n[00:12.06]音乐总监：谭伊哲\r\n[00:15.07]乐队：TYZ乐队\r\n[00:18.09]当你走进这欢乐场\r\n[00:22.25]背上所有的梦与想\r\n[00:26.67]各色的脸上各色的妆\r\n[00:30.99]没人记得你的模样\r\n[00:35.32]三巡酒过你在角落\r\n[00:39.77]固执地唱着苦涩的歌\r\n[00:44.04]听他在喧嚣里被淹没\r\n[00:48.28]你拿起酒杯对自己说\r\n[00:52.86]一杯敬朝阳 一杯敬月光\r\n[00:57.21]唤醒我的向往 温柔了寒窗\r\n[01:01.03]于是可以不回头地逆风飞翔\r\n[01:05.89]不怕心头有雨 眼底有霜\r\n[01:10.36]一杯敬故乡 一杯敬远方\r\n[01:14.61]守着我的善良 催着我成长\r\n[01:18.49]所以南北的路从此不再漫长\r\n[01:23.43]灵魂不再无处安放\r\n[01:47.45]一杯敬明天 一杯敬过往\r\n[01:51.75]宽重我的身体 厚重了肩膀\r\n[01:55.55]虽然从不相信所谓山高水长\r\n[02:00.51]人生苦短何必念念不忘\r\n[02:04.83]一杯敬自由 一杯敬死亡\r\n[02:09.22]宽恕我的平凡 驱散了迷惘\r\n[02:13.05]好吧天亮之后总是潦草离场\r\n[02:17.87]清醒的人最荒唐\r\n[02:21.77]好吧天亮之后总是潦草离场\r\n[02:26.61]清醒的人最荒唐', '/music/song/1616395793947毛不易-消愁(Live).mp3', 28, '民谣,华语,流行');
INSERT INTO `song` VALUES (67, 32, '烟火成都', '烟火成都', '2021-03-22', '2022-03-19', '/img/songPic/1616396724347烟火成都.jpg', '[00:00.00]烟火成都 - 毛不易\r\n[00:01.86]词：吴牧禅\r\n[00:02.47]曲：谭伊哲\r\n[00:03.09]编曲：谭伊哲\r\n[00:03.85]制作人：谭伊哲\r\n[00:04.75]音乐制作：TYZ music\r\n[00:05.63]钢琴：谭伊哲\r\n[00:06.33]鼓：谭伊哲\r\n[00:06.96]电吉他：范郡哲\r\n[00:07.94]木吉他：黄竣琮\r\n[00:08.95]贝斯：王瀚一\r\n[00:09.81]和音：梁古驰\r\n[00:10.63]弦乐编写：李仁赫\r\n[00:11.74]弦乐：中国国家交响乐团\r\n[00:13.34]混音：齐文涛\r\n[00:14.10]音乐统筹：修卓辰\r\n[00:15.36]温柔的风\r\n[00:17.94]安慰孩子们的梦\r\n[00:22.44]幽静的街\r\n[00:25.07]桂花香轻抚面容\r\n[00:29.49]天真笑容\r\n[00:32.16]是一片安宁天空\r\n[00:36.60]纤弱小手\r\n[00:39.28]总会给我最深最初的感动\r\n[00:43.82]我们惊喜着相遇\r\n[00:47.24]然后再挥手别离\r\n[00:50.98]平凡的烟火人间\r\n[00:54.33]是你的付出撑起了我们的天空\r\n[01:01.57]轻轻拥抱\r\n[01:04.27]每一个陌生祝福\r\n[01:08.55]成都 成都\r\n[01:12.30]美妙奇幻的礼物\r\n[01:15.84]平安中国\r\n[01:18.55]给你我家的温度\r\n[01:22.72]成都 成都\r\n[01:26.39]千万张温暖笑容\r\n[01:28.87]定格幸福\r\n[01:44.34]愿鞠躬尽瘁\r\n[01:47.14]武侯祠里仍回荡\r\n[01:51.35]一杯竹叶青\r\n[01:54.30]黑恶扫净再品尝\r\n[01:58.48]年轻的恋人啊\r\n[02:01.29]鹭湖畔互诉衷肠\r\n[02:05.80]生命如歌\r\n[02:08.27]岁月在锦江河里静静流淌\r\n[02:12.97]我们惊喜着相遇\r\n[02:16.39]然后再挥手别离\r\n[02:20.09]平凡的烟火人间\r\n[02:23.46]是你的付出撑起了我们的天空\r\n[02:30.87]轻轻拥抱\r\n[02:33.40]每一个陌生祝福\r\n[02:37.60]成都 成都\r\n[02:41.28]美妙奇幻的礼物\r\n[02:44.92]平安中国\r\n[02:47.62]给你我家的温度\r\n[02:51.94]成都 成都\r\n[02:55.49]千万张温暖笑容\r\n[02:58.21]定格幸福', '/music/song/1616396715161毛不易 - 烟火成都.mp3', 20, '华语,民谣');
INSERT INTO `song` VALUES (68, 32, '牧马城市 (《老男孩》电视剧片尾曲)', '牧马城市', '2021-03-22', '2022-03-19', '/img/songPic/1616396825365牧马城市.jpg', '[00:00.00]牧马城市 - 毛不易\r\n[00:02.43]词：段思思\r\n[00:04.87]曲：谭旋\r\n[00:07.30]编曲：蔡科俊\r\n[00:09.74]制作人：谭旋\r\n[00:12.17]吉他：蔡科俊\r\n[00:14.61]贝斯：蔡科俊\r\n[00:17.04]弦乐：国际首席爱乐乐团\r\n[00:19.48]录音：谭旋\r\n[00:21.91]混音：周天澈\r\n[00:24.35]和声：曾缔\r\n[00:26.78]录音棚：谭旋音乐工作室\r\n[00:29.22]出品：上海谭旋音乐工作室\r\n[00:31.66]游历在大街和楼房\r\n[00:34.57]心中是骏马和猎场\r\n[00:37.67]最了不起的脆弱迷惘\r\n[00:41.08]不过就这样\r\n[00:43.65]\r\n[00:44.34]天外有天有无常\r\n[00:47.30]山外有山有他乡\r\n[00:50.41]跌了撞了 心还是回老地方\r\n[00:54.95]\r\n[00:56.87]游离于城市的痛痒\r\n[00:59.79]错过了心爱的姑娘\r\n[01:02.92]宣告世界的那个理想\r\n[01:06.27]已不知去向\r\n[01:09.36]为所欲为是轻狂\r\n[01:12.33]防不胜防是悲伤\r\n[01:15.65]后来才把成熟当偏方\r\n[01:20.40]\r\n[01:21.57]当所有想的说的要的爱的\r\n[01:25.17]都挤在心脏\r\n[01:27.68]\r\n[01:28.39]行李箱里装不下我 想去的远方\r\n[01:33.99]\r\n[01:34.53]这来的去的给的欠的 算一种褒奖\r\n[01:40.06]\r\n[01:40.74]风吹草低见惆怅 抬头至少还有光\r\n[01:45.90]\r\n[02:12.67]游历在大街和楼房\r\n[02:15.58]心中是骏马和猎场\r\n[02:18.77]最了不起的脆弱迷惘\r\n[02:22.11]不过就这样\r\n[02:24.99]天外有天有无常\r\n[02:28.19]山外有山有他乡\r\n[02:31.49]跌了撞了 心还是回老地方\r\n[02:36.21]\r\n[02:37.88]游离于城市的痛痒\r\n[02:40.85]错过了心爱的姑娘\r\n[02:44.03]宣告世界的那个理想\r\n[02:47.34]已不知去向\r\n[02:49.80]\r\n[02:50.57]为所欲为是轻狂\r\n[02:53.60]防不胜防是悲伤\r\n[02:56.79]后来才把成熟当偏方\r\n[03:01.94]\r\n[03:02.60]当所有想的说的要的爱的\r\n[03:06.32]都挤在心脏\r\n[03:08.75]\r\n[03:09.33]行李箱里装不下我 想去的远方\r\n[03:15.01]\r\n[03:15.61]这来的去的给的欠的算一种褒奖\r\n[03:21.76]风吹草低见惆怅\r\n[03:23.52]抬头至少还有光\r\n[03:27.05]\r\n[03:27.84]把烦恼痛了吞了认了算了\r\n[03:31.46]不对别人讲\r\n[03:34.03]\r\n[03:34.62]谁还没有辜负几段 昂贵的时光\r\n[03:40.24]\r\n[03:40.85]若男孩笑了哭了累了\r\n[03:44.17]说要去流浪\r\n[03:47.04]留下大人的模样\r\n[03:48.88]看岁月剑拔弩张\r\n[03:52.02]\r\n[03:53.57]总会有个人成为你的远方', '/music/song/1616396817004毛不易 - 牧马城市.mp3', 21, '华语,民谣,选项8');
INSERT INTO `song` VALUES (70, 26, 'How You Like That', 'How You Like That', '2021-03-22', '2022-03-19', '/img/songPic/1616397665616howyoulikethat.jpg', '[00:00.00]How You Like That - BLACKPINK\r\n[00:03.12]词：TEDDY/Danny Chung\r\n[00:06.25]曲：TEDDY/R.Tee/24\r\n[00:09.37]编曲：R.Tee/24\r\n[00:12.55]보란 듯이 무너졌어\r\n[00:16.11]바닥을 뚫고 저 지하까지\r\n[00:19.82]옷 끝자락 잡겠다고\r\n[00:23.44]저 높이 두 손을 뻗어봐도\r\n[00:27.29]다시 캄캄한 이곳에 light up the sky\r\n[00:31.29]네 두 눈을 보며 I\'ll kiss you goodbye\r\n[00:35.26]실컷 비웃어라 꼴좋으니까\r\n[00:38.43]이제 너희 하나 둘 셋\r\n[00:41.08]Ha how you like that\r\n[00:45.15]You gon\' like that that that that that\r\n[00:49.09]How you like that\r\n[00:52.60]How you like that that that that that\r\n[00:56.85]Now look at you now look at me\r\n[00:59.62]Look at you now look at me\r\n[01:01.41]Look at you now look at me\r\n[01:03.14]How you like that\r\n[01:04.39]Now look at you now look at me\r\n[01:06.93]Look at you now look at me\r\n[01:08.78]Look at you now look at me\r\n[01:10.28]How you like that\r\n[01:11.91]Your girl need it all and that\'s a hundred\r\n[01:13.93]백 개 중에 백 내 몫을 원해\r\n[01:15.54]Karma come and get some\r\n[01:16.45]딱하지만 어쩔 수 없잖아\r\n[01:18.88]What\'s up I\'m right back\r\n[01:20.68]방아쇠를 cock back\r\n[01:22.48]Plain Jane get hijacked\r\n[01:23.58]Don\'t like me\r\n[01:24.31]Then tell me how you like that like that\r\n[01:26.67]더 캄캄한 이곳에 shine like the stars\r\n[01:30.31]그 미소를 띠며 I\'ll kiss you goodbye\r\n[01:34.17]실컷 비웃어라 꼴좋으니까\r\n[01:37.45]이제 너희 하나 둘 셋\r\n[01:40.09]Ha how you like that\r\n[01:42.06]\r\n[01:44.39]You gon\' like that that that that that\r\n[01:47.09]\r\n[01:48.42]How you like that\r\n[01:49.49]\r\n[01:51.72]How you like that that that that that\r\n[01:54.22]\r\n[01:55.98]Now look at you now look at me\r\n[01:58.72]Look at you now look at me\r\n[02:00.48]Look at you now look at me\r\n[02:02.03]How you like that\r\n[02:03.46]Now look at you now look at me\r\n[02:06.10]Look at you now look at me\r\n[02:07.87]Look at you now look at me\r\n[02:09.39]How you like that\r\n[02:10.81]\r\n[02:11.66]날개 잃은 채로 추락했던 날\r\n[02:15.47]어두운 나날 속에 갇혀 있던 날\r\n[02:19.01]그때쯤에 넌 날 끝내야 했어\r\n[02:22.21]Look up in the sky it\'s a bird it\'s a plane\r\n[02:25.91]\r\n[02:32.40]Bring out your boss bish\r\n[02:33.63]\r\n[02:39.99]BLACKPINK\r\n[02:40.62]\r\n[02:43.41]How you like that\r\n[02:44.85]\r\n[02:47.13]You gon\' like that\r\n[02:48.55]\r\n[02:50.77]How you like that', '/music/song/1616397628832BLACKPINK - How You Like That.mp3', 63, '日韩,流行,摇滚');
INSERT INTO `song` VALUES (71, 33, 'Hello', 'Hello', '2021-03-22', '2022-03-19', '/img/songPic/1616399541787hello.jpg', '[00:00.00]Hello (你好) - Barbara Opsomer\r\n[00:03.68]Written by：Frédéric Chateau\r\n[00:07.37]La lueur des regards s\'é teint sur le bitume\r\n[00:10.66]\r\n[00:14.07]Je suis accompagné e d\'une certaine amertume\r\n[00:17.39]\r\n[00:21.02]I feel lost\r\n[00:22.08]I feel lost\r\n[00:22.99]I feel lost in my head\r\n[00:24.43]\r\n[00:24.97]I feel lost\r\n[00:25.87]I feel lost\r\n[00:26.89]I feel lost in my head\r\n[00:28.52]Je fais tout de travers\r\n[00:30.14]Je ne sais pas quoi faire\r\n[00:31.58]\r\n[00:32.09]De mes dix doigts en sang\r\n[00:33.73]\r\n[00:35.93]Je fous ma vie en l\'air à chercher la lumiè re\r\n[00:39.43]\r\n[00:39.99]Et des vrais sentiments\r\n[00:41.34]\r\n[00:44.14]Je dis\r\n[00:45.15]Hello hello\r\n[00:45.92]\r\n[00:46.76]Est ce que quelqu\'un peut me sauver\r\n[00:48.59]\r\n[00:49.15]Hello hello\r\n[00:49.89]\r\n[00:50.68]Est ce que quelqu\'un peut m\'entendre\r\n[00:52.36]\r\n[00:52.99]Hello hello\r\n[00:53.78]\r\n[00:54.44]Je ressens toujours un manque que je ne peux pas expliquer\r\n[00:58.20]\r\n[01:00.44]Je prends tous les devants pour me sentir moins seul\r\n[01:04.07]\r\n[01:07.14]Je lance ma fusé e qu\'on regarde ma gueule\r\n[01:10.68]\r\n[01:14.29]I feel lost\r\n[01:15.21]I feel lost\r\n[01:15.96]I feel lost in my head\r\n[01:17.92]I feel lost\r\n[01:18.90]I feel lost\r\n[01:19.94]I feel lost in my head\r\n[01:21.49]Je fais tout de travers\r\n[01:22.69]\r\n[01:23.25]Je ne sais pas quoi faire\r\n[01:25.15]De mes dix doigts en sang\r\n[01:26.58]\r\n[01:29.01]Je fous ma vie en l\'air à chercher la lumiè re\r\n[01:32.44]\r\n[01:33.02]Et des vrais sentiments\r\n[01:34.28]\r\n[01:37.15]Je dis\r\n[01:38.18]Hello hello\r\n[01:39.17]\r\n[01:39.82]Est ce que quelqu\'un peut me sauver\r\n[01:42.08]Hello hello\r\n[01:43.01]\r\n[01:43.67]Est ce que quelqu\'un peut m\'entendre\r\n[01:45.41]\r\n[01:46.09]Hello hello\r\n[01:46.87]\r\n[01:47.49]Je ressens toujours un manque que je ne peux pas expliquer\r\n[01:51.38]\r\n[01:52.93]Je fais tout de travers\r\n[01:54.17]\r\n[01:54.73]Je ne sais pas quoi faire\r\n[01:56.10]\r\n[01:56.63]De mes dix doigts en sang\r\n[01:58.05]\r\n[02:00.61]Je fous ma vie en l\'air à chercher la lumiè re\r\n[02:03.89]\r\n[02:04.52]Et des vrais sentiments\r\n[02:05.98]\r\n[02:08.67]Je dis\r\n[02:09.53]Hello hello\r\n[02:10.46]\r\n[02:11.30]Est ce que quelqu\'un peut me sauver\r\n[02:12.90]\r\n[02:13.47]Hello hello\r\n[02:14.39]\r\n[02:15.24]Est ce que quelqu\'un peut m\'entendre\r\n[02:17.32]Hello hello\r\n[02:18.36]\r\n[02:18.97]Je ressens toujours un manque que je ne peux pas expliquer\r\n[02:23.54]\r\n[02:25.21]Heureusement qu\'il y a un truc qui ressemble au soleil\r\n[02:30.37]\r\n[02:32.69]Mathé matiquement possible que je me ré veille\r\n[02:37.88]\r\n[02:41.20]Hello hello\r\n[02:41.99]\r\n[02:45.06]Hello hello\r\n[02:45.91]\r\n[02:48.80]Hello hello\r\n[02:49.91]\r\n[02:52.39]Je ne peux pas expliquer\r\n[02:54.62]\r\n[02:55.96]Je dis\r\n[02:56.79]Hello hello\r\n[02:57.64]\r\n[02:58.63]Est ce que quelqu\'un peut me sauver\r\n[03:00.84]Hello hello\r\n[03:01.64]\r\n[03:02.44]Est ce que quelqu\'un peut m\'entendre\r\n[03:04.52]Hello hello\r\n[03:05.48]\r\n[03:06.18]Je ressens toujours un manque que je ne peux pas expliquer\r\n[03:10.29]\r\n[03:12.66]Hello hello', '/music/song/1616399534314Barbara Opsomer - Hello.mp3', 24, '欧美,摇滚,流行');
INSERT INTO `song` VALUES (72, 34, 'Why Baby Why', 'Faces', '2021-03-22', '2022-03-19', '/img/songPic/1616399896063whybabywhy.jpg', '[00:00.00]Why Baby Why - Mykey\r\n[00:02.27]Lyrics by：MyKey\r\n[00:04.54]What do you mean god gave me two left feet\r\n[00:08.61]Shooting me glares from the passenger seat\r\n[00:11.77]Come on baby we got all dressed up\r\n[00:15.07]Won\'t you dance with me\r\n[00:19.69]Why baby why do you give me trouble\r\n[00:23.69]I\'m trying to hide as not to be seen\r\n[00:27.90]But I know you mean well step on my feet\r\n[00:31.65]Come dance with me\r\n[00:36.35]Come on try to have a good time\r\n[00:40.49]There\'s a punch bowl but you brought red wine\r\n[00:44.63]Come on baby show me what\'s a good time\r\n[00:48.78]Why baby why\r\n[00:54.16]Why must you play me like I play the guitar\r\n[00:58.26]She made me jump into the reservoir\r\n[01:01.44]And go running \'til we fade to black\r\n[01:04.77]Like the movies do\r\n[01:09.41]Why baby why do you give me trouble\r\n[01:13.43]I\'m trying to hide as not to be seen\r\n[01:17.68]But I know you mean well step on my feet\r\n[01:21.26]Come dance with me\r\n[01:26.00]Come on try to have a good time\r\n[01:30.16]There\'s a punch bowl but you brought red wine\r\n[01:34.21]Come on baby show me what\'s a good time\r\n[01:38.34]Why baby why\r\n[01:59.10]Come on try to have a good time\r\n[02:03.30]There\'s a punch bowl but you brought red wine\r\n[02:07.36]Come on baby show me what\'s a good time\r\n[02:11.49]Why baby why\r\n[02:14.06]Oh-oh\r\n[02:15.66]Come on baby show me what\'s a good time\r\n[02:19.72]Why baby why', '/music/song/1616399871166Mykey - Why Baby Why.mp3', 57, '欧美,流行,选项8');
INSERT INTO `song` VALUES (73, 37, 'POP/STARS', 'POP/STARS', '2021-03-29', '2022-03-19', '/img/songPic/1617030510944popstarts.jpg', '[00:00.000] 作词 : Jessica Karpov\r\n[00:01.000] 作曲 : Sebastien Najand\r\n[00:06.020]You know who it is\r\n[00:07.270]Coming\' round again\r\n[00:08.630]You want a dose of this\r\n[00:09.820]Right now\r\n[00:10.450]It\'s K/DA uh\r\n[00:11.900]I\'m a goddess with a blade\r\n[00:13.260]소리쳐봐 내 이름\r\n[00:14.680]잊지 못하게\r\n[00:15.740]Loud loud loud loud\r\n[00:17.500]I could take it to the top\r\n[00:18.960]절대 멈추지 못해\r\n[00:20.340]내가 끝내주는\r\n[00:21.460]Bad gal gal gal\r\n[00:23.190]And when I start to talk like that like that\r\n[00:25.990]Oh you won\'t know how to react\r\n[00:28.910]I\'m a picture perfect face\r\n[00:30.320]With that wild in my veins\r\n[00:31.870]You can hear it in my\r\n[00:33.050]Growl growl growl growl\r\n[00:35.020]So keep your eyes on me now\r\n[00:38.000]무엇을 보든 좋아할 거야\r\n[00:40.760]닿을 수 없는 level\r\n[00:43.610]나와 대결 원한 널 확신해\r\n[00:46.590]We gotta it all in our hands now\r\n[00:49.180]So can you handle what we\'re all about\r\n[00:51.600]We\'re so tough\r\n[00:52.430]Not scared to show you up\r\n[00:53.950]Can you feel the rush now\r\n[00:55.740]Ain\'t nobody bringing us down down down\r\n[00:58.130]Down down down\r\n[00:59.350]They could try but we\'re gonna wear the crown\r\n[01:01.390]You could go another round round round\r\n[01:03.400]Round round round round\r\n[01:04.830]Wish you luck but you\'re not bringing us down\r\n[01:07.570]We go hard\r\n[01:09.110]Till we get it get it\r\n[01:10.470]We go hard\r\n[01:11.870]We so in it in it\r\n[01:13.290]We POP/STARS\r\n[01:14.750]Only winning winning now\r\n[01:16.850]Ain\'t nobody bringing us down down down down\r\n[01:22.500]See 언제든지 내 모습 magic\r\n[01:24.700]단 한 번에 내가 잡어\r\n[01:26.100]절대 기죽지 않지 uh\r\n[01:28.020]Pow pow 네가 뭘 알아\r\n[01:29.430]견딜 수 없어 원해도\r\n[01:30.770]원하는 게 얼굴에 보여\r\n[01:31.920]I\'m trouble and you\'re wanting it\r\n[01:33.340]I\'m so cold\r\n[01:34.670]When I move that way\r\n[01:35.730]You gonna be so blown\r\n[01:37.620]I\'m the realest in the game uh\r\n[01:39.450]Say I\'m on fire with a blade\r\n[01:41.120]You\'re about to hear my name\r\n[01:42.410]Ringing in your head like oh\r\n[01:45.640]So keep your eyes on me now\r\n[01:48.470]무엇을 보든 좋아할 거야\r\n[01:50.650]We\'re so tough\r\n[01:51.780]Not scared to show you up\r\n[01:53.250]Can you feel the rush now\r\n[01:54.980]Ain\'t nobody bringing us down down down\r\n[01:57.340]Down down down\r\n[01:58.620]They could try but we\'re gonna wear the crown\r\n[02:00.660]You could go another round round round\r\n[02:02.660]Round round round round\r\n[02:04.160]Wish you luck but you\'re not bringing us down\r\n[02:06.870]We go hard\r\n[02:08.360]Till we get it get it\r\n[02:09.710]We go hard\r\n[02:11.140]We so in it in it\r\n[02:12.580]We POP/STARS\r\n[02:13.990]Only winning winning now\r\n[02:16.110]Ain\'t nobody bringing us down down down down\r\n[02:21.980]Ooh mm oh 난 멈추지 않아\r\n[02:34.100]Oh oh we go hard\r\n[02:36.920]Oh oh we POP/STARS stars\r\n[02:40.920]\r\n[02:41.690]Ain\'t nobody bringing us\r\n[02:43.080]Ain\'t nobody bringing us down down down\r\n[02:45.380]Down down down\r\n[02:46.600]They could try but we\'re gonna wear the crown\r\n[02:48.770]You could go another round round round\r\n[02:50.650]Round round round round\r\n[02:52.150]Wish you luck but you\'re not bringing us down\r\n[02:54.880]We go hard\r\n[02:56.330]Till we get it get it\r\n[02:57.710]We go hard\r\n[02:59.090]We so in it in it\r\n[03:00.560]We POP/STARS\r\n[03:01.990]Only winning winning now\r\n[03:04.120]Ain\'t nobody bringing us down down down down', '/music/song/1617030499311K_DA _ Madison Beer _ 美延 (미연) _ Jaira Burns _ 田小娟 (전소연) - POP_STARS.mp3', 70, '欧美,摇滚,流行');
INSERT INTO `song` VALUES (74, 38, 'POP/STARS', 'POP/STARS', '2021-03-29', '2022-03-19', '/img/songPic/1617030918303popstarts_seraphine.jpg', '[00:00.00]POP/STARS - Seraphine/Jasmine Clarke/Absofacto\r\n[00:00.59]Lyrics by：Jessica Karpov/Sebastien Najand\r\n[00:01.19]Composed by：Jessica Karpov/Sebastien Najand\r\n[00:01.86]I\'m a goddess with a blade\r\n[00:03.38]You\'re about to hear my name\r\n[00:04.89]Ringin\' in your head loud loud loud loud\r\n[00:07.86]I could take it to the top\r\n[00:09.40]I know you don\'t wanna stop\r\n[00:11.01]When I drop it like a bad gal gal gal\r\n[00:13.97]And when I start to talk like that\r\n[00:16.22]Like that\r\n[00:16.98]Oh you won\'t know how to react\r\n[00:19.18]React\r\n[00:19.92]I\'m a picture-perfect face with that wild in my veins\r\n[00:22.96]You can hear it in my growl growl growl growl\r\n[00:26.45]So keep your eyes on me now\r\n[00:29.44]I feel like you\'re likin\' what you see\r\n[00:32.41]I\'m on a whole other level\r\n[00:35.45]I bet you wanna come and play with me\r\n[00:38.44]We got it all in our hands now\r\n[00:41.52]So can you handle what we\'re all about\r\n[00:43.75]We\'re so tough not scared to show you up\r\n[00:46.47]Can you feel the rush now\r\n[00:48.39]Ain\'t nobody bringin\' us\r\n[00:49.88]Down down down down down down\r\n[00:52.11]They can try it but we gonna wear the crown\r\n[00:54.42]You could go another round\r\n[00:55.87]Round round round round round round\r\n[00:58.13]Wish you luck but you\'re not bringin\' us down\r\n[01:00.95]We go hard \'til we get it get it\r\n[01:04.02]We go hard we so in it in it\r\n[01:06.95]We pop stars only winnin\' winnin\' now\r\n[01:10.87]Ain\'t nobody bringin\' us down down down down\r\n[01:13.90]See any day I look like magic\r\n[01:16.72]I throw one shot and then I grab it\r\n[01:18.73]Then I grab it\r\n[01:19.75]I\'m on the edge like it\'s a habit ooh\r\n[01:23.79]So what you know about this\r\n[01:25.94]And when I start to talk like that\r\n[01:28.14]Like that\r\n[01:28.93]Oh you won\'t know how to react\r\n[01:31.14]React\r\n[01:32.03]I\'m on fire with a blade\r\n[01:33.41]You\'re about to hear my name\r\n[01:34.90]Ringin\' in your head like woah\r\n[01:38.45]So keep your eyes on me now\r\n[01:41.45]I feel like you\'re likin\' what you see\r\n[01:44.44]I\'m on a whole other level\r\n[01:47.42]I bet you wanna come and play with me\r\n[01:50.43]We got it all in our hands now\r\n[01:53.59]So can you handle what we\'re all about\r\n[01:55.76]We\'re so tough not scared to show you up\r\n[01:58.50]Can you feel the rush now\r\n[02:00.41]Ain\'t nobody bringin\' us\r\n[02:01.90]Down down down down down down\r\n[02:04.13]They can try it but we gonna wear the crown\r\n[02:06.46]You could go another round\r\n[02:07.91]Round round round round round round\r\n[02:10.26]Wish you luck but you\'re not bringin\' us down\r\n[02:12.98]We go hard \'til we get it get it\r\n[02:16.03]We go hard we so in it in it\r\n[02:19.07]We pop stars only winnin\' winnin\' now\r\n[02:22.93]Ain\'t nobody bringin\' us down down down down\r\n[02:34.89]Ain\'t nobody bringin\' us down down down down', '/music/song/1617030911580Seraphine _ Jasmine Clarke _ Absofacto - POP_STARS.mp3', 54, '欧美,民谣,流行');
INSERT INTO `song` VALUES (75, 37, 'THE BADDEST', 'THE BADDEST', '2021-03-29', '2022-03-19', '/img/songPic/1617031263448TheBadest.jpg', '[00:00.380]作曲：Riot Music Team /Bekuh BOOM\r\n[00:00.600]合作艺人：(G)I-DLE/Bea Miller/Wolftyla\r\n[00:00.760]韩文翻译：Lydia Paek/Minji Kim\r\n[00:00.990]监制：Riot Music Team\r\n[00:01.150]制作人：Akali\r\n[00:01.280]混音：Riot Music Team\r\n[00:01.440]母带：Riot Music Team\r\n[00:01.600]主唱：SOYEON of (G)I-DLE/MIYEON of (G)I-DLE/Bea Miller/Wolftyla\r\n[00:01.790]副唱：Bekuh BOOM\r\n[00:01.920]人声制作：Riot Music Team\r\n[00:02.140]附加人声制作：Oscar Free\r\n[00:02.400]Baddest do what the baddest do\r\n[00:04.230]The baddest do we the baddest ooh\r\n[00:07.650]Baddest do what the baddest do\r\n[00:10.570]The baddest do we the baddest\r\n[00:13.190]Coming at you live\r\n[00:14.780]Real real wild\r\n[00:15.790]\r\n[00:16.320]Here to light it up\r\n[00:17.690]Set the world on fire\r\n[00:18.950]\r\n[00:19.500]Gonna break rules\r\n[00:21.180]\r\n[00:21.680]And hearts in twos\r\n[00:23.560]Cause that\'s what the baddest do\r\n[00:25.370]\r\n[00:25.890]Never going back\r\n[00:26.890]\r\n[00:27.480]Nah not that\r\n[00:29.150]Diamonds on drip\r\n[00:30.530]Cause I came to make a splash\r\n[00:32.290]Gonna break rules\r\n[00:34.650]And hearts in twos\r\n[00:36.350]Cause that\'s what the baddest do\r\n[00:38.980]I spit heat I melt your face off\r\n[00:40.840]Disappear I\'m your eraser\r\n[00:42.230]In the cut just like a razor\r\n[00:44.000]Murder business where my blazer\r\n[00:45.190]I got all the boys on me\r\n[00:47.200]I got all the lines on ring\r\n[00:48.780]Knock \'em dead turnin heads\r\n[00:50.470]I got all the eyes on me\r\n[00:52.160]Pretty face 걸어들어와\r\n[00:53.940]유행 선두자\r\n[00:55.170]원하지만 못하잖아\r\n[00:57.130]애가 타잖아\r\n[00:58.360]You like whoa KALI you the goat\r\n[00:59.960]난 알지 I know\r\n[01:01.740]준비해 cause I like to ball\r\n[01:03.610]멈추지 않아\r\n[01:04.740]나는 lit 크게 like a bit\r\n[01:06.690]그거 말고 byte\r\n[01:07.990]믿어봐 큰 만큼 크게\r\n[01:09.940]어깨 펴고 high\r\n[01:11.120]백 퍼센트\r\n[01:11.870]덤비지 못해\r\n[01:12.920]죽여주잖아\r\n[01:14.350]나는 boss 간지 with the sauce\r\n[01:16.340]원하면 줄게\r\n[01:18.310]I\'m doing damage\r\n[01:19.540]Went just how I planned it\r\n[01:21.220]I do what I want when I say\r\n[01:23.640]모두 날 따라 해\r\n[01:25.470]난 끝내주잖아\r\n[01:27.430]Like to live on the edge of insane\r\n[01:29.450]\r\n[01:30.170]Coming at you live\r\n[01:31.290]Real real wild\r\n[01:33.100]Here to light it up\r\n[01:34.420]Set the world on fire\r\n[01:36.350]Gonna break rules\r\n[01:38.050]And hearts in twos\r\n[01:40.320]Cause that\'s what the baddest do\r\n[01:42.200]\r\n[01:42.700]Never going back\r\n[01:44.260]Nah not that\r\n[01:45.970]Diamonds on drip\r\n[01:47.250]Cause I came to make a splash\r\n[01:49.170]Gonna break rules\r\n[01:50.630]\r\n[01:51.410]And hearts in twos\r\n[01:53.030]Cause that\'s what the baddest do\r\n[01:54.830]\r\n[01:55.340]It\'s crazy\r\n[01:56.200]\r\n[01:57.220]Sorry for the bad news sorry I\'m so bad\r\n[01:59.900]\r\n[02:00.400]Only took a minute for me to get what you had\r\n[02:03.560]Sorry for the bad news know it makes you sad\r\n[02:06.770]I\'ll be here for a minute baby you should pack your bags\r\n[02:09.790]Way that I look should be breaking the law\r\n[02:11.040]If I don\'t got it I take what I want\r\n[02:12.480]My circle small like a round of applause\r\n[02:13.890]You know that I love the sound of applause\r\n[02:15.520]You know I mean everything that I say\r\n[02:17.080]When you see me coming get out of the way\r\n[02:18.990]I came to slay I came to slay\r\n[02:20.320]Back and I\'m better and ready to stay\r\n[02:21.870]I\'m doing damage\r\n[02:23.280]Went just how I planned it\r\n[02:25.160]I do what I want when I say\r\n[02:27.440]모두 날 따라 해\r\n[02:29.370]난 끝내주잖아\r\n[02:31.430]Like to live on the edge of insane\r\n[02:33.900]It\'s crazy\r\n[02:35.050]Sorry not sorry for being the best\r\n[02:36.430]언제든지 내가 좀 해\r\n[02:38.330]Look at the gold all on my chest\r\n[02:39.740]Look at the gold call it a flex', '/music/song/1617031256327K_DA _ 田小娟 (전소연) _ 美延 (미연) _ Bea Miller _ Wolftyla - THE BADDEST.mp3', 17, '欧美,摇滚,流行');
INSERT INTO `song` VALUES (76, 38, 'Childhood Dreams', 'Childhood Dreams', '2021-03-29', '2022-03-19', '/img/songPic/1617031410560childhoodDreams.jpg', '[00:00.00]Childhood Dreams - Seraphine/Jasmine Clarke/Absofacto\r\n[00:00.13]Lyrics by：Sebastian Teigen and Ariadne Jenssen\r\n[00:00.27]Composed by：Sebastian Teigen and Ariadne Jenssen\r\n[00:00.41]Hmm mmm mmm\r\n[00:04.21]Hmm mmm mmm\r\n[00:07.56]\r\n[00:08.18]Hmm mmm mmm\r\n[00:11.51]\r\n[00:12.17]Hmm mmm mmm\r\n[00:15.56]\r\n[00:16.09]Hmm mmm mmm\r\n[00:18.05]I dream a hundred dreams a minute\r\n[00:20.77]\r\n[00:21.58]In deep inside what I construct\r\n[00:24.28]\r\n[00:26.01]So there\'s no use don\'t even bother\r\n[00:28.67]\r\n[00:29.48]Tonight is not the night for us\r\n[00:32.20]\r\n[00:33.96]I have a million shapes a decade\r\n[00:36.68]\r\n[00:37.47]I\'m past the point of no return\r\n[00:40.23]\r\n[00:41.55]So don\'t even call don\'t even bother\r\n[00:44.46]\r\n[00:45.31]\'Cause I can\'t make you my concern\r\n[00:48.12]\r\n[00:49.82]I\'m running faster than before\r\n[00:52.33]\r\n[00:53.60]Beats and tunes and lovers\r\n[00:55.07]Cannot hold me back no more\r\n[00:56.79]I work alone\r\n[00:58.49]\r\n[01:00.05]Is this all I\'ll ever know\r\n[01:02.98]\r\n[01:03.74]And I remember all my childhood dreams\r\n[01:07.62]I find it hard to get them out of my mind\r\n[01:11.62]And I remember all my childhood dreams\r\n[01:15.62]I find it hard to get them out of my mind\r\n[01:19.59]And I remember all my\r\n[01:21.58]So as the night time hits my window\r\n[01:24.57]\r\n[01:25.29]Sudden move to gain the lights\r\n[01:27.98]\r\n[01:29.49]\'Cause I\'m not even close to done yet\r\n[01:32.30]\r\n[01:32.97]Well I won\'t leave I\'m too inspired\r\n[01:35.94]\r\n[01:37.48]And when the dawn emerges slowly\r\n[01:40.32]\r\n[01:40.98]I realize the night has passed\r\n[01:43.94]\r\n[01:45.40]The sounds I made were visionary\r\n[01:48.08]\r\n[01:49.05]Looking forward to go back\r\n[01:51.62]\r\n[01:53.30]I\'m running faster than before\r\n[01:55.79]\r\n[01:57.07]Beats and tunes and lovers\r\n[01:58.46]Cannot hold me back no more\r\n[02:00.42]I work alone\r\n[02:02.63]\r\n[02:03.59]Is this all I\'ll ever know\r\n[02:07.21]And I remember all my childhood dreams\r\n[02:11.14]I find it hard to get them out of my mind\r\n[02:15.07]And I remember all my childhood dreams\r\n[02:19.05]I find it hard to get them out of my mind\r\n[02:22.75]\r\n[02:23.27]Hmm mmm mmm\r\n[02:26.99]Hmm mmm mmm\r\n[02:30.95]Hmm mmm mmm\r\n[02:34.93]Hmm mmm mmm\r\n[02:38.87]Hmm mmm mmm', '/music/song/1617031404271Seraphine _ Jasmine Clarke _ Absofacto - Childhood Dreams.mp3', 253, '欧美,民谣,流行');
INSERT INTO `song` VALUES (77, 38, 'Made Me This Way', 'Made Me This Way', '2021-03-29', '2022-03-19', '/img/songPic/1617031633402MadeMeThisWay.jpg', '[00:00.00]Made Me This Way - Seraphine/Jasmine Clarke/Absofacto\r\n[00:01.49]Composers：Edward Kosuke Kasza/Jonathan Visger/Sophia Alexa/Chris Zane\r\n[00:02.35]Lyricist：Edward Kosuke Kasza/Jonathan Visger/Sophia Alexa/Chris Zane\r\n[00:02.58]Published by：Songs by Riot Games Music Publishing (BMI) Edward Kosuke Kasza [Edward Kosuke Kasza/Kosuke Kasza Music (BMI)] Jonathan Visger (Jonathan Visger/Sony/ATV Tunes LLC/Precious Precious (ASCAP) Sophia Alexa (Copyright Control) Chris Zane (ASCAP (North America)/PRS)\r\n[00:03.92]Produced by：Absofacto/Kosuke Kasza/Chris Zane\r\n[00:04.66]Mixed by：Absofacto/Kosuke Kasza\r\n[00:05.30]Programming by：Absofacto/Kosuke Kasza\r\n[00:05.97]Vocals：Jasmine Clarke\r\n[00:06.46]Mandarin Chinese translation by：Yixuan Pang\r\n[00:07.33]Mastered by：Absofacto/Kosuke Kasza\r\n[00:07.91]P/C：Riot Games 2020\r\n[00:11.77]There\'s a part of myself I\'m missing\r\n[00:16.96]Know I got a lot to learn\r\n[00:22.73]When I lie to myself I listen\r\n[00:27.92]Tell me things I don\'t deserve\r\n[00:32.68]But the mirror shows a different face\r\n[00:35.66]And I\'ve grown to look the other way\r\n[00:38.22]Telling myself it\'s only the start\r\n[00:42.57]Baby look what you\'ve done\r\n[00:44.91]You made me this way\r\n[00:50.35]Who gave you the say\r\n[00:55.81]When I find the place that my heart\'s in\r\n[00:58.36]I\'ll finish the things that you started\r\n[01:01.20]You made me this way\r\n[01:17.29]让你进入这深层世界\r\n[01:22.41]每一面唯有你能感觉\r\n[01:27.85]喝下你的毒药让我感觉醉了\r\n[01:33.52]带我去到不同的空间\r\n[01:38.09]But the mirror shows a different face\r\n[01:40.97]And I\'ve grown to look the other way\r\n[01:43.88]Telling myself it\'s only the start\r\n[01:48.00]Baby look what you\'ve done\r\n[01:50.33]You made me this way\r\n[01:55.81]Who gave you the say\r\n[02:01.25]When I find the place that my heart\'s in\r\n[02:03.80]I\'ll finish the things that you started\r\n[02:06.63]You made me this way\r\n[02:21.81]Ooh ooh\r\n[02:23.44]Want you outta my head\r\n[02:25.48]Ooh ooh\r\n[02:26.31]Want you outta my head\r\n[02:27.66]Ooh ooh\r\n[02:29.06]Want you outta my head\r\n[02:32.38]Ooh ooh\r\n[02:34.54]Want you outta my head\r\n[02:36.37]Ooh ooh\r\n[02:36.69]Want you outta my head\r\n[02:39.23]Ooh ooh\r\n[02:39.69]Want you outta my head', '/music/song/1617031626260Seraphine _ Jasmine Clarke _ Absofacto - Made Me This Way.mp3', 35, '欧美,民谣,流行');
INSERT INTO `song` VALUES (78, 38, 'All The Things She Said', 'All The Things She Said', '2021-03-29', '2022-03-19', '/img/songPic/1617031752951AllTheThingSheSaid.jpg', '[00:00.00]All The Things She Said - Seraphine/Jasmine Clarke/Absofacto\r\n[00:01.52]Written by：\r\n[00:01.91]Martin Kierszenbaum (Universal/MCA Music Limited (BMI))\r\n[00:02.67]Trevor Charles Horn (BMG Rights Management (UK) Limited (PRS))\r\n[00:03.82]Elena Vladimirovna Kiper (EMI Music Publishing LTD (RAO))\r\n[00:04.77]Ivan Nikolaevich Shapovalov (EMI Music Publishing LTD)\r\n[00:05.53]Valerij Valentinovich Polienko (Universal Music Publishing MGB Limited (PRS))\r\n[00:06.49]Galoyan Sergey (Sony/ATV Music Publishing (UK) Limited (PRS))\r\n[00:07.44]Composers：Ivan Nikolaevich Shapovalov/Galoyan Sergey\r\n[00:08.40]Primary Artist：Seraphine\r\n[00:08.97]Featured Artist：Jasmine Clarke/Absofacto\r\n[00:09.74]P/C：Riot Games 2020\r\n[00:10.50]I\'m in serious I feel totally lost\r\n[00:12.93]If I\'m asking for help it\'s only because\r\n[00:15.81]Being with you has opened my eyes\r\n[00:18.48]Could I ever believe such a perfect surprise\r\n[00:20.90]I keep asking myself wondering how\r\n[00:23.64]I keep closing my eyes but I can\'t block you out\r\n[00:26.45]Want to fly to a place where it\'s just you and me\r\n[00:29.07]Nobody else so we can be free\r\n[00:32.31]Nobody else so we can be free\r\n[00:34.53]All the things she said\r\n[00:35.54]All the things she said\r\n[00:36.48]Running through my head\r\n[00:37.75]Running through my head\r\n[00:38.44]Running through my head\r\n[00:39.73]All the things she said\r\n[00:40.97]All the things she said\r\n[00:42.08]Running through my head\r\n[00:42.80]Running through my head\r\n[00:43.89]All the things she said\r\n[00:45.24]This is not enough\r\n[00:51.09]This is not enough\r\n[00:53.80]All the things she said\r\n[00:54.85]All the things she said\r\n[01:01.50]All the things she said\r\n[01:02.83]All the things she said\r\n[01:04.03]All the things she said\r\n[01:04.83]All the things she said\r\n[01:05.72]All the things she said\r\n[01:06.40]And I\'m all mixed up feeling cornered and rushed\r\n[01:08.90]They say it\'s my fault but I want her so much\r\n[01:11.73]Want to fly her away where the sun and rain\r\n[01:14.23]Come in over my face wash away all the shame\r\n[01:16.93]When they stop and stare don\'t worry me\r\n[01:19.60]\'Cause I\'m feeling for her what she\'s feeling for me\r\n[01:22.26]I can try to pretend I can try to forget\r\n[01:24.96]But it\'s driving me mad going out of my head\r\n[01:28.29]All the things she said\r\n[01:29.08]All the things she said\r\n[01:30.10]Running through my head\r\n[01:31.03]Running through my head\r\n[01:31.72]Running through my head\r\n[01:33.08]All the things she said\r\n[01:34.20]All the things she said\r\n[01:35.34]Running through my head\r\n[01:36.19]Running through my head\r\n[01:37.34]All the things she said\r\n[01:39.20]This is not enough\r\n[01:44.13]This is not enough\r\n[01:46.81]All the things she said\r\n[01:48.25]All the things she said\r\n[01:49.80]All the things she said\r\n[01:50.63]All the things she said\r\n[01:52.00]All the things she said\r\n[01:53.03]All the things she said\r\n[01:54.34]All the things she said\r\n[01:55.20]All the things she said\r\n[01:55.93]All the things she said\r\n[01:57.40]All the things she said\r\n[01:58.50]All the things she said', '/music/song/1617031746845Seraphine _ Jasmine Clarke _ Absofacto - All The Things She Said.mp3', 50, '欧美,流行,选项8');
INSERT INTO `song` VALUES (80, 7, 'Celebrity', 'Celebrity', '2021-04-25', '2022-03-19', '/img/songPic/1619337296847celebrity.jpg', '[00:00.000] 作词 : IU\r\n[00:00.428] 作曲 : Ryan S. Jhun/Jeppe London Bilsby/Lauritz Emil Christiansen/IU/Chloe Latimer/Celine Svanbäck\r\n[00:00.857]세상의 모서리\r\n[00:03.372]구부정하게 커버린\r\n[00:05.782]골칫거리 outsider\r\n[00:09.780]\r\n[00:10.352]걸음걸이, 옷차림,\r\n[00:13.046]이어폰 너머 play list\r\n[00:15.369]음악까지 다 minor\r\n[00:19.468]\r\n[00:20.085]넌 모르지\r\n[00:22.429]떨군 고개 위\r\n[00:24.571]환한 빛 조명이\r\n[00:27.050]어딜 비추는지\r\n[00:29.271]\r\n[00:29.521]느려도 좋으니\r\n[00:31.734]결국 알게 되길\r\n[00:34.285]The one and only\r\n[00:37.201]You are my celebrity\r\n[00:39.823]\r\n[00:40.029]잊지마 넌 흐린 어둠 사이\r\n[00:44.814]왼손으로 그린 별 하나\r\n[00:49.360]보이니 그 유일함이 얼마나\r\n[00:54.286]아름다운지 말야\r\n[00:56.730]You are my celebrity\r\n[00:58.980]\r\n[01:06.645]celebrity\r\n[01:15.858]You are my celebrity\r\n[01:17.877]\r\n[01:18.059]지쳐버린 표정 마치\r\n[01:20.126]전원을 꺼놓은 듯이\r\n[01:22.560]심장소린 too quiet\r\n[01:26.810]\r\n[01:27.326]네가 가진 반짝거림,\r\n[01:29.665]상상력, identity\r\n[01:32.194]까지 모조리 diet\r\n[01:35.753]\r\n[01:36.968]넌 모르지\r\n[01:39.145]아직 못다 핀\r\n[01:41.301]널 위해 쓰여진\r\n[01:43.846]오래된 사랑시\r\n[01:46.113]\r\n[01:46.301]헤매도 좋으니\r\n[01:48.567]웃음 짓게 되길\r\n[01:51.214]The one and only\r\n[01:54.138]You are my celebrity\r\n[01:56.742]\r\n[01:57.026]잊지마 넌 흐린 어둠 사이\r\n[02:01.581]왼손으로 그린 별 하나\r\n[02:06.479]보이니 그 유일함이 얼마나\r\n[02:11.177]아름다운지 말야\r\n[02:13.608]You are my celebrity\r\n[02:15.859]\r\n[02:15.934]발자국마다 이어진 별자리\r\n[02:20.052]그 서투른 걸음이 새겨놓은 밑그림\r\n[02:25.600]오롯이 너를 만나러 가는 길\r\n[02:29.740]그리로 가면 돼 점선을 따라\r\n[02:34.718]\r\n[02:35.168]잊지마 이 오랜 겨울 사이\r\n[02:39.925]언 틈으로 피울 꽃 하나\r\n[02:44.538]보이니 하루 뒤 봄이 얼마나\r\n[02:49.654]아름다울지 말야\r\n[02:51.932]You are my celebrity\r\n[02:53.965]\r\n[03:01.828]celebrity\r\n[03:11.141]You are my celebrity', '/music/song/1619337269938IU - Celebrity.mp3', 105, '日韩,欧美,流行');
INSERT INTO `song` VALUES (81, 7, '斑马，斑马', 'Covers & Unreleased Songs', '2021-04-25', '2022-03-19', '/img/songPic/1619338395094斑马斑马IU.jpg', '[00:14.53]斑马斑马 你不要睡着啦\r\n[00:22.05]再给我看看你受伤的尾巴\r\n[00:29.44]我不想去触碰你伤口的疤\r\n[00:36.96]我只想掀起你的头发\r\n[00:44.48]斑马斑马 你回到了你的家\r\n[00:51.96]可我浪费着我寒冷的年华\r\n[00:59.21]你的城市没有一扇门为我打开啊\r\n[01:06.68]我终究还要回到路上\r\n[01:44.58]斑马斑马，你来自南方的红色啊\r\n[01:52.01]是否也是个动人的故事啊\r\n[01:59.35]你隔壁的戏子如果不能留下\r\n[02:07.43]谁会和你睡到天亮\r\n[02:15.18]斑马斑马 你还记得我吗\r\n[02:22.84]我是只会歌唱的傻瓜\r\n[02:31.02]斑马斑马 你睡吧睡吧\r\n[02:38.49]我会背上吉他离开北方\r\n[02:46.99]斑马斑马 你还记得我吗\r\n[02:54.05]我是强说着忧愁的孩子啊\r\n[03:02.36]斑马斑马 你睡吧睡吧\r\n[03:09.56]我把你的青草带回故乡\r\n[03:17.78]斑马斑马 你不要睡着啦\r\n[03:25.21]我只是个匆忙的旅人啊\r\n[03:33.29]斑马斑马 你睡吧睡吧\r\n[03:40.58]我要卖掉我的房子\r\n[03:47.78]浪迹天涯', '/music/song/1619338383829斑马斑马IU.mp3', 158, '华语,日韩,民谣');
INSERT INTO `song` VALUES (83, 41, 'aLIEz', '澤野弘之 LIVE[nZk]004 (2016/11/03@TOKYO DOME CITY HALL)', '2021-05-27', '2022-03-19', '/img/songPic/1622110405997ALIEZ.jpg', '[00:00.68]词：HIROYUKI SAWANO\r\n[00:01.19]曲：HIROYUKI SAWANO\r\n[00:01.89]\r\n[00:20.93]決めつけばかり自惚れを着た\r\n[00:24.95]チープなhokoriで音荒げても\r\n[00:29.41]\r\n[00:30.47]棚に隠した哀れな\r\n[00:34.39]\r\n[00:35.11]恥に濡れた鏡の中\r\n[00:39.35]都合の傷だけひけらかして\r\n[00:44.11]手軽な強さで勝取る術を\r\n[00:48.94]どれだけ磨いでも気はやつれる\r\n[00:53.73]ふらついた思想通りだ\r\n[00:57.40]\r\n[00:58.00]愛-same-CRIER愛撫-save-LIAR\r\n[01:02.68]Eid-聖-Rising HELL\r\n[01:04.90]愛してるGame世界のDay\r\n[01:07.45]Don\'t-生-War Lie-兵士-War-World\r\n[01:11.05]\r\n[01:12.34]Eyes-Hate-War\r\n[01:14.77]A-Z Looser-Krankheit-Was IS das?\r\n[01:18.36]\r\n[01:28.73]受け売り盾に見下してても\r\n[01:32.95]そこには地面しかない事さえ\r\n[01:37.22]\r\n[01:38.24]気付かぬままに壊れた\r\n[01:42.12]\r\n[01:42.93]過去に負けた鏡の奥\r\n[01:47.23]どこまで叫べば位置を知れる\r\n[01:52.02]とどめもないまま息が切れる\r\n[01:56.80]堂々さらした罪の群れと\r\n[02:01.68]後ろ向きにあらがう\r\n[02:05.27]\r\n[02:05.86]愛-same-CRIER愛撫-save-LIAR\r\n[02:10.43]Aid-聖-Rising HELL\r\n[02:12.98]I\'ll-ness Reset-EndじゃないBurst\r\n[02:15.49]Don\'t-生-War Lie-兵士-War-World\r\n[02:20.23]Eyes-Hate-War\r\n[02:22.64]A-Z想像High-de-Siehst YOU das?\r\n[02:26.19]\r\n[02:44.46]偽の態度な臆病Loud Voice\r\n[02:48.39]\r\n[02:48.90]気高さを勘違いした心臓音\r\n[02:53.65]狙い通りの幻見ても\r\n[02:57.97]\r\n[02:58.67]満たせない何度も目を開けても\r\n[03:03.71]\r\n[03:04.86]どこまで叫べば位置を知れる\r\n[03:09.57]とどめもないまま息が切れる\r\n[03:14.39]堂々さらした罪の群れと\r\n[03:19.23]後ろ向きにあらがう\r\n[03:23.39]愛-same-CRIER愛撫-save-LIAR\r\n[03:28.17]Eid-聖-Rising HELL\r\n[03:30.58]愛してるGame世界のDay\r\n[03:33.27]Don\'t-生-War Lie-兵士-War-World\r\n[03:37.80]Eyes-Hate-War\r\n[03:40.21]A-Z Looser-Krankheit-Was IS das?\r\n[03:43.83]Leben was ist das?\r\n[03:46.28]Signal Siehst du das?\r\n[03:48.70]Rade die du nicht weisst\r\n[03:51.13]Aus eigenem Willen\r\n[03:52.78]\r\n[03:53.52]Leben was ist das?\r\n[03:55.94]Signal Siehst du das?\r\n[03:58.38]Rade die du nicht weisst\r\n[04:00.65]Sieh mit deinen Augen', '/music/song/1622110452309mizuki - aLIEz.mp3', 18, '日韩');
INSERT INTO `song` VALUES (84, 42, '不为谁而作的歌 (Live)', '我是歌手第四季 歌王之战', '2021-11-05', '2022-03-19', '/img/songPic/1636094999826buweisheierzuodege.jpg', '[00:00.01]不为谁而作的歌 (Live) (原唱：林俊杰) - 徐佳莹 (LALA Xu)/林俊杰 (JJ Lin)\r\n[00:01.44]词：林秋离\r\n[00:01.63]曲：林俊杰\r\n[00:01.81]编曲：郑楠\r\n[00:02.37]\r\n[00:05.42]女：\r\n[00:05.87]\r\n[00:27.94]原谅我这一首不为谁而作的歌\r\n[00:34.03]\r\n[00:34.64]感觉上仿佛窗外的夜色\r\n[00:40.84]男：\r\n[00:41.30]曾经有那一刻回头竟然认不得\r\n[00:47.52]\r\n[00:48.40]需要从记忆再摸索\r\n[00:52.79]合：\r\n[00:53.32]的人\r\n[00:54.92]女：\r\n[00:55.35]和他们关心的\r\n[00:58.34]合：\r\n[00:58.79]\r\n[01:00.13]的地方\r\n[01:01.57]女：\r\n[01:02.04]和那些走过的\r\n[01:06.08]合：\r\n[01:06.64]请等一等\r\n[01:09.64]男：\r\n[01:10.02]\r\n[01:11.22]梦为努力浇了水爱在背后往前推\r\n[01:17.91]当我抬起头\r\n[01:19.96]才发觉我是不是忘了谁\r\n[01:24.22]女：\r\n[01:24.64]累到整夜不能睡夜色哪里都是美\r\n[01:31.25]一定有个人\r\n[01:33.19]他躲过避过闪过瞒过他是谁\r\n[01:38.70]男：\r\n[01:39.11]\r\n[01:42.72]他是谁\r\n[01:45.59]\r\n[01:51.32]原谅我这一首不为谁而作的歌\r\n[01:57.58]合：\r\n[01:58.03]感觉上\r\n[01:59.22]男：\r\n[01:59.53]仿佛窗外的夜色\r\n[02:03.82]合：\r\n[02:04.57]曾经有那么一刻回头竟然认不得\r\n[02:11.41]女：\r\n[02:11.75]需要从记忆再摸索\r\n[02:16.31]合：\r\n[02:16.73]的人\r\n[02:18.08]女：\r\n[02:18.59]和他们关心的\r\n[02:20.92]男：\r\n[02:21.32]关心的\r\n[02:22.77]合：\r\n[02:23.48]的地方和那些走过的\r\n[02:30.65]\r\n[02:31.19]梦为努力浇了水爱在背后往前推\r\n[02:37.87]当我抬起头才发觉我是不是忘了谁\r\n[02:44.58]累到整夜不能睡夜色哪里都是美\r\n[02:51.27]一定有个人他躲过避过闪过瞒过\r\n[02:56.13]他是谁\r\n[02:59.23]他是谁\r\n[03:02.24]\r\n[03:11.34]也许在真实面对自己才不顾一切\r\n[03:17.02]\r\n[03:17.76]去探究当初我害怕面对\r\n[03:25.93]女：\r\n[03:26.39]\r\n[03:27.89]梦为努力浇了水爱在背后往前推\r\n[03:34.67]当我抬起头才发觉\r\n[03:38.33]合：\r\n[03:38.73]我是不是忘了谁\r\n[03:44.20]女：\r\n[03:45.07]\r\n[03:48.05]夜色哪里都是美\r\n[03:50.87]合：\r\n[03:51.28]一定有个人他\r\n[03:53.71]躲过避过闪过瞒过他是谁\r\n[03:57.22]躲过避过闪过瞒过他是谁\r\n[04:00.36]躲过避过闪过瞒过他是谁', '/music/song/1636094987078徐佳莹 _ 林俊杰 - 不为谁而作的歌 (Live).mp3', 210, '华语,民谣,流行');
INSERT INTO `song` VALUES (85, 3, 'test1', 'test1', '2023-02-15', NULL, '/img/songPic/defaultSongImg.jpg', '[00:00:00]暂无歌词', '/music/song/16764755114181614606063429陈奕迅 - 十年.mp3', 0, '流行,华语');

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单图片',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '风格',
  `create_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `star_level` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '歌单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (2, '2021年二月最热新歌TOP50', '/img/songListPic/1615169331484top.jpg', ' 2021年二月全站热度最高的50首新歌，歌单数据综合参考了2021年2月云音乐所有最新上架歌曲在全站的播放及收藏排行。（注：曲目均为2月第一次上架新歌，已排除新发行正式专辑中收录的部分2月前已上线歌曲）', '华语,其他', '2021-03-03', '2022-03-21', NULL);
INSERT INTO `song_list` VALUES (9, '摇滚编年史｜星光闪耀的摇滚史前传', '/img/songListPic/1615169335561yaogun.jpg', '本歌单并非纯摇滚歌单，本歌单收录了美国20世纪20年代诞生的各种音乐对摇滚乐产生影响的音乐风格与歌手\n*歌单将分为几个部分来做，此歌单为【摇滚历史前传】\n*歌单按时间顺序以及下方提及的顺序排列\n*歌单的信息采集于美国罗彻斯特大学的伊斯曼音乐学院教授John Covach的摇滚史公开课\n*封面为Little Richard', '摇滚,欧美', '2021-03-08', '2021-03-08', NULL);
INSERT INTO `song_list` VALUES (10, '[欧美私人订制] 最懂你的欧美推荐 每日更新35首', '/img/songListPic/1615181443025oumei.jpg', '收藏专属于你的欧美日推\n每天和喜欢的欧美音乐不期而遇', '摇滚,欧美', '2021-03-08', '2021-03-08', NULL);
INSERT INTO `song_list` VALUES (12, 'K/DA AND SERAPHINE 神仙歌曲合集', '/img/songListPic/1617032038497popstarts_seraphine.jpg', 'LEAGUE OF LENGENDS: K/DA SERAPHINE 神仙歌曲合集', '日韩,欧美,华语', '2021-03-08', '2021-03-29', NULL);
INSERT INTO `song_list` VALUES (18, '劇终丨从新开始吧 不是重新开始', '/img/songListPic/1617032404322300.jpg', '我举着圣罗兰的花朵，向着浪漫死去', '流行,日韩', '2021-03-17', '2021-05-27', NULL);
INSERT INTO `song_list` VALUES (19, '韩语治愈 | IU窝在耳朵里的阳光', '/img/songListPic/1619338973266iu.jpg', '这世界所有千般好，但唯有你最珍贵', '流行,日韩,民谣', '2021-03-17', '2021-04-25', NULL);
INSERT INTO `song_list` VALUES (20, '片段 | 忙碌的生活也是一种乐趣', '/img/songListPic/1615947854317pianduan.jpg', '你很重要这句话的意思是，即便我们不见面不联系，心里面也总会留一个位置安安稳稳的放着你。', '华语,流行', '2021-03-17', '2021-03-17', NULL);
INSERT INTO `song_list` VALUES (22, '香港Indie乐 简单的小事情', '/img/songListPic/1615948266712yueyu.jpg', '谈起粤语歌，他有过最经典繁荣的年代     那个年代无数人追逐着，现在还有很多人缅怀     此单是更不被人所知的香港的独立乐     歌手有的找不到，抱歉     如果你有的话可以推荐', '流行,粤语', '2021-03-17', '2021-03-17', NULL);
INSERT INTO `song_list` VALUES (23, '韩式伤感炮弹 | 一秒心酸', '/img/songListPic/1615948473793hanshi.jpg', '[一起许下的承诺 随著时间流逝 也消失了] [是我太喜欢你] [守护着我们之间的温暖] [你走了 带走我夜里的星星，带走我白昼的太阳] [结果 只剩下阴霾里密布的乌云] ——防弹《let me know》 欢迎━（*｀∀´*）ノ亻!收听收藏\n', '流行,其他,华语', '2021-03-17', '2021-03-22', NULL);
INSERT INTO `song_list` VALUES (24, '暮色似水，思念成海', '/img/songListPic/1615948684481muse.jpg', '暮色隐约，氤氲在青黛色的天空中。思念在内心深处晕染，才染了眉梢，又上了心头。暮色似水，对你的思念成海。\n播放全部收藏更多\n', '欧美,流行', '2021-03-17', '2021-03-17', NULL);
INSERT INTO `song_list` VALUES (26, '一单打尽！Q音热搜榜歌曲持更集', '/img/songListPic/161694434218411.jfif', '一网打尽热搜歌曲！\n歌曲全部来自于歌曲热搜热点所对应的歌曲，搜罗热曲，等你来听！\n持续更新爆肝中！\n\n封面来自Pinterest 侵删\n有任何建议欢迎评论区指出。', '流行,华语', '2021-03-28', '2021-05-21', NULL);
INSERT INTO `song_list` VALUES (28, '『片段翻唱』陷入温柔暮色里', '/img/songListPic/16476927482936001.jpg', '天空偷了我放在屋顶的红酒， 醉了臆想，红了脸颊，成了晚霞， 偷看着这世间的温柔万物。', '华语,粤语,流行', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (29, 'お誕生日おめでとうございます！', '/img/songListPic/16476928514976002.jpg', 'お誕生日おめでとう! 今日は１年に1度の特別な日だね,これからもたくさん愛を受けますように！いつまでも太陽のようなステキな笑顔でいて下さい，これからの人生が幸せであふれますように。ますます元気でがんばってください！ 祝你生日快乐吖，今天是一年中最特别的一天，愿你永远被爱包围，永远保持阳光般的笑容，早日找到自己的幸福生活，新的一年也要元气满满喔！！', '流行,日韩,其他', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (30, '2011年（第29届）劲歌金曲奖获奖歌曲', '/img/songListPic/16476931374696003.jpg', '香港一年一度的十大劲歌金曲金奖是综合各种因素后颁发的全年最高奖项，其中劲歌金曲金奖是压轴大奖，代表着单项歌曲的最高荣誉。每年入选的歌曲都是当年最热门最流行的音乐，奖项的角逐也是一场激动人心的较量。 2011年（第29届）十大劲歌金曲奖获奖歌曲（排名不分先后）： 十大劲歌金曲奖 　　 1. 《华丽舞台》草蜢 2. 《天梯》C AllStar 3. 《水百合》王菀之 4. 《CHOK》林峯 5. 《一再问究竟》梁汉文 6. 《花千树》容祖儿 7. 《爆了》古巨基 8. 《仍然》关心妍 9. 《恋上外星人》张智霖 10. 《年年》蔡卓妍 最受欢迎华语歌曲奖 金：《3650》Twins 银：《让我爱你一小时》林峯 铜：《最后情人》容祖儿 最受欢迎广告歌曲奖 金：《澎湃》容祖儿 银：《素颜假期》Hotcha 铜：《非凡》林欣彤 最受欢迎合唱歌曲奖 金：《勾手指尾》钟一宪、麦贝夷 银：《傻瓜》洪卓立、钟舒漫 铜：《辣着生命》叶文辉、狄易达 最受欢迎改编歌曲奖 《鸟笼》林欣彤 最佳作曲奖 邓智伟、庄冬昕《CHOK》 最佳填词奖 黄伟文《花千树》 最佳编曲奖 黄伟文《花千树》 最佳歌曲监制奖 草蜢、何秉舜《华丽舞台》', '华语,粤语,流行', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (31, '流行组合初啼，doo-wop唱响经典魅力之音', '/img/songListPic/16476932101876004.jpg', 'Doo-Wop（嘟·喔普）是一种流行于20世纪40年代至60年代的重唱形式。它主要受到19世纪末兴起于美国的“理发店四重唱“的影响发展而来，经常由4~5人组成重唱小组，由一人担任领唱，其他人以密集和声作伴唱。早期的“嘟·喔普“主要流行于黑人群体中，常采用节奏布鲁斯的乐队形式进行伴奏，节奏具有早期节奏布鲁斯中持续向前推进的特征，而且常用俚语演唱。说起来挺专业，听听就知道了，原来这样的音乐，似曾相识。\n\n', '欧美,摇滚,其他', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (32, '有些难言故事，烂在心里更有意义', '/img/songListPic/16476932679286005.jpg', '有些事情，烂在心里更有意义，何必撕开伤口，与无法感同身受之人诉说。无论多少安慰之言，只有你知道伤口有多痛多深。默默让自己承受愈合，缝补那让自己脆弱的伤口，那些故事就做人生云烟。\n', '其他,华语,流行', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (33, '怕空欢喜，怕来者不是你', '/img/songListPic/16476933393076006.jpg', '你的暗示他都明白 你的潜台词他也懂 可就是无动于衷 也不是什么斗智斗勇 他就是不喜欢你 ​​​说是朋友 其实跟陌生人差不多 只是待在对方列表里 没删好友而已 ​​​​后来，一杯酒能解決的事， 也就不想再浪费眼泪了。 喜欢上一个不属于自己的人真难受， 连吃个醋都名不正言不顺。', '华语,其他,民谣', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (34, '2010年的‘韩”流，欧巴使我们感冒', '/img/songListPic/16476934436056007.jpg', '“韩流“来了，我们都感冒了。近年来韩国潮流影响我们，电视剧、电影、综艺，音乐都成为我们所追捧的对象。对2010年韩流印象特别深。一大波韩国男歌手来袭，那些长得好看、跳舞很棒、唱歌很棒的欧巴瞬间喜欢上。听他们2010年那些的音乐就再也不能忘怀，那年的韩流让我们感冒了很长一段时间。\n\n', '其他,日韩,流行', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (35, '香奈儿发布会曲目', '/img/songListPic/16476935170296008.jpg', '2022/23秋冬高级成衣系列发布会曲目。\n', '流行,欧美,其他', '2022-03-19', '2022-03-19', NULL);
INSERT INTO `song_list` VALUES (36, '青年音乐社：90后一键摆脱听歌荒', '/img/songListPic/16476936010966009.jpg', '欢迎来到青年音乐社，在这里共享最新最热的流行歌曲，部分可能小众，不过也超好听呦 兼具流行度与音乐质量 别问  问就是单曲循环一整天 强烈推荐随机播放！！！ 不定时更新\n\n', '流行,华语,民谣', '2022-03-19', '2022-03-19', NULL);

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址，相对路径',
  `singer_id` int(11) NOT NULL COMMENT '绑定歌手id',
  `singer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定歌手名',
  `update_time` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (1, '/img/swiper/BlackPink.jpg', 26, 'BLACKPINK 블랙핑크', '2023-02-15 21:11:49');
INSERT INTO `swiper` VALUES (2, '/img/swiper/Eason.jpg', 4, '陈奕迅', '2023-02-15 20:55:35');
INSERT INTO `swiper` VALUES (4, '/img/swiper/IU.jpg', 7, 'IU (아이유)', '2023-02-15 20:55:49');
INSERT INTO `swiper` VALUES (12, '/img/swiper/1681646408777.jpg', 37, 'K/DA', '2023-04-16 20:00:08');

SET FOREIGN_KEY_CHECKS = 1;
