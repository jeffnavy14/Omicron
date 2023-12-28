-----------------------------------
-- func: skipfloor
-- desc: completes the current nyzul isle objective.
-----------------------------------
require("scripts/globals/nyzul")

local ID = require("scripts/zones/Nyzul_Isle/IDs")

local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}

commandObj.onTrigger = function(player, npc)
    local zone   = player:getZoneID()
    local target = player:getCursorTarget()
    
    if target == nil then 
        player:printToPlayer("You must be targetting the Rune of Transfer to use this command.")
        return
    end
    
    if os.time() - player:getCharVar("[Nyzul]SkippedFloor") < 3600 then
        player:printToPlayer("This command is still on cooldown!")
        return
    end
    
    if zone == xi.zone.NYZUL_ISLE and (target:getID() == 17093330 or target:getID() == 17093331) then
        local confirmMenu  =
        {
            title = string.format("Are you sure you want to skip this floor?", cost, coinBalance),
            onStart = function(playerArg)
            end,
        
            options =
            {
                {
                    "Yes, I'm sure!",
                    function(playerArg)
                        player:setCharVar("[Nyzul]SkippedFloor", os.time())
                        player:printToPlayer("Skipping floor... This command will be locked out for 60 minutes.")
                        target:setAnimationSub(1)
                    end,
                },
                {
                    "No, I change my mind.",
                    function(playerArg)
                        return
                    end,
                },
            },
        }
        player:customMenu(confirmMenu)
    end
end

return commandObj