-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Carabosse
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end


entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2930)
        else
            local obtained = member:addItem(2930, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 2930)
            end
        end
     end
end

return entity
