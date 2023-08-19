-----------------------------------
-- Area: Port Bastok
--  NPC: Evelyn
-- Gustaberg Regional Merchant
-----------------------------------
local ID = zones[xi.zone.PORT_BASTOK]
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.GUSTABERG) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.EVELYN_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.PINCH_OF_SULFUR,  795,
            xi.items.POPOTO,            49,
            xi.items.BAG_OF_RYE_FLOUR,  41,
            xi.items.EGGPLANT,          45,
        }

        player:showText(npc, ID.text.EVELYN_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
