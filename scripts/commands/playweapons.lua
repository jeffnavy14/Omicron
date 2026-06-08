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
    player:printToPlayer('!playweapons <idx>')
end

local slotNameByNum = {
    [0] = "main",
    [1] = "sub",
    [2] = "ranged",
    [3] = "ammo",
    [4] = "head",
    [5] = "body",
    [6] = "hands",
    [7] = "legs",
    [8] = "feet"
}

local function sendPacket(player, i)
    player:printToPlayer(tostring(i))
    player:setModelId(i, 0)
    player:timer(5000, function(playerArg) sendPacket(playerArg, i + 1) end)
end



commandObj.onTrigger = function(player, idx)
    sendPacket(player, idx)
end

return commandObj
