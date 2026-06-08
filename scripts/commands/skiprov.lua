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
    player:PrintToPlayer('!skiprov <player>')
end

commandObj.onTrigger = function(player, target)
    local function skip_rov (player)
    local missionROV = {0, 2, 3, 4, 6, 10, 12, 18, 20, 22, 26, 28, 30, 32, 34, 36, 40, 42, 44, 46, 48, 50, 52, 54, 56, 60, 62, 64, 66,
                        68, 70, 72, 78, 80, 83, 86, 92, 94, 96, 98, 100, 102, 103, 104, 106, 108, 110, 114, 116, 118, 120, 122, 124,
                        126, 130, 132, 136, 142, 144, 146, 150, 152, 154, 155, 156, 158, 160, 161, 162, 164, 166, 170, 172, 174, 178,
                        180, 184, 188, 190, 192, 194, 196, 198, 200, 202, 206, 210, 212, 216, 218, 220, 222, 224, 226}
    for i = 1, #missionROV do
        player:addMission(13, missionROV[i])
        player:completeMission(13, missionROV[i])
    end
        player:addMission(13, 226) -- 
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

    skip_rov(player)

    player:PrintToPlayer(string.format('%s skipped all ROV missions.', targ:getName()))
end

return commandObj
