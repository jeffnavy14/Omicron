-----------------------------------
-- Area: Morimar_Basalt_Fields
-- NM: Achuka
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.STUN)
    mob:addImmunity(xi.immunity.TERROR)
    mob:setMobSkillAttack(50007)
end

entity.onMobSpawn = function(mob)
    mob:addMod(xi.mod.REGAIN, 100)
    mob:addMod(xi.mod.ATT, 1848)
    mob:addMod(xi.mod.ACC, 1842)
    mob:addMod(xi.mod.DEF, 1660)
    mob:addMod(xi.mod.EVA, 600)
    mob:addMod(xi.mod.MATT, 1836)
    mob:addMod(xi.mod.MACC, 1842)
    mob:addMod(xi.mod.HASTE_GEAR, 3000)
    mob:addMod(xi.mod.HASTE_MAGIC, 2500)
    mob:addMod(xi.mod.MEVA, 1000)
    mob:addMod(xi.mod.MDEF, 1000)
end

entity.onMobEngage = function(mob)

end

entity.onMobFight = function(mob, target)

end

entity.onMobMobskillChoose = function(mob, target, skillId)

end

entity.onMobWeaponSkill = function(target, mob, skill)
    local skillId = skill:getID()
    local preventRepeat = mob:getLocalVar("PreventRepeatEffect")

    if skillId == 3020 then -- blistering roar
        if preventRepeat == 1 then
            return
        end

        for _, effect in ipairs({ xi.effect.DEFENSE_DOWN, xi.effect.BURN }) do
            mob:addStatusEffect(effect, { power = 25, origin = mob, subType = effect, subPower = 50, tier = xi.auraTarget.ENEMIES, flag = xi.effectFlag.AURA })
        end

        mob:addMod(xi.mod.WIND_ABSORB, 100)
        mob:setMobMod(xi.mobMod.AUTO_SPIKES, 1)
        mob:addStatusEffect(xi.effect.BLAZE_SPIKES, { power = 50, origin = mob })
        mob:getStatusEffect(xi.effect.BLAZE_SPIKES):setEffectFlags(xi.effectFlag.DEATH)
        mob:setLocalVar("PreventRepeatEffect", 1)
    end
end

entity.onWeaponskillHit = function(mob, attacker, weaponskill)
    if attacker and
        attacker:isBehind(mob) then
        if weaponskill == xi.weaponskill.TACHI_YUKIKAZE then
            mob:delStatusEffect(xi.effect.BLAZE_SPIKES)
            mob:delStatusEffect(xi.effect.DEFENSE_DOWN)
            mob:delStatusEffect(xi.effect.BURN)
            mob:setLocalVar("PreventRepeatEffect", 0)
        end
    end
end

entity.onMobDisengage = function(mob)
    mob:timer(30000, function(mobArg)
        mobArg:setHP(mobArg:getMaxHP())

        if  mobArg:getLocalVar("PreventRepeatEffect") == 1 then
            mobArg:setLocalVar("PreventRepeatEffect", 0)
            mobArg:delStatusEffect(xi.effect.BLAZE_SPIKES)
            mobArg:delStatusEffect(xi.effect.DEFENSE_DOWN)
            mobArg:delStatusEffect(xi.effect.BURN)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:addTitle(xi.title.ACHUKA_GLACIATOR)
    end
end

return entity