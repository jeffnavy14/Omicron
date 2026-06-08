-----------------------------------
-- Area: Sealions Den
--   NM: Ultima
-----------------------------------
local entity = {}

local abilities = { 1259, 1260, 1269, 1270 }

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.EXP_BONUS, -100)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.SIGHT_RANGE, 10)
    mob:setMobMod(xi.mobMod.SOUND_RANGE, 10)

end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.SKILL_LIST, 728)
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
end

entity.onMobWeaponSkillPrepare = function(mob, target)
    local stage = mob:getLocalVar('stage')
    if stage == 0 then
        local checker = math.random()
        if checker < 0.50 then
            return abilities[1]
        elseif checker < 0.75 then
            return abilities[3]
        else
            return abilities[4]
        end
    elseif stage == 3 then
        -- does a specific order of moves in final phase
        local order = mob:getLocalVar('order')

        if order == 0 then
            mob:setLocalVar('order', 1)
            return abilities[4]
        elseif order == 1 then
            mob:setLocalVar('order', 2)
            return abilities[2]
        else
            mob:setLocalVar('order', 0)
            return abilities[2]
        end
    end
end

entity.onMobWeaponSkill = function(target, mob, skill)
    -- After using Nuclear Waste use a random elemental conal attack
    if skill:getID() == 1268 then
        mob:timer(4000, function(mobArg)
            local ability = math.random(1262, 1267)
            mob:useMobAbility(ability)
        end)
    end
end

entity.onMobFight = function(mob, target)
    local stage = mob:getLocalVar('stage')
    local hpp = mob:getHPP()
    if stage == 0 and hpp < 70 then
        mob:setLocalVar('stage', 1)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 1190)
    elseif stage == 1 and hpp < 40 then
        mob:setLocalVar('stage', 2)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 1191)
    elseif stage == 2 and hpp < 20 then
        mob:setLocalVar('stage', 3)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 1192)
        mob:setMod(xi.mod.REGAIN, 100)
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.PARALYZE, { duration = 60 })
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
