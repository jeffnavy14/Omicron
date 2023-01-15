-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
    name = "PollyB",
	look = 3613,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),

	
	onTrigger = function(player, npc, status)
    local race = player:getRace()
	if race == 8 then
	player:PrintToPlayer(string.format("damn hume (%s)", npc:getPacketName()))
    end
    end,   
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end