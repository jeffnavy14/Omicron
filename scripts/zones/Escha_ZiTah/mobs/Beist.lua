-----------------------------------
-- Area: Escha Zitah
--  Mob: Beist
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_SHADOW_DRAGON) do
    entity.phList[phId] = ID.mob.BEIST
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
