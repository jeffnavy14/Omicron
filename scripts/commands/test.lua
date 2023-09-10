-----------------------------------
-- func: test
-- desc: A test command module
-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, str)
    print(str)
    player:PrintToPlayer(str, xi.msg.channel.SYSTEM_3, "")
end

commandObj.onTrigger = function(player)
    double_print("Test print")
end
return commandObj