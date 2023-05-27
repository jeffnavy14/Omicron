-----------------------------------
-- Area: the_colloseum (zone 71)
-- deme_shadow (June T5 Add)
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
---------------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Deme's Shadow")
end

entity.onMobEngaged = function(mob, player, target)
	
end

entity.onMobFight = function(mob, player, target)
	mob:useMobAbility(1127)
	mob:timer(6000, function(mob)
		local Shadow = mob:getID()					
		DespawnMob(Shadow)
	end)
end

entity.onMobDeath = function(mob, player)
end

entity.onMobDespawn = function(mob)
end

return entity