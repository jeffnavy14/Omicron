-----------------------------------
-- func: setrace
-- desc: Sets the players race.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setrace <race> <player>')
end

commandObj.onTrigger = function(player, race, target)
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

    if race == nil or (race <= 0 or race > 8) then
        error(player, 'Improper race selected. Valid Values: 1 to 8')
        return
    end

        local toString = { 'Hume Male', 'Hume Female', 'Elvan Male', 'Elvan Female', 'Taru Male', 'Taru Female', 'Mithra', 'Galka' }

        
    local playerSize = targ:getSize()
    local playerFace = targ:getFace()

    player:printToPlayer(string.format('You set %s\'s Race to %s', targ:getName(), toString[race]))
    targ:raceChange(race, playerFace, playerSize)
    targ:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID())
end

return commandObj
