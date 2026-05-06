-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Ulhuadshi
-----------------------------------

local entity = {}

entity.onMobInitialize = function(mob)

end


entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 2963)
        else
            local obtained = member:addItem(2963, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 2963)
            end
        end
     end
end

return entity
