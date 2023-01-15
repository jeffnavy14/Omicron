-- ------------------------------------------------------------
-- Wajaom Woodlands (Zone 51)
-- ------------------------------------------------------------
INSERT INTO `mob_spawn_points` VALUES (16986851,'Haunted_Chest','Haunted_Chest',200,684.2693,-15.7500,230.6230,86);
INSERT INTO `mob_spawn_points` VALUES (16986852,'Haunted_Chest','Haunted_Chest',200,-250.6451,-20.4114,-434.0721,86);
INSERT INTO `mob_spawn_points` VALUES (16986853,'Haunted_Chest','Haunted_Chest',200,-61.6093,-15.8453,-554.0464,86);
INSERT INTO `mob_spawn_points` VALUES (16986854,'Haunted_Chest','Haunted_Chest',200,-64.6066,-16.5000,-342.1325,86);
INSERT INTO `mob_spawn_points` VALUES (16986855,'Haunted_Chest','Haunted_Chest',200,-687.3520,-11.8837,-498.0318,86);
INSERT INTO `mob_spawn_points` VALUES (16986856,'Haunted_Chest','Haunted_Chest',200,-453.9148,-12.2500,-481.5012,86);
INSERT INTO `mob_spawn_points` VALUES (16986857,'Haunted_Chest','Haunted_Chest',200,-691.2581,-7.7500,-154.1270,86);
INSERT INTO `mob_spawn_points` VALUES (16986858,'Haunted_Chest','Haunted_Chest',200,-650.6906,-12.6204,-75.9657,86);
INSERT INTO `mob_spawn_points` VALUES (16986859,'Haunted_Chest','Haunted_Chest',200,-420.8515,-2.5481,-90.7148,86);
INSERT INTO `mob_spawn_points` VALUES (16986860,'Haunted_Chest','Haunted_Chest',200,-808.5479,-25.1900,173.3570,86);
INSERT INTO `mob_spawn_points` VALUES (16986861,'Haunted_Chest','Haunted_Chest',200,-343.2263,-31.6327,673.9008,86);
INSERT INTO `mob_spawn_points` VALUES (16986862,'Haunted_Chest','Haunted_Chest',200,-278.7979,-24,399.1640,86);

-- MOB_POOLS (poolid,name,packet_name,familyid,modelid,mjob,sjob,cmbskill,cmbdelay,cmbdmgmulti,behavior,aggro,true_detection,links,mobtype,
INSERT INTO `mob_pools` VALUES (10321,'Haunted_Chest','Haunted_Chest',999,0x0000020100000000000000000000000000000000,8,12,10,2,1,0,1,1,0,2,0,0,7,135,0,0,4969,0,0,9022,9022);

-- MOB_GROUPS (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, hp, mp, minlevel, maxlevel, allegiance)
INSERT INTO `mob_groups` VALUES (200,10321,51,'Haunted_Chest',0,128,4083,100,99999,129,130,0);

-- MOB_RESISTANCES (resistid,name,slash_sdt,piece_sdt,h2h_sdt,impact_sdt,fire_sdt,ice_sdt,wind_sdt,earth_sdt,lightning_sdt
-- water_sdt,light_sdt,dark_sdt,fire_meva,ice_meva,wind_meva,earth_meva,lightning_meva,water_meva,light_meva,dark_meva
-- fire_res_rank,ice_res_rank,wind_res_rank,earth,_res_rank,lightning_res_rank,water_res_rank,light_res_rank,dark_res_rank)
INSERT INTO `mob_resistances` VALUES (9122,'Haunted_Chest',9,9,9,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);