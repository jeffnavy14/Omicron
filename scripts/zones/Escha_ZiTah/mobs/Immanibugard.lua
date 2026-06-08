-----------------------------------
-- Area: Escha Zitah
--  Mob: Immanibugard
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_BUGARD) do
    entity.phList[phId] = ID.mob.IMMANIBUGARD
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
