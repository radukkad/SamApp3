CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `departments` VALUES (1,'HR',1);
INSERT INTO `departments` VALUES (2,'Finance',2);
INSERT INTO `departments` VALUES (3,'Research',3);
INSERT INTO `departments` VALUES (4,'Sales',4);
INSERT INTO `departments` VALUES (5,'Business Development',5);
INSERT INTO `departments` VALUES (6,'Operations',6);
INSERT INTO `departments` VALUES (7,'Marketing',7);
INSERT INTO `departments` VALUES (8,'Support',8);
INSERT INTO `departments` VALUES (9,'Call Center',9);
INSERT INTO `departments` VALUES (10,'Logistics',10);
INSERT INTO `departments` VALUES (11,'Legal',11);
INSERT INTO `departments` VALUES (12,'Security',12);

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=latin1;

INSERT INTO `employees` VALUES (1,'Alice','Anderson',25000,1,'2010-08-06');
INSERT INTO `employees` VALUES (2,'Bob','Barker',35000,2,'2011-10-24');
INSERT INTO `employees` VALUES (3,'Carl','Carlson',25000,3,'2011-05-14');
INSERT INTO `employees` VALUES (4,'Draven','Cropper',89000,4,'2012-02-12');
INSERT INTO `employees` VALUES (5,'Holly','Hemmer',66000,5,'2010-06-26');
INSERT INTO `employees` VALUES (6,'Jovani','Rieke',32000,6,'2011-10-14');
INSERT INTO `employees` VALUES (7,'Sherlyn','Kiger',68000,7,'2012-01-04');
INSERT INTO `employees` VALUES (8,'Jayson','Cline',86000,8,'2012-02-17');
INSERT INTO `employees` VALUES (9,'Katie','Fackler',15000,9,'2012-02-01');
INSERT INTO `employees` VALUES (10,'Zayne','Greathouse',21000,10,'2011-06-17');
INSERT INTO `employees` VALUES (11,'Madilyn','Murdoch',60000,11,'2011-04-05');
INSERT INTO `employees` VALUES (12,'Ivy','Aikens',75000,12,'2010-06-09');
INSERT INTO `employees` VALUES (13,'Hayden','Manzer',74000,2,'2011-02-22');
INSERT INTO `employees` VALUES (14,'Mercedes','Ringo',32000,3,'2010-05-11');
INSERT INTO `employees` VALUES (15,'Erica','Ohalloran',47000,4,'2011-02-04');
INSERT INTO `employees` VALUES (16,'Adriana','Sandridge',85000,5,'2011-05-28');
INSERT INTO `employees` VALUES (17,'Harlow','Markham',45000,6,'2011-02-28');
INSERT INTO `employees` VALUES (18,'Larry','Said',43000,7,'2011-06-22');
INSERT INTO `employees` VALUES (19,'Ada','Mcalpin',25000,8,'2010-11-07');
INSERT INTO `employees` VALUES (20,'Lamar','Marcial',43000,9,'2011-11-08');
INSERT INTO `employees` VALUES (21,'Davian','Iliff',91000,10,'2010-12-21');
INSERT INTO `employees` VALUES (22,'Jazmyn','Weight',88000,11,'2011-06-06');
INSERT INTO `employees` VALUES (23,'Jaylah','Brunk',87000,12,'2011-08-06');
INSERT INTO `employees` VALUES (24,'Clinton','Hedman',87000,1,'2011-10-07');
INSERT INTO `employees` VALUES (25,'Leona','Emrick',38000,2,'2010-12-28');
INSERT INTO `employees` VALUES (26,'Amira','Sumpter',50000,3,'2010-11-09');
INSERT INTO `employees` VALUES (27,'Felipe','Rafter',60000,4,'2012-02-24');
INSERT INTO `employees` VALUES (28,'Daniela','Dwyer',69000,5,'2012-02-22');
INSERT INTO `employees` VALUES (29,'Reagan','Hardwick',72000,6,'2011-01-12');
INSERT INTO `employees` VALUES (30,'Toby','Canela',83000,7,'2010-09-03');
INSERT INTO `employees` VALUES (31,'Vivian','Friesen',57000,8,'2011-02-23');
INSERT INTO `employees` VALUES (32,'Charlie','Stockard',80000,9,'2011-12-04');
INSERT INTO `employees` VALUES (33,'Ariel','Pak',60000,10,'2010-07-01');
INSERT INTO `employees` VALUES (34,'Alyvia','Buser',90000,11,'2010-12-11');
INSERT INTO `employees` VALUES (35,'Aditya','Strub',31000,12,'2010-07-23');
INSERT INTO `employees` VALUES (36,'Charley','Severs',40000,1,'2011-08-23');
INSERT INTO `employees` VALUES (37,'Miguel','Medrano',27000,2,'2010-06-21');
INSERT INTO `employees` VALUES (38,'Ivy','Hufnagel',69000,3,'2012-02-25');
INSERT INTO `employees` VALUES (39,'Greyson','Medrano',20000,4,'2010-10-01');
INSERT INTO `employees` VALUES (40,'Kyndall','Bielecki',53000,5,'2010-12-17');
INSERT INTO `employees` VALUES (41,'Niko','Rosenberger',21000,6,'2011-01-03');
INSERT INTO `employees` VALUES (42,'Daniela','Morefield',63000,7,'2011-05-12');
INSERT INTO `employees` VALUES (43,'Josie','Waterman',66000,8,'2011-11-09');
INSERT INTO `employees` VALUES (44,'Cheyanne','Redondo',64000,9,'2011-11-03');
INSERT INTO `employees` VALUES (45,'Julio','Wightman',34000,10,'2011-05-28');
INSERT INTO `employees` VALUES (46,'Julio','Pelton',37000,11,'2010-09-21');
INSERT INTO `employees` VALUES (47,'Cooper','Busby',15000,12,'2011-01-05');
INSERT INTO `employees` VALUES (48,'Kane','Evert',56000,1,'2010-05-02');
INSERT INTO `employees` VALUES (49,'Jaida','Autrey',44000,2,'2011-11-18');
INSERT INTO `employees` VALUES (50,'Owen','Wetherell',77000,3,'2011-07-20');
INSERT INTO `employees` VALUES (51,'Lindsay','Stallcup',23000,4,'2011-11-16');
INSERT INTO `employees` VALUES (52,'Keaton','Brockman',78000,5,'2010-08-15');
INSERT INTO `employees` VALUES (53,'Karlie','Dowe',27000,6,'2010-10-01');
INSERT INTO `employees` VALUES (54,'Braxton','Fresquez',77000,7,'2011-03-29');
INSERT INTO `employees` VALUES (55,'Casey','Westerlund',55000,8,'2012-01-28');
INSERT INTO `employees` VALUES (56,'Caden','Bonham',34000,9,'2011-06-06');
INSERT INTO `employees` VALUES (57,'Milo','Reilley',66000,10,'2011-10-14');
INSERT INTO `employees` VALUES (58,'Gustavo','Koehn',29000,11,'2011-12-29');
INSERT INTO `employees` VALUES (59,'Reid','Faber',36000,12,'2011-05-05');
INSERT INTO `employees` VALUES (60,'Eleanor','Harewood',89000,1,'2010-08-03');
INSERT INTO `employees` VALUES (61,'Makenzie','Marcantel',84000,2,'2010-06-08');
INSERT INTO `employees` VALUES (62,'Anya','Kenny',55000,3,'2012-03-04');
INSERT INTO `employees` VALUES (63,'Nia','Nalley',67000,4,'2012-03-13');
INSERT INTO `employees` VALUES (64,'Solomon','Cueva',26000,5,'2010-08-15');
INSERT INTO `employees` VALUES (65,'Trey','Rowden',17000,6,'2010-11-20');
INSERT INTO `employees` VALUES (66,'Jessie','Gaertner',37000,7,'2010-07-11');
INSERT INTO `employees` VALUES (67,'Tommy','Paisley',83000,8,'2011-12-14');
INSERT INTO `employees` VALUES (68,'Isaiah','Lux',22000,9,'2011-01-16');
INSERT INTO `employees` VALUES (69,'Adriel','Hang',70000,10,'2010-06-12');
INSERT INTO `employees` VALUES (70,'Serenity','Ayoub',40000,11,'2010-06-21');
INSERT INTO `employees` VALUES (71,'Emilia','Mena',79000,12,'2011-09-09');
INSERT INTO `employees` VALUES (72,'Gracelynn','Nicolas',25000,1,'2011-02-21');
INSERT INTO `employees` VALUES (73,'Aliza','Donnell',49000,2,'2011-07-08');
INSERT INTO `employees` VALUES (74,'Devan','Copley',21000,3,'2011-04-26');
INSERT INTO `employees` VALUES (75,'Yandel','Valenti',76000,4,'2010-10-01');
INSERT INTO `employees` VALUES (76,'Noel','Whitted',66000,5,'2010-09-09');
INSERT INTO `employees` VALUES (77,'Giovanna','Goss',59000,6,'2011-09-22');
INSERT INTO `employees` VALUES (78,'Camren','Parmelee',41000,7,'2011-06-13');
INSERT INTO `employees` VALUES (79,'Evelyn','Stambaugh',41000,8,'2010-09-17');
INSERT INTO `employees` VALUES (80,'Kassidy','Merry',23000,9,'2011-05-18');
INSERT INTO `employees` VALUES (81,'Catalina','Buffum',34000,10,'2010-10-07');
INSERT INTO `employees` VALUES (82,'Peter','Holladay',42000,11,'2010-05-10');
INSERT INTO `employees` VALUES (83,'Alessandra','Schumaker',86000,12,'2011-09-08');
INSERT INTO `employees` VALUES (84,'Charlotte','Cassella',63000,1,'2011-03-16');
INSERT INTO `employees` VALUES (85,'Seth','Faber',53000,2,'2011-04-14');
INSERT INTO `employees` VALUES (86,'Nikolai','Robbs',30000,3,'2011-07-13');
INSERT INTO `employees` VALUES (87,'Amy','Pottorff',57000,4,'2010-05-27');
INSERT INTO `employees` VALUES (88,'Veronica','Neace',16000,5,'2010-11-03');
INSERT INTO `employees` VALUES (89,'Marilyn','Virgil',90000,6,'2011-04-18');
INSERT INTO `employees` VALUES (90,'Branson','Colangelo',24000,7,'2011-06-06');
INSERT INTO `employees` VALUES (91,'Alyson','Bucher',93000,8,'2011-02-11');
INSERT INTO `employees` VALUES (92,'Westin','Bechtold',22000,9,'2011-06-02');
INSERT INTO `employees` VALUES (93,'Stacy','Strayer',79000,10,'2011-05-16');
INSERT INTO `employees` VALUES (94,'Camilla','Hollars',42000,11,'2011-01-30');
INSERT INTO `employees` VALUES (95,'Macy','Dolby',22000,12,'2011-09-23');
INSERT INTO `employees` VALUES (96,'Uriah','Quarles',51000,1,'2011-12-12');
INSERT INTO `employees` VALUES (97,'Cortez','Luera',42000,2,'2011-04-17');
INSERT INTO `employees` VALUES (98,'Jadyn','Whitehorn',59000,3,'2011-06-13');
INSERT INTO `employees` VALUES (99,'Kayden','Calles',30000,4,'2010-10-05');
INSERT INTO `employees` VALUES (100,'Chance','Sisler',94000,5,'2011-06-05');
INSERT INTO `employees` VALUES (101,'Chana','Hysell',62000,6,'2011-08-09');
INSERT INTO `employees` VALUES (102,'Eddie','Shine',22000,7,'2012-02-20');
INSERT INTO `employees` VALUES (103,'Ignacio','Venezia',87000,8,'2010-05-03');
INSERT INTO `employees` VALUES (104,'Ray','Legge',31000,9,'2010-11-21');
INSERT INTO `employees` VALUES (105,'Melody','Skelton',72000,10,'2011-03-23');
INSERT INTO `employees` VALUES (106,'William','Kunz',40000,11,'2010-10-09');
INSERT INTO `employees` VALUES (107,'Melanie','Mose',65000,12,'2011-04-08');
INSERT INTO `employees` VALUES (108,'Destinee','Hipp',37000,1,'2010-09-20');
INSERT INTO `employees` VALUES (109,'Valentino','Holcomb',87000,2,'2011-11-28');
INSERT INTO `employees` VALUES (110,'Mckenzie','Dominick',49000,3,'2011-08-31');
INSERT INTO `employees` VALUES (111,'Kara','Ponce',27000,4,'2011-10-13');
INSERT INTO `employees` VALUES (112,'Alexa','Eggers',76000,5,'2010-06-12');
INSERT INTO `employees` VALUES (113,'Yael','Jiles',65000,6,'2011-09-16');
INSERT INTO `employees` VALUES (114,'Londyn','Thoma',71000,7,'2011-03-29');
INSERT INTO `employees` VALUES (115,'Raymond','Shreffler',48000,8,'2011-05-03');
INSERT INTO `employees` VALUES (116,'Chad','Brannon',57000,9,'2010-10-06');
INSERT INTO `employees` VALUES (117,'Emmalyn','Haveman',18000,10,'2010-07-17');
INSERT INTO `employees` VALUES (118,'Ernest','Tignor',40000,11,'2011-06-04');
INSERT INTO `employees` VALUES (119,'Samir','Sontag',36000,12,'2011-04-16');
INSERT INTO `employees` VALUES (120,'Madison','Seidl',34000,1,'2011-07-11');
INSERT INTO `employees` VALUES (121,'Emelia','Wayman',41000,2,'2010-08-15');
INSERT INTO `employees` VALUES (122,'Aarush','Bobbitt',69000,3,'2012-02-02');
INSERT INTO `employees` VALUES (123,'Stella','Hartwig',40000,4,'2010-09-17');
INSERT INTO `employees` VALUES (124,'Keira','Turman',84000,5,'2011-09-06');
INSERT INTO `employees` VALUES (125,'Presley','Jayne',69000,6,'2010-12-09');
INSERT INTO `employees` VALUES (126,'Whitney','Goggans',18000,7,'2012-02-16');
INSERT INTO `employees` VALUES (127,'Reese','Beadles',66000,8,'2011-05-26');
INSERT INTO `employees` VALUES (128,'Livia','Lenahan',38000,9,'2011-12-02');
INSERT INTO `employees` VALUES (129,'Scarlet','Dorr',64000,10,'2011-05-06');
INSERT INTO `employees` VALUES (130,'Killian','Eisenbarth',45000,11,'2011-11-05');
INSERT INTO `employees` VALUES (131,'Menachem','Marchant',64000,12,'2011-02-12');
INSERT INTO `employees` VALUES (132,'Brenden','Parikh',58000,1,'2010-09-20');
INSERT INTO `employees` VALUES (133,'Erika','Bright',78000,2,'2011-10-02');
INSERT INTO `employees` VALUES (134,'Corbin','Casperson',15000,3,'2011-02-21');
INSERT INTO `employees` VALUES (135,'Arabella','Lobo',15000,4,'2011-04-19');
INSERT INTO `employees` VALUES (136,'Sarai','Linger',88000,5,'2010-09-30');
INSERT INTO `employees` VALUES (137,'Cameron','Hileman',40000,6,'2011-08-08');
INSERT INTO `employees` VALUES (138,'Koen','Creed',39000,7,'2010-05-02');
INSERT INTO `employees` VALUES (139,'Genesis','Norred',71000,8,'2011-02-25');
INSERT INTO `employees` VALUES (140,'Priscilla','Thill',34000,9,'2011-04-12');
INSERT INTO `employees` VALUES (141,'Noe','Spicer',86000,10,'2011-09-08');
INSERT INTO `employees` VALUES (142,'Kenzie','Southerland',56000,11,'2010-09-15');
INSERT INTO `employees` VALUES (143,'Paloma','Carley',30000,12,'2011-05-30');
INSERT INTO `employees` VALUES (144,'Isiah','Covington',75000,1,'2011-03-01');
INSERT INTO `employees` VALUES (145,'Callum','Wheat',68000,2,'2011-08-19');
INSERT INTO `employees` VALUES (146,'Marilyn','Messinger',32000,3,'2010-07-08');
INSERT INTO `employees` VALUES (147,'Justice','Piotrowski',22000,4,'2011-08-12');
INSERT INTO `employees` VALUES (148,'Davon','Montemayor',33000,5,'2011-11-11');
INSERT INTO `employees` VALUES (149,'Kiera','Sickles',86000,6,'2011-08-17');
INSERT INTO `employees` VALUES (150,'Nia','Gerber',40000,7,'2010-09-03');
INSERT INTO `employees` VALUES (151,'Esteban','Hoisington',46000,8,'2011-02-26');
INSERT INTO `employees` VALUES (152,'Byron','Truett',66000,9,'2011-12-08');
INSERT INTO `employees` VALUES (153,'Alison','Leeds',21000,10,'2010-07-13');
INSERT INTO `employees` VALUES (154,'Brisa','Candler',15000,11,'2011-07-22');
INSERT INTO `employees` VALUES (155,'Gustavo','Marciano',65000,12,'2011-05-21');
INSERT INTO `employees` VALUES (156,'Rowan','Theiss',66000,1,'2011-02-27');
INSERT INTO `employees` VALUES (157,'Rose','Presson',22000,2,'2011-06-14');
INSERT INTO `employees` VALUES (158,'Elaine','Au',58000,3,'2010-07-22');
INSERT INTO `employees` VALUES (159,'Alex','Kieffer',17000,4,'2010-11-06');
INSERT INTO `employees` VALUES (160,'Jairo','Spillane',18000,5,'2010-07-25');
INSERT INTO `employees` VALUES (161,'Jaslene','Morin',45000,6,'2012-02-01');
INSERT INTO `employees` VALUES (162,'Anika','Schlater',33000,7,'2011-08-26');
INSERT INTO `employees` VALUES (163,'Melvin','Upham',93000,8,'2010-12-21');
INSERT INTO `employees` VALUES (164,'Grace','Ruybal',39000,9,'2011-08-11');
INSERT INTO `employees` VALUES (165,'Riya','Mitchell',87000,10,'2010-07-24');
INSERT INTO `employees` VALUES (166,'Vivian','Lebowitz',46000,11,'2011-12-15');
INSERT INTO `employees` VALUES (167,'Karen','Spector',72000,12,'2012-01-16');
INSERT INTO `employees` VALUES (168,'Travis','Canup',27000,1,'2011-11-06');
INSERT INTO `employees` VALUES (169,'Maya','Eads',36000,2,'2011-12-23');
INSERT INTO `employees` VALUES (170,'Quentin','Switzer',40000,3,'2010-12-19');
INSERT INTO `employees` VALUES (171,'Gianni','Edington',49000,4,'2010-11-24');
INSERT INTO `employees` VALUES (172,'Gregory','Depuy',81000,5,'2011-06-07');
INSERT INTO `employees` VALUES (173,'Darwin','Silk',88000,6,'2011-05-11');
INSERT INTO `employees` VALUES (174,'Esperanza','Barney',78000,7,'2011-12-30');
INSERT INTO `employees` VALUES (175,'Gracie','Bennette',43000,8,'2010-05-14');
INSERT INTO `employees` VALUES (176,'Logan','Lain',68000,9,'2010-10-05');
INSERT INTO `employees` VALUES (177,'Bridger','Howes',39000,10,'2012-03-13');
INSERT INTO `employees` VALUES (178,'Cora','Micco',66000,11,'2011-09-01');
INSERT INTO `employees` VALUES (179,'Perla','Coursey',42000,12,'2010-05-23');
INSERT INTO `employees` VALUES (180,'Macie','Zellers',20000,1,'2011-08-05');
INSERT INTO `employees` VALUES (181,'Joanna','Cilley',66000,2,'2012-01-10');
INSERT INTO `employees` VALUES (182,'Ronin','Vowels',55000,3,'2011-03-27');
INSERT INTO `employees` VALUES (183,'Chance','Hennessey',92000,4,'2011-04-20');
INSERT INTO `employees` VALUES (184,'Talia','Hodgkinson',64000,5,'2010-04-30');
INSERT INTO `employees` VALUES (185,'Lathan','Aubrey',44000,6,'2010-07-23');
INSERT INTO `employees` VALUES (186,'Maximilian','Mckeen',27000,7,'2010-06-16');
INSERT INTO `employees` VALUES (187,'Kylah','Swarts',72000,8,'2011-03-04');
INSERT INTO `employees` VALUES (188,'Sariah','Pollock',31000,9,'2011-09-11');
INSERT INTO `employees` VALUES (189,'Gabriela','Alamo',75000,10,'2010-09-12');
INSERT INTO `employees` VALUES (190,'Ben','Greenawalt',80000,11,'2011-09-15');
INSERT INTO `employees` VALUES (191,'Kylee','Callaham',36000,12,'2011-12-12');
INSERT INTO `employees` VALUES (192,'Zaire','Loh',62000,1,'2010-07-21');
INSERT INTO `employees` VALUES (193,'Chad','Goss',47000,2,'2011-02-16');
INSERT INTO `employees` VALUES (194,'Evelyn','Delucia',51000,3,'2010-09-08');
INSERT INTO `employees` VALUES (195,'Tenley','Marone',94000,4,'2011-11-06');
INSERT INTO `employees` VALUES (196,'Chelsea','Statler',71000,5,'2011-05-18');
INSERT INTO `employees` VALUES (197,'Walker','Bragdon',45000,6,'2010-05-31');
INSERT INTO `employees` VALUES (198,'Aaden','Wiechmann',68000,7,'2011-08-30');
INSERT INTO `employees` VALUES (199,'Angel','Buhr',18000,8,'2010-12-30');
INSERT INTO `employees` VALUES (200,'Lucia','Huskins',89000,9,'2012-01-28');
INSERT INTO `employees` VALUES (201,'Skylar','Amador',33000,10,'2010-05-25');
INSERT INTO `employees` VALUES (202,'Madilynn','Searfoss',94000,11,'2011-07-31');
INSERT INTO `employees` VALUES (203,'Cora','Turman',31000,12,'2011-04-11');
INSERT INTO `employees` VALUES (204,'Alejandro','Polito',78000,1,'2011-06-11');
INSERT INTO `employees` VALUES (205,'Anabel','Marez',90000,2,'2011-05-06');
INSERT INTO `employees` VALUES (206,'Zachery','Dimmick',27000,3,'2011-05-01');
INSERT INTO `employees` VALUES (207,'Mylee','Rhynes',46000,4,'2011-11-22');
INSERT INTO `employees` VALUES (208,'Jane','Shealey',53000,5,'2011-04-25');
INSERT INTO `employees` VALUES (209,'Jayce','Rimer',40000,6,'2010-10-07');
INSERT INTO `employees` VALUES (210,'Melvin','Beazley',71000,7,'2011-12-21');
INSERT INTO `employees` VALUES (211,'Walker','Kamps',78000,8,'2010-09-04');
INSERT INTO `employees` VALUES (212,'Alma','Campa',88000,9,'2010-07-24');
INSERT INTO `employees` VALUES (213,'Kimberly','Calder',63000,10,'2010-12-22');
INSERT INTO `employees` VALUES (214,'Dulce','Fredrick',34000,11,'2011-08-31');
INSERT INTO `employees` VALUES (215,'Emmalee','Scheuerman',70000,12,'2010-07-29');
INSERT INTO `employees` VALUES (216,'Hayden','Everton',92000,1,'2011-03-21');
INSERT INTO `employees` VALUES (217,'Clara','Cromwell',52000,2,'2011-10-22');
INSERT INTO `employees` VALUES (218,'Juliana','Cresswell',70000,3,'2011-06-08');
INSERT INTO `employees` VALUES (219,'Arabella','Alam',81000,4,'2010-09-07');
INSERT INTO `employees` VALUES (220,'Jaden','Landy',91000,5,'2012-03-10');
INSERT INTO `employees` VALUES (221,'Abbie','Murrow',19000,6,'2010-11-29');
INSERT INTO `employees` VALUES (222,'Lyla','Wimberly',68000,7,'2010-05-26');
INSERT INTO `employees` VALUES (223,'Roman','Renn',35000,8,'2010-07-07');
INSERT INTO `employees` VALUES (224,'Gabrielle','Seales',73000,9,'2011-09-23');
INSERT INTO `employees` VALUES (225,'Bruno','Shockey',61000,10,'2010-10-10');
INSERT INTO `employees` VALUES (226,'Quinn','Kravitz',62000,11,'2012-01-18');
INSERT INTO `employees` VALUES (227,'Yamilet','Fleet',32000,12,'2010-11-15');
INSERT INTO `employees` VALUES (228,'Graham','Cliff',44000,1,'2010-11-15');
INSERT INTO `employees` VALUES (229,'Sanaa','Armijo',51000,2,'2011-06-25');
INSERT INTO `employees` VALUES (230,'Allie','Zepeda',19000,3,'2011-07-22');
INSERT INTO `employees` VALUES (231,'Lamar','Munsch',48000,4,'2010-09-19');
INSERT INTO `employees` VALUES (232,'Franco','Mckamey',36000,5,'2011-07-25');
INSERT INTO `employees` VALUES (233,'Maya','Pesce',94000,6,'2010-11-27');
INSERT INTO `employees` VALUES (234,'Madden','Manzano',39000,7,'2011-09-06');
INSERT INTO `employees` VALUES (235,'Ronan','Seevers',17000,8,'2010-10-11');
INSERT INTO `employees` VALUES (236,'Sawyer','Bridwell',76000,9,'2011-12-09');
INSERT INTO `employees` VALUES (237,'Roberto','Bosse',23000,10,'2010-10-12');
INSERT INTO `employees` VALUES (238,'Vicente','Hobson',42000,11,'2010-06-09');
INSERT INTO `employees` VALUES (239,'Giovanny','Delosreyes',28000,12,'2011-01-09');
INSERT INTO `employees` VALUES (240,'Rayden','Langton',59000,1,'2011-03-26');
INSERT INTO `employees` VALUES (241,'Ismael','Astle',40000,2,'2012-02-05');
INSERT INTO `employees` VALUES (242,'Alejandra','Grosso',83000,3,'2011-05-21');
INSERT INTO `employees` VALUES (243,'Renee','Wicker',79000,4,'2011-06-25');
INSERT INTO `employees` VALUES (244,'Ernesto','Minard',19000,5,'2010-11-03');
INSERT INTO `employees` VALUES (245,'Hamza','Moyle',41000,6,'2010-10-27');
INSERT INTO `employees` VALUES (246,'Justin','Murr',66000,7,'2011-09-29');
INSERT INTO `employees` VALUES (247,'Kallie','Mclamb',16000,8,'2011-09-30');
INSERT INTO `employees` VALUES (248,'Kamden','Collazo',90000,9,'2010-05-25');
INSERT INTO `employees` VALUES (249,'Jaylon','Carillo',16000,10,'2010-12-12');
INSERT INTO `employees` VALUES (250,'Aylin','Ashurst',41000,11,'2012-02-12');
INSERT INTO `employees` VALUES (251,'Chace','Sala',59000,12,'2010-05-10');
INSERT INTO `employees` VALUES (252,'Reese','Slover',58000,1,'2011-07-18');
INSERT INTO `employees` VALUES (253,'Leonard','Cipriani',72000,2,'2012-03-14');
INSERT INTO `employees` VALUES (254,'Siena','Thames',24000,3,'2010-07-22');
INSERT INTO `employees` VALUES (255,'Riley','Mcmeans',73000,4,'2011-01-16');
INSERT INTO `employees` VALUES (256,'Niko','Kier',48000,5,'2010-09-30');
INSERT INTO `employees` VALUES (257,'Leighton','Dame',34000,6,'2010-05-17');
INSERT INTO `employees` VALUES (258,'Damari','Boller',15000,7,'2011-08-08');
INSERT INTO `employees` VALUES (259,'Kaia','Strom',63000,8,'2011-04-22');
INSERT INTO `employees` VALUES (260,'Jamir','Magner',87000,9,'2011-07-18');
INSERT INTO `employees` VALUES (261,'Jaiden','Baker',91000,10,'2010-12-05');
INSERT INTO `employees` VALUES (262,'Jayde','Versace',46000,11,'2011-09-17');
INSERT INTO `employees` VALUES (263,'Edwin','Wacker',93000,12,'2010-11-16');
INSERT INTO `employees` VALUES (264,'Isaac','Perin',49000,1,'2011-07-10');
INSERT INTO `employees` VALUES (265,'Precious','Woolard',60000,2,'2011-02-28');
INSERT INTO `employees` VALUES (266,'Jayden','Hinderliter',15000,3,'2011-05-05');
INSERT INTO `employees` VALUES (267,'Giovanni','Nipper',70000,4,'2011-03-26');
INSERT INTO `employees` VALUES (268,'Reed','Babb',44000,5,'2011-08-18');
INSERT INTO `employees` VALUES (269,'Ariel','Clements',37000,6,'2011-06-20');
INSERT INTO `employees` VALUES (270,'Shannon','Householder',22000,7,'2011-12-10');
INSERT INTO `employees` VALUES (271,'Shannon','Burgett',62000,8,'2010-08-19');
INSERT INTO `employees` VALUES (272,'Kimber','Huie',44000,9,'2011-05-02');
INSERT INTO `employees` VALUES (273,'Josie','Marroquin',15000,10,'2011-02-05');
INSERT INTO `employees` VALUES (274,'Autumn','Ledonne',15000,11,'2011-10-19');
INSERT INTO `employees` VALUES (275,'August','Mccary',94000,12,'2011-11-10');
INSERT INTO `employees` VALUES (276,'Clara','Machuca',17000,1,'2011-08-09');
INSERT INTO `employees` VALUES (277,'Abby','Pinkard',46000,2,'2011-04-24');
INSERT INTO `employees` VALUES (278,'Sydnee','Chaffin',24000,3,'2011-05-18');
INSERT INTO `employees` VALUES (279,'Tomas','Reiber',90000,4,'2011-09-08');
INSERT INTO `employees` VALUES (280,'Zackery','Slape',77000,5,'2011-12-12');
INSERT INTO `employees` VALUES (281,'Joaquin','Lemieux',15000,6,'2011-04-06');
INSERT INTO `employees` VALUES (282,'Skye','Peay',28000,7,'2011-09-24');
INSERT INTO `employees` VALUES (283,'Jocelynn','Golightly',81000,8,'2011-04-06');
INSERT INTO `employees` VALUES (284,'Sarah','Bales',48000,9,'2011-03-27');
INSERT INTO `employees` VALUES (285,'Alvin','Beamer',57000,10,'2011-12-22');
INSERT INTO `employees` VALUES (286,'Dulce','Merrell',57000,11,'2011-12-28');
INSERT INTO `employees` VALUES (287,'Caiden','Frederickson',38000,12,'2011-09-01');
INSERT INTO `employees` VALUES (288,'Conrad','Satterlee',56000,1,'2012-01-14');
INSERT INTO `employees` VALUES (289,'Jaylen','Lindell',87000,2,'2011-05-13');
INSERT INTO `employees` VALUES (290,'Kayleigh','Charest',57000,3,'2010-09-29');
INSERT INTO `employees` VALUES (291,'Erik','Kissinger',54000,4,'2011-05-08');
INSERT INTO `employees` VALUES (292,'Brian','Carrasquillo',22000,5,'2011-12-23');
INSERT INTO `employees` VALUES (293,'Nina','Soule',77000,6,'2012-02-21');
INSERT INTO `employees` VALUES (294,'Bennett','Boll',43000,7,'2011-11-29');
INSERT INTO `employees` VALUES (295,'Janiah','Love',43000,8,'2011-04-08');
INSERT INTO `employees` VALUES (296,'Kayden','Corlett',81000,9,'2011-01-27');
INSERT INTO `employees` VALUES (297,'Brooklyn','Voll',77000,10,'2011-01-09');
INSERT INTO `employees` VALUES (298,'Gary','Button',74000,11,'2012-03-09');
INSERT INTO `employees` VALUES (299,'Alisha','Goff',32000,12,'2010-06-21');
INSERT INTO `employees` VALUES (300,'Duncan','Salvador',46000,1,'2012-03-05');
INSERT INTO `employees` VALUES (301,'Braylon','Mackinnon',93000,2,'2011-11-24');
INSERT INTO `employees` VALUES (302,'Cade','Grube',80000,3,'2010-10-15');
INSERT INTO `employees` VALUES (303,'Ariel','Vanderburg',50000,4,'2011-04-12');
INSERT INTO `employees` VALUES (304,'Heather','Holtman',44000,5,'2010-10-06');
INSERT INTO `employees` VALUES (305,'Karen','Madson',85000,6,'2010-05-11');
INSERT INTO `employees` VALUES (306,'Evelyn','Cordova',72000,7,'2010-11-28');
INSERT INTO `employees` VALUES (307,'Zander','Crowson',88000,8,'2012-01-20');
INSERT INTO `employees` VALUES (308,'Tristen','Cuadrado',15000,9,'2011-05-11');
INSERT INTO `employees` VALUES (309,'Pedro','Gochenour',30000,10,'2011-12-21');
INSERT INTO `employees` VALUES (310,'Tori','Solem',30000,11,'2011-07-06');
INSERT INTO `employees` VALUES (311,'Porter','Frost',35000,12,'2011-01-28');
INSERT INTO `employees` VALUES (312,'Macey','Gustin',29000,1,'2011-01-02');
INSERT INTO `employees` VALUES (313,'Cyrus','Schrupp',53000,2,'2011-01-04');
INSERT INTO `employees` VALUES (314,'Cedric','Claypool',40000,3,'2012-01-09');
INSERT INTO `employees` VALUES (315,'Isaias','Marini',93000,4,'2011-12-04');
INSERT INTO `employees` VALUES (316,'Aidan','Mauricio',17000,5,'2010-10-03');
INSERT INTO `employees` VALUES (317,'Darnell','Loney',50000,6,'2011-10-14');
INSERT INTO `employees` VALUES (318,'Emmy','Buitron',72000,7,'2011-05-13');
INSERT INTO `employees` VALUES (319,'Tatum','Campfield',26000,8,'2010-07-24');
INSERT INTO `employees` VALUES (320,'Kadence','Ogara',36000,9,'2010-12-01');
INSERT INTO `employees` VALUES (321,'Jovanni','Burger',30000,10,'2011-10-17');
INSERT INTO `employees` VALUES (322,'Regina','Keegan',39000,11,'2011-08-06');
INSERT INTO `employees` VALUES (323,'Kiersten','Brizendine',55000,12,'2010-08-30');
INSERT INTO `employees` VALUES (324,'London','Renwick',51000,1,'2011-09-15');
INSERT INTO `employees` VALUES (325,'Tara','Tozier',17000,2,'2011-04-12');
INSERT INTO `employees` VALUES (326,'Katrina','Kemmer',68000,3,'2011-08-14');
INSERT INTO `employees` VALUES (327,'Santiago','Phaneuf',92000,4,'2010-07-19');
INSERT INTO `employees` VALUES (328,'Jamir','Stutler',34000,5,'2011-12-27');
INSERT INTO `employees` VALUES (329,'Tania','Gallman',75000,6,'2011-07-29');
INSERT INTO `employees` VALUES (330,'Blaze','Dibiase',44000,7,'2010-09-15');
INSERT INTO `employees` VALUES (331,'Elliott','Curd',44000,8,'2011-12-07');
INSERT INTO `employees` VALUES (332,'Elian','Heeter',30000,9,'2011-03-30');
INSERT INTO `employees` VALUES (333,'Carter','Jang',81000,10,'2011-03-08');
INSERT INTO `employees` VALUES (334,'Alina','Dillon',88000,11,'2010-12-24');
INSERT INTO `employees` VALUES (335,'Viviana','Malick',53000,12,'2011-09-10');
INSERT INTO `employees` VALUES (336,'Karen','Hawk',56000,1,'2011-03-24');
INSERT INTO `employees` VALUES (337,'Thalia','Moreira',24000,2,'2011-07-30');
INSERT INTO `employees` VALUES (338,'Miranda','Jolin',65000,3,'2011-07-08');
INSERT INTO `employees` VALUES (339,'Camden','Batie',54000,4,'2010-05-10');
INSERT INTO `employees` VALUES (340,'Danielle','Liddell',18000,5,'2011-04-27');
INSERT INTO `employees` VALUES (341,'Gregory','Bolivar',74000,6,'2010-10-19');
INSERT INTO `employees` VALUES (342,'Stephen','Ringgold',33000,7,'2011-02-12');
INSERT INTO `employees` VALUES (343,'Jacquelyn','Douse',30000,8,'2012-01-04');
INSERT INTO `employees` VALUES (344,'Conrad','Schott',30000,9,'2011-06-30');
INSERT INTO `employees` VALUES (345,'Ernest','Schirmer',26000,10,'2010-11-29');
INSERT INTO `employees` VALUES (346,'Devyn','Wile',17000,11,'2011-09-15');
INSERT INTO `employees` VALUES (347,'Alejandro','Steinfeldt',91000,12,'2011-12-08');
INSERT INTO `employees` VALUES (348,'Sean','Sipe',47000,1,'2010-06-19');
INSERT INTO `employees` VALUES (349,'Aryan','Boissonneault',65000,2,'2010-11-03');
INSERT INTO `employees` VALUES (350,'Hamza','Felipe',59000,3,'2012-03-08');
INSERT INTO `employees` VALUES (351,'Milagros','Guinn',57000,4,'2011-01-25');
INSERT INTO `employees` VALUES (352,'Norah','Niemeyer',31000,5,'2010-05-28');
INSERT INTO `employees` VALUES (353,'Dawson','Seldon',54000,6,'2011-07-20');
INSERT INTO `employees` VALUES (354,'Aidyn','Liberty',28000,7,'2011-06-02');
INSERT INTO `employees` VALUES (355,'Jaqueline','Marcantel',74000,8,'2011-10-18');
INSERT INTO `employees` VALUES (356,'Stella','Bradley',60000,9,'2010-08-06');
INSERT INTO `employees` VALUES (357,'Mckenzie','Warriner',44000,10,'2010-10-22');
INSERT INTO `employees` VALUES (358,'Trey','Beaudry',59000,11,'2012-01-12');
INSERT INTO `employees` VALUES (359,'Hanna','Pereyra',93000,12,'2010-05-09');
INSERT INTO `employees` VALUES (360,'Gracelynn','Coffield',81000,1,'2012-01-26');
INSERT INTO `employees` VALUES (361,'Alan','Panek',75000,2,'2010-07-04');
INSERT INTO `employees` VALUES (362,'Jon','Mandeville',74000,3,'2011-12-22');
INSERT INTO `employees` VALUES (363,'Yadiel','Pinkham',91000,4,'2011-01-30');
INSERT INTO `employees` VALUES (364,'Emilio','Prime',67000,5,'2011-05-17');
INSERT INTO `employees` VALUES (365,'Marlee','Yap',48000,6,'2010-09-22');
INSERT INTO `employees` VALUES (366,'Rayna','Hancock',61000,7,'2010-07-18');
INSERT INTO `employees` VALUES (367,'Taylor','Hoyt',77000,8,'2010-05-16');
INSERT INTO `employees` VALUES (368,'Amya','Keown',87000,9,'2011-12-27');
INSERT INTO `employees` VALUES (369,'Athena','Lueck',29000,10,'2011-10-01');
INSERT INTO `employees` VALUES (370,'Saniya','Lapp',67000,11,'2010-06-01');
INSERT INTO `employees` VALUES (371,'Ashlyn','Benard',56000,12,'2011-01-28');
INSERT INTO `employees` VALUES (372,'Esteban','Thorpe',16000,1,'2010-04-26');
INSERT INTO `employees` VALUES (373,'Cheyanne','Knighten',73000,2,'2011-03-21');
INSERT INTO `employees` VALUES (374,'Cristina','Burleson',59000,3,'2010-11-09');
INSERT INTO `employees` VALUES (375,'Annabel','Toscano',19000,4,'2011-07-02');
INSERT INTO `employees` VALUES (376,'Ariah','Boyer',68000,5,'2011-10-26');
INSERT INTO `employees` VALUES (377,'Lylah','Dunaway',64000,6,'2010-05-01');
INSERT INTO `employees` VALUES (378,'Keenan','Trotman',47000,7,'2011-03-17');
INSERT INTO `employees` VALUES (379,'Drake','Clouse',84000,8,'2011-12-20');
INSERT INTO `employees` VALUES (380,'Molly','Swoope',20000,9,'2010-11-09');
INSERT INTO `employees` VALUES (381,'Carsen','Larsen',25000,10,'2011-02-28');
INSERT INTO `employees` VALUES (382,'Elliott','Neace',89000,11,'2010-10-22');
INSERT INTO `employees` VALUES (383,'Sadie','Romaine',70000,12,'2010-12-12');
INSERT INTO `employees` VALUES (384,'Milagros','Treece',89000,1,'2010-06-24');
INSERT INTO `employees` VALUES (385,'Emely','Doty',17000,2,'2011-11-30');
INSERT INTO `employees` VALUES (386,'Zayden','Manchester',22000,3,'2010-07-07');
INSERT INTO `employees` VALUES (387,'Rachael','Seibold',94000,4,'2010-10-06');
INSERT INTO `employees` VALUES (388,'Emilee','Beers',43000,5,'2010-06-29');
INSERT INTO `employees` VALUES (389,'Leon','Mclellan',19000,6,'2010-04-25');
INSERT INTO `employees` VALUES (390,'Kaylin','Hagemann',52000,7,'2010-10-20');
INSERT INTO `employees` VALUES (391,'Nathaniel','Mainor',62000,8,'2010-05-01');
INSERT INTO `employees` VALUES (392,'Alejandra','Roddy',60000,9,'2010-07-04');
INSERT INTO `employees` VALUES (393,'Campbell','Dunphy',48000,10,'2010-07-18');
INSERT INTO `employees` VALUES (394,'Uriel','Likens',88000,11,'2011-02-06');
INSERT INTO `employees` VALUES (395,'Janiya','Fite',23000,12,'2011-07-27');
INSERT INTO `employees` VALUES (396,'Atticus','Rubalcava',89000,1,'2010-12-15');
INSERT INTO `employees` VALUES (397,'Landen','Hedrick',40000,2,'2011-05-02');
INSERT INTO `employees` VALUES (398,'Triston','Bilbo',57000,3,'2011-08-18');
INSERT INTO `employees` VALUES (399,'Eva','Jeske',30000,4,'2010-09-18');
INSERT INTO `employees` VALUES (400,'Colin','Filkins',26000,5,'2010-11-08');
INSERT INTO `employees` VALUES (401,'Darwin','Loyd',71000,6,'2011-09-24');
INSERT INTO `employees` VALUES (402,'Theo','Ashley',55000,7,'2011-06-23');
INSERT INTO `employees` VALUES (403,'Devan','Mohler',24000,8,'2010-11-10');
INSERT INTO `employees` VALUES (404,'Finley','Manders',49000,9,'2010-09-20');
INSERT INTO `employees` VALUES (405,'River','Cripe',24000,10,'2012-01-08');
INSERT INTO `employees` VALUES (406,'Marcus','Beagle',46000,11,'2012-01-17');
INSERT INTO `employees` VALUES (407,'Erika','Abrams',22000,12,'2012-03-22');
INSERT INTO `employees` VALUES (408,'Damion','Nino',92000,1,'2012-01-14');
INSERT INTO `employees` VALUES (409,'Dario','Trotter',76000,2,'2011-01-09');
INSERT INTO `employees` VALUES (410,'Campbell','Deshields',67000,3,'2011-12-17');
INSERT INTO `employees` VALUES (411,'Phoenix','Tiffany',23000,4,'2010-08-31');
INSERT INTO `employees` VALUES (412,'Jensen','Roth',29000,5,'2011-11-15');
INSERT INTO `employees` VALUES (413,'Paulina','Gallegos',93000,6,'2010-07-16');
INSERT INTO `employees` VALUES (414,'Genevieve','Mcgregor',52000,7,'2011-04-20');
INSERT INTO `employees` VALUES (415,'Elijah','Barfield',31000,8,'2012-01-14');
INSERT INTO `employees` VALUES (416,'Trevon','Mollett',66000,9,'2012-02-20');
INSERT INTO `employees` VALUES (417,'Brooke','Wessel',53000,10,'2011-07-02');
INSERT INTO `employees` VALUES (418,'Marc','Vath',51000,11,'2010-07-28');
INSERT INTO `employees` VALUES (419,'Shayla','Liles',63000,12,'2010-05-26');
INSERT INTO `employees` VALUES (420,'Sylvia','Cheever',45000,1,'2011-07-02');
INSERT INTO `employees` VALUES (421,'Damion','Sorensen',31000,2,'2011-01-22');
INSERT INTO `employees` VALUES (422,'Greta','Haralson',63000,3,'2010-06-02');
INSERT INTO `employees` VALUES (423,'Jimena','Cantin',69000,4,'2011-09-11');
INSERT INTO `employees` VALUES (424,'Myah','Barboza',77000,5,'2011-04-17');
INSERT INTO `employees` VALUES (425,'Kenya','Iles',83000,6,'2011-03-17');
INSERT INTO `employees` VALUES (426,'Brenda','Partain',86000,7,'2011-01-12');
INSERT INTO `employees` VALUES (427,'Emanuel','Lukasik',66000,8,'2011-12-08');
INSERT INTO `employees` VALUES (428,'Phoenix','Mcmorrow',62000,9,'2012-03-23');
INSERT INTO `employees` VALUES (429,'Theo','Longstreet',58000,10,'2010-06-07');
INSERT INTO `employees` VALUES (430,'Heath','Sumrall',22000,11,'2010-06-02');
INSERT INTO `employees` VALUES (431,'Cade','Balfour',50000,12,'2010-11-07');
INSERT INTO `employees` VALUES (432,'Griffin','Rivard',20000,1,'2011-11-06');
INSERT INTO `employees` VALUES (433,'Kayleigh','Weston',24000,2,'2011-08-01');
INSERT INTO `employees` VALUES (434,'Liam','Bjorklund',93000,3,'2011-05-25');
INSERT INTO `employees` VALUES (435,'Cael','Bowman',87000,4,'2010-05-03');
INSERT INTO `employees` VALUES (436,'Royce','Stiver',43000,5,'2011-05-17');
INSERT INTO `employees` VALUES (437,'Dahlia','Moua',93000,6,'2011-03-18');
INSERT INTO `employees` VALUES (438,'Brendon','Melson',47000,7,'2010-04-30');
INSERT INTO `employees` VALUES (439,'Alijah','Jeffrey',30000,8,'2011-03-07');
INSERT INTO `employees` VALUES (440,'Janiya','Siewert',25000,9,'2011-12-03');
INSERT INTO `employees` VALUES (441,'Angeline','Ruhl',76000,10,'2011-12-23');
INSERT INTO `employees` VALUES (442,'Ember','Sachs',15000,11,'2011-07-14');
INSERT INTO `employees` VALUES (443,'Imani','Manners',15000,12,'2011-07-25');
INSERT INTO `employees` VALUES (444,'Stephanie','Leahy',64000,1,'2012-03-14');
INSERT INTO `employees` VALUES (445,'Kasey','Habib',23000,2,'2010-08-08');
INSERT INTO `employees` VALUES (446,'Alejandro','Giblin',68000,3,'2011-05-16');
INSERT INTO `employees` VALUES (447,'Izaiah','Arbuckle',42000,4,'2012-02-10');
INSERT INTO `employees` VALUES (448,'Ada','Kron',24000,5,'2011-10-15');
INSERT INTO `employees` VALUES (449,'Aryan','Silva',19000,6,'2011-08-18');
INSERT INTO `employees` VALUES (450,'Clarence','Salmon',23000,7,'2012-03-12');
INSERT INTO `employees` VALUES (451,'Frances','Windsor',49000,8,'2011-01-21');
INSERT INTO `employees` VALUES (452,'Jaycee','Stayton',23000,9,'2010-06-17');
INSERT INTO `employees` VALUES (453,'Kai','Vogler',66000,10,'2010-05-21');
INSERT INTO `employees` VALUES (454,'Leyla','Brinkmann',16000,11,'2010-07-10');
INSERT INTO `employees` VALUES (455,'Tyson','Hilburn',94000,12,'2011-06-10');
INSERT INTO `employees` VALUES (456,'Cadence','Ogren',44000,1,'2011-04-12');
INSERT INTO `employees` VALUES (457,'Camille','Boehme',57000,2,'2011-03-30');
INSERT INTO `employees` VALUES (458,'Uriel','Merlo',18000,3,'2011-02-22');
INSERT INTO `employees` VALUES (459,'Zackery','Sicard',30000,4,'2011-04-11');
INSERT INTO `employees` VALUES (460,'Mae','Krieger',38000,5,'2011-05-12');
INSERT INTO `employees` VALUES (461,'Paul','Brenton',27000,6,'2011-04-02');
INSERT INTO `employees` VALUES (462,'Darien','Vanhook',90000,7,'2011-10-24');
INSERT INTO `employees` VALUES (463,'Kiera','Vanscoy',84000,8,'2010-12-23');
INSERT INTO `employees` VALUES (464,'Michelle','Johanson',63000,9,'2010-08-09');
INSERT INTO `employees` VALUES (465,'Moshe','Elgin',81000,10,'2010-12-23');
INSERT INTO `employees` VALUES (466,'Cade','Dryer',49000,11,'2011-01-01');
INSERT INTO `employees` VALUES (467,'Lylah','Dowe',26000,12,'2011-08-31');
INSERT INTO `employees` VALUES (468,'Lucia','Ronan',78000,1,'2011-11-16');
INSERT INTO `employees` VALUES (469,'Wyatt','Poling',64000,2,'2011-01-06');
INSERT INTO `employees` VALUES (470,'Jordan','Sobel',37000,3,'2010-08-13');
INSERT INTO `employees` VALUES (471,'Shawn','Ginter',50000,4,'2011-07-27');
INSERT INTO `employees` VALUES (472,'Leanna','Beadles',34000,5,'2010-10-06');
INSERT INTO `employees` VALUES (473,'Paxton','Coronado',70000,6,'2011-11-01');
INSERT INTO `employees` VALUES (474,'Elsa','Bushey',29000,7,'2010-11-25');
INSERT INTO `employees` VALUES (475,'Derick','Hamill',90000,8,'2010-09-25');
INSERT INTO `employees` VALUES (476,'Camdyn','Setzer',32000,9,'2012-02-14');
INSERT INTO `employees` VALUES (477,'Angeline','Haubrich',44000,10,'2011-12-17');
INSERT INTO `employees` VALUES (478,'Kolton','Clough',90000,11,'2010-08-12');
INSERT INTO `employees` VALUES (479,'Chace','Weintraub',36000,12,'2011-09-05');
INSERT INTO `employees` VALUES (480,'Tatum','Schacher',64000,1,'2011-05-11');
INSERT INTO `employees` VALUES (481,'Moises','Swayne',19000,2,'2010-07-31');
INSERT INTO `employees` VALUES (482,'Slade','Theodore',77000,3,'2010-07-04');
INSERT INTO `employees` VALUES (483,'Howard','Claus',69000,4,'2011-07-04');
INSERT INTO `employees` VALUES (484,'Alexia','Tiernan',49000,5,'2010-08-27');
INSERT INTO `employees` VALUES (485,'Gunnar','Domingue',79000,6,'2010-09-19');
INSERT INTO `employees` VALUES (486,'Sidney','Posner',34000,7,'2010-09-18');
INSERT INTO `employees` VALUES (487,'Jaden','Silvey',71000,8,'2011-08-14');
INSERT INTO `employees` VALUES (488,'Estrella','Dickerson',70000,9,'2011-08-24');
INSERT INTO `employees` VALUES (489,'Chana','Fielder',62000,10,'2011-07-19');
INSERT INTO `employees` VALUES (490,'Jimmy','Rone',18000,11,'2010-08-31');
INSERT INTO `employees` VALUES (491,'Paisley','Neidig',87000,12,'2010-10-11');
INSERT INTO `employees` VALUES (492,'Daniella','Schick',48000,1,'2010-07-26');
INSERT INTO `employees` VALUES (493,'Kiera','Easterday',57000,2,'2012-02-29');
INSERT INTO `employees` VALUES (494,'Caitlyn','Dart',55000,3,'2011-06-11');
INSERT INTO `employees` VALUES (495,'Ivana','Liller',86000,4,'2010-11-10');
INSERT INTO `employees` VALUES (496,'Ibrahim','Fullwood',74000,5,'2010-11-29');
INSERT INTO `employees` VALUES (497,'Eve','Herzberg',80000,6,'2012-02-17');
INSERT INTO `employees` VALUES (498,'Lindsey','Corpuz',24000,7,'2012-03-18');
INSERT INTO `employees` VALUES (499,'Ellie','Gunnels',39000,8,'2010-07-23');
INSERT INTO `employees` VALUES (500,'Ashlee','Strack',64000,9,'2010-12-01');
