/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : campus_course_agent

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 29/10/2026 17:24:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for courses
-- ----------------------------
DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程代码',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '课程简介',
  `status` int(11) NOT NULL COMMENT '状态：0-停用，1-正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courses
-- ----------------------------
INSERT INTO `courses` VALUES (1, '高等数学', 'MATH101', '大学一年级基础数学课程', 1, '2026-10-29 15:48:58', '2026-10-29 15:48:58');
INSERT INTO `courses` VALUES (2, 'Python程序设计', 'CS201', 'Python语法与Web开发基础', 1, '2026-10-29 15:49:42', '2026-10-29 15:49:42');
INSERT INTO `courses` VALUES (3, '大学英语', 'EN101', '大学英语读写与听力', 1, '2026-10-29 15:49:54', '2026-10-29 15:49:54');
INSERT INTO `courses` VALUES (4, '数据结构', 'CS301', '栈、队列、树、图等核心数据结构', 1, '2026-10-29 15:50:05', '2026-10-29 15:50:05');

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '学生ID',
  `class_date` date NOT NULL COMMENT '上课日期',
  `period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '节次',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地点',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_schedule_course_id`(`course_id`) USING BTREE,
  INDEX `idx_schedule_user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedules
-- ----------------------------
INSERT INTO `schedules` VALUES (1, 2, '2026-11-02', '第1节', 1, '教学楼A101', '2026-10-29 16:33:32', '2026-10-29 16:33:32');
INSERT INTO `schedules` VALUES (2, 2, '2026-11-02', '第3节', 2, '机房B201', '2026-10-29 16:33:49', '2026-10-29 16:33:49');
INSERT INTO `schedules` VALUES (3, 3, '2026-11-03', '第2节', 3, '教学楼C302', '2026-10-29 16:33:57', '2026-10-29 16:33:57');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色：student-学生，admin-管理员',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `status` int(11) NOT NULL COMMENT '状态：0-禁用，1-正常',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '$2b$12$ypJClLKejFCsyn2eltOco.YAmXory0HFjh7E/oHu9MBzDZZ6wYSSi', '管理员', 'admin', 'admin@system.cn', '13988776699', '/uploads/1790046856623_dc4830aa.jpg', 1, '2026-09-11 15:30:07', '2026-09-22 11:14:34');
INSERT INTO `users` VALUES (2, 'aaa', '$2a$10$phJ2k4sP5.c7T/LuXwzyTu/AlbbOFXblsAZEW6mIfh3koVxQ3Hhny', '小白', 'student', 'xiaobai@qq.com', '13899776688', '/uploads/1790046891012_452a9884.png', 1, '2026-09-09 16:56:41', '2026-09-22 11:14:52');
INSERT INTO `users` VALUES (3, 'bbb', '$2a$10$blJ4Qgbaqxm5jmUAWvuiRuKy/FiqbmFv.n1i0noM3pxUZrYhd2HNK', '小黑', 'student', 'xiaohei@163.com', '13799886699', '/uploads/1790046917012_b9ee534a.png', 1, '2026-09-22 11:15:00', '2026-09-22 11:15:30');

SET FOREIGN_KEY_CHECKS = 1;
