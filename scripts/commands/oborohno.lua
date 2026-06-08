-----------------------------------
-- func: resetoboro
-- desc: Resets all Oboro weapon upgrade character variables for the user.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = ''
}

commandObj.onTrigger = function(player)
    player:customMenu({
        title = 'Reset Oboro? You will NOT get items back.',
        options = {
            { 'Yes, reset my progress.', function(player)
                player:setCharVar("[Oboro]UpgradeWeapon", 0)
                player:setCharVar("[Oboro]UpgradeMidnight", 0)
                player:setCharVar("[Oboro]BaseWeapon", 0)
                player:setCharVar("[Oboro]MaterialCount", 0) 
                player:setCharVar("[Oboro]WeaponRegistered",0)
                player:printToPlayer("Your Oboro upgrade progress variables have been reset to 0.", xi.msg.channel.SYSTEM_3)
            end },
            { 'No, cancel.', function(player) end }
        }
    })
end

return commandObj