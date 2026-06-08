xi.customutil = xi.customutil or {}

xi.customutil.hasEnmity = function(player)
    local party = player:getAlliance()
    for _, partyMember in pairs(party) do
         if partyMember:hasEnmity() then
            local a, b = partyMember:hasEnmity(), true
                     if a==b then
                        return true
                     end
                        end
                        return false
         end
end

xi.customutil.resetJobAbility = function(player)
        local resetJAList =
        {
            [xi.job.WAR] =
                {
                  16,31,32,33,34,35,149,150,226,252,267,323
                },
            [xi.job.MNK] =
                {
                  17,36,37,38,39,40,82,151,152,227,253,269,324
                },
            [xi.job.WHM] =
                {
                  18,74,153,154,245,246,270,271,325
                },
            [xi.job.BLM] =
                {
                  19,75,254,272,273,326,388
                },
            [xi.job.RDM] =
                {
                  20,83,247,274,275,327
                },
            [xi.job.THF] =
                {
                  21,41,42,43,44,45,76,84,155,156,228,236,276,321,328
                },
            [xi.job.PLD] =
                {
                  22,46,47,48,79,92,157,158,255,277,278,329,394
                },
            [xi.job.DRK] =
                {
                  23,49,50,51,77,159,160,256,279,280,330,389
                },
            [xi.job.BST] =
                {
                  24,52,53,54,78,85,161,162,331,387
                },
            [xi.job.BRD] =
                {
                  25,163,164,229,283,229,283,284,332
                },
            [xi.job.RNG] =
                {
                  26,56,57,58,59,60,86,165,166,224,257,285,286,333
                },
            [xi.job.SAM] =
                {
                  27,62,63,64,167,168,173,174,230,258,287,288,320,334
                },
            [xi.job.NIN] =
                {
                  28,171,248,249,259,291,335
                },
            [xi.job.DRG] =
                {
                  29,61,65,66,67,68,80,87,169,170,260,292,293,295,318,319,336,393
                },
            [xi.job.SMN] =
                {
                  30,88,89,90,91,172,232,250,296,337,385
                },
            [xi.job.BLU] =
                {
                  93,94,95,175,176,297,298,338
                },
            [xi.job.COR] =
                {
                  96,97,123,124,133,177,178,301,339,392
                },
            [xi.job.PUP] =
                {
                  135,136,137,266,309,310,322,340
                },
            [xi.job.DNC] =
                {
                  181,182,183,198,199,200,213,239,261,263,341,384
                },
            [xi.job.SCH] =
                {
                  210,211,212,214,223,233,265,342
                },
            [xi.job.GEO] =
                {
                  343,345,346,347,348,349,350,351,352,353,354,355,377,386
                },
            [xi.job.RUN] =
                {
                  356,357, 367,370,374,375,376,378,379,380,383
                },
        }
    local mjob = player and player:getMainJob()
    local sjob = player and player:getSubJob()

    if player and resetJAList then
        if mjob and resetJAList[mjob] then
            for i = 1, #resetJAList[mjob] do
                local abilityId = resetJAList[mjob][i]
                if abilityId then
                    local mAbility = GetAbility(abilityId)
                    if mAbility then
                        player:addRecast(xi.recast.ABILITY, mAbility:getRecastID(), mAbility:getRecast())
                    end
                end
            end
        end

        if sjob and resetJAList[sjob] then
            for i = 1, #resetJAList[sjob] do
                local abilityId = resetJAList[sjob][i]
                if abilityId then
                    local sAbility = GetAbility(abilityId)
                    if sAbility then
                        player:addRecast(xi.recast.ABILITY, sAbility:getRecastID(), sAbility:getRecast())
                    end
                end
            end
        end
    end
end

xi.customutil.levelAdjustmentMods = function(mob)
    if mob:getMainLvl() > 104 and mob:getMainLvl() <= 115 then
            mob:addMod(xi.mod.ATT, 500)
            mob:addMod(xi.mod.DEF, 50)
            mob:addMod(xi.mod.ACC, 250)
            mob:addMod(xi.mod.EVA, 75)
            mob:addMod(xi.mod.MATT, 20)
            mob:addMod(xi.mod.MDEF, 100)
            mob:addMod(xi.mod.MACC, 200)
            mob:addMod(xi.mod.MEVA, 100)
            mob:addMod(xi.mod.HASTE_MAGIC, 5)
    elseif mob:getMainLvl() > 116 and mob:getMainLvl() <= 119 then
            mob:addMod(xi.mod.ATT, 750)
            mob:addMod(xi.mod.DEF, 75)
            mob:addMod(xi.mod.ACC, 300)
            mob:addMod(xi.mod.EVA, 100)
            mob:addMod(xi.mod.MATT, 30)
            mob:addMod(xi.mod.MDEF, 125)
            mob:addMod(xi.mod.MACC, 300)
            mob:addMod(xi.mod.MEVA, 125)
            mob:addMod(xi.mod.HASTE_MAGIC, 7)
    elseif mob:getMainLvl() > 120 and mob:getMainLvl() <= 122 then
            mob:addMod(xi.mod.ATT, 900)
            mob:addMod(xi.mod.DEF, 100)
            mob:addMod(xi.mod.ACC, 400)
            mob:addMod(xi.mod.EVA, 125)
            mob:addMod(xi.mod.MATT, 40)
            mob:addMod(xi.mod.MDEF, 135)
            mob:addMod(xi.mod.MACC, 400)
            mob:addMod(xi.mod.MEVA, 140)
            mob:addMod(xi.mod.HASTE_MAGIC, 9)
            mob:addMod(xi.mod.REGEN, 20)
    elseif mob:getMainLvl() > 121 and mob:getMainLvl() <= 125 then
            mob:addMod(xi.mod.ATT, 1000)
            mob:addMod(xi.mod.DEF, 150)
            mob:addMod(xi.mod.ACC, 500)
            mob:addMod(xi.mod.EVA, 150)
            mob:addMod(xi.mod.MATT, 50)
            mob:addMod(xi.mod.MDEF, 150)
            mob:addMod(xi.mod.MACC, 500)
            mob:addMod(xi.mod.MEVA, 150)
            mob:addMod(xi.mod.HASTE_MAGIC, 10)
    elseif mob:getMainLvl() > 126 and mob:getMainLvl() <= 130 then
            mob:addMod(xi.mod.ATT, 1400)
            mob:addMod(xi.mod.DEF, 250)
            mob:addMod(xi.mod.ACC, 700)
            mob:addMod(xi.mod.EVA, 200)
            mob:addMod(xi.mod.MATT, 100)
            mob:addMod(xi.mod.MDEF, 250)
            mob:addMod(xi.mod.MACC, 700)
            mob:addMod(xi.mod.MEVA, 200)
            mob:addMod(xi.mod.HASTE_MAGIC, 15)
            mob:addMod(xi.mod.REGEN, 20)
            mob:addMod(xi.mod.REFRESH, 20)
    elseif mob:getMainLvl() > 131 and mob:getMainLvl() <= 135 then
            mob:addMod(xi.mod.ATT, 1800)
            mob:addMod(xi.mod.DEF, 350)
            mob:addMod(xi.mod.ACC, 900)
            mob:addMod(xi.mod.EVA, 250)
            mob:addMod(xi.mod.MATT, 150)
            mob:addMod(xi.mod.MDEF, 350)
            mob:addMod(xi.mod.MACC, 900)
            mob:addMod(xi.mod.MEVA, 250)
            mob:addMod(xi.mod.HASTE_MAGIC, 20)
            mob:addMod(xi.mod.REGEN, 30)
            mob:addMod(xi.mod.REFRESH, 30)
            mob:addMod(xi.mod.REGAIN, 20)
    end
end

function progressiveLevelUp(mob, target)
    for i = xi.mod.STR, xi.mod.CHR do
        local amt = math.floor(mob:getStat(i) * 1.25)
        mob:addMod(i, amt)
    end
    mob:printToArea(string.format('%s has Leveled Up', mob:getName()), xi.msg.channel.SYSTEM_3)
    mob:injectActionPacket(mob:getID(),4,5000,0,0,185,10,1)
    mob:addHP(mob:getHP() * .25)
    mob:setMP(mob:getMaxMP())
    mob:setTP(3000)
    mob:resetEnmity(target)
end
