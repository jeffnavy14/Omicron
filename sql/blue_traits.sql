SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for blue_traits
-- ----------------------------
DROP TABLE IF EXISTS `blue_traits`;
CREATE TABLE `blue_traits` (
  `trait_category` smallint(2) unsigned NOT NULL,
  `trait_points_needed` smallint(2) unsigned NOT NULL,
  `traitid` tinyint(3) unsigned NOT NULL,
  `modifier` smallint(5) unsigned NOT NULL,
  `value` smallint(5) NOT NULL,
  `tier` tinyint(3) unsigned NOT NULL,
  `job_points_only` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`trait_category`,`trait_points_needed`,`modifier`,`tier`)
) ENGINE=Aria TRANSACTIONAL=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `blue_traits` VALUES (1,2,32,230,8,1,0);     -- Beast Killer (1)
INSERT INTO `blue_traits` VALUES (2,2,9,370,1,1,0);      -- Auto Regen (1)
INSERT INTO `blue_traits` VALUES (3,2,35,227,8,1,0);     -- Lizard Killer (1)
INSERT INTO `blue_traits` VALUES (4,2,24,295,1,1,0);     -- Clear Mind (1)
INSERT INTO `blue_traits` VALUES (4,4,24,295,2,2,0);     -- Clear Mind (2)
INSERT INTO `blue_traits` VALUES (4,6,24,295,3,3,0);     -- Clear Mind (3)
INSERT INTO `blue_traits` VALUES (4,8,24,295,4,4,0);     -- Clear Mind (4)
INSERT INTO `blue_traits` VALUES (5,2,48,240,10,1,0);    -- Resist Sleep (1)
INSERT INTO `blue_traits` VALUES (6,2,5,28,20,1,0);      -- Magic Attack Bonus (1)
INSERT INTO `blue_traits` VALUES (7,2,39,231,8,1,0);     -- Undead Killer (1)
INSERT INTO `blue_traits` VALUES (8,2,3,23,10,1,0);      -- Attack Bonus (1)
INSERT INTO `blue_traits` VALUES (8,2,3,24,10,1,0);      -- Attack Bonus (1)
INSERT INTO `blue_traits` VALUES (9,2,11,359,25,1,0);    -- Rapid Shot (1)
INSERT INTO `blue_traits` VALUES (10,2,8,5,10,1,0);      -- Max MP Boost (1)
INSERT INTO `blue_traits` VALUES (10,4,8,5,20,2,0);      -- Max MP Boost (2)
INSERT INTO `blue_traits` VALUES (11,2,4,1,10,1,0);      -- Defense Bonus (1)
INSERT INTO `blue_traits` VALUES (12,2,33,229,8,1,0);    -- Plantoid Killer (1)
INSERT INTO `blue_traits` VALUES (13,2,6,29,10,1,0);     -- Magic Defense Bonus (1)
INSERT INTO `blue_traits` VALUES (14,8,10,369,1,1,0);    -- Auto Refresh (1)
INSERT INTO `blue_traits` VALUES (15,8,7,1095,30,1,0);   -- Max HP Boost (1)
INSERT INTO `blue_traits` VALUES (15,16,7,1095,60,2,0);  -- Max HP Boost (2)
INSERT INTO `blue_traits` VALUES (15,24,7,1095,120,3,0); -- Max HP Boost (3)
INSERT INTO `blue_traits` VALUES (15,32,7,1095,180,4,0); -- Max HP Boost (4)
INSERT INTO `blue_traits` VALUES (15,4,7,1095,240,5,1);  -- Max HP Boost (5) (JP only)
INSERT INTO `blue_traits` VALUES (15,4,7,1095,280,6,1);  -- Max HP Boost (6) (JP only)
INSERT INTO `blue_traits` VALUES (16,2,1,25,10,1,0);     -- Accuracy Bonus (1)
INSERT INTO `blue_traits` VALUES (16,2,1,26,10,1,0);     -- Accuracy Bonus (1)
INSERT INTO `blue_traits` VALUES (17,2,13,296,25,1,0);   -- Conserve MP (1)
INSERT INTO `blue_traits` VALUES (18,2,2,68,10,1,0);     -- Evasion Bonus (1)
INSERT INTO `blue_traits` VALUES (19,2,58,249,10,1,0);   -- Resist Gravity (1)
INSERT INTO `blue_traits` VALUES (20,2,14,73,10,1,0);    -- Store TP (1)
INSERT INTO `blue_traits` VALUES (20,4,14,73,15,2,0);    -- Store TP (2)
INSERT INTO `blue_traits` VALUES (20,6,14,73,20,3,0);    -- Store TP (3)
INSERT INTO `blue_traits` VALUES (20,8,14,73,25,4,1);    -- Store TP (4) (JP onry)
INSERT INTO `blue_traits` VALUES (20,10,14,73,30,5,1);   -- Store TP (5) (JP onry)
INSERT INTO `blue_traits` VALUES (21,2,17,291,10,1,0);   -- Counter (1)
INSERT INTO `blue_traits` VALUES (22,2,12,170,5,1,0);    -- Fast Cast (1)
INSERT INTO `blue_traits` VALUES (22,4,12,170,10,2,0);   -- Fast Cast (2)
INSERT INTO `blue_traits` VALUES (23,2,106,174,8,1,0);   -- Skillchain Bonus (1)
INSERT INTO `blue_traits` VALUES (24,2,15,288,7,0,0);    -- Double Attack (0) -- Tier Zero because this is weaker than WAR double attack (1). It is BLU exclusive
INSERT INTO `blue_traits` VALUES (24,4,16,302,5,1,0);    -- Triple Attack (1)
INSERT INTO `blue_traits` VALUES (25,2,18,259,10,1,0);   -- Dual Wield (1)
INSERT INTO `blue_traits` VALUES (25,4,18,259,15,2,0);   -- Dual Wield (2)
INSERT INTO `blue_traits` VALUES (25,6,18,259,25,3,0);   -- Dual Wield (3)
INSERT INTO `blue_traits` VALUES (26,2,70,306,15,1,0);   -- Zanshin (1)
INSERT INTO `blue_traits` VALUES (27,2,110,487,5,1,0);   -- Magic Burst Bonus (1)
INSERT INTO `blue_traits` VALUES (28,2,20,897,1,1,0);    -- Gilfinder (1)
INSERT INTO `blue_traits` VALUES (28,3,19,303,1,2,0);    -- Treasure Hunter (1)
