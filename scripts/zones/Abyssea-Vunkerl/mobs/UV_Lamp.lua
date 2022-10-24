-----------------------------------
-- Zone: Abyssea-Vunkerl
-- UV_Lamp
-----------------------------------
local ID = 
	{
		17666529,
		17666530,
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