-----------------------------------
-- Zone: Abyssea-Vunkerl
-- Dirt Seeker
-----------------------------------
local ID = 
	{
		17666525,
		17666526,
	}
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Dirt Seeker")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
end

return entity