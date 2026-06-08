-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Naraka
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}

local phGroups = {
    ID.mob.PERFERVID_NARAKA,
    ID.mob.IGNOBLE_SKELETON
}

for _, phGroup in ipairs(phGroups) do
    for _, phId in pairs(phGroup) do
        entity.phList[phId] = ID.mob.ASCENDED_NARAKA
    end
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
