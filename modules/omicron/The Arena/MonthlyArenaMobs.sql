---------------------------------------
--Zone 71 The_Colloseum Custom Arena
-- !pos -600 0 40
---------------------------------------
-- Spawn Points
---------------------------------------
--March Monsters
REPLACE INTO `mob_spawn_points` VALUES (17068033,'Lucky_Rabbit','Lucky Rabbit',1,40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068034,'Lucky_Tink','Lucky Tink',2,40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068035,'Leprechan','Leprechan?',3,-40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068036,'Albatross','Albatross',4,-40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068037,'Blarney','Blarney',5,40,0,350,63.75);
--April Monsters
REPLACE INTO `mob_spawn_points` VALUES (17068038,'Annoyed_Avian','Annoyed Avian',1,40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068039,'Furry_Thief','Furry Thief',2,40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068040,'Sad_Egghunter','Sad Egghunter',3,-40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068041,'Proto_Egg','Proto Egg',4,-40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068042,'Easter_Turkey','Easter_Turkey',5,40,0,350,63.75);

---------------------------------------
-- Mob Pools
---------------------------------------
-- (poolid,name,packet_name,familyid,modelid,
-- mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,
-- behavior,aggro,true_detection,links,mobtype (2=NM),
-- immunity,name_prefix,flag,entityflags,
--animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
---------------------------------------
--  March Monsters
REPLACE INTO `mob_pools` VALUES (8145,'Lucky_Rabbit','Lucky_Rabbit',206,0x00000C0100000000000000000000000000000000,6,2,7,240,100,0,1,1,1,2,0,0,4385,135,0,0,0,0,0,206,206);
REPLACE INTO `mob_pools` VALUES (8146,'Lucky_Tink','Lucky_Tink',195,0x0000EE0700000000000000000000000000000000,3,3,12,240,100,0,1,0,0,2,7,0,0,0,0,0,635,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (8147,'Leprechan','Leprechan?',243,0x0000A10400000000000000000000000000000000,6,6,2,240,100,0,1,0,1,2,0,0,6,133,0,0,0,0,0,243,243);
REPLACE INTO `mob_pools` VALUES (8148,'Albatross','Albatross',460,0x0000140A00000000000000000000000000000000,8,5,7,240,100,0,0,0,1,2,0,0,1,129,0,0,633,0,0,460,460);
REPLACE INTO `mob_pools` VALUES (8149,'Blarney','Blarney',237,0x0000940700000000000000000000000000000000,7,12,0,7,240,0,1,0,1,2,0,0,7,135,0,0,0,0,0,237,237);
--April Monsters
REPLACE INTO `mob_pools` VALUES (8150,'Annoyed_Avian','Annoyed_Avian',454,0x0000230A00000000000000000000000000000000,2,5,2,240,100,0,1,1,1,2,0,0,0,135,0,0,0,0,0,454,454);
REPLACE INTO `mob_pools` VALUES (8151,'Furry_Thief','Furry_Thief',206,0x00000C0100000000000000000000000000000000,6,13,7,240,100,0,1,0,0,2,7,0,0,0,0,0,38,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (8152,'Sad_Egghunter','Sad_Egghunter',199,0x0000C70600000000000000000000000000000000,6,1,2,240,100,0,1,0,1,2,0,0,6,133,0,0,0,0,0,243,243);
REPLACE INTO `mob_pools` VALUES (8153,'Proto_Egg','Proto_Egg',272,0x0000850400000000000000000000000000000000,7,5,7,240,100,0,0,0,1,2,0,0,1,129,0,0,602,0,0,460,460);
REPLACE INTO `mob_pools` VALUES (8154,'Easter_Turkey','Easter_Turkey',125,0x0000500100000000000000000000000000000000,2,8,0,7,240,0,1,0,1,2,0,0,7,135,0,0,618,0,0,237,237);
---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
--------------------------------------
-- March Monsters
REPLACE INTO `mob_groups` VALUES (1,8145,71,'Lucky_Rabbit',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (2,8146,71,'Lucky_Tink',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (3,8147,71,'Leprechan',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (4,8148,71,'Albatross',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (5,8149,71,'Blarney',0,128,0,200000,5000,133,133,0);
-- April Monsters
REPLACE INTO `mob_groups` VALUES (6,8150,71,'Annoyed_Avian',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (7,8151,71,'Furry_Thief',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (8,8152,71,'Sad_Egghunter',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (9,8153,71,'Proto_Egg',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (10,8154,71,'Easter_Turkey',0,128,0,200000,5000,133,133,0);
---------------------------------------
-- Spawn Mods (poolid, modid, value, is_mob_mod)
---------------------------------------
-- March Monsters
REPLACE INTO `mob_pool_mods` VALUES (8145,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8146,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8147,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8148,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8149,2,0,1); -- GIL_MAX: 0
-- April Monsters
REPLACE INTO `mob_pool_mods` VALUES (8150,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8151,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8152,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8153,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8154,2,0,1); -- GIL_MAX: 0
