-----------------------------------
-- Area: Escha Ru'Ahn
--  Mob: Lust
-----------------------------------
require("scripts/globals/mixins")
require("scripts/globals/status")
require("scripts/globals/utils")

local entity = {}

	entity.onMobSpawn = function(mob)
  	  mob:renameEntity("Faded Lust")
		mob:setModelId(2189)
	 mob:setMobMod(xi.mobMod.MAGIC_COOL, 35)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
    	mob:setLocalVar("chainspell", 0)
    	mob:setLocalVar("twoHourPer", 40)
    	mob:setLocalVar("canTwoHour", 0)
	mob:setLocalVar("phase", 0)
	mob:setLocalVar("Sins5", 0)
   	 mob:setAggressive(true)

end



	  entity.onMobFight = function(mob, target, player)
		   local changeTime = mob:getLocalVar("changeTime")
  		  local state = mob:getLocalVar("state")
  		  local twoHourPer = mob:getLocalVar("twoHourPer")

  		  if mob:getBattleTime() - changeTime > 30 then
    		    mob:setLocalVar("state", math.random(0, 3))
    		    mob:setAnimationSub(state)
    		    mob:setLocalVar("changeTime", mob:getBattleTime())
  	 	 end

if 
		mob:getHPP() <25 and mob:getLocalVar("Sins5") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins5", 1)
	end

     if
        mob:getLocalVar("canTwoHour") == 0 and
        mob:getHPP() < twoHourPer
    then
        if mob:getLocalVar("state") == 1 then
            mob:useMobAbility(694) --invincible
        elseif mob:getLocalVar("state") == 2 then
            mob:useMobAbility(690) -- hundred fists
        elseif mob:getLocalVar("state") == 0 then
            mob:useMobAbility(692) -- chainspell
            mob:setSpellList(290)
            mob:setLocalVar("delay", mob:getBattleTime())
        elseif mob:getLocalVar("state") == 3 then
	   mob:useMobAbility(693)

        end

        mob:setLocalVar("canTwoHour", 1)

    	end

if 
		mob:getHPP() <50 and mob:getLocalVar("phase") == 0
      then 
		mob:setLocalVar("phase", 1)

	end
if
		mob:getLocalVar("phase") == 1
	then
		mob:setModelId(2190)
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
		mob:setLocalVar("phase", 2)
	end

		if 
		mob:hasStatusEffect(xi.effect.CHAINSPELL) and chainspell == 0 then
            	mob:setMobMod(xi.mobMod.MAGIC_COOL, 3)
		mob:setLocalVar("chainspell", 1)
	end
		if 
		not mob:hasStatusEffect(xi.effect.CHAINSPELL) and chainspell == 1 then
	 	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
	end
end

return entity