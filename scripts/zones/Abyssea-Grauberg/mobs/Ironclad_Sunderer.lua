-----------------------------------
-- Area: Abyssea Grauberg
--  Mob: Ironclad SUnderer
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, isKiller)
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
