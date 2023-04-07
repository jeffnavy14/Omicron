-----------------------------------
-- Zone: Abdhaljs_Isle-Purgonorgo
-- Dread Tarutaru
-----------------------------------
local ID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}


entity.onMobSpawn = function(mob)
	mob:renameEntity("Dread Tarutaru")
	mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	mob:hideHP(true)
	mob:setLocalVar("TTStage", 0)
	mob:addMod(xi.mod.DMGPHYS, -3000)
end

entity.onMobEngaged = function(mob, player)
	player:PrintToPlayer("Rru~ugh", 0, mob:getPacketName())
end

entity.onMobFight = function(mob, player)
	local InvTier = player:getLocalVar("InvTier")
	if InvTier == 1 then
		local HPP = mob:getHPP()
		local Stage = mob:getLocalVar("TTStage")
		if HPP < 50 and mob:getLocalVar("TTStage") == 0 then
			mob:setModelId(787)
			mob:setSpellList(39)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 356)
			mob:addMod(xi.mod.DMGPHYS, -6000)
			mob:addMod(xi.mod.DMGMAGIC, -3000)
		end
	end
end

entity.onMobDeath = function(mob, player, isKiller, noKiller)
	player:PrintToPlayer("Urghk...", 0, mob:getPacketName())
end

entity.onMobDespawn = function(mob)
	
end

return entity