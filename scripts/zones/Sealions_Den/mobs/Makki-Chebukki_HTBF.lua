-----------------------------------
-- Area: Sealion's Den
--  Mob: Makki-Chebukki
-----------------------------------
mixins = { require('scripts/mixins/warriors_path_taru_HTBF') }
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
        mob:addMod(xi.mod.STR, 50) 
        mob:addMod(xi.mod.VIT, 50) 
        mob:addMod(xi.mod.INT, 50) 
        mob:addMod(xi.mod.MND, 50) 
        mob:addMod(xi.mod.CHR, 50) 
        mob:addMod(xi.mod.AGI, 50) 
        mob:addMod(xi.mod.DEX, 50) 
        mob:addMod(xi.mod.DEF, 50) 
        mob:addMod(xi.mod.RATT, 150) 
        mob:addMod(xi.mod.ACC, 275) 
        mob:addMod(xi.mod.ATT, 175) 
        mob:addMod(xi.mod.MATT, 50)
        mob:addMod(xi.mod.MACC, 50) 
        mob:addMod(xi.mod.MEVA, 100) 
        mob:addMod(xi.mod.MDEF, 100)
        mob:setMod(xi.mod.EVA, 50)
        mob:setMod(xi.mod.EARTH_SDT, 50)
        mob:setMod(xi.mod.DARK_SDT, 50)
        mob:setMod(xi.mod.LIGHT_SDT, 50)
        mob:setMod(xi.mod.ICE_SDT, 50)
        mob:setMod(xi.mod.FIRE_SDT, 50)
        mob:setMod(xi.mod.WATER_SDT, 50)
        mob:setMod(xi.mod.THUNDER_SDT, 50)
        mob:setMod(xi.mod.WIND_SDT, 50)
        mob:setMod(xi.mod.SILENCERES, 50) 
        mob:setMod(xi.mod.STUNRES, 10) 
        mob:setMod(xi.mod.BINDRES, 50) 
        mob:setMod(xi.mod.GRAVITYRES, 50) 
        mob:setMod(xi.mod.SLEEPRES, 50) 
        mob:setMod(xi.mod.POISONRES, 50) 
        mob:setMod(xi.mod.PARALYZERES, 50) 
        mob:setMod(xi.mod.LULLABYRES, 0) 
        mob:setMod(xi.mod.FASTCAST, 50)
        mob:addStatusEffect(xi.effect.REGEN,  { power = 25, tick = 3, duration = 0, origin = mob})
        mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, tick = 3, duration = 0, origin = mob})
    mob:setMobMod(xi.mobMod.SPECIAL_COOL, 30) -- Makki Chebukki uses ranged attack every 30 seconds
    mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
    mob:setMobMod(xi.mobMod.NO_LINK, 1)
    mob:addMod(xi.mod.UDMGPHYS, -100)
    mob:addMod(xi.mod.UDMGMAGIC, -100)
    mob:addMod(xi.mod.UDMGRANGE, -100)
    mob:addMod(xi.mod.UDMGBREATH, -100)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
    mob:setLocalVar('makki', 1)
end

entity.onMobEngage = function(mob, target)
    mob:entityAnimationPacket('ouen') -- each taru will use this animation at the start of the fight
    mob:setMobMod(xi.mobMod.NO_LINK, 0)
    mob:setMobMod(xi.mobMod.NO_AGGRO, 0)
    mob:setAnimationSub(1)
end

entity.onMobFight = function(mob, target)
--[[
    local battlefield = mob:getBattlefield()
    local battletime = mob:getBattleTime()
    local changetime = mob:getLocalVar('changetime')
    if battlefield:getLocalVar('fireworks') == 1 then
        if battletime - changetime >= 3 then
            mob:setMagicCastingEnabled(false)
            mob:entityAnimationPacket('ffr2')
            mob:setAnimationSub(2)
            mob:setLocalVar('changetime', mob:getBattleTime())
        end
    end
    ]]--
end

entity.onMobDisengage = function(mob)
    mob:setAnimationSub(2) -- laughing pose
end

return entity
