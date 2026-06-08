-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Mosquito
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.DEVOURING_MOSQUITO) do
    entity.phList[phId] = ID.mob.ASCENDED_MOSQUITO
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
