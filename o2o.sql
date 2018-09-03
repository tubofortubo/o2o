/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : o2o

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-09-03 20:41:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_area`
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES ('1', '东苑', '1', null, null);
INSERT INTO `tb_area` VALUES ('2', '西苑', '2', null, null);

-- ----------------------------
-- Table structure for `tb_head_line`
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line` (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `line_name` varchar(1000) DEFAULT NULL,
  `line_link` varchar(2000) NOT NULL,
  `line_img` varchar(2000) NOT NULL,
  `priority` int(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES ('1', '1', '1', '\\upload\\item\\shop\\1\\2018072215294797048.jpg', '1', '1', null, null);
INSERT INTO `tb_head_line` VALUES ('2', '1', '1', '\\upload\\item\\shop\\1\\2018072222421215730.jpg', '1', '1', null, null);

-- ----------------------------
-- Table structure for `tb_local_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth` (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`),
  UNIQUE KEY `uk_local_profile` (`username`),
  KEY `fk_localauth_profile` (`user_id`),
  CONSTRAINT `fk_localauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_person_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `email` varchar(2) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0' COMMENT '0:禁止使用本商城,1:允许使用本商城',
  `user_type` int(2) NOT NULL DEFAULT '1' COMMENT '1:顾客,2:店家,3:超级管理员',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES ('1', '测试', 'test', 'te', '1', '2', '2', null, null);

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(2000) DEFAULT NULL,
  `img_addr` varchar(2000) DEFAULT '',
  `normal_price` varchar(100) DEFAULT NULL,
  `promotion_price` varchar(100) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `product_category_id` int(11) DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `fk_product_procate` (`product_category_id`),
  KEY `fk_product_shop` (`shop_id`),
  CONSTRAINT `fk_product_procate` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`),
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES ('1', '正式商品', '啦啦啦啦', '\\upload\\item\\shop\\1\\2018072318220860112.jpg', '11111', '11111', '111111', null, '2018-07-24 11:20:28', '0', '1', '1');
INSERT INTO `tb_product` VALUES ('13', '测试商品1', null, '\\upload\\item\\shop\\1\\2018072215294668865.jpg', null, null, '20', '2018-07-22 15:29:46', '2018-07-24 11:05:51', '0', '1', '1');
INSERT INTO `tb_product` VALUES ('14', '测试商品1', null, '\\upload\\item\\shop\\1\\2018072215321735506.jpg', null, null, '20', '2018-07-22 15:32:18', '2018-07-22 15:32:18', '1', '1', '1');
INSERT INTO `tb_product` VALUES ('15', '1', '1', '\\upload\\item\\shop\\1\\2018072222105890182.jpg', '1', '1', '1', '2018-07-22 22:10:59', '2018-07-22 22:10:59', '1', null, '1');
INSERT INTO `tb_product` VALUES ('16', '1', '1', '\\upload\\item\\shop\\1\\2018072222222118087.jpg', '1', '1', '1', '2018-07-22 22:22:21', '2018-07-24 10:43:59', '1', null, '1');
INSERT INTO `tb_product` VALUES ('17', '1', '1', '\\upload\\item\\shop\\1\\2018072222251426134.jpg', '1', '1', '1', '2018-07-22 22:25:15', '2018-07-22 22:25:15', '1', null, '1');
INSERT INTO `tb_product` VALUES ('18', '1', '1', '\\upload\\item\\shop\\1\\2018072222415446290.jpg', '1', '1', '1', '2018-07-22 22:41:55', '2018-07-22 22:41:55', '1', null, '1');
INSERT INTO `tb_product` VALUES ('19', '1', '1', '\\upload\\item\\shop\\1\\2018072222421276456.jpg', '1', '1', '1', '2018-07-22 22:42:13', '2018-07-24 10:37:19', '1', null, '1');

-- ----------------------------
-- Table structure for `tb_product_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) NOT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_category_id`),
  KEY `fk_procate_shop` (`shop_id`),
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES ('1', '奶茶', '1', null, '1');
INSERT INTO `tb_product_category` VALUES ('2', '咖啡', '1', null, '1');
INSERT INTO `tb_product_category` VALUES ('4', '商品类别3', '2', '2018-07-21 16:23:58', '1');
INSERT INTO `tb_product_category` VALUES ('10', '奶茶', '7', null, '1');
INSERT INTO `tb_product_category` VALUES ('11', '就是', '12', null, '1');
INSERT INTO `tb_product_category` VALUES ('12', '虽败', '1', null, '8');
INSERT INTO `tb_product_category` VALUES ('13', '11', '2', null, '8');

-- ----------------------------
-- Table structure for `tb_product_img`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img` (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) NOT NULL,
  `img_desc` varchar(2000) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`product_img_id`),
  KEY `fk_proimg_id` (`product_id`),
  CONSTRAINT `fk_proimg_id` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES ('5', '\\upload\\item\\shop\\1\\2018072215294736390.jpg', null, null, '2018-07-22 15:29:47', '13');
INSERT INTO `tb_product_img` VALUES ('6', '\\upload\\item\\shop\\1\\2018072215294797048.jpg', null, null, '2018-07-22 15:29:47', '13');
INSERT INTO `tb_product_img` VALUES ('7', '\\upload\\item\\shop\\1\\2018072215321895715.jpg', null, null, '2018-07-22 15:32:19', '14');
INSERT INTO `tb_product_img` VALUES ('8', '\\upload\\item\\shop\\1\\2018072215321842006.jpg', null, null, '2018-07-22 15:32:19', '14');
INSERT INTO `tb_product_img` VALUES ('9', '\\upload\\item\\shop\\1\\2018072222105976988.jpg', null, null, '2018-07-22 22:11:00', '15');
INSERT INTO `tb_product_img` VALUES ('10', '\\upload\\item\\shop\\1\\2018072222222115900.jpg', null, null, '2018-07-22 22:22:22', '16');
INSERT INTO `tb_product_img` VALUES ('11', '\\upload\\item\\shop\\1\\2018072222251510875.jpg', null, null, '2018-07-22 22:25:15', '17');
INSERT INTO `tb_product_img` VALUES ('12', '\\upload\\item\\shop\\1\\2018072222415497247.jpg', null, null, '2018-07-22 22:41:55', '18');
INSERT INTO `tb_product_img` VALUES ('13', '\\upload\\item\\shop\\1\\2018072222421215730.jpg', null, null, '2018-07-22 22:42:13', '19');
INSERT INTO `tb_product_img` VALUES ('42', '\\upload\\item\\shop\\1\\2018072318220865364.jpg', null, null, '2018-07-23 18:22:09', '1');

-- ----------------------------
-- Table structure for `tb_shop`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建人',
  `area_id` int(5) DEFAULT NULL,
  `shop_category_id` int(11) DEFAULT NULL,
  `shop_name` varchar(256) NOT NULL,
  `shop_desc` varchar(1024) DEFAULT NULL,
  `shop_addr` varchar(200) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `shop_img` varchar(1024) DEFAULT NULL,
  `priority` int(3) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT '0',
  `advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `fk_shop_area` (`area_id`),
  KEY `fk_shop_profile` (`owner_id`),
  KEY `fk_shop_shopcate` (`shop_category_id`),
  CONSTRAINT `fk_shop_area` FOREIGN KEY (`area_id`) REFERENCES `tb_area` (`area_id`),
  CONSTRAINT `fk_shop_profile` FOREIGN KEY (`owner_id`) REFERENCES `tb_person_info` (`user_id`),
  CONSTRAINT `fk_shop_shopcate` FOREIGN KEY (`shop_category_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('1', '1', '2', '3', '正式名字', '测地址', '测试地址', '1322222', '\\upload\\item\\shop\\1\\2018072323425411827.jpg', null, '2018-07-16 11:07:51', '2018-07-23 23:42:55', '1', '');
INSERT INTO `tb_shop` VALUES ('2', '1', '1', '3', '新的店铺名称', 'test1', 'tset1', 'test1', '\\upload\\item\\shop\\2\\2018071916212092963.jpg', null, '2018-07-16 11:08:17', '2018-07-19 16:21:21', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('3', '1', '1', '2', '测试店铺3', 'test3', 'tset3', 'test3', '\\upload\\item\\shop\\3\\2018071916214665447.jpg', null, '2018-07-16 15:46:42', '2018-07-19 16:21:47', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('4', '1', '1', '3', '咖啡店', '我给你说 美得很', '我所谓哦', '13228000193', '\\upload\\item\\shop\\4\\2018071916223551628.jpg', null, '2018-07-17 12:15:56', '2018-07-19 16:22:37', '1', null);
INSERT INTO `tb_shop` VALUES ('5', '1', '1', '2', '老牌咖啡店', '无', '西安', '1222', '\\upload\\item\\shop\\5\\2018072107125314316.jpg', null, '2018-07-21 07:12:54', '2018-07-21 07:12:54', '1', null);
INSERT INTO `tb_shop` VALUES ('6', '1', '2', '2', '1', '1', '1', '1', '\\upload\\item\\shop\\6\\2018072107473640389.jpg', null, '2018-07-21 07:47:37', '2018-07-21 07:47:37', '1', null);
INSERT INTO `tb_shop` VALUES ('7', '1', '2', '2', '1', '1', '1', '1', '\\upload\\item\\shop\\7\\2018072107484972392.jpg', null, '2018-07-21 07:48:49', '2018-07-21 07:48:49', '1', null);
INSERT INTO `tb_shop` VALUES ('8', '1', '2', '1', '测试店铺3', 'test3', 'tset3', 'test3', '\\upload\\item\\shop\\8\\2018090315401920033.jpg', null, '2018-07-21 23:34:23', '2018-09-03 15:40:20', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('9', '1', '2', '1', '测试店铺3', 'test3', 'tset3', 'test3', '\\upload\\item\\shop\\9\\2018072123474454594.jpg', null, '2018-07-21 23:47:45', '2018-07-21 23:47:45', '1', '审核中');
INSERT INTO `tb_shop` VALUES ('10', '1', '2', '2', '1', '1', '1', '1', '\\upload\\item\\shop\\10\\2018072323433975420.jpg', null, '2018-07-23 23:43:40', '2018-07-23 23:43:40', '1', null);

-- ----------------------------
-- Table structure for `tb_shop_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_category`;
CREATE TABLE `tb_shop_category` (
  `shop_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_category_name` varchar(100) NOT NULL DEFAULT '',
  `shop_category_desc` varchar(1000) DEFAULT '',
  `shop_category_img` varchar(2000) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`),
  KEY `fk_shop_category_self` (`parent_id`),
  CONSTRAINT `fk_shop_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_shop_category` (`shop_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_category
-- ----------------------------
INSERT INTO `tb_shop_category` VALUES ('1', '咖啡奶茶', '咖啡奶茶', '\\upload\\item\\shop\\1\\2018072323425411827.jpg', '1', null, null, null);
INSERT INTO `tb_shop_category` VALUES ('2', '美容美发', '理发店', '\\upload\\item\\shop\\1\\2018072215294797048.jpg', '0', null, null, '4');
INSERT INTO `tb_shop_category` VALUES ('3', '咖啡', '测试类别', '\\upload\\item\\shop\\1\\2018072215294797048.jpg', '2', null, null, '1');
INSERT INTO `tb_shop_category` VALUES ('4', '二手市场', '二手商品交易', '\\upload\\item\\shop\\1\\2018072215294797048.jpg', '0', null, null, null);

-- ----------------------------
-- Table structure for `tb_wechat_auth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wechat_auth
-- ----------------------------
