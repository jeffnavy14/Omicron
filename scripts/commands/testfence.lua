-----------------------------------
-- Teleport  Yhoator
-- Enchantment: "Teleport-Yhoator"
-----------------------------------
local commandObj = {}
commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!testfence')
end

commandObj.onTrigger = function(player)
    local objective = {
            fence = {
                pos = {x = player:getXPos(), z = player:getZPos()}, -- center of fence
                radius = 50.00, -- radius from pos in yalms
                render = 10.00, -- distance from fence it becomes visible
                blue = true -- optional, turns default red fence bars blue
            },
    }
    player:objectiveUtility(objective)
end
return commandObj
