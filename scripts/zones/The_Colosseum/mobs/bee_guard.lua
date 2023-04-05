-----------------------------------
-- Area: the_colloseum (zone 71)
-- Bee_Guard (MAY T3 Fight) adds
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Bee Guard")
end

entity.onMobEngaged = function(mob, player)
end

entity.onMobFight = function(mob, player, target)
	mob:useMobAbility(336)
end

entity.onMobDeath = function(mob, player)
end

entity.onMobDespawn = function(mob)
end

return entity