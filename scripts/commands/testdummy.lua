-----------------------------------
-- Testdummy
-----------------------------------
local commandObj = {}
      commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!testdummy')
end

commandObj.onTrigger = function(player)
    local x = 347.2237
    local y = -12.5101
    local z = -400.0551
    local rot = 255
    local zone = 258
    if
        player:getZoneID() ~= xi.zone.RALA_WATERWAYS then
        player:setPos(x, y, z, rot, zone)
    end
end

return commandObj