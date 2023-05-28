-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_lacovie (???)
-- Spawns Lacovie
-- !pos -325 23 432 45
-- !pos -336 24 442 45
-- !pos -316 24 442 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm18.lua
require('scripts/globals/abyssea')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_lacovie.lua
require('scripts/globals/keyitems')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm18.lua
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.LACOVIE_1, { xi.ki.OVERGROWN_MANDRAGORA_FLOWER, xi.ki.CHIPPED_SANDWORM_TOOTH })
=======
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.LACOVIE_1, { xi.ki.CHIPPED_SANDWORM_TOOTH, xi.ki.OVERGROWN_MANDRAGORA_FLOWER })
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_lacovie.lua
end

entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.qmOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.qmOnEventFinish(player, csid, option)
end

return entity
