-----------------------------------
-- Paragon Global player buff
-----------------------------------
 require('scripts/utils/utils') -- file dir changed
-----------------------------------
xi = xi or {}
xi.paragon = xi.paragon or {}

local paragonJobs =
{
    WAR  = 11,
    MNK  = 12,
    WHM  = 13,
    BLM  = 14,
    RDM  = 15,
    THF  = 16,
    PLD  = 17,
    DRK  = 18,
    BST  = 19,
    BRD  = 20,
    RNG  = 21,
    SAM  = 22,
    NIN  = 23,
    DRG  = 24,
    SMN  = 25,
    BLU  = 26,
    COR  = 27,
    PUP  = 28,
    DNC  = 29,
    SCH  = 30,
    GEO  = 31,
    RUN  = 32,
}

local paragonTiers =
{
    10,
    20,
    30,
    40,
    50,
}

local paragonMods =
{
    [18] = { param = 18, mod =  xi.mod.STR,  power = 5}, -- 8
    [19] = { param = 19, mod =  xi.mod.DEX,  power = 5}, -- 9
    [20] = { param = 20, mod =  xi.mod.VIT,  power = 5}, -- 10
    [21] = { param = 21, mod =  xi.mod.AGI,  power = 5}, -- 11
    [22] = { param = 22, mod =  xi.mod.INT,  power = 5}, -- 12
    [23] = { param = 23, mod =  xi.mod.MND,  power = 5}, -- 13
    [24] = { param = 24, mod =  xi.mod.CHR,  power = 5}, -- 14
    [33] = { param = 33, mod =  xi.mod.ATT,  power = 5}, -- 23
    [34] = { param = 34, mod =  xi.mod.RATT, power = 5}, -- 24
    [35] = { param = 35, mod =  xi.mod.ACC,  power = 5}, -- 25
    [36] = { param = 36, mod =  xi.mod.RACC, power = 5}, -- 26
    [38] = { param = 38, mod =  xi.mod.MATT, power = 5}, -- 28
    [40] = { param = 40, mod =  xi.mod.MACC, power = 5}, -- 30
}



local function applyParagonEffectTier1(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
      if target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]) > 0 then
        local numbera = tostring(target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]))
        if tonumber(numbera) > 0 then
          local resulta = {}
            for i = 1, #numbera, 1 do
	            table.insert(resulta, tonumber(numbera:sub(i, i)))
            end
                paragonJoba = resulta[1].. resulta[2]
                paragonTiera = resulta[3].. resulta[4]
                paragonModa = resulta[5].. resulta[6]
                    if target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]) > 0 then
                       if target:getMainJob() == paragonJoba - 10 then
                          local paragonResulta = 0
                                paragonExModa = 0
                                paragonPowera = 0
                                    if paragonResulta == 0 then
                                       for k, v in pairs(paragonMods) do
                                           if tonumber(paragonModa) == v.param then
                                              paragonExModa   = v.mod
                                              paragonPowera   = v.power
                                              break
                                           end
                                       end
                                          target:setCharVar('[ParagonMod]Active',1)
                                          target:addMod(paragonExModa, paragonPowera)
                                          -- target:printToPlayer(string.format("%s %s %s",paragonJoba,paragonTiera,paragonModa ))
                                          -- target:printToPlayer(string.format("%s %s",paragonExModa,paragonPowera ))
                                    end
                       end
                    else return
          end
        end
      end
end
local function applyParagonEffectTier2(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
      if target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]) > 0 then
        local numberb = tostring(target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]))
        if tonumber(numberb) > 0 then
          local resultb = {}
            for i = 1, #numberb, 1 do
	            table.insert(resultb, tonumber(numberb:sub(i, i)))
            end
                paragonJobb = resultb[1].. resultb[2]
                paragonTierb = resultb[3].. resultb[4]
                paragonModb = resultb[5].. resultb[6]
                    if target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]) > 0 then
                       if target:getMainJob() == paragonJobb - 10 then
                          local paragonResultb = 0
                                paragonExModb = 0
                                paragonPowerb = 0
                                    if paragonResultb == 0 then
                                       for k, v in pairs(paragonMods) do
                                           if tonumber(paragonModb) == v.param then
                                              paragonExModb   = v.mod
                                              paragonPowerb   = v.power
                                              break
                                           end
                                       end
                                          target:addMod(paragonExModb, paragonPowerb)
                                          -- target:printToPlayer(string.format("%s %s %s",paragonJobb,paragonTierb,paragonModb ))
                                          -- target:printToPlayer(string.format("%s %s",paragonExModb,paragonPowerb ))
                                    end
                       end
                    else return
          end
        end
      end
end
local function applyParagonEffectTier3(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
      if target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]) > 0 then
        local numberc = tostring(target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]))
        if tonumber(numberc) > 0 then
          local resultc = {}
            for i = 1, #numberc, 1 do
	            table.insert(resultc, tonumber(numberc:sub(i, i)))
            end
                paragonJobc = resultc[1].. resultc[2]
                paragonTierc = resultc[3].. resultc[4]
                paragonModc = resultc[5].. resultc[6]
                    if target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]) > 0 then
                       if target:getMainJob() == paragonJobc - 10 then
                          local paragonResultc = 0
                                paragonExModc = 0
                                paragonPowerc = 0
                                    if paragonResultc == 0 then
                                       for k, v in pairs(paragonMods) do
                                           if tonumber(paragonModc) == v.param then
                                              paragonExModc   = v.mod
                                              paragonPowerc   = v.power
                                              break
                                           end
                                       end
                                          target:addMod(paragonExModc, paragonPowerc)
                                          -- target:printToPlayer(string.format("%s %s %s",paragonJobc,paragonTierc,paragonModc ))
                                          -- target:printToPlayer(string.format("%s %s",paragonExModc,paragonPowerc ))
                                    end
                       end
                    else return
          end
        end
      end
end
local function applyParagonEffectTier4(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
      if target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]) > 0 then
        local numberd = tostring(target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]))
        if tonumber(numberd) > 0 then
          local resultd = {}
            for i = 1, #numberd, 1 do
	            table.insert(resultd, tonumber(numberd:sub(i, i)))
            end
                paragonJobd = resultd[1].. resultd[2]
                paragonTierd = resultd[3].. resultd[4]
                paragonModd = resultd[5].. resultd[6]
                    if target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]) > 0 then
                       if target:getMainJob() == paragonJobd - 10 then
                          local paragonResultd = 0
                                paragonExModd = 0
                                paragonPowerd = 0
                                    if paragonResultd == 0 then
                                       for k, v in pairs(paragonMods) do
                                           if tonumber(paragonModd) == v.param then
                                              paragonExModd   = v.mod
                                              paragonPowerd   = v.power
                                              break
                                           end
                                       end
                                          target:addMod(paragonExModd, paragonPowerd)
                                          -- target:printToPlayer(string.format("%s %s %s",paragonJobd,paragonTierd,paragonModd ))
                                          -- target:printToPlayer(string.format("%s %s",paragonExModd,paragonPowerd ))
                                    end
                       end
                    else return
          end
        end
      end
end
local function applyParagonEffectTier5(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
      if target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]) > 0 then
        local numbere = tostring(target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]))
        if tonumber(numbere) > 0 then
          local resulte = {}
            for i = 1, #numbere, 1 do
	            table.insert(resulte, tonumber(numbere:sub(i, i)))
            end
                paragonJobe = resulte[1].. resulte[2]
                paragonTiere = resulte[3].. resulte[4]
                paragonMode = resulte[5].. resulte[6]
                    if target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]) > 0 then
                       if target:getMainJob() == paragonJobe - 10 then
                          local paragonResulte = 0
                                paragonExMode = 0
                                paragonPowere = 0
                                    if paragonResulte == 0 then
                                       for k, v in pairs(paragonMods) do
                                           if tonumber(paragonMode) == v.param then
                                              paragonExMode   = v.mod
                                              paragonPowere   = v.power
                                              break
                                           end
                                       end
                                          target:addMod(paragonExMode, paragonPowere)
                                          -- target:printToPlayer(string.format("%s %s %s",paragonJobe,paragonTiere,paragonMode ))
                                          -- target:printToPlayer(string.format("%s %s",paragonExMode,paragonPowere ))
                                    end
                       end
                    else return
          end
        end
      end
end
local function delParagonEffectTier5(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
    if paragonExMode ~= nil then
     if target:getCharVar('[ParagonModTier5]'..jobNameByNum[target:getMainJob()]) > 0 then
        target:delMod(paragonExMode,paragonPowere)
     end
    end
   -- target:printToPlayer(string.format("remove %s %s ",paragonExMode,paragonPowere))
end
local function delParagonEffectTier4(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
   -- target:printToPlayer(string.format("remove %s %s ",paragonExMode,paragonPowere))
    if paragonExModd ~= nil then
     if target:getCharVar('[ParagonModTier4]'..jobNameByNum[target:getMainJob()]) > 0 then
        target:delMod(paragonExModd,paragonPowerd)
     end
    end
end
local function delParagonEffectTier3(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
   -- target:printToPlayer(string.format("remove %s %s ",paragonExModd,paragonPowerd))
    if paragonExModc ~= nil then
     if target:getCharVar('[ParagonModTier3]'..jobNameByNum[target:getMainJob()]) > 0 then
        target:delMod(paragonExModc,paragonPowerc)
     end
    end
end
local function delParagonEffectTier2(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
    if paragonExModb ~= nil then
     if target:getCharVar('[ParagonModTier2]'..jobNameByNum[target:getMainJob()]) > 0 then
        target:delMod(paragonExModb,paragonPowerb)
     end
    end
   -- target:printToPlayer(string.format("remove %s %s ",paragonExModb,paragonPowerb))
end
local function delParagonEffectTier1(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
    if paragonExModa ~= nil then
     if target:getCharVar('[ParagonModTier1]'..jobNameByNum[target:getMainJob()]) > 0 then
        target:delMod(paragonExModa,paragonPowera)
     end
    end
   -- target:printToPlayer(string.format("remove %s %s ",paragonExModa,paragonPowera))
end

xi.paragon.onEffectGain = function(target, effect)
    applyParagonEffectTier1(target)
    applyParagonEffectTier2(target)
    applyParagonEffectTier3(target)
    applyParagonEffectTier4(target)
    applyParagonEffectTier5(target)
    effect:setIcon(xi.effect.NONE)
end


-- player:addStatusEffectEx(xi.effect.PARAGON, xi.effect.PARAGON, 10, 3, 0) -- no time limit
-- check master
-- player:getSpentJobPoints() == 2100 

xi.paragon.onEffectTick = function(target, effect)
end

xi.paragon.onEffectLose = function(target, effect)
    local jobNameByNum = {}
      for k, v in pairs(xi.job) do
          jobNameByNum[v] = k
      end
    if target:getCharVar('[ParagonMod]Active') == 1 then
        delParagonEffectTier1(target)
        delParagonEffectTier2(target)
        delParagonEffectTier3(target)
        delParagonEffectTier4(target)
        delParagonEffectTier5(target)
        target:setCharVar('[ParagonMod]Active',0)
        target:timer(250, function(targetArg)
        targetArg:addStatusEffectEx(xi.effect.PARAGON, xi.effect.PARAGON, 10, 3, 0)
                if not target:isInMogHouse() then
                   targetArg:setPos(targetArg:getXPos(), targetArg:getYPos(), targetArg:getZPos(), targetArg:getRotPos(), targetArg:getZoneID())
                end
        end)
    elseif target:getCharVar('[ParagonMod]Active') == 2 then
        delParagonEffectTier1(target)
        delParagonEffectTier2(target)
        delParagonEffectTier3(target)
        delParagonEffectTier4(target)
        delParagonEffectTier5(target)
                if not target:isInMogHouse() then
                   targetArg:setPos(targetArg:getXPos(), targetArg:getYPos(), targetArg:getZPos(), targetArg:getRotPos(), targetArg:getZoneID())
                end
    else
        target:setCharVar('[ParagonMod]Active',0)
        target:timer(250, function(targetArg)
        targetArg:addStatusEffectEx(xi.effect.PARAGON, xi.effect.PARAGON, 10, 3, 0)
                if not target:isInMogHouse() then
                   targetArg:setPos(targetArg:getXPos(), targetArg:getYPos(), targetArg:getZPos(), targetArg:getRotPos(), targetArg:getZoneID())
                end
        end)
    end
end
