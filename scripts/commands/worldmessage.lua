-----------------------------------
-- Sends a World Wide Message
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 's'
}
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!worldmessage <worldMessage>')
end
local openingDecoration = '\129\154'
local closingDecoration = '\129\154'

commandObj.onTrigger = function(player, worldMessage)

        local decoratedMessage = string.format('%s %s %s', openingDecoration, worldMessage, closingDecoration)
        local decoratedentry = string.format('%s %s %s %s', openingDecoration, openingDecoration, closingDecoration, closingDecoration)
        player:printToArea(decoratedentry, xi.msg.channel.SYSTEM_3, 0, '') -- Sends announcement via ZMQ to all processes and zones
        player:printToArea(decoratedMessage, xi.msg.channel.SYSTEM_3, 0, '') -- Sends announcement via ZMQ to all processes and zones
        player:printToArea(decoratedentry, xi.msg.channel.SYSTEM_3, 0, '') -- Sends announcement via ZMQ to all processes and zones
end

return commandObj
