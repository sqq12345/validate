-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `tp_action`;
CREATE TABLE `tp_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `deleted` int(10) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台操作';

INSERT INTO `tp_action` (`id`, `ctime`, `utime`, `deleted`, `url`, `title`) VALUES
(1,	1521513006,	1521516689,	0,	'admin/menu/index',	'显示菜单'),
(2,	1521513035,	0,	0,	'admin/menu/add',	'添加菜单'),
(4,	1521515386,	0,	0,	'admin/menu/edit',	'菜单编辑'),
(5,	1521515386,	0,	0,	'admin/menu/del',	'菜单删除'),
(7,	1521515592,	0,	0,	'admin/group/index',	'角色列表'),
(8,	1521515592,	0,	0,	'admin/group/add',	'角色添加'),
(9,	1521515592,	0,	0,	'admin/group/edit',	'角色编辑'),
(10,	1521515592,	0,	0,	'admin/group/del',	'角色删除'),
(12,	1521515719,	0,	0,	'admin/user/index',	'用户列表'),
(13,	1521515719,	0,	0,	'admin/user/add',	'用户添加'),
(14,	1521515719,	0,	0,	'admin/user/edit',	'用户编辑'),
(15,	1521515719,	0,	0,	'admin/user/del',	'用户删除'),
(16,	1521616778,	0,	0,	'admin/image/index',	'广告图片列表'),
(17,	1521616778,	0,	0,	'admin/image/add',	'广告图片添加'),
(18,	1521616778,	0,	0,	'admin/image/edit',	'广告图片编辑'),
(19,	1521616778,	0,	0,	'admin/image/del',	'广告图片删除'),
(21,	1521703503,	1521703539,	0,	'admin/config/index',	'设置站点'),
(22,	1521703503,	1521703549,	0,	'admin/config/email',	'设置邮件'),
(23,	1521703503,	1521703560,	0,	'admin/config/advert',	'设置广告'),
(24,	1522115922,	1522115960,	0,	'admin/examine/user',	'审核用户'),
(25,	1522115922,	1522116004,	0,	'admin/examine/image',	'审核广告图片'),
(26,	1522115922,	1522116022,	0,	'admin/examine/validate',	'审核验证码');

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '设置项名',
  `value` text NOT NULL COMMENT '设置项的值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设置';


DROP TABLE IF EXISTS `tp_customers`;
CREATE TABLE `tp_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0新注册 1邮箱验证 2已审核 3禁止登录',
  `type` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '帐号类型 0广告发布员 1广告代理 2验证码制作者 3网站站长',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `lasttime` int(10) unsigned NOT NULL COMMENT '最后登录时间',
  `lastip` int(10) unsigned NOT NULL COMMENT '最后登录ip',
  `name` varchar(25) NOT NULL COMMENT '姓名，要和银行卡一致',
  `company` varchar(255) NOT NULL COMMENT '公司名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `phone` varchar(15) NOT NULL COMMENT '手机号',
  `account` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `account_info` varchar(255) DEFAULT NULL COMMENT '银行卡信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台用户';


DROP TABLE IF EXISTS `tp_group`;
CREATE TABLE `tp_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色';


DROP TABLE IF EXISTS `tp_icons`;
CREATE TABLE `tp_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标';


DROP TABLE IF EXISTS `tp_images`;
CREATE TABLE `tp_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，是否已通过审核，0表示没有，1表示通过',
  `ctype` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '内容属性，0非成人类，1成人类',
  `rtype` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '宗教属性，0无 1非清真类 2清真类',
  `name` varchar(255) NOT NULL COMMENT '图片地址',
  `advertiser` int(10) unsigned NOT NULL COMMENT '广告商（上传者）',
  `title` varchar(30) NOT NULL COMMENT '图片标题，写在验证码的下面',
  `keyword` varchar(255) NOT NULL COMMENT '关键词用，隔开',
  `url` varchar(255) NOT NULL COMMENT '广告链接地址',
  `text` varchar(10) NOT NULL COMMENT '软文，放在验证码问题前',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片素材';


DROP TABLE IF EXISTS `tp_menu`;
CREATE TABLE `tp_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `deleted` int(1) unsigned NOT NULL DEFAULT '0',
  `hidden` int(1) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `aid` int(10) unsigned NOT NULL,
  `remark` text,
  `icon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='菜单';


DROP TABLE IF EXISTS `tp_users`;
CREATE TABLE `tp_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `nkname` varchar(30) NOT NULL,
  `groupid` int(2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `lastlogin` int(11) NOT NULL,
  `lastip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台用户';


DROP TABLE IF EXISTS `tp_validate`;
CREATE TABLE `tp_validate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL COMMENT '状态 0未审核   1已审核可以使用',
  `img_id` int(10) unsigned NOT NULL COMMENT '在images表中的id',
  `cid` int(10) unsigned NOT NULL COMMENT '验证码制作者的用户id',
  `line` text NOT NULL COMMENT '线条信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='验证码';


-- 2018-03-27 08:39:14