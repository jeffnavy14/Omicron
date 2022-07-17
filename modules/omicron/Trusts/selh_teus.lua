-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/weaponskillids")
require("scripts/globals/zone")
-----------------------------------
local m = Module:new("selh_teus")

local trustToReplaceName = "selh_teus"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())
    trust:setModelId(3094)
    trust:renameEntity("Selh'teus")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, xi.effect.ONE_FOR_ALL, ai.r.JA, ai.s.SPECIFIC, xi.ja.ONE_FOR_ALL)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.ODYLLIC_SUBTERFUGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.ODYLLIC_SUBTERFUGE)
    trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 8, 3, 0, xi.effect.GEO_MAGIC_DEF_BOOST, 15, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 10, ai.r.JA, ai.s.SPECIFIC, xi.ja.ELEMENTAL_SFORZO)
	

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

      local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power*5)
	trust:addMod(xi.mod.ACC, power*9)
      trust:addMod(xi.mod.MATT, power*5)
      trust:addMod(xi.mod.MACC, power*9)
	trust:addMod(xi.mod.MDEF, power*9)
      trust:addMod(xi.mod.REGAIN, 20)


 trust:setLocalVar("MASTER_ID", trust:getMaster():getID())

end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("If you are prepared to fight, then I shall stand with you against the world's end.", 4, "Selh'teus") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Farewell, I will watch over your human world...your Vana'diel...", 4, "Selh'teus") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The darkness...turns to void...", 4, "Selh'teus") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m