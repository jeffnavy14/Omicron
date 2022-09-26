-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------

cmdprops =
{
    permission = 5,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()

    local mob = zone:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = "Muffin",
        look = "0x00000E0100000000000000000000000000000000",
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        groupId = 61,
        groupZoneId = 37,

        onMobSpawn = function(mob)
            mob:hideHP(true)
            mob:setHP(200000)
            mob:setMobMod(xi.mobMod.SKILL_LIST, 77)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 6)
            mob:useMobAbility(1486)
        end,	
        onMobFight = function(mob, target)

	    end,
			
        onMobDeath = function(mob, player, isKiller, noKiller)

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


    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())
    mob:spawn()
    mob:setMobLevel(135)
    mob:setMod(xi.mod.DEF, 1200)
    mob:setMod(xi.mod.MDEF, 250)
    mob:setMod(xi.mod.HPP, 200)
    mob:setMod(xi.mod.MEVA, 450)
    mob:setMod(xi.mod.EVA, 200)
    mob:setMod(xi.mod.STR, 200)
    mob:setMod(xi.mod.VIT, 200)
    mob:setMod(xi.mod.INT, 150)
    mob:setMod(xi.mod.MND, 150)
    mob:setMod(xi.mod.CHR, 120)
    mob:setMod(xi.mod.AGI, 120)
    mob:setMod(xi.mod.DEX, 240)
    mob:setMod(xi.mod.MATT,150)
    mob:setMod(xi.mod.ACC, 1000)
    mob:setMod(xi.mod.ATT, 1100)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 100)
    mob:setMod(xi.mod.EARTH_MEVA, 400)
    mob:setMod(xi.mod.DARK_MEVA, 450)
    mob:setMod(xi.mod.LIGHT_MEVA, 450)
    mob:setMod(xi.mod.FIRE_MEVA, 400)
    mob:setMod(xi.mod.WATER_MEVA, 400)
    mob:setMod(xi.mod.THUNDER_MEVA, 500)
    mob:setMod(xi.mod.WIND_MEVA, 400)
    mob:setMod(xi.mod.SILENCERES, 600)
    mob:setMod(xi.mod.FIRE_ABSORB, 100)
    mob:setMod(xi.mod.BINDRES, 1000)
    mob:setMod(xi.mod.GRAVITYRES, 200)
    mob:setMod(xi.mod.SLEEPRES, 1000)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 1000)
    mob:setMod(xi.mod.FASTCAST, 100)
    mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
    mob:addStatusEffect(xi.effect.HUNDRED_FISTS, 1, 0)

    player:PrintToPlayer(string.format("Spawning Fafnir (Lv: %i, HP: %i)\n%s", mob:getMainLvl(), mob:getMaxHP(), mob))
end
