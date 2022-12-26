-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm20 (???)
-- Spawns Glavoid
-- !pos 211 33 400 45
-----------------------------------
require('scripts/globals/abyssea')
require('scripts/globals/keyitems')
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- xi.abyssea.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local ID = zones[player:getZoneID()]
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.GLAVOID_2, { xi.ki.FAT_LINED_COCKATRICE_SKIN, xi.ki.SODDEN_SANDWORM_HUSK, xi.ki.LUXURIANT_MANTICORE_MANE, xi.ki.STICKY_GNAT_WING })
end

entity.onEventUpdate = function(player, csid, option)
    xi.abyssea.qmOnEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.qmOnEventFinish(player, csid, option)
end

return entity
