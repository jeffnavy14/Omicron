-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_alectryon (???)
-- Spawns Alectryon
-- !pos -42 -8 34 45
-----------------------------------
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm9.lua
require('scripts/globals/abyssea')
require('scripts/globals/items')
=======
local ID = require('scripts/zones/Abyssea-Tahrongi/IDs')
require("scripts/globals/abyssea")
require("scripts/globals/items")
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_alectryon.lua
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
<<<<<<< HEAD:scripts/zones/Abyssea-Tahrongi/npcs/qm9.lua
    local ID = zones[player:getZoneID()]
=======
>>>>>>> upstream/base:scripts/zones/Abyssea-Tahrongi/npcs/qm_alectryon.lua
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.ALECTRYON, { xi.items.CHUNK_OF_COCKATRICE_TAILMEAT, xi.items.QUIVERING_EFT_EGG })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.CHUNK_OF_COCKATRICE_TAILMEAT, xi.items.QUIVERING_EFT_EGG })
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
