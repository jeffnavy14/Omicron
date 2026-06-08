-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Mantis
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.TERRITORIAL_MANTIS) do
    entity.phList[phId] = ID.mob.ASCENDED_MANTIS
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
