DELETE FROM mob_skill_lists WHERE skill_list_id = "1110";
DELETE FROM mob_skill_lists WHERE skill_list_id = "1046";
UPDATE mob_pools SET mJob = 4 WHERE poolid = "5983" AND `name` = 'balamor';
UPDATE mob_pools SET sJob = 8 WHERE poolid = "5983" AND `name` = 'balamor';
UPDATE mob_pools SET cmbDelay = 100 WHERE poolid = "5983" AND `name` = 'balamor';
UPDATE mob_pools SET cmbDelay = 100 WHERE poolid = "5995" AND `name` = 'aatt';
UPDATE mob_pools SET mJob = 16 WHERE poolid = "5995" AND `name` = 'aatt';
UPDATE mob_pools SET sJob = 4 WHERE poolid = "5995" AND `name` = 'aatt';
UPDATE mob_pools SET mJob = 14 WHERE poolid = "5931" AND `name` = 'moogle';
UPDATE mob_pools SET sJob = 19 WHERE poolid = "5931" AND `name` = 'moogle';
UPDATE mob_pools SET cmbSkill = 2 WHERE poolid = "5931" AND `name` = 'moogle';
UPDATE mob_pools SET cmbDelay = 80 WHERE poolid = "5931" AND `name` = 'moogle';
UPDATE mob_pools SET mJob = 22 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET sJob = 7 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbSkill = 3 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbDelay = 180 WHERE poolid = "5979" AND `name` = 'Selhteus';
UPDATE mob_pools SET cmbDmgMult = 105 WHERE poolid = "5979" AND `name` = 'Selhteus';
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Balamor',1098,102);      			  -- Guillotine
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Balamor',1098,935);    			  -- Amon Drive
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,144,13,255);               -- Fire
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,145,38,255);               -- Fire II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,146,62,255);               -- Fire III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,147,73,255);               -- Fire IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,148,86,255);               -- Fire V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,149,17,255);               -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,150,42,255);               -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,151,64,255);               -- Blizzard III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,152,74,255);               -- Blizzard IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,153,89,255);               -- Blizzard V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,154,9,255);                -- Aero
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,155,34,255);               -- Aero II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,156,59,255);               -- Aero III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,157,72,255);                -- Aero IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,158,83,255);               -- Aero V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,159,1,255);                -- Stone
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,160,26,255);               -- Stone II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,161,51,255);               -- Stone III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,162,68,255);               -- Stone IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,163,77,255);               -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,164,21,255);               -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,165,46,255);               -- Thunder II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,166,66,255);               -- Thunder III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,167,75,255);               -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,168,92,255);               -- Thunder V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,169,5,255);                -- Water
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,170,30,255);               -- Water II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,171,55,255);               -- Water III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,172,70,255);               -- Water IV
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,173,80,255);               -- Water V
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,252,45,255);               -- Stun
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,496,90,255);      	        -- Firaja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,497,93,255); 	        -- Blizzaja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,498,87,255);   	        -- Aeroja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,499,81,255);     	        -- Stoneja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,500,87,255);     	        -- Thundaja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,501,84,255);    	        -- Waterja
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,218,99,255); 	   	  -- Meteor
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,255,80,255); 		  -- Break
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,311,80,255); 		  -- Endark
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,367,80,255); 		  -- Death
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Balamor',396,245, 1, 255);         -- Drain
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,270,39,255); -- Absorb-int
INSERT INTO `mob_skill_lists` VALUES ('TRUST_AATT',1110,935);       -- Amon Drive
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,593,36,255); -- Magic Fruit
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,533,50,255); -- self Destruct
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,575,48,255); -- Jettatura
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,592,38,255); -- Blank Gaze
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,623,12,255); -- Head Butt
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,245,1,255);  -- Drain
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,311,80,255); -- Endark
INSERT INTO `mob_spell_lists` VALUES ('TRUST_AATT',408,604,61,255); -- Bad Breath
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,186);	-- Drain Samba 3		
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,128);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,129);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,130);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,131);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,132);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,133);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,134);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,135);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,136);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,137);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,138);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,139);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,140);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Moogle',1046,141);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,319,1,255); -- 	aisha_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,320,1,255);  -- 	katon_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,321,50,255); -- 	katon_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,322,80,255); -- 	katon_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,323,1,255); 	-- 	hyoton_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,324,50,255); 	-- 	hyoton_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,325,80,255);	-- 	hyoton_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,326,1,255);	-- 	huton_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,327,50,255);	-- 	huton_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,328,80,255);	-- 	huton_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,329,1,255); 	-- 	doton_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,330,50,255); 	-- 	doton_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,331,80,255);	-- 	doton_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,332,1,255);	-- 	raiton_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,333,50,255);	-- 	raiton_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,334,80,255); 	-- 	raiton_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,335,1,255); 	-- 	suiton_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,336,50,255);	-- 	suiton_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,337,80,255);	-- 	suiton_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,338,12,255);	-- 	utsusemi_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,339,37,255);	-- 	utsusemi_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,340,99,255);	-- 	utsusemi_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,341,1,255);	-- 	jubaku_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,342,50,255);	-- 	jubaku_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,343,80,255);	-- 	jubaku_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,344,1,255);	-- 	hojo_ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,345,50,255);	-- 	hojo_ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Moogle',343,346,80,255);	-- 	hojo_san
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,106,1,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,107,40,255);
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,108,1,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,110,30,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,111,45,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,55,25,255); 
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Selh_teus',392,99,45,255); 
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,1509);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,937);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,933);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Selh_teus',1094,1510);
