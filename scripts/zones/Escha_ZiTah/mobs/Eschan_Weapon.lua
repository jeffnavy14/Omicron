-----------------------------------
-- Area: Escha Zitah
--  Mob: Eschan Weapon
-- Note: PH for Jester_Malatrix
-----------------------------------
local ID = zones[xi.zone.ESCHA_ZITAH]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    local rareEnemyMod = 10
    local hasMollifier = false

    if player then
        rareEnemyMod = rareEnemyMod + player:getCharVar('[Vorseal]Rare Enemy')
        hasMollifier = player:hasKeyItem(xi.ki.MOLLIFIER)
    end

    if not hasMollifier then
        xi.mob.phOnDespawn(mob, ID.mob.JESTER_MALATRIX, rareEnemyMod, 180, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
