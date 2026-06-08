-----------------------------------
-- Area: Empyreal Paradox
--  Mob: Promathia
-- Note: Phase 2
-----------------------------------
local ID = zones[xi.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)

end

entity.onMobSpawn = function(mob)
    local battlefield = mob:getBattlefield()
    if not battlefield then
        return
    end

    if GetMobByID(ID.mob.PROMATHIA_HTBF + (battlefield:getArea() - 1) * 2):isDead() then
        battlefield:setLocalVar('phaseChange', 0)
    end

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
    mob:addStatusEffect (xi.effect.REGEN, { power = 25, duration = 0, origin = mob, tick = 3 })
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.UFASTCAST, 50)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 15)
end

entity.onMobEngage = function(mob, target)
    
end

entity.onMobFight = function(mob, target)
    if mob:getAnimationSub() == 3 and not mob:hasStatusEffect(xi.effect.STUN) then
        mob:setAnimationSub(0)
        mob:stun(1500)
    elseif
        mob:getAnimationSub() == 2 and
        not mob:hasStatusEffect(xi.effect.MAGIC_SHIELD)
    then
        mob:setAnimationSub(0)
    elseif
        mob:getAnimationSub() == 1 and
        not mob:hasStatusEffect(xi.effect.PHYSICAL_SHIELD)
    then
        mob:setAnimationSub(0)
    end

end

entity.onMobWeaponSkill = function(target, mob, skill)
    local skillId = skill:getID()

    if skillId == 1504 then -- Wheel of Impregnability (physical)
        mob:setAnimationSub(1)
        mob:timer(30000, function(m)
            m:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
            m:setAnimationSub(0)
        end)
    elseif skillId == 1505 then -- Bastion of Twilight (magic)
        mob:setAnimationSub(2)
        mob:timer(30000, function(m)
            m:delStatusEffect(xi.effect.MAGIC_SHIELD)
            m:setAnimationSub(0)
        end)
    end
end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(xi.magic.aoe.RADIAL)
        --spell:setFlag(xi.magic.spellFlag.HIT_ALL) -- no longer exists
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    elseif spell:getID() == 219 then
        spell:setMPCost(1)
    end
end

entity.onMagicCastingCheck = function(mob, target, spell)
    if math.random(1, 100) <= 25 then
        return 219
    else
        return 218
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
