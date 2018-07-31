/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.20 : Database - o2o
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`o2o` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `o2o`;

/*Table structure for table `tb_area` */

DROP TABLE IF EXISTS `tb_area`;

CREATE TABLE `tb_area` (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `last_edit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE KEY `UK_AREA` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_area` */

insert  into `tb_area`(`area_id`,`area_name`,`priority`,`create_time`,`last_edit_time`) values (1,'西苑',2,NULL,NULL),(2,'东苑',1,NULL,NULL),(3,'南苑',3,NULL,NULL),(4,'北苑',4,NULL,NULL);

/*Table structure for table `tb_head_line` */

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_head_line` */

insert  into `tb_head_line`(`line_id`,`line_name`,`line_link`,`line_img`,`priority`,`enable_status`,`create_time`,`last_edit_time`) values (1,'1','1','\\upload\\headtitle\\2017061320393452772.jpg',1,1,NULL,NULL),(2,'2','2','\\upload\\headtitle\\2017061320371786788.jpg',2,1,NULL,NULL),(3,'3','3','\\upload\\headtitle\\2017061320315746624.jpg',3,1,NULL,NULL),(4,'4','4','\\upload\\headtitle\\2017061320400198256.jpg',1,1,NULL,NULL);

/*Table structure for table `tb_local_auth` */

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

/*Data for the table `tb_local_auth` */

/*Table structure for table `tb_person_info` */

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

/*Data for the table `tb_person_info` */

insert  into `tb_person_info`(`user_id`,`name`,`profile_img`,`email`,`gender`,`enable_status`,`user_type`,`create_time`,`last_edit_time`) values (1,'测试','test','te','1',1,2,NULL,NULL);

/*Table structure for table `tb_product` */

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tb_product` */

insert  into `tb_product`(`product_id`,`product_name`,`product_desc`,`img_addr`,`normal_price`,`promotion_price`,`priority`,`create_time`,`last_edit_time`,`enable_status`,`product_category_id`,`shop_id`) values (1,'第二个产品','正式的商品123','upload\\item\\shop\\1\\2018072318352723342.jpg','22','12',543,NULL,'2018-07-24 10:49:52',1,2,1),(3,'测试1','描述1','test1',NULL,NULL,1,'2018-07-22 11:59:58','2018-07-22 11:59:58',1,1,1),(4,'测试2','描述2','test2',NULL,NULL,2,'2018-07-22 11:59:58','2018-07-22 11:59:58',1,1,1),(5,'测试3','描述3','test3',NULL,NULL,3,'2018-07-22 11:59:58','2018-07-24 10:43:14',1,1,1),(6,'苦味咖啡','苦中有乐','\\upload\\item\\shop\\1\\2018072810140211160.jpg','25','20',20,'2018-07-22 16:20:54','2018-07-28 10:14:02',1,7,1),(7,'ss','dsa','upload\\item\\shop\\1\\2018072221470099014.jpg','5','4',15,'2018-07-22 21:47:00','2018-07-24 11:18:05',1,6,1),(8,'优乐美奶茶','杯子连起来可绕地球一圈','\\upload\\item\\shop\\1\\2018072410482699382.jpg','51','41',152,'2018-07-22 21:47:13','2018-07-24 11:22:04',1,6,1),(9,'1','1','upload\\item\\shop\\1\\2018072221531537455.jpg','1','1',1,'2018-07-22 21:53:15','2018-07-22 21:53:15',1,NULL,1),(10,'测试1','描述1','test1',NULL,NULL,1,'2018-07-23 19:13:18','2018-07-23 19:13:18',1,1,1),(11,'测试2','描述2','test2',NULL,NULL,2,'2018-07-23 19:13:18','2018-07-23 19:13:18',1,1,1),(12,'测试3','描述3','test3',NULL,NULL,3,'2018-07-23 19:13:18','2018-07-23 19:13:18',1,1,1);

/*Table structure for table `tb_product_category` */

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

/*Data for the table `tb_product_category` */

insert  into `tb_product_category`(`product_category_id`,`product_category_name`,`priority`,`create_time`,`shop_id`) values (1,'店铺商品类别2',20,NULL,1),(2,'商品类别1',1,'2018-07-21 15:05:58',1),(5,'商品类别2',2,'2018-07-21 15:05:58',1),(6,'优质奶茶',100,NULL,1),(7,'苦品咖啡',200,NULL,1);

/*Table structure for table `tb_product_img` */

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `tb_product_img` */

insert  into `tb_product_img`(`product_img_id`,`img_addr`,`img_desc`,`priority`,`create_time`,`product_id`) values (7,'upload\\item\\shop\\1\\2018072221470192969.jpg',NULL,NULL,'2018-07-22 21:47:02',7),(9,'upload\\item\\shop\\1\\2018072221531553649.jpg',NULL,NULL,'2018-07-22 21:53:16',9),(20,'upload\\item\\shop\\1\\2018072318352844212.jpg',NULL,NULL,'2018-07-23 18:35:29',1),(21,'图片1','测试描述1',1,'2018-07-23 19:13:20',1),(22,'图片2','测试描述2',1,'2018-07-23 19:13:20',1),(23,'\\upload\\item\\shop\\1\\2018072410482745483.jpg','客官来一杯嘛',50,'2018-07-24 10:48:28',8),(24,'\\upload\\item\\shop\\1\\2018072810140285337.jpg',NULL,NULL,'2018-07-28 10:14:02',6),(25,'\\upload\\item\\shop\\1\\2018072810140239596.jpg',NULL,NULL,'2018-07-28 10:14:03',6);

/*Table structure for table `tb_shop` */

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `tb_shop` */

insert  into `tb_shop`(`shop_id`,`owner_id`,`area_id`,`shop_category_id`,`shop_name`,`shop_desc`,`shop_addr`,`phone`,`shop_img`,`priority`,`create_time`,`last_edit_time`,`enable_status`,`advice`) values (1,1,1,1,'暴漫主题奶茶店','以暴漫为主题的奶茶店，有趣又好喝','西苑5号店铺','15688889999','\\upload\\item\\shop\\1\\2018072015381258549.jpg',25,'2018-07-16 15:10:48','2018-07-20 15:38:13',1,'通过认证'),(26,1,2,5,'恐怖迷城','惊险刺激的迷城探险，挑战你的小心脏','东苑6号店铺','02988883333','\\upload\\item\\shop\\2\\2018072015255788373.png',21,'2018-07-16 20:34:04','2018-07-20 15:27:21',1,'通过认证'),(27,1,3,1,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',21,'2018-07-16 20:37:17','2018-07-20 15:27:21',1,'通过认证'),(28,1,2,3,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',2,'2018-07-16 23:49:52','2018-07-20 15:27:21',1,'通过认证'),(29,1,4,2,'卡布奇诺','风味独特的咖啡小店','北苑三号街255','02933336666','\\upload\\item\\shop\\29\\2018072809550811653.jpg',22,'2018-07-17 22:32:30','2018-07-28 09:55:09',1,'审核中'),(30,1,1,3,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',3,'2018-07-17 22:35:45','2018-07-20 15:27:21',1,'通过认证'),(31,1,4,1,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',3,'2018-07-17 22:41:17','2018-07-20 15:27:21',0,'审核中'),(32,1,2,4,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',3,'2018-07-17 22:53:20','2018-07-20 15:27:21',0,'审核中'),(33,1,3,1,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',88,'2018-07-18 10:38:37','2018-07-20 15:27:21',0,'审核中'),(34,1,2,1,'doi店铺名称','test3','tset3','test3','upload\\item\\shop\\1\\2018072015255788373.jpg',8,'2018-07-18 18:08:36','2018-07-20 15:27:21',0,'审核中');

/*Table structure for table `tb_shop_category` */

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_shop_category` */

insert  into `tb_shop_category`(`shop_category_id`,`shop_category_name`,`shop_category_desc`,`shop_category_img`,`priority`,`create_time`,`last_edit_time`,`parent_id`) values (1,'咖啡小店','咖啡奶茶店','test',1,NULL,NULL,2),(2,'咖啡奶茶','咖啡奶茶总有你喜欢','\\upload\\shopcategory\\2017060420464594520.png',99,NULL,NULL,NULL),(3,'二手市场','二手商品交易','test',1,NULL,NULL,2),(4,'休闲娱乐','休闲娱乐','\\upload\\shopcategory\\2017060422114076152.png',50,NULL,NULL,NULL),(5,'超级密室','密室求生','\\upload\\shopcategory\\2017060420500783376.png',60,NULL,NULL,NULL);

/*Table structure for table `tb_wechat_auth` */

DROP TABLE IF EXISTS `tb_wechat_auth`;

CREATE TABLE `tb_wechat_auth` (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(1024) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`),
  KEY `fk_wechatauth_profile` (`user_id`),
  CONSTRAINT `fk_wechatauth_profile` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_wechat_auth` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
