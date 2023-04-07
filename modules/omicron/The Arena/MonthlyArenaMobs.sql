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
REPLACE INTO `mob_spawn_points` VALUES (17068038,'Annoyed_Avian','Annoyed Avian',6,40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068039,'Furry_Thief','Furry Thief',7,40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068040,'Sad_Egghunter','Sad Egghunter',8,-40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068041,'Proto_Egg','Proto Egg',9,-40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068042,'Easter_Turkey','Easter Turkey',10,40,0,350,63.75);
--April Adds
REPLACE INTO `mob_spawn_points` VALUES (17068043,'Berated_Birdie','Berated Birdie',11,40,0,355,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068044,'Berated_Birdie','Berated Birdie',11,40,0,355,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068045,'Berated_Birdie','Berated Birdie',11,40,0,340,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068046,'Berated_Birdie','Berated Birdie',11,40,0,360,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068047,'Berated_Birdie','Berated Birdie',11,40,0,340,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068048,'Berated_Birdie','Berated Birdie',11,50,0,350,127.50);
REPLACE INTO `mob_spawn_points` VALUES (17068049,'Berated_Birdie','Berated Birdie',11,40,0,360,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068050,'Berated_Birdie','Berated Birdie',11,40,0,340,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068051,'Berated_Birdie','Berated Birdie',11,50,0,350,127.50);
REPLACE INTO `mob_spawn_points` VALUES (17068052,'Berated_Birdie','Berated Birdie',11,30,0,360,0);
--May Monsters
REPLACE INTO `mob_spawn_points` VALUES (17068053,'Leafy','Leafy',12,40,0,210,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068054,'Unhappy_Bloom','Unhappy Bloom',13,40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068055,'Queen_Bee','Queen Bee',14,-40,0,-210,63.75); -- Bztavian w/ 2 adds, resummons @ 60/30
REPLACE INTO `mob_spawn_points` VALUES (17068056,'Flutterfly','Flutterfly',15,-40,0,210,180.25); -- Twitherym swarm TP spam @ 90/70/50/30/10
REPLACE INTO `mob_spawn_points` VALUES (17068057,'Blooming_Bark','Blooming Bark',16,40,0,350,63.75); -- Treant will have sapling adds 3 pop @ 90/60/30
--May Adds
REPLACE INTO `mob_spawn_points` VALUES (17068058,'Bloomer','Bloomer',17,35,0,210,0); -- t1 Adds
REPLACE INTO `mob_spawn_points` VALUES (17068059,'Sprout','Sprout',18,45,0,210,0);
REPLACE INTO `mob_spawn_points` VALUES (17068060,'Bee_Guard','Bee Guard',19,-40,0,-210,63.75); -- t3 Adds
REPLACE INTO `mob_spawn_points` VALUES (17068061,'Bee_Guard','Bee Guard',19,-40,0,-210,63.75);
REPLACE INTO `mob_spawn_points` VALUES (17068062,'Sprouted_Seed','Sprouted Seed',20,30,0,340,180.25); -- t5 adds
REPLACE INTO `mob_spawn_points` VALUES (17068063,'Sprouted_Seed','Sprouted Seed',20,30,0,350,127.5);
REPLACE INTO `mob_spawn_points` VALUES (17068064,'Sprouted_Seed','Sprouted Seed',20,30,0,360,0);
REPLACE INTO `mob_spawn_points` VALUES (17068065,'Sprouted_Seed','Sprouted Seed',20,30,0,340,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068066,'Sprouted_Seed','Sprouted Seed',20,30,0,350,127.5);
REPLACE INTO `mob_spawn_points` VALUES (17068067,'Sprouted_Seed','Sprouted Seed',20,30,0,360,0);
REPLACE INTO `mob_spawn_points` VALUES (17068068,'Sprouted_Seed','Sprouted Seed',20,30,0,340,180.25);
REPLACE INTO `mob_spawn_points` VALUES (17068069,'Sprouted_Seed','Sprouted Seed',20,30,0,350,127.5);
REPLACE INTO `mob_spawn_points` VALUES (17068070,'Sprouted_Seed','Sprouted Seed',20,30,0,360,0);


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
REPLACE INTO `mob_pools` VALUES (8149,'Blarney','Blarney',237,0x0000940700000000000000000000000000000000,7,12,2,240,100,0,1,0,1,2,0,0,7,135,0,0,0,0,0,237,237);
-- April Monsters
REPLACE INTO `mob_pools` VALUES (8150,'Annoyed_Avian','Annoyed_Avian',454,0x0000230A00000000000000000000000000000000,2,5,2,240,100,0,1,1,1,2,0,0,0,135,0,0,0,0,0,454,454);
REPLACE INTO `mob_pools` VALUES (8151,'Furry_Thief','Furry_Thief',206,0x00000C0100000000000000000000000000000000,6,13,7,240,100,0,1,1,1,2,7,0,0,0,0,0,38,0,0,206,206);
REPLACE INTO `mob_pools` VALUES (8152,'Sad_Egghunter','Sad_Egghunter',199,0x0000C70600000000000000000000000000000000,6,1,2,240,100,0,1,1,1,2,0,0,6,133,0,0,0,0,0,199,199);
REPLACE INTO `mob_pools` VALUES (8153,'Proto_Egg','Proto_Egg',272,0x0000850400000000000000000000000000000000,7,5,7,240,100,0,1,1,1,2,0,0,1,129,0,0,606,0,0,272,272);
REPLACE INTO `mob_pools` VALUES (8154,'Easter_Turkey','Easter_Turkey',125,0x0000500100000000000000000000000000000000,2,8,2,240,100,0,1,1,1,2,0,0,7,135,0,0,618,0,0,125,125);
-- April Adds
REPLACE INTO `mob_pools` VALUES (8155,'Berated_Birdie','Berated_Birdie',55,0x0000BD0100000000000000000000000000000000,1,1,2,240,100,0,1,1,1,2,0,0,0,131,0,0,0,0,0,55,55);
-- May Mobs
REPLACE INTO `mob_pools` VALUES (8156,'Leafy','Leafy',178,0x00002C0100000000000000000000000000000000,2,2,1,480,240,0,1,1,1,2,0,0,2497,0,0,0,0,0,256,178,178);
REPLACE INTO `mob_pools` VALUES (8157,'Unhappy_Bloom','Unhappy_Bloom',136,0x0000280100000000000000000000000000000000,2,2,12,320,100,0,1,1,1,2,0,0,237,1159,0,0,0,0,0,136,136);
REPLACE INTO `mob_pools` VALUES (8158,'Queen_Bee','Queen Bee',456,0x0000C40900000000000000000000000000000000,1,1,2,240,240,0,1,1,1,2,0,0,1,131,0,0,0,0,0,456,456);
REPLACE INTO `mob_pools` VALUES (8159,'Flutterfly','Flutterfly',338,0x0000E70900000000000000000000000000000000,1,1,12,240,240,0,1,1,1,2,0,64,1,131,0,0,0,0,0,338,338);
REPLACE INTO `mob_pools` VALUES (8160,'Blooming_Bark','Blooming_Bark',245,0x0000860100000000000000000000000000000000,4,4,12,240,100,0,1,1,1,2,0,0,1,137,0,0,169,0,0,799,245);
-- May Adds
REPLACE INTO `mob_pools` VALUES (8161,'Bloomer','Bloomer',178,0x0000490900000000000000000000000000000000,2,2,1,480,240,0,1,1,1,2,0,0,0,131,0,0,0,0,0,178,178);
REPLACE INTO `mob_pools` VALUES (8162,'Sprout','Sprout',178,0x0000350800000000000000000000000000000000,2,2,1,480,240,0,1,1,1,2,0,0,0,0,0,0,0,0,0,178,178);
REPLACE INTO `mob_pools` VALUES (8163,'Bee_Guard','Bee_Guard',48,0x0000110100000000000000000000000000000000,1,1,2,240,240,0,1,1,1,2,0,0,0,133,0,0,0,0,0,48,48);
REPLACE INTO `mob_pools` VALUES (8164,'Sprouted_Seed','Sprouted_Seed',216,0x0000880100000000000000000000000000000000,1,1,12,240,100,0,1,1,1,2,0,0,0,135,0,0,0,0,0,216,216);
---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
--------------------------------------
-- March Monsters
REPLACE INTO `mob_groups` VALUES (1,8145,71,'Lucky_Rabbit',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (2,8146,71,'Lucky_Tink',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (3,8147,71,'Leprechan',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (4,8148,71,'Albatross',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (5,8149,71,'Blarney',0,128,0,200000,5000,133,133,0);
-- April Monsters and adds
REPLACE INTO `mob_groups` VALUES (6,8150,71,'Annoyed_Avian',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (7,8151,71,'Furry_Thief',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (8,8152,71,'Sad_Egghunter',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (9,8153,71,'Proto_Egg',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (10,8154,71,'Easter_Turkey',0,128,0,200000,5000,133,133,0);
REPLACE INTO `mob_groups` VALUES (11,8155,71,'Berated_Birdie',0,128,0,10000,5000,115,115,0);
-- May Monsters and adds
REPLACE INTO `mob_groups` VALUES (12,8156,71,'Leafy',0,128,0,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (13,8157,71,'Unhappy_Bloom',0,128,0,140000,5000,122,122,0);
REPLACE INTO `mob_groups` VALUES (14,8158,71,'Queen_Bee',0,128,0,160000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (15,8159,71,'Flutterfly',0,128,0,180000,5000,128,128,0);
REPLACE INTO `mob_groups` VALUES (16,8160,71,'Blooming_Bark',0,128,0,200000,5000,133,133,0);
REPLACE INTO `mob_groups` VALUES (17,8161,71,'Bloomer',0,128,0,80000,5000,117,117,0);
REPLACE INTO `mob_groups` VALUES (18,8162,71,'Sprout',0,128,0,80000,5000,117,117,0);
REPLACE INTO `mob_groups` VALUES (19,8163,71,'Bee_Guard',0,128,0,1000,5000,120,120,0);
REPLACE INTO `mob_groups` VALUES (20,8164,71,'Sprouted_Seed',0,128,0,200000,5000,125,125,0);
---------------------------------------
-- Spawn Mods (poolid, modid, value, is_mob_mod)
---------------------------------------
-- March Monsters
REPLACE INTO `mob_pool_mods` VALUES (8145,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8146,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8147,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8148,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8149,2,0,1); -- GIL_MAX: 0
-- April Monsters and adds
REPLACE INTO `mob_pool_mods` VALUES (8150,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8151,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8152,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8153,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8154,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8155,2,0,1); -- GIL_MAX: 0
-- May Monsters and Adds
REPLACE INTO `mob_pool_mods` VALUES (8156,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8157,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8158,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8159,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8160,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8161,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8162,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8163,2,0,1); -- GIL_MAX: 0
REPLACE INTO `mob_pool_mods` VALUES (8164,2,0,1); -- GIL_MAX: 0
