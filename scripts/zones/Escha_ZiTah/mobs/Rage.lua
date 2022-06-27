-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Rage
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity("Rage")
	    mob:setLocalVar("SkillUse", 0)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setAggressive(true)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
end


	entity.onMobFight = function(mob, target)

	if
        mob:getLocalVar("SkillUse") == 0 and
        mob:getHPP() < 75
    then
	 mob:useMobAbility(255)
		mob:addMod(xi.mod.ATT, 40)
		mob:addMod(xi.mod.DEF, 40)
		mob:addMod(xi.mod.MDEF, 40)
        mob:setLocalVar("SkillUse", 1)
	end

	if
        mob:getLocalVar("SkillUse") == 1 and
        mob:getHPP() < 42
    then
	 mob:useMobAbility(952)
		mob:addMod(xi.mod.ATT, 50)
		mob:addMod(xi.mod.DEF, 50)
		mob:addMod(xi.mod.MDEF, 50)
        mob:setLocalVar("SkillUse", 2)
	end

	if
        mob:getLocalVar("SkillUse") == 2 and
        mob:getHPP() < 15
    then
	 mob:useMobAbility(655)
		mob:addMod(xi.mod.ATT, 70)
		mob:addMod(xi.mod.DEF, 70)
		mob:addMod(xi.mod.MDEF, 70)
        mob:setLocalVar("SkillUse", 3)
	end

end

return entity
