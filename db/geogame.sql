/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.1.3    Database: geogame
-- ------------------------------------------------------
-- Server version	11.8.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `continent` VALUES
(1,'AF','Africa'),
(2,'AN','Antarctica'),
(3,'AS','Asia'),
(4,'EU','Europe'),
(5,'OC','Oceania'),
(6,'SA','South America'),
(7,'NA','North America');
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `country` varchar(100) NOT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `neighbours` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`),
  KEY `continent_id` (`continent_id`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `country` VALUES
(1,'AD','Andorra','Andorra la Vella',468,77006,4,'Euro','EUR','ca','ES,FR'),
(2,'AE','United Arab Emirates','Abu Dhabi',82880,9630959,3,'Dirham','AED','ar-AE,fa,en,hi,ur','SA,OM'),
(3,'AF','Afghanistan','Kabul',647500,37172386,3,'Afghani','AFN','fa-AF,ps,uz-AF,tk','TM,CN,IR,TJ,PK,UZ'),
(4,'AG','Antigua and Barbuda','St. John\'s',443,96286,7,'Dollar','XCD','en-AG',''),
(5,'AI','Anguilla','The Valley',102,13254,7,'Dollar','XCD','en-AI',''),
(6,'AL','Albania','Tirana',28748,2866376,4,'Lek','ALL','sq,el','MK,GR,ME,RS,XK'),
(7,'AM','Armenia','Yerevan',29800,3076200,3,'Dram','AMD','hy','GE,IR,AZ,TR'),
(8,'AO','Angola','Luanda',1246700,30809762,1,'Kwanza','AOA','pt-AO','CD,NA,ZM,CG'),
(9,'AQ','Antarctica','',14000000,0,2,'','','',''),
(10,'AR','Argentina','Buenos Aires',2766890,44494502,6,'Peso','ARS','es-AR,en,it,de,fr,gn','CL,BO,UY,PY,BR'),
(11,'AS','American Samoa','Pago Pago',199,55465,5,'Dollar','USD','en-AS,sm,to',''),
(12,'AT','Austria','Vienna',83858,8847037,4,'Euro','EUR','de-AT,hr,hu,sl','CH,DE,HU,SK,CZ,IT,SI,LI'),
(13,'AU','Australia','Canberra',7686850,24992369,5,'Dollar','AUD','en-AU',''),
(14,'AW','Aruba','Oranjestad',193,105845,7,'Guilder','AWG','nl-AW,pap,es,en',''),
(15,'AX','Aland Islands','Mariehamn',1580,26711,4,'Euro','EUR','sv-AX',''),
(16,'AZ','Azerbaijan','Baku',86600,9942334,3,'Manat','AZN','az,ru,hy','GE,IR,AM,TR,RU'),
(17,'BA','Bosnia and Herzegovina','Sarajevo',51129,3323929,4,'Marka','BAM','bs,hr-BA,sr-BA','HR,ME,RS'),
(18,'BB','Barbados','Bridgetown',431,286641,7,'Dollar','BBD','en-BB',''),
(19,'BD','Bangladesh','Dhaka',144000,161356039,3,'Taka','BDT','bn-BD,en','MM,IN'),
(20,'BE','Belgium','Brussels',30510,11422068,4,'Euro','EUR','nl-BE,fr-BE,de-BE','DE,NL,LU,FR'),
(21,'BF','Burkina Faso','Ouagadougou',274200,19751535,1,'Franc','XOF','fr-BF,mos','NE,BJ,GH,CI,TG,ML'),
(22,'BG','Bulgaria','Sofia',110910,7000039,4,'Lev','BGN','bg,tr-BG,rom','MK,GR,RO,TR,RS'),
(23,'BH','Bahrain','Manama',665,1569439,3,'Dinar','BHD','ar-BH,en,fa,ur',''),
(24,'BI','Burundi','Gitega',27830,11175378,1,'Franc','BIF','fr-BI,rn','TZ,CD,RW'),
(25,'BJ','Benin','Porto-Novo',112620,11485048,1,'Franc','XOF','fr-BJ','NE,TG,BF,NG'),
(26,'BL','Saint Barthelemy','Gustavia',21,8450,7,'Euro','EUR','fr',''),
(27,'BM','Bermuda','Hamilton',53,63968,7,'Dollar','BMD','en-BM,pt',''),
(28,'BN','Brunei','Bandar Seri Begawan',5770,428962,3,'Dollar','BND','ms-BN,en-BN','MY'),
(29,'BO','Bolivia','Sucre',1098580,11353142,6,'Boliviano','BOB','es-BO,qu,ay','PE,CL,PY,BR,AR'),
(30,'BQ','Bonaire, Saint Eustatius and Saba ','',328,18012,7,'Dollar','USD','nl,pap,en',''),
(31,'BR','Brazil','Brasilia',8511965,209469333,6,'Real','BRL','pt-BR,es,en,fr','SR,PE,BO,UY,GY,PY,GF,VE,CO,AR'),
(32,'BS','Bahamas','Nassau',13940,385640,7,'Dollar','BSD','en-BS',''),
(33,'BT','Bhutan','Thimphu',47000,754394,3,'Ngultrum','BTN','dz','CN,IN'),
(34,'BV','Bouvet Island','',49,0,2,'Krone','NOK','',''),
(35,'BW','Botswana','Gaborone',600370,2254126,1,'Pula','BWP','en-BW,tn-BW','ZW,ZA,NA'),
(36,'BY','Belarus','Minsk',207600,9485386,4,'Belarusian ruble','BYN','be,ru','PL,LT,UA,RU,LV'),
(37,'BZ','Belize','Belmopan',22966,383071,7,'Dollar','BZD','en-BZ,es','GT,MX'),
(38,'CA','Canada','Ottawa',9984670,37058856,7,'Dollar','CAD','en-CA,fr-CA,iu','US'),
(39,'CC','Cocos Islands','West Island',14,628,3,'Dollar','AUD','ms-CC,en',''),
(40,'CD','Democratic Republic of the Congo','Kinshasa',2345410,84068091,1,'Franc','CDF','fr-CD,ln,ktu,kg,sw,lua','TZ,CF,SS,RW,ZM,BI,UG,CG,AO'),
(41,'CF','Central African Republic','Bangui',622984,4666377,1,'Franc','XAF','fr-CF,sg,ln,kg','TD,SD,CD,SS,CM,CG'),
(42,'CG','Republic of the Congo','Brazzaville',342000,5244363,1,'Franc','XAF','fr-CG,kg,ln-CG','CF,GA,CD,CM,AO'),
(43,'CH','Switzerland','Bern',41290,8516543,4,'Franc','CHF','de-CH,fr-CH,it-CH,rm','DE,IT,LI,FR,AT'),
(44,'CI','Ivory Coast','Yamoussoukro',322460,25069229,1,'Franc','XOF','fr-CI','LR,GH,GN,BF,ML'),
(45,'CK','Cook Islands','Avarua',240,21388,5,'Dollar','NZD','en-CK,mi',''),
(46,'CL','Chile','Santiago',756950,18729160,6,'Peso','CLP','es-CL','PE,BO,AR'),
(47,'CM','Cameroon','Yaounde',475440,25216237,1,'Franc','XAF','en-CM,fr-CM','TD,CF,GA,GQ,CG,NG'),
(48,'CN','China','Beijing',9596960,1411778724,3,'Yuan Renminbi','CNY','zh-CN,yue,wuu,dta,ug,za','LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN'),
(49,'CO','Colombia','Bogota',1138910,49648685,6,'Peso','COP','es-CO','EC,PE,PA,BR,VE'),
(50,'CR','Costa Rica','San Jose',51100,4999441,7,'Colon','CRC','es-CR,en','PA,NI'),
(51,'CU','Cuba','Havana',110860,11338138,7,'Peso','CUP','es-CU,pap','US'),
(52,'CV','Cabo Verde','Praia',4033,543767,1,'Escudo','CVE','pt-CV',''),
(53,'CW','Curacao',' Willemstad',444,159849,7,'Guilder','ANG','nl,pap',''),
(54,'CX','Christmas Island','Flying Fish Cove',135,1500,5,'Dollar','AUD','en,zh,ms-CX',''),
(55,'CY','Cyprus','Nicosia',9250,1189265,4,'Euro','EUR','el-CY,tr-CY,en',''),
(56,'CZ','Czechia','Prague',78866,10625695,4,'Koruna','CZK','cs,sk','PL,DE,SK,AT'),
(57,'DE','Germany','Berlin',357021,82927922,4,'Euro','EUR','de','CH,PL,NL,DK,BE,CZ,LU,FR,AT'),
(58,'DJ','Djibouti','Djibouti',23000,958920,1,'Franc','DJF','fr-DJ,ar,so-DJ,aa','ER,ET,SO'),
(59,'DK','Denmark','Copenhagen',43094,5797446,4,'Krone','DKK','da-DK,en,fo,de-DK','DE'),
(60,'DM','Dominica','Roseau',754,71625,7,'Dollar','XCD','en-DM',''),
(61,'DO','Dominican Republic','Santo Domingo',48730,10627165,7,'Peso','DOP','es-DO','HT'),
(62,'DZ','Algeria','Algiers',2381740,42228429,1,'Dinar','DZD','ar-DZ','NE,EH,LY,MR,TN,MA,ML'),
(63,'EC','Ecuador','Quito',283560,17084357,6,'Dollar','USD','es-EC','PE,CO'),
(64,'EE','Estonia','Tallinn',45226,1320884,4,'Euro','EUR','et,ru','RU,LV'),
(65,'EG','Egypt','Cairo',1001450,98423595,1,'Pound','EGP','ar-EG,en,fr','LY,SD,IL,PS'),
(66,'EH','Western Sahara','El-Aaiun',266000,273008,1,'Dirham','MAD','ar,mey','DZ,MR,MA'),
(67,'ER','Eritrea','Asmara',121320,6209262,1,'Nakfa','ERN','aa-ER,ar,tig,kun,ti-ER','ET,SD,DJ'),
(68,'ES','Spain','Madrid',504782,46723749,4,'Euro','EUR','es-ES,ca,gl,eu,oc','AD,PT,GI,FR,MA'),
(69,'ET','Ethiopia','Addis Ababa',1127127,109224559,1,'Birr','ETB','am,en-ET,om-ET,ti-ET,so-ET,sid','ER,KE,SD,SS,SO,DJ'),
(70,'FI','Finland','Helsinki',337030,5518050,4,'Euro','EUR','fi-FI,sv-FI,smn','NO,RU,SE'),
(71,'FJ','Fiji','Suva',18270,883483,5,'Dollar','FJD','en-FJ,fj',''),
(72,'FK','Falkland Islands','Stanley',12173,2638,6,'Pound','FKP','en-FK',''),
(73,'FM','Micronesia','Palikir',702,112640,5,'Dollar','USD','en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg',''),
(74,'FO','Faroe Islands','Torshavn',1399,48497,4,'Krone','DKK','fo,da-FO',''),
(75,'FR','France','Paris',547030,66987244,4,'Euro','EUR','fr-FR,frp,br,co,ca,eu,oc','CH,DE,BE,LU,IT,AD,MC,ES'),
(76,'GA','Gabon','Libreville',267667,2119275,1,'Franc','XAF','fr-GA','CM,GQ,CG'),
(77,'GB','United Kingdom','London',244820,66488991,4,'Pound','GBP','en-GB,cy-GB,gd','IE'),
(78,'GD','Grenada','St. George\'s',344,111454,7,'Dollar','XCD','en-GD',''),
(79,'GE','Georgia','Tbilisi',69700,3731000,3,'Lari','GEL','ka,ru,hy,az','AM,AZ,TR,RU'),
(80,'GF','French Guiana','Cayenne',91000,195506,6,'Euro','EUR','fr-GF','SR,BR'),
(81,'GG','Guernsey','St Peter Port',78,65228,4,'Pound','GBP','en,nrf',''),
(82,'GH','Ghana','Accra',239460,29767108,1,'Cedi','GHS','en-GH,ak,ee,tw','CI,TG,BF'),
(83,'GI','Gibraltar','Gibraltar',NULL,33718,4,'Pound','GIP','en-GI,es,it,pt','ES'),
(84,'GL','Greenland','Nuuk',2166086,56025,7,'Krone','DKK','kl,da-GL,en',''),
(85,'GM','Gambia','Banjul',11300,2280102,1,'Dalasi','GMD','en-GM,mnk,wof,wo,ff','SN'),
(86,'GN','Guinea','Conakry',245857,12414318,1,'Franc','GNF','fr-GN','LR,SN,SL,CI,GW,ML'),
(87,'GP','Guadeloupe','Basse-Terre',1780,443000,7,'Euro','EUR','fr-GP',''),
(88,'GQ','Equatorial Guinea','Malabo',28051,1308974,1,'Franc','XAF','es-GQ,fr,pt','GA,CM'),
(89,'GR','Greece','Athens',131940,10727668,4,'Euro','EUR','el-GR,en,fr','AL,MK,TR,BG'),
(90,'GS','South Georgia and the South Sandwich Islands','Grytviken',3903,30,2,'Pound','GBP','en',''),
(91,'GT','Guatemala','Guatemala City',108890,17247807,7,'Quetzal','GTQ','es-GT','MX,HN,BZ,SV'),
(92,'GU','Guam','Hagatna',549,165768,5,'Dollar','USD','en-GU,ch-GU',''),
(93,'GW','Guinea-Bissau','Bissau',36120,1874309,1,'Franc','XOF','pt-GW,pov','SN,GN'),
(94,'GY','Guyana','Georgetown',214970,779004,6,'Dollar','GYD','en-GY','SR,BR,VE'),
(95,'HK','Hong Kong','Hong Kong',1092,7396076,3,'Dollar','HKD','zh-HK,yue,zh,en',''),
(96,'HM','Heard Island and McDonald Islands','',412,0,2,'Dollar','AUD','',''),
(97,'HN','Honduras','Tegucigalpa',112090,9587522,7,'Lempira','HNL','es-HN,cab,miq','GT,NI,SV'),
(98,'HR','Croatia','Zagreb',56542,3871833,4,'Euro','EUR','hr-HR,sr','HU,SI,BA,ME,RS'),
(99,'HT','Haiti','Port-au-Prince',27750,11123176,7,'Gourde','HTG','ht,fr-HT','DO'),
(100,'HU','Hungary','Budapest',93030,9768785,4,'Forint','HUF','hu-HU','SK,SI,RO,UA,HR,AT,RS'),
(101,'ID','Indonesia','Jakarta',1919440,267663435,3,'Rupiah','IDR','id,en,nl,jv','PG,TL,MY'),
(102,'IE','Ireland','Dublin',70280,4853506,4,'Euro','EUR','en-IE,ga-IE','GB'),
(103,'IL','Israel','Jerusalem',20770,8883800,3,'Shekel','ILS','he,ar-IL,en-IL,','SY,JO,LB,EG,PS'),
(104,'IM','Isle of Man','Douglas',572,84077,4,'Pound','GBP','en,gv',''),
(105,'IN','India','New Delhi',3287590,1352617328,3,'Rupee','INR','en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,ks,ne,sd,kok,doi,mni,sit,sa,fr,lus,inc','CN,NP,MM,BT,PK,BD'),
(106,'IO','British Indian Ocean Territory','Diego Garcia',60,4000,3,'Dollar','USD','en-IO',''),
(107,'IQ','Iraq','Baghdad',437072,38433600,3,'Dinar','IQD','ar-IQ,ku,hy','SY,SA,IR,JO,TR,KW'),
(108,'IR','Iran','Tehran',1648000,81800269,3,'Rial','IRR','fa-IR,ku','TM,AF,IQ,AM,PK,AZ,TR'),
(109,'IS','Iceland','Reykjavik',103000,353574,4,'Krona','ISK','is,en,de,da,sv,no',''),
(110,'IT','Italy','Rome',301230,60431283,4,'Euro','EUR','it-IT,de-IT,fr-IT,sc,ca,co,sl','CH,VA,SI,SM,FR,AT'),
(111,'JE','Jersey','Saint Helier',116,90812,4,'Pound','GBP','en,fr,nrf',''),
(112,'JM','Jamaica','Kingston',10991,2934855,7,'Dollar','JMD','en-JM',''),
(113,'JO','Jordan','Amman',92300,9956011,3,'Dinar','JOD','ar-JO,en','SY,SA,IQ,IL,PS'),
(114,'JP','Japan','Tokyo',377835,126529100,3,'Yen','JPY','ja',''),
(115,'KE','Kenya','Nairobi',582650,51393010,1,'Shilling','KES','en-KE,sw-KE','ET,TZ,SS,SO,UG'),
(116,'KG','Kyrgyzstan','Bishkek',198500,6315800,3,'Som','KGS','ky,uz,ru','CN,TJ,UZ,KZ'),
(117,'KH','Cambodia','Phnom Penh',181040,16249798,3,'Riels','KHR','km,fr,en','LA,TH,VN'),
(118,'KI','Kiribati','Tarawa',811,115847,5,'Dollar','AUD','en-KI,gil',''),
(119,'KM','Comoros','Moroni',2170,832322,1,'Franc','KMF','ar,fr-KM',''),
(120,'KN','Saint Kitts and Nevis','Basseterre',261,52441,7,'Dollar','XCD','en-KN',''),
(121,'KP','North Korea','Pyongyang',120540,25549819,3,'Won','KPW','ko-KP','CN,KR,RU'),
(122,'KR','South Korea','Seoul',98480,51635256,3,'Won','KRW','ko-KR,en','KP'),
(123,'XK','Kosovo','Pristina',10908,1845300,4,'Euro','EUR','sq,sr','RS,AL,MK,ME'),
(124,'KW','Kuwait','Kuwait City',17820,4137309,3,'Dinar','KWD','ar-KW,en','SA,IQ'),
(125,'KY','Cayman Islands','George Town',262,64174,7,'Dollar','KYD','en-KY',''),
(126,'KZ','Kazakhstan','Nur-Sultan',2717300,18276499,3,'Tenge','KZT','kk,ru','TM,CN,KG,UZ,RU'),
(127,'LA','Laos','Vientiane',236800,7061507,3,'Kip','LAK','lo,fr,en','CN,MM,KH,TH,VN'),
(128,'LB','Lebanon','Beirut',10400,6848925,3,'Pound','LBP','ar-LB,fr-LB,en,hy','SY,IL'),
(129,'LC','Saint Lucia','Castries',616,181889,7,'Dollar','XCD','en-LC',''),
(130,'LI','Liechtenstein','Vaduz',160,37910,4,'Franc','CHF','de-LI','CH,AT'),
(131,'LK','Sri Lanka','Colombo',65610,21670000,3,'Rupee','LKR','si,ta,en',''),
(132,'LR','Liberia','Monrovia',111370,4818977,1,'Dollar','LRD','en-LR','SL,CI,GN'),
(133,'LS','Lesotho','Maseru',30355,2108132,1,'Loti','LSL','en-LS,st,zu,xh','ZA'),
(134,'LT','Lithuania','Vilnius',65200,2789533,4,'Euro','EUR','lt,ru,pl','PL,BY,RU,LV'),
(135,'LU','Luxembourg','Luxembourg',2586,607728,4,'Euro','EUR','lb,de-LU,fr-LU','DE,BE,FR'),
(136,'LV','Latvia','Riga',64589,1926542,4,'Euro','EUR','lv,ru,lt','LT,EE,BY,RU'),
(137,'LY','Libya','Tripoli',1759540,6678567,1,'Dinar','LYD','ar-LY,it,en','TD,NE,DZ,SD,TN,EG'),
(138,'MA','Morocco','Rabat',446550,36029138,1,'Dirham','MAD','ar-MA,ber,fr','DZ,EH,ES'),
(139,'MC','Monaco','Monaco',NULL,38682,4,'Euro','EUR','fr-MC,en,it','FR'),
(140,'MD','Moldova','Chisinau',33843,3545883,4,'Leu','MDL','ro,ru,gag,tr','RO,UA'),
(141,'ME','Montenegro','Podgorica',14026,622345,4,'Euro','EUR','sr,hu,bs,sq,hr,rom','AL,HR,BA,RS,XK'),
(142,'MF','Saint Martin','Marigot',53,37264,7,'Euro','EUR','fr','SX'),
(143,'MG','Madagascar','Antananarivo',587040,26262368,1,'Ariary','MGA','fr-MG,mg',''),
(144,'MH','Marshall Islands','Majuro',NULL,58413,5,'Dollar','USD','mh,en-MH',''),
(145,'MK','North Macedonia','Skopje',25333,2082958,4,'Denar','MKD','mk,sq,tr,rmm,sr','AL,GR,BG,RS,XK'),
(146,'ML','Mali','Bamako',1240000,19077690,1,'Franc','XOF','fr-ML,bm','SN,NE,DZ,CI,GN,MR,BF'),
(147,'MM','Myanmar','Nay Pyi Taw',678500,53708395,3,'Kyat','MMK','my','CN,LA,TH,BD,IN'),
(148,'MN','Mongolia','Ulaanbaatar',1565000,3170208,3,'Tugrik','MNT','mn,ru','CN,RU'),
(149,'MO','Macao','Macao',254,631636,3,'Pataca','MOP','zh,zh-MO,pt',''),
(150,'MP','Northern Mariana Islands','Saipan',477,56882,5,'Dollar','USD','fil,tl,zh,ch-MP,en-MP',''),
(151,'MQ','Martinique','Fort-de-France',1100,432900,7,'Euro','EUR','fr-MQ',''),
(152,'MR','Mauritania','Nouakchott',1030700,4403319,1,'Ouguiya','MRU','ar-MR,fuc,snk,fr,mey,wo','SN,DZ,EH,ML'),
(153,'MS','Montserrat','Plymouth',102,9341,7,'Dollar','XCD','en-MS',''),
(154,'MT','Malta','Valletta',316,483530,4,'Euro','EUR','mt,en-MT',''),
(155,'MU','Mauritius','Port Louis',2040,1265303,1,'Rupee','MUR','en-MU,bho,fr',''),
(156,'MV','Maldives','Male',300,515696,3,'Rufiyaa','MVR','dv,en',''),
(157,'MW','Malawi','Lilongwe',118480,17563749,1,'Kwacha','MWK','ny,yao,tum,swk','TZ,MZ,ZM'),
(158,'MX','Mexico','Mexico City',1972550,126190788,7,'Peso','MXN','es-MX','GT,US,BZ'),
(159,'MY','Malaysia','Kuala Lumpur',329750,31528585,3,'Ringgit','MYR','ms-MY,en,zh,ta,te,ml,pa,th','BN,TH,ID'),
(160,'MZ','Mozambique','Maputo',801590,29495962,1,'Metical','MZN','pt-MZ,vmw','ZW,TZ,SZ,ZA,ZM,MW'),
(161,'NA','Namibia','Windhoek',825418,2448255,1,'Dollar','NAD','en-NA,af,de,hz,naq','ZA,BW,ZM,AO'),
(162,'NC','New Caledonia','Noumea',19060,284060,5,'Franc','XPF','fr-NC',''),
(163,'NE','Niger','Niamey',1267000,22442948,1,'Franc','XOF','fr-NE,ha,kr,dje','TD,BJ,DZ,LY,BF,NG,ML'),
(164,'NF','Norfolk Island','Kingston',NULL,1828,5,'Dollar','AUD','en-NF',''),
(165,'NG','Nigeria','Abuja',923768,195874740,1,'Naira','NGN','en-NG,ha,yo,ig,ff','TD,NE,BJ,CM'),
(166,'NI','Nicaragua','Managua',129494,6465513,7,'Cordoba','NIO','es-NI,en','CR,HN'),
(167,'NL','The Netherlands','Amsterdam',41526,17231017,4,'Euro','EUR','nl-NL,fy-NL','DE,BE'),
(168,'NO','Norway','Oslo',324220,5314336,4,'Krone','NOK','no,nb,nn,se,fi','FI,RU,SE'),
(169,'NP','Nepal','Kathmandu',140800,28087871,3,'Rupee','NPR','ne,en','CN,IN'),
(170,'NR','Nauru','Yaren',21,12704,5,'Dollar','AUD','na,en-NR',''),
(171,'NU','Niue','Alofi',260,2166,5,'Dollar','NZD','niu,en-NU',''),
(172,'NZ','New Zealand','Wellington',268680,4885500,5,'Dollar','NZD','en-NZ,mi',''),
(173,'OM','Oman','Muscat',212460,4829483,3,'Rial','OMR','ar-OM,en,bal,ur','SA,YE,AE'),
(174,'PA','Panama','Panama City',78200,4176873,7,'Balboa','PAB','es-PA,en','CR,CO'),
(175,'PE','Peru','Lima',1285220,31989256,6,'Sol','PEN','es-PE,qu,ay','EC,CL,BO,BR,CO'),
(176,'PF','French Polynesia','Papeete',4167,277679,5,'Franc','XPF','fr-PF,ty',''),
(177,'PG','Papua New Guinea','Port Moresby',462840,8606316,5,'Kina','PGK','en-PG,ho,meu,tpi','ID'),
(178,'PH','Philippines','Manila',300000,106651922,3,'Peso','PHP','tl,en-PH,fil,ceb,ilo,hil,war,pam,bik,bcl,pag,mrw,tsg,mdh,cbk,krj,sgd,msb,akl,ibg,yka,mta,abx',''),
(179,'PK','Pakistan','Islamabad',803940,212215030,3,'Rupee','PKR','ur-PK,en-PK,pa,sd,ps,brh','CN,AF,IR,IN'),
(180,'PL','Poland','Warsaw',312685,37978548,4,'Zloty','PLN','pl','DE,LT,SK,CZ,BY,UA,RU'),
(181,'PM','Saint Pierre and Miquelon','Saint-Pierre',242,7012,7,'Euro','EUR','fr-PM',''),
(182,'PN','Pitcairn','Adamstown',47,46,5,'Dollar','NZD','en-PN',''),
(183,'PR','Puerto Rico','San Juan',9104,3195153,7,'Dollar','USD','en-PR,es-PR',''),
(184,'PS','Palestinian Territory','East Jerusalem',5970,4569087,3,'Shekel','ILS','ar-PS','JO,IL,EG'),
(185,'PT','Portugal','Lisbon',92391,10281762,4,'Euro','EUR','pt-PT,mwl','ES'),
(186,'PW','Palau','Melekeok',458,17907,5,'Dollar','USD','pau,sov,en-PW,tox,ja,fil,zh',''),
(187,'PY','Paraguay','Asuncion',406750,6956071,6,'Guarani','PYG','es-PY,gn','BO,BR,AR'),
(188,'QA','Qatar','Doha',11437,2781677,3,'Rial','QAR','ar-QA,es','SA'),
(189,'RE','Reunion','Saint-Denis',2517,776948,1,'Euro','EUR','fr-RE',''),
(190,'RO','Romania','Bucharest',237500,19473936,4,'Leu','RON','ro,hu,rom','MD,HU,UA,BG,RS'),
(191,'RS','Serbia','Belgrade',88361,6982084,4,'Dinar','RSD','sr,hu,bs,rom','AL,HU,MK,RO,HR,BA,BG,ME,XK'),
(192,'RU','Russia','Moscow',17100000,144478050,4,'Ruble','RUB','ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv,mdf,chm,ba,inh,kbd,krc,av,sah,nog','GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP'),
(193,'RW','Rwanda','Kigali',26338,12301939,1,'Franc','RWF','rw,en-RW,fr-RW,sw','TZ,CD,BI,UG'),
(194,'SA','Saudi Arabia','Riyadh',1960582,33699947,3,'Rial','SAR','ar-SA','QA,OM,IQ,YE,JO,AE,KW'),
(195,'SB','Solomon Islands','Honiara',28450,652858,5,'Dollar','SBD','en-SB,tpi',''),
(196,'SC','Seychelles','Victoria',455,96762,1,'Rupee','SCR','en-SC,fr-SC',''),
(197,'SD','Sudan','Khartoum',1861484,41801533,1,'Pound','SDG','ar-SD,en,fia','SS,TD,EG,ET,ER,LY,CF'),
(198,'SS','South Sudan','Juba',644329,8260490,1,'Pound','SSP','en','CD,CF,ET,KE,SD,UG'),
(199,'SE','Sweden','Stockholm',449964,10183175,4,'Krona','SEK','sv-SE,se,sma,fi-SE','NO,FI'),
(200,'SG','Singapore','Singapore',NULL,5638676,3,'Dollar','SGD','cmn,en-SG,ms-SG,ta-SG,zh-SG',''),
(201,'SH','Saint Helena','Jamestown',410,7460,1,'Pound','SHP','en-SH',''),
(202,'SI','Slovenia','Ljubljana',20273,2067372,4,'Euro','EUR','sl,sh','HU,IT,HR,AT'),
(203,'SJ','Svalbard and Jan Mayen','Longyearbyen',62049,2550,4,'Krone','NOK','no,ru',''),
(204,'SK','Slovakia','Bratislava',48845,5447011,4,'Euro','EUR','sk,hu','PL,HU,CZ,UA,AT'),
(205,'SL','Sierra Leone','Freetown',71740,7650154,1,'Leone','SLE','en-SL,men,tem','LR,GN'),
(206,'SM','San Marino','San Marino',NULL,33785,4,'Euro','EUR','it-SM','IT'),
(207,'SN','Senegal','Dakar',196190,15854360,1,'Franc','XOF','fr-SN,wo,fuc,mnk','GN,MR,GW,GM,ML'),
(208,'SO','Somalia','Mogadishu',637657,15008154,1,'Shilling','SOS','so-SO,ar-SO,it,en-SO','ET,KE,DJ'),
(209,'SR','Suriname','Paramaribo',163270,575991,6,'Dollar','SRD','nl-SR,en,srn,hns,jv','GY,BR,GF'),
(210,'ST','Sao Tome and Principe','Sao Tome',1001,197700,1,'Dobra','STN','pt-ST',''),
(211,'SV','El Salvador','San Salvador',21040,6420744,7,'Dollar','USD','es-SV','GT,HN'),
(212,'SX','Sint Maarten','Philipsburg',21,40654,7,'Guilder','ANG','nl,en','MF'),
(213,'SY','Syria','Damascus',185180,16906283,3,'Pound','SYP','ar-SY,ku,hy,arc,fr,en','IQ,JO,IL,TR,LB'),
(214,'SZ','Eswatini','Mbabane',17363,1136191,1,'Lilangeni','SZL','en-SZ,ss-SZ','ZA,MZ'),
(215,'TC','Turks and Caicos Islands','Cockburn Town',430,37665,7,'Dollar','USD','en-TC',''),
(216,'TD','Chad','N\'Djamena',1284000,15477751,1,'Franc','XAF','fr-TD,ar-TD,sre','NE,LY,CF,SD,CM,NG'),
(217,'TF','French Southern Territories','Port-aux-Francais',7829,140,2,'Euro','EUR','fr',''),
(218,'TG','Togo','Lome',56785,7889094,1,'Franc','XOF','fr-TG,ee,hna,kbp,dag,ha','BJ,GH,BF'),
(219,'TH','Thailand','Bangkok',514000,69428524,3,'Baht','THB','th,en','LA,MM,KH,MY'),
(220,'TJ','Tajikistan','Dushanbe',143100,9100837,3,'Somoni','TJS','tg,ru','CN,AF,KG,UZ'),
(221,'TK','Tokelau','',10,1466,5,'Dollar','NZD','tkl,en-TK',''),
(222,'TL','Timor Leste','Dili',15007,1267972,5,'Dollar','USD','tet,pt-TL,id,en','ID'),
(223,'TM','Turkmenistan','Ashgabat',488100,5850908,3,'Manat','TMT','tk,ru,uz','AF,IR,UZ,KZ'),
(224,'TN','Tunisia','Tunis',163610,11565204,1,'Dinar','TND','ar-TN,fr','DZ,LY'),
(225,'TO','Tonga','Nuku\'alofa',748,103197,5,'Pa\'anga','TOP','to,en-TO',''),
(226,'TR','Turkey','Ankara',780580,82319724,3,'Lira','TRY','tr-TR,ku,diq,az,av','SY,GE,IQ,IR,GR,AM,AZ,BG'),
(227,'TT','Trinidad and Tobago','Port of Spain',5128,1389858,7,'Dollar','TTD','en-TT,hns,fr,es,zh',''),
(228,'TV','Tuvalu','Funafuti',26,11508,5,'Dollar','AUD','tvl,en,sm,gil',''),
(229,'TW','Taiwan','Taipei',35980,23451837,3,'Dollar','TWD','zh-TW,zh,nan,hak',''),
(230,'TZ','Tanzania','Dodoma',945087,56318348,1,'Shilling','TZS','sw-TZ,en,ar','MZ,KE,CD,RW,ZM,BI,UG,MW'),
(231,'UA','Ukraine','Kyiv',603700,44622516,4,'Hryvnia','UAH','uk,ru-UA,rom,pl,hu','PL,MD,HU,SK,BY,RO,RU'),
(232,'UG','Uganda','Kampala',236040,42723139,1,'Shilling','UGX','en-UG,lg,sw,ar','TZ,KE,SS,CD,RW'),
(233,'UM','United States Minor Outlying Islands','',0,0,5,'Dollar','USD','en-UM',''),
(234,'US','United States','Washington',9629091,327167434,7,'Dollar','USD','en-US,es-US,haw,fr','CA,MX,CU'),
(235,'UY','Uruguay','Montevideo',176220,3449299,6,'Peso','UYU','es-UY','BR,AR'),
(236,'UZ','Uzbekistan','Tashkent',447400,32955400,3,'Som','UZS','uz,ru,tg','TM,AF,KG,TJ,KZ'),
(237,'VA','Vatican','Vatican City',NULL,921,4,'Euro','EUR','la,it,fr','IT'),
(238,'VC','Saint Vincent and the Grenadines','Kingstown',389,110211,7,'Dollar','XCD','en-VC,fr',''),
(239,'VE','Venezuela','Caracas',912050,28870195,6,'Bolivar Soberano','VES','es-VE','GY,BR,CO'),
(240,'VG','British Virgin Islands','Road Town',153,29802,7,'Dollar','USD','en-VG',''),
(241,'VI','U.S. Virgin Islands','Charlotte Amalie',352,106977,7,'Dollar','USD','en-VI',''),
(242,'VN','Vietnam','Hanoi',329560,95540395,3,'Dong','VND','vi,en,fr,zh,km','CN,LA,KH'),
(243,'VU','Vanuatu','Port Vila',12200,292680,5,'Vatu','VUV','bi,en-VU,fr-VU',''),
(244,'WF','Wallis and Futuna','Mata Utu',274,16025,5,'Franc','XPF','wls,fud,fr-WF',''),
(245,'WS','Samoa','Apia',2944,196130,5,'Tala','WST','sm,en-WS',''),
(246,'YE','Yemen','Sanaa',527970,28498687,3,'Rial','YER','ar-YE','SA,OM'),
(247,'YT','Mayotte','Mamoudzou',374,279471,1,'Euro','EUR','fr-YT',''),
(248,'ZA','South Africa','Pretoria',1219912,57779622,1,'Rand','ZAR','zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr','ZW,SZ,MZ,BW,NA,LS'),
(249,'ZM','Zambia','Lusaka',752614,17351822,1,'Kwacha','ZMW','en-ZM,bem,loz,lun,lue,ny,toi','ZW,TZ,MZ,CD,NA,MW,AO'),
(250,'ZW','Zimbabwe','Harare',390580,16868409,1,'Zimbabwe Gold','ZWG','en-ZW,sn,nr,nd','ZA,MZ,BW,ZM'),
(251,'CS','Serbia and Montenegro','Belgrade',102350,10829175,4,'Dinar','RSD','cu,hu,sq,sr','AL,HU,MK,RO,HR,BA,BG'),
(252,'AN','Netherlands Antilles','Willemstad',960,300000,7,'Guilder','ANG','nl-AN,en,es','GP');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `test_value_id` int(11) NOT NULL,
  `user_answer` varchar(100) DEFAULT NULL,
  `correct_answer` varchar(100) DEFAULT NULL,
  `error` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `test_value_id` (`test_value_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`test_value_id`) REFERENCES `test_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `test_value`
--

DROP TABLE IF EXISTS `test_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `col_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `factor` float DEFAULT 1,
  `unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `test_value_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_value`
--

LOCK TABLES `test_value` WRITE;
/*!40000 ALTER TABLE `test_value` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `test_value` VALUES
(1,'Capital','capital','de jure capital',1,NULL,NULL),
(2,'Area','area','area (in thousand km²)',2,1000,'km²'),
(3,'Population','population','population (in million)',2,1000000,'People'),
(4,'Currency','currency_name','name of the legal currency',1,NULL,NULL),
(5,'Languages','languages','official languages',3,NULL,'language'),
(6,'Neighbours','neighbours','neighbouring countries',3,NULL,'country');
/*!40000 ALTER TABLE `test_value` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `type` VALUES
(1,'Static','Static values to compare, like capital or currency.'),
(2,'Num','Numeric test values with error computation'),
(3,'Multi','Answer has multiple elements, like for neighbours or languages');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-22  5:46:36
