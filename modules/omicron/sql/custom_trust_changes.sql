-- Change Elviras default jobs
UPDATE mob_pools SET mJob = 17 WHERE poolid = "1198" AND `name` = 'Elivira';
UPDATE mob_pools SET mJob = 17 WHERE poolid = "5941" AND `name` = 'Elivira';

-- Change Semih lafihna default jobs
UPDATE mob_pools SET sJob = 1 WHERE poolid = "5940" AND `name` = 'semih_lafihna';
UPDATE mob_pools SET cmbSkill = 5 WHERE poolid = "5940" AND `name` = 'semih_lafihna';
UPDATE mob_pools SET cmbDelay = 200 WHERE poolid = "5940" AND `name` = 'semih_lafihna';
UPDATE mob_pools SET cmbDmgMult = 900 WHERE poolid = "5940" AND `name` = 'semih_lafihna';

-- Mob Skill List Elivira
DELETE FROM mob_skill_lists WHERE skill_list_id = "1056";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,1201);  -- Coronach (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,212);   -- Slug Shot (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,214);   -- Heavy Shot (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,209);   -- Split Shot (Elivira)
update mob_skills set primary_sc = 14 where mob_skill_id = 1201; -- made where Coronach can WS
update mob_skills set secondary_sc = 12 where mob_skill_id = 1201; -- made where Coronach can WS

-- Mob Skill List Halver
DELETE FROM mob_skill_lists WHERE skill_list_id = "1087";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,114);  -- Raiden Thrust
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,116);  -- Penta Thrust
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,120);  -- Impulse Drive

-- Maximilian job change
UPDATE mob_pools SET sJob = "13" WHERE poolid = "5975" AND `name` = 'maximilian';

-- Mob Skill List for Maximilian
DELETE FROM mob_skill_lists WHERE skill_list_id = "1090";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,32);  -- Fast Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,40);  -- Vorpal Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,41);  -- Swift Blade

-- Mob Spell List for Maximilian
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "388";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Maximilian',388,338,12,255);       -- Utsusemi: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Maximilian',388,339,37,255);       -- Utsusemi: Ni

-- Mob Skills Mayakov
DELETE FROM mob_skill_lists WHERE skill_list_id = "1081";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,41); -- Swift Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,40);  -- Vorpal Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,42);  -- Savage Blade

-- Mob Skills Leonoyne
DELETE FROM mob_skill_lists WHERE skill_list_id = "1089";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,60); -- Resolution
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,56); -- Ground Strike
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,55); -- Spinning Slash
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,58); -- Herculean Strike

-- Mob Skills Gilgamesh
DELETE FROM mob_skill_lists WHERE skill_list_id = "1053";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3434); -- Tachi Kamai
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3435); -- Iainuki
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3436); -- Tachi Gotem
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3437); -- Tachi Kasha

-- Mob Spells Leonoyne
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "387";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,149,20,255); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,150,46,255); -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,151,66,255); -- Blizzard III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,164,21,255); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,165,46,255); -- Thunder II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,166,66,255); -- Thunder III

-- Mob Skills Matsui-P(moogle)
DELETE FROM mob_skill_lists WHERE skill_list_id = "1148";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,128); -- Blade: Rin
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,129); -- Blade: Retsu
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,133); -- Blade: Ei
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,134); -- Blade: Jin
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,135); -- Blade: Ten
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,136); -- Blade: Ku
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,141); -- Blade: Shun
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,138); -- Blade: Kamu

-- Mob Spell List Matsui-P(moogle)
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "435";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,144,26,255); -- Fire
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,149,34,255); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,154,18,255); -- Aero
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,159,1,255);  -- Stone
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,164,42,255); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,169,10,255); -- Water
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,245,24,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,247,50,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,252,90,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,320,15,255); -- Katon: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,321,40,255); -- Katon: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,322,75,255); -- Katon: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,323,15,255); -- Hyoton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,324,40,255); -- Hyoton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,325,75,255); -- Hyoton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,326,15,255); -- Huton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,327,40,255); -- Huton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,328,75,255); -- Huton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,329,15,255); -- Doton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,330,40,255); -- Doton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,331,75,255); -- Doton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,332,15,255); -- Raiton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,333,40,255); -- Raiton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,334,75,255); -- Raiton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,335,15,255); -- Suiton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,336,40,255); -- Suiton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,337,75,255); -- Suiton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,338,12,255); -- Utsusemi: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,339,37,255); -- Utsusemi: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,340,99,255); -- Utsusemi: San

UPDATE mob_pools SET sJob = "4" WHERE poolid = "5931" AND name = 'moogle';
UPDATE mob_pools SET mJob = "13" WHERE poolid = "5931" AND name = 'moogle';
UPDATE mob_pools SET skill_list_id = "1148" WHERE poolid = "5931" AND name = 'moogle';
UPDATE mob_pools SET spellList = "435" WHERE poolid = "5931" AND name = 'moogle';

-- Mob Skills Lady Lilith(lilisette_ii)
DELETE FROM mob_skill_lists WHERE skill_list_id = "5019";
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "422";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4205";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4206";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4207";
-- INSERT INTO `mob_skills` VALUES (4205,1840,'lady_lilith_melee_a',0,7.0,2000,0,4,4,0,0,0,0,0);
-- INSERT INTO `mob_skills` VALUES (4206,1841,'lady_lilith_melee_b',0,7.0,2000,0,4,4,0,0,0,0,0);
-- INSERT INTO `mob_skills` VALUES (4207,1842,'lady_lilith_melee_c',0,7.0,2000,0,4,4,0,0,0,0,0);
-- INSERT INTO `mob_skill_lists` VALUES ('Lady_Lilith_Melee',5019,4205);
-- INSERT INTO `mob_skill_lists` VALUES ('Lady_Lilith_Melee',5019,4206);
-- INSERT INTO `mob_skill_lists` VALUES ('Lady_Lilith_Melee',5019,4207);

-- Mob Spell List Lady Lilith(lilisette_ii)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,144,13,255); -- fire (13~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,145,38,255); -- fire_ii (38~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,146,62,255); -- fire_iii (62~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,147,73,255); -- fire_iv (73~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,149,17,255); -- blizzard (17~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,150,42,255); -- blizzard_ii (42~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,151,64,255); -- blizzard_iii (64~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,152,74,255); -- blizzard_iv (74~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,154,9,255);  -- aero (9~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,155,34,255); -- aero_ii (34~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,156,59,255); -- aero_iii (59~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,157,72,82);  -- aero_iv (72~82)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,159,1,255);  -- stone (1~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,160,26,255); -- stone_ii (26~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,161,51,255); -- stone_iii (51~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,162,68,255); -- stone_iv (68~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,164,21,255); -- thunder (21~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,165,46,255); -- thunder_ii (46~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,166,66,255); -- thunder_iii (66~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,167,75,255); -- thunder_iv (75~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,169,5,255);  -- water (5~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,170,30,255); -- water_ii (30~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,171,55,255); -- water_iii (55~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,172,70,255); -- water_iv (70~255)
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,245,24,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,247,50,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('TRUST_LILISETTE_II',422,252,70,255); -- Stun

UPDATE mob_pools SET sJob = "5" WHERE poolid = "6013" AND name = 'lilisette_ii';
UPDATE mob_pools SET mJob = "4" WHERE poolid = "6013" AND name = 'lilisette_ii';
UPDATE mob_pools SET skill_list_id = "5019" WHERE poolid = "6013" AND name = 'lilisette_ii';

-- Mob Skills Demetrie(rughadjeen)
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1075";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1127);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1128);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1129);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1130);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1131);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1133);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rughadjeen',1075,1134);

-- Mob Spell List Demetrie(rughadjeen)
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "373";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,5,75,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,6,95,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,148,1,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,153,1,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,168,1,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rughadjeen',373,367,1,255);

UPDATE mob_pools SET sJob = 8 WHERE poolid = "5960" AND `name` = 'rughadjeen';

-- Mob Skills Mumor_II
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1130";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mumor_II',1130,2142);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mumor_II',1130,2144);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mumor_II',1130,2146);

UPDATE mob_pools SET sJob = 19 WHERE poolid = "6015" AND `name` = 'mumor_ii';

-- Mob Skills Balamor
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1098";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Balamor',1098,102);      			 
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Balamor',1098,935);

-- Mob Spell List Balamor
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "396";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,144,13,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,145,38,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,146,62,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,147,73,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,148,86,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,149,17,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,150,42,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,151,64,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,152,74,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,153,89,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,154,9,255);                
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,155,34,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,156,59,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,157,72,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,158,83,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,159,1,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,160,26,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,161,51,255);            
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,162,68,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,163,77,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,164,21,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,165,46,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,166,66,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,167,75,255);             
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,168,92,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,169,5,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,170,30,255);             
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,171,55,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,172,70,255);               
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,173,80,255);             
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,252,45,255);             
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,496,90,255);      	       
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,497,93,255); 	        
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,498,87,255);   	       
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,499,81,255);     	       
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,500,87,255);     	        
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,501,84,255);    	       
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,218,99,255); 	   	 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,255,80,255); 		 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,311,80,255); 		 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,367,80,255); 		
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,245,1,255);

UPDATE mob_pools SET mJob = 4 WHERE poolid = "5983" AND `name` = 'balamor';
UPDATE mob_pools SET sJob = 8 WHERE poolid = "5983" AND `name` = 'balamor';
UPDATE mob_pools SET cmbDelay = 100 WHERE poolid = "5983" AND `name` = 'balamor';

-- Mob Skills Rimuru(att)
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1110";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_AATT',1110,935); 

-- Mob Spell List Rimuru(att)  
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "408";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,270,39,255);       
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,593,36,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,533,50,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,575,48,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,592,38,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,623,12,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,245,1,255);  
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,311,80,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,604,61,255);

UPDATE mob_pools SET cmbDelay = 100 WHERE poolid = "5995" AND `name` = 'aatt';
UPDATE mob_pools SET mJob = 16 WHERE poolid = "5995" AND `name` = 'aatt';
UPDATE mob_pools SET sJob = 4 WHERE poolid = "5995" AND `name` = 'aatt';

-- Mob Spell Selh_teus 
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "392";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,106,1,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,107,40,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,108,1,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,110,30,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,111,45,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,55,25,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,99,45,255); 

-- Mob Skills List Selh_teus
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1094";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,1509);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,937);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,933);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,1510);

UPDATE mob_pools SET mJob = 22 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET sJob = 7 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbSkill = 3 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbDelay = 180 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbDmgMult = 105 WHERE poolid = "5979" AND `name` = 'Selhteus';

-- Mob Spell List Cait Sith(monberaux)
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "412";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,1,3,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,2,14,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,3,26,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,4,48,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,5,61,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,6,80,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,57,40,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,511,96,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,106,47,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,107,75,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,15,9,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,17,19,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,18,39,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,125,7,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,126,27,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,127,47,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,128,63,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,129,75,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,130,17,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,131,37,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,132,68,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,133,75,255);   
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Monberaux',412,134,32,255);

UPDATE mob_pools SET mJob = 3 WHERE poolid = "5999" AND `name` = 'monberaux';
UPDATE mob_pools SET sJob = 5 WHERE poolid = "5999" AND `name` = 'monberaux';

-- Mob Spell List AAMR
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1109";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_AAMR',1109,69);        
INSERT INTO `mob_skill_lists` VALUES ('TRUST_AAMR',1109,70);      
INSERT INTO `mob_skill_lists` VALUES ('TRUST_AAMR',1109,76);

UPDATE mob_pools SET mJob = 6 WHERE poolid = "5994" AND `name` = 'aamr';
UPDATE mob_pools SET sJob = 9 WHERE poolid = "5994" AND `name` = 'aamr';


-- Mob Spell List Kam'lanaut(rahal)
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "363";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rahal',363,5,75,255);              
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Rahal',363,107,77,255); 

  
-- Mob Skills List Kam'lanaut(rahal)
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1066"; 
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rahal',1066,40);          
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rahal',1066,47);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rahal',1066,225);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Rahal',1066,933);



