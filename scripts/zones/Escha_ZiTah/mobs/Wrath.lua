-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Wrath
-----------------------------------
local entity = {}

		entity.onMobSpawn = function(mob)
   		 mob:renameEntity("Wrath")
		mob:setModelId(2674)
    mob:setLocalVar("twoHourPer", 50)
    mob:setLocalVar("canTwoHour", 0)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 30)
    mob:setAggressive(true)
    mob:setLocalVar("form2", math.random(1, 3))
		
		end

		entity.onMobEngaged = function(mob, target)
 		   SpawnMob(mob:getID() + 1)

		end

		entity.onMobFight = function(mob, target)
  		  local changeTime = mob:getLocalVar("changeTime")
  		  local state = mob:getLocalVar("state")
  		  local twoHourPer = mob:getLocalVar("twoHourPer")
  		  if mob:getBattleTime() - changeTime > 30 then
    		    mob:setLocalVar("state", math.random(0, 3))
    		    mob:setAnimationSub(state)
    		    mob:setLocalVar("changeTime", mob:getBattleTime())
  	 	 end

     if
        mob:getLocalVar("canTwoHour") == 0 and
        mob:getHPP() < twoHourPer
    then
        if mob:getLocalVar("state") == 1 then
            mob:useMobAbility(694) --invincible
        elseif mob:getLocalVar("state") == 2 then
            mob:useMobAbility(688) -- mighty strikes
        elseif mob:getLocalVar("state") == 0 then
            mob:useMobAbility(692) -- manafont
            mob:setSpellList(290)
            mob:setLocalVar("delay", mob:getBattleTime())
            mob:setMobMod(xi.mobMod.MAGIC_COOL, 0)
        elseif mob:getLocalVar("state") == 3 then
            mob:useMobAbility(693) -- perfect dodge
        end

        mob:setLocalVar("canTwoHour", 1)
    	end

    if
        not mob:hasStatusEffect(xi.effect.MANAFONT) and --Changing spell list back after manafont is over
        mob:getLocalVar("canTwoHour") == 1 and
        mob:getBattleTime() - mob:getLocalVar("delay") > 15 and
        mob:getLocalVar("state2") == 0
    then
        	mob:setSpellList(282)
        	mob:setLocalVar("state2", 1)
       	mob:setMobMod(xi.mobMod.MAGIC_COOL, 30)
	 end

	if 
		mob:getHPP() <50
      then 
		mob:setModelId(2673)
		mob:addMod(xi.mod.ATT, 150)
		mob:addMod(xi.mod.DEF, 150)
		mob:addMod(xi.mod.MDEF, 150)
		mob:addMod(xi.mod.MATT, 100)
		mob:setMobMod(xi.mobMod.SKILL_LIST, 487)
      	mob:addStatusEffect(xi.effect.ENDARK, 65, 3, 0)

		end

	if 
		mob:getHPP() <5
      then 
		mob:useMobAbility(1552)
		
		end
end



return entity