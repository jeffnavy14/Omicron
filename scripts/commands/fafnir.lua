-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
require("scripts/globals/titles")
require("scripts/globals/mobs")
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

        name = "Fafnir",

        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),

        groupId = 5,
        groupZoneId = 154,
	
	onMobSpawn = function(mob, target, player)
    mob:setMod(xi.mod.MOVE, 100)
	mob:setMod(xi.mod.MATT, 600)
    mob:setMod(xi.mod.MACC, 2800)
	mob:setMod(xi.mod.DEF, 3000)
	mob:setMod(xi.mod.MDEF, 3000)
	mob:setMod(xi.mod.TRIPLE_ATTACK, 80)
	mob:setMod(xi.mod.ENSPELL_DMG, 100)
    mob:setMod(xi.mod.HASTE_MAGIC, 200)
	mob:setMod(xi.mod.ATT, 3000)
	mob:setMod(xi.mod.ACC, 1800)
	
		end,
		onMobFight = function(mob, target, player)
   local lifePercent = mob:getHPP()

    
    if lifePercent < 70 then
       
		player:setCharVar('fafnir_NM', 1)
        mob:setMod(xi.mod.MOVE, 100)
		mob:setMod(xi.mod.MATT, 650)
		mob:setMod(xi.mod.MACC, 3000)
		mob:setMod(xi.mod.DEF, 3300)
		mob:setMod(xi.mod.MDEF, 3300)
		mob:setMod(xi.mod.TRIPLE_ATTACK, 100)
		mob:setMod(xi.mod.ENSPELL_DMG, 100)
		mob:setMod(xi.mod.HASTE_MAGIC, 200)
		mob:setMod(xi.mod.ATT, 3300)
		mob:setMod(xi.mod.ACC, 2000)
		
		
    end


        if lifePercent < 5 then
           mob:setMod(xi.mod.TRIPLE_ATTACK, 100)
            mob:setMod(xi.mod.UDMGPHYS, -100)
            mob:setMod(xi.mod.UDMGRANGE, -100)
            mob:setMod(xi.mod.UDMGMAGIC, -100)    

        end
    end,
        onMobDeath = function(mob, playerArg, isKiller)

        end,
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0)

    mob:spawn()
end
