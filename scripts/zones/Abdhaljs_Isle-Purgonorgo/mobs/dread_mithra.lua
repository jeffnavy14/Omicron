-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Mithra
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Mithra")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("MRStage", 0)
	mob:addMod(xi.mod.DMGPHYS, -3000)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("hssssssss!", 0, mob:getPacketName())
end

entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("MRStage")
		if HPP < 50 and mob:getLocalVar("MRStage") == 0 then
			mob:setModelId(786)
			mob:setMobLevel(119)
			mob:setSpellList(0)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 355)
			mob:addMod(xi.mod.DMGPHYS, -6000)
			mob:addMod(xi.mod.DMGMAGIC, -3000)
			mob:setLocalVar("MRStage", 1)
		end
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("mrrr~ow...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity