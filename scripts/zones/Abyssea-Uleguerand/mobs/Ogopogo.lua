-----------------------------------
-- Area: Abyssea - Altepa
--   NM: Brulo
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob, target)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(xi.mobMod.DRAW_IN, 2)
    mob:setAggressive(true)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
mob:setUntargetable(false)
    end

entity.onMobFight = function(mob)

	if
        mob:getLocalVar("Roids") == 0
     then
		mob:addMod(xi.mod.ATT, math.random(100,800))
		mob:addMod(xi.mod.DEF, math.random(100,500))
		mob:addMod(xi.mod.EVA, math.random(100,300))
		mob:addMod(xi.mod.MATT, math.random(100,300))
		mob:addMod(xi.mod.MDEF, math.random(100,300))
		mob:addMod(xi.mod.MEVA, math.random(100,300))
		mob:addStatusEffect(xi.effect.REGEN, math.random(10,20))
		mob:addStatusEffect(xi.effect.REGAIN, math.random(10,20))
		mob:addStatusEffect(xi.effect.REFRESH, math.random(10,20))
		mob:addMod(xi.mod.STR, math.random(100,350))
		mob:addMod(xi.mod.DEX, math.random(100,350))
		mob:addMod(xi.mod.AGI, math.random(100,350))
		mob:addMod(xi.mod.VIT, math.random(100,350))
		mob:addMod(xi.mod.INT, math.random(100,350))
		mob:addMod(xi.mod.MND, math.random(100,350))
		mob:addMod(xi.mod.CHR, math.random(100,350))
		mob:addMod(xi.mod.ALL_WSDMG_ALL_HITS, 25)
		mob:addStatusEffect(xi.effect.ENFIRE, math.random(10,200))
		mob:addMod(xi.mod.DOUBLE_ATTACK, math.random(10,50))
		mob:addMod(xi.mod.TRIPLE_ATTACK, math.random(10,25))
		mob:addStatusEffect(xi.effect.BLAZE_SPIKES, math.random(10,100))
		mob:addStatusEffect(xi.effect.FAST_CAST, math.random(10,100))
        mob:setLocalVar("Roids", 1)
	end

entity.onMobDeath = function(mob, player)
        mob:setLocalVar("Roids", 0)
     end
end


return entity
