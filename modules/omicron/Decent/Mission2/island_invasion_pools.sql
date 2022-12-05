---------------------------------------
-- Abdhaljs Isle_Purgonorgo (Zone 44) 
-- ID = (<zone id> x 4096) + 16777217 for first usable ID
---------------------------------------
--INSERT INTO 'mob_spawn_points' VALUES (mobid, mobname, polutils_name, groupid, pos_x, pos_y, pos_z, pos_rotation);
--HUMANOID GROUP West Beach Invasion
--Squad 1
INSERT INTO `mob_spawn_points` VALUES (16957987,'Dread_Tarutaru','Dread Taruraru',31,297,-0.1,266,0); -- Aquarian Caster 17162244
INSERT INTO `mob_spawn_points` VALUES (16957988,'Dread_Mithra','Dread Mithra',32,298,-0.1,265,0); -- Wildcat Volunteer 17162287
INSERT INTO `mob_spawn_points` VALUES (16957989,'Dread_Galka','Dread Galka',33,299,-0.1,264,0); -- Invincible Shield 17138137
INSERT INTO `mob_spawn_points` VALUES (16957990,'Dread_Hume','Dread Hume',34,300,-0.1,263,0); -- 3rd Legionaire 17138138
INSERT INTO `mob_spawn_points` VALUES (16957991,'Dread_Elvaan','Dread Elvaan',35,296,-0.1,262,0); -- Aragoneu Knight 17109445
INSERT INTO `mob_spawn_points` VALUES (16957992,'Lost_Craver','Lost Craver',36,295,-0.1,260,0); -- Lost Craver
INSERT INTO `mob_spawn_points` VALUES (16957993,'Lost_Gorger','Lost Gorger',37,295,-0.1,260,0); -- Lost Gorger
INSERT INTO `mob_spawn_points` VALUES (16957994,'Lost_Thinker','Lost Thinker',38,295,-0.1,260,0); -- Lost Thinker
INSERT INTO `mob_spawn_points` VALUES (16957995,'Teodor','Teodor',39,295,-0.1,260,190); -- Teodor (mob id 17838290)
---------------------------------------
-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype (2=NM),
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
---------------------------------------
--Humanoid Group
INSERT INTO `mob_pools` VALUES (8030,'Dread_Tarutaru','Dread_Taruraru',153,0x01000D0512101420143014401450E36027701B80,4,5,0,170,100,0,1,0,0,10,0,0,0,0,0,0,490,0,0,153,153);
INSERT INTO `mob_pools` VALUES (8031,'Dread_Mithra','Dread_Mithra',151,0x010006078910892089300F400F506F6000702980,1,1,0,190,100,0,1,0,0,10,0,0,0,0,8,0,0,0,0,151,151);
INSERT INTO `mob_pools` VALUES (8032,'Dread_Galka','Dread_Galka',146,0x0100030802100220023015400250616121700080,1,1,5,240,100,0,1,0,0,10,0,0,0,0,0,0,0,0,0,146,146);
INSERT INTO `mob_pools` VALUES (8033,'Dread_Hume','Dread_Hume',149,0x01000A01DE10DE208A308A408A50526021703680,11,11,5,240,100,0,1,0,0,10,0,0,0,0,0,0,7,0,0,149,149);
INSERT INTO `mob_pools` VALUES (8034,'Dread_Elvaan','Dread_Elvaan',145,0x010009030C100C200C300C400C50FB601B700080,7,7,3,240,100,0,1,0,0,10,0,0,0,0,0,0,4,0,0,145,145);
INSERT INTO `mob_pools` VALUES (8035,'Lost_Craver','Lost_Craver',78,0x00006E0400000000000000000000000000000000,1,1,8,240,100,0,1,1,1,10,0,0,0,131,13,0,0,0,0,78,78);
INSERT INTO `mob_pools` VALUES (8036,'Lost_Gorger','Lost_Gorger',138,0x00006B0400000000000000000000000000000000,8,8,3,240,100,0,1,1,1,10,0,0,0,131,13,0,5,0,0,137,138);
INSERT INTO `mob_pools` VALUES (8037,'Lost_Thinker','Lost_Thinker',241,0x0000670400000000000000000000000000000000,1,1,7,240,100,0,1,1,1,10,0,0,0,131,13,0,0,0,0,241,241);
INSERT INTO `mob_pools` VALUES (8038,'Teodor','Teodor',149,0x00001F0C00000000000000000000000000000000,4,6,3,240,100,0,1,1,1,10,0,0,0,0,0,0,399,0,0,1101,149);
---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
--------------------------------------
INSERT INTO `mob_groups` VALUES (31,8030,44,'Dread_Tarutaru',0,128,0,14000,1000,110,110,0);
INSERT INTO `mob_groups` VALUES (32,8031,44,'Dread_Mithra',0,128,0,14000,1000,110,110,0);
INSERT INTO `mob_groups` VALUES (33,8032,44,'Dread_Galka',0,128,0,14000,1000,110,110,0);
INSERT INTO `mob_groups` VALUES (34,8033,44,'Dread_Hume',0,128,0,14000,1000,110,110,0);
INSERT INTO `mob_groups` VALUES (35,8034,44,'Dread_Elvaan',0,128,0,14000,1000,110,110,0);
INSERT INTO `mob_groups` VALUES (36,8035,44,'Lost_Craver',0,128,0,180000,1000,113,113,0);
INSERT INTO `mob_groups` VALUES (37,8036,44,'Lost_Gorger',0,128,0,180000,1000,113,113,0);
INSERT INTO `mob_groups` VALUES (38,8037,44,'Lost_Thinker',0,128,0,180000,1000,113,113,0);
INSERT INTO `mob_groups` VALUES (39,8038,44,'Teodor',0,128,0,200000,2000,122,122,0);
