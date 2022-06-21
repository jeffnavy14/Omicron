-----------------------------------
require("modules/module_utils")
require("scripts/zones/Dragons_Aery/Zone")
-----------------------------------
local m = Module:new("FafHoggFight")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("[EschanNid]") > 1 then
       SetServerVariable("[EschanNid]", 0)
    end
    if GetServerVariable("[EschanFaf]") > 1 then
       SetServerVariable("[EschanFaf]", 0)
    end

 end)


m:addOverride("xi.zones.Dragons_Aery.Zone.onZoneTick", function(zone, mob)
    super(zone)

    if
        GetServerVariable("[EschanNid]") == 1
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Nidhogg",
                x = 79.4922,
                y = 6.9080,
                z = 39.6400,
                rotation = 50,
                groupId = 6,
                groupZoneId = 154,

        onMobSpawn = function(mob)
		    SetServerVariable("[EschanNid]", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })


            mob:hideHP(true)

        mob:setDropID(4056)
        mob:setSpawn(79.4922, 6.9080, 39.6400, 50)
        mob:spawn()
		mob:setMobMod(xi.mobMod.SKILL_LIST, 263)
		mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	 		mob:setMobLevel(125)
		    mob:setMod(xi.mod.DEF, 1100)
                mob:setMod(xi.mod.MDEF, 1400)
                mob:setMod(xi.mod.MEVA, 500)
                mob:setMod(xi.mod.EVA, 750)
                mob:setMod(xi.mod.STR, 200)
                mob:setMod(xi.mod.ATT, 700)
                mob:setMod(xi.mod.VIT, 300)
                mob:setMod(xi.mod.INT, 150)
                mob:setMod(xi.mod.MND, 150)
                mob:setMod(xi.mod.CHR, 120)
                mob:setMod(xi.mod.AGI, 120)
                mob:setMod(xi.mod.DEX, 140)
                mob:setMod(xi.mod.MATT, 350)
                mob:setMod(xi.mod.ACC, 1000)
                mob:setMod(xi.mod.MACC, 600)
                mob:setMod(xi.mod.DOUBLE_ATTACK, 15)
                mob:setMod(xi.mod.EARTH_RES, 200)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 150)
                mob:setMod(xi.mod.FIRE_RES, 200)
                mob:setMod(xi.mod.WATER_RES, 200)
                mob:setMod(xi.mod.THUNDER_RES, 300)
                mob:setMod(xi.mod.ICE_RES, 0)
                mob:setMod(xi.mod.WIND_RES, 200)
                mob:setMod(xi.mod.SILENCERES, 500)
                mob:setMod(xi.mod.FIRE_ABSORB, 100)
                mob:setMod(xi.mod.STUNRES, 100)
                mob:setMod(xi.mod.BINDRES, 1000)
                mob:setMod(xi.mod.GRAVITYRES, 200)
                mob:setMod(xi.mod.SLEEPRES, 1000)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 1000)
                mob:setMod(xi.mod.FASTCAST, 100)
                mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	      end





    if
        GetServerVariable("[EschanFaf]") == 1
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan Fafnir",
                x = 79.4922,
                y = 6.9080,
                z = 39.6400,
                rotation = 50,
                groupId = 5,
                groupZoneId = 154,

        onMobSpawn = function(mob)
		    SetServerVariable("[EschanFaf]", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })


            mob:hideHP(true)

        mob:setDropID(4057)
        mob:setSpawn(79.4922, 6.9080, 39.6400, 50)
        mob:spawn()
		mob:setMobMod(xi.mobMod.SKILL_LIST, 260)
		mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
	 		mob:setMobLevel(125)
		    mob:setMod(xi.mod.DEF, 1100)
                mob:setMod(xi.mod.MDEF, 1400)
                mob:setMod(xi.mod.MEVA, 750)
                mob:setMod(xi.mod.EVA, 500)
                mob:setMod(xi.mod.ATT, 700)
                mob:setMod(xi.mod.STR, 200)
                mob:setMod(xi.mod.VIT, 300)
                mob:setMod(xi.mod.INT, 150)
                mob:setMod(xi.mod.MND, 150)
                mob:setMod(xi.mod.CHR, 120)
                mob:setMod(xi.mod.AGI, 120)
                mob:setMod(xi.mod.DEX, 140)
                mob:setMod(xi.mod.MATT, 400)
                mob:setMod(xi.mod.MACC, 600)
                mob:setMod(xi.mod.ACC, 1000)
                mob:setMod(xi.mod.DOUBLE_ATTACK, 15)
                mob:setMod(xi.mod.EARTH_RES, 200)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 150)
                mob:setMod(xi.mod.FIRE_RES, 200)
                mob:setMod(xi.mod.WATER_RES, 200)
                mob:setMod(xi.mod.THUNDER_RES, 300)
                mob:setMod(xi.mod.ICE_RES, 0)
                mob:setMod(xi.mod.WIND_RES, 200)
                mob:setMod(xi.mod.SILENCERES, 500)
                mob:setMod(xi.mod.FIRE_ABSORB, 100)
                mob:setMod(xi.mod.STUNRES, 100)
                mob:setMod(xi.mod.BINDRES, 1000)
                mob:setMod(xi.mod.GRAVITYRES, 200)
                mob:setMod(xi.mod.SLEEPRES, 1000)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 1000)
                mob:setMod(xi.mod.FASTCAST, 100)
                mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	      end

	
end)

return m
		
