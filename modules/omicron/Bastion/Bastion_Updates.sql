---------------------------------------
-- MOB_SPAWNS mobid, mobname, polutils_name, groupid, pos_x, pos_y, pos_z, pos_rotation
-- ID = (<zone id> x 4096) + 16777217 for first usable ID
---------------------------------------
-- Abyssea - Attahwa (Zone 215)
REPLACE INTO `mob_spawn_points` VALUES (17658300,'Dirt_Seeker','Dirt Seeker',56,-405,-4,159,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17658301,'Dirt_Seeker','Dirt Seeker',56,-405,-4,159,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17658304,'UV_Lamp','UV Lamp',58,-405,-4,159,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17658305,'UV_Lamp','UV Lamp',58,-405,-4,159,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17658306,'Sterilizer','Sterilizer',59,-405,-4,159,0);  --shield chariot
REPLACE INTO `mob_spawn_points` VALUES (17658308,'Waxer','Waxer',61,-405,-4,159,0);  -- chariot
REPLACE INTO `mob_spawn_points` VALUES (17658309,'Super_Scrubber','Super Scrubber',62,-405,-4,159,0); -- armed chariot
REPLACE INTO `mob_spawn_points` VALUES (17658310,'Mega_Maid_AA','Mega Maid AA',63,-405,-4,159,240); -- overseer
-- Abyssea - Misareaux (Zone 216)
REPLACE INTO `mob_spawn_points` VALUES (17662505,'Dirt_Seeker','Dirt Seeker',56,198,-16,160,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17662506,'Dirt_Seeker','Dirt Seeker',56,198,-16,160,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17662509,'UV_Lamp','UV Lamp',58,198,-16,160,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17662510,'UV_Lamp','UV Lamp',58,198,-16,160,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17662511,'Sterilizer','Sterilizer',59,198,-16,160,0);  --shield chariot
REPLACE INTO `mob_spawn_points` VALUES (17662513,'Waxer','Waxer',61,198,-16,160,0);  -- chariot
REPLACE INTO `mob_spawn_points` VALUES (17662514,'Super_Scrubber','Super Scrubber',62,198,-16,160,0); -- armed chariot
REPLACE INTO `mob_spawn_points` VALUES (17662515,'Mega_Maid_AA','Mega Maid AM',63,198,-16,160,240); -- overseer
-- Abyssea - Vunkerl (Zone 217)
REPLACE INTO `mob_spawn_points` VALUES (17666525,'Dirt_Seeker','Dirt Seeker',55,17,-39,-125,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17666526,'Dirt_Seeker','Dirt Seeker',55,17,-39,-125,0); -- orbs
REPLACE INTO `mob_spawn_points` VALUES (17666529,'UV_Lamp','UV Lamp',57,17,-39,-125,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17666530,'UV_Lamp','UV Lamp',57,17,-39,-125,0); -- gears
REPLACE INTO `mob_spawn_points` VALUES (17666531,'Sterilizer','Sterilizer',58,17,-39,-125,0);  --shield chariot
REPLACE INTO `mob_spawn_points` VALUES (17666533,'Waxer','Waxer',60,17,-39,-125,0);  -- chariot
REPLACE INTO `mob_spawn_points` VALUES (17666534,'Super_Scrubber','Super Scrubber',61,17,-39,-125,0); -- armed chariot
REPLACE INTO `mob_spawn_points` VALUES (17666535,'Mega_Maid_AA','Mega Maid AV',62,17,-39,-125,240); -- overseer
---------------------------------------
-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype (2=NM),
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
---------------------------------------
-- Abyssea - Attahwa (Zone 215)
REPLACE INTO `mob_pools` VALUES (3508,'Dirt_Seeker','Dirt_Seeker',234,0x0000380400000000000000000000000000000000,6,2,11,140,100,0,1,1,1,2,0,0,0,129,0,0,0,0,0,0,600);
REPLACE INTO `mob_pools` VALUES (4230,'UV_Lamp','UV_Lamp',120,0x00001C0700000000000000000000000000000000,13,17,11,140,100,0,1,1,1,2,0,0,0,129,0,0,7,0,0,120,601);
REPLACE INTO `mob_pools` VALUES (2061,'Sterilizer','Sterilizer',63,0x00001E0700000000000000000000000000000000,12,8,0,140,100,0,1,1,1,2,0,0,0,129,0,0,5,0,0,63,602);
REPLACE INTO `mob_pools` VALUES (2991,'Waxer','Waxer',63,0x0000200700000000000000000000000000000000,5,1,0,200,100,0,1,1,1,2,0,0,0,129,0,0,3,0,0,63,603);
REPLACE INTO `mob_pools` VALUES (1176,'Super_Scrubber','Super_Scrubber',63,0x0000210700000000000000000000000000000000,14,2,6,210,100,0,1,1,1,2,0,0,0,129,0,0,0,0,0,63,604);
REPLACE INTO `mob_pools` VALUES (3077,'Mega_Maid_AA','Mega_Maid_AA',350,0x0000590900000000000000000000000000000000,22,7,4,240,100,0,1,1,1,2,0,0,0,129,0,0,7,0,0,350,605);
REPLACE INTO `mob_pools` VALUES (3078,'Mega_Maid_AA','Mega_Maid_AM',350,0x0000590900000000000000000000000000000000,22,7,4,240,100,0,1,1,1,2,0,0,0,129,0,0,7,0,0,350,605);
REPLACE INTO `mob_pools` VALUES (3079,'Mega_Maid_AA','Mega_Maid_AV',350,0x0000590900000000000000000000000000000000,22,7,4,240,100,0,1,1,1,2,0,0,0,129,0,0,7,0,0,350,605);
---------------------------------------
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
---------------------------------------
-- Abyssea - Attahwa (Zone 215)
REPLACE INTO `mob_groups` VALUES (56,3508,215,'Dirt_Seeker',0,128,0,21800,0,109,109,0);
REPLACE INTO `mob_groups` VALUES (58,4230,215,'UV_Lamp',0,128,0,22000,0,110,110,0);
REPLACE INTO `mob_groups` VALUES (59,2061,215,'Sterilizer',0,128,0,22200,1110,111,111,0);
REPLACE INTO `mob_groups` VALUES (61,2991,215,'Waxer',0,128,0,22400,1120,112,112,0);
REPLACE INTO `mob_groups` VALUES (62,1176,215,'Super_Scrubber',0,128,0,33900,0,113,113,0);
REPLACE INTO `mob_groups` VALUES (63,3077,215,'Mega_Maid_AA',0,128,0,34500,1150,115,115,0);
-- Abyssea - Misareaux (Zone 216)
REPLACE INTO `mob_groups` VALUES (56,3508,216,'Dirt_Seeker',0,128,0,21800,0,109,109,0);
REPLACE INTO `mob_groups` VALUES (58,4230,216,'UV_Lamp',0,128,0,22000,0,110,110,0);
REPLACE INTO `mob_groups` VALUES (59,2061,216,'Sterilizer',0,128,0,22200,1110,111,111,0);
REPLACE INTO `mob_groups` VALUES (61,2991,216,'Waxer',0,128,0,22400,1120,112,112,0);
REPLACE INTO `mob_groups` VALUES (62,1176,216,'Super_Scrubber',0,128,0,33900,0,113,113,0);
REPLACE INTO `mob_groups` VALUES (63,3077,216,'Mega_Maid_AA',0,128,0,34500,1150,115,115,0);
-- Abyssea - Vunkerl (Zone 217)
REPLACE INTO `mob_groups` VALUES (55,3508,217,'Dirt_Seeker',0,128,0,21800,0,109,109,0);
REPLACE INTO `mob_groups` VALUES (57,4230,217,'UV_Lamp',0,128,0,22000,0,110,110,0);
REPLACE INTO `mob_groups` VALUES (58,2061,217,'Sterilizer',0,128,0,22200,1110,111,111,0);
REPLACE INTO `mob_groups` VALUES (60,2991,217,'Waxer',0,128,0,22400,1120,112,112,0);
REPLACE INTO `mob_groups` VALUES (61,1176,217,'Super_Scrubber',0,128,0,33900,0,113,113,0);
REPLACE INTO `mob_groups` VALUES (62,3077,217,'Mega_Maid_AA',0,128,0,34500,1150,115,115,0);
---------------------------------------
-- MOB_RESISTANCES (resist_id, name, slash_sdt, pierce_sdt, h2h_sdt, impact_sdt, 
-- fire_sdt, ice_sdt, wind_sdt, earth_sdt, lightning_sdt, water_sdt, light_sdt, dark_sdt
-- fire_meva, ice_meva, wind_meva, earth_meva, lightning_meva, water_meva, light_meva, dark_meva`
-- fire_res_rank, ice_res_rank, wind_res_rank, earth_res_rank, lightning_res_rank, water_res_rank, light_res_rank, dark_res_rank`
---------------------------------------
REPLACE INTO `mob_resistances` VALUES (600,'Dirt_Seeker',.25,.25,.5,1,1000,1000,1000,1000,0,2000,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (601,'UV_Lamp',.25,.25,1,.5,1100,1100,1100,1100,500,2200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (602,'Sterilizer',1,.5,.25,.25,2000,1200,1200,1200,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (603,'Waxer',.5,1,.25,.25,2000,1300,1300,1300,1300,0,500,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (604,'Super_Scrubber',.25,1,.5,.25,2000,1400,1400,1400,1400,1400,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (605,'Mega_Maid_AA',.25,.5,.5,.25,2000,1400,1400,1400,1400,1400,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (605,'Mega_Maid_AM',.25,.5,.5,.25,2000,1400,1400,1400,1400,1400,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO `mob_resistances` VALUES (605,'Mega_Maid_AV',.25,.5,.5,.25,2000,1400,1400,1400,1400,1400,1000,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);