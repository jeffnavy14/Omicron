-----------------------------------
-- Zone: Abyssea-Misareaux
-- UV_Lamp
-----------------------------------
local ID = 
	{
		17662509,
		17662510,
	}
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("UV Lamp")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
end

return entity