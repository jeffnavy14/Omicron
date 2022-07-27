-----------------------------------
require("modules/module_utils")
require("scripts/zones/Attohwa_Chasm/Zone")
-----------------------------------
local m = Module:new("Double5")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("[Double5]") > 1 then
       SetServerVariable("[Double5]", 0)
	end
end)


m:addOverride("xi.zones.Attohwa_Chasm.Zone.onZoneTick", function(zone, mob)
    super(zone)

    if
        GetServerVariable("[Double5]") == 0
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Suzu",
		    look = "0x0000400100000000000000000000000000000000",
                x = 308.5516,
                y = -25.0017,
                z = 9.4731,
                rotation = 50,
                groupId = 35,
                groupZoneId = 76,

        onMobSpawn = function(mob)
		    SetServerVariable("[Double5]", 1)
		    SetServerVariable("[Set5]", math.random(1,20))
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)
		    SetServerVariable("[Double5]", 0)
            end,
			releaseIdOnDeath = true,

        mixins =
        {
            require("scripts/mixins/rage"),
            require("scripts/mixins/job_special"),
        },

        -- The "whooshy" special animation that plays when Trusts or Dynamis mobs spawn
        specialSpawnAnimation = true,
        })

            mob:hideHP(true)
        	mob:setDropID(4105)
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
		GetServerVariable("[Set5]") == 1 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1027)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 1)

	elseif
		GetServerVariable("[Set5]") == 2 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1024)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 2)

	elseif
		GetServerVariable("[Set5]") == 3 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1025)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 3)

	elseif
		GetServerVariable("[Set5]") == 4 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1018)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 4)

	elseif
		GetServerVariable("[Set5]") == 5 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1075)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 5)

	elseif
		GetServerVariable("[Set5]") == 6 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1016)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 6)

	elseif
		GetServerVariable("[Set5]") == 7 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1015)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 7)

	elseif
		GetServerVariable("[Set5]") == 8 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 1018)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 8)

	elseif
		GetServerVariable("[Set5]") == 9 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 854)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 12)

	elseif
		GetServerVariable("[Set5]") == 10 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 861)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 13)

	elseif
		GetServerVariable("[Set5]") == 11 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 864)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 14)

	elseif
		GetServerVariable("[Set5]") == 12 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 869)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 15)

	elseif
		GetServerVariable("[Set5]") == 13 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 874)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 16)

	elseif
		GetServerVariable("[Set5]") == 14 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 877)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 17)

	elseif
		GetServerVariable("[Set5]") == 15 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 882)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 18)

	elseif
		GetServerVariable("[Set5]") == 16 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 892)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 19)

	elseif
		GetServerVariable("[Set5]") == 17 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 895)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 21)

	elseif
		GetServerVariable("[Set5]") == 18 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 898)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 22)

	elseif
		GetServerVariable("[Set5]") == 19 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 899)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 28)

	elseif
		GetServerVariable("[Set5]") == 20 then
		mob:setMobMod(xi.mobMod.SKILL_LIST, 903)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 29)
	end

		
end)

return m
		
