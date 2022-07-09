-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Tien Lung
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Tien Lung")
		mob:setModelId(2028)
end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end


return entity