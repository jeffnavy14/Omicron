-----------------------------------
-- func: buff
-- desc: Toggles buff on the player, granting them several special abilities.
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 'i'
}

local buffOn = function(player)
    local power        = 50
    local regainPower  = 25
    local refreshPower = 10
    local regenPower   = 10
    local expPower     = 500
    local buffs =
        {
            { xi.mod.RACC, power },
            { xi.mod.RACC, power },
            { xi.mod.RATT, power },
            { xi.mod.ACC, power },
            { xi.mod.ATT, power },
            { xi.mod.MATT, power },
            { xi.mod.MACC, power },
            { xi.mod.RDEF, power },
            { xi.mod.DEF, power },
            { xi.mod.MDEF, power },
        }

    local jobNameByNum = {}
        for k, v in pairs(xi.job) do
            jobNameByNum[v] = k
        end

   if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 10 then
       power        = 35
       regainPower  = 25
       refreshPower = 10
       regenPower   = 10
       expPower     = 350
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 20 then
       power        = 25
       regainPower  = 15
       refreshPower = 7
       regenPower   = 7
       expPower     = 250
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 30 then
       power        = 15
       regainPower  = 7
       refreshPower = 3
       regenPower   = 3
       expPower     = 100
   end

    player:setCharVar('Buff', 1)
    player:setCharVar('BuffLvl', player:getMainLvl())
    player:setCharVar('BuffJob', player:getMainJob())

    if player:hasStatusEffect(xi.effect.DEDICATION) then
        return
    else
        player:addStatusEffect(xi.effect.DEDICATION, { power= expPower, origin = player, subPower = -1}) -- max 30000 or server crash
    end

    player:addStatusEffect(xi.effect.REGAIN, { power = regainPower, duration = 0, origin = player})
    player:addStatusEffect(xi.effect.REFRESH, {power = refreshPower, duration = 0, origin = player})
    player:addStatusEffect(xi.effect.REGEN, {power = regenPower, duration = 0, origin = player})

    for _, mod in pairs(buffs) do
        player:addMod(mod[1], mod[2])
    end
end

local buffOff = function(player)
    local power        = 50
    local regainPower  = 25
    local refreshPower = 10
    local regenPower   = 10
    local expPower     = 500
    local buffs =
        {
            { xi.mod.RACC, power },
            { xi.mod.RACC, power },
            { xi.mod.RATT, power },
            { xi.mod.ACC, power },
            { xi.mod.ATT, power },
            { xi.mod.MATT, power },
            { xi.mod.MACC, power },
            { xi.mod.RDEF, power },
            { xi.mod.DEF, power },
            { xi.mod.MDEF, power },
        }

    local jobNameByNum = {}
        for k, v in pairs(xi.job) do
            jobNameByNum[v] = k
        end

   if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 10 then
       power        = 35
       regainPower  = 25
       refreshPower = 10
       regenPower   = 10
       expPower     = 350
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 20 then
       power        = 25
       regainPower  = 15
       refreshPower = 7
       regenPower   = 7
       expPower     = 250
   elseif player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) == 30 then
       power        = 15
       regainPower  = 7
       refreshPower = 3
       regenPower   = 3
       expPower     = 100
   end

    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    -- Remove bonus effects..
    player:delStatusEffect(xi.effect.DEDICATION)
    player:delStatusEffect(xi.effect.REGAIN)
    player:delStatusEffect(xi.effect.REFRESH)
    player:delStatusEffect(xi.effect.REGEN)

    for _, mod in pairs(buffs) do
        player:delMod(mod[1], mod[2])
    end
end

local buffOnCap = function(player)
    player:addStatusEffect(xi.effect.COMMITMENT, { power = 200, origin = player, subPower = -1})
    player:setCharVar('BuffLvl', player:getMainLvl())
    player:setCharVar('BuffJob', player:getMainJob())
    player:setCharVar('Buff', 2)
end

local buffOffCap = function(player)
    player:setCharVar('Buff', 0)
    player:setCharVar('BuffLvl', 0)
    player:setCharVar('BuffJob', 0)
    player:delStatusEffect(xi.effect.COMMITMENT)
end

commandObj.onTrigger = function(player)
    local state = player:getCharVar('Buff')

    local jobNameByNum = {}
        for k, v in pairs(xi.job) do
            jobNameByNum[v] = k
        end

    if player:getCharVar('[ParagonQuest]'..jobNameByNum[player:getMainJob()]) > 30 then
        player:printToPlayer('You cannot use the option while under the Paragon Challenge Tier 4 and 5.')
        return
    end

    if player:hasStatusEffect(xi.effect.BATTLEFIELD) then
        player:printToPlayer('You cannot use or have !buff in battlefields.')
        return
    end

            if state == 0 and -- add only commitment for lvl 99 
               player:getMainLvl() == 99 then
                if player:hasStatusEffect(xi.effect.COMMITMENT) then
                   return
                   else
                   buffOnCap(player)
                   player:printToPlayer('Buff enabled.')
                end
            elseif state == 0 and -- add dedication and buffs for below 99
                   player:getMainLvl() <= 98 then
                   buffOn(player)
                   player:printToPlayer('Buff enabled.')
            elseif state == 1 then -- remove buff from below 99
                   buffOff(player)
                   player:printToPlayer('Buff disabled.')
            elseif state == 2 then -- remove buff from 99
                   buffOffCap(player)
                   player:printToPlayer('Buff disabled.')
    end
end

return commandObj