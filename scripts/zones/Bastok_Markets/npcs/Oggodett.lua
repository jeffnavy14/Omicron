-----------------------------------
-- Area: Bastok Markets
--  NPC: Oggodett
-- Aragoneu Regional Goods
-----------------------------------
local ID = zones[xi.zone.BASTOK_MARKETS]
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(xi.region.ARAGONEU) ~= xi.nation.BASTOK then
        player:showText(npc, ID.text.OGGODETT_CLOSED_DIALOG)
    else
        local stock =
        {
            xi.items.BAG_OF_HORO_FLOUR,           41,
            xi.items.EAR_OF_MILLIONCORN,          49,
            xi.items.EAR_OF_ROASTED_CORN,        128,
            xi.items.YAGUDO_FEATHER,              41,
            xi.items.HANDFUL_OF_SUNFLOWER_SEEDS, 104,
        }

        player:showText(npc, ID.text.OGGODETT_OPEN_DIALOG)
        xi.shop.general(player, stock, xi.quest.fame_area.BASTOK)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
