-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Poroggo
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.LENTIC_TOAD) do
    entity.phList[phId] = ID.mob.ASCENDED_POROGGO
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
