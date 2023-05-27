-----------------------------------
-- Area: the_colloseum (zone 71)
-- Sprouted Seed (MAY T5 Fight) adds
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 1800)
end

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Sprouted Seed")
end

entity.onMobEngaged = function(mob, player)
end

entity.onMobFight = function(mob, player, target)
end

entity.onMobDeath = function(mob, player)
end

entity.onMobDespawn = function(mob)
end

return entity