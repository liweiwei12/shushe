SET NAMES UTF8;
CREATE DATABASE shushe CHARSET=UTF8;
USE shushe;
CREATE TABLE ss_index_books(
	bid INT PRIMARY KEY AUTO_INCREMENT,
	bname VARCHAR(128),
	price DECIMAL(6,2),
	pic VARCHAR(256),
	adr VARCHAR(256)
);
INSERT INTO ss_index_books VALUES
(null,"内向性格的竞争力（帮助您看见内向孩子的力量）",49.80,"img/index/B3.jpg","北京"),
(null,"儒侠金庸传,既想继承祖辈留下的儒家理念,又不得不为世事所牵绊从此世间无儒侠",35.40,"img/index/B2.jpg","海南"),
(null,"武志红：拥有一个你说了算的人生·活出自我篇",60.20,"img/index/B10.jpg","深圳"),
(null," 弱传播（所有成功都离不开传播）",26.50,"img/index/B1.jpg","广州"),
(null,"熊镇（吴磊领读书目，马天宇私人书单，新的一年起，找到你要守护的东西）",42.00,"img/index/B4.jpg","北京"),
(null,"世界分国系列地图册--亚洲地图册",18.6,"img/index/B5.jpg","上海"),
(null,"自在独行 贾平凹的独行世界",36.40,"img/index/B6.jpg","陕西"),
(null,"非常美好的无所事事
《纽约时报》年度绘本奖得主代表作，帮助孩子学习独处，自己发现和寻找生活的乐趣！",31.60,"img/index/B7.jpg","山西"),
(null,"初级会计职称考试教材2019教材 2019年初级会计专业技术资格考试初级会计实务",42.00,"img/index/B8.jpg","山东"),
(null,"掌控关系
人人都需要的关系百科。人际关系洞察家熊太行教你在人际关系中，拿回人生主动权",30.30,"img/index/B9.jpg","河北"),
(null,"流浪地球-电影制作手记",53.20,"img/index/B11.jpg","天津"),
(null,"做自己人生的CEO：人人都需要的管理术（独家签名本）",46.10,"img/index/B12.jpg","贵州"),
(null,"工匠精神：向价值型员工进化——精装典藏新版",33.00,"img/index/B13.jpg","江西"),
(null,"岛上书店（每个人的生命中，都有无比艰难的那一年，将人生变得美好而辽阔。",29.80,"img/index/B14.jpg","北京"),
(null,"小读客·我遇见了一只小灰狼",42.40,"img/index/B15.jpg","湖南"),
(null,"爱如繁星（随书附赠唯美明信片+超萌Q版人设贴纸）",32.10,"img/index/B16.jpg","武汉"),
(null,"一切所遇，欢迎光临（豆瓣、十点读书、「ONE·一个」、犀牛故事超人气作者李荷西）",38.00,"img/index/B17.jpg","西藏"),
(null,"斗破苍穹全集第一辑（套装1-15册，升级典藏版，全集共30册）",397.40,"img/index/B18.jpg","台湾"),
(null,"《仓央嘉措》白金增订版 当当独家特供仓央嘉措诗集图",37.40,"img/index/B19.jpg","澳门"),
(null,"游戏力畅销版套装（全3册）[精选套装]",126.30,"img/index/B20.jpg","香港"),
(null,"文言文启蒙读本（精装定制）",42.70,"img/index/B21.jpg","上海"),
(null,"那不勒斯四部曲（函套版）（套装共4册）",210.00,"img/index/B22.jpg","甘肃"),
(null,"活力——稻盛和夫的人生经营法",33.60,"img/index/B23.jpg","广西"),
(null,"学会管自己幼儿版-歪歪兔自控力教育系列绘本",64.90,"img/index/B24.jpg","哈尔滨"),
(null,"少女，请回答（李诞、韩寒、八月长安力荐，17-27岁，我们的成长与失去）",49.00,"img/index/B25.jpg","四川"),
(null,"小学生优秀作文辅导大全 作文素材精选 写什么都不怕！写什么都精彩！",15.40,"img/index/B26.jpg","南京"),
(null,"2019美术日记 欧体楷书-一日一字",88.10,"img/index/B27.jpg","深圳"),
(null,"跟乐嘉学性格色彩（新版）",37.00,"img/index/B28.jpg","广州"),
(null,"东野圭吾作品：假面之夜+假面饭店+假面前夜（套装共3册）独家附赠精美手账",122.40,"img/index/B29.jpg","北京"),
(null," 就喜欢你看不惯我又干不掉我的样子1（增订版）",59.00,"img/index/B30.jpg","上海")
;
CREATE TABLE ss_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	pic VARCHAR(256)
);
INSERT INTO ss_index_carousel VALUES
(null,"http://127.0.0.1:3000/img/carousel/1.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/2.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/3.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/4.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/5.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/6.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/7.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/8.jpg"),
(null,"http://127.0.0.1:3000/img/carousel/9.jpg");
create table ss_books_pic(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	pid int,
	pic VARCHAR(256)
);
insert into ss_books_pic values
(null,1,"http://127.0.0.1:3000/img/pic/nx1.jpg"),
(null,1,"http://127.0.0.1:3000/img/pic/nx2.jpg"),
(null,2,"http://127.0.0.1:3000/img/pic/jy1.jpg"),
(null,2,"http://127.0.0.1:3000/img/pic/jy2.jpg"),
(null,3,"http://127.0.0.1:3000/img/pic/yy1.jpg"),
(null,3,"http://127.0.0.1:3000/img/pic/yy2.jpg"),
(null,4,"http://127.0.0.1:3000/img/pic/rcb1.jpg"),
(null,4,"http://127.0.0.1:3000/img/pic/rcb2.jpg"),
(null,5,"http://127.0.0.1:3000/img/pic/xz1.jpg"),
(null,5,"http://127.0.0.1:3000/img/pic/xz2.jpg"),
(null,6,"http://127.0.0.1:3000/img/pic/yz1.jpg"),
(null,6,"http://127.0.0.1:3000/img/pic/yz2.jpg"),
(null,7,"http://127.0.0.1:3000/img/pic/zzdx1.jpg"),
(null,7,"http://127.0.0.1:3000/img/pic/zzdx2.jpg"),
(null,7,"http://127.0.0.1:3000/img/pic/zzdx3.jpg"),
(null,8,"http://127.0.0.1:3000/img/pic/fcmh1.jpg"),
(null,8,"http://127.0.0.1:3000/img/pic/fcmh2.jpg"),
(null,9,"http://127.0.0.1:3000/img/pic/cjkj1.jpg"),
(null,9,"http://127.0.0.1:3000/img/pic/cjkj2.jpg"),
(null,10,"http://127.0.0.1:3000/img/pic/zkgx1.jpg"),
(null,10,"http://127.0.0.1:3000/img/pic/zkgx2.jpg"),
(null,11,"http://127.0.0.1:3000/img/pic/lldq1.jpg"),
(null,11,"http://127.0.0.1:3000/img/pic/lldi2.jpg"),
(null,12,"http://127.0.0.1:3000/img/pic/ceo1.jpg"),
(null,12,"http://127.0.0.1:3000/img/pic/ceo2.jpg"),
(null,12,"http://127.0.0.1:3000/img/pic/ceo3.jpg"),
(null,13,"http://127.0.0.1:3000/img/pic/gjjs1.jpg"),
(null,13,"http://127.0.0.1:3000/img/pic/gjjs2.jpg"),
(null,14,"http://127.0.0.1:3000/img/pic/dssd1.jpg"),
(null,14,"http://127.0.0.1:3000/img/pic/dssd2.jpg"),
(null,15,"http://127.0.0.1:3000/img/pic/wyjl1.jpg"),
(null,15,"http://127.0.0.1:3000/img/pic/wyjl2.jpg"),
(null,16,"http://127.0.0.1:3000/img/pic/arfx1.jpg"),
(null,16,"http://127.0.0.1:3000/img/pic/arfx2.jpg"),
(null,17,"http://127.0.0.1:3000/img/pic/yqsy1.jpg"),
(null,17,"http://127.0.0.1:3000/img/pic/yqsy2.jpg"),
(null,18,"http://127.0.0.1:3000/img/pic/dpcq1.jpg"),
(null,18,"http://127.0.0.1:3000/img/pic/dpcq2.jpg"),
(null,19,"http://127.0.0.1:3000/img/pic/cyjc1.jpg"),
(null,19,"http://127.0.0.1:3000/img/pic/cyjc2.jpg"),
(null,20,"http://127.0.0.1:3000/img/pic/yxl1.jpg"),
(null,20,"http://127.0.0.1:3000/img/pic/yxl2.jpg"),
(null,21,"http://127.0.0.1:3000/img/pic/wyw1.jpg"),
(null,21,"http://127.0.0.1:3000/img/pic/wyw2.jpg"),
(null,21,"http://127.0.0.1:3000/img/pic/wyw3.jpg"),
(null,22,"http://127.0.0.1:3000/img/pic/nbls1.jpg"),
(null,22,"http://127.0.0.1:3000/img/pic/nbls2.jpg"),
(null,23,"http://127.0.0.1:3000/img/pic/hl1.jpg"),
(null,23,"http://127.0.0.1:3000/img/pic/hl2.jpg"),
(null,24,"http://127.0.0.1:3000/img/pic/wwt1.jpg"),
(null,24,"http://127.0.0.1:3000/img/pic/wwt2.jpg"),
(null,25,"http://127.0.0.1:3000/img/pic/sn1.jpg"),
(null,25,"http://127.0.0.1:3000/img/pic/sn2.jpg"),
(null,26,"http://127.0.0.1:3000/img/pic/yxzw1.jpg"),
(null,26,"http://127.0.0.1:3000/img/pic/yxzw2.jpg"),
(null,27,"http://127.0.0.1:3000/img/pic/msrj1.jpg"),
(null,27,"http://127.0.0.1:3000/img/pic/msrj2.jpg"),
(null,28,"http://127.0.0.1:3000/img/pic/xgsc1.jpg"),
(null,28,"http://127.0.0.1:3000/img/pic/xgsc2.jpg"),
(null,29,"http://127.0.0.1:3000/img/pic/jmzy1.jpg"),
(null,29,"http://127.0.0.1:3000/img/pic/jmzy2.jpg"),
(null,30,"http://127.0.0.1:3000/img/pic/jxh1.jpg"),
(null,30,"http://127.0.0.1:3000/img/pic/jxh2.jpg");
create table ss_details(
	did INT PRIMARY KEY AUTO_INCREMENT,
	pid int,
	detail varchar(256),
	param VARCHAR(256)
);
insert into ss_details values
(null,1,"http://127.0.0.1:3000/img/details/1details.jpg","http://127.0.0.1:3000/img/details/1param.PNG"),
(null,2,"http://127.0.0.1:3000/img/details/2details.jpg","http://127.0.0.1:3000/img/details/2param.PNG"),
(null,3,"http://127.0.0.1:3000/img/details/3details.jpg","http://127.0.0.1:3000/img/details/3param.PNG"),
(null,4,"http://127.0.0.1:3000/img/details/4details.jpg","http://127.0.0.1:3000/img/details/4param.PNG"),
(null,5,"http://127.0.0.1:3000/img/details/5details.jpg","http://127.0.0.1:3000/img/details/5param.PNG"),
(null,6,"http://127.0.0.1:3000/img/details/6details.jpg","http://127.0.0.1:3000/img/details/6param.PNG"),
(null,7,"http://127.0.0.1:3000/img/details/7details.jpg","http://127.0.0.1:3000/img/details/7param.PNG"),
(null,8,"http://127.0.0.1:3000/img/details/8details.jpg","http://127.0.0.1:3000/img/details/8param.PNG"),
(null,9,"http://127.0.0.1:3000/img/details/9details.jpg","http://127.0.0.1:3000/img/details/9param.PNG"),
(null,10,"http://127.0.0.1:3000/img/details/10details.jpg","http://127.0.0.1:3000/img/details/10param.PNG"),
(null,11,"http://127.0.0.1:3000/img/details/1details.jpg","http://127.0.0.1:3000/img/details/1param.PNG"),
(null,12,"http://127.0.0.1:3000/img/details/2details.jpg","http://127.0.0.1:3000/img/details/2param.PNG"),
(null,13,"http://127.0.0.1:3000/img/details/3details.jpg","http://127.0.0.1:3000/img/details/3param.PNG"),
(null,14,"http://127.0.0.1:3000/img/details/4details.jpg","http://127.0.0.1:3000/img/details/4param.PNG"),
(null,15,"http://127.0.0.1:3000/img/details/5details.jpg","http://127.0.0.1:3000/img/details/5param.PNG"),
(null,16,"http://127.0.0.1:3000/img/details/6details.jpg","http://127.0.0.1:3000/img/details/6param.PNG"),
(null,17,"http://127.0.0.1:3000/img/details/7details.jpg","http://127.0.0.1:3000/img/details/7param.PNG"),
(null,18,"http://127.0.0.1:3000/img/details/8details.jpg","http://127.0.0.1:3000/img/details/8param.PNG"),
(null,19,"http://127.0.0.1:3000/img/details/9details.jpg","http://127.0.0.1:3000/img/details/9param.PNG"),
(null,20,"http://127.0.0.1:3000/img/details/10details.jpg","http://127.0.0.1:3000/img/details/10param.PNG"),
(null,21,"http://127.0.0.1:3000/img/details/1details.jpg","http://127.0.0.1:3000/img/details/1param.PNG"),
(null,22,"http://127.0.0.1:3000/img/details/2details.jpg","http://127.0.0.1:3000/img/details/2param.PNG"),
(null,23,"http://127.0.0.1:3000/img/details/3details.jpg","http://127.0.0.1:3000/img/details/3param.PNG"),
(null,24,"http://127.0.0.1:3000/img/details/4details.jpg","http://127.0.0.1:3000/img/details/4param.PNG"),
(null,25,"http://127.0.0.1:3000/img/details/5details.jpg","http://127.0.0.1:3000/img/details/5param.PNG"),
(null,26,"http://127.0.0.1:3000/img/details/6details.jpg","http://127.0.0.1:3000/img/details/6param.PNG"),
(null,27,"http://127.0.0.1:3000/img/details/7details.jpg","http://127.0.0.1:3000/img/details/7param.PNG"),
(null,28,"http://127.0.0.1:3000/img/details/8details.jpg","http://127.0.0.1:3000/img/details/8param.PNG"),
(null,29,"http://127.0.0.1:3000/img/details/9details.jpg","http://127.0.0.1:3000/img/details/9param.PNG"),
(null,30,"http://127.0.0.1:3000/img/details/10details.jpg","http://127.0.0.1:3000/img/details/10param.PNG");
create table ss_book_cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
	pid int,
	counts VARCHAR(256),
	uid int
);
create table ss_book_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(256),
	avatar VARCHAR(256)
);
insert into ss_book_user values
(null,"计划窘境","http://127.0.0.1:3000/img/pic/jxh2.jpg"),
(null,"黄金黄金东风浩荡","http://127.0.0.1:3000/img/pic/msrj1.jpg");
create table ss_chat_msg(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	msg VARCHAR(256)
);
create table ss_register(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(256),
	pwd int(128),
	phone int(128),
	email varchar(128)
);