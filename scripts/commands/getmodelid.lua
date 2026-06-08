---------------------------------------------------------------------------------------------------
-- func: modelid
-- desc: prints model of cursor target into chatlog, for debugging.
---------------------------------------------------------------------------------------------------
local commandObj = {}
      commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getmodelid')
end


commandObj.onTrigger = function(player)
    local target = player:getCursorTarget()
    if target == nil then
        player:printToPlayer('Target something first.')
        return
    else
    player:printToPlayer(string.format('Model ID: %i', target:getModelId()), xi.msg.channel.SYSTEM_3)
    end
end

return commandObj
