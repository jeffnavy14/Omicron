-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Faaz
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.INDOMITABLE_FAAZ) do
    entity.phList[phId] = ID.mob.ASCENDED_FAAZ
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
