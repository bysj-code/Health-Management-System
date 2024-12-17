DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `member_users`;
CREATE TABLE `member_users`(member_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '会员用户ID',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (member_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '会员用户';

DROP TABLE IF EXISTS `doctor_user`;
CREATE TABLE `doctor_user`(doctor_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '医生用户ID',
`doctor_no` varchar(64) NOT NULL UNIQUE comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`doctors_gender` varchar(64) comment '医生性别',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (doctor_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '医生用户';

DROP TABLE IF EXISTS `member_information`;
CREATE TABLE `member_information`(member_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '会员信息ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`last_physical_examination` date comment '上次体检',
`identification_number` varchar(64) comment '证件号码',
`contact_information` varchar(64) comment '联系方式',
`residential_address` text comment '居住地址',
`member_notes` text comment '会员备注',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (member_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '会员信息';
insert into `member_information` values (1,0,'会员姓名1','会员性别1','2023-05-05','证件号码1','联系方式1','居住地址1','会员备注1',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (2,0,'会员姓名2','会员性别2','2023-05-05','证件号码2','联系方式2','居住地址2','会员备注2',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (3,0,'会员姓名3','会员性别3','2023-05-05','证件号码3','联系方式3','居住地址3','会员备注3',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (4,0,'会员姓名4','会员性别4','2023-05-05','证件号码4','联系方式4','居住地址4','会员备注4',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (5,0,'会员姓名5','会员性别5','2023-05-05','证件号码5','联系方式5','居住地址5','会员备注5',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (6,0,'会员姓名6','会员性别6','2023-05-05','证件号码6','联系方式6','居住地址6','会员备注6',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (7,0,'会员姓名7','会员性别7','2023-05-05','证件号码7','联系方式7','居住地址7','会员备注7',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `member_information` values (8,0,'会员姓名8','会员性别8','2023-05-05','证件号码8','联系方式8','居住地址8','会员备注8',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');

DROP TABLE IF EXISTS `doctor_information`;
CREATE TABLE `doctor_information`(doctor_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '医生信息ID',
`doctor_account` int(11) DEFAULT 0 comment '医生账号',
`doctor_no` varchar(64) NOT NULL UNIQUE comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`doctors_photo` varchar(255) comment '医生照片',
`doctors_gender` varchar(64) comment '医生性别',
`employment_time` varchar(64) comment '从业时间',
`doctor_introduction` text comment '医生简介',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (doctor_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '医生信息';
insert into `doctor_information` values (1,0,'医生编号1','医生姓名1','/api/upload/1566598380468043777.jpg','医生性别1','从业时间1','医生简介1',595,103,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (2,0,'医生编号2','医生姓名2','/api/upload/1566598481093591041.jpg','医生性别2','从业时间2','医生简介2',972,39,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (3,0,'医生编号3','医生姓名3','/api/upload/1565185299930152961.jpg','医生性别3','从业时间3','医生简介3',583,490,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (4,0,'医生编号4','医生姓名4','/api/upload/1561994923945754624.jpg','医生性别4','从业时间4','医生简介4',477,124,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (5,0,'医生编号5','医生姓名5','/api/upload/1566598594159443968.jpg','医生性别5','从业时间5','医生简介5',112,525,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (6,0,'医生编号6','医生姓名6','/api/upload/1562015289476907008.jpg','医生性别6','从业时间6','医生简介6',526,60,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (7,0,'医生编号7','医生姓名7','/api/upload/1561995141177147392.jpg','医生性别7','从业时间7','医生简介7',307,685,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `doctor_information` values (8,0,'医生编号8','医生姓名8','/api/upload/1565185240446533633.jpg','医生性别8','从业时间8','医生简介8',793,506,0,'2023-05-05 09:52:32','2023-05-05 09:52:32');

DROP TABLE IF EXISTS `physical_examination_appointment`;
CREATE TABLE `physical_examination_appointment`(physical_examination_appointment_id int(11) NOT NULL AUTO_INCREMENT COMMENT '体检预约ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`doctor_account` int(11) DEFAULT 0 comment '医生账号',
`doctor_no` varchar(64) comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`time_of_appointment` datetime comment '预约时间',
`contact_information` varchar(64) comment '联系方式',
`remarks` text comment '备注',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (physical_examination_appointment_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '体检预约';
insert into `physical_examination_appointment` values (1,0,'会员姓名1','会员性别1',0,'医生编号1','医生姓名1','2023-05-05 09:52:32','联系方式1','备注1','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (2,0,'会员姓名2','会员性别2',0,'医生编号2','医生姓名2','2023-05-05 09:52:32','联系方式2','备注2','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (3,0,'会员姓名3','会员性别3',0,'医生编号3','医生姓名3','2023-05-05 09:52:32','联系方式3','备注3','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (4,0,'会员姓名4','会员性别4',0,'医生编号4','医生姓名4','2023-05-05 09:52:32','联系方式4','备注4','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (5,0,'会员姓名5','会员性别5',0,'医生编号5','医生姓名5','2023-05-05 09:52:32','联系方式5','备注5','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (6,0,'会员姓名6','会员性别6',0,'医生编号6','医生姓名6','2023-05-05 09:52:32','联系方式6','备注6','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (7,0,'会员姓名7','会员性别7',0,'医生编号7','医生姓名7','2023-05-05 09:52:32','联系方式7','备注7','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `physical_examination_appointment` values (8,0,'会员姓名8','会员性别8',0,'医生编号8','医生姓名8','2023-05-05 09:52:32','联系方式8','备注8','未审核','',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');

DROP TABLE IF EXISTS `consultation_information`;
CREATE TABLE `consultation_information`(consultation_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '咨询信息ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`doctor_account` int(11) DEFAULT 0 comment '医生账号',
`doctor_no` varchar(64) comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`submission_time` datetime comment '提交时间',
`consultation_topic` varchar(64) comment '咨询主题',
`content` text comment '内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (consultation_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '咨询信息';
insert into `consultation_information` values (1,0,'会员姓名1','会员性别1',0,'医生编号1','医生姓名1','2023-05-05 09:52:32','咨询主题1','内容1','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (2,0,'会员姓名2','会员性别2',0,'医生编号2','医生姓名2','2023-05-05 09:52:32','咨询主题2','内容2','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (3,0,'会员姓名3','会员性别3',0,'医生编号3','医生姓名3','2023-05-05 09:52:32','咨询主题3','内容3','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (4,0,'会员姓名4','会员性别4',0,'医生编号4','医生姓名4','2023-05-05 09:52:32','咨询主题4','内容4','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (5,0,'会员姓名5','会员性别5',0,'医生编号5','医生姓名5','2023-05-05 09:52:32','咨询主题5','内容5','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (6,0,'会员姓名6','会员性别6',0,'医生编号6','医生姓名6','2023-05-05 09:52:32','咨询主题6','内容6','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (7,0,'会员姓名7','会员性别7',0,'医生编号7','医生姓名7','2023-05-05 09:52:32','咨询主题7','内容7','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_information` values (8,0,'会员姓名8','会员性别8',0,'医生编号8','医生姓名8','2023-05-05 09:52:32','咨询主题8','内容8','未审核',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');

DROP TABLE IF EXISTS `consultation_response`;
CREATE TABLE `consultation_response`(consultation_response_id int(11) NOT NULL AUTO_INCREMENT COMMENT '咨询回复ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`doctor_account` int(11) DEFAULT 0 comment '医生账号',
`doctor_no` varchar(64) comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`consultation_topic` varchar(64) comment '咨询主题',
`content` text comment '内容',
`reply_time` datetime comment '回复时间',
`reply` text comment '回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (consultation_response_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '咨询回复';
insert into `consultation_response` values (1,0,'会员姓名1','会员性别1',0,'医生编号1','医生姓名1','咨询主题1','内容1','2023-05-05 09:52:32','回复1',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (2,0,'会员姓名2','会员性别2',0,'医生编号2','医生姓名2','咨询主题2','内容2','2023-05-05 09:52:32','回复2',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (3,0,'会员姓名3','会员性别3',0,'医生编号3','医生姓名3','咨询主题3','内容3','2023-05-05 09:52:32','回复3',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (4,0,'会员姓名4','会员性别4',0,'医生编号4','医生姓名4','咨询主题4','内容4','2023-05-05 09:52:32','回复4',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (5,0,'会员姓名5','会员性别5',0,'医生编号5','医生姓名5','咨询主题5','内容5','2023-05-05 09:52:32','回复5',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (6,0,'会员姓名6','会员性别6',0,'医生编号6','医生姓名6','咨询主题6','内容6','2023-05-05 09:52:32','回复6',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (7,0,'会员姓名7','会员性别7',0,'医生编号7','医生姓名7','咨询主题7','内容7','2023-05-05 09:52:32','回复7',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');
insert into `consultation_response` values (8,0,'会员姓名8','会员性别8',0,'医生编号8','医生姓名8','咨询主题8','内容8','2023-05-05 09:52:32','回复8',0,'2023-05-05 09:52:32','2023-05-05 09:52:32');

DROP TABLE IF EXISTS `health_records`;
CREATE TABLE `health_records`(health_records_id int(11) NOT NULL AUTO_INCREMENT COMMENT '健康档案ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`report_name` varchar(64) comment '报告名称',
`physical_examination_time` date comment '体检时间',
`height_cm` varchar(64) comment '身高/cm',
`body_weightkg` varchar(64) comment '体重/kg',
`blood_pressure_data` varchar(64) comment '血压数据',
`routine_blood_test` varchar(255) comment '血常规',
`urinalysis` varchar(255) comment '尿常规',
`liver_function` varchar(255) comment '肝功能',
`renal_function` varchar(255) comment '肾功能',
`electrocardiogram` varchar(255) comment '心电图',
`ultrasound_imaging` varchar(255) comment '超声影像',
`ct_examination` varchar(255) comment 'CT检查',
`other_inspections` text comment '其他检查',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (health_records_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '健康档案';
insert into `health_records` values (1,0,'会员姓名1','会员性别1','报告名称1','2023-05-05','身高/cm1','体重/kg1','血压数据1','','','','','','','','其他检查1',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (2,0,'会员姓名2','会员性别2','报告名称2','2023-05-05','身高/cm2','体重/kg2','血压数据2','','','','','','','','其他检查2',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (3,0,'会员姓名3','会员性别3','报告名称3','2023-05-05','身高/cm3','体重/kg3','血压数据3','','','','','','','','其他检查3',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (4,0,'会员姓名4','会员性别4','报告名称4','2023-05-05','身高/cm4','体重/kg4','血压数据4','','','','','','','','其他检查4',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (5,0,'会员姓名5','会员性别5','报告名称5','2023-05-05','身高/cm5','体重/kg5','血压数据5','','','','','','','','其他检查5',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (6,0,'会员姓名6','会员性别6','报告名称6','2023-05-05','身高/cm6','体重/kg6','血压数据6','','','','','','','','其他检查6',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (7,0,'会员姓名7','会员性别7','报告名称7','2023-05-05','身高/cm7','体重/kg7','血压数据7','','','','','','','','其他检查7',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_records` values (8,0,'会员姓名8','会员性别8','报告名称8','2023-05-05','身高/cm8','体重/kg8','血压数据8','','','','','','','','其他检查8',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');

DROP TABLE IF EXISTS `health_assessment`;
CREATE TABLE `health_assessment`(health_assessment_id int(11) NOT NULL AUTO_INCREMENT COMMENT '健康评估ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`member_gender` varchar(64) comment '会员性别',
`doctor_account` int(11) DEFAULT 0 comment '医生账号',
`doctor_no` varchar(64) comment '医生编号',
`doctors_name` varchar(64) comment '医生姓名',
`report_name` varchar(64) comment '报告名称',
`evaluation_date` date comment '评估日期',
`physical_assessment` text comment '体质评估',
`psychological_assessment` text comment '心理评估',
`doctors_advice` text comment '医生建议',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (health_assessment_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '健康评估';
insert into `health_assessment` values (1,0,'会员姓名1','会员性别1',0,'医生编号1','医生姓名1','报告名称1','2023-05-05','体质评估1','心理评估1','医生建议1',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (2,0,'会员姓名2','会员性别2',0,'医生编号2','医生姓名2','报告名称2','2023-05-05','体质评估2','心理评估2','医生建议2',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (3,0,'会员姓名3','会员性别3',0,'医生编号3','医生姓名3','报告名称3','2023-05-05','体质评估3','心理评估3','医生建议3',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (4,0,'会员姓名4','会员性别4',0,'医生编号4','医生姓名4','报告名称4','2023-05-05','体质评估4','心理评估4','医生建议4',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (5,0,'会员姓名5','会员性别5',0,'医生编号5','医生姓名5','报告名称5','2023-05-05','体质评估5','心理评估5','医生建议5',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (6,0,'会员姓名6','会员性别6',0,'医生编号6','医生姓名6','报告名称6','2023-05-05','体质评估6','心理评估6','医生建议6',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (7,0,'会员姓名7','会员性别7',0,'医生编号7','医生姓名7','报告名称7','2023-05-05','体质评估7','心理评估7','医生建议7',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `health_assessment` values (8,0,'会员姓名8','会员性别8',0,'医生编号8','医生姓名8','报告名称8','2023-05-05','体质评估8','心理评估8','医生建议8',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`(feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '意见反馈ID',
`member_account` int(11) DEFAULT 0 comment '会员账号',
`member_name` varchar(64) comment '会员姓名',
`submission_time` datetime comment '提交时间',
`feedback_type` varchar(64) comment '反馈类型',
`feedback_content` text comment '内容',
`examine_state` varchar(16) DEFAULT '未审核' NOT NULL comment '审核状态',
`examine_reply` varchar(16) DEFAULT '' comment '审核回复',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (feedback_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '意见反馈';
insert into `feedback` values (1,0,'会员姓名1','2023-05-05 09:52:33','反馈类型1','内容1','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (2,0,'会员姓名2','2023-05-05 09:52:33','反馈类型2','内容2','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (3,0,'会员姓名3','2023-05-05 09:52:33','反馈类型3','内容3','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (4,0,'会员姓名4','2023-05-05 09:52:33','反馈类型4','内容4','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (5,0,'会员姓名5','2023-05-05 09:52:33','反馈类型5','内容5','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (6,0,'会员姓名6','2023-05-05 09:52:33','反馈类型6','内容6','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (7,0,'会员姓名7','2023-05-05 09:52:33','反馈类型7','内容7','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');
insert into `feedback` values (8,0,'会员姓名8','2023-05-05 09:52:33','反馈类型8','内容8','未审核','',0,'2023-05-05 09:52:33','2023-05-05 09:52:33');

insert into `auth` values ('1','管理员','会员用户','member_users','会员用户','/member_users/table','','_blank','1','1','1','1','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('2','管理员','会员用户','member_users','会员用户详情','/member_users/view','','_blank','1','1','1','1','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('3','管理员','医生用户','doctor_user','医生用户','/doctor_user/table','','_blank','1','1','1','1','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('4','管理员','医生用户','doctor_user','医生用户详情','/doctor_user/view','','_blank','1','1','1','1','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('5','管理员','会员信息','member_information','会员信息','/member_information/table','','_blank','1','1','1','1','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{"figure":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('6','管理员','会员信息','member_information','会员信息详情','/member_information/view','','_blank','1','1','1','1','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('7','管理员','医生信息','doctor_information','医生信息','/doctor_information/table','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('8','管理员','医生信息','doctor_information','医生信息详情','/doctor_information/view','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('9','管理员','医生信息','doctor_information','医生信息','/doctor_information/list','top','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('10','管理员','医生信息','doctor_information','医生信息详情','/doctor_information/details','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('11','管理员','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('12','管理员','体检预约','physical_examination_appointment','体检预约详情','/physical_examination_appointment/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('13','管理员','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('14','管理员','咨询信息','consultation_information','咨询信息','/consultation_information/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('15','管理员','咨询信息','consultation_information','咨询信息详情','/consultation_information/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('16','管理员','咨询信息','consultation_information','咨询信息','/consultation_information/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('17','管理员','咨询回复','consultation_response','咨询回复','/consultation_response/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('18','管理员','咨询回复','consultation_response','咨询回复详情','/consultation_response/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('19','管理员','咨询回复','consultation_response','咨询回复','/consultation_response/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('20','管理员','健康档案','health_records','健康档案','/health_records/table','','_blank','1','1','1','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('21','管理员','健康档案','health_records','健康档案详情','/health_records/view','','_blank','1','1','1','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('22','管理员','健康档案','health_records','健康档案','/health_records/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('23','管理员','健康评估','health_assessment','健康评估','/health_assessment/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('24','管理员','健康评估','health_assessment','健康评估详情','/health_assessment/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('25','管理员','健康评估','health_assessment','健康评估','/health_assessment/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('26','管理员','意见反馈','feedback','意见反馈','/feedback/table','','_blank','1','1','1','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{"figure":true,"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('27','管理员','意见反馈','feedback','意见反馈详情','/feedback/view','','_blank','1','1','1','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('28','管理员','意见反馈','feedback','意见反馈','/feedback/edit','top','_blank','1','1','1','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('29','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('30','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('31','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('32','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('33','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('34','管理员','新闻','article','健康资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('35','管理员','新闻','article','资讯详情','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('36','管理员','新闻','article','健康资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('37','管理员','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('38','管理员','新闻分类','article_type','资讯分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('39','管理员','新闻分类','article_type','分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('40','管理员','公告','notice','网站公告','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('41','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('42','管理员','公告','notice','网站公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('43','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('44','游客','会员用户','member_users','会员用户','/member_users/table','','_blank','1','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('45','游客','会员用户','member_users','会员用户详情','/member_users/view','','_blank','1','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('46','游客','医生用户','doctor_user','医生用户','/doctor_user/table','','_blank','1','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('47','游客','医生用户','doctor_user','医生用户详情','/doctor_user/view','','_blank','1','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('48','游客','会员信息','member_information','会员信息','/member_information/table','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{"figure":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('49','游客','会员信息','member_information','会员信息详情','/member_information/view','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('50','游客','医生信息','doctor_information','医生信息','/doctor_information/table','','_blank','0','0','0','0','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('51','游客','医生信息','doctor_information','医生信息详情','/doctor_information/view','','_blank','0','0','0','0','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('52','游客','医生信息','doctor_information','医生信息','/doctor_information/list','top','_blank','0','0','0','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('53','游客','医生信息','doctor_information','医生信息详情','/doctor_information/details','','_blank','0','0','0','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('54','游客','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/table','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('55','游客','体检预约','physical_examination_appointment','体检预约详情','/physical_examination_appointment/view','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('56','游客','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('57','游客','咨询信息','consultation_information','咨询信息','/consultation_information/table','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('58','游客','咨询信息','consultation_information','咨询信息详情','/consultation_information/view','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('59','游客','咨询信息','consultation_information','咨询信息','/consultation_information/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('60','游客','咨询回复','consultation_response','咨询回复','/consultation_response/table','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('61','游客','咨询回复','consultation_response','咨询回复详情','/consultation_response/view','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('62','游客','咨询回复','consultation_response','咨询回复','/consultation_response/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('63','游客','健康档案','health_records','健康档案','/health_records/table','','_blank','0','0','0','0','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('64','游客','健康档案','health_records','健康档案详情','/health_records/view','','_blank','0','0','0','0','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('65','游客','健康档案','health_records','健康档案','/health_records/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('66','游客','健康评估','health_assessment','健康评估','/health_assessment/table','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('67','游客','健康评估','health_assessment','健康评估详情','/health_assessment/view','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('68','游客','健康评估','health_assessment','健康评估','/health_assessment/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('69','游客','意见反馈','feedback','意见反馈','/feedback/table','','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{"figure":false,"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('70','游客','意见反馈','feedback','意见反馈详情','/feedback/view','','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('71','游客','意见反馈','feedback','意见反馈','/feedback/edit','top','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('72','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('73','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('74','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('75','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('76','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('77','游客','新闻','article','健康资讯','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('78','游客','新闻','article','资讯详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('79','游客','新闻','article','健康资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('80','游客','新闻','article','资讯详情','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('81','游客','新闻分类','article_type','资讯分类','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('82','游客','新闻分类','article_type','分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('83','游客','公告','notice','网站公告','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('84','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('85','游客','公告','notice','网站公告','/notice/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('86','游客','公告','notice','公告详情','/notice/details','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('87','会员用户','会员用户','member_users','会员用户','/member_users/table','','_blank','0','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('88','会员用户','会员用户','member_users','会员用户详情','/member_users/view','','_blank','0','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('89','会员用户','医生用户','doctor_user','医生用户','/doctor_user/table','','_blank','0','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('90','会员用户','医生用户','doctor_user','医生用户详情','/doctor_user/view','','_blank','0','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('91','会员用户','会员信息','member_information','会员信息','/member_information/table','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{"figure":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('92','会员用户','会员信息','member_information','会员信息详情','/member_information/view','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('93','会员用户','医生信息','doctor_information','医生信息','/doctor_information/table','','_blank','0','0','0','0','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('94','会员用户','医生信息','doctor_information','医生信息详情','/doctor_information/view','','_blank','0','0','0','0','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('95','会员用户','医生信息','doctor_information','医生信息','/doctor_information/list','top','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('96','会员用户','医生信息','doctor_information','医生信息详情','/doctor_information/details','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('97','会员用户','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('98','会员用户','体检预约','physical_examination_appointment','体检预约详情','/physical_examination_appointment/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('99','会员用户','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('100','会员用户','咨询信息','consultation_information','咨询信息','/consultation_information/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('101','会员用户','咨询信息','consultation_information','咨询信息详情','/consultation_information/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('102','会员用户','咨询信息','consultation_information','咨询信息','/consultation_information/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('103','会员用户','咨询回复','consultation_response','咨询回复','/consultation_response/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('104','会员用户','咨询回复','consultation_response','咨询回复详情','/consultation_response/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('105','会员用户','咨询回复','consultation_response','咨询回复','/consultation_response/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('106','会员用户','健康档案','health_records','健康档案','/health_records/table','','_blank','0','0','0','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('107','会员用户','健康档案','health_records','健康档案详情','/health_records/view','','_blank','0','0','0','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('108','会员用户','健康档案','health_records','健康档案','/health_records/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('109','会员用户','健康评估','health_assessment','健康评估','/health_assessment/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('110','会员用户','健康评估','health_assessment','健康评估详情','/health_assessment/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('111','会员用户','健康评估','health_assessment','健康评估','/health_assessment/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('112','会员用户','意见反馈','feedback','意见反馈','/feedback/table','','_blank','0','1','0','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{"figure":false,"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('113','会员用户','意见反馈','feedback','意见反馈详情','/feedback/view','','_blank','0','1','0','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('114','会员用户','意见反馈','feedback','意见反馈','/feedback/edit','top','_blank','1','1','1','1','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('115','会员用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('116','会员用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('117','会员用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('118','会员用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('119','会员用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('120','会员用户','新闻','article','健康资讯','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('121','会员用户','新闻','article','资讯详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('122','会员用户','新闻','article','健康资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('123','会员用户','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('124','会员用户','新闻分类','article_type','资讯分类','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('125','会员用户','新闻分类','article_type','分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('126','会员用户','公告','notice','网站公告','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('127','会员用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('128','会员用户','公告','notice','网站公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('129','会员用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('130','医生用户','会员用户','member_users','会员用户','/member_users/table','','_blank','0','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('131','医生用户','会员用户','member_users','会员用户详情','/member_users/view','','_blank','0','0','0','0','member_name,member_gender','member_name,member_gender','member_name,member_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('132','医生用户','医生用户','doctor_user','医生用户','/doctor_user/table','','_blank','0','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('133','医生用户','医生用户','doctor_user','医生用户详情','/doctor_user/view','','_blank','0','0','0','0','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender','doctor_no,doctors_name,doctors_gender',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('134','医生用户','会员信息','member_information','会员信息','/member_information/table','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{"figure":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('135','医生用户','会员信息','member_information','会员信息详情','/member_information/view','','_blank','0','0','0','0','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes','member_account,member_name,member_gender,last_physical_examination,identification_number,contact_information,residential_address,member_notes',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('136','医生用户','医生信息','doctor_information','医生信息','/doctor_information/table','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('137','医生用户','医生信息','doctor_information','医生信息详情','/doctor_information/view','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('138','医生用户','医生信息','doctor_information','医生信息','/doctor_information/list','top','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('139','医生用户','医生信息','doctor_information','医生信息详情','/doctor_information/details','','_blank','1','1','1','1','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction','doctor_account,doctor_no,doctors_name,doctors_photo,doctors_gender,employment_time,doctor_introduction',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('140','医生用户','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('141','医生用户','体检预约','physical_examination_appointment','体检预约详情','/physical_examination_appointment/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('142','医生用户','体检预约','physical_examination_appointment','体检预约','/physical_examination_appointment/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,time_of_appointment,contact_information,remarks',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('143','医生用户','咨询信息','consultation_information','咨询信息','/consultation_information/table','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{"examine":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('144','医生用户','咨询信息','consultation_information','咨询信息详情','/consultation_information/view','','_blank','0','0','0','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('145','医生用户','咨询信息','consultation_information','咨询信息','/consultation_information/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,submission_time,consultation_topic,content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('146','医生用户','咨询回复','consultation_response','咨询回复','/consultation_response/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('147','医生用户','咨询回复','consultation_response','咨询回复详情','/consultation_response/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('148','医生用户','咨询回复','consultation_response','咨询回复','/consultation_response/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,consultation_topic,content,reply_time,reply',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('149','医生用户','健康档案','health_records','健康档案','/health_records/table','','_blank','0','0','0','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('150','医生用户','健康档案','health_records','健康档案详情','/health_records/view','','_blank','0','0','0','1','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('151','医生用户','健康档案','health_records','健康档案','/health_records/edit','','_blank','0','0','0','0','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections','member_account,member_name,member_gender,report_name,physical_examination_time,height_cm,body_weightkg,blood_pressure_data,routine_blood_test,urinalysis,liver_function,renal_function,electrocardiogram,ultrasound_imaging,ct_examination,other_inspections',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('152','医生用户','健康评估','health_assessment','健康评估','/health_assessment/table','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('153','医生用户','健康评估','health_assessment','健康评估详情','/health_assessment/view','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('154','医生用户','健康评估','health_assessment','健康评估','/health_assessment/edit','','_blank','1','1','1','1','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice','member_account,member_name,member_gender,doctor_account,doctor_no,doctors_name,report_name,evaluation_date,physical_assessment,psychological_assessment,doctors_advice',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('155','医生用户','意见反馈','feedback','意见反馈','/feedback/table','','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{"figure":false,"examine":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('156','医生用户','意见反馈','feedback','意见反馈详情','/feedback/view','','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('157','医生用户','意见反馈','feedback','意见反馈','/feedback/edit','top','_blank','0','0','0','0','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content','member_account,member_name,submission_time,feedback_type,feedback_content',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('158','医生用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('159','医生用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('160','医生用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('161','医生用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('162','医生用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('163','医生用户','新闻','article','健康资讯','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('164','医生用户','新闻','article','资讯详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('165','医生用户','新闻','article','健康资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('166','医生用户','新闻','article','资讯详情','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('167','医生用户','新闻分类','article_type','资讯分类','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('168','医生用户','新闻分类','article_type','分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('169','医生用户','公告','notice','网站公告','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('170','医生用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('171','医生用户','公告','notice','网站公告','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `auth` values ('172','医生用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `user_group` values ('3','100','会员用户',null,'member_users','member_users_id','0','3','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `user_group` values ('4','100','医生用户',null,'doctor_user','doctor_user_id','0','3','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1567327148396511233.jpg','790','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1567327231242403841.jpg','224','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1567327288222023680.jpg','635','2023-05-05 09:52:33.0','2023-05-05 09:52:33.0');
insert into `article` values ('1','不吃晚饭健康吗？北京协和研究发现：“过午不食”或可改善血糖','健康','39','0','2023-05-05 09:52:34.0','2023-05-05 09:52:34.0',null,null,null,'<p>对于该不该吃晚饭这件事，争议一直不断。想要减肥的人认为不吃晚饭可以起到减肥作用，成了不吃晚饭的忠实拥趸者。而注重养生的人，又把过午不食当作了养生的方法。</p><p>反对不吃晚饭的人也能例举出种种不吃晚饭的坏处，每个阵营都各有各的充分理由，可谓公说公有理，婆说婆有理。</p><p>那么不吃晚饭有没有科学道理呢？这样做健康不健康呢？</p><p><img src="http://n.sinaimg.cn/sinakd20230130ac/382/w1278h704/20230130/e73b-500d7cc82cd4375d7ebfe9547d262fc7.jpg"></p><p>北京协和研究发现：“过午不食”或可改善血糖</p><p>北京协和医院肝脏外科团队通过对90名非肥胖的健康志愿者展开限时进食的临床试验，他们将试验人群分为两个参照组。</p>','/api/upload/1619964588567035905.jpg',null);
insert into `article` values ('2','正月初九“拜天公”，牢记做2事忌4事，尊重老传统，祈福健康平安','健康','338','0','2023-05-05 09:52:34.0','2023-05-05 09:52:34.0',null,null,null,'<p>正月初九“天公生”，是传统农历节日之一。“天公”指的是玉皇大帝，“生”有生日的含义，在民俗中，正月初九为玉皇诞辰，俗称“玉皇会”。传言各路神仙，在正月初九这一天，都会向玉皇大帝庆贺。</p><p>在民间，正月初九这一天，人们也会通过祭拜的方式，求天公赐福，也祈福家人平安健康，新的一年，一切顺利，寄托了人们美好的愿望。</p><p>正月初九玉皇诞辰这天，各地也流传着一些习俗，也存在一些禁忌，本篇内容，笔者要说的“做2事、忌4事”，感兴趣的朋友要牢记，祈求新的一年，幸福长久、健康平安、一切如愿！具体指哪些？看完就有答案了。</p><p><img src="http://n.sinaimg.cn/sinakd20100/270/w640h430/20230130/e4bc-9bd857464cb425bc2fecd59c37a66e0c.jpg"></p>','/api/upload/1619964867848962048.jpg',null);
insert into `article` values ('3','广西广播电视台关注崇左强化基层医疗资源供','健康','389','0','2023-05-05 09:52:34.0','2023-05-05 09:52:34.0',null,null,null,'<p>为切实做好疫情防控优化调整工作，崇左市加大基层医疗资源下沉，提升农村基层医疗救治能力，确保农村地区患者能够得到及时救治，最大程度保护人民生命安全和身体健康。</p><p>日前，记者在大新县雷平中心卫生院看到，群众有序排队就医。雷平中心卫生院现有医护人员95人，床位130张，配有呼吸机、除颤仪等医疗设备，现有药品储备和医疗设施设备基本能满足群众的诊疗需求。</p><p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20230130s/35/w1080h555/20230130/a3dc-d7f1333f5a05c36df13abfbfc430de97.png"></p><p>在凭祥市友谊镇平而村，村卫生所的家庭签约医生成了群众健康的“守门人”。针对农村独居老人、失能人员、残疾人员等重点关注人群去医院就诊拿药困难的情况，当地村医上门巡诊为村民进行体温检测、血压检测、送医送药等医疗服务。</p>','/api/upload/1619965333391540225.jpg',null);
insert into `article` values ('4','寒假多场景近视防控问答 | 健康教育家长课堂','健康','283','0','2023-05-05 09:52:34.0','2023-05-05 09:52:34.0',null,null,null,'<p class="ql-align-center"><img src="https://n.sinaimg.cn/sinakd20230130s/739/w1080h459/20230130/0bf8-a83f7d05e43f9802f363157ebf0eb7ce.jpg"></p><p>为引导我省儿童青少年寒假期间科学用眼、规律作息、主动预防近视，黑龙江省儿童青少年近视防控专家宣讲团依据教育部下发的《2023年寒假多场景近视防控问答》进行整理，为广大儿童青少年和家长答疑解惑，提供指导。</p>','/api/upload/1619964323856121856.jpg',null);
insert into `article_type` values ('1','100','健康','0',null,null,null,'2023-05-05 09:52:34.0','2023-05-05 09:52:34.0');
