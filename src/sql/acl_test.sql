/*
 Navicat Premium Data Transfer

 Source Server         : hello-mysql-connect
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : acl_test

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 17/07/2023 22:46:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (1, 'create_aaa', '新增 aaa', '2023-06-24 14:14:01.179477', '2023-06-24 14:14:01.179477');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (2, 'update_aaa', '修改 aaa', '2023-06-24 14:14:01.267564', '2023-06-24 14:14:01.267564');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (3, 'remove_aaa', '删除 aaa', '2023-06-24 14:14:01.305744', '2023-06-24 14:14:01.305744');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (4, 'query_aaa', '查询 aaa', '2023-06-24 14:14:01.339142', '2023-06-24 14:14:01.339142');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (5, 'create_bbb', '新增 bbb', '2023-06-24 14:14:01.417792', '2023-06-24 14:14:01.417792');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (6, 'update_bbb', '修改 bbb', '2023-06-24 14:14:01.437537', '2023-06-24 14:14:01.437537');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (7, 'remove_bbb', '删除 bbb', '2023-06-24 14:14:01.462002', '2023-06-24 14:14:01.462002');
INSERT INTO `permission` (`id`, `name`, `desc`, `createTime`, `updateTime`) VALUES (8, 'query_bbb', '查询 bbb', '2023-06-24 14:14:01.475444', '2023-06-24 14:14:01.475444');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `createTime`, `updateTime`) VALUES (1, '东东', 'aaaaaa', '2023-06-24 14:14:01.502980', '2023-06-24 14:14:01.502980');
INSERT INTO `user` (`id`, `username`, `password`, `createTime`, `updateTime`) VALUES (2, '光光', 'bbbbbb', '2023-06-24 14:14:01.517521', '2023-06-24 14:14:01.517521');
COMMIT;

-- ----------------------------
-- Table structure for user_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_permission_relation`;
CREATE TABLE `user_permission_relation` (
  `userId` int NOT NULL,
  `permissionId` int NOT NULL,
  PRIMARY KEY (`userId`,`permissionId`),
  KEY `IDX_cd7bb5431fb3b58ef832a268ef` (`userId`),
  KEY `IDX_ed47405f30131c99ca1f398c50` (`permissionId`),
  CONSTRAINT `FK_cd7bb5431fb3b58ef832a268ef4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ed47405f30131c99ca1f398c508` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_permission_relation
-- ----------------------------
BEGIN;
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (1, 1);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (1, 2);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (1, 3);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (1, 4);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (2, 5);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (2, 6);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (2, 7);
INSERT INTO `user_permission_relation` (`userId`, `permissionId`) VALUES (2, 8);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
