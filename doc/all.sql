-- test表
drop table if exists 'test';
create table 'test' (
                        'id' bigint not null comment 'id',
                        'name' varchar (50) comment '名称',
    'password' varchar (50) comment '密码',
    primary key ('id')
    ) engine = innodb default charset = utf8mb4 comment = '测试';
insert into
    'test' (id, name, password) value (1, '测试', 'password');

-- demo表
drop table if exists 'demo';
create table 'demo' (
                        'id' bigint not null comment 'id',
                        'name' varchar (50) comment '名称',
    primary key ('id')
    ) engine = innodb default charset = utf8mb4 comment = '测试';
insert into
    'test' (id, name) value (1, '测试');

-- ebook表
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook` (
                         `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
                         `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
                         `category1_id` bigint(0) NULL DEFAULT NULL COMMENT '分类1',
                         `category2_id` bigint(0) NULL DEFAULT NULL COMMENT '分类2',
                         `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
                         `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
                         `doc_count` int(0) NULL DEFAULT NULL COMMENT '文档数',
                         `view_count` int(0) NULL DEFAULT NULL COMMENT '阅读数',
                         `vote_count` int(0) NULL DEFAULT NULL COMMENT '点赞数',
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电子书' ROW_FORMAT = Dynamic;
INSERT INTO
    `ebook`
VALUES
    (1, 'Java编程思想', 1, 1, 'Java编程思想', NULL, 3, 3, 3);
INSERT INTO
    `ebook`
VALUES
    (2, 'Sql必知必会', 2, 1, 'Sql必知必会', NULL, 3, 3, 3);