-----------------------------------
require("modules/module_utils")
require("scripts/zones/Attohwa_Chasm/Zone")
-----------------------------------
local m = Module:new("Double1")

m:addOverride("xi.zones.Attohwa_Chasm.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("[Double1]") > 0 then
       SetServerVariable("[Double1]", 0)
	end
    if GetServerVariable("[Double2]") > 0 then
       SetServerVariable("[Double2]", 0)
	end
    if GetServerVariable("[Double3]") > 0 then
       SetServerVariable("[Double3]", 0)
	end
    if GetServerVariable("[Double4]") > 0 then
       SetServerVariable("[Double4]", 0)
	end
    if GetServerVariable("[Double5]") > 0 then
       SetServerVariable("[Double5]", 0)
	end
    if GetServerVariable("[Double6]") > 0 then
       SetServerVariable("[Double6]", 0)
	end
    if GetServerVariable("[Double7]") > 0 then
       SetServerVariable("[Double7]", 0)
	end
    if GetServerVariable("[Double8]") > 0 then
       SetServerVariable("[Double8]", 0)
	end
    if GetServerVariable("[Double9]") > 0 then
       SetServerVariable("[Double9]", 0)
	end
end)


m:addOverride("xi.zones.Attohwa_Chasm.Zone.onZoneTick", function(zone)
    super(zone)

    if GetServerVariable("[Double1]") == 0 then
        local mobMuffin = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
            name        = "Muffin",
            look        = "0x00000E0100000000000000000000000000000000",
            x           = 307.913,
            y           = -24.845,
            z           = 15.645,
            rotation    = 50,
            groupId     = 10,
            groupZoneId = 146,

            onMobSpawn = function(mobMuffin)
                SetServerVariable("[Double1]", 1)
                SetServerVariable("[Set1]", math.random(1,20))

                -- Modifiers
                mobMuffin:hideHP(true)
                mobMuffin:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobMuffin:setMobLevel(125)
                mobMuffin:setMod(xi.mod.DEF, 1200)
                mobMuffin:setMod(xi.mod.MDEF, 300)
                mobMuffin:setMod(xi.mod.MEVA, 400)
                mobMuffin:setMod(xi.mod.EVA, 750)
                mobMuffin:setMod(xi.mod.STR, 250)
                mobMuffin:setMod(xi.mod.VIT, 300)
                mobMuffin:setMod(xi.mod.INT, 220)
                mobMuffin:setMod(xi.mod.MND, 220)
                mobMuffin:setMod(xi.mod.CHR, 220)
                mobMuffin:setMod(xi.mod.AGI, 220)
                mobMuffin:setMod(xi.mod.ATT, 720)
                mobMuffin:setMod(xi.mod.DEX, 300)
                mobMuffin:setMod(xi.mod.MATT, 390)
                mobMuffin:setMod(xi.mod.MACC, 600)
                mobMuffin:setMod(xi.mod.ACC, 1500)
                mobMuffin:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobMuffin:setMod(xi.mod.EARTH_MEVA, 400)
                mobMuffin:setMod(xi.mod.DARK_MEVA, 450)
                mobMuffin:setMod(xi.mod.LIGHT_MEVA, 450)
                mobMuffin:setMod(xi.mod.FIRE_MEVA, 400)
                mobMuffin:setMod(xi.mod.WATER_MEVA, 400)
                mobMuffin:setMod(xi.mod.THUNDER_MEVA, 500)
                mobMuffin:setMod(xi.mod.ICE_MEVA, 0)
                mobMuffin:setMod(xi.mod.WIND_MEVA, 400)
                mobMuffin:setMod(xi.mod.SILENCERES, 600)
                mobMuffin:setMod(xi.mod.FIRE_ABSORB, 100)
                mobMuffin:setMod(xi.mod.BINDRES, 1000)
                mobMuffin:setMod(xi.mod.GRAVITYRES, 200)
                mobMuffin:setMod(xi.mod.SLEEPRES, 1000)
                mobMuffin:setMod(xi.mod.PARALYZERES, 100)
                mobMuffin:setMod(xi.mod.LULLABYRES, 1000)
                mobMuffin:setMod(xi.mod.FASTCAST, 100)
                mobMuffin:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobMuffin:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobMuffin:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set1]") == 1 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set1]") == 2 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set1]") == 3 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set1]") == 4 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set1]") == 5 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set1]") == 6 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set1]") == 7 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set1]") == 8 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set1]") == 9 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set1]") == 10 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set1]") == 11 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set1]") == 12 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set1]") == 13 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set1]") == 14 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set1]") == 15 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set1]") == 16 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set1]") == 17 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set1]") == 18 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set1]") == 19 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set1]") == 20 then
                    mobMuffin:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobMuffin:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double1]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobMuffin:setSpawn(307.913, -24.845, 15.645, 50)
        mobMuffin:setDropID(4105)
        mobMuffin:spawn()
    end


    if GetServerVariable("[Double2]") == 0 then
        local mobSuzu = zone:insertDynamicEntity({
                objtype     = xi.objType.MOB,
                name        = "Suzu",
	       look = "0x0000400100000000000000000000000000000000",
                x = 317.6606,
                y = -25.6177,
                z = -52.4134,
                rotation = 50,
                groupId = 32,
                groupZoneId = 68,

            onMobSpawn = function(mobSuzu)
                SetServerVariable("[Double2]", 1)
                SetServerVariable("[Set2]", math.random(1,20))

                -- Modifiers
                mobSuzu:hideHP(true)
                mobSuzu:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobSuzu:setMobLevel(125)
                mobSuzu:setMod(xi.mod.DEF, 1200)
                mobSuzu:setMod(xi.mod.MDEF, 300)
                mobSuzu:setMod(xi.mod.MEVA, 400)
                mobSuzu:setMod(xi.mod.EVA, 750)
                mobSuzu:setMod(xi.mod.STR, 250)
                mobSuzu:setMod(xi.mod.VIT, 300)
                mobSuzu:setMod(xi.mod.INT, 220)
                mobSuzu:setMod(xi.mod.MND, 220)
                mobSuzu:setMod(xi.mod.CHR, 220)
                mobSuzu:setMod(xi.mod.AGI, 220)
                mobSuzu:setMod(xi.mod.ATT, 720)
                mobSuzu:setMod(xi.mod.DEX, 300)
                mobSuzu:setMod(xi.mod.MATT, 390)
                mobSuzu:setMod(xi.mod.MACC, 600)
                mobSuzu:setMod(xi.mod.ACC, 1500)
                mobSuzu:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobSuzu:setMod(xi.mod.EARTH_MEVA, 400)
                mobSuzu:setMod(xi.mod.DARK_MEVA, 450)
                mobSuzu:setMod(xi.mod.LIGHT_MEVA, 450)
                mobSuzu:setMod(xi.mod.FIRE_MEVA, 400)
                mobSuzu:setMod(xi.mod.WATER_MEVA, 400)
                mobSuzu:setMod(xi.mod.THUNDER_MEVA, 500)
                mobSuzu:setMod(xi.mod.ICE_MEVA, 0)
                mobSuzu:setMod(xi.mod.WIND_MEVA, 400)
                mobSuzu:setMod(xi.mod.SILENCERES, 600)
                mobSuzu:setMod(xi.mod.FIRE_ABSORB, 100)
                mobSuzu:setMod(xi.mod.BINDRES, 1000)
                mobSuzu:setMod(xi.mod.GRAVITYRES, 200)
                mobSuzu:setMod(xi.mod.SLEEPRES, 1000)
                mobSuzu:setMod(xi.mod.PARALYZERES, 100)
                mobSuzu:setMod(xi.mod.LULLABYRES, 1000)
                mobSuzu:setMod(xi.mod.FASTCAST, 100)
                mobSuzu:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobSuzu:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobSuzu:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set2]") == 1 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set2]") == 2 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set2]") == 3 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set2]") == 4 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set2]") == 5 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set2]") == 6 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set2]") == 7 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set2]") == 8 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set2]") == 9 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set2]") == 10 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set2]") == 11 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set2]") == 12 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set2]") == 13 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set2]") == 14 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set2]") == 15 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set2]") == 16 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set2]") == 17 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set2]") == 18 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set2]") == 19 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set2]") == 20 then
                    mobSuzu:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobSuzu:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double2]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobSuzu:setDropID(4104)
        mobSuzu:setSpawn(317.6606, -25.6177, -52.4134, 50)
        mobSuzu:spawn()
    end

    if GetServerVariable("[Double3]") == 0 then
        local mobSpara = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Sparafucile",
	       look = "0x00003F0400000000000000000000000000000000",
                x = 332.6765,
                y = -25.5591,
                z = -3.5657,
                rotation = 50,
                groupId = 33,
                groupZoneId = 24,

            onMobSpawn = function(mobSpara)
                SetServerVariable("[Double3]", 1)
                SetServerVariable("[Set3]", math.random(1,20))

                -- Modifiers
                mobSpara:hideHP(true)
                mobSpara:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobSpara:setMobLevel(125)
                mobSpara:setMod(xi.mod.DEF, 1200)
                mobSpara:setMod(xi.mod.MDEF, 300)
                mobSpara:setMod(xi.mod.MEVA, 400)
                mobSpara:setMod(xi.mod.EVA, 750)
                mobSpara:setMod(xi.mod.STR, 250)
                mobSpara:setMod(xi.mod.VIT, 300)
                mobSpara:setMod(xi.mod.INT, 220)
                mobSpara:setMod(xi.mod.MND, 220)
                mobSpara:setMod(xi.mod.CHR, 220)
                mobSpara:setMod(xi.mod.AGI, 220)
                mobSpara:setMod(xi.mod.ATT, 720)
                mobSpara:setMod(xi.mod.DEX, 300)
                mobSpara:setMod(xi.mod.MATT, 390)
                mobSpara:setMod(xi.mod.MACC, 600)
                mobSpara:setMod(xi.mod.ACC, 1500)
                mobSpara:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobSpara:setMod(xi.mod.EARTH_MEVA, 400)
                mobSpara:setMod(xi.mod.DARK_MEVA, 450)
                mobSpara:setMod(xi.mod.LIGHT_MEVA, 450)
                mobSpara:setMod(xi.mod.FIRE_MEVA, 400)
                mobSpara:setMod(xi.mod.WATER_MEVA, 400)
                mobSpara:setMod(xi.mod.THUNDER_MEVA, 500)
                mobSpara:setMod(xi.mod.ICE_MEVA, 0)
                mobSpara:setMod(xi.mod.WIND_MEVA, 400)
                mobSpara:setMod(xi.mod.SILENCERES, 600)
                mobSpara:setMod(xi.mod.FIRE_ABSORB, 100)
                mobSpara:setMod(xi.mod.BINDRES, 1000)
                mobSpara:setMod(xi.mod.GRAVITYRES, 200)
                mobSpara:setMod(xi.mod.SLEEPRES, 1000)
                mobSpara:setMod(xi.mod.PARALYZERES, 100)
                mobSpara:setMod(xi.mod.LULLABYRES, 1000)
                mobSpara:setMod(xi.mod.FASTCAST, 100)
                mobSpara:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobSpara:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobSpara:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set3]") == 1 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set3]") == 2 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set3]") == 3 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set3]") == 4 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set3]") == 5 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set3]") == 6 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set3]") == 7 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set3]") == 8 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set3]") == 9 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set3]") == 10 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set3]") == 11 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set3]") == 12 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set3]") == 13 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set3]") == 14 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set3]") == 15 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set3]") == 16 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set3]") == 17 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set3]") == 18 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set3]") == 19 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set3]") == 20 then
                    mobSpara:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobSpara:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double3]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobSpara:setDropID(4103)
        mobSpara:setSpawn(332.6765, -25.5591, -3.5657, 50)
        mobSpara:spawn()
    end

    if GetServerVariable("[Double4]") == 0 then
        local mobShort = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Shortround",
		 look = "0x0000010700000000000000000000000000000000",
                x = 330.7519,
                y = -25.0287,
                z = 11.8185,
                rotation = 50,
                groupId = 38,
                groupZoneId = 24,

            onMobSpawn = function(mobShort)
                SetServerVariable("[Double4]", 1)
                SetServerVariable("[Set4]", math.random(1,20))

                -- Modifiers
                mobShort:hideHP(true)
                mobShort:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobShort:setMobLevel(125)
                mobShort:setMod(xi.mod.DEF, 1200)
                mobShort:setMod(xi.mod.MDEF, 300)
                mobShort:setMod(xi.mod.MEVA, 400)
                mobShort:setMod(xi.mod.EVA, 750)
                mobShort:setMod(xi.mod.STR, 250)
                mobShort:setMod(xi.mod.VIT, 300)
                mobShort:setMod(xi.mod.INT, 220)
                mobShort:setMod(xi.mod.MND, 220)
                mobShort:setMod(xi.mod.CHR, 220)
                mobShort:setMod(xi.mod.AGI, 220)
                mobShort:setMod(xi.mod.ATT, 720)
                mobShort:setMod(xi.mod.DEX, 300)
                mobShort:setMod(xi.mod.MATT, 390)
                mobShort:setMod(xi.mod.MACC, 600)
                mobShort:setMod(xi.mod.ACC, 1500)
                mobShort:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobShort:setMod(xi.mod.EARTH_MEVA, 400)
                mobShort:setMod(xi.mod.DARK_MEVA, 450)
                mobShort:setMod(xi.mod.LIGHT_MEVA, 450)
                mobShort:setMod(xi.mod.FIRE_MEVA, 400)
                mobShort:setMod(xi.mod.WATER_MEVA, 400)
                mobShort:setMod(xi.mod.THUNDER_MEVA, 500)
                mobShort:setMod(xi.mod.ICE_MEVA, 0)
                mobShort:setMod(xi.mod.WIND_MEVA, 400)
                mobShort:setMod(xi.mod.SILENCERES, 600)
                mobShort:setMod(xi.mod.FIRE_ABSORB, 100)
                mobShort:setMod(xi.mod.BINDRES, 1000)
                mobShort:setMod(xi.mod.GRAVITYRES, 200)
                mobShort:setMod(xi.mod.SLEEPRES, 1000)
                mobShort:setMod(xi.mod.PARALYZERES, 100)
                mobShort:setMod(xi.mod.LULLABYRES, 1000)
                mobShort:setMod(xi.mod.FASTCAST, 100)
                mobShort:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobShort:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobShort:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set4]") == 1 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set4]") == 2 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set4]") == 3 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set4]") == 4 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set4]") == 5 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set4]") == 6 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set4]") == 7 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set4]") == 8 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set4]") == 9 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set4]") == 10 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set4]") == 11 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set4]") == 12 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set4]") == 13 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set4]") == 14 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set4]") == 15 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set4]") == 16 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set4]") == 17 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set4]") == 18 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set4]") == 19 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set4]") == 20 then
                    mobShort:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobShort:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double4]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobShort:setDropID(4105)
        mobShort:setSpawn(330.7519, -25.0287, 11.8185, 50)
        mobShort:spawn()
    end

    if GetServerVariable("[Double5]") == 0 then
        local mobPrec = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Preciosa",
		 look = "0x0000310700000000000000000000000000000000",
                x = 360.9678,
                y = -19.6743,
                z = -0.3713,
                rotation = 50,
                groupId = 20,
                groupZoneId = 136,

            onMobSpawn = function(mobPrec)
                SetServerVariable("[Double5]", 1)
                SetServerVariable("[Set5]", math.random(1,20))

                -- Modifiers
                mobPrec:hideHP(true)
                mobPrec:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobPrec:setMobLevel(125)
                mobPrec:setMod(xi.mod.DEF, 1200)
                mobPrec:setMod(xi.mod.MDEF, 300)
                mobPrec:setMod(xi.mod.MEVA, 400)
                mobPrec:setMod(xi.mod.EVA, 750)
                mobPrec:setMod(xi.mod.STR, 250)
                mobPrec:setMod(xi.mod.VIT, 300)
                mobPrec:setMod(xi.mod.INT, 220)
                mobPrec:setMod(xi.mod.MND, 220)
                mobPrec:setMod(xi.mod.CHR, 220)
                mobPrec:setMod(xi.mod.AGI, 220)
                mobPrec:setMod(xi.mod.ATT, 720)
                mobPrec:setMod(xi.mod.DEX, 300)
                mobPrec:setMod(xi.mod.MATT, 390)
                mobPrec:setMod(xi.mod.MACC, 600)
                mobPrec:setMod(xi.mod.ACC, 1500)
                mobPrec:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobPrec:setMod(xi.mod.EARTH_MEVA, 400)
                mobPrec:setMod(xi.mod.DARK_MEVA, 450)
                mobPrec:setMod(xi.mod.LIGHT_MEVA, 450)
                mobPrec:setMod(xi.mod.FIRE_MEVA, 400)
                mobPrec:setMod(xi.mod.WATER_MEVA, 400)
                mobPrec:setMod(xi.mod.THUNDER_MEVA, 500)
                mobPrec:setMod(xi.mod.ICE_MEVA, 0)
                mobPrec:setMod(xi.mod.WIND_MEVA, 400)
                mobPrec:setMod(xi.mod.SILENCERES, 600)
                mobPrec:setMod(xi.mod.FIRE_ABSORB, 100)
                mobPrec:setMod(xi.mod.BINDRES, 1000)
                mobPrec:setMod(xi.mod.GRAVITYRES, 200)
                mobPrec:setMod(xi.mod.SLEEPRES, 1000)
                mobPrec:setMod(xi.mod.PARALYZERES, 100)
                mobPrec:setMod(xi.mod.LULLABYRES, 1000)
                mobPrec:setMod(xi.mod.FASTCAST, 100)
                mobPrec:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobPrec:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobPrec:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set5]") == 1 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set5]") == 2 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set5]") == 3 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set5]") == 4 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set5]") == 5 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set5]") == 6 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set5]") == 7 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set5]") == 8 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set5]") == 9 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set5]") == 10 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set5]") == 11 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set5]") == 12 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set5]") == 13 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set5]") == 14 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set5]") == 15 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set5]") == 16 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set5]") == 17 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set5]") == 18 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set5]") == 19 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set5]") == 20 then
                    mobPrec:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobPrec:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
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

 
            specialSpawnAnimation = true,
        })
        mobPrec:setDropID(4104)
        mobPrec:setSpawn(360.9678, -19.6743, -0.3713, 50)
        mobPrec:spawn()
    end

    if GetServerVariable("[Double6]") == 0 then
        local mobVil = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Villanelle",
		 look = "0x0000920100000000000000000000000000000000",
                x = 310.9370,
                y = -25.5529,
                z = -25.0755,
                rotation = 50,
                groupId = 3,
                groupZoneId = 39,

            onMobSpawn = function(mobVil)
                SetServerVariable("[Double6]", 1)
                SetServerVariable("[Set6]", math.random(1,20))

                -- Modifiers
                mobVil:hideHP(true)
                mobVil:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobVil:setMobLevel(125)
                mobVil:setMod(xi.mod.DEF, 1200)
                mobVil:setMod(xi.mod.MDEF, 300)
                mobVil:setMod(xi.mod.MEVA, 400)
                mobVil:setMod(xi.mod.EVA, 750)
                mobVil:setMod(xi.mod.STR, 250)
                mobVil:setMod(xi.mod.VIT, 300)
                mobVil:setMod(xi.mod.INT, 220)
                mobVil:setMod(xi.mod.MND, 220)
                mobVil:setMod(xi.mod.CHR, 220)
                mobVil:setMod(xi.mod.AGI, 220)
                mobVil:setMod(xi.mod.ATT, 720)
                mobVil:setMod(xi.mod.DEX, 300)
                mobVil:setMod(xi.mod.MATT, 390)
                mobVil:setMod(xi.mod.MACC, 600)
                mobVil:setMod(xi.mod.ACC, 1500)
                mobVil:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobVil:setMod(xi.mod.EARTH_MEVA, 400)
                mobVil:setMod(xi.mod.DARK_MEVA, 450)
                mobVil:setMod(xi.mod.LIGHT_MEVA, 450)
                mobVil:setMod(xi.mod.FIRE_MEVA, 400)
                mobVil:setMod(xi.mod.WATER_MEVA, 400)
                mobVil:setMod(xi.mod.THUNDER_MEVA, 500)
                mobVil:setMod(xi.mod.ICE_MEVA, 0)
                mobVil:setMod(xi.mod.WIND_MEVA, 400)
                mobVil:setMod(xi.mod.SILENCERES, 600)
                mobVil:setMod(xi.mod.FIRE_ABSORB, 100)
                mobVil:setMod(xi.mod.BINDRES, 1000)
                mobVil:setMod(xi.mod.GRAVITYRES, 200)
                mobVil:setMod(xi.mod.SLEEPRES, 1000)
                mobVil:setMod(xi.mod.PARALYZERES, 100)
                mobVil:setMod(xi.mod.LULLABYRES, 1000)
                mobVil:setMod(xi.mod.FASTCAST, 100)
                mobVil:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobVil:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobVil:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set6]") == 1 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set6]") == 2 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set6]") == 3 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set6]") == 4 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set6]") == 5 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set6]") == 6 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set6]") == 7 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set6]") == 8 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set6]") == 9 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set6]") == 10 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set6]") == 11 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set6]") == 12 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set6]") == 13 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set6]") == 14 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set6]") == 15 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set6]") == 16 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set6]") == 17 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set6]") == 18 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set6]") == 19 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set6]") == 20 then
                    mobVil:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobVil:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double6]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobVil:setDropID(4103)
        mobVil:setSpawn(310.9370, -25.5529, -25.0755, 50)
        mobVil:spawn()
    end

    if GetServerVariable("[Double7]") == 0 then
        local mobElexa = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Elexa",
	       look = "0x0000680400000000000000000000000000000000",
                x = 324.8612,
                y = -21.1884,
                z = 34.5662,
                rotation = 50,
                groupId = 32,
                groupZoneId = 289,

            onMobSpawn = function(mobElexa)
                SetServerVariable("[Double7]", 1)
                SetServerVariable("[Set7]", math.random(1,20))

                -- Modifiers
                mobElexa:hideHP(true)
                mobElexa:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobElexa:setMobLevel(125)
                mobElexa:setMod(xi.mod.DEF, 1200)
                mobElexa:setMod(xi.mod.MDEF, 300)
                mobElexa:setMod(xi.mod.MEVA, 400)
                mobElexa:setMod(xi.mod.EVA, 750)
                mobElexa:setMod(xi.mod.STR, 250)
                mobElexa:setMod(xi.mod.VIT, 300)
                mobElexa:setMod(xi.mod.INT, 220)
                mobElexa:setMod(xi.mod.MND, 220)
                mobElexa:setMod(xi.mod.CHR, 220)
                mobElexa:setMod(xi.mod.AGI, 220)
                mobElexa:setMod(xi.mod.ATT, 720)
                mobElexa:setMod(xi.mod.DEX, 300)
                mobElexa:setMod(xi.mod.MATT, 390)
                mobElexa:setMod(xi.mod.MACC, 600)
                mobElexa:setMod(xi.mod.ACC, 1500)
                mobElexa:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobElexa:setMod(xi.mod.EARTH_MEVA, 400)
                mobElexa:setMod(xi.mod.DARK_MEVA, 450)
                mobElexa:setMod(xi.mod.LIGHT_MEVA, 450)
                mobElexa:setMod(xi.mod.FIRE_MEVA, 400)
                mobElexa:setMod(xi.mod.WATER_MEVA, 400)
                mobElexa:setMod(xi.mod.THUNDER_MEVA, 500)
                mobElexa:setMod(xi.mod.ICE_MEVA, 0)
                mobElexa:setMod(xi.mod.WIND_MEVA, 400)
                mobElexa:setMod(xi.mod.SILENCERES, 600)
                mobElexa:setMod(xi.mod.FIRE_ABSORB, 100)
                mobElexa:setMod(xi.mod.BINDRES, 1000)
                mobElexa:setMod(xi.mod.GRAVITYRES, 200)
                mobElexa:setMod(xi.mod.SLEEPRES, 1000)
                mobElexa:setMod(xi.mod.PARALYZERES, 100)
                mobElexa:setMod(xi.mod.LULLABYRES, 1000)
                mobElexa:setMod(xi.mod.FASTCAST, 100)
                mobElexa:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobElexa:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobElexa:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set7]") == 1 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set7]") == 2 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set7]") == 3 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set7]") == 4 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set7]") == 5 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set7]") == 6 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set7]") == 7 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set7]") == 8 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set7]") == 9 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set7]") == 10 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set7]") == 11 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set7]") == 12 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set7]") == 13 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set7]") == 14 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set7]") == 15 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set7]") == 16 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set7]") == 17 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set7]") == 18 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set7]") == 19 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set7]") == 20 then
                    mobElexa:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobElexa:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double7]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobElexa:setDropID(4105)
        mobElexa:setSpawn(324.8612, -21.1884, 34.5662, 50)
        mobElexa:spawn()
    end

    if GetServerVariable("[Double8]") == 0 then
        local mobBogalka = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Bogalka",
		 look = "0x0500110400000000000000000000000000000000",
                x = 346.1774,
                y = -21.7428,
                z = 31.4245,
                rotation = 50,
                groupId = 6,
                groupZoneId = 168,

            onMobSpawn = function(mobBogalka)
                SetServerVariable("[Double8]", 1)
                SetServerVariable("[Set8]", math.random(1,20))

                -- Modifiers
                mobBogalka:hideHP(true)
                mobBogalka:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobBogalka:setMobLevel(125)
                mobBogalka:setMod(xi.mod.DEF, 1200)
                mobBogalka:setMod(xi.mod.MDEF, 300)
                mobBogalka:setMod(xi.mod.MEVA, 400)
                mobBogalka:setMod(xi.mod.EVA, 750)
                mobBogalka:setMod(xi.mod.STR, 250)
                mobBogalka:setMod(xi.mod.VIT, 300)
                mobBogalka:setMod(xi.mod.INT, 220)
                mobBogalka:setMod(xi.mod.MND, 220)
                mobBogalka:setMod(xi.mod.CHR, 220)
                mobBogalka:setMod(xi.mod.AGI, 220)
                mobBogalka:setMod(xi.mod.ATT, 720)
                mobBogalka:setMod(xi.mod.DEX, 300)
                mobBogalka:setMod(xi.mod.MATT, 390)
                mobBogalka:setMod(xi.mod.MACC, 600)
                mobBogalka:setMod(xi.mod.ACC, 1500)
                mobBogalka:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobBogalka:setMod(xi.mod.EARTH_MEVA, 400)
                mobBogalka:setMod(xi.mod.DARK_MEVA, 450)
                mobBogalka:setMod(xi.mod.LIGHT_MEVA, 450)
                mobBogalka:setMod(xi.mod.FIRE_MEVA, 400)
                mobBogalka:setMod(xi.mod.WATER_MEVA, 400)
                mobBogalka:setMod(xi.mod.THUNDER_MEVA, 500)
                mobBogalka:setMod(xi.mod.ICE_MEVA, 0)
                mobBogalka:setMod(xi.mod.WIND_MEVA, 400)
                mobBogalka:setMod(xi.mod.SILENCERES, 600)
                mobBogalka:setMod(xi.mod.FIRE_ABSORB, 100)
                mobBogalka:setMod(xi.mod.BINDRES, 1000)
                mobBogalka:setMod(xi.mod.GRAVITYRES, 200)
                mobBogalka:setMod(xi.mod.SLEEPRES, 1000)
                mobBogalka:setMod(xi.mod.PARALYZERES, 100)
                mobBogalka:setMod(xi.mod.LULLABYRES, 1000)
                mobBogalka:setMod(xi.mod.FASTCAST, 100)
                mobBogalka:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobBogalka:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobBogalka:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set8]") == 1 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set8]") == 2 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set8]") == 3 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set8]") == 4 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set8]") == 5 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set8]") == 6 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set8]") == 7 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set8]") == 8 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set8]") == 9 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set8]") == 10 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set8]") == 11 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set8]") == 12 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set8]") == 13 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set8]") == 14 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set8]") == 15 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set8]") == 16 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set8]") == 17 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set8]") == 18 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set8]") == 19 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set8]") == 20 then
                    mobBogalka:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobBogalka:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double8]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobBogalka:setDropID(4104)
        mobBogalka:setSpawn(346.1774, -21.7428, 31.4245, 50)
        mobBogalka:spawn()

    end

    if GetServerVariable("[Double9]") == 0 then
        local mobAli = zone:insertDynamicEntity({
            objtype     = xi.objType.MOB,
                name = "Ali",
		 look = "0x0000820B00000000000000000000000000000000",
                x = 352.3081,
                y = -22.3633,
                z = -30.5639,
                rotation = 50,
		   widescan = 1,
                groupId = 16,
                groupZoneId = 291,

            onMobSpawn = function(mobAli)
                SetServerVariable("[Double9]", 1)
                SetServerVariable("[Set9]", math.random(1,20))

                -- Modifiers
                mobAli:hideHP(true)
                mobAli:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
                mobAli:setMobLevel(125)
                mobAli:setMod(xi.mod.DEF, 1200)
                mobAli:setMod(xi.mod.MDEF, 300)
                mobAli:setMod(xi.mod.MEVA, 400)
                mobAli:setMod(xi.mod.EVA, 750)
                mobAli:setMod(xi.mod.STR, 250)
                mobAli:setMod(xi.mod.VIT, 300)
                mobAli:setMod(xi.mod.INT, 220)
                mobAli:setMod(xi.mod.MND, 220)
                mobAli:setMod(xi.mod.CHR, 220)
                mobAli:setMod(xi.mod.AGI, 220)
                mobAli:setMod(xi.mod.ATT, 720)
                mobAli:setMod(xi.mod.DEX, 300)
                mobAli:setMod(xi.mod.MATT, 390)
                mobAli:setMod(xi.mod.MACC, 600)
                mobAli:setMod(xi.mod.ACC, 1500)
                mobAli:setMod(xi.mod.DOUBLE_ATTACK, 25)
                mobAli:setMod(xi.mod.EARTH_MEVA, 400)
                mobAli:setMod(xi.mod.DARK_MEVA, 450)
                mobAli:setMod(xi.mod.LIGHT_MEVA, 450)
                mobAli:setMod(xi.mod.FIRE_MEVA, 400)
                mobAli:setMod(xi.mod.WATER_MEVA, 400)
                mobAli:setMod(xi.mod.THUNDER_MEVA, 500)
                mobAli:setMod(xi.mod.ICE_MEVA, 0)
                mobAli:setMod(xi.mod.WIND_MEVA, 400)
                mobAli:setMod(xi.mod.SILENCERES, 600)
                mobAli:setMod(xi.mod.FIRE_ABSORB, 100)
                mobAli:setMod(xi.mod.BINDRES, 1000)
                mobAli:setMod(xi.mod.GRAVITYRES, 200)
                mobAli:setMod(xi.mod.SLEEPRES, 1000)
                mobAli:setMod(xi.mod.PARALYZERES, 100)
                mobAli:setMod(xi.mod.LULLABYRES, 1000)
                mobAli:setMod(xi.mod.FASTCAST, 100)
                mobAli:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 10)

                -- Status effect.
                mobAli:addStatusEffect(xi.effect.REGEN, 20, 3, 0)
                mobAli:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

                -- Skill sets.
                if GetServerVariable("[Set9]") == 1 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1027)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 1)
                elseif GetServerVariable("[Set9]") == 2 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1024)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 2)
                elseif GetServerVariable("[Set9]") == 3 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1025)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 3)
                elseif GetServerVariable("[Set9]") == 4 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 4)
                elseif GetServerVariable("[Set9]") == 5 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1075)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 5)
                elseif GetServerVariable("[Set9]") == 6 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1016)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 6)
                elseif GetServerVariable("[Set9]") == 7 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1015)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 7)
                elseif GetServerVariable("[Set9]") == 8 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 1018)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 8)
                elseif GetServerVariable("[Set9]") == 9 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 854)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 12)
                elseif GetServerVariable("[Set9]") == 10 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 861)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 13)
                elseif GetServerVariable("[Set9]") == 11 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 864)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 14)
                elseif GetServerVariable("[Set9]") == 12 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 869)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 15)
                elseif GetServerVariable("[Set9]") == 13 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 874)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 16)
                elseif GetServerVariable("[Set9]") == 14 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 877)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 17)
                elseif GetServerVariable("[Set9]") == 15 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 882)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 18)
                elseif GetServerVariable("[Set9]") == 16 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 892)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 19)
                elseif GetServerVariable("[Set9]") == 17 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 895)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 21)
                elseif GetServerVariable("[Set9]") == 18 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 898)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 22)
                elseif GetServerVariable("[Set9]") == 19 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 899)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 28)
                elseif GetServerVariable("[Set9]") == 20 then
                    mobAli:setMobMod(xi.mobMod.SKILL_LIST, 903)
                    mobAli:setMobMod(xi.mobMod.SPELL_LIST, 29)
                end
            end,

            onMobDeath = function(mob, player, isKiller, noKiller)
                SetServerVariable("[Double9]", 0)
            end,

            releaseIdOnDeath = true,

            mixins =
            {
                require("scripts/mixins/rage"),
                require("scripts/mixins/job_special"),
            },

 
            specialSpawnAnimation = true,
        })
        mobAli:setDropID(4103)
        mobAli:setSpawn(352.3081, -22.3633, -30.5639, 50)
        mobAli:spawn()
    end

end)

return m
