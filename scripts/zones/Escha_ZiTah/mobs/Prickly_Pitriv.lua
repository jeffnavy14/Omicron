-----------------------------------
-- Area: Escha Zitah
--  Mob: Prickly_Pitriv
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_CRAWLER) do
    entity.phList[phId] = ID.mob.PRICKLY_PITRIV
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
