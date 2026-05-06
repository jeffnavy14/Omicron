-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Chloris
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2928)
        else
            local obtained = member:addItem(2928, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 2928)
            end
        end
     end
end

return entity
