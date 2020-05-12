# Host: 127.0.0.1  (Version: 5.5.28)
# Date: 2020-05-13 00:01:58
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'Raymond','8bd6266de733d121f4f0fee649ab5357');

#
# Structure for table "collect"
#

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  `song_list_id` int(10) unsigned DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

#
# Data for table "collect"
#


#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  `song_list_id` int(10) unsigned DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `up` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#


#
# Structure for table "consumer"
#

DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `phone_num` char(15) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `avator` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `phone_num_UNIQUE` (`phone_num`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Data for table "consumer"
#

INSERT INTO `consumer` VALUES (29,'raymond','96e79218965eb72c92a549dd5a330112',1,'188','3022823354@qq.com','2020-05-08 00:00:00','','','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/avatorImages/1589026641075wechat.jpg','2020-05-09 17:38:59','2020-05-09 17:38:59'),(30,'tom','d41d8cd98f00b204e9800998ecf8427e',1,'null','null','2020-05-07 00:00:00','','','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/avatorImages/user.jpg','2020-05-09 20:18:26','2020-05-09 22:49:30');

#
# Structure for table "list_song"
#

DROP TABLE IF EXISTS `list_song`;
CREATE TABLE `list_song` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(10) unsigned NOT NULL,
  `song_list_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

#
# Data for table "list_song"
#

INSERT INTO `list_song` VALUES (210,125,85);

#
# Structure for table "rank"
#

DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `songListId` bigint(20) unsigned NOT NULL,
  `consumerId` bigint(20) unsigned NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `consumerId` (`consumerId`,`songListId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

#
# Data for table "rank"
#


#
# Structure for table "singer"
#

DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

#
# Data for table "singer"
#

INSERT INTO `singer` VALUES (44,'周杰伦',1,'https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/img/singerPic/1589028594571周杰伦.jpg','1979-01-18 00:00:00','中国','著名歌手，音乐人，词曲创作人，编曲及制作人，MV及电影导演。新世纪华语歌坛领军人物，中国风歌曲始祖，被时代周刊誉为“亚洲猫王”，是2000年后亚洲流行乐坛最具革命性与指标性的创作歌手，亚洲销量超过3100万张，有“亚洲流行天王”之称，开启华语乐坛“R&B时代”与“流行乐中国风”的先河，周杰伦的出现打破了亚洲流行乐坛长年停滞不前的局面，为亚洲流行乐坛翻开了新的一页，是华语乐坛真正把R&B提升到主流高度的人物，引领华语乐坛革命整十年，改写了华语乐坛的流行方向。'),(45,'矢野立美',1,'https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/img/singerPic/1589030949844矢野立美.jpg','1949-04-21 00:00:00','日本','矢野立美（和的たつみ），1949年4月21日出生，是日本的作曲家。秋田县仙北市角馆城市出身。学生时代为所属的社团的编曲，曾经担任青木志愿者。后作为作曲家的出道，为流行歌曲的编曲。曾经担任山口百惠的演唱会指挥，活跃于各种各样的音乐活动。');

#
# Structure for table "song"
#

DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `singer_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '发行时间',
  `update_time` datetime NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `lyric` text,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

#
# Data for table "song"
#

INSERT INTO `song` VALUES (124,44,'周杰伦-一路向北','Initial J','2020-05-09 21:01:40','2020-05-09 21:33:01','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/img/songPic/1589029603560一路向北周杰伦.jpg','[ti:一路向北]\n[ar:周杰伦]\n[offset:280]\n[00:00.00]周杰伦 - 一路向北\n[00:18.04]\n[00:24.95]\n[00:31.32]\n[00:36.07]後视镜里的世界\n[00:43.13]越来越远的道别\n[00:47.74]你转身向背\n[00:50.79]侧脸还是很美\n[00:54.34]我用眼光去追\n[00:57.92]竟听见你的泪\n[01:04.57]在车窗外面排徊\n[01:11.77]是我错失的机会\n[01:16.28]你站的方位\n[01:18.84]跟我中间隔著泪\n[01:22.39]街景一直在後退\n[01:26.08]你的崩溃在窗外零碎\n[01:30.16]我一路向北\n[01:33.02]离开有你的季节\n[01:37.70]你说你好累\n[01:40.26]已无法再爱上谁\n[01:44.51]风在山路吹\n[01:47.05]过往的画面全都是我不对\n[01:52.51]细数惭愧\n[01:54.68]我伤你几回\n[02:04.27]\n[02:10.46]\n[02:19.58]後视镜里的世界\n[02:26.79]越来越远的道别\n[02:31.30]你转身向背\n[02:34.52]侧脸还是很美\n[02:37.95]我用眼光去追\n[02:41.58]竟听见你的泪\n[02:48.19]在车窗外面排徊\n[02:55.28]是我错失的机会\n[03:00.43]你站的方位\n[03:02.38]跟我中间隔著泪\n[03:05.86]街景一直在後退\n[03:09.55]你的崩溃在窗外零碎\n[03:13.95]我一路向北\n[03:16.71]离开有你的季节\n[03:21.10]你说你好累\n[03:23.85]已无法再爱上谁\n[03:28.40]风在山路吹\n[03:31.08]过往的画面全都是我不对\n[03:36.31]细数惭愧\n[03:38.42]我伤你几回\n[03:42.81]我一路向北\n[03:45.38]离开有你的季节\n[03:49.96]方向盘周围\n[03:52.74]回转著我的後悔\n[03:57.86]我加速超越\n[03:59.80]却甩不掉紧紧跟随的伤悲\n[04:05.08]细数惭愧\n[04:07.25]我伤你几回\n[04:12.63]停止狼狈\n[04:14.37]就让错纯粹\n[04:22.82]','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/song/周杰伦-一路向北.mp3'),(125,45,'矢野立美-人类的光','迪迦奥特曼','2020-05-09 21:35:29','2020-05-09 21:35:29','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/img/songPic/1589031361986迪迦奥特曼.jpg','[00:00:00]暂无歌词','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/song/豆沙团子AnDango - 迪迦奥特曼 - 人类的光（Cover 矢野立美）.mp3');

#
# Structure for table "song_list"
#

DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `introduction` text,
  `style` varchar(10) DEFAULT '无',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

#
# Data for table "song_list"
#

INSERT INTO `song_list` VALUES (85,'迪迦奥特曼纯音乐','https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/img/songListPic/1589030311396迪迦奥特曼.jpg','“你看，那是村子的瞭望台！在那儿，有一条清澈的小河，河的对面是一望无际的莲藕池……”孤独的老人奥比克，指着夜色下已经被钢筋水泥覆盖的“村子”，一遍又一遍地呢喃。“村子又回来了，村子又回来了，村子又回来了！”','轻音乐');
