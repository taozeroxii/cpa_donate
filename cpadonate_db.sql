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

 Date: 29/07/2021 23:17:37
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
  `donor_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสผู้บริจาค',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'จำนวนรับบริจาค',
  `insert_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่เพิ่ม',
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่แก้ไขล่าสุด',
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผุ้บันทึก',
  `update_staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้แก้ไขล่าสุด',
  `donate_head_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสใบรับไว้เช็คว่าครั้งนี้มีการรับสินค้าอะไรมาบ้าง',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_detail_instock
-- ----------------------------
INSERT INTO `donate_detail_instock` VALUES (1, 1, '3', '33', '2021-07-17 14:20:47', '2021-07-17 14:20:46', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'a');
INSERT INTO `donate_detail_instock` VALUES (2, 4, '2', '33', '2021-07-17 14:21:20', '2021-07-17 14:21:19', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'test');
INSERT INTO `donate_detail_instock` VALUES (3, 3, '2', '22', '2021-07-17 14:21:28', '2021-07-17 14:21:28', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'test');
INSERT INTO `donate_detail_instock` VALUES (4, 24, '2', '10000', '2021-07-17 14:21:56', '2021-07-17 14:21:56', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'test');
INSERT INTO `donate_detail_instock` VALUES (5, 6, '5', '50', '2021-07-24 21:50:58', '2021-07-24 21:50:57', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '64072401');
INSERT INTO `donate_detail_instock` VALUES (6, 1, '1', '11', '2021-07-29 16:00:17', '2021-07-29 16:00:17', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'test');
INSERT INTO `donate_detail_instock` VALUES (7, 2, '1', '33', '2021-07-29 16:00:22', '2021-07-29 16:00:21', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, 'test');
INSERT INTO `donate_detail_instock` VALUES (8, 3, '1', '150', '2021-07-29 16:40:10', '2021-07-29 16:40:10', 'นายadmin dev สิทธิการเข้าถึง : admin', 'นายadmin dev สิทธิการเข้าถึง : admin', 'test');

-- ----------------------------
-- Table structure for donate_detail_wdraw
-- ----------------------------
DROP TABLE IF EXISTS `donate_detail_wdraw`;
CREATE TABLE `donate_detail_wdraw`  (
  `draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_date` datetime(0) NOT NULL COMMENT 'วันที่เบิกจ่ายของครั้งแรกที่ทำการกดบันทึก',
  `groupstock_id` int(55) NOT NULL COMMENT 'หมวดหมู่ประเภทรับบริจาค',
  `item_id` int(50) NOT NULL COMMENT 'รหัสรายการสินค้า',
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'จำนวนที่เบิก',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'สถานะการจ่ายสินค้า',
  `draw_department_id` int(50) NOT NULL COMMENT 'รหัสแผนกที่ขอเบิก',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'หมายเหตุ',
  `draw_head_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'รหัสใบจ่ายสินค้า',
  `staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผุ้บันทึก',
  `update_staff` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ผู้แก้ไขล่าสุด',
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'วันที่แก้ไขล่าสุด',
  PRIMARY KEY (`draw_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_detail_wdraw
-- ----------------------------
INSERT INTO `donate_detail_wdraw` VALUES (1, '2021-07-24 14:51:14', 1, 1, '3', 'Y', 100, NULL, 'ทดสอบ', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 14:51:14');
INSERT INTO `donate_detail_wdraw` VALUES (2, '2021-07-24 14:51:20', 1, 3, '10', 'Y', 100, NULL, 'ทดสอบ', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 14:51:20');
INSERT INTO `donate_detail_wdraw` VALUES (3, '2021-07-24 15:28:51', 1, 1, '10', 'Y', 50, NULL, 'aaaa', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 15:28:51');
INSERT INTO `donate_detail_wdraw` VALUES (4, '2021-07-24 19:40:17', 5, 24, '5000', 'Y', 18, NULL, 'test111', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 19:40:17');
INSERT INTO `donate_detail_wdraw` VALUES (5, '2021-07-24 22:02:29', 2, 6, '10', 'Y', 66, NULL, '64072401', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 22:02:28');
INSERT INTO `donate_detail_wdraw` VALUES (6, '2021-07-24 22:02:57', 5, 24, '500', 'Y', 66, NULL, '64072401', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-24 22:02:57');
INSERT INTO `donate_detail_wdraw` VALUES (7, '2021-07-24 22:03:06', 5, 24, '10', 'Y', 66, NULL, '64072401', 'นายadmin dev สิทธิการเข้าถึง : admin', 'นายadmin dev สิทธิการเข้าถึง : admin', '2021-07-29 23:05:36');
INSERT INTO `donate_detail_wdraw` VALUES (8, '2021-07-29 23:03:23', 1, 1, '3', 'Y', 1, NULL, '640722edit', 'นายadmin dev สิทธิการเข้าถึง : admin', 'นายadmin dev สิทธิการเข้าถึง : admin', '2021-07-29 23:03:23');
INSERT INTO `donate_detail_wdraw` VALUES (9, '2021-07-29 23:06:53', 1, 1, '1', 'Y', 19, 'test', 'testadd', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-29 23:06:53');
INSERT INTO `donate_detail_wdraw` VALUES (10, '2021-07-29 23:07:07', 1, 1, '5', 'Y', 19, NULL, 'testadd', 'นายadmin dev สิทธิการเข้าถึง : admin', 'นายadmin dev สิทธิการเข้าถึง : admin', '2021-07-29 23:08:22');
INSERT INTO `donate_detail_wdraw` VALUES (11, '2021-07-29 23:09:02', 1, 1, '1', 'Y', 3, 'note', 'test', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL, '2021-07-29 23:09:02');

-- ----------------------------
-- Table structure for donate_donor
-- ----------------------------
DROP TABLE IF EXISTS `donate_donor`;
CREATE TABLE `donate_donor`  (
  `donor_id` int(255) NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `insertby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `insertdate_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_staff` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_datetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`donor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_donor
-- ----------------------------
INSERT INTO `donate_donor` VALUES (1, 'ผู้บริจาค ก.', 'Dev.', '2021-07-24 20:49:02', 'Y', NULL, '2021-07-24 21:23:19');
INSERT INTO `donate_donor` VALUES (2, 'ผู้บริจาค ข.', 'Dev.', '2021-07-24 20:49:03', 'Y', NULL, '2021-07-24 21:23:19');
INSERT INTO `donate_donor` VALUES (3, 'ผู้บริจาค ค.', 'Dev.', '2021-07-24 20:49:04', 'Y', NULL, '2021-07-24 21:23:19');
INSERT INTO `donate_donor` VALUES (4, 'test', 'Dev.', '2021-07-24 21:18:26', 'Y', NULL, '2021-07-24 21:23:19');
INSERT INTO `donate_donor` VALUES (5, 'ทดสอบแก้ไข', 'Dev.', '2021-07-24 21:43:03', 'Y', 'นายadmin dev สิทธิการเข้าถึง : admin', '2021-07-24 21:43:03');

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
INSERT INTO `donate_item_list` VALUES (27, '8', 5, 'ทดสอบแก้ไข2', '2021-05-17 16:08:08', '2021-07-20 10:11:34', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);

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
INSERT INTO `donate_item_type` VALUES (20, 'test', 'ทดสอบหมายเหตุ', '2021-05-16 15:34:30', '2021-07-17 14:29:12', 'นาย admin dev', 'นายadmin dev สิทธิการเข้าถึง : admin', NULL);

-- ----------------------------
-- Table structure for donate_spclty
-- ----------------------------
DROP TABLE IF EXISTS `donate_spclty`;
CREATE TABLE `donate_spclty`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spclty` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'แผนก',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_user
-- ----------------------------
INSERT INTO `donate_user` VALUES (1, 'admintaonaja', 'a2603c2e896dbd814fee91cb6d4ef076cc9c6fb9', 'นาย', 'admin', 'dev', '4gPuQ9e', '2021-05-10 21:08:49', '2021-07-29 23:16:29', '1', NULL, 'Y');
INSERT INTO `donate_user` VALUES (2, 'testupdate', 'f812326b25177330633accd601445d35345ba5e5', 'นาง', 'testupdatee', 'testupdate', '35Uvrbc', '2021-05-10 21:23:38', '2021-07-17 09:19:40', '2', NULL, 'N');
INSERT INTO `donate_user` VALUES (3, 'a', '8d6150cf892125ba6587538e838b3cb826ec0702', 'นาย', 'aa', 'a', 'NLdePCp', '2021-05-10 23:50:14', '2021-07-17 09:24:48', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (4, 'admintao1', '9d37bdfe742007e79a690f47ca6a524a8086cc25', 'นาย', 'asdasdsadas', 'dasdasdasdas', 'S5iwEle', '2021-05-11 11:30:29', '2021-07-17 09:19:46', '2', NULL, 'N');
INSERT INTO `donate_user` VALUES (5, 'a', '4ae46edcf5e84a599079a564c18f8fc8edc0572a', 'นาย', 'a', 'a', '6U4l5Nu', '2021-05-11 12:22:06', '2021-05-22 19:00:15', '2', NULL, 'N');
INSERT INTO `donate_user` VALUES (6, 'user', '7f462fdc5f7b25baeb78a6208f897364455de07f', 'นาง', 'usertest', 'usertest', 'AKqde2G', '2021-05-11 13:55:48', '2021-05-16 18:50:54', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (7, 'asd', 'b6133a3b49d42ac956f885e762259453f653e2cf', 'นาย', 'เฟิส', 'เฟิส', '8ZORHcr', '2021-05-11 14:48:06', '2021-05-13 09:16:11', '1', NULL, 'Y');
INSERT INTO `donate_user` VALUES (8, 'test', '2139b2ff0546a545285e0748e2d0c7168240b0ae', 'นาย', 'testtest', 'testalert', 'epDFn1P', '2021-05-16 19:17:26', '2021-07-17 09:22:53', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (9, 'dsadsads', '04e879bb70bd08051d5d6f4c7c26f0b4b2a0e547', 'นางสาว', 'asdasdas', 'dasdas', '2k8l4me', '2021-05-16 19:18:34', '2021-05-16 19:19:16', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (10, 'test123', 'dca07a2a8aeff24e12999302e2375dbe3d1669e1', 'นาย', 'aa', 'aa', 'UHZJya4', '2021-07-17 10:37:13', '2021-07-17 10:37:13', '6', NULL, 'Y');
INSERT INTO `donate_user` VALUES (11, '111111111', '705667c517c65086341a258dbb8d6e73c8fc1a8c', 'นาง', 'test11111', '1213414', 'k5MxdNc', '2021-07-17 10:38:32', '2021-07-17 10:38:32', '4', NULL, 'Y');
INSERT INTO `donate_user` VALUES (12, 'ddddddddddddddddddddd', '6788216517f694c2a24bbc9d2a9e8455e1051d73', 'นาง', 'adddddddddddddddddd', 'dddddddddddddddddd', 'mkWSXbv', '2021-07-17 10:39:55', '2021-07-17 11:06:34', '4', NULL, 'N');
INSERT INTO `donate_user` VALUES (13, 'qweqwewqeqw', '228afc51625ba0be3e17fa476be785102b51dae1', 'นาย', 'a', 'dd', 'nO5KBb0', '2021-07-17 10:41:26', '2021-07-17 10:41:26', '2', NULL, 'Y');
INSERT INTO `donate_user` VALUES (14, 'zxczxczxczxczczxccz', '6d3d46b62ab504c7212eea98549e98115bb8fb2d', 'นาง', 'asdasqwew', 'asdasd', 'PwNOWBo', '2021-07-17 10:41:50', '2021-07-17 10:41:50', '4', NULL, 'Y');
INSERT INTO `donate_user` VALUES (15, 'asdasd', '4dbb73446b1857c39c2c9f89287abcd6ba83d5f5', 'นาง', 'asd', 'asd', 'gFiztkR', '2021-07-17 10:43:13', '2021-07-17 11:06:31', '5', NULL, 'N');
INSERT INTO `donate_user` VALUES (16, '11111111111111', '413e43a8e7a3f2d64874b2d3263bfa7c87539318', 'นาง', 'test12131', 'test', 'fh2idco', '2021-07-17 10:45:32', '2021-07-17 11:06:30', '5', NULL, 'N');

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
INSERT INTO `donate_user_role` VALUES (2, 'user เข้าได้ทุกหน่วยงาน');
INSERT INTO `donate_user_role` VALUES (3, 'เครื่องมือ / อุปกรณ์การแพทย์');
INSERT INTO `donate_user_role` VALUES (4, 'เวชภัณฑ์มิใช่ยา / น้ำยาฆ่าเชื้อ');
INSERT INTO `donate_user_role` VALUES (5, 'ครุภัณฑ์ทั่วไป / งานบ้านงานครัว');
INSERT INTO `donate_user_role` VALUES (6, 'อุปโภค / บริโภค');
INSERT INTO `donate_user_role` VALUES (7, 'เงินบริจาค');

-- ----------------------------
-- Table structure for donate_user_role_list
-- ----------------------------
DROP TABLE IF EXISTS `donate_user_role_list`;
CREATE TABLE `donate_user_role_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ออโต้',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'รหัสผู้ใช้งาน',
  `role_id` int(11) NULL DEFAULT NULL COMMENT 'สิทธิการเข้าถึงแต่ละหน้า',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_user_role_list
-- ----------------------------

-- ----------------------------
-- Table structure for hr_cpa_mission
-- ----------------------------
DROP TABLE IF EXISTS `hr_cpa_mission`;
CREATE TABLE `hr_cpa_mission`  (
  `mission_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ภารกิจ',
  `mission_id` int(11) NOT NULL COMMENT 'รหัสกลุ่มภารกิจ',
  PRIMARY KEY (`mission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hr_cpa_mission
-- ----------------------------
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านอำนวยการ', 1);
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านบริการปฐมภูมิ', 2);
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านพัฒนาระบบบริการและสนับสนุนบริการสุขภาพ', 3);
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านบริการทุติยภูมิและตติยภูมิ', 4);
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านการพยาบาล', 5);
INSERT INTO `hr_cpa_mission` VALUES ('ภารกิจด้านผลิตบุคลากรทางการแพทย์', 6);

-- ----------------------------
-- Table structure for hr_cpa_workgroup
-- ----------------------------
DROP TABLE IF EXISTS `hr_cpa_workgroup`;
CREATE TABLE `hr_cpa_workgroup`  (
  `id` int(11) NOT NULL,
  `workgroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mission_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isuse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_cpa_workgroup
-- ----------------------------
INSERT INTO `hr_cpa_workgroup` VALUES (1, 'ภารกิจด้านอำนวยการ', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (2, 'กลุ่มงานบริหารทั่วไป', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (3, 'งานสารบรรณ', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (4, 'งานเลขานุการ', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (5, 'งานประชาสัมพันธ์', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (6, 'งานสนาม', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (7, 'งานยานพาหนะ', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (8, 'งานแม่บ้าน', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (9, 'กลุ่มงานทรัพยากรบุคคล', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (10, 'กลุ่มงานการเงิน', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (11, 'กลุ่มงานบัญชี', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (12, 'สหกรณ์ รพ.', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (13, 'กลุ่มงานพัสดุ', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (14, 'กลุ่มงานโครงสร้างพื้นฐานและวิศวกรรมทางการแพทย์', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (15, 'งานโรงงาน', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (16, 'งานบำบัดน้ำเสีย', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (17, 'งานประปา', '1', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (18, 'กลุ่มงานการแพทย์แผนไทยและการแพทย์ทางเลือก', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (19, 'กลุ่มงานสุขศึกษา', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (20, 'กลุ่มงานเวชกรรมสังคม', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (21, 'เวชปฏิบัติครอบครัวและชุมชนศูนย์สุขภาพชุมชนเมือง', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (22, 'เจ้าหน้าที่ประจำสถานีอนามัย', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (23, 'กลุ่มงานการพยาบาลชุมชน', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (24, 'กลุ่มงานอาชีวเวชกรรม', '2', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (25, 'กลุ่มงานยุทธศาสตร์และแผนงานโครงการ', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (26, 'กลุ่มงานสารสนเทศทางการแพทย์', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (27, 'ศูนย์ไอ.ที', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (28, 'กลุ่มงานประกันสุขภาพ', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (29, 'กลุ่มงานพัฒนาทรัพยากรบุคคล', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (30, 'เวชนิทัศน์และโสตทัศนศึกษา', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (31, 'ศูนย์พัฒนาคุณภาพ', '3', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (32, 'กลุ่มงานนิติเวช', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (33, 'กลุ่มงานโสต ศอ นาสิก', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (34, 'กลุ่มงานโภชนศาสตร์', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (35, 'กลุ่มงานพยาธิวิทยากายวิภาค', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (36, 'กลุ่มงานจิตเวช', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (37, 'กลุ่มงานทันตกรรม', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (38, 'กลุ่มงานรังสีวิทยา', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (39, 'กลุ่มงานพยาธิวิทยาคลีนิค  ', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (40, 'กลุ่มงานเวชกรรมฟื้นฟู', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (41, 'กลุ่มงานสังคมสงเคราะห์', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (42, 'กลุ่มงานเภสัชกรรม', '4', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (43, 'กลุ่มการพยาบาล', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (44, 'งานติดเชื้อ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (45, 'ศูนย์เครื่องมือแพทย์', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (46, 'วันเดย์', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (47, 'จ่ายกลาง', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (48, 'ซักฟอก-ตัดเย็บ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (49, 'ศูนย์เปล', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (50, 'ผู้ป่วยนอก  ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (51, 'อุบัติเหตุและฉุกเฉิน', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (52, 'งาน EMS', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (53, 'ไอ.ซี.ยู.ศัลยกรรม', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (54, 'พิเศษรวมศัลยกรรม ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (55, 'ศัลยกรรมชาย', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (56, 'ศัลยกรรมหญิง', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (57, 'ศัลยกรรมกระดูก', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (58, 'ห้องเฝือก', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (59, 'ผ่าตัด', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (60, 'ผ่าตัดเล็ก', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (61, 'วิสัญญี', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (62, 'ผู้ป่วยโรคหลอดเลือดสมอง', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (63, 'อายุรกรรมชาย 1', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (64, 'อายุรกรรมชาย 2', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (65, 'ผู้ป่วยแยกโรค', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (66, 'อายุรกรรมหญิง', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (67, 'วิกฤตทางเดินหายใจ ricu', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (68, 'วิกฤตหัวใจและหลอดเลือด  ccu', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (69, 'เครื่องมือพิเศษ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (70, 'ห้องปฏิบัติการสวนหัวใจ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (71, 'ไตเทียม', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (72, 'ธเนศวร', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (73, 'สูติกรรมสามัญ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (74, 'โอ.พี.ดี.สูติ (เงินเอาไปนับกับ โอ.พี.ดี)', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (75, 'สูติกรรมพิเศษ 1', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (76, 'สูติกรรมพิเศษ 2', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (77, 'สูติกรรมแผนไทย', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (78, 'ห้องคลอด', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (79, 'เด็กสามัญ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (80, 'เด็กพิเศษ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (81, 'ไอ.ซี.ยู.เด็ก  NICU', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (82, 'PICU&SNB ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (83, 'ไอ.ซี.ยู.อายุรกรรม micu', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (84, 'ตา หู คอ จมูก ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (85, 'ตรวจรักษาพิเศษจักษุ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (86, 'พิเศษสุวัทนา  ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (87, 'พิเศษรวมอายุรกรรม ', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (88, 'เคมีบำบัด', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (89, 'ศูนย์ Logistic', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (90, 'นักเรียนทุนพยาบาลวิชาชีพ ปี 2564  (ยังไม่ได้ประจำตึก)', '5', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (91, 'ศูนย์แพทยศาสตรชั้นคลินิก', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (92, 'องค์กรแพทย์', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (93, 'แพทย์ลูกจ้างชั่วคราว', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (94, 'แพทย์ฝึก ปี 3', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (95, 'แพทย์ฝึก ปี 2', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (96, 'แพทย์ฝึกปี 1 ', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (97, 'แพทย์ที่ยังสอบไม่ผ่าน', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (98, 'ลาศึกษาต่อ', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (99, 'มาช่วยราชการ  ', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (100, 'ไปช่วยราชการ', '6', 'Y');
INSERT INTO `hr_cpa_workgroup` VALUES (101, 'ปฏิบัติราชการที่ สสจ.ปจ', '6', 'Y');

SET FOREIGN_KEY_CHECKS = 1;
