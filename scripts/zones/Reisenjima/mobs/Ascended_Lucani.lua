-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Lucani
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.LUCANI) do
    entity.phList[phId] = ID.mob.ASCENDED_LUCANI
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
