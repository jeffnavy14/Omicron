-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Beetle
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.RAMPAGING_BEETLE) do
    entity.phList[phId] = ID.mob.ASCENDED_BEETLE
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
