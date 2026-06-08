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
    player:PrintToPlayer('!skiptoau <player>')
end

commandObj.onTrigger = function(player, target)
    local function skip_toau (player)
    local missionTOAU = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
                       30 ,31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47}
    for i = 1, #missionTOAU do
        player:addMission(4, missionTOAU[i])
        player:completeMission(4, missionTOAU[i])
    end
        player:addMission(4, 47) -- 
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

    skip_toau(player)

    player:PrintToPlayer(string.format('%s skipped all ToAu missions.', targ:getName()))
end

return commandObj
