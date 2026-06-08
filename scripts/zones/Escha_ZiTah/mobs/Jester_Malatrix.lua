-----------------------------------
-- Area: Escha Zitah
--  Mob: Jester_Malatrix
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_WEAPON) do
    entity.phList[phId] = ID.mob.JESTER_MALATRIX
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
