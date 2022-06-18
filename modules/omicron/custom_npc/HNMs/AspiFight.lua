-----------------------------------
require("modules/module_utils")
require("scripts/zones/Valley_of_Sorrows/Zone")
-----------------------------------
local m = Module:new("AspiFight")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("[EschanAspi]") > 1 then
       SetServerVariable("[EschanAspi]", 0)
	end
end)


m:addOverride("xi.zones.Valley_of_Sorrows.Zone.onZoneTick", function(zone,mob)
    super(zone)

    if  GetServerVariable("[EschanAspi]") == 1  then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Ninja Turtle",
                look = 2382,
                x = -5.4115,
                y = 0.1944,
                z = -33.4813,
                rotation = 50,
                groupId = 7,
                groupZoneId = 128,

                onMobSpawn = function(mob)
                    SetServerVariable("[EschanAspi]", 2)
                    mob:hideHP(true)
                    mob:useMobAbility(1486)
                end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[EschanAspi]", 0)
            end,
			releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            }
        })


        mob:setSpawn(-5.4115, 0.1944, -33.4813, 50)
        mob:setDropID(4056)
        mob:spawn()
        mob:setMobLevel(119)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 277)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 24)
        mob:setMod(xi.mod.HPP, 500)
        mob:setMod(xi.mod.DEF, 2000)
        mob:setMod(xi.mod.MDEF, 250)
        mob:setMod(xi.mod.MEVA, 650)
        mob:setMod(xi.mod.EVA, 600)
        mob:setMod(xi.mod.STR, 200)
        mob:setMod(xi.mod.VIT, 300)
        mob:setMod(xi.mod.INT, 150)
        mob:setMod(xi.mod.MND, 150)
        mob:setMod(xi.mod.CHR, 120)
        mob:setMod(xi.mod.AGI, 120)
        mob:setMod(xi.mod.DEX, 140)
        mob:setMod(xi.mod.MATT,150)
        mob:setMod(xi.mod.ACC, 1000)
        mob:setMod(xi.mod.ATT, 235)
        mob:setMod(xi.mod.DOUBLE_ATTACK, 25)
        mob:setMod(xi.mod.EARTH_RES, 400)
        mob:setMod(xi.mod.DARK_RES, 450)
        mob:setMod(xi.mod.LIGHT_RES, 450)
        mob:setMod(xi.mod.FIRE_RES, 400)
        mob:setMod(xi.mod.WATER_RES, 400)
        mob:setMod(xi.mod.THUNDER_RES, 500)
        mob:setMod(xi.mod.WIND_RES, 400)
        mob:setMod(xi.mod.SILENCERES, 600)
        mob:setMod(xi.mod.FIRE_ABSORB, 100)
        mob:setMod(xi.mod.BINDRES, 1000)
        mob:setMod(xi.mod.GRAVITYRES, 200)
        mob:setMod(xi.mod.SLEEPRES, 1000)
        mob:setMod(xi.mod.PARALYZERES, 100)
        mob:setMod(xi.mod.LULLABYRES, 1000)
        mob:setMod(xi.mod.FASTCAST, 100)
        mob:setMod(xi.mod.ALL_WSDMG_ALL_HITS, -10)
        mob:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	end

end)

return m
		
