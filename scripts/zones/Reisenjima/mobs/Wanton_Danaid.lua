-----------------------------------
-- Area: Reisenjima
--  Mob: Wanton_Danaid
-- Note: PH for Heavenly_Veela
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    local rareEnemyMod = 10 + player:getCharVar('[Vorseal]Rare Enemy')

    if not player:hasKeyItem(xi.ki.MOLLIFIER) then
        xi.mob.phOnDespawn(mob, ID.mob.HEAVENLY_VEELA, rareEnemyMod, 180, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
