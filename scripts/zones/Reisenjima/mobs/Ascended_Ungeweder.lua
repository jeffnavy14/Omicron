-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Ungeweder
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}

local phGroups = {
    ID.mob.WATER_ELEMENTAL,
    ID.mob.THUNDER_ELEMENTAL
}

for _, phGroup in ipairs(phGroups) do
    for _, phId in pairs(phGroup) do
        entity.phList[phId] = ID.mob.ASCENDED_UNGEWEDER
    end
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
