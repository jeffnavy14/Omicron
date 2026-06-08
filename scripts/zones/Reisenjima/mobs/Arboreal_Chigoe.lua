-----------------------------------
-- Area: Reisenjima
--  Mob: Arboreal_Chigoe
-- Note: PH for Ascended_Chigoe
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:setUntargetable(true)
    mob:hideName(true)
end

entity.onMobEngage = function(mob, target)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(2)
end

entity.onMobDisengage = function(mob)
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:setAnimationSub(0)
end

entity.onMobDeath = function(mob, player, optParams)
    local params =
    {
        immediate = true,
        spawnPoints = { { x = mob:getXPos(), y = mob:getYPos(), z = mob:getZPos() } }
    }

    local rareEnemyMod = 10 + player:getCharVar('[Vorseal]Rare Enemy')

    if not player:hasKeyItem(xi.ki.MOLLIFIER) then
        xi.mob.phOnDespawn(mob, ID.mob.ASCENDED_CHIGOE, rareEnemyMod, 180, params)
    end
end

entity.onMobDespawn = function(mob)

end

return entity
