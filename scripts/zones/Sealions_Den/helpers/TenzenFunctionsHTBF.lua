local ID = zones[xi.zone.SEALIONS_DEN]

local tenzenFunctions = {}

tenzenFunctions.firstMeikyo = function(mob)
    mob:setAnimationSub(0)
    mob:useMobAbility(730) -- meikyo_shisui
    mob:setLocalVar('meikyo', 1)
    mob:setLocalVar('step', 1)
    mob:setLocalVar('twohourtrigger', 1) -- prevent tenzen from using second meikyo while first one is active
    mob:setLocalVar('twohourthreshold', math.random(45, 55)) -- set next meikyo hpp threshold
end

tenzenFunctions.secondMeikyo = function(mob)
    mob:setAnimationSub(0)
    mob:useMobAbility(730) -- meikyo_shisui
    mob:setLocalVar('meikyo', 1)
    mob:setLocalVar('step', 1)
    mob:setLocalVar('twohourtrigger', 3)
    mob:setLocalVar('twohourthreshold', math.random(5, 25)) -- set next meikyo hpp threshold
end

tenzenFunctions.thirdMeikyo = function(mob)
    mob:setAnimationSub(0)
    mob:useMobAbility(730) -- meikyo_shisui
    mob:setLocalVar('meikyo', 1)
    mob:setLocalVar('step', 1)
    mob:setLocalVar('twohourtrigger', 5)
end

tenzenFunctions.wsSequence = function(mob)
    local step = mob:getLocalVar('step')
    local meikyo = mob:getLocalVar('meikyo')
        local twohourtrigger   = mob:getLocalVar('twohourtrigger')
    if
        step == 1 and
        meikyo == 1
    then
        mob:setTP(0)
        mob:setMod(xi.mod.DELAY, 0)
        mob:setAnimationSub(0)
        mob:setMobSkillAttack(0)
        mob:setMobAbilityEnabled(false) -- we don't want tenzen to randomly use WS during this phase
        mob:setAutoAttackEnabled(false) -- no autoattacks while skillchaining
        mob:useMobAbility(1394) -- Hanaikusa
        mob:setLocalVar('step', 2)
    elseif step == 2 then
        mob:timer(250, function(mobArg)
            mobArg:useMobAbility(1390) -- Torimai
            mobArg:setLocalVar('step', 3)
        end)
    elseif step == 3 then
        mob:timer(250, function(mobArg)
            mobArg:useMobAbility(1391) -- Kazakiri
            mobArg:setLocalVar('step', 4)
        end)
    elseif step == 4 then
        mob:timer(250, function(mobArg)
            mobArg:useMobAbility(1395) -- Tsukikage
            mobArg:setLocalVar('step', 5)
        end)
    elseif step == 5 then
        mob:timer(250, function(mobArg)
            mobArg:useMobAbility(1399) -- Cosmic Elucidation
            mobArg:setLocalVar('step', 6)
        end)
    end
    if twohourtrigger == 1 then
       mob:setLocalVar('twohourtrigger', 2)
    elseif twohourtrigger == 3 then
       mob:setLocalVar('twohourtrigger', 4)
    end
end

tenzenFunctions.formSwap = function(mob)
    local changeTime = mob:getLocalVar('changeTime')
    local battleTime = mob:getBattleTime()

    if mob:getLocalVar('meikyo') == 0 then
        if
            mob:getAnimationSub() == 0 and
            battleTime - changeTime > 60
        then
            mob:setAnimationSub(5) -- 5 lowered bow mode (1033 animation) 6 is raised bow mode (1034 animation)
            mob:setBehavior(bit.bor(mob:getBehavior(), xi.behavior.STANDBACK))
            mob:setMobSkillAttack(1171)
            mob:setLocalVar('changeTime', mob:getBattleTime())

            if mob:getAnimationSub() == 5 then -- need to sheath his great katana before pulling out bow
                mob:timer(1000, function(mobArg)
                    mobArg:setMod(xi.mod.DELAY, 2400) -- attacks more frequently while bow is drawn
                    mobArg:setAnimationSub(6)
                end)
            end
        elseif
            mob:getAnimationSub() == 6 and
            battleTime - changeTime > 30
        then
            mob:setAnimationSub(0)
            mob:setBehavior(bit.band(mob:getBehavior(), bit.bnot(xi.behavior.STANDBACK)))
            mob:setMobSkillAttack(0)
            mob:setMod(xi.mod.DELAY, 0) -- attack slower back to great katana
            mob:setLocalVar('changeTime', mob:getBattleTime())
        end
    end
end

return tenzenFunctions
