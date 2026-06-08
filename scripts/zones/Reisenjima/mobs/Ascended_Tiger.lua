-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Tiger
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.SNAGGLETOOTHED_TIGER) do
    entity.phList[phId] = ID.mob.ASCENDED_TIGER
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
