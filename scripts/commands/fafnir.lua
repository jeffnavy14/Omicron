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
    onMobSpawn = function(mob)
        print(string.format("onMobSpawn = function is working"))
		mob:setMobFlags(CALL_FOR_HELP)
    end,
	onMobInitialize = function(mob)
	    print(string.format("onMobInitialize = function is working"))
	end,
	
	onMobFight = function(mob, target, playerArg)
	    print(string.format("onMobFight = function is working"))
    end,

    onMobDeath = function(mob, playerArg, isKiller)
	    local Addon = GetServerVariable("Addon_Test")
        local AddonLeft = math.floor(Addon / 4)
		SetServerVariable("Addon_Test", Addon - AddonLeft - 1)
       print(string.format("On death is working"))
    end,
    })

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:setDropID(0)

    mob:spawn()
	print(string.format("onTrigger is working"))
end
