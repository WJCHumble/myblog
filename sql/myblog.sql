/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-20 22:14:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL,
  `article_title` varchar(50) NOT NULL,
  `article_abstract` varchar(200) NOT NULL,
  `article_content` varchar(3400) NOT NULL,
  `article_img` varchar(100) NOT NULL,
  `create_date` varchar(60) NOT NULL,
  `read_count` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '3', 'JavaScript——函数柯里化(Currying)', '近期在看Vue.js源码的过程中认识了函数柯里化这个概念，梳理了一下函数柯里化的概念和开发技巧。', ' <h2 id=\"-\">前言</h2> \r\n   <p>近期在看Vue.js源码的过程中认识了函数柯里化这个概念，梳理了一下函数柯里化的概念和开发技巧。</p> \r\n   <h2 id=\"-\">函数柯里化</h2> \r\n   <p>函数柯里化用于创建一个已经设置好了一个或多个参数的函数，可以理解为用一个闭包返回一个函数。 例如：</p> \r\n   <p><strong>1、简单的函数柯里化</strong></p> \r\n   <pre><code class=\"lang-javascript\">    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">sum</span>(<span class=\"hljs-params\">a, b</span>) </span>{\r\n        <span class=\"hljs-keyword\">return</span> a + b\r\n    }\r\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">sum_more</span>(<span class=\"hljs-params\">c</span>) </span>{\r\n        retrurn sum(<span class=\"hljs-number\">4</span>, c) <span class=\"hljs-comment\">//相当于 4 + c</span>\r\n    }\r\n</code></pre> \r\n   <p><strong>2、典型的函数柯里化</strong></p> \r\n   <pre><code class=\"lang-javascript\">    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">curry</span>(<span class=\"hljs-params\">fn</span>) </span>{\r\n        <span class=\"hljs-keyword\">var</span> args = <span class=\"hljs-built_in\">Array</span>.prototype.slice.call(<span class=\"hljs-built_in\">arguments</span>, <span class=\"hljs-number\">1</span>)\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\"></span>)</span>{\r\n            <span class=\"hljs-keyword\">var</span> innerArgs = <span class=\"hljs-built_in\">Array</span>.prototye.slice.call(<span class=\"hljs-built_in\">arguments</span>)\r\n            <span class=\"hljs-keyword\">var</span> finalArgs = args.concat(innerArgs)\r\n            <span class=\"hljs-keyword\">return</span> fn.apply(<span class=\"hljs-literal\">null</span>, finalArgs)\r\n        }\r\n    }\r\n</code></pre> \r\n   <p>到这个柯里化的函数，不了解函数中arguments这个变量的同学，可能会提出疑问，为什么curry函数中的arguments需要通过slice从1开始分割成数组，而闭包中却不用，这是因为对于curry函数而言，使用时会传入参数fn以及变量，对于柯里化后的闭包，它只会接收到变量，而不需要传入fn，所以curry中的arguments需要从1开始剔除fn这个变量。</p> \r\n   <p><strong>3、开发中的应用(以注册事件处理程序为例)</strong></p> \r\n   <pre><code class=\"lang-javascript\">    var addHandler = (<span class=\"hljs-keyword\">function</span> (element) {\r\n        <span class=\"hljs-keyword\">if</span> (addEventListener) {\r\n            <span class=\"hljs-built_in\">return</span> <span class=\"hljs-keyword\">function</span> (element, <span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>) {\r\n                element.addEventListener(<span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>)\r\n            }\r\n        } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (element.attachEvent) {\r\n            <span class=\"hljs-built_in\">return</span> <span class=\"hljs-keyword\">function</span> (element, <span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>) {    \r\n                element.attachEvent(<span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>)\r\n            }\r\n        } <span class=\"hljs-keyword\">else</span> {\r\n            element[<span class=\"hljs-string\">&quot;on&quot;</span> + <span class=\"hljs-built_in\">type</span>] = handler\r\n        }\r\n    })()\r\n</code></pre> \r\n   <p>即开发中，常常通过定义一个自执行函数来实现函数柯里化，让改方法自动判断当前环境使用的属性，从而避免了传统的每一次调用该属性都得进行相同的判断。</p> ', 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/landscape.jpeg', '2019-10-15 12:58:40', '1');
INSERT INTO `article` VALUES ('2', '1', '3', 'JavaScript——函数柯里化(Currying)', '近期在看Vue.js源码的过程中认识了函数柯里化这个概念，梳理了一下函数柯里化的概念和开发技巧。', ' <h2 id=\"-\">前言</h2> \r\n   <p>近期在看Vue.js源码的过程中认识了函数柯里化这个概念，梳理了一下函数柯里化的概念和开发技巧。</p> \r\n   <h2 id=\"-\">函数柯里化</h2> \r\n   <p>函数柯里化用于创建一个已经设置好了一个或多个参数的函数，可以理解为用一个闭包返回一个函数。 例如：</p> \r\n   <p><strong>1、简单的函数柯里化</strong></p> \r\n   <pre><code class=\"lang-javascript\">    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">sum</span>(<span class=\"hljs-params\">a, b</span>) </span>{\r\n        <span class=\"hljs-keyword\">return</span> a + b\r\n    }\r\n    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">sum_more</span>(<span class=\"hljs-params\">c</span>) </span>{\r\n        retrurn sum(<span class=\"hljs-number\">4</span>, c) <span class=\"hljs-comment\">//相当于 4 + c</span>\r\n    }\r\n</code></pre> \r\n   <p><strong>2、典型的函数柯里化</strong></p> \r\n   <pre><code class=\"lang-javascript\">    <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> <span class=\"hljs-title\">curry</span>(<span class=\"hljs-params\">fn</span>) </span>{\r\n        <span class=\"hljs-keyword\">var</span> args = <span class=\"hljs-built_in\">Array</span>.prototype.slice.call(<span class=\"hljs-built_in\">arguments</span>, <span class=\"hljs-number\">1</span>)\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span>(<span class=\"hljs-params\"></span>)</span>{\r\n            <span class=\"hljs-keyword\">var</span> innerArgs = <span class=\"hljs-built_in\">Array</span>.prototye.slice.call(<span class=\"hljs-built_in\">arguments</span>)\r\n            <span class=\"hljs-keyword\">var</span> finalArgs = args.concat(innerArgs)\r\n            <span class=\"hljs-keyword\">return</span> fn.apply(<span class=\"hljs-literal\">null</span>, finalArgs)\r\n        }\r\n    }\r\n</code></pre> \r\n   <p>到这个柯里化的函数，不了解函数中arguments这个变量的同学，可能会提出疑问，为什么curry函数中的arguments需要通过slice从1开始分割成数组，而闭包中却不用，这是因为对于curry函数而言，使用时会传入参数fn以及变量，对于柯里化后的闭包，它只会接收到变量，而不需要传入fn，所以curry中的arguments需要从1开始剔除fn这个变量。</p> \r\n   <p><strong>3、开发中的应用(以注册事件处理程序为例)</strong></p> \r\n   <pre><code class=\"lang-javascript\">    var addHandler = (<span class=\"hljs-keyword\">function</span> (element) {\r\n        <span class=\"hljs-keyword\">if</span> (addEventListener) {\r\n            <span class=\"hljs-built_in\">return</span> <span class=\"hljs-keyword\">function</span> (element, <span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>) {\r\n                element.addEventListener(<span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>)\r\n            }\r\n        } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (element.attachEvent) {\r\n            <span class=\"hljs-built_in\">return</span> <span class=\"hljs-keyword\">function</span> (element, <span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>) {    \r\n                element.attachEvent(<span class=\"hljs-built_in\">type</span>, handler, <span class=\"hljs-literal\">false</span>)\r\n            }\r\n        } <span class=\"hljs-keyword\">else</span> {\r\n            element[<span class=\"hljs-string\">&quot;on&quot;</span> + <span class=\"hljs-built_in\">type</span>] = handler\r\n        }\r\n    })()\r\n</code></pre> \r\n   <p>即开发中，常常通过定义一个自执行函数来实现函数柯里化，让改方法自动判断当前环境使用的属性，从而避免了传统的每一次调用该属性都得进行相同的判断。</p> ', 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/landscape.jpeg', '2019-10-15 12:58:40', '4');

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_content` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_img` varchar(70) NOT NULL,
  `banner_name` varchar(50) DEFAULT NULL,
  `banner_link` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/banner.png', null, null);
INSERT INTO `banner` VALUES ('2', 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/banner2.png', null, null);
INSERT INTO `banner` VALUES ('3', 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/banner3.png', null, null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '基础');
INSERT INTO `category` VALUES ('2', '2', '框架');
INSERT INTO `category` VALUES ('3', '3', '数据库');
INSERT INTO `category` VALUES ('4', '4', '其他');

-- ----------------------------
-- Table structure for category_detail
-- ----------------------------
DROP TABLE IF EXISTS `category_detail`;
CREATE TABLE `category_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tech_id` int(11) NOT NULL,
  `tech_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_detail
-- ----------------------------
INSERT INTO `category_detail` VALUES ('1', '1', 'HTML', '1');
INSERT INTO `category_detail` VALUES ('2', '2', 'CSS', '1');
INSERT INTO `category_detail` VALUES ('3', '3', 'JavaScript', '1');
INSERT INTO `category_detail` VALUES ('4', '4', 'ES6', '1');
INSERT INTO `category_detail` VALUES ('5', '5', 'TypeScript', '1');
INSERT INTO `category_detail` VALUES ('6', '6', 'Vue', '2');
INSERT INTO `category_detail` VALUES ('7', '7', 'React', '2');
INSERT INTO `category_detail` VALUES ('8', '8', 'Node', '2');
INSERT INTO `category_detail` VALUES ('9', '9', 'Nuxt', '2');
INSERT INTO `category_detail` VALUES ('10', '10', '微信小程序', '2');
INSERT INTO `category_detail` VALUES ('11', '11', 'MySQL', '3');
INSERT INTO `category_detail` VALUES ('12', '12', 'Mongo', '3');
INSERT INTO `category_detail` VALUES ('13', '13', 'HTTP', '4');
INSERT INTO `category_detail` VALUES ('14', '14', 'Nginx', '4');
INSERT INTO `category_detail` VALUES ('15', '15', 'Redis', '4');
