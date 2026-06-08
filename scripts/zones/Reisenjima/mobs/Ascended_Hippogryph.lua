-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Hippogryph
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.QUARRELSOME_HIPPOGRYPH) do
    entity.phList[phId] = ID.mob.ASCENDED_HIPPOGRYPH
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
