-- MOB_SPAWN_POINTS (mobid,mobname,polutils_name,groupid,pos_x,pos_y,pos_z,pos_rot)
-- ------------------------------------------------------------
-- Escha_ZiTah (Zone 288)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17957500,'Rage','Rage',99,17.3168,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957501,'Pride','Pride',98,17.3268,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957502,'Wrath','Wrath',97,17.3368,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957503,'Wraths_Pup','Wraths_Pup',96,17.3368,0.8648,-1.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957504,'Deceit','Deceit',95,17.3768,0.8648,-2.1185,86);

-- ------------------------------------------------------------
-- Escha_RuAun (Zone 289)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17962500,'Envy','Envy',99,-6.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17962501,'Lust','Lust',98,1.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17962502,'Greed','Greed',97,8.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17962503,'Deceit','Deceit',95,1.0496,-37.0849,-443.0017,86);

-- ------------------------------------------------------------
-- Reisenjima (Zone 291)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17970000,'Gluttony','Gluttony',98,-487.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970001,'Fear','Fear',99,-492.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970002,'Sloth','Sloth',97,-498.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970003,'Deceit','Deceit',95,17.3368,0.8648,-2.1185,86);


-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
INSERT INTO `mob_pools` VALUES (9990,'Rage','Rage',999,0x00008D0700000000000000000000000000000000,4,5,12,180,100,0,1,1,0,2,0,0,7,135,0,0,4950,0,0,9000,9000);
INSERT INTO `mob_pools` VALUES (9991,'Pride','Pride',999,0x0000D30900000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4951,0,0,9001,9001);
INSERT INTO `mob_pools` VALUES (9992,'Wrath','Wrath',999,0x0000720A00000000000000000000000000000000,8,1,7,180,100,0,1,1,0,2,0,0,7,135,0,0,4952,0,0,9002,9002);
INSERT INTO `mob_pools` VALUES (9993,'Wraths_Pup','Wraths_Pup',999,0x0000320B00000000000000000000000000000000,4,2,7,220,100,0,1,1,0,2,0,0,0,131,0,0,0,0,0,9003,9003);
INSERT INTO `mob_pools` VALUES (9994,'Envy','Envy',999,0x0000700100000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4953,0,0,9004,9004);
INSERT INTO `mob_pools` VALUES (9995,'Lust','Lust',999,0x00008D0800000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4954,0,0,9005,9005);
INSERT INTO `mob_pools` VALUES (9996,'Greed','Greed',999,0x00000A0800000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4955,0,0,9006,9006);
INSERT INTO `mob_pools` VALUES (9997,'Fear','Fear',999,0x00007E0B00000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4957,0,0,9007,9007);
INSERT INTO `mob_pools` VALUES (9998,'Gluttony','Gluttony',999,0x00001F0C00000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4958,0,0,9008,9008);
INSERT INTO `mob_pools` VALUES (9999,'Sloth','Sloth',999,0x0000C90900000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4959,0,0,9009,9009);
INSERT INTO `mob_pools` VALUES (10000,'Deceit','Deceit',999,0x00000B0100000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4960,0,0,9010,9010);

-- Lust Phase 2 0x00008E0800000000000000000000000000000000
-- Gluttony Phase 2 0x0000360700000000000000000000000000000000

-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
INSERT INTO `mob_groups` VALUES (99,9990,288,'Rage',1800,128,4059,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (98,9991,288,'Pride',1800,128,4060,71000,0,124,125,0);
INSERT INTO `mob_groups` VALUES (97,9992,288,'Wrath',1800,128,4061,91000,5000,124,125,0);
INSERT INTO `mob_groups` VALUES (96,9993,288,'Wraths_Pup',1800,128,0,41000,0,124,125,0);
INSERT INTO `mob_groups` VALUES (99,9994,289,'Envy',1800,128,4062,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (98,9995,289,'Lust',1800,128,4063,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (97,9996,289,'Greed',1800,128,4064,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (99,9997,291,'Fear',1800,128,4065,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (98,9998,291,'Gluttony',1800,128,4066,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (97,9999,291,'Sloth',1800,128,4067,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (95,10000,291,'Deceit',1800,128,4068,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (95,10000,289,'Deceit',1800,128,4068,51000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (95,10000,288,'Deceit',1800,128,4068,51000,5001,124,125,0);

-- MOB_POOL_MODS (poolid, modid, value, is_mob_mod)
INSERT INTO `mob_pool_mods` VALUES (9990,288,40,0);
INSERT INTO `mob_pool_mods` VALUES (9990,302,20,0);
INSERT INTO `mob_pool_mods` VALUES (9991,288,60,0);
INSERT INTO `mob_pool_mods` VALUES (9991,23,200,0);
INSERT INTO `mob_pool_mods` VALUES (9991,1,100,0);
INSERT INTO `mob_pool_mods` VALUES (9991,163,1000,0);
INSERT INTO `mob_pool_mods` VALUES (9991,840,10,0);

-- MOB_PETS (mob_mobid,pet_offset,job,mobname,petname)
INSERT INTO `mob_pets` VALUES (17957502,1,2,'Wrath','Wraths_Pup');


-- MOB_SPAWN_MODS (mobid,modid,value,is_mob_mod)
INSERT INTO `mob_spawn_mods` VALUES (17957500,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957500,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17957501,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957501,2,30000,1); -- max gil 30000


-- MOB_RESISTANCES (resistid,name,slash_sdt,piece_sdt,h2h_sdt,impact_sdt,fire_sdt,ice_sdt,wind_sdt,earth_sdt,lightning_sdt
-- water_sdt,light_sdt,dark_sdt,fire_res,ice_res,wind_res,earth_res,lightning_res,water_res,light_res,dark_res)
INSERT INTO `mob_resistances` VALUES (9000,'Rage',1,2,2,2,2500,2500,2500,2500,2500,2500,-2500,2500,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9001,'Pride',2,1,2,2,2000,2000,2000,2000,-2000,2000,2000,2000,0,0,0,0,0,0,0,0);


-- MOB_FAMILY_SYSTEM (familyid,family,superFamilyID,superfamily,ecosystemID,exosystem,mobradius,speed,
-- hp,mp,str,dex,vit,agi,int,mnd,chr,att,def,acc,eva,element,detects,charmable)
INSERT INTO `mob_family_system` VALUES (999,'Seven_Sins',78,'Supreme_Being',0,'Unclassified',3,100,128,11,6,6,6,6,6,6,6,6,6,6,6,0,3,0);


-- MOB_FAMILY_MODS (familyid,modid,value,is_mob_mod)
INSERT INTO `mob_family_mods` VALUES (999,8,150,0);
INSERT INTO `mob_family_mods` VALUES (999,9,150,0);
INSERT INTO `mob_family_mods` VALUES (999,10,150,0);
INSERT INTO `mob_family_mods` VALUES (999,11,150,0);
INSERT INTO `mob_family_mods` VALUES (999,12,150,0);
INSERT INTO `mob_family_mods` VALUES (999,13,150,0);
INSERT INTO `mob_family_mods` VALUES (999,14,150,0);
INSERT INTO `mob_family_mods` VALUES (999,25,600,0);
INSERT INTO `mob_family_mods` VALUES (999,1,500,0);
INSERT INTO `mob_family_mods` VALUES (999,28,300,0);
INSERT INTO `mob_family_mods` VALUES (999,23,400,0);
INSERT INTO `mob_family_mods` VALUES (999,166,-30,0);
INSERT INTO `mob_family_mods` VALUES (999,908,30,0);



-- MOB_SKILL_LISTS (skill_list_name,skill_list_id,mob_skill_id)
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,2412);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,3393);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,281);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,688);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,821);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,1110);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2098);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2099);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2100);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2101);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2102);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2103);


-- MOB_SPELL_LISTS (spell_list_name,spell_list_id,spell_id,min_level,max_level)
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,219,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,496,1,255);

