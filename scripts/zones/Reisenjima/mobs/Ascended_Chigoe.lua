-----------------------------------
-- Area: Reisenjima
--  Mob: Ascended_Chigoe
-----------------------------------
local ID = zones[xi.zone.REISENJIMA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.phList = {}
for _, phId in pairs(ID.mob.ARBOREAL_CHIGOE) do
    entity.phList[phId] = ID.mob.ASCENDED_CHIGOE
end

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

end

entity.onMobDespawn = function(mob)

end

return entity
