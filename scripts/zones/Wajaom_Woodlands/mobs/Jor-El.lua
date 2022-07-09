-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Jor-El
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Jor-El")
		mob:setModelId(1427)
end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity