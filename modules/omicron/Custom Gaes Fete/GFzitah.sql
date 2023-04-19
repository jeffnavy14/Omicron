---------------------------------------
-- Geas Fete NMs for custom spawn
---------------------------------------
--T1 (In order as per BGWiki Affi)
REPLACE INTO `mob_spawn_points` VALUES (17957304,'Aglaophotis','Aglaophotis',39,89,0,-153,119);
REPLACE INTO `mob_spawn_points` VALUES (17957316,'Angrboda','Angrboda',43,89,0,-153,98);
REPLACE INTO `mob_spawn_points` VALUES (17957319,'Cunnast','Cunnast',44,89,0,-153,227);
REPLACE INTO `mob_spawn_points` VALUES (17957325,'Ferrodon','Ferrodon',46,89,0,-153,93);
REPLACE INTO `mob_spawn_points` VALUES (17957313,'Gestalt','Gestalt',42,89,0,-153,186);
REPLACE INTO `mob_spawn_points` VALUES (17957328,'Gulltop','Gulltop',47,89,0,-153,239);
REPLACE INTO `mob_spawn_points` VALUES (17957301,'Lustful_Lydia','Lustful Lydia',38,89,0,-153,206);
REPLACE INTO `mob_spawn_points` VALUES (17957322,'Revetaur','Revetaur',45,89,0,-153,105);
REPLACE INTO `mob_spawn_points` VALUES (17957307,'Tangata_Manu','Tangata Manu',40,89,0,-153,246);
REPLACE INTO `mob_spawn_points` VALUES (17957310,'Vidala','Vidala',41,89,0,-153,202);
REPLACE INTO `mob_spawn_points` VALUES (17957331,'Vyala','Vyala',48,89,0,-153,7);
REPLACE INTO `mob_spawn_points` VALUES (17957298,'Wepwawet','Wepwawet',37,89,0,-153,253);
--T2 (In order as per BGWiki Affi)
REPLACE INTO `mob_spawn_points` VALUES (17957361,'Brittlis','Brittlis',58,89,0,-153,217);
REPLACE INTO `mob_spawn_points` VALUES (17957352,'Ionos','Ionos',55,89,0,-153,245);
REPLACE INTO `mob_spawn_points` VALUES (17957364,'Kamohoalii','Kamohoalii',59,89,0,-153,73);
REPLACE INTO `mob_spawn_points` VALUES (17957358,'Nosoi','Nosoi',57,89,0,-153,45);
REPLACE INTO `mob_spawn_points` VALUES (17957355,'Sensual_Sandy','Sensual Sandy',56,89,0,-153,21);
REPLACE INTO `mob_spawn_points` VALUES (17957367,'Umdhlebi','Umdhlebi',60,89,0,-153,105);
--T3 (In order as per BGWiki Affi)
REPLACE INTO `mob_spawn_points` VALUES (17957370,'Fleetstalker','Fleetstalker',61,89,0,-153,198);
REPLACE INTO `mob_spawn_points` VALUES (17957373,'Shockmaw','Shockmaw',62,89,0,-153,194);
REPLACE INTO `mob_spawn_points` VALUES (17957376,'Urmahlullu','Urmahlullu',63,89,0,-153,18);
--HELM T1 (In order as per BGWiki Affi)
REPLACE INTO `mob_spawn_points` VALUES (17957382,'Bucca','Bucca',50,87,0,-153,98);-- Spawn with Puca and Alpluachra
REPLACE INTO `mob_spawn_points` VALUES (17957385,'Puca','Puca',51,88,0,-153,98);-- Spawn with Bucca and Alpluachra
REPLACE INTO `mob_spawn_points` VALUES (17957388,'Alpluachra','Alpluachra',52,89,0,-153,98);--Spawn with Bucca and Puca
REPLACE INTO `mob_spawn_points` VALUES (17957379,'Blazewing','Blazewing',49,89,0,-153,119);
REPLACE INTO `mob_spawn_points` VALUES (17957391,'Pazuzu','Pazuzu',53,89,0,-153,193);
--HELM T2 (In order as per BGWiki Affi)
REPLACE INTO `mob_spawn_points` VALUES (17957394,'Wrathare','Wrathare',54,89,0,-153,58);
---------------------------------------
-- Geas Fete Pools
---------------------------------------
-- t1
REPLACE INTO `mob_pools` VALUES (5618,'Aglaophotis','Aglaophotis',207,0x0000EA0700000000000000000000000000000000,9,8,7,240,100,0,0,0,0,0,0,32,7,133,0,0,0,0,0,0,207); -- Abilities will be scripted
REPLACE INTO `mob_pools` VALUES (5703,'Angrboda','Angrboda',135,0x0000B10100000000000000000000000000000000,2,3,11,320,100,0,1,0,0,2,0,32,7,133,0,0,600,0,0,135,135);
REPLACE INTO `mob_pools` VALUES (5704,'Cunnast','Cunnast',266,0x00008F0700000000000000000000000000000000,1,16,7,240,100,0,0,0,0,2,1,32,7,133,0,0,601,0,0,266,266);
REPLACE INTO `mob_pools` VALUES (5706,'Ferrodon','Ferrodon',257,0x0000FC0600000000000000000000000000000000,1,1,5,240,100,0,1,0,0,0,0,32,7,133,0,0,0,0,0,257,257);
REPLACE INTO `mob_pools` VALUES (5702,'Gestalt','Gestalt',139,0x0000810100000000000000000000000000000000,4,5,12,280,100,0,1,0,0,2,0,32,7,133,0,0,602,0,0,139,139);
REPLACE INTO `mob_pools` VALUES (5707,'Gulltop','Gulltop',49,0x00009A0100000000000000000000000000000000,7,1,8,240,100,0,1,0,1,0,0,32,1,133,0,0,0,0,0,49,49);
REPLACE INTO `mob_pools` VALUES (5617,'Lustful_Lydia','Lustful_Lydia',186,0x00007A0100000000000000000000000000000000,1,2,7,200,125,0,1,0,0,2,0,32,7,133,0,0,0,0,0,186,186);
REPLACE INTO `mob_pools` VALUES (5705,'Revetaur','Revetaur',240,0x0000560900000000000000000000000000000000,8,4,12,240,100,0,1,1,0,2,0,32,0,133,0,0,2,0,0,240,240);
REPLACE INTO `mob_pools` VALUES (5619,'Tangata_Manu','Tangata_Manu',471,0x0000130800000000000000000000000000000000,4,12,6,240,100,0,1,0,0,2,0,32,7,133,0,0,607,0,0,471,471);
REPLACE INTO `mob_pools` VALUES (5701,'Vidala','Vidala',242,0x0000C80800000000000000000000000000000000,5,6,6,240,100,0,0,0,0,2,0,32,7,133,0,0,608,0,0,242,242);
REPLACE INTO `mob_pools` VALUES (5708,'Vyala','Vyala',71,0x00003C0800000000000000000000000000000000,6,5,6,240,100,0,1,0,0,2,0,32,7,133,0,0,609,0,0,161,71);
REPLACE INTO `mob_pools` VALUES (5616,'Wepwawet','Wepwawet',62,0x0000010700000000000000000000000000000000,8,12,7,380,100,0,1,1,0,2,0,32,7,133,0,0,610,0,0,62,62);
-- t2
REPLACE INTO `mob_pools` VALUES (5717,'Brittlis','Brittlis',435,0x0000040200000000000000000000000000000000,6,5,3,240,100,0,1,0,0,0,0,32,7,135,0,0,611,0,0,61,435);
REPLACE INTO `mob_pools` VALUES (5714,'Ionos','Ionos',81,0x00006C0B00000000000000000000000000000000,8,2,5,210,100,0,1,0,0,2,0,32,7,135,0,0,0,0,0,81,81);
REPLACE INTO `mob_pools` VALUES (5718,'Kamohoalii','Kamohoalii',191,0x0000C20600000000000000000000000000000000,22,8,6,240,100,0,1,0,0,2,0,32,7,135,4,0,0,0,0,191,191);
REPLACE INTO `mob_pools` VALUES (5716,'Nosoi','Nosoi',454,0x0000240A00000000000000000000000000000000,1,21,2,240,100,0,1,0,1,2,0,32,7,135,0,0,0,0,0,454,454);
REPLACE INTO `mob_pools` VALUES (5715,'Sensual_Sandy','Sensual_Sandy',186,0x00006B0B00000000000000000000000000000000,12,2,7,200,100,0,1,0,0,2,0,32,7,135,0,0,0,0,0,186,186);
REPLACE INTO `mob_pools` VALUES (5719,'Umdhlebi','Umdhlebi',453,0x00002B0800000000000000000000000000000000,2,5,2,240,100,0,1,1,1,2,0,32,7,135,0,0,612,0,0,453,453);
-- t3
REPLACE INTO `mob_pools` VALUES (5720,'Fleetstalker','Fleetstalker',459,0x00006A0B00000000000000000000000000000000,4,5,7,180,100,0,1,1,1,0,0,32,7,135,4,0,613,0,0,459,459);
REPLACE INTO `mob_pools` VALUES (5721,'Shockmaw','Shockmaw',451,0x00002C0800000000000000000000000000000000,7,8,2,140,100,0,1,0,1,2,0,32,7,131,0,0,614,0,0,451,451);
REPLACE INTO `mob_pools` VALUES (5722,'Urmahlullu','Urmahlullu',51,0x0000320B00000000000000000000000000000000,8,6,6,380,125,1024,1,1,0,2,0,32,7,135,0,0,615,0,0,479,479);
-- HELM t1
REPLACE INTO `mob_pools` VALUES (5710,'Bucca','Bucca',195,0x0000F00700000000000000000000000000000000,4,5,12,240,100,0,0,0,1,2,0,32,7,519,8,0,617,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (6993,'Puca','Puca',195,0x0000EF0700000000000000000000000000000000,4,3,7,240,100,0,1,1,0,2,0,32,0,519,8,0,618,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (5711,'Alpluachra','Alpluachra',195,0x0000100800000000000000000000000000000000,5,4,0,240,100,0,1,0,0,2,0,32,7,647,8,0,616,0,0,195,195);
REPLACE INTO `mob_pools` VALUES (5709,'Blazewing','Blazewing',340,0x0000120800000000000000000000000000000000,1,1,12,240,100,0,1,0,0,0,0,32,1,135,0,0,0,0,0,340,340);
REPLACE INTO `mob_pools` VALUES (5712,'Pazuzu','Pazuzu',467,0x00000B0800000000000000000000000000000000,8,4,12,240,100,0,1,0,0,2,0,32,7,135,0,0,2,0,0,467,467);
-- HELM t2
REPLACE INTO `mob_pools` VALUES (5713,'Wrathare','Wrathare',206,0x00000C0100000000000000000000000000000000,6,1,2,240,100,0,0,0,0,2,0,32,7,135,0,0,0,0,0,206,206);
---------------------------------------
-- Geas Fete Groups
-- groupid, poolid, zoneid, name,
-- respawntime, spawntype, dropid
-- HP, MP, minLevel, maxLevel, allegiance
---------------------------------------
-- t1
REPLACE INTO `mob_groups` VALUES (39,5618,288,'Aglaophotis',0,128,4042,100000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (43,5703,288,'Angrboda',0,128,4043,105000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (44,5704,288,'Cunnast',0,128,4044,110000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (46,5706,288,'Ferrodon',0,128,4045,115000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (42,5702,288,'Gestalt',0,128,4046,120000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (47,5707,288,'Gulltop',0,128,4047,125000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (38,5617,288,'Lustful_Lydia',0,128,4048,130000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (45,5705,288,'Revetaur',0,128,4047,135000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (40,5619,288,'Tangata_Manu',0,128,4049,140000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (41,5701,288,'Vidala',0,128,4050,145000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (48,5708,288,'Vyala',0,128,4051,150000,5000,119,119,0);
REPLACE INTO `mob_groups` VALUES (37,5616,288,'Wepwawet',0,128,4053,155000,5000,119,119,0);
--t2
REPLACE INTO `mob_groups` VALUES (58,5717,288,'Brittlis',0,128,4054,130000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (55,5714,288,'Ionos',0,128,4055,135000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (59,5718,288,'Kamohoalii',0,128,4056,140000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (57,5716,288,'Nosoi',0,128,4057,145000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (56,5715,288,'Sensual_Sandy',0,128,4058,150000,5000,125,125,0);
REPLACE INTO `mob_groups` VALUES (60,5719,288,'Umdhlebi',0,128,4059,155000,5000,125,125,0);
--t3
REPLACE INTO `mob_groups` VALUES (61,5720,288,'Fleetstalker',0,128,4060,160000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (62,5721,288,'Shockmaw',0,128,4061,165000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (63,5722,288,'Urmahlullu',0,128,4062,165000,5000,135,135,0);
-- HELM t1
REPLACE INTO `mob_groups` VALUES (50,5710,288,'Bucca',0,128,0,150000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (51,6993,288,'Puca',0,128,0,150000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (52,5711,288,'Alpluachra',0,128,4063,150000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (49,5709,288,'Blazewing',0,128,4064,155000,5000,135,135,0);
REPLACE INTO `mob_groups` VALUES (53,5712,288,'Pazuzu',0,128,4065,160000,5000,135,135,0);
-- HELM t3
REPLACE INTO `mob_groups` VALUES (54,5713,288,'Wrathare',0,128,4066,200000,5000,135,135,0);
/*
INSERT INTO `mob_groups` VALUES (64,0,288,'Azi_Dahaka',0,128,0,200000,99999,125,125,0);
INSERT INTO `mob_groups` VALUES (65,0,288,'Azi_Dahakas_Dragon',0,128,0,0,0,135,135,0);
INSERT INTO `mob_groups` VALUES (66,0,288,'Mireu',0,128,0,0,0,140,140,0);
*/
---------------------------------------
-- Geas Fete Drops -- last 2 entries (itemID, droprate 1000 = 100%)
---------------------------------------
-- Aglaophotis 100
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,27097,100); -- Eschite Gauntlets
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,27512,100); -- Marked Gorget
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,27459,100); -- Naga Kyahan
REPLACE INTO `mob_droplist` VALUES (4042,0,0,1000,26952,100); -- Psycloth Vest
-- Angrboda 101
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,26948,100); -- Despair Mail 
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,28416,100); -- Lucidity Sash
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,27285,100); -- Rawhide Trousers
REPLACE INTO `mob_droplist` VALUES (4043,0,0,1000,26797,100); -- Vanya Hood
-- Cunnast 102
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,27098,100); -- Despair Fin. Gaunt.
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,27460,100); -- Rawhide Boots
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,21414,100); -- Willpower Grip
REPLACE INTO `mob_droplist` VALUES (4044,0,0,1000,26953,100); -- Vanya Robe
-- Ferrodon 103
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,27458,100); -- Despair Greaves
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,26951,100); -- Pursuer's Doublet
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,27513,100); -- Subtlety Spec.
REPLACE INTO `mob_droplist` VALUES (4045,0,0,1000,27288,100); -- Vanya Slops
-- Gestalt 104
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,27100,100); -- Rawhide Gloves
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,26792,100); -- Despair Helm
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,27462,100); -- Psycloth Boots
REPLACE INTO `mob_droplist` VALUES (4046,0,0,1000,27606,100); -- Disperser's Cape
-- Gulltop 105
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,28475,100); -- Infused Earring
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,26793,100); -- Naga Somen
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,27101,100); -- Pursuer's Cuffs
REPLACE INTO `mob_droplist` VALUES (4047,0,0,1000,27463,100); -- Vanya Clogs
-- Lustful_Lydia 106
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,26947,100); -- Eschite Breastplate
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,27284,100); -- Naga Hakama
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,26796,100); -- Psycloth Tiara
REPLACE INTO `mob_droplist` VALUES (4048,0,0,1000,22250,100); -- Seraphic Ampulla
-- Revetaur 107
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,26795,100); -- Pursuer's Beret
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,27103,100); -- Vanya Cuffs
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,27283,100); -- Despair Cuisses
REPLACE INTO `mob_droplist` VALUES (4049,0,0,1000,22251,100); -- Grenade Core
-- Tangata_Manu 108
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,27282,100); -- Eschite Cuisses
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,28474,100); -- Mendi. Earring
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,27102,100); -- Psycloth Manillas
REPLACE INTO `mob_droplist` VALUES (4050,0,0,1000,26794,100); -- Rawhide Mask
-- Vidala 109
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,26950,100); -- Rawhide Vest
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,27287,100); -- Psycloth Lappas
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,27457,100); -- Eschite Greaves
REPLACE INTO `mob_droplist` VALUES (4051,0,0,1000,27552,100); -- Overbearing Ring
-- Vyala 110
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,26949,100); -- Naga Samue
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,27553,100); -- Resonance Ring
REPLACE INTO `mob_droplist` VALUES (4052,0,0,1000,27286,100); -- Pursuer's Pants
-- Wepwawet 111
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,27099,100); -- Naga Tekko
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,27461,100); -- Pursuer's Gaiters
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,21413,100); -- Clemency Grip
REPLACE INTO `mob_droplist` VALUES (4053,0,0,1000,26791,100); -- Eschite Helm
-- t2
-- Brittlis 112
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,21699,100); -- Nibiru Faussar
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,21399,100); -- Nibiru Harp
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,21031,100); -- Sensui
REPLACE INTO `mob_droplist` VALUES (4054,0,0,1000,27554,100); -- Purity Ring
-- Ionos 113
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,20524,100); -- Nibiru Sainti
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,21216,100); --Nibiru Bow
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,20895,100); -- Nibiru Sickle
REPLACE INTO `mob_droplist` VALUES (4055,0,0,1000,27607,100); -- Thauma. Cape
-- Kamohoalii 114
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,20801,100); -- Nibiru Tabar
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,21092,100); -- Nibiru Cudgel
REPLACE INTO `mob_droplist` VALUES (4056,0,0,1000,21415,100); -- Forefather's Grip
-- Nosoi 115
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,20710,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,27642,100); -- Nibiru Shield
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,20983,100); -- Mijin
REPLACE INTO `mob_droplist` VALUES (4057,0,0,1000,28476,100); -- Calamitous Earring
-- Sensual_Sandy 116
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,20600,100); -- Nibiru Knife
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,20939,100); -- Nibiru Lance
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,21273,100); -- Nibiru Gun
REPLACE INTO `mob_droplist` VALUES (4058,0,0,1000,28417,100); -- Sinew Belt
-- Umdhlebi 117
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,20848,100); -- Nibiru Chopper
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,21156,100); -- Nibiru Staff
REPLACE INTO `mob_droplist` VALUES (4059,0,0,1000,22252,100); --Sapience Orb
-- t3
-- Fleetstalker 118
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9085,10); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,27605,100); -- Penetrating Cape
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,20847,10); -- Router
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,27104,100); -- Shrieker's Cuffs
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,26958,100); -- Sweller's Harness
REPLACE INTO `mob_droplist` VALUES (4060,0,0,1000,9075,150); -- Vulcanite Ore
-- Shockmaw 119
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9085,10); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,27464,100); -- Inspirited Boots
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,27289,100); -- Doyen Pants
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,27511,100); -- Dampener's Torque
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,20938,10); -- Annealed Lance
REPLACE INTO `mob_droplist` VALUES (4061,0,0,1000,9075,150); -- Vulcanite Ore
-- Urmahlullu 120
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9085,10); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,28415,100); -- Eschan Stone
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,26963,100); -- Onca Suit
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,27783,100); -- Skormoth Mask
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,20523,10); -- Chastisers
REPLACE INTO `mob_droplist` VALUES (4062,0,0,1000,9075,150); -- Vulcanite Ore
-- HELM t1
-- The 3 Fae 121
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,28477,50); -- Hermetic Earring
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,28477,1); -- Hermetic Earring
REPLACE INTO `mob_droplist` VALUES (4063,0,0,1000,26960,1); -- Annoint. Kalasiris
-- Blazewing 122
REPLACE INTO `mob_droplist` VALUES (4064,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4064,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4064,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4064,0,0,1000,22253,100); -- Falcon Eye
REPLACE INTO `mob_droplist` VALUES (4064,0,0,1000,26959,1); -- Kubira Meikogai
-- Pazuzu 123
REPLACE INTO `mob_droplist` VALUES (4065,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4065,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4065,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4065,0,0,1000,27514,100); -- Empath Necklace 
REPLACE INTO `mob_droplist` VALUES (4065,0,0,1000,26961,1); -- Makora Meikogai
-- HELM t2
-- Wrathare 124
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,9084,300); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,9084,200); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,9084,100); -- Eschalixer
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,9085,50); -- Eschalixer +1
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,27555,150); -- Warden's Ring
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,27555,1); -- Warden's Ring
REPLACE INTO `mob_droplist` VALUES (4066,0,0,1000,26962,1); -- Enforcer's Harness
---------------------------------------
-- Geas Fete Spell Lists
---------------------------------------
-- Angrboda (600)
REPLACE INTO `mob_spell_lists` VALUES('Angrboda',600,312,1,255); -- enfire_ii
REPLACE INTO `mob_spell_lists` VALUES('Angrboda',600,511,1,255); -- haste_ii 
REPLACE INTO `mob_spell_lists` VALUES('Angrboda',600,34,1,255); -- diaga_ii
REPLACE INTO `mob_spell_lists` VALUES('Angrboda',600,53,1,255); -- blink
-- Cunnast (601)
REPLACE INTO `mob_spell_lists` VALUES('Cunnast',601,608,1,255); -- frost_breath
REPLACE INTO `mob_spell_lists` VALUES('Cunnast',601,591,1,255); -- heat_breath
REPLACE INTO `mob_spell_lists` VALUES('Cunnast',601,695,1,255); -- thunder_breath
REPLACE INTO `mob_spell_lists` VALUES('Cunnast',601,698,1,255); -- wind_breath
-- Gestalt (602)
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,503,1,255); -- impact
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,496,1,255); -- firaja
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,177,1,255); -- firaga_iv
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,147,1,255); -- fire_iv
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,148,1,255); -- fire_v
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,235,1,255); -- burn
REPLACE INTO `mob_spell_lists` VALUES('Gestalt',602,277,1,255); -- dread_spikes
-- Gulltop (603) low setting
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,176,1,255); -- firaga_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,179,1,255); -- blizzaga_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,184,1,255); -- aeroga_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,189,1,255); -- stonega_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,194,1,255); -- thundaga_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,199,1,255); -- waterga_iii
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,366,1,255); -- graviga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,361,1,255); -- blindga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',603,273,1,255); -- sleepga
-- Gulltop (604) mid setting
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,177,1,255); -- firaga_iv
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,180,1,255); -- blizzaga_iv 
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,185,1,255); -- aeroga_iv
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,190,1,255); -- stonega_iv
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,195,1,255); -- thundaga_iv
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,200,1,255); -- waterga_iv
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,366,1,255); -- graviga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,361,1,255); -- blindga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',604,273,1,255); -- sleepga
-- Gulltop (605) high setting
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,178,1,255); -- firaga_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,181,1,255); -- blizzaga_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,186,1,255); -- aeroga_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,191,1,255); -- stonega_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,196,1,255); -- thundaga_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,201,1,255); -- waterga_v
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,366,1,255); -- graviga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,361,1,255); -- blindga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',605,274,1,255); -- sleepga_ii
-- Gulltop (606) final setting
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,496,1,255); -- firaja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,497,1,255); -- bizzaja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,498,1,255); -- aeroja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,499,1,255); -- stoneja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,500,1,255); -- thundaja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,501,1,255); -- waterja
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,366,1,255); -- graviga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,361,1,255); -- blindga
REPLACE INTO `mob_spell_lists` VALUES('Gulltop',606,274,1,255); -- sleepga_ii
-- Tangata Manu (607)
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,61,1,255); -- barblizzard
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,96,1,255); -- auspice
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,52,1,255); -- shell_v
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,47,1,255); -- protect_v
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,511,1,255); -- haste_ii
REPLACE INTO `mob_spell_lists` VALUES('Tangata_Manu',607,840,1,255); -- foil
-- Vidala (608)
REPLACE INTO `mob_spell_lists` VALUES('Vidala',608,190,1,255); -- stonega_iv
REPLACE INTO `mob_spell_lists` VALUES('Vidala',608,255,1,255); -- hreak
-- Vyala (609)
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,6,1,255); -- cure_vi
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,65,1,255); -- barwater
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,493,1,255); -- temper
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,47,1,255); -- protect_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,52,1,255); -- shell_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,286,1,255); -- addle
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,148,1,255); -- fire_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,153,1,255); -- blizzard_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,158,1,255); -- aero_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,163,1,255); -- stone_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,168,1,255); -- thunder_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,173,1,255); -- water_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,27,1,255); -- dia_v
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,316,1,255); -- enthunder_ii
REPLACE INTO `mob_spell_lists` VALUES('Vyala',609,365,1,255); -- breakga
-- Wepwawet (610)
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,189,1,255); -- stonega_iii
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,191,1,255); -- stonega_v
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,499,1,255); -- stoneja
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,163,1,255); -- stone_v
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,852,1,255); -- stone_vi
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,211,1,255); -- quake_ii
REPLACE INTO `mob_spell_lists` VALUES('Wepwawet',610,365,1,255); -- breakga
-- Brittlis (611)
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,503,1,255);  -- impact
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,227,1,255); -- poisonga_iii
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,356,1,255); -- paralyga
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,360,1,255); -- dispelga
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,361,1,255); -- blindga
REPLACE INTO `mob_spell_lists` VALUES('Brittlis',611,362,1,255); -- bindga
-- Umdhlebi (612)
REPLACE INTO `mob_spell_lists` VALUES('Umdhlebi',612,219,1,255); -- comet
REPLACE INTO `mob_spell_lists` VALUES('Umdhlebi',612,202,1,255); -- waterga_iv
REPLACE INTO `mob_spell_lists` VALUES('Umdhlebi',612,187,1,255); -- aeroga_iv
REPLACE INTO `mob_spell_lists` VALUES('Umdhlebi',612,192,1,255); -- stonega_iv
REPLACE INTO `mob_spell_lists` VALUES('Umdhlebi',612,817,1,255); -- geo-wilt
-- Fleetstalker (613)
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,191,1,255); -- stonega_iii
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,176,1,255); -- firaga_iii
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,163,1,255); -- stone_v
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,148,1,255); -- fire_v
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,205,1,255); -- Flare_ii
REPLACE INTO `mob_spell_lists` VALUES('Fleetstalker',613,365,1,255); -- breakga
-- Shockmaw (614)
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',614,501,1,255); -- waterja
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',614,173,1,255); -- water_v
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',614,854,1,255); -- water_vi
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',614,215,1,255); -- flood_ii
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',614,47,1,255); -- protect_v
-- Shockmaw (615)
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',615,500,1,255); -- thundaja
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',615,168,1,255); -- thunder_v
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',615,853,1,255); --thunder_vi
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',615,213,1,255); -- burst_ii
REPLACE INTO `mob_spell_lists` VALUES('Shockmaw',615,52,1,255); -- shell_v
-- Alpluachra (616)
REPLACE INTO `mob_spell_lists` VALUES('Alpluachra',616,184,1,255); -- aeroga_iii
REPLACE INTO `mob_spell_lists` VALUES('Alpluachra',616,357,1,255); -- slowga
REPLACE INTO `mob_spell_lists` VALUES('Alpluachra',616,359,1,255); -- silencega
REPLACE INTO `mob_spell_lists` VALUES('Alpluachra',616,286,1,255); -- addle
REPLACE INTO `mob_spell_lists` VALUES('Alpluachra',616,80,1,255); -- paralyze_ii
-- Bucca (617)
REPLACE INTO `mob_spell_lists` VALUES('Bucca',617,277,1,255); -- dread_spikes
REPLACE INTO `mob_spell_lists` VALUES('Bucca',617,248,1,255); -- aspir_ii
REPLACE INTO `mob_spell_lists` VALUES('Bucca',617,245,1,255); -- drain
REPLACE INTO `mob_spell_lists` VALUES('Bucca',617,199,1,255); -- waterga_iii
REPLACE INTO `mob_spell_lists` VALUES('Bucca',617,176,1,255); -- firaga_iii
-- Puca (618)
REPLACE INTO `mob_spell_lists` VALUES('Puca',618,176,1,255); -- firaga_iii
REPLACE INTO `mob_spell_lists` VALUES('Puca',618,358,1,255); -- hastega
REPLACE INTO `mob_spell_lists` VALUES('Puca',618,129,1,255); -- protectra_v
REPLACE INTO `mob_spell_lists` VALUES('Puca',618,134,1,255); -- shellra_v
---------------------------------------
-- Mob Skill lists
---------------------------------------
-- Kamohoalii 2nd list 2000
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1693); -- gnash
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1694); -- vile_belch
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1695); -- hypnic_lamp
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1696); -- seismic_tail
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1697); -- seaspray
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,1977); -- deathgnash (needs code)
INSERT INTO `mob_skill_lists` VALUES ('Kamohoalii',2000,2639); -- mayhem_lantern (needs code)
-- Shockmaw 451
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2868); -- echolocation
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2869); -- deep_sea_dirge
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2870); -- caudal_capacitor
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2871); -- baleen_gurge
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2872); -- depth_charge
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2873); -- blowhole_blast
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2874); -- angry_seas
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2875); -- waterspout
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,2876); -- thar_she_blows
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,3564); -- aetheric_pull (needs code)
REPLACE INTO `mob_skill_lists` VALUES ('Shockmaw',451,3565); -- necrotic_wave (needs code)
