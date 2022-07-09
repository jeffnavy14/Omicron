-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Chaurli
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Chaurli")

end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity