-- MOB_SPAWN_POINTS (mobid,mobname,polutils_name,groupid,pos_x,pos_y,pos_z,pos_rot)
-- ------------------------------------------------------------
-- Escha_ZiTah (Zone 288)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17957500,'Rage','Rage',199,498.3563,-0.0165,-496.8427,86);
INSERT INTO `mob_spawn_points` VALUES (17957501,'Pride','Pride',198,69.3468,1.5689,56.9379,86);
INSERT INTO `mob_spawn_points` VALUES (17957502,'Wrath','Wrath',197,-290.1503,-0.0523,489.6764,86);
INSERT INTO `mob_spawn_points` VALUES (17957503,'Wraths_Pup','Wraths_Pup',196,-290.1503,-0.0523,489.6764,86);
INSERT INTO `mob_spawn_points` VALUES (17957504,'Deceit','Deceit',195,8.5587,0.1019,-5.2075,86);
INSERT INTO `mob_spawn_points` VALUES (17957505,'Deceit','Deceit',195,-222.9745,0.3304,-381.1261,86);
INSERT INTO `mob_spawn_points` VALUES (17957506,'Deceit','Deceit',195,-290.1389,0.1294,206.7605,86);

-- ------------------------------------------------------------
-- Escha_RuAun (Zone 289)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17961850,'Envy','Envy',199,-103.8806,-32,-159.1412,86);
INSERT INTO `mob_spawn_points` VALUES (17961851,'Lust','Lust',198,-331.0125,-8,-107.5367,86);
INSERT INTO `mob_spawn_points` VALUES (17961852,'Greed','Greed',197,430.8464,-36,-140.1014,86);
INSERT INTO `mob_spawn_points` VALUES (17961854,'Deceit','Deceit',195,-187.9955,-41.0259,-403.7397,86);
INSERT INTO `mob_spawn_points` VALUES (17961855,'Deceit','Deceit',195,-341.9503,-24.0002,-231.4209,86);
INSERT INTO `mob_spawn_points` VALUES (17961856,'Deceit','Deceit',195,-224.7619,-20.0001,313.5689,86);

-- ------------------------------------------------------------
-- Reisenjima (Zone 291)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (17970000,'Gluttony','Gluttony',198,131.1574,-81.1757,348.8067,86);
INSERT INTO `mob_spawn_points` VALUES (17970001,'Fear','Fear',199,54.4282,-93.2464,524.0075,86);
INSERT INTO `mob_spawn_points` VALUES (17970002,'Sloth','Sloth',197,-437.6767,-41.4000,41.6887,86);
INSERT INTO `mob_spawn_points` VALUES (17970003,'Deceit','Deceit',195,-616.9898,-32.6716,-313.1386,86);
INSERT INTO `mob_spawn_points` VALUES (17970004,'Deceit','Deceit',195,-419.8232,-41.4000,104.0153,86);
INSERT INTO `mob_spawn_points` VALUES (17970005,'Deceit','Deceit',195,-260.9930,-82.7192,340.4691,86);


-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
INSERT INTO `mob_pools` VALUES (9990,'Rage','Rage',999,0x00008D0700000000000000000000000000000000,8,4,12,180,100,0,1,1,0,2,0,0,7,135,0,0,4950,0,0,316,9000);
INSERT INTO `mob_pools` VALUES (9991,'Pride','Pride',999,0x0000D30900000000000000000000000000000000,1,2,6,180,100,0,1,1,0,2,0,0,7,135,0,0,4951,0,0,179,9001);
INSERT INTO `mob_pools` VALUES (9992,'Wrath','Wrath',999,0x0000720A00000000000000000000000000000000,8,1,7,160,100,0,1,1,0,2,0,0,7,135,0,0,150,0,0,359,9002);
INSERT INTO `mob_pools` VALUES (9993,'Wraths_Pup','Wraths_Pup',999,0x0000320B00000000000000000000000000000000,4,2,7,275,60,0,1,1,0,2,0,0,0,4953,0,0,0,0,0,263,9003);
INSERT INTO `mob_pools` VALUES (9994,'Envy','Envy',999,0x0000320A00000000000000000000000000000000,5,3,1,180,100,0,1,1,0,2,0,0,7,135,0,0,431,0,0,1010,9004);
INSERT INTO `mob_pools` VALUES (9995,'Lust','Lust',999,0x00008D0800000000000000000000000000000000,8,4,12,180,100,0,1,1,0,2,0,0,7,135,0,0,290,0,0,9005,9005);
INSERT INTO `mob_pools` VALUES (9996,'Greed','Greed',999,0x0000530500000000000000000000000000000000,16,21,8,180,100,0,1,1,0,2,0,0,7,135,0,0,162,0,0,292,9006);
INSERT INTO `mob_pools` VALUES (9997,'Fear','Fear',999,0x00007E0B00000000000000000000000000000000,8,3,4,180,100,0,1,1,0,2,0,0,7,135,0,0,149,0,0,9007,9007);
INSERT INTO `mob_pools` VALUES (9998,'Gluttony','Gluttony',999,0x00001F0C00000000000000000000000000000000,8,19,7,180,110,0,1,1,0,2,0,0,7,135,0,0,432,0,0,252,9008);
INSERT INTO `mob_pools` VALUES (9999,'Sloth','Sloth',999,0x0000C90900000000000000000000000000000000,7,16,6,300,120,0,1,1,0,2,0,0,7,135,0,0,4959,0,0,9009,9009);
INSERT INTO `mob_pools` VALUES (10000,'Deceit','Deceit',999,0x00000B0100000000000000000000000000000000,8,12,10,90,110,0,1,1,0,2,0,0,7,135,0,0,440,0,0,9010,9010);



-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
INSERT INTO `mob_groups` VALUES (199,9990,288,'Rage',1800,0,4059,61000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9991,288,'Pride',1800,0,4060,71000,0,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9992,288,'Wrath',1800,0,4061,91000,50000,124,125,0);
INSERT INTO `mob_groups` VALUES (196,9993,288,'Wraths_Pup',1800,128,0,41000,10000,124,125,0);
INSERT INTO `mob_groups` VALUES (199,9994,289,'Envy',1800,0,4062,61000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9995,289,'Lust',1800,0,4063,91000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9996,289,'Greed',1800,0,4064,71000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (199,9997,291,'Fear',1800,0,4065,61000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (198,9998,291,'Gluttony',1800,0,4066,91000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (197,9999,291,'Sloth',1800,0,4067,71000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,291,'Deceit',1800,128,4068,80000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,289,'Deceit',1800,128,4068,80000,50001,124,125,0);
INSERT INTO `mob_groups` VALUES (195,10000,288,'Deceit',1800,128,4068,80000,50001,124,125,0);

-- MOB_POOL_MODS (poolid, modid, value, is_mob_mod)
INSERT INTO `mob_pool_mods` VALUES (9990,288,40,0);
INSERT INTO `mob_pool_mods` VALUES (9990,302,20,0);
INSERT INTO `mob_pool_mods` VALUES (9991,288,60,0);
INSERT INTO `mob_pool_mods` VALUES (9991,23,200,0);
INSERT INTO `mob_pool_mods` VALUES (9991,1,100,0);
INSERT INTO `mob_pool_mods` VALUES (9991,163,1000,0);
INSERT INTO `mob_pool_mods` VALUES (9991,840,10,0);
INSERT INTO `mob_pool_mods` VALUES (9996,368,150,0);
INSERT INTO `mob_pool_mods` VALUES (9996,28,-150,0); 
INSERT INTO `mob_pool_mods` VALUES (9997,368,150,0);
INSERT INTO `mob_pool_mods` VALUES (9997,840,250,0);
INSERT INTO `mob_pool_mods` VALUES (9998,23,300,0);
INSERT INTO `mob_pool_mods` VALUES (9999,25,1000,0);
INSERT INTO `mob_pool_mods` VALUES (9999,23,1000,0);
INSERT INTO `mob_pool_mods` VALUES (9999,160,-2500,0);
INSERT INTO `mob_pool_mods` VALUES (9999,165,100,0);
INSERT INTO `mob_pool_mods` VALUES (9999,370,35,0);
INSERT INTO `mob_pool_mods` VALUES (9999,480,10,0);
INSERT INTO `mob_pool_mods` VALUES (9999,476,10,0);
INSERT INTO `mob_pool_mods` VALUES (9999,475,10,0);
INSERT INTO `mob_pool_mods` VALUES (9999,416,10,0);
INSERT INTO `mob_pool_mods` VALUES (9999,506,500,0);
INSERT INTO `mob_pool_mods` VALUES (9999,507,200,0);
INSERT INTO `mob_pool_mods` VALUES (9999,840,-60,0);
INSERT INTO `mob_pool_mods` VALUES (10000,8,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,9,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,10,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,11,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,12,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,13,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,14,-150,0);
INSERT INTO `mob_pool_mods` VALUES (10000,23,-200,0);
INSERT INTO `mob_pool_mods` VALUES (10000,68,-200,0);
INSERT INTO `mob_pool_mods` VALUES (10000,28,-100,0);
INSERT INTO `mob_pool_mods` VALUES (10000,1,-200,0);
INSERT INTO `mob_pool_mods` VALUES (10000,29,-100,0);
INSERT INTO `mob_pool_mods` VALUES (10000,30,-100,0);
INSERT INTO `mob_pool_mods` VALUES (10000,31,-100,0);




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
INSERT INTO `mob_resistances` VALUES (9006,'Greed',2,1,2,2,2000,2000,2000,10000,-2000,2000,2000,6000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9007,'Fear',2,2,1,2,2000,2000,2000,2000,-2000,2000,1000,4000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9008,'Gluttony',2,2,2,1,2000,2000,2000,2000,-2000,2000,-2000,10000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9009,'Sloth',1,2,2,2,2000,2000,2000,2000,-2000,2000,10000,2000,0,0,0,0,0,0,0,0);
INSERT INTO `mob_resistances` VALUES (9010,'Deceit',1,1,1,1,4000,-4000,4000,4000,4000,4000,4000,4000,0,0,0,0,0,0,0,0);

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
INSERT INTO `mob_family_mods` VALUES (999,68,350,0);
INSERT INTO `mob_family_mods` VALUES (999,28,330,0);
INSERT INTO `mob_family_mods` VALUES (999,163,7000,0);
INSERT INTO `mob_family_mods` VALUES (999,29,100,0);
INSERT INTO `mob_family_mods` VALUES (999,30,500,0);
INSERT INTO `mob_family_mods` VALUES (999,31,300,0);
INSERT INTO `mob_family_mods` VALUES (999,23,550,0);
INSERT INTO `mob_family_mods` VALUES (999,166,-40,0);
INSERT INTO `mob_family_mods` VALUES (999,908,30,0);
INSERT INTO `mob_family_mods` VALUES (999,334,60,0);
INSERT INTO `mob_family_mods` VALUES (999,432,35,0);
INSERT INTO `mob_family_mods` VALUES (999,244,800,0);
INSERT INTO `mob_family_mods` VALUES (999,170,75,0);



-- MOB_SKILL_LISTS (skill_list_name,skill_list_id,mob_skill_id)
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,2412);
INSERT INTO `mob_skill_lists` VALUES ('Pride',9001,2098);
INSERT INTO `mob_skill_lists` VALUES ('Deceit',9010,2580);
INSERT INTO `mob_skill_lists` VALUES ('Deceit',9010,588);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,269);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,320);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,319);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,345);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,348);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,349);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,371);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,376);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,377);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,378);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,416);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,451);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,470);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,488);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,642);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,644);
INSERT INTO `mob_skill_lists` VALUES ('Fear',9007,717);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,530);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,531);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,532);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,533);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,1326);
INSERT INTO `mob_skill_lists` VALUES ('Lust',9005,2638);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2022);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2024);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2025);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2026);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2027);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2028);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2031);
INSERT INTO `mob_skill_lists` VALUES ('Sloth',9009,2057);

-- MOB_SPELL_LISTS (spell_list_name,spell_list_id,spell_id,min_level,max_level)
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,219,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,250,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,496,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Wraths_Pup',4953,218,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sloth',4959,37,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sloth',4959,356,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sloth',4959,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sloth',4959,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Sloth',4959,365,1,255);

