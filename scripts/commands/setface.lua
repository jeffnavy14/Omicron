-----------------------------------
-- func: setface
-- desc: Sets the players face.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setface <face> <player>')
end

commandObj.onTrigger = function(player, face, target)
    -- validate target
    local targ
    local cursorTarget = player:getCursorTarget()

    if target then
        targ = GetPlayerByName(target)
        if not targ then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    elseif cursorTarget and not cursorTarget:isNPC() then
        targ = cursorTarget
    else
        targ = player
    end

    if face == nil or face < 0 then
        error(player, 'Improper face selected.')
        return
    end

    local playerSize = targ:getSize()
    local playerRace = targ:getRace()

    player:printToPlayer(string.format('You set %s\'s Face', targ:getName()))
    targ:raceChange(playerRace, face, playerSize)
    targ:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID())
end

return commandObj
