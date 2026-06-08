-----------------------------------
-- Area: Escha Zitah
--  Mob: Hugemaw_Harold
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_WORM) do
    entity.phList[phId] = ID.mob.HUGEMAW_HAROLD
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
