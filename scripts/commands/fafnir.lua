-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()

    local mob = zone:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = "Ninja Turtle",
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        groupId = 7,
        groupZoneId = 128,

        onMobSpawn = function(mob)
		    SetServerVariable("[EschanAspi]", 0)
		    SetServerVariable("[NinjaTurtle]", 1)
            mob:setModelId(2382)
            mob:hideHP(true)
            mob:setHP(200000)
            mob:setMobMod(xi.mobMod.SKILL_LIST, 479)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 126)
            mob:useMobAbility(1486)
        end,	
        onMobFight = function(mob, target)

	    end,
			
        onMobDeath = function(mob, player, isKiller, noKiller)
            SetServerVariable("[NinjaTurtle]", 0)
        end,
        releaseIdOnDeath = true,

        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require("scripts/mixins/rage"),
            require("scripts/mixins/job_special"),
        },

        -- The "whooshy" special animation that plays when Trusts or Dynamis mobs spawn
        specialSpawnAnimation = true,
    })

    mob:setSpawn(-5.4115, 0.1944, -33.4813, 50)
    mob:setDropID(4056)
    mob:spawn()
    mob:setMobLevel(119)
    mob:setMod(xi.mod.HPP, 500)
    mob:setMod(xi.mod.DEF, 2000)
    mob:setMod(xi.mod.MDEF, 250)
    mob:setMod(xi.mod.MEVA, 450)
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

    player:PrintToPlayer(string.format("Spawning Fafnir (Lv: %i, HP: %i)\n%s", mob:getMainLvl(), mob:getMaxHP(), mob))
end
