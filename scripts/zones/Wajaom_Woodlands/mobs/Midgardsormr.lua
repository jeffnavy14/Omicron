-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Midgardsormr
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Midgardsormr")

end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity