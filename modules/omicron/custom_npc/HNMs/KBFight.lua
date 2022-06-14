-----------------------------------
require("modules/module_utils")
require("scripts/zones/Behemoths_Dominion/Zone")
-----------------------------------
local m = Module:new("KBFight")

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)
    super(zone)

    if GetServerVariable("EschanKB") > 1 then
       SetServerVariable("EschanKB", 0)
	end
end)


m:addOverride("xi.zones.Behemoths_Dominion.Zone.onZoneTick", function(zone, mob)
    super(zone)

    if
        GetServerVariable("EschanKB") == 1
    then
        local mob = zone:insertDynamicEntity({
                objtype = xi.objType.MOB,
                name = "Eschan King Behemoth",
                x = -271.3363,
                y = -19.3878,
                z = 61.8363,
                rotation = 50,
                groupId = 10,
                groupZoneId = 127,

        onMobSpawn = function(mob)
		    SetServerVariable("EschanKB", 0)
            end,	
    		
            onMobDeath = function(mob, player, isKiller, noKiller)

            end,
			releaseIdOnDeath = true,
        })

		mob:setMobMod(xi.mobMod.SKILL_LIST, 479)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 126)
            mob:hideHP(true)

        mob:setDropID(4055)
        mob:setSpawn(-271.3363, -19.3878, 61.8363, 50)
        mob:spawn()
		    mob:setMod(xi.mod.DEF, 1200)
                mob:setMod(xi.mod.MDEF, 1400)
                mob:setMod(xi.mod.MEVA, 500)
                mob:setMod(xi.mod.EVA, 500)
                mob:setMod(xi.mod.STR, 200)
                mob:setMod(xi.mod.VIT, 200)
                mob:setMod(xi.mod.INT, 150)
                mob:setMod(xi.mod.MND, 150)
                mob:setMod(xi.mod.CHR, 120)
                mob:setMod(xi.mod.AGI, 120)
                mob:setMod(xi.mod.DEX, 140)
                mob:setMod(xi.mod.MATT, 250)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 475)
                mob:setMod(xi.mod.RATTP, 475)
                mob:setMod(xi.mod.ACC, 100)
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
	          mob:setMod(xi.mod.ADD_EFFECT, 1)
                mob:setMod(xi.mod.ALL_WSDMG_ALL_HITS, 25)
                mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	      end

	onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN)

		 end
end)

return m
		
