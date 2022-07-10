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



	if 
		mob:getHPP() <100 and
		GetServerVariable("Summoned") == 0
	then	
	  SetServerVariable("Summoning", math.random(1,10))
		SetServerVariable("Summoned", 1)
	end


	if
		GetServerVariable("Summoning") == 1 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986841):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986841):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 2 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986842):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986842):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 3 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986843):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986843):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 4 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986844):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986844):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 5 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986845):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986845):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 6 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986846):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986846):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 7 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986847):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986847):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 8 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986848):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986848):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 9 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986849):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986849):updateEnmity(target)
		SetServerVariable("Summoned", 2)

	elseif
		GetServerVariable("Summoning") == 10 and
		GetServerVariable("Summoned") == 1
	then
		GetMobByID(16986850):setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
		SpawnMob(16986850):updateEnmity(target)
		SetServerVariable("Summoned", 2)
	end


	if
		GetServerVariable("Summoned") == 2
	then
		mob:setUnkillable(false)
	end



entity.onMobDeath = function(mob, player)
    SetServerVariable("[EggHunt]", 0) 
    SetServerVariable("[Hatch]", 0) 

  end
end

return entity