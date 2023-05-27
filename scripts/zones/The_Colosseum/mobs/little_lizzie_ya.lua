-----------------------------------
-- Area: the_colloseum (zone 71)
-- Little_Lizzie_Ya (June T5 Add)
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
---------------------------------------
local entity = {}

entity.onMobSpawn = function(mob, player)
	mob:renameEntity("Little Lizzie Ya")
end

entity.onMobEngaged = function(mob, player, target)
end

entity.onMobFight = function(mob, player, target)
	
end

entity.onMobDeath = function(mob, player)
end

entity.onMobDespawn = function(mob)
end

return entity