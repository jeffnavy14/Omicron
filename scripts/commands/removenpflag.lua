-----------------------------------
-- func: setlocalvar <varName> <player/mob/npc> <ID>
-- desc: set player npc or mob local variable and value.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = 'siss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!removenpflag')
end

commandObj.onTrigger = function(player, arg1, arg2, arg3, arg4)

   targ = player:getCursorTarget()
   targ:setNewPlayer(false)

end

return commandObj
