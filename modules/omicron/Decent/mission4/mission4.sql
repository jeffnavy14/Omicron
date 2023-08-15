---------------------------------------
-- Diorama_Abdhaljs-Ghelsba (Zone 43) 
-- ID = (<zone id> x 4096) + 16777217 for first usable ID
---------------------------------------
-- Variables
SET @ALWAYS = 1000;  -- Always, 100%
SET @VCOMMON = 240;  -- Very common, 24%
SET @COMMON = 150;   -- Common, 15%
SET @UNCOMMON = 100; -- Uncommon, 10%
SET @RARE = 50;      -- Rare, 5%
SET @VRARE = 10;     -- Very rare, 1%
SET @SRARE = 5;      -- Super Rare, 0.5%
SET @URARE = 1;      -- Ultra rare, 0.1%
-- NPC remove/add
DELETE FROM `npc_list` WHERE `npcid` BETWEEN 16953345 AND 16953375;

INSERT INTO `npc_list` VALUES (16953345,'Return_Waypoint','Return_Waypoint',0,119,-20,180,0,50,50,0,1,0,0,27,0x0000740900000000000000000000000000000000,0,'SOA',1);
INSERT INTO `npc_list` VALUES (16953346,'CheckPoint','CheckPoint',0,-30,0,-15,1,50,50,9,0,0,0,4099,0x0000740900000000000000000000000000000000,0,'SOA',1);
INSERT INTO `npc_list` VALUES (16953347,'CheckPoint','CheckPoint',0,-166,-10,267,1,50,50,9,0,0,0,4099,0x0000740900000000000000000000000000000000,0,'SOA',1);
INSERT INTO `npc_list` VALUES (16953348,'CheckPoint','CheckPoint',0,73,-0.1,370,1,50,50,9,0,0,0,4099,0x0000740900000000000000000000000000000000,0,'SOA',1);
--INSERT INTO 'mob_spawn_points' VALUES (mobid, mobname, polutils_name, groupid, pos_x, pos_y, pos_z, pos_rotation);
--Group 1
INSERT INTO `mob_spawn_points` VALUES (16953349,'Dread_Wanderer','Dread_Wanderer',1,-153,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953350,'Dread_Wanderer','Dread_Wanderer',1,-153,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953351,'Dread_Wanderer','Dread_Wanderer',1,-153,-10,80,0);
INSERT INTO `mob_spawn_points` VALUES (16953352,'Dread_Wanderer','Dread_Wanderer',1,-145,-10,60,0);
INSERT INTO `mob_spawn_points` VALUES (16953353,'Dread_Wanderer','Dread_Wanderer',1,-145,-10,65,0);
INSERT INTO `mob_spawn_points` VALUES (16953354,'Dread_Wanderer','Dread_Wanderer',1,-145,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953355,'Dread_Wanderer','Dread_Wanderer',1,-145,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953356,'Dread_Wanderer','Dread_Wanderer',1,-150,-10,60,0);
INSERT INTO `mob_spawn_points` VALUES (16953357,'Dread_Wanderer','Dread_Wanderer',1,-150,-10,65,0);
INSERT INTO `mob_spawn_points` VALUES (16953358,'Dread_Wanderer','Dread_Wanderer',1,-150,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953359,'Dread_Wanderer','Dread_Wanderer',1,-150,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953360,'Dread_Wanderer','Dread_Wanderer',1,-140,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953361,'Dread_Wanderer','Dread_Wanderer',1,-140,-10,80,0);
INSERT INTO `mob_spawn_points` VALUES (16953362,'Dread_Craver','Dread_Craver',2,-153,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953363,'Dread_Craver','Dread_Craver',2,-153,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953364,'Dread_Craver','Dread_Craver',2,-153,-10,80,0);
INSERT INTO `mob_spawn_points` VALUES (16953365,'Dread_Craver','Dread_Craver',2,-145,-10,60,0);
INSERT INTO `mob_spawn_points` VALUES (16953366,'Dread_Craver','Dread_Craver',2,-145,-10,65,0);
INSERT INTO `mob_spawn_points` VALUES (16953367,'Dread_Craver','Dread_Craver',2,-145,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953368,'Dread_Craver','Dread_Craver',2,-145,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953369,'Dread_Craver','Dread_Craver',2,-150,-10,60,0);
INSERT INTO `mob_spawn_points` VALUES (16953370,'Dread_Craver','Dread_Craver',2,-150,-10,65,0);
INSERT INTO `mob_spawn_points` VALUES (16953371,'Dread_Craver','Dread_Craver',2,-150,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953372,'Dread_Amoeba','Dread_Amoeba',3,-153,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953373,'Dread_Amoeba','Dread_Amoeba',3,-153,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953374,'Dread_Amoeba','Dread_Amoeba',3,-145,-10,60,0);
INSERT INTO `mob_spawn_points` VALUES (16953375,'Dread_Amoeba','Dread_Amoeba',3,-145,-10,65,0);
INSERT INTO `mob_spawn_points` VALUES (16953376,'Dread_Amoeba','Dread_Amoeba',3,-145,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953377,'Lost_Murex','Lost_Murex',4,-150,-10,70,0);
INSERT INTO `mob_spawn_points` VALUES (16953378,'Lost_Murex','Lost_Murex',4,-150,-10,75,0);
INSERT INTO `mob_spawn_points` VALUES (16953379,'Receptacle','Receptacle',5,-161.85,-11.7,78.8,0);
INSERT INTO `mob_spawn_points` VALUES (16953380,'Pawn','Pawn',6,-160,-11.7,78.8,0);
INSERT INTO `mob_spawn_points` VALUES (16953381,'Pawn','Pawn',6,-160,-11.7,78.8,0);
INSERT INTO `mob_spawn_points` VALUES (16953382,'Bishop','Bishop',7,-160,-11.7,78.8,0);
INSERT INTO `mob_spawn_points` VALUES (16953383,'Knight','Knight',8,-160,-11.7,78.8,0);
INSERT INTO `mob_spawn_points` VALUES (16953384,'Odin','Odin',9,110,0,320,127.5);
INSERT INTO `mob_spawn_points` VALUES (16953385,'Alexander','Odin',10,20,1.6,460,63.75);
--Group 2
INSERT INTO `mob_spawn_points` VALUES (16953386,'Dread_Seether','Dread_Seether',11,-180,-10,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953387,'Dread_Seether','Dread_Seether',11,-180,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953388,'Dread_Seether','Dread_Seether',11,-180,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953389,'Dread_Seether','Dread_Seether',11,-180,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953390,'Dread_Seether','Dread_Seether',11,-180,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953391,'Dread_Seether','Dread_Seether',11,-185,-10,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953392,'Dread_Seether','Dread_Seether',11,-185,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953393,'Dread_Seether','Dread_Seether',11,-185,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953394,'Dread_Seether','Dread_Seether',11,-185,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953395,'Dread_Seether','Dread_Seether',11,-190,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953396,'Dread_Seether','Dread_Seether',11,-190,-10,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953397,'Dread_Seether','Dread_Seether',11,-190,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953398,'Dread_Seether','Dread_Seether',11,-190,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953399,'Dread_Seether','Dread_Seether',11,-190,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953400,'Dread_Seether','Dread_Seether',11,-190,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953401,'Dread_Gorger','Dread_Gorger',12,-180,-10,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953402,'Dread_Gorger','Dread_Gorger',12,-180,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953403,'Dread_Gorger','Dread_Gorger',12,-180,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953404,'Dread_Gorger','Dread_Gorger',12,-180,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953405,'Dread_Gorger','Dread_Gorger',12,-185,-10,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953406,'Dread_Gorger','Dread_Gorger',12,-185,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953407,'Dread_Gorger','Dread_Gorger',12,-185,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953408,'Dread_Gorger','Dread_Gorger',12,-185,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953409,'Dread_Gorger','Dread_Gorger',12,-190,-10,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953410,'Dread_Gorger','Dread_Gorger',12,-190,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953411,'Dread_Clionid','Dread_Clionid',13,-180,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953412,'Dread_Clionid','Dread_Clionid',13,-180,-10,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953413,'Dread_Clionid','Dread_Clionid',13,-180,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953414,'Dread_Clionid','Dread_Clionid',13,-185,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953415,'Dread_Clionid','Dread_Clionid',13,-185,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953416,'Lost_Murex','Lost_Murex',4,-185,-10,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953417,'Lost_Murex','Lost_Murex',4,-185,-10,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953418,'Receptacle','Receptacle',5,-166,-10,267,0);
INSERT INTO `mob_spawn_points` VALUES (16953419,'Pawn','Pawn',6,-161,-10,267,0);
INSERT INTO `mob_spawn_points` VALUES (16953420,'Pawn','Pawn',6,-161,-10,267,0);
INSERT INTO `mob_spawn_points` VALUES (16953421,'Rook','Rook',14,-161,-10,267,0);
INSERT INTO `mob_spawn_points` VALUES (16953422,'Knight','Knight',8,-161,-10,267,0);
--Group 3
INSERT INTO `mob_spawn_points` VALUES (16953423,'Dread_Weeper','Dread_Weeper',15,-130,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953424,'Dread_Weeper','Dread_Weeper',15,-130,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953425,'Dread_Weeper','Dread_Weeper',15,-130,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953426,'Dread_Weeper','Dread_Weeper',15,-130,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953427,'Dread_Weeper','Dread_Weeper',15,-130,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953428,'Dread_Weeper','Dread_Weeper',15,-125,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953429,'Dread_Weeper','Dread_Weeper',15,-125,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953430,'Dread_Weeper','Dread_Weeper',15,-125,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953431,'Dread_Weeper','Dread_Weeper',15,-125,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953432,'Dread_Weeper','Dread_Weeper',15,-125,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953433,'Dread_Weeper','Dread_Weeper',15,-120,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953434,'Dread_Weeper','Dread_Weeper',15,-120,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953435,'Dread_Weeper','Dread_Weeper',15,-120,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953436,'Dread_Weeper','Dread_Weeper',15,-120,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953437,'Dread_Weeper','Dread_Weeper',15,-120,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953438,'Dread_Thinker','Dread_Thinker',16,-130,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953439,'Dread_Thinker','Dread_Thinker',16,-130,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953440,'Dread_Thinker','Dread_Thinker',16,-130,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953441,'Dread_Thinker','Dread_Thinker',16,-130,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953442,'Dread_Thinker','Dread_Thinker',16,-130,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953443,'Dread_Thinker','Dread_Thinker',16,-125,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953444,'Dread_Thinker','Dread_Thinker',16,-125,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953445,'Dread_Thinker','Dread_Thinker',16,-125,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953446,'Dread_Thinker','Dread_Thinker',16,-125,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953447,'Dread_Thinker','Dread_Thinker',16,-125,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953448,'Dread_Limule','Dread_Limule',17,-125,-20,370,0);
INSERT INTO `mob_spawn_points` VALUES (16953449,'Dread_Limule','Dread_Limule',17,-125,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953450,'Dread_Limule','Dread_Limule',17,-125,-20,360,0);
INSERT INTO `mob_spawn_points` VALUES (16953451,'Dread_Limule','Dread_Limule',17,-125,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953452,'Dread_Limule','Dread_Limule',17,-125,-20,350,0);
INSERT INTO `mob_spawn_points` VALUES (16953453,'Lost_Murex','Lost_Murex',4,-130,-20,365,0);
INSERT INTO `mob_spawn_points` VALUES (16953454,'Lost_Murex','Lost_Murex',4,-130,-20,355,0);
INSERT INTO `mob_spawn_points` VALUES (16953455,'Receptacle','Receptacle',5,-137,-20,380,0);
INSERT INTO `mob_spawn_points` VALUES (16953456,'Pawn','Pawn',6,-132,-20,380,0);
INSERT INTO `mob_spawn_points` VALUES (16953457,'Pawn','Pawn',6,-132,-20,380,0);
INSERT INTO `mob_spawn_points` VALUES (16953458,'Rook','Rook',14,-132,-20,380,0);
INSERT INTO `mob_spawn_points` VALUES (16953459,'Knight','Knight',8,-132,-20,380,0);
--Final Group
INSERT INTO `mob_spawn_points` VALUES (16953460,'Pawn','Pawn',6,-40,-32,270,0);
INSERT INTO `mob_spawn_points` VALUES (16953461,'Pawn','Pawn',6,-40,-32,265,0);
INSERT INTO `mob_spawn_points` VALUES (16953462,'Pawn','Pawn',6,-40,-32,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953463,'Pawn','Pawn',6,-40,-32,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953464,'Pawn','Pawn',6,-40,-32,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953465,'Pawn','Pawn',6,-40,-32,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953466,'Pawn','Pawn',6,-40,-32,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953467,'Pawn','Pawn',6,-40,-32,235,0);
INSERT INTO `mob_spawn_points` VALUES (16953468,'Rook','Rook',14,-45,-32,270,0);
INSERT INTO `mob_spawn_points` VALUES (16953469,'Knight','Knight',8,-45,-32,265,0);
INSERT INTO `mob_spawn_points` VALUES (16953470,'Bishop','Bishop',7,-45,-32,260,0);
INSERT INTO `mob_spawn_points` VALUES (16953471,'King','King',19,-45,-32,255,0);
INSERT INTO `mob_spawn_points` VALUES (16953472,'Queen','Queen',18,-45,-32,250,0);
INSERT INTO `mob_spawn_points` VALUES (16953473,'Bishop','Bishop',7,-45,-32,245,0);
INSERT INTO `mob_spawn_points` VALUES (16953474,'Knight','Knight',8,-45,-32,240,0);
INSERT INTO `mob_spawn_points` VALUES (16953475,'Rook','Rook',14,-45,-32,235,0);
-- Bonus Odin Group
INSERT INTO `mob_spawn_points` VALUES (16953476,'Valkyrie','Valkyrie',20.85,0,320,0,127.5);
INSERT INTO `mob_spawn_points` VALUES (16953477,'Valkyrie','Valkyrie',20,83,0,315,180.25);
INSERT INTO `mob_spawn_points` VALUES (16953478,'Valkyrie','Valkyrie',20,80,0,310,159.425);
INSERT INTO `mob_spawn_points` VALUES (16953479,'Valkyrie','Valkyrie',20,78,0,315,127.5);
INSERT INTO `mob_spawn_points` VALUES (16953480,'Valkyrie','Valkyrie',20,75,0,320,95.625);
INSERT INTO `mob_spawn_points` VALUES (16953481,'Valkyrie','Valkyrie',20,78,0,315,63.75);
INSERT INTO `mob_spawn_points` VALUES (16953482,'Valkyrie','Valkyrie',20,80,0,310,159.4);
INSERT INTO `mob_spawn_points` VALUES (16953483,'Valkyrie','Valkyrie',20,83,0,315,0);
INSERT INTO `mob_spawn_points` VALUES (16953484,'Thor','Thor',21,95,0,320,0);
INSERT INTO `mob_spawn_points` VALUES (16953485,'Fenrir','Fenrir',22,95,0,320,0);
-- Bonus Alexander Group
INSERT INTO `mob_spawn_points` VALUES (16953486,'Mighty_Gear','Mighty_Gear',23,20,1.6,470,63.75);
INSERT INTO `mob_spawn_points` VALUES (16953487,'Mighty_Gear','Mighty_Gear',23,15,1.6,465,31.875);
INSERT INTO `mob_spawn_points` VALUES (16953488,'Mighty_Gear','Mighty_Gear',23,10,1.6,460,0);
INSERT INTO `mob_spawn_points` VALUES (16953489,'Mighty_Gear','Mighty_Gear',23,15,1.6,455,211.025);
INSERT INTO `mob_spawn_points` VALUES (16953490,'Mighty_Gear','Mighty_Gear',23,20,1.6,450,180.25);
INSERT INTO `mob_spawn_points` VALUES (16953491,'Mighty_Gear','Mighty_Gear',23,25,1.6,455,159.45);
INSERT INTO `mob_spawn_points` VALUES (16953492,'Mighty_Gear','Mighty_Gear',23,30,1.6,460,127.5);
INSERT INTO `mob_spawn_points` VALUES (16953493,'Mighty_Gear','Mighty_Gear',23,25,1.6,465,95.25);
INSERT INTO `mob_spawn_points` VALUES (16953494,'Antigones','Antigones',24,24,1.6,470,63.75);
INSERT INTO `mob_spawn_points` VALUES (16953495,'Seleucus','Seleucus',25,24,1.6,460,0);
INSERT INTO `mob_spawn_points` VALUES (16953496,'Cassander','Cassander',26,20,1.6,450,180.25);
INSERT INTO `mob_spawn_points` VALUES (16953497,'Ptolemy','Ptolemy',27,30,1.6,460,127.5);
---------------------------------------
-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype (2=NM),
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
---------------------------------------
INSERT INTO `mob_pools` VALUES (8500,'Dread_Wanderer','Dread_Wanderer',255,0x0000560400000000000000000000000000000000,1,2,7,240,150,0,1,1,1,2,0,0,298,131,5,0,0,0,0,255,255);
INSERT INTO `mob_pools` VALUES (8501,'Dread_Craver','Dread_Craver',78,0x0000730400000000000000000000000000000000,1,1,8,240,100,0,1,1,1,2,0,0,501,157,6,0,0,0,0,707,78);
INSERT INTO `mob_pools` VALUES (8502,'Dread_Amoeba','Dread_Amoeba',5,0x00005C0900000000000000000000000000000000,4,8,7,240,100,0,1,1,1,2,0,0,0,129,0,0,2,0,0,5,5);
INSERT INTO `mob_pools` VALUES (8503,'Lost_Murex','Lost_Murex',187,0x00005D0900000000000000000000000000000000,4,3,11,240,100,0,1,1,1,2,0,0,0,1153,5,0,2,0,0,187,187);
INSERT INTO `mob_pools` VALUES (8504,'Receptacle','Receptacle',181,0x00004E0400000000000000000000000000000000,1,1,7,240,100,0,1,1,1,2,0,0,6,131,0,0,0,0,0,181,181);
INSERT INTO `mob_pools` VALUES (8505,'Pawn','Pawn',450,0x0000A40800000000000000000000000000000000,2,5,12,360,100,0,1,1,1,2,0,0,0,133,0,0,158,0,0,450,450);
INSERT INTO `mob_pools` VALUES (8506,'Bishop','Bishop',450,0x0000A50800000000000000000000000000000000,4,1,12,240,100,0,1,1,1,2,0,0,0,1157,4,0,153,0,0,841,450);
INSERT INTO `mob_pools` VALUES (8507,'Knight','Knight',450,0x0000A20800000000000000000000000000000000,5,4,2,240,100,0,1,1,1,2,0,0,0,133,4,0,157,0,0,899,450);
INSERT INTO `mob_pools` VALUES (8508,'Odin','Odin',41,0x0000250700000000000000000000000000000000,8,4,1,240,100,0,1,1,0,18,0,32,0,1179,0,0,5,0,0,41,41);
INSERT INTO `mob_pools` VALUES (8509,'Alexander','Alexander',33,0x00002A0700000000000000000000000000000000,3,3,11,240,100,0,1,1,1,2,0,32,1,1179,0,0,214,0,0,784,33);
INSERT INTO `mob_pools` VALUES (8510,'Dread_Seether','Dread_Seether',220,0x00005D0400000000000000000000000000000000,1,7,7,240,100,0,1,1,1,2,0,32,765,135,0,0,114,0,0,220,220);
INSERT INTO `mob_pools` VALUES (8511,'Dread_Gorger','Dread_Gorger',138,0x00006D0400000000000000000000000000000000,1,1,3,240,100,0,1,1,1,2,0,32,290,157,6,0,0,0,0,137,138);
INSERT INTO `mob_pools` VALUES (8512,'Dread_Clionid','Dread_Clionid',65,0x00004C0900000000000000000000000000000000,4,4,12,240,100,0,1,1,1,2,0,0,0,129,0,0,2,0,0,65,65);
INSERT INTO `mob_pools` VALUES (8513,'Rook','Rook',450,0x0000A30800000000000000000000000000000000,4,2,11,240,100,0,1,1,1,2,0,0,0,133,0,0,156,0,0,882,450);
INSERT INTO `mob_pools` VALUES (8514,'Dread_Weeper','Dread_Weeper',256,0x00005B0400000000000000000000000000000000,1,1,7,240,100,0,1,1,1,2,0,0,765,135,0,0,0,0,0,256,256);
INSERT INTO `mob_pools` VALUES (8515,'Dread_Thinker','Dread_Thinker',241,0x0000680400000000000000000000000000000000,1,1,7,240,100,0,1,1,1,2,0,32,290,157,6,0,0,0,0,706,241);
INSERT INTO `mob_pools` VALUES (8516,'Dread_Limule','Dread_Limule',173,0x00004D0900000000000000000000000000000000,4,3,12,240,100,0,1,1,1,2,0,0,0,643,0,0,2,0,0,173,173);
INSERT INTO `mob_pools` VALUES (8517,'Queen','Queen',450,0x00005E0900000000000000000000000000000000,4,5,12,240,100,0,1,1,1,2,0,0,7,647,12,0,160,0,0,947,450);
INSERT INTO `mob_pools` VALUES (8518,'King','King',450,0x00005F0900000000000000000000000000000000,4,5,12,240,100,0,1,1,1,2,0,0,7,135,0,0,163,0,0,992,450);
INSERT INTO `mob_pools` VALUES (8519,'Valkyrie','Valkyrie',359,0x0500320200000000000000000000000000000000,14,14,8,240,100,0,1,0,1,0,0,0,0,1155,0,0,0,0,0,359,359);
INSERT INTO `mob_pools` VALUES (8520,'Thor','Thor',43,0x00001E0300000000000000000000000000000000,4,4,12,240,100,0,1,1,1,18,0,0,0,3,0,0,0,0,0,43,43);
INSERT INTO `mob_pools` VALUES (8521,'Fenrir','Fenrir',381,0x0000110000000000000000000000000000000000,8,4,3,280,100,0,0,0,0,0,0,32,0,0,0,0,0,0,0,381,381);
INSERT INTO `mob_pools` VALUES (8522,'Mighty_Gear','Mighty_Gear',119,0x00001B0700000000000000000000000000000000,1,1,12,240,100,0,1,1,1,2,0,0,1,1153,0,0,0,0,0,120,119);
INSERT INTO `mob_pools` VALUES (8523,'Antigones','Antigones',63,0x00001F0700000000000000000000000000000000,1,1,6,320,100,1024,1,0,1,2,0,0,1,135,0,0,0,0,0,1002,63);
INSERT INTO `mob_pools` VALUES (8524,'Seleucus','Seleucus',63,0x0000200700000000000000000000000000000000,4,4,12,240,100,0,1,1,1,2,0,0,0,1157,0,0,281,0,0,978,63);
INSERT INTO `mob_pools` VALUES (8525,'Cassander','Cassander',63,0x00001D0700000000000000000000000000000000,4,4,12,240,100,0,0,0,1,2,0,0,1,133,0,0,260,0,0,932,63);
INSERT INTO `mob_pools` VALUES (8526,'Ptolemy','Ptolemy',63,0x0000210700000000000000000000000000000000,1,9,6,320,100,0,1,0,1,2,0,0,0,129,0,0,0,0,0,63,63);

---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
--------------------------------------
INSERT INTO `mob_groups` VALUES (1,8500,43,'Dread_Wanderer',0,128,4067,10000,1000,135,135,0);
INSERT INTO `mob_groups` VALUES (2,8501,43,'Dread_Craver',0,128,4067,11000,1000,136,136,0);
INSERT INTO `mob_groups` VALUES (3,8502,43,'Dread_Amoeba',0,128,4067,12000,1000,137,137,0);
INSERT INTO `mob_groups` VALUES (4,8503,43,'Lost_Murex',0,128,4068,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (5,8504,43,'Receptacle',0,128,4069,14000,1000,139,139,0);
INSERT INTO `mob_groups` VALUES (6,8505,43,'Pawn',0,128,4075,15000,1000,140,140,0);
INSERT INTO `mob_groups` VALUES (7,8506,43,'Bishop',0,128,4075,18000,1000,143,143,0);
INSERT INTO `mob_groups` VALUES (8,8507,43,'Knight',0,128,4075,17000,1000,142,142,0);
INSERT INTO `mob_groups` VALUES (9,8508,43,'Odin',0,128,4073,100000,1000,144,144,0);
INSERT INTO `mob_groups` VALUES (10,8509,43,'Alexander',0,128,4074,110000,1000,145,145,0);
INSERT INTO `mob_groups` VALUES (11,8510,43,'Dread_Seether',0,128,4070,11000,1000,136,136,0);
INSERT INTO `mob_groups` VALUES (12,8511,43,'Dread_Gorger',0,128,4070,12000,1000,137,137,0);
INSERT INTO `mob_groups` VALUES (13,8512,43,'Dread_Clionid',0,128,4070,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (14,8513,43,'Rook',0,128,4075,16000,1000,141,141,0);
INSERT INTO `mob_groups` VALUES (15,8514,43,'Dread_Weeper',0,128,4071,12000,1000,137,137,0);
INSERT INTO `mob_groups` VALUES (16,8515,43,'Dread_Thinker',0,128,4071,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (17,8516,43,'Dread_Limule',0,128,4071,14000,1000,139,139,0);
INSERT INTO `mob_groups` VALUES (18,8517,43,'Queen',0,128,4076,120000,1000,145,145,0);
INSERT INTO `mob_groups` VALUES (19,8518,43,'King',0,128,4076,150000,1000,140,140,0);
INSERT INTO `mob_groups` VALUES (20,8519,43,'Valkyrie',0,128,4072,10000,1000,135,135,0);
INSERT INTO `mob_groups` VALUES (21,8520,43,'Thor',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (22,8521,43,'Fenrir',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (23,8522,43,'Mighty_Gear',0,128,4072,10000,1000,135,135,0);
INSERT INTO `mob_groups` VALUES (24,8523,43,'Gilded_Chariot',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (25,8524,43,'Bowed_Chariot',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (26,8525,43,'Horned_Chariot',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (27,8526,43,'Armed_Chariot',0,128,4072,13000,1000,138,138,0);
INSERT INTO `mob_groups` VALUES (28,8527,43,'Antigones',0,128,4072,14000,1000,139,139,0);
INSERT INTO `mob_groups` VALUES (29,8528,43,'Seleucus',0,128,4072,14000,1000,139,139,0);
INSERT INTO `mob_groups` VALUES (30,8529,43,'Cassander',0,128,4072,14000,1000,139,139,0);
INSERT INTO `mob_groups` VALUES (31,8530,43,'Ptolemy',0,128,4072,14000,1000,139,139,0);
---------------------------------------
-- Drop LIST 4067+
-- (dropId, dropType, groupId, groupRate, itemId, itemRate)
---------------------------------------
-- Group 1
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15711,@URARE); -- Ares' Sollerets
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15715,@URARE); -- Skadi's Jambeaux
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15719,@URARE); -- Usukane Sune-Ate
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15723,@URARE); -- Marduk's Crackows
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15727,@URARE); -- Morrigan's Pigaches
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15733,@URARE); -- Askar Gambieras
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15734,@URARE); -- Denali Gamashes
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15735,@URARE); -- Goliard Clogs
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15661,@URARE); -- Homam Gambieras
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,15662,@URARE); -- Nashira Crackows
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,9239,@COMMON); -- A.Voucher: Feet
INSERT INTO `mob_droplist` VALUES (4067,2,0,1000,9239,0); -- A.Voucher: Feet
INSERT INTO `mob_droplist` VALUES (4067,4,0,1000,9239,0); -- A.Voucher: Feet
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14961,@URARE); -- Ares' Gauntlets
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14965,@URARE); -- Skadi's Bazubands
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14969,@URARE); -- Usukane Gote
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14973,@URARE); -- Marduk's Dastanas
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14977,@URARE); -- Morrigan's Cuffs
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14983,@URARE); -- Askar Manopolas
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14984,@URARE); -- Denali Wristbands
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14985,@URARE); -- Goliard Cuffs
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14905,@URARE); -- Homam Manopolas
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,14906,@URARE); -- Nashira Gages
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,9237,@COMMON); -- A. Voucher: Hands
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4067,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Murexes
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,9271,@VCOMMON); -- Abdhaljs Fiber
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,9270,@VCOMMON); -- Abdhaljs Metal
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4068,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Recepticles
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,9782,@VCOMMON); -- Abdhaljs Nugget
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4069,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Group 2
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14961,@URARE); -- Ares' Gauntlets
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14965,@URARE); -- Skadi's Bazubands
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14969,@URARE); -- Usukane Gote
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14973,@URARE); -- Marduk's Dastanas
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14977,@URARE); -- Morrigan's Cuffs
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14983,@URARE); -- Askar Manopolas
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14984,@URARE); -- Denali Wristbands
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14985,@URARE); -- Goliard Cuffs
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14905,@URARE); -- Homam Manopolas
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,14906,@URARE); -- Nashira Gages
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,9237,@COMMON); -- A. Voucher: Hands
INSERT INTO `mob_droplist` VALUES (4070,2,0,1000,9237,0); -- A. Voucher: Hands
INSERT INTO `mob_droplist` VALUES (4070,4,0,1000,9237,0); -- A. Voucher: Hands
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15625,@URARE); -- Ares' Flanchard
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15629,@URARE); -- Skadi's Chausses
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15633,@URARE); -- Usukane Hizayoroi
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15637,@URARE); -- Marduk's Shalwar
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15641,@URARE); -- Morrigan's Slops
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15647,@URARE); -- Askar Dirs
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15648,@URARE); -- Denali Kecks
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15649,@URARE); -- Goliard Trews
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15576,@URARE); -- Homam Cosiales
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,15577,@URARE); -- Nashira Serawels
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,9238,@COMMON); -- A. Voucher: Legs
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4070,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Group 3
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15625,@URARE); -- Ares' Flanchard
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15629,@URARE); -- Skadi's Chausses
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15633,@URARE); -- Usukane Hizayoroi
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15637,@URARE); -- Marduk's Shalwar
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15641,@URARE); -- Morrigan's Slops
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15647,@URARE); -- Askar Dirs
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15648,@URARE); -- Denali Kecks
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15649,@URARE); -- Goliard Trews
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15576,@URARE); -- Homam Cosiales
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15577,@URARE); -- Nashira Serawels
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,9238,@COMMON); -- A. Voucher: Legs
INSERT INTO `mob_droplist` VALUES (4071,2,0,1000,9238,0); -- A. Voucher: Legs
INSERT INTO `mob_droplist` VALUES (4071,4,0,1000,9238,0); -- A. Voucher: Legs
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16084,@URARE); -- Ares' Mask
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16088,@URARE); -- Skadi's Visor
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16092,@URARE); -- Usukane Somen
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16096,@URARE); -- Marduk's Tiara
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16100,@URARE); -- Morrigan's Coron.
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16106,@URARE); -- Askar Zucchetto
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16107,@URARE); -- Denali Bonnet
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,16108,@URARE); -- Goliard Chapeau
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15240,@URARE); -- Homam Zucchetto
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,15241,@URARE); -- Nashira Turban
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,9235,@COMMON); -- A. Voucher: Head
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4071,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Main Odin/Alex Group
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,9783,@VCOMMON); -- Abdhaljs Gem
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4072,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Odin
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,26204,@VCOMMON); -- Sulevia's Ring
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,26205,@VCOMMON); -- Meghanda Ring
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,26206,@VCOMMON); -- Hizamaru Ring
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,26207,@VCOMMON); -- Inyanga Ring
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,26208,@VCOMMON); -- Jhakri Ring
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,9784,@VCOMMON); -- Abdhaljs Anima
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4073,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Alexander
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,26209,@VCOMMON); -- Ayanmo Ring
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,26210,@VCOMMON); -- Tali'ah Ring
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,26211,@VCOMMON); -- Flammu Ring
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,26212,@VCOMMON); -- Mummu Ring
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,26213,@VCOMMON); -- Mallquis Ring
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,9784,@VCOMMON); -- Abdhaljs Anima
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4074,0,0,1000,22214,@VRARE); -- Tokko Grip
-- Final Group grunts
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16084,@URARE); -- Ares' Mask
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16088,@URARE); -- Skadi's Visor
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16092,@URARE); -- Usukane Somen
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16096,@URARE); -- Marduk's Tiara
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16100,@URARE); -- Morrigan's Coron.
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16106,@URARE); -- Askar Zucchetto
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16107,@URARE); -- Denali Bonnet
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,16108,@URARE); -- Goliard Chapeau
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,15240,@URARE); -- Homam Zucchetto
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,15241,@URARE); -- Nashira Turban
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,9235,@COMMON); -- A. Voucher: Head
INSERT INTO `mob_droplist` VALUES (4075,2,0,1000,9235,0); -- A. Voucher: Head
INSERT INTO `mob_droplist` VALUES (4075,4,0,1000,9235,0); -- A. Voucher: Head
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14546,@URARE); -- Ares' Cuirass
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14550,@URARE); -- Skadi's Cuirie
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14554,@URARE); -- Usukane Haramaki
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14558,@URARE); -- Marduk's Jubbah
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14562,@URARE); -- Morrigan's Robe
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14568,@URARE); -- Askar Korazin
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14569,@URARE); -- Denali Jacket
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14570,@URARE); -- Goliard Saio
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14488,@URARE); -- Homam Corazza
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,14489,@URARE); -- Nashira Manteel
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,9236,@COMMON); -- A. Voucher: Body
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21515,@URARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4075,0,0,1000,22214,@VRARE); -- Tokko Grip
-- King/Queen
INSERT INTO `mob_droplist` VALUES (4076,2,0,1000,9785,1000); -- Abdhaljs Matter (100% Drop)
INSERT INTO `mob_droplist` VALUES (4076,2,0,1000,9785,@URARE); -- Abdhaljs Matter
INSERT INTO `mob_droplist` VALUES (4076,2,0,1000,9236,0); -- A. Voucher: Body
INSERT INTO `mob_droplist` VALUES (4076,3,0,1000,9236,0); -- A. Voucher: Body
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21515,@VRARE); -- Tokko Knuckle
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21561,@VRARE); -- Tokko Knife
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21617,@VRARE); -- Tokko Sword
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21670,@VRARE); -- Tokko Claymore
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21718,@VRARE); -- Tokko Axe
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21775,@VRARE); -- Tokko Chopper
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21826,@VRARE); -- Tokko Scythe
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21879,@VRARE); -- Tokko Lance
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21918,@VRARE); -- Tokko Katana
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,21971,@VRARE); -- Tokko Tachi
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,22027,@VRARE); -- Tokko Rod
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,22082,@VRARE); -- Tokko Staff
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,22108,@VRARE); -- Tokko Bow
INSERT INTO `mob_droplist` VALUES (4076,0,0,1000,22214,@VRARE); -- Tokko Grip
---------------------------------------
--Mob skills
-- mob_skill_id, mob_anim_id, mob_skill_name, 
-- mob_skill_aoe, mob_skill_distance, mob_anim_time, mob_prepare_time, 
-- mob_valid_targets, mob_skill_flag, mob_skill_param, knockback, primary_sc, secondary_sc, tertiary_sc
---------------------------------------
REPLACE INTO `mob_skills` VALUES (2120,1441,'ofnir',1,7.0,2000,1500,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2121,1446,'valfodr',1,7.0,2000,1500,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2122,1444,'yggr',1,7.0,2000,1500,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2123,1442,'gagnrath',1,7.0,2000,1500,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2124,1445,'sanngetall',1,7.0,2000,1500,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2125,1443,'geirrothr',0,7.0,2000,1500,1,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2126,1447,'zantetsuken',1,20.0,2000,1000,4,0,0,0,0,0,0);
REPLACE INTO `mob_skills` VALUES (2912,1447,'zantetsuken_kai',1,20.0,2000,1000,4,0,0,0,0,0,0);
---------------------------------------
--Skill Lists
--skill_list_name,skill_list_id,mob_skill_id
---------------------------------------
-- Odin
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2120);
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2121);
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2122);
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2123);
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2124);
REPLACE INTO `mob_skill_lists` VALUES ('Odin',41,2125);