-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Gefyrst
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.WATER_ELEMENTAL) do
    entity.phList[phId] = ID.mob.ASCENDED_GEFYRST
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
