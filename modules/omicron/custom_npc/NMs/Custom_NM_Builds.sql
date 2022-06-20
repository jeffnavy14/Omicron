-- MOB_SPAWN_POINTS (mobid,mobname,polutils_name,groupid,pos_x,pos_y,pos_z,pos_rot)
-- ------------------------------------------------------------
-- Escha_ZiTah (Zone 288)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17957500,'Rage','Rage',199,17.3168,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957501,'Pride','Pride',198,17.3268,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957502,'Wrath','Wrath',197,17.3368,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957503,'Wraths_Pup','Wraths_Pup',196,17.3368,0.8648,-1.1185,86);
INSERT INTO `mob_spawn_points` VALUES (17957504,'Deceit','Deceit',195,17.3768,0.8648,-2.1185,86);

-- ------------------------------------------------------------
-- Escha_RuAun (Zone 289)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17961850,'Envy','Envy',199,-6.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17961851,'Lust','Lust',198,1.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17961852,'Greed','Greed',197,8.1596,-34.0001,-453.8906,86);
INSERT INTO `mob_spawn_points` VALUES (17961853,'Deceit','Deceit',195,1.0496,-37.0849,-443.0017,86);

-- ------------------------------------------------------------
-- Reisenjima (Zone 291)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17970000,'Gluttony','Gluttony',198,-487.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970001,'Fear','Fear',199,-492.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970002,'Sloth','Sloth',197,-498.3272,-21.7547,-450.7563,86);
INSERT INTO `mob_spawn_points` VALUES (17970003,'Deceit','Deceit',195,-498.3272,-21.7547,-450.7563,86);


-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
INSERT INTO `mob_pools` VALUES (9990,'Rage','Rage',999,0x00008D0700000000000000000000000000000000,4,5,12,180,100,0,1,1,0,2,0,0,7,135,0,0,4950,0,0,168,9000);
INSERT INTO `mob_pools` VALUES (9991,'Pride','Pride',999,0x0000D30900000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4951,0,0,179,9001);
INSERT INTO `mob_pools` VALUES (9992,'Wrath','Wrath',999,0x0000720A00000000000000000000000000000000,8,1,7,160,100,0,1,1,0,2,0,0,7,135,0,0,150,0,0,359,9002);
INSERT INTO `mob_pools` VALUES (9993,'Wraths_Pup','Wraths_Pup',999,0x0000320B00000000000000000000000000000000,4,2,1,225,100,0,1,1,0,2,0,0,0,131,0,0,0,0,0,263,9003);
INSERT INTO `mob_pools` VALUES (9994,'Envy','Envy',999,0x0000320A00000000000000000000000000000000,5,3,1,180,100,0,1,1,0,2,0,0,7,135,0,0,431,0,0,1010,9004);
INSERT INTO `mob_pools` VALUES (9995,'Lust','Lust',999,0x00008D0800000000000000000000000000000000,4,5,12,180,100,0,1,1,0,2,0,0,7,135,0,0,290,0,0,768,9005);
INSERT INTO `mob_pools` VALUES (9996,'Greed','Greed',999,0x0000530500000000000000000000000000000000,16,21,8,180,100,0,1,1,0,2,0,0,7,135,0,0,162,0,0,292,9006);
INSERT INTO `mob_pools` VALUES (9997,'Fear','Fear',999,0x00007E0B00000000000000000000000000000000,8,3,4,180,100,0,1,1,0,2,0,0,7,135,0,0,437,0,0,234,9007);
INSERT INTO `mob_pools` VALUES (9998,'Gluttony','Gluttony',999,0x00001F0C00000000000000000000000000000000,22,19,7,180,110,0,1,1,0,2,0,0,7,135,0,0,432,0,0,252,9008);
INSERT INTO `mob_pools` VALUES (9999,'Sloth','Sloth',999,0x0000C90900000000000000000000000000000000,7,16,6,180,100,0,1,1,0,2,0,0,7,135,0,0,451,0,0,452,9009);
INSERT INTO `mob_pools` VALUES (10000,'Deceit','Deceit',999,0x00000B0100000000000000000000000000000000,12,19,10,100,100,0,1,1,0,2,0,0,7,135,0,0,440,0,0,9010,9010);

-- Lust Phase 2 0x00008E0800000000000000000000000000000000
-- Gluttony Phase 2 0x0000360700000000000000000000000000000000

-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
INSERT INTO `mob_groups` VALUES (199,9990,288,'Rage',1800,128,4059,61000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9991,288,'Pride',1800,128,4060,71000,0,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9992,288,'Wrath',1800,128,4061,91000,5000,124,125,0);
INSERT INTO `mob_groups` VALUES (196,9993,288,'Wraths_Pup',1800,128,0,41000,0,124,125,0);
INSERT INTO `mob_groups` VALUES (199,9994,289,'Envy',1800,128,4062,61000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9995,289,'Lust',1800,128,4063,91000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9996,289,'Greed',1800,128,4064,71000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (199,9997,291,'Fear',1800,128,4065,61000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9998,291,'Gluttony',1800,128,4066,91000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9999,291,'Sloth',1800,128,4067,71000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,291,'Deceit',1800,128,4068,110000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,289,'Deceit',1800,128,4068,110000,5001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,288,'Deceit',1800,128,4068,110000,5001,124,125,0);

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
INSERT INTO `mob_spawn_mods` VALUES (17957502,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957502,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17957503,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957503,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17957504,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957504,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17961850,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17961850,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17961851,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17961851,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17961852,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17961852,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17961853,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17961853,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17970000,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17970000,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17970001,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17970001,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17970002,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17970002,2,30000,1); -- max gil 30000
INSERT INTO `mob_spawn_mods` VALUES (17970003,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17970003,2,30000,1); -- max gil 30000


-- MOB_RESISTANCES (resistid,name,slash_sdt,piece_sdt,h2h_sdt,impact_sdt,fire_sdt,ice_sdt,wind_sdt,earth_sdt,lightning_sdt
-- water_sdt,light_sdt,dark_sdt,fire_res,ice_res,wind_res,earth_res,lightning_res,water_res,light_res,dark_res)
INSERT INTO `mob_resistances` VALUES (9000,'Rage',1,2,2,2,2500,2500,2500,2500,2500,2500,-2500,2500,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9001,'Pride',2,1,2,2,2000,2000,2000,2000,-2000,2000,2000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9002,'Wrath',2,2,1,2,10000,3000,2000,2000,2000,-2000,2000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9003,'Wraths_Pup',2,1,2,2,1000,-3000,1000,1000,1000,-2000,1000,1000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9004,'Envy',2,2,2,1,-2000,2000,2000,2000,10000,2000,2000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9005,'Lust',1,2,2,2,2000,2000,10000,2000,-2000,2000,2000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9006,'Greed',2,1,2,2,2000,2000,2000,10000,-2000,2000,2000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9007,'Fear',2,2,1,2,2000,2000,2000,2000,-2000,2000,1000,4000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9008,'Gluttony',2,2,2,1,2000,2000,2000,2000,-2000,2000,-2000,10000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9009,'Sloth',1,2,2,2,2000,2000,2000,2000,-2000,2000,10000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9010,'Deceit',1,3,1,2,4000,-2000,4000,4000,4000,4000,4000,4000,0,0,0,0,0,0,0,0);

-- MOB_FAMILY_SYSTEM (familyid,family,superFamilyID,superfamily,ecosystemID,exosystem,mobradius,speed,
-- hp,mp,str,dex,vit,agi,int,mnd,chr,att,def,acc,eva,element,detects,charmable)
INSERT INTO `mob_family_system` VALUES (999,'Seven_Sins',78,'Supreme_Being',0,'Unclassified',3,100,128,11,6,6,6,6,6,6,6,6,6,6,6,0,3,0);


-- MOB_FAMILY_MODS (familyid,modid,value,is_mob_mod)
INSERT INTO `mob_family_mods` VALUES (999,8,200,0);
INSERT INTO `mob_family_mods` VALUES (999,9,200,0);
INSERT INTO `mob_family_mods` VALUES (999,10,200,0);
INSERT INTO `mob_family_mods` VALUES (999,11,200,0);
INSERT INTO `mob_family_mods` VALUES (999,12,200,0);
INSERT INTO `mob_family_mods` VALUES (999,13,200,0);
INSERT INTO `mob_family_mods` VALUES (999,14,200,0);
INSERT INTO `mob_family_mods` VALUES (999,25,600,0);
INSERT INTO `mob_family_mods` VALUES (999,1,500,0);
INSERT INTO `mob_family_mods` VALUES (999,28,400,0);
INSERT INTO `mob_family_mods` VALUES (999,30,500,0);
INSERT INTO `mob_family_mods` VALUES (999,31,500,0);
INSERT INTO `mob_family_mods` VALUES (999,23,550,0);
INSERT INTO `mob_family_mods` VALUES (999,166,-40,0);
INSERT INTO `mob_family_mods` VALUES (999,908,30,0);
INSERT INTO `mob_family_mods` VALUES (999,334,60,0);
INSERT INTO `mob_family_mods` VALUES (999,432,35,0);



-- MOB_SKILL_LISTS (skill_list_name,skill_list_id,mob_skill_id)
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,2412);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2098);
INSERT INTO `mob_skill_lists` VALUES ('Deceit',9010,2580);
INSERT INTO `mob_skill_lists` VALUES ('Deceit',9010,588);


-- MOB_SPELL_LISTS (spell_list_name,spell_list_id,spell_id,min_level,max_level)
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,219,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,496,1,255);

