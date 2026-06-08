-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Porxie
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.PORXIE) do
    entity.phList[phId] = ID.mob.ASCENDED_PORXIE
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
