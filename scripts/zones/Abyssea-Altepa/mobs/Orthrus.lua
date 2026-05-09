-----------------------------------
-- Area: Abyssea - Altepa
--   NM: Orthrus
-----------------------------------
local entity = {}

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3287)
        else
            local obtained = member:addItem(3287, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3287)
            end
        end
     end
end

return entity
