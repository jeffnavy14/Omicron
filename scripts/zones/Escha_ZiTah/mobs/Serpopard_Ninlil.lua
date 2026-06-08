-----------------------------------
-- Area: Escha Zitah
--  Mob: Serpopard_Ninlil
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_DHALMEL) do
    entity.phList[phId] = ID.mob.SERPOPARD_NINLIL
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
