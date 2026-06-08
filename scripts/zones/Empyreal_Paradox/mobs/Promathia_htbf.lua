-----------------------------------
-- Area: Empyreal Paradox
--  Mob: Promathia
-- Note: Phase 1
-----------------------------------
local ID = zones[xi.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
end

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

    mob:addStatusEffect (xi.effect.REGEN, { power = 25, duration = 0, origin = mob, tick = 3 })
    mob:addMod(xi.mod.REGAIN, 75)
    mob:addMod(xi.mod.UFASTCAST, 50)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 15)

end

entity.onMobFight = function(mob, target)
    if mob:getAnimationSub() == 3 and not mob:hasStatusEffect(xi.effect.STUN) then
        mob:setAnimationSub(0)
        mob:stun(1500)
    end

end

entity.onSpellPrecast = function(mob, spell)
    if spell:getID() == 219 then
        spell:setMPCost(1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
