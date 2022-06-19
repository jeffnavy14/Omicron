-- ------------------------------------------------------------
-- Escha_ZiTah (Zone 288)
-- ------------------------------------------------------------
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,2412);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,3393);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,281);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,688);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,821);
INSERT INTO `mob_skill_lists` VALUES ('Rage',9000,1110);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,176,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,219,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,357,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,359,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,365,1,255);
INSERT INTO `mob_spell_lists` VALUES ('Rage',4950,496,1,255);
INSERT INTO `mob_spawn_points` VALUES (17957500,'Rage','Rage',99,17.3168,0.8648,-2.1185,86);
INSERT INTO `mob_spawn_mods` VALUES (17957500,1,18000,1); -- min gil 18000
INSERT INTO `mob_spawn_mods` VALUES (17957500,2,30000,1); -- max gil 30000
INSERT INTO `mob_family_system` VALUES (999,'Seven_Sins',78,'Supreme_Being',0,'Unclassified',3,100,128,11,6,6,6,6,6,6,6,6,6,6,6,0,3,0);
INSERT INTO `mob_groups` VALUES (99,9990,288,'Rage',1800,128,4059,51000,5001,124,125,0);
INSERT INTO `mob_pools` VALUES (9990,'Rage','Rage',999,0x00008D0700000000000000000000000000000000,4,5,12,180,100,0,1,1,0,2,0,0,7,135,0,0,4950,0,0,9000,9000);
INSERT INTO `mob_resistances` VALUES (9000,'Rage',1,2,2,2,2500,2500,2500,2500,2500,2500,-2500,2500,0,0,0,0,0,0,0,0);
INSERT INTO `mob_family_mods` VALUES (999,8,150,0);
INSERT INTO `mob_family_mods` VALUES (999,9,100,0);
INSERT INTO `mob_family_mods` VALUES (999,10,150,0);
INSERT INTO `mob_family_mods` VALUES (999,11,150,0);
INSERT INTO `mob_family_mods` VALUES (999,12,100,0);
INSERT INTO `mob_family_mods` VALUES (999,13,100,0);
INSERT INTO `mob_family_mods` VALUES (999,14,100,0);
INSERT INTO `mob_family_mods` VALUES (999,25,600,0);
INSERT INTO `mob_family_mods` VALUES (999,1,500,0);
INSERT INTO `mob_family_mods` VALUES (999,28,300,0);
INSERT INTO `mob_family_mods` VALUES (999,23,400,0);
INSERT INTO `mob_family_mods` VALUES (999,288,40,0);
INSERT INTO `mob_family_mods` VALUES (999,302,20,0);
INSERT INTO `mob_family_mods` VALUES (999,166,-30,0);
INSERT INTO `mob_family_mods` VALUES (999,908,30,0);

-- ------------------------------------------------------------
-- Escha_RuAun (Zone 289)
-- ------------------------------------------------------------
-- ------------------------------------------------------------
-- Reisenjima (Zone 291)
-- ------------------------------------------------------------
-- MOB_SKILL_LISTS (skill_list_name,skill_list_id,mob_skill_id)
-- MOB_SPELL_LISTS (spell_list_name,spell_list_id,spell_id,min_level,max_level)
-- MOB_SPAWN_POINTS (mobid,mobname,polutils_name,groupid,pos_x,pos_y,pos_z,pos_rot)
-- MOB_SPAWN_MODS (mobid,modid,value,is_mob_mod)
-- MOB_FAMILY_SYSTEM (familyid,family,superFamilyID,superfamily,ecosystemID,exosystem,mobradius,speed,hp,mp,str,dex,vit,agi,int,mnd,chr,att,def,acc,eva,element,detects,charmable)
-- MOB_PETS (mob_mobid,pet_offset,job,mobname,petname)
-- INSERT INTO `mob_pets` VALUES (16912839,1,9,'Jailer_of_Justice','Qnxzomit');
-- MOB_FAMILY_MODS (familyid,modid,value,is_mob_mod)
-- MOB_POOL_MODS (poolid, modid, value, is_mob_mod)
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
-- immunity,name_prefix,flag,entityflags,animationsub,hasspellscript,spelllist,namevis,roamflag,skill_list_id,resist_id)
-- INSERT INTO `mob_pools` VALUES (30000,'Bozzetto_Breadwinner','Bozzetto Breadwinner',503,0x0000B40700000000000000000000000000000000,2,0,8,220,100,0,1,1,1,34,0,32,0,3,0,0,0,0,0,30000,506);
-- INSERT INTO `mob_pools` VALUES (5776,'Paramount_Botulus','Paramount_Botulus',299,0x00000C0800000000000000000000000000000000,4,4,12,240,100,0,1,0,0,2,0,0,1,135,0,0,2,0,0,112,299);
-- INSERT INTO `mob_pools` VALUES (5778,'Paramount_Ironclad','Paramount_Ironclad',350,0x0000580800000000000000000000000000000000,1,1,4,240,100,0,1,1,0,2,0,0,1,135,0,0,0,0,0,350,350);
-- INSERT INTO `mob_pools` VALUES (5779,'Paramount_Mantis','Paramount_Mantis',340,0x000012084761756E616200000000000000000000,4,4,12,240,100,0,1,0,0,2,0,0,1,647,8,0,2,0,0,340,340);
-- INSERT INTO `mob_pools` VALUES (5780,'Paramount_Harpeia','Paramount_Harpeia',471,0x00003A0800000000000000000000000000000000,4,4,6,240,100,0,1,1,0,2,0,0,1,647,0,0,2,0,0,471,471);
-- INSERT INTO `mob_pools` VALUES (5781,'Paramount_Naraka','Paramount_Naraka',472,0x0000390800000000000000000000000000000000,1,1,10,240,100,0,1,0,0,2,0,0,1,135,0,0,0,0,0,472,472);
-- MOB_RESISTANCES (resistid,name,slash_sdt,piece_sdt,h2h_sdt,impact_sdt,fire_sdt,ice_sdt,wind_sdt,earth_sdt,lightning_sdt
-- water_sdt,light_sdt,dark_sdt,fire_res,ice_res,wind_res,earth_res,lightning_res,water_res,light_res,dark_res)
-- NM_SPAWN_POINTS (mobid,pos,pos_x,pos_y,pos_z)
-- NPC_LIST (npcid,name,poutils_name,pos_rot,pos_x,pos_y,pos_z,flag,speed,speedsub,animation,animationsub,namevis,status,entityflags,look,name_prefix,content_tag,widescan)
 
