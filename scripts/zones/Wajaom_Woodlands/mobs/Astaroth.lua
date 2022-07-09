-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Astaroth
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Astaroth")
		mob:setModelId(1728)
end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity