-----------------------------------
-- Teleport  Library
-----------------------------------
local commandObj = {}
      commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!library')
end

commandObj.onTrigger = function(player)
    local x = -95.3304
    local y = -2.6501
    local z = -85.1366
    local rot = 92
    local zone = 284

    player:setPos(x, y, z, rot, zone)
    end

return commandObj