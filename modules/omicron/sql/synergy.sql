-- To enable all recipes in this list use replace fonction, do a replace (-- INSERT INTO) for (INSERT INTO) -> replace all
-- Don't forget to reload the file into your database with dbtool.py -> update DB
-- Understand that those recipes might be either innacurate or known to be wrong.
-- Source is BG Wiki, currently set up to assume required rank means lowest level of that rank except for amateur (if recruit required, then assumed level 10 required)
-- Unless ontherwise stated on BGWiki all recipes are currently assumed to cap their rank
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `synergy_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synergy_recipes` (
  `ID` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Synergy` tinyint(3) unsigned NOT NULL,
  `Wood` tinyint(3) unsigned NOT NULL,
  `Smith` tinyint(3) unsigned NOT NULL,
  `Gold` tinyint(3) unsigned NOT NULL,
  `Cloth` tinyint(3) unsigned NOT NULL,
  `Leather` tinyint(3) unsigned NOT NULL,
  `Bone` tinyint(3) unsigned NOT NULL,
  `Alchemy` tinyint(3) unsigned NOT NULL,
  `Cook` tinyint(3) unsigned NOT NULL,
  `Earth` tinyint(3) unsigned NOT NULL,
  `Fire` tinyint(3) unsigned NOT NULL,
  `Wind` tinyint(3) unsigned NOT NULL,
  `Water` tinyint(3) unsigned NOT NULL,
  `Ice` tinyint(3) unsigned NOT NULL,
  `Thunder` tinyint(3) unsigned NOT NULL,
  `Light` tinyint(3) unsigned NOT NULL,
  `Dark` tinyint(3) unsigned NOT NULL,
  `Ingredient1` smallint(5) unsigned NOT NULL,
  `Ingredient2` smallint(5) unsigned NOT NULL,
  `Ingredient3` smallint(5) unsigned NOT NULL,
  `Ingredient4` smallint(5) unsigned NOT NULL,
  `Ingredient5` smallint(5) unsigned NOT NULL,
  `Ingredient6` smallint(5) unsigned NOT NULL,
  `Ingredient7` smallint(5) unsigned NOT NULL,
  `Ingredient8` smallint(5) unsigned NOT NULL,
  `Result` smallint(5) unsigned NOT NULL,
  `ResultHQ1` smallint(5) unsigned NOT NULL,
  `ResultHQ2` smallint(5) unsigned NOT NULL,
  `ResultHQ3` smallint(5) unsigned NOT NULL,
  `ResultQty` tinyint(2) unsigned NOT NULL,
  `ResultHQ1Qty` tinyint(2) unsigned NOT NULL,
  `ResultHQ2Qty` tinyint(2) unsigned NOT NULL,
  `ResultHQ3Qty` tinyint(2) unsigned NOT NULL,
  `ResultName` tinytext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3500 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=79;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Amateur (1-9) Synergy(Syn) is cap, rest is level required
INSERT INTO `synergy_recipes` VALUES (1,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27899,27899,0,0,0,0,0,0,27898,27898,27898,27898,1,1,1,1,'Alliance Shirt +1'); -- Alliance Shirt +1		
INSERT INTO `synergy_recipes` VALUES (2,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27757,27757,0,0,0,0,0,0,27758,27758,27758,27758,1,1,1,1,'Bomb Masque +1'); -- Bomb Masque +1
INSERT INTO `synergy_recipes` VALUES (3,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27765,27765,0,0,0,0,0,0,27760,27760,27760,27760,1,1,1,1,'Chocobo Masque +1'); -- Chocobo Masque +1
INSERT INTO `synergy_recipes` VALUES (4,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27911,27911,0,0,0,0,0,0,27906,27906,27906,27906,1,1,1,1,'Chocobo Suit +1'); -- Chocobo Suit +1
INSERT INTO `synergy_recipes` VALUES (5,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,25652,25652,0,0,0,0,0,0,25669,25669,25669,25669,1,1,1,1,'Crab Cap +1'); -- Crab Cap +1
INSERT INTO `synergy_recipes` VALUES (6,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,20532,20532,0,0,0,0,0,0,20533,20533,20533,20533,1,1,1,1,'Worm Feelers +1'); -- Worm Feelers +1
INSERT INTO `synergy_recipes` VALUES (7,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27717,27717,0,0,0,0,0,0,27718,27718,27718,27718,1,1,1,1,'Worm Masque +1'); -- Worm Masque +1
INSERT INTO `synergy_recipes` VALUES (8,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27625,27625,0,0,0,0,0,0,27626,27626,27626,27626,1,1,1,1,'Cassie\'s Shield'); -- Cassie's Shield
INSERT INTO `synergy_recipes` VALUES (9,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,21107,21107,0,0,0,0,0,0,21108,21108,21108,21108,1,1,1,1,'Kyuka Uchiwa +1'); -- Kyuka Uchiwa +1
INSERT INTO `synergy_recipes` VALUES (10,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,26693,26693,0,0,0,0,0,0,26694,26694,26694,26694,1,1,1,1,'Cassie\'s Cap'); -- Cassie's Cap
INSERT INTO `synergy_recipes` VALUES (11,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,27631,27631,0,0,0,0,0,0,27632,27632,27632,27632,1,1,1,1,'Cait Sith Guard +1'); -- Cait Sith Guard +1
INSERT INTO `synergy_recipes` VALUES (12,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,26703,26703,0,0,0,0,0,0,26704,26704,26704,26704,1,1,1,1,'Lycopodium Masque +1'); -- Lycopodium Masque +1
INSERT INTO `synergy_recipes` VALUES (13,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,26717,26717,0,0,0,0,0,0,26718,26718,26718,26718,1,1,1,1,'Cait Sith Cap +1'); -- Cait Sith Cap +1
INSERT INTO `synergy_recipes` VALUES (14,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,26719,26719,0,0,0,0,0,0,26720,26720,26720,26720,1,1,1,1,'Sheep Cap +1'); -- Sheep Cap +1
INSERT INTO `synergy_recipes` VALUES (15,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,21095,21095,0,0,0,0,0,0,21096,21096,21096,21096,1,1,1,1,'Heartbeater +1'); -- Heartbeater +1
INSERT INTO `synergy_recipes` VALUES (16,9,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,26738,26738,0,0,0,0,0,0,26739,26739,26739,26739,1,1,1,1,'Leafkin_Cap +1'); -- Leafkin Cap +1
INSERT INTO `synergy_recipes` VALUES (17,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,5,20713,20713,0,0,0,0,0,0,20714,20714,20714,20714,1,1,1,1,'Excalipoor II'); -- Excalipoor II
INSERT INTO `synergy_recipes` VALUES (18,9,0,0,0,0,0,0,0,0,5,5,0,0,0,0,0,0,9079,9080,9081,0,0,0,0,0,3585,3585,3585,3585,1,1,1,1,'Galley Kitchen'); -- Galley Kitchen
INSERT INTO `synergy_recipes` VALUES (19,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,26956,26956,0,0,0,0,0,0,26957,26957,26957,26957,1,1,1,1,'Poroggo Coat +1'); -- Poroggo Coat +1
INSERT INTO `synergy_recipes` VALUES (20,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,21153,21153,0,0,0,0,0,0,21154,21154,21154,21154,1,1,1,1,'Malice Masher +1'); -- Malice Masher +1
INSERT INTO `synergy_recipes` VALUES (21,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,21086,21086,0,0,0,0,0,0,21087,21087,21087,21087,1,1,1,1,'Heartstopper +1'); -- Heartstopper +1
INSERT INTO `synergy_recipes` VALUES (22,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,25632,25632,0,0,0,0,0,0,25633,25633,25633,25633,1,1,1,1,'Carbie Cap +1'); -- Carbie Cap +1
INSERT INTO `synergy_recipes` VALUES (23,9,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,25713,25713,0,0,0,0,0,0,25714,25714,25714,25714,1,1,1,1,'Track Shirt +1'); -- Track Shirt +1
INSERT INTO `synergy_recipes` VALUES (24,9,0,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,27325,27325,0,0,0,0,0,0,27326,27326,27326,27326,1,1,1,1,'Track Pants +1'); -- Track Pants +1
INSERT INTO `synergy_recipes` VALUES (25,9,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,25758,25758,0,0,0,0,0,0,25759,25759,25759,25759,1,1,1,1,'Rhapsody Shirt +1'); -- Rhapsody Shirt +1
INSERT INTO `synergy_recipes` VALUES (26,9,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,25670,25670,0,0,0,0,0,0,25671,25671,25671,25671,1,1,1,1,'Rarab Cap +1'); -- Rarab Cap +1
INSERT INTO `synergy_recipes` VALUES (27,9,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,25672,25672,0,0,0,0,0,0,25673,25673,25673,25673,1,1,1,1,'Snoll Masque +1'); -- Snoll Masque +1
INSERT INTO `synergy_recipes` VALUES (28,9,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,22017,22017,0,0,0,0,0,0,22018,22018,22018,22018,1,1,1,1,'Seika Uchiwa +1'); -- Seika Uchiwa +1
INSERT INTO `synergy_recipes` VALUES (29,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,25586,25586,0,0,0,0,0,0,25587,25587,25587,25587,1,1,1,1,'Kakai Cap +1'); -- Kakai Cap +1
INSERT INTO `synergy_recipes` VALUES (30,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10384,10384,0,0,0,0,0,0,10385,10385,10385,10385,1,1,1,1,'Cumulus Masque +1'); -- Cumulus Masque +1
INSERT INTO `synergy_recipes` VALUES (31,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,25677,25677,0,0,0,0,0,0,25678,25678,25678,25678,1,1,1,1,'Arthro\'s Cap +1'); -- Arthro's Cap +1
INSERT INTO `synergy_recipes` VALUES (32,9,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,25675,25675,0,0,0,0,0,0,25679,25679,25679,25679,1,1,1,1,'White Rarab Cap +1'); -- White Rarab Cap +1
INSERT INTO `synergy_recipes` VALUES (33,9,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,20668,20668,0,0,0,0,0,0,20669,20669,20669,20669,1,1,1,1,'Firetongue +1'); -- Firetongue +1
INSERT INTO `synergy_recipes` VALUES (34,9,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,20666,20666,0,0,0,0,0,0,20667,20667,20667,20667,1,1,1,1,'Blizzard Brand +1'); -- Blizzard Brand +1
INSERT INTO `synergy_recipes` VALUES (35,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,26410,26410,0,0,0,0,0,0,26411,26411,26411,26411,1,1,1,1,'Diamond Buckler +1'); -- Diamond Buckler +1
INSERT INTO `synergy_recipes` VALUES (36,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,21965,21965,0,0,0,0,0,0,21966,21966,21966,21966,1,1,1,1,'Zanmato +1'); -- Zanmato +1
INSERT INTO `synergy_recipes` VALUES (37,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,21820,21820,0,0,0,0,0,0,21821,21821,21821,21821,1,1,1,1,'Lost Sickle +1'); -- Lost Sickle +1
INSERT INTO `synergy_recipes` VALUES (38,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,22124,22124,0,0,0,0,0,0,22132,22132,22132,22132,1,1,1,1,'Artemis\'s Bow +1'); -- Artemis's Bow +1
INSERT INTO `synergy_recipes` VALUES (39,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,21867,21867,0,0,0,0,0,0,21868,21868,21868,21868,1,1,1,1,'Sha Wujing\'s Lance +1'); -- Sha Wujing's Lance +1
INSERT INTO `synergy_recipes` VALUES (40,9,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,20578,20578,0,0,0,0,0,0,20568,20568,20568,20568,1,1,1,1,'Wind_Knife +1'); -- Wind Knife +1
INSERT INTO `synergy_recipes` VALUES (41,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,20570,9892,0,0,0,0,0,0,20569,20569,20569,20569,1,1,1,1,'Esikuva'); -- Esikuva
INSERT INTO `synergy_recipes` VALUES (42,9,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,21977,21977,0,0,0,0,0,0,21978,21978,21978,21978,1,1,1,1,'Mutsunokami +1'); -- Mutsunokami +1
INSERT INTO `synergy_recipes` VALUES (43,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,26514,26514,0,0,0,0,0,0,26515,26515,26515,26515,1,1,1,1,'Poroggo Fleece +1'); -- Poroggo Fleece +1
INSERT INTO `synergy_recipes` VALUES (44,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,23753,23753,0,0,0,0,0,0,23754,23754,23754,23754,1,1,1,1,'Sandogasa +1'); -- Sandogasa +1
INSERT INTO `synergy_recipes` VALUES (45,9,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,22153,22153,0,0,0,0,0,0,22154,22154,22154,22154,1,1,1,1,'Silver Gun +1'); -- Silver Gun +1
INSERT INTO `synergy_recipes` VALUES (46,9,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0,23800,23800,0,0,0,0,0,0,23801,23801,23801,23801,1,1,1,1,'Cancrine Apron +1'); -- Cancrine Apron +1
INSERT INTO `synergy_recipes` VALUES (47,9,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,22045,22045,0,0,0,0,0,0,22046,22046,22046,22046,1,1,1,1,'Feline Hagoita +1'); -- Feline Hagoita +1
INSERT INTO `synergy_recipes` VALUES (48,9,0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,23803,23803,0,0,0,0,0,0,23804,23804,23804,23804,1,1,1,1,'Poroggo Cassock +1'); -- Poroggo Cassock +1
INSERT INTO `synergy_recipes` VALUES (49,9,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,25911,25911,0,0,0,0,0,0,25912,25912,25912,25912,1,1,1,1,'Denim Pants +1'); -- Denim Pants +1
INSERT INTO `synergy_recipes` VALUES (50,9,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,23810,23810,0,0,0,0,0,0,23811,23811,23811,23811,1,1,1,1,'Knit Cap +1'); -- Knit Cap +1
INSERT INTO `synergy_recipes` VALUES (51,3,0,0,0,0,0,0,30,0,0,0,0,35,0,0,0,0,638,926,4509,4112,0,0,0,0,0,4113,4114,4115,2,2,2,2,'Potion'); -- Potion (NQ > +3 )
INSERT INTO `synergy_recipes` VALUES (52,4,0,0,0,0,0,0,0,10,10,0,0,28,0,0,0,0,4389,4389,4389,4389,0,0,0,0,17861,17861,17861,17861,2,4,8,12,'Famous Carrot Broth'); -- Famous Carrot Broth
INSERT INTO `synergy_recipes` VALUES (53,5,0,0,0,0,0,0,0,0,0,10,0,0,0,0,10,10,2793,2794,2795,2796,2797,2798,0,0,2799,2799,2799,2799,1,1,1, 1,'Astral Matter'); -- Astral Matter
INSERT INTO `synergy_recipes` VALUES (54,7,0,0,0,0,0,0,0,10,0,0,0,30,0,0,0,0,4392,4392,4392,4392,0,0,0,0,4422,4422,4422,4422,1,2,3,4,'Orange Juice'); -- Orange Juice
INSERT INTO `synergy_recipes` VALUES (55,8,0,0,0,0,0,0,0,10,12,0,0,27,0,0,0,0,4382,4382,4571,4571,0,0,0,0,17865,17865,17865,17865,2,4,8,12,'Singing Herbal Broth'); -- Singing Herbal Broth
INSERT INTO `synergy_recipes` VALUES (56,9,0,0,0,0,0,0,40,0,0,0,0,40,0,0,0,0,622,922,923,4509,0,0,0,0,4128,4129,4130,4131,2,2,2,2,'Ether'); -- Ether
-- Recruit (10-19) Synergy(Syn) is cap, rest is level required
INSERT INTO `synergy_recipes` VALUES (57,10,0,0,0,0,0,0,10,0,0,16,34,0,0,0,0,17395,17395,17397,17397,0,0,0,0,17863,17863,17863,17863,2,4,8,12,'Quadav Bug Broth'); -- Quadav Bug Broth
INSERT INTO `synergy_recipes` VALUES (58,19,19,0,0,0,0,0,9,0,10,0,0,0,0,0,0,30,265,266,267,269,0,0,0,0,279,279,279,279,1,1,1,1,'Shadow Lord Statue II'); -- Shadow Lord Statue II
INSERT INTO `synergy_recipes` VALUES (59,19,19,0,0,0,0,0,9,0,12,0,0,0,0,0,0,35,269,281,0,0,0,0,0,0,280,280,280,280,1,1,1,1,'Shadow Lord Statue III'); -- Shadow Lord Statue III
INSERT INTO `synergy_recipes` VALUES (60,19,19,0,0,0,0,0,9,0,15,0,0,0,0,0,0,40,269,279,280,0,0,0,0,0,3679,3679,3679,3679,1,1,1,1,'Beastman Gonfalon'); -- Beastman Gonfalon
INSERT INTO `synergy_recipes` VALUES (61,11,0,0,0,0,0,0,0,20,0,0,0,40,0,0,0,0,4363,4363,4363,4363,0,0,0,0,4423,4423,4423,4423,1,2,3,4,'Apple Juice'); -- Apple Juice
INSERT INTO `synergy_recipes` VALUES (62,19,0,0,0,0,0,0,0,10,0,0,0,29,0,0,0,18,1111,4358,4358,16995,0,0,0,0,17867,17867,17867,17867,2,4,8,12,'Cold Carrion Broth'); -- Cold Carrion Broth
INSERT INTO `synergy_recipes` VALUES (63,13,0,0,0,0,0,0,50,0,0,0,0,45,0,0,0,0,638,638,920,4509,0,0,0,0,4116,4117,4118,4119,2,2,2,2,'Hi-Potion'); -- Hi-Potion (NQ -> +3)
INSERT INTO `synergy_recipes` VALUES (64,13,0,0,0,0,0,0,50,0,0,0,0,45,0,0,0,0,638,638,2513,4509,0,0,0,0,4116,4117,4118,4119,2,2,2,2,'Hi-Potion'); -- Hi-Potion (NQ -> +3)
INSERT INTO `synergy_recipes` VALUES (65,13,0,0,0,0,0,0,50,0,0,0,0,45,0,0,0,0,638,638,2361,4509,0,0,0,0,4116,4117,4118,4119,2,2,2,2,'Hi-Potion'); -- Hi-Potion (NQ -> +3)
INSERT INTO `synergy_recipes` VALUES (66,14,9,0,0,0,0,0,0,0,19,0,0,16,0,0,0,30,623,690,0,0,0,0,0,0,17869,17869,17869,17869,1,2,3,4,'Rich Humus'); -- Rich Humus
INSERT INTO `synergy_recipes` VALUES (67,15,0,0,0,0,0,0,0,30,0,0,0,50,0,0,0,0,4432,4432,0,0,0,0,0,0,4442,4442,4442,4442,1,2,3,4,'Pineapple Juice'); -- Pineapple Juice
INSERT INTO `synergy_recipes` VALUES (68,19,0,0,0,0,0,0,0,10,13,0,0,21,0,0,0,0,17396,17397,0,0,0,0,0,0,17905,17905,17905,17905,6,8,10,12,'Wormy Broth'); -- Wormy Broth
INSERT INTO `synergy_recipes` VALUES (69,19,19,0,0,0,0,0,0,0,27,0,0,20,0,35,0,0,627,694,0,0,0,0,0,0,17873,17873,17873,17873,1,2,3,4,'Scarlet Sap'); -- Scarlet Sap
INSERT INTO `synergy_recipes` VALUES (70,17,0,0,0,0,0,0,50,0,0,0,0,50,0,0,0,0,622,622,922,922,922,922,923,4509,4132,4133,4134,4135,2,2,2,2,'Hi-Ether'); -- Hi-Ether (NQ -> +3)
INSERT INTO `synergy_recipes` VALUES (71,17,0,0,0,0,0,0,50,0,0,0,0,50,0,0,0,0,622,622,923,2335,4509,0,0,0,4132,4133,4134,4135,2,2,2,2,'Hi-Ether'); -- Hi-Ether (NQ -> +3)
INSERT INTO `synergy_recipes` VALUES (72,19,0,60,0,0,0,0,0,0,35,53,12,0,0,0,0,0,1744,2153,2153,2563,2563,0,0,0,2363,2363,2363,2363,1,2,3,4,'Firebrick'); -- Firebrick
INSERT INTO `synergy_recipes` VALUES (73,19,0,0,0,0,0,0,0,40,0,0,0,60,0,0,0,0,4412,4491,0,0,0,0,0,0,4424,4424,4424,4424,1,2,3,4,'Melon Juice'); -- Melon Juice

/*!40000 ALTER TABLE `synergy_recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;