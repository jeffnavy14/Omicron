-----------------------------------
-- Area: Boneyard_Gully
--  Mob: Shikaree Z's Wyvern
-----------------------------------
---@type TMobEntity
local entity = {}

-- Status removal breath table (mimics player wyvern behavior)
local removeBreathTable =
{
    [xi.effect.PARALYSIS] = xi.mobSkill.REMOVE_PARALYSIS,
    [xi.effect.BLINDNESS] = xi.mobSkill.REMOVE_BLINDNESS,
    [xi.effect.POISON   ] = xi.mobSkill.REMOVE_POISON,
}

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.SILENCE)
    mob:addImmunity(xi.immunity.PETRIFY)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
    --50% fast cast, no standback
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.REGAIN, 70)

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

    -- Resistances
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

    -- Regen/Regain
    mob:addStatusEffect(xi.effect.REGEN,  { power = 25, duration = 0, origin = mob, tick = 3 })
    mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, duration = 0, origin = mob, tick = 3 })
end

entity.onMobMobskillChoose = function(mob, target, skillId)
    local battlefield = mob:getBattlefield()
    if not battlefield then
        return 0
    end

    local breathRange   = 14
    local healThreshold = 90 -- Use healing breath when ally is below 90% HP

    -- First priority: Check for status effects to remove
    local allies        = battlefield:getMobs(true, true)
    for _, ally in pairs(allies) do
        if ally:isAlive() then
            local distance = mob:checkDistance(ally)
            if distance <= breathRange then
                for effect, ability in pairs(removeBreathTable) do
                    if ally:hasStatusEffect(effect) then
                        mob:setLocalVar('healTargetID', ally:getID())
                        return ability
                    end
                end
            end
        end
    end

    -- Second priority: Healing breath for low HP allies (including self)
    local lowestAlly = 0
    local lowestHPP  = 100

    for _, ally in pairs(allies) do
        if ally:isAlive() then
            local distance = mob:checkDistance(ally)
            if distance <= breathRange then
                local hpp = ally:getHPP()
                if hpp <= healThreshold and hpp < lowestHPP then
                    lowestAlly = ally:getID()
                    lowestHPP = hpp
                end
            end
        end
    end

    if lowestAlly > 0 then
        mob:setLocalVar('healTargetID', lowestAlly)
        return xi.mobSkill.HEALING_BREATH_III
    end

    -- No support needed, use random offensive breath
    mob:setLocalVar('healTargetID', 0)
    local tpSkills =
    {
        xi.mobSkill.PET_FLAME_BREATH,
        xi.mobSkill.PET_FROST_BREATH,
        xi.mobSkill.PET_GUST_BREATH,
        xi.mobSkill.PET_SAND_BREATH,
        xi.mobSkill.PET_LIGHTNING_BREATH,
        xi.mobSkill.PET_HYDRO_BREATH,
    }

    return tpSkills[math.random(1, #tpSkills)]
end

entity.onMobSkillTarget = function(target, mob, skill)
    -- Redirect supportive breaths to the appropriate ally
    local healTargetID = mob:getLocalVar('healTargetID')
    local skillID = skill:getID()

    -- Check if this is a supportive breath (healing or status removal)
    local supportiveBreaths =
    {
        xi.mobSkill.HEALING_BREATH_III,
        xi.mobSkill.REMOVE_PARALYSIS,
        xi.mobSkill.REMOVE_BLINDNESS,
        xi.mobSkill.REMOVE_POISON,
    }

    for _, supportiveSkill in pairs(supportiveBreaths) do
        if skillID == supportiveSkill and healTargetID > 0 then
            local healTarget = GetMobByID(healTargetID)
            if healTarget and healTarget:isAlive() then
                return healTarget
            end
        end
    end

    return target
end

return entity
