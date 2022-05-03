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
	 mob:setMobMod(xi.mobMod.HP_STANDBACK, -1)
	    print(string.format("onMobInitialize = function is working"))
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
       print(string.format("On death is working"))
    end,
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0)

    mob:spawn()
	mob:setMobLevel(135)
	mob:setMod(xi.mod.MATT, 600)
    mob:setMod(xi.mod.MACC, 2800)
	mob:setMod(xi.mod.DEF, 3000)
	mob:setMod(xi.mod.MDEF, 3000)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 30)
	mob:setMod(xi.mod.ENSPELL_DMG, 100)
    mob:setMod(xi.mod.HASTE_MAGIC, 200)
	mob:setMod(xi.mod.ATT, 3000)
	mob:setMod(xi.mod.ACC, 1800)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 20)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
	mob:setMod(xi.mod.HASTE_MAGIC, 200)
	mob:setMobMod(xi.mobMod.SKILL_LIST, 726)
	mob:setMobMod(xi.mobMod.SPELL_LIST, 144)
	mob:setMod(xi.mod.PETRIFYRES, 500) -- "Possesses a resist petrify trait"
	mob:setMod(xi.mod.STUNRES, 1000)
    mob:setMod(xi.mod.COUNTER, 10) -- "Possesses a Counter trait"
	print(string.format("onTrigger is working"))
end
