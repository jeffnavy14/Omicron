DELETE FROM `mob_spawn_points` WHERE `mobid`=17309979;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17379783;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17391805;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17396144;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17404336;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17428497;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17432583;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17436965;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17469761;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17490230;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17498564;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17502567;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17576270;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17584426;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17596728;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17617157;
DELETE FROM `mob_spawn_points` WHERE `mobid`=17629190;

DELETE FROM `mob_groups` WHERE `groupid`=14 AND `zoneid`=130;
DELETE FROM `mob_groups` WHERE `groupid`=37 AND `zoneid`=147;
DELETE FROM `mob_groups` WHERE `groupid`=19 AND `zoneid`=150;
DELETE FROM `mob_groups` WHERE `groupid`=43 AND `zoneid`=151;
DELETE FROM `mob_groups` WHERE `groupid`=34 AND `zoneid`=153;
DELETE FROM `mob_groups` WHERE `groupid`=15 AND `zoneid`=159;
DELETE FROM `mob_groups` WHERE `groupid`=6  AND `zoneid`=160; 
DELETE FROM `mob_groups` WHERE `groupid`=49 AND `zoneid`=161;
DELETE FROM `mob_groups` WHERE `groupid`=42 AND `zoneid`=169;
DELETE FROM `mob_groups` WHERE `groupid`=34 AND `zoneid`=174;
DELETE FROM `mob_groups` WHERE `groupid`=58 AND `zoneid`=176;
DELETE FROM `mob_groups` WHERE `groupid`=13 AND `zoneid`=177;
DELETE FROM `mob_groups` WHERE `groupid`=54 AND `zoneid`=195;
DELETE FROM `mob_groups` WHERE `groupid`=38 AND `zoneid`=197;
DELETE FROM `mob_groups` WHERE `groupid`=42 AND `zoneid`=200;
DELETE FROM `mob_groups` WHERE `groupid`=24 AND `zoneid`=205;
DELETE FROM `mob_groups` WHERE `groupid`=6  AND `zoneid`=208; 

DELETE FROM `mob_pools` WHERE `poolid`=2664;





-- mob_spawn_points` (mobid, mobname, polutils_name, groupid, pos_x, pos_y, pos_z, pos_rot)
INSERT INTO `mob_spawn_points` VALUES (17309979,'Mimic','Mimic',14,569,-70,-80,76);
INSERT INTO `mob_spawn_points` VALUES (17379783,'Mimic','Mimic',37,-89.998,-3.663,-121.633,72);
INSERT INTO `mob_spawn_points` VALUES (17391805,'Mimic','Mimic',19,220,-2,-108,67);
INSERT INTO `mob_spawn_points` VALUES (17396144,'Mimic','Mimic',43,185.513,-16.250,-139.871,236);
INSERT INTO `mob_spawn_points` VALUES (17404336,'Mimic','Mimic',34,51.167,-18.547,-154.090,214);
INSERT INTO `mob_spawn_points` VALUES (17428497,'Mimic','Mimic',15,37.509,35.500,-85.849,80);
INSERT INTO `mob_spawn_points` VALUES (17432583,'Mimic','Mimic',6,185.654,-28.001,-107.475,127);
INSERT INTO `mob_spawn_points` VALUES (17436965,'Mimic','Mimic',49,-35.780,18.5,3.481,127);
INSERT INTO `mob_spawn_points` VALUES (17469761,'Mimic','Mimic',42,139.77,20,-219.77,10);
INSERT INTO `mob_spawn_points` VALUES (17490230,'Mimic','Mimic',34,128.642,-0.003,-12.849,54);
INSERT INTO `mob_spawn_points` VALUES (17498564,'Mimic','Mimic',58,138.302,-13.974,229.035,79);
INSERT INTO `mob_spawn_points` VALUES (17502567,'Mimic','Mimic',13,-341.085,0.041,286.685,207);
INSERT INTO `mob_spawn_points` VALUES (17576270,'Mimic','Mimic',54,200.877,16.350,-586.757,207);
INSERT INTO `mob_spawn_points` VALUES (17584426,'Mimic','Mimic',38,58.403,-0.829,258.992,110);
INSERT INTO `mob_spawn_points` VALUES (17596728,'Mimic','Mimic',42,-167.889,18.750,321.510,238);
INSERT INTO `mob_spawn_points` VALUES (17617157,'Mimic','Mimic',24,-114.419,2.62,169.613,191);
INSERT INTO `mob_spawn_points` VALUES (17629190,'Mimic','Mimic',6 ,41.024,-0.500,-130.467,45);

-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
INSERT INTO `mob_pools` VALUES (2664,'Mimic','Mimic',522,0x0000030100000000000000000000000000000000,7,1,7,100,100,0,1,0,0,2,0,0,0,131,13,0,0,0,0,183,183);
-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
INSERT INTO `mob_groups` VALUES (14,2664,130,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (37,2664,147,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (19,2664,150,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (43,2664,151,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (34,2664,153,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (15,2664,159,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (6,2664,160, 'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (49,2664,161,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (42,2664,169,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (34,2664,174,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (58,2664,176,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (13,2664,177,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (54,2664,195,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (38,2664,197,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (42,2664,200,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (24,2664,205,'Mimic',0,128,0,308300,0,137,139,0);
INSERT INTO `mob_groups` VALUES (6,2664,208, 'Mimic',0,128,0,308300,0,137,139,0);

-- MOB_RESISTANCES (resistid,name,slash_sdt,piece_sdt,h2h_sdt,impact_sdt,fire_sdt,ice_sdt,wind_sdt,earth_sdt,lightning_sdt
-- water_sdt,light_sdt,dark_sdt,fire_meva,ice_meva,wind_meva,earth_meva,lightning_meva,water_meva,light_meva,dark_meva
-- fire_res_rank,ice_res_rank,wind_res_rank,earth,_res_rank,lightning_res_rank,water_res_rank,light_res_rank,dark_res_rank)
INSERT INTO `mob_resistances` VALUES (522,'Mimic',2,2,2,2,5000,5000,5000,5000,5000,5000,5000,5000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);