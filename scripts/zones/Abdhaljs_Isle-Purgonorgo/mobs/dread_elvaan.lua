-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Elvaan
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Elvaan")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("EVStage", 0)
	mob:addMod(xi.mod.DMGPHYS, -3000)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Mraaa...", 0, mob:getPacketName())
end

entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("EVStage")
		if HPP < 50 and mob:getLocalVar("EVStage") == 0 then
			mob:setModelId(785)
			mob:setSpellList(37)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 352)
			mob:addMod(xi.mod.DMGPHYS, -8000)
			mob:addMod(xi.mod.DMGMAGIC, -5000)
		end
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("huuuh...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity