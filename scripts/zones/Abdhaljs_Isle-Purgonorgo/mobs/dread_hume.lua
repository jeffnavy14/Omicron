-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Hume
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Hume")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("HMStage", 0)
	mob:addMod(xi.mod.DMGPHYS, -3000)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("mmm...", 0, mob:getPacketName())
end
entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("HMStage")
		if HPP < 50 and mob:getLocalVar("HMStage") == 0 then
			mob:setModelId(784)
			mob:setSpellList(38)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 354)
			mob:addMod(xi.mod.DMGPHYS, -6000)
			mob:addMod(xi.mod.DMGMAGIC, -3000)
		end
	end
end
entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("urrr...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity