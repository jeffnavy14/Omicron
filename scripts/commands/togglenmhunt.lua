-----------------------------------
-- func: togglenmhunt
-- desc: Toggles NM Hunt server-wide announcements on or off.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local isSuppressed = player:getCharVar("NMHuntMessage")

    if isSuppressed == 1 then
        player:setCharVar("NMHuntMessage", 0)
        player:printToPlayer("NM Hunt announcements are now ON.", xi.msg.channel.SYSTEM_3)
    else
        player:setCharVar("NMHuntMessage", 1)
        player:printToPlayer("NM Hunt announcements are now OFF.", xi.msg.channel.SYSTEM_3)
    end
end

return commandObj