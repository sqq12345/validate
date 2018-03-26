/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : validate

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-03-26 09:34:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tp_action`
-- ----------------------------
DROP TABLE IF EXISTS `tp_action`;
CREATE TABLE `tp_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `deleted` int(10) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='后台操作';

-- ----------------------------
-- Records of tp_action
-- ----------------------------
INSERT INTO tp_action VALUES ('1', '1521513006', '1521516689', '0', 'admin/menu/index', '显示菜单');
INSERT INTO tp_action VALUES ('2', '1521513035', '0', '0', 'admin/menu/add', '添加菜单');
INSERT INTO tp_action VALUES ('4', '1521515386', '0', '0', 'admin/menu/edit', '菜单编辑');
INSERT INTO tp_action VALUES ('5', '1521515386', '0', '0', 'admin/menu/del', '菜单删除');
INSERT INTO tp_action VALUES ('7', '1521515592', '0', '0', 'admin/group/index', '角色列表');
INSERT INTO tp_action VALUES ('8', '1521515592', '0', '0', 'admin/group/add', '角色添加');
INSERT INTO tp_action VALUES ('9', '1521515592', '0', '0', 'admin/group/edit', '角色编辑');
INSERT INTO tp_action VALUES ('10', '1521515592', '0', '0', 'admin/group/del', '角色删除');
INSERT INTO tp_action VALUES ('12', '1521515719', '0', '0', 'admin/user/index', '用户列表');
INSERT INTO tp_action VALUES ('13', '1521515719', '0', '0', 'admin/user/add', '用户添加');
INSERT INTO tp_action VALUES ('14', '1521515719', '0', '0', 'admin/user/edit', '用户编辑');
INSERT INTO tp_action VALUES ('15', '1521515719', '0', '0', 'admin/user/del', '用户删除');
INSERT INTO tp_action VALUES ('16', '1521616778', '0', '0', 'admin/image/index', '广告图片列表');
INSERT INTO tp_action VALUES ('17', '1521616778', '0', '0', 'admin/image/add', '广告图片添加');
INSERT INTO tp_action VALUES ('18', '1521616778', '0', '0', 'admin/image/edit', '广告图片编辑');
INSERT INTO tp_action VALUES ('19', '1521616778', '0', '0', 'admin/image/del', '广告图片删除');
INSERT INTO tp_action VALUES ('21', '1521703503', '1521703539', '0', 'admin/config/index', '设置站点');
INSERT INTO tp_action VALUES ('22', '1521703503', '1521703549', '0', 'admin/config/email', '设置邮件');
INSERT INTO tp_action VALUES ('23', '1521703503', '1521703560', '0', 'admin/config/advert', '设置广告');

-- ----------------------------
-- Table structure for `tp_config`
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '设置项名',
  `value` text NOT NULL COMMENT '设置项的值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='设置';

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO tp_config VALUES ('1', 'web_title', '验证码');
INSERT INTO tp_config VALUES ('2', 'web_keywords', '验证码，验证码制作');
INSERT INTO tp_config VALUES ('3', 'web_address', '武汉市鲁磨路');
INSERT INTO tp_config VALUES ('4', 'web_tel', '027-12345678');
INSERT INTO tp_config VALUES ('5', 'web_email', 'admin@admin.com');
INSERT INTO tp_config VALUES ('6', 'web_description', '提供网站登录验证服务');
INSERT INTO tp_config VALUES ('7', 'checking', '');
INSERT INTO tp_config VALUES ('8', 'logo', 'Public/Uploads/2018-03-22/5ab3734bd5da8.jpg');
INSERT INTO tp_config VALUES ('9', 'web_beian', '020202020');

-- ----------------------------
-- Table structure for `tp_customers`
-- ----------------------------
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
  `account` varchar(255) DEFAULT NULL COMMENT '银行卡号或支付宝微信帐号',
  `account_info` varchar(255) DEFAULT NULL COMMENT '银行卡信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台用户';

-- ----------------------------
-- Records of tp_customers
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_group`
-- ----------------------------
DROP TABLE IF EXISTS `tp_group`;
CREATE TABLE `tp_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of tp_group
-- ----------------------------
INSERT INTO tp_group VALUES ('1', '1513828879', '1519781094', '超级管理员', '');
INSERT INTO tp_group VALUES ('2', '1521618399', '1521628318', '图片管理员', '16,17');

-- ----------------------------
-- Table structure for `tp_icons`
-- ----------------------------
DROP TABLE IF EXISTS `tp_icons`;
CREATE TABLE `tp_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1514 DEFAULT CHARSET=utf8 COMMENT='图标';

-- ----------------------------
-- Records of tp_icons
-- ----------------------------
INSERT INTO tp_icons VALUES ('1', 'DeleteRed', 'DeleteRed.png');
INSERT INTO tp_icons VALUES ('2', 'accept', 'accept.png');
INSERT INTO tp_icons VALUES ('3', 'add', 'add.png');
INSERT INTO tp_icons VALUES ('4', 'add1', 'add1.png');
INSERT INTO tp_icons VALUES ('5', 'advancedsettings', 'advancedsettings.png');
INSERT INTO tp_icons VALUES ('6', 'advancedsettings2', 'advancedsettings2.png');
INSERT INTO tp_icons VALUES ('7', 'anchor', 'anchor.png');
INSERT INTO tp_icons VALUES ('8', 'application', 'application.png');
INSERT INTO tp_icons VALUES ('9', 'application-add', 'application_add.png');
INSERT INTO tp_icons VALUES ('10', 'application-cascade', 'application_cascade.png');
INSERT INTO tp_icons VALUES ('11', 'application-delete', 'application_delete.png');
INSERT INTO tp_icons VALUES ('12', 'application-double', 'application_double.png');
INSERT INTO tp_icons VALUES ('13', 'application-edit', 'application_edit.png');
INSERT INTO tp_icons VALUES ('14', 'application-error', 'application_error.png');
INSERT INTO tp_icons VALUES ('15', 'application-form', 'application_form.png');
INSERT INTO tp_icons VALUES ('16', 'application-form-add', 'application_form_add.png');
INSERT INTO tp_icons VALUES ('17', 'application-form-delete', 'application_form_delete.png');
INSERT INTO tp_icons VALUES ('18', 'application-form-edit', 'application_form_edit.png');
INSERT INTO tp_icons VALUES ('19', 'application-form-magnify', 'application_form_magnify.png');
INSERT INTO tp_icons VALUES ('20', 'application-get', 'application_get.png');
INSERT INTO tp_icons VALUES ('21', 'application-go', 'application_go.png');
INSERT INTO tp_icons VALUES ('22', 'application-home', 'application_home.png');
INSERT INTO tp_icons VALUES ('23', 'application-key', 'application_key.png');
INSERT INTO tp_icons VALUES ('24', 'application-lightning', 'application_lightning.png');
INSERT INTO tp_icons VALUES ('25', 'application-link', 'application_link.png');
INSERT INTO tp_icons VALUES ('26', 'application-osx', 'application_osx.png');
INSERT INTO tp_icons VALUES ('27', 'application-osx-add', 'application_osx_add.png');
INSERT INTO tp_icons VALUES ('28', 'application-osx-cascade', 'application_osx_cascade.png');
INSERT INTO tp_icons VALUES ('29', 'application-osx-delete', 'application_osx_delete.png');
INSERT INTO tp_icons VALUES ('30', 'application-osx-double', 'application_osx_double.png');
INSERT INTO tp_icons VALUES ('31', 'application-osx-error', 'application_osx_error.png');
INSERT INTO tp_icons VALUES ('32', 'application-osx-get', 'application_osx_get.png');
INSERT INTO tp_icons VALUES ('33', 'application-osx-go', 'application_osx_go.png');
INSERT INTO tp_icons VALUES ('34', 'application-osx-home', 'application_osx_home.png');
INSERT INTO tp_icons VALUES ('35', 'application-osx-key', 'application_osx_key.png');
INSERT INTO tp_icons VALUES ('36', 'application-osx-lightning', 'application_osx_lightning.png');
INSERT INTO tp_icons VALUES ('37', 'application-osx-link', 'application_osx_link.png');
INSERT INTO tp_icons VALUES ('38', 'application-osx-split', 'application_osx_split.png');
INSERT INTO tp_icons VALUES ('39', 'application-osx-start', 'application_osx_start.png');
INSERT INTO tp_icons VALUES ('40', 'application-osx-stop', 'application_osx_stop.png');
INSERT INTO tp_icons VALUES ('41', 'application-osx-terminal', 'application_osx_terminal.png');
INSERT INTO tp_icons VALUES ('42', 'application-put', 'application_put.png');
INSERT INTO tp_icons VALUES ('43', 'application-side-boxes', 'application_side_boxes.png');
INSERT INTO tp_icons VALUES ('44', 'application-side-contract', 'application_side_contract.png');
INSERT INTO tp_icons VALUES ('45', 'application-side-expand', 'application_side_expand.png');
INSERT INTO tp_icons VALUES ('46', 'application-side-list', 'application_side_list.png');
INSERT INTO tp_icons VALUES ('47', 'application-side-tree', 'application_side_tree.png');
INSERT INTO tp_icons VALUES ('48', 'application-split', 'application_split.png');
INSERT INTO tp_icons VALUES ('49', 'application-start', 'application_start.png');
INSERT INTO tp_icons VALUES ('50', 'application-stop', 'application_stop.png');
INSERT INTO tp_icons VALUES ('51', 'application-tile-horizontal', 'application_tile_horizontal.png');
INSERT INTO tp_icons VALUES ('52', 'application-tile-vertical', 'application_tile_vertical.png');
INSERT INTO tp_icons VALUES ('53', 'application-view-columns', 'application_view_columns.png');
INSERT INTO tp_icons VALUES ('54', 'application-view-detail', 'application_view_detail.png');
INSERT INTO tp_icons VALUES ('55', 'application-view-gallery', 'application_view_gallery.png');
INSERT INTO tp_icons VALUES ('56', 'application-view-icons', 'application_view_icons.png');
INSERT INTO tp_icons VALUES ('57', 'application-view-list', 'application_view_list.png');
INSERT INTO tp_icons VALUES ('58', 'application-view-tile', 'application_view_tile.png');
INSERT INTO tp_icons VALUES ('59', 'application-xp', 'application_xp.png');
INSERT INTO tp_icons VALUES ('60', 'application-xp-terminal', 'application_xp_terminal.png');
INSERT INTO tp_icons VALUES ('61', 'arrow-branch', 'arrow_branch.png');
INSERT INTO tp_icons VALUES ('62', 'arrow-divide', 'arrow_divide.png');
INSERT INTO tp_icons VALUES ('63', 'arrow-down', 'arrow_down.png');
INSERT INTO tp_icons VALUES ('64', 'arrow-ew', 'arrow_ew.png');
INSERT INTO tp_icons VALUES ('65', 'arrow-in', 'arrow_in.png');
INSERT INTO tp_icons VALUES ('66', 'arrow-in-longer', 'arrow_in_longer.png');
INSERT INTO tp_icons VALUES ('67', 'arrow-inout', 'arrow_inout.png');
INSERT INTO tp_icons VALUES ('68', 'arrow-join', 'arrow_join.png');
INSERT INTO tp_icons VALUES ('69', 'arrow-left', 'arrow_left.png');
INSERT INTO tp_icons VALUES ('70', 'arrow-merge', 'arrow_merge.png');
INSERT INTO tp_icons VALUES ('71', 'arrow-ne', 'arrow_ne.png');
INSERT INTO tp_icons VALUES ('72', 'arrow-ns', 'arrow_ns.png');
INSERT INTO tp_icons VALUES ('73', 'arrow-nsew', 'arrow_nsew.png');
INSERT INTO tp_icons VALUES ('74', 'arrow-nw', 'arrow_nw.png');
INSERT INTO tp_icons VALUES ('75', 'arrow-nw-ne-sw-se', 'arrow_nw_ne_sw_se.png');
INSERT INTO tp_icons VALUES ('76', 'arrow-nw-se', 'arrow_nw_se.png');
INSERT INTO tp_icons VALUES ('77', 'arrow-out', 'arrow_out.png');
INSERT INTO tp_icons VALUES ('78', 'arrow-out-longer', 'arrow_out_longer.png');
INSERT INTO tp_icons VALUES ('79', 'arrow-redo', 'arrow_redo.png');
INSERT INTO tp_icons VALUES ('80', 'arrow-refresh', 'arrow_refresh.png');
INSERT INTO tp_icons VALUES ('81', 'arrow-refresh-small', 'arrow_refresh_small.png');
INSERT INTO tp_icons VALUES ('82', 'arrow-right', 'arrow_right.png');
INSERT INTO tp_icons VALUES ('83', 'arrow-right-16', 'arrow_right_16.png');
INSERT INTO tp_icons VALUES ('84', 'arrow-rotate-anticlockwise', 'arrow_rotate_anticlockwise.png');
INSERT INTO tp_icons VALUES ('85', 'arrow-rotate-clockwise', 'arrow_rotate_clockwise.png');
INSERT INTO tp_icons VALUES ('86', 'arrow-se', 'arrow_se.png');
INSERT INTO tp_icons VALUES ('87', 'arrow-sw', 'arrow_sw.png');
INSERT INTO tp_icons VALUES ('88', 'arrow-sw-ne', 'arrow_sw_ne.png');
INSERT INTO tp_icons VALUES ('89', 'arrow-switch', 'arrow_switch.png');
INSERT INTO tp_icons VALUES ('90', 'arrow-switch-bluegreen', 'arrow_switch_bluegreen.png');
INSERT INTO tp_icons VALUES ('91', 'arrow-turn-left', 'arrow_turn_left.png');
INSERT INTO tp_icons VALUES ('92', 'arrow-turn-right', 'arrow_turn_right.png');
INSERT INTO tp_icons VALUES ('93', 'arrow-undo', 'arrow_undo.png');
INSERT INTO tp_icons VALUES ('94', 'arrow-up', 'arrow_up.png');
INSERT INTO tp_icons VALUES ('95', 'asterisk-orange', 'asterisk_orange.png');
INSERT INTO tp_icons VALUES ('96', 'asterisk-red', 'asterisk_red.png');
INSERT INTO tp_icons VALUES ('97', 'asterisk-yellow', 'asterisk_yellow.png');
INSERT INTO tp_icons VALUES ('98', 'attach', 'attach.png');
INSERT INTO tp_icons VALUES ('99', 'award-star-add', 'award_star_add.png');
INSERT INTO tp_icons VALUES ('100', 'award-star-bronze-1', 'award_star_bronze_1.png');
INSERT INTO tp_icons VALUES ('101', 'award-star-bronze-2', 'award_star_bronze_2.png');
INSERT INTO tp_icons VALUES ('102', 'award-star-bronze-3', 'award_star_bronze_3.png');
INSERT INTO tp_icons VALUES ('103', 'award-star-delete', 'award_star_delete.png');
INSERT INTO tp_icons VALUES ('104', 'award-star-gold-1', 'award_star_gold_1.png');
INSERT INTO tp_icons VALUES ('105', 'award-star-gold-2', 'award_star_gold_2.png');
INSERT INTO tp_icons VALUES ('106', 'award-star-gold-3', 'award_star_gold_3.png');
INSERT INTO tp_icons VALUES ('107', 'award-star-silver-1', 'award_star_silver_1.png');
INSERT INTO tp_icons VALUES ('108', 'award-star-silver-2', 'award_star_silver_2.png');
INSERT INTO tp_icons VALUES ('109', 'award-star-silver-3', 'award_star_silver_3.png');
INSERT INTO tp_icons VALUES ('110', 'back', 'back.png');
INSERT INTO tp_icons VALUES ('111', 'basket', 'basket.png');
INSERT INTO tp_icons VALUES ('112', 'basket-add', 'basket_add.png');
INSERT INTO tp_icons VALUES ('113', 'basket-delete', 'basket_delete.png');
INSERT INTO tp_icons VALUES ('114', 'basket-edit', 'basket_edit.png');
INSERT INTO tp_icons VALUES ('115', 'basket-error', 'basket_error.png');
INSERT INTO tp_icons VALUES ('116', 'basket-go', 'basket_go.png');
INSERT INTO tp_icons VALUES ('117', 'basket-put', 'basket_put.png');
INSERT INTO tp_icons VALUES ('118', 'basket-remove', 'basket_remove.png');
INSERT INTO tp_icons VALUES ('119', 'bell', 'bell.png');
INSERT INTO tp_icons VALUES ('120', 'bell-add', 'bell_add.png');
INSERT INTO tp_icons VALUES ('121', 'bell-delete', 'bell_delete.png');
INSERT INTO tp_icons VALUES ('122', 'bell-error', 'bell_error.png');
INSERT INTO tp_icons VALUES ('123', 'bell-go', 'bell_go.png');
INSERT INTO tp_icons VALUES ('124', 'bell-link', 'bell_link.png');
INSERT INTO tp_icons VALUES ('125', 'bell-silver', 'bell_silver.png');
INSERT INTO tp_icons VALUES ('126', 'bell-silver-start', 'bell_silver_start.png');
INSERT INTO tp_icons VALUES ('127', 'bell-silver-stop', 'bell_silver_stop.png');
INSERT INTO tp_icons VALUES ('128', 'bell-start', 'bell_start.png');
INSERT INTO tp_icons VALUES ('129', 'bell-stop', 'bell_stop.png');
INSERT INTO tp_icons VALUES ('130', 'bin', 'bin.png');
INSERT INTO tp_icons VALUES ('131', 'bin-closed', 'bin_closed.png');
INSERT INTO tp_icons VALUES ('132', 'bin-empty', 'bin_empty.png');
INSERT INTO tp_icons VALUES ('133', 'bomb', 'bomb.png');
INSERT INTO tp_icons VALUES ('134', 'book', 'book.png');
INSERT INTO tp_icons VALUES ('135', 'book-add', 'book_add.png');
INSERT INTO tp_icons VALUES ('136', 'book-addresses', 'book_addresses.png');
INSERT INTO tp_icons VALUES ('137', 'book-addresses-add', 'book_addresses_add.png');
INSERT INTO tp_icons VALUES ('138', 'book-addresses-delete', 'book_addresses_delete.png');
INSERT INTO tp_icons VALUES ('139', 'book-addresses-edit', 'book_addresses_edit.png');
INSERT INTO tp_icons VALUES ('140', 'book-addresses-error', 'book_addresses_error.png');
INSERT INTO tp_icons VALUES ('141', 'book-addresses-key', 'book_addresses_key.png');
INSERT INTO tp_icons VALUES ('142', 'book-delete', 'book_delete.png');
INSERT INTO tp_icons VALUES ('143', 'book-edit', 'book_edit.png');
INSERT INTO tp_icons VALUES ('144', 'book-error', 'book_error.png');
INSERT INTO tp_icons VALUES ('145', 'book-go', 'book_go.png');
INSERT INTO tp_icons VALUES ('146', 'book-key', 'book_key.png');
INSERT INTO tp_icons VALUES ('147', 'book-link', 'book_link.png');
INSERT INTO tp_icons VALUES ('148', 'book-magnify', 'book_magnify.png');
INSERT INTO tp_icons VALUES ('149', 'book-next', 'book_next.png');
INSERT INTO tp_icons VALUES ('150', 'book-open', 'book_open.png');
INSERT INTO tp_icons VALUES ('151', 'book-open-mark', 'book_open_mark.png');
INSERT INTO tp_icons VALUES ('152', 'book-previous', 'book_previous.png');
INSERT INTO tp_icons VALUES ('153', 'book-red', 'book_red.png');
INSERT INTO tp_icons VALUES ('154', 'book-tabs', 'book_tabs.png');
INSERT INTO tp_icons VALUES ('155', 'bookmark', 'bookmark.png');
INSERT INTO tp_icons VALUES ('156', 'bookmark-add', 'bookmark_add.png');
INSERT INTO tp_icons VALUES ('157', 'bookmark-delete', 'bookmark_delete.png');
INSERT INTO tp_icons VALUES ('158', 'bookmark-edit', 'bookmark_edit.png');
INSERT INTO tp_icons VALUES ('159', 'bookmark-error', 'bookmark_error.png');
INSERT INTO tp_icons VALUES ('160', 'bookmark-go', 'bookmark_go.png');
INSERT INTO tp_icons VALUES ('161', 'border-all', 'border_all.png');
INSERT INTO tp_icons VALUES ('162', 'border-bottom', 'border_bottom.png');
INSERT INTO tp_icons VALUES ('163', 'border-draw', 'border_draw.png');
INSERT INTO tp_icons VALUES ('164', 'border-inner', 'border_inner.png');
INSERT INTO tp_icons VALUES ('165', 'border-inner-horizontal', 'border_inner_horizontal.png');
INSERT INTO tp_icons VALUES ('166', 'border-inner-vertical', 'border_inner_vertical.png');
INSERT INTO tp_icons VALUES ('167', 'border-left', 'border_left.png');
INSERT INTO tp_icons VALUES ('168', 'border-none', 'border_none.png');
INSERT INTO tp_icons VALUES ('169', 'border-outer', 'border_outer.png');
INSERT INTO tp_icons VALUES ('170', 'border-right', 'border_right.png');
INSERT INTO tp_icons VALUES ('171', 'border-top', 'border_top.png');
INSERT INTO tp_icons VALUES ('172', 'box', 'box.png');
INSERT INTO tp_icons VALUES ('173', 'box-error', 'box_error.png');
INSERT INTO tp_icons VALUES ('174', 'box-picture', 'box_picture.png');
INSERT INTO tp_icons VALUES ('175', 'box-world', 'box_world.png');
INSERT INTO tp_icons VALUES ('176', 'brick', 'brick.png');
INSERT INTO tp_icons VALUES ('177', 'brick-add', 'brick_add.png');
INSERT INTO tp_icons VALUES ('178', 'brick-delete', 'brick_delete.png');
INSERT INTO tp_icons VALUES ('179', 'brick-edit', 'brick_edit.png');
INSERT INTO tp_icons VALUES ('180', 'brick-error', 'brick_error.png');
INSERT INTO tp_icons VALUES ('181', 'brick-go', 'brick_go.png');
INSERT INTO tp_icons VALUES ('182', 'brick-link', 'brick_link.png');
INSERT INTO tp_icons VALUES ('183', 'brick-magnify', 'brick_magnify.png');
INSERT INTO tp_icons VALUES ('184', 'bricks', 'bricks.png');
INSERT INTO tp_icons VALUES ('185', 'briefcase', 'briefcase.png');
INSERT INTO tp_icons VALUES ('186', 'bug', 'bug.png');
INSERT INTO tp_icons VALUES ('187', 'bug-add', 'bug_add.png');
INSERT INTO tp_icons VALUES ('188', 'bug-delete', 'bug_delete.png');
INSERT INTO tp_icons VALUES ('189', 'bug-edit', 'bug_edit.png');
INSERT INTO tp_icons VALUES ('190', 'bug-error', 'bug_error.png');
INSERT INTO tp_icons VALUES ('191', 'bug-fix', 'bug_fix.png');
INSERT INTO tp_icons VALUES ('192', 'bug-go', 'bug_go.png');
INSERT INTO tp_icons VALUES ('193', 'bug-link', 'bug_link.png');
INSERT INTO tp_icons VALUES ('194', 'bug-magnify', 'bug_magnify.png');
INSERT INTO tp_icons VALUES ('195', 'build', 'build.png');
INSERT INTO tp_icons VALUES ('196', 'build-cancel', 'build_cancel.png');
INSERT INTO tp_icons VALUES ('197', 'building', 'building.png');
INSERT INTO tp_icons VALUES ('198', 'building-add', 'building_add.png');
INSERT INTO tp_icons VALUES ('199', 'building-delete', 'building_delete.png');
INSERT INTO tp_icons VALUES ('200', 'building-edit', 'building_edit.png');
INSERT INTO tp_icons VALUES ('201', 'building-error', 'building_error.png');
INSERT INTO tp_icons VALUES ('202', 'building-go', 'building_go.png');
INSERT INTO tp_icons VALUES ('203', 'building-key', 'building_key.png');
INSERT INTO tp_icons VALUES ('204', 'building-link', 'building_link.png');
INSERT INTO tp_icons VALUES ('205', 'bullet-add', 'bullet_add.png');
INSERT INTO tp_icons VALUES ('206', 'bullet-arrow-bottom', 'bullet_arrow_bottom.png');
INSERT INTO tp_icons VALUES ('207', 'bullet-arrow-down', 'bullet_arrow_down.png');
INSERT INTO tp_icons VALUES ('208', 'bullet-arrow-top', 'bullet_arrow_top.png');
INSERT INTO tp_icons VALUES ('209', 'bullet-arrow-up', 'bullet_arrow_up.png');
INSERT INTO tp_icons VALUES ('210', 'bullet-black', 'bullet_black.png');
INSERT INTO tp_icons VALUES ('211', 'bullet-blue', 'bullet_blue.png');
INSERT INTO tp_icons VALUES ('212', 'bullet-connect', 'bullet_connect.png');
INSERT INTO tp_icons VALUES ('213', 'bullet-cross', 'bullet_cross.png');
INSERT INTO tp_icons VALUES ('214', 'bullet-database', 'bullet_database.png');
INSERT INTO tp_icons VALUES ('215', 'bullet-database-yellow', 'bullet_database_yellow.png');
INSERT INTO tp_icons VALUES ('216', 'bullet-delete', 'bullet_delete.png');
INSERT INTO tp_icons VALUES ('217', 'bullet-disk', 'bullet_disk.png');
INSERT INTO tp_icons VALUES ('218', 'bullet-earth', 'bullet_earth.png');
INSERT INTO tp_icons VALUES ('219', 'bullet-edit', 'bullet_edit.png');
INSERT INTO tp_icons VALUES ('220', 'bullet-eject', 'bullet_eject.png');
INSERT INTO tp_icons VALUES ('221', 'bullet-error', 'bullet_error.png');
INSERT INTO tp_icons VALUES ('222', 'bullet-feed', 'bullet_feed.png');
INSERT INTO tp_icons VALUES ('223', 'bullet-get', 'bullet_get.png');
INSERT INTO tp_icons VALUES ('224', 'bullet-go', 'bullet_go.png');
INSERT INTO tp_icons VALUES ('225', 'bullet-green', 'bullet_green.png');
INSERT INTO tp_icons VALUES ('226', 'bullet-home', 'bullet_home.png');
INSERT INTO tp_icons VALUES ('227', 'bullet-key', 'bullet_key.png');
INSERT INTO tp_icons VALUES ('228', 'bullet-left', 'bullet_left.png');
INSERT INTO tp_icons VALUES ('229', 'bullet-lightning', 'bullet_lightning.png');
INSERT INTO tp_icons VALUES ('230', 'bullet-magnify', 'bullet_magnify.png');
INSERT INTO tp_icons VALUES ('231', 'bullet-minus', 'bullet_minus.png');
INSERT INTO tp_icons VALUES ('232', 'bullet-orange', 'bullet_orange.png');
INSERT INTO tp_icons VALUES ('233', 'bullet-page-white', 'bullet_page_white.png');
INSERT INTO tp_icons VALUES ('234', 'bullet-picture', 'bullet_picture.png');
INSERT INTO tp_icons VALUES ('235', 'bullet-pink', 'bullet_pink.png');
INSERT INTO tp_icons VALUES ('236', 'bullet-plus', 'bullet_plus.png');
INSERT INTO tp_icons VALUES ('237', 'bullet-purple', 'bullet_purple.png');
INSERT INTO tp_icons VALUES ('238', 'bullet-red', 'bullet_red.png');
INSERT INTO tp_icons VALUES ('239', 'bullet-right', 'bullet_right.png');
INSERT INTO tp_icons VALUES ('240', 'bullet-shape', 'bullet_shape.png');
INSERT INTO tp_icons VALUES ('241', 'bullet-sparkle', 'bullet_sparkle.png');
INSERT INTO tp_icons VALUES ('242', 'bullet-star', 'bullet_star.png');
INSERT INTO tp_icons VALUES ('243', 'bullet-start', 'bullet_start.png');
INSERT INTO tp_icons VALUES ('244', 'bullet-stop', 'bullet_stop.png');
INSERT INTO tp_icons VALUES ('245', 'bullet-stop-alt', 'bullet_stop_alt.png');
INSERT INTO tp_icons VALUES ('246', 'bullet-tick', 'bullet_tick.png');
INSERT INTO tp_icons VALUES ('247', 'bullet-toggle-minus', 'bullet_toggle_minus.png');
INSERT INTO tp_icons VALUES ('248', 'bullet-toggle-plus', 'bullet_toggle_plus.png');
INSERT INTO tp_icons VALUES ('249', 'bullet-white', 'bullet_white.png');
INSERT INTO tp_icons VALUES ('250', 'bullet-wrench', 'bullet_wrench.png');
INSERT INTO tp_icons VALUES ('251', 'bullet-wrench-red', 'bullet_wrench_red.png');
INSERT INTO tp_icons VALUES ('252', 'bullet-yellow', 'bullet_yellow.png');
INSERT INTO tp_icons VALUES ('253', 'button', 'button.png');
INSERT INTO tp_icons VALUES ('254', 'cake', 'cake.png');
INSERT INTO tp_icons VALUES ('255', 'cake-out', 'cake_out.png');
INSERT INTO tp_icons VALUES ('256', 'cake-sliced', 'cake_sliced.png');
INSERT INTO tp_icons VALUES ('257', 'calculator', 'calculator.png');
INSERT INTO tp_icons VALUES ('258', 'calculator-add', 'calculator_add.png');
INSERT INTO tp_icons VALUES ('259', 'calculator-delete', 'calculator_delete.png');
INSERT INTO tp_icons VALUES ('260', 'calculator-edit', 'calculator_edit.png');
INSERT INTO tp_icons VALUES ('261', 'calculator-error', 'calculator_error.png');
INSERT INTO tp_icons VALUES ('262', 'calculator-link', 'calculator_link.png');
INSERT INTO tp_icons VALUES ('263', 'calendar', 'calendar.png');
INSERT INTO tp_icons VALUES ('264', 'calendar-add', 'calendar_add.png');
INSERT INTO tp_icons VALUES ('265', 'calendar-delete', 'calendar_delete.png');
INSERT INTO tp_icons VALUES ('266', 'calendar-edit', 'calendar_edit.png');
INSERT INTO tp_icons VALUES ('267', 'calendar-link', 'calendar_link.png');
INSERT INTO tp_icons VALUES ('268', 'calendar-select-day', 'calendar_select_day.png');
INSERT INTO tp_icons VALUES ('269', 'calendar-select-none', 'calendar_select_none.png');
INSERT INTO tp_icons VALUES ('270', 'calendar-select-week', 'calendar_select_week.png');
INSERT INTO tp_icons VALUES ('271', 'calendar-star', 'calendar_star.png');
INSERT INTO tp_icons VALUES ('272', 'calendar-view-day', 'calendar_view_day.png');
INSERT INTO tp_icons VALUES ('273', 'calendar-view-month', 'calendar_view_month.png');
INSERT INTO tp_icons VALUES ('274', 'calendar-view-week', 'calendar_view_week.png');
INSERT INTO tp_icons VALUES ('275', 'camera', 'camera.png');
INSERT INTO tp_icons VALUES ('276', 'camera-add', 'camera_add.png');
INSERT INTO tp_icons VALUES ('277', 'camera-connect', 'camera_connect.png');
INSERT INTO tp_icons VALUES ('278', 'camera-delete', 'camera_delete.png');
INSERT INTO tp_icons VALUES ('279', 'camera-edit', 'camera_edit.png');
INSERT INTO tp_icons VALUES ('280', 'camera-error', 'camera_error.png');
INSERT INTO tp_icons VALUES ('281', 'camera-go', 'camera_go.png');
INSERT INTO tp_icons VALUES ('282', 'camera-link', 'camera_link.png');
INSERT INTO tp_icons VALUES ('283', 'camera-magnify', 'camera_magnify.png');
INSERT INTO tp_icons VALUES ('284', 'camera-picture', 'camera_picture.png');
INSERT INTO tp_icons VALUES ('285', 'camera-small', 'camera_small.png');
INSERT INTO tp_icons VALUES ('286', 'camera-start', 'camera_start.png');
INSERT INTO tp_icons VALUES ('287', 'camera-stop', 'camera_stop.png');
INSERT INTO tp_icons VALUES ('288', 'cancel', 'cancel.png');
INSERT INTO tp_icons VALUES ('289', 'car', 'car.png');
INSERT INTO tp_icons VALUES ('290', 'car-add', 'car_add.png');
INSERT INTO tp_icons VALUES ('291', 'car-delete', 'car_delete.png');
INSERT INTO tp_icons VALUES ('292', 'car-error', 'car_error.png');
INSERT INTO tp_icons VALUES ('293', 'car-red', 'car_red.png');
INSERT INTO tp_icons VALUES ('294', 'car-start', 'car_start.png');
INSERT INTO tp_icons VALUES ('295', 'car-stop', 'car_stop.png');
INSERT INTO tp_icons VALUES ('296', 'cart', 'cart.png');
INSERT INTO tp_icons VALUES ('297', 'cart-add', 'cart_add.png');
INSERT INTO tp_icons VALUES ('298', 'cart-delete', 'cart_delete.png');
INSERT INTO tp_icons VALUES ('299', 'cart-edit', 'cart_edit.png');
INSERT INTO tp_icons VALUES ('300', 'cart-error', 'cart_error.png');
INSERT INTO tp_icons VALUES ('301', 'cart-full', 'cart_full.png');
INSERT INTO tp_icons VALUES ('302', 'cart-go', 'cart_go.png');
INSERT INTO tp_icons VALUES ('303', 'cart-magnify', 'cart_magnify.png');
INSERT INTO tp_icons VALUES ('304', 'cart-put', 'cart_put.png');
INSERT INTO tp_icons VALUES ('305', 'cart-remove', 'cart_remove.png');
INSERT INTO tp_icons VALUES ('306', 'cd', 'cd.png');
INSERT INTO tp_icons VALUES ('307', 'cd-add', 'cd_add.png');
INSERT INTO tp_icons VALUES ('308', 'cd-burn', 'cd_burn.png');
INSERT INTO tp_icons VALUES ('309', 'cd-delete', 'cd_delete.png');
INSERT INTO tp_icons VALUES ('310', 'cd-edit', 'cd_edit.png');
INSERT INTO tp_icons VALUES ('311', 'cd-eject', 'cd_eject.png');
INSERT INTO tp_icons VALUES ('312', 'cd-go', 'cd_go.png');
INSERT INTO tp_icons VALUES ('313', 'cd-magnify', 'cd_magnify.png');
INSERT INTO tp_icons VALUES ('314', 'cd-play', 'cd_play.png');
INSERT INTO tp_icons VALUES ('315', 'cd-stop', 'cd_stop.png');
INSERT INTO tp_icons VALUES ('316', 'cd-stop-alt', 'cd_stop_alt.png');
INSERT INTO tp_icons VALUES ('317', 'cd-tick', 'cd_tick.png');
INSERT INTO tp_icons VALUES ('318', 'cdr', 'cdr.png');
INSERT INTO tp_icons VALUES ('319', 'cdr-add', 'cdr_add.png');
INSERT INTO tp_icons VALUES ('320', 'cdr-burn', 'cdr_burn.png');
INSERT INTO tp_icons VALUES ('321', 'cdr-cross', 'cdr_cross.png');
INSERT INTO tp_icons VALUES ('322', 'cdr-delete', 'cdr_delete.png');
INSERT INTO tp_icons VALUES ('323', 'cdr-edit', 'cdr_edit.png');
INSERT INTO tp_icons VALUES ('324', 'cdr-eject', 'cdr_eject.png');
INSERT INTO tp_icons VALUES ('325', 'cdr-error', 'cdr_error.png');
INSERT INTO tp_icons VALUES ('326', 'cdr-go', 'cdr_go.png');
INSERT INTO tp_icons VALUES ('327', 'cdr-magnify', 'cdr_magnify.png');
INSERT INTO tp_icons VALUES ('328', 'cdr-play', 'cdr_play.png');
INSERT INTO tp_icons VALUES ('329', 'cdr-start', 'cdr_start.png');
INSERT INTO tp_icons VALUES ('330', 'cdr-stop', 'cdr_stop.png');
INSERT INTO tp_icons VALUES ('331', 'cdr-stop-alt', 'cdr_stop_alt.png');
INSERT INTO tp_icons VALUES ('332', 'cdr-tick', 'cdr_tick.png');
INSERT INTO tp_icons VALUES ('333', 'chart-bar', 'chart_bar.png');
INSERT INTO tp_icons VALUES ('334', 'chart-bar-add', 'chart_bar_add.png');
INSERT INTO tp_icons VALUES ('335', 'chart-bar-delete', 'chart_bar_delete.png');
INSERT INTO tp_icons VALUES ('336', 'chart-bar-edit', 'chart_bar_edit.png');
INSERT INTO tp_icons VALUES ('337', 'chart-bar-error', 'chart_bar_error.png');
INSERT INTO tp_icons VALUES ('338', 'chart-bar-link', 'chart_bar_link.png');
INSERT INTO tp_icons VALUES ('339', 'chart-curve', 'chart_curve.png');
INSERT INTO tp_icons VALUES ('340', 'chart-curve-add', 'chart_curve_add.png');
INSERT INTO tp_icons VALUES ('341', 'chart-curve-delete', 'chart_curve_delete.png');
INSERT INTO tp_icons VALUES ('342', 'chart-curve-edit', 'chart_curve_edit.png');
INSERT INTO tp_icons VALUES ('343', 'chart-curve-error', 'chart_curve_error.png');
INSERT INTO tp_icons VALUES ('344', 'chart-curve-go', 'chart_curve_go.png');
INSERT INTO tp_icons VALUES ('345', 'chart-curve-link', 'chart_curve_link.png');
INSERT INTO tp_icons VALUES ('346', 'chart-line', 'chart_line.png');
INSERT INTO tp_icons VALUES ('347', 'chart-line-add', 'chart_line_add.png');
INSERT INTO tp_icons VALUES ('348', 'chart-line-delete', 'chart_line_delete.png');
INSERT INTO tp_icons VALUES ('349', 'chart-line-edit', 'chart_line_edit.png');
INSERT INTO tp_icons VALUES ('350', 'chart-line-error', 'chart_line_error.png');
INSERT INTO tp_icons VALUES ('351', 'chart-line-link', 'chart_line_link.png');
INSERT INTO tp_icons VALUES ('352', 'chart-org-inverted', 'chart_org_inverted.png');
INSERT INTO tp_icons VALUES ('353', 'chart-organisation', 'chart_organisation.png');
INSERT INTO tp_icons VALUES ('354', 'chart-organisation-add', 'chart_organisation_add.png');
INSERT INTO tp_icons VALUES ('355', 'chart-organisation-delete', 'chart_organisation_delete.png');
INSERT INTO tp_icons VALUES ('356', 'chart-pie', 'chart_pie.png');
INSERT INTO tp_icons VALUES ('357', 'chart-pie-add', 'chart_pie_add.png');
INSERT INTO tp_icons VALUES ('358', 'chart-pie-delete', 'chart_pie_delete.png');
INSERT INTO tp_icons VALUES ('359', 'chart-pie-edit', 'chart_pie_edit.png');
INSERT INTO tp_icons VALUES ('360', 'chart-pie-error', 'chart_pie_error.png');
INSERT INTO tp_icons VALUES ('361', 'chart-pie-lightning', 'chart_pie_lightning.png');
INSERT INTO tp_icons VALUES ('362', 'chart-pie-link', 'chart_pie_link.png');
INSERT INTO tp_icons VALUES ('363', 'check-error', 'check_error.png');
INSERT INTO tp_icons VALUES ('364', 'clipboard', 'clipboard.png');
INSERT INTO tp_icons VALUES ('365', 'clock', 'clock.png');
INSERT INTO tp_icons VALUES ('366', 'clock-add', 'clock_add.png');
INSERT INTO tp_icons VALUES ('367', 'clock-delete', 'clock_delete.png');
INSERT INTO tp_icons VALUES ('368', 'clock-edit', 'clock_edit.png');
INSERT INTO tp_icons VALUES ('369', 'clock-error', 'clock_error.png');
INSERT INTO tp_icons VALUES ('370', 'clock-go', 'clock_go.png');
INSERT INTO tp_icons VALUES ('371', 'clock-link', 'clock_link.png');
INSERT INTO tp_icons VALUES ('372', 'clock-pause', 'clock_pause.png');
INSERT INTO tp_icons VALUES ('373', 'clock-play', 'clock_play.png');
INSERT INTO tp_icons VALUES ('374', 'clock-red', 'clock_red.png');
INSERT INTO tp_icons VALUES ('375', 'clock-start', 'clock_start.png');
INSERT INTO tp_icons VALUES ('376', 'clock-stop', 'clock_stop.png');
INSERT INTO tp_icons VALUES ('377', 'cmy', 'cmy.png');
INSERT INTO tp_icons VALUES ('378', 'cog', 'cog.png');
INSERT INTO tp_icons VALUES ('379', 'cog-add', 'cog_add.png');
INSERT INTO tp_icons VALUES ('380', 'cog-delete', 'cog_delete.png');
INSERT INTO tp_icons VALUES ('381', 'cog-edit', 'cog_edit.png');
INSERT INTO tp_icons VALUES ('382', 'cog-error', 'cog_error.png');
INSERT INTO tp_icons VALUES ('383', 'cog-go', 'cog_go.png');
INSERT INTO tp_icons VALUES ('384', 'cog-start', 'cog_start.png');
INSERT INTO tp_icons VALUES ('385', 'cog-stop', 'cog_stop.png');
INSERT INTO tp_icons VALUES ('386', 'coins', 'coins.png');
INSERT INTO tp_icons VALUES ('387', 'coins-add', 'coins_add.png');
INSERT INTO tp_icons VALUES ('388', 'coins-delete', 'coins_delete.png');
INSERT INTO tp_icons VALUES ('389', 'color', 'color.png');
INSERT INTO tp_icons VALUES ('390', 'color-swatch', 'color_swatch.png');
INSERT INTO tp_icons VALUES ('391', 'color-wheel', 'color_wheel.png');
INSERT INTO tp_icons VALUES ('392', 'comment', 'comment.png');
INSERT INTO tp_icons VALUES ('393', 'comment-add', 'comment_add.png');
INSERT INTO tp_icons VALUES ('394', 'comment-delete', 'comment_delete.png');
INSERT INTO tp_icons VALUES ('395', 'comment-dull', 'comment_dull.png');
INSERT INTO tp_icons VALUES ('396', 'comment-edit', 'comment_edit.png');
INSERT INTO tp_icons VALUES ('397', 'comment-play', 'comment_play.png');
INSERT INTO tp_icons VALUES ('398', 'comment-record', 'comment_record.png');
INSERT INTO tp_icons VALUES ('399', 'comments', 'comments.png');
INSERT INTO tp_icons VALUES ('400', 'comments-add', 'comments_add.png');
INSERT INTO tp_icons VALUES ('401', 'comments-delete', 'comments_delete.png');
INSERT INTO tp_icons VALUES ('402', 'compass', 'compass.png');
INSERT INTO tp_icons VALUES ('403', 'compress', 'compress.png');
INSERT INTO tp_icons VALUES ('404', 'computer', 'computer.png');
INSERT INTO tp_icons VALUES ('405', 'computer-add', 'computer_add.png');
INSERT INTO tp_icons VALUES ('406', 'computer-connect', 'computer_connect.png');
INSERT INTO tp_icons VALUES ('407', 'computer-delete', 'computer_delete.png');
INSERT INTO tp_icons VALUES ('408', 'computer-edit', 'computer_edit.png');
INSERT INTO tp_icons VALUES ('409', 'computer-error', 'computer_error.png');
INSERT INTO tp_icons VALUES ('410', 'computer-go', 'computer_go.png');
INSERT INTO tp_icons VALUES ('411', 'computer-key', 'computer_key.png');
INSERT INTO tp_icons VALUES ('412', 'computer-link', 'computer_link.png');
INSERT INTO tp_icons VALUES ('413', 'computer-magnify', 'computer_magnify.png');
INSERT INTO tp_icons VALUES ('414', 'computer-off', 'computer_off.png');
INSERT INTO tp_icons VALUES ('415', 'computer-start', 'computer_start.png');
INSERT INTO tp_icons VALUES ('416', 'computer-stop', 'computer_stop.png');
INSERT INTO tp_icons VALUES ('417', 'computer-wrench', 'computer_wrench.png');
INSERT INTO tp_icons VALUES ('418', 'connect', 'connect.png');
INSERT INTO tp_icons VALUES ('419', 'contrast', 'contrast.png');
INSERT INTO tp_icons VALUES ('420', 'contrast-decrease', 'contrast_decrease.png');
INSERT INTO tp_icons VALUES ('421', 'contrast-high', 'contrast_high.png');
INSERT INTO tp_icons VALUES ('422', 'contrast-increase', 'contrast_increase.png');
INSERT INTO tp_icons VALUES ('423', 'contrast-low', 'contrast_low.png');
INSERT INTO tp_icons VALUES ('424', 'control-add', 'control_add.png');
INSERT INTO tp_icons VALUES ('425', 'control-add-blue', 'control_add_blue.png');
INSERT INTO tp_icons VALUES ('426', 'control-blank', 'control_blank.png');
INSERT INTO tp_icons VALUES ('427', 'control-blank-blue', 'control_blank_blue.png');
INSERT INTO tp_icons VALUES ('428', 'control-eject', 'control_eject.png');
INSERT INTO tp_icons VALUES ('429', 'control-eject-blue', 'control_eject_blue.png');
INSERT INTO tp_icons VALUES ('430', 'control-end', 'control_end.png');
INSERT INTO tp_icons VALUES ('431', 'control-end-blue', 'control_end_blue.png');
INSERT INTO tp_icons VALUES ('432', 'control-equalizer', 'control_equalizer.png');
INSERT INTO tp_icons VALUES ('433', 'control-equalizer-blue', 'control_equalizer_blue.png');
INSERT INTO tp_icons VALUES ('434', 'control-fastforward', 'control_fastforward.png');
INSERT INTO tp_icons VALUES ('435', 'control-fastforward-blue', 'control_fastforward_blue.png');
INSERT INTO tp_icons VALUES ('436', 'control-pause', 'control_pause.png');
INSERT INTO tp_icons VALUES ('437', 'control-pause-blue', 'control_pause_blue.png');
INSERT INTO tp_icons VALUES ('438', 'control-play', 'control_play.png');
INSERT INTO tp_icons VALUES ('439', 'control-play-blue', 'control_play_blue.png');
INSERT INTO tp_icons VALUES ('440', 'control-power', 'control_power.png');
INSERT INTO tp_icons VALUES ('441', 'control-power-blue', 'control_power_blue.png');
INSERT INTO tp_icons VALUES ('442', 'control-record', 'control_record.png');
INSERT INTO tp_icons VALUES ('443', 'control-record-blue', 'control_record_blue.png');
INSERT INTO tp_icons VALUES ('444', 'control-remove', 'control_remove.png');
INSERT INTO tp_icons VALUES ('445', 'control-remove-blue', 'control_remove_blue.png');
INSERT INTO tp_icons VALUES ('446', 'control-repeat', 'control_repeat.png');
INSERT INTO tp_icons VALUES ('447', 'control-repeat-blue', 'control_repeat_blue.png');
INSERT INTO tp_icons VALUES ('448', 'control-rewind', 'control_rewind.png');
INSERT INTO tp_icons VALUES ('449', 'control-rewind-blue', 'control_rewind_blue.png');
INSERT INTO tp_icons VALUES ('450', 'control-start', 'control_start.png');
INSERT INTO tp_icons VALUES ('451', 'control-start-blue', 'control_start_blue.png');
INSERT INTO tp_icons VALUES ('452', 'control-stop', 'control_stop.png');
INSERT INTO tp_icons VALUES ('453', 'control-stop-blue', 'control_stop_blue.png');
INSERT INTO tp_icons VALUES ('454', 'controller', 'controller.png');
INSERT INTO tp_icons VALUES ('455', 'controller-add', 'controller_add.png');
INSERT INTO tp_icons VALUES ('456', 'controller-delete', 'controller_delete.png');
INSERT INTO tp_icons VALUES ('457', 'controller-error', 'controller_error.png');
INSERT INTO tp_icons VALUES ('458', 'creditcards', 'creditcards.png');
INSERT INTO tp_icons VALUES ('459', 'cross', 'cross.png');
INSERT INTO tp_icons VALUES ('460', 'cross-octagon', 'cross_octagon.png');
INSERT INTO tp_icons VALUES ('461', 'css', 'css.png');
INSERT INTO tp_icons VALUES ('462', 'css-add', 'css_add.png');
INSERT INTO tp_icons VALUES ('463', 'css-delete', 'css_delete.png');
INSERT INTO tp_icons VALUES ('464', 'css-error', 'css_error.png');
INSERT INTO tp_icons VALUES ('465', 'css-go', 'css_go.png');
INSERT INTO tp_icons VALUES ('466', 'css-valid', 'css_valid.png');
INSERT INTO tp_icons VALUES ('467', 'cup', 'cup.png');
INSERT INTO tp_icons VALUES ('468', 'cup-add', 'cup_add.png');
INSERT INTO tp_icons VALUES ('469', 'cup-black', 'cup_black.png');
INSERT INTO tp_icons VALUES ('470', 'cup-delete', 'cup_delete.png');
INSERT INTO tp_icons VALUES ('471', 'cup-edit', 'cup_edit.png');
INSERT INTO tp_icons VALUES ('472', 'cup-error', 'cup_error.png');
INSERT INTO tp_icons VALUES ('473', 'cup-go', 'cup_go.png');
INSERT INTO tp_icons VALUES ('474', 'cup-green', 'cup_green.png');
INSERT INTO tp_icons VALUES ('475', 'cup-key', 'cup_key.png');
INSERT INTO tp_icons VALUES ('476', 'cup-link', 'cup_link.png');
INSERT INTO tp_icons VALUES ('477', 'cup-tea', 'cup_tea.png');
INSERT INTO tp_icons VALUES ('478', 'cursor', 'cursor.png');
INSERT INTO tp_icons VALUES ('479', 'cursor-small', 'cursor_small.png');
INSERT INTO tp_icons VALUES ('480', 'cut', 'cut.png');
INSERT INTO tp_icons VALUES ('481', 'cut-red', 'cut_red.png');
INSERT INTO tp_icons VALUES ('482', 'database', 'database.png');
INSERT INTO tp_icons VALUES ('483', 'database-add', 'database_add.png');
INSERT INTO tp_icons VALUES ('484', 'database-connect', 'database_connect.png');
INSERT INTO tp_icons VALUES ('485', 'database-copy', 'database_copy.png');
INSERT INTO tp_icons VALUES ('486', 'database-delete', 'database_delete.png');
INSERT INTO tp_icons VALUES ('487', 'database-edit', 'database_edit.png');
INSERT INTO tp_icons VALUES ('488', 'database-error', 'database_error.png');
INSERT INTO tp_icons VALUES ('489', 'database-gear', 'database_gear.png');
INSERT INTO tp_icons VALUES ('490', 'database-go', 'database_go.png');
INSERT INTO tp_icons VALUES ('491', 'database-key', 'database_key.png');
INSERT INTO tp_icons VALUES ('492', 'database-lightning', 'database_lightning.png');
INSERT INTO tp_icons VALUES ('493', 'database-link', 'database_link.png');
INSERT INTO tp_icons VALUES ('494', 'database-refresh', 'database_refresh.png');
INSERT INTO tp_icons VALUES ('495', 'database-save', 'database_save.png');
INSERT INTO tp_icons VALUES ('496', 'database-start', 'database_start.png');
INSERT INTO tp_icons VALUES ('497', 'database-stop', 'database_stop.png');
INSERT INTO tp_icons VALUES ('498', 'database-table', 'database_table.png');
INSERT INTO tp_icons VALUES ('499', 'database-wrench', 'database_wrench.png');
INSERT INTO tp_icons VALUES ('500', 'database-yellow', 'database_yellow.png');
INSERT INTO tp_icons VALUES ('501', 'database-yellow-start', 'database_yellow_start.png');
INSERT INTO tp_icons VALUES ('502', 'database-yellow-stop', 'database_yellow_stop.png');
INSERT INTO tp_icons VALUES ('503', 'date', 'date.png');
INSERT INTO tp_icons VALUES ('504', 'date-add', 'date_add.png');
INSERT INTO tp_icons VALUES ('505', 'date-delete', 'date_delete.png');
INSERT INTO tp_icons VALUES ('506', 'date-edit', 'date_edit.png');
INSERT INTO tp_icons VALUES ('507', 'date-error', 'date_error.png');
INSERT INTO tp_icons VALUES ('508', 'date-go', 'date_go.png');
INSERT INTO tp_icons VALUES ('509', 'date-link', 'date_link.png');
INSERT INTO tp_icons VALUES ('510', 'date-magnify', 'date_magnify.png');
INSERT INTO tp_icons VALUES ('511', 'date-next', 'date_next.png');
INSERT INTO tp_icons VALUES ('512', 'date-previous', 'date_previous.png');
INSERT INTO tp_icons VALUES ('513', 'decline', 'decline.png');
INSERT INTO tp_icons VALUES ('514', 'delete', 'delete.png');
INSERT INTO tp_icons VALUES ('515', 'delete3', 'delete3.png');
INSERT INTO tp_icons VALUES ('516', 'device-stylus', 'device_stylus.png');
INSERT INTO tp_icons VALUES ('517', 'disconnect', 'disconnect.png');
INSERT INTO tp_icons VALUES ('518', 'disk', 'disk.png');
INSERT INTO tp_icons VALUES ('519', 'disk-black', 'disk_black.png');
INSERT INTO tp_icons VALUES ('520', 'disk-black-error', 'disk_black_error.png');
INSERT INTO tp_icons VALUES ('521', 'disk-black-magnify', 'disk_black_magnify.png');
INSERT INTO tp_icons VALUES ('522', 'disk-download', 'disk_download.png');
INSERT INTO tp_icons VALUES ('523', 'disk-edit', 'disk_edit.png');
INSERT INTO tp_icons VALUES ('524', 'disk-error', 'disk_error.png');
INSERT INTO tp_icons VALUES ('525', 'disk-magnify', 'disk_magnify.png');
INSERT INTO tp_icons VALUES ('526', 'disk-multiple', 'disk_multiple.png');
INSERT INTO tp_icons VALUES ('527', 'disk-upload', 'disk_upload.png');
INSERT INTO tp_icons VALUES ('528', 'door', 'door.png');
INSERT INTO tp_icons VALUES ('529', 'door-error', 'door_error.png');
INSERT INTO tp_icons VALUES ('530', 'door-in', 'door_in.png');
INSERT INTO tp_icons VALUES ('531', 'door-open', 'door_open.png');
INSERT INTO tp_icons VALUES ('532', 'door-out', 'door_out.png');
INSERT INTO tp_icons VALUES ('533', 'download', 'download.png');
INSERT INTO tp_icons VALUES ('534', 'drink', 'drink.png');
INSERT INTO tp_icons VALUES ('535', 'drink-empty', 'drink_empty.png');
INSERT INTO tp_icons VALUES ('536', 'drink-red', 'drink_red.png');
INSERT INTO tp_icons VALUES ('537', 'drive', 'drive.png');
INSERT INTO tp_icons VALUES ('538', 'drive-add', 'drive_add.png');
INSERT INTO tp_icons VALUES ('539', 'drive-burn', 'drive_burn.png');
INSERT INTO tp_icons VALUES ('540', 'drive-cd', 'drive_cd.png');
INSERT INTO tp_icons VALUES ('541', 'drive-cd-empty', 'drive_cd_empty.png');
INSERT INTO tp_icons VALUES ('542', 'drive-cdr', 'drive_cdr.png');
INSERT INTO tp_icons VALUES ('543', 'drive-delete', 'drive_delete.png');
INSERT INTO tp_icons VALUES ('544', 'drive-disk', 'drive_disk.png');
INSERT INTO tp_icons VALUES ('545', 'drive-edit', 'drive_edit.png');
INSERT INTO tp_icons VALUES ('546', 'drive-error', 'drive_error.png');
INSERT INTO tp_icons VALUES ('547', 'drive-go', 'drive_go.png');
INSERT INTO tp_icons VALUES ('548', 'drive-key', 'drive_key.png');
INSERT INTO tp_icons VALUES ('549', 'drive-link', 'drive_link.png');
INSERT INTO tp_icons VALUES ('550', 'drive-magnify', 'drive_magnify.png');
INSERT INTO tp_icons VALUES ('551', 'drive-network', 'drive_network.png');
INSERT INTO tp_icons VALUES ('552', 'drive-network-error', 'drive_network_error.png');
INSERT INTO tp_icons VALUES ('553', 'drive-network-stop', 'drive_network_stop.png');
INSERT INTO tp_icons VALUES ('554', 'drive-rename', 'drive_rename.png');
INSERT INTO tp_icons VALUES ('555', 'drive-user', 'drive_user.png');
INSERT INTO tp_icons VALUES ('556', 'drive-web', 'drive_web.png');
INSERT INTO tp_icons VALUES ('557', 'dvd', 'dvd.png');
INSERT INTO tp_icons VALUES ('558', 'dvd-add', 'dvd_add.png');
INSERT INTO tp_icons VALUES ('559', 'dvd-delete', 'dvd_delete.png');
INSERT INTO tp_icons VALUES ('560', 'dvd-edit', 'dvd_edit.png');
INSERT INTO tp_icons VALUES ('561', 'dvd-error', 'dvd_error.png');
INSERT INTO tp_icons VALUES ('562', 'dvd-go', 'dvd_go.png');
INSERT INTO tp_icons VALUES ('563', 'dvd-key', 'dvd_key.png');
INSERT INTO tp_icons VALUES ('564', 'dvd-link', 'dvd_link.png');
INSERT INTO tp_icons VALUES ('565', 'dvd-start', 'dvd_start.png');
INSERT INTO tp_icons VALUES ('566', 'dvd-stop', 'dvd_stop.png');
INSERT INTO tp_icons VALUES ('567', 'edit-clear', 'edit-clear.png');
INSERT INTO tp_icons VALUES ('568', 'edit-add', 'edit_add.png');
INSERT INTO tp_icons VALUES ('569', 'edit-remove', 'edit_remove.png');
INSERT INTO tp_icons VALUES ('570', 'eject-blue', 'eject_blue.png');
INSERT INTO tp_icons VALUES ('571', 'eject-green', 'eject_green.png');
INSERT INTO tp_icons VALUES ('572', 'email', 'email.png');
INSERT INTO tp_icons VALUES ('573', 'email-add', 'email_add.png');
INSERT INTO tp_icons VALUES ('574', 'email-attach', 'email_attach.png');
INSERT INTO tp_icons VALUES ('575', 'email-delete', 'email_delete.png');
INSERT INTO tp_icons VALUES ('576', 'email-edit', 'email_edit.png');
INSERT INTO tp_icons VALUES ('577', 'email-error', 'email_error.png');
INSERT INTO tp_icons VALUES ('578', 'email-go', 'email_go.png');
INSERT INTO tp_icons VALUES ('579', 'email-link', 'email_link.png');
INSERT INTO tp_icons VALUES ('580', 'email-magnify', 'email_magnify.png');
INSERT INTO tp_icons VALUES ('581', 'email-open', 'email_open.png');
INSERT INTO tp_icons VALUES ('582', 'email-open-image', 'email_open_image.png');
INSERT INTO tp_icons VALUES ('583', 'email-star', 'email_star.png');
INSERT INTO tp_icons VALUES ('584', 'email-start', 'email_start.png');
INSERT INTO tp_icons VALUES ('585', 'email-stop', 'email_stop.png');
INSERT INTO tp_icons VALUES ('586', 'email-transfer', 'email_transfer.png');
INSERT INTO tp_icons VALUES ('587', 'emoticon-evilgrin', 'emoticon_evilgrin.png');
INSERT INTO tp_icons VALUES ('588', 'emoticon-grin', 'emoticon_grin.png');
INSERT INTO tp_icons VALUES ('589', 'emoticon-happy', 'emoticon_happy.png');
INSERT INTO tp_icons VALUES ('590', 'emoticon-smile', 'emoticon_smile.png');
INSERT INTO tp_icons VALUES ('591', 'emoticon-surprised', 'emoticon_surprised.png');
INSERT INTO tp_icons VALUES ('592', 'emoticon-tongue', 'emoticon_tongue.png');
INSERT INTO tp_icons VALUES ('593', 'emoticon-unhappy', 'emoticon_unhappy.png');
INSERT INTO tp_icons VALUES ('594', 'emoticon-waii', 'emoticon_waii.png');
INSERT INTO tp_icons VALUES ('595', 'emoticon-wink', 'emoticon_wink.png');
INSERT INTO tp_icons VALUES ('596', 'erase', 'erase.png');
INSERT INTO tp_icons VALUES ('597', 'error', 'error.png');
INSERT INTO tp_icons VALUES ('598', 'error-add', 'error_add.png');
INSERT INTO tp_icons VALUES ('599', 'error-delete', 'error_delete.png');
INSERT INTO tp_icons VALUES ('600', 'error-go', 'error_go.png');
INSERT INTO tp_icons VALUES ('601', 'exclamation', 'exclamation.png');
INSERT INTO tp_icons VALUES ('602', 'export', 'export.png');
INSERT INTO tp_icons VALUES ('603', 'eye', 'eye.png');
INSERT INTO tp_icons VALUES ('604', 'eyes', 'eyes.png');
INSERT INTO tp_icons VALUES ('605', 'feed', 'feed.png');
INSERT INTO tp_icons VALUES ('606', 'feed-add', 'feed_add.png');
INSERT INTO tp_icons VALUES ('607', 'feed-delete', 'feed_delete.png');
INSERT INTO tp_icons VALUES ('608', 'feed-disk', 'feed_disk.png');
INSERT INTO tp_icons VALUES ('609', 'feed-edit', 'feed_edit.png');
INSERT INTO tp_icons VALUES ('610', 'feed-error', 'feed_error.png');
INSERT INTO tp_icons VALUES ('611', 'feed-go', 'feed_go.png');
INSERT INTO tp_icons VALUES ('612', 'feed-key', 'feed_key.png');
INSERT INTO tp_icons VALUES ('613', 'feed-link', 'feed_link.png');
INSERT INTO tp_icons VALUES ('614', 'feed-magnify', 'feed_magnify.png');
INSERT INTO tp_icons VALUES ('615', 'feed-star', 'feed_star.png');
INSERT INTO tp_icons VALUES ('616', 'female', 'female.png');
INSERT INTO tp_icons VALUES ('617', 'filesave', 'filesave.png');
INSERT INTO tp_icons VALUES ('618', 'film', 'film.png');
INSERT INTO tp_icons VALUES ('619', 'film-add', 'film_add.png');
INSERT INTO tp_icons VALUES ('620', 'film-delete', 'film_delete.png');
INSERT INTO tp_icons VALUES ('621', 'film-edit', 'film_edit.png');
INSERT INTO tp_icons VALUES ('622', 'film-eject', 'film_eject.png');
INSERT INTO tp_icons VALUES ('623', 'film-error', 'film_error.png');
INSERT INTO tp_icons VALUES ('624', 'film-go', 'film_go.png');
INSERT INTO tp_icons VALUES ('625', 'film-key', 'film_key.png');
INSERT INTO tp_icons VALUES ('626', 'film-link', 'film_link.png');
INSERT INTO tp_icons VALUES ('627', 'film-magnify', 'film_magnify.png');
INSERT INTO tp_icons VALUES ('628', 'film-save', 'film_save.png');
INSERT INTO tp_icons VALUES ('629', 'film-star', 'film_star.png');
INSERT INTO tp_icons VALUES ('630', 'film-start', 'film_start.png');
INSERT INTO tp_icons VALUES ('631', 'film-stop', 'film_stop.png');
INSERT INTO tp_icons VALUES ('632', 'find', 'find.png');
INSERT INTO tp_icons VALUES ('633', 'finger-point', 'finger_point.png');
INSERT INTO tp_icons VALUES ('634', 'flag-black', 'flag_black.png');
INSERT INTO tp_icons VALUES ('635', 'flag-blue', 'flag_blue.png');
INSERT INTO tp_icons VALUES ('636', 'flag-checked', 'flag_checked.png');
INSERT INTO tp_icons VALUES ('637', 'flag-france', 'flag_france.png');
INSERT INTO tp_icons VALUES ('638', 'flag-green', 'flag_green.png');
INSERT INTO tp_icons VALUES ('639', 'flag-grey', 'flag_grey.png');
INSERT INTO tp_icons VALUES ('640', 'flag-orange', 'flag_orange.png');
INSERT INTO tp_icons VALUES ('641', 'flag-pink', 'flag_pink.png');
INSERT INTO tp_icons VALUES ('642', 'flag-purple', 'flag_purple.png');
INSERT INTO tp_icons VALUES ('643', 'flag-red', 'flag_red.png');
INSERT INTO tp_icons VALUES ('644', 'flag-white', 'flag_white.png');
INSERT INTO tp_icons VALUES ('645', 'flag-yellow', 'flag_yellow.png');
INSERT INTO tp_icons VALUES ('646', 'flower-daisy', 'flower_daisy.png');
INSERT INTO tp_icons VALUES ('647', 'folder', 'folder.png');
INSERT INTO tp_icons VALUES ('648', 'folder-add', 'folder_add.png');
INSERT INTO tp_icons VALUES ('649', 'folder-bell', 'folder_bell.png');
INSERT INTO tp_icons VALUES ('650', 'folder-bookmark', 'folder_bookmark.png');
INSERT INTO tp_icons VALUES ('651', 'folder-brick', 'folder_brick.png');
INSERT INTO tp_icons VALUES ('652', 'folder-bug', 'folder_bug.png');
INSERT INTO tp_icons VALUES ('653', 'folder-camera', 'folder_camera.png');
INSERT INTO tp_icons VALUES ('654', 'folder-connect', 'folder_connect.png');
INSERT INTO tp_icons VALUES ('655', 'folder-database', 'folder_database.png');
INSERT INTO tp_icons VALUES ('656', 'folder-delete', 'folder_delete.png');
INSERT INTO tp_icons VALUES ('657', 'folder-edit', 'folder_edit.png');
INSERT INTO tp_icons VALUES ('658', 'folder-error', 'folder_error.png');
INSERT INTO tp_icons VALUES ('659', 'folder-explore', 'folder_explore.png');
INSERT INTO tp_icons VALUES ('660', 'folder-feed', 'folder_feed.png');
INSERT INTO tp_icons VALUES ('661', 'folder-film', 'folder_film.png');
INSERT INTO tp_icons VALUES ('662', 'folder-find', 'folder_find.png');
INSERT INTO tp_icons VALUES ('663', 'folder-font', 'folder_font.png');
INSERT INTO tp_icons VALUES ('664', 'folder-go', 'folder_go.png');
INSERT INTO tp_icons VALUES ('665', 'folder-heart', 'folder_heart.png');
INSERT INTO tp_icons VALUES ('666', 'folder-home', 'folder_home.png');
INSERT INTO tp_icons VALUES ('667', 'folder-image', 'folder_image.png');
INSERT INTO tp_icons VALUES ('668', 'folder-key', 'folder_key.png');
INSERT INTO tp_icons VALUES ('669', 'folder-lightbulb', 'folder_lightbulb.png');
INSERT INTO tp_icons VALUES ('670', 'folder-link', 'folder_link.png');
INSERT INTO tp_icons VALUES ('671', 'folder-magnify', 'folder_magnify.png');
INSERT INTO tp_icons VALUES ('672', 'folder-page', 'folder_page.png');
INSERT INTO tp_icons VALUES ('673', 'folder-page-white', 'folder_page_white.png');
INSERT INTO tp_icons VALUES ('674', 'folder-palette', 'folder_palette.png');
INSERT INTO tp_icons VALUES ('675', 'folder-picture', 'folder_picture.png');
INSERT INTO tp_icons VALUES ('676', 'folder-star', 'folder_star.png');
INSERT INTO tp_icons VALUES ('677', 'folder-table', 'folder_table.png');
INSERT INTO tp_icons VALUES ('678', 'folder-up', 'folder_up.png');
INSERT INTO tp_icons VALUES ('679', 'folder-user', 'folder_user.png');
INSERT INTO tp_icons VALUES ('680', 'folder-wrench', 'folder_wrench.png');
INSERT INTO tp_icons VALUES ('681', 'font', 'font.png');
INSERT INTO tp_icons VALUES ('682', 'font-add', 'font_add.png');
INSERT INTO tp_icons VALUES ('683', 'font-color', 'font_color.png');
INSERT INTO tp_icons VALUES ('684', 'font-delete', 'font_delete.png');
INSERT INTO tp_icons VALUES ('685', 'font-go', 'font_go.png');
INSERT INTO tp_icons VALUES ('686', 'font-larger', 'font_larger.png');
INSERT INTO tp_icons VALUES ('687', 'font-smaller', 'font_smaller.png');
INSERT INTO tp_icons VALUES ('688', 'forward-blue', 'forward_blue.png');
INSERT INTO tp_icons VALUES ('689', 'forward-green', 'forward_green.png');
INSERT INTO tp_icons VALUES ('690', 'group', 'group.png');
INSERT INTO tp_icons VALUES ('691', 'group32', 'group32.png');
INSERT INTO tp_icons VALUES ('692', 'group-add', 'group_add.png');
INSERT INTO tp_icons VALUES ('693', 'group-delete', 'group_delete.png');
INSERT INTO tp_icons VALUES ('694', 'group-edit', 'group_edit.png');
INSERT INTO tp_icons VALUES ('695', 'group-error', 'group_error.png');
INSERT INTO tp_icons VALUES ('696', 'group-gear', 'group_gear.png');
INSERT INTO tp_icons VALUES ('697', 'group-go', 'group_go.png');
INSERT INTO tp_icons VALUES ('698', 'group-key', 'group_key.png');
INSERT INTO tp_icons VALUES ('699', 'group-link', 'group_link.png');
INSERT INTO tp_icons VALUES ('700', 'heart', 'heart.png');
INSERT INTO tp_icons VALUES ('701', 'heart-add', 'heart_add.png');
INSERT INTO tp_icons VALUES ('702', 'heart-broken', 'heart_broken.png');
INSERT INTO tp_icons VALUES ('703', 'heart-connect', 'heart_connect.png');
INSERT INTO tp_icons VALUES ('704', 'heart-delete', 'heart_delete.png');
INSERT INTO tp_icons VALUES ('705', 'help', 'help.png');
INSERT INTO tp_icons VALUES ('706', 'hourglass', 'hourglass.png');
INSERT INTO tp_icons VALUES ('707', 'hourglass-add', 'hourglass_add.png');
INSERT INTO tp_icons VALUES ('708', 'hourglass-delete', 'hourglass_delete.png');
INSERT INTO tp_icons VALUES ('709', 'hourglass-go', 'hourglass_go.png');
INSERT INTO tp_icons VALUES ('710', 'hourglass-link', 'hourglass_link.png');
INSERT INTO tp_icons VALUES ('711', 'house', 'house.png');
INSERT INTO tp_icons VALUES ('712', 'house-connect', 'house_connect.png');
INSERT INTO tp_icons VALUES ('713', 'house-go', 'house_go.png');
INSERT INTO tp_icons VALUES ('714', 'house-in', 'house_in.png');
INSERT INTO tp_icons VALUES ('715', 'house-key', 'house_key.png');
INSERT INTO tp_icons VALUES ('716', 'house-link', 'house_link.png');
INSERT INTO tp_icons VALUES ('717', 'house-star', 'house_star.png');
INSERT INTO tp_icons VALUES ('718', 'html', 'html.png');
INSERT INTO tp_icons VALUES ('719', 'html-add', 'html_add.png');
INSERT INTO tp_icons VALUES ('720', 'html-delete', 'html_delete.png');
INSERT INTO tp_icons VALUES ('721', 'html-error', 'html_error.png');
INSERT INTO tp_icons VALUES ('722', 'html-go', 'html_go.png');
INSERT INTO tp_icons VALUES ('723', 'html-valid', 'html_valid.png');
INSERT INTO tp_icons VALUES ('724', 'image', 'image.png');
INSERT INTO tp_icons VALUES ('725', 'image-add', 'image_add.png');
INSERT INTO tp_icons VALUES ('726', 'image-delete', 'image_delete.png');
INSERT INTO tp_icons VALUES ('727', 'image-edit', 'image_edit.png');
INSERT INTO tp_icons VALUES ('728', 'image-link', 'image_link.png');
INSERT INTO tp_icons VALUES ('729', 'image-magnify', 'image_magnify.png');
INSERT INTO tp_icons VALUES ('730', 'image-star', 'image_star.png');
INSERT INTO tp_icons VALUES ('731', 'images', 'images.png');
INSERT INTO tp_icons VALUES ('732', 'information', 'information.png');
INSERT INTO tp_icons VALUES ('733', 'ipod', 'ipod.png');
INSERT INTO tp_icons VALUES ('734', 'ipod-cast', 'ipod_cast.png');
INSERT INTO tp_icons VALUES ('735', 'ipod-cast-add', 'ipod_cast_add.png');
INSERT INTO tp_icons VALUES ('736', 'ipod-cast-delete', 'ipod_cast_delete.png');
INSERT INTO tp_icons VALUES ('737', 'ipod-connect', 'ipod_connect.png');
INSERT INTO tp_icons VALUES ('738', 'ipod-nano', 'ipod_nano.png');
INSERT INTO tp_icons VALUES ('739', 'ipod-nano-connect', 'ipod_nano_connect.png');
INSERT INTO tp_icons VALUES ('740', 'ipod-sound', 'ipod_sound.png');
INSERT INTO tp_icons VALUES ('741', 'joystick', 'joystick.png');
INSERT INTO tp_icons VALUES ('742', 'joystick-add', 'joystick_add.png');
INSERT INTO tp_icons VALUES ('743', 'joystick-connect', 'joystick_connect.png');
INSERT INTO tp_icons VALUES ('744', 'joystick-delete', 'joystick_delete.png');
INSERT INTO tp_icons VALUES ('745', 'joystick-error', 'joystick_error.png');
INSERT INTO tp_icons VALUES ('746', 'key', 'key.png');
INSERT INTO tp_icons VALUES ('747', 'key-add', 'key_add.png');
INSERT INTO tp_icons VALUES ('748', 'key-delete', 'key_delete.png');
INSERT INTO tp_icons VALUES ('749', 'key-go', 'key_go.png');
INSERT INTO tp_icons VALUES ('750', 'key-start', 'key_start.png');
INSERT INTO tp_icons VALUES ('751', 'key-stop', 'key_stop.png');
INSERT INTO tp_icons VALUES ('752', 'keyboard', 'keyboard.png');
INSERT INTO tp_icons VALUES ('753', 'keyboard-add', 'keyboard_add.png');
INSERT INTO tp_icons VALUES ('754', 'keyboard-connect', 'keyboard_connect.png');
INSERT INTO tp_icons VALUES ('755', 'keyboard-delete', 'keyboard_delete.png');
INSERT INTO tp_icons VALUES ('756', 'keyboard-magnify', 'keyboard_magnify.png');
INSERT INTO tp_icons VALUES ('757', 'laptop', 'laptop.png');
INSERT INTO tp_icons VALUES ('758', 'laptop-add', 'laptop_add.png');
INSERT INTO tp_icons VALUES ('759', 'laptop-connect', 'laptop_connect.png');
INSERT INTO tp_icons VALUES ('760', 'laptop-delete', 'laptop_delete.png');
INSERT INTO tp_icons VALUES ('761', 'laptop-disk', 'laptop_disk.png');
INSERT INTO tp_icons VALUES ('762', 'laptop-edit', 'laptop_edit.png');
INSERT INTO tp_icons VALUES ('763', 'laptop-error', 'laptop_error.png');
INSERT INTO tp_icons VALUES ('764', 'laptop-go', 'laptop_go.png');
INSERT INTO tp_icons VALUES ('765', 'laptop-key', 'laptop_key.png');
INSERT INTO tp_icons VALUES ('766', 'laptop-link', 'laptop_link.png');
INSERT INTO tp_icons VALUES ('767', 'laptop-magnify', 'laptop_magnify.png');
INSERT INTO tp_icons VALUES ('768', 'laptop-start', 'laptop_start.png');
INSERT INTO tp_icons VALUES ('769', 'laptop-stop', 'laptop_stop.png');
INSERT INTO tp_icons VALUES ('770', 'laptop-wrench', 'laptop_wrench.png');
INSERT INTO tp_icons VALUES ('771', 'layers', 'layers.png');
INSERT INTO tp_icons VALUES ('772', 'layout', 'layout.png');
INSERT INTO tp_icons VALUES ('773', 'layout-add', 'layout_add.png');
INSERT INTO tp_icons VALUES ('774', 'layout-content', 'layout_content.png');
INSERT INTO tp_icons VALUES ('775', 'layout-delete', 'layout_delete.png');
INSERT INTO tp_icons VALUES ('776', 'layout-edit', 'layout_edit.png');
INSERT INTO tp_icons VALUES ('777', 'layout-error', 'layout_error.png');
INSERT INTO tp_icons VALUES ('778', 'layout-header', 'layout_header.png');
INSERT INTO tp_icons VALUES ('779', 'layout-key', 'layout_key.png');
INSERT INTO tp_icons VALUES ('780', 'layout-lightning', 'layout_lightning.png');
INSERT INTO tp_icons VALUES ('781', 'layout-link', 'layout_link.png');
INSERT INTO tp_icons VALUES ('782', 'layout-sidebar', 'layout_sidebar.png');
INSERT INTO tp_icons VALUES ('783', 'lightbulb', 'lightbulb.png');
INSERT INTO tp_icons VALUES ('784', 'lightbulb-add', 'lightbulb_add.png');
INSERT INTO tp_icons VALUES ('785', 'lightbulb-delete', 'lightbulb_delete.png');
INSERT INTO tp_icons VALUES ('786', 'lightbulb-off', 'lightbulb_off.png');
INSERT INTO tp_icons VALUES ('787', 'lightning', 'lightning.png');
INSERT INTO tp_icons VALUES ('788', 'lightning-add', 'lightning_add.png');
INSERT INTO tp_icons VALUES ('789', 'lightning-delete', 'lightning_delete.png');
INSERT INTO tp_icons VALUES ('790', 'lightning-go', 'lightning_go.png');
INSERT INTO tp_icons VALUES ('791', 'link', 'link.png');
INSERT INTO tp_icons VALUES ('792', 'link-add', 'link_add.png');
INSERT INTO tp_icons VALUES ('793', 'link-break', 'link_break.png');
INSERT INTO tp_icons VALUES ('794', 'link-delete', 'link_delete.png');
INSERT INTO tp_icons VALUES ('795', 'link-edit', 'link_edit.png');
INSERT INTO tp_icons VALUES ('796', 'link-error', 'link_error.png');
INSERT INTO tp_icons VALUES ('797', 'link-go', 'link_go.png');
INSERT INTO tp_icons VALUES ('798', 'lock', 'lock.png');
INSERT INTO tp_icons VALUES ('799', 'lock-add', 'lock_add.png');
INSERT INTO tp_icons VALUES ('800', 'lock-break', 'lock_break.png');
INSERT INTO tp_icons VALUES ('801', 'lock-delete', 'lock_delete.png');
INSERT INTO tp_icons VALUES ('802', 'lock-edit', 'lock_edit.png');
INSERT INTO tp_icons VALUES ('803', 'lock-go', 'lock_go.png');
INSERT INTO tp_icons VALUES ('804', 'lock-key', 'lock_key.png');
INSERT INTO tp_icons VALUES ('805', 'lock-open', 'lock_open.png');
INSERT INTO tp_icons VALUES ('806', 'lock-start', 'lock_start.png');
INSERT INTO tp_icons VALUES ('807', 'lock-stop', 'lock_stop.png');
INSERT INTO tp_icons VALUES ('808', 'lorry', 'lorry.png');
INSERT INTO tp_icons VALUES ('809', 'lorry-add', 'lorry_add.png');
INSERT INTO tp_icons VALUES ('810', 'lorry-delete', 'lorry_delete.png');
INSERT INTO tp_icons VALUES ('811', 'lorry-error', 'lorry_error.png');
INSERT INTO tp_icons VALUES ('812', 'lorry-flatbed', 'lorry_flatbed.png');
INSERT INTO tp_icons VALUES ('813', 'lorry-go', 'lorry_go.png');
INSERT INTO tp_icons VALUES ('814', 'lorry-link', 'lorry_link.png');
INSERT INTO tp_icons VALUES ('815', 'lorry-start', 'lorry_start.png');
INSERT INTO tp_icons VALUES ('816', 'lorry-stop', 'lorry_stop.png');
INSERT INTO tp_icons VALUES ('817', 'magifier-zoom-out', 'magifier_zoom_out.png');
INSERT INTO tp_icons VALUES ('818', 'magnifier', 'magnifier.png');
INSERT INTO tp_icons VALUES ('819', 'magnifier-zoom-in', 'magnifier_zoom_in.png');
INSERT INTO tp_icons VALUES ('820', 'mail', 'mail.png');
INSERT INTO tp_icons VALUES ('821', 'male', 'male.png');
INSERT INTO tp_icons VALUES ('822', 'map', 'map.png');
INSERT INTO tp_icons VALUES ('823', 'map-add', 'map_add.png');
INSERT INTO tp_icons VALUES ('824', 'map-clipboard', 'map_clipboard.png');
INSERT INTO tp_icons VALUES ('825', 'map-cursor', 'map_cursor.png');
INSERT INTO tp_icons VALUES ('826', 'map-delete', 'map_delete.png');
INSERT INTO tp_icons VALUES ('827', 'map-edit', 'map_edit.png');
INSERT INTO tp_icons VALUES ('828', 'map-error', 'map_error.png');
INSERT INTO tp_icons VALUES ('829', 'map-go', 'map_go.png');
INSERT INTO tp_icons VALUES ('830', 'map-link', 'map_link.png');
INSERT INTO tp_icons VALUES ('831', 'map-magnify', 'map_magnify.png');
INSERT INTO tp_icons VALUES ('832', 'map-start', 'map_start.png');
INSERT INTO tp_icons VALUES ('833', 'map-stop', 'map_stop.png');
INSERT INTO tp_icons VALUES ('834', 'medal-bronze-1', 'medal_bronze_1.png');
INSERT INTO tp_icons VALUES ('835', 'medal-bronze-2', 'medal_bronze_2.png');
INSERT INTO tp_icons VALUES ('836', 'medal-bronze-3', 'medal_bronze_3.png');
INSERT INTO tp_icons VALUES ('837', 'medal-bronze-add', 'medal_bronze_add.png');
INSERT INTO tp_icons VALUES ('838', 'medal-bronze-delete', 'medal_bronze_delete.png');
INSERT INTO tp_icons VALUES ('839', 'medal-gold-1', 'medal_gold_1.png');
INSERT INTO tp_icons VALUES ('840', 'medal-gold-2', 'medal_gold_2.png');
INSERT INTO tp_icons VALUES ('841', 'medal-gold-3', 'medal_gold_3.png');
INSERT INTO tp_icons VALUES ('842', 'medal-gold-add', 'medal_gold_add.png');
INSERT INTO tp_icons VALUES ('843', 'medal-gold-delete', 'medal_gold_delete.png');
INSERT INTO tp_icons VALUES ('844', 'medal-silver-1', 'medal_silver_1.png');
INSERT INTO tp_icons VALUES ('845', 'medal-silver-2', 'medal_silver_2.png');
INSERT INTO tp_icons VALUES ('846', 'medal-silver-3', 'medal_silver_3.png');
INSERT INTO tp_icons VALUES ('847', 'medal-silver-add', 'medal_silver_add.png');
INSERT INTO tp_icons VALUES ('848', 'medal-silver-delete', 'medal_silver_delete.png');
INSERT INTO tp_icons VALUES ('849', 'menu-rightarrow', 'menu_rightarrow.png');
INSERT INTO tp_icons VALUES ('850', 'mini-add', 'mini_add.png');
INSERT INTO tp_icons VALUES ('851', 'mini-edit', 'mini_edit.png');
INSERT INTO tp_icons VALUES ('852', 'mini-refresh', 'mini_refresh.png');
INSERT INTO tp_icons VALUES ('853', 'money', 'money.png');
INSERT INTO tp_icons VALUES ('854', 'money-add', 'money_add.png');
INSERT INTO tp_icons VALUES ('855', 'money-delete', 'money_delete.png');
INSERT INTO tp_icons VALUES ('856', 'money-dollar', 'money_dollar.png');
INSERT INTO tp_icons VALUES ('857', 'money-euro', 'money_euro.png');
INSERT INTO tp_icons VALUES ('858', 'money-pound', 'money_pound.png');
INSERT INTO tp_icons VALUES ('859', 'money-yen', 'money_yen.png');
INSERT INTO tp_icons VALUES ('860', 'monitor', 'monitor.png');
INSERT INTO tp_icons VALUES ('861', 'monitor-add', 'monitor_add.png');
INSERT INTO tp_icons VALUES ('862', 'monitor-delete', 'monitor_delete.png');
INSERT INTO tp_icons VALUES ('863', 'monitor-edit', 'monitor_edit.png');
INSERT INTO tp_icons VALUES ('864', 'monitor-error', 'monitor_error.png');
INSERT INTO tp_icons VALUES ('865', 'monitor-go', 'monitor_go.png');
INSERT INTO tp_icons VALUES ('866', 'monitor-key', 'monitor_key.png');
INSERT INTO tp_icons VALUES ('867', 'monitor-lightning', 'monitor_lightning.png');
INSERT INTO tp_icons VALUES ('868', 'monitor-link', 'monitor_link.png');
INSERT INTO tp_icons VALUES ('869', 'moon-full', 'moon_full.png');
INSERT INTO tp_icons VALUES ('870', 'mouse', 'mouse.png');
INSERT INTO tp_icons VALUES ('871', 'mouse-add', 'mouse_add.png');
INSERT INTO tp_icons VALUES ('872', 'mouse-delete', 'mouse_delete.png');
INSERT INTO tp_icons VALUES ('873', 'mouse-error', 'mouse_error.png');
INSERT INTO tp_icons VALUES ('874', 'music', 'music.png');
INSERT INTO tp_icons VALUES ('875', 'music-note', 'music_note.png');
INSERT INTO tp_icons VALUES ('876', 'neighbourhood', 'neighbourhood.png');
INSERT INTO tp_icons VALUES ('877', 'new', 'new.png');
INSERT INTO tp_icons VALUES ('878', 'new-blue', 'new_blue.png');
INSERT INTO tp_icons VALUES ('879', 'new-red', 'new_red.png');
INSERT INTO tp_icons VALUES ('880', 'newspaper', 'newspaper.png');
INSERT INTO tp_icons VALUES ('881', 'newspaper-add', 'newspaper_add.png');
INSERT INTO tp_icons VALUES ('882', 'newspaper-delete', 'newspaper_delete.png');
INSERT INTO tp_icons VALUES ('883', 'newspaper-go', 'newspaper_go.png');
INSERT INTO tp_icons VALUES ('884', 'newspaper-link', 'newspaper_link.png');
INSERT INTO tp_icons VALUES ('885', 'next-green', 'next-green.png');
INSERT INTO tp_icons VALUES ('886', 'next', 'next.png');
INSERT INTO tp_icons VALUES ('887', 'next-blue', 'next_blue.png');
INSERT INTO tp_icons VALUES ('888', 'next-green', 'next_green.png');
INSERT INTO tp_icons VALUES ('889', 'no', 'no.png');
INSERT INTO tp_icons VALUES ('890', 'node-tree16', 'node_tree16.png');
INSERT INTO tp_icons VALUES ('891', 'node-tree32', 'node_tree32.png');
INSERT INTO tp_icons VALUES ('892', 'note', 'note.png');
INSERT INTO tp_icons VALUES ('893', 'note-add', 'note_add.png');
INSERT INTO tp_icons VALUES ('894', 'note-delete', 'note_delete.png');
INSERT INTO tp_icons VALUES ('895', 'note-edit', 'note_edit.png');
INSERT INTO tp_icons VALUES ('896', 'note-error', 'note_error.png');
INSERT INTO tp_icons VALUES ('897', 'note-go', 'note_go.png');
INSERT INTO tp_icons VALUES ('898', 'ok', 'ok.png');
INSERT INTO tp_icons VALUES ('899', 'org32', 'org32.png');
INSERT INTO tp_icons VALUES ('900', 'organization', 'organization.png');
INSERT INTO tp_icons VALUES ('901', 'outline', 'outline.png');
INSERT INTO tp_icons VALUES ('902', 'overlays', 'overlays.png');
INSERT INTO tp_icons VALUES ('903', 'package', 'package.png');
INSERT INTO tp_icons VALUES ('904', 'package-add', 'package_add.png');
INSERT INTO tp_icons VALUES ('905', 'package-delete', 'package_delete.png');
INSERT INTO tp_icons VALUES ('906', 'package-down', 'package_down.png');
INSERT INTO tp_icons VALUES ('907', 'package-go', 'package_go.png');
INSERT INTO tp_icons VALUES ('908', 'package-green', 'package_green.png');
INSERT INTO tp_icons VALUES ('909', 'package-in', 'package_in.png');
INSERT INTO tp_icons VALUES ('910', 'package-link', 'package_link.png');
INSERT INTO tp_icons VALUES ('911', 'package-se', 'package_se.png');
INSERT INTO tp_icons VALUES ('912', 'package-start', 'package_start.png');
INSERT INTO tp_icons VALUES ('913', 'package-stop', 'package_stop.png');
INSERT INTO tp_icons VALUES ('914', 'package-system', 'package_system.png');
INSERT INTO tp_icons VALUES ('915', 'package-white', 'package_white.png');
INSERT INTO tp_icons VALUES ('916', 'page', 'page.png');
INSERT INTO tp_icons VALUES ('917', 'page-add', 'page_add.png');
INSERT INTO tp_icons VALUES ('918', 'page-attach', 'page_attach.png');
INSERT INTO tp_icons VALUES ('919', 'page-back', 'page_back.png');
INSERT INTO tp_icons VALUES ('920', 'page-break', 'page_break.png');
INSERT INTO tp_icons VALUES ('921', 'page-break-insert', 'page_break_insert.png');
INSERT INTO tp_icons VALUES ('922', 'page-cancel', 'page_cancel.png');
INSERT INTO tp_icons VALUES ('923', 'page-code', 'page_code.png');
INSERT INTO tp_icons VALUES ('924', 'page-copy', 'page_copy.png');
INSERT INTO tp_icons VALUES ('925', 'page-delete', 'page_delete.png');
INSERT INTO tp_icons VALUES ('926', 'page-edit', 'page_edit.png');
INSERT INTO tp_icons VALUES ('927', 'page-error', 'page_error.png');
INSERT INTO tp_icons VALUES ('928', 'page-excel', 'page_excel.png');
INSERT INTO tp_icons VALUES ('929', 'page-find', 'page_find.png');
INSERT INTO tp_icons VALUES ('930', 'page-forward', 'page_forward.png');
INSERT INTO tp_icons VALUES ('931', 'page-gear', 'page_gear.png');
INSERT INTO tp_icons VALUES ('932', 'page-go', 'page_go.png');
INSERT INTO tp_icons VALUES ('933', 'page-green', 'page_green.png');
INSERT INTO tp_icons VALUES ('934', 'page-header-footer', 'page_header_footer.png');
INSERT INTO tp_icons VALUES ('935', 'page-key', 'page_key.png');
INSERT INTO tp_icons VALUES ('936', 'page-landscape', 'page_landscape.png');
INSERT INTO tp_icons VALUES ('937', 'page-landscape-shot', 'page_landscape_shot.png');
INSERT INTO tp_icons VALUES ('938', 'page-lightning', 'page_lightning.png');
INSERT INTO tp_icons VALUES ('939', 'page-link', 'page_link.png');
INSERT INTO tp_icons VALUES ('940', 'page-magnify', 'page_magnify.png');
INSERT INTO tp_icons VALUES ('941', 'page-paintbrush', 'page_paintbrush.png');
INSERT INTO tp_icons VALUES ('942', 'page-paste', 'page_paste.png');
INSERT INTO tp_icons VALUES ('943', 'page-portrait', 'page_portrait.png');
INSERT INTO tp_icons VALUES ('944', 'page-portrait-shot', 'page_portrait_shot.png');
INSERT INTO tp_icons VALUES ('945', 'page-red', 'page_red.png');
INSERT INTO tp_icons VALUES ('946', 'page-refresh', 'page_refresh.png');
INSERT INTO tp_icons VALUES ('947', 'page-save', 'page_save.png');
INSERT INTO tp_icons VALUES ('948', 'page-white', 'page_white.png');
INSERT INTO tp_icons VALUES ('949', 'page-white-acrobat', 'page_white_acrobat.png');
INSERT INTO tp_icons VALUES ('950', 'page-white-actionscript', 'page_white_actionscript.png');
INSERT INTO tp_icons VALUES ('951', 'page-white-add', 'page_white_add.png');
INSERT INTO tp_icons VALUES ('952', 'page-white-break', 'page_white_break.png');
INSERT INTO tp_icons VALUES ('953', 'page-white-c', 'page_white_c.png');
INSERT INTO tp_icons VALUES ('954', 'page-white-camera', 'page_white_camera.png');
INSERT INTO tp_icons VALUES ('955', 'page-white-cd', 'page_white_cd.png');
INSERT INTO tp_icons VALUES ('956', 'page-white-cdr', 'page_white_cdr.png');
INSERT INTO tp_icons VALUES ('957', 'page-white-code', 'page_white_code.png');
INSERT INTO tp_icons VALUES ('958', 'page-white-code-red', 'page_white_code_red.png');
INSERT INTO tp_icons VALUES ('959', 'page-white-coldfusion', 'page_white_coldfusion.png');
INSERT INTO tp_icons VALUES ('960', 'page-white-compressed', 'page_white_compressed.png');
INSERT INTO tp_icons VALUES ('961', 'page-white-connect', 'page_white_connect.png');
INSERT INTO tp_icons VALUES ('962', 'page-white-copy', 'page_white_copy.png');
INSERT INTO tp_icons VALUES ('963', 'page-white-cplusplus', 'page_white_cplusplus.png');
INSERT INTO tp_icons VALUES ('964', 'page-white-csharp', 'page_white_csharp.png');
INSERT INTO tp_icons VALUES ('965', 'page-white-cup', 'page_white_cup.png');
INSERT INTO tp_icons VALUES ('966', 'page-white-database', 'page_white_database.png');
INSERT INTO tp_icons VALUES ('967', 'page-white-database-yellow', 'page_white_database_yellow.png');
INSERT INTO tp_icons VALUES ('968', 'page-white-delete', 'page_white_delete.png');
INSERT INTO tp_icons VALUES ('969', 'page-white-dvd', 'page_white_dvd.png');
INSERT INTO tp_icons VALUES ('970', 'page-white-edit', 'page_white_edit.png');
INSERT INTO tp_icons VALUES ('971', 'page-white-error', 'page_white_error.png');
INSERT INTO tp_icons VALUES ('972', 'page-white-excel', 'page_white_excel.png');
INSERT INTO tp_icons VALUES ('973', 'page-white-find', 'page_white_find.png');
INSERT INTO tp_icons VALUES ('974', 'page-white-flash', 'page_white_flash.png');
INSERT INTO tp_icons VALUES ('975', 'page-white-font', 'page_white_font.png');
INSERT INTO tp_icons VALUES ('976', 'page-white-freehand', 'page_white_freehand.png');
INSERT INTO tp_icons VALUES ('977', 'page-white-gear', 'page_white_gear.png');
INSERT INTO tp_icons VALUES ('978', 'page-white-get', 'page_white_get.png');
INSERT INTO tp_icons VALUES ('979', 'page-white-go', 'page_white_go.png');
INSERT INTO tp_icons VALUES ('980', 'page-white-h', 'page_white_h.png');
INSERT INTO tp_icons VALUES ('981', 'page-white-horizontal', 'page_white_horizontal.png');
INSERT INTO tp_icons VALUES ('982', 'page-white-key', 'page_white_key.png');
INSERT INTO tp_icons VALUES ('983', 'page-white-lightning', 'page_white_lightning.png');
INSERT INTO tp_icons VALUES ('984', 'page-white-link', 'page_white_link.png');
INSERT INTO tp_icons VALUES ('985', 'page-white-magnify', 'page_white_magnify.png');
INSERT INTO tp_icons VALUES ('986', 'page-white-medal', 'page_white_medal.png');
INSERT INTO tp_icons VALUES ('987', 'page-white-office', 'page_white_office.png');
INSERT INTO tp_icons VALUES ('988', 'page-white-paint', 'page_white_paint.png');
INSERT INTO tp_icons VALUES ('989', 'page-white-paintbrush', 'page_white_paintbrush.png');
INSERT INTO tp_icons VALUES ('990', 'page-white-paste', 'page_white_paste.png');
INSERT INTO tp_icons VALUES ('991', 'page-white-paste-table', 'page_white_paste_table.png');
INSERT INTO tp_icons VALUES ('992', 'page-white-php', 'page_white_php.png');
INSERT INTO tp_icons VALUES ('993', 'page-white-picture', 'page_white_picture.png');
INSERT INTO tp_icons VALUES ('994', 'page-white-powerpoint', 'page_white_powerpoint.png');
INSERT INTO tp_icons VALUES ('995', 'page-white-put', 'page_white_put.png');
INSERT INTO tp_icons VALUES ('996', 'page-white-refresh', 'page_white_refresh.png');
INSERT INTO tp_icons VALUES ('997', 'page-white-ruby', 'page_white_ruby.png');
INSERT INTO tp_icons VALUES ('998', 'page-white-side-by-side', 'page_white_side_by_side.png');
INSERT INTO tp_icons VALUES ('999', 'page-white-stack', 'page_white_stack.png');
INSERT INTO tp_icons VALUES ('1000', 'page-white-star', 'page_white_star.png');
INSERT INTO tp_icons VALUES ('1001', 'page-white-swoosh', 'page_white_swoosh.png');
INSERT INTO tp_icons VALUES ('1002', 'page-white-text', 'page_white_text.png');
INSERT INTO tp_icons VALUES ('1003', 'page-white-text-width', 'page_white_text_width.png');
INSERT INTO tp_icons VALUES ('1004', 'page-white-tux', 'page_white_tux.png');
INSERT INTO tp_icons VALUES ('1005', 'page-white-vector', 'page_white_vector.png');
INSERT INTO tp_icons VALUES ('1006', 'page-white-visualstudio', 'page_white_visualstudio.png');
INSERT INTO tp_icons VALUES ('1007', 'page-white-width', 'page_white_width.png');
INSERT INTO tp_icons VALUES ('1008', 'page-white-word', 'page_white_word.png');
INSERT INTO tp_icons VALUES ('1009', 'page-white-world', 'page_white_world.png');
INSERT INTO tp_icons VALUES ('1010', 'page-white-wrench', 'page_white_wrench.png');
INSERT INTO tp_icons VALUES ('1011', 'page-white-zip', 'page_white_zip.png');
INSERT INTO tp_icons VALUES ('1012', 'page-word', 'page_word.png');
INSERT INTO tp_icons VALUES ('1013', 'page-world', 'page_world.png');
INSERT INTO tp_icons VALUES ('1014', 'paint', 'paint.png');
INSERT INTO tp_icons VALUES ('1015', 'paint-can-brush', 'paint_can_brush.png');
INSERT INTO tp_icons VALUES ('1016', 'paintbrush', 'paintbrush.png');
INSERT INTO tp_icons VALUES ('1017', 'paintbrush-color', 'paintbrush_color.png');
INSERT INTO tp_icons VALUES ('1018', 'paintcan', 'paintcan.png');
INSERT INTO tp_icons VALUES ('1019', 'paintcan-red', 'paintcan_red.png');
INSERT INTO tp_icons VALUES ('1020', 'palette', 'palette.png');
INSERT INTO tp_icons VALUES ('1021', 'paste-plain', 'paste_plain.png');
INSERT INTO tp_icons VALUES ('1022', 'paste-word', 'paste_word.png');
INSERT INTO tp_icons VALUES ('1023', 'pause-blue', 'pause_blue.png');
INSERT INTO tp_icons VALUES ('1024', 'pause-green', 'pause_green.png');
INSERT INTO tp_icons VALUES ('1025', 'pause-record', 'pause_record.png');
INSERT INTO tp_icons VALUES ('1026', 'pencil', 'pencil.png');
INSERT INTO tp_icons VALUES ('1027', 'pencil-add', 'pencil_add.png');
INSERT INTO tp_icons VALUES ('1028', 'pencil-delete', 'pencil_delete.png');
INSERT INTO tp_icons VALUES ('1029', 'pencil-go', 'pencil_go.png');
INSERT INTO tp_icons VALUES ('1030', 'personal', 'personal.png');
INSERT INTO tp_icons VALUES ('1031', 'phone', 'phone.png');
INSERT INTO tp_icons VALUES ('1032', 'phone-add', 'phone_add.png');
INSERT INTO tp_icons VALUES ('1033', 'phone-delete', 'phone_delete.png');
INSERT INTO tp_icons VALUES ('1034', 'phone-edit', 'phone_edit.png');
INSERT INTO tp_icons VALUES ('1035', 'phone-error', 'phone_error.png');
INSERT INTO tp_icons VALUES ('1036', 'phone-go', 'phone_go.png');
INSERT INTO tp_icons VALUES ('1037', 'phone-key', 'phone_key.png');
INSERT INTO tp_icons VALUES ('1038', 'phone-link', 'phone_link.png');
INSERT INTO tp_icons VALUES ('1039', 'phone-sound', 'phone_sound.png');
INSERT INTO tp_icons VALUES ('1040', 'phone-start', 'phone_start.png');
INSERT INTO tp_icons VALUES ('1041', 'phone-stop', 'phone_stop.png');
INSERT INTO tp_icons VALUES ('1042', 'photo', 'photo.png');
INSERT INTO tp_icons VALUES ('1043', 'photo-add', 'photo_add.png');
INSERT INTO tp_icons VALUES ('1044', 'photo-delete', 'photo_delete.png');
INSERT INTO tp_icons VALUES ('1045', 'photo-edit', 'photo_edit.png');
INSERT INTO tp_icons VALUES ('1046', 'photo-link', 'photo_link.png');
INSERT INTO tp_icons VALUES ('1047', 'photo-paint', 'photo_paint.png');
INSERT INTO tp_icons VALUES ('1048', 'photos', 'photos.png');
INSERT INTO tp_icons VALUES ('1049', 'picture', 'picture.png');
INSERT INTO tp_icons VALUES ('1050', 'picture-add', 'picture_add.png');
INSERT INTO tp_icons VALUES ('1051', 'picture-clipboard', 'picture_clipboard.png');
INSERT INTO tp_icons VALUES ('1052', 'picture-delete', 'picture_delete.png');
INSERT INTO tp_icons VALUES ('1053', 'picture-edit', 'picture_edit.png');
INSERT INTO tp_icons VALUES ('1054', 'picture-empty', 'picture_empty.png');
INSERT INTO tp_icons VALUES ('1055', 'picture-error', 'picture_error.png');
INSERT INTO tp_icons VALUES ('1056', 'picture-go', 'picture_go.png');
INSERT INTO tp_icons VALUES ('1057', 'picture-key', 'picture_key.png');
INSERT INTO tp_icons VALUES ('1058', 'picture-link', 'picture_link.png');
INSERT INTO tp_icons VALUES ('1059', 'picture-save', 'picture_save.png');
INSERT INTO tp_icons VALUES ('1060', 'pictures', 'pictures.png');
INSERT INTO tp_icons VALUES ('1061', 'pictures-thumbs', 'pictures_thumbs.png');
INSERT INTO tp_icons VALUES ('1062', 'pilcrow', 'pilcrow.png');
INSERT INTO tp_icons VALUES ('1063', 'pill', 'pill.png');
INSERT INTO tp_icons VALUES ('1064', 'pill-add', 'pill_add.png');
INSERT INTO tp_icons VALUES ('1065', 'pill-delete', 'pill_delete.png');
INSERT INTO tp_icons VALUES ('1066', 'pill-error', 'pill_error.png');
INSERT INTO tp_icons VALUES ('1067', 'pill-go', 'pill_go.png');
INSERT INTO tp_icons VALUES ('1068', 'play-blue', 'play_blue.png');
INSERT INTO tp_icons VALUES ('1069', 'play-green', 'play_green.png');
INSERT INTO tp_icons VALUES ('1070', 'plugin', 'plugin.png');
INSERT INTO tp_icons VALUES ('1071', 'plugin-add', 'plugin_add.png');
INSERT INTO tp_icons VALUES ('1072', 'plugin-delete', 'plugin_delete.png');
INSERT INTO tp_icons VALUES ('1073', 'plugin-disabled', 'plugin_disabled.png');
INSERT INTO tp_icons VALUES ('1074', 'plugin-edit', 'plugin_edit.png');
INSERT INTO tp_icons VALUES ('1075', 'plugin-error', 'plugin_error.png');
INSERT INTO tp_icons VALUES ('1076', 'plugin-go', 'plugin_go.png');
INSERT INTO tp_icons VALUES ('1077', 'plugin-key', 'plugin_key.png');
INSERT INTO tp_icons VALUES ('1078', 'plugin-link', 'plugin_link.png');
INSERT INTO tp_icons VALUES ('1079', 'previous-green', 'previous-green.png');
INSERT INTO tp_icons VALUES ('1080', 'previous', 'previous.png');
INSERT INTO tp_icons VALUES ('1081', 'print', 'print.png');
INSERT INTO tp_icons VALUES ('1082', 'printer', 'printer.png');
INSERT INTO tp_icons VALUES ('1083', 'printer-add', 'printer_add.png');
INSERT INTO tp_icons VALUES ('1084', 'printer-cancel', 'printer_cancel.png');
INSERT INTO tp_icons VALUES ('1085', 'printer-color', 'printer_color.png');
INSERT INTO tp_icons VALUES ('1086', 'printer-connect', 'printer_connect.png');
INSERT INTO tp_icons VALUES ('1087', 'printer-delete', 'printer_delete.png');
INSERT INTO tp_icons VALUES ('1088', 'printer-empty', 'printer_empty.png');
INSERT INTO tp_icons VALUES ('1089', 'printer-error', 'printer_error.png');
INSERT INTO tp_icons VALUES ('1090', 'printer-go', 'printer_go.png');
INSERT INTO tp_icons VALUES ('1091', 'printer-key', 'printer_key.png');
INSERT INTO tp_icons VALUES ('1092', 'printer-mono', 'printer_mono.png');
INSERT INTO tp_icons VALUES ('1093', 'printer-start', 'printer_start.png');
INSERT INTO tp_icons VALUES ('1094', 'printer-stop', 'printer_stop.png');
INSERT INTO tp_icons VALUES ('1095', 'rainbow', 'rainbow.png');
INSERT INTO tp_icons VALUES ('1096', 'rainbow-star', 'rainbow_star.png');
INSERT INTO tp_icons VALUES ('1097', 'record-blue', 'record_blue.png');
INSERT INTO tp_icons VALUES ('1098', 'record-green', 'record_green.png');
INSERT INTO tp_icons VALUES ('1099', 'record-red', 'record_red.png');
INSERT INTO tp_icons VALUES ('1100', 'redo', 'redo.png');
INSERT INTO tp_icons VALUES ('1101', 'refresh', 'refresh.png');
INSERT INTO tp_icons VALUES ('1102', 'reload', 'reload.png');
INSERT INTO tp_icons VALUES ('1103', 'report', 'report.png');
INSERT INTO tp_icons VALUES ('1104', 'report-add', 'report_add.png');
INSERT INTO tp_icons VALUES ('1105', 'report-delete', 'report_delete.png');
INSERT INTO tp_icons VALUES ('1106', 'report-disk', 'report_disk.png');
INSERT INTO tp_icons VALUES ('1107', 'report-edit', 'report_edit.png');
INSERT INTO tp_icons VALUES ('1108', 'report-go', 'report_go.png');
INSERT INTO tp_icons VALUES ('1109', 'report-key', 'report_key.png');
INSERT INTO tp_icons VALUES ('1110', 'report-link', 'report_link.png');
INSERT INTO tp_icons VALUES ('1111', 'report-magnify', 'report_magnify.png');
INSERT INTO tp_icons VALUES ('1112', 'report-picture', 'report_picture.png');
INSERT INTO tp_icons VALUES ('1113', 'report-start', 'report_start.png');
INSERT INTO tp_icons VALUES ('1114', 'report-stop', 'report_stop.png');
INSERT INTO tp_icons VALUES ('1115', 'report-user', 'report_user.png');
INSERT INTO tp_icons VALUES ('1116', 'report-word', 'report_word.png');
INSERT INTO tp_icons VALUES ('1117', 'resultset-first', 'resultset_first.png');
INSERT INTO tp_icons VALUES ('1118', 'resultset-last', 'resultset_last.png');
INSERT INTO tp_icons VALUES ('1119', 'resultset-next', 'resultset_next.png');
INSERT INTO tp_icons VALUES ('1120', 'resultset-previous', 'resultset_previous.png');
INSERT INTO tp_icons VALUES ('1121', 'reverse-blue', 'reverse_blue.png');
INSERT INTO tp_icons VALUES ('1122', 'reverse-green', 'reverse_green.png');
INSERT INTO tp_icons VALUES ('1123', 'rewind-blue', 'rewind_blue.png');
INSERT INTO tp_icons VALUES ('1124', 'rewind-green', 'rewind_green.png');
INSERT INTO tp_icons VALUES ('1125', 'rgb', 'rgb.png');
INSERT INTO tp_icons VALUES ('1126', 'rosette', 'rosette.png');
INSERT INTO tp_icons VALUES ('1127', 'rosette-blue', 'rosette_blue.png');
INSERT INTO tp_icons VALUES ('1128', 'rss', 'rss.png');
INSERT INTO tp_icons VALUES ('1129', 'rss-add', 'rss_add.png');
INSERT INTO tp_icons VALUES ('1130', 'rss-delete', 'rss_delete.png');
INSERT INTO tp_icons VALUES ('1131', 'rss-error', 'rss_error.png');
INSERT INTO tp_icons VALUES ('1132', 'rss-go', 'rss_go.png');
INSERT INTO tp_icons VALUES ('1133', 'rss-valid', 'rss_valid.png');
INSERT INTO tp_icons VALUES ('1134', 'ruby', 'ruby.png');
INSERT INTO tp_icons VALUES ('1135', 'ruby-add', 'ruby_add.png');
INSERT INTO tp_icons VALUES ('1136', 'ruby-delete', 'ruby_delete.png');
INSERT INTO tp_icons VALUES ('1137', 'ruby-gear', 'ruby_gear.png');
INSERT INTO tp_icons VALUES ('1138', 'ruby-get', 'ruby_get.png');
INSERT INTO tp_icons VALUES ('1139', 'ruby-go', 'ruby_go.png');
INSERT INTO tp_icons VALUES ('1140', 'ruby-key', 'ruby_key.png');
INSERT INTO tp_icons VALUES ('1141', 'ruby-link', 'ruby_link.png');
INSERT INTO tp_icons VALUES ('1142', 'ruby-put', 'ruby_put.png');
INSERT INTO tp_icons VALUES ('1143', 'script', 'script.png');
INSERT INTO tp_icons VALUES ('1144', 'script-add', 'script_add.png');
INSERT INTO tp_icons VALUES ('1145', 'script-code', 'script_code.png');
INSERT INTO tp_icons VALUES ('1146', 'script-code-red', 'script_code_red.png');
INSERT INTO tp_icons VALUES ('1147', 'script-delete', 'script_delete.png');
INSERT INTO tp_icons VALUES ('1148', 'script-edit', 'script_edit.png');
INSERT INTO tp_icons VALUES ('1149', 'script-error', 'script_error.png');
INSERT INTO tp_icons VALUES ('1150', 'script-gear', 'script_gear.png');
INSERT INTO tp_icons VALUES ('1151', 'script-go', 'script_go.png');
INSERT INTO tp_icons VALUES ('1152', 'script-key', 'script_key.png');
INSERT INTO tp_icons VALUES ('1153', 'script-lightning', 'script_lightning.png');
INSERT INTO tp_icons VALUES ('1154', 'script-link', 'script_link.png');
INSERT INTO tp_icons VALUES ('1155', 'script-palette', 'script_palette.png');
INSERT INTO tp_icons VALUES ('1156', 'script-save', 'script_save.png');
INSERT INTO tp_icons VALUES ('1157', 'script-start', 'script_start.png');
INSERT INTO tp_icons VALUES ('1158', 'script-stop', 'script_stop.png');
INSERT INTO tp_icons VALUES ('1159', 'search', 'search.png');
INSERT INTO tp_icons VALUES ('1160', 'seasons', 'seasons.png');
INSERT INTO tp_icons VALUES ('1161', 'section-collapsed', 'section_collapsed.png');
INSERT INTO tp_icons VALUES ('1162', 'section-expanded', 'section_expanded.png');
INSERT INTO tp_icons VALUES ('1163', 'server', 'server.png');
INSERT INTO tp_icons VALUES ('1164', 'server-add', 'server_add.png');
INSERT INTO tp_icons VALUES ('1165', 'server-chart', 'server_chart.png');
INSERT INTO tp_icons VALUES ('1166', 'server-compressed', 'server_compressed.png');
INSERT INTO tp_icons VALUES ('1167', 'server-connect', 'server_connect.png');
INSERT INTO tp_icons VALUES ('1168', 'server-database', 'server_database.png');
INSERT INTO tp_icons VALUES ('1169', 'server-delete', 'server_delete.png');
INSERT INTO tp_icons VALUES ('1170', 'server-edit', 'server_edit.png');
INSERT INTO tp_icons VALUES ('1171', 'server-error', 'server_error.png');
INSERT INTO tp_icons VALUES ('1172', 'server-go', 'server_go.png');
INSERT INTO tp_icons VALUES ('1173', 'server-key', 'server_key.png');
INSERT INTO tp_icons VALUES ('1174', 'server-lightning', 'server_lightning.png');
INSERT INTO tp_icons VALUES ('1175', 'server-link', 'server_link.png');
INSERT INTO tp_icons VALUES ('1176', 'server-start', 'server_start.png');
INSERT INTO tp_icons VALUES ('1177', 'server-stop', 'server_stop.png');
INSERT INTO tp_icons VALUES ('1178', 'server-uncompressed', 'server_uncompressed.png');
INSERT INTO tp_icons VALUES ('1179', 'server-wrench', 'server_wrench.png');
INSERT INTO tp_icons VALUES ('1180', 'settings32', 'settings32.png');
INSERT INTO tp_icons VALUES ('1181', 'shading', 'shading.png');
INSERT INTO tp_icons VALUES ('1182', 'shape-3d', 'shape_3d.png');
INSERT INTO tp_icons VALUES ('1183', 'shape-align-bottom', 'shape_align_bottom.png');
INSERT INTO tp_icons VALUES ('1184', 'shape-align-center', 'shape_align_center.png');
INSERT INTO tp_icons VALUES ('1185', 'shape-align-left', 'shape_align_left.png');
INSERT INTO tp_icons VALUES ('1186', 'shape-align-middle', 'shape_align_middle.png');
INSERT INTO tp_icons VALUES ('1187', 'shape-align-right', 'shape_align_right.png');
INSERT INTO tp_icons VALUES ('1188', 'shape-align-top', 'shape_align_top.png');
INSERT INTO tp_icons VALUES ('1189', 'shape-flip-horizontal', 'shape_flip_horizontal.png');
INSERT INTO tp_icons VALUES ('1190', 'shape-flip-vertical', 'shape_flip_vertical.png');
INSERT INTO tp_icons VALUES ('1191', 'shape-group', 'shape_group.png');
INSERT INTO tp_icons VALUES ('1192', 'shape-handles', 'shape_handles.png');
INSERT INTO tp_icons VALUES ('1193', 'shape-move-back', 'shape_move_back.png');
INSERT INTO tp_icons VALUES ('1194', 'shape-move-backwards', 'shape_move_backwards.png');
INSERT INTO tp_icons VALUES ('1195', 'shape-move-forwards', 'shape_move_forwards.png');
INSERT INTO tp_icons VALUES ('1196', 'shape-move-front', 'shape_move_front.png');
INSERT INTO tp_icons VALUES ('1197', 'shape-rotate-anticlockwise', 'shape_rotate_anticlockwise.png');
INSERT INTO tp_icons VALUES ('1198', 'shape-rotate-clockwise', 'shape_rotate_clockwise.png');
INSERT INTO tp_icons VALUES ('1199', 'shape-shade-a', 'shape_shade_a.png');
INSERT INTO tp_icons VALUES ('1200', 'shape-shade-b', 'shape_shade_b.png');
INSERT INTO tp_icons VALUES ('1201', 'shape-shade-c', 'shape_shade_c.png');
INSERT INTO tp_icons VALUES ('1202', 'shape-shadow', 'shape_shadow.png');
INSERT INTO tp_icons VALUES ('1203', 'shape-shadow-toggle', 'shape_shadow_toggle.png');
INSERT INTO tp_icons VALUES ('1204', 'shape-square', 'shape_square.png');
INSERT INTO tp_icons VALUES ('1205', 'shape-square-add', 'shape_square_add.png');
INSERT INTO tp_icons VALUES ('1206', 'shape-square-delete', 'shape_square_delete.png');
INSERT INTO tp_icons VALUES ('1207', 'shape-square-edit', 'shape_square_edit.png');
INSERT INTO tp_icons VALUES ('1208', 'shape-square-error', 'shape_square_error.png');
INSERT INTO tp_icons VALUES ('1209', 'shape-square-go', 'shape_square_go.png');
INSERT INTO tp_icons VALUES ('1210', 'shape-square-key', 'shape_square_key.png');
INSERT INTO tp_icons VALUES ('1211', 'shape-square-link', 'shape_square_link.png');
INSERT INTO tp_icons VALUES ('1212', 'shape-square-select', 'shape_square_select.png');
INSERT INTO tp_icons VALUES ('1213', 'shape-ungroup', 'shape_ungroup.png');
INSERT INTO tp_icons VALUES ('1214', 'shapes-many', 'shapes_many.png');
INSERT INTO tp_icons VALUES ('1215', 'shapes-many-select', 'shapes_many_select.png');
INSERT INTO tp_icons VALUES ('1216', 'share', 'share.png');
INSERT INTO tp_icons VALUES ('1217', 'shield', 'shield.png');
INSERT INTO tp_icons VALUES ('1218', 'shield-add', 'shield_add.png');
INSERT INTO tp_icons VALUES ('1219', 'shield-delete', 'shield_delete.png');
INSERT INTO tp_icons VALUES ('1220', 'shield-error', 'shield_error.png');
INSERT INTO tp_icons VALUES ('1221', 'shield-go', 'shield_go.png');
INSERT INTO tp_icons VALUES ('1222', 'shield-rainbow', 'shield_rainbow.png');
INSERT INTO tp_icons VALUES ('1223', 'shield-silver', 'shield_silver.png');
INSERT INTO tp_icons VALUES ('1224', 'shield-start', 'shield_start.png');
INSERT INTO tp_icons VALUES ('1225', 'shield-stop', 'shield_stop.png');
INSERT INTO tp_icons VALUES ('1226', 'sitemap', 'sitemap.png');
INSERT INTO tp_icons VALUES ('1227', 'sitemap-color', 'sitemap_color.png');
INSERT INTO tp_icons VALUES ('1228', 'smartphone', 'smartphone.png');
INSERT INTO tp_icons VALUES ('1229', 'smartphone-add', 'smartphone_add.png');
INSERT INTO tp_icons VALUES ('1230', 'smartphone-connect', 'smartphone_connect.png');
INSERT INTO tp_icons VALUES ('1231', 'smartphone-delete', 'smartphone_delete.png');
INSERT INTO tp_icons VALUES ('1232', 'smartphone-disk', 'smartphone_disk.png');
INSERT INTO tp_icons VALUES ('1233', 'smartphone-edit', 'smartphone_edit.png');
INSERT INTO tp_icons VALUES ('1234', 'smartphone-error', 'smartphone_error.png');
INSERT INTO tp_icons VALUES ('1235', 'smartphone-go', 'smartphone_go.png');
INSERT INTO tp_icons VALUES ('1236', 'smartphone-key', 'smartphone_key.png');
INSERT INTO tp_icons VALUES ('1237', 'smartphone-wrench', 'smartphone_wrench.png');
INSERT INTO tp_icons VALUES ('1238', 'sort-ascending', 'sort_ascending.png');
INSERT INTO tp_icons VALUES ('1239', 'sort-descending', 'sort_descending.png');
INSERT INTO tp_icons VALUES ('1240', 'sound', 'sound.png');
INSERT INTO tp_icons VALUES ('1241', 'sound-add', 'sound_add.png');
INSERT INTO tp_icons VALUES ('1242', 'sound-delete', 'sound_delete.png');
INSERT INTO tp_icons VALUES ('1243', 'sound-high', 'sound_high.png');
INSERT INTO tp_icons VALUES ('1244', 'sound-in', 'sound_in.png');
INSERT INTO tp_icons VALUES ('1245', 'sound-low', 'sound_low.png');
INSERT INTO tp_icons VALUES ('1246', 'sound-mute', 'sound_mute.png');
INSERT INTO tp_icons VALUES ('1247', 'sound-none', 'sound_none.png');
INSERT INTO tp_icons VALUES ('1248', 'sound-out', 'sound_out.png');
INSERT INTO tp_icons VALUES ('1249', 'spellcheck', 'spellcheck.png');
INSERT INTO tp_icons VALUES ('1250', 'sport-8ball', 'sport_8ball.png');
INSERT INTO tp_icons VALUES ('1251', 'sport-basketball', 'sport_basketball.png');
INSERT INTO tp_icons VALUES ('1252', 'sport-football', 'sport_football.png');
INSERT INTO tp_icons VALUES ('1253', 'sport-golf', 'sport_golf.png');
INSERT INTO tp_icons VALUES ('1254', 'sport-golf-practice', 'sport_golf_practice.png');
INSERT INTO tp_icons VALUES ('1255', 'sport-raquet', 'sport_raquet.png');
INSERT INTO tp_icons VALUES ('1256', 'sport-shuttlecock', 'sport_shuttlecock.png');
INSERT INTO tp_icons VALUES ('1257', 'sport-soccer', 'sport_soccer.png');
INSERT INTO tp_icons VALUES ('1258', 'sport-tennis', 'sport_tennis.png');
INSERT INTO tp_icons VALUES ('1259', 'star', 'star.png');
INSERT INTO tp_icons VALUES ('1260', 'star-bronze', 'star_bronze.png');
INSERT INTO tp_icons VALUES ('1261', 'star-bronze-half-grey', 'star_bronze_half_grey.png');
INSERT INTO tp_icons VALUES ('1262', 'star-gold', 'star_gold.png');
INSERT INTO tp_icons VALUES ('1263', 'star-gold-half-grey', 'star_gold_half_grey.png');
INSERT INTO tp_icons VALUES ('1264', 'star-gold-half-silver', 'star_gold_half_silver.png');
INSERT INTO tp_icons VALUES ('1265', 'star-grey', 'star_grey.png');
INSERT INTO tp_icons VALUES ('1266', 'star-half-grey', 'star_half_grey.png');
INSERT INTO tp_icons VALUES ('1267', 'star-silver', 'star_silver.png');
INSERT INTO tp_icons VALUES ('1268', 'status-away', 'status_away.png');
INSERT INTO tp_icons VALUES ('1269', 'status-be-right-back', 'status_be_right_back.png');
INSERT INTO tp_icons VALUES ('1270', 'status-busy', 'status_busy.png');
INSERT INTO tp_icons VALUES ('1271', 'status-invisible', 'status_invisible.png');
INSERT INTO tp_icons VALUES ('1272', 'status-offline', 'status_offline.png');
INSERT INTO tp_icons VALUES ('1273', 'status-online', 'status_online.png');
INSERT INTO tp_icons VALUES ('1274', 'stop', 'stop.png');
INSERT INTO tp_icons VALUES ('1275', 'stop-blue', 'stop_blue.png');
INSERT INTO tp_icons VALUES ('1276', 'stop-green', 'stop_green.png');
INSERT INTO tp_icons VALUES ('1277', 'stop-red', 'stop_red.png');
INSERT INTO tp_icons VALUES ('1278', 'style', 'style.png');
INSERT INTO tp_icons VALUES ('1279', 'style-add', 'style_add.png');
INSERT INTO tp_icons VALUES ('1280', 'style-delete', 'style_delete.png');
INSERT INTO tp_icons VALUES ('1281', 'style-edit', 'style_edit.png');
INSERT INTO tp_icons VALUES ('1282', 'style-go', 'style_go.png');
INSERT INTO tp_icons VALUES ('1283', 'sum', 'sum.png');
INSERT INTO tp_icons VALUES ('1284', 'sys', 'sys.png');
INSERT INTO tp_icons VALUES ('1285', 'tab', 'tab.png');
INSERT INTO tp_icons VALUES ('1286', 'tab-add', 'tab_add.png');
INSERT INTO tp_icons VALUES ('1287', 'tab-blue', 'tab_blue.png');
INSERT INTO tp_icons VALUES ('1288', 'tab-delete', 'tab_delete.png');
INSERT INTO tp_icons VALUES ('1289', 'tab-edit', 'tab_edit.png');
INSERT INTO tp_icons VALUES ('1290', 'tab-go', 'tab_go.png');
INSERT INTO tp_icons VALUES ('1291', 'tab-green', 'tab_green.png');
INSERT INTO tp_icons VALUES ('1292', 'tab-red', 'tab_red.png');
INSERT INTO tp_icons VALUES ('1293', 'table', 'table.png');
INSERT INTO tp_icons VALUES ('1294', 'table-add', 'table_add.png');
INSERT INTO tp_icons VALUES ('1295', 'table-cell', 'table_cell.png');
INSERT INTO tp_icons VALUES ('1296', 'table-column', 'table_column.png');
INSERT INTO tp_icons VALUES ('1297', 'table-column-add', 'table_column_add.png');
INSERT INTO tp_icons VALUES ('1298', 'table-column-delete', 'table_column_delete.png');
INSERT INTO tp_icons VALUES ('1299', 'table-connect', 'table_connect.png');
INSERT INTO tp_icons VALUES ('1300', 'table-delete', 'table_delete.png');
INSERT INTO tp_icons VALUES ('1301', 'table-edit', 'table_edit.png');
INSERT INTO tp_icons VALUES ('1302', 'table-error', 'table_error.png');
INSERT INTO tp_icons VALUES ('1303', 'table-gear', 'table_gear.png');
INSERT INTO tp_icons VALUES ('1304', 'table-go', 'table_go.png');
INSERT INTO tp_icons VALUES ('1305', 'table-key', 'table_key.png');
INSERT INTO tp_icons VALUES ('1306', 'table-lightning', 'table_lightning.png');
INSERT INTO tp_icons VALUES ('1307', 'table-link', 'table_link.png');
INSERT INTO tp_icons VALUES ('1308', 'table-multiple', 'table_multiple.png');
INSERT INTO tp_icons VALUES ('1309', 'table-refresh', 'table_refresh.png');
INSERT INTO tp_icons VALUES ('1310', 'table-relationship', 'table_relationship.png');
INSERT INTO tp_icons VALUES ('1311', 'table-row', 'table_row.png');
INSERT INTO tp_icons VALUES ('1312', 'table-row-delete', 'table_row_delete.png');
INSERT INTO tp_icons VALUES ('1313', 'table-row-insert', 'table_row_insert.png');
INSERT INTO tp_icons VALUES ('1314', 'table-save', 'table_save.png');
INSERT INTO tp_icons VALUES ('1315', 'table-sort', 'table_sort.png');
INSERT INTO tp_icons VALUES ('1316', 'tag', 'tag.png');
INSERT INTO tp_icons VALUES ('1317', 'tag-blue', 'tag_blue.png');
INSERT INTO tp_icons VALUES ('1318', 'tag-blue-add', 'tag_blue_add.png');
INSERT INTO tp_icons VALUES ('1319', 'tag-blue-delete', 'tag_blue_delete.png');
INSERT INTO tp_icons VALUES ('1320', 'tag-blue-edit', 'tag_blue_edit.png');
INSERT INTO tp_icons VALUES ('1321', 'tag-green', 'tag_green.png');
INSERT INTO tp_icons VALUES ('1322', 'tag-orange', 'tag_orange.png');
INSERT INTO tp_icons VALUES ('1323', 'tag-pink', 'tag_pink.png');
INSERT INTO tp_icons VALUES ('1324', 'tag-purple', 'tag_purple.png');
INSERT INTO tp_icons VALUES ('1325', 'tag-red', 'tag_red.png');
INSERT INTO tp_icons VALUES ('1326', 'tag-yellow', 'tag_yellow.png');
INSERT INTO tp_icons VALUES ('1327', 'tags-grey', 'tags_grey.png');
INSERT INTO tp_icons VALUES ('1328', 'tags-red', 'tags_red.png');
INSERT INTO tp_icons VALUES ('1329', 'telephone', 'telephone.png');
INSERT INTO tp_icons VALUES ('1330', 'telephone-add', 'telephone_add.png');
INSERT INTO tp_icons VALUES ('1331', 'telephone-delete', 'telephone_delete.png');
INSERT INTO tp_icons VALUES ('1332', 'telephone-edit', 'telephone_edit.png');
INSERT INTO tp_icons VALUES ('1333', 'telephone-error', 'telephone_error.png');
INSERT INTO tp_icons VALUES ('1334', 'telephone-go', 'telephone_go.png');
INSERT INTO tp_icons VALUES ('1335', 'telephone-key', 'telephone_key.png');
INSERT INTO tp_icons VALUES ('1336', 'telephone-link', 'telephone_link.png');
INSERT INTO tp_icons VALUES ('1337', 'telephone-red', 'telephone_red.png');
INSERT INTO tp_icons VALUES ('1338', 'television', 'television.png');
INSERT INTO tp_icons VALUES ('1339', 'television-add', 'television_add.png');
INSERT INTO tp_icons VALUES ('1340', 'television-delete', 'television_delete.png');
INSERT INTO tp_icons VALUES ('1341', 'television-in', 'television_in.png');
INSERT INTO tp_icons VALUES ('1342', 'television-off', 'television_off.png');
INSERT INTO tp_icons VALUES ('1343', 'television-out', 'television_out.png');
INSERT INTO tp_icons VALUES ('1344', 'television-star', 'television_star.png');
INSERT INTO tp_icons VALUES ('1345', 'text-ab', 'text_ab.png');
INSERT INTO tp_icons VALUES ('1346', 'text-align-center', 'text_align_center.png');
INSERT INTO tp_icons VALUES ('1347', 'text-align-justify', 'text_align_justify.png');
INSERT INTO tp_icons VALUES ('1348', 'text-align-left', 'text_align_left.png');
INSERT INTO tp_icons VALUES ('1349', 'text-align-right', 'text_align_right.png');
INSERT INTO tp_icons VALUES ('1350', 'text-allcaps', 'text_allcaps.png');
INSERT INTO tp_icons VALUES ('1351', 'text-bold', 'text_bold.png');
INSERT INTO tp_icons VALUES ('1352', 'text-columns', 'text_columns.png');
INSERT INTO tp_icons VALUES ('1353', 'text-complete', 'text_complete.png');
INSERT INTO tp_icons VALUES ('1354', 'text-direction', 'text_direction.png');
INSERT INTO tp_icons VALUES ('1355', 'text-double-underline', 'text_double_underline.png');
INSERT INTO tp_icons VALUES ('1356', 'text-dropcaps', 'text_dropcaps.png');
INSERT INTO tp_icons VALUES ('1357', 'text-fit', 'text_fit.png');
INSERT INTO tp_icons VALUES ('1358', 'text-flip', 'text_flip.png');
INSERT INTO tp_icons VALUES ('1359', 'text-font-default', 'text_font_default.png');
INSERT INTO tp_icons VALUES ('1360', 'text-heading-1', 'text_heading_1.png');
INSERT INTO tp_icons VALUES ('1361', 'text-heading-2', 'text_heading_2.png');
INSERT INTO tp_icons VALUES ('1362', 'text-heading-3', 'text_heading_3.png');
INSERT INTO tp_icons VALUES ('1363', 'text-heading-4', 'text_heading_4.png');
INSERT INTO tp_icons VALUES ('1364', 'text-heading-5', 'text_heading_5.png');
INSERT INTO tp_icons VALUES ('1365', 'text-heading-6', 'text_heading_6.png');
INSERT INTO tp_icons VALUES ('1366', 'text-horizontalrule', 'text_horizontalrule.png');
INSERT INTO tp_icons VALUES ('1367', 'text-indent', 'text_indent.png');
INSERT INTO tp_icons VALUES ('1368', 'text-indent-remove', 'text_indent_remove.png');
INSERT INTO tp_icons VALUES ('1369', 'text-inverse', 'text_inverse.png');
INSERT INTO tp_icons VALUES ('1370', 'text-italic', 'text_italic.png');
INSERT INTO tp_icons VALUES ('1371', 'text-kerning', 'text_kerning.png');
INSERT INTO tp_icons VALUES ('1372', 'text-left-to-right', 'text_left_to_right.png');
INSERT INTO tp_icons VALUES ('1373', 'text-letter-omega', 'text_letter_omega.png');
INSERT INTO tp_icons VALUES ('1374', 'text-letterspacing', 'text_letterspacing.png');
INSERT INTO tp_icons VALUES ('1375', 'text-linespacing', 'text_linespacing.png');
INSERT INTO tp_icons VALUES ('1376', 'text-list-bullets', 'text_list_bullets.png');
INSERT INTO tp_icons VALUES ('1377', 'text-list-numbers', 'text_list_numbers.png');
INSERT INTO tp_icons VALUES ('1378', 'text-lowercase', 'text_lowercase.png');
INSERT INTO tp_icons VALUES ('1379', 'text-lowercase-a', 'text_lowercase_a.png');
INSERT INTO tp_icons VALUES ('1380', 'text-mirror', 'text_mirror.png');
INSERT INTO tp_icons VALUES ('1381', 'text-padding-bottom', 'text_padding_bottom.png');
INSERT INTO tp_icons VALUES ('1382', 'text-padding-left', 'text_padding_left.png');
INSERT INTO tp_icons VALUES ('1383', 'text-padding-right', 'text_padding_right.png');
INSERT INTO tp_icons VALUES ('1384', 'text-padding-top', 'text_padding_top.png');
INSERT INTO tp_icons VALUES ('1385', 'text-replace', 'text_replace.png');
INSERT INTO tp_icons VALUES ('1386', 'text-right-to-left', 'text_right_to_left.png');
INSERT INTO tp_icons VALUES ('1387', 'text-rotate-0', 'text_rotate_0.png');
INSERT INTO tp_icons VALUES ('1388', 'text-rotate-180', 'text_rotate_180.png');
INSERT INTO tp_icons VALUES ('1389', 'text-rotate-270', 'text_rotate_270.png');
INSERT INTO tp_icons VALUES ('1390', 'text-rotate-90', 'text_rotate_90.png');
INSERT INTO tp_icons VALUES ('1391', 'text-ruler', 'text_ruler.png');
INSERT INTO tp_icons VALUES ('1392', 'text-shading', 'text_shading.png');
INSERT INTO tp_icons VALUES ('1393', 'text-signature', 'text_signature.png');
INSERT INTO tp_icons VALUES ('1394', 'text-smallcaps', 'text_smallcaps.png');
INSERT INTO tp_icons VALUES ('1395', 'text-spelling', 'text_spelling.png');
INSERT INTO tp_icons VALUES ('1396', 'text-strikethrough', 'text_strikethrough.png');
INSERT INTO tp_icons VALUES ('1397', 'text-subscript', 'text_subscript.png');
INSERT INTO tp_icons VALUES ('1398', 'text-superscript', 'text_superscript.png');
INSERT INTO tp_icons VALUES ('1399', 'text-tab', 'text_tab.png');
INSERT INTO tp_icons VALUES ('1400', 'text-underline', 'text_underline.png');
INSERT INTO tp_icons VALUES ('1401', 'text-uppercase', 'text_uppercase.png');
INSERT INTO tp_icons VALUES ('1402', 'textfield', 'textfield.png');
INSERT INTO tp_icons VALUES ('1403', 'textfield-add', 'textfield_add.png');
INSERT INTO tp_icons VALUES ('1404', 'textfield-delete', 'textfield_delete.png');
INSERT INTO tp_icons VALUES ('1405', 'textfield-key', 'textfield_key.png');
INSERT INTO tp_icons VALUES ('1406', 'textfield-rename', 'textfield_rename.png');
INSERT INTO tp_icons VALUES ('1407', 'theme', 'theme.png');
INSERT INTO tp_icons VALUES ('1408', 'thumb-down', 'thumb_down.png');
INSERT INTO tp_icons VALUES ('1409', 'thumb-up', 'thumb_up.png');
INSERT INTO tp_icons VALUES ('1410', 'tick', 'tick.png');
INSERT INTO tp_icons VALUES ('1411', 'tick-shield', 'tick_shield.png');
INSERT INTO tp_icons VALUES ('1412', 'time', 'time.png');
INSERT INTO tp_icons VALUES ('1413', 'time-add', 'time_add.png');
INSERT INTO tp_icons VALUES ('1414', 'time-delete', 'time_delete.png');
INSERT INTO tp_icons VALUES ('1415', 'time-go', 'time_go.png');
INSERT INTO tp_icons VALUES ('1416', 'time-green', 'time_green.png');
INSERT INTO tp_icons VALUES ('1417', 'time-red', 'time_red.png');
INSERT INTO tp_icons VALUES ('1418', 'timeline-marker', 'timeline_marker.png');
INSERT INTO tp_icons VALUES ('1419', 'tip', 'tip.png');
INSERT INTO tp_icons VALUES ('1420', 'transmit', 'transmit.png');
INSERT INTO tp_icons VALUES ('1421', 'transmit-add', 'transmit_add.png');
INSERT INTO tp_icons VALUES ('1422', 'transmit-blue', 'transmit_blue.png');
INSERT INTO tp_icons VALUES ('1423', 'transmit-delete', 'transmit_delete.png');
INSERT INTO tp_icons VALUES ('1424', 'transmit-edit', 'transmit_edit.png');
INSERT INTO tp_icons VALUES ('1425', 'transmit-error', 'transmit_error.png');
INSERT INTO tp_icons VALUES ('1426', 'transmit-go', 'transmit_go.png');
INSERT INTO tp_icons VALUES ('1427', 'transmit-red', 'transmit_red.png');
INSERT INTO tp_icons VALUES ('1428', 'tree16', 'tree16.png');
INSERT INTO tp_icons VALUES ('1429', 'tree32', 'tree32.png');
INSERT INTO tp_icons VALUES ('1430', 'tux', 'tux.png');
INSERT INTO tp_icons VALUES ('1431', 'undo', 'undo.png');
INSERT INTO tp_icons VALUES ('1432', 'upload', 'upload.png');
INSERT INTO tp_icons VALUES ('1433', 'user', 'user.png');
INSERT INTO tp_icons VALUES ('1434', 'user-accept16', 'user_accept16.png');
INSERT INTO tp_icons VALUES ('1435', 'user-accept32', 'user_accept32.png');
INSERT INTO tp_icons VALUES ('1436', 'user-add', 'user_add.png');
INSERT INTO tp_icons VALUES ('1437', 'user-alert', 'user_alert.png');
INSERT INTO tp_icons VALUES ('1438', 'user-b', 'user_b.png');
INSERT INTO tp_icons VALUES ('1439', 'user-brown', 'user_brown.png');
INSERT INTO tp_icons VALUES ('1440', 'user-business-boss', 'user_business_boss.png');
INSERT INTO tp_icons VALUES ('1441', 'user-comment', 'user_comment.png');
INSERT INTO tp_icons VALUES ('1442', 'user-cross', 'user_cross.png');
INSERT INTO tp_icons VALUES ('1443', 'user-delete', 'user_delete.png');
INSERT INTO tp_icons VALUES ('1444', 'user-earth', 'user_earth.png');
INSERT INTO tp_icons VALUES ('1445', 'user-edit', 'user_edit.png');
INSERT INTO tp_icons VALUES ('1446', 'user-edit32', 'user_edit32.png');
INSERT INTO tp_icons VALUES ('1447', 'user-female', 'user_female.png');
INSERT INTO tp_icons VALUES ('1448', 'user-go', 'user_go.png');
INSERT INTO tp_icons VALUES ('1449', 'user-gray', 'user_gray.png');
INSERT INTO tp_icons VALUES ('1450', 'user-gray-cool', 'user_gray_cool.png');
INSERT INTO tp_icons VALUES ('1451', 'user-green', 'user_green.png');
INSERT INTO tp_icons VALUES ('1452', 'user-group', 'user_group.png');
INSERT INTO tp_icons VALUES ('1453', 'user-home', 'user_home.png');
INSERT INTO tp_icons VALUES ('1454', 'user-key', 'user_key.png');
INSERT INTO tp_icons VALUES ('1455', 'user-magnify', 'user_magnify.png');
INSERT INTO tp_icons VALUES ('1456', 'user-mature', 'user_mature.png');
INSERT INTO tp_icons VALUES ('1457', 'user-orange', 'user_orange.png');
INSERT INTO tp_icons VALUES ('1458', 'user-red', 'user_red.png');
INSERT INTO tp_icons VALUES ('1459', 'user-reject16', 'user_reject16.png');
INSERT INTO tp_icons VALUES ('1460', 'user-reject32', 'user_reject32.png');
INSERT INTO tp_icons VALUES ('1461', 'user-star', 'user_star.png');
INSERT INTO tp_icons VALUES ('1462', 'user-suit', 'user_suit.png');
INSERT INTO tp_icons VALUES ('1463', 'user-suit-black', 'user_suit_black.png');
INSERT INTO tp_icons VALUES ('1464', 'user-tick', 'user_tick.png');
INSERT INTO tp_icons VALUES ('1465', 'users', 'users.png');
INSERT INTO tp_icons VALUES ('1466', 'vcard', 'vcard.png');
INSERT INTO tp_icons VALUES ('1467', 'vcard-add', 'vcard_add.png');
INSERT INTO tp_icons VALUES ('1468', 'vcard-delete', 'vcard_delete.png');
INSERT INTO tp_icons VALUES ('1469', 'vcard-edit', 'vcard_edit.png');
INSERT INTO tp_icons VALUES ('1470', 'vcard-key', 'vcard_key.png');
INSERT INTO tp_icons VALUES ('1471', 'vector', 'vector.png');
INSERT INTO tp_icons VALUES ('1472', 'vector-add', 'vector_add.png');
INSERT INTO tp_icons VALUES ('1473', 'vector-delete', 'vector_delete.png');
INSERT INTO tp_icons VALUES ('1474', 'vector-key', 'vector_key.png');
INSERT INTO tp_icons VALUES ('1475', 'wand', 'wand.png');
INSERT INTO tp_icons VALUES ('1476', 'weather-cloud', 'weather_cloud.png');
INSERT INTO tp_icons VALUES ('1477', 'weather-clouds', 'weather_clouds.png');
INSERT INTO tp_icons VALUES ('1478', 'weather-cloudy', 'weather_cloudy.png');
INSERT INTO tp_icons VALUES ('1479', 'weather-cloudy-rain', 'weather_cloudy_rain.png');
INSERT INTO tp_icons VALUES ('1480', 'weather-lightning', 'weather_lightning.png');
INSERT INTO tp_icons VALUES ('1481', 'weather-rain', 'weather_rain.png');
INSERT INTO tp_icons VALUES ('1482', 'weather-snow', 'weather_snow.png');
INSERT INTO tp_icons VALUES ('1483', 'weather-sun', 'weather_sun.png');
INSERT INTO tp_icons VALUES ('1484', 'webcam', 'webcam.png');
INSERT INTO tp_icons VALUES ('1485', 'webcam-add', 'webcam_add.png');
INSERT INTO tp_icons VALUES ('1486', 'webcam-connect', 'webcam_connect.png');
INSERT INTO tp_icons VALUES ('1487', 'webcam-delete', 'webcam_delete.png');
INSERT INTO tp_icons VALUES ('1488', 'webcam-error', 'webcam_error.png');
INSERT INTO tp_icons VALUES ('1489', 'webcam-start', 'webcam_start.png');
INSERT INTO tp_icons VALUES ('1490', 'webcam-stop', 'webcam_stop.png');
INSERT INTO tp_icons VALUES ('1491', 'world', 'world.png');
INSERT INTO tp_icons VALUES ('1492', 'world-add', 'world_add.png');
INSERT INTO tp_icons VALUES ('1493', 'world-connect', 'world_connect.png');
INSERT INTO tp_icons VALUES ('1494', 'world-dawn', 'world_dawn.png');
INSERT INTO tp_icons VALUES ('1495', 'world-delete', 'world_delete.png');
INSERT INTO tp_icons VALUES ('1496', 'world-edit', 'world_edit.png');
INSERT INTO tp_icons VALUES ('1497', 'world-go', 'world_go.png');
INSERT INTO tp_icons VALUES ('1498', 'world-key', 'world_key.png');
INSERT INTO tp_icons VALUES ('1499', 'world-link', 'world_link.png');
INSERT INTO tp_icons VALUES ('1500', 'world-night', 'world_night.png');
INSERT INTO tp_icons VALUES ('1501', 'world-orbit', 'world_orbit.png');
INSERT INTO tp_icons VALUES ('1502', 'wrench', 'wrench.png');
INSERT INTO tp_icons VALUES ('1503', 'wrench-orange', 'wrench_orange.png');
INSERT INTO tp_icons VALUES ('1504', 'writing32', 'writing32.png');
INSERT INTO tp_icons VALUES ('1505', 'xhtml', 'xhtml.png');
INSERT INTO tp_icons VALUES ('1506', 'xhtml-add', 'xhtml_add.png');
INSERT INTO tp_icons VALUES ('1507', 'xhtml-delete', 'xhtml_delete.png');
INSERT INTO tp_icons VALUES ('1508', 'xhtml-error', 'xhtml_error.png');
INSERT INTO tp_icons VALUES ('1509', 'xhtml-go', 'xhtml_go.png');
INSERT INTO tp_icons VALUES ('1510', 'xhtml-valid', 'xhtml_valid.png');
INSERT INTO tp_icons VALUES ('1511', 'zoom', 'zoom.png');
INSERT INTO tp_icons VALUES ('1512', 'zoom-in', 'zoom_in.png');
INSERT INTO tp_icons VALUES ('1513', 'zoom-out', 'zoom_out.png');

-- ----------------------------
-- Table structure for `tp_images`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='图片素材';

-- ----------------------------
-- Records of tp_images
-- ----------------------------
INSERT INTO tp_images VALUES ('2', '1521698285', '0', '0', '0', '0', 'Public/Uploads/2018-03-22/5ab345ed82631.jpg', '0', '这是一个例子1', '房子|草地', 'www.baidu.com', '这是一个例子1');
INSERT INTO tp_images VALUES ('3', '1521698313', '1521698339', '0', '0', '0', 'Public/Uploads/2018-03-22/5ab34623303b0.jpg', '0', '这是一个例子2', '二维码', '', '这是一个例子1');

-- ----------------------------
-- Table structure for `tp_menu`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of tp_menu
-- ----------------------------
INSERT INTO tp_menu VALUES ('1', '1513753458', '1521703762', '0', '0', '0', '0', '权限', '0', '', 'advancedsettings');
INSERT INTO tp_menu VALUES ('2', '1513754024', '1516861907', '0', '0', '1', '0', '菜单', '1', '', 'book');
INSERT INTO tp_menu VALUES ('36', '1521628102', '0', '0', '0', '34', '0', '审核用户', '0', '', 'user-accept16');
INSERT INTO tp_menu VALUES ('7', '1513767509', '1521516731', '0', '0', '1', '0', '角色', '7', '', 'user-group');
INSERT INTO tp_menu VALUES ('26', '1515377524', '1521516749', '0', '0', '1', '0', '用户', '12', '', 'user-gray');
INSERT INTO tp_menu VALUES ('35', '1521628073', '0', '0', '0', '34', '0', '审核图片', '0', '', 'picture-error');
INSERT INTO tp_menu VALUES ('34', '1521628012', '0', '0', '0', '0', '0', '审核', '0', '', 'advancedsettings');
INSERT INTO tp_menu VALUES ('33', '1521616999', '1521617047', '0', '0', '32', '0', '广告图片', '16', '', 'box-picture');
INSERT INTO tp_menu VALUES ('32', '1521616934', '1521703837', '0', '0', '0', '0', '图片和验证码', '0', '', 'advancedsettings');
INSERT INTO tp_menu VALUES ('37', '1521628171', '1521628198', '0', '0', '34', '0', '审核验证码', '0', '', 'css-valid');
INSERT INTO tp_menu VALUES ('38', '1521703600', '0', '0', '0', '0', '0', '设置', '0', '', 'advancedsettings');
INSERT INTO tp_menu VALUES ('39', '1521703653', '0', '0', '0', '38', '0', '基础设置', '21', '', 'advancedsettings');
INSERT INTO tp_menu VALUES ('40', '1521703699', '1521703777', '0', '0', '38', '0', '邮件设置', '22', '', 'email');
INSERT INTO tp_menu VALUES ('41', '1521703731', '1521703786', '0', '0', '38', '0', '广告设置', '23', '', 'advancedsettings2');

-- ----------------------------
-- Table structure for `tp_users`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户';

-- ----------------------------
-- Records of tp_users
-- ----------------------------
INSERT INTO tp_users VALUES ('1', '1513435319', '0', '1', 'admin', 'c5f962dc1baafbda7f5e30d6a99594e3', 'Z2fD6yQ3', 'Admin', '1', 'admin@test.com', '1521700428', '127.0.0.1');

-- ----------------------------
-- Table structure for `tp_validate`
-- ----------------------------
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

-- ----------------------------
-- Records of tp_validate
-- ----------------------------
