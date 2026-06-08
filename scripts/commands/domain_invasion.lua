-----------------------------------
-- func: domain_invasion
-- desc: Control Domain Invasion system
-----------------------------------
local controller = require("scripts/globals/di_controller")

local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = "s"
}

commandObj.onTrigger = function(player, action)

    if not action then
        player:printToPlayer("Usage: !domain_invasion <start|stop|restart|status>")
        return
    end

    action = string.lower(action)

    if action == "start" then
        controller.start()
        player:printToPlayer("[DI] Controller started.")

    elseif action == "stop" then
        controller.stop()
        player:printToPlayer("[DI] Controller stopped.")

    elseif action == "restart" then
        controller.restart()
        player:printToPlayer("[DI] Controller restarted.")

    elseif action == "status" then
        local active = GetServerVariable("DI_ACTIVE")

        if active == 1 then
            player:printToPlayer("[DI] Status: RUNNING")
        else
            player:printToPlayer("[DI] Status: STOPPED")
        end

    else
        player:printToPlayer("Invalid option.")
        player:printToPlayer("Usage: !domain_invasion <start|stop|restart|status>")
    end
end

return commandObj
