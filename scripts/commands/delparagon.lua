-----------------------------------
-- Delete all of the players paragon effect
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 'ss'
}
local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!delparagon <target>')
end

commandObj.onTrigger = function(player, target)
    if target == nil then
        error(player, 'Please put in a players name!  !delparagon <playersName>')
        return
    end
    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Player named "%s" not found!', target))
        return
    end
            local jobNameByNum = {}
                for k, v in pairs(xi.job) do
                    jobNameByNum[v] = k
                end

    for i = 1, 22 do
        targ:setCharVar('[ParagonModTier1]'..jobNameByNum[i], 0)
        targ:setCharVar('[ParagonModTier2]'..jobNameByNum[i], 0)
        targ:setCharVar('[ParagonModTier3]'..jobNameByNum[i], 0)
        targ:setCharVar('[ParagonModTier4]'..jobNameByNum[i], 0)
        targ:setCharVar('[ParagonModTier5]'..jobNameByNum[i], 0)
        targ:setCharVar('[ParagonMod]Active', 2)
    end
        targ:delStatusEffect(xi.effect.PARAGON)
        targ:setCharVar('[ParagonMod]Active', 0)
        player:printToPlayer(string.format('You have deleted all of %s Paragon levels', target))
        targ:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID())
end
return commandObj
