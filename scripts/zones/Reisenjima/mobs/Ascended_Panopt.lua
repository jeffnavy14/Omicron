-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Panopt
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.OBSTREPEROUS_PANOPT) do
    entity.phList[phId] = ID.mob.ASCENDED_PANOPT
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
