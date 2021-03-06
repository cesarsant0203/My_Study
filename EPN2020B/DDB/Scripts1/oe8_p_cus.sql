rem
rem Header: oe8_p_cus.sql 09-jan-01
rem
rem Copyright (c) 2001 Oracle Corporation.  All rights reserved.
rem
rem Owner  : ahunold
rem
rem NAME
rem   oe8_p_cus.sql - populate OE Common Schema
rem
rem DESCRIPTON
rem   Table customers
rem
rem MODIFIED   (MM/DD/YY)
rem   ahunold   10/03/01 - 8i

INSERT INTO customers VALUES 
    (101,'Constantin','Welles',cust_address_typ
    ('514 W Superior St','46901','Kokomo','IN','US'),
    '+1 317 123 4104','us','AMERICA','100','Constantin.Welles@ANHINGA.COM',
    149);
INSERT INTO customers VALUES 
    (102,'Harrison','Pacino',cust_address_typ
    ('2515 Bloyd Ave','46218','Indianapolis','IN','US'),
    '+1 317 123 4111','us','AMERICA','100','Harrison.Pacino@ANI.COM',
    149);
INSERT INTO customers VALUES 
    (103,'Manisha','Taylor',cust_address_typ
    ('8768 N State Rd 37','47404','Bloomington','IN','US'),
    '+1 812 123 4115','us','AMERICA','100','Manisha.Taylor@AUKLET.COM',
    149);
INSERT INTO customers VALUES 
    (104,'Harrison','Sutherland',cust_address_typ
    ('6445 Bay Harbor Ln','46254','Indianapolis','IN','US'),
    '+1 317 123 4126','us','AMERICA','100','Harrison.Sutherland@GODWIT.COM', 
    149);
INSERT INTO customers VALUES 
    (105,'Matthias','MacGraw',cust_address_typ
    ('4019 W 3Rd St','47404','Bloomington','IN','US'),
    '+1 812 123 4129','us','AMERICA','100','Matthias.MacGraw@GOLDENEYE.COM',
    NULL);
INSERT INTO customers VALUES 
    (106,'Matthias','Hannah',cust_address_typ
    ('1608 Portage Ave','46616','South Bend','IN','US'),
    '+1 219 123 4136','us','AMERICA','100','Matthias.Hannah@GREBE.COM',
    149);
INSERT INTO customers VALUES 
    (107,'Matthias','Cruise',cust_address_typ
    ('23943 Us Highway 33','46517','Elkhart','IN','US'),
    '+1 219 123 4138','us','AMERICA','100','Matthias.Cruise@GROSBEAK.COM',
    NULL);
INSERT INTO customers VALUES 
    (108,'Meenakshi','Mason',cust_address_typ
    ('136 E Market St # 800','46204','Indianapolis','IN','US'),
    '+1 317 123 4141','us','AMERICA','100','Meenakshi.Mason@JACANA.COM',
    149);
INSERT INTO customers VALUES 
    (109,'Christian','Cage',cust_address_typ
    ('1905 College St','46628','South Bend','IN','US'),
    '+1 219 123 4142','us','AMERICA','100','Christian.Cage@KINGLET.COM',
    149);
INSERT INTO customers VALUES 
    (110,'Charlie','Sutherland',cust_address_typ
    ('3512 Rockville Rd # 137C','46222','Indianapolis','IN','US'),
    '+1 317 123 4146','us','AMERICA','200','Charlie.Sutherland@LIMPKIN.COM',
    149);
INSERT INTO customers VALUES 
    (111,'Charlie','Pacino',cust_address_typ
    ('1303 E University St','47401','Bloomington','IN','US'),
    '+1 812 123 4150','us','AMERICA','200','Charlie.Pacino@LONGSPUR.COM',
    149);
INSERT INTO customers VALUES 
    (112,'Guillaume','Jackson',cust_address_typ
    ('115 N Weinbach Ave','47711','Evansville','IN','US'),
    '+1 812 123 4151','us','AMERICA','200','Guillaume.Jackson@MOORHEN.COM',
    145);
INSERT INTO customers VALUES 
    (113,'Daniel','Costner',cust_address_typ
    ('2067 Rollett Ln','47712','Evansville','IN','US'),
    '+1 812 123 4153','us','AMERICA','200','Daniel.Costner@PARULA.COM',
    149);
INSERT INTO customers VALUES 
    (114,'Dianne','Derek',cust_address_typ
    ('1105 E Allendale Dr','47401','Bloomington','IN','US'),
    '+1 812 123 4157','us','AMERICA','200','Dianne.Derek@SAW-WHET.COM',
    149);
INSERT INTO customers VALUES 
    (115,'Geraldine','Schneider',cust_address_typ
    ('18305 Van Dyke St','48234','Detroit','MI','US'),
    '+1 313 123 4159','us','AMERICA','200','Geraldine.Schneider@SCAUP.COM',
    149);
INSERT INTO customers VALUES 
    (116,'Geraldine','Martin',cust_address_typ
    ('Lucas Dr Bldg 348','48242','Detroit','MI','US'),
    '+1 313 123 4160','us','AMERICA','200','Geraldine.Martin@SCOTER.COM',
    149);
INSERT INTO customers VALUES 
    (117,'Guillaume','Edwards',cust_address_typ
    ('1801 Monroe Ave Nw','49505','Grand Rapids','MI','US'),
    '+1 616 123 4162','us','AMERICA','200','Guillaume.Edwards@SHRIKE.COM',
    145);
INSERT INTO customers VALUES 
    (118,'Maurice','Mahoney',cust_address_typ
    ('4925 Kendrick St Se','49512','Grand Rapids','MI','US'),
    '+1 616 123 4181','us','AMERICA','200','Maurice.Mahoney@SNIPE.COM',
    149);
INSERT INTO customers VALUES 
    (119,'Maurice','Hasan',cust_address_typ
    ('3310 Dixie Ct','48601','Saginaw','MI','US'),
    '+1 517 123 4191','us','AMERICA','200','Maurice.Hasan@STILT.COM',
    149);
INSERT INTO customers VALUES 
    (120,'Diane','Higgins',cust_address_typ
    ('113 Washington Sq N','48933','Lansing','MI','US'),
    '+1 517 123 4199','us','AMERICA','200','Diane.Higgins@TANAGER.COM',
    149);
INSERT INTO customers VALUES 
    (121,'Dianne','Sen',cust_address_typ
    ('2500 S Pennsylvania Ave','48910','Lansing','MI','US'),
    '+1 517 123 4201','us','AMERICA','200','Dianne.Sen@TATTLER.COM',
    149);
INSERT INTO customers VALUES 
    (122,'Maurice','Daltrey',cust_address_typ
    ('3213 S Cedar St','48910','Lansing','MI','US'),
    '+1 517 123 4206','us','AMERICA','200','Maurice.Daltrey@TEAL.COM',
    NULL);
INSERT INTO customers VALUES 
    (123,'Elizabeth','Brown',cust_address_typ
    ('8110 Jackson Rd','48103','Ann Arbor','MI','US'),
    '+1 313 123 4219','us','AMERICA','200','Elizabeth.Brown@THRASHER.COM',
    149);
INSERT INTO customers VALUES 
    (124,'Diane','Mason',cust_address_typ
    ('6654 W Lafayette St','48226','Detroit','MI','US'),
    '+1 313 123 4222','us','AMERICA','200','Diane.Mason@TROGON.COM',
    149);
INSERT INTO customers VALUES 
    (125,'Dianne','Andrews',cust_address_typ
    ('27 Benton Rd','48602','Saginaw','MI','US'),
    '+1 517 123 4225','us','AMERICA','200','Dianne.Andrews@TURNSTONE.COM',
    149);
INSERT INTO customers VALUES 
    (126,'Charles','Field',cust_address_typ
    ('8201 Livernois Ave','48204','Detroit','MI','US'),
    '+1 313 123 4226','us','AMERICA','300','Charles.Field@BECARD.COM',
    NULL);
INSERT INTO customers VALUES 
    (127,'Charles','Broderick',cust_address_typ
    ('101 N Falahee Rd','49203','Jackson','MI','US'),
    '+1 517 123 4228','us','AMERICA','300','Charles.Broderick@BITTERN.COM',
    NULL);
INSERT INTO customers VALUES 
    (128,'Isabella','Reed',cust_address_typ
    ('3100 E Eisenhower Pky # 100','48108','Ann Arbor','MI','US'),
    '+1 313 123 4230','us','AMERICA','300','Isabella.Reed@BRANT.COM',
    NULL);
INSERT INTO customers VALUES 
    (129,'Louis','Jackson',cust_address_typ
    ('952 Vassar Dr','49001','Kalamazoo','MI','US'),
    '+1 616 123 4234','us','AMERICA','400','Louis.Jackson@CARACARA.COM',
    149);
INSERT INTO customers VALUES 
    (130,'Louis','Edwards',cust_address_typ
    ('150 W Jefferson Ave # 2500','48226','Detroit','MI','US'),
    '+1 313 123 4242','us','AMERICA','400','Louis.Edwards@CHACHALACA.COM',
    NULL);
INSERT INTO customers VALUES 
    (131,'Doris','Dutt',cust_address_typ
    ('40 Pearl St Nw # 1020','49503','Grand Rapids','MI','US'),
    '+1 616 123 4245','us','AMERICA','400','Doris.Dutt@CHUKAR.COM',
    NULL);
INSERT INTO customers VALUES 
    (132,'Doris','Spacek',cust_address_typ
    ('1135 Catherine St','48109','Ann Arbor','MI','US'),
    '+1 313 123 4248','us','AMERICA','400','Doris.Spacek@FLICKER.COM',
    NULL);
INSERT INTO customers VALUES 
    (133,'Kristin','Malden',cust_address_typ
    ('301 E Genesee Ave','48607','Saginaw','MI','US'),
    '+1 517 123 4253','us','AMERICA','400','Kristin.Malden@GODWIT.COM',
    149);
INSERT INTO customers VALUES 
    (134,'Sissy','Puri',cust_address_typ
    ('9936 Dexter Ave','48206','Detroit','MI','US'),
    '+1 313 123 4255','us','AMERICA','400','Sissy.Puri@GREBE.COM',
    NULL);
INSERT INTO customers VALUES 
    (135,'Doris','Bel Geddes',cust_address_typ
    ('1660 University Ter','48104','Ann Arbor','MI','US'),
    '+1 313 123 4263','us','AMERICA','400','Doris.BelGeddes@GROSBEAK.COM',
    NULL);
INSERT INTO customers VALUES 
    (136,'Sissy','Warden',cust_address_typ
    ('15713 N East St','48906','Lansing','MI','US'),
    '+1 517 123 4265','us','AMERICA','400','Sissy.Warden@JACANA.COM',
    149);
INSERT INTO customers VALUES 
    (137,'Elia','Brando',cust_address_typ
    ('555 John F Kennedy Rd','52002','Dubuque','IA','US'),
    '+1 319 123 4271','us','AMERICA','500','Elia.Brando@JUNCO.COM',
    149);
INSERT INTO customers VALUES 
    (138,'Mani','Fonda',cust_address_typ
    ('10315 Hickman Rd','50322','Des Moines','IA','US'),
    '+1 515 123 4273','us','AMERICA','500','Mani.Fonda@KINGLET.COM',
    149);
INSERT INTO customers VALUES 
    (139,'Placido','Kubrick',cust_address_typ
    ('2115 N Towne Ln Ne','52402','Cedar Rapids','IA','US'),
    '+1 319 123 4278','us','AMERICA','500','Placido.Kubrick@SCOTER.COM',
    NULL);
INSERT INTO customers VALUES 
    (140,'Claudia','Kurosawa',cust_address_typ
    ('1928 Sherwood Dr','51503','Council Bluffs','IA','US'),
    '+1 712 123 4280','us','AMERICA','500','Claudia.Kurosawa@CHUKAR.COM',
    NULL);
INSERT INTO customers VALUES 
    (141,'Maximilian','Henner',cust_address_typ
    ('2102 E Kimberly Rd','52807','Davenport','IA','US'),
    '+1 319 123 4282','us','AMERICA','500','Maximilian.Henner@DUNLIN.COM',
    145);
INSERT INTO customers VALUES 
    (142,'Sachin','Spielberg',cust_address_typ
    ('1691 Asbury Rd','52001','Dubuque','IA','US'),
    '+1 319 123 4288','us','AMERICA','500','Sachin.Spielberg@GADWALL.COM',
    149);
INSERT INTO customers VALUES 
    (143,'Sachin','Neeson',cust_address_typ
    ('5112 Sw 9Th St','50315','Des Moines','IA','US'),
    '+1 515 123 4290','us','AMERICA','500','Sachin.Neeson@GALLINULE.COM',
    149);
INSERT INTO customers VALUES 
    (144,'Sivaji','Landis',cust_address_typ
    ('221 3Rd Ave Se # 300','52401','Cedar Rapids','IA','US'),
    '+1 319 123 4301','us','AMERICA','500','Sivaji.Landis@GOLDENEYE.COM',
    149);
INSERT INTO customers VALUES 
    (145,'Mammutti','Pacino',cust_address_typ
    ('2120 Heights Dr','54701','Eau Claire','WI','US'),
    '+1 745 123 4306','us','AMERICA','500','Mammutti.Pacino@GREBE.COM',
    145);
INSERT INTO customers VALUES 
    (146,'Elia','Fawcett',cust_address_typ
    ('8989 N Port Washington Rd','53217','Milwaukee','WI','US'),
    '+1 414 123 4307','us','AMERICA','500','Elia.Fawcett@JACANA.COM',
    NULL);
INSERT INTO customers VALUES 
    (147,'Ishwarya','Roberts',cust_address_typ
    ('6555 W Good Hope Rd','53223','Milwaukee','WI','US'),
    '+1 414 123 4308','us','AMERICA','600','Ishwarya.Roberts@LAPWING.COM',
    NULL);
INSERT INTO customers VALUES 
    (148,'Gustav','Steenburgen',cust_address_typ
    ('1314 N Stoughton Rd','53714','Madison','WI','US'),
    '+1 608 123 4309','us','AMERICA','600','Gustav.Steenburgen@PINTAIL.COM',
    149);
INSERT INTO customers VALUES 
    (149,'Markus','Rampling',cust_address_typ
    ('4715 Sprecher Rd','53704','Madison','WI','US'),
    '+1 608 123 4318','us','AMERICA','600','Markus.Rampling@PUFFIN.COM',
    145);
INSERT INTO customers VALUES 
    (150,'Goldie','Slater',cust_address_typ
    ('6161 N 64Th St','53218','Milwaukee','WI','US'),
    '+1 414 123 4323','us','AMERICA','700','Goldie.Slater@PYRRHULOXIA.COM',
    NULL);
INSERT INTO customers VALUES 
    (151,'Divine','Aykroyd',cust_address_typ
    ('11016 W Lincoln Ave','53227','Milwaukee','WI','US'),
    '+1 414 123 4324','us','AMERICA','700','Divine.Aykroyd@REDSTART.COM',
    149);
INSERT INTO customers VALUES 
    (152,'Dieter','Matthau',cust_address_typ
    ('8600 W National Ave','53227','Milwaukee','WI','US'),
    '+1 414 123 4328','us','AMERICA','700','Dieter.Matthau@VERDIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (153,'Divine','Sheen',cust_address_typ
    ('615 N Sherman Ave','53704','Madison','WI','US'),
    ('+1 608 123 4332'),'us','AMERICA','700','Divine.Sheen@COWBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (154,'Frederic','Grodin',cust_address_typ
    ('512 E Grand Ave','53511','Beloit','WI','US'),
    ('+1 608 123 4344'),'us','AMERICA','700','Frederic.Grodin@CREEPER.COM',
    149);
INSERT INTO customers VALUES 
    (155,'Frederico','Romero',cust_address_typ
    ('600 N Broadway Fl 1','53202','Milwaukee','WI','US'),
    ('+1 414 123 4347'),'us','AMERICA','700','Frederico.Romero@CURLEW.COM',
    145);
INSERT INTO customers VALUES 
    (156,'Goldie','Montand',cust_address_typ
    ('5235 N Ironwood Ln','53217','Milwaukee','WI','US'),
    ('+1 414 123 4348'),'us','AMERICA','700','Goldie.Montand@DIPPER.COM',
    149);
INSERT INTO customers VALUES 
    (157,'Sidney','Capshaw',cust_address_typ
    ('322 E Michigan St','53202','Milwaukee','WI','US'),
    ('+1 414 123 4350'),'us','AMERICA','700','Sidney.Capshaw@DUNLIN.COM',
    149);
INSERT INTO customers VALUES 
    (158,'Frederico','Lyon',cust_address_typ
    ('1400 Bellinger St Fl 4','54703','Eau Claire','WI','US'),
    ('+1 745 123 4367'),'us','AMERICA','700','Frederico.Lyon@FLICKER.COM',
    149);
INSERT INTO customers VALUES 
    (159,'Eddie','Boyer',cust_address_typ
    ('411 E Wisconsin Ave # 2550','53202','Milwaukee','WI','US'),
    ('+1 414 123 4369'),'us','AMERICA','700','Eddie.Boyer@GALLINULE.COM',
    NULL);
INSERT INTO customers VALUES 
    (160,'Eddie','Stern',cust_address_typ
    ('808 3Rd St # 100','54403','Wausau','WI','US'),
    ('+1 715 123 4372'),'us','AMERICA','700','Eddie.Stern@GODWIT.COM',
    149);
INSERT INTO customers VALUES 
    (161,'Ernest','Weaver',cust_address_typ
    ('300 Crooks St','54301','Green Bay','WI','US'),
    ('+1 414 123 4373'),'us','AMERICA','900','Ernest.Weaver@GROSBEAK.COM',
    149);
INSERT INTO customers VALUES 
    (162,'Ernest','George',cust_address_typ
    ('122 E Dayton St','53703','Madison','WI','US'),
    ('+1 608 123 4374'),'us','AMERICA','900','Ernest.George@LAPWING.COM',
    149);
INSERT INTO customers VALUES 
    (163,'Ernest','Chandar',cust_address_typ
    ('633 S Hawley Rd','53214','Milwaukee','WI','US'),
    ('+1 414 123 4376'),'us','AMERICA','900','Ernest.Chandar@LIMPKIN.COM',
    149);
INSERT INTO customers VALUES 
    (164,'Charlotte','Kazan',cust_address_typ
    ('2122 Campbell Rd','54601','La Crosse','WI','US'),
    ('+1 608 123 4378'),'us','AMERICA','1200','Charlotte.Kazan@MERGANSER.COM',
    149);
INSERT INTO customers VALUES 
    (165,'Charlotte','Fonda',cust_address_typ
    ('3324 N Oakland Ave','53211','Milwaukee','WI','US'),
    ('+1 414 123 4381'),'us','AMERICA','1200','Charlotte.Fonda@MOORHEN.COM',
    149);
INSERT INTO customers VALUES 
    (166,'Dheeraj','Alexander',cust_address_typ
    ('666 22Nd Ave Ne','55418','Minneapolis','MN','US'),
    ('+1 612 123 4397'),'us','AMERICA','1200','Dheeraj.Alexander@NUTHATCH.COM',
    149);
INSERT INTO customers VALUES 
    (167,'Gerard','Hershey',cust_address_typ
    ('1501 Lowry Ave N','55411','Minneapolis','MN','US'),
    ('+1 612 123 4399'),'us','AMERICA','1200','Gerard.Hershey@PARULA.COM',
    NULL);
INSERT INTO customers VALUES 
    (168,'Hema','Voight',cust_address_typ
    ('113 N 1St St','55401','Minneapolis','MN','US'),
    ('+1 612 123 4408'),'us','AMERICA','1200','Hema.Voight@PHALAROPE.COM',
    145);
INSERT INTO customers VALUES 
    (169,'Dheeraj','Davis',cust_address_typ
    ('4200 Yosemite Ave S','55416','Minneapolis','MN','US'),
    ('+1 612 123 4417'),'us','AMERICA','1200','Dheeraj.Davis@PIPIT.COM',
    NULL);
INSERT INTO customers VALUES 
    (170,'Harry Dean','Fonda',cust_address_typ
    ('2800 Chicago Ave # 100','55407','Minneapolis','MN','US'),
    ('+1 612 123 4419'),'us','AMERICA','1200','HarryDean.Fonda@PLOVER.COM',
    149);
INSERT INTO customers VALUES 
    (171,'Hema','Powell',cust_address_typ
    ('200 1St St Sw','55905','Rochester','MN','US'),
    ('+1 507 123 4421'),'us','AMERICA','1200','Hema.Powell@SANDERLING.COM',
    145);
INSERT INTO customers VALUES 
    (172,'Harry Mean','Peckinpah',cust_address_typ
    ('314 W Superior St # 1015','55802','Duluth','MN','US'),
    ('+1 218 123 4429'),'us','AMERICA','1200','HarryMean.Peckinpah@VERDIN.COM',
    149);
INSERT INTO customers VALUES 
    (173,'Kathleen','Walken',cust_address_typ
    ('1409 Willow St # 600','55403','Minneapolis','MN','US'),
    ('+1 612 123 4434'),'us','AMERICA','1200','Kathleen.Walken@VIREO.COM',
    149);
INSERT INTO customers VALUES 
    (174,'Blake','Seignier',cust_address_typ
    ('2720 Brewerton Rd','13211','Syracuse','NY','US'),
    ('+1 315 123 4442'),'us','AMERICA','1200','Blake.Seignier@GALLINULE.COM',
    149);
INSERT INTO customers VALUES 
    (175,'Claude','Powell',cust_address_typ
    ('2134 W Genesee St','13219','Syracuse','NY','US'),
    ('+1 315 123 4447'),'us','AMERICA','1200','Claude.Powell@GODWIT.COM',
    NULL);
INSERT INTO customers VALUES 
    (176,'Faye','Glenn',cust_address_typ
    ('1522 Main St','14305','Niagara Falls','NY','US'),
    ('+1 716 123 4457'),'us','AMERICA','1200','Faye.Glenn@GREBE.COM',
    149);
INSERT INTO customers VALUES 
    (177,'Gerhard','Seignier',cust_address_typ
    ('49 N Pine Ave','12203','Albany','NY','US'),
    ('+1 518 123 4459'),'us','AMERICA','1200','Gerhard.Seignier@JACANA.COM',
    149);
INSERT INTO customers VALUES 
    (178,'Grace','Belushi',cust_address_typ
    ('726 Union St','12534','Hudson','NY','US'),
    ('+1 518 123 4464'),'us','AMERICA','1200',
    'Grace.Belushi@KILLDEER.COM',
    NULL);
INSERT INTO customers VALUES 
    (179,'Harry dean','Forrest',cust_address_typ
    ('137 Lark St','12210','Albany','NY','US'),
    ('+1 518 123 4474'),'us','AMERICA','1200',
    'Harrydean.Forrest@KISKADEE.COM',
    149);
INSERT INTO customers VALUES 
    (180,'Harry dean','Cage',cust_address_typ
    ('33 Fulton St','12601','Poughkeepsie','NY','US'),
    ('+1 914 123 4494'),'us','AMERICA','1200',
    'Harrydean.Cage@LAPWING.COM',
    149);
INSERT INTO customers VALUES 
    (181,'Lauren','Hershey',cust_address_typ
    ('2360 Maxon Rd','12308','Schenectady','NY','US'),
    ('+1 518 123 4496'),'us','AMERICA','1200',
    'Lauren.Hershey@LIMPKIN.COM',
    149);
INSERT INTO customers VALUES 
    (182,'Lauren','Dench',cust_address_typ
    ('85 High St','14203','Buffalo','NY','US'),
    ('+1 716 123 4575'),'us','AMERICA','1200',
    'Lauren.Dench@LONGSPUR.COM',
    149);
INSERT INTO customers VALUES 
    (183,'Lauren','Altman',cust_address_typ
    ('1 Palisade Ave Fl 2','10701','Yonkers','NY','US'),
    ('+1 914 123 4578'),'us','AMERICA','1200','Lauren.Altman@MERGANSER.COM',
    145);
INSERT INTO customers VALUES 
    (184,'Mary Beth','Roberts',cust_address_typ
    ('500 S Salina St # 500','13202','Syracuse','NY','US'),
    ('+1 315 123 4597'),'us','AMERICA','1200','MaryBeth.Roberts@NUTHATCH.COM',
    NULL);
INSERT INTO customers VALUES 
    (185,'Matthew','Wright',cust_address_typ
    ('33 Pine St','14094','Lockport','NY','US'),
    ('+1 716 123 4599'),'us','AMERICA','1200','Matthew.Wright@OVENBIRD.COM',
    NULL);
INSERT INTO customers VALUES 
    (186,'Meena','Alexander',cust_address_typ
    ('Po Box 2152','14240','Buffalo','NY','US'),
    ('+1 716 123 4605'),'us','AMERICA','1200','Meena.Alexander@PARULA.COM',
    149);
INSERT INTO customers VALUES 
    (187,'Grace','Dvrrie',cust_address_typ
    ('2979 Hamburg St','12303','Schenectady','NY','US'),
    ('+1 518 123 4617'),'us','AMERICA','1200','Grace.Dvrrie@PHOEBE.COM',
    NULL);
INSERT INTO customers VALUES 
    (188,'Charlotte','Buckley',cust_address_typ
    ('1790 Grand Blvd','12309','Schenectady','NY','US'),
    ('+1 518 123 4618'),'us','AMERICA','1200','Charlotte.Buckley@PINTAIL.COM',
    NULL);
INSERT INTO customers VALUES 
    (189,'Gena','Harris',cust_address_typ
    ('7 Ingelside Ln','10605','White Plains','NY','US'),
    ('+1 914 123 4619'),'us','AMERICA','1200','Gena.Harris@PIPIT.COM',
    149);
INSERT INTO customers VALUES 
    (190,'Gena','Curtis',cust_address_typ
    ('18 Glenridge Rd','12302','Schenectady','NY','US'),
    ('+1 518 123 4624'),'us','AMERICA','1200','Gena.Curtis@PLOVER.COM',
    149);
INSERT INTO customers VALUES 
    (191,'Maureen','Sanders',cust_address_typ
    ('6432 Rising Sun Ave','19111','Philadelphia','PA','US'),
    ('+1 215 123 4644'),'us','AMERICA','1200','Maureen.Sanders@PUFFIN.COM',
    149);
INSERT INTO customers VALUES 
    (192,'Sean','Stockwell',cust_address_typ
    ('Rr 10','19606','Reading','PA','US'),
    ('+1 610 123 4657'),'us','AMERICA','1200','Sean.Stockwell@PYRRHULOXIA.COM',
    149);
INSERT INTO customers VALUES 
    (193,'Harry dean','Kinski',cust_address_typ
    ('2455 Rose Garden Rd','15220','Pittsburgh','PA','US'),
    ('+1 412 123 4662'),'us','AMERICA','1200','Harrydean.Kinski@REDPOLL.COM',
    149);
INSERT INTO customers VALUES 
    (194,'Kathleen','Garcia',cust_address_typ
    ('1812 Timberline Rd','16601','Altoona','PA','US'),
    ('+1 814 123 4663'),'us','AMERICA','1200','Kathleen.Garcia@REDSTART.COM',
    149);
INSERT INTO customers VALUES 
    (195,'Sean','Olin',cust_address_typ
    ('141 Schiller St','19601','Reading','PA','US'),
    ('+1 610 123 4664'),'us','AMERICA','1200','Sean.Olin@SCAUP.COM',
    149);
INSERT INTO customers VALUES 
    (196,'Gerard','Dench',cust_address_typ
    ('1126 Pawlings Rd','19403','Norristown','PA','US'),
    ('+1 610 123 4667'),'us','AMERICA','1200','Gerard.Dench@SCOTER.COM',
    149);
INSERT INTO customers VALUES 
    (197,'Gerard','Altman',cust_address_typ
    ('55 Church Hill Rd','19606','Reading','PA','US'),
    ('+1 610 123 4669'),'us','AMERICA','1200','Gerard.Altman@SHRIKE.COM',
    145);
INSERT INTO customers VALUES 
    (198,'Maureen','de Funes',cust_address_typ
    ('354 N Prince St','17603','Lancaster','PA','US'),
    ('+1 717 123 4674'),'us','AMERICA','1200','Maureen.deFunes@SISKIN.COM',
    149);
INSERT INTO customers VALUES 
    (199,'Clint','Chapman',cust_address_typ
    ('115 Chestnut St','19106','Philadelphia','PA','US'),
    ('+1 215 123 4676'),'us','AMERICA','1400','Clint.Chapman@SNIPE.COM',
    145);
INSERT INTO customers VALUES 
    (200,'Clint','Gielgud',cust_address_typ
    ('2899 Grand Ave','15225','Pittsburgh','PA','US'),
    ('+1 412 123 4681'),'us','AMERICA','1400','Clint.Gielgud@STILT.COM',
    149);
INSERT INTO customers VALUES 
    (201,'Eric','Prashant',cust_address_typ
    ('Po Box 39','15701','Indiana','PA','US'),
    ('+1 412 123 4684'),'us','AMERICA','1400','Eric.Prashant@TATTLER.COM',
    149);
INSERT INTO customers VALUES 
    (202,'Ingrid','Welles',cust_address_typ
    ('1604 Broadway Ave','15216','Pittsburgh','PA','US'),
    ('+1 412 123 4688'),'us','AMERICA','1400','Ingrid.Welles@TEAL.COM',
    149);
INSERT INTO customers VALUES 
    (203,'Ingrid','Rampling',cust_address_typ
    ('4734 Liberty Ave','15224','Pittsburgh','PA','US'),
    ('+1 412 123 4691'),'us','AMERICA','1400','Ingrid.Rampling@WIGEON.COM',
    145);
INSERT INTO customers VALUES 
    (204,'Cliff','Puri',cust_address_typ
    ('21 Thornwood Rd','17112','Harrisburg','PA','US'),
    ('+1 717 123 4692'),'us','AMERICA','1400','Cliff.Puri@CORMORANT.COM',
    NULL);
INSERT INTO customers VALUES 
    (205,'Emily','Pollack',cust_address_typ
    ('3725 W Lake Rd','16505','Erie','PA','US'),
    ('+1 814 123 4696'),'us','AMERICA','1400','Emily.Pollack@DIPPER.COM',
    145);
INSERT INTO customers VALUES 
    (206,'Fritz','Hackman',cust_address_typ
    ('1808 4Th Ave','16602','Altoona','PA','US'),
    ('+1 814 123 4697'),'us','AMERICA','1400','Fritz.Hackman@DUNLIN.COM',
    145);
INSERT INTO customers VALUES 
    (207,'Cybill','Laughton',cust_address_typ
    ('Station Sq','15219','Pittsburgh','PA','US'),
    ('+1 412 123 4700'),'us','AMERICA','1400','Cybill.Laughton@EIDER.COM',
    149);
INSERT INTO customers VALUES 
    (208,'Cyndi','Griem',cust_address_typ
    ('4020 Garden Ave','16508','Erie','PA','US'),
    ('+1 814 123 4706'),'us','AMERICA','1400','Cyndi.Griem@GALLINULE.COM',
    145);
INSERT INTO customers VALUES 
    (209,'Cyndi','Collins',cust_address_typ
    ('100 N Peach St','19139','Philadelphia','PA','US'),
    ('+1 215 123 4708'),'us','AMERICA','1400','Cyndi.Collins@GODWIT.COM',
    149);
INSERT INTO customers VALUES 
    (210,'Cybill','Clapton',cust_address_typ
    ('835 Heister Ln','19605','Reading','PA','US'),
    ('+1 610 123 4714'),'us','AMERICA','1400','Cybill.Clapton@GOLDENEYE.COM',
    149);
INSERT INTO customers VALUES 
    (211,'Luchino','Jordan',cust_address_typ
    ('378 S Negley Ave','15232','Pittsburgh','PA','US'),
    ('+1 412 123 4718'),'us','AMERICA','1500','Luchino.Jordan@GREBE.COM',
    149);
INSERT INTO customers VALUES 
    (212,'Luchino','Falk',cust_address_typ
    ('5643 N 5Th St','19120','Philadelphia','PA','US'),
    ('+1 215 123 4721'),'us','AMERICA','1500','Luchino.Falk@OVENBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (213,'Luchino','Bradford',cust_address_typ
    ('1401 W Warren Rd','16701','Bradford','PA','US'),
    ('+1 814 123 4722'),'us','AMERICA','1500','Luchino.Bradford@PARULA.COM',
    149);
INSERT INTO customers VALUES 
    (214,'Robin','Danson',cust_address_typ
    ('815 Freeport Rd','15215','Pittsburgh','PA','US'),
    ('+1 412 123 4724'),'us','AMERICA','1500','Robin.Danson@PHAINOPEPLA.COM',
    149);
INSERT INTO customers VALUES 
    (215,'Orson','Perkins',cust_address_typ
    ('327 N Washington Ave # 300','18503','Scranton','PA','US'),
    ('+1 717 123 4730'),'us','AMERICA','1900','Orson.Perkins@PINTAIL.COM',
    149);
INSERT INTO customers VALUES 
    (216,'Orson','Koirala',cust_address_typ
    ('810 Race St','19107','Philadelphia','PA','US'),
    ('+1 215 123 4738'),'us','AMERICA','1900','Orson.Koirala@PIPIT.COM',
    149);
INSERT INTO customers VALUES 
    (217,'Bryan','Huston',cust_address_typ
    ('4901 Locust Ln','17109','Harrisburg','PA','US'),
    ('+1 717 123 4739'),'us','AMERICA','2300','Bryan.Huston@PYRRHULOXIA.COM',
    149);
INSERT INTO customers VALUES 
    (218,'Bryan','Dvrrie',cust_address_typ
    ('3376 Perrysville Ave','15214','Pittsburgh','PA','US'),
    ('+1 412 123 4740'),'us','AMERICA','2300','Bryan.Dvrrie@REDPOLL.COM',
    149);
INSERT INTO customers VALUES 
    (219,'Ajay','Sen',cust_address_typ
    ('220 Penn Ave # 300','18503','Scranton','PA','US'),
    ('+1 717 123 4741'),'us','AMERICA','2300','Ajay.Sen@TROGON.COM',
    149);
INSERT INTO customers VALUES 
    (220,'Carol','Jordan',cust_address_typ
    ('135 S 18Th St # 1','19103','Philadelphia','PA','US'),
    ('+1 215 123 4743'),'us','AMERICA','2300','Carol.Jordan@TURNSTONE.COM',
    149);
INSERT INTO customers VALUES 
    (221,'Carol','Bradford',cust_address_typ
    ('522 Swede St','19401','Norristown','PA','US'),
    ('+1 610 123 4744'),'us','AMERICA','2300','Carol.Bradford@VERDIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (222,'Cary','Stockwell',cust_address_typ
    ('7708 City Ave','19151','Philadelphia','PA','US'),
    ('+1 215 123 4745'),'us','AMERICA','2300','Cary.Stockwell@VIREO.COM',
    NULL);
INSERT INTO customers VALUES 
    (223,'Cary','Olin',cust_address_typ
    ('1801 Lititz Pike','17601','Lancaster','PA','US'),
    ('+1 717 123 4746'),'us','AMERICA','2300','Cary.Olin@WATERTHRUSH.COM',
    149);
INSERT INTO customers VALUES 
    (224,'Clara','Krige',cust_address_typ
    ('101 E Olney Ave','19120','Philadelphia','PA','US'),
    ('+1 215 123 4748'),'us','AMERICA','2300','Clara.Krige@WHIMBREL.COM',
    NULL);
INSERT INTO customers VALUES 
    (225,'Clara','Ganesan',cust_address_typ
    ('612 Jefferson Ave','18510','Scranton','PA','US'),
    ('+1 717 123 4752'),'us','AMERICA','2300','Clara.Ganesan@WIGEON.COM',
    149);
INSERT INTO customers VALUES 
    (226,'Ajay','Andrews',cust_address_typ
    ('223 4Th Ave # 1100','15222','Pittsburgh','PA','US'),
    ('+1 412 123 4763'),'us','AMERICA','2300','Ajay.Andrews@YELLOWTHROAT.COM',
    149);
INSERT INTO customers VALUES 
    (227,'Kathy','Prashant',cust_address_typ
    ('36 W 34Th St','16508','Erie','PA','US'),
    ('+1 814 123 4766'),'us','AMERICA','2400','Kathy.Prashant@ANI.COM',
    149);
INSERT INTO customers VALUES 
    (228,'Graham','Neeson',cust_address_typ
    ('1007 Mount Royal Blvd','15223','Pittsburgh','PA','US'),
    ('+1 412 123 4767'),'us','AMERICA','2400','Graham.Neeson@AUKLET.COM',
    145);
INSERT INTO customers VALUES 
    (229,'Ian','Chapman',cust_address_typ
    ('601 Market St','19106','Philadelphia','PA','US'),
    ('+1 215 123 4768'),'us','AMERICA','2400','Ian.Chapman@AVOCET.COM',
    145);
INSERT INTO customers VALUES 
    (230,'Danny','Wright',cust_address_typ
    ('5565 Baynton St','19144','Philadelphia','PA','US'),
    ('+1 215 123 4771'),'us','AMERICA','2400','Danny.Wright@BITTERN.COM',
    149);
INSERT INTO customers VALUES 
    (231,'Danny','Rourke',cust_address_typ
    ('5640 Fishers Ln','20852','Rockville','MD','US'),
    ('+1 301 123 4794'),'us','AMERICA','2400','Danny.Rourke@BRANT.COM',
    149);
INSERT INTO customers VALUES 
    (232,'Donald','Hunter',cust_address_typ
    ('5122 Sinclair Ln','21206','Baltimore','MD','US'),
    ('+1 410 123 4795'),'us','AMERICA','2400','Donald.Hunter@CHACHALACA.COM',
    149);
INSERT INTO customers VALUES 
    (233,'Graham','Spielberg',cust_address_typ
    ('680 Bel Air Rd','21014','Bel Air','MD','US'),
    ('+1 410 123 4800'),'us','AMERICA','2400','Graham.Spielberg@CHUKAR.COM',
    145);
INSERT INTO customers VALUES 
    (234,'Dan','Roberts',cust_address_typ
    ('4301 Ashland Ave','21205','Baltimore','MD','US'),
    ('+1 410 123 4805'),'us','AMERICA','2400','Dan.Roberts@NUTHATCH.COM',
    149);
INSERT INTO customers VALUES 
    (235,'Edward','Oates',cust_address_typ
    ('8004 Stansbury Rd','21222','Baltimore','MD','US'),
    ('+1 410 012 4715'),'us','AMERICA','2400','Edward.Oates@OVENBIRD.COM',
    NULL);
INSERT INTO customers VALUES 
    (236,'Edward','Julius',cust_address_typ
    ('10209 Yearling Dr','20850','Rockville','MD','US'),
    ('+1 301 123 4809'),'us','AMERICA','2400','Edward.Julius@PARULA.COM',
    NULL);
INSERT INTO customers VALUES 
    (237,'Farrah','Quinlan',cust_address_typ
    ('3000 Greenmount Ave','21218','Baltimore','MD','US'),
    ('+1 410 123 4812'),'us','AMERICA','2400','Farrah.Quinlan@PHAINOPEPLA.COM',
    149);
INSERT INTO customers VALUES 
    (238,'Farrah','Lange',cust_address_typ
    ('200 E Fort Ave','21230','Baltimore','MD','US'),
    ('+1 410 123 4813'),'us','AMERICA','2400','Farrah.Lange@PHALAROPE.COM',
    149);
INSERT INTO customers VALUES 
    (239,'Hal','Stockwell',cust_address_typ
    ('1262 Vocke Rd','21502','Cumberland','MD','US'),
    ('+1 301 123 4814'),'us','AMERICA','2400','Hal.Stockwell@PHOEBE.COM',
    NULL);
INSERT INTO customers VALUES 
    (240,'Malcolm','Kanth',cust_address_typ
    ('3314 Eastern Ave','21224','Baltimore','MD','US'),
    ('+1 410 123 4816'),'us','AMERICA','2400','Malcolm.Kanth@PIPIT.COM',
    145);
INSERT INTO customers VALUES 
    (241,'Malcolm','Broderick',cust_address_typ
    ('12817 Coastal Hwy','21842','Ocean City','MD','US'),
    ('+1 410 123 4817'),'us','AMERICA','2400','Malcolm.Broderick@PLOVER.COM',
    145);
INSERT INTO customers VALUES 
    (242,'Mary','Lemmon',cust_address_typ
    ('11200 Scaggsville Rd','20723','Laurel','MD','US'),
    ('+1 301 123 4818'),'us','AMERICA','2400','Mary.Lemmon@PUFFIN.COM',
    145);
INSERT INTO customers VALUES 
    (243,'Mary','Collins',cust_address_typ
    ('9435 Washington Blvd N # M','20723','Laurel','MD','US'),
    ('+1 301 123 4819'),'us','AMERICA','2400','Mary.Collins@PYRRHULOXIA.COM',
    149);
INSERT INTO customers VALUES 
    (244,'Matt','Gueney',cust_address_typ
    ('2300 Harford Rd','21218','Baltimore','MD','US'),
    ('+1 410 123 4822'),'us','AMERICA','2400','Matt.Gueney@REDPOLL.COM',
    149);
INSERT INTO customers VALUES 
    (245,'Max','von Sydow',cust_address_typ
    ('2 2Nd St # A','21842','Ocean City','MD','US'),
    ('+1 410 123 4840'),'us','AMERICA','2400','Max.vonSydow@REDSTART.COM',
    149);
INSERT INTO customers VALUES 
    (246,'Max','Schell',cust_address_typ
    ('6917 W Oklahoma Ave','53219','Milwaukee','WI','US'),
    ('+1 414 123 4363'),'us','AMERICA','2400','Max.Schell@SANDERLING.COM',
    NULL);
INSERT INTO customers VALUES 
    (247,'Cynda','Whitcraft',cust_address_typ
    ('206 S Broadway # 707','55904','Rochester','MN','US'),
    ('+1 507 123 4387'),'us','AMERICA','2400','Cynda.Whitcraft@SANDPIPER.COM',
    149);
INSERT INTO customers VALUES 
    (248,'Donald','Minnelli',cust_address_typ
    ('160 Glenwood Ave','55405','Minneapolis','MN','US'),
    ('+1 612 123 4436'),'us','AMERICA','2400','Donald.Minnelli@SCAUP.COM',
    149);
INSERT INTO customers VALUES 
    (249,'Hannah','Broderick',cust_address_typ
    ('6915 Grand Ave','46323','Hammond','IN','US'),
    ('+1 219 123 4145'),'us','AMERICA','2400','Hannah.Broderick@SHRIKE.COM',
    149);
INSERT INTO customers VALUES 
    (250,'Dan','Williams',cust_address_typ
    ('2215 Oak Industrial Dr Ne','49505','Grand Rapids','MI','US'),
    ('+1 616 123 4190'),'us','AMERICA','2400','Dan.Williams@SISKIN.COM',
    145);
INSERT INTO customers VALUES 
    (251,'Raul','Wilder',cust_address_typ
    ('65 Cadillac Sq # 2701','48226','Detroit','MI','US'),
    ('+1 313 123 4241'),'us','AMERICA','2500','Raul.Wilder@STILT.COM',
    NULL);
INSERT INTO customers VALUES 
    (252,'Shah Rukh','Field',cust_address_typ
    ('3435 Tuscany Dr Se','49546','Grand Rapids','MI','US'),
    ('+1 616 123 4259'),'us','AMERICA','2500','ShahRukh.Field@WHIMBREL.COM',
    NULL);
INSERT INTO customers VALUES 
    (253,'Sally','Bogart',cust_address_typ
    ('215 4Th Ave Se','52401','Cedar Rapids','IA','US'),
    ('+1 319 123 4269'),'us','AMERICA','2500','Sally.Bogart@WILLET.COM',
    NULL);
INSERT INTO customers VALUES 
    (254,'Bruce','Bates',cust_address_typ
    ('1751 Madison Ave','51503','Council Bluffs','IA','US'),
    ('+1 712 123 4284'),'us','AMERICA','3500','Bruce.Bates@COWBIRD.COM',
    NULL);
INSERT INTO customers VALUES 
    (255,'Brooke','Shepherd',cust_address_typ
    ('810 1St Ave','51501','Council Bluffs','IA','US'),
    ('+1 712 123 4289'),'us','AMERICA','3500','Brooke.Shepherd@KILLDEER.COM',
    NULL);
INSERT INTO customers VALUES 
    (256,'Ben','de Niro',cust_address_typ
    ('500 W Oklahoma Ave','53207','Milwaukee','WI','US'),
    ('+1 414 123 4312'),'us','AMERICA','3500','Ben.deNiro@KINGLET.COM',
    149);
INSERT INTO customers VALUES 
    (257,'Emmet','Walken',cust_address_typ
    ('4811 S 76Th St # 205','53220','Milwaukee','WI','US'),
    ('+1 414 123 4364'),'us','AMERICA','3600','Emmet.Walken@LIMPKIN.COM',
    145);
INSERT INTO customers VALUES 
    (258,'Ellen','Palin',cust_address_typ
    ('310 Broadway St','56308','Alexandria','MN','US'),
    ('+1 320 123 4385'),'us','AMERICA','3600','Ellen.Palin@LONGSPUR.COM',
    149);
INSERT INTO customers VALUES 
    (259,'Denholm','von Sydow',cust_address_typ
    ('1721 E Lake St','55407','Minneapolis','MN','US'),
    ('+1 612 123 4407'),'us','AMERICA','3600','Denholm.vonSydow@MERGANSER.COM',
    145);
INSERT INTO customers VALUES 
    (260,'Ellen','Khan',cust_address_typ
    ('255 Great Arrow Ave','14207','Buffalo','NY','US'),
    ('+1 716 123 4456'),'us','AMERICA','3600','Ellen.Khan@VERDIN.COM',
    149);
INSERT INTO customers VALUES 
    (261,'Emmet','Garcia',cust_address_typ
    ('800 Carter St','14621','Rochester','NY','US'),
    ('+1 716 123 4582'),'us','AMERICA','3600','Emmet.Garcia@VIREO.COM',
    145);
INSERT INTO customers VALUES 
    (262,'Fred','Reynolds',cust_address_typ
    ('6640 Campbell Blvd','14094','Lockport','NY','US'),
    ('+1 716 123 4627'),'us','AMERICA','3600','Fred.Reynolds@WATERTHRUSH.COM',
    149);
INSERT INTO customers VALUES 
    (263,'Fred','Lithgow',cust_address_typ
    ('802 North Ave','15209','Pittsburgh','PA','US'),
    ('+1 412 123 4677'),'us','AMERICA','3600','Fred.Lithgow@WHIMBREL.COM',
    NULL);
INSERT INTO customers VALUES 
    (264,'George','Adjani',cust_address_typ
    ('1136 Arch St','19107','Philadelphia','PA','US'),
    ('+1 215 123 4702'),'us','AMERICA','3600','George.Adjani@WILLET.COM',
    149);
INSERT INTO customers VALUES 
    (265,'Irene','Laughton',cust_address_typ
    ('6Th And Master St','19122','Philadelphia','PA','US'),
    ('+1 215 123 4749'),'us','AMERICA','3600','Irene.Laughton@ANHINGA.COM',
    149);
INSERT INTO customers VALUES 
    (266,'Prem','Cardinale',cust_address_typ
    ('Rt 6 E','16365','Warren','PA','US'),
    ('+1 814 123 4755'),'us','AMERICA','3700','Prem.Cardinale@BITTERN.COM',
    145);
INSERT INTO customers VALUES 
    (267,'Prem','Walken',cust_address_typ
    ('1924 Bedford St','21502','Cumberland','MD','US'),
    ('+1 301 123 4831'),'us','AMERICA','3700','Prem.Walken@BRANT.COM',
    145);
INSERT INTO customers VALUES 
    (268,'Kyle','Schneider',cust_address_typ
    ('2674 Collingwood St','48206','Detroit','MI','US'),
    ('+1 313 123 4167'),'us','AMERICA','3700','Kyle.Schneider@DUNLIN.COM',
    149);
INSERT INTO customers VALUES 
    (269,'Kyle','Martin',cust_address_typ
    ('2713 N Bendix Dr','46628','South Bend','IN','US'),
    ('+1 219 123 4116'),'us','AMERICA','3700','Kyle.Martin@EIDER.COM',
    149);
INSERT INTO customers VALUES 
    (270,'Meg','Derek',cust_address_typ
    ('23985 Bedford Rd N','49017','Battle Creek','MI','US'),
    ('+1 616 123 4166'),'us','AMERICA','3700','Meg.Derek@FLICKER.COM',
    NULL);
INSERT INTO customers VALUES 
    (271,'Shelley','Peckinpah',cust_address_typ
    ('752 W Huron St','48341','Pontiac','MI','US'),
    ('+1 810 123 4212'),'us','AMERICA','3700','Shelley.Peckinpah@GODWIT.COM',
    149);
INSERT INTO customers VALUES 
    (272,'Prem','Garcia',cust_address_typ
    ('660 Woodward Ave # 2290','48226','Detroit','MI','US'),
    ('+1 313 123 4240'),'us','AMERICA','3700','Prem.Garcia@JACANA.COM',
    145);
INSERT INTO customers VALUES 
    (273,'Bo','Hitchcock',cust_address_typ
    ('1330 N Memorial Dr','53404','Racine','WI','US'),
    ('+1 414 123 4340'),'us','AMERICA','5000','Bo.Hitchcock@ANHINGA.COM',
    NULL);
INSERT INTO customers VALUES 
    (274,'Bob','McCarthy',cust_address_typ
    ('701 Seneca St','14210','Buffalo','NY','US'),
    ('+1 716 123 4485'),'us','AMERICA','5000','Bob.McCarthy@ANI.COM',
    NULL);
INSERT INTO customers VALUES 
    (275,'Dom','McQueen',cust_address_typ
    ('8 Automation Ln','12205','Albany','NY','US'),
    ('+1 518 123 4532'),'us','AMERICA','5000','Dom.McQueen@AUKLET.COM',
    145);
INSERT INTO customers VALUES 
    (276,'Dom','Hoskins',cust_address_typ
    ('811 N Brandywine Ave','12308','Schenectady','NY','US'),
    ('+1 518 123 4562'),'us','AMERICA','5000','Dom.Hoskins@AVOCET.COM',
    145);
INSERT INTO customers VALUES 
    (277,'Don','Siegel',cust_address_typ
    ('2904 S Salina St','13205','Syracuse','NY','US'),
    ('+1 315 123 4585'),'us','AMERICA','5000','Don.Siegel@BITTERN.COM',
    149);
INSERT INTO customers VALUES 
    (278,'Gvtz','Bradford',cust_address_typ
    ('3025 Sussex Ave','15226','Pittsburgh','PA','US'),
    ('+1 412 123 4659'),'us','AMERICA','5000','Gvtz.Bradford@BULBUL.COM',
    NULL);
INSERT INTO customers VALUES 
    (279,'Holly','Kurosawa',cust_address_typ
    ('932 High St','17603','Lancaster','PA','US'),
    ('+1 717 123 4679'),'us','AMERICA','5000','Holly.Kurosawa@CARACARA.COM',
    NULL);
INSERT INTO customers VALUES 
    (280,'Rob','MacLaine',cust_address_typ
    ('5344 Haverford Ave','19139','Philadelphia','PA','US'),
    ('+1 215 123 4709'),'us','AMERICA','5000','Rob.MacLaine@COOT.COM',
    149);
INSERT INTO customers VALUES 
    (281,'Don','Barkin',cust_address_typ
    ('6959 Tulip St','19135','Philadelphia','PA','US'),
    ('+1 215 123 4751'),'us','AMERICA','5000','Don.Barkin@CORMORANT.COM',
    149);
INSERT INTO customers VALUES 
    (282,'Kurt','Danson',cust_address_typ
    ('511 S Central Ave # A','21202','Baltimore','MD','US'),
    ('+1 410 123 4807'),'us','AMERICA','5000','Kurt.Danson@COWBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (283,'Kurt','Heard',cust_address_typ
    ('400 E Joppa Rd','21286','Baltimore','MD','US'),
    ('+1 410 123 4829'),'us','AMERICA','5000','Kurt.Heard@CURLEW.COM',
    NULL);
INSERT INTO customers VALUES 
    (308,'Glenda','Dunaway',cust_address_typ
    ('1795 Wu Meng','21191','Muang Chonburi','','CN'),
    ('+86 811 012 4093'),'zhs','CHINA','1200','Glenda.Dunaway@DOWITCHER.COM',
    149);
INSERT INTO customers VALUES 
    (309,'Glenda','Bates',cust_address_typ
    ('1796 Tsing Tao','11111','Muang Nonthaburi','','CN'),
    ('+86 123 012 4095'),'zhs','CHINA','1200','Glenda.Bates@DIPPER.COM',
    149);
INSERT INTO customers VALUES 
    (323,'G�tz','Falk',cust_address_typ
    ('1810 Tucker Crt','361181','Mumbai','','IN'),
    ('+91 80 012 4123'),'hi','INDIA','5000',
    'G�tz.Falk@VEERY.COM',
    NULL);
INSERT INTO customers VALUES 
    (326,'Hal','Olin',cust_address_typ
    ('Walpurgisstr 69','81243','Munich','','DE'),
    ('+49 89 012 4129'),'d','GERMANY','2400',
    'Hal.Olin@FLICKER.COM',
    149);
INSERT INTO customers VALUES 
    (327,'Hannah','Kanth',cust_address_typ
    ('Sendlinger Tor 4','81696','Munich','','DE'),
    ('+49 90 012 4131'),'d','GERMANY','2400',
    'Hannah.Kanth@GADWALL.COM',
    149);
INSERT INTO customers VALUES 
    (328,'Hannah','Field',cust_address_typ
    ('Theresienstr 15','81999','Munich','','DE'),
    ('+49 91 012 4133'),'d','GERMANY','2400',
    'Hannah.Field@GALLINULE.COM',
    149);
INSERT INTO customers VALUES 
    (333,'Margret','Powell',cust_address_typ
    ('Via Frenzy 6903','361196','Roma','','IT'),
    ('+39 6 012 4543'),'i','ITALY','1200',
    'Margret.Powell@ANI.COM',
    NULL);
INSERT INTO customers VALUES 
    (334,'Harry Mean','Taylor',cust_address_typ
    ('1822 Ironweed St','91261','Toronto','ONT','CA'),
    ('+1 416 012 4147'),'us','AMERICA','1200','HarryMean.Taylor@REDPOLL.COM',
    149);
INSERT INTO customers VALUES 
    (335,'Margrit','Garner',cust_address_typ
    ('Via Luminosa 162','361197','Firenze','','IT'),
    ('+39 55 012 4547'),'i','ITALY','500','Margrit.Garner@STILT.COM',
    149);
INSERT INTO customers VALUES 
    (337,'Maria','Warden',cust_address_typ
    ('Via Notoriosa 1932 Rd','361198','Firenze','','IT'),
    ('+39 55 012 4551'),'i','ITALY','500','Maria.Warden@TANAGER.COM',
    149);
INSERT INTO customers VALUES 
    (339,'Marilou','Landis',cust_address_typ
    ('Via Notoriosa 1941','361199','Firenze','','IT'),
    ('+39 55 012 4555'),'i','ITALY','500','Marilou.Landis@TATTLER.COM',
    149);
INSERT INTO customers VALUES 
    (361,'Marilou','Chapman',cust_address_typ
    ('Via Notoriosa 1942','361200','Firenze','','IT'),
    ('+39 55 012 4559'),'i','ITALY','500','Marilou.Chapman@TEAL.COM',
    145);
INSERT INTO customers VALUES 
    (363,'Kathy','Lambert',cust_address_typ
    ('Via Delle Grazie 11','361225','Tellaro','','IT'),
    ('+39 10 012 4363'),'i','ITALY','2400','Kathy.Lambert@COOT.COM',
    145);
INSERT INTO customers VALUES 
    (360,'Helmut','Capshaw',cust_address_typ
    ('1831 No Wong','111181','Peking','','CN'),
    ('+86 10 012 4165'),'zhs','CHINA','3600','Helmut.Capshaw@TROGON.COM',
    145);
INSERT INTO customers VALUES 
    (341,'Keir','George',cust_address_typ
    ('Via Dolorosa 69','361229','Tellaro','','IT'),
    ('+39 10 012 4365'),'i','ITALY','700','Keir.George@VIREO.COM',
    NULL);
INSERT INTO customers VALUES 
    (342,'Marlon','Laughton',cust_address_typ
    ('Via Notoriosa 1943','361201','Firenze','','IT'),
    ('+39 55 012 4565'),'i','ITALY','2400','Marlon.Laughton@CORMORANT.COM',
    149);
INSERT INTO customers VALUES 
    (343,'Keir','Chandar',cust_address_typ
    ('Via Luminosa 162','361231','Tellaro','','IT'),
    ('+39 10 012 4367'),'i','ITALY','700','Keir.Chandar@WATERTHRUSH.COM',
    149);
INSERT INTO customers VALUES 
    (344,'Marlon','Godard',cust_address_typ
    ('2017 Convoy St','876508','Tokyo','','JP'),
    ('+81 565 012 4567'),'ja','JAPAN','2400','Marlon.Godard@MOORHEN.COM',
    149);
INSERT INTO customers VALUES 
    (345,'Keir','Weaver',cust_address_typ
    ('Via Di Firenze 231','361228','Tellaro','','IT'),
    ('+39 10 012 4369'),'i','ITALY','700','Keir.Weaver@WHIMBREL.COM',
    NULL);
INSERT INTO customers VALUES 
    (346,'Marlon','Clapton',cust_address_typ
    ('Via Notoriosa 1949','361202','Firenze','','IT'),
    ('+39 55 012 4569'),'i','ITALY','2400','Marlon.Clapton@COWBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (347,'Kelly','Quinlan',cust_address_typ
    ('Via Frenzy 6903','361230','Tellaro','','IT'),
    ('+39 10 012 4371'),'i','ITALY','3600',
    'Kelly.Quinlan@PYRRHULOXIA.COM',
    149);
INSERT INTO customers VALUES 
    (348,'Kelly','Lange',cust_address_typ
    ('Piazza Del Congresso 22','361219','San Giminiano','','IT'),
    ('+39 49 012 4373'),'i','ITALY','3600',
    'Kelly.Lange@SANDPIPER.COM',
    149);
INSERT INTO customers VALUES 
    (349,'Ken','Glenn',cust_address_typ
    ('Piazza Quattre Stagioni 4','361220','San Giminiano','','IT'),
    ('+39 49 012 4375'),'i','ITALY','3600',
    'Ken.Glenn@SAW-WHET.COM',
    149);
INSERT INTO customers VALUES 
    (350,'Ken','Chopra',cust_address_typ
    ('Piazza Cacchiatore 23','361218','San Giminiano','','IT'),
    ('+39 49 012 4377'),'i','ITALY','3600',
    'Ken.Chopra@SCAUP.COM',
    149);
INSERT INTO customers VALUES 
    (351,'Ken','Wenders',cust_address_typ
    ('Via Notoriosa 1932','361232','Tellaro','','IT'),
    ('+39 10 012 4379'),'i','ITALY','3600',
    'Ken.Wenders@REDPOLL.COM',
    149);
INSERT INTO customers VALUES 
    (352,'Kenneth','Redford',cust_address_typ
    ('Via Notoriosa 1949','361236','Ventimiglia','','IT'),
    ('+39 10 012 4381'),'i','ITALY','3600',
    'Kenneth.Redford@REDSTART.COM',
    149);
INSERT INTO customers VALUES 
    (378,'Meg','Sen',cust_address_typ
    ('2033 Spartacus St','','Samutprakarn','','TH'),
    ('+66 76 012 4633'),'th','THAILAND','3700',
    'Meg.Sen@COWBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (380,'Meryl','Holden',cust_address_typ
    ('2034 Sabrina Rd','361182','Samutprakarn','','IN'),
    ('+91 80 012 4637'),'hi','INDIA','3700',
    'Meryl.Holden@DIPPER.COM',
    149);
INSERT INTO customers VALUES 
    (447,'Richard','Coppola',cust_address_typ
    ('Piazza Svizzera','361211','Milano','','IT'),
    ('+39 2 012 4771'),'i','ITALY','500','Richard.Coppola@SISKIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (448,'Richard','Winters',cust_address_typ
    ('Ruella Delle Spiriti','361212','Milano','','IT'),
    ('+39 2 012 4773'),'i','ITALY','500','Richard.Winters@SNIPE.COM',
    149);
INSERT INTO customers VALUES 
    (449,'Rick','Romero',cust_address_typ
    ('Via Del Disegno 194','361213','Milano','','IT'),
    ('+39 2 012 4775'),'i','ITALY','1500','Rick.Romero@LONGSPUR.COM',
    145);
INSERT INTO customers VALUES 
    (450,'Rick','Lyon',cust_address_typ
    ('Via Delle Capeletti 52','361214','San Giminiano','','IT'),
    ('+39 49 012 4777'),'i','ITALY','1500','Rick.Lyon@MERGANSER.COM',
    149);
INSERT INTO customers VALUES 
    (451,'Ridley','Hackman',cust_address_typ
    ('Via Delle Grazie 11','361215','San Giminiano','','IT'),
    ('+39 49 012 4779'),'i','ITALY','700','Ridley.Hackman@ANHINGA.COM',
    145);
INSERT INTO customers VALUES 
    (452,'Ridley','Coyote',cust_address_typ
    ('Via Delli Capelli 2','361216','San Giminiano','','IT')
    ('+39 49 012 4781'),'i','ITALY','700','Ridley.Coyote@ANI.COM',
    NULL);
INSERT INTO customers VALUES 
    (453,'Ridley','Young',cust_address_typ
    ('1592 Silverado St','361123','Bangalore','Kar','IN'),
    ('+91 80 012 4783'),'hi','INDIA','700','Ridley.Young@CHUKAR.COM',
    149);
INSERT INTO customers VALUES 
    (454,'Rob','Russell',cust_address_typ
    ('1593 Silverado St','361112','Bangalore','Kar','IN'),
    ('+91 80 012 4785'),'hi','INDIA','5000',
    'Rob.Russell@VERDIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (458,'Robert','de Niro',cust_address_typ
    ('1597 Legend St','','Mysore','Kar','IN'),
    ('+91 80 012 4793'),'hi','INDIA','3700',
    'Robert.deNiro@DOWITCHER.COM',
    NULL);
INSERT INTO customers VALUES 
    (463,'Robin','Adjani',cust_address_typ
    ('1602 Sholay St','','Chennai','Tam','IN'),
    ('+91 80 012 4803'),'hi','INDIA','1500','Robin.Adjani@MOORHEN.COM',
    149);
INSERT INTO customers VALUES 
    (466,'Rodolfo','Hershey',cust_address_typ
    ('1605 Bazigar Crt','','Pune','','IN'),
    ('+91 80 012 4809'),'hi','INDIA','5000',
    'Rodolfo.Hershey@VIREO.COM',
    NULL);
INSERT INTO customers VALUES 
    (467,'Rodolfo','Dench',cust_address_typ
    ('1606 Sangam Blvd','361196','New Delhi','','IN'),
    ('+91 11 012 4811'),'hi','INDIA','5000',
    'Rodolfo.Dench@SCOTER.COM',
    149);
INSERT INTO customers VALUES 
    (468,'Rodolfo','Altman',cust_address_typ
    ('1607 Sangam Blvd','361114','New Delhi','','IN'),
    ('+91 11 012 4813'),'hi','INDIA','5000',
    'Rodolfo.Altman@SHRIKE.COM',
    145);
INSERT INTO customers VALUES 
    (470,'Roger','Mastroianni',cust_address_typ
    ('1609 Pakija Rd','','New Delhi','','IN'),
    ('+91 11 012 4817'),'hi','INDIA','3700',
    'Roger.Mastroianni@CREEPER.COM',
    149);
INSERT INTO customers VALUES 
    (473,'Rolf','Ashby',cust_address_typ
    ('1612 Talaivar St','','Chennai','Tam','IN'),
    ('+91 80 012 4823'),'hi','INDIA','5000',
    'Rolf.Ashby@WATERTHRUSH.COM',
    NULL);
INSERT INTO customers VALUES 
    (474,'Romy','Sharif',cust_address_typ
    ('1613 Victoria St','','Calcutta','','IN'),
    ('+91 33 012 4825'),'hi','INDIA','5000',
    'Romy.Sharif@SNIPE.COM',
    145);
INSERT INTO customers VALUES 
    (475,'Romy','McCarthy',cust_address_typ
    ('1614 Gitanjali Rd','361168','Calcutta','','IN'),
    ('+91 33 012 4827'),'hi','INDIA','5000',
    'Romy.McCarthy@STILT.COM',
    145);
INSERT INTO customers VALUES 
    (476,'Rosanne','Hopkins',cust_address_typ
    ('1615 Crackers Crt','361168','Chennai - India','','IN'),
    ('+91 80 012 4829'),'hi','INDIA','300','Rosanne.Hopkins@ANI.COM',
    149);
INSERT INTO customers VALUES 
    (477,'Rosanne','Douglas',cust_address_typ
    ('1616 Mr. India Ln','361168','Bombay - India','Kar','IN'),
    ('+91 22 012 4831'),'hi','INDIA','300','Rosanne.Douglas@ANHINGA.COM',
    149);
INSERT INTO customers VALUES 
    (478,'Rosanne','Baldwin',cust_address_typ
    ('1617 Crackers St','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 4833'),'hi','INDIA','300','Rosanne.Baldwin@AUKLET.COM',
    149);
INSERT INTO customers VALUES 
    (479,'Roxanne','Shepherd',cust_address_typ
    ('1618 Villains St','361168','New Delhi - India','','IN'),
    ('+91 11 012 4835'),'hi','INDIA','1200',
    'Roxanne.Shepherd@DUNLIN.COM',
    149);
INSERT INTO customers VALUES 
    (480,'Roxanne','Michalkow',cust_address_typ
    ('1619 Bowlers Rd','361168','Chandigarh','Har','IN'),
    ('+91 172 012 4837'),'hi','INDIA','1200','Roxanne.Michalkow@EIDER.COM',
    149);
INSERT INTO customers VALUES 
    (481,'Roy','Hulce',cust_address_typ
    ('1620 Sixers Crt','361168','Bombay','Kar','IN'),
    ('+91 22 012 4839'),'hi','INDIA','5000',
    'Roy.Hulce@SISKIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (482,'Roy','Dunaway',cust_address_typ
    ('1622 Roja St','361168','Chennai','Tam','IN'),
    ('+91 80 012 4841'),'hi','INDIA','5000',
    'Roy.Dunaway@WHIMBREL.COM',
    149);
INSERT INTO customers VALUES 
    (483,'Roy','Bates',cust_address_typ
    ('1623 Hey Ram St','361168','Chennai - India','','IN'),
    ('+91 80 012 4843'),'hi','INDIA','5000',
    'Roy.Bates@WIGEON.COM',
    NULL);
INSERT INTO customers VALUES 
    (487,'Rufus','Dvrrie',cust_address_typ
    ('1627 Sowdagar St','361168','New Delhi','','IN'),
    ('+91 11 012 4851'),'hi','INDIA','1900',
    'Rufus.Dvrrie@PLOVER.COM',
    NULL);
INSERT INTO customers VALUES 
    (488,'Rufus','Belushi',cust_address_typ
    ('1628 Pataudi St','361168','New Delhi','','IN'),
    ('+91 11 012 4853'),'hi','INDIA','1900',
 'Rufus.Belushi@PUFFIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (492,'Sally','Edwards',cust_address_typ
    ('1632 Splash St','361168','Chandigarh','Har','IN'),
    ('+91 172 012 4861'),'hi','INDIA','2500',
 'Sally.Edwards@TURNSTONE.COM',
    NULL);
INSERT INTO customers VALUES 
    (496,'Scott','Jordan',cust_address_typ
    ('1636 Pretty Blvd','361168','Bangalore','Kar','IN'),
    ('+91 80 012 4869'),'hi','INDIA','5000','Scott.Jordan@WILLET.COM',
    149);
INSERT INTO customers VALUES 
    (605,'Shammi','Pacino',cust_address_typ
    ('1646 Brazil Blvd','361168','Chennai','Tam','IN'),
    ('+91 80 012 4887'),'hi','INDIA','500','Shammi.Pacino@BITTERN.COM',
    145);
INSERT INTO customers VALUES 
    (606,'Sharmila','Kazan',cust_address_typ
    ('1647 Suspense St','361168','Cochin','Ker','IN'),
    ('+91 80 012 4889'),'hi','INDIA','500','Sharmila.Kazan@BRANT.COM',
    145);
INSERT INTO customers VALUES 
    (607,'Sharmila','Fonda',cust_address_typ
    ('1648 Anamika St','361168','Cochin','Ker','IN'),
    ('+91 80 012 4891'),'hi','INDIA','500','Sharmila.Fonda@BUFFLEHEAD.COM',
    145);
INSERT INTO customers VALUES 
    (609,'Shelley','Taylor',cust_address_typ
    ('1650 Teesri Manjil Crt','361168','Kashmir','','IN'),
    ('+91 141 012 4895'),'hi','INDIA','3700',
 'Shelley.Taylor@CURLEW.COM',
    NULL);
INSERT INTO customers VALUES 
    (615,'Shyam','Plummer',cust_address_typ
    ('1656 Veterans Rd','361168','Chennai','Tam','IN'),
    ('+91 80 012 4907'),'hi','INDIA','2500','Shyam.Plummer@VEERY.COM',
    145);
INSERT INTO customers VALUES 
    (621,'Silk','Kurosawa',cust_address_typ
    ('1662 Talaivar St','361168','Chennai','Tam','IN'),
    ('+91 80 012 4919'),'hi','INDIA','1500','Silk.Kurosawa@NUTHATCH.COM',
    NULL);
INSERT INTO customers VALUES 
    (627,'Sivaji','Gielgud',cust_address_typ
    ('1667 2010 St','61311','Batavia','Ker','IN'),
    ('+91 80 012 4931'),'hi','INDIA','500','Sivaji.Gielgud@BULBUL.COM',
    NULL);
INSERT INTO customers VALUES 
    (712,'M. Emmet','Stockwell',cust_address_typ
    ('Piazza Del Congresso 22','361185','Roma','','IT'),
    ('+39 6 012 4501'),'i','ITALY','3700',
    'M.Emmet.Stockwell@COOT.COM',
    145);
INSERT INTO customers VALUES 
    (713,'M. Emmet','Olin',cust_address_typ
    ('Piazza Quattre Stagioni 4','361186','Roma','','IT'),
    ('+39 6 012 4503'),'i','ITALY','3700',
    'M.Emmet.Olin@CORMORANT.COM',
    145);
INSERT INTO customers VALUES 
    (715,'Malcolm','Field',cust_address_typ
    ('Piazza Svizzera','361187','Roma','','IT'),
    ('+39 6 012 4507'),'i','ITALY','2400',
    'Malcolm.Field@DOWITCHER.COM',
    145);
INSERT INTO customers VALUES 
    (717,'Mammutti','Sutherland',cust_address_typ
    ('Ruella Delle Spiriti','361188','Roma','','IT'),
    ('+39 6 012 4511'),'i','ITALY','500',
    'Mammutti.Sutherland@TOWHEE.COM',
    145);
INSERT INTO customers VALUES 
    (719,'Mani','Kazan',cust_address_typ
    ('Via Del Disegno 194','361189','Roma','','IT'),
    ('+39 6 012 4515'),'i','ITALY','500','Mani.Kazan@TROGON.COM',
    149);
INSERT INTO customers VALUES 
    (721,'Mani','Buckley',cust_address_typ
    ('Via Delle Capeletti 52','361190','Roma','','IT'),
    ('+39 6 012 4519'),'i','ITALY','500','Mani.Buckley@TURNSTONE.COM',
    149);
INSERT INTO customers VALUES 
    (727,'Margaret','Ustinov',cust_address_typ
    ('Via Dello Croce 93','361193','Roma','','IT'),
    ('+39 6 012 4531'),'i','ITALY','1200','Margaret.Ustinov@ANHINGA.COM',
    149);
INSERT INTO customers VALUES 
    (729,'Margaux','Krige',cust_address_typ
    ('Via Di Firenze 231','361194','Roma','','IT'),
    ('+39 6 012 4535'),'i','ITALY','2400',
    'Margaux.Krige@DUNLIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (731,'Margaux','Capshaw',cust_address_typ
    ('Via Dolorosa 69','361195','Roma','','IT'),
    ('+39 6 012 4539'),'i','ITALY','2400',
    'Margaux.Capshaw@EIDER.COM',
    NULL);
INSERT INTO customers VALUES 
    (754,'Kevin','Goodman',cust_address_typ
    ('Via Notoriosa 1942','361234','Ventimiglia','','IT'),
    ('+39 10 012 4385'),'i','ITALY','700','Kevin.Goodman@WIGEON.COM',
    145);
INSERT INTO customers VALUES 
    (755,'Kevin','Cleveland',cust_address_typ
    ('Via Notoriosa 1943','361235','Ventimiglia','','IT'),
    ('+39 10 012 4387'),'i','ITALY','700','Kevin.Cleveland@WILLET.COM',
    149);
INSERT INTO customers VALUES 
    (756,'Kevin','Wilder',cust_address_typ
    ('Canale Grande 2','361183','Roma','','IT'),
    ('+39 6 012 4389'),'i','ITALY','700','Kevin.Wilder@AUKLET.COM',
    149);
INSERT INTO customers VALUES 
    (757,'Kiefer','Reynolds',cust_address_typ
    ('Piazza Cacchiatore 23','361184','Roma','','IT'),
    ('+39 6 012 4391'),'i','ITALY','700','Kiefer.Reynolds@AVOCET.COM',
    149);
INSERT INTO customers VALUES 
    (766,'Klaus','Young',cust_address_typ
    ('Via Del Disegno 194','361223','San Giminiano','','IT'),
    ('+39 49 012 4409'),'i','ITALY','600','Klaus.Young@OVENBIRD.COM',
    149);
INSERT INTO customers VALUES 
    (767,'Klaus Maria','Russell',cust_address_typ
    ('Piazza Svizzera','361221','San Giminiano','','IT'),
    ('+39 49 012 4411'),'i','ITALY','100','KlausMaria.Russell@COOT.COM',
    NULL);
INSERT INTO customers VALUES 
    (768,'Klaus Maria','MacLaine',cust_address_typ
    ('Via Dello Croce 93','361227','Tellaro','','IT'),
    ('+39 10 012 4413'),'i','ITALY','100','KlausMaria.MacLaine@CHUKAR.COM',
    149);
INSERT INTO customers VALUES 
    (769,'Kris','Harris',cust_address_typ
    ('Via Dello Croce 93','361217','San Giminiano','','IT'),
    ('+39 49 012 4415'),'i','ITALY','400','Kris.Harris@DIPPER.COM',
    NULL);
INSERT INTO customers VALUES 
    (770,'Kris','Curtis',cust_address_typ
    ('Ruella Delle Spiriti','361222','San Giminiano','','IT'),
    ('+39 49 012 4417'),'i','ITALY','400','Kris.Curtis@DOWITCHER.COM',
    NULL);
INSERT INTO customers VALUES 
    (771,'Kris','de Niro',cust_address_typ
    ('Via Delle Capeletti 52','361224','San Giminiano','','IT'),
    ('+39 49 012 4419'),'i','ITALY','400','Kris.deNiro@DUNLIN.COM',
    NULL);
INSERT INTO customers VALUES 
    (772,'Kristin','Savage',cust_address_typ
    ('Via Delli Capelli 2','361226','Tellaro','','IT'),
    ('+39 10 012 4421'),'i','ITALY','400','Kristin.Savage@CURLEW.COM',
    149);
INSERT INTO customers VALUES 
    (782,'Laurence','Seignier',cust_address_typ
    ('1971 Limelight Blvd','','Samutprakarn','','TH'),
    ('+66 76 012 4441'),'th','THAILAND','1200','Laurence.Seignier@CREEPER.COM',
    149);
INSERT INTO customers VALUES 
    (825,'Alain','Dreyfuss',cust_address_typ
    ('Harmoniegasse 3','3413','Baden-Daettwil','AG','CH'),
    ('+41 56 012 3527'),'d','SWITZERLAND','500','Alain.Dreyfuss@VEERY.COM',
    149);
INSERT INTO customers VALUES 
    (826,'Alain','Barkin',cust_address_typ
    ('Sonnenberg 4','3413','Baden-Daettwil','AG','CH'),
    ('+41 57 012 3529'),'d','SWITZERLAND','500','Alain.Barkin@VERDIN.COM',
    149);
INSERT INTO customers VALUES 
    (827,'Alain','Siegel',cust_address_typ
    ('Alfred E. Neumann-Weg 3','3413','Baden-Daettwil','AG','CH'),
    ('+41 58 012 3531'),'d','SWITZERLAND','500','Alain.Siegel@VIREO.COM',
    149);
INSERT INTO customers VALUES 
    (828,'Alan','Minnelli',cust_address_typ
    ('Dr. Herbert Bitto Str 23','3413','Baden-Daettwil','AG','CH'),
    ('+41 59 012 3533'),'d','SWITZERLAND','2300',
    'Alan.Minnelli@TANAGER.COM',
    149);
INSERT INTO customers VALUES 
    (829,'Alan','Hunter',cust_address_typ
    ('Taefernstr 4','3413',
    'Baden-Daettwil','AG','CH'),
    ('+41 60 012 3535'),'d','SWITZERLAND',
    '2300','Alan.Hunter@TATTLER.COM',
    149);
INSERT INTO customers VALUES 
    (830,'Albert','Dutt',cust_address_typ
    ('Kreuzritterplatz 5','3413','Baden-Daettwil','AG','CH'),
    ('+41 61 012 3537'),'d','SWITZERLAND','3500',
    'Albert.Dutt@CURLEW.COM',
    NULL);
INSERT INTO customers VALUES 
    (831,'Albert','Bel Geddes',cust_address_typ
    ('Helebardenweg 5','3413','Baden-Daettwil','AG','CH'),
    ('+41 62 012 3539'),'d','SWITZERLAND','3500',
    'Albert.BelGeddes@DIPPER.COM',
    NULL);
INSERT INTO customers VALUES 
    (832,'Albert','Spacek',cust_address_typ
    ('Zum Freundlichen Nachbarn 5','3413',
    'Baden-Daettwil','AG','CH'),
    ('+41 63 012 3541'),'d','SWITZERLAND','3500',
    'Albert.Spacek@DOWITCHER.COM',
    NULL);
INSERT INTO customers VALUES 
    (833,'Alec','Moranis',cust_address_typ
    ('Ziegenwiese 3','3413','Baden-Daettwil','AG','CH'),
    ('+41 64 012 3543'),'d','SWITZERLAND','3500',
    'Alec.Moranis@DUNLIN.COM',
    149);
INSERT INTO customers VALUES 
    (834,'Alec','Idle',cust_address_typ
    ('Am Waldrand 5','3413','Baden-Daettwil','AG','CH'),
    ('+41 65 012 3545'),'d','SWITZERLAND','3500',
    'Alec.Idle@EIDER.COM',
    NULL);
INSERT INTO customers VALUES 
    (835,'Alexander','Eastwood',cust_address_typ
    ('Zur Kantine 9','3413','Baden-Daettwil','AG','CH'),
    ('+41 66 012 3547'),'d','SWITZERLAND','1200',
    'Alexander.Eastwood@AVOCET.COM',
    149);
INSERT INTO customers VALUES 
    (836,'Alexander','Berenger',cust_address_typ
    ('Grosse Bahnhostrasse 3','3413','Baden-Daettwil','AG','CH'),
   ('+41 67 012 3549'),'d','SWITZERLAND','1200',
    'Alexander.Berenger@BECARD.COM',
    149);
INSERT INTO customers VALUES 
    (837,'Alexander','Stanton',cust_address_typ
    ('Paradeplatz 4','8001','Zuerich','ZH','CH'),
    ('+41 2 012 3551'),'d','SWITZERLAND','1200',
    'Alexander.Stanton@AUKLET.COM',
    149);
INSERT INTO customers VALUES 
    (838,'Alfred','Nicholson',cust_address_typ
    ('Badenerstr 1941','8004','Zuerich','ZH','CH'),
    ('+41 3 012 3553'),'d','SWITZERLAND','3500',
    'Alfred.Nicholson@CREEPER.COM',
    149);
INSERT INTO customers VALUES 
    (839,'Alfred','Johnson',cust_address_typ
    ('Welschdoerfchen 1941','7001','Chur','ZH','CH'),
    ('+41 81 012 3555'),'d','SWITZERLAND','3500','Alfred.Johnson@FLICKER.COM',
    149);
INSERT INTO customers VALUES 
    (840,'Ali','Elliott',cust_address_typ
    ('Le Reduit','7064','Tschiertschen','GR','CH'),
    ('+41 81 012 3557'),'d','SWITZERLAND','1400','Ali.Elliott@ANHINGA.COM',
    NULL);
INSERT INTO customers VALUES 
    (841,'Ali','Boyer',cust_address_typ
    ('Bendlehn','9062','Trogen','SG','CH'),
    ('+41 71 012 3559'),'d','SWITZERLAND','1400','Ali.Boyer@WILLET.COM',
    NULL);
INSERT INTO customers VALUES 
    (842,'Ali','Stern',cust_address_typ
    ('Spisertor 3','7000','St. Gallen','SG','CH'),
    ('+41 71 012 3561'),'d','SWITZERLAND','1400','Ali.Stern@YELLOWTHROAT.COM',
    149);
INSERT INTO customers VALUES 
    (843,'Alice','Oates',cust_address_typ
    ('Langstr 14','8004','Zuerich','ZH','CH'),
    ('+41 4 012 3563'),'d','SWITZERLAND','700','Alice.Oates@BECARD.COM',
    NULL);
INSERT INTO customers VALUES 
    (844,'Alice','Julius',cust_address_typ
    ('Roessligasse 4','8001','Zurich','ZH','CH'),
    ('+41 6 012 3565'),'d','SWITZERLAND','700','Alice.Julius@BITTERN.COM',
    NULL);
INSERT INTO customers VALUES 
    (845,'Ally','Fawcett',cust_address_typ
    ('Zum Froehlichen Schweizer 3','8000','Zurich','ZH','CH'),
    ('+41 7 012 3567'),'d','SWITZERLAND','5000',
    'Ally.Fawcett@PLOVER.COM',
    NULL);
INSERT INTO customers VALUES 
    (846,'Ally','Brando',cust_address_typ
    ('Chrottenweg','3000','Bern','BE','CH'),
    ('+41 31 012 3569'),'d','SWITZERLAND','5000',
    'Ally.Brando@PINTAIL.COM',
    149);
INSERT INTO customers VALUES 
    (847,'Ally','Streep',cust_address_typ
    ('Bruppacher Str 3','3413','Baden-Daettwil','AG','CH'),
    ('+41 68 012 3571'),'d','SWITZERLAND','5000',
    'Ally.Streep@PIPIT.COM',
    NULL);
INSERT INTO customers VALUES 
    (848,'Alonso','Olmos',cust_address_typ
    ('Limmatquai','8001','Zuerich','ZH','CH'),
    ('+41 5 012 3573'),'d','SWITZERLAND','1800',
    'Alonso.Olmos@PHALAROPE.COM',
    145);
INSERT INTO customers VALUES 
    (849,'Alonso','Kaurusmdki',cust_address_typ
    ('Dreikoenigsstr 3','8001','Zurich','ZH','CH'),
    ('+41 8 012 3575'),'d','SWITZERLAND','1800',
    'Alonso.Kaurusmdki@PHOEBE.COM',
    145);
INSERT INTO customers VALUES 
    (850,'Amanda','Finney',cust_address_typ
    ('Pfannenstilstr 13','8132','Egg','ZH','CH'),
    ('+41 1 012 3577'),'d','SWITZERLAND','2300',
    'Amanda.Finney@STILT.COM',
    145);
INSERT INTO customers VALUES 
    (851,'Amanda','Brown',cust_address_typ
    ('Kreuzstr 32','8032','Zurich','ZH','CH'),
    ('+41 9 012 3579'),'d','SWITZERLAND','2300',
    'Amanda.Brown@THRASHER.COM',
    145);
INSERT INTO customers VALUES 
    (852,'Amanda','Tanner',cust_address_typ
    ('1539 Stripes Rd','3413','Baden-Daettwil','AG','CH'),
    ('+41 69 012 3581'),'d','SWITZERLAND','2300',
    'Amanda.Tanner@TEAL.COM',
    145);
INSERT INTO customers VALUES 
    (853,'Amrish','Palin',cust_address_typ
    ('1540 Stripes Crt','3413','Baden-Daettwil','AG','CH'),
    ('+41 70 012 3583'),'d','SWITZERLAND','400','Amrish.Palin@EIDER.COM',
    145);
INSERT INTO customers VALUES 
    (905,'Billy','Hershey',cust_address_typ
    ('1592 Silverado St','361123','Bangalore','Kar','IN'),
    ('+91 80 012 3687'),'hi','INDIA','1400','Billy.Hershey@BULBUL.COM',
    NULL);
INSERT INTO customers VALUES 
    (906,'Billy','Dench',cust_address_typ
    ('1593 Silverado St','361112','Bangalore','Kar','IN'),
    ('+91 80 012 3689'),'hi','INDIA','1400','Billy.Dench@CARACARA.COM',
    149);
INSERT INTO customers VALUES 
    (909,'Blake','Mastroianni',cust_address_typ
    ('1596 Commando Blvd','361126','Bangalore','Kar','IN'),
    ('+91 80 012 3695'),'hi','INDIA','1200','Blake.Mastroianni@FLICKER.COM',
    149);
INSERT INTO customers VALUES 
    (911,'Bo','Dickinson',cust_address_typ
    ('1598 Legend St','361149','Bangalore','Kar','IN'),
    ('+91 80 012 3699'),'hi','INDIA','5000',
    'Bo.Dickinson@TANAGER.COM',
    149);
INSERT INTO customers VALUES 
    (912,'Bo','Ashby',cust_address_typ
    ('1599 Legend Rd','361128','Bangalore','Kar','IN'),
    ('+91 80 012 3701'),'hi','INDIA','5000',
    'Bo.Ashby@TATTLER.COM',
    NULL);
INSERT INTO customers VALUES 
    (913,'Bob','Sharif',cust_address_typ
    ('1600 Target Crt','361191','Bangalore','Kar','IN'),
    ('+91 80 012 3703'),'hi','INDIA','5000',
    'Bob.Sharif@TEAL.COM',
    NULL);
INSERT INTO customers VALUES 
    (916,'Brian','Douglas',cust_address_typ
    ('1603 Rebel St','361129','Bangalore','Kar','IN'),
    ('+91 80 012 3709'),'hi','INDIA','500','Brian.Douglas@AVOCET.COM',
    149);
INSERT INTO customers VALUES 
    (917,'Brian','Baldwin',cust_address_typ
    ('1604 Volunteers Rd','361121','Bangalore','Kar','IN'),
    ('+91 80 012 3711'),'hi','INDIA','500','Brian.Baldwin@BECARD.COM',
    149);
INSERT INTO customers VALUES 
    (919,'Brooke','Michalkow',cust_address_typ
    ('1606 Volunteers Blvd','361196','Bangalore','Kar','IN'),
    ('+91 80 012 3715'),'hi','INDIA','3500','Brooke.Michalkow@GROSBEAK.COM',
    NULL);
INSERT INTO customers VALUES 
    (920,'Bruce','Hulce',cust_address_typ
    ('1607 Abwdrts St','361114','Bangalore','Kar','IN'),
    ('+91 80 012 3717'),'hi','INDIA','3500','Bruce.Hulce@JACANA.COM',
    NULL);
INSERT INTO customers VALUES 
    (921,'Bruce','Dunaway',cust_address_typ
    ('1608 Amadeus St','361198','Bangalore','Kar','IN'),
    ('+91 80 012 3719'),'hi','INDIA','3500',
    'Bruce.Dunaway@JUNCO.COM',
    149);
INSERT INTO customers VALUES 
    (923,'Bruno','Slater',cust_address_typ
    ('1610 Betrayal Crt','361119','Bangalore','Kar','IN'),
    ('+91 80 012 3723'),'hi','INDIA','5000',
    'Bruno.Slater@THRASHER.COM',
    149);
INSERT INTO customers VALUES 
    (924,'Bruno','Montand',cust_address_typ
    ('1611 Carmen Blvd','361118','Bangalore','Kar','IN'),
    ('+91 80 012 3725'),'hi','INDIA','5000',
    'Bruno.Montand@TOWHEE.COM',
    149);
INSERT INTO customers VALUES 
    (927,'Bryan','Belushi',cust_address_typ
    ('1614 Crackers Rd','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3731'),'hi','INDIA','2300',
    'Bryan.Belushi@TOWHEE.COM',
    149);
INSERT INTO customers VALUES 
    (928,'Burt','Spielberg',cust_address_typ
    ('1615 Crackers Crt','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3733'),'hi','INDIA','5000',
    'Burt.Spielberg@TROGON.COM',
    NULL);
INSERT INTO customers VALUES 
    (929,'Burt','Neeson',cust_address_typ
    ('1616 Crackers Blvd','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3735'),'hi','INDIA','5000',
    'Burt.Neeson@TURNSTONE.COM',
    149);
INSERT INTO customers VALUES 
    (930,'Buster','Jackson',cust_address_typ
    ('1617 Crackers St','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3737'),'hi','INDIA','900','Buster.Jackson@KILLDEER.COM',
    149);
INSERT INTO customers VALUES 
    (931,'Buster','Edwards',cust_address_typ
    ('1618 Footloose St','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3739'),'hi','INDIA','900','Buster.Edwards@KINGLET.COM',
    NULL);
INSERT INTO customers VALUES 
    (932,'Buster','Bogart',cust_address_typ
    ('1619 Footloose Rd','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3741'),'hi','INDIA','900','Buster.Bogart@KISKADEE.COM',
    NULL);
INSERT INTO customers VALUES 
    (934,'C. Thomas','Nolte',cust_address_typ
    ('1621 Gargon! Blvd','361168','Bangalore - India','Kar','IN'),
    ('+91 80 012 3745'),'hi','INDIA','600','C.Thomas.Nolte@PHOEBE.COM',
    145);
INSERT INTO customers VALUES 
    (980,'Daniel','Loren',cust_address_typ
    ('1667 2010 St','61311','Batavia','IL','IN'),
    ('+91 80 012 3837'),'hi','INDIA','200','Daniel.Loren@REDSTART.COM',
    149);
INSERT INTO customers VALUES 
    (981,'Daniel','Gueney',cust_address_typ
    ('1668 Chong Tao','111181','Beijing','','CN'),
    ('+86 10 012 3839'),'zhs','CHINA','200','Daniel.Gueney@REDPOLL.COM',
    149); 

commit;
