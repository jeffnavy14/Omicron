-----------------------------------
-- Area: Abyssea - Altepa
--   NM: Ironclad Smiter
-----------------------------------
local entity = {}

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3293)
        else
            local obtained = member:addItem(3293, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3293)
            end
        end
     end
end

return entity
