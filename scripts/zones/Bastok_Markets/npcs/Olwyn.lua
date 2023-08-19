-----------------------------------
-- Area: Bastok Markets
--  NPC: Olwyn
-- Standard Merchant NPC
-- !pos -322.123 -10.319 -169.418 235
-----------------------------------
require("scripts/globals/events/harvest_festivals")
local ID = zones[xi.zone.BASTOK_MARKETS]
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.FLASK_OF_EYE_DROPS,  2698, 3,
        xi.items.ANTIDOTE,             328, 3,
        xi.items.FLASK_OF_ECHO_DROPS,  832, 2,
        xi.items.POTION,               946, 2,
        xi.items.ETHER,               5025, 1,
    }

    player:showText(npc, ID.text.OLWYN_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
