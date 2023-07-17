/*
 Navicat Premium Data Transfer

 Source Server         : hello-mysql-connect
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : hello-mysql

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 17/07/2023 22:48:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `title`, `content`) VALUES (1, '文章1', '这是文章1的内容。');
INSERT INTO `article` (`id`, `title`, `content`) VALUES (2, '文章2', '这是文章2的内容。');
INSERT INTO `article` (`id`, `title`, `content`) VALUES (3, '文章3', '这是文章3的内容。');
INSERT INTO `article` (`id`, `title`, `content`) VALUES (4, '文章4', '这是文章4的内容。');
INSERT INTO `article` (`id`, `title`, `content`) VALUES (5, '文章5', '这是文章5的内容。');
COMMIT;

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `article_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `acticle_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
BEGIN;
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (4, 1);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (5, 1);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (2, 2);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (5, 2);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (2, 3);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (3, 3);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (2, 4);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (3, 4);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (4, 4);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (3, 5);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (4, 5);
INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES (5, 5);
COMMIT;

-- ----------------------------
-- Table structure for avg_price_by_category
-- ----------------------------
DROP TABLE IF EXISTS `avg_price_by_category`;
CREATE TABLE `avg_price_by_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `avg_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of avg_price_by_category
-- ----------------------------
BEGIN;
INSERT INTO `avg_price_by_category` (`id`, `category`, `avg_price`) VALUES (1, '手机', 6999.00);
INSERT INTO `avg_price_by_category` (`id`, `category`, `avg_price`) VALUES (2, '平板电脑', 7999.00);
INSERT INTO `avg_price_by_category` (`id`, `category`, `avg_price`) VALUES (3, '笔记本电脑', 12999.00);
INSERT INTO `avg_price_by_category` (`id`, `category`, `avg_price`) VALUES (4, '耳机', 1999.00);
INSERT INTO `avg_price_by_category` (`id`, `category`, `avg_price`) VALUES (5, '智能手表', 3299.00);
COMMIT;

-- ----------------------------
-- Table structure for id_card
-- ----------------------------
DROP TABLE IF EXISTS `id_card`;
CREATE TABLE `id_card` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `card_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号',
  `user_id` int DEFAULT NULL COMMENT '用户 id',
  PRIMARY KEY (`id`),
  KEY `card_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of id_card
-- ----------------------------
BEGIN;
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (1, '110101199001011234', 1);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (2, '310101199002022345', 2);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (3, '440101199003033456', 3);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (4, '440301199004044567', 4);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (5, '510101199005055678', 5);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (6, '330101199006066789', 6);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (7, '320101199007077890', 7);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (8, '500101199008088901', 8);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (9, '420101199009099012', 9);
INSERT INTO `id_card` (`id`, `card_name`, `user_id`) VALUES (10, '610101199010101023', 10);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`id`, `name`, `price`, `category`, `stock`) VALUES (1, 'iPhone12', 6999.00, '手机', 100);
INSERT INTO `product` (`id`, `name`, `price`, `category`, `stock`) VALUES (2, 'iPad Pro', 7999.00, '平板电脑', 50);
INSERT INTO `product` (`id`, `name`, `price`, `category`, `stock`) VALUES (3, 'MacBook Pro', 12999.00, '笔记本电脑', 30);
INSERT INTO `product` (`id`, `name`, `price`, `category`, `stock`) VALUES (4, 'AirPods Pro', 1999.00, '耳机', 200);
INSERT INTO `product` (`id`, `name`, `price`, `category`, `stock`) VALUES (5, 'Apple Watch', 3299.00, '智能手表', 80);
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生名',
  `gender` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `class` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '班级名',
  `score` int NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (1, '张三', '男', 18, '一班', 90);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (2, '李四', '女', 19, '二班', 85);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (3, '王五', '男', 20, '三班', 70);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (4, '赵六', '女', 18, '一班', 95);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (5, '钱七', '男', 19, '二班', 80);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (6, '孙八', '女', 20, '三班', 75);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (7, '周九', '男', 18, '一班', 85);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (8, '吴十', '女', 19, '二班', 90);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (9, '郑十一', '男', 20, '三班', 60);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (10, '王十二', '女', 18, '一班', 95);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (11, '赵十三', '男', 19, '二班', 75);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (12, '钱十四', '女', 20, '三班', 80);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (13, '孙十五', '男', 18, '一班', 90);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (14, '周十六', '女', 19, '二班', 85);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (15, '吴十七', '男', 20, '三班', 70);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (16, '郑十八', '女', 18, '一班', 95);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (17, '王十九', '男', 19, '二班', 80);
INSERT INTO `student` (`id`, `name`, `gender`, `age`, `class`, `score`) VALUES (18, '赵二十', '女', 20, '三班', 75);
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
BEGIN;
INSERT INTO `tag` (`id`, `name`) VALUES (1, '标签1');
INSERT INTO `tag` (`id`, `name`) VALUES (2, '标签2');
INSERT INTO `tag` (`id`, `name`) VALUES (3, '标签3');
INSERT INTO `tag` (`id`, `name`) VALUES (4, '标签4');
INSERT INTO `tag` (`id`, `name`) VALUES (5, '标签5');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `name`) VALUES (1, '张三');
INSERT INTO `user` (`id`, `name`) VALUES (2, '李四');
INSERT INTO `user` (`id`, `name`) VALUES (3, '王五');
INSERT INTO `user` (`id`, `name`) VALUES (4, '赵六');
INSERT INTO `user` (`id`, `name`) VALUES (5, '孙七');
INSERT INTO `user` (`id`, `name`) VALUES (6, '周八');
INSERT INTO `user` (`id`, `name`) VALUES (7, '吴九');
INSERT INTO `user` (`id`, `name`) VALUES (8, '郑十');
INSERT INTO `user` (`id`, `name`) VALUES (9, '钱十一');
INSERT INTO `user` (`id`, `name`) VALUES (10, '陈十二');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
