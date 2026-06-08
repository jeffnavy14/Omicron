-----------------------------------
-- Area: Sealion's Den
--  Mob: Tenzen
-----------------------------------
local ID = zones[xi.zone.SEALIONS_DEN]
local tenzenFunctions = require('scripts/zones/Sealions_Den/helpers/TenzenFunctionsHTBF')
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
        mob:addMod(xi.mod.STR, 100) 
        mob:addMod(xi.mod.VIT, 100) 
        mob:addMod(xi.mod.INT, 100) 
        mob:addMod(xi.mod.MND, 100) 
        mob:addMod(xi.mod.CHR, 100) 
        mob:addMod(xi.mod.AGI, 100) 
        mob:addMod(xi.mod.DEX, 100) 
        mob:addMod(xi.mod.DEF, 100) 
        mob:addMod(xi.mod.RATT, 250) 
        mob:addMod(xi.mod.ACC, 375) 
        mob:addMod(xi.mod.ATT, 275) 
        mob:addMod(xi.mod.MATT, 250)
        mob:addMod(xi.mod.MACC, 250) 
        mob:addMod(xi.mod.MEVA, 200) 
        mob:addMod(xi.mod.MDEF, 200)
        mob:setMod(xi.mod.EVA, 100)
        mob:setMod(xi.mod.EARTH_SDT, 100)
        mob:setMod(xi.mod.DARK_SDT, 100)
        mob:setMod(xi.mod.LIGHT_SDT, 100)
        mob:setMod(xi.mod.ICE_SDT, 100)
        mob:setMod(xi.mod.FIRE_SDT, 100)
        mob:setMod(xi.mod.WATER_SDT, 100)
        mob:setMod(xi.mod.THUNDER_SDT, 100)
        mob:setMod(xi.mod.WIND_SDT, 100)
        mob:setMod(xi.mod.SILENCERES, 100) 
        mob:setMod(xi.mod.STUNRES, 50) 
        mob:setMod(xi.mod.BINDRES, 50) 
        mob:setMod(xi.mod.GRAVITYRES, 50) 
        mob:setMod(xi.mod.SLEEPRES, 50) 
        mob:setMod(xi.mod.POISONRES, 50) 
        mob:setMod(xi.mod.PARALYZERES, 50) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 50)
        mob:addStatusEffect(xi.effect.REGEN,  { power = 25, tick = 3, duration = 0, origin = mob})
        mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, tick = 3, duration = 0, origin = mob})

    -- Tenzen in Warriors Path is a completely scripted encounter once you trigger certain states
    -- Leaving mods here as visuals
    mob:setAnimationSub(0)
    mob:setMobSkillAttack(0)
    mob:setMobAbilityEnabled(true)
    mob:setAutoAttackEnabled(true)
    mob:setLocalVar('skillchain', math.random(1, 100)) -- set chance that Tenzen will use Cosmic Elucidation
    mob:setLocalVar('twohourthreshold', math.random(75, 80)) -- set HP threshold for Meikyo Shisui usage
end

entity.onMobEngage = function(mob, target)
    mob:showText(mob, ID.text.TENZEN_MSG_OFFSET + 1)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    -- three tarus fight with tenzen
    local mobId  = mob:getID()
    local offset = mobId - ID.mob.TENZEN_HTBF

    if
        offset >= 0 and
        offset <= 8
    then
        for i = mobId + 1, mobId + 3 do
            GetMobByID(i):updateEnmity(target)
        end
    end
end

entity.onMobFight = function(mob, target)
    -- Uses Meikyo Shisui around 75-80% Hanaikusa > Torimai > Kazakiri > Tsukikage > Cosmic Elucidation
    local twohourtrigger   = mob:getLocalVar('twohourtrigger')
    local twohourthreshold = mob:getLocalVar('twohourthreshold')

    if
        mob:getHPP() < twohourthreshold and
        twohourtrigger == 0
    then -- first meikyo shisui usage 75-85%
        mob:setTP(0)
        tenzenFunctions.firstMeikyo(mob)
    elseif
        mob:getHPP() < twohourthreshold and
        twohourtrigger == 2
    then -- second meikyo shisui usage 45-55%
        mob:setTP(0)
        tenzenFunctions.secondMeikyo(mob)
    elseif
        mob:getHPP() < twohourthreshold and
        twohourtrigger == 4
    then -- third meikyo shisui usage 10-25%
        mob:setTP(0)
        tenzenFunctions.thirdMeikyo(mob)
    end

    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == xi.action.MOBABILITY_START or
        act == xi.action.MOBABILITY_USING or
        act == xi.action.MOBABILITY_FINISH
    then
        isBusy = true -- is set to true if Tenzen is in any stage of using a mobskill
    end

    -- scripted sequence of weaponskills in order to potentially create the level 4 skillchain cosmic elucidation
    if
        mob:actionQueueEmpty() and
        not isBusy
    then
        tenzenFunctions.wsSequence(mob)
    end

    if mob:getLocalVar('step') == 6 then
            mob:setAnimationSub(0)
            mob:setMobSkillAttack(0)
            mob:setMobAbilityEnabled(true)
            mob:setAutoAttackEnabled(true)
            mob:setLocalVar('step', 7)
    end

end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
