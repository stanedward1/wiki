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

 Date: 11/08/2022 00:32:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`     bigint(20)                                             NOT NULL COMMENT 'id',
    `parent` bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '父id',
    `name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `sort`   int(11)                                                NULL     DEFAULT NULL COMMENT '顺序',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '分类'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category`
VALUES (10, 100, '视频课程', 10);
INSERT INTO `category`
VALUES (11, 10, '项目实战', 11);
INSERT INTO `category`
VALUES (12, 10, '免费课程', 12);
INSERT INTO `category`
VALUES (100, 0, '前端开发', 100);
INSERT INTO `category`
VALUES (101, 100, 'Vue', 101);
INSERT INTO `category`
VALUES (200, 0, 'Java', 200);
INSERT INTO `category`
VALUES (201, 200, '基础应用', 201);
INSERT INTO `category`
VALUES (501, 500, '服务器', 501);
INSERT INTO `category`
VALUES (502, 500, '开发工具', 502);
INSERT INTO `category`
VALUES (503, 500, '热门服务端语言', 503);
INSERT INTO `category`
VALUES (25897678806323200, 444555, '444555', 444555);
INSERT INTO `category`
VALUES (25918314278686720, 200, 'test1', 1);
INSERT INTO `category`
VALUES (25918407513870336, 10, 'test2', 1);
INSERT INTO `category`
VALUES (25918640541011968, 10, 'test3', 1);
INSERT INTO `category`
VALUES (25918962000859136, 0, '其他', 400);
INSERT INTO `category`
VALUES (25919133858271232, 25918962000859136, '啊啊啊', 401);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`
(
    `id`      bigint(20)                                            NOT NULL COMMENT '文档id',
    `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文档内容'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content`
VALUES (1,
        '<blockquote><p>Spring Boot 为简化 Spring 应用开发而生，Spring Boot 中的&nbsp;<strong>Boot</strong>&nbsp;一词，即为快速启动的意思。Spring Boot 可以在零配置情况下一键启动，简洁而优雅。</p></blockquote><p><span style=\"color: rgba(0, 0, 0, 0.85); font-size: 2em;\">Spring Boot 第一个项目</span><br></p><p><a target=\"_blank\"></a></p><h2>1. 前言</h2><p>Spring Boot 可以使用 Maven 构建，遵循 Maven 的项目结构规范，项目结构是模板化的，基本都一模一样。</p><p>模板化的东西可以自动生成，Spring 官方就提供了 Spring Initializr 。它能自动生成 Spring Boot 项目，我们直接导入到开发工具使用即可。</p><p><a target=\"_blank\"></a></p><h2>2. 生成 Spring Boot 项目</h2><p>打开 Spring Initializr 网址&nbsp;<code>http://start.spring.io</code>&nbsp;，根据我们项目的情况填入以下信息。</p><p><img src=\"http://img.mukewang.com/wiki/5ea6e30f0840264609220769.jpg\" alt=\"图片描述\"></p><p>Spring Initializr 生成 Spring Boot 项目</p><p>这是第一次接触 Spring Initializr ，我们来详细了解界面上选项的作用。</p><p><strong>1. 构建方式选择</strong>：此处我们选择 Maven Project 即可，表示生成的项目使用 Maven 构建。当然我们也可以发现，Spring Boot 项目亦可采用 Gradle 构建，目前 Spring Boot 主流的构建方式还是 Maven；<br><strong>2. 编程语言选择</strong>：此处选择 Java 即可；<br><strong>3. Spring Boot 版本选择</strong>： 2.x 版本与 1.x 版本还是有一些区别的，咱们学习肯定是选择 2.x 新版本。此处虽然选择了 2.2.6 版本，但是由于 2.2.6 版本刚推出没多久，国内一些 Maven 仓库尚不支持。后面我们手工改为 2.2.5 版本，便于使用国内 Maven 仓库快速构建项目；<br><strong>4. 所属机构设置</strong>：Group 表示项目所属的机构，就是开发项目的公司或组织。因为公司可能会重名，所以习惯上采用倒置的域名作为 Group 的值。例如慕课网的域名是&nbsp;<code>imooc.com</code>&nbsp;, 此处写&nbsp;<code>com.imooc</code>&nbsp;就行了；<br><strong>5. 项目标识设置</strong>：Artifact 是项目标识，用来区分项目。此处我们命名为&nbsp;<code>spring-boot-hello</code>&nbsp;，注意项目标识习惯性地采用小写英文单词，单词间加横杠的形式。比如 Spring Boot 官方提供的很多依赖，都是&nbsp;<code>spring-boot-starter-xxx</code>&nbsp;的形式；<br><strong>6. 项目名称设置</strong>：Name 是项目名称，保持与 Artifact 一致即可；<br><strong>7. 默认包名设置</strong>：Package name 是默认包名，保持默认即可；<br><strong>8. 打包方式选择</strong>：此处选择将项目打包为 Jar 文件；<br><strong>9. 添加项目依赖</strong>：此处不必修改，我们直接在 pom.xml 中添加依赖更加方便。注意 pom.xml 就是 Maven 的配置文件，可以指定我们项目需要引入的依赖；<br><strong>10. 生成项目</strong>：点击 Generate 按钮，即可按我们设置的信息生成 Spring Boot 项目了。</p>');
INSERT INTO `content`
VALUES (2,
        '<h2 id=\"cro7w\">相关软件已传到QQ群文件中</h2><p><ul><li><font size=\"3\">jdk-8u221-windows-x64.exe<br></font></li><li><font size=\"3\">ideaIU-2019.2.3.exe<br></font></li><li><font size=\"3\">Git-2.23.0-64-bit.exe<br></font></li><li><font size=\"3\">mysql-installer-community-5.7.27.0.msi<br></font></li><li><font size=\"3\">jdk-8u261-linux-x64.tar.gz<br></font></li></ul></p><h2 id=\"1eyks\">源码下载</h2><p><ul><li><p><font size=\"3\">关于慕课网GIT说明：<a href=\"https://www.imooc.com/help/detail/111\">https://www.imooc.com/help/detail/111</a></font></p></li><li><p><font size=\"3\">使用下面的命令将源码从远程仓库拉取到本地，需要本地提前安装好git</font></p></li></ul><pre><code><font size=\"3\">git clone https://git.imooc.com/coding-474/jiawawiki.git\n会配置ssh的，可以用ssh:\ngit clone ssh://git@git.imooc.com:80/coding-474/jiawawiki.git\n</font></code></pre><ul><li><font size=\"3\">数据库初始化脚本已传到QQ群中</font></li></ul></p><h2>项目初始化</h2><p><ul><li><font size=\"3\">需要本地安装好idea, nodejs，jdk1.8, mysql8.0/5.7, navicat（数据库可视化工具）</font></li><li><font size=\"3\">将下载好的源码，用idea打开</font></li><li><font size=\"3\">刷新maven依赖</font></li><li><font size=\"3\">安装vue cli，参照课程4-3</font></li><li><font size=\"3\">初始化web模块</font></li></ul><pre><code><font size=\"3\">cd web\nnpm install\n</font></code></pre><ul><li><font size=\"3\">新建数据库参照课程3-2，数据库配置在application.properties</font></li><li><font size=\"3\">数据库初始脚本从QQ群文件中下载</font></li></ul></p><h2>项目启动</h2><p><ul><li><font size=\"3\">启动服务端：WikiApplication</font></li><li><font size=\"3\">启动前端网站：web\\package.json</font></li></ul></p><h2>页面访问</h2><p><ul><li><font size=\"3\">网站地址:&nbsp;<a href=\"http://localhost:8080/\">http://localhost:8080</a><br>初始用户名密码：test/test</font></li></ul></p>');
INSERT INTO `content`
VALUES (3, '');
INSERT INTO `content`
VALUES (4, '');
INSERT INTO `content`
VALUES (5, '');
INSERT INTO `content`
VALUES (6, '');
INSERT INTO `content`
VALUES (8003033552261120, '');
INSERT INTO `content`
VALUES (8469906341367808, '<p>test</p>');
INSERT INTO `content`
VALUES (8495756419928064, '');
INSERT INTO `content`
VALUES (8495828981387264,
        '<p><b><font size=\"3\" style=\"\" color=\"#f9963b\">视频课程主页：<a href=\"https://coding.imooc.com/class/416.html\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">https://coding.imooc.com/class/416.html</a></font></b></p><p><br></p><h1>全网稀缺的在线视频系统开发课程<br>仿慕课网构建视频学习网站+管理后台</h1><h4>真正意义上的“完整”项目实战&nbsp;&nbsp;&nbsp;&nbsp;从0开始搭建你的高质量作品</h4><p><br></p><p>项目前台视频学习网站展示<br>（一套代码，多端适配）</p><p><br></p><p>管理后台效果展示</p><p><a href=\"http://www.courseimooc.com/list\" target=\"_blank\">点击体验项目</a></p><h1>企业级项目真实开发流程&nbsp;&nbsp;&nbsp;业务场景一课通</h1><h4>在线视频课程系统功能点全实现&nbsp;&nbsp;&nbsp;&nbsp;体验大厂适用的项目开发流程</h4><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><h1>热门主流框架+全栈技术知识点&nbsp;&nbsp;&nbsp;实战中夯实技能</h1><h4>手把手教学&nbsp;&nbsp;&nbsp;&nbsp;一课掌握前后端技术&nbsp;&nbsp;&nbsp;&nbsp;了解架构设计思维</h4><p><br></p><h1>学员专享增值服务</h1><p><i></i></p><p>问答专区<br>讲师集中答疑</p><p>关于课程的问题都可在问答区随时<br>提问,讲师会进行集中答疑</p><p><i></i></p><p>源码开放<br>整套代码下载</p><p>课程案例代码完全开放给你，你可<br>以根据所学知识，自行修改、优化</p><p><i></i></p><p>讲师精选<br>高效组件/工具</p><p>可直接应用于其它项目中，提升你<br>的开发效率</p><p>适合人群</p><p>想要进入大厂工作的初中级Java开发人员；<br>对全栈技术有需求的开发人员；<br>想要做技术创业的人员</p><p>技术储备要求</p><p>1. Java基础<br>2.MySQL基础<br>3.HTML + CSS+ JavaScript基础</p>');
INSERT INTO `content`
VALUES (9101475879981056, '<p>111</p>');
INSERT INTO `content`
VALUES (9101726032465920, '');
INSERT INTO `content`
VALUES (9102244196782080, '<p>1111</p>');
INSERT INTO `content`
VALUES (11695598977814528, '<p>示例网站：wiki.courseimooc.com，test/test</p>');
INSERT INTO `content`
VALUES (11695846093623296, '<p><br></p><ul></ul><ul></ul>');
INSERT INTO `content`
VALUES (11695957502726144,
        '<p>以下这些软件都可以在QQ群里下载</p><p><b>ideaIU-2019.2.3.exe</b><br>推荐先学一下免费课：<a href=\"https://www.imooc.com/learn/1160\" target=\"_blank\">《开发工具IDEA从入门到爱不释手》</a><br><br><b>Mysql8.0 / 5.7</b><br><br><b>Git-2.23.0-64-bit.exe</b><br><br><b>node-v12.10.0-x64.msi</b><br><br><b>jdk-8u221-windows-x64.exe / jdk-8u202-linux-x64.tar.gz</b></p>');
INSERT INTO `content`
VALUES (11696744987496448, '');
INSERT INTO `content`
VALUES (11697648637710336, '');
INSERT INTO `content`
VALUES (11697820608368640, '');
INSERT INTO `content`
VALUES (11698009515626496, '');
INSERT INTO `content`
VALUES (11698170870501376, '');
INSERT INTO `content`
VALUES (11698779396902912, '');
INSERT INTO `content`
VALUES (11698954530066432, '');
INSERT INTO `content`
VALUES (11699069433024512, '');
INSERT INTO `content`
VALUES (15607155277303808, '');
INSERT INTO `content`
VALUES (15607919550795776,
        '<ul><li><h5>第1章 课程导学与准备工作</h5><p>本章主要介绍为何要带大家学习一个前后端分离的企业级在线视频系统课程，通过本课程学习不仅会掌握Spring Cloud+Vue前后端分离架构，还会掌握到视频文件的处理，包括文件上传、断点续传、文件存储、视频点播、视频加密等核心技术，之后会为大家介绍本课程内容具体安排，最后给出如何学好这门课程的一些学习建议。希望大家...</p><p>共 7 节 (70分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;1-1 课前必读（不看会错过一个亿）</li><li><i></i>&nbsp;1-2 课程介绍及学习指导 (15:46)</li><li><i></i>&nbsp;1-3 线上环境体验 (10:38)</li><li><i></i>&nbsp;1-4 代码生成器初体验 (14:38)</li><li><i></i>&nbsp;1-5 开发环境准备 (10:58)</li><li><i></i>&nbsp;1-6 总体架构介绍 (07:33)</li><li><i></i>&nbsp;1-7 如何利用源码进行学习 (09:50)</li></ul></li><li><i></i><h5>第2章 使用Maven搭建SpringCloud项目</h5><p>本章将介绍使用Maven搭建SpringCloud微服务项目，学习微服务核心组件：注册中心Eureka和路由Gateway。</p><p>共 3 节 (47分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;2-1 使用Eureka搭建注册中心 (14:36)</li><li><i></i>&nbsp;2-2 搭建业务模块-system (18:58)</li><li><i></i>&nbsp;2-3 搭建路由模块-gateway (13:05)</li></ul></li><li><i></i><h5>第3章 SpringBoot项目技术整合</h5><p>本章将介绍单个SpringBoot的纯后端应用的搭建，集成Mybatis框架及代码生成器，并集成热部署DevTools，学习单个应用的环境搭建及提高开发效率的准备。</p><p>共 4 节 (79分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;3-1 集成持久层框架Mybatis (22:31)</li><li><i></i>&nbsp;3-2 项目优化 (16:42)</li><li><i></i>&nbsp;3-3 搭建服务模块-server (20:20)</li><li><i></i>&nbsp;3-4 集成mybatis generator (18:33)</li></ul></li><li><i></i><h5>第4章 使用Vue cli 4搭建管理控台</h5><p>本章将介绍Vue cli和bootstrap的使用。Vue是MVVM框架，其代码结构类似于Angular、微信小程序。Bootstrap是一个响应式框架，一套代码可适应PC，手机屏幕。本章使用Vue cli 4 + Bootstrap 3搭建控台管理应用，学习单页面应用搭建及响应式设计。...</p><p>共 4 节 (85分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;4-1 使用vue cli创建admin项目 (14:13)</li><li><i></i>&nbsp;4-2 集成bootstrap后台管理模板ace (25:30)</li><li><i></i>&nbsp;4-3 集成路由vue-router (18:04)</li><li><i></i>&nbsp;4-4 控台欢迎页面开发 (26:33)</li></ul></li><li><i></i><h5>第5章 单表管理功能前后端开发</h5><p>本章将演示控台单表增删改查的前后端开发，重点学习前后端数据交互，Vue ajax库axios的使用，使用Vue自定义组件制作分页组件，Mybatis分页插件pagehelper的使用等功能。介绍常用的公共组件的使用，包括前端确认框、提示框、等待框，后端复制工具类、统一日志AOP等。...</p><p>共 9 节 (199分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;5-1 大章列表查询功能开发1 (21:27)</li><li><i></i>&nbsp;5-2 大章列表查询功能开发2 (19:48)</li><li><i></i>&nbsp;5-3 大章列表查询功能开发3 (22:10)</li><li><i></i>&nbsp;5-4 分页功能开发 (19:28)</li><li><i></i>&nbsp;5-5 前端分页组件的使用 (20:51)</li><li><i></i>&nbsp;5-6 增加新增大章功能 (27:04)</li><li><i></i>&nbsp;5-7 修改删除大章功能 (19:14)</li><li><i></i>&nbsp;5-8 集成前端通用组件 (23:42)</li><li><i></i>&nbsp;5-9 代码优化 (24:50)</li></ul></li><li><i></i><h5>第6章 通用代码生成器开发</h5><p>本章将演示代码生成器的制作，学习模板引擎freemarker的使用。通过代码生成器可以快速生成dto、service、controller和vue界面代码，再配合上mybatis generator，可以快速完成单表的增删改查管理功能，极大的提高开发效率。另外，本章的知识也可应用于静态页面生成、导出复杂excel等涉及文件生成的场景。...</p><p>共 8 节 (125分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;6-1 代码生成器原理介绍 (06:54)</li><li><i></i>&nbsp;6-2 controller层和service层代码生成 (16:16)</li><li><i></i>&nbsp;6-3 dto层代码生成 (14:56)</li><li><i></i>&nbsp;6-4 前端vue界面代码生成 (19:30)</li><li><i></i>&nbsp;6-5 字段校验和通用字段的处理 (22:25)</li><li><i></i>&nbsp;6-6 前端枚举代码生成 (24:40)</li><li><i></i>&nbsp;6-7 生成器综合示例 (15:16)</li><li><i></i>&nbsp;6-8 生成器升级作业 (04:52)</li></ul></li><li><i></i><h5>第7章 核心业务功能开发</h5><p>本章将演示核心业务功能开发，包括课程、章、节、分类的管理功能，学习前端页面跳转及参数传递，Vue过滤器，前端树形展示插件zTree，富文本框的使用，Spring事务，通用排序功能解决方案等。</p><p>共 7 节 (161分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;7-1 课程管理功能开发 (29:27)</li><li><i></i>&nbsp;7-2 课程时长的保存和显示 (18:51)</li><li><i></i>&nbsp;7-3 分类管理功能开发 (27:14)</li><li><i></i>&nbsp;7-4 课程和分类关联保存和显示 (27:19)</li><li><i></i>&nbsp;7-5 课程内容功能开发 (17:32)</li><li><i></i>&nbsp;7-6 课程代码优化 (18:25)</li><li><i></i>&nbsp;7-7 讲师管理功能开发 (21:35)</li></ul></li><li><i></i><h5>第8章 文件上传功能开发</h5><p>本章将演示文件模块的开发，会使用SpringBoot + Vue完成文件上传功能，上传的图片支持实时预览显示。文件上传是系统操作中常见的功能，文件有大有小，不可避免带来带宽的问题，单独的文件模块很好的解决这个问题。</p><p>共 8 节 (111分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;8-1 完成基本的文件上传功能 (17:08)</li><li><i></i>&nbsp;8-2 讲师头像的保存与显示 (09:49)</li><li><i></i>&nbsp;8-3 文件上传组件开发1 (11:27)</li><li><i></i>&nbsp;8-4 文件上传组件开发2 (12:42)</li><li><i></i>&nbsp;8-5 增加文件管理功能1 (11:16)</li><li><i></i>&nbsp;8-6 增加文件管理功能2 (11:15)</li><li><i></i>&nbsp;8-7 文件上传组件的使用 (16:22)</li><li><i></i>&nbsp;8-8 作业讲解：课程内容中增加文件管理 (20:07)</li></ul></li><li><i></i><h5>第9章 大文件断点续与极速秒传</h5><p>本章将在上一章的基础上增加大文件断点续传功能。作为一个视频网站，一个文件从几十M到上G，上传一个大文件受网络影响很大，一次上传成功的几率很小，为此我们会在本章完善文件上传功能，支持断点续传并且上传文件时，检查文件是否上传过实现极速秒传。...</p><p>共 6 节 (99分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;9-1 分片传输的试探 (13:18)</li><li><i></i>&nbsp;9-2 分片上传功能开发1 (19:33)</li><li><i></i>&nbsp;9-3 分片上传功能开发2 (23:45)</li><li><i></i>&nbsp;9-4 分片合并功能开发 (13:07)</li><li><i></i>&nbsp;9-5 分片检查与极速秒传 (24:55)</li><li><i></i>&nbsp;9-6 文件上传流程图 (03:35)</li></ul></li><li><i></i><h5>第10章 基于阿里云OSS的文件上传</h5><p>在线视频课程的核心内容就是视频，保障视频不外泄是程序的重中之重，所以我们需要对视频做加密处理，本章我们选择阿里云视频加密，阿里云视频点播是对OSS的包装，支持防盗链和视频加密。</p><p>共 6 节 (86分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;10-1 阿里云OSS简介 (10:14)</li><li><i></i>&nbsp;10-2 基于OSS接口的文件上传 (20:06)</li><li><i></i>&nbsp;10-3 阿里云视频点播服务介绍 (10:13)</li><li><i></i>&nbsp;10-4 基于OSS原生SDK上传视频到点播1 (19:51)</li><li><i></i>&nbsp;10-5 基于OSS原生SDK上传视频到点播2 (08:57)</li><li><i></i>&nbsp;10-6 视频授权播放功能开发 (16:20)</li></ul></li><li><i></i><h5>第11章 用户管理与登录</h5><p>本章将演示用户管理及控台登录功能的开发，登录拦截是一个管理控台最基本的权限拦截，防止出现未登录用户直接访问控台界面或接口，同时保障系统内部用户的信息安全，介绍单点登录功能的开发，单点登录SSO（Single Sign On）在大型网站设计中非常常见，用户只需要登录一次就可以访问所有相互信任的应用系统，是提升用户体...</p><p>共 8 节 (145分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;11-1 增加用户管理功能 (22:17)</li><li><i></i>&nbsp;11-2 密码的加密传输与加密存储 (20:05)</li><li><i></i>&nbsp;11-3 基本的登录功能开发 (21:41)</li><li><i></i>&nbsp;11-4 退出登录与记住登录 (20:41)</li><li><i></i>&nbsp;11-5 增加登录图形验证码 (17:02)</li><li><i></i>&nbsp;11-6 单点登录功能开发 (18:01)</li><li><i></i>&nbsp;11-7 前后端登录拦截 (17:49)</li><li><i></i>&nbsp;11-8 用户登录流程图 (06:51)</li></ul></li><li><i></i><h5>第12章 通用权限设计</h5><p>本章演示通用权限功能开发，不依赖任何使用第三方框架，使用经典的资源、角色、用户关联，灵活且维护，可以细粒度的控制菜单、按钮、接口的权限，适用于通用后台管理系统的权限管理。</p><p>共 5 节 (106分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;12-1 通用权限解决方案介绍 (15:53)</li><li><i></i>&nbsp;12-2 资源配置管理 (24:27)</li><li><i></i>&nbsp;12-3 角色权限管理 (27:46)</li><li><i></i>&nbsp;12-4 登录时获取资源权限 (17:17)</li><li><i></i>&nbsp;12-5 权限拦截功能开发 (19:51)</li></ul></li><li><i></i><h5>第13章 网站开发</h5><p>本章将制作用于学员使用的网站，学习BootStrap的网站模板的使用，可以让程序员即使不会美工也可以写出漂亮的网站。</p><p>共 13 节 (206分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;13-1 网站模块的搭建 (09:33)</li><li><i></i>&nbsp;13-2 集成bootstrap官方模板 (15:06)</li><li><i></i>&nbsp;13-3 首页开发-1 (12:45)</li><li><i></i>&nbsp;13-4 首页开发-2 (11:39)</li><li><i></i>&nbsp;13-5 课程列表页面开发 (14:06)</li><li><i></i>&nbsp;13-6 分类筛选功能开发 (21:21)</li><li><i></i>&nbsp;13-7 课程详情页面开发 (16:16)</li><li><i></i>&nbsp;13-8 章节显示与视频播放 (19:54)</li><li><i></i>&nbsp;13-9 增加会员注册功能 (15:35)</li><li><i></i>&nbsp;13-10 增加登录与退出登录功能 (23:59)</li><li><i></i>&nbsp;13-11 增加发送短信验证码功能 (16:59)</li><li><i></i>&nbsp;13-12 完善登录注册校验功能 (19:03)</li><li><i></i>&nbsp;13-13 增加立即报名功能 (08:54)</li></ul></li><li><i></i><h5>第14章 项目优化</h5><p>至此整个项目的主框架和主业务都开发完成了，这一章将对项目做一些优化，比如控台报表显示，spring boot多环境配置，缓存的使用等。</p><p>共 4 节 (40分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;14-1 项目初始化 (06:40)</li><li><i></i>&nbsp;14-2 控台欢迎页开发 (11:37)</li><li><i></i>&nbsp;14-3 前后端多环境配置 (14:37)</li><li><i></i>&nbsp;14-4 前后端缓存的使用 (06:25)</li></ul></li><li><i></i><h5>第15章 课程总结</h5><p>本章将带大家回顾总结课程重点难点，在课程问答区老师等着与你进一步交流，有问题欢迎大家到课程问答区提问。</p><p>共 1 节 (4分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;15-1 课程总结 (03:44)</li></ul></li><li><i></i><h5>第16章 项目功能升级</h5><p>本章是对课程做的升级，核心是对部分功能升级优化，比如优化验证码的清晰度，优化登录token超时的问题，关闭播放器模态框时停止播放，还会分享学习Vue事件总线、Vue新增属性的数据绑定等新的技能。</p><p>共 7 节 (86分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;16-1 已提交的代码讲解 (11:23)</li><li><i></i>&nbsp;16-2 验证码图片清晰度优化 (05:37)</li><li><i></i>&nbsp;16-3 Vue CLI多环境编译 (14:55)</li><li><i></i>&nbsp;16-4 新增视频时没有触发绑定 (07:35)</li><li><i></i>&nbsp;16-5 关闭播放器模态框时停止播放 (19:24)</li><li><i></i>&nbsp;16-6 登录token超时优化 (12:26)</li><li><i></i>&nbsp;16-7 Vue事件总线使用案例 (13:54)</li></ul></li><li><i></i><h5>第17章 生产打包与发布</h5><p>本章是对课程做的升级，核心是掌握如何将整个项目发布到生产环境，通过外网来访问，项目演示地址：www.courseimooc.com，控台地址：admin.courseimooc.com 测试用户test/test。</p><p>共 11 节 (167分钟)&nbsp;收起列表</p><ul><li><i></i>&nbsp;17-1 注册中心&amp;配置中心Nacos (14:21)</li><li><i></i>&nbsp;17-2 注册中心&amp;配置中心Nacos2 (13:08)</li><li><i></i>&nbsp;17-3 阿里云部署方案介绍 (03:28)</li><li><i></i>&nbsp;17-4 RDS购买与配置 (17:09)</li><li><i></i>&nbsp;17-5 ECS购买与配置 (12:29)</li><li><i></i>&nbsp;17-6 JDK安装与Nacos安装 (14:10)</li><li><i></i>&nbsp;17-7 后台模块打包与发布1 (14:50)</li><li><i></i>&nbsp;17-8 后台模块打包与发布2 (17:44)</li><li><i></i>&nbsp;17-9 Nginx安装与Vue项目发布 (20:17)</li><li><i></i>&nbsp;17-10 域名配置1 (16:15)</li><li><i></i>&nbsp;17-11 域名配置2 (22:36)</li></ul></li></ul>');
INSERT INTO `content`
VALUES (15608974929956864,
        '<p><br></p><blockquote><p>面试是每个程序员都逃不过的一环。在我面试过的程序员中，有一半的程序员都描述不好自己做过的项目，有些都讲不到3分钟就结束了，听完我都不知道这个项目是做什么的，所以，决定写下这遍手记，希望对正在找工作的你有所帮助。</p><p><br></p></blockquote><p>在面试过程中，程序员都需要介绍自己做过的项目，有的是在工作中做过的，有的是业余时间完成的，有的是团队合作完成的，有的是个人独立完成的。丰富的开场是赢下面试的基础。我总结了如下几个方面的项目介绍流程，供大家参考：</p><h2>项目描述</h2><p>这一部分可以先总后分，总体介绍下描述下这个项目是做什么的，是否已上线，用户量有多大，然后介绍这个项目分为了哪些模块，如果是微服务，那可以介绍下有哪些应用。这一部分可以让面试官对你做的项目有个大体的了解，有些公司对行业有要求，比如支付公司、银行一般都要求有支付行业的项目经验。</p><h2>团队组成</h2><p>可以这样说：这个项目，加上我，总共多少人，其中几个是开发，几个是测试。也可以说几个前端，几个后端。<br>这一部分可以让面试官了解你这个项目的规模，参与规模大的项目肯定比规模小的项目有优势。</p><h2>角色担当</h2><p>可以这样说：我在团队里担当核心（前端、后端）开发，负责核心模块（核心功能）的开发，比如权限管理模块、登录注册功能、文件上传等。</p><h2>技术架构</h2><p>接着，可以介绍项目中用到的技术，前端用了xx框架，后端用了xx框架，持久层用了xx框架，数据库用的xxx。中间件用到了redis等，除了框架，还可以介绍一些工程化技术，比如jar包依赖使用maven，代码管理使用git等</p><p><iframe src=\"https://www.bilibili.com/video/BV1p4411P7V3\"></iframe></p><p><br></p><p><br></p><p><br></p><h2>场景解决方案</h2><p>当你介绍完上面的技术架构后，面试官可以会问你：</p><blockquote><p>redis在什么场景中用到？为什么要用redis？<br>为什么用git，不用svn？</p></blockquote><p>所以我们需要提前准备好一些场景，描述一下用什么技术解决什么业务需求。<br>每个项目的场景都不太一样，需要结合各自的项目做准备。<br>比如电商项目，可能有添加购物车，支付，抢购秒杀等场景。<br>比如后台管理系统，可能有单点登录、报表导出等场景。</p><p>以上就是项目介绍的通用框架，在简历中，我们也可以用上面介绍的这个框架来写【项目介绍】。</p><hr><p>很多同学在学习了<a href=\"https://coding.imooc.com/class/416.html?mc_marking=4b3b21b3ff8dd6fc8b2a3fea17e0572c&amp;mc_channel=shouji\">《Spring Cloud + Vue 前后端分离 开发企业级在线视频课程系统》</a>这门课后，都想将这个项目写到简历中，带到面试里，但是不知道该如何介绍。下面我们就以这个项目为例，看看如何介绍这个项目。</p><h2>项目描述</h2><p>这是一个类似慕课网的在线视频课程项目，也可以作为网校平台，项目分为三大块，前端网站+管理控台+服务端。<br><strong>【管理控台】</strong>：供内部运营人员使用，用于管理课程、章节、讲师等核心精选信息，也包含了用户资源权限等系统管理。<br><strong>【前端网站】</strong>：供网站会员使用，可以报名课程之后开始学习课程。<br><strong>【服务端】</strong>：为管理控台和前端网站提供各种接口，具体分为了注册中心、网关路由、系统模块、业务模块、文件模块、公共模块，共6个模块。</p><h2>技术架构</h2><p><img src=\"https://img1.sycdn.imooc.com/5ed765230001b80911930862.png\" alt=\"图片描述\"><br>整个项目采用目前最热门的前后端分离架构<br>管理控台和前端网站使用前端框架Vue CLI<br>UI使用响应式UI Bootstrap，一套页面兼容PC、PAD、移动端<br>服务端使用微服务框架Spring Cloud<br>持久层使用Mybatis框架<br>数据库使用Mysql<br>中间件使用了Redis<br>Jar包管理使用Maven<br>代码管理使用Git。<br>（以上这些技术都是目前企业级项目开发中常用的，需要熟练掌握）<br>同时项目中还用到了阿里云的服务，比如OSS服务，用来存储图片视频；视频点播服务，用来对视频做加密转码并授权播放，保证视频安全。</p><h2>场景解决方案</h2><p><strong>代码生成器</strong>：自己制作了代码生成器，集成到项目中，使用freemarker模板引擎（课程中有介绍怎么制作代码生成器），用于生成service层、controller层，dto层和vue界面代码，配合上mybatis-generator生成持久层代码，极大的提高了开发效率。在一张表设计完成后，只要1分钟，就可完成单表的增删改查管理功能（包含界面）。<br><strong>单点登录</strong>：使用统一登录标识token+分布式缓存redis的方案，实现单点登录。<br><strong>短信验证码注册</strong>：包括了短信验证码生成和验证码校验，并对验证码的时效性做了控制，比如5分钟有效；同一手机号1分钟内只能发送一次验证码；验证码只能使用一次等。<br><strong>图片验证码登录</strong>：使用redis存储验证码，图片验码登录，可以有效防止撞库攻击、暴力破解，保障用户信息安全。<br><strong>权限管理</strong>：使用经典的用户+资源+角色的权限设计方案，适用于绝大多数项目的权限管理，纯手工打造，未使用任何现成的权限框架，代码没有盲区，安全，易扩展。<br><strong>文件上传</strong>：实现基本的Vue+SpringBoot文件上传功能<br><strong>分片上传</strong>：当文件较大时，文件上传受网络影响较大，容易失败。在上面基本的文件上传的基础上，扩展成分片上传，提高大文件的上传成功率。<br><strong>断点续传</strong>：在分片上传的基础上，再扩展出断点续传，当传到某一个分片失败了之后，下次再上传同一文件时，从余下的分片开始上传。<br><strong>极速秒传</strong>：对于同一个文件，上传过一次后，再次上传时，会直接提示极速秒传成功，提高用户体验。<br><strong>文件存储</strong>：项目中实现了两种文件存储方法，一是自己搭建文件服务器，二是使用阿里云OSS服务。（实际项目中推荐使用第二种，大大减少了运维工作）<br><strong>视频加密</strong>：作为视频网站，视频安全是核心功能，这里用到了阿里云的视频点播服务（慕课网也是用的阿里云的视频点播服务）。使用接口直接和阿里云对接，实现控台统一管理<br><strong>授权播放</strong>：视频经过加密后，需要授权，才能播放，这里我们使用阿里云aliplayer+阿里云授权接口，实现授权播放。</p><p>上面我举例了很多场景，实际在面试的时候，不一定要全部介绍，可以挑几个比较熟悉的着重介绍，其它的可以简单带过。</p><h2>团队组成和角色担当</h2><p>如果是一个人跟着课程一步一步做下来的，可以介绍整个项目从框架搭建到前后端代码开发，都是一个人完成的。</p><hr><p>另外，还要自己准备一些常见的面试题，比如：</p><blockquote><p>项目开发过程中遇到过什么问题？<br>这个需要平时积累了，将开发过程中，遇到过的比较难解决的点记录下来，可以这样回答：……这个问题解决后，很有成就感，成就感很重要，听起来有专研精神，不过只适合初中级程序员，高级程序员说成就感就有点掉价。</p></blockquote><blockquote><p>对我们公司有什么问题<br>这个需要提交了解要面试的公司的相关情况，至少让面试的人觉得你对他们公司还是有兴趣的，有提前了解。</p></blockquote><p>最后祝所有的程序员都能面试顺利！</p><p><br>作者：甲蛙<br>链接：https://www.imooc.com/article/305407<br>来源：慕课网<br>本文原创发布于慕课网 ，转载请注明出处，谢谢合作<br></p>');
INSERT INTO `content`
VALUES (15609426090266624,
        '<p>网站：<a href=\"http://www.courseimooc.com\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">http://www.courseimooc.com</a></p><p>控台：<a href=\"http://admin.courseimooc.com\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">http://admin.courseimooc.com</a><span style=\"font-size: 1em;\">，test/test</span></p>');
INSERT INTO `content`
VALUES (16136409765253120, '');
INSERT INTO `content`
VALUES (16136446662545408, '');
INSERT INTO `content`
VALUES (16136469433421824, '');
INSERT INTO `content`
VALUES (17072249370710016, '<p>11</p>');
INSERT INTO `content`
VALUES (17073294146670592, '');
INSERT INTO `content`
VALUES (17078742493040640, '');
INSERT INTO `content`
VALUES (18653571339915264,
        '<p><font color=\"#f9963b\" size=\"4\"><b>视频课程主页：<a href=\"https://www.imooc.com/learn/1160\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">https://www.imooc.com/learn/1160</a></b></font><br></p>');
INSERT INTO `content`
VALUES (18994136724148224,
        '<p><iframe src=\"//player.bilibili.com/player.html?aid=714347073&amp;bvid=BV11X4y1G7HZ&amp;cid=301844615&amp;page=1\" scrolling=\"no\" border=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\"> </iframe></p><p><br></p><p><b><font size=\"3\"><br></font></b></p><p><b><font size=\"3\">如果你还没用过云服务，那就落伍了！</font></b></p><p><b><font size=\"3\">每个程序员都应该有一个自己的线上作品</font></b></p><p><b><font size=\"3\">可以是个博客、在线笔记，也可以是像我们这个项目，一个WIKI知识库</font></b></p><p><b style=\"\"><font color=\"#f9963b\" style=\"\" size=\"3\"><br></font></b></p><p><b style=\"\"><font color=\"#f9963b\" style=\"\" size=\"3\">阿里云选购指导、优惠、代金券，可联系QQ：82144921</font></b><br></p><p><font size=\"3\"><b><font color=\"#f9963b\">自助优惠：</font><a href=\"https://partner.aliyun.com/shop/1704506477397431\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\">https://partner.aliyun.com/shop/1704506477397431</a></b></font></p><p><font size=\"3\" color=\"#c24f4a\"><b style=\"\"><br></b></font></p><p><font size=\"3\" color=\"#c24f4a\"><b style=\"\">还没注册过阿里云的可以先QQ联系，灰常便宜！！！</b></font></p><p><font color=\"#f9963b\" size=\"3\"><b><br></b></font></p>');
INSERT INTO `content`
VALUES (38925086106980352, '<p>随风起舞父亲围观围观围观围观前期高位人服务岗位岗位v吧问过我EVWEGG为个人个人</p>');
INSERT INTO `content`
VALUES (38925143120154624, '<p>1111111</p>');
INSERT INTO `content`
VALUES (38925316101640192, '<p>222222222222222222222222222呃呃呃呃呃呃呃饿2222222222222222222222222222222222</p>');
INSERT INTO `content`
VALUES (38925370484985856, '<p>222222222222222222222222222呃呃呃呃呃呃呃饿2222222222222222222222222222222222</p>');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`
(
    `id`   bigint(20)                                                   NOT NULL COMMENT 'id',
    `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '测试'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo`
VALUES (1, '测试');

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`
(
    `id`         bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT 'id',
    `ebook_id`   bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '电子书id',
    `parent`     bigint(20)                                             NOT NULL DEFAULT 0 COMMENT '父id',
    `name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
    `sort`       int(11)                                                NULL     DEFAULT NULL COMMENT '顺序',
    `view_count` int(11)                                                NULL     DEFAULT 0 COMMENT '阅读数',
    `vote_count` int(11)                                                NULL     DEFAULT 0 COMMENT '点赞数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 38925370484985858
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '文档'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO `doc`
VALUES (1, 1, 15609426090266624, '课程导学与准备工作', 1, 102, 3);
INSERT INTO `doc`
VALUES (2, 1, 1, 'README.md', 1, 59, 9);
INSERT INTO `doc`
VALUES (3, 1, 15609426090266624, '所有章节', 2, 16, 1);
INSERT INTO `doc`
VALUES (8495828981387264, 2, 0, '课程介绍', 1, 57, 4);
INSERT INTO `doc`
VALUES (11695598977814528, 1, 15608974929956864, '线上环境体验', 3, 19, 1);
INSERT INTO `doc`
VALUES (11695846093623296, 1, 1, '课程介绍与视频试看', 2, 31, 3);
INSERT INTO `doc`
VALUES (11695957502726144, 1, 1, '开发环境准备', 4, 14, 2);
INSERT INTO `doc`
VALUES (15607919550795776, 2, 15608974929956864, '章节介绍', 2, 38, 2);
INSERT INTO `doc`
VALUES (15608974929956864, 2, 0, '面试指南之项目介绍', 3, 25, 2);
INSERT INTO `doc`
VALUES (15609426090266624, 2, 15608974929956864, '示例网站', 4, 20, 4);
INSERT INTO `doc`
VALUES (17072249370710016, 4, 11695598977814528, 'test', 1, 5, 0);
INSERT INTO `doc`
VALUES (17073294146670592, 4, 15608974929956864, 'test11', 1, 9, 0);
INSERT INTO `doc`
VALUES (17078742493040640, 5, 8495828981387264, 'test', 1, 1, 0);
INSERT INTO `doc`
VALUES (18653571339915264, 3, 8495828981387264, '课程介绍', 1, 5, 0);
INSERT INTO `doc`
VALUES (18994136724148224, 1, 17072249370710016, '阿里云购买指导优惠', 0, 25, 2);
INSERT INTO `doc`
VALUES (26305926067785728, 1, 3, 'mytest', 1, NULL, NULL);
INSERT INTO `doc`
VALUES (38925086106980352, 1, 0, '一:java基础', 1, 10, 1);
INSERT INTO `doc`
VALUES (38925143120154624, 1, 0, '1111', 1111111, 5, 0);
INSERT INTO `doc`
VALUES (38925316101640192, 1, 0, '122222', 3333, 9, 1);
INSERT INTO `doc`
VALUES (38925370484985856, 1, 0, '5555555555', 3333, 9, 1);
INSERT INTO `doc`
VALUES (38925370484985857, 1, 38925086106980350, 'java基础test', 1, NULL, NULL);

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`
(
    `id`           bigint(20)                                              NOT NULL COMMENT 'id',
    `name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '名称',
    `category1_id` bigint(20)                                              NULL     DEFAULT NULL COMMENT '分类1',
    `category2_id` bigint(20)                                              NULL     DEFAULT NULL COMMENT '分类2',
    `description`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '描述',
    `cover`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '封面',
    `doc_count`    int(11)                                                 NOT NULL DEFAULT 0 COMMENT '文档数',
    `view_count`   int(11)                                                 NOT NULL DEFAULT 0 COMMENT '阅读数',
    `vote_count`   int(11)                                                 NOT NULL DEFAULT 0 COMMENT '点赞数',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '电子书'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO `ebook`
VALUES (1, 'SpringBoot知识体系+Vue', 200, 25918314278686720, 'SpringBoot知识体系+Vue3前后端分离实战WIKI知识库系统', '/image/cover1.png', 12,
        299, 24);
INSERT INTO `ebook`
VALUES (2, 'SpringCloud+Vue前后端分离', 10, 11, 'SpringCloud+Vue前后端分离 开发企业级在线视频课程系统', '/image/cover2.png', 4, 140, 12);
INSERT INTO `ebook`
VALUES (3, '开发工具IDEA从入门到爱不释手', 10, 12, '系统介绍如何高效的使用idea开发项目，从基本操作到高级进阶，是老师多年实战经验的总结', '/image/cover2.png', 1, 5, 0);
INSERT INTO `ebook`
VALUES (25627780888793088, '111', 25918962000859136, 25919133858271232, NULL, '/image/cover1.png', 16, 15, 15);
INSERT INTO `ebook`
VALUES (25631561886076928, '444', 200, 201, NULL, '/image/cover2.png', 16, 15, 15);

-- ----------------------------
-- Table structure for ebook_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `ebook_snapshot`;
CREATE TABLE `ebook_snapshot`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `ebook_id`      bigint(20) NOT NULL DEFAULT 0 COMMENT '电子书id',
    `date`          date       NOT NULL COMMENT '快照日期',
    `view_count`    int(11)    NOT NULL DEFAULT 0 COMMENT '阅读数',
    `vote_count`    int(11)    NOT NULL DEFAULT 0 COMMENT '点赞数',
    `view_increase` int(11)    NOT NULL DEFAULT 0 COMMENT '阅读增长',
    `vote_increase` int(11)    NOT NULL DEFAULT 0 COMMENT '点赞增长',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `ebook_id_date_unique` (`ebook_id`, `date`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 377
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '电子书快照表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ebook_snapshot
-- ----------------------------
INSERT INTO `ebook_snapshot`
VALUES (22, 1, '2021-02-15', 111, 29, 111, 3);
INSERT INTO `ebook_snapshot`
VALUES (23, 2, '2021-02-15', 75, 10, 75, 10);
INSERT INTO `ebook_snapshot`
VALUES (24, 3, '2021-02-15', 120, 23, 120, 23);
INSERT INTO `ebook_snapshot`
VALUES (25, 4, '2021-02-15', 1123, 22, 1123, 22);
INSERT INTO `ebook_snapshot`
VALUES (26, 5, '2021-02-15', 435, 22, 435, 22);
INSERT INTO `ebook_snapshot`
VALUES (27, 11685135305019392, '2021-02-15', 21, 4, 21, 4);
INSERT INTO `ebook_snapshot`
VALUES (28, 11685367409414144, '2021-02-15', 13, 5, 13, 5);
INSERT INTO `ebook_snapshot`
VALUES (29, 1, '2021-02-16', 136, 29, 25, 0);
INSERT INTO `ebook_snapshot`
VALUES (30, 2, '2021-02-16', 75, 10, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (31, 3, '2021-02-16', 321, 23, 201, 0);
INSERT INTO `ebook_snapshot`
VALUES (32, 4, '2021-02-16', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (33, 5, '2021-02-16', 435, 22, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (34, 11685135305019392, '2021-02-16', 21, 4, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (35, 11685367409414144, '2021-02-16', 13, 5, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (36, 1, '2021-02-17', 149, 29, 13, 0);
INSERT INTO `ebook_snapshot`
VALUES (37, 2, '2021-02-17', 84, 11, 9, 1);
INSERT INTO `ebook_snapshot`
VALUES (38, 3, '2021-02-17', 321, 23, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (39, 4, '2021-02-17', 14, 0, 14, 0);
INSERT INTO `ebook_snapshot`
VALUES (40, 5, '2021-02-17', 500, 0, 12, 0);
INSERT INTO `ebook_snapshot`
VALUES (41, 11685135305019392, '2021-02-17', 21, 4, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (42, 11685367409414144, '2021-02-17', 13, 5, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (50, 1, '2021-02-18', 149, 29, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (51, 2, '2021-02-18', 84, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (52, 3, '2021-02-18', 321, 23, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (53, 4, '2021-02-18', 14, 0, 4, 0);
INSERT INTO `ebook_snapshot`
VALUES (54, 5, '2021-02-18', 1, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (55, 11685135305019392, '2021-02-18', 21, 4, 2, 1);
INSERT INTO `ebook_snapshot`
VALUES (56, 11685367409414144, '2021-02-18', 13, 5, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (57, 1, '2021-02-19', 167, 30, 18, 1);
INSERT INTO `ebook_snapshot`
VALUES (58, 2, '2021-02-19', 101, 14, 17, 3);
INSERT INTO `ebook_snapshot`
VALUES (59, 3, '2021-02-19', 321, 23, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (60, 4, '2021-02-19', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (61, 5, '2021-02-19', 1, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (62, 11685135305019392, '2021-02-19', 21, 4, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (63, 11685367409414144, '2021-02-19', 13, 5, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (64, 1, '2021-02-20', 167, 30, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (65, 2, '2021-02-20', 101, 14, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (66, 3, '2021-02-20', 321, 23, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (67, 4, '2021-02-20', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (68, 5, '2021-02-20', 1, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (69, 11685135305019392, '2021-02-20', 21, 4, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (70, 11685367409414144, '2021-02-20', 13, 5, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (71, 1, '2021-02-21', 176, 20, 9, -10);
INSERT INTO `ebook_snapshot`
VALUES (72, 2, '2021-02-21', 105, 11, 4, -3);
INSERT INTO `ebook_snapshot`
VALUES (73, 3, '2021-02-21', 1, 0, -320, -23);
INSERT INTO `ebook_snapshot`
VALUES (74, 4, '2021-02-21', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (75, 5, '2021-02-21', 1, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (76, 11685135305019392, '2021-02-21', 21, 4, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (77, 11685367409414144, '2021-02-21', 13, 5, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (78, 1, '2021-02-22', 204, 18, 28, -2);
INSERT INTO `ebook_snapshot`
VALUES (79, 2, '2021-02-22', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (80, 3, '2021-02-22', 2, 0, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (81, 1, '2021-02-23', 223, 18, 19, 0);
INSERT INTO `ebook_snapshot`
VALUES (82, 2, '2021-02-23', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (83, 3, '2021-02-23', 2, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (84, 1, '2021-02-24', 246, 18, 23, 0);
INSERT INTO `ebook_snapshot`
VALUES (85, 2, '2021-02-24', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (86, 3, '2021-02-24', 3, 0, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (87, 1, '2021-02-25', 246, 18, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (88, 2, '2021-02-25', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (89, 3, '2021-02-25', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (90, 1, '2021-02-28', 246, 18, 246, 18);
INSERT INTO `ebook_snapshot`
VALUES (91, 2, '2021-02-28', 105, 11, 105, 11);
INSERT INTO `ebook_snapshot`
VALUES (92, 3, '2021-02-28', 3, 0, 3, 0);
INSERT INTO `ebook_snapshot`
VALUES (93, 1, '2021-03-01', 246, 18, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (94, 2, '2021-03-01', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (95, 3, '2021-03-01', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (96, 1, '2021-03-02', 246, 18, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (97, 2, '2021-03-02', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (98, 3, '2021-03-02', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (99, 1, '2021-03-03', 246, 18, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (100, 2, '2021-03-03', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (101, 3, '2021-03-03', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (102, 1, '2021-03-07', 247, 19, 247, 19);
INSERT INTO `ebook_snapshot`
VALUES (103, 2, '2021-03-07', 105, 11, 105, 11);
INSERT INTO `ebook_snapshot`
VALUES (104, 3, '2021-03-07', 3, 0, 3, 0);
INSERT INTO `ebook_snapshot`
VALUES (105, 1, '2021-03-08', 247, 19, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (106, 2, '2021-03-08', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (107, 3, '2021-03-08', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (108, 1, '2021-03-09', 247, 19, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (109, 2, '2021-03-09', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (110, 3, '2021-03-09', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (111, 1, '2021-03-10', 247, 19, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (112, 2, '2021-03-10', 105, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (113, 3, '2021-03-10', 3, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (114, 1, '2021-03-11', 259, 21, 12, 2);
INSERT INTO `ebook_snapshot`
VALUES (115, 2, '2021-03-11', 109, 11, 4, 0);
INSERT INTO `ebook_snapshot`
VALUES (116, 3, '2021-03-11', 4, 0, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (117, 1, '2021-03-12', 259, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (118, 2, '2021-03-12', 109, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (119, 3, '2021-03-12', 4, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (120, 1, '2021-03-13', 266, 21, 7, 0);
INSERT INTO `ebook_snapshot`
VALUES (121, 2, '2021-03-13', 109, 11, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (122, 3, '2021-03-13', 5, 0, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (123, 25627780888793088, '2021-03-13', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (124, 25631561886076928, '2021-03-13', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (126, 1, '2021-03-14', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (127, 2, '2021-03-14', 113, 11, 4, 0);
INSERT INTO `ebook_snapshot`
VALUES (128, 3, '2021-03-14', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (129, 25627780888793088, '2021-03-14', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (130, 25631561886076928, '2021-03-14', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (133, 1, '2021-03-15', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (134, 2, '2021-03-15', 132, 12, 19, 1);
INSERT INTO `ebook_snapshot`
VALUES (135, 3, '2021-03-15', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (136, 25627780888793088, '2021-03-15', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (137, 25631561886076928, '2021-03-15', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (140, 1, '2021-03-16', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (141, 2, '2021-03-16', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (142, 3, '2021-03-16', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (143, 25627780888793088, '2021-03-16', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (144, 25631561886076928, '2021-03-16', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (147, 1, '2021-03-17', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (148, 2, '2021-03-17', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (149, 3, '2021-03-17', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (150, 25627780888793088, '2021-03-17', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (151, 25631561886076928, '2021-03-17', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (154, 1, '2021-03-18', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (155, 2, '2021-03-18', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (156, 3, '2021-03-18', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (157, 25627780888793088, '2021-03-18', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (158, 25631561886076928, '2021-03-18', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (161, 1, '2021-03-20', 266, 21, 266, 21);
INSERT INTO `ebook_snapshot`
VALUES (162, 2, '2021-03-20', 132, 12, 132, 12);
INSERT INTO `ebook_snapshot`
VALUES (163, 3, '2021-03-20', 5, 0, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (164, 25627780888793088, '2021-03-20', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (165, 25631561886076928, '2021-03-20', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (168, 1, '2021-03-22', 266, 21, 266, 21);
INSERT INTO `ebook_snapshot`
VALUES (169, 2, '2021-03-22', 132, 12, 132, 12);
INSERT INTO `ebook_snapshot`
VALUES (170, 3, '2021-03-22', 5, 0, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (171, 25627780888793088, '2021-03-22', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (172, 25631561886076928, '2021-03-22', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (175, 1, '2021-03-23', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (176, 2, '2021-03-23', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (177, 3, '2021-03-23', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (178, 25627780888793088, '2021-03-23', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (179, 25631561886076928, '2021-03-23', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (182, 1, '2021-03-24', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (183, 2, '2021-03-24', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (184, 3, '2021-03-24', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (185, 25627780888793088, '2021-03-24', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (186, 25631561886076928, '2021-03-24', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (189, 1, '2021-03-25', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (190, 2, '2021-03-25', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (191, 3, '2021-03-25', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (192, 25627780888793088, '2021-03-25', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (193, 25631561886076928, '2021-03-25', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (196, 1, '2021-03-26', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (197, 2, '2021-03-26', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (198, 3, '2021-03-26', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (199, 25627780888793088, '2021-03-26', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (200, 25631561886076928, '2021-03-26', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (203, 1, '2021-03-27', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (204, 2, '2021-03-27', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (205, 3, '2021-03-27', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (206, 25627780888793088, '2021-03-27', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (207, 25631561886076928, '2021-03-27', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (210, 1, '2021-03-28', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (211, 2, '2021-03-28', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (212, 3, '2021-03-28', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (213, 25627780888793088, '2021-03-28', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (214, 25631561886076928, '2021-03-28', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (217, 1, '2021-03-29', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (218, 2, '2021-03-29', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (219, 3, '2021-03-29', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (220, 25627780888793088, '2021-03-29', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (221, 25631561886076928, '2021-03-29', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (224, 1, '2021-03-31', 266, 21, 266, 21);
INSERT INTO `ebook_snapshot`
VALUES (225, 2, '2021-03-31', 132, 12, 132, 12);
INSERT INTO `ebook_snapshot`
VALUES (226, 3, '2021-03-31', 5, 0, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (227, 25627780888793088, '2021-03-31', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (228, 25631561886076928, '2021-03-31', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (231, 1, '2021-04-01', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (232, 2, '2021-04-01', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (233, 3, '2021-04-01', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (234, 25627780888793088, '2021-04-01', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (235, 25631561886076928, '2021-04-01', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (238, 1, '2021-04-02', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (239, 2, '2021-04-02', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (240, 3, '2021-04-02', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (241, 25627780888793088, '2021-04-02', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (242, 25631561886076928, '2021-04-02', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (245, 1, '2021-04-03', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (246, 2, '2021-04-03', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (247, 3, '2021-04-03', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (248, 25627780888793088, '2021-04-03', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (249, 25631561886076928, '2021-04-03', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (252, 1, '2021-04-04', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (253, 2, '2021-04-04', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (254, 3, '2021-04-04', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (255, 25627780888793088, '2021-04-04', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (256, 25631561886076928, '2021-04-04', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (259, 1, '2021-04-05', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (260, 2, '2021-04-05', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (261, 3, '2021-04-05', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (262, 25627780888793088, '2021-04-05', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (263, 25631561886076928, '2021-04-05', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (266, 1, '2021-04-06', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (267, 2, '2021-04-06', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (268, 3, '2021-04-06', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (269, 25627780888793088, '2021-04-06', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (270, 25631561886076928, '2021-04-06', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (273, 1, '2021-04-07', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (274, 2, '2021-04-07', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (275, 3, '2021-04-07', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (276, 25627780888793088, '2021-04-07', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (277, 25631561886076928, '2021-04-07', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (280, 1, '2021-04-08', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (281, 2, '2021-04-08', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (282, 3, '2021-04-08', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (283, 25627780888793088, '2021-04-08', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (284, 25631561886076928, '2021-04-08', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (287, 1, '2021-04-09', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (288, 2, '2021-04-09', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (289, 3, '2021-04-09', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (290, 25627780888793088, '2021-04-09', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (291, 25631561886076928, '2021-04-09', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (294, 1, '2021-04-10', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (295, 2, '2021-04-10', 132, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (296, 3, '2021-04-10', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (297, 25627780888793088, '2021-04-10', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (298, 25631561886076928, '2021-04-10', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (301, 1, '2021-04-11', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (302, 2, '2021-04-11', 134, 12, 2, 0);
INSERT INTO `ebook_snapshot`
VALUES (303, 3, '2021-04-11', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (304, 25627780888793088, '2021-04-11', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (305, 25631561886076928, '2021-04-11', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (308, 4, '2021-04-11', 14, 0, 14, 0);
INSERT INTO `ebook_snapshot`
VALUES (309, 1, '2021-04-13', 266, 21, 266, 21);
INSERT INTO `ebook_snapshot`
VALUES (310, 2, '2021-04-13', 134, 12, 134, 12);
INSERT INTO `ebook_snapshot`
VALUES (311, 3, '2021-04-13', 5, 0, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (312, 4, '2021-04-13', 14, 0, 14, 0);
INSERT INTO `ebook_snapshot`
VALUES (313, 25627780888793088, '2021-04-13', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (314, 25631561886076928, '2021-04-13', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (316, 1, '2021-04-14', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (317, 2, '2021-04-14', 134, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (318, 3, '2021-04-14', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (319, 4, '2021-04-14', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (320, 25627780888793088, '2021-04-14', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (321, 25631561886076928, '2021-04-14', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (323, 1, '2021-04-15', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (324, 2, '2021-04-15', 134, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (325, 3, '2021-04-15', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (326, 4, '2021-04-15', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (327, 25627780888793088, '2021-04-15', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (328, 25631561886076928, '2021-04-15', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (330, 1, '2021-04-16', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (331, 2, '2021-04-16', 134, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (332, 3, '2021-04-16', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (333, 4, '2021-04-16', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (334, 25627780888793088, '2021-04-16', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (335, 25631561886076928, '2021-04-16', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (337, 1, '2021-04-17', 266, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (338, 2, '2021-04-17', 139, 12, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (339, 3, '2021-04-17', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (340, 4, '2021-04-17', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (341, 25627780888793088, '2021-04-17', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (342, 25631561886076928, '2021-04-17', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (344, 1, '2021-04-18', 291, 21, 25, 0);
INSERT INTO `ebook_snapshot`
VALUES (345, 2, '2021-04-18', 139, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (346, 3, '2021-04-18', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (347, 4, '2021-04-18', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (348, 25627780888793088, '2021-04-18', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (349, 25631561886076928, '2021-04-18', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (351, 1, '2021-04-19', 291, 21, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (352, 2, '2021-04-19', 139, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (353, 3, '2021-04-19', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (354, 4, '2021-04-19', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (355, 25627780888793088, '2021-04-19', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (356, 25631561886076928, '2021-04-19', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (358, 1, '2021-04-20', 299, 24, 8, 3);
INSERT INTO `ebook_snapshot`
VALUES (359, 2, '2021-04-20', 140, 12, 1, 0);
INSERT INTO `ebook_snapshot`
VALUES (360, 3, '2021-04-20', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (361, 4, '2021-04-20', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (362, 25627780888793088, '2021-04-20', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (363, 25631561886076928, '2021-04-20', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (365, 1, '2021-04-21', 299, 24, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (366, 2, '2021-04-21', 140, 12, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (367, 3, '2021-04-21', 5, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (368, 4, '2021-04-21', 14, 0, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (369, 25627780888793088, '2021-04-21', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (370, 25631561886076928, '2021-04-21', 15, 15, 0, 0);
INSERT INTO `ebook_snapshot`
VALUES (371, 1, '2022-03-09', 299, 24, 299, 24);
INSERT INTO `ebook_snapshot`
VALUES (372, 2, '2022-03-09', 140, 12, 140, 12);
INSERT INTO `ebook_snapshot`
VALUES (373, 3, '2022-03-09', 5, 0, 5, 0);
INSERT INTO `ebook_snapshot`
VALUES (374, 4, '2022-03-09', 14, 0, 14, 0);
INSERT INTO `ebook_snapshot`
VALUES (375, 25627780888793088, '2022-03-09', 15, 15, 15, 15);
INSERT INTO `ebook_snapshot`
VALUES (376, 25631561886076928, '2022-03-09', 15, 15, 15, 15);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`
(
    `id`       bigint(20)                                                   NOT NULL COMMENT 'id',
    `name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
    `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '测试'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test`
VALUES (1, '测试', 'password');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`         bigint(20)                                             NOT NULL COMMENT 'ID',
    `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名',
    `name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `password`   char(32) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL COMMENT '密码',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `login_name_unique` (`login_name`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (1, 'test', '测试1', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user`
VALUES (2, 'admin', '管理员', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user`
VALUES (19062791671517184, 'test1', 'test12', 'fb09b64e309e1c33e7cf8cfe99b07bd5');
INSERT INTO `user`
VALUES (23727710069198848, 'test2', 'test233', 'fb09b64e309e1c33e7cf8cfe99b07bd5');

SET FOREIGN_KEY_CHECKS = 1;
