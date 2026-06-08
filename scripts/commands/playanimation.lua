-----------------------------------
-- func: playweapons
-- desc: playweapons <idx>
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!playanimation <idx>')
end


local function sendPacket(player, i)
local target = player:getCursorTarget()
   player:printToPlayer(tostring(i))
     target:injectActionPacket(player:getID(), 11, i, 0, 0, 0, 10, 1)
    player:timer(5000, function(playerArg) sendPacket(playerArg, i + 1) end)
end


commandObj.onTrigger = function(player, idx)
    sendPacket(player, idx)
end

return commandObj
