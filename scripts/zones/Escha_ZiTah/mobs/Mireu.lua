local controller = require("scripts/globals/di_controller")
local jobSpecial = require("scripts/mixins/job_special")

local entity = {}

local function updateSpikes(mob)
    local hp = mob:getHPP()
    local hasManafont = mob:hasStatusEffect(xi.effect.MANAFONT)
    local hasChainspell = mob:hasStatusEffect(xi.effect.CHAINSPELL)
    local wingsUsed = mob:getLocalVar("wingsUsed") == 1

    local targetEffect = xi.effect.BLAZE_SPIKES
    if hasManafont or hasChainspell then
        targetEffect = xi.effect.DREAD_SPIKES
    elseif hp < 50 and wingsUsed then
        targetEffect = xi.effect.ICE_SPIKES
    end

    if not mob:hasStatusEffect(targetEffect) then
        mob:delStatusEffect(xi.effect.BLAZE_SPIKES)
        mob:delStatusEffect(xi.effect.ICE_SPIKES)
        mob:delStatusEffect(xi.effect.DREAD_SPIKES)
        mob:addStatusEffect(targetEffect, 50, 0, 0, 0, 0)
        mob:getStatusEffect(targetEffect):delEffectFlag(xi.effectFlag.DISPELABLE)
    end
end

-----------------------------------
-- Spawn
-----------------------------------
entity.onMobSpawn = function(mob)
    controller.onSpawn(mob)
    controller.applySpawnScaling(mob)
    mob:setLocalVar("hpScaled", 0)
    mob:setLocalVar("wingsUsed", 0)
    mob:setLocalVar("manafontUsed", 0)
    mob:setLocalVar("chainspellUsed", 0)
    mob:setLocalVar("statsBoosted", 0)
    updateSpikes(mob)

    -- Initialize job_special mixin
    jobSpecial(mob) -- Call the mixin function

    -- Configure specials for Mireu
    xi.mix.jobSpecial.config(mob, {
        between = 30, -- 30 seconds between using any specials
        chance = 100,
        delay = 2,
        specials = {
            {
                id = xi.jsa.MANAFONT,
                hpp = math.random(40, 45), -- Use Manafont below 45% HP
                cooldown = 7200,
            },
            {
                id = xi.jsa.CHAINSPELL,
                hpp = math.random(20, 25),  -- Use Chainspell below 25% HP
                cooldown = 7200,
            },
        },
    })
end

-----------------------------------
-- Engage
-----------------------------------
entity.onMobEngage = function(mob, target)

    if mob:getLocalVar("hpScaled") == 0 then
        controller.applyScaling(mob)
        mob:setLocalVar("hpScaled", 1)
    end

end

-----------------------------------
-- Combat
-----------------------------------
entity.onMobFight = function(mob, target)

    updateSpikes(mob)

    local hp = mob:getHPP()
    if hp < 50 and mob:getLocalVar("statsBoosted") == 0 then
        mob:addMod(xi.mod.ATT, 300)
        mob:addMod(xi.mod.MATT, 150)
        mob:addMod(xi.mod.ACC, 150)
        mob:addMod(xi.mod.MACC, 150)
        mob:addMod(xi.mod.REGAIN, 100)
        mob:setLocalVar("statsBoosted", 1)
    end
end


entity.onMobSpellChoose = function(mob, target, spellId)
    if mob:hasStatusEffect(xi.effect.CHAINSPELL) then
        return xi.magic.spell.METEOR
    end

    return spellId
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == 4224  then -- xi.mobSkill.WINGS_OF_VENGEANCE
        mob:setLocalVar("wingsUsed", 1)
    end
end

-----------------------------------
-- Death
-----------------------------------
entity.onMobDeath = function(mob, player, optParams)

    controller.onDeath(mob)

end

-----------------------------------
-- Despawn (escaped Mireu)
-----------------------------------
entity.onMobDespawn = function(mob)

end

return entity