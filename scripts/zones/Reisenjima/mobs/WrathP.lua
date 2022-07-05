-----------------------------------
-- Area: Escha Zi'Tah
--  Mob: Wrath
-----------------------------------
local entity = {}

		entity.onMobSpawn = function(mob)
   		 mob:renameEntity("Devoured Wrath")
		mob:setModelId(2674)
    mob:setLocalVar("twoHourPer", 50)
    mob:setLocalVar("canTwoHour", 0)
	mob:setMobMod(xi.mobMod.DRAW_IN, 1)
    	mob:setLocalVar("gigaflare", 0)
	mob:setLocalVar("phase", 0)
	mob:setLocalVar("pet", 0)
	mob:setLocalVar("Sins3", 0)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 30)
	mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
    mob:setAggressive(true)
		
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
		mob:getHPP() <25 and mob:getLocalVar("Sins3") == 0
      then 
		SpawnMob(mob:getID() + 1)
		mob:setLocalVar("Sins3", 1)
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
            mob:setMobMod(xi.mobMod.MAGIC_COOL, 10)
        elseif mob:getLocalVar("state") == 3 then
            mob:useMobAbility(690) -- hundredfists
        end

        mob:setLocalVar("canTwoHour", 1)
    	end

    if
        not mob:hasStatusEffect(xi.effect.MANAFONT) and 
        mob:getLocalVar("canTwoHour") == 1 and
        mob:getBattleTime() - mob:getLocalVar("delay") > 15 and
        mob:getLocalVar("state2") == 0
    then
        	mob:setSpellList(282)
        	mob:setLocalVar("state2", 1)
       	mob:setMobMod(xi.mobMod.MAGIC_COOL, 20)
	 end

if 
		mob:getHPP() <50 and mob:getLocalVar("phase") == 0
      then 
		mob:setLocalVar("phase", 1)
	end

if
		mob:getLocalVar("phase") == 1
	then
		mob:setModelId(2673)
		mob:setMobMod(xi.mobMod.SKILL_LIST, 487)
      		mob:addStatusEffect(xi.effect.ENDARK, 65, 3, 0)
		mob:setLocalVar("phase", 2)

		end

	if 
		(gigaflare == 0 and mob:getHPP() <5)
      then 
		mob:useMobAbility(1552)
		mob:setLocalVar("gigaflare", 1)

		end
end



return entity