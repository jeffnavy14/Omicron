-----------------------------------
local controller = require("scripts/globals/di_controller")
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    controller.onSpawn(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    controller.onMinionDeath(mob)
end

entity.onMobDespawn = function(mob)

end

return entity