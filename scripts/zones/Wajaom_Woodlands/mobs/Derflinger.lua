-----------------------------------
-- Area: Wajaom Woodlands
--  Mob: Derflinger
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Derflinger")

end

entity.onMobDeath = function(mob)
 		SetServerVariable("Summoned", 0)
	end

return entity