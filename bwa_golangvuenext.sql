/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost:3306
 Source Schema         : bwa_golangvuenext

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : 65001

 Date: 27/02/2021 21:33:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for campaign_images
-- ----------------------------
DROP TABLE IF EXISTS `campaign_images`;
CREATE TABLE `campaign_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NULL DEFAULT NULL,
  `file_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `is_primary` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of campaign_images
-- ----------------------------
INSERT INTO `campaign_images` VALUES (1, 1, 'campaign-images/sands.jpg', '1', '2021-02-03 10:54:10', '2021-02-03 10:54:19');
INSERT INTO `campaign_images` VALUES (2, 1, 'campaign-images/sands2.jpg', '0', '2021-02-03 10:54:10', '2021-02-03 10:54:19');
INSERT INTO `campaign_images` VALUES (3, 1, 'campaign-images/sands3.jpg', '0', '2021-02-03 10:54:10', '2021-02-03 10:54:19');

-- ----------------------------
-- Table structure for campaigns
-- ----------------------------
DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `short_description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `goal_amount` int(11) NULL DEFAULT NULL,
  `current_amount` int(11) NULL DEFAULT NULL,
  `perks` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `backer_count` int(11) NULL DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of campaigns
-- ----------------------------
INSERT INTO `campaigns` VALUES (1, 7, 'Campaign 1', 'Lorem Ipsum', 'Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 500000000, 0, 'Lorem Ipsum Lorem Ipsum', 0, '1', NULL, NULL);
INSERT INTO `campaigns` VALUES (2, 7, 'Campaign 2', 'Lorem Ipsum', 'Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 500000000, 0, 'Lorem Ipsum Lorem Ipsum', 0, 'campaign-satu', NULL, NULL);
INSERT INTO `campaigns` VALUES (3, 10, 'Campaign 1', 'Lorem Ipsum', 'Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum', 500000000, 0, 'Lorem Ipsum Lorem Ipsum', 0, 'campaign-satu', NULL, NULL);

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `occupation` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `avatar_file_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Sands', 'CEO', 'sands@gmail.com', 'sandssands', 'avatar.jpg', 'user', NULL, '2020-12-23 17:04:45', '2020-12-23 17:04:53');
INSERT INTO `users` VALUES (7, 'Sands Insomnia', 'tes occupation', 'sands.insomnia@gmail.com', '$2a$04$W.sfzOReD2yRZEHKznlqROnqTzNLLAE.YPjd.jlAWjxAhQGG8.CwW', '', 'user', NULL, '2021-01-07 18:13:59', '2021-01-07 18:13:59');
INSERT INTO `users` VALUES (8, 'Sands Test Reponse', 'CEo qutanya', 'sands.qutanya@gmail.com', '$2a$04$xGy7XV4kaTV8CtMV/WCWE.FJrJcioWAkRIuOMDdyINLpleO140zhC', '', 'user', NULL, '2021-01-11 11:09:25', '2021-01-11 11:09:25');
INSERT INTO `users` VALUES (9, 'Sands Test Reponse JSON', 'CFO', 'sands.q@gmail.com', '$2a$04$c4Y3IyDcmQoKRRXHhSGq7OcuzHVXpO1XIfxTIOIXAFufHfdHR.T.O', '', 'user', NULL, '2021-01-11 13:40:35', '2021-01-11 13:40:35');
INSERT INTO `users` VALUES (10, 'Sands Formatter JSON', 'CTO', 'sands.a@gmail.com', '$2a$04$5chn/Pw5Yb4kO2A4Kl6ykexP8KDooS6H2VPuxlZDQJg./cO8zmN0m', 'images/10-Capture001.png', 'user', NULL, '2021-01-11 14:23:48', '2021-02-01 18:26:00');
INSERT INTO `users` VALUES (11, 'Sands Content', 'CTO MNC Content', 'sandscontent@gmail.com', '$2a$04$kgyLILbDERqYmEoYenPyN./8j13kpf1VlAaJyBXd16CMu8UMtS9E.', 'images/11-IMG-20210119-WA0008.jpg', 'user', NULL, '2021-01-26 14:28:19', '2021-02-02 10:44:58');

SET FOREIGN_KEY_CHECKS = 1;
