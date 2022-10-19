-----------------------------------
-- Zone: Abyssea-Attahwa
-- UV_Lamp
-----------------------------------
local ID = 
	{
		17658304,
		17658305,
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