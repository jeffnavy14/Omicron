-----------------------------------
-- Area: Xarcabard [S]
--  Mob: Gidim
-----------------------------------
local ID = zones[xi.zone.XARCABARD_S]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)
    local params = { }
    xi.mob.phOnDespawn(mob, ID.mob.PRINCE_OROBAS, 10, 3600, params) -- 1 hour minimum
end

return entity
