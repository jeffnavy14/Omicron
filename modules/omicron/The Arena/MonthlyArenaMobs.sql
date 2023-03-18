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
---------------------------------------
-- Mob Pools
---------------------------------------
-- (poolid,name,packet_name,familyid,modelid,
-- mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,
-- behavior,aggro,true_detection,links,mobtype (2=NM),
-- immunity,name_prefix,flag,entityflags,
--animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
-- March Monsters
REPLACE INTO `mob_pools` VALUES (8145,'Lucky_Rabbit','Lucky_Rabbit',206,0x00000C0100000000000000000000000000000000,6,2,7,240,100,0,1,1,1,2,0,0,4385,135,0,0,0,0,0,206,206);
REPLACE INTO `mob_pools` VALUES (8146,'Lucky_Tink','Lucky_Tink',195,0x0000EE0700000000000000000000000000000000,3,3,12,240,100,0,1,0,0,2,7,0,0,0,0,0,635,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (8147,'Leprechan','Leprechan?',243,0x0000A10400000000000000000000000000000000,6,6,2,240,100,0,1,0,1,2,0,0,6,133,0,0,0,0,0,243,243);
REPLACE INTO `mob_pools` VALUES (8148,'Albatross','Albatross',460,0x0000140A00000000000000000000000000000000,8,5,7,240,100,0,0,0,1,2,0,0,1,129,0,0,633,0,0,460,460);
REPLACE INTO `mob_pools` VALUES (8149,'Blarney','Blarney',237,0x0000940700000000000000000000000000000000,7,12,0,7,240,0,1,0,1,2,0,0,7,135,0,0,0,0,0,237,237);
---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
--------------------------------------
REPLACE INTO `mob_groups` VALUES (1,8145,71,'Lucky_Rabbit',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (2,8146,71,'Lucky_Tink',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (3,8147,71,'Leprechan',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (4,8148,71,'Albatross',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (5,8149,71,'Blarney',0,128,0,200000,5000,133,133,0);
---------------------------------------
-- Spawn Mods (poolid, modid, value, is_mob_mod)
---------------------------------------
REPLACE INTO `mob_pool_mods` VALUES (8145,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8146,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8147,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8148,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8149,2,0,1); -- GIL_MAX: 0
