/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : wiki

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 27/06/2022 20:16:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent` bigint(20) NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (100, 0, '前端开发', 100);
INSERT INTO `category` VALUES (101, 100, 'Vue', 101);
INSERT INTO `category` VALUES (102, 100, 'HTML', 102);
INSERT INTO `category` VALUES (200, 0, 'Java', 200);
INSERT INTO `category` VALUES (201, 200, '基础应用', 201);
INSERT INTO `category` VALUES (202, 100, 'test', 1);
INSERT INTO `category` VALUES (203, 0, 'test', 1);

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1, '测试');

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category1_id` bigint(20) NULL DEFAULT NULL COMMENT '分类1',
  `category2_id` bigint(20) NULL DEFAULT NULL COMMENT '分类2',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `doc_count` int(11) NULL DEFAULT NULL COMMENT '文档数',
  `view_count` int(11) NULL DEFAULT NULL COMMENT '阅读数',
  `vote_count` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO `ebook` VALUES (1, 'Java编程思想1', 100, 202, 'Java编程思想', 'https://img9.doubanio.com/view/subject/s/public/s27243455.jpg', 3, 3, 3);
INSERT INTO `ebook` VALUES (2, 'Sql必知必会', 200, 201, 'Sql必知必会', 'https://img9.doubanio.com/view/subject/s/public/s33701044.jpg', 3, 3, 3);
INSERT INTO `ebook` VALUES (3, '零基础Java入门', 200, 201, '零基础Javaee入门', '/image/cover1.png', 5, 5, 5);
INSERT INTO `ebook` VALUES (4, '零基础Vue入门', 100, 101, '零基础Vue入门', '/image/cover2.png', 5, 5, 5);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '测试', 'password');

SET FOREIGN_KEY_CHECKS = 1;
