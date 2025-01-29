-----------------------------------
-- Area: Batallia Downs
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos 185.669 9.049 -614.025 105
-----------------------------------
local ID = zones[xi.zone.BATALLIA_DOWNS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getItemCount() == 1 and
        trade:hasItemQty(xi.item.LUMP_OF_SELBINA_CLAY, 1)
    then
        player:tradeComplete()
        player:addItem(xi.item.CLAY_TABLET)
        player:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.CLAY_TABLET)
        player:setCharVar('anExplorer-CurrentTablet', 0x10000)
    end
end

return entity
