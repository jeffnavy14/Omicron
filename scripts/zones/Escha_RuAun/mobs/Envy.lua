-----------------------------------
-- Area: Escha Ru'Ahn
--  Mob: Envy
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Envy")
    mob:setLocalVar("twoHours", 0)
    mob:setAggressive(true)
    mob:setMobMod(xi.mobMod.SPELL_LIST, 431)
end


	entity.onMobFight = function(mob, target)
  	local twoHours = mob:getLocalVar("twoHours")

	if
        mob:getLocalVar("twoHours") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(690)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("twoHours", 1)
	end

	if
        mob:getLocalVar("twoHours") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(693)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("twoHours", 2)
	end

	if
        mob:getLocalVar("twoHours") == 2 and
        mob:getHPP() <30
    then
	 mob:useMobAbility(688)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 299)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 0)
		mob:addStatusEffect(xi.effect.FAST_CAST, 120)
        mob:setLocalVar("twoHours", 3)
	end

	if
		not mob:hasStatusEffect(xi.effect.MIGHTY_STRIKES) and twoHours == 3 then
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
	end
end

return entity