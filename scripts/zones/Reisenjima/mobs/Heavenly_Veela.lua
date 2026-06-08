-----------------------------------
-- Area: Reisenjima
--  Mob: Heavenly_Veela
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}

local phGroups = {
    ID.mob.WANTON_DANAID,
    ID.mob.OFFICIOUS_UNSEELIE
}

for _, phGroup in ipairs(phGroups) do
    for _, phId in pairs(phGroup) do
        entity.phList[phId] = ID.mob.HEAVENLY_VEELA
    end
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
