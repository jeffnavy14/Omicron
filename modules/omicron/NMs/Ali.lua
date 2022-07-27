-----------------------------------
require("modules/module_utils")
require("scripts/zones/Attohwa_Chasm/Zone")
-----------------------------------
local m = Module:new("Double10")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("[Double10]") >= 0 then
       SetServerVariable("[Double10]", 0)
	end
end)

m:addOverride("xi.zones.Attohwa_Chasm.Zone.onZoneTick", function(zone)
    super(zone)

    if    
		GetServerVariable("[Double10]") == 0
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Ali",
		   look = "0x0000820B00000000000000000000000000000000",
                x = 352.3081,
                y = -22.3633,
                z = -30.5639,
                rotation = 50,
		   widescan = 1,
                groupId = 16,
                groupZoneId = 291,

            onMobSpawn = function(mob)
		    SetServerVariable("[Double10]", 1)
		    SetServerVariable("[Set10]", math.random(1,20))
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
		    SetServerVariable("[Double10]", 0)
            end,
			releaseIdOnDeath = true,

        mixins =
        {
            require("scripts/mixins/rage"),
            require("scripts/mixins/job_special"),
        },

        specialSpawnAnimation = true,
        })

            mob:hideHP(true)
        	mob:setDropID(4103)
		mob:setSpawn(352.3081, -22.3633, -30.5639, 50)
        	mob:spawn()
		mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
		    mob:setMobLevel(125)
		    mob:setMod(xi.mod.DEF, 1200)
                mob:setMod(xi.mod.MDEF, 300)
                mob:setMod(xi.mod.MEVA, 400)
                mob:setMod(xi.mod.EVA, 750)
                mob:setMod(xi.mod.STR, 250)
                mob:setMod(xi.mod.VIT, 300)
                mob:setMod(xi.mod.INT, 220)
                mob:setMod(xi.mod.MND, 220)
                mob:setMod(xi.mod.CHR, 220)
                mob:setMod(xi.mod.AGI, 220)
                mob:setMod(xi.mod.ATT, 720)
                mob:setMod(xi.mod.DEX, 300)
                mob:setMod(xi.mod.MATT, 390)
                mob:setMod(xi.mod.MACC, 600)
                mob:setMod(xi.mod.ACC, 1500)
                mob:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mob:setMod(xi.mod.EARTH_MEVA, 400)
                mob:setMod(xi.mod.DARK_MEVA, 450)
                mob:setMod(xi.mod.LIGHT_MEVA, 450)
                mob:setMod(xi.mod.FIRE_MEVA, 400)
                mob:setMod(xi.mod.WATER_MEVA, 400)
                mob:setMod(xi.mod.THUNDER_MEVA, 500)
                mob:setMod(xi.mod.ICE_MEVA, 0)
                mob:setMod(xi.mod.WIND_MEVA, 400)
                mob:setMod(xi.mod.SILENCERES, 600)
                mob:setMod(xi.mod.FIRE_ABSORB, 100)
                mob:setMod(xi.mod.BINDRES, 1000)
                mob:setMod(xi.mod.GRAVITYRES, 200)
                mob:setMod(xi.mod.SLEEPRES, 1000)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 1000)
                mob:setMod(xi.mod.FASTCAST, 100)
                mob:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)
                mob:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	      end
	if
		GetServerVariable("[Set10]") == 1 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1027)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 1)

	elseif
		GetServerVariable("[Set10]") == 2 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1024)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 2)

	elseif
		GetServerVariable("[Set10]") == 3 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1025)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 3)

	elseif
		GetServerVariable("[Set10]") == 4 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1018)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 4)

	elseif
		GetServerVariable("[Set10]") == 5 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1075)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 5)

	elseif
		GetServerVariable("[Set10]") == 6 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1016)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 6)

	elseif
		GetServerVariable("[Set10]") == 7 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1015)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 7)

	elseif
		GetServerVariable("[Set10]") == 8 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1018)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 8)

	elseif
		GetServerVariable("[Set10]") == 9 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 854)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 12)

	elseif
		GetServerVariable("[Set10]") == 10 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 861)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 13)

	elseif
		GetServerVariable("[Set10]") == 11 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 864)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 14)

	elseif
		GetServerVariable("[Set10]") == 12 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 869)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 15)

	elseif
		GetServerVariable("[Set10]") == 13 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 874)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 16)

	elseif
		GetServerVariable("[Set10]") == 14 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 877)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 17)

	elseif
		GetServerVariable("[Set10]") == 15 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 882)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 18)

	elseif
		GetServerVariable("[Set10]") == 16 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 892)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 19)

	elseif
		GetServerVariable("[Set10]") == 17 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 895)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 21)

	elseif
		GetServerVariable("[Set10]") == 18 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 898)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 22)

	elseif
		GetServerVariable("[Set10]") == 19 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 899)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 28)

	elseif
		GetServerVariable("[Set10]") == 20 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 903)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 29)
	end
		
end)

return m
		
