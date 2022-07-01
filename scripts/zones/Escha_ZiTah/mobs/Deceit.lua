-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Deceit
-----------------------------------
local entity = {}
entity.onMobSpawn = function(mob)
    mob:renameEntity("Mimic Queen")
    mob:setLocalVar("TwoHours", 0)
    mob:setMobMod(xi.mobMod.SKILL_LIST, math.random(2,1010))
    mob:setMobMod(xi.mobMod.SPELL_LIST, math.random(1,305))
    mob:setDropID(math.random(4068,4080))
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    mob:setMobMod(xi.mobMod.DRAW_IN, 2)
    mob:setAggressive(true)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
       SetServerVariable("[Spawned]", 1)
end 

entity.onMobFight = function(mob, target)

	if
        mob:getLocalVar("Roids") == 0
     then

		mob:addMod(xi.mod.ATT, math.random(1,500))
		mob:addMod(xi.mod.DEF, math.random(1,500))
		mob:addMod(xi.mod.EVA, math.random(1,500))
		mob:addMod(xi.mod.MATT, math.random(1,300))
		mob:addMod(xi.mod.MDEF, math.random(1,300))
		mob:addMod(xi.mod.MEVA, math.random(1,300))
		mob:addStatusEffect(xi.effect.REGEN, math.random(1,200))
		mob:addStatusEffect(xi.effect.REGAIN, math.random(1,200))
		mob:addStatusEffect(xi.effect.REFRESH, math.random(1,200))
		mob:addMod(xi.mod.STR, math.random(1,350))
		mob:addMod(xi.mod.DEX, math.random(1,350))
		mob:addMod(xi.mod.AGI, math.random(1,350))
		mob:addMod(xi.mod.VIT, math.random(1,350))
		mob:addMod(xi.mod.INT, math.random(1,350))
		mob:addMod(xi.mod.MND, math.random(1,350))
		mob:addMod(xi.mod.CHR, math.random(1,350))
		mob:addStatusEffect(xi.effect.ENSTONE_II, math.random(1,200))
		mob:addMod(xi.mod.DOUBLE_ATTACK, math.random(1,50))
		mob:addMod(xi.mod.TRIPLE_ATTACK, math.random(1,25))
		mob:addStatusEffect(xi.effect.SHOCK_SPIKES, math.random(1,100))
		mob:addStatusEffect(xi.effect.FAST_CAST, math.random(1,100))
        mob:setLocalVar("Roids", 1)
	end
		
	if
        mob:getLocalVar("TwoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(math.random(432,440))
        mob:setLocalVar("TwoHours", 1)
	end

	if
        mob:getLocalVar("TwoHours") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(math.random(432,440))
        mob:setLocalVar("TwoHours", 2)
	end


entity.onMobDeath = function(mob)
    SetServerVariable("[Mimic]", 0)
    SetServerVariable("[Spawned]", 0) 
        mob:setLocalVar("Roids", 0)
  end
end

return entity