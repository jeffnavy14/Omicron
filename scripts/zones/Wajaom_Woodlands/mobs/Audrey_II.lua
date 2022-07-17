-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Audrey II
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Audrey II")
end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity