---------------------------------------------------------------------------------------------------
-- func: !kill <victim> <exp loss>
-- desc: Murders targeted player. Sometimes GM jail just isn't enough.
---------------------------------------------------------------------------------------------------
require("scripts/globals/interaction/actions/message")
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = "si"
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!kill')
end

-- function(player, victim, exploss)
commandObj.onTrigger = function(player, actionId, animationId, speceffect, reaction, message)



        local targ = player:getCursorTarget()


        if targ then
            player:printToArea(string.format("%s has incurred the wrath of [GM] %s and been struck down...Violently!", targ, player:getName()))
            -- Begin Wrath of the Gods Animation
                 targ:injectActionPacket(targ:getID(), 5, 271, 0, 0, 0, 10, 1)
                 targ:injectActionPacket(targ:getID(), 5, 202, 0, 0, 0, 10, 1)
                 targ:injectActionPacket(targ:getID(), 5, 207, 0, 0, 0, 10, 1)
                 targ:injectActionPacket(targ:getID(), 5, 216, 0, 0, 0, 10, 1)
                 targ:injectActionPacket(targ:getID(), 5, 270, 0, 0, 0, 10, 1)
            -- End Wrath of the Gods Animation
            targ:setHP(0)

        else
            player:printToPlayer(string.format( "Victim named '%s' not found!  "))

        end
    end

return commandObj