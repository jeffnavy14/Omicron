-----------------------------------
-- func: skipcop'
-- desc: skipallcop missions
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = 's'
}

local function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer('!skiproz <player>')
end

commandObj.onTrigger = function(player, target)
    local function skip_roz (player)
    local missionZM = {0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 23, 24, 26, 27, 28, 30}
    for i = 1, #missionZM do
        player:addMission(3, missionZM[i])
        player:completeMission(3, missionZM[i])
    end
        player:addMission(3, 31) -- RoZ: Awakening
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    skip_roz(player)

    player:PrintToPlayer(string.format('%s skipped all ROZ missions.', targ:getName()))
end

return commandObj
