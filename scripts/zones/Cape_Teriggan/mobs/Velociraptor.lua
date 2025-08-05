-----------------------------------
-- Area: Cape Teriggan
--  Mob: Velociraptor
-- Note: Place holder Killer Jonny
-----------------------------------
local ID = zones[xi.zone.CAPE_TERIGGAN]
-----------------------------------
---@type TMobEntity
local entity = {}

local jonnyPHList =
{
    [ID.mob.KILLER_JONNY - 14] = ID.mob.KILLER_JONNY, -- -41.000 0.351 120.000
}

local jonnySpawnPoints =
{
    { x = -90.636, y = -8.859, z = 152.899 },
    { x = -80.809, y = -7.032, z = 147.464 },
    { x = -77.167, y = -8.000, z = 156.316 },
    { x = -61.131, y = -7.005, z = 151.069 },
    { x = -54.285, y = -8.151, z = 165.535 },
    { x = -35.874, y = -8.162, z = 166.132 },
}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 106, 2, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 107, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    local params = {}
    params.spawnPoints = jonnySpawnPoints
    xi.mob.phOnDespawn(mob, jonnyPHList, 15, utils.hours(2), params)
end

return entity
