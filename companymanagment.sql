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

 Date: 12/06/2021 10:46:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attach
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach`  (
  `attach_id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`attach_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attach
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for category_elements
-- ----------------------------
DROP TABLE IF EXISTS `category_elements`;
CREATE TABLE `category_elements`  (
  `categoryelement_id` int NOT NULL AUTO_INCREMENT,
  `categoryelement_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`categoryelement_id`) USING BTREE,
  INDEX `categoryfk`(`category_id`) USING BTREE,
  CONSTRAINT `categoryfk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_elements
-- ----------------------------

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email`  (
  `email_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `send_at` timestamp NOT NULL DEFAULT curtime,
  `attach_id` int NOT NULL,
  PRIMARY KEY (`email_id`) USING BTREE,
  INDEX `emailfk`(`attach_id`) USING BTREE,
  CONSTRAINT `emailfk` FOREIGN KEY (`attach_id`) REFERENCES `attach` (`attach_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email
-- ----------------------------

-- ----------------------------
-- Table structure for email_employee
-- ----------------------------
DROP TABLE IF EXISTS `email_employee`;
CREATE TABLE `email_employee`  (
  `email_id` int NOT NULL,
  `employee_id` int NOT NULL,
  INDEX `email_employeefk`(`email_id`) USING BTREE,
  INDEX `employee_emailfk`(`employee_id`) USING BTREE,
  CONSTRAINT `email_employeefk` FOREIGN KEY (`email_id`) REFERENCES `email` (`email_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_emailfk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_employee
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastfamily` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` enum('مدیر تیم توسعه دهندگان','مدیر تیم تحلیلگران','دمدیر تیم تست','تیم توسعه دهنده','تیم تست','تیم تحلیلگر') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manager_id` int NULL DEFAULT NULL,
  `vacation_id` int NULL DEFAULT NULL,
  `email_id` int NULL DEFAULT NULL,
  `categoryelement_id` int NOT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE,
  INDEX `manegerfk`(`manager_id`) USING BTREE,
  INDEX `vacationfk`(`vacation_id`) USING BTREE,
  INDEX `emailemployeefk`(`email_id`) USING BTREE,
  INDEX `categoryelement_id`(`categoryelement_id`) USING BTREE,
  CONSTRAINT `emailemployeefk` FOREIGN KEY (`email_id`) REFERENCES `email` (`email_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`categoryelement_id`) REFERENCES `category_elements` (`categoryelement_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `manegerfk` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `vacationfk` FOREIGN KEY (`vacation_id`) REFERENCES `vacation` (`vacation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for vacation
-- ----------------------------
DROP TABLE IF EXISTS `vacation`;
CREATE TABLE `vacation`  (
  `vacation_id` int NOT NULL AUTO_INCREMENT,
  `fromDate` timestamp NOT NULL DEFAULT curtime,
  `toDate` timestamp NOT NULL DEFAULT curtime,
  `vacationstatus` enum('تایید شده','رد شده','در انتظار') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'در انتظار',
  PRIMARY KEY (`vacation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
