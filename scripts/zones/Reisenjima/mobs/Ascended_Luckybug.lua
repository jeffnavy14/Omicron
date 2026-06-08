-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Luckybug
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.GLOWERING_LADYBUG) do
    entity.phList[phId] = ID.mob.ASCENDED_LUCKYBUG
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
