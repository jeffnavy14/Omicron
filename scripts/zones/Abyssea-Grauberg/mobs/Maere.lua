-----------------------------------
-- Area: Abyssea Grauberg
--  Mob: Azdaja
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, isKiller)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3294)
        else
            local obtained = member:addItem(3294, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3294)
            end
        end
     end
end

return entity
