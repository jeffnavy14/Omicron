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
        name = "Kirin",

        -- Set the position using in-game x, y and z
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        groupId = 64,
        groupZoneId = 288,

        onMobSpawn = function(mob)
            mob:setMod(xi.mod.DEF, 550)
            mob:setMod(xi.mod.MEVA, 475)
            mob:setMod(xi.mod.MDEF, 682)
            -- Make sure model is reset back to start
            mob:setModelId(403)
			mob:setMobMod(xi.mobMod.SKILL_LIST, 281)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 23)
            -- Prevent death and hide HP until final phase
        mob:hideHP(true)
		end,
        onMobFight = function(mob, target)

	        local lifePercent = mob:getHPP()
            if lifePercent < 70 then
			    mob:setModelId(407) -- Genbu
				mob:setMobMod(xi.mobMod.SKILL_LIST, 277)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 24)
				mob:setMod(xi.mod.DEF, 1000)
                mob:setMod(xi.mod.MEVA, 1000)
                mob:setMod(xi.mod.STR, 50)
                mob:setMod(xi.mod.VIT, 20)
                mob:setMod(xi.mod.INT, 50)
                mob:setMod(xi.mod.MND, 20)
                mob:setMod(xi.mod.CHR, 20)
                mob:setMod(xi.mod.AGI, 20)
                mob:setMod(xi.mod.DEX, 40)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 475)
                mob:setMod(xi.mod.RATTP, 475)
                mob:setMod(xi.mod.ACC, 100)
                mob:setMod(xi.mod.DOUBLE_ATTACK, 5)
                mob:setMod(xi.mod.EARTH_RES, 170)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 128)
                mob:setMod(xi.mod.FIRE_RES, 170)
                mob:setMod(xi.mod.WATER_RES, 170)
                mob:setMod(xi.mod.THUNDER_RES, 170)
                mob:setMod(xi.mod.ICE_RES, 200)
                mob:setMod(xi.mod.WIND_RES, 170)
                mob:setMod(xi.mod.SILENCERES, 100)
                mob:setMod(xi.mod.FIRE_ABSORB, 100)
                mob:setMod(xi.mod.STUNRES, 50)
                mob:setMod(xi.mod.BINDRES, 100)
                mob:setMod(xi.mod.GRAVITYRES, 100)
                mob:setMod(xi.mod.SLEEPRES, 100)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 100)
                mob:setMod(xi.mod.FASTCAST, 100)
                mob:addStatusEffect(xi.effect.REGEN, 50, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	        end
	        if lifePercent < 60 then
			    mob:setModelId(399) -- Seiryu
				mob:setMobMod(xi.mobMod.SKILL_LIST, 278)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 25)
			    mob:setMod(xi.mod.DEF, 550)
                mob:setMod(xi.mod.MEVA, 475)
                mob:setMod(xi.mod.MDEF, 682)
                mob:setMod(xi.mod.STR, 40)
                mob:setMod(xi.mod.VIT, 20)
                mob:setMod(xi.mod.INT, 50)
                mob:setMod(xi.mod.MND, 20)
                mob:setMod(xi.mod.CHR, 20)
                mob:setMod(xi.mod.AGI, 20)
                mob:setMod(xi.mod.DEX, 40)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 475)
                mob:setMod(xi.mod.RATTP, 475)
                mob:setMod(xi.mod.ACC, 150)
                mob:setMod(xi.mod.EARTH_RES, 128)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 200)
                mob:setMod(xi.mod.ICE_RES, 200)
                mob:setMod(xi.mod.FIRE_RES, 200)
                mob:setMod(xi.mod.WATER_RES, 200)
                mob:setMod(xi.mod.THUNDER_RES, 200)
                mob:setMod(xi.mod.WIND_RES, 200)
                mob:setMod(xi.mod.SILENCERES, 100)
                mob:setMod(xi.mod.STUNRES, 50)
                mob:setMod(xi.mod.BINDRES, 100)
                mob:setMod(xi.mod.GRAVITYRES, 100)
                mob:setMod(xi.mod.SLEEPRES, 100)
                mob:setMod(xi.mod.POISONRES, 100)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 100)
                mob:setMod(xi.mod.FASTCAST, 10)
                mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
	        end
	        if lifePercent < 50 then
			    mob:setModelId(338) -- Suzaku
				mob:setMobMod(xi.mobMod.SKILL_LIST, 280)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 27)
                mob:setMod(xi.mod.STR, 50)
                mob:setMod(xi.mod.VIT, 20)
                mob:setMod(xi.mod.INT, 50)
                mob:setMod(xi.mod.MND, 20)
                mob:setMod(xi.mod.CHR, 20)
                mob:setMod(xi.mod.AGI, 50)
                mob:setMod(xi.mod.DEX, 50)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 450)
                mob:setMod(xi.mod.RATTP, 450)
                mob:setMod(xi.mod.ACC, 150)
                mob:setMod(xi.mod.EVA, 100)
                mob:setMod(xi.mod.TRIPLE_ATTACK, 5)
                mob:setMod(xi.mod.EARTH_RES, 170)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 128)
                mob:setMod(xi.mod.FIRE_RES, 128)
                mob:setMod(xi.mod.WATER_RES, 170)
                mob:setMod(xi.mod.THUNDER_RES, 170)
                mob:setMod(xi.mod.ICE_RES, 200)
                mob:setMod(xi.mod.WIND_RES, 170)
                mob:setMod(xi.mod.SILENCERES, 100)
                mob:setMod(xi.mod.STUNRES, 50)
                mob:setMod(xi.mod.BINDRES, 100)
                mob:setMod(xi.mod.GRAVITYRES, 100)
                mob:setMod(xi.mod.SLEEPRES, 100)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 100)
                mob:setMod(xi.mod.FASTCAST, 10)
                mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
		    end
	        if lifePercent < 40 then
			    mob:setModelId(309) -- Byakko
				mob:setMobMod(xi.mobMod.SKILL_LIST, 279)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 26)
                mob:setMod(xi.mod.STR, 40)
                mob:setMod(xi.mod.VIT, 20)
                mob:setMod(xi.mod.INT, 65)
                mob:setMod(xi.mod.MND, 20)
                mob:setMod(xi.mod.CHR, 20)
                mob:setMod(xi.mod.AGI, 20)
                mob:setMod(xi.mod.DEX, 40)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 525)
                mob:setMod(xi.mod.RATTP, 525)
                mob:setMod(xi.mod.ACC, 100)
                mob:setMod(xi.mod.EARTH_RES, 200)
                mob:setMod(xi.mod.DARK_RES, 250)
                mob:setMod(xi.mod.LIGHT_RES, 200)
                mob:setMod(xi.mod.FIRE_RES, 128)
                mob:setMod(xi.mod.WATER_RES, 200)
                mob:setMod(xi.mod.THUNDER_RES, 200)
                mob:setMod(xi.mod.WIND_RES, 200)
                mob:setMod(xi.mod.ICE_RES, 200)
                mob:setMod(xi.mod.SILENCERES, 100)
                mob:setMod(xi.mod.ICE_ABSORB, 100)
                mob:setMod(xi.mod.STUNRES, 50)
                mob:setMod(xi.mod.BINDRES, 100)
                mob:setMod(xi.mod.GRAVITYRES, 100)
                mob:setMod(xi.mod.SLEEPRES, 100)
                mob:setMod(xi.mod.POISONRES, 100)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 100)
                mob:setMod(xi.mod.FASTCAST, 10)
                mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)

		    end
			if lifePercent < 30 then
			    mob:setModelId(610) -- Kirin
				mob:setMobMod(xi.mobMod.SKILL_LIST, 259)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 109)
                mob:setMod(xi.mod.STR, 40)
                mob:setMod(xi.mod.VIT, 20)
                mob:setMod(xi.mod.INT, 65)
                mob:setMod(xi.mod.MND, 20)
                mob:setMod(xi.mod.CHR, 20)
                mob:setMod(xi.mod.AGI, 20)
                mob:setMod(xi.mod.DEX, 40)
                mob:setMod(xi.mod.DEFP, 0)
                mob:setMod(xi.mod.RATTP, 0)
                mob:setMod(xi.mod.DEFP, 375)
                mob:setMod(xi.mod.RATTP, 375)
                mob:setMod(xi.mod.ACC, 100)
                mob:setMod(xi.mod.EARTH_RES, 170)
                mob:setMod(xi.mod.DARK_RES, 240)
                mob:setMod(xi.mod.LIGHT_RES, 170)
                mob:setMod(xi.mod.FIRE_RES, 128)
                mob:setMod(xi.mod.WATER_RES, 170)
                mob:setMod(xi.mod.THUNDER_RES, 170)
                mob:setMod(xi.mod.WIND_RES, 128)
                mob:setMod(xi.mod.ICE_RES, 200)
                mob:setMod(xi.mod.SILENCERES, 100)
                mob:setMod(xi.mod.STUNRES, 50)
                mob:setMod(xi.mod.BINDRES, 100)
                mob:setMod(xi.mod.GRAVITYRES, 100)
                mob:setMod(xi.mod.SLEEPRES, 100)
                mob:setMod(xi.mod.POISONRES, 100)
                mob:setMod(xi.mod.PARALYZERES, 100)
                mob:setMod(xi.mod.LULLABYRES, 100)
                mob:setMod(xi.mod.EARTH_ABSORB, 100)
                mob:setMod(xi.mod.LIGHT_ABSORB, 100)
                mob:addStatusEffect(xi.effect.REGEN, 30, 3, 0)
                mob:setMod(xi.effect.FAST_CAST, 25)
                mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
		    end
	    end,
			
        onMobDeath = function(mob, playerArg, isKiller)

        end,

        releaseIdOnDeath = true,

        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require("scripts/mixins/rage"),
            require("scripts/mixins/job_special"),
        }
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0) -- No loot!

    mob:spawn()

    player:PrintToPlayer(string.format("Spawning Fafnir (Lv: %i, HP: %i)\n%s", mob:getMainLvl(), mob:getMaxHP(), mob))
end
