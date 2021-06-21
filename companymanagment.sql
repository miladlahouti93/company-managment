/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : companymanagment

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 21/06/2021 19:35:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach`  (
  `c_AttachId` int NOT NULL AUTO_INCREMENT,
  `c_Path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`c_AttachId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attach
-- ----------------------------

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `c_CategoryId` int NOT NULL AUTO_INCREMENT,
  `c_CategoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_Version` int NULL DEFAULT NULL,
  `c_UpdateDateAndTime` timestamp NULL DEFAULT NULL,
  `c_Active` tinyint(1) NULL DEFAULT 1,
  `c_DeleteDateAndTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_CategoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, 'role', 1, NULL, 1, NULL);
INSERT INTO `t_category` VALUES (2, 'vacationStatus', 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_categoryelement
-- ----------------------------
DROP TABLE IF EXISTS `t_categoryelement`;
CREATE TABLE `t_categoryelement`  (
  `c_CategoryElementId` int NOT NULL AUTO_INCREMENT,
  `c_CategoryElementName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_Category` int NOT NULL,
  `c_Version` int NULL DEFAULT NULL,
  `c_UpdateDateAndTime` timestamp NULL DEFAULT NULL,
  `c_Active` tinyint(1) NULL DEFAULT 1,
  `c_DeleteDateAndTime` timestamp NULL DEFAULT NULL,
  `c_CategoryElementPersianName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_CategoryElementCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`c_CategoryElementId`) USING BTREE,
  INDEX `categoryfk`(`c_Category`) USING BTREE,
  CONSTRAINT `categoryfk` FOREIGN KEY (`c_Category`) REFERENCES `t_category` (`c_CategoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_categoryelement
-- ----------------------------
INSERT INTO `t_categoryelement` VALUES (1, 'programmer', 1, 1, NULL, 1, NULL, 'برنامه نویس', 1);
INSERT INTO `t_categoryelement` VALUES (2, 'tester', 1, 1, NULL, 1, NULL, 'کارشناس تست', 1);

-- ----------------------------
-- Table structure for t_email
-- ----------------------------
DROP TABLE IF EXISTS `t_email`;
CREATE TABLE `t_email`  (
  `c_EmailId` int NOT NULL AUTO_INCREMENT,
  `c_EmailTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_EmailText` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `c_SendDateAndTime` timestamp NOT NULL DEFAULT curtime,
  `c_Attach` int NOT NULL,
  `c_Version` int NULL DEFAULT NULL,
  `c_UpdateDateAndTime` timestamp NULL DEFAULT NULL,
  `c_Active` tinyint(1) NULL DEFAULT 1,
  `c_DeleteDateAndTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_EmailId`) USING BTREE,
  INDEX `emailfk`(`c_Attach`) USING BTREE,
  CONSTRAINT `emailfk` FOREIGN KEY (`c_Attach`) REFERENCES `t_attach` (`c_AttachId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_email
-- ----------------------------

-- ----------------------------
-- Table structure for t_emailemployee
-- ----------------------------
DROP TABLE IF EXISTS `t_emailemployee`;
CREATE TABLE `t_emailemployee`  (
  `c_Email` int NULL DEFAULT NULL,
  `c_Employee` int NULL DEFAULT NULL,
  INDEX `emailemployee1fk`(`c_Email`) USING BTREE,
  INDEX `employeeemail1fk`(`c_Employee`) USING BTREE,
  CONSTRAINT `emailemployee1fk` FOREIGN KEY (`c_Email`) REFERENCES `t_email` (`c_EmailId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employeeemail1fk` FOREIGN KEY (`c_Employee`) REFERENCES `t_employee` (`c_EmployeeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_emailemployee
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `c_EmployeeId` int NOT NULL AUTO_INCREMENT,
  `c_FirstName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_LastName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_EmailAddress` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_Password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_createDateAndTime` timestamp NOT NULL DEFAULT curtime,
  `c_Employee` int NULL DEFAULT NULL,
  `c_Vacation` int NULL DEFAULT NULL,
  `c_Email` int NULL DEFAULT NULL,
  `c_CategoryElement` int NULL DEFAULT NULL,
  `c_Version` int NULL DEFAULT NULL,
  `c_UpdateDateAndTime` timestamp NULL DEFAULT NULL,
  `c_Active` tinyint(1) NULL DEFAULT 1,
  `c_DeleteDateAndTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_EmployeeId`) USING BTREE,
  INDEX `manegerfk`(`c_Employee`) USING BTREE,
  INDEX `vacationfk`(`c_Vacation`) USING BTREE,
  INDEX `emailemployeefk`(`c_Email`) USING BTREE,
  INDEX `categoryemployeefk`(`c_CategoryElement`) USING BTREE,
  CONSTRAINT `categoryemployeefk` FOREIGN KEY (`c_CategoryElement`) REFERENCES `t_categoryelement` (`c_CategoryElementId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emailemployeefk` FOREIGN KEY (`c_Email`) REFERENCES `t_email` (`c_EmailId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manegerfk` FOREIGN KEY (`c_Employee`) REFERENCES `t_employee` (`c_EmployeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vacationfk` FOREIGN KEY (`c_Vacation`) REFERENCES `t_vacation` (`c_VacationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (3, 'الهه', 'صدوقی', 'eli.sadughi@datin.ir', '1234', '2021-06-18 20:43:29', NULL, NULL, NULL, NULL, 2, NULL, 0, '2021-06-21 10:20:11');
INSERT INTO `t_employee` VALUES (4, 'رضا', 'صادقی', 'rezasadeghi@dotin.ir', '8965', '2021-06-19 00:19:55', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL);
INSERT INTO `t_employee` VALUES (5, 'سعید', 'سعیدی', 'saeedsaeedi@dotin.ir', '6258', '2021-06-20 09:25:05', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL);
INSERT INTO `t_employee` VALUES (7, 'امیر', 'امیری', 'amir.amiri@dotin.ir', '9853', '2021-06-20 16:10:43', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL);
INSERT INTO `t_employee` VALUES (9, 'Ø±Ø¶Ø§', 'Ø¹Ø§Ø¨Ø¯Û', 'rezaabedi@dotin.ir', '95132', '2021-06-21 08:57:04', 4, NULL, NULL, 1, 2, NULL, 0, NULL);
INSERT INTO `t_employee` VALUES (11, 'ÙØ­ÙØ¯', 'ÙØ±Ø§Ø¯Û', 'mostafamostafavi@dotin.ir', '9635741', '2021-06-21 18:48:49', 4, NULL, NULL, 2, 2, NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_vacation
-- ----------------------------
DROP TABLE IF EXISTS `t_vacation`;
CREATE TABLE `t_vacation`  (
  `c_VacationId` int NOT NULL AUTO_INCREMENT,
  `c_VacationStartDateAndTime` timestamp NOT NULL DEFAULT curtime,
  `c_VacationEndDateAndTime` timestamp NOT NULL DEFAULT curtime,
  `c_Version` int NULL DEFAULT NULL,
  `c_UpdateDateAndTime` timestamp NULL DEFAULT NULL,
  `c_Active` tinyint(1) NULL DEFAULT 1,
  `c_DeleteDateAndTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`c_VacationId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_vacation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
