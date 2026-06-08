-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Chapuli
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.AGITATED_CHAPULI) do
    entity.phList[phId] = ID.mob.ASCENDED_CHAPULI
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
