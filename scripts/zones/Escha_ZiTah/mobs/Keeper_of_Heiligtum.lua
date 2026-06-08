-----------------------------------
-- Area: Escha Zitah
--  Mob: Keeper_of_Heiligtum
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ESCHAN_GOOBBUE) do
    entity.phList[phId] = ID.mob.KEEPER_OF_HEILIGTUM
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
