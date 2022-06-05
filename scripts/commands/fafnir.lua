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
        name = "Kirin",

        -- Set the position using in-game x, y and z
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        groupId = 64,
        groupZoneId = 288,

        onMobSpawn = function(mob)
            mob:setMod(xi.mod.DEF, 450)
            mob:setMod(xi.mod.MEVA, 380)
            mob:setMod(xi.mod.MDEF, 50)
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
	        end
	        if lifePercent < 60 then
			    mob:setModelId(399) -- Seiryu
				mob:setMobMod(xi.mobMod.SKILL_LIST, 278)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 25)
	        end
	        if lifePercent < 50 then
			    mob:setModelId(338) -- Suzaku
				mob:setMobMod(xi.mobMod.SKILL_LIST, 280)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 27)
		    end
	        if lifePercent < 40 then
			    mob:setModelId(309) -- Byakko
				mob:setMobMod(xi.mobMod.SKILL_LIST, 279)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 26)

		    end
			if lifePercent < 30 then
			    mob:setModelId(403) -- Kirin
				mob:setMobMod(xi.mobMod.SKILL_LIST, 281)
                mob:setMobMod(xi.mobMod.SPELL_LIST, 23)
		    end
	    end,
			
        onMobDeath = function(mob, playerArg, isKiller)

        end,

        releaseIdOnDeath = true,
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0) -- No loot!

    mob:spawn()

    player:PrintToPlayer(string.format("Spawning Fafnir (Lv: %i, HP: %i)\n%s", mob:getMainLvl(), mob:getMaxHP(), mob))
end
