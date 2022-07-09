-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Hans
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Hans")

end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity