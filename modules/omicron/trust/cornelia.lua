-----------------------------------
require("modules/module_utils")
require("scripts/globals/trust")
-----------------------------------
local m = Module:new("cornelia")

local trustToReplaceName = "kuyin_hathdenna"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(3119)
    trust:renameEntity("Cornelia")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addStatusEffectEx(xi.effect.GEO_HASTE, xi.effect.GEO_HASTE, 16, 3, 0, xi.effect.GEO_HASTE, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addStatusEffectEx(xi.effect.GEO_ACCURACY_BOOST, xi.effect.GEO_ACCURACY_BOOST, 16, 3, 0, xi.effect.GEO_ACCURACY_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addStatusEffectEx(xi.effect.GEO_MAGIC_ACC_BOOST, xi.effect.GEO_MAGIC_ACC_BOOST, 16, 3, 0, xi.effect.GEO_MAGIC_ACC_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    

    trust:SetAutoAttackEnabled(false)
    trust:setUnkillable(true)

    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Cornelia, at your service.", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Remember: never give up!", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
     local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The opposite of boredom is not pleasure, but excitement. People will gladly seek out any kind of excitement, even pain.", 4, "Cornelia") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m
