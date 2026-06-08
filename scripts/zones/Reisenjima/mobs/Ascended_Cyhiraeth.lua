-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Cyhiraeth
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ASPHYXIATING_CYHIRAETH) do
    entity.phList[phId] = ID.mob.ASCENDED_CYHIRAETH
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
