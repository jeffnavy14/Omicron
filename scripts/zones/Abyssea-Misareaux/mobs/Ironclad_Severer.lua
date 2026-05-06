-----------------------------------
-- Area: Abyssea Misareaux
--  Mob: Ironclad Severer
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:hideName(true)
    mob:setAnimationSub(5)
    mob:wait(500)
    mob:setMobMod(xi.mobMod.ROAM_DISTANCE,0)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO,1)
end

entity.onMobEngage = function(mob, target)
    mob:hideName(false)
    mob:setAnimationSub(4)
    mob:setUntargetable(false)
    mob:wait(500)
end

entity.onMobDisengage = function(mob)
    mob:hideName(true)
    mob:setAnimationSub(5)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
