-----------------------------------
-- Area: Bastok_Mines
--  NPC: Mille
-- Norvallen Regional Merchant
-----------------------------------
local ID = zones[xi.zone.BASTOK_MINES]
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.NORVALLEN) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.MILLE_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.ARROWWOOD_LOG,         20,
            xi.items.POT_OF_CRYING_MUSTARD, 29,
            xi.items.POD_OF_BLUE_PEAS,      29,
            xi.items.ASH_LOG,               99,
        }

        player:showText(npc, ID.text.MILLE_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
