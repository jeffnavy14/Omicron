-----------------------------------
-- Area: Wajoam Woodlands
--  Mob: Cosmic Egg
-----------------------------------

local entity = {}

entity.onMobSpawn = function(mob)
    mob:renameEntity(".")
    mob:setMobMod(xi.mobMod.DRAW_IN, 2)
    SetServerVariable("[Hatch]", 3)
    mob:setUnkillable(true)
   end

entity.onMobFight = function(mob, target)
    local Mob = math.random(16986841,16986850)

	if 
		mob:getHPP() <100 and
		GetServerVariable("Summoned") == 0		
	then	
	 GetMobByID(Mob):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
	 SpawnMob(Mob):updateEnmity(target)
	 SetServerVariable("Summoned", 2)
	end


	if
		GetServerVariable("Summoned") == 2
	then
		mob:setUnkillable(false)
	end
end

entity.onMobDeath = function(mob, player)
    SetServerVariable("[EggHunt]", 0) 
    SetServerVariable("[Hatch]", 0)
    SetServerVariable("Summoned", 0)
  end

return entity