-----------------------------------
-- Area: Escha Ruaun
--  Mob: Eschan_Zdei
-- Note: PH for Warder_of_Temperance
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
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
        xi.mob.phOnDespawn(mob, ID.mob.WARDER_OF_TEMPERANCE, rareEnemyMod, 180, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
