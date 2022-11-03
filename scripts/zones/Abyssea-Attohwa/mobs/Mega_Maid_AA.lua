-----------------------------------
-- Zone: Abyssea-Attahwa
-- Super Scrubber
-----------------------------------
local ID = 17658310
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Mega Maid AA")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAA1", 0)
	SetServerVariable("MegaMaidAA2", 0)
	SetServerVariable("MegaMaidAA3", 0)
	SetServerVariable("[AABastion]Active", 0)
	player:setCharVar("[Bastion]Attohwa", 2)
end

return entity