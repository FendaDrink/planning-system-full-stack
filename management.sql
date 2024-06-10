/*
 Navicat Premium Data Transfer

 Source Server         : project
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : management

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 10/06/2024 23:35:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for color_detail
-- ----------------------------
DROP TABLE IF EXISTS `color_detail`;
CREATE TABLE `color_detail`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `code` int NOT NULL COMMENT '颜色码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '颜色名称',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划用颜色',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color_detail
-- ----------------------------
INSERT INTO `color_detail` VALUES ('81ec5e80-273b-11ef-bc0f-598b830b70b8', 22, '红色', '#FF0000');
INSERT INTO `color_detail` VALUES ('8d17ddc0-273b-11ef-bc0f-598b830b70b8', 23, '黑色', '#000000');
INSERT INTO `color_detail` VALUES ('93ce0180-273b-11ef-bc0f-598b830b70b8', 24, '黄色', '#FFF000');

-- ----------------------------
-- Table structure for color_title
-- ----------------------------
DROP TABLE IF EXISTS `color_title`;
CREATE TABLE `color_title`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataIndex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of color_title
-- ----------------------------
INSERT INTO `color_title` VALUES ('1', '颜色码', 'code', '25%');
INSERT INTO `color_title` VALUES ('2', '颜色名称', 'name', '25%');
INSERT INTO `color_title` VALUES ('3', '计划用颜色', 'color', '25%');

-- ----------------------------
-- Table structure for engine_detail
-- ----------------------------
DROP TABLE IF EXISTS `engine_detail`;
CREATE TABLE `engine_detail`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stall` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_detail
-- ----------------------------
INSERT INTO `engine_detail` VALUES ('6e295150-273b-11ef-bc0f-598b830b70b8', 'EE', 4, 'YH465QE1');
INSERT INTO `engine_detail` VALUES ('73742540-273b-11ef-bc0f-598b830b70b8', 'ER', 5, 'LJ465Q-1AE3');
INSERT INTO `engine_detail` VALUES ('779c4b20-273b-11ef-bc0f-598b830b70b8', 'EN', 4, 'LJ462QE3');

-- ----------------------------
-- Table structure for engine_title
-- ----------------------------
DROP TABLE IF EXISTS `engine_title`;
CREATE TABLE `engine_title`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataIndex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine_title
-- ----------------------------
INSERT INTO `engine_title` VALUES ('1', '特殊发动机代码', 'code', '25%');
INSERT INTO `engine_title` VALUES ('2', '档位', 'stall', '25%');
INSERT INTO `engine_title` VALUES ('3', '发动机名称', 'name', '25%');

-- ----------------------------
-- Table structure for operation_logs
-- ----------------------------
DROP TABLE IF EXISTS `operation_logs`;
CREATE TABLE `operation_logs`  (
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requestBody` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `timestamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_logs
-- ----------------------------
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 21:56:08', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 21:56:15', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 21:56:17', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 21:57:43', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 21:57:47', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 21:57:57', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 21:58:12', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 21:59:41', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:03:31', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:03:50', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:04:12', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:05:00', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:05:05', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:06:02', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:06:45', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:07:09', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:07:52', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:07:53', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:07:59', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:01', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:08', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:09', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:30', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:31', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:08:55', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:09:27', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 22:09:53', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 22:09:54', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 22:09:55', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 22:09:56', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"root\",\"password\":\"myw@999999999\"}', '2024-06-10 22:10:10', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:10:13', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 22:10:14', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:10:15', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 22:10:45', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:10:46', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:11:09', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:11:15', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 22:11:31', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 22:11:32', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:11:36', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 22:11:58', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 22:11:59', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:12:03', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:21:19', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:21:21', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:25:13', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:26:49', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 22:33:04', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 22:33:08', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 22:33:09', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 22:33:10', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:33:12', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/log', '{}', '2024-06-10 22:33:13', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 22:33:14', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 22:33:20', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail/311cc780-24cd-11ef-980a-35b7896364b4', '{}', '2024-06-10 22:33:23', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail/5bbfe600-25a1-11ef-9dc9-c5ffc8b34c5d', '{}', '2024-06-10 22:33:24', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail/aded55d0-24ce-11ef-a79d-0151632ea690', '{}', '2024-06-10 22:33:26', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail/special/aded55d0-24ce-11ef-a79d-0151632ea690', '{}', '2024-06-10 22:33:27', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"user\",\"password\":\"myw@999999999\"}', '2024-06-10 22:35:10', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"user\",\"password\":\"myw@99999999\"}', '2024-06-10 22:35:11', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"user\",\"password\":\"myw@999999999\"}', '2024-06-10 22:35:19', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"user\",\"password\":\"myw@999999999\"}', '2024-06-10 22:35:28', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"user\",\"password\":\"myw@999999999\"}', '2024-06-10 22:35:41', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/engine', '{}', '2024-06-10 22:35:44', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/publicInfo', '{}', '2024-06-10 22:35:45', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'POST', '/publicInfo/getDetail', '{\"classes\":\"1\",\"code\":\"ESM\",\"efficiency\":\"1\",\"flow\":\"1\",\"group\":\"1\",\"name\":\"TEST\",\"simple\":\"1\",\"speed\":\"1\",\"type\":\"车身\",\"isTrusted\":true,\"_vts\":1718030169802}', '2024-06-10 22:36:21', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/engine', '{}', '2024-06-10 22:38:23', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/color', '{}', '2024-06-10 22:38:24', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/engine', '{}', '2024-06-10 22:38:25', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/engine', '{}', '2024-06-10 22:38:51', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/color', '{}', '2024-06-10 22:38:52', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/color', '{}', '2024-06-10 22:38:53', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/publicInfo', '{}', '2024-06-10 22:38:54', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/engine', '{}', '2024-06-10 22:39:38', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/log', '{}', '2024-06-10 22:39:39', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/color', '{}', '2024-06-10 22:39:40', '成功');
INSERT INTO `operation_logs` VALUES ('普通用户', 'GET', '/color', '{}', '2024-06-10 22:40:02', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"admin\",\"password\":\"myw@999999999\"}', '2024-06-10 22:40:17', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'DELETE', '/publicInfo/getDetail/ce058440-2736-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 22:40:20', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 22:40:21', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'DELETE', '/color/5bd76250-2725-11ef-bdfb-8f7ebb7a760e', '{}', '2024-06-10 22:40:23', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 22:40:24', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 22:43:35', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 22:57:54', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 22:57:57', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"3\",\"code\":\"EBD-A\",\"efficiency\":\"0.95\",\"flow\":\"5\",\"group\":\"1\",\"name\":\"东部车身A\",\"simple\":\"EA\",\"speed\":\"120\",\"type\":\"车身\"}', '2024-06-10 23:01:02', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"2\",\"code\":\"EBD-B\",\"efficiency\":\"0.85\",\"flow\":\"4\",\"group\":\"2\",\"name\":\"东部车身B\",\"simple\":\"EB\",\"speed\":\"210\",\"type\":\"车身\"}', '2024-06-10 23:01:38', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"1\",\"code\":\"EBD-C\",\"efficiency\":\"0.85\",\"flow\":\"3\",\"group\":\"3\",\"name\":\"东部车身C\",\"simple\":\"EC\",\"speed\":\"200\",\"type\":\"车身\"}', '2024-06-10 23:02:14', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"0\",\"code\":\"EBD-D\",\"efficiency\":\"0\",\"flow\":\"2\",\"group\":\"4\",\"name\":\"东部车身D\",\"simple\":\"ED\",\"speed\":\"0\",\"type\":\"车身\"}', '2024-06-10 23:02:40', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"1\",\"code\":\"wbd\",\"efficiency\":\"0.85\",\"flow\":\"1\",\"group\":\"5\",\"name\":\"西部车身\",\"simple\":\"WD\",\"speed\":\"235\",\"type\":\"车身\"}', '2024-06-10 23:04:25', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"4\",\"code\":\"PT-A\",\"efficiency\":\"0.88\",\"flow\":\"3\",\"group\":\"1\",\"name\":\"东部涂装A\",\"simple\":\"PA\",\"speed\":\"203\",\"type\":\"涂装\"}', '2024-06-10 23:04:55', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"4\",\"code\":\"PT-B\",\"efficiency\":\"0.88\",\"flow\":\"2\",\"group\":\"2\",\"name\":\"东部涂装B\",\"simple\":\"PB\",\"speed\":\"166\",\"type\":\"涂装\"}', '2024-06-10 23:05:19', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"4\",\"code\":\"PT-C\",\"efficiency\":\"0.88\",\"flow\":\"1\",\"group\":\"3\",\"name\":\"东部涂装C\",\"simple\":\"PC\",\"speed\":\"166\",\"type\":\"涂装\"}', '2024-06-10 23:06:06', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"4\",\"code\":\"GT-A\",\"efficiency\":\"0.88\",\"flow\":\"2\",\"group\":\"1\",\"name\":\"东部总装A\",\"simple\":\"GA\",\"speed\":\"203\",\"type\":\"总装\"}', '2024-06-10 23:06:32', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/publicInfo/getDetail', '{\"classes\":\"4\",\"code\":\"GT-B\",\"efficiency\":\"0.88\",\"flow\":\"1\",\"group\":\"2\",\"name\":\"东部总装B\",\"simple\":\"GB\",\"speed\":\"166\",\"type\":\"总装\"}', '2024-06-10 23:06:55', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 23:07:00', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 23:07:04', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 23:07:05', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/05ed5b90-273b-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:07:07', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"05ed5b90-273b-11ef-bc0f-598b830b70b8\",\"value\":\"NAA\"}', '2024-06-10 23:07:12', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/134fb800-273b-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:07:14', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"134fb800-273b-11ef-bc0f-598b830b70b8\",\"value\":\"NAB\"}', '2024-06-10 23:07:17', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/40ed88b0-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:07:30', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"40ed88b0-273a-11ef-a6a4-e17681f01c4f\",\"value\":\"NAC\"}', '2024-06-10 23:07:33', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 23:07:38', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/56a93190-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:07:43', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/40ed88b0-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:07:45', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"40ed88b0-273a-11ef-a6a4-e17681f01c4f\",\"value\":\"NAB\"}', '2024-06-10 23:07:49', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/40ed88b0-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:07:52', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"40ed88b0-273a-11ef-a6a4-e17681f01c4f\",\"value\":\"NAA\"}', '2024-06-10 23:07:55', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/56a93190-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:07:57', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/6bc14770-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:08:03', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"6bc14770-273a-11ef-a6a4-e17681f01c4f\",\"value\":\"NAC\"}', '2024-06-10 23:08:05', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/7b75aa30-273a-11ef-a6a4-e17681f01c4f', '{}', '2024-06-10 23:08:07', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"7b75aa30-273a-11ef-a6a4-e17681f01c4f\",\"value\":\"NAD\"}', '2024-06-10 23:08:10', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/b9f9b170-273a-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:11', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"b9f9b170-273a-11ef-bc0f-598b830b70b8\",\"value\":\"NAE\"}', '2024-06-10 23:08:14', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/cc1ffe90-273a-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:18', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"cc1ffe90-273a-11ef-bc0f-598b830b70b8\",\"value\":\"01\"}', '2024-06-10 23:08:21', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/d9ffc860-273a-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:22', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"d9ffc860-273a-11ef-bc0f-598b830b70b8\",\"value\":\"02\"}', '2024-06-10 23:08:24', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/f6633d20-273a-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:25', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"f6633d20-273a-11ef-bc0f-598b830b70b8\",\"value\":\"03\"}', '2024-06-10 23:08:27', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/05ed5b90-273b-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:30', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"05ed5b90-273b-11ef-bc0f-598b830b70b8\",\"value\":\"TAA\"}', '2024-06-10 23:08:37', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo/getDetail/134fb800-273b-11ef-bc0f-598b830b70b8', '{}', '2024-06-10 23:08:38', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/publicInfo/getDetail/special', '{\"key\":\"134fb800-273b-11ef-bc0f-598b830b70b8\",\"value\":\"TAB\"}', '2024-06-10 23:08:42', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 23:08:52', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/engine', '{\"code\":\"EE\",\"stall\":\"4\",\"name\":\"YH465QE1\"}', '2024-06-10 23:09:27', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/engine', '{\"code\":\"ER\",\"stall\":\"5\",\"name\":\"LJ465Q-1AE3\"}', '2024-06-10 23:09:36', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/engine', '{\"code\":\"EN\",\"stall\":\"4\",\"name\":\"LJ462QE3\"}', '2024-06-10 23:09:43', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 23:09:44', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 23:09:50', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/color', '{\"code\":\"22\",\"name\":\"红色\",\"color\":\"#FF000000\"}', '2024-06-10 23:10:00', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/color', '{}', '2024-06-10 23:10:02', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'PATCH', '/color', '{\"key\":\"81ec5e80-273b-11ef-bc0f-598b830b70b8\",\"code\":22,\"name\":\"红色\",\"color\":\"#FF0000\"}', '2024-06-10 23:10:08', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/color', '{\"code\":\"23\",\"name\":\"黑色\",\"color\":\"#000000\"}', '2024-06-10 23:10:19', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'POST', '/color', '{\"code\":\"24\",\"name\":\"黄色\",\"color\":\"#FFF000\"}', '2024-06-10 23:10:30', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/log', '{}', '2024-06-10 23:10:33', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 23:10:51', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/publicInfo', '{}', '2024-06-10 23:10:52', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 23:10:59', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'GET', '/log', '{}', '2024-06-10 23:11:17', '成功');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"admin\",\"password\":\"123\"}', '2024-06-10 23:11:22', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"admin\",\"password\":\"myw@999999999\"}', '2024-06-10 23:11:29', '成功');
INSERT INTO `operation_logs` VALUES ('毛伊炜', 'GET', '/engine', '{}', '2024-06-10 23:11:32', '失败');
INSERT INTO `operation_logs` VALUES ('undefined', 'POST', '/login', '{\"username\":\"root\",\"password\":\"myw@999999999\"}', '2024-06-10 23:11:48', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 23:11:49', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 23:11:50', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/color', '{}', '2024-06-10 23:12:00', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 23:12:15', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:12:16', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:15:54', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:16:12', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:17:33', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:18:48', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:19:09', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:19:13', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:21:49', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:23:10', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:23:14', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:23:15', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:23:56', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 23:24:06', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:24:09', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:24:37', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:24:53', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:24:59', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:25:19', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 23:25:23', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:30:17', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:30:23', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:31:08', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:31:35', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:31:46', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:31:47', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:31:48', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:31:50', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:31:51', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:31:52', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:32:09', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:32:43', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:32:54', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:33:29', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo', '{}', '2024-06-10 23:33:42', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:33:46', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/publicInfo/getDetail', '{}', '2024-06-10 23:33:47', '成功');
INSERT INTO `operation_logs` VALUES ('管理员', 'GET', '/engine', '{}', '2024-06-10 23:33:50', '成功');

-- ----------------------------
-- Table structure for public_detail
-- ----------------------------
DROP TABLE IF EXISTS `public_detail`;
CREATE TABLE `public_detail`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产线编号',
  `type` enum('车身','涂装','总装') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产线类型',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产线名称',
  `classes` int NOT NULL COMMENT '生产线班次',
  `speed` int NOT NULL COMMENT '线速',
  `efficiency` double NOT NULL COMMENT '运行效率',
  `group` int NOT NULL COMMENT '生产线分组',
  `flow` int NOT NULL COMMENT '流向代码',
  `simple` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '生产线编号简称',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_detail
-- ----------------------------
INSERT INTO `public_detail` VALUES ('05ed5b90-273b-11ef-bc0f-598b830b70b8', 'GT-A', '总装', '东部总装A', 4, 203, 0.88, 1, 2, 'GA');
INSERT INTO `public_detail` VALUES ('134fb800-273b-11ef-bc0f-598b830b70b8', 'GT-B', '总装', '东部总装B', 4, 166, 0.88, 2, 1, 'GB');
INSERT INTO `public_detail` VALUES ('40ed88b0-273a-11ef-a6a4-e17681f01c4f', 'EBD-A', '车身', '东部车身A', 3, 120, 0.95, 1, 5, 'EA');
INSERT INTO `public_detail` VALUES ('56a93190-273a-11ef-a6a4-e17681f01c4f', 'EBD-B', '车身', '东部车身B', 2, 210, 0.85, 2, 4, 'EB');
INSERT INTO `public_detail` VALUES ('6bc14770-273a-11ef-a6a4-e17681f01c4f', 'EBD-C', '车身', '东部车身C', 1, 200, 0.85, 3, 3, 'EC');
INSERT INTO `public_detail` VALUES ('7b75aa30-273a-11ef-a6a4-e17681f01c4f', 'EBD-D', '车身', '东部车身D', 0, 0, 0, 4, 2, 'ED');
INSERT INTO `public_detail` VALUES ('b9f9b170-273a-11ef-bc0f-598b830b70b8', 'WBD', '车身', '西部车身', 1, 235, 0.85, 5, 1, 'WD');
INSERT INTO `public_detail` VALUES ('cc1ffe90-273a-11ef-bc0f-598b830b70b8', 'PT-A', '涂装', '东部涂装A', 4, 203, 0.88, 1, 3, 'PA');
INSERT INTO `public_detail` VALUES ('d9ffc860-273a-11ef-bc0f-598b830b70b8', 'PT-B', '涂装', '东部涂装B', 4, 166, 0.88, 2, 2, 'PB');
INSERT INTO `public_detail` VALUES ('f6633d20-273a-11ef-bc0f-598b830b70b8', 'PT-C', '涂装', '东部涂装C', 4, 166, 0.88, 3, 1, 'PC');

-- ----------------------------
-- Table structure for public_title
-- ----------------------------
DROP TABLE IF EXISTS `public_title`;
CREATE TABLE `public_title`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataIndex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `width` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_title
-- ----------------------------
INSERT INTO `public_title` VALUES ('1', '生产线编号', 'code', '10%');
INSERT INTO `public_title` VALUES ('2', '生产线类型', 'type', '10%');
INSERT INTO `public_title` VALUES ('3', '生产线名称', 'name', '10%');
INSERT INTO `public_title` VALUES ('4', '生产线班次', 'classes', '10%');
INSERT INTO `public_title` VALUES ('5', '线速', 'speed', '10%');
INSERT INTO `public_title` VALUES ('6', '运行效率', 'efficiency', '10%');
INSERT INTO `public_title` VALUES ('7', '生产线分组', 'group', '10%');
INSERT INTO `public_title` VALUES ('8', '流向代码', 'flow', '10%');
INSERT INTO `public_title` VALUES ('9', '生产线编号简称', 'simple', '10%');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `UpdateTime` datetime NOT NULL COMMENT '操作时间',
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作用户名',
  `Action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作行为',
  `Result` enum('成功','失败') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '结果',
  PRIMARY KEY (`UpdateTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for special
-- ----------------------------
DROP TABLE IF EXISTS `special`;
CREATE TABLE `special`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` enum('白车身码','颜色码') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of special
-- ----------------------------
INSERT INTO `special` VALUES ('05ed5b90-273b-11ef-bc0f-598b830b70b8', 'GT-A', '白车身码', 'TAA');
INSERT INTO `special` VALUES ('134fb800-273b-11ef-bc0f-598b830b70b8', 'GT-B', '白车身码', 'TAB');
INSERT INTO `special` VALUES ('40ed88b0-273a-11ef-a6a4-e17681f01c4f', 'EBD-A', '白车身码', 'NAA');
INSERT INTO `special` VALUES ('56a93190-273a-11ef-a6a4-e17681f01c4f', 'EBD-B', '白车身码', '');
INSERT INTO `special` VALUES ('6bc14770-273a-11ef-a6a4-e17681f01c4f', 'EBD-C', '白车身码', 'NAC');
INSERT INTO `special` VALUES ('7b75aa30-273a-11ef-a6a4-e17681f01c4f', 'EBD-D', '白车身码', 'NAD');
INSERT INTO `special` VALUES ('b9f9b170-273a-11ef-bc0f-598b830b70b8', 'wbd', '白车身码', 'NAE');
INSERT INTO `special` VALUES ('cc1ffe90-273a-11ef-bc0f-598b830b70b8', 'PT-A', '颜色码', '01');
INSERT INTO `special` VALUES ('d9ffc860-273a-11ef-bc0f-598b830b70b8', 'PT-B', '颜色码', '02');
INSERT INTO `special` VALUES ('f6633d20-273a-11ef-bc0f-598b830b70b8', 'PT-C', '颜色码', '03');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', '$2b$10$SGz1bNQMIGPfcL6FX.7FVu6ALlQ3ZG1Le4I9wE1usPhqCdQhRGrvy', 'root');
INSERT INTO `user` VALUES ('2', '毛伊炜', '$2b$10$SGz1bNQMIGPfcL6FX.7FVu6ALlQ3ZG1Le4I9wE1usPhqCdQhRGrvy', 'admin');
INSERT INTO `user` VALUES ('3', '普通用户', '$2b$10$SGz1bNQMIGPfcL6FX.7FVu6ALlQ3ZG1Le4I9wE1usPhqCdQhRGrvy', 'user');

SET FOREIGN_KEY_CHECKS = 1;
