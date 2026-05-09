-----------------------------------
-- Area: Abyssea Grauberg
--  Mob: Alfard
-----------------------------------
local entity = {}


entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, isKiller)
    local ID = zones[player:getZoneID()]
    local party = player:getParty()
     for _, member in pairs(party) do 
        if member:getFreeSlotsCount() == 0 then
            member:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 3291)
        else
            local obtained = member:addItem(3291, 1)
            if obtained then
               member:messageSpecial(ID.text.ITEM_OBTAINED, 3291)
            end
        end
     end
end

return entity
