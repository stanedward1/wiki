/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`
(
    `id`   bigint(20) NOT NULL COMMENT 'id',
    `name` varchar(50) DEFAULT NULL COMMENT '名称',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='测试';

DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`         varchar(50)  DEFAULT NULL COMMENT '名称',
    `category1_id` bigint(20)   DEFAULT NULL COMMENT '分类1',
    `category2_id` bigint(20)   DEFAULT NULL COMMENT '分类2',
    `description`  varchar(255) DEFAULT NULL COMMENT '描述',
    `cover`        varchar(255) DEFAULT NULL COMMENT '封面',
    `doc_count`    int(11)      DEFAULT NULL COMMENT '文档数',
    `view_count`   int(11)      DEFAULT NULL COMMENT '阅读数',
    `vote_count`   int(11)      DEFAULT NULL COMMENT '点赞数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='电子书';

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`
(
    `id`       bigint(20) NOT NULL COMMENT 'id',
    `name`     varchar(50) DEFAULT NULL COMMENT '名称',
    `password` varchar(50) DEFAULT NULL COMMENT '密码',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='测试';

INSERT INTO `demo` (`id`, `name`)
VALUES (1, '测试');


INSERT INTO `ebook` (`id`, `name`, `category1_id`, `category2_id`, `description`, `cover`, `doc_count`, `view_count`,
                     `vote_count`)
VALUES (1, 'Java编程思想', 1, 1, 'Java编程思想', NULL, 3, 3, 3);
INSERT INTO `ebook` (`id`, `name`, `category1_id`, `category2_id`, `description`, `cover`, `doc_count`, `view_count`,
                     `vote_count`)
VALUES (2, 'Sql必知必会', 2, 1, 'Sql必知必会', NULL, 3, 3, 3);


INSERT INTO `test` (`id`, `name`, `password`)
VALUES (1, '测试', 'password');



/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;