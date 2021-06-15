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

 Date: 15/06/2021 12:05:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_categoryelement
-- ----------------------------

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
  `updated_at` timestamp NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------

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
