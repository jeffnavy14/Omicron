-----------------------------------
-- Area: Bastok Markets
--  NPC: Carmelide
-- Standard Merchant NPC
-- !pos -151.693 -4.819 -69.635 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.TOURMALINE,   1713, 2,
        xi.items.SARDONYX,     1713, 2,
        xi.items.AMETHYST,     1713, 2,
        xi.items.AMBER,        1713, 2,
        xi.items.LAPIS_LAZULI, 1713, 2,
        xi.items.CLEAR_TOPAZ,  1713, 2,
        xi.items.ONYX,         1713, 2,
        xi.items.LIGHT_OPAL,   1713, 2,
        xi.items.COPPER_RING,    79, 3,
    }

    player:showText(npc, ID.text.CARMELIDE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

return entity
