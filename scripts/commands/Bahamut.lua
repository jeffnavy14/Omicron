-----------------------------------
-- func: Bahamut
-- desc: Summon a fightable Bahamut (no loot)
-- note:
-----------------------------------
require("scripts/globals/status")
------------------------------------

cmdprops =
{
    permission = 5,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()

    local mob = zone:insertDynamicEntity({
	    
        objtype = xi.objType.MOB,

        name = "Bahamut",

        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),

        groupId = 17,
        groupZoneId = 29,
		
    onMobSpawn = function(mob)
	mob:addStatusEffect(xi.effect.PHALANX, 35, 0, 180)
    mob:addStatusEffect(xi.effect.STONESKIN, 350, 0, 300)
    mob:addStatusEffect(xi.effect.PROTECT, 175, 0, 1800)
    mob:addStatusEffect(xi.effect.SHELL, 24, 0, 1800)
        print(string.format("onMobSpawn = function is working"))
    end,
	onMobInitialize = function(mob)
	end,
	
	onMobFight = function(mob, target)
		local lifePercent = mob:getHPP()
        if lifePercent < 70 and GetServerVariable("MegaFlareUsed") == 0 then
            mob:useMobAbility(1551)
			SetServerVariable("MegaFlareUsed", 1)
	    end
		if lifePercent < 45 and GetServerVariable("MegaFlareUsed") == 1 then
            mob:useMobAbility(1551)
			SetServerVariable("MegaFlareUsed", 2)
	    end
		if lifePercent < 25 and GetServerVariable("GigaFlareUsed") == 0 then
            mob:useMobAbility(1552)
			SetServerVariable("GigaFlareUsed", 1)
	    end
		if lifePercent < 5 and GetServerVariable("GigaFlareUsed") == 1 then
            mob:useMobAbility(1552)
			mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
			SetServerVariable("GigaFlareUsed", 2)
	    end
    end,

    onMobDeath = function(mob, playerArg, isKiller)
	SetServerVariable("MegaFlareUsed", 0)
	SetServerVariable("GigaFlareUsed", 0)
    end,
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0)

        mob:spawn()
		mob:setMobLevel(125)
		mob:addMod(xi.mod.MAIN_DMG_RATING, 50)
		mob:setMobMod(xi.mobMod.CHECK_AS_NM, 1)
        mob:addMod(xi.mod.STR, 40)
        mob:addMod(xi.mod.VIT, 20)
        mob:addMod(xi.mod.INT, 65)
        mob:addMod(xi.mod.MND, 20)
        mob:addMod(xi.mod.CHR, 20)
        mob:addMod(xi.mod.AGI, 20)
        mob:addMod(xi.mod.DEX, 40)
        mob:setMod(xi.mod.DEFP, 0)
        mob:setMod(xi.mod.RATTP, 0)
        mob:addMod(xi.mod.DEFP, 375)
        mob:addMod(xi.mod.RATTP, 375)
        mob:addMod(xi.mod.ACC, 100)
        mob:setMod(xi.mod.EARTH_SDT, 170)
        mob:setMod(xi.mod.DARK_SDT, 240)
        mob:setMod(xi.mod.LIGHT_SDT, 170)
        mob:setMod(xi.mod.FIRE_SDT, 128)
        mob:setMod(xi.mod.WATER_SDT, 170)
        mob:setMod(xi.mod.THUNDER_SDT, 170)
        mob:setMod(xi.mod.WIND_SDT, 128)
        mob:setMod(xi.mod.ICE_SDT, 200)
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
        mob:addStatusEffect(xi.effect.ENSTONE_II, 100, 0, 0)
        mob:addStatusEffect(xi.effect.REFRESH, 50, 3, 0)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 313)
        mob:setMobMod(xi.mobMod.SPELL_LIST, 24)

	print(string.format("onTrigger is working"))
end
