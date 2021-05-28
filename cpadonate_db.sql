/*
 Navicat Premium Data Transfer

 Source Server         : 172.18.2.2 Covid_address_web
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 172.18.2.2:3306
 Source Schema         : cpadonate_db

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 28/05/2021 08:40:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for donate_data
-- ----------------------------
DROP TABLE IF EXISTS `donate_data`;
CREATE TABLE `donate_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'id รายการ',
  `donor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้บริจาค, ผู้อภินันทนาการ, ผู้ให้',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'จำนวนของ',
  `qty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'หน่วย',
  `addess` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ที่อยู่',
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'หมายเหตุ',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'เบอร์โทรติดต่อ',
  `dateupdate` datetime(0) NULL DEFAULT NULL COMMENT 'วันที่บันทึกข้อมูล',
  `staff_update` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้บันทึกรายการ',
  `ipupdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'IP ผู้บันทึกรายการ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_data
-- ----------------------------

-- ----------------------------
-- Table structure for donate_detail_instock
-- ----------------------------
DROP TABLE IF EXISTS `donate_detail_instock`;
CREATE TABLE `donate_detail_instock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NULL DEFAULT NULL COMMENT 'รหัสสินค้า',
  `donor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อผู้บริจาค freetext',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'จำนวนรับบริจาค',
  `insert_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่เพิ่ม',
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่แก้ไขล่าสุด',
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผุ้บันทึก',
  `update_staff` datetime(0) NULL DEFAULT NULL COMMENT 'ผู้แก้ไขล่าสุด',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_detail_instock
-- ----------------------------
INSERT INTO `donate_detail_instock` VALUES (1, 2, 'โรงพยาบาล', '2', '2021-05-11 00:00:00', '2021-05-11 11:42:06', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (2, 2, 'บ้าน', '2', '2021-05-11 00:00:00', '2021-05-11 11:53:28', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (3, 5, 'ทดสอบ', '20', '2021-05-12 09:48:03', '2021-05-12 09:48:03', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (4, 2, '555', '20000', '2021-05-11 00:00:00', '2021-05-11 22:36:42', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (5, 2, '555', '20000', '2021-05-11 00:00:00', '2021-05-11 22:46:06', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (6, 1, 'ผู้บริจาค', '1', '2021-05-22 19:38:41', '2021-05-22 19:38:45', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (7, 2, 'aaa', '111', '2021-05-22 19:38:45', '2021-05-22 19:38:49', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (8, 1, 'aaaaaaa', '111', NULL, '2021-05-14 15:11:51', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (9, 1, 'ผู้บริจาค2', '1', NULL, '2021-05-14 15:34:21', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (10, 1, 'ผู้บริจาค2', '1', '2021-05-14 16:11:10', '2021-05-14 16:11:10', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (11, 6, 'testsetskdfoskadkl', '999999999', '2021-05-14 16:11:35', '2021-05-14 16:11:35', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (12, 2, 'asdasdasdsadasdqwe', '11111', '2021-05-14 16:13:44', '2021-05-14 16:13:44', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (13, 1, 'taotest', '1000', '2021-05-16 09:41:15', '2021-05-16 09:41:15', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (14, 5, 'taotest', '500', '2021-05-16 09:41:44', '2021-05-16 09:41:44', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (15, 1, 'test', '1', '2021-05-16 09:42:51', '2021-05-16 09:42:50', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (16, 3, 'td123', '123456', '2021-05-16 09:44:06', '2021-05-16 09:44:05', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (17, 2, 'aa', '11', '2021-05-16 09:44:31', '2021-05-16 09:44:30', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (18, 1, '1', '1', '2021-05-16 09:44:58', '2021-05-16 09:44:58', NULL, NULL);
INSERT INTO `donate_detail_instock` VALUES (19, 1, 'aaaaa', '111', '2021-05-16 09:49:50', '2021-05-16 09:49:50', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (20, 1, 'aaaaa', '111', '2021-05-16 09:49:54', '2021-05-16 09:49:53', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (21, 1, 'aa', '1', '2021-05-16 09:52:50', '2021-05-16 09:52:50', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (22, 1, '1111', '1111', '2021-05-16 09:53:30', '2021-05-16 09:53:30', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (23, 3, 'taotest', '51', '2021-05-16 09:53:44', '2021-05-16 09:53:43', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (24, 2, 'บริจาค ก.', '150', '2021-05-16 09:54:18', '2021-05-16 09:54:17', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (25, 3, 'บริจาค ก.', '100', '2021-05-16 09:54:24', '2021-05-16 09:54:24', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (26, 2, 'ไม่ระบุ', '9000000', '2021-05-16 14:35:50', '2021-05-16 14:35:51', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (27, 2, 'ไม่ระบุ', '9000000', '2021-05-16 14:36:28', '2021-05-16 14:36:29', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (28, 25, 'a', '111', '2021-05-16 14:39:30', '2021-05-16 14:39:31', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (29, 24, 'นายเอ', '90456465489', '2021-05-16 14:39:59', '2021-05-16 14:40:00', 'นาย admin dev', NULL);
INSERT INTO `donate_detail_instock` VALUES (30, 24, 'สวีดัส', '1', '2021-05-22 18:58:52', '2021-05-22 18:58:53', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);

-- ----------------------------
-- Table structure for donate_detail_wdraw
-- ----------------------------
DROP TABLE IF EXISTS `donate_detail_wdraw`;
CREATE TABLE `donate_detail_wdraw`  (
  `draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่เบิกของ',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'จำนวนที่เบิก',
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่แก้ไขล่าสุด',
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผุ้บันทึก',
  `update_staff` datetime(0) NULL DEFAULT NULL COMMENT 'ผู้แก้ไขล่าสุด',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะการจ่ายสินค้า',
  `draw_department_id` int(50) NULL DEFAULT NULL COMMENT 'รหัสแผนกที่ขอเบิก',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ',
  `income_id` int(60) NOT NULL COMMENT 'รหัสใบรับบริจาค',
  PRIMARY KEY (`draw_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_detail_wdraw
-- ----------------------------

-- ----------------------------
-- Table structure for donate_group_type
-- ----------------------------
DROP TABLE IF EXISTS `donate_group_type`;
CREATE TABLE `donate_group_type`  (
  `group_item_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ประเภทสินค้า',
  `insert_datetime` datetime(0) NULL DEFAULT NULL,
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`group_item_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_group_type
-- ----------------------------
INSERT INTO `donate_group_type` VALUES (1, 'เครื่องมือ / อุปกรณ์การแพทย์', '2021-05-05 11:34:16', '2021-05-05 11:35:34');
INSERT INTO `donate_group_type` VALUES (2, 'เวชภัณฑ์มิใช่ยา / น้ำยาฆ่าเชื้อ', '2021-05-05 11:34:16', '2021-05-05 11:35:35');
INSERT INTO `donate_group_type` VALUES (3, 'ครุภัณฑ์ทั่วไป / งานบ้านงานครัว', '2021-05-05 11:34:16', '2021-05-05 11:35:35');
INSERT INTO `donate_group_type` VALUES (4, 'อุปโภค / บริโภค', '2021-05-05 11:34:16', '2021-05-05 11:35:36');
INSERT INTO `donate_group_type` VALUES (5, 'เงินบริจาค', '2021-05-05 11:34:16', '2021-05-05 11:35:36');

-- ----------------------------
-- Table structure for donate_item_list
-- ----------------------------
DROP TABLE IF EXISTS `donate_item_list`;
CREATE TABLE `donate_item_list`  (
  `item_id` int(100) NOT NULL AUTO_INCREMENT,
  `item_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสหน่วยสินค้า เช่น ชิ้น อัน แพค ',
  `group_item_type_id` int(30) NOT NULL COMMENT 'กลุ่มสินค้าหรือประเภทสิทึค้า',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อสินค้ารับบริจาค',
  `insert_date` datetime(0) NULL DEFAULT NULL COMMENT 'วันที่เพิ่ม',
  `update_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'แก้ไขล่าสุด',
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'เพิ่มโดย',
  `staff_update` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'แก้ไขล่าสุดโดย',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_item_list
-- ----------------------------
INSERT INTO `donate_item_list` VALUES (1, '1', 1, 'เครื่องวัดอุณหภูมิแบบอินฟราเรด', '2021-05-05 11:47:44', '2021-05-05 18:37:17', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (2, '1', 1, 'ตู้ positive pressure negative pressure', '2021-05-05 11:47:44', '2021-05-05 18:37:18', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (3, '1', 1, 'เครื่องมือนวัตกรรม', '2021-05-05 11:47:44', '2021-05-05 18:37:19', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (4, '1', 1, 'เครื่องวัดความดัน', '2021-05-05 11:47:44', '2021-05-05 18:37:20', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (5, '1', 2, 'ชุดPPE', '2021-05-05 11:47:44', '2021-05-05 18:37:21', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (6, '1', 2, 'Leg Cover', '2021-05-05 11:47:44', '2021-05-05 18:37:21', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (7, '1', 2, 'หมวก', '2021-05-05 11:47:44', '2021-05-05 18:37:22', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (8, '1', 2, 'Surgical Mask ,Mask ผ้า,N95 ,Face Shield ', '2021-05-05 11:47:44', '2021-05-05 18:37:22', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (9, '1', 2, 'Alcohol', '2021-05-05 11:47:44', '2021-05-05 18:37:22', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (10, '1', 2, 'ถุงมือต่างๆ', '2021-05-05 11:47:44', '2021-05-05 18:37:23', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (11, '1', 2, 'น้ำยาฆ่าเชื้อ', '2021-05-05 11:47:44', '2021-05-05 18:37:25', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (13, '1', 3, 'พัดลม', '2021-05-16 11:08:34', '2021-05-16 11:08:33', NULL, NULL);
INSERT INTO `donate_item_list` VALUES (14, '15', 3, 'เตียงสนาม', '2021-05-16 11:10:30', '2021-05-16 11:17:36', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (15, '16', 3, 'ผลิตภัณฑ์ทำความสะอาดเพื่อสุขภาพและความงาม', '2021-05-16 11:11:46', '2021-05-16 11:17:42', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (18, '11', 3, 'กระดาษทิชชู่', '2021-05-16 11:32:15', '2021-05-16 11:54:21', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (21, '1', 3, 'ฉากกั้นอะคริลิคใส', '2021-05-16 11:54:46', '2021-05-16 11:54:46', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (22, '7', 4, 'อาหาร', '2021-05-16 11:55:44', '2021-05-16 11:55:44', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (23, '17', 4, 'เครื่องดื่มต่างๆ', '2021-05-16 11:56:51', '2021-05-16 11:56:50', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (24, '8', 5, 'เงินสด', '2021-05-16 11:57:15', '2021-05-16 11:57:14', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (25, '8', 5, 'เช็ค', '2021-05-16 11:57:23', '2021-05-16 11:57:23', 'นาย admin dev', NULL);
INSERT INTO `donate_item_list` VALUES (26, '17', 4, 'วิตามิน', '2021-05-16 19:22:41', '2021-05-16 19:22:41', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);
INSERT INTO `donate_item_list` VALUES (27, '20', 5, 'test', '2021-05-17 16:08:08', '2021-05-17 16:08:08', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);

-- ----------------------------
-- Table structure for donate_item_type
-- ----------------------------
DROP TABLE IF EXISTS `donate_item_type`;
CREATE TABLE `donate_item_type`  (
  `item_type_id` int(30) NOT NULL AUTO_INCREMENT,
  `item_name_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ชื่อหน่วยนับ',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ',
  `insertdatetime` datetime(0) NULL DEFAULT NULL,
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้บันทึก',
  `staff_update` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้แก้ไขล่าสุด',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะใช้งาน',
  PRIMARY KEY (`item_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_item_type
-- ----------------------------
INSERT INTO `donate_item_type` VALUES (1, 'ชิ้น', 'ทดสอบ Note', '2021-05-06 14:40:53', '2021-05-16 15:18:22', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (2, 'อัน', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (3, 'แพ็ค', NULL, '2021-05-06 14:40:52', '2021-05-07 10:13:02', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (4, 'โหล', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (5, 'ห่อ', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (6, 'คัน', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (7, 'กล่อง', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (8, 'บาท', NULL, '2021-05-06 14:40:52', '2021-05-06 14:40:52', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (9, 'คู่', NULL, '2021-05-07 10:13:55', '2021-05-07 10:14:06', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (10, 'ก้อน', NULL, '2021-05-07 10:13:55', '2021-05-07 10:14:06', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (11, 'ม้วน', NULL, '2021-05-07 10:13:55', '2021-05-07 10:14:12', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (12, 'กิโลกรัม', NULL, '2021-05-07 10:13:55', '2021-05-07 10:14:07', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (13, 'ถุง', NULL, '2021-05-07 10:13:55', '2021-05-07 10:14:06', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (14, 'ตัว', NULL, '2021-05-16 11:07:36', '2021-05-16 11:07:40', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (15, 'หลัง', NULL, '2021-05-16 11:10:03', '2021-05-16 11:10:05', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (16, 'ชุด', NULL, '2021-05-16 11:11:30', '2021-05-16 11:11:32', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (17, 'ขวด', NULL, '2021-05-16 11:56:23', '2021-05-16 11:56:24', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (18, 'ลัง', NULL, '2021-05-16 11:56:25', '2021-05-16 11:56:27', NULL, NULL, NULL);
INSERT INTO `donate_item_type` VALUES (19, 'test', 'note', '2021-05-16 15:37:03', '2021-05-16 18:08:17', 'นาย admin dev', 'นายadmin dev', NULL);
INSERT INTO `donate_item_type` VALUES (20, 'test', 'notesssss', '2021-05-16 15:34:30', '2021-05-22 19:12:18', 'นาย admin dev', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);

-- ----------------------------
-- Table structure for donate_spclty
-- ----------------------------
DROP TABLE IF EXISTS `donate_spclty`;
CREATE TABLE `donate_spclty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spclty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'แผนก',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_spclty
-- ----------------------------
INSERT INTO `donate_spclty` VALUES (1, 'ศูนย์คอม');

-- ----------------------------
-- Table structure for donate_user
-- ----------------------------
DROP TABLE IF EXISTS `donate_user`;
CREATE TABLE `donate_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'คำนำหน้า',
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อ',
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'สกุล',
  `salz` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสสุ่มไว้เข้ารหัส',
  `insertdatetime` datetime(0) NOT NULL COMMENT 'วันที่เพิ่ม',
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'แก้ไขข้อมูลล่าสุด',
  `default_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'สิทธิตั้งต้น user admin',
  `staff_update` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isuse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะใช้งาน',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_user
-- ----------------------------
INSERT INTO `donate_user` VALUES (1, 'admintaonaja', '6d59b638fe405cf7ec3ff85bcd94839dd1babd40', 'นาย', 'admin', 'dev', '34w94Or', '2021-05-10 21:08:49', '2021-05-13 09:16:07', '1', NULL, 'Y');
INSERT INTO `donate_user` VALUES (2, 'testupdate', 'f812326b25177330633accd601445d35345ba5e5', 'นาง', 'testupdatee', 'testupdate', '35Uvrbc', '2021-05-10 21:23:38', '2021-05-16 12:10:07', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (3, 'qwe', '3b24a8f0d63d456d9a97ef88cc6a72085fe15bab', 'นาย', 'ทดสอบupdateasd', 'ระบบ1fontendasd', 'VcwMbfx', '2021-05-10 23:50:14', '2021-05-13 10:28:13', '1', NULL, 'Y');
INSERT INTO `donate_user` VALUES (4, 'admintao1', '9d37bdfe742007e79a690f47ca6a524a8086cc25', 'นาย', 'asdasdsadas', 'dasdasdasdas', 'S5iwEle', '2021-05-11 11:30:29', '2021-05-13 10:28:14', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (5, 'a', '4ae46edcf5e84a599079a564c18f8fc8edc0572a', 'นาย', 'a', 'a', '6U4l5Nu', '2021-05-11 12:22:06', '2021-05-22 19:00:15', '2', NULL, 'N');
INSERT INTO `donate_user` VALUES (6, 'user', '7f462fdc5f7b25baeb78a6208f897364455de07f', 'นาง', 'usertest', 'usertest', 'AKqde2G', '2021-05-11 13:55:48', '2021-05-16 18:50:54', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (7, 'asd', 'b6133a3b49d42ac956f885e762259453f653e2cf', 'นาย', 'เฟิส', 'เฟิส', '8ZORHcr', '2021-05-11 14:48:06', '2021-05-13 09:16:11', '1', NULL, 'Y');
INSERT INTO `donate_user` VALUES (8, 'testalert', '6f8ba0be7dead91f98df32b4eeade88edf8795fe', 'นาย', 'testalert', 'testalert', 'ksBRV3o', '2021-05-16 19:17:26', '2021-05-16 19:17:27', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (9, 'dsadsads', '04e879bb70bd08051d5d6f4c7c26f0b4b2a0e547', 'นางสาว', 'asdasdas', 'dasdas', '2k8l4me', '2021-05-16 19:18:34', '2021-05-16 19:19:16', '2', NULL, 'Y');

-- ----------------------------
-- Table structure for donate_user_role
-- ----------------------------
DROP TABLE IF EXISTS `donate_user_role`;
CREATE TABLE `donate_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ประเภทกลุ่มผู้ใช้งาน',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_user_role
-- ----------------------------
INSERT INTO `donate_user_role` VALUES (1, 'admin');
INSERT INTO `donate_user_role` VALUES (2, 'user');
INSERT INTO `donate_user_role` VALUES (3, 'ดูแลอุปกรณ์');
INSERT INTO `donate_user_role` VALUES (4, 'ดูแลเวชภัณฑ์');
INSERT INTO `donate_user_role` VALUES (5, 'ครุภัณฑ์');
INSERT INTO `donate_user_role` VALUES (6, 'อุปโภค');
INSERT INTO `donate_user_role` VALUES (7, 'บริโภค');

-- ----------------------------
-- Table structure for donate_user_role_list
-- ----------------------------
DROP TABLE IF EXISTS `donate_user_role_list`;
CREATE TABLE `donate_user_role_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ออโต้',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสผู้ใช้งาน',
  `role_id` int(11) NULL DEFAULT NULL COMMENT 'สิทธิการเข้าถึงแต่ละหน้า',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_user_role_list
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
