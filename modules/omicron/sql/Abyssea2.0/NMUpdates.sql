DELETE FROM mob_spawn_points WHERE mobid = 16961939;
UPDATE mob_groups SET spawntype = 0 WHERE poolid = "3632" AND `name` = 'Sippoy';
UPDATE mob_groups SET respawntime = 600 WHERE poolid = "3632" AND `name` = 'Sippoy';
UPDATE mob_groups SET spawntype = 0 WHERE poolid = "2323" AND `name` = 'Lamenter';
UPDATE mob_groups SET respawntime = 600 WHERE poolid = "2323" AND `name` = 'Lamenter';
UPDATE mob_pools SET aggro = 1 WHERE poolid = 4563;
UPDATE mob_pools SET true_detection = 1 WHERE poolid = 4563;
UPDATE mob_pools SET entityFlags = 0 WHERE poolid = 2092;
INSERT INTO `mob_spawn_points` VALUES (16961939,'Myrmecoleon','Myrmecoleon',49,-220,-1,-299,255);
INSERT INTO `mob_pets` VALUES (16961928,1,2,'Lachrymater','Myrmecoleon');


