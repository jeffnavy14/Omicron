-- func: setservervar
-- desc: Sets a global server variable to a specified integer value.
-- Usage: !setservervar <variableName> <value>
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 'ss'
}

-- Helper function for error and usage message
local function error_message(player)
    player:printToPlayer('Usage: !setservervar <variableName> <value>')
    player:printToPlayer('Example: !setservervar carddropdebug 1')
end

commandObj.onTrigger = function(player, variable, value)
    if variable == nil then
        player:printToPlayer('Error: You must provide a variable name.')
        error_message(player)
        return
    end

    local numericValue = tonumber(value)

    if numericValue == nil then
        player:printToPlayer('Error: Invalid value provided. The value must be a whole number.')
        player:printToPlayer('Input provided was not a number.')
        error_message(player)
        return
    end
    
    value = numericValue

    local oldValue = GetServerVariable(variable) or "nil/not set"


    SetServerVariable(variable, value)
    
    local newValue = GetServerVariable(variable) or "nil/not set"

    player:printToPlayer(string.format('Server variable \'%s\' updated.', variable))
    player:printToPlayer(string.format('    Old value: \'%s\'', oldValue))
    player:printToPlayer(string.format('    New value: \'%s\'', newValue))
    player:printToPlayer('Note: The variable value is stored as a string internally.')
end

return commandObj