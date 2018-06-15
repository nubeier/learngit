
CREATE TABLE IF NOT EXISTS `itcast_attribute` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) NOT NULL,
  `a_def_val` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `cid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `itcast_category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `itcast_goods` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gname` varchar(30) NOT NULL COMMENT '名称',
  `price` int(10) unsigned NOT NULL COMMENT '价格',
  `thumb` varchar(255) NOT NULL COMMENT '图片',
  `status` enum('no','yes') NOT NULL DEFAULT 'yes' COMMENT '是否上下架',
  `description` text NOT NULL COMMENT '描述',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `identifier` varchar(10) NOT NULL COMMENT '编号',
  `recycle` enum('no','yes') NOT NULL DEFAULT 'no' COMMENT '回收站',
  `cid` int(10) unsigned NOT NULL COMMENT '分类',
  `is_best` enum('yes','no') NOT NULL DEFAULT 'no' COMMENT '是否热销',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `itcast_goods_attr` (
  `gaid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `avalue` varchar(255) NOT NULL,
  PRIMARY KEY (`gaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `itcast_member` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(30) NOT NULL DEFAULT '',
  `pwd` char(32) NOT NULL COMMENT '登录密码',
  `salt` char(6) NOT NULL COMMENT '密码salt',
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `consignee` varchar(20) NOT NULL DEFAULT '' COMMENT '收件人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `itcast_shopcart` (
  `scid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(10) unsigned NOT NULL COMMENT '购买者ID',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  `gid` int(10) unsigned NOT NULL COMMENT '购买商品ID',
  `num` tinyint(3) unsigned NOT NULL COMMENT '购买商品数量',
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
