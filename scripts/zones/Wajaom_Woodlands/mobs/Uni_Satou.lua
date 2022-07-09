-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Uni Satou
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Uni Satou")
		mob:setModelId(2227)
end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity