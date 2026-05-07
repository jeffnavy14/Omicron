-----------------------------------
-- func: aepreset
-- desc: Resets all alter ego upgrade ranks for the player issuing the command. GM only.
--       Does NOT refund AEP — refunds need a manual SQL adjustment to char_points.
-- usage: !aepreset
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    player:resetAlterEgoUpgrades()
    player:printToPlayer('All alter ego upgrade ranks reset to 0. AEP balance unchanged.')
end

return commandObj
