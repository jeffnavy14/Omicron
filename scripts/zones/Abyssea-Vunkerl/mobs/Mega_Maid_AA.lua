-----------------------------------
-- Zone: Abyssea-Vunkerl
-- Mega Maid AV
-----------------------------------
local ID = 17666535
-----------------------------------
local entity = {}
	
entity.onMobInitialize = function(mob)
end
	
entity.onMobSpawn = function(mob)
	mob:renameEntity("Mega Maid AV")
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	SetServerVariable("MegaMaidAV1", 0)
	SetServerVariable("MegaMaidAV2", 0)
	SetServerVariable("MegaMaidAV3", 0)
	SetServerVariable("[AVBastion]Active", 0)
	player:setCharVar("[Bastion]Vunkerl", 2)
end

return entity