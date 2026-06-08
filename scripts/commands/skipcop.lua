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
    player:PrintToPlayer('!skipcop <player>')
end

commandObj.onTrigger = function(player, target)
    local function skip_cop (player)
    local missionCoP = {101, 110, 118, 128, 138, 218, 228, 238, 248, 257, 258, 318, 325, 335, 341, 350, 358, 368, 418, 428, 438, 448,
                        518, 530, 543, 552, 560, 568, 578, 618, 628, 638, 648, 718, 728, 738, 748, 758, 800, 818, 828, 840, 850}
    for i = 1, #missionCoP do
        player:addMission(6, missionCoP[i])
        player:completeMission(6, missionCoP[i])
    end
    player:addMission(6, 850) -- CoP: The Last Verse
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

    skip_cop(player)

    player:PrintToPlayer(string.format('%s skipped all COP missions.', targ:getName()))
end

return commandObj
