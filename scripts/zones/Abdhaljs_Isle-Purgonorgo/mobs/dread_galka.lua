-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Galka
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Galka")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("GKStage", 0)
	mob:addMod(xi.mod.DMGPHYS, -3000)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Brrr...", 0, mob:getPacketName())
end

entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("GKStage")
		if HPP < 50 and mob:getLocalVar("GKStage") == 0 then
			mob:setModelId(788)
			mob:setSpellList(0)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 353)
			mob:addMod(xi.mod.DMGPHYS, -6000)
			mob:addMod(xi.mod.DMGMAGIC, -3000)
		end
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("huoi...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity